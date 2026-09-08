---
type: Playbook
title: Project-Oriented Workflow
description: Setting up projects, project management on GitHub, daily standups, and
  organization strategies
lang: en
tags:
- ds-incubator
generated:
  by: agent:okf-wiki-builder/1.0
  at: '2026-09-08T04:00:00Z'
status: draft
sources:
- id: 5wHl9N4fBBU
  resource: https://www.youtube.com/watch?v=5wHl9N4fBBU
  title: 'ds.production: From an MVP to production'
  author: process:yt-dlp
  usage_count: 87
  last_modified: '2023-06-17T00:00:00Z'
- id: TEUbVjhooIg
  resource: https://www.youtube.com/watch?v=TEUbVjhooIg
  title: Project-oriented workflow
  author: process:yt-dlp
  usage_count: 32
  last_modified: '2020-01-14T00:00:00Z'
- id: YlBnarQNRR8
  resource: https://www.youtube.com/watch?v=YlBnarQNRR8
  title: 'tidy EDA: Defensive workflow'
  author: process:yt-dlp
  usage_count: 43
  last_modified: '2021-10-26T00:00:00Z'
- id: cKAXDJq5ZdA
  resource: https://www.youtube.com/watch?v=cKAXDJq5ZdA
  title: 'wtf: Holistic workflow (part 1)'
  author: process:yt-dlp
  usage_count: 46
  last_modified: '2022-02-08T00:00:00Z'
- id: ek3b0m1iCdk
  resource: https://www.youtube.com/watch?v=ek3b0m1iCdk
  title: 'wtf: Holistic workflow (part 2)'
  author: process:yt-dlp
  usage_count: 14
  last_modified: '2022-02-15T00:00:00Z'
- id: wJnI0F_A-bU
  resource: https://www.youtube.com/watch?v=wJnI0F_A-bU
  title: Creating reproducible examples
  author: process:yt-dlp
  usage_count: 13
  last_modified: '2019-12-10T00:00:00Z'
---

# Project-Oriented Workflow

## Overview

Project-oriented workflow (Jenny Bryan) is the antidote to `setwd("/Users/me/..."`): one project = one folder = one `.Rproj` with `here::here()` and relative paths, making code portable across machines and cloud. Anchors are [source_TEUbVjhooIg](../../sources/source_TEUbVjhooIg_project-oriented-workflow.md) (core), [source_cKAXDJq5ZdA](../../sources/source_cKAXDJq5ZdA_wtf-holistic-workflow-part-1.md) / [source_ek3b0m1iCdk](../../sources/source_ek3b0m1iCdk_wtf-holistic-workflow-part-2.md) (holistic naming/organizing), plus [source_YlBnarQNRR8](../../sources/source_YlBnarQNRR8_tidy-eda-defensive-workflow.md) defensive and [source_5wHl9N4fBBU](../../sources/source_5wHl9N4fBBU_ds-production-from-an-mvp-to-production.md) production framing.

Underpins [Reproducible Workflows](../pipelines/reproducible-workflows.md), [Docker Fundamentals](../docker/docker-fundamentals.md), [Git Fundamentals](../git/git-fundamentals.md); paired with [GitHub Issues Workflow](../data/github-issues-workflow.md).

## Key Concepts

- **Project vs script** ([source_TEUbVjhooIg](../../sources/source_TEUbVjhooIg_project-oriented-workflow.md)): `.Rproj` (or `here` root) anchors working directory; open project not file; `here::here("data","raw.csv")` replaces `setwd` + absolute paths.
- **Naming & structure** ([source_cKAXDJq5ZdA](../../sources/source_cKAXDJq5ZdA_wtf-holistic-workflow-part-1.md), [source_xW05GsfhuiY](../../sources/source_xW05GsfhuiY_wtf-name-and-organize-files.md)): `01_import.R` / `02_tidy.R`, `data/`, `R/`, `output/`; BIDS-like `snake_case`, avoid spaces, use `fs` for safe paths.
- **Defensive overlay** ([source_YlBnarQNRR8](../../sources/source_YlBnarQNRR8_tidy-eda-defensive-workflow.md)): `usethis::use_blank_slate()` + restart, `renv` lock, `.Rprofile` minimal; `testthat` guards for pipeline.
- **Holistic workflow** ([source_ek3b0m1iCdk](../../sources/source_ek3b0m1iCdk_wtf-holistic-workflow-part-2.md)): draft raw → tidy → polish → production; same project scales via `targets`/`drake` — see [Reproducible Workflows](../pipelines/reproducible-workflows.md).
- **GitHub integration** ([source_TEUbVjhooIg](../../sources/source_TEUbVjhooIg_project-oriented-workflow.md), [source_qqKhQdejUOM](../../sources/source_qqKhQdejUOM_project-management-on-github.md)): one repo per project, Issues + Projects board — see [GitHub Workflow](../git/github-workflow.md).

## Example

```r
usethis::create_project("myanalysis", open=TRUE)  # creates myanalysis.Rproj
# inside myanalysis/
here::here("data","raw.csv")  # instead of setwd
# R/01_import.R -> data/raw.csv -> data/clean.rds via here::here()
fs::dir_tree()
```
```r
# .Rprofile
# usethis::use_blank_slate()  # no .RData restore
```

## Sources

| Video | Title | Views | Last Modified |
|---|---|---|---|
| [5wHl9N4fBBU](https://www.youtube.com/watch?v=5wHl9N4fBBU) | [ds.production: From an MVP to production](../../sources/source_5wHl9N4fBBU_ds-production-from-an-mvp-to-production.md) | 87 | 2023-06-17T00:00:00Z |
| [TEUbVjhooIg](https://www.youtube.com/watch?v=TEUbVjhooIg) | [Project-oriented workflow](../../sources/source_TEUbVjhooIg_project-oriented-workflow.md) | 32 | 2020-01-14T00:00:00Z |
| [YlBnarQNRR8](https://www.youtube.com/watch?v=YlBnarQNRR8) | [tidy EDA: Defensive workflow](../../sources/source_YlBnarQNRR8_tidy-eda-defensive-workflow.md) | 43 | 2021-10-26T00:00:00Z |
| [cKAXDJq5ZdA](https://www.youtube.com/watch?v=cKAXDJq5ZdA) | [wtf: Holistic workflow (part 1)](../../sources/source_cKAXDJq5ZdA_wtf-holistic-workflow-part-1.md) | 46 | 2022-02-08T00:00:00Z |
| [ek3b0m1iCdk](https://www.youtube.com/watch?v=ek3b0m1iCdk) | [wtf: Holistic workflow (part 2)](../../sources/source_ek3b0m1iCdk_wtf-holistic-workflow-part-2.md) | 14 | 2022-02-15T00:00:00Z |
| [wJnI0F_A-bU](https://www.youtube.com/watch?v=wJnI0F_A-bU) | [Creating reproducible examples](../../sources/source_wJnI0F_A-bU_creating-reproducible-examples.md) | 13 | 2019-12-10T00:00:00Z |

## References

- Jenny Bryan — Project-oriented workflow (rstats.wtf)
- here package documentation
- WTF Holistic Workflow slides

