---
type: source
title: "Testing: Test driven development (TDD)"
source_file: "4AOKCiAh3NM_testing-test-driven-development-tdd.md"
video_id: "4AOKCiAh3NM"
url: "https://www.youtube.com/watch?v=4AOKCiAh3NM"
lang: en
tags: ["ds-incubator", "tdd", "testing", "refactoring", "r-packages"]
key_topics: ["test-driven-development", "expect-error", "expect-equal", "refactoring", "vroom"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=4AOKCiAh3NM"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 48
    last_modified: "2021-04-13T00:00:00Z"
usage_window: { from: "2021-04-13T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# Testing: Test driven development (TDD)

## Summary

Framed as a fast live demo in the style of "watching a tennis match," this session teaches test-driven development via the philosophy section of the Mastering Shiny testing chapter. The rule is: first write a failing test that states the desired property, then write the minimum code that makes it pass, then aggressively refactor under the safety net of the tests. The presenter emphasizes that the speed is for exposure—fluency comes only with practice—but the ordering itself is accessible and prevents gold-plating by only writing code demanded by a test.

The worked example builds a `load_file(file)` helper that should read CSV, read TSV, and error gracefully on unknown extensions. Scaffolding uses `usethis::use_test()` ("use test to create a test file with the name the name of the function that you want to develop") to create `tests/testthat/test-load_file.R` and `usethis::use_r()` ("use r ... knows about the active document so automatically can generate a file in r that will contain the code implementation"). Tests are run with `Ctrl+Shift+T` in RStudio. Iteration 1 writes `expect_error(load_file("blah"), "invalid file")` (caption "expect error text to arguments" / "invalid file" ← normalized `expect_error`) and satisfies it with `stop("invalid file")`. Iteration 2 creates a `tibble(x=1, y=2)` (caption "tivo" ← `tibble`), writes it to `tempfile(fileext=".csv")` with `vroom::vroom_write(..., delim=",")` (caption "room" ← `vroom`), reads via `readLines`, and asserts `expect_equal(out, original)` (caption "expect equal")—failing initially with "invalid file" and passing after branching on `tools::file_ext(file)` (caption "tools tools file extension" / "file xd" ← `tools::file_ext`) to `vroom(file, delim=",")`. The same is repeated for `.tsv` (`delim="\t"`), with an Arrange-Act-Assert layout, then refactored from `if/else` to `switch(ext, csv=",", tsv="\t", stop(...))` and extended to suppress readr spec messages via `col_types = list()` (caption "call types list") verified with `expect_message(..., NA)`.

## Key Concepts & Tools Taught

- **[test-driven-development]:** Red-green-refactor loop—write a failing test first stating one property, implement just enough code to pass, then refactor—applied here to a file-loader; presented as a thinking tool whose test order may vary with practice.
- **[expect-error]:** `testthat::expect_error(object, regexp)` (caption "expect error text to arguments argument one and argument two so in argument one you ... call the function that you want to test" + "bla so blah is something that should draw an error ... you should read something like invalid file" ← normalized `expect_error(load_file("blah"), "invalid file")`).
- **[expect-equal]:** `testthat::expect_equal(object, expected)` (caption "second of the two most important expectations in the tesla's package which is expect equal so expect equal takes the um ... an object that i want to two options i want to compare" / "tesla" ← `testthat` ← normalized `expect_equal(out, original)`).
- **[refactoring]:** Aggressive cleanup after green tests, exemplified by replacing sequential `if (ext == "csv") .. else if` with `switch(ext, csv="," , tsv="\t", stop(...))`, safe because the test suite catches regressions.
- **[vroom]:** Package for reading/writing delimited files (caption "function room" / "reading with vroom" ← normalized `vroom` / `vroom::vroom` / `vroom::vroom_write`) used with `delim=","` for CSV and `delim="\t"` for TSV, with explicit quieting of column-spec messages.

## Code Snippets & Formulas

Caption-mangled, normalized here (quote-to-name):

```r
library(testthat)      # "tesla" / "test that" — testthat (caption: "two most important expectations in tesla")
library(usethis)       # "with devtools and and function that comes in the tools with the package use this"
library(vroom)         # "function room" — vroom (caption: "there's many functions that you can use to save csv files including the function room")

use_test("load_file")  # "you do is you use the function use test to create a test file with the name ... load file — this opens a test file"
use_r()                # "i'm going to use use r which is another function to use this package ... use this use r and knows about the active document"

# Iteration 1 — error case
expect_error(load_file("blah"), "invalid file")  # caption: "expect error ... blah is something that should draw an error ... invalid file"
load_file <- function(file) { stop("invalid file") }  # "let's do stop uh in valid file so that is the first thing that my function does"

# Iteration 2 — CSV
df <- tibble::tibble(x = 1, y = 2)               # "tivo ... small data frame would be you know x equals 1 y equals 2" ← tibble/tivo
file <- tempfile(fileext = ".csv")               # "temporary file with the file extension file extension dot csv"
vroom::vroom_write(df, file, delim = ",")        # "save that ... function room ... data frame a file path ... has a delimiter that ... is going to be a comma"
readLines(file)                                  # "if i would like to inspect the file i can use three lines to with the argument file" ← readLines
out <- load_file(file)
expect_equal(out, df)                            # "expect equal takes the ... object that i want to two options i want to compare ... if the result of reading in that csv file should be the same as the original data frame"

# implementation
ext <- tools::file_ext(file)                     # "tools tools file extension so once you know you pass a path ... it will extract that extension" / "file xd"
if (identical(ext, "csv")) vroom::vroom(file, delim = ",") else stop("invalid file")

# Iteration 3 — TSV + AAA structure
# "i'm intentionally separating these in three blocks these are commonly called aaa so the first a is arranged ... second is act and third is assert"
# fileext ".tsv", delim "\t" (caption: "if i now read ... if i now do cut with red lines ... separated by tabs")

# Refactor to switch + default error
ext <- tools::file_ext(file)
switch(ext,
  csv = vroom::vroom(file, delim = ","),
  tsv = vroom::vroom(file, delim = "\t"),
  stop("invalid file")
)

# Suppress spec message
expect_message(load_file(file_csv), NA)          # "throws no message ... to say that there is no message you say that the message that you expect ... you say n a"
vroom::vroom(file, delim = ",", col_types = list())  # "suppress messages ... call types list that will ... remove the message" ← col_types = list()
Ctrl+Shift+T                                     # "i'm pressing shift ctrl t that's part of the workflow ... if i run my test again we shift ctrl t"
```
