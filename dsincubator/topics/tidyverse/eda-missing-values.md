---
type: Playbook
title: 'EDA: Missing Values'
description: Identifying and handling unusual and missing values in exploratory data
  analysis
lang: en
tags:
- ds-incubator
generated:
  by: agent:okf-wiki-builder/1.0
  at: '2026-09-08T04:00:00Z'
status: draft
sources:
- id: HJCUlCgEnqM
  resource: https://www.youtube.com/watch?v=HJCUlCgEnqM
  title: 'EDA: Unusual and missing values'
  author: process:yt-dlp
  usage_count: 13
  last_modified: '2021-11-30T00:00:00Z'
- id: KxybJ_zVJUA
  resource: https://www.youtube.com/watch?v=KxybJ_zVJUA
  title: 'EDA with the tidyverse: Typical, unusual, and missing values'
  author: process:yt-dlp
  usage_count: 168
  last_modified: '2021-11-16T00:00:00Z'
---

# EDA: Missing Values

## Overview

Missing and unusual values are the EDA step where hypothetical patterns are tested against data quality. Two sessions cover the same workflow with different emphasis: [source_KxybJ_zVJUA](../../sources/source_KxybJ_zVJUA_eda-with-the-tidyverse-typical-unusual-and-missing-values.md) introduces typical values then previews the outlier→`NA`→logical pipeline, while [source_HJCUlCgEnqM](../../sources/source_HJCUlCgEnqM_eda-unusual-and-missing-values.md) executes it end-to-end on `diamonds` (`price`, `carat`, `x`, `y`, `z`). Toolkit is `tidyverse` + `ggplot2` with `dplyr` filtering and `coord_cartesian` zooming.

This Playbook follows [EDA: Exploring Variation](../tidyverse/eda-exploring-variation.md) and precedes [EDA: Covariation Analysis](../tidyverse/eda-covariation.md); handling `NA` correctly prevents distorted covariation and feeds residual inspection in [Tidy EDA: Patterns and Models].

## Key Concepts

- **Typical values**: tallest bars in `geom_histogram(binwidth=0.01)` on `smaller <- diamonds %>% filter(carat<3)` reveal peaks at whole/nice fractions (1, 1.5) with right bias (rounded carats sell, cutters err high) — [source_KxybJ_zVJUA](../../sources/source_KxybJ_zVJUA_eda-with-the-tidyverse-typical-unusual-and-missing-values.md).
- **Binwidth sensitivity**: `binwidth=0.01` shows fraction peaks; `binwidth=0.5` collapses to single mode ~0.5 carat; no default is correct — try many `binwidth`s, `geom_density` overlay, `cut_width` family — [source_KxybJ_zVJUA](../../sources/source_KxybJ_zVJUA_eda-with-the-tidyverse-typical-unusual-and-missing-values.md).
- **Detect visually**: `ggplot(diamonds, aes(x=y)) + geom_histogram(binwidth=0.5)` hides extremes in white-space; `coord_cartesian(ylim=c(0,50))` preserves data and reveals 9 points near 0 / 30–60, whereas `ylim()`/`xlim()` drops data with warning "Removed N rows containing missing values" — [source_HJCUlCgEnqM](../../sources/source_HJCUlCgEnqM_eda-unusual-and-missing-values.md).
- **Detect analytically**: `diamonds %>% filter(y < 3 | y > 20) %>% select(price,x,y,z) %>% arrange(y)` isolates 9 rows (e.g., price $5,139 with `x=0`, `y=0`, length 58.9); `between(y,3,20)` variant — [source_HJCUlCgEnqM](../../sources/source_HJCUlCgEnqM_eda-unusual-and-missing-values.md).
- **Decide treatment**: repeat analysis with/without outliers; if removal has no effect little justification needed, otherwise document; demo keeps row but nullifies column: `diamonds2 <- diamonds %>% mutate(y = if_else(y < 3 | y > 20, NA_real_, y))` — [source_HJCUlCgEnqM](../../sources/source_HJCUlCgEnqM_eda-unusual-and-missing-values.md).
- **`if_else` vs `case_when`**: `if_else` compact for single condition, `case_when(... ~ ...)` for many branches — [source_HJCUlCgEnqM](../../sources/source_HJCUlCgEnqM_eda-unusual-and-missing-values.md).
- **Missing → logical**: `diamonds3 <- diamonds2 %>% mutate(is_error = is.na(y))` then `count(is_error)` (9 TRUE / ~53,931 FALSE) and `ggplot(diamonds3, aes(is_error)) + geom_bar() + coord_cartesian(ylim=c(0,100))` makes errors visible; `geom_point` on `diamonds2` warns "removed 9 rows containing missing values" — [source_HJCUlCgEnqM](../../sources/source_HJCUlCgEnqM_eda-unusual-and-missing-values.md).

## Example

```r
smaller <- diamonds %>% filter(carat < 3)
ggplot(smaller, aes(carat)) + geom_histogram(binwidth = 0.01)
ggplot(smaller, aes(carat)) + geom_histogram(binwidth = 0.5)

ggplot(diamonds, aes(x = y)) + geom_histogram(binwidth = 0.5) + coord_cartesian(ylim = c(0, 50))
diamonds %>% filter(y < 3 | y > 20) %>% select(price, x, y, z) %>% arrange(y)

diamonds2 <- diamonds %>% mutate(y = if_else(y < 3 | y > 20, NA_real_, y))
ggplot(diamonds2, aes(x, y)) + geom_point()

diamonds3 <- diamonds2 %>% mutate(is_error = is.na(y))
count(diamonds3, is_error)
ggplot(diamonds3, aes(is_error)) + geom_bar() + coord_cartesian(ylim = c(0, 100))
```

## Sources

| Video | Title | Views | Last Modified |
|---|---|---|---|
| [HJCUlCgEnqM](https://www.youtube.com/watch?v=HJCUlCgEnqM) | [EDA: Unusual and missing values](../../sources/source_HJCUlCgEnqM_eda-unusual-and-missing-values.md) | 13 | 2021-11-30T00:00:00Z |
| [KxybJ_zVJUA](https://www.youtube.com/watch?v=KxybJ_zVJUA) | [EDA with the tidyverse: Typical, unusual, and missing values](../../sources/source_KxybJ_zVJUA_eda-with-the-tidyverse-typical-unusual-and-missing-values.md) | 168 | 2021-11-16T00:00:00Z |

## References

- Hadley Wickham — *R for Data Science* (EDA: Missing values, Unusual values)
- `ggplot2` (`coord_cartesian`), `dplyr` (`filter`, `is.na`, `if_else`)
