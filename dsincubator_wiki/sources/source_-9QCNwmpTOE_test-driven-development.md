---
type: source
title: "Test driven development"
source_file: "-9QCNwmpTOE_test-driven-development.md"
video_id: "-9QCNwmpTOE"
url: "https://www.youtube.com/watch?v=-9QCNwmpTOE"
lang: en
tags: ["ds-incubator", "r-packages", "refactoring", "tdd", "testing"]
key_topics: ["test-driven-development", "testthat", "refactoring"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=-9QCNwmpTOE"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 17
    last_modified: "2020-12-29T00:00:00Z"
usage_window: { from: "2020-12-29T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# Test driven development

## Summary

The session presents test-driven development through the framing in the testing chapter of Mastering Shiny: there are three occasions for writing tests. The first is after discovering a bug, where you write a test that exposes the bug, fix the code, and leave the test as a canary against regression. The second, most familiar occasion is writing tests after the code, which suits exploratory work where the expected behavior only becomes clear through experimentation. The third is test-driven development proper: when the expected behavior is known, write the test before the production code.

The speaker demonstrates this with a minimal R package example using usethis and testthat. He creates a package, adds an R file for a planned `greet` function with `use_r`, and generates the matching test file with `use_test`, which also sets up the testthat infrastructure. The first TDD cycle starts with a failing test asserting that `greet` with no input returns hello world, then implements only the minimum code needed to make that test pass, running tests with Ctrl+Shift+T and committing before continuing.

Two further cycles extend the function: greeting a caller by name with a default argument of world, and then requiring character input by adding an input check first specified with an `expect_error` test. Each cycle follows write failing test, write minimal passing code, and refactor without accumulating technical debt. The session closes with group discussion on negative tests, tests as a contract with other programmers that discourages breaking changes, and test coverage via the covr package, noting that full coverage does not guarantee correctness and can give false confidence.

## Key Concepts & Tools Taught

- **[Test-driven development (TDD)]:** Writing the test before production code when expected behavior is known, then implementing only enough code to pass.
- **[Bug-canary / regression test]:** Writing a test that exposes a discovered bug first, fixing the bug, and keeping the test so future regressions are caught immediately.
- **[Writing tests after code]:** Writing tests once exploratory coding has clarified what a function should do.
- **[testthat]:** R testing framework used for expectations such as equality checks and expected errors, run per-file or whole-package with Ctrl+Shift+T.
- **[usethis package workflow]:** Using helpers to create a package, add an R file with `use_r`, and scaffold the matching test file with `use_test` plus the testthat infrastructure.
- **[Red-green-refactor cycle]:** Starting from a failing test, making it pass with minimal code, then refactoring and committing before adding the next behavior.
- **[Input validation]:** Guarding `greet` against non-character input by testing first that a numeric input throws an error, then adding a character check in the function.
- **[Refactoring and technical debt]:** Cleaning up code after tests pass, including extracting helpers, while relying on the test suite to catch mistakes.
- **[Negative tests]:** Testing behavior that should not happen alongside desired behavior, with discussion of stopping where the cases are obvious rather than exhaustive.
- **[Test coverage with covr]:** Using a coverage report to show tested versus untested lines, with the caveat that high coverage does not mean the code or tests are good.

## Code Snippets & Formulas

No verbatim blocks in the transcript; spoken calls dictated live (caption-mangled, normalized here):

```r
use_r()            # "use this includes a function called use r" — adds R/greet.R
use_test()         # "so you do use test" — creates tests/testthat/test-greet.R + infrastructure
expect_equal()     # "instead of using the expectation expect equal"
expect_error()     # "i can say expect error" — for the non-character input test
stop(...) unless is.character(x)  # "now i'm going to first stop if it's not a character" — input guard; exact call not dictated
```

Run via Ctrl+Shift+T ("doing ctrl shift t which is what i do like almost by reflex").
