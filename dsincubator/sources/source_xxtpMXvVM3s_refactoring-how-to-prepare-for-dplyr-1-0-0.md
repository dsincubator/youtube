---
type: source
title: "Refactoring: How to prepare for dplyr 1.0.0"
source_file: "xxtpMXvVM3s_refactoring-how-to-prepare-for-dplyr-1-0-0.md"
video_id: "xxtpMXvVM3s"
url: "https://www.youtube.com/watch?v=xxtpMXvVM3s"
lang: en
tags: ["ds-incubator", "r-packages", "refactoring", "github-issues", "testing"]
key_topics: ["refactoring", "dplyr-1-0-0", "renv", "breaking-changes", "across", "testing-and-version-control"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=xxtpMXvVM3s"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 129
    last_modified: "2020-03-24T00:00:00Z"
usage_window: { from: "2020-03-24T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Refactoring: How to prepare for dplyr 1.0.0

## Summary

A practical refactoring lesson triggered by **dplyr 1.0.0**: minor-version bumps (`0.8.5` → `1.0.0`) signal breaking changes, so analysts who rely on `dplyr` must prepare. The meetup shows three pillars: (1) where to find breaking changes (`NEWS.md` section "Breaking changes" plus "New features"), (2) how to freeze a project's package environment with **renv**, including per-branch environments, and (3) how to refactor safely between the superseded `mutate_if()` style and the new `across()` style using disciplined, tested steps and version control.

**Finding changes & freezing:** The `NEWS.md` file is the canonical communication channel for each version. To protect ongoing work, `renv` (caption "RM which is a package that allows you to create a package library ... collection of packages with their specific versions that are specific for each project" ← `renv`) creates a project-specific library: `renv::init()` creates `renv/` (with `library/` per R version/platform like `Ubuntu`) and the lockfile `renv.lock` (caption "very important file called RM lock" ← `renv.lock`) which records for each package its version and source (`Cloud`/`CRAN`/`our project`). Switching branches can mean different `renv.lock` versions: demonstrated branch uses `dplyr 0.8.9.9000` (pre-1.0 dev) vs `0.8.5`; `renv::restore()` ("RM restore ... will restore all the packages ... as they as are described in this special file called our m dot block" ← `renv::restore`) upgrades `dplyr` as described, requiring a session restart (`Shift+Ctrl+F10` or `Ctrl+Shift+10`). This allows one project to keep `0.8.5` on `main` while experimenting with `1.0.0` on a separate branch without reinstalling system-wide.

**What refactoring is:** Quoting Martin Fowler's site/books (caption "refactoring dot-com website by martin fowler who is the author of a book called refactoring ... first edition like 20 years ago" ← refactoring catalog), refactoring is "a disciplined technique for restructuring an existing body of code altering its internal structure without changing its external behavior." If external behavior is tested (unit tests), refactored code should keep tests green. The catalog lists named refactorings (e.g., `rename variable` with graphical representation), reinforcing structured moves over ad-hoc edits.

**Demo of rename + dplyr migration:** The minimal safe rename example `x <- "something"; print(x); paste0(x, " else")` across two files shows the danger of deleting `x` outright (sourcing breaks: "object X is not defined") versus the safe sequence: copy `x -> y` (`y <- x`), replace call sites one-by-one (`print` → `print(y)`, `paste0` etc.), then remove `x` — "live code all the time" analogous to heart-transplant plumbing one vessel at a time. Many editors help with `Ctrl+Alt+R` (caption "press ctrl alt K ... every instance of Y ... highlighted" ← rename refactor), but conceptual safety matters.

The realistic migration centers on `mean_of_numeric_cols()`: a function that "takes a data frame and mutate it if the variable is numeric if it is it does the meaning on that variable removing missing values" using `dplyr::mutate_if(is.numeric, mean, na.rm=TRUE)`. This `mutate_if` approach is superseded as of 1.0.0 by `mutate(across(where(is.numeric), ~mean(.x, na.rm=TRUE)))` (caption "function we did if is now superseded by this new approach the approach of using just a function mutate with combined with a function across" ← `across`). Safe refactoring creates `mean_of_numeric_cols2()` with the new implementation, then migrates call sites one-by-one: search via `Shift+Ctrl+F` for `mean_of_numeric_cols(?!2)` (regex: "is not number two"), change a test file, run tests with `Shift+Ctrl+T` (`devtools::test()`), observe green; iterate through tests, documentation, examples, using `devtools::document()` (`Shift+Ctrl+D`) to refresh `NAMESPACE`/`man`. Tests for the function demonstrate patterns: `expect_is`, `expect_named`, `expect_known_value` (saves an `.rds` reference under `tests/testthat/`) and `expect_known_output` (saves printed output to text file) — "expect no value ... will store in your package somewhere ... RDS file" ← `expect_known_value`, "expect no output what it does is it prints the result ... to a text file" ← `expect_known_output`. Finally the old implementation is removed, aliased, and renamed back, with a concluding commit diff showing `mutate_if` → `mutate(across(...))` and encouragement to use version control checkpoints and pair-programming help hours.

## Key Concepts & Tools Taught

- **[refactoring / refactoring]:** Disciplined restructuring without changing external behavior; safe moves keep code alive, linked to Fowler's catalog (`rename variable` etc.).
- **[dplyr-1-0-0 / dplyr-1-0-0]:** `0.8.5` → `1.0.0` (dev `0.8.9.9000`) breaks code; `mutate_if()` superseded by `mutate(across(where(is.numeric), ...))`; previewed with `packageVersion("dplyr")`.
- **[renv / renv]:** Project-specific library via `renv::init()`, `renv/library/`, `renv.lock`; `renv::restore()` syncs installed packages to lockfile, branch-specific.
- **[breaking-changes / breaking-changes]:** Located in `NEWS.md` under "Breaking changes" (and "New features"); link provided.
- **[across / across]:** New idiom `across(where(is.numeric), ~mean(.x, na.rm=TRUE))` replacing `mutate_if(is.numeric, mean)`.
- **[testing-and-version-control / testing-and-version-control]:** Tests (`expect_is`, `expect_named`, `expect_known_value`, `expect_known_output`, `Shift+Ctrl+T`) as safety net; version control commits as recovery.

## Code Snippets & Formulas

Caption-mangled, normalized:

```r
# Locate breaking changes
# browse NEWS.md -> section "Breaking changes"  # "go to the new store MD file ... D section breaking changes" ← NEWS.md

# Freeze with renv
renv::init()                     # "RM : : it ... RM with lever erm and then just run the function in it" ← renv::init — creates renv/ + renv.lock
# renv.lock contains package version + source (Cloud/CRAN)  # "contains for each package ... specific version ... where you got it from for example it came from cloud" ← renv.lock
renv::restore()                  # "RM restore so our M will look into that file I will restore all the packages" ← renv::restore
packageVersion("dplyr")          # "package version of the player ... zero point eight point five ... zero point eight point nine nine which is ... what's gonna become the player one" ← packageVersion
# restart R: Shift+Ctrl+F10

# Refactoring catalog
# https://refactoring.com/catalog  # "refactoring dot-com website by martin fowler ... catalog ... filter just those that prefer to remain ... rename a variable" ← rename variable

# Safe rename demo
x <- "something"
print(x); paste0(x, " else")      # file1 + file2 use x
y <- x                            # "first step would be to copy variable X and assigned a new name for example Y" ← safe copy
# then one-by-one replace print(x) -> print(y) etc., then remove x
# RStudio rename: Ctrl+Alt+Shift ?  # "press ctrl alt K ... every instance of Y is highlighted" ← rename

# dplyr migration
mean_of_numeric_cols <- function(df){
  dplyr::mutate_if(df, is.numeric, mean, na.rm = TRUE)  # old 0.8.5  # "mutate it if the variable is numeric ... mutate if"
}
mean_of_numeric_cols2 <- function(df){
  dplyr::mutate(df, dplyr::across(where(is.numeric), ~mean(.x, na.rm = TRUE)))  # new 1.0  # "function mutate with combined with a function across" ← across
}
# test helpers
expect_is(mean_of_numeric_cols(df), "data.frame")
expect_named(mean_of_numeric_cols(df), c("x","y"))
expect_known_value(out, file = "ref-mean_of_numeric_cols.rds")   # "expect no value ... store a reference ... RDS file" ← expect_known_value
expect_known_output(out, file = "ref-mean_of_numeric_cols_output.txt")  # "expect no output ... prints the result ... to a text file" ← expect_known_output
# workflow
# Shift+Ctrl+F  search mean_of_numeric_cols(?!2) with regex
# Shift+Ctrl+T  devtools::test()  # "I press shift ctrl T and that runs every change"
# Shift+Ctrl+D  devtools::document()  # refresh NAMESPACE/man after removing export
```

