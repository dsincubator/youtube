---
type: Reference
title: ggplot2 Fundamentals
description: Grammar of graphics, ggplot2 layers, geoms, aesthetics, coordinate systems,
  and themes
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
- id: CRcK0SCxGBQ
  resource: https://www.youtube.com/watch?v=CRcK0SCxGBQ
  title: A demo of the package r2dii.plot (by Monika)
  author: process:yt-dlp
  usage_count: 74
  last_modified: '2022-03-01T00:00:00Z'
- id: HJCUlCgEnqM
  resource: https://www.youtube.com/watch?v=HJCUlCgEnqM
  title: 'EDA: Unusual and missing values'
  author: process:yt-dlp
  usage_count: 13
  last_modified: '2021-11-30T00:00:00Z'
- id: Hv6DzT6Z2yA
  resource: https://www.youtube.com/watch?v=Hv6DzT6Z2yA
  title: 'Tidy EDA: Patterns and models'
  author: process:yt-dlp
  usage_count: 42
  last_modified: '2021-12-21T00:00:00Z'
- id: JXfEWLZXwXY
  resource: https://www.youtube.com/watch?v=JXfEWLZXwXY
  title: https://github.com/2DegreesInvesting/ds-incubator/issues/50
  author: process:yt-dlp
  usage_count: 4
  last_modified: '2020-07-07T00:00:00Z'
- id: KxybJ_zVJUA
  resource: https://www.youtube.com/watch?v=KxybJ_zVJUA
  title: 'EDA with the tidyverse: Typical, unusual, and missing values'
  author: process:yt-dlp
  usage_count: 168
  last_modified: '2021-11-16T00:00:00Z'
- id: UeECMfOFIHk
  resource: https://www.youtube.com/watch?v=UeECMfOFIHk
  title: 'Testing: Using snapshot tests to refactor safely'
  author: process:yt-dlp
  usage_count: 24
  last_modified: '2021-05-04T00:00:00Z'
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
- id: pxxcuZH9_yA
  resource: https://www.youtube.com/watch?v=pxxcuZH9_yA
  title: 'Testing: Snapshot tests'
  author: process:yt-dlp
  usage_count: 175
  last_modified: '2021-04-27T00:00:00Z'
---
# ggplot2 Fundamentals

## Overview

`ggplot2` is taught through the grammar of graphics: a plot is layers added with `+`. [source_26hbyVb00xs](../../sources/source_26hbyVb00xs_eda-with-the-tidyverse-exploring-variation.md) and [source_0-zQ69P6VsY](../../sources/source_0-zQ69P6VsY_tidy-eda-the-data-science-workflow-and-toolkit-an-overview.md) introduce the mapping `ggplot(data, aes(...)) + geom_*()`, while covariation sessions ([source_WBmLuUV5BEE](../../sources/source_WBmLuUV5BEE_tidy-eda-covariation-between-one-categorical-variable-and-one-continuous-variable.md), [source_k8GykC4ZXW0](../../sources/source_k8GykC4ZXW0_tidy-eda-covariation-between-two-categorical-variables-and-between-two-continuous-variables.md)) and the pattern/model session ([source_Hv6DzT6Z2yA](../../sources/source_Hv6DzT6Z2yA_tidy-eda-patterns-and-models.md)) vary geoms and aesthetics systematically. The `r2dii.plot` demo ([source_CRcK0SCxGBQ](../../sources/source_CRcK0SCxGBQ_a-demo-of-the-package-r2dii-plot-by-monika.md)) shows a production `ggplot2` wrapper that enforces style while exposing the grammar.

The series also warns via snapshot tests in [source_UeECMfOFIHk](../../sources/source_UeECMfOFIHk_testing-using-snapshot-tests-to-refactor-safely.md): plots are visual regressions, so test them with `expect_snapshot()` / `vdiffr`-style snapshots.

## Key Concepts

- **Grammar**: `data` + `aes(x, y, color, size, shape, alpha)` + `geom_*()` + `facet_*()` + `scale_*()` + `coord_*()` + `theme_*()` / `labs()` — [source_26hbyVb00xs](../../sources/source_26hbyVb00xs_eda-with-the-tidyverse-exploring-variation.md).
- **Geoms by question**: variation with `geom_bar()` (categorical), `geom_histogram()` / `geom_freqpoly()` (continuous), `geom_density()`; covariation with `geom_point()` + `geom_smooth()` (continuous×continuous), `geom_boxplot()` / `geom_violin()` (categorical×continuous), `geom_count()` / `geom_tile()` (categorical×categorical) — [source_WBmLuUV5BEE](../../sources/source_WBmLuUV5BEE_tidy-eda-covariation-between-one-categorical-variable-and-one-continuous-variable.md) and [source_k8GykC4ZXW0](../../sources/source_k8GykC4ZXW0_tidy-eda-covariation-between-two-categorical-variables-and-between-two-continuous-variables.md).
- **Aesthetics and scales**: map variables to `color`, `fill`, `size`; control with `scale_color_manual()`, `scale_x_continuous()` etc. — [source_26hbyVb00xs](../../sources/source_26hbyVb00xs_eda-with-the-tidyverse-exploring-variation.md).
- **Faceting and coordinates**: `facet_wrap(~ var)` / `facet_grid()`, `coord_flip()`, `coord_cartesian()` to zoom without dropping data — [source_Hv6DzT6Z2yA](../../sources/source_Hv6DzT6Z2yA_tidy-eda-patterns-and-models.md).
- **Missing values in plots**: `NA` warnings ("Removed N rows containing missing values"); `geom_miss` exploration in [source_HJCUlCgEnqM](../../sources/source_HJCUlCgEnqM_eda-unusual-and-missing-values.md) — see [EDA: Missing Values](../tidyverse/eda-missing-values.md).
- **Production wrapper**: `r2dii.plot::plot_emission_intensity()` returns a `ggplot` object that can still be `+ theme()`-ed; [source_CRcK0SCxGBQ](../../sources/source_CRcK0SCxGBQ_a-demo-of-the-package-r2dii-plot-by-monika.md) — see [r2dii Packages on CRAN](../data/r2dii-packages.md).
- **Testing plots**: `expect_snapshot()` for textual `ggplot` build output; see [Snapshot Tests](../testing/snapshot-tests.md) and [source_pxxcuZH9_yA](../../sources/source_pxxcuZH9_yA_testing-snapshot-tests.md).

## Example

```r
library(ggplot2)
ggplot(diamonds, aes(cut, fill = clarity)) +
  geom_bar(position = "fill") +
  facet_wrap(~ color) +
  labs(x = "Cut", y = "Proportion", fill = "Clarity") +
  theme_minimal()

ggplot(mpg, aes(displ, hwy, color = class)) +
  geom_point() + geom_smooth(se.method = "lm", se = FALSE) +
  scale_color_brewer(palette = "Dark2")
```

## Sources

| Video | Title | Views | Last Modified |
| [0-zQ69P6VsY](https://www.youtube.com/watch?v=0-zQ69P6VsY) | [Tidy EDA: The data-science workflow and toolkit: An overview](../../sources/source_0-zQ69P6VsY_tidy-eda-the-data-science-workflow-and-toolkit-an-overview.md) | 48 | 2021-11-02T00:00:00Z |
| [26hbyVb00xs](https://www.youtube.com/watch?v=26hbyVb00xs) | [EDA with the tidyverse: Exploring Variation](../../sources/source_26hbyVb00xs_eda-with-the-tidyverse-exploring-variation.md) | 362 | 2021-11-09T00:00:00Z |
| [CRcK0SCxGBQ](https://www.youtube.com/watch?v=CRcK0SCxGBQ) | [A demo of the package r2dii.plot (by Monika)](../../sources/source_CRcK0SCxGBQ_a-demo-of-the-package-r2dii-plot-by-monika.md) | 74 | 2022-03-01T00:00:00Z |
| [HJCUlCgEnqM](https://www.youtube.com/watch?v=HJCUlCgEnqM) | [EDA: Unusual and missing values](../../sources/source_HJCUlCgEnqM_eda-unusual-and-missing-values.md) | 13 | 2021-11-30T00:00:00Z |
| [Hv6DzT6Z2yA](https://www.youtube.com/watch?v=Hv6DzT6Z2yA) | [Tidy EDA: Patterns and models](../../sources/source_Hv6DzT6Z2yA_tidy-eda-patterns-and-models.md) | 42 | 2021-12-21T00:00:00Z |
| [JXfEWLZXwXY](https://www.youtube.com/watch?v=JXfEWLZXwXY) | [https://github.com/2DegreesInvesting/ds-incubator/issues/50](../../sources/source_JXfEWLZXwXY_https-github-com-2degreesinvesting-ds-incubator-issues-50.md) | 4 | 2020-07-07T00:00:00Z |
| [KxybJ](https://www.youtube.com/watch?v=KxybJ) | [EDA with the tidyverse: Typical, unusual, and missing values](../../sources/source_KxybJ_zVJUA_eda-with-the-tidyverse-typical-unusual-and-missing-values.md) | 168 | 2021-11-16T00:00:00Z |
| [UeECMfOFIHk](https://www.youtube.com/watch?v=UeECMfOFIHk) | [Testing: Using snapshot tests to refactor safely](../../sources/source_UeECMfOFIHk_testing-using-snapshot-tests-to-refactor-safely.md) | 24 | 2021-05-04T00:00:00Z |
| [WBmLuUV5BEE](https://www.youtube.com/watch?v=WBmLuUV5BEE) | [Tidy EDA: Covariation between one categorical variable and one continuous variable](../../sources/source_WBmLuUV5BEE_tidy-eda-covariation-between-one-categorical-variable-and-one-continuous-variable.md) | 49 | 2021-12-07T00:00:00Z |
| [k8GykC4ZXW0](https://www.youtube.com/watch?v=k8GykC4ZXW0) | [Tidy EDA: Covariation between two categorical variables and between two continuous variables](../../sources/source_k8GykC4ZXW0_tidy-eda-covariation-between-two-categorical-variables-and-between-two-continuous-variables.md) | 171 | 2021-12-14T00:00:00Z |
| [pxxcuZH9](https://www.youtube.com/watch?v=pxxcuZH9) | [Testing: Snapshot tests](../../sources/source_pxxcuZH9_yA_testing-snapshot-tests.md) | 175 | 2021-04-27T00:00:00Z |
## References

- Hadley Wickham — *R Packages* (Whole game, Documenting, Testing, CRAN)
- Hadley Wickham — *R for Data Science* (Workflow, EDA, ggplot2, dplyr)
- `usethis`, `devtools`, `roxygen2`, `pkgdown`, `targets`, `drake`, `ggplot2` documentation
