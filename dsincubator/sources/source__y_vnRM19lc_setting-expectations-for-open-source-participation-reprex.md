---
type: source
title: "Setting expectations for open source participation: reprex"
source_file: "_y_vnRM19lc_setting-expectations-for-open-source-participation-reprex.md"
video_id: "_y_vnRM19lc"
url: "https://www.youtube.com/watch?v=_y_vnRM19lc"
lang: en
tags: ["ds-incubator", "github-issues", "github", "cloud", "reprex"]
key_topics: ["open-source-contribution", "reprex", "minimal-portable-example", "datapasta-tribble", "github-issue-template"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=_y_vnRM19lc"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 8
    last_modified: "2020-06-23T00:00:00Z"
usage_window: { from: "2020-06-23T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# Setting expectations for open source participation: reprex

## Summary

The session teaches how to write a GitHub issue that a package maintainer can understand with minimal context, using the **reprex** workflow. Hosted in an RStudio Cloud project (Bitly link `bit.ly/<date>dsi` and shared Google Doc for questions), it uses a pretend development package `2degreesinvesting/demo` to surface bugs. After `devtools::install_github("2degreesinvesting/demo")`, the speaker demonstrates the trivial `add` function which is expected to sum its two arguments but returns 0 for `add(2,2)` — an obvious bug to report. A bad issue ("the add function doesn't have values properly please fix it") is contrasted with a good one that includes a reproducible example. With the **reprex** package installed, selecting the chunk between R-markdown fences and via Addins → `reprex selection` copies a self-contained R snippet to the clipboard (on Cloud a manual copy) that, when pasted into a new GitHub issue, renders styled code and console output in preview, runs in a fresh R session independent of the global environment, and lets a maintainer copy-paste to reproduce without prior CSVs. A second, more realistic example uses `calculate_average_production_by_groups(data, ...)` on an asset-level `ALD` demo dataset (power companies, technology, production). Passing an `ALD` without grouping averages the whole dataset; by sector or by technology averages those groups. Setting one `production` value to `NA` makes the sector average `NA`, surfacing whether the function should handle `NA`s (e.g., `na.rm = TRUE`). Instead of emailing a 3-gigabyte joined file, the speaker shows crafting a tiny 9-row, 3-column example via **datapasta**: draft in Excel/Sheets, copy, use the Addin `paste as tribble`, which generates an interpretable `tibble::tribble` snippet pasted into the console, then calling the function on that tiny `ld_demo` again and using `reprex` to post a portable chunk to the issue. The fix is then a test that expects `power` to be 100 instead of `NA`. Discussion emphasizes minimizing data to isolate the bug, needing time to think, and the need for `CONTRIBUTING.md` issue templates to standardize contributions across the org.

## Key Concepts & Tools Taught

- **open-source-contribution**: Writing a GitHub issue that conveys a bug or request with as little context as possible so any maintainer can reproduce it; demonstrated via a pretend `demo` package pretending to be any development package.
- **reprex**: R package and RStudio Addin workflow (Addins → **reprex** selection) that renders a highlighted chunk into a self-contained snippet with code + output, runnable in a fresh R session not reliant on global environment, pasted directly into the GitHub issue body.
- **minimal-portable-example**: Prefer a tiny, isolated data snippet that shows the problem (e.g., 9 rows, 3 columns with one `NA`) over a massive joined asset-level file that would require emailing CSVs and scheduling calls; smaller data makes debugging easier for everyone and often reveals the root cause.
- **datapasta-tribble**: Package that lets you copy an Excel/Sheets draft and via Addins → `paste as tribble` (caption “paste of scribble”) generate an R `tibble::tribble` representation you can paste into the console without loading a CSV, yielding an interpretable small table for the issue.
- **github-issue-template**: Organizational need for issue templates and `CONTRIBUTING.md` guidelines per repository specifying what an issue/feature request must contain, so users who missed the session can still contribute correctly and standards are discoverable.


## Code Snippets & Formulas

Caption-mangled forms with normalized R:

```r
# Install pretend development package directly from GitHub
# "the package that we're going to be playing with is this to degrees investing slash demo package on github" # 2degreesInvesting/demo
# "all we have to specify is two degrees investing so the organization name or owner name and the repo name"
devtools::install_github("2degreesinvesting/demo")  # "dev tools install option" # dev tools <- devtools
# "organization name or owner name and the repo name and if this repo is interprete Balazs in our package then we'll be able"

# Load and inspect
library(demo)
?add  # "pull up the documentation for the function app that's in this package" # app <- add, documentation shows it sums two arguments
add(2, 2)  # -> 0  # "if you give it you know two and two and let it go you might expect this should give you four and it gives you zero so obviously there's a bug"

# Bad vs good issue
# "you can do this don't do this this is useless ... the add function doesn't have values properly please fix it" # bad issue
# Good issue: reproducible example via reprex

library(reprex)  # "I've already installed the the Rex package in this our CTO cloud session what I want you to do is select this code chunk ... click on atoms and click on Rex selection" # Rex <- reprex, atoms <- Addins
# Select chunk + Addins -> reprex selection -> copies stylized R code with expectation and actual output to clipboard -> paste into new GitHub issue body -> preview

# More realistic function
?demo::calculate_average_production_by_groups  # "documentation for calculate average production by groups" # calculate average production by groups <- calculate_average_production_by_groups
# Signature: calculate_average_production_by_groups(data, ...) # ADA argument <- data, dog argument <- ... grouping vars
ALD_demo <- read_csv("ald_demo.csv")  # "I've already downloaded our GDI data ... load up a fakey acid level data set and have a look at it" # acid level <- asset level, LD demo <- ALD demo
head(ALD_demo)  # power companies and technology and production
calculate_average_production_by_groups(ALD_demo)  # average of whole data set
calculate_average_production_by_groups(ALD_demo, sector)  # by sector
calculate_average_production_by_groups(ALD_demo, sector, technology)  # per sector per technology

# NA handling bug
ALD_demo$production[1] <- NA
calculate_average_production_by_groups(ALD_demo, sector)  # power -> NA # "I just said some arbitrary value to na and now the output of this average production in in our sector is an na"

# Minimal portable example via datapasta
# "I can go on to excel nobody done this kind of draft this really tiny tiny Ald is that the only has like you know nine Andrews in it copy it directly and I'm gonna use this package that that CJ pointed me how to called data pasta" # Andrews <- rows, data pasta <- datapasta
# Excel draft -> Addins -> Data pasta -> paste as tribble -> generates:
ld_demo <- tibble::tribble(
  ~sector, ~technology, ~production,
  "power", "coal", 100,
  "power", "coal", NA
)  # "very quickly I have a you know are interpretable representation of that excel file without having to load it as a CSV"
calculate_average_production_by_groups(ld_demo, sector)  # still NA -> portable bug
# Then again: select chunk -> reprex selection -> paste into issue: "I expect the output for you know power to be 100 instead of na"
# "rather than have this massive data set to show that a bug ... you can just copy that again as I did before grep right oops record selection" # record selection <- reprex selection
```

