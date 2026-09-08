---
type: Attested Computation
title: targets Introduction
description: 'Introduction to the targets R package: pipelines, tar_make, target objects,
  and caching'
lang: en
tags:
- ds-incubator
runtime: r
computation_type: pipeline
generated:
  by: agent:okf-wiki-builder/1.0
  at: '2026-09-08T04:00:00Z'
status: draft
sources:
- id: -HtB6duQnD8
  resource: https://www.youtube.com/watch?v=-HtB6duQnD8
  title: The pins package (demo and discussion)
  author: process:yt-dlp
  usage_count: 11
  last_modified: '2020-04-21T00:00:00Z'
- id: 0qUs4hi7ozo
  resource: https://www.youtube.com/watch?v=0qUs4hi7ozo
  title: 'Retrospective about meetups in 2020: Response'
  author: process:yt-dlp
  usage_count: 6
  last_modified: '2021-01-19T00:00:00Z'
- id: EmDubkF8DpQ
  resource: https://www.youtube.com/watch?v=EmDubkF8DpQ
  title: 'targets: Introducción'
  author: process:yt-dlp
  usage_count: 73
  last_modified: '2021-02-02T00:00:00Z'
- id: GDgir1XXOkw
  resource: https://www.youtube.com/watch?v=GDgir1XXOkw
  title: Avoid recomputing if you can! Instead memoise
  author: process:yt-dlp
  usage_count: 43
  last_modified: '2024-06-06T00:00:00Z'
- id: SXEXcXE6Ke0
  resource: https://www.youtube.com/watch?v=SXEXcXE6Ke0
  title: Moving from a sequence of scripts to a pipeline of functions
  author: process:yt-dlp
  usage_count: 617
  last_modified: '2021-02-09T00:00:00Z'
- id: Ulz8Vfnr2P4
  resource: https://www.youtube.com/watch?v=Ulz8Vfnr2P4
  title: 'ds.database: Validate data quality'
  author: process:yt-dlp
  usage_count: 107
  last_modified: '2022-09-20T00:00:00Z'
- id: WmzqpTZtFAw
  resource: https://www.youtube.com/watch?v=WmzqpTZtFAw
  title: dbt overview
  author: process:yt-dlp
  usage_count: 17
  last_modified: '2024-06-21T00:00:00Z'
- id: _Cl4odbiG78
  resource: https://www.youtube.com/watch?v=_Cl4odbiG78
  title: Using drake to develop smart, reproducible workflows
  author: process:yt-dlp
  usage_count: 13
  last_modified: '2020-05-05T00:00:00Z'
- id: dV9C2eIo5QQ
  resource: https://www.youtube.com/watch?v=dV9C2eIo5QQ
  title: 'targets: tar_cue(): Declare the rules that mark a target as outdated.'
  author: process:yt-dlp
  usage_count: 185
  last_modified: '2021-02-16T00:00:00Z'
- id: jAkNwaGRku0
  resource: https://www.youtube.com/watch?v=jAkNwaGRku0
  title: 'targets: Eexternal files and literate programming'
  author: process:yt-dlp
  usage_count: 178
  last_modified: '2021-03-02T00:00:00Z'
- id: lfhuO71ikQE
  resource: https://www.youtube.com/watch?v=lfhuO71ikQE
  title: 'targets: debugging'
  author: process:yt-dlp
  usage_count: 137
  last_modified: '2021-03-09T00:00:00Z'
- id: pbc6NX1n01Q
  resource: https://www.youtube.com/watch?v=pbc6NX1n01Q
  title: 'targets: Introduction'
  author: process:yt-dlp
  usage_count: 2373
  last_modified: '2021-02-02T00:00:00Z'
- id: tLvRWRWeQK4
  resource: https://www.youtube.com/watch?v=tLvRWRWeQK4
  title: 'WTF: Debugging R code'
  author: process:yt-dlp
  usage_count: 56
  last_modified: '2022-03-29T00:00:00Z'
---
# targets Introduction

## Overview

`targets` is a general-purpose R pipeline package for long-running computations, introduced as the successor to `drake`. [source_pbc6NX1n01Q](../../sources/source_pbc6NX1n01Q_targets-introduction.md) builds a minimal two-target pipeline from scratch (`data` → `summary` via `sum()`), while [source_EmDubkF8DpQ](../../sources/source_EmDubkF8DpQ_targets-introduccion.md) repeats the walkthrough in Spanish. Both demonstrate the same mechanic: `_targets.R` lists `tar_target()` calls, `tar_make()` executes in dependency order storing each result in `_targets/objects/`, and `tar_read()` retrieves finished targets for the console or a report.

The series connects `targets` to the broader "scripts → functions → pipelines" arc ([source_SXEXcXE6Ke0](../../sources/source_SXEXcXE6Ke0_moving-from-a-sequence-of-scripts-to-a-pipeline-of-functions.md), [source__Cl4odbiG78](../../sources/source__Cl4odbiG78_using-drake-to-develop-smart-reproducible-workflows.md)) and to memoization (`memoise` as single-function caching vs `targets` as whole-pipeline caching in [source_GDgir1XXOkw](../../sources/source_GDgir1XXOkw_avoid-recomputing-if-you-can-instead-memoise.md)).

## Key Concepts

- **Pipeline definition**: `_targets.R` with `library(targets)` + `source("R/functions.R")` + `tar_option_set(packages = ...)` + `list(tar_target(name, command))` — [source_pbc6NX1n01Q](../../sources/source_pbc6NX1n01Q_targets-introduction.md) and [source_dV9C2eIo5QQ](../../sources/source_dV9C2eIo5QQ_targets-tar-cue-declare-the-rules-that-mark-a-target-as-outdated.md).
- **Execution and caching**: `tar_make()` skips up-to-date targets, recomputes only outdated branches (demo with `Sys.sleep(5)` inside `sum()` so only `summary` reruns while `data` is cached) — [source_pbc6NX1n01Q](../../sources/source_pbc6NX1n01Q_targets-introduction.md).
- **Reading and inspection**: `tar_read("summary")` retrieves a target; `tar_outdated()`, `tar_glimpse()`, `tar_network()` visualise the dependency graph — [source_pbc6NX1n01Q](../../sources/source_pbc6NX1n01Q_targets-introduction.md).
- **Scaffolding helpers**: `tar_script()` creates `_targets.R`, `tar_edit()` opens it — [source_pbc6NX1n01Q](../../sources/source_pbc6NX1n01Q_targets-introduction.md).
- **Spanish variant**: same concepts with bilingual headings in [source_EmDubkF8DpQ](../../sources/source_EmDubkF8DpQ_targets-introduccion.md) (lang: es).
- **Debugging and external files**: covered in companion pages [targets Advanced Topics](../pipelines/targets-advanced.md) and [Reproducible Workflows](../pipelines/reproducible-workflows.md); see also [source_lfhuO71ikQE](../../sources/source_lfhuO71ikQE_targets-debugging.md) and [source_jAkNwaGRku0](../../sources/source_jAkNwaGRku0_targets-eexternal-files-and-literate-programming.md).

## Attested Computation

- **Runtime**: `r`
- **Computation type**: `pipeline`
- **Attestation**: The `tar_make()` → `tar_read()` loop is attested by the targets store (`_targets/meta/meta` + `objects/`). Re-running `tar_make()` is idempotent when no command/dependency changed; `tar_outdated()` proves which targets would recompute. For verification, run `tar_outdated()` before and after a change and confirm only the expected branch is `character(0)` when clean.

```r
library(targets)
tar_script()        # -> _targets.R
tar_edit()          # open pipeline
tar_make()          # build data, summary
tar_read(summary)   # retrieve
tar_outdated()      # character(0) when clean
tar_glimpse()       # dependency graph
```

## Sources

| Video | Title | Views | Last Modified |
| [-HtB6duQnD8](https://www.youtube.com/watch?v=-HtB6duQnD8) | [The pins package (demo and discussion)](../../sources/source_-HtB6duQnD8_the-pins-package-demo-and-discussion.md) | 11 | 2020-04-21T00:00:00Z |
| [0qUs4hi7ozo](https://www.youtube.com/watch?v=0qUs4hi7ozo) | [Retrospective about meetups in 2020: Response](../../sources/source_0qUs4hi7ozo_retrospective-about-meetups-in-2020-response.md) | 6 | 2021-01-19T00:00:00Z |
| [EmDubkF8DpQ](https://www.youtube.com/watch?v=EmDubkF8DpQ) | [targets: Introducción](../../sources/source_EmDubkF8DpQ_targets-introduccion.md) | 73 | 2021-02-02T00:00:00Z |
| [GDgir1XXOkw](https://www.youtube.com/watch?v=GDgir1XXOkw) | [Avoid recomputing if you can! Instead memoise](../../sources/source_GDgir1XXOkw_avoid-recomputing-if-you-can-instead-memoise.md) | 43 | 2024-06-06T00:00:00Z |
| [SXEXcXE6Ke0](https://www.youtube.com/watch?v=SXEXcXE6Ke0) | [Moving from a sequence of scripts to a pipeline of functions](../../sources/source_SXEXcXE6Ke0_moving-from-a-sequence-of-scripts-to-a-pipeline-of-functions.md) | 617 | 2021-02-09T00:00:00Z |
| [Ulz8Vfnr2P4](https://www.youtube.com/watch?v=Ulz8Vfnr2P4) | [ds.database: Validate data quality](../../sources/source_Ulz8Vfnr2P4_ds-database-validate-data-quality.md) | 107 | 2022-09-20T00:00:00Z |
| [WmzqpTZtFAw](https://www.youtube.com/watch?v=WmzqpTZtFAw) | [dbt overview](../../sources/source_WmzqpTZtFAw_dbt-overview.md) | 17 | 2024-06-21T00:00:00Z |
| [_Cl4odbiG78](https://www.youtube.com/watch?v=_Cl4odbiG78) | [Using drake to develop smart, reproducible workflows](../../sources/source__Cl4odbiG78_using-drake-to-develop-smart-reproducible-workflows.md) | 13 | 2020-05-05T00:00:00Z |
| [dV9C2eIo5QQ](https://www.youtube.com/watch?v=dV9C2eIo5QQ) | [targets: tar_cue(): Declare the rules that mark a target as outdated.](../../sources/source_dV9C2eIo5QQ_targets-tar-cue-declare-the-rules-that-mark-a-target-as-outdated.md) | 185 | 2021-02-16T00:00:00Z |
| [jAkNwaGRku0](https://www.youtube.com/watch?v=jAkNwaGRku0) | [targets: Eexternal files and literate programming](../../sources/source_jAkNwaGRku0_targets-eexternal-files-and-literate-programming.md) | 178 | 2021-03-02T00:00:00Z |
| [lfhuO71ikQE](https://www.youtube.com/watch?v=lfhuO71ikQE) | [targets: debugging](../../sources/source_lfhuO71ikQE_targets-debugging.md) | 137 | 2021-03-09T00:00:00Z |
| [pbc6NX1n01Q](https://www.youtube.com/watch?v=pbc6NX1n01Q) | [targets: Introduction](../../sources/source_pbc6NX1n01Q_targets-introduction.md) | 2373 | 2021-02-02T00:00:00Z |
| [tLvRWRWeQK4](https://www.youtube.com/watch?v=tLvRWRWeQK4) | [WTF: Debugging R code](../../sources/source_tLvRWRWeQK4_wtf-debugging-r-code.md) | 56 | 2022-03-29T00:00:00Z |
## References

- Hadley Wickham — *R Packages* (Whole game, Documenting, Testing, CRAN)
- Hadley Wickham — *R for Data Science* (Workflow, EDA, ggplot2, dplyr)
- `usethis`, `devtools`, `roxygen2`, `pkgdown`, `targets`, `drake`, `ggplot2` documentation
