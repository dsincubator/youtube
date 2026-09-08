---
type: Playbook
title: 'EDA: Covariation Analysis'
description: Covariation between categorical and continuous variables, correlation,
  and visualization
lang: en
tags:
- ds-incubator
generated:
  by: agent:okf-wiki-builder/1.0
  at: '2026-09-08T04:00:00Z'
status: draft
sources:
- id: Hv6DzT6Z2yA
  resource: https://www.youtube.com/watch?v=Hv6DzT6Z2yA
  title: 'Tidy EDA: Patterns and models'
  author: process:yt-dlp
  usage_count: 42
  last_modified: '2021-12-21T00:00:00Z'
- id: WBmLuUV5BEE
  resource: https://www.youtube.com/watch?v=WBmLuUV5BEE
  title: 'Tidy EDA: Covariation between one categorical variable and one continuous
    variable'
  author: process:yt-dlp
  usage_count: 49
  last_modified: '2021-12-07T00:00:00Z'
- id: k8GykC4ZXW0
  resource: https://www.youtube.com/watch?v=k8GykC4ZXW0
  title: 'Tidy EDA: Covariation between two categorical variables and between two
    continuous variables'
  author: process:yt-dlp
  usage_count: 171
  last_modified: '2021-12-14T00:00:00Z'
---

# EDA: Covariation Analysis

## Overview

Covariation is the tendency of two variables to vary together. The incubator teaches it in two stages: categorical × continuous ([source_WBmLuUV5BEE](../../sources/source_WBmLuUV5BEE_tidy-eda-covariation-between-one-categorical-variable-and-one-continuous-variable.md)) then categorical × categorical and continuous × continuous ([source_k8GykC4ZXW0](../../sources/source_k8GykC4ZXW0_tidy-eda-covariation-between-two-categorical-variables-and-between-two-continuous-variables.md)), closing with models that disentangle confounding ([source_Hv6DzT6Z2yA](../../sources/source_Hv6DzT6Z2yA_tidy-eda-patterns-and-models.md)). Datasets are `diamonds` (`cut`, `color`, `carat`, `price`) and `mpg` (`class`, `hwy`), with `faithful` for the residual demo.

This Playbook links to [EDA: Exploring Variation](../tidyverse/eda-exploring-variation.md) (univariate before bivariate), [EDA: Missing Values](../tidyverse/eda-missing-values.md) (outliers distort covariation), and [ggplot2 Fundamentals](../tidyverse/ggplot2-fundamentals.md).

## Key Concepts

- **Definition**: covariation = systematic association; visualization choice depends on types — categorical×continuous, categorical×categorical, continuous×continuous — [source_WBmLuUV5BEE](../../sources/source_WBmLuUV5BEE_tidy-eda-covariation-between-one-categorical-variable-and-one-continuous-variable.md), [source_k8GykC4ZXW0](../../sources/source_k8GykC4ZXW0_tidy-eda-covariation-between-two-categorical-variables-and-between-two-continuous-variables.md).
- **Categorical × continuous**:
  - `geom_freqpoly(aes(price, colour=cut))` with `y = ..density..` (area → 1) normalizes groups of unequal size; raw `count` hides small groups — [source_WBmLuUV5BEE](../../sources/source_WBmLuUV5BEE_tidy-eda-covariation-between-one-categorical-variable-and-one-continuous-variable.md).
  - `geom_boxplot(aes(cut, price))` summary: median line, box 25–75% (IQR), whiskers to last non-outlier, outliers beyond 1.5×IQR; `cut` ordered — [source_WBmLuUV5BEE](../../sources/source_WBmLuUV5BEE_tidy-eda-covariation-between-one-categorical-variable-and-one-continuous-variable.md).
  - Style: drop `data=`/`mapping=` noise, store `aes()` in variable, `reorder(class, hwy, median)` + `coord_flip()` — [source_WBmLuUV5BEE](../../sources/source_WBmLuUV5BEE_tidy-eda-covariation-between-one-categorical-variable-and-one-continuous-variable.md).
- **Categorical × categorical** (`color` D-best→J vs `cut` Fair→Ideal):
  - `geom_count(aes(color, cut))` area ∝ n; manual `count(color, cut)` + `ggplot(aes(color, cut, fill=n)) + geom_tile()` maps `n` to fill (darker=fewer) — [source_k8GykC4ZXW0](../../sources/source_k8GykC4ZXW0_tidy-eda-covariation-between-two-categorical-variables-and-between-two-continuous-variables.md).
- **Continuous × continuous** (`carat` vs `price`):
  - `geom_point(aes(carat, price))` shows positive trend but overplots; `alpha=0.1` helps slightly — [source_k8GykC4ZXW0](../../sources/source_k8GykC4ZXW0_tidy-eda-covariation-between-two-categorical-variables-and-between-two-continuous-variables.md).
  - `geom_bin2d()` / `geom_bin_2d()` (rectangles) and `geom_hex()` (hexagons, needs `hexbin`) map bin counts to fill; filter `carat < 3` removes ~40 outliers first — [source_k8GykC4ZXW0](../../sources/source_k8GykC4ZXW0_tidy-eda-covariation-between-two-categorical-variables-and-between-two-continuous-variables.md).
  - Discretize then boxplot: `mutate(carat2 = cut_width(carat, 0.1))` + `geom_boxplot()` or `aes(carat, price, group=cut_width(carat, 0.1))`; `varwidth=TRUE` width ∝ n vs `cut_number(carat, 20)` equal-count bins — [source_k8GykC4ZXW0](../../sources/source_k8GykC4ZXW0_tidy-eda-covariation-between-two-categorical-variables-and-between-two-continuous-variables.md).
- **Patterns → models**: confounding `cut` vs `price` (fair looks expensive) explained by `cut` vs `carat` and `carat` vs `price`; model `lm(log(price) ~ carat)` + `modelr::add_residuals()` + `exp(resid)` gives size-adjusted price where better cut costs more — [source_Hv6DzT6Z2yA](../../sources/source_Hv6DzT6Z2yA_tidy-eda-patterns-and-models.md).

## Example

```r
ggplot(diamonds, aes(price, colour=cut)) + geom_freqpoly()
ggplot(diamonds, aes(price, y=..density.., colour=cut)) + geom_freqpoly()
ggplot(diamonds, aes(cut, price)) + geom_boxplot()

diamonds %>% count(color, cut) %>% ggplot(aes(color, cut, fill=n)) + geom_tile()

ggplot(diamonds, aes(carat, price)) + geom_point(alpha=0.1)
smaller <- diamonds %>% filter(carat < 3)
ggplot(smaller, aes(carat, price)) + geom_bin2d()
ggplot(smaller, aes(carat, price)) + geom_hex()  # needs hexbin

smaller %>% mutate(carat2=cut_width(carat, 0.1)) %>% ggplot(aes(carat2, price)) + geom_boxplot()
ggplot(smaller, aes(carat, price, group=cut_width(carat, 0.1))) + geom_boxplot(varwidth=TRUE)

library(modelr)
mod <- lm(log(price) ~ carat, data=diamonds)
diamonds %>% add_residuals(mod) %>% mutate(resid=exp(resid)) %>% ggplot(aes(cut, resid)) + geom_boxplot()
```

## Sources

| Video | Title | Views | Last Modified |
|---|---|---|---|
| [Hv6DzT6Z2yA](https://www.youtube.com/watch?v=Hv6DzT6Z2yA) | [Tidy EDA: Patterns and models](../../sources/source_Hv6DzT6Z2yA_tidy-eda-patterns-and-models.md) | 42 | 2021-12-21T00:00:00Z |
| [WBmLuUV5BEE](https://www.youtube.com/watch?v=WBmLuUV5BEE) | [Tidy EDA: Covariation between one categorical variable and one continuous variable](../../sources/source_WBmLuUV5BEE_tidy-eda-covariation-between-one-categorical-variable-and-one-continuous-variable.md) | 49 | 2021-12-07T00:00:00Z |
| [k8GykC4ZXW0](https://www.youtube.com/watch?v=k8GykC4ZXW0) | [Tidy EDA: Covariation between two categorical variables and between two continuous variables](../../sources/source_k8GykC4ZXW0_tidy-eda-covariation-between-two-categorical-variables-and-between-two-continuous-variables.md) | 171 | 2021-12-14T00:00:00Z |

## References

- Hadley Wickham — *R for Data Science* (EDA: Covariation, Models)
- `ggplot2`, `modelr` documentation
