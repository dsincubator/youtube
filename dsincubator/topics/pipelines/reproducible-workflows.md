---
type: Playbook
title: Reproducible Workflows
description: 'General principles of reproducible research: from scripts to pipelines,
  memoization, and workflow automation'
lang: en
tags:
- ds-incubator
generated:
  by: agent:okf-wiki-builder/1.0
  at: '2026-09-08T04:00:00Z'
status: draft
sources:
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
- id: OieR0VDxSRk
  resource: https://www.youtube.com/watch?v=OieR0VDxSRk
  title: 'docker: use cases'
  author: process:yt-dlp
  usage_count: 312
  last_modified: '2021-09-07T00:00:00Z'
- id: SXEXcXE6Ke0
  resource: https://www.youtube.com/watch?v=SXEXcXE6Ke0
  title: Moving from a sequence of scripts to a pipeline of functions
  author: process:yt-dlp
  usage_count: 617
  last_modified: '2021-02-09T00:00:00Z'
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
- id: _Cl4odbiG78
  resource: https://www.youtube.com/watch?v=_Cl4odbiG78
  title: Using drake to develop smart, reproducible workflows
  author: process:yt-dlp
  usage_count: 13
  last_modified: '2020-05-05T00:00:00Z'
- id: cKAXDJq5ZdA
  resource: https://www.youtube.com/watch?v=cKAXDJq5ZdA
  title: 'wtf: Holistic workflow (part 1)'
  author: process:yt-dlp
  usage_count: 46
  last_modified: '2022-02-08T00:00:00Z'
- id: dV9C2eIo5QQ
  resource: https://www.youtube.com/watch?v=dV9C2eIo5QQ
  title: 'targets: tar_cue(): Declare the rules that mark a target as outdated.'
  author: process:yt-dlp
  usage_count: 185
  last_modified: '2021-02-16T00:00:00Z'
- id: ek3b0m1iCdk
  resource: https://www.youtube.com/watch?v=ek3b0m1iCdk
  title: 'wtf: Holistic workflow (part 2)'
  author: process:yt-dlp
  usage_count: 14
  last_modified: '2022-02-15T00:00:00Z'
- id: erv1yJaNID8
  resource: https://www.youtube.com/watch?v=erv1yJaNID8
  title: 'reprex: overview'
  author: process:yt-dlp
  usage_count: 78
  last_modified: '2021-10-05T00:00:00Z'
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
- id: wJnI0F_A-bU
  resource: https://www.youtube.com/watch?v=wJnI0F_A-bU
  title: Creating reproducible examples
  author: process:yt-dlp
  usage_count: 13
  last_modified: '2019-12-10T00:00:00Z'
---
# Reproducible Workflows

## Overview

Reproducible workflows are the through-line from scripts → functions → pipelines → reproducible communication. The series teaches that reproducibility is not a single tool but a stack: project structure + dependency management + pipeline caching + literate reporting + version control. Sources span [source_SXEXcXE6Ke0](../../sources/source_SXEXcXE6Ke0_moving-from-a-sequence-of-scripts-to-a-pipeline-of-functions.md) (the "sequence of scripts" anti-pattern), [source_GDgir1XXOkw](../../sources/source_GDgir1XXOkw_avoid-recomputing-if-you-can-instead-memoise.md) (memoise as single-function cache), the `targets`/`drake` pipeline introductions ([source_pbc6NX1n01Q](../../sources/source_pbc6NX1n01Q_targets-introduction.md), [source__Cl4odbiG78](../../sources/source__Cl4odbiG78_using-drake-to-develop-smart-reproducible-workflows.md)), defensive workflow ([source_YlBnarQNRR8](../../sources/source_YlBnarQNRR8_tidy-eda-defensive-workflow.md)), holistic workflow (`WTF` 1/2 in [source_cKAXDJq5ZdA](../../sources/source_cKAXDJq5ZdA_wtf-holistic-workflow-part-1.md), [source_ek3b0m1iCdk](../../sources/source_ek3b0m1iCdk_wtf-holistic-workflow-part-2.md)), and reprex ([source_wJnI0F_A-bU](../../sources/source_wJnI0F_A-bU_creating-reproducible-examples.md), [source_erv1yJaNID8](../../sources/source_erv1yJaNID8_reprex-overview.md)).

The playbook collects these into a lifecycle usable for both exploratory analysis and CRAN-grade packages.

## Key Concepts

- **From scripts to functions to pipelines**: move copy-pasted script blocks into `R/functions.R` and `source()` them; then declare dependencies in `_targets.R` so `tar_make()` controls order — [source_SXEXcXE6Ke0](../../sources/source_SXEXcXE6Ke0_moving-from-a-sequence-of-scripts-to-a-pipeline-of-functions.md) and [source__Cl4odbiG78](../../sources/source__Cl4odbiG78_using-drake-to-develop-smart-reproducible-workflows.md).
- **Memoization vs pipeline caching**: `memoise::memoise()` caches one function; `targets`/`drake` caches the whole DAG — [source_GDgir1XXOkw](../../sources/source_GDgir1XXOkw_avoid-recomputing-if-you-can-instead-memoise.md); see [targets Introduction](../pipelines/targets-introduction.md).
- **Defensive and holistic workflows**: minimize project path pain with `here`/RStudio Project in [source_YlBnarQNRR8](../../sources/source_YlBnarQNRR8_tidy-eda-defensive-workflow.md) and [source_cKAXDJq5ZdA](../../sources/source_cKAXDJq5ZdA_wtf-holistic-workflow-part-1.md); name and organize files for reproducibility — [source_xW05GsfhuiY](../../sources/source_xW05GsfhuiY_wtf-name-and-organize-files.md).
- **Literate programming**: external files and reports as targets (`format = "file"`, `tar_render()`-style) so a report rebuilds only when data changes — [source_jAkNwaGRku0](../../sources/source_jAkNwaGRku0_targets-eexternal-files-and-literate-programming.md); see [targets Advanced Topics](../pipelines/targets-advanced.md).
- **Debugging reproducibly**: `tar_workspace()`, `tar_load()`-style inspection, and systematic debugging workflows — [source_lfhuO71ikQE](../../sources/source_lfhuO71ikQE_targets-debugging.md) and [source_TEUbVjhooIg](../../sources/source_TEUbVjhooIg_project-oriented-workflow.md) — see [Debugging Workflows](../workflow/debugging-workflows.md).
- **Reprex as minimal reproducibility**: `reprex::reprex()` for shareable bugs; see [source_wJnI0F_A-bU](../../sources/source_wJnI0F_A-bU_creating-reproducible-examples.md) and [Reproducible Examples](../communication/reprex.md).
- **Project-oriented workflow**: the container for reproducibility — see [Project-Oriented Workflow](../workflow/project-oriented-workflow.md) and [Creating R Packages](../r-packages/creating-packages.md).

## Lifecycle

1. **Structure**: RStudio Project + `here` + `renv`; `R/`, `data/`, `_targets.R`.
2. **Functions**: extract script chunks to `R/functions.R`.
3. **Pipeline**: `_targets.R` declares `tar_target()`s; `tar_make()` / `tar_outdated()` govern builds.
4. **Report**: R Markdown/Quarto downstream target.
5. **Share**: Git + CI + `reprex` for issues.

## Sources

| Video | Title | Views | Last Modified |
| [0qUs4hi7ozo](https://www.youtube.com/watch?v=0qUs4hi7ozo) | [Retrospective about meetups in 2020: Response](../../sources/source_0qUs4hi7ozo_retrospective-about-meetups-in-2020-response.md) | 6 | 2021-01-19T00:00:00Z |
| [EmDubkF8DpQ](https://www.youtube.com/watch?v=EmDubkF8DpQ) | [targets: Introducción](../../sources/source_EmDubkF8DpQ_targets-introduccion.md) | 73 | 2021-02-02T00:00:00Z |
| [GDgir1XXOkw](https://www.youtube.com/watch?v=GDgir1XXOkw) | [Avoid recomputing if you can! Instead memoise](../../sources/source_GDgir1XXOkw_avoid-recomputing-if-you-can-instead-memoise.md) | 43 | 2024-06-06T00:00:00Z |
| [OieR0VDxSRk](https://www.youtube.com/watch?v=OieR0VDxSRk) | [docker: use cases](../../sources/source_OieR0VDxSRk_docker-use-cases.md) | 312 | 2021-09-07T00:00:00Z |
| [SXEXcXE6Ke0](https://www.youtube.com/watch?v=SXEXcXE6Ke0) | [Moving from a sequence of scripts to a pipeline of functions](../../sources/source_SXEXcXE6Ke0_moving-from-a-sequence-of-scripts-to-a-pipeline-of-functions.md) | 617 | 2021-02-09T00:00:00Z |
| [TEUbVjhooIg](https://www.youtube.com/watch?v=TEUbVjhooIg) | [Project-oriented workflow](../../sources/source_TEUbVjhooIg_project-oriented-workflow.md) | 32 | 2020-01-14T00:00:00Z |
| [YlBnarQNRR8](https://www.youtube.com/watch?v=YlBnarQNRR8) | [tidy EDA: Defensive workflow](../../sources/source_YlBnarQNRR8_tidy-eda-defensive-workflow.md) | 43 | 2021-10-26T00:00:00Z |
| [_Cl4odbiG78](https://www.youtube.com/watch?v=_Cl4odbiG78) | [Using drake to develop smart, reproducible workflows](../../sources/source__Cl4odbiG78_using-drake-to-develop-smart-reproducible-workflows.md) | 13 | 2020-05-05T00:00:00Z |
| [cKAXDJq5ZdA](https://www.youtube.com/watch?v=cKAXDJq5ZdA) | [wtf: Holistic workflow (part 1)](../../sources/source_cKAXDJq5ZdA_wtf-holistic-workflow-part-1.md) | 46 | 2022-02-08T00:00:00Z |
| [dV9C2eIo5QQ](https://www.youtube.com/watch?v=dV9C2eIo5QQ) | [targets: tar_cue(): Declare the rules that mark a target as outdated.](../../sources/source_dV9C2eIo5QQ_targets-tar-cue-declare-the-rules-that-mark-a-target-as-outdated.md) | 185 | 2021-02-16T00:00:00Z |
| [ek3b0m1iCdk](https://www.youtube.com/watch?v=ek3b0m1iCdk) | [wtf: Holistic workflow (part 2)](../../sources/source_ek3b0m1iCdk_wtf-holistic-workflow-part-2.md) | 14 | 2022-02-15T00:00:00Z |
| [erv1yJaNID8](https://www.youtube.com/watch?v=erv1yJaNID8) | [reprex: overview](../../sources/source_erv1yJaNID8_reprex-overview.md) | 78 | 2021-10-05T00:00:00Z |
| [jAkNwaGRku0](https://www.youtube.com/watch?v=jAkNwaGRku0) | [targets: Eexternal files and literate programming](../../sources/source_jAkNwaGRku0_targets-eexternal-files-and-literate-programming.md) | 178 | 2021-03-02T00:00:00Z |
| [lfhuO71ikQE](https://www.youtube.com/watch?v=lfhuO71ikQE) | [targets: debugging](../../sources/source_lfhuO71ikQE_targets-debugging.md) | 137 | 2021-03-09T00:00:00Z |
| [pbc6NX1n01Q](https://www.youtube.com/watch?v=pbc6NX1n01Q) | [targets: Introduction](../../sources/source_pbc6NX1n01Q_targets-introduction.md) | 2373 | 2021-02-02T00:00:00Z |
| [wJnI0F](https://www.youtube.com/watch?v=wJnI0F) | [Creating reproducible examples](../../sources/source_wJnI0F_A-bU_creating-reproducible-examples.md) | 13 | 2019-12-10T00:00:00Z |
## References

- Hadley Wickham — *R Packages* (Whole game, Documenting, Testing, CRAN)
- Hadley Wickham — *R for Data Science* (Workflow, EDA, ggplot2, dplyr)
- `usethis`, `devtools`, `roxygen2`, `pkgdown`, `targets`, `drake`, `ggplot2` documentation
