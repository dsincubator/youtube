---
type: Attested Computation
title: Drake Workflows
description: 'Using drake for reproducible data analysis workflows: plans, caching,
  dependency tracking, visualization'
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
- id: TEUbVjhooIg
  resource: https://www.youtube.com/watch?v=TEUbVjhooIg
  title: Project-oriented workflow
  author: process:yt-dlp
  usage_count: 32
  last_modified: '2020-01-14T00:00:00Z'
- id: _Cl4odbiG78
  resource: https://www.youtube.com/watch?v=_Cl4odbiG78
  title: Using drake to develop smart, reproducible workflows
  author: process:yt-dlp
  usage_count: 13
  last_modified: '2020-05-05T00:00:00Z'
---
# Drake Workflows

## Overview

`drake` is the predecessor to `targets` and the subject of the incubator's first pipeline meetup, [source__Cl4odbiG78](../../sources/source__Cl4odbiG78_using-drake-to-develop-smart-reproducible-workflows.md), presented alongside the workflow principles in [source_TEUbVjhooIg](../../sources/source_TEUbVjhooIg_project-oriented-workflow.md). The concepts transfer directly to `targets` (drake's successor): declare a plan of targets, let the package track dependencies, cache results, and rebuild only what changed, so a team can trust that `make()` produced the claimed outputs.

The talk situates drake inside the project-oriented workflow (here package, `here::here()`, `renv`/`packrat` for reproducibility) and argues that data science code should move from a loose sequence of scripts to a dependency-aware pipeline of functions.

## Key Concepts

- **Plan as code**: `drake::drake_plan(data = read_data(), summary = summarise(data))` declares the DAG; `make(plan)` executes in order; `readd(data)` (now `tar_read()` in targets) retrieves — [source__Cl4odbiG78](../../sources/source__Cl4odbiG78_using-drake-to-develop-smart-reproducible-workflows.md).
- **Caching and dependency tracking**: drake stores objects in `.drake/` (targets uses `_targets/`), hashes commands and dependencies, and skips up-to-date targets — [source__Cl4odbiG78](../../sources/source__Cl4odbiG78_using-drake-to-develop-smart-reproducible-workflows.md).
- **Visualization**: `vis_drake_graph()` / `drake_config()` previews the build order, analogous to `tar_glimpse()` / `tar_network()` — [source__Cl4odbiG78](../../sources/source__Cl4odbiG78_using-drake-to-develop-smart-reproducible-workflows.md).
- **Migration to targets**: `targets` reuses the same ideas with `_targets.R` + `tar_target()` + `tar_make()`; see [targets Introduction](../pipelines/targets-introduction.md) and [targets Advanced Topics](../pipelines/targets-advanced.md) for the current API.
- **Project context**: drake workflows live inside a project with `here`, RStudio Project, and versioned data; see [Project-Oriented Workflow](../workflow/project-oriented-workflow.md) and [Reproducible Workflows](../pipelines/reproducible-workflows.md).

## Attested Computation

- **Runtime**: `r`
- **Computation type**: `pipeline`
- **Attestation**: drake's `.drake/` cache (and targets' `_targets/`) attests each build: `make()` is idempotent when inputs are unchanged. Verify by running `drake::outdated(plan)` (or `tar_outdated()`) before and after a change; the reported set should match the edited branch. `vis_drake_graph()` attests the dependency structure before execution.

```r
library(drake)
plan <- drake_plan(
  raw  = read_data("data/file.csv"),
  data = clean(raw)
)
make(plan)
readd(data)
vis_drake_graph(config = drake_config(plan))
# targets equivalent
# tar_make(); tar_read(data); tar_glimpse()
```

## Sources

| Video | Title | Views | Last Modified |
| [TEUbVjhooIg](https://www.youtube.com/watch?v=TEUbVjhooIg) | [Project-oriented workflow](../../sources/source_TEUbVjhooIg_project-oriented-workflow.md) | 32 | 2020-01-14T00:00:00Z |
| [_Cl4odbiG78](https://www.youtube.com/watch?v=_Cl4odbiG78) | [Using drake to develop smart, reproducible workflows](../../sources/source__Cl4odbiG78_using-drake-to-develop-smart-reproducible-workflows.md) | 13 | 2020-05-05T00:00:00Z |
## References

- Hadley Wickham — *R Packages* (Whole game, Documenting, Testing, CRAN)
- Hadley Wickham — *R for Data Science* (Workflow, EDA, ggplot2, dplyr)
- `usethis`, `devtools`, `roxygen2`, `pkgdown`, `targets`, `drake`, `ggplot2` documentation
