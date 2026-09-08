---
type: Playbook
title: Package Testing Infrastructure
description: Setting up testthat in packages, test directories, automated testing
  with CI/CD
lang: en
tags:
- ds-incubator
generated:
  by: agent:okf-wiki-builder/1.0
  at: '2026-09-08T04:00:00Z'
status: draft
sources:
- id: -9QCNwmpTOE
  resource: https://www.youtube.com/watch?v=-9QCNwmpTOE
  title: Test driven development
  author: process:yt-dlp
  usage_count: 17
  last_modified: '2020-12-29T00:00:00Z'
- id: 3rf1W9ceKhU
  resource: https://www.youtube.com/watch?v=3rf1W9ceKhU
  title: Failing fast in dplyr chains
  author: process:yt-dlp
  usage_count: 5
  last_modified: '2020-06-30T00:00:00Z'
- id: 4AOKCiAh3NM
  resource: https://www.youtube.com/watch?v=4AOKCiAh3NM
  title: 'Testing: Test driven development (TDD)'
  author: process:yt-dlp
  usage_count: 48
  last_modified: '2021-04-13T00:00:00Z'
- id: 5wHl9N4fBBU
  resource: https://www.youtube.com/watch?v=5wHl9N4fBBU
  title: 'ds.production: From an MVP to production'
  author: process:yt-dlp
  usage_count: 87
  last_modified: '2023-06-17T00:00:00Z'
- id: 7igKU5JVmxM
  resource: https://www.youtube.com/watch?v=7igKU5JVmxM
  title: Inspecting the history
  author: process:yt-dlp
  usage_count: 21
  last_modified: '2020-12-15T00:00:00Z'
- id: 9JcJFber21w
  resource: https://www.youtube.com/watch?v=9JcJFber21w
  title: 'Testing: Introduction'
  author: process:yt-dlp
  usage_count: 59
  last_modified: '2021-03-30T00:00:00Z'
- id: C0VuGkBZeKw
  resource: https://www.youtube.com/watch?v=C0VuGkBZeKw
  title: Hazards of side effects and ways to leave the world as you found it
  author: process:yt-dlp
  usage_count: 19
  last_modified: '2021-05-11T00:00:00Z'
- id: O_tkgjsUT6g
  resource: https://www.youtube.com/watch?v=O_tkgjsUT6g
  title: 'Shiny: Packages'
  author: process:yt-dlp
  usage_count: 59
  last_modified: '2021-08-03T00:00:00Z'
- id: UeECMfOFIHk
  resource: https://www.youtube.com/watch?v=UeECMfOFIHk
  title: 'Testing: Using snapshot tests to refactor safely'
  author: process:yt-dlp
  usage_count: 24
  last_modified: '2021-05-04T00:00:00Z'
- id: _Cl4odbiG78
  resource: https://www.youtube.com/watch?v=_Cl4odbiG78
  title: Using drake to develop smart, reproducible workflows
  author: process:yt-dlp
  usage_count: 13
  last_modified: '2020-05-05T00:00:00Z'
- id: bKRFCOkmpiw
  resource: https://www.youtube.com/watch?v=bKRFCOkmpiw
  title: 'Testing: Code coverage'
  author: process:yt-dlp
  usage_count: 32
  last_modified: '2021-04-20T00:00:00Z'
- id: co082qNN_Cs
  resource: https://www.youtube.com/watch?v=co082qNN_Cs
  title: 'R packages: Testing'
  author: process:yt-dlp
  usage_count: 15
  last_modified: '2020-02-18T00:00:00Z'
- id: pxxcuZH9_yA
  resource: https://www.youtube.com/watch?v=pxxcuZH9_yA
  title: 'Testing: Snapshot tests'
  author: process:yt-dlp
  usage_count: 175
  last_modified: '2021-04-27T00:00:00Z'
- id: xxtpMXvVM3s
  resource: https://www.youtube.com/watch?v=xxtpMXvVM3s
  title: 'Refactoring: How to prepare for dplyr 1.0.0'
  author: process:yt-dlp
  usage_count: 129
  last_modified: '2020-03-24T00:00:00Z'
- id: yMPV9TPH3GI
  resource: https://www.youtube.com/watch?v=yMPV9TPH3GI
  title: 'Testing: Basic structure and  basic workflow'
  author: process:yt-dlp
  usage_count: 37
  last_modified: '2021-04-06T00:00:00Z'
---
# Package Testing Infrastructure

## Overview

Testing for packages is anchored in `testthat` and taught as an infrastructure choice, not just a one-off test file. [source_co082qNN_Cs](../../sources/source_co082qNN_Cs_r-packages-testing.md) and [source_TEUbVjhooIg](../../sources/source_TEUbVjhooIg_project-oriented-workflow.md)-adjacent demos show the three-layer setup, while TDD and snapshot sessions ([source_-9QCNwmpTOE](../../sources/source_-9QCNwmpTOE_test-driven-development.md), [source_UeECMfOFIHk](../../sources/source_UeECMfOFIHk_testing-using-snapshot-tests-to-refactor-safely.md), [source_pxxcuZH9_yA](../../sources/source_pxxcuZH9_yA_testing-snapshot-tests.md)) explain *why* the infrastructure exists. The series positions tests as the fastest feedback loop inside `R CMD check`.

The pattern is: `usethis::use_testthat()` once, `usethis::use_test("my_function")` per function, run via `devtools::test()` or Build tab, and guard with CI (`use_github_action("check-standard")`) and coverage (`covr`).

## Key Concepts

- **Scaffolding**: `usethis::use_testthat()` creates `tests/testthat.R`, `tests/testthat/`, `DESCRIPTION Suggests: testthat` (edition 3) and the `tests/testthat.R` runner; `usethis::use_test("summarize_range")` creates the paired test file with `test_that("...", skip("TODO"))` placeholder — [source_AFuVF0oWFMY](../../sources/source_AFuVF0oWFMY_creating-an-empty-r-package-up-to-the-best-standards.md) and [source_co082qNN_Cs](../../sources/source_co082qNN_Cs_r-packages-testing.md).
- **Test anatomy**: intent string + minimal toy data + `expect_*()` (e.g., `expect_equal(as_vector(c(a=1)), 1)`) from [source_9JcJFber21w](../../sources/source_9JcJFber21w_testing-introduction.md); lowest-level principle (test functions, not browsers) from [source_9JcJFber21w](../../sources/source_9JcJFber21w_testing-introduction.md) — see [Testing Fundamentals](../testing/testing-fundamentals.md).
- **Fail-fast and defensiveness**: guard with `stopifnot()`, `stop()`; failing fast inside `mutate()` chains via `fail_fast()` helper so `dplyr` pipelines error at the row that violates assumptions — [source_3rf1W9ceKhU](../../sources/source_3rf1W9ceKhU_failing-fast-in-dplyr-chains.md) and [source_C0VuGkBZeKw](../../sources/source_C0VuGkBZeKw_hazards-of-side-effects-and-ways-to-leave-the-world-as-you-found-it.md).
- **Snapshot tests**: `expect_snapshot()` captures output for safe refactoring; see [source_UeECMfOFIHk](../../sources/source_UeECMfOFIHk_testing-using-snapshot-tests-to-refactor-safely.md) and [source_pxxcuZH9_yA](../../sources/source_pxxcuZH9_yA_testing-snapshot-tests.md) — reviewed in [Snapshot Tests](../testing/snapshot-tests.md).
- **Coverage**: `covr::package_coverage()`, `covr::report()`; measured via [source_bKRFCOkmpiw](../../sources/source_bKRFCOkmpiw_testing-code-coverage.md) — see [Code Coverage](../testing/code-coverage.md).
- **CI integration**: `usethis::use_github_action("check-standard")` runs `R CMD check` (which runs `tests/`) on push/PR; branch `add-CI` demo in [source_AFuVF0oWFMY](../../sources/source_AFuVF0oWFMY_creating-an-empty-r-package-up-to-the-best-standards.md).
- **Organizing tests**: one file per function (`test-summarize_range.R`), `setup.R`/`helper.R` for shared fixtures; see [source_yMPV9TPH3GI](../../sources/source_yMPV9TPH3GI_testing-basic-structure-and-basic-workflow.md) and [source_4AOKCiAh3NM](../../sources/source_4AOKCiAh3NM_testing-test-driven-development-tdd.md).

## Workflow

```r
usethis::use_testthat()          # once
usethis::use_test("my_fun")      # per function -> tests/testthat/test-my_fun.R
# write test_that("my_fun works", expect_equal(my_fun(1), 1))
devtools::test()                 # or Ctrl+Shift+T / Build → Test
covr::package_coverage()         # coverage
```

## Sources

| Video | Title | Views | Last Modified |
| [-9QCNwmpTOE](https://www.youtube.com/watch?v=-9QCNwmpTOE) | [Test driven development](../../sources/source_-9QCNwmpTOE_test-driven-development.md) | 17 | 2020-12-29T00:00:00Z |
| [3rf1W9ceKhU](https://www.youtube.com/watch?v=3rf1W9ceKhU) | [Failing fast in dplyr chains](../../sources/source_3rf1W9ceKhU_failing-fast-in-dplyr-chains.md) | 5 | 2020-06-30T00:00:00Z |
| [4AOKCiAh3NM](https://www.youtube.com/watch?v=4AOKCiAh3NM) | [Testing: Test driven development (TDD)](../../sources/source_4AOKCiAh3NM_testing-test-driven-development-tdd.md) | 48 | 2021-04-13T00:00:00Z |
| [5wHl9N4fBBU](https://www.youtube.com/watch?v=5wHl9N4fBBU) | [ds.production: From an MVP to production](../../sources/source_5wHl9N4fBBU_ds-production-from-an-mvp-to-production.md) | 87 | 2023-06-17T00:00:00Z |
| [7igKU5JVmxM](https://www.youtube.com/watch?v=7igKU5JVmxM) | [Inspecting the history](../../sources/source_7igKU5JVmxM_inspecting-the-history.md) | 21 | 2020-12-15T00:00:00Z |
| [9JcJFber21w](https://www.youtube.com/watch?v=9JcJFber21w) | [Testing: Introduction](../../sources/source_9JcJFber21w_testing-introduction.md) | 59 | 2021-03-30T00:00:00Z |
| [C0VuGkBZeKw](https://www.youtube.com/watch?v=C0VuGkBZeKw) | [Hazards of side effects and ways to leave the world as you found it](../../sources/source_C0VuGkBZeKw_hazards-of-side-effects-and-ways-to-leave-the-world-as-you-found-it.md) | 19 | 2021-05-11T00:00:00Z |
| [O](https://www.youtube.com/watch?v=O) | [Shiny: Packages](../../sources/source_O_tkgjsUT6g_shiny-packages.md) | 59 | 2021-08-03T00:00:00Z |
| [UeECMfOFIHk](https://www.youtube.com/watch?v=UeECMfOFIHk) | [Testing: Using snapshot tests to refactor safely](../../sources/source_UeECMfOFIHk_testing-using-snapshot-tests-to-refactor-safely.md) | 24 | 2021-05-04T00:00:00Z |
| [_Cl4odbiG78](https://www.youtube.com/watch?v=_Cl4odbiG78) | [Using drake to develop smart, reproducible workflows](../../sources/source__Cl4odbiG78_using-drake-to-develop-smart-reproducible-workflows.md) | 13 | 2020-05-05T00:00:00Z |
| [bKRFCOkmpiw](https://www.youtube.com/watch?v=bKRFCOkmpiw) | [Testing: Code coverage](../../sources/source_bKRFCOkmpiw_testing-code-coverage.md) | 32 | 2021-04-20T00:00:00Z |
| [co082qNN](https://www.youtube.com/watch?v=co082qNN) | [R packages: Testing](../../sources/source_co082qNN_Cs_r-packages-testing.md) | 15 | 2020-02-18T00:00:00Z |
| [pxxcuZH9](https://www.youtube.com/watch?v=pxxcuZH9) | [Testing: Snapshot tests](../../sources/source_pxxcuZH9_yA_testing-snapshot-tests.md) | 175 | 2021-04-27T00:00:00Z |
| [xxtpMXvVM3s](https://www.youtube.com/watch?v=xxtpMXvVM3s) | [Refactoring: How to prepare for dplyr 1.0.0](../../sources/source_xxtpMXvVM3s_refactoring-how-to-prepare-for-dplyr-1-0-0.md) | 129 | 2020-03-24T00:00:00Z |
| [yMPV9TPH3GI](https://www.youtube.com/watch?v=yMPV9TPH3GI) | [Testing: Basic structure and  basic workflow](../../sources/source_yMPV9TPH3GI_testing-basic-structure-and-basic-workflow.md) | 37 | 2021-04-06T00:00:00Z |
## References

- Hadley Wickham — *R Packages* (Whole game, Documenting, Testing, CRAN)
- Hadley Wickham — *R for Data Science* (Workflow, EDA, ggplot2, dplyr)
- `usethis`, `devtools`, `roxygen2`, `pkgdown`, `targets`, `drake`, `ggplot2` documentation
