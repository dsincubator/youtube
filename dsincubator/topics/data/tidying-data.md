---
type: Playbook
title: Tidying Data
description: Data tidying techniques, data transformation, and preparing data for
  analysis
lang: en
tags:
- ds-incubator
generated:
  by: agent:okf-wiki-builder/1.0
  at: '2026-09-08T04:00:00Z'
status: draft
sources:
- id: 0-zQ69P6VsY
  resource: https://www.youtube.com/watch?v=0-zQ69P6VsY
  title: 'Tidy EDA: The data-science workflow and toolkit: An overview'
  author: process:yt-dlp
  usage_count: 48
  last_modified: '2021-11-02T00:00:00Z'
- id: 26hbyVb00xs
  resource: https://www.youtube.com/watch?v=26hbyVb00xs
  title: 'EDA with the tidyverse: Exploring Variation'
  author: process:yt-dlp
  usage_count: 362
  last_modified: '2021-11-09T00:00:00Z'
- id: MJZ7ZsfG5lM
  resource: https://www.youtube.com/watch?v=MJZ7ZsfG5lM
  title: Wrapping up our discussion on how to manage and use data
  author: process:yt-dlp
  usage_count: 6
  last_modified: '2020-05-26T00:00:00Z'
- id: VA3qaeTKTYk
  resource: https://www.youtube.com/watch?v=VA3qaeTKTYk
  title: Tidying data
  author: process:yt-dlp
  usage_count: 16
  last_modified: '2020-04-07T00:00:00Z'
---

# Tidying Data

## Overview

Tidying reshapes messy tables into one-observation-per-row tidy form before any analysis. This Playbook condenses [source_VA3qaeTKTYk](../../sources/source_VA3qaeTKTYk_tidying-data.md) with the toolkit framing in [source_0-zQ69P6VsY](../../sources/source_0-zQ69P6VsY_tidy-eda-the-data-science-workflow-and-toolkit-an-overview.md) and the management wrap-up [source_MJZ7ZsfG5lM](../../sources/source_MJZ7ZsfG5lM_wrapping-up-our-discussion-on-how-to-manage-and-use-data.md). It is the practical sibling of the conceptual [Tidy Data](../tidyverse/tidy-data.md).

Concept in [Tidy Data](../tidyverse/tidy-data.md); verbs in [dplyr Verbs](../tidyverse/dplyr-verbs.md); workflow in [Project-Oriented Workflow](../workflow/project-oriented-workflow.md).

## Key Concepts

- **Tidy definition** ([source_VA3qaeTKTYk](../../sources/source_VA3qaeTKTYk_tidying-data.md), [source_0-zQ69P6VsY](../../sources/source_0-zQ69P6VsY_tidy-eda-the-data-science-workflow-and-toolkit-an-overview.md)): one variable per column, one observation per row, one value per cell; enables vectorized `dplyr`/`ggplot2`.
- **Long vs wide** ([source_VA3qaeTKTYk](../../sources/source_VA3qaeTKTYk_tidying-data.md)): untidy: year columns `1999`, `2000` as headers; tidy: `year` column with `cases` values via `pivot_longer`.
- **Reshaping verbs** ([source_VA3qaeTKTYk](../../sources/source_VA3qaeTKTYk_tidying-data.md)): `tidyr::pivot_longer(cols, names_to, values_to)` / `pivot_wider(names_from, values_from)`, `separate(col, into)` / `unite(col, ...)`, `extract`.
- **End-to-end** ([source_VA3qaeTKTYk](../../sources/source_VA3qaeTKTYk_tidying-data.md), [source_MJZ7ZsfG5lM](../../sources/source_MJZ7ZsfG5lM_wrapping-up-our-discussion-on-how-to-manage-and-use-data.md)): `readr::read_csv` → `pivot_longer` → `separate` → `type_convert`; pair with `here::here()` — see [Project-Oriented Workflow](../workflow/project-oriented-workflow.md).
- **Next** ([source_VA3qaeTKTYk](../../sources/source_VA3qaeTKTYk_tidying-data.md)): once tidy, use [dplyr Verbs](../tidyverse/dplyr-verbs.md) and [EDA: Exploring Variation](../tidyverse/eda-exploring-variation.md).

## Example

```r
library(tidyr); library(dplyr)
# untidy: columns 1999, 2000 hold values
table4a %>% pivot_longer(c(`1999`,`2000`), names_to="year", values_to="cases")
table2 %>% separate(rate, into=c("cases","pop"), sep="/")
table3 %>% unite(rate, cases, pop, sep="/")
```

## Sources

| Video | Title | Views | Last Modified |
|---|---|---|---|
| [0-zQ69P6VsY](https://www.youtube.com/watch?v=0-zQ69P6VsY) | [Tidy EDA: The data-science workflow and toolkit: An overview](../../sources/source_0-zQ69P6VsY_tidy-eda-the-data-science-workflow-and-toolkit-an-overview.md) | 48 | 2021-11-02T00:00:00Z |
| [26hbyVb00xs](https://www.youtube.com/watch?v=26hbyVb00xs) | [EDA with the tidyverse: Exploring Variation](../../sources/source_26hbyVb00xs_eda-with-the-tidyverse-exploring-variation.md) | 362 | 2021-11-09T00:00:00Z |
| [MJZ7ZsfG5lM](https://www.youtube.com/watch?v=MJZ7ZsfG5lM) | [Wrapping up our discussion on how to manage and use data](../../sources/source_MJZ7ZsfG5lM_wrapping-up-our-discussion-on-how-to-manage-and-use-data.md) | 6 | 2020-05-26T00:00:00Z |
| [VA3qaeTKTYk](https://www.youtube.com/watch?v=VA3qaeTKTYk) | [Tidying data](../../sources/source_VA3qaeTKTYk_tidying-data.md) | 16 | 2020-04-07T00:00:00Z |

## References

- R for Data Science Ch. Tidy Data (Wickham)
- tidyr pivot vignette

