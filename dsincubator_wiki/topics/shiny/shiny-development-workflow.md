---
type: Playbook
title: Shiny Development Workflow
description: Best practices for Shiny development, project structure, and iterative
  development
lang: en
tags:
- ds-incubator
generated:
  by: agent:okf-wiki-builder/1.0
  at: '2026-09-08T04:00:00Z'
status: draft
sources:
- id: 9JcJFber21w
  resource: https://www.youtube.com/watch?v=9JcJFber21w
  title: 'Testing: Introduction'
  author: process:yt-dlp
  usage_count: 59
  last_modified: '2021-03-30T00:00:00Z'
- id: O_tkgjsUT6g
  resource: https://www.youtube.com/watch?v=O_tkgjsUT6g
  title: 'Shiny: Packages'
  author: process:yt-dlp
  usage_count: 59
  last_modified: '2021-08-03T00:00:00Z'
- id: lq6ZhPFVLTY
  resource: https://www.youtube.com/watch?v=lq6ZhPFVLTY
  title: 'Shiny: development workflow'
  author: process:yt-dlp
  usage_count: 54
  last_modified: '2021-07-20T00:00:00Z'
- id: yMPV9TPH3GI
  resource: https://www.youtube.com/watch?v=yMPV9TPH3GI
  title: 'Testing: Basic structure and  basic workflow'
  author: process:yt-dlp
  usage_count: 37
  last_modified: '2021-04-06T00:00:00Z'
---

# Shiny Development Workflow

## Overview

Iterative Shiny development is framed as the tidyverse's "prototype raw, then harden" loop applied to UI/server: sketch with `app.R`, extract helpers, add `golem` modules, test with `testServer`, and loop via version control. Anchors are [source_lq6ZhPFVLTY](../../sources/source_lq6ZhPFVLTY_shiny-development-workflow.md) plus testing anchors ([source_9JcJFber21w](../../sources/source_9JcJFber21w_testing-introduction.md), [source_yMPV9TPH3GI](../../sources/source_yMPV9TPH3GI_testing-basic-structure-and-basic-workflow.md), [source_O_tkgjsUT6g](../../sources/source_O_tkgjsUT6g_shiny-packages.md)).

Depends on [Shiny Fundamentals](../shiny/shiny-basics.md) and [Shiny Packages](../shiny/shiny-packages.md); debug via [Shiny Debugging](../shiny/shiny-debugging.md); ship via [Shiny Publishing](../shiny/shiny-publishing.md).

## Key Concepts

- **Sketch → module** ([source_lq6ZhPFVLTY](../../sources/source_lq6ZhPFVLTY_shiny-development-workflow.md)): start `app.R` with `fluidPage` + `sliderInput`; once `server` exceeds ~50 lines, extract to `R/mod_*.R` via `golem::add_module`.
- **Load-test loop** ([source_lq6ZhPFVLTY](../../sources/source_lq6ZhPFVLTY_shiny-development-workflow.md), [source_yMPV9TPH3GI](../../sources/source_yMPV9TPH3GI_testing-basic-structure-and-basic-workflow.md)): `devtools::load_all()` → `runApp()` → `testServer`/`testthat` → commit; RStudio's Run App + Jobs pane keeps reload fast.
- **Reactive test harness** ([source_O_tkgjsUT6g](../../sources/source_O_tkgjsUT6g_shiny-packages.md), [source_9JcJFber21w](../../sources/source_9JcJFber21w_testing-introduction.md)): `shiny::testServer(mod_my_server, { session$setInputs(x=1); expect_equal(output$y, "1") })` for integration without browser.
- **Version control hygiene** ([source_lq6ZhPFVLTY](../../sources/source_lq6ZhPFVLTY_shiny-development-workflow.md), [source_OofNbCXEVgU](../../sources/source_OofNbCXEVgU_gitflow-workflow.md)): feature branches per module, `git commit` with conventional messages, PR via `usethis::pr_*`; see [Gitflow Workflow](../git/gitflow-workflow.md).
- **Polish → production** ([source_lq6ZhPFVLTY](../../sources/source_lq6ZhPFVLTY_shiny-development-workflow.md), [source_PRKOMCCOlI0](../../sources/source_PRKOMCCOlI0_continuously-build-and-deploy-a-shiny-app-on-google-cloud-run.md)): `golem` + `renv` lock + Docker (`rocker/shiny`) → deploy to shinyapps.io or Cloud Run — see [Google Cloud Run](../cloud/google-cloud-run.md).

## Example

```r
# iteration
devtools::load_all(); shiny::runApp()  # tweak UI
shiny::testServer(my_mod_server, {
  session$setInputs(n=10)
  stopifnot(nrow(result())==10)
})
golem::add_module("new_feature")
# publish when green
rsconnect::deployApp()  # or docker build -> Cloud Run
```

## Sources

| Video | Title | Views | Last Modified |
|---|---|---|---|
| [9JcJFber21w](https://www.youtube.com/watch?v=9JcJFber21w) | [Testing: Introduction](../../sources/source_9JcJFber21w_testing-introduction.md) | 59 | 2021-03-30T00:00:00Z |
| [O_tkgjsUT6g](https://www.youtube.com/watch?v=O_tkgjsUT6g) | [Shiny: Packages](../../sources/source_O_tkgjsUT6g_shiny-packages.md) | 59 | 2021-08-03T00:00:00Z |
| [lq6ZhPFVLTY](https://www.youtube.com/watch?v=lq6ZhPFVLTY) | [Shiny: development workflow](../../sources/source_lq6ZhPFVLTY_shiny-development-workflow.md) | 54 | 2021-07-20T00:00:00Z |
| [yMPV9TPH3GI](https://www.youtube.com/watch?v=yMPV9TPH3GI) | [Testing: Basic structure and  basic workflow](../../sources/source_yMPV9TPH3GI_testing-basic-structure-and-basic-workflow.md) | 37 | 2021-04-06T00:00:00Z |

## References

- Mastering Shiny Ch. Workflow
- golem documentation
- usethis workflow vignette

