---
type: Playbook
title: CRAN Submission
description: Submitting R packages to CRAN, strong-style pair programming, R CMD check,
  and best practices
lang: en
tags:
- ds-incubator
generated:
  by: agent:okf-wiki-builder/1.0
  at: '2026-09-08T04:00:00Z'
status: draft
sources:
- id: BAS8yfLBnog
  resource: https://www.youtube.com/watch?v=BAS8yfLBnog
  title: 'Strong-style pair-programming: Submitting an R package to CRAN'
  author: process:yt-dlp
  usage_count: 638
  last_modified: '2020-03-16T00:00:00Z'
- id: C27MVWqWSMs
  resource: https://www.youtube.com/watch?v=C27MVWqWSMs
  title: 'R packages: The whole game'
  author: process:yt-dlp
  usage_count: 30
  last_modified: '2020-02-01T00:00:00Z'
- id: O_tkgjsUT6g
  resource: https://www.youtube.com/watch?v=O_tkgjsUT6g
  title: 'Shiny: Packages'
  author: process:yt-dlp
  usage_count: 59
  last_modified: '2021-08-03T00:00:00Z'
- id: OofNbCXEVgU
  resource: https://www.youtube.com/watch?v=OofNbCXEVgU
  title: Gitflow workflow
  author: process:yt-dlp
  usage_count: 162
  last_modified: '2021-05-25T00:00:00Z'
- id: UR4vwDkJMhc
  resource: https://www.youtube.com/watch?v=UR4vwDkJMhc
  title: Pair programming
  author: process:yt-dlp
  usage_count: 8
  last_modified: '2020-03-10T00:00:00Z'
- id: XG8DetPZP4c
  resource: https://www.youtube.com/watch?v=XG8DetPZP4c
  title: 'wtf: Installing R packages (part 1)'
  author: process:yt-dlp
  usage_count: 84
  last_modified: '2022-03-15T00:00:00Z'
- id: moAei68dxr0
  resource: https://www.youtube.com/watch?v=moAei68dxr0
  title: 'ds.rpy: Running Python code from RStudio'
  author: process:yt-dlp
  usage_count: 373
  last_modified: '2022-07-26T00:00:00Z'
- id: nSJT8NGhSTs
  resource: https://www.youtube.com/watch?v=nSJT8NGhSTs
  title: Ejemplo de "mejores practicas" de Git
  author: process:yt-dlp
  usage_count: 110
  last_modified: '2020-12-22T00:00:00Z'
- id: ovbwghDjxV8
  resource: https://www.youtube.com/watch?v=ovbwghDjxV8
  title: 'r2dii.data and r2dii.match are now on CRAN: Demo and Q&A'
  author: process:yt-dlp
  usage_count: 91
  last_modified: '2020-03-31T00:00:00Z'
---
# CRAN Submission

## Overview

Submitting to CRAN is presented as a pair-programming exercise in quality and communication. [source_BAS8yfLBnog](../../sources/source_BAS8yfLBnog_strong-style-pair-programming-submitting-an-r-package-to-cran.md) walks a strong-style pair through the full submission of a 2degrees package (including the `ovbwghDjxV8` r2dii demo), while [source_C27MVWqWSMs](../../sources/source_C27MVWqWSMs_r-packages-the-whole-game.md) and [source_O_tkgjsUT6g](../../sources/source_O_tkgjsUT6g_shiny-packages.md) set up the `R CMD check --as-cran` preconditions. CRAN is not just a repository but a contract: `R CMD check` with zero `ERROR`/`WARNING`/`NOTE` that matter, and a maintainer who responds to human feedback.

The series stresses that CRAN submission is not a solo `devtools::release()` click but a rehearsal of the whole game (check, document, test, git) plus human coordination.

## Key Concepts

- **Pre-flight checks**: `devtools::check()` → `R CMD check` via Build tab; `usethis::use_mit_license()` / GPL-3 for license, roxygen `man/` present, `NAMESPACE` with exports, `tests/` passing — [source_C27MVWqWSMs](../../sources/source_C27MVWqWSMs_r-packages-the-whole-game.md).
- **Strong-style pair programming**: driver writes `R CMD check` fixes while navigator reviews each change aloud; applied to CRAN fixes in [source_BAS8yfLBnog](../../sources/source_BAS8yfLBnog_strong-style-pair-programming-submitting-an-r-package-to-cran.md) — see also [Pairs Programming and Strong Style](../data/pairs-programming.md) and [Code Reviews](../communication/code-reviews.md).
- **CRAN policies**: no `NOTE` about large files, no writing outside `tempdir()` in examples/tests, `Authors@R` with contributors, `Version` bump via `fledge::bump_version()` → `finalize_version()` — [source_BAS8yfLBnog](../../sources/source_BAS8yfLBnog_strong-style-pair-programming-submitting-an-r-package-to-cran.md).
- **r2dii case study**: `r2dii.data` and `r2dii.match` submitted together; demo and Q&A on review feedback, timelines, and resubmission in [source_ovbwghDjxV8](../../sources/source_ovbwghDjxV8_r2dii-data-and-r2dii-match-are-now-on-cran-demo-and-q-a.md) — see [r2dii Packages on CRAN](../data/r2dii-packages.md).
- **Git hygiene for release**: `use_github_action("check-standard")` on CI must be green; release branch → squash merge → tag `v1.0.0`; GitHub permissions briefing in [source_z4RAuGrAm8c](../../sources/source_z4RAuGrAm8c_access-permissions-for-a-github-organization.md) — see [GitHub Workflow](../git/github-workflow.md).
- **Installation after CRAN**: `install.packages("r2dii.plot")` vs `pak::pak("2degreesinvesting/r2dii.plot")` for non-CRAN; `WTF installing R packages` in [source_XG8DetPZP4c](../../sources/source_XG8DetPZP4c_wtf-installing-r-packages-part-1.md) and [source_9yrckf6Km-U](../../sources/source_9yrckf6Km-U_wtf-installing-r-packages-part-2.md).

## Submission Checklist

- `devtools::check()` and `R CMD check --as-cran` local passes with 0/0/0.
- `usethis::use_cran_comments()` draft `cran-comments.md` (tests, revdeps, platforms).
- `devtools::release()` or `usethis::use_release_issue()` for the CRAN checklist.
- Respond to CRAN email; fix → bump patch → resubmit.

## Sources

| Video | Title | Views | Last Modified |
| [BAS8yfLBnog](https://www.youtube.com/watch?v=BAS8yfLBnog) | [Strong-style pair-programming: Submitting an R package to CRAN](../../sources/source_BAS8yfLBnog_strong-style-pair-programming-submitting-an-r-package-to-cran.md) | 638 | 2020-03-16T00:00:00Z |
| [C27MVWqWSMs](https://www.youtube.com/watch?v=C27MVWqWSMs) | [R packages: The whole game](../../sources/source_C27MVWqWSMs_r-packages-the-whole-game.md) | 30 | 2020-02-01T00:00:00Z |
| [O](https://www.youtube.com/watch?v=O) | [Shiny: Packages](../../sources/source_O_tkgjsUT6g_shiny-packages.md) | 59 | 2021-08-03T00:00:00Z |
| [OofNbCXEVgU](https://www.youtube.com/watch?v=OofNbCXEVgU) | [Gitflow workflow](../../sources/source_OofNbCXEVgU_gitflow-workflow.md) | 162 | 2021-05-25T00:00:00Z |
| [UR4vwDkJMhc](https://www.youtube.com/watch?v=UR4vwDkJMhc) | [Pair programming](../../sources/source_UR4vwDkJMhc_pair-programming.md) | 8 | 2020-03-10T00:00:00Z |
| [XG8DetPZP4c](https://www.youtube.com/watch?v=XG8DetPZP4c) | [wtf: Installing R packages (part 1)](../../sources/source_XG8DetPZP4c_wtf-installing-r-packages-part-1.md) | 84 | 2022-03-15T00:00:00Z |
| [moAei68dxr0](https://www.youtube.com/watch?v=moAei68dxr0) | [ds.rpy: Running Python code from RStudio](../../sources/source_moAei68dxr0_ds-rpy-running-python-code-from-rstudio.md) | 373 | 2022-07-26T00:00:00Z |
| [nSJT8NGhSTs](https://www.youtube.com/watch?v=nSJT8NGhSTs) | [Ejemplo de \](../../sources/source_nSJT8NGhSTs_ejemplo-de-mejores-practicas-de-git.md) | 110 | 2020-12-22T00:00:00Z |
| [ovbwghDjxV8](https://www.youtube.com/watch?v=ovbwghDjxV8) | [r2dii.data and r2dii.match are now on CRAN: Demo and Q&A](../../sources/source_ovbwghDjxV8_r2dii-data-and-r2dii-match-are-now-on-cran-demo-and-q-a.md) | 91 | 2020-03-31T00:00:00Z |
## References

- Hadley Wickham — *R Packages* (Whole game, Documenting, Testing, CRAN)
- Hadley Wickham — *R for Data Science* (Workflow, EDA, ggplot2, dplyr)
- `usethis`, `devtools`, `roxygen2`, `pkgdown`, `targets`, `drake`, `ggplot2` documentation
