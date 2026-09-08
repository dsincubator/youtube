---
type: Reference
title: Tidy Data
description: Tidy data principles, spreading, gathering, separating, and unifying
  data formats
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

# Tidy Data

## Overview

Tidy data is the premise that makes the tidyverse work: every variable is a column, every observation a row, every value a cell. [source_0-zQ69P6VsY](../../sources/source_0-zQ69P6VsY_tidy-eda-the-data-science-workflow-and-toolkit-an-overview.md) frames tidying as the bridge between import and the transform–visualize–model loop, [source_VA3qaeTKTYk](../../sources/source_VA3qaeTKTYk_tidying-data.md) contrasts `gather`/`spread` with `pivot_longer`/`pivot_wider` on `billboard`, [source_26hbyVb00xs](../../sources/source_26hbyVb00xs_eda-with-the-tidyverse-exploring-variation.md) rehearses the definition with `diamonds` types, and [source_MJZ7ZsfG5lM](../../sources/source_MJZ7ZsfG5lM_wrapping-up-our-discussion-on-how-to-manage-and-use-data.md) connects tidying to relational and pins workflows.

This Reference sits between [Tidyverse Data Science Workflow](../tidyverse/workflow-overview.md) and the EDA playbooks; tidy tables are the input to [dplyr Verbs](../tidyverse/dplyr-verbs.md) and [ggplot2 Fundamentals](../tidyverse/ggplot2-fundamentals.md).

## Key Concepts

- **Definition**: tidy = one variable per column, one observation per row, one value per cell; enables `dplyr` + `ggplot2` to work column-wise — [source_0-zQ69P6VsY](../../sources/source_0-zQ69P6VsY_tidy-eda-the-data-science-workflow-and-toolkit-an-overview.md), [source_26hbyVb00xs](../../sources/source_26hbyVb00xs_eda-with-the-tidyverse-exploring-variation.md).
- **Old reshapers**: `gather(data, key, value, ...)` e.g. `gather(billboard, key="week", value="rank", wk1:wk76)` with selections by indices `4:79`, negatives `-c(1:3)`, ranges `wk1:wk76`, helpers `starts_with("wk")`, `matches("^wk\\d+$")` — [source_VA3qaeTKTYk](../../sources/source_VA3qaeTKTYk_tidying-data.md).
- **New pivot verbs**: `pivot_longer(cols = wk1:wk76, names_to="week", values_to="rank")` takes single `cols`; `pivot_wider(names_from=week, values_from=rank)` reverses — [source_VA3qaeTKTYk](../../sources/source_VA3qaeTKTYk_tidying-data.md).
- **Prefix & type control**: `names_prefix="wk"` strips prefix (`wk1`→`1`), `names_transform=list(week=as.integer)` / `names_ptypes` avoids character coercion; only `pivot_*` can reshape multiple `names_to`/`values_to` without coercing — [source_VA3qaeTKTYk](../../sources/source_VA3qaeTKTYk_tidying-data.md).
- **Wide vs long**: wide `year_2020`/`year_2021` columns must be longed so `ggplot(aes(year))` maps one column; SQL-heritage `dplyr` prefers long — [source_VA3qaeTKTYk](../../sources/source_VA3qaeTKTYk_tidying-data.md), [source_MJZ7ZsfG5lM](../../sources/source_MJZ7ZsfG5lM_wrapping-up-our-discussion-on-how-to-manage-and-use-data.md).
- **Validation after tidying**: count primary keys (`count(id) %>% filter(n>1)`) and check `is.na()` to ensure tidying preserved uniqueness — see [Relational Databases and dm](../data/databases-and-dm.md).

## Example

```r
library(tidyr)

billboard %>% pivot_longer(cols = wk1:wk76, names_to = "week", values_to = "rank",
                           names_prefix = "wk", names_transform = list(week = as.integer))

billboard %>% pivot_longer(cols = starts_with("wk"), names_to="week", values_to="rank")
billboard %>% pivot_longer(cols = matches("^wk\\d+$"), names_to="week", values_to="rank")

billboard_long %>% pivot_wider(names_from = week, values_from = rank, names_prefix = "wk")
```

## Sources

| Video | Title | Views | Last Modified |
|---|---|---|---|
| [0-zQ69P6VsY](https://www.youtube.com/watch?v=0-zQ69P6VsY) | [Tidy EDA: The data-science workflow and toolkit: An overview](../../sources/source_0-zQ69P6VsY_tidy-eda-the-data-science-workflow-and-toolkit-an-overview.md) | 48 | 2021-11-02T00:00:00Z |
| [26hbyVb00xs](https://www.youtube.com/watch?v=26hbyVb00xs) | [EDA with the tidyverse: Exploring Variation](../../sources/source_26hbyVb00xs_eda-with-the-tidyverse-exploring-variation.md) | 362 | 2021-11-09T00:00:00Z |
| [MJZ7ZsfG5lM](https://www.youtube.com/watch?v=MJZ7ZsfG5lM) | [Wrapping up our discussion on how to manage and use data](../../sources/source_MJZ7ZsfG5lM_wrapping-up-our-discussion-on-how-to-manage-and-use-data.md) | 6 | 2020-05-26T00:00:00Z |
| [VA3qaeTKTYk](https://www.youtube.com/watch?v=VA3qaeTKTYk) | [Tidying data](../../sources/source_VA3qaeTKTYk_tidying-data.md) | 16 | 2020-04-07T00:00:00Z |

## References

- Hadley Wickham — *R for Data Science* (Tidy data, Pivoting)
- Hadley Wickham — Tidy-data papers
- `tidyr` documentation (`pivot_longer`, `pivot_wider`, tidyselect)
