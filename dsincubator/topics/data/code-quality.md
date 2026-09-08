---
type: Reference
title: Code Quality and Style
description: Type-inconsistent code, avoiding hidden arguments, refactoring for dplyr,
  and code style guidelines
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
- id: 1lpcCHfozh0
  resource: https://www.youtube.com/watch?v=1lpcCHfozh0
  title: Conversaciones productivas sobre codigo (argumentos)
  author: process:yt-dlp
  usage_count: 7
  last_modified: '2020-09-01T00:00:00Z'
- id: 4AOKCiAh3NM
  resource: https://www.youtube.com/watch?v=4AOKCiAh3NM
  title: 'Testing: Test driven development (TDD)'
  author: process:yt-dlp
  usage_count: 48
  last_modified: '2021-04-13T00:00:00Z'
- id: 4IXcu1g0zfk
  resource: https://www.youtube.com/watch?v=4IXcu1g0zfk
  title: Productive conversations about code (part 1 of 2)
  author: process:yt-dlp
  usage_count: 13
  last_modified: '2020-09-01T00:00:00Z'
- id: 5wHl9N4fBBU
  resource: https://www.youtube.com/watch?v=5wHl9N4fBBU
  title: 'ds.production: From an MVP to production'
  author: process:yt-dlp
  usage_count: 87
  last_modified: '2023-06-17T00:00:00Z'
- id: BAS8yfLBnog
  resource: https://www.youtube.com/watch?v=BAS8yfLBnog
  title: 'Strong-style pair-programming: Submitting an R package to CRAN'
  author: process:yt-dlp
  usage_count: 638
  last_modified: '2020-03-16T00:00:00Z'
- id: EB6ODnkdG7A
  resource: https://www.youtube.com/watch?v=EB6ODnkdG7A
  title: 'Shiny: Basic reactivity'
  author: process:yt-dlp
  usage_count: 64
  last_modified: '2021-07-13T00:00:00Z'
- id: PHFOEKXPaxI
  resource: https://www.youtube.com/watch?v=PHFOEKXPaxI
  title: Avoid hidden arguments
  author: process:yt-dlp
  usage_count: 29
  last_modified: '2019-12-03T00:00:00Z'
- id: UR4vwDkJMhc
  resource: https://www.youtube.com/watch?v=UR4vwDkJMhc
  title: Pair programming
  author: process:yt-dlp
  usage_count: 8
  last_modified: '2020-03-10T00:00:00Z'
- id: UeECMfOFIHk
  resource: https://www.youtube.com/watch?v=UeECMfOFIHk
  title: 'Testing: Using snapshot tests to refactor safely'
  author: process:yt-dlp
  usage_count: 24
  last_modified: '2021-05-04T00:00:00Z'
- id: bKRFCOkmpiw
  resource: https://www.youtube.com/watch?v=bKRFCOkmpiw
  title: 'Testing: Code coverage'
  author: process:yt-dlp
  usage_count: 32
  last_modified: '2021-04-20T00:00:00Z'
- id: o9ZHNEl8UI8
  resource: https://www.youtube.com/watch?v=o9ZHNEl8UI8
  title: Watch out for type inconsistent code
  author: process:yt-dlp
  usage_count: 17
  last_modified: '2020-03-03T00:00:00Z'
- id: xxtpMXvVM3s
  resource: https://www.youtube.com/watch?v=xxtpMXvVM3s
  title: 'Refactoring: How to prepare for dplyr 1.0.0'
  author: process:yt-dlp
  usage_count: 129
  last_modified: '2020-03-24T00:00:00Z'
---

# Code Quality and Style

## Overview

Code quality is framed as type safety + explicit arguments + refactor discipline. This Reference distills [source_o9ZHNEl8UI8](../../sources/source_o9ZHNEl8UI8_watch-out-for-type-inconsistent-code.md) (type-inconsistent traps), [source_PHFOEKXPaxI](../../sources/source_PHFOEKXPaxI_avoid-hidden-arguments.md) (hidden args/`...`), [source_xxtpMXvVM3s](../../sources/source_xxtpMXvVM3s_refactoring-how-to-prepare-for-dplyr-1-0-0.md) (dplyr 1.0 refactor), with testing guards from [source_bKRFCOkmpiw](../../sources/source_bKRFCOkmpiw_testing-code-coverage.md) and style guardrails from [source_YlBnarQNRR8](../../sources/source_YlBnarQNRR8_tidy-eda-defensive-workflow.md).

Testing in [Code Coverage](../testing/code-coverage.md) and [Snapshot Tests](../testing/snapshot-tests.md); workflow in [Pairs Programming](../data/pairs-programming.md) and [Code Reviews](../communication/code-reviews.md).

## Key Concepts

- **Type inconsistency** ([source_o9ZHNEl8UI8](../../sources/source_o9ZHNEl8UI8_watch-out-for-type-inconsistent-code.md)): `ifelse` strips attributes, `sapply` simplifies unpredictably; prefer `if_else` / `map_*` with explicit `purrr::map_dbl` suffix for type stability.
- **Hidden arguments** ([source_PHFOEKXPaxI](../../sources/source_PHFOEKXPaxI_avoid-hidden-arguments.md)): `...` silently swallows typos; expose key args (`na.rm`, `trim`) explicitly, forward `...` only at leaf, assert via `rlang::check_dots_used`.
- **Refactor for dplyr 1.0** ([source_xxtpMXvVM3s](../../sources/source_xxtpMXvVM3s_refactoring-how-to-prepare-for-dplyr-1-0-0.md)): migrate `funs()` → `across()` / `pick()`, `group_by %>% mutate` → `reframe`; lock with `expect_snapshot` before change — see [Snapshot Tests](../testing/snapshot-tests.md).
- **Coverage guard** ([source_bKRFCOkmpiw](../../sources/source_bKRFCOkmpiw_testing-code-coverage.md)): `covr::report()` after refactor; style via `styler`/`lintr` in CI — see [Code Coverage](../testing/code-coverage.md).
- **Pairing guard** ([source_BAS8yfLBnog](../../sources/source_BAS8yfLBnog_strong-style-pair-programming-submitting-an-r-package-to-cran.md), [source_UR4vwDkJMhc](../../sources/source_UR4vwDkJMhc_pair-programming.md)): strong-style review for subtle quality regressions — see [Pairs Programming](../data/pairs-programming.md).

## Example

```r
# hidden args: bad vs good
bad <- function(x, ...) mean(x, ...)  # typo in ... silently ignored
# good
good <- function(x, na.rm=FALSE, ...) {
  rlang::check_dots_used()
  mean(x, na.rm=na.rm, ...)
}
# type stable
purrr::map_dbl(list(1,2), identity)
dplyr::if_else(c(TRUE,FALSE,NA), 1L, 0L, missing=NA_integer_)
# refactor guard
testthat::expect_snapshot(df %>% summarise(across(everything(), mean)))
```

## Sources

| Video | Title | Views | Last Modified |
|---|---|---|---|
| [-9QCNwmpTOE](https://www.youtube.com/watch?v=-9QCNwmpTOE) | [Test driven development](../../sources/source_-9QCNwmpTOE_test-driven-development.md) | 17 | 2020-12-29T00:00:00Z |
| [1lpcCHfozh0](https://www.youtube.com/watch?v=1lpcCHfozh0) | [Conversaciones productivas sobre codigo (argumentos)](../../sources/source_1lpcCHfozh0_conversaciones-productivas-sobre-codigo-argumentos.md) | 7 | 2020-09-01T00:00:00Z |
| [4AOKCiAh3NM](https://www.youtube.com/watch?v=4AOKCiAh3NM) | [Testing: Test driven development (TDD)](../../sources/source_4AOKCiAh3NM_testing-test-driven-development-tdd.md) | 48 | 2021-04-13T00:00:00Z |
| [4IXcu1g0zfk](https://www.youtube.com/watch?v=4IXcu1g0zfk) | [Productive conversations about code (part 1 of 2)](../../sources/source_4IXcu1g0zfk_productive-conversations-about-code-part-1-of-2.md) | 13 | 2020-09-01T00:00:00Z |
| [5wHl9N4fBBU](https://www.youtube.com/watch?v=5wHl9N4fBBU) | [ds.production: From an MVP to production](../../sources/source_5wHl9N4fBBU_ds-production-from-an-mvp-to-production.md) | 87 | 2023-06-17T00:00:00Z |
| [BAS8yfLBnog](https://www.youtube.com/watch?v=BAS8yfLBnog) | [Strong-style pair-programming: Submitting an R package to CRAN](../../sources/source_BAS8yfLBnog_strong-style-pair-programming-submitting-an-r-package-to-cran.md) | 638 | 2020-03-16T00:00:00Z |
| [EB6ODnkdG7A](https://www.youtube.com/watch?v=EB6ODnkdG7A) | [Shiny: Basic reactivity](../../sources/source_EB6ODnkdG7A_shiny-basic-reactivity.md) | 64 | 2021-07-13T00:00:00Z |
| [PHFOEKXPaxI](https://www.youtube.com/watch?v=PHFOEKXPaxI) | [Avoid hidden arguments](../../sources/source_PHFOEKXPaxI_avoid-hidden-arguments.md) | 29 | 2019-12-03T00:00:00Z |
| [UR4vwDkJMhc](https://www.youtube.com/watch?v=UR4vwDkJMhc) | [Pair programming](../../sources/source_UR4vwDkJMhc_pair-programming.md) | 8 | 2020-03-10T00:00:00Z |
| [UeECMfOFIHk](https://www.youtube.com/watch?v=UeECMfOFIHk) | [Testing: Using snapshot tests to refactor safely](../../sources/source_UeECMfOFIHk_testing-using-snapshot-tests-to-refactor-safely.md) | 24 | 2021-05-04T00:00:00Z |
| [bKRFCOkmpiw](https://www.youtube.com/watch?v=bKRFCOkmpiw) | [Testing: Code coverage](../../sources/source_bKRFCOkmpiw_testing-code-coverage.md) | 32 | 2021-04-20T00:00:00Z |
| [o9ZHNEl8UI8](https://www.youtube.com/watch?v=o9ZHNEl8UI8) | [Watch out for type inconsistent code](../../sources/source_o9ZHNEl8UI8_watch-out-for-type-inconsistent-code.md) | 17 | 2020-03-03T00:00:00Z |
| [xxtpMXvVM3s](https://www.youtube.com/watch?v=xxtpMXvVM3s) | [Refactoring: How to prepare for dplyr 1.0.0](../../sources/source_xxtpMXvVM3s_refactoring-how-to-prepare-for-dplyr-1-0-0.md) | 129 | 2020-03-24T00:00:00Z |

## References

- Wickham — Advanced R Ch. Type stability
- tidyverse style guide (style.tidyverse.org)
- dplyr 1.0 migration guide

