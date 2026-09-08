---
type: source
title: "Testing: Introduction"
source_file: "9JcJFber21w_testing-introduction.md"
video_id: "9JcJFber21w"
url: "https://www.youtube.com/watch?v=9JcJFber21w"
lang: en
tags: ["ds-incubator", "testing", "shiny", "r-packages", "snapshot-testing"]
key_topics: ["testing-fundamentals", "test-anatomy", "test-levels", "test-driven-development"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=9JcJFber21w"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 59
    last_modified: "2021-03-30T00:00:00Z"
usage_window: { from: "2021-03-30T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Testing: Introduction

## Summary

The opener of a testing series distinguishes manual inspection in the console from automated testing that can be run quickly any number of times. It targets programs larger than what fits in one head, where the impact of a change cannot be predicted, and frames the work as turning every mouse click into code — painful at first but saving time from the mid-run onward.

The core reference is Hadley Wickham's Mastering Shiny testing chapter (and the Testing chapter of R Packages), presented as his most up-to-date synthesis. The anatomy of a `testthat` test is introduced with three parts: a string declaring intent, generating minimal explicit toy data on the fly (example: named vector `x` with elements `a=1`, `b=2` to test `as_vector` stripping names), and an expectation comparing actual output to expected output. Four levels of testing are outlined from the book: 1) functions (unit), 2) reactive components, 3) browser behavior (JavaScript), and 4) visuals (e.g., plots). The series will focus on level 1 unit testing and level 4 visuals. Key advice: test at the lowest possible level for speed and stability, but know that design becomes more testable when functions accept injected parameters instead of relying on globals. The philosophy section covers three occasions for writing tests: before code (test-driven development when behavior is known, yielding exact coverage), after code from a worry list (what if inputs are vectors vs data frames, numbers vs string "1"), and immediately after finding a bug by capturing it as a regression test to prevent its return. The session closes with logistics — a dedicated GitHub repository for the series, a syllabus, and discussion on cross-platform visual differences (Mac/Linux/Windows line endings, colors, fonts), SVG text snapshots, and using `snapshot_review` from an external snapshot helper.

## Key Concepts & Tools Taught

- **[testing fundamentals / testing-fundamentals]:** Automated vs manual testing; turning clicks into code so tests run fast and repeatedly.
- **[test anatomy / test-anatomy]:** `testthat::test_that()` structure: 1) declare intent as a string, 2) generate data (prefer tiny explicit toy data like `x <- c(a=1, b=2)` over obscure external fixtures), 3) expectation comparing result to expected.
- **[expectation]:** The third element of a test (e.g., `expect_equal()`) that checks whether a function did what the intent described.
- **[testthat]:** R package providing `test_that()` and expectations such as `expect_equal` ("comes from the desktop package again") for unit tests.
- **[as_vector example]:** Toy case `as_vector` (caption as `s dot vector`, `as dot vector`) that should strip names; intent, data and expectation illustrated end-to-end.
- **[test levels / test-levels]:** Four levels from Mastering Shiny: functions (unit), reactivity, browser/JavaScript, visuals — with trade-off that higher levels are more realistic but slower and more fragile with false positives.
- **[unit vs integration vs visual]:** Unit (lowest, must-have for all audiences) vs integration/integration-level workflow tests vs visual/snapshot tests for outputs; discussion of `snapshots` and `snapshot_review`.
- **[when to write tests / test-driven-development]:** Philosophy: before code (TDD, when expected behavior is known → exact amount of code, fully covered), after code (work through a worry list), and at bug discovery (capture a bug as a small reproducible test case).
- **[design for testability]:** Adding parameters to inject data/alternatives instead of relying on the global environment makes code easier to test.
- **[worry list]:** Accumulating concerns after exploratory coding (e.g., vector instead of data frame, string "1" instead of numeric) and then testing each.
- **[regression / bug-canary test]:** Every bug gets a minimal reprex converted to a test so it never returns ("it's horrible to fix the same bug more than once").

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here); no static file blocks shown:

```r
test_that()               # "test that is in our package that allows you to write tests for your code and so the anatomy of a test that test is like this you don't need ... test underscore dot"
test_that("as_vector strips names", {  # "place where you declare the intent of that test ... in this case for example the intent ... to understand if s dot vector if the function as dot vector strips the names"
  x <- c(a = 1, b = 2)    # "second component is where you generate some data ... vector x now contains the first element called a that holds the number one"
  expect_equal(as_vector(x), c(1, 2))  # "third component where you actually run what's called an expectation ... expects equals equal comes from the desktop package"
})
expect_equal()            # "expects equals equal comes from the desktop package" → expect_equal()
# Discussion-only mentions (not called in console):
# - snapshot tests / snapshot_review  # "there is a function called snapshot review that pops up from a different package ... compares graphs"
# - SVG export for plot testing      # "normally in R you're testing like you export the graphic as a svg which is like a textual representation"
```
