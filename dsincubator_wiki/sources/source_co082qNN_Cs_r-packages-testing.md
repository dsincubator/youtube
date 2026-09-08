---
type: source
title: "R packages: Testing"
source_file: "co082qNN_Cs_r-packages-testing.md"
video_id: "co082qNN_Cs"
url: "https://www.youtube.com/watch?v=co082qNN_Cs"
lang: en
tags: ["ds-incubator", "testing", "r-packages", "workflow", "github-issues"]
key_topics: ["package-testing", "use-testthat", "devtools-test-workflow", "expect-equal", "expect-error", "assertion-packages"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=co082qNN_Cs"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 15
    last_modified: "2020-02-18T00:00:00Z"
usage_window: { from: "2020-02-18T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# R packages: Testing

## Summary

Continuing the R packages series, the session covers testing using the framework in *R Packages* Chapter 17 and the demo package `ds.demo` built in the previous week. The speaker traces the **[package-testing]** setup, the file layout, and the interactive workflow, and distinguishes between tests intended for package infrastructure and lightweight assertions usable in any script.

Setup begins with `usethis::use_testthat()` ("run the function use this use this tab"), which creates the `tests/` directory, the `testthat.R` runner file that attaches the package under test, and the `tests/testthat/` folder where every test lives. Adding a new exported function such as `max - mean` (spaced caption → `max-mean`; normalized to `max_minus_mean`/`max_mean` in this distillation) is done with `usethis::use_r("max-mean")`, and its companion test file is scaffolded with `usethis::use_test()` while that R file is active — `test-max-mean.R` ("test - and that is compulsory" prefix) is created automatically with a template placeholder. The on-disk structure (`tests/`, `tests/testthat/`, `test-*.R` files, each containing multiple `test_that()` calls each with multiple expectations) is presented as essential literacy for contributors.

The demo workflow is: edit code or tests, then run the full suite via the RStudio Build pane → Test Package or the shortcut Ctrl+Shift+T ("ctrl command shift and T runs the function dev tools test" → `devtools::test()`). The speaker loads the in-development package with `devtools::load_all()` via Shift+Ctrl+L ("dev tools though oh ... with shift control L"). Before extending code he runs `R CMD check`-style package checks ("click that pocket check") to know whether the baseline is green. Tests serve not only to catch bugs but as a safety net guaranteeing that adding a new feature does not break existing ones, and that any bug fix comes with a regression test: first write a test that exposes the bug, fix the code, and leave the test in place.

Concrete expectations are exercised on the toy `max - mean` function that returns `max(x) - min(x)`. The first meaningful tests confirm the happy path: `expect_equal(max-mean(2:1), 1)` and that reversing direction does not change the result, with a descriptive `test_that("max - me with simple good inputs for a turn expected output", ...)` title that signals failure location. Intentionally asserting the wrong value (`expect_equal(..., 2)`) is shown to fail with line-numbered output to illustrate failure diagnostics. Negative tests use `expect_error(max-mean(letters), "non numeric argument")` where `letters` (A–Z) triggers the base error `"non non numeric argument - binary operator"` ("non non numeric argument - binary operator" mangled caption; normalized message matched as regex `none.*argu`); the speaker notes regex matching and that a snippet of the message suffices. Edge cases probe `NA` handling: `max-mean(NA)` yields `NA` (so `expect_equal(..., NA)`), while `max-mean(c(1:2, NA))` surprisingly propagates `NA` instead of ignoring it. This motivates fixing the function to `na.rm = TRUE` in the `max`/`min` calls, rerunning tests, and iterating until green. The session closes noting that for non-package projects, sprinkling `assert` helpers (`assertr`, `assertthat`, `assertive` — "assertion packages like assert a third are or assert that or assertive") or even `testthat::expect_equal(1, 1)` directly in scripts provides immediate feedback before adopting full `testthat` infrastructure.

## Key Concepts & Tools Taught

- **[package-testing]:** The end-to-end testing concern for an R package — infrastructure location, naming conventions, and the write-code/write-test/run-tests loop.
- **[use-testthat]:** Scaffolding the `testthat` infrastructure with `usethis::use_testthat()` ("run the function use this use this tab" → `use_testthat`) — creates `tests/`, `tests/testthat.R`, and `tests/testthat/`.
- **[devtools-test-workflow]:** The interactive loop of editing code/tests and running the suite via the IDE Test Package button or Ctrl+Shift+T ("ctrl command shift and T runs the function dev tools test" → `devtools::test()`), and loading the package under development with Shift+Ctrl+L ("shift control L" → `devtools::load_all()`).
- **[expect-equal]:** `testthat::expect_equal()` for happy-path assertions such as `max-mean(2:1) == 1` and the diagnostic value of descriptive `test_that` titles.
- **[expect-error]:** `testthat::expect_error()` for negative/error-path tests, regex-matching against the thrown message (e.g., `"non non numeric argument - binary operator"`).
- **[assertion-packages]:** Lightweight alternatives for scripts outside packages — `assertr` / `assertthat` / `assertive` ("assert a third are or assert that or assertive") and direct `expect_*` sprinkling to validate inputs early, including checking each function argument.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```r
usethis::use_testthat()  # "run the function use this use this tab" — creates tests/, tests/testthat.R, tests/testthat/
usethis::use_r("max-mean")  # "function use R and then you write the name of the function you want to write ... max - mean"
usethis::use_test()  # "type use test and if you are in the active file ... test that will be clever enough" — creates tests/testthat/test-max-mean.R

# Template structure: tests/testthat/test-max-mean.R contains test_that() blocks
# "test - and that is compulsory" → file prefix test-
test_that("max - me with simple good inputs for a turn expected output", {
  expect_equal(max_mean(2:1), 1)          # "maximum of the sequence two to one is to the minimum is 1 so ... 2 minus 1 gives you 1"
  expect_equal(max_mean(1:2), 1)
  expect_equal(max_mean(2:1), 2)          # intentionally wrong → fails, shows title + line 3 + expected vs actual
})

# Workflow helpers
devtools::load_all()  # "dev tools though oh and I do that with shift control L"
devtools::test()      # "ctrl command shift and T runs the function dev tools test" — or Build → Test Package

# Negative / error test
expect_error(max_mean(letters), "non non numeric argument - binary operator")  # "letters is just a sequence of letters from A to Z" — triggers binary operator error
expect_error(max_mean(letters), "none.*argu")  # regex variant: "none than anything any number of times and then they were argued" → none.*argu

# Edge cases — NA handling
expect_equal(max_mean(NA), NA_real_)           # "missing value within ... I get an A" → NA
expect_equal(max_mean(c(1:2, NA)), 1)          # expects NA ignored; initially fails due to NA propagation, motivates na.rm = TRUE fix
# Fix preview:
max_mean <- function(x) max(x, na.rm = TRUE) - min(x, na.rm = TRUE)

# One-off assertions outside package infrastructure
assertr::assert()     # "assertion packages like assert a third are" → assertr
assertthat::assert_that()  # "or assert that" → assertthat
assertive::assert_is_numeric()  # "or assertive" → assertive
testthat::expect_equal(1, 1)  # "you can always use country from tested by calling just the library and you can say expect equal one to one"
```
