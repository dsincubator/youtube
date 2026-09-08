---
type: Reference
title: Shiny Packages
description: Creating and using Shiny packages, extending Shiny functionality
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
- id: EB6ODnkdG7A
  resource: https://www.youtube.com/watch?v=EB6ODnkdG7A
  title: 'Shiny: Basic reactivity'
  author: process:yt-dlp
  usage_count: 64
  last_modified: '2021-07-13T00:00:00Z'
- id: F7JiD7oT4P8
  resource: https://www.youtube.com/watch?v=F7JiD7oT4P8
  title: 'RStudio Team: Demo and discussion'
  author: process:yt-dlp
  usage_count: 709
  last_modified: '2020-06-16T00:00:00Z'
- id: NgEocgBUH_A
  resource: https://www.youtube.com/watch?v=NgEocgBUH_A
  title: 'Shiny: Debugging'
  author: process:yt-dlp
  usage_count: 2326
  last_modified: '2021-07-27T00:00:00Z'
- id: O_tkgjsUT6g
  resource: https://www.youtube.com/watch?v=O_tkgjsUT6g
  title: 'Shiny: Packages'
  author: process:yt-dlp
  usage_count: 59
  last_modified: '2021-08-03T00:00:00Z'
- id: c3jANTGkB1U
  resource: https://www.youtube.com/watch?v=c3jANTGkB1U
  title: 'Shiny: Publishing'
  author: process:yt-dlp
  usage_count: 47
  last_modified: '2021-08-10T00:00:00Z'
- id: lq6ZhPFVLTY
  resource: https://www.youtube.com/watch?v=lq6ZhPFVLTY
  title: 'Shiny: development workflow'
  author: process:yt-dlp
  usage_count: 54
  last_modified: '2021-07-20T00:00:00Z'
- id: p-p_4ZcDIGw
  resource: https://www.youtube.com/watch?v=p-p_4ZcDIGw
  title: 'Shiny: Your first shiny app'
  author: process:yt-dlp
  usage_count: 275
  last_modified: '2021-06-01T00:00:00Z'
- id: uk-I5WrZsAc
  resource: https://www.youtube.com/watch?v=uk-I5WrZsAc
  title: 'Shiny: Wrap up and demo'
  author: process:yt-dlp
  usage_count: 19
  last_modified: '2021-08-17T00:00:00Z'
- id: yMPV9TPH3GI
  resource: https://www.youtube.com/watch?v=yMPV9TPH3GI
  title: 'Testing: Basic structure and  basic workflow'
  author: process:yt-dlp
  usage_count: 37
  last_modified: '2021-04-06T00:00:00Z'
---

# Shiny Packages

## Overview

Scaling Shiny beyond `app.R` means packaging: `golem`/`usethis` scaffold, `DESCRIPTION`/`NAMESPACE`, and modular helpers that are testable with `testthat`/`testServer`. Anchor is [source_O_tkgjsUT6g](../../sources/source_O_tkgjsUT6g_shiny-packages.md); context from [source_c3jANTGkB1U](../../sources/source_c3jANTGkB1U_shiny-publishing.md) (publish needs package deps), [source_lq6ZhPFVLTY](../../sources/source_lq6ZhPFVLTY_shiny-development-workflow.md) (workflow), and R packaging canon ([source_C27MVWqWSMs](../../sources/source_C27MVWqWSMs_r-packages-the-whole-game.md), [source_AFuVF0oWFMY](../../sources/source_AFuVF0oWFMY_creating-an-empty-r-package-up-to-the-best-standards.md)).

Requires [Shiny Fundamentals](../shiny/shiny-basics.md); use [Shiny Development Workflow](../shiny/shiny-development-workflow.md); package canon in [Creating R Packages](../r-packages/creating-packages.md).

## Key Concepts

- **Why package Shiny** ([source_O_tkgjsUT6g](../../sources/source_O_tkgjsUT6g_shiny-packages.md)): single `app.R` doesn't scale for helpers, data, and CI; package gives `R/` modules, `inst/app`, and `DESCRIPTION` versioning.
- **Scaffold** ([source_O_tkgjsUT6g](../../sources/source_O_tkgjsUT6g_shiny-packages.md), [source_AFuVF0oWFMY](../../sources/source_AFuVF0oWFMY_creating-an-empty-r-package-up-to-the-best-standards.md)): `usethis::create_package()` → `golem::create_golem()` or `usethis::use_package("shiny")`; modules via `golem::add_module("my_mod")` → `R/mod_my_mod.R` with `mod_my_mod_ui` / `mod_my_mod_server`.
- **Helpers as functions** ([source_O_tkgjsUT6g](../../sources/source_O_tkgjsUT6g_shiny-packages.md)): extract computation from `server` into pure `R/` functions (e.g., `filter_data()`) so `testthat` can unit-test without launching app; `testServer` for reactive integration.
- **Dependencies & deploy** ([source_O_tkgjsUT6g](../../sources/source_O_tkgjsUT6g_shiny-packages.md), [source_c3jANTGkB1U](../../sources/source_c3jANTGkB1U_shiny-publishing.md)): `usethis::use_package()` adds to `DESCRIPTION`; `renv`/`DESCRIPTION` ensures deployed image (Cloud Run / shinyapps.io) has same deps — see [Creating R Packages](../r-packages/creating-packages.md).
- **Docs & checks** ([source_FPZfMUwV73o](../../sources/source_FPZfMUwV73o_r-packages-documenting.md)): `roxygen2` for helpers, `R CMD check` in CI; links to [Package Documentation](../r-packages/package-documentation.md) and [Package Testing Infrastructure](../r-packages/package-testing.md).

## Example

```r
usethis::create_package("myapp")
# in myapp/
golem::create_golem(open=FALSE)
golem::add_module("filter")  # creates R/mod_filter.R
# R/mod_filter.R: mod_filter_ui <- function(id) ns <- NS(id); tagList(...)
#                 mod_filter_server <- function(id, data) moduleServer(id, function(input,output,session){...})
devtools::load_all(); shiny::runApp()
# test helper without Shiny
testthat::expect_equal(filter_data(mtcars, cyl=6), mtcars[mtcars$cyl==6,])
```

## Sources

| Video | Title | Views | Last Modified |
|---|---|---|---|
| [9JcJFber21w](https://www.youtube.com/watch?v=9JcJFber21w) | [Testing: Introduction](../../sources/source_9JcJFber21w_testing-introduction.md) | 59 | 2021-03-30T00:00:00Z |
| [EB6ODnkdG7A](https://www.youtube.com/watch?v=EB6ODnkdG7A) | [Shiny: Basic reactivity](../../sources/source_EB6ODnkdG7A_shiny-basic-reactivity.md) | 64 | 2021-07-13T00:00:00Z |
| [F7JiD7oT4P8](https://www.youtube.com/watch?v=F7JiD7oT4P8) | [RStudio Team: Demo and discussion](../../sources/source_F7JiD7oT4P8_rstudio-team-demo-and-discussion.md) | 709 | 2020-06-16T00:00:00Z |
| [NgEocgBUH_A](https://www.youtube.com/watch?v=NgEocgBUH_A) | [Shiny: Debugging](../../sources/source_NgEocgBUH_A_shiny-debugging.md) | 2326 | 2021-07-27T00:00:00Z |
| [O_tkgjsUT6g](https://www.youtube.com/watch?v=O_tkgjsUT6g) | [Shiny: Packages](../../sources/source_O_tkgjsUT6g_shiny-packages.md) | 59 | 2021-08-03T00:00:00Z |
| [c3jANTGkB1U](https://www.youtube.com/watch?v=c3jANTGkB1U) | [Shiny: Publishing](../../sources/source_c3jANTGkB1U_shiny-publishing.md) | 47 | 2021-08-10T00:00:00Z |
| [lq6ZhPFVLTY](https://www.youtube.com/watch?v=lq6ZhPFVLTY) | [Shiny: development workflow](../../sources/source_lq6ZhPFVLTY_shiny-development-workflow.md) | 54 | 2021-07-20T00:00:00Z |
| [p-p_4ZcDIGw](https://www.youtube.com/watch?v=p-p_4ZcDIGw) | [Shiny: Your first shiny app](../../sources/source_p-p_4ZcDIGw_shiny-your-first-shiny-app.md) | 275 | 2021-06-01T00:00:00Z |
| [uk-I5WrZsAc](https://www.youtube.com/watch?v=uk-I5WrZsAc) | [Shiny: Wrap up and demo](../../sources/source_uk-I5WrZsAc_shiny-wrap-up-and-demo.md) | 19 | 2021-08-17T00:00:00Z |
| [yMPV9TPH3GI](https://www.youtube.com/watch?v=yMPV9TPH3GI) | [Testing: Basic structure and  basic workflow](../../sources/source_yMPV9TPH3GI_testing-basic-structure-and-basic-workflow.md) | 37 | 2021-04-06T00:00:00Z |

## References

- golem documentation (thinkr)
- Mastering Shiny Ch. Packages
- R Packages (Wickham) Ch. Whole Game

