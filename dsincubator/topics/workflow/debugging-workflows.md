---
type: Playbook
title: Debugging Workflows
description: 'Systematic debugging in R: wtf debugging, systematic debugging workflows,
  and common pitfalls'
lang: en
tags:
- ds-incubator
generated:
  by: agent:okf-wiki-builder/1.0
  at: '2026-09-08T04:00:00Z'
status: draft
sources:
- id: 3rf1W9ceKhU
  resource: https://www.youtube.com/watch?v=3rf1W9ceKhU
  title: Failing fast in dplyr chains
  author: process:yt-dlp
  usage_count: 5
  last_modified: '2020-06-30T00:00:00Z'
- id: AUIJif93OJA
  resource: https://www.youtube.com/watch?v=AUIJif93OJA
  title: A systematic debugging workflow
  author: process:yt-dlp
  usage_count: 64
  last_modified: '2024-06-04T00:00:00Z'
- id: NgEocgBUH_A
  resource: https://www.youtube.com/watch?v=NgEocgBUH_A
  title: 'Shiny: Debugging'
  author: process:yt-dlp
  usage_count: 2326
  last_modified: '2021-07-27T00:00:00Z'
- id: lfhuO71ikQE
  resource: https://www.youtube.com/watch?v=lfhuO71ikQE
  title: 'targets: debugging'
  author: process:yt-dlp
  usage_count: 137
  last_modified: '2021-03-09T00:00:00Z'
- id: lq6ZhPFVLTY
  resource: https://www.youtube.com/watch?v=lq6ZhPFVLTY
  title: 'Shiny: development workflow'
  author: process:yt-dlp
  usage_count: 54
  last_modified: '2021-07-20T00:00:00Z'
- id: tLvRWRWeQK4
  resource: https://www.youtube.com/watch?v=tLvRWRWeQK4
  title: 'WTF: Debugging R code'
  author: process:yt-dlp
  usage_count: 56
  last_modified: '2022-03-29T00:00:00Z'
---

# Debugging Workflows

## Overview

Systematic debugging replaces "stare and hope" with reproduce → isolate → fix → guard. Anchors are [source_AUIJif93OJA](../../sources/source_AUIJif93OJA_a-systematic-debugging-workflow.md) (systematic loop), [source_tLvRWRWeQK4](../../sources/source_tLvRWRWeQK4_wtf-debugging-r-code.md) (WTF tools), plus Shiny/targets specifics ([source_NgEocgBUH_A](../../sources/source_NgEocgBUH_A_shiny-debugging.md), [source_lfhuO71ikQE](../../sources/source_lfhuO71ikQE_targets-debugging.md)) and fail-fast ([source_3rf1W9ceKhU](../../sources/source_3rf1W9ceKhU_failing-fast-in-dplyr-chains.md)). Companion to [Shiny Debugging](../shiny/shiny-debugging.md).

See [Shiny Debugging](../shiny/shiny-debugging.md); input via [Reproducible Examples](../communication/reprex.md); quality via [Testing Fundamentals](../testing/testing-fundamentals.md).

## Key Concepts

- **Loop** ([source_AUIJif93OJA](../../sources/source_AUIJif93OJA_a-systematic-debugging-workflow.md)): reproduce with `reprex` → narrow via binary search / `traceback()` → minimal reprex → fix → add `testthat` guard.
- **Toolchain** ([source_tLvRWRWeQK4](../../sources/source_tLvRWRWeQK4_wtf-debugging-r-code.md), [source_AUIJif93OJA](../../sources/source_AUIJif93OJA_a-systematic-debugging-workflow.md)): `traceback()`, `browser()` / `debug()` / `debugonce()`, RStudio breakpoints, `options(error=recover)`, `rlang::last_trace()`.
- **Fail-fast** ([source_3rf1W9ceKhU](../../sources/source_3rf1W9ceKhU_failing-fast-in-dplyr-chains.md)): `stopifnot`/`assertthat`/`checkmate` at chain start so error surfaces near cause, not deep in `mutate`.
- **Reactive/ pipeline specifics** ([source_NgEocgBUH_A](../../sources/source_NgEocgBUH_A_shiny-debugging.md), [source_lfhuO71ikQE](../../sources/source_lfhuO71ikQE_targets-debugging.md)): `req`/`validate` plus `reactlog`, `tar_visnetwork` + `tar_manifest` for targets; `browser()` inside `tar_target`.
- **Reprex as harness** ([source_wJnI0F_A-bU](../../sources/source_wJnI0F_A-bU_creating-reproducible-examples.md), [source_erv1yJaNID8](../../sources/source_erv1yJaNID8_reprex-overview.md)): minimal runnable snippet isolates bug from project noise — see [Reproducible Examples](../communication/reprex.md).

## Example

```r
# systematic loop
reprex::reprex({ library(dplyr); tibble(x=c(1,NA)) %>% mutate(y=x+1) })
traceback(); rlang::last_trace()
debugonce(my_fun); my_fun(NA)
# inside function
my_fun <- function(x){ browser(); dplyr::mutate(...) }
options(error=recover)
# fail-fast
my_pipe <- function(df){ stopifnot(is.data.frame(df), "x" %in% names(df)); df %>% mutate(...) }
```

## Sources

| Video | Title | Views | Last Modified |
|---|---|---|---|
| [3rf1W9ceKhU](https://www.youtube.com/watch?v=3rf1W9ceKhU) | [Failing fast in dplyr chains](../../sources/source_3rf1W9ceKhU_failing-fast-in-dplyr-chains.md) | 5 | 2020-06-30T00:00:00Z |
| [AUIJif93OJA](https://www.youtube.com/watch?v=AUIJif93OJA) | [A systematic debugging workflow](../../sources/source_AUIJif93OJA_a-systematic-debugging-workflow.md) | 64 | 2024-06-04T00:00:00Z |
| [NgEocgBUH_A](https://www.youtube.com/watch?v=NgEocgBUH_A) | [Shiny: Debugging](../../sources/source_NgEocgBUH_A_shiny-debugging.md) | 2326 | 2021-07-27T00:00:00Z |
| [lfhuO71ikQE](https://www.youtube.com/watch?v=lfhuO71ikQE) | [targets: debugging](../../sources/source_lfhuO71ikQE_targets-debugging.md) | 137 | 2021-03-09T00:00:00Z |
| [lq6ZhPFVLTY](https://www.youtube.com/watch?v=lq6ZhPFVLTY) | [Shiny: development workflow](../../sources/source_lq6ZhPFVLTY_shiny-development-workflow.md) | 54 | 2021-07-20T00:00:00Z |
| [tLvRWRWeQK4](https://www.youtube.com/watch?v=tLvRWRWeQK4) | [WTF: Debugging R code](../../sources/source_tLvRWRWeQK4_wtf-debugging-r-code.md) | 56 | 2022-03-29T00:00:00Z |

## References

- WTF Debugging (Jenny Bryan)
- Advanced R — Debugging
- Mastering Shiny — Debugging
- targets debugging vignette

