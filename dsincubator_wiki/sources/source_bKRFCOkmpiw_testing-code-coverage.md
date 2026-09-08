---
type: source
title: "Testing: Code coverage"
source_file: "bKRFCOkmpiw_testing-code-coverage.md"
video_id: "bKRFCOkmpiw"
url: "https://www.youtube.com/watch?v=bKRFCOkmpiw"
lang: en
tags: ["ds-incubator", "refactoring", "r-packages", "code-coverage", "testing"]
key_topics: ["code-coverage", "covr", "refactoring", "test-coverage"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=bKRFCOkmpiw"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 32
    last_modified: "2021-04-20T00:00:00Z"
usage_window: { from: "2021-04-20T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Testing: Code coverage

## Summary

Continuing the testing series after a test-driven development session, the speaker shows how code coverage guides safe refactoring of already-written code. The premise is that before touching a function such as `load_file()` you must ensure its behavior is covered by tests, otherwise refactoring can silently break it.

Coverage is explained as an analysis of which lines are exercised by the test suite. The supporting package is `covr` ("cover package" → covr in captions). The generic API is `covr::package_coverage()` and the report helper `covr::report()` ("cover report" / "cover call package coverage" → cover report / package_coverage), but the preferred interactive route is the RStudio command palette (Shift+Ctrl+P → "report test coverage for package or for file") or a custom keyboard shortcut assigned via Tools → Modify Keyboard Shortcuts (shortcut column for the Report action). In a package with only a function `load_file()`, the initial report shows 100% coverage; by temporarily degrading the test file the speaker drops coverage to 50% to illustrate uncovered (red) versus covered lines.

Two experiments make the risk concrete: inserting `stop("oh no")` into the CSV-reading line (e.g., line 5) still passes tests because that red line is not exercised, whereas breaking the TSV line (covered) causes the suite to fail. The workflow then is to cover the missing line before refactoring: copy the existing TSV test, adjust the separator to comma and expectations for CSV, rerun tests, and confirm the line turns green in the coverage report. Confirmed safe, the first refactoring replaces the top `if (extension == "csv")` branch with a `switch` — initially redundant, then cleaned — with tests passing. A subsequent uncovered `stop("invalid file")` line hiding in the else branch is identified (saying "hi" there would not fail), covered by adding `expect_error(load_file("blah"), "invalid file")`, dropping the `if` guard, and folding all extensions plus the error case into a single `switch(extension, csv = ..., tsv = ..., stop("invalid file"))`. As coverage grows, refactoring speed and aggressiveness increase because the test safety net catches mistakes. The speaker notes coverage at 100% does not guarantee correctness, but it is a prerequisite for confident refactoring.

## Key Concepts & Tools Taught

- **[code-coverage]:** Measuring which lines of source are executed by tests; red = not covered, green = covered; 100% in this demo before degradation.
- **[covr]:** R package that analyses coverage ("cover package" → covr) providing `covr::package_coverage()` and `covr::report()` helpers.
- **[test-coverage]:** Using the coverage report to decide what to test next — adding a CSV test to cover an uncovered branch before refactoring it.
- **[refactoring]:** Restructuring `load_file()` from chained `if` statements to a single `switch` statement while preserving behavior, leveraging covered lines to refactor aggressively, including temporary aggressive edits (e.g., `TRUE` guard) to validate structure.
- **[expect_error]:** `testthat::expect_error()` expectation for the invalid-extension case (`"invalid file"` message), completing coverage for the error path.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```r
covr::package_coverage()  # "cover call package coverage" ← package_coverage / cover package
covr::report()            # "cover report" ← covr::report — shows covered (green) vs uncovered (red) lines

# RStudio command palette alternative (preferred interactive path)
# Shift+Ctrl+P → type "report test" → Report test coverage for package / for file

# Keyboard shortcut assignment
# Tools → Modify Keyboard Shortcuts → find Report → press keys in Shortcut column to bind

# Initial load_file tests (degraded to 50% for demo)
# use_test()  # "use test there you go" ← use_test — locate test file

# Demonstrating uncovered vs covered breakage
# In R/load_file.R — line 5 (csv):
read.csv(file, sep = ",")  # inserting `stop("oh no")` here still passes when line is red (uncovered)

# Covered tsv line — breaking it fails
read.delim(file, sep = "\t")  # inserting `stop("oh no")` here causes tests to fail (covered)

# Covering the CSV line — copy TSV test, change sep to comma
testthat::expect_equal(load_file(csv_file), expected_csv)  # adjusted from TSV variant

# Expecting the invalid-file error branch (previously uncovered)
testthat::expect_error(load_file("blah"), "invalid file")  # "we just expect an error ... invalid file" — covers final stop line

# Refactoring progression — from if to switch
# Before:
if (extension == "csv") { read.csv(...) }
if (extension == "tsv") { read.delim(...) }
stop("invalid file")

# After (incremental, finally collapsed):
switch(extension,
  csv = read.csv(file, sep = ","),
  tsv = read.delim(file, sep = "\t"),
  stop("invalid file")
)
# intermediate aggressive edit tested: adding `if (TRUE)` guard to validate switch wiring
```
