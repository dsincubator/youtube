---
type: Reference
title: dplyr Verbs
description: 'Core dplyr verbs: select, filter, mutate, arrange, summarize, count,
  pipe operator, and data frame operations'
lang: en
tags:
- ds-incubator
generated:
  by: agent:okf-wiki-builder/1.0
  at: '2026-09-08T04:00:00Z'
status: draft
sources:
- id: -L2A_7XvD6Y
  resource: https://www.youtube.com/watch?v=-L2A_7XvD6Y
  title: Working with Git and GitHub from RStudio (part 2)
  author: process:yt-dlp
  usage_count: 15
  last_modified: '2020-08-18T00:00:00Z'
- id: 0-zQ69P6VsY
  resource: https://www.youtube.com/watch?v=0-zQ69P6VsY
  title: 'Tidy EDA: The data-science workflow and toolkit: An overview'
  author: process:yt-dlp
  usage_count: 48
  last_modified: '2021-11-02T00:00:00Z'
- id: 3rf1W9ceKhU
  resource: https://www.youtube.com/watch?v=3rf1W9ceKhU
  title: Failing fast in dplyr chains
  author: process:yt-dlp
  usage_count: 5
  last_modified: '2020-06-30T00:00:00Z'
- id: C29QThEYbYY
  resource: https://www.youtube.com/watch?v=C29QThEYbYY
  title: A/B testing r2dii.plot
  author: process:yt-dlp
  usage_count: 17
  last_modified: '2021-06-08T00:00:00Z'
- id: DfVoYtCQlfU
  resource: https://www.youtube.com/watch?v=DfVoYtCQlfU
  title: The flow of data and Get data directly form the database
  author: process:yt-dlp
  usage_count: 24
  last_modified: '2020-04-28T00:00:00Z'
- id: H9lARi3re9I
  resource: https://www.youtube.com/watch?v=H9lARi3re9I
  title: 'ds.database: Using a Relational Database Management System (RDBMS)'
  author: process:yt-dlp
  usage_count: 335
  last_modified: '2022-09-27T00:00:00Z'
- id: VA3qaeTKTYk
  resource: https://www.youtube.com/watch?v=VA3qaeTKTYk
  title: Tidying data
  author: process:yt-dlp
  usage_count: 16
  last_modified: '2020-04-07T00:00:00Z'
- id: o9ZHNEl8UI8
  resource: https://www.youtube.com/watch?v=o9ZHNEl8UI8
  title: Watch out for type inconsistent code
  author: process:yt-dlp
  usage_count: 17
  last_modified: '2020-03-03T00:00:00Z'
- id: p-p_4ZcDIGw
  resource: https://www.youtube.com/watch?v=p-p_4ZcDIGw
  title: 'Shiny: Your first shiny app'
  author: process:yt-dlp
  usage_count: 275
  last_modified: '2021-06-01T00:00:00Z'
- id: qvQ_YmyjK0U
  resource: https://www.youtube.com/watch?v=qvQ_YmyjK0U
  title: 'ds.database: Relational data with dplyr'
  author: process:yt-dlp
  usage_count: 126
  last_modified: '2022-08-30T00:00:00Z'
- id: sPE6MLGUPy4
  resource: https://www.youtube.com/watch?v=sPE6MLGUPy4
  title: 'webdata: Scrapping'
  author: process:yt-dlp
  usage_count: 32
  last_modified: '2022-01-18T00:00:00Z'
- id: xxtpMXvVM3s
  resource: https://www.youtube.com/watch?v=xxtpMXvVM3s
  title: 'Refactoring: How to prepare for dplyr 1.0.0'
  author: process:yt-dlp
  usage_count: 129
  last_modified: '2020-03-24T00:00:00Z'
---

# dplyr Verbs

## Overview

dplyr is the tidyverse's grammar of data manipulation: a small set of verbs that each do one thing well and compose with the pipe. [source_0-zQ69P6VsY](../../sources/source_0-zQ69P6VsY_tidy-eda-the-data-science-workflow-and-toolkit-an-overview.md) introduces `select()`, `count()` and `filter()` on `diamonds` with `%>%`, while [source_26hbyVb00xs](../../sources/source_26hbyVb00xs_eda-with-the-tidyverse-exploring-variation.md) mirrors plots with `count()` tables and [source_qvQ_YmyjK0U](../../sources/source_qvQ_YmyjK0U_ds-database-relational-data-with-dplyr.md) extends the family to relational joins. The incubator overlays defensive habits from [source_3rf1W9ceKhU](../../sources/source_3rf1W9ceKhU_failing-fast-in-dplyr-chains.md) (fail-fast with `assertr`), type-safety warnings from [source_o9ZHNEl8UI8](../../sources/source_o9ZHNEl8UI8_watch-out-for-type-inconsistent-code.md) (`vctrs::vec_c` vs `c()`), and the 1.0.0 migration in [source_xxtpMXvVM3s](../../sources/source_xxtpMXvVM3s_refactoring-how-to-prepare-for-dplyr-1-0-0.md) (`mutate_if()` → `across()`).

This Reference collects verb semantics, pipe idioms, and pitfalls that recur across the series, linking to [Tidy Data](../tidyverse/tidy-data.md), [ggplot2 Fundamentals](../tidyverse/ggplot2-fundamentals.md), and [Relational Databases and dm](../data/databases-and-dm.md).

## Key Concepts

- **Core verbs**: `select()` (columns), `filter()` (rows), `mutate()` (new columns), `arrange()` (order), `summarise()` + `group_by()`, `count()` (shorthand `group_by` + `summarise(n=n())`), `distinct()`/`pull()` to inspect levels — [source_0-zQ69P6VsY](../../sources/source_0-zQ69P6VsY_tidy-eda-the-data-science-workflow-and-toolkit-an-overview.md), [source_26hbyVb00xs](../../sources/source_26hbyVb00xs_eda-with-the-tidyverse-exploring-variation.md), [source_qvQ_YmyjK0U](../../sources/source_qvQ_YmyjK0U_ds-database-relational-data-with-dplyr.md).
- **Pipe**: `%>%` (magrittr) and native `|>` for readable sequential composition vs nesting; `diamonds %>% select(cut, price) %>% count(cut) %>% filter(n > 10000)` — [source_0-zQ69P6VsY](../../sources/source_0-zQ69P6VsY_tidy-eda-the-data-science-workflow-and-toolkit-an-overview.md), [source_H9lARi3re9I](../../sources/source_H9lARi3re9I_ds-database-using-a-relational-database-management-system-rdbms.md), [source_DfVoYtCQlfU](../../sources/source_DfVoYtCQlfU_the-flow-of-data-and-get-data-directly-form-the-database.md) (reuse).
- **Join verbs**: mutating (`left_join()`, `inner_join()`, `right_join()`, `full_join()`) vs filtering (`semi_join()`, `anti_join()`) with explicit `by = "key"`; `left_join()` keeps all `x` rows and is safest on uninspected data — [source_qvQ_YmyjK0U](../../sources/source_qvQ_YmyjK0U_ds-database-relational-data-with-dplyr.md), [source_DfVoYtCQlfU](../../sources/source_DfVoYtCQlfU_the-flow-of-data-and-get-data-directly-form-the-database.md), [source_H9lARi3re9I](../../sources/source_H9lARi3re9I_ds-database-using-a-relational-database-management-system-rdbms.md).
- **Fail-fast in chains**: `assertr::assert()`/`verify()`/`assert_rows()` inserted mid-pipe without breaking it, reporting column/row indices; `traceback()` / `rlang::last_error()` to locate step — [source_3rf1W9ceKhU](../../sources/source_3rf1W9ceKhU_failing-fast-in-dplyr-chains.md) — see [Debugging Workflows](../workflow/debugging-workflows.md).
- **Type consistency**: `c()` coercion surprises (factor+factor→integer, Date+POSIXct→far future) vs `vctrs::vec_c()` hierarchy `logical → integer → double → character` and forest for S3 types; `if_else()` requires typed `NA` vs value-dependent `ifelse()` — [source_o9ZHNEl8UI8](../../sources/source_o9ZHNEl8UI8_watch-out-for-type-inconsistent-code.md) — see [Web APIs and Data](../workflow/web-apis.md).
- **Across migration (1.0.0)**: `mutate_if(is.numeric, mean, na.rm=TRUE)` superseded by `mutate(across(where(is.numeric), ~mean(.x, na.rm=TRUE)))`; refactor safely via `_2` copy, per-branch `renv::restore()` — [source_xxtpMXvVM3s](../../sources/source_xxtpMXvVM3s_refactoring-how-to-prepare-for-dplyr-1-0-0.md) — see [Creating R Packages](../r-packages/creating-packages.md).
- **Scraping joins**: [source_sPE6MLGUPy4](../../sources/source_sPE6MLGUPy4_webdata-scrapping.md) shows scraping with `html_elements()` → dplyr cleaning.

## Example

```r
library(dplyr)

# Verb chain with pipe
diamonds %>% select(cut, price) %>% count(cut) %>% filter(n > 10000)

# Fail-fast
library(assertr)
mtcars %>% assert(in_set(cyl, c(4,6,8)), cyl) %>% verify(nrow(.) > 0)

# Join + key validation
companies %>% left_join(categories, by = "companies_id")
companies %>% count(companies_id) %>% filter(n > 1)      # primary key: expect 0 rows
anti_join(categories, companies, by = "companies_id")    # foreign key: expect 0 rows

# Across (dplyr 1.0.0)
df %>% mutate(across(where(is.numeric), ~mean(.x, na.rm = TRUE)))

# Type-consistent combine
vctrs::vec_c(TRUE, 1L)  # integer
```

## Sources

| Video | Title | Views | Last Modified |
|---|---|---|---|
| [-L2A_7XvD6Y](https://www.youtube.com/watch?v=-L2A_7XvD6Y) | [Working with Git and GitHub from RStudio (part 2)](../../sources/source_-L2A_7XvD6Y_working-with-git-and-github-from-rstudio-part-2.md) | 15 | 2020-08-18T00:00:00Z |
| [0-zQ69P6VsY](https://www.youtube.com/watch?v=0-zQ69P6VsY) | [Tidy EDA: The data-science workflow and toolkit: An overview](../../sources/source_0-zQ69P6VsY_tidy-eda-the-data-science-workflow-and-toolkit-an-overview.md) | 48 | 2021-11-02T00:00:00Z |
| [3rf1W9ceKhU](https://www.youtube.com/watch?v=3rf1W9ceKhU) | [Failing fast in dplyr chains](../../sources/source_3rf1W9ceKhU_failing-fast-in-dplyr-chains.md) | 5 | 2020-06-30T00:00:00Z |
| [C29QThEYbYY](https://www.youtube.com/watch?v=C29QThEYbYY) | [A/B testing r2dii.plot](../../sources/source_C29QThEYbYY_a-b-testing-r2dii-plot.md) | 17 | 2021-06-08T00:00:00Z |
| [DfVoYtCQlfU](https://www.youtube.com/watch?v=DfVoYtCQlfU) | [The flow of data and Get data directly form the database](../../sources/source_DfVoYtCQlfU_the-flow-of-data-and-get-data-directly-form-the-database.md) | 24 | 2020-04-28T00:00:00Z |
| [H9lARi3re9I](https://www.youtube.com/watch?v=H9lARi3re9I) | [ds.database: Using a Relational Database Management System (RDBMS)](../../sources/source_H9lARi3re9I_ds-database-using-a-relational-database-management-system-rdbms.md) | 335 | 2022-09-27T00:00:00Z |
| [VA3qaeTKTYk](https://www.youtube.com/watch?v=VA3qaeTKTYk) | [Tidying data](../../sources/source_VA3qaeTKTYk_tidying-data.md) | 16 | 2020-04-07T00:00:00Z |
| [o9ZHNEl8UI8](https://www.youtube.com/watch?v=o9ZHNEl8UI8) | [Watch out for type inconsistent code](../../sources/source_o9ZHNEl8UI8_watch-out-for-type-inconsistent-code.md) | 17 | 2020-03-03T00:00:00Z |
| [p-p_4ZcDIGw](https://www.youtube.com/watch?v=p-p_4ZcDIGw) | [Shiny: Your first shiny app](../../sources/source_p-p_4ZcDIGw_shiny-your-first-shiny-app.md) | 275 | 2021-06-01T00:00:00Z |
| [qvQ_YmyjK0U](https://www.youtube.com/watch?v=qvQ_YmyjK0U) | [ds.database: Relational data with dplyr](../../sources/source_qvQ_YmyjK0U_ds-database-relational-data-with-dplyr.md) | 126 | 2022-08-30T00:00:00Z |
| [sPE6MLGUPy4](https://www.youtube.com/watch?v=sPE6MLGUPy4) | [webdata: Scrapping](../../sources/source_sPE6MLGUPy4_webdata-scrapping.md) | 32 | 2022-01-18T00:00:00Z |
| [xxtpMXvVM3s](https://www.youtube.com/watch?v=xxtpMXvVM3s) | [Refactoring: How to prepare for dplyr 1.0.0](../../sources/source_xxtpMXvVM3s_refactoring-how-to-prepare-for-dplyr-1-0-0.md) | 129 | 2020-03-24T00:00:00Z |

## References

- Hadley Wickham — *R for Data Science* (Wrangle: dplyr verbs, pipes, joins)
- Hadley Wickham — *Advanced R* (Type stability, vctrs)
- `dplyr`, `vctrs`, `assertr`, `nycflights13` documentation
