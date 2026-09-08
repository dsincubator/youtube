---
type: Playbook
title: Shiny Fundamentals
description: Shiny reactivity, UI and server functions, basic input/output, and first
  shiny app
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
- id: JdFA31-vJUE
  resource: https://www.youtube.com/watch?v=JdFA31-vJUE
  title: 'cloud: Use case -- host shiny apps'
  author: process:yt-dlp
  usage_count: 115
  last_modified: '2022-06-14T00:00:00Z'
- id: JqqrPZdWXfQ
  resource: https://www.youtube.com/watch?v=JqqrPZdWXfQ
  title: 'Shiny: Basic ui and introduction to reactive()'
  author: process:yt-dlp
  usage_count: 222
  last_modified: '2021-06-22T00:00:00Z'
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
- id: OofNbCXEVgU
  resource: https://www.youtube.com/watch?v=OofNbCXEVgU
  title: Gitflow workflow
  author: process:yt-dlp
  usage_count: 162
  last_modified: '2021-05-25T00:00:00Z'
- id: PRKOMCCOlI0
  resource: https://www.youtube.com/watch?v=PRKOMCCOlI0
  title: Continuously build and deploy a shiny app on Google Cloud Run
  author: process:yt-dlp
  usage_count: 688
  last_modified: '2024-07-05T00:00:00Z'
- id: c3jANTGkB1U
  resource: https://www.youtube.com/watch?v=c3jANTGkB1U
  title: 'Shiny: Publishing'
  author: process:yt-dlp
  usage_count: 47
  last_modified: '2021-08-10T00:00:00Z'
- id: erv1yJaNID8
  resource: https://www.youtube.com/watch?v=erv1yJaNID8
  title: 'reprex: overview'
  author: process:yt-dlp
  usage_count: 78
  last_modified: '2021-10-05T00:00:00Z'
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
- id: rirpOpTYVg4
  resource: https://www.youtube.com/watch?v=rirpOpTYVg4
  title: 'Shiny: Basic reactivity'
  author: process:yt-dlp
  usage_count: 258
  last_modified: '2021-06-29T00:00:00Z'
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

# Shiny Fundamentals

## Overview

Shiny fundamentals are taught as UI + Server + reactivity building blocks for the first app. Anchors are [source_EB6ODnkdG7A](../../sources/source_EB6ODnkdG7A_shiny-basic-reactivity.md) / [source_rirpOpTYVg4](../../sources/source_rirpOpTYVg4_shiny-basic-reactivity.md) (reactivity primitives), [source_JqqrPZdWXfQ](../../sources/source_JqqrPZdWXfQ_shiny-basic-ui-and-introduction-to-reactive.md) (UI + `render*`), [source_p-p_4ZcDIGw](../../sources/source_p-p_4ZcDIGw_shiny-your-first-shiny-app.md) (first app + publishing), with debugging/deployment context from [source_NgEocgBUH_A](../../sources/source_NgEocgBUH_A_shiny-debugging.md) and [source_PRKOMCCOlI0](../../sources/source_PRKOMCCOlI0_continuously-build-and-deploy-a-shiny-app-on-google-cloud-run.md). This Playbook is entry point for the Shiny track; next steps are [Shiny Publishing](../shiny/shiny-publishing.md), [Shiny Debugging](../shiny/shiny-debugging.md), and [Shiny Development Workflow](../shiny/shiny-development-workflow.md).

Next: [Shiny Publishing](../shiny/shiny-publishing.md), [Shiny Debugging](../shiny/shiny-debugging.md), [Shiny Development Workflow](../shiny/shiny-development-workflow.md), [Shiny Packages](../shiny/shiny-packages.md); hosting in [Google Cloud Run](../cloud/google-cloud-run.md).

## Key Concepts

- **App skeleton** ([source_p-p_4ZcDIGw](../../sources/source_p-p_4ZcDIGw_shiny-your-first-shiny-app.md), [source_JqqrPZdWXfQ](../../sources/source_JqqrPZdWXfQ_shiny-basic-ui-and-introduction-to-reactive.md)): `library(shiny)` → `ui <- fluidPage(...)` + `server <- function(input, output, session){...}` → `shinyApp(ui, server)`; run via Run App or `shiny::runApp()`.
- **Inputs & outputs** ([source_JqqrPZdWXfQ](../../sources/source_JqqrPZdWXfQ_shiny-basic-ui-and-introduction-to-reactive.md), [source_EB6ODnkdG7A](../../sources/source_EB6ODnkdG7A_shiny-basic-reactivity.md)): inputs `textInput`, `sliderInput`, `selectInput` bound to `input$<id>`; outputs `textOutput`/`plotOutput` paired with `renderText`/`renderPlot` assigned to `output$<id>`.
- **Reactivity core** ([source_EB6ODnkdG7A](../../sources/source_EB6ODnkdG7A_shiny-basic-reactivity.md), [source_rirpOpTYVg4](../../sources/source_rirpOpTYVg4_shiny-basic-reactivity.md)): reactive sources (`input$`) → reactive expressions `reactive({...})` (cached) → observers `observeEvent` / `observe`; `reactiveVal`/`reactiveValues` for mutable state; `req()` to guard missing inputs; invalidated graph re-executes only dependents.
- **Render + isolate patterns** ([source_EB6ODnkdG7A](../../sources/source_EB6ODnkdG7A_shiny-basic-reactivity.md)): `output$txt <- renderText({ input$txt })` basics; `isolate()` to read without tracking; `eventReactive` for button-gated computation.
- **First app demo** ([source_p-p_4ZcDIGw](../../sources/source_p-p_4ZcDIGw_shiny-your-first-shiny-app.md)): minimal `app.R` (e.g., histogram of `faithful`) → `rsconnect` deploy or local run; same scaffold scales to [Shiny Packages](../shiny/shiny-packages.md) via `golem`/`usethis`.
- **Lifecycle note** ([source_c3jANTGkB1U](../../sources/source_c3jANTGkB1U_shiny-publishing.md), [source_lq6ZhPFVLTY](../../sources/source_lq6ZhPFVLTY_shiny-development-workflow.md)): UI is static declaration, server is reactive graph; test reactivity with `testServer` (see [Testing Fundamentals](../testing/testing-fundamentals.md)).

## Example

```r
library(shiny)
ui <- fluidPage(
  sliderInput("n", "Observations", 10, 100, 50),
  plotOutput("hist")
)
server <- function(input, output, session) {
  data <- reactive({ rnorm(input$n) })
  output$hist <- renderPlot({ hist(data()) })
}
shinyApp(ui, server)
# reactivity: input$n -> reactive(data) -> renderPlot re-executes only when n changes
```

## Sources

| Video | Title | Views | Last Modified |
|---|---|---|---|
| [9JcJFber21w](https://www.youtube.com/watch?v=9JcJFber21w) | [Testing: Introduction](../../sources/source_9JcJFber21w_testing-introduction.md) | 59 | 2021-03-30T00:00:00Z |
| [EB6ODnkdG7A](https://www.youtube.com/watch?v=EB6ODnkdG7A) | [Shiny: Basic reactivity](../../sources/source_EB6ODnkdG7A_shiny-basic-reactivity.md) | 64 | 2021-07-13T00:00:00Z |
| [F7JiD7oT4P8](https://www.youtube.com/watch?v=F7JiD7oT4P8) | [RStudio Team: Demo and discussion](../../sources/source_F7JiD7oT4P8_rstudio-team-demo-and-discussion.md) | 709 | 2020-06-16T00:00:00Z |
| [JdFA31-vJUE](https://www.youtube.com/watch?v=JdFA31-vJUE) | [cloud: Use case -- host shiny apps](../../sources/source_JdFA31-vJUE_cloud-use-case-host-shiny-apps.md) | 115 | 2022-06-14T00:00:00Z |
| [JqqrPZdWXfQ](https://www.youtube.com/watch?v=JqqrPZdWXfQ) | [Shiny: Basic ui and introduction to reactive()](../../sources/source_JqqrPZdWXfQ_shiny-basic-ui-and-introduction-to-reactive.md) | 222 | 2021-06-22T00:00:00Z |
| [NgEocgBUH_A](https://www.youtube.com/watch?v=NgEocgBUH_A) | [Shiny: Debugging](../../sources/source_NgEocgBUH_A_shiny-debugging.md) | 2326 | 2021-07-27T00:00:00Z |
| [O_tkgjsUT6g](https://www.youtube.com/watch?v=O_tkgjsUT6g) | [Shiny: Packages](../../sources/source_O_tkgjsUT6g_shiny-packages.md) | 59 | 2021-08-03T00:00:00Z |
| [OofNbCXEVgU](https://www.youtube.com/watch?v=OofNbCXEVgU) | [Gitflow workflow](../../sources/source_OofNbCXEVgU_gitflow-workflow.md) | 162 | 2021-05-25T00:00:00Z |
| [PRKOMCCOlI0](https://www.youtube.com/watch?v=PRKOMCCOlI0) | [Continuously build and deploy a shiny app on Google Cloud Run](../../sources/source_PRKOMCCOlI0_continuously-build-and-deploy-a-shiny-app-on-google-cloud-run.md) | 688 | 2024-07-05T00:00:00Z |
| [c3jANTGkB1U](https://www.youtube.com/watch?v=c3jANTGkB1U) | [Shiny: Publishing](../../sources/source_c3jANTGkB1U_shiny-publishing.md) | 47 | 2021-08-10T00:00:00Z |
| [erv1yJaNID8](https://www.youtube.com/watch?v=erv1yJaNID8) | [reprex: overview](../../sources/source_erv1yJaNID8_reprex-overview.md) | 78 | 2021-10-05T00:00:00Z |
| [lq6ZhPFVLTY](https://www.youtube.com/watch?v=lq6ZhPFVLTY) | [Shiny: development workflow](../../sources/source_lq6ZhPFVLTY_shiny-development-workflow.md) | 54 | 2021-07-20T00:00:00Z |
| [p-p_4ZcDIGw](https://www.youtube.com/watch?v=p-p_4ZcDIGw) | [Shiny: Your first shiny app](../../sources/source_p-p_4ZcDIGw_shiny-your-first-shiny-app.md) | 275 | 2021-06-01T00:00:00Z |
| [rirpOpTYVg4](https://www.youtube.com/watch?v=rirpOpTYVg4) | [Shiny: Basic reactivity](../../sources/source_rirpOpTYVg4_shiny-basic-reactivity.md) | 258 | 2021-06-29T00:00:00Z |
| [uk-I5WrZsAc](https://www.youtube.com/watch?v=uk-I5WrZsAc) | [Shiny: Wrap up and demo](../../sources/source_uk-I5WrZsAc_shiny-wrap-up-and-demo.md) | 19 | 2021-08-17T00:00:00Z |
| [yMPV9TPH3GI](https://www.youtube.com/watch?v=yMPV9TPH3GI) | [Testing: Basic structure and  basic workflow](../../sources/source_yMPV9TPH3GI_testing-basic-structure-and-basic-workflow.md) | 37 | 2021-04-06T00:00:00Z |

## References

- Mastering Shiny (Wickham) — Reactivity chapters
- shiny::reactive, observeEvent, req documentation
- shinytest2 / testServer docs

