---
type: source
title: "Testing: Basic structure and  basic workflow"
source_file: "yMPV9TPH3GI_testing-basic-structure-and-basic-workflow.md"
video_id: "yMPV9TPH3GI"
url: "https://www.youtube.com/watch?v=yMPV9TPH3GI"
lang: en
tags: ["ds-incubator", "testing", "workflow", "r-packages", "shiny"]
key_topics: ["testing-structure", "testthat", "load-file", "usethis-helpers", "devtools-workflow", "expectations"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=yMPV9TPH3GI"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 37
    last_modified: "2021-04-06T00:00:00Z"
usage_window: { from: "2021-04-06T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Testing: Basic structure and  basic workflow

## Summary

Second session of the testing series, focusing on the **three-level structure of tests** and the **basic workflow** for adding tests to a project whether it already is a package or starts as a plain RStudio Project. The presenter follows Hadley Wickham's Mastering Shiny testing chapter (described as his most up-to-date testing writing, better than the R Packages chapter) and recaps that the previous session covered theory; this one will be mechanical, with the next session using test-driven development to implement the function.

**Structure:** Tests are organized at three levels: **file** — one file in `tests/testthat/` maps to one file in `R/` (convention `R/load.R` ↔ `tests/testthat/test-load.R`; "there is a mapping between some code that lives in the folder are in a package and code that lives in a different folder that is called that is in the folder tests inside that is another folder called test that" ← `tests/testthat/`), **test** — a call to `testthat::test_that()` checking *one property* succinctly describable in a sentence, and **expectation** — the specific assertion inside a test comparing actual output to expected (e.g., "some functions return true then ... output should be exactly true"). The art is to assert expected behavior without depending on incidental details, otherwise brittle tests fail on irrelevant changes.

**Workflow demo with `load_file()`:** The function (copied from the book) is `load_file(file, path)` where `file` includes extension (`test.csv` / `emptycars.tsv`, caption "empty cars.csv or emptycars.tsv" ← `emptycars.csv`) and `path` is directory (caption "slash mauro slash home slash mauro that would be a path" ← path). It extracts the extension with string handling and uses `switch(extension, csv = vroom::vroom(..., delim=","), tsv = vroom::vroom(..., delim="	"), validate("Invalid file"))` — described as a nice alternative to nested `if` when branching on a string, where `validate` (Shiny-flavored `stop`, caption "Validate is a function that comes from shiny so this function base is similar to stop but ... clever in context of shiny applications" ← `validate`) throws the informative error for unsupported types, vs `vroom::vroom` similar to `readr::read_csv` (caption "function from the vroom package which is similar to function in read r called read underscore csv ... clever error" ← `vroom`).

Starting from a plain project `ds.testing` (only `.Rproj` + `.Rmd` + `.gitignore`), `usethis::use_r("load")` ("use this ... called use r so if I say use r and I give you the name load what this will do will create a file called load inside the r folder" ← `usethis::use_r`) creates `R/load.R` and the `R/` folder. Pasting Hadley's implementation completes the source. `usethis::use_test("load")` is context-aware: with `R/load.R` open it creates `tests/testthat/test-load.R` (caption "use lowercase actually use test ... i have opened the file load.r so use this is aware of context ... create a new file called test hyphen load" ← `usethis::use_test`). The generated file contains a toy passing test which is removed and replaced with the book's test: `test_that("load_file handles all input types", { create df, write to temp csv & tsv, expect_equal etc. })`. The first argument to `test_that` is intent description (property "load file handles all input types and the valid input types are csv and dsv and anything else should fail" ← `test_that` intent); second is `{...}` block needed for multi-line.

**Running tests & package plumbing:** Four ways are taught: (1) **line-by-line** in console, (2) **whole test** (run the chunk), (3) **whole test file** via `testthat::test_file()` (caption "function test underscore file which we usually do in keyboard shortcut" / `Ctrl+T` ← `test_file`), (4) **whole suite** via `devtools::test()` (caption "function test so that's ... run all the tests suite" ← `test`). Demo runs line-by-line data creation: `df <- data.frame(x=1,y=2); csv <- tempfile(fileext=".csv"); tsv <- tempfile(fileext=".tsv"); write.csv/read via csv/tsv` ("we are first starting with a data frame on r then creating empty files ... and then we are writing that data frame as a csv or ssc as a tsv inside that file" ← `tempfile`), then three expectations: `expect_equal(load_file("test.csv", dir), df)`, same for tsv, and `expect_error(load_file("test.txt", dir), "Invalid file")` (caption "expect error same thing some code goes in first argument and in case of respect error we match the error message that we expect ... comes from here" ← `expect_error`). The initial line-by-line attempt fails because "load file doesn't exist" — tests don't see the function until package infrastructure exists. Fix requires `devtools::load_all()` (caption "function from the devtool devtools package that is called load all that will make this the source code of the files in r available to tests ... should source every file in r folder" ← `load_all`, usually `Ctrl+Shift+L`), which needs a `DESCRIPTION` file, so `usethis::use_description()` creates it and then the `.Rproj` metadata (`ds.testing.Rproj`) must be reopened to expose the **Build** tab with `Load All`/`Test Package` buttons. After `load_all`, re-running expectations passes. Closing reminder: package convention makes `devtools::test` discover tests via the `tests/testthat` layout; outside a package you *can* call `testthat::test_file()` or expectations interactively but it's "trying to force a square peg in a round hole."

## Key Concepts & Tools Taught

- **[testing-structure / testing-structure]:** Three levels — file (`R/load.R` ↔ `tests/testthat/test-load.R`), test (`test_that` call checking one property: "test should generally check a single property ... if you can easily describe what that test is ... in one sentence then probably you are getting it quite right" ← quote), expectation (assertion like `expect_equal`).
- **[testthat / testthat]:** Package providing `test_that()`, `expect_equal()`, `expect_error()` (caption "test underscore that ... like this ... second component ... third component where you actually run what's called an expectation ... expects equals equal comes from the desktop package" ← `testthat`).
- **[load-file / load-file]:** Demo function `load_file(file, path)` extracting extension via `tools::file_ext` or similar then `switch(extension, csv = vroom::vroom(..., delim=","), tsv = vroom::vroom(..., delim="	"), validate(...))` (caption "extracting the extension from the name ... using function switch which is very nice alternative to if" ← `switch`).
- **[usethis-helpers / usethis-helpers]:** `usethis::use_r("load")` to create `R/load.R`, `usethis::use_test("load")` context-aware, `usethis::use_description()` for `DESCRIPTION` (captions as quoted above ← `usethis`).
- **[devtools-workflow / devtools-workflow]:** Making source available via `devtools::load_all()` (`Ctrl+Shift+L`), running suites via `devtools::test()`, and reopening package project to get Build tab.
- **[expectations / expectations]:** `expect_equal(load_file(...), df)` for valid csv/tsv and `expect_error(load_file("test.txt", ...), " Invalid file")` for invalid input; data creation via `tempfile()` pattern for code-based setup replacing Excel clicks.

## Code Snippets & Formulas

Caption-mangled, normalized:

```r
# Project setup (plain project → add infrastructure)
usethis::use_r("load")                    # "use r and I give you the name load ... will create a file called load inside the r folder" ← use_r
# R/load.R
load_file <- function(file, path){
  ext <- tools::file_ext(file)            # "extracting the extension from the name so if name of function is say test.csv is going to get that csv component" ← extension extraction
  switch(ext,
    csv = vroom::vroom(file.path(path, file), delim = ","),   # "using the function switch ... if it is csv then it's going to read the file using a function from the vroom package ... delim comma" ← switch, vroom
    tsv = vroom::vroom(file.path(path, file), delim = "	"),  # "if it is a tsv ... using delimiter tab" ← vroom delim
    validate("Invalid file: must be csv or tsv")               # "basically throw an informative error ... validate is a function that comes from shiny ... similar to stop" ← validate
  )
}
usethis::use_test("load")                # "use lowercase actually use test ... aware of the context ... create a new file called test hyphen load dot r inside the test directory" ← use_test
usethis::use_description()               # "function will create that one file description ... that defines this as another package" ← use_description
devtools::load_all()                     # "function from the devtool devtools package that is called load all that will make source code ... available to tests" ← load_all (Ctrl+Shift+L)

# Test file tests/testthat/test-load.R (from book)
library(testthat)
test_that("load_file handles all input types", {           # "first argument is just a description of ... property ... load file handles all input types and the valid input types are csv and dsv" ← test_that
  df <- data.frame(x = 1, y = 2)                           # "we are first starting with a data frame on r" ← data creation
  csv <- tempfile(fileext = ".csv"); tsv <- tempfile(fileext = ".tsv")  # "then creating empty files one to host a csv file and another one to host a tsv file" ← tempfile
  write.csv(df, csv, row.names = FALSE); write.table(df, tsv, sep="\t", row.names=FALSE)  # "then we are writing that data frame as a csv or ssc as a tsv inside that file" ← write
  expect_equal(load_file(basename(csv), dirname(csv)), df) # "first expectation is testing that ... running function load file with name test.csv and the path ... is equal to the data frame" ← expect_equal
  expect_equal(load_file(basename(tsv), dirname(tsv)), df)
  expect_error(load_file("test.txt", dirname(csv)), "Invalid file") # "other expectation that is quite important is expect error ... we match the error message" ← expect_error
})

# Running tests 4 ways
# line-by-line in console; whole test (run chunk); testthat::test_file("tests/testthat/test-load.R") # Ctrl+T ← test_file; devtools::test() ← test (whole suite)
```

