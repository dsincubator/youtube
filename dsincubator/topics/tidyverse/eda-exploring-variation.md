---
type: Playbook
title: 'EDA: Exploring Variation'
description: Exploring covariation between variables, univariate and bivariate analysis
  with the tidyverse
lang: en
tags:
- ds-incubator
generated:
  by: agent:okf-wiki-builder/1.0
  at: '2026-09-08T04:00:00Z'
status: draft
sources:
- id: 26hbyVb00xs
  resource: https://www.youtube.com/watch?v=26hbyVb00xs
  title: 'EDA with the tidyverse: Exploring Variation'
  author: process:yt-dlp
  usage_count: 362
  last_modified: '2021-11-09T00:00:00Z'
- id: Hv6DzT6Z2yA
  resource: https://www.youtube.com/watch?v=Hv6DzT6Z2yA
  title: 'Tidy EDA: Patterns and models'
  author: process:yt-dlp
  usage_count: 42
  last_modified: '2021-12-21T00:00:00Z'
- id: PRKOMCCOlI0
  resource: https://www.youtube.com/watch?v=PRKOMCCOlI0
  title: Continuously build and deploy a shiny app on Google Cloud Run
  author: process:yt-dlp
  usage_count: 688
  last_modified: '2024-07-05T00:00:00Z'
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

# EDA: Exploring Variation

## Overview

Exploring variation is the first generic EDA question: how does one variable vary when measured repeatedly? The series, anchored in *R for Data Science*, pairs it with covariation as the two questions that apply to any dataset. [source_26hbyVb00xs](../../sources/source_26hbyVb00xs_eda-with-the-tidyverse-exploring-variation.md) builds the template on `diamonds` with `cut` (categorical) and `carat` (continuous), [source_Hv6DzT6Z2yA](../../sources/source_Hv6DzT6Z2yA_tidy-eda-patterns-and-models.md) situates variation in the uncertainty view (variation adds uncertainty, patterns reduce it), and the covariation videos ([source_WBmLuUV5BEE](../../sources/source_WBmLuUV5BEE_tidy-eda-covariation-between-one-categorical-variable-and-one-continuous-variable.md), [source_k8GykC4ZXW0](../../sources/source_k8GykC4ZXW0_tidy-eda-covariation-between-two-categorical-variables-and-between-two-continuous-variables.md)) reuse the same datasets to show the next step. [source_PRKOMCCOlI0](../../sources/source_PRKOMCCOlI0_continuously-build-and-deploy-a-shiny-app-on-google-cloud-run.md) is the Cloud Run outlier (no variation content) included per plan for build concerns.

Playbook flow: list packages at top → `glimpse`/`select` → `geom_bar` or `geom_histogram` → count with `dplyr` → vary `binwidth` → filter/overlay groups with `geom_freqpoly` → ask why peaks/gaps appear.

See also [EDA: Covariation Analysis](../tidyverse/eda-covariation.md), [EDA: Missing Values](../tidyverse/eda-missing-values.md), and [ggplot2 Fundamentals](../tidyverse/ggplot2-fundamentals.md).

## Key Concepts

- **Two variable types**: categorical (limited values, e.g., `cut` = fair/good/very good/premium/ideal) vs continuous (ordered continuum, e.g., `carat` 0.23) — [source_26hbyVb00xs](../../sources/source_26hbyVb00xs_eda-with-the-tidyverse-exploring-variation.md).
- **Categorical variation**: `ggplot(diamonds, aes(x=cut)) + geom_bar()` counts instances per level; analytically `diamonds %>% count(cut)` produces `n` that `geom_bar` computes — [source_26hbyVb00xs](../../sources/source_26hbyVb00xs_eda-with-the-tidyverse-exploring-variation.md).
- **Continuous variation**: `ggplot(diamonds, aes(x=carat)) + geom_histogram(binwidth=0.5)` bins then counts; `binwidth` controls detail — try 0.01 vs 0.5 to avoid hidden/false patterns — [source_26hbyVb00xs](../../sources/source_26hbyVb00xs_eda-with-the-tidyverse-exploring-variation.md).
- **Analytical mirror**: `mutate(carat_cut = cut_width(carat, width=0.5)) %>% count(carat_cut)` discretizes then counts; `cut_interval`/`cut_number` alternatives — [source_26hbyVb00xs](../../sources/source_26hbyVb00xs_eda-with-the-tidyverse-exploring-variation.md).
- **Overlay groups**: `smaller <- diamonds %>% filter(carat < 3)` then `ggplot(smaller, aes(carat, colour=cut)) + geom_freqpoly(binwidth=0.5)` keeps overlaps readable vs stacked `geom_histogram` — [source_26hbyVb00xs](../../sources/source_26hbyVb00xs_eda-with-the-tidyverse-exploring-variation.md).
- **From variation to pattern**: variation = question, patterns/models = answers that reduce uncertainty — [source_Hv6DzT6Z2yA](../../sources/source_Hv6DzT6Z2yA_tidy-eda-patterns-and-models.md).

## Example

```r
library(tidyverse)
diamonds %>% relocate(cut)
ggplot(diamonds, aes(x = cut)) + geom_bar()
diamonds %>% count(cut)

ggplot(diamonds, aes(x = carat)) + geom_histogram(binwidth = 0.5)
diamonds %>% mutate(carat_cut = cut_width(carat, width = 0.5)) %>% count(carat_cut)

smaller <- diamonds %>% filter(carat < 3)
ggplot(smaller, aes(carat, colour = cut)) + geom_freqpoly(binwidth = 0.5)
```

## Sources

| Video | Title | Views | Last Modified |
|---|---|---|---|
| [26hbyVb00xs](https://www.youtube.com/watch?v=26hbyVb00xs) | [EDA with the tidyverse: Exploring Variation](../../sources/source_26hbyVb00xs_eda-with-the-tidyverse-exploring-variation.md) | 362 | 2021-11-09T00:00:00Z |
| [Hv6DzT6Z2yA](https://www.youtube.com/watch?v=Hv6DzT6Z2yA) | [Tidy EDA: Patterns and models](../../sources/source_Hv6DzT6Z2yA_tidy-eda-patterns-and-models.md) | 42 | 2021-12-21T00:00:00Z |
| [PRKOMCCOlI0](https://www.youtube.com/watch?v=PRKOMCCOlI0) | [Continuously build and deploy a shiny app on Google Cloud Run](../../sources/source_PRKOMCCOlI0_continuously-build-and-deploy-a-shiny-app-on-google-cloud-run.md) | 688 | 2024-07-05T00:00:00Z |
| [WBmLuUV5BEE](https://www.youtube.com/watch?v=WBmLuUV5BEE) | [Tidy EDA: Covariation between one categorical variable and one continuous variable](../../sources/source_WBmLuUV5BEE_tidy-eda-covariation-between-one-categorical-variable-and-one-continuous-variable.md) | 49 | 2021-12-07T00:00:00Z |
| [k8GykC4ZXW0](https://www.youtube.com/watch?v=k8GykC4ZXW0) | [Tidy EDA: Covariation between two categorical variables and between two continuous variables](../../sources/source_k8GykC4ZXW0_tidy-eda-covariation-between-two-categorical-variables-and-between-two-continuous-variables.md) | 171 | 2021-12-14T00:00:00Z |

## References

- Hadley Wickham — *R for Data Science* (EDA: Variation, Visualisation)
- `ggplot2` reference / cheatsheet, `dplyr` single-table verbs
