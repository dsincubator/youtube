---
type: source
title: "The flow of data and Get data directly form the database"
source_file: "DfVoYtCQlfU_the-flow-of-data-and-get-data-directly-form-the-database.md"
video_id: "DfVoYtCQlfU"
url: "https://www.youtube.com/watch?v=DfVoYtCQlfU"
lang: en
tags: ["ds-incubator", "databases", "dropbox", "r-packages", "pins"]
key_topics: ["data-workflow", "dropbox", "pins-board", "DBI-connection", "dplyr-lazy-query", "collect"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=DfVoYtCQlfU"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 24
    last_modified: "2020-04-28T00:00:00Z"
usage_window: { from: "2020-04-28T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# The flow of data and Get data directly form the database

## Summary

Two-part data meetup: Mauro frames the data-science workflow (borrowed from *R for Data Science* — import → tidy → transform/visualize/model → communicate, with data flowing between boxes) and places data at the center: every step reads inputs and writes outputs to memory, local disk, or remote storage, and choosing storage determines portability. Three systems are contrasted: Dropbox (local `~/Dropbox (2 Degrees Investing)` + remote sync + blue-lock indicating hard-coded local paths that break portability to CI/packages), the `rDrop2` Dropbox API (Jack's link, programmatic `drop_*` via `rdrop2`), and `pins` (configurable local cache — default `~/` but can be inside the project via `board_folder()` / `here` — plus remote boards like `board_github(owner, repo)`).

CJ's demo then teaches replacing hard-coded `Dropbox → subdirectory → readRDS/read.csv` (with `fs::path_home()` handling cross-platform `~/`, warnings without `col_types`) with a direct database path using `DBI` + `RPostgres` on the `datastore` Postgres server. He shows timing on the ~200 MB `security_financial_data` table: `readRDS` ~2.5 s, `read.csv` >5 s with type warnings, `collect()` on a lazy DB table ~6 s for full download (0.2 s for the initial `tbl()` recipe alone because it prints only first 10 rows via minimized query). Lazy `dplyr` on the `tbl` connection shines when only a subset is needed: `select()` a few columns → `collect()` in 1.5 s vs reading the full local file, and a full-package `get_and_clean_fin_data` workflow (import parameterized, then heavy `dplyr` chain) takes ~7 s via RDS, >6 s via CSV, ~4 s via DB recipe, ~6.9 s after forcing `collect()` — comparable but DB transfers only requested data. Advanced use shows building recipes: `fin_data %>% select(big_subgroup, coupon) -> lookup` that adds `selection` to the recipe, then `isns %>% left_join(lookup, copy = TRUE)` or `tbl(...) %>% select()` for targeted ISIN/company/coupon lookups still fast. Connection code is explained: `DBI::dbConnect(RPostgres::Postgres(), dbname = "dii", host = "...", user = ..., password = Sys.getenv("...") %||% askForPassword(), options = "-c search_path=data_2020q4")` to put the desired quarterly schema on the search path so `tbl(con, "security_financial_data")` works without schema prefix, plus `dbDisconnect(con)` to free the server. Q&A addresses incompleteness (not all data is in `datastore`, computed QA outputs still need local/pins/GitHub/ESOR storage, versioned schemas like `2019q4` selectable via `search_path`, but live updates mean old drops are overwritten unless snapshotted, and offline/internet-free use requires caching via `pins`/`memoise`; invite to comment on issue and possible hackathon).

## Key Concepts & Tools Taught

- **[data-workflow]:** R for Data Science workflow (import → tidy → transform ↔ visualize ↔ model → communicate) with data central — every arrow is an I/O, choices of in-memory (`global environment`) vs local vs remote storage determine portability/reproducibility.
- **[dropbox]:** Default local cache `~/Dropbox (2 Degrees Investing)` with remote sync; hard-coding `file.path(path_home("Dropbox ..."), subdir, file)` ties work to a local machine and breaks CI/packages; API alternative `rdrop2` (`drop_*`) for remote access without local dependency.
- **[pins-board]:** `pins` as alternative with configurable cache: `board_folder(path = here::here("data"))` for project-local portability vs default `~/`, remote `board_github()` (owner/repo) or `board_folder` on shared storage; decouples code from `Dropbox` location.
- **[DBI-connection]:** Direct Postgres connection via `DBI::dbConnect(RPostgres::Postgres(), dbname, host, user, password, options)`; password from `Sys.getenv()` fallback to `askForPassword()` prompt (environment variable session-scoped); `options = "-c search_path=data_2020q4"` exposes quarterly schema so `tbl()` needs no schema prefix; always `dbDisconnect()`.
- **[dplyr-lazy-query]:** `tbl(con, "security_financial_data")` creates a lazy recipe, not data; printing shows only first 10 rows by issuing a `LIMIT 10` query; `select()`/`filter()`/`left_join(copy=TRUE)` compose on the DB and only the minimal columns/rows are transferred until materialization.
- **[collect]:** `dplyr::collect()` forces full download of the lazy recipe; fair timing baseline vs eager `readRDS`/`read.csv`; showing `collect()` after `select()` or full `get_and_clean_fin_data(..., fin_data)` cleaning chain demonstrates DB can be faster when only subsets are needed.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```r
# --- Mauro intro ---
# R for Data Science workflow figure — import → tidy → transform/visualize/model → communicate
# Dropoff pitfalls:
fs::path_home("Dropbox (2 Degrees Investing)")  # "in this case I use the FS package to figure out what this means going to the users home Direction" — base file.path doesn't handle ~ across Windows/Unix
file.path(dropbox_path, project_path, "security_financial_data.rds")  # "determine what the path to our Dropbox is ... figure out this full subdirectory path"
# Alternatives:
# rdrop2 / rDrop2 — "link to the package i'll drop our drop to lock to drop our to drop package which is a programmatic interface to the robot API" [rdrop2]
pins::board_folder(path = here::here("data"))  # "with pins there is also a cache ... you can change it for example to make it with to make the cash in your project itself so that you can port your project"
pins::board_github(owner = "...", repo = "...")  # "remote option where you can set up a board for example kept board which is just not an organization and owner and repo" [board_github]

# --- CJ demo: eager local reads (for timing comparison) ---
readRDS(file.path(dropbox_path, subdir, "security_financial_data.rds"))  # "~2.5 s ... about 200 megabytes"
read.csv(file.path(dropbox_path, subdir, "security_financial_data.csv")) # ">5 s ... didn't specify the type column types ... warnings ... problematic"

# --- Lazy DB path ---
con <- DBI::dbConnect(
  RPostgres::Postgres(),
  dbname = "dii",
  host = "...",            # "the host which is its URL"
  user = "...",
  password = Sys.getenv("DB_PASSWORD", unset = NA) %||% askForPassword(),  # "storing the password and environment variable ... if it's not there I put this part ... it runs this function which will ask you for a password then set that as environment variable"
  options = "-c search_path=data_2020q4"  # "because the way we're set up the data is separated into these Quarterly's schemas and this option setting will add a specific data corner to your search path"
)
fin_data_db <- dplyr::tbl(con, "security_financial_data")  # "what it creates is an object that's sexual like a recipe for how to get this table it doesn't actually get the data — so when you create this table ... no data has been downloaded yet"
print(fin_data_db)          # "it only needs to know the first 10 lines it doesn't know the rest" — DB issues LIMIT 10, hence 0.2 s vs full
dplyr::collect(fin_data_db) # "will force this query to collect all of the data ... about six seconds ... pretty much on par with like loading in the full files"
fin_data_db %>% dplyr::select(col1, col2, col3) %>% dplyr::collect()  # "just selecting here the first four or five columns and then collected ... only one and a half seconds ... again once this collect happens it's actually only going to request those columns"
DBI::dbDisconnect(con)      # "once you when you do connect to these database you should always disconnect ... the server eventually would drop your connection but I don't know what the timeout is"

# --- Real workflow: parameterized cleaning function ---
source("get_and_clean_fin_data.R")
clean_fin_data <- function(fin_data) { ... dplyr::filter/select/join chain ... }  # "rather than having the importing of the data in this function I've made the data a parameter"
system.time(clean_fin_data(readRDS(...)))                # "that took about seven seconds"
system.time(clean_fin_data(read.csv(...)))               # "took a little more than six seconds"
system.time(fin_data_db %>% clean_fin_data() )           # "only took four seconds" — recipe, not yet collected
system.time(fin_data_db %>% clean_fin_data() %>% collect()) # "yeah 6.9 seconds so it's a little bit slower but it's pretty much on par"

# --- Advanced: recipes + joins for lookups ---
con <- connect_datastore()  # helper wrapping DBI::dbConnect above — "this function that I created connect data store that will connect us to the data store"
fin_data <- dplyr::tbl(con, "security_financial_data")
big_subgroup_lookup <- fin_data %>% dplyr::select(isin, big_subgroup)  # "we could take this fin data object which is the recipe ... we could add to it a selection ... and we save that ... these things are new recipes the recipe now includes not only how to connect ... but it also contains this selection"
dplyr::collect(big_subgroup_lookup)  # fast — only two columns
isns <- tibble::tibble(isin = sample(fin_data %>% pull(isin), 20))
isns %>% dplyr::left_join(big_subgroup_lookup, by = "isin", copy = TRUE) %>% collect()  # "if I wanted to join the big subgroup for these icings I could do this Ison's left join this big sucker this copy true is necessary"
# same via select on demand: fin_data %>% dplyr::select(coupon) etc.

# --- Versioning via search_path ---
# "if we wanted a connection to one of the previous versions then ... you can specify which email you're under ... data from this 2019 q4 is in a specific schema labeled that ... you put in this data quarter thing because you can specify which email you're under"
DBI::dbConnect(RPostgres::Postgres(), dbname = "dii", host = "...", options = "-c search_path=data_2019q4")

# --- Caching for offline / internet-free ---
# "there's are some potential workarounds ... by implementing these caching systems whether it's the pins function ... are using a memorized package to cache local copies" [pins / memoise]
```
