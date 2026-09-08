---
type: Reference
title: r2dii Packages on CRAN
description: r2dii.data and r2dii.match on CRAN, r2dii.plot package, and A/B testing
  with r2dii.plot
lang: en
tags:
- ds-incubator
generated:
  by: agent:okf-wiki-builder/1.0
  at: '2026-09-08T04:00:00Z'
status: draft
sources:
- id: 9yrckf6Km-U
  resource: https://www.youtube.com/watch?v=9yrckf6Km-U
  title: 'wtf: Installing R packages (part 2)'
  author: process:yt-dlp
  usage_count: 129
  last_modified: '2022-03-22T00:00:00Z'
- id: C29QThEYbYY
  resource: https://www.youtube.com/watch?v=C29QThEYbYY
  title: A/B testing r2dii.plot
  author: process:yt-dlp
  usage_count: 17
  last_modified: '2021-06-08T00:00:00Z'
- id: CRcK0SCxGBQ
  resource: https://www.youtube.com/watch?v=CRcK0SCxGBQ
  title: A demo of the package r2dii.plot (by Monika)
  author: process:yt-dlp
  usage_count: 74
  last_modified: '2022-03-01T00:00:00Z'
- id: ovbwghDjxV8
  resource: https://www.youtube.com/watch?v=ovbwghDjxV8
  title: 'r2dii.data and r2dii.match are now on CRAN: Demo and Q&A'
  author: process:yt-dlp
  usage_count: 91
  last_modified: '2020-03-31T00:00:00Z'
---

# r2dii Packages on CRAN

## Overview

The 2DII `r2dii` family (`r2dii.data`, `r2dii.match`, `r2dii.plot`) is presented via its CRAN milestone and visualization polishing. Anchors are [source_ovbwghDjxV8](../../sources/source_ovbwghDjxV8_r2dii-data-and-r2dii-match-are-now-on-cran-demo-and-q-a.md) (CRAN Q&A), [source_CRcK0SCxGBQ](../../sources/source_CRcK0SCxGBQ_a-demo-of-the-package-r2dii-plot-by-monika.md) (plot demo), and [source_C29QThEYbYY](../../sources/source_C29QThEYbYY_a-b-testing-r2dii-plot.md) (A/B testing plot API).

Process in [CRAN Submission](../r-packages/cran-submission.md); viz in [ggplot2 Fundamentals](../tidyverse/ggplot2-fundamentals.md); demo app in [Shiny Fundamentals](../shiny/shiny-basics.md).

## Key Concepts

- **What r2dii solves** ([source_ovbwghDjxV8](../../sources/source_ovbwghDjxV8_r2dii-data-and-r2dii-match-are-now-on-cran-demo-and-q-a.md)): PACTA climate alignment — `r2dii.data` (loanbook/portfolio datasets) + `r2dii.match` (name-based loan matching) as CRAN-stable dependencies.
- **CRAN gate** ([source_ovbwghDjxV8](../../sources/source_ovbwghDjxV8_r2dii-data-and-r2dii-match-are-now-on-cran-demo-and-q-a.md), [source_BAS8yfLBnog](../../sources/source_BAS8yfLBnog_strong-style-pair-programming-submitting-an-r-package-to-cran.md)): `R CMD check --as-cran`, `usethis::use_cran_comments`, `revdepcheck`; pair-programmed polish mirrors [Pairs Programming](../data/pairs-programming.md).
- **r2dii.plot API** ([source_CRcK0SCxGBQ](../../sources/source_CRcK0SCxGBQ_a-demo-of-the-package-r2dii-plot-by-monika.md)): `r2dii.plot::plot_techmix(portfolio, ...)` / `qplot_techmix` with `ggplot2` layers, `theme_2dii`; demo with `r2dii.data::loanbook_demo`.
- **A/B test of API** ([source_C29QThEYbYY](../../sources/source_C29QThEYbYY_a-b-testing-r2dii-plot.md)): two call signatures compared via tiny Shiny app + `gh` issue data; winning signature merged — links [Shiny Fundamentals](../shiny/shiny-basics.md) and [GitHub Issues Workflow](../data/github-issues-workflow.md).
- **Install** ([source_9yrckf6Km-U](../../sources/source_9yrckf6Km-U_wtf-installing-r-packages-part-2.md)): `install.packages(c("r2dii.data","r2dii.match"))`; custom lib path via `.libPaths` — see [WTF Installing R Packages].

## Example

```r
install.packages(c("r2dii.data","r2dii.match","r2dii.plot"))
library(r2dii.data); library(r2dii.plot)
data(loanbook_demo)
plot_techmix(loanbook_demo) + theme_2dii()

library(r2dii.match)
# match loanbook to abcd
matched <- match_name(loanbook_demo, abcd_demo)
```

## Sources

| Video | Title | Views | Last Modified |
|---|---|---|---|
| [9yrckf6Km-U](https://www.youtube.com/watch?v=9yrckf6Km-U) | [wtf: Installing R packages (part 2)](../../sources/source_9yrckf6Km-U_wtf-installing-r-packages-part-2.md) | 129 | 2022-03-22T00:00:00Z |
| [C29QThEYbYY](https://www.youtube.com/watch?v=C29QThEYbYY) | [A/B testing r2dii.plot](../../sources/source_C29QThEYbYY_a-b-testing-r2dii-plot.md) | 17 | 2021-06-08T00:00:00Z |
| [CRcK0SCxGBQ](https://www.youtube.com/watch?v=CRcK0SCxGBQ) | [A demo of the package r2dii.plot (by Monika)](../../sources/source_CRcK0SCxGBQ_a-demo-of-the-package-r2dii-plot-by-monika.md) | 74 | 2022-03-01T00:00:00Z |
| [ovbwghDjxV8](https://www.youtube.com/watch?v=ovbwghDjxV8) | [r2dii.data and r2dii.match are now on CRAN: Demo and Q&A](../../sources/source_ovbwghDjxV8_r2dii-data-and-r2dii-match-are-now-on-cran-demo-and-q-a.md) | 91 | 2020-03-31T00:00:00Z |

## References

- r2dii.data / r2dii.match / r2dii.plot CRAN pages
- PACTA documentation

