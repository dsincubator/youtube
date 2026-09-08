---
type: source
title: "R packages: Data"
source_file: "hRUvGna0uK0_r-packages-data.md"
video_id: "hRUvGna0uK0"
url: "https://www.youtube.com/watch?v=hRUvGna0uK0"
lang: en
tags: ["ds-incubator", "r-packages"]
key_topics: ["r-package-data", "data-folder-vs-data-raw", "usethis-workflow", "roxygen-documentation"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=hRUvGna0uK0"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 8
    last_modified: "2020-02-11T00:00:00Z"
usage_window: { from: "2020-02-11T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# R packages: Data

## Summary

This session covers external data in R packages, following the *R packages* book chapter on external data and linked to issue #24. It focuses on the main case: making datasets available to package users (other cases — internal data not exposed, or raw CSV/Excel state — are rarer and only noted). The demo runs in the data-science incubator RStudio Cloud workspace where devtools are available, and begins with a package check (`Build → Check`) to see baseline status (example warning for missing license fixed with `usethis::use_mit_license()`). The speaker warns against a naïve data approach — creating `data/` and dropping a CSV there to be read via `read_csv` and a path — because in a package the folder `data/` is special and `R CMD check` will warn about an undocumented dataset (`undocumented data set mini_mtcars`). Instead the correct workflow records where data comes from in `data-raw/`: using `usethis::use_data_raw()` which creates `data-raw/` and its template `dataset.R` (renamed to `mini_mtcars.R`, i.e., `data-raw/mini_mtcars.R`) and adds that folder to `.Rbuildignore` so checks ignore raw files. That script documents the source (the `datasets` package's `mtcars` accessed via `?mtcars`) and the preparation code, while development happens there but not facing users. The prepared object (`mini_mtcars` as first few rows of `mtcars`) is then exported by `usethis::use_data(mini_mtcars)` (caption “use data”), which recreates `data/` and saves `data/mini_mtcars.rda` compressed in R's .rda format. The package is loaded with `devtools::load_all()` (Ctrl+Shift+L), session restarted to verify the object is not in the global environment without the package, then available after `load_all`; installing via `Install → Restart` makes it available via `library(demo)` and `demo::mini_mtcars` without `load()`. Documentation is added in `R/` via `usethis::use_r("mini_mtcars")` creating `R/mini_mtcars.R` where roxygen comments (`#'`) provide a title and `@source` tag with `\[datasets\]` link brackets, built with `devtools::document()` and reinstall, viewable via `?mini_mtcars`. The talk notes that functions inside the package can call the internal dataset directly as `demo::mini_mtcars` or bare name within package code because it lives in the package namespace, and that a personal data-only package is a useful pattern for sharing large data without manual path handling.

## Key Concepts & Tools Taught

- **r-package-data**: Goal is to make datasets available to users of the package; other data types (internal for functions, raw CSV/Excel) live elsewhere and are only briefly distinguished.
- **data-folder-vs-data-raw**: Naive `data/mini_mtcars.csv` + `read_csv(path)` triggers check warnings and is wrong for packages; correct is to keep preparation scripts in `data-raw/` (ignored via `.Rbuildignore`) and exported compressed data in `data/*.rda` accessed without file paths.
- **usethis-workflow**: Helpers automate the steps: `usethis::use_mit_license()` → `usethis::use_data_raw()` (creates `data-raw/` and `data-raw/dataset.R` template) → edit/rename to `data-raw/mini_mtcars.R` documenting source → `usethis::use_data(mini_mtcars)` to save to `data/` → `devtools::load_all()` (Ctrl+Shift+L) for interactive use → `Install & Restart` for installed library use → `usethis::use_r("mini_mtcars")` for docs.
- **roxygen-documentation**: Document the exported dataset in `R/mini_mtcars.R` using roxygen (`#'`) with a title and `@source` tag (`[datasets]` square-bracket link to `mtcars`), then `devtools::document()` generates `man/mini_mtcars.Rd` viewable via `?mini_mtcars`; check warnings disappear when documentation exists.


## Code Snippets & Formulas

Mangled spoken forms with normalized R:

```r
# Checks and license
# Build tab -> Check # "go to the beetle tab and run a check and see you know what up won't you get so if something is broken"
devtools::check()  # warning about license -> fix:
usethis::use_mit_license()  # "could use use license say maybe MIT license and that should be good to go" # use license <- use_mit_license

# Naive wrong way (warns)
dir.create("data")  # "what it did it create this folder here so maybe in that folder then you want to put the data set that you just created so you could use you know the reader function right CSV to place you know a CSV file inside data" # reader function right CSV <- read_csv
write.csv(mtcars[1:5, ], "data/mini_mtcars.csv")
read.csv("data/mini_mtcars.csv")  # "try again you will ask your users to add to access the data from there with something like like green are real and the name of the path" # green are real mangled for get/read path
# After adding: R CMD check warns "file undocumented or shake old empty cars" # shake old <- ?

# Correct: data-raw
usethis::use_data_raw()  # "instead what I recommend is to use a function from the useless package use data row and that function ... not only adds the folder data row but also adds that folded to a file called build ignore" # useless <- usethis, use data row <- use_data_raw, build ignore <- .Rbuildignore
# Creates data-raw/dataset.R template -> rename to data-raw/mini_mtcars.R
# File contents:
# source is the data set empty cars ... there is a package in are called data sets and it contains the data empty car # empty cars <- mtcars, data sets <- datasets
# ?mtcars  # "if you want to know more about that data so you can do question mark Indy cars that is it's empty cars" # Indy cars <- mtcars
mini_mtcars <- mtcars[1:3, ]  # "my data set is called mini empty cars so change the name to that" # mini empty cars <- mini_mtcars

# Export to data/
usethis::use_data(mini_mtcars)  # "it's saving an object called empty cars inside the folder data and it's already compressing it in the you know are specific format RTF" # RTF <- rda, empty cars <- mini_mtcars
# -> data/mini_mtcars.rda

# Load and test
devtools::load_all()  # "loading the package by doing their tools don't all ... the previous I think" # flow oh they're every object ~ load_all, shortcut shift control L
mini_mtcars  # available after load_all
# Restart session -> mini_mtcars not found -> load_all -> available
install.packages("demo")  # via Install & Restart button
library(demo)  # "you can simply call library and the name your package and then the package itself should contain the object that you have just exported" 
demo::mini_mtcars  # explicit namespace access; inside package functions just use mini_mtcars without load/read

# Document
usethis::use_r("mini_mtcars")  # "you can use the function use our with the name of your data set to create an art file inside our folder" # use our <- use_r, art <- R/
# Edit R/mini_mtcars.R:
#' A copy of first few rows
#' @source \[datasets\]  # "where you would say from data sets if you use square brackets that will be transformed into a link"
devtools::document()  # "function the tools document" # tools document <- document
install.packages("demo")  # reinstall
?mini_mtcars  # help shows title/source/link
```

