---
type: source
title: "ds.database: Using a Relational Database Management System (RDBMS)"
source_file: "H9lARi3re9I_ds-database-using-a-relational-database-management-system-rdbms.md"
video_id: "H9lARi3re9I"
url: "https://www.youtube.com/watch?v=H9lARi3re9I"
lang: en
tags: ["ds-incubator", "databases", "r-packages"]
key_topics: ["databases", "rdbms", "dm", "dplyr", "dbi"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=H9lARi3re9I"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2022-09-27T00:00:00Z"
    usage_count: 335
usage_window: { from: "2022-09-27T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# ds.database: Using a Relational Database Management System (RDBMS)

## Summary

Closing chapter of a series on relational data, covering the common case where tables do not live as local CSVs but in a Relational Database Management System (RDBMS) such as MySQL or Postgres, typically on a remote server where computations can also happen and data need not fit in local memory. For demo simplicity the speaker uses a file-backed SQLite database (`database.sqlite`) that fits on the local machine while illustrating the same patterns.

Objectives shown are connecting to the RDBMS, copying a locally built data model into it, and then using the RDBMS through both dplyr and dm. After loading `DBI`, `RSQLite`, `dm`, `dplyr` and `here`, the connection is created with `DBI::dbConnect(RSQLite::SQLite(), dbname = here("database.sqlite"))`, with the note that the arguments to `dbConnect` are documented in the driver package (`RSQLite::SQLite`) rather than in DBI itself. Two small tables `companies` and `categories` (sharing `companies_id`) are assembled into a dm data model that stores primary-key and foreign-key metadata, and the model is copied to the remote with `dm::copy_dm_to()` using `temporary = FALSE` for permanent tables, then the connection is closed with `DBI::dbDisconnect()`.

Re-opening the same file as a connection, the speaker shows two consumption paths. With dplyr, `DBI::dbListTables()` lists `companies` and `categories`, each is accessed as a lazy table via `dplyr::tbl(con, "companies")`, collected, and joined with `dplyr::left_join()` on `companies_id`, which works but requires the user to know the join column. With dm, a small helper `companies_dm()` is defined that knows the connection, the two table names and the key relationships (`dm_add_pk(companies, companies_id)` and `dm_add_fk(categories, companies_id, companies)`), so printing the dm object shows the key metadata and `dm::dm_flatten_to_tbl(dm, categories)` produces the same joined spreadsheet without the caller remembering the join column. The `database.sqlite` file on disk is highlighted as the persistent RDBMS artefact.

## Key Concepts & Tools Taught

- **[databases]:** relational data stored in an RDBMS rather than local files, enabling server-side computation and work with data larger than memory.
- **[rdbms]:** Relational Database Management System, exemplified by MySQL, Postgres and for the demo SQLite, accessed via a connection object that carries metadata such as the database path.
- **[dm]:** R package for formally modeling relational data, storing tables plus primary-key and foreign-key declarations and providing helpers to copy and consume the model.
- **[dplyr]:** package for working with remote tables via `tbl` references and verbs like joins, with lazy evaluation until data is pulled into memory.
- **[dbi]:** low-level interface for database connections, providing `dbConnect`, `dbListTables` and `dbDisconnect` whose driver-specific arguments depend on the driver used.

## Code Snippets & Formulas

Spoken calls dictated live (mangled caption fragments normalized here):

```r
library(DBI)        # "the DVI package is always necessary to connect" — DVI ← DVI
library(RSQLite)    # "and the rsql light package ... that is called a driver" — rsql light ← rsql light
library(dm)         # "we need the DM package of course" — DM ← DM
library(dplyr)      # "how to use it also with DM and with the player" — player ← the player / dplyr
library(here)       # "finally I'm going to be using the here package simply because it's convenient" — here ← here

# Connection to file-backed SQLite RDBMS
# "the arguments that you need to pass to the function DB connect ... they depend on the driver which in this case is rql Lite ... you have to read the documentation of rsql light"
con <- DBI::dbConnect(RSQLite::SQLite(), dbname = here::here("database.sqlite"))  # "RSQLite::SQLite() ... needs this database name DB name argument so that is simply the path to the file" — dbConnect ← DBI connect / SQLite ← SQL light

# Local tables and dm model
companies <- tibble(companies_id = c(1,2), ...)  # "these the tables that I'm creating here are the ones that you already know ... the companies table"
categories <- tibble(companies_id = c(1,1,2), ...)  # "the categories table ... for each ID for each company"
dm_local <- dm(companies, categories)  # "how to create what's called a database model or data model so a DM with a DM package"

# Adding keys inside the helper (shown via helper body walkthrough)
# "I add the primary key for the table companies which is companies ID and I add also the foreign key for the categories table which is also Company ID pointing to companies"
companies_dm <- function(con) {
  dm::dm_from_con(con, table_names = c("companies", "categories")) %>%
    dm::dm_add_pk(companies, companies_id) %>%
    dm::dm_add_fk(categories, companies_id, companies)
}

# Copy dm to RDBMS
# "and the DM package makes it very easy with the function called ptm2 and so it default to creating temporary tables which means that you have to use temporary equals false"
dm::copy_dm_to(con, dm_local, temporary = FALSE)  # "so that's how you simply copy in one call and the data model from ... your computer to the database management system" — copy_dm_to ← ptm2

# Use with dplyr
DBI::dbListTables(con)  # "this function DB list tables tells you that okay we have the table categories and the table companies" — DB list tables ← DB list tables
companies_tbl <- dplyr::tbl(con, "companies")  # "you can get a table say companies from this connection with the TBL function" — TBL ← TBL
categories_tbl <- dplyr::tbl(con, "categories")
dplyr::left_join(companies_tbl, categories_tbl, by = "companies_id")  # "I could be using the player package here to join companies with categories by the column companies ID" — join ← join

# Use with dm
# "one nice thing is that you know once you have to find data model in such a formal way then you can use ... flattened table to create the same spreadsheet"
dm::dm_flatten_to_tbl(companies_dm(con), categories)  # "I can just use the function flattened table" — flattened table ← flattened table

# Close connection (best practice)
DBI::dbDisconnect(con)  # "when you're done you call the function DBI disconnect and that connection will no longer be available" — DBI disconnect ← DBI disconnect
```
