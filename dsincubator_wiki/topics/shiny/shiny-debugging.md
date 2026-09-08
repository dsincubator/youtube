---
type: Playbook
title: Shiny Debugging
description: Debugging Shiny applications, error tracing, and reactive debugging tools
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
- id: EB6ODnkdG7A
  resource: https://www.youtube.com/watch?v=EB6ODnkdG7A
  title: 'Shiny: Basic reactivity'
  author: process:yt-dlp
  usage_count: 64
  last_modified: '2021-07-13T00:00:00Z'
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

# Shiny Debugging

## Overview

Shiny's reactive graph makes bugs subtle (silent `NA`, stale cache, missing `req`). This Playbook harvests debugging tactics from [source_NgEocgBUH_A](../../sources/source_NgEocgBUH_A_shiny-debugging.md) (core Shiny debugging), [source_EB6ODnkdG7A](../../sources/source_EB6ODnkdG7A_shiny-basic-reactivity.md) (reactive errors), plus general workflow advice from [source_AUIJif93OJA](../../sources/source_AUIJif93OJA_a-systematic-debugging-workflow.md) and [source_tLvRWRWeQK4](../../sources/source_tLvRWRWeQK4_wtf-debugging-r-code.md). It pairs with [Debugging Workflows](../workflow/debugging-workflows.md) and [Shiny Development Workflow](../shiny/shiny-development-workflow.md).

Companion to [Shiny Fundamentals](../shiny/shiny-basics.md) and [Shiny Development Workflow](../shiny/shiny-development-workflow.md); general method in [Debugging Workflows](../workflow/debugging-workflows.md).

## Key Concepts

- **Reactive error sources** ([source_EB6ODnkdG7A](../../sources/source_EB6ODnkdG7A_shiny-basic-reactivity.md), [source_NgEocgBUH_A](../../sources/source_NgEocgBUH_A_shiny-debugging.md)): `NULL`/`NA` inputs before first render, type-inconsistent branches, and over-reactive dependencies cause flicker or silent failure.
- **req / validate / need** ([source_NgEocgBUH_A](../../sources/source_NgEocgBUH_A_shiny-debugging.md)): `req(input$x)` stops downstream until truthy; `validate(need(input$x, "pick x"))` shows user-visible message instead of error.
- **Browser tools** ([source_NgEocgBUH_A](../../sources/source_NgEocgBUH_A_shiny-debugging.md), [source_tLvRWRWeQK4](../../sources/source_tLvRWRWeQK4_wtf-debugging-r-code.md)): `browser()` inside `render*`/`reactive`, RStudio breakpoints, `options(shiny.trace=TRUE)` / `reactlog::reactlog_enable()` to visualize graph, `showReactLog()`; `cat`/`print` inside reactives for minimal tracing.
- **Systematic loop** ([source_AUIJif93OJA](../../sources/source_AUIJif93OJA_a-systematic-debugging-workflow.md)): reproduce with `reprex`/`testServer` → isolate minimal reactive chain → fix at lowest level → add `testServer` regression — see [Debugging Workflows](../workflow/debugging-workflows.md) and [Reproducible Examples](../communication/reprex.md).
- **Fail-fast guards** ([source_3rf1W9ceKhU](../../sources/source_3rf1W9ceKhU_failing-fast-in-dplyr-chains.md)): early `stopifnot`/`assert` in helper functions that Shiny calls, so error surfaces near cause not in distant `renderPlot`.

## Example

```r
library(shiny)
server <- function(input, output, session) {
  data <- reactive({
    req(input$file)  # guard
    # browser()  # uncomment to step through
    read.csv(input$file$datapath)
  })
  output$tbl <- renderTable({
    validate(need(nrow(data())>0, "No rows after filter"))
    head(data())
  })
}
# trace reactives
options(shiny.trace=TRUE)
reactlog::reactlog_enable(); shiny::runApp(); reactlog::reactlogShow()
# unit test
shiny::testServer(server, { session$setInputs(file=data.frame()); print(data()) })
```

## Sources

| Video | Title | Views | Last Modified |
|---|---|---|---|
| [3rf1W9ceKhU](https://www.youtube.com/watch?v=3rf1W9ceKhU) | [Failing fast in dplyr chains](../../sources/source_3rf1W9ceKhU_failing-fast-in-dplyr-chains.md) | 5 | 2020-06-30T00:00:00Z |
| [EB6ODnkdG7A](https://www.youtube.com/watch?v=EB6ODnkdG7A) | [Shiny: Basic reactivity](../../sources/source_EB6ODnkdG7A_shiny-basic-reactivity.md) | 64 | 2021-07-13T00:00:00Z |
| [NgEocgBUH_A](https://www.youtube.com/watch?v=NgEocgBUH_A) | [Shiny: Debugging](../../sources/source_NgEocgBUH_A_shiny-debugging.md) | 2326 | 2021-07-27T00:00:00Z |
| [lfhuO71ikQE](https://www.youtube.com/watch?v=lfhuO71ikQE) | [targets: debugging](../../sources/source_lfhuO71ikQE_targets-debugging.md) | 137 | 2021-03-09T00:00:00Z |
| [lq6ZhPFVLTY](https://www.youtube.com/watch?v=lq6ZhPFVLTY) | [Shiny: development workflow](../../sources/source_lq6ZhPFVLTY_shiny-development-workflow.md) | 54 | 2021-07-20T00:00:00Z |
| [tLvRWRWeQK4](https://www.youtube.com/watch?v=tLvRWRWeQK4) | [WTF: Debugging R code](../../sources/source_tLvRWRWeQK4_wtf-debugging-r-code.md) | 56 | 2022-03-29T00:00:00Z |

## References

- Mastering Shiny Ch. Debugging
- reactlog documentation
- shiny::req / validate documentation
- WTF Debugging guide (Jenny Bryan)

