---
type: source
title: "Tidy EDA: Covariation between two categorical variables and between two continuous variables"
source_file: "k8GykC4ZXW0_tidy-eda-covariation-between-two-categorical-variables-and-between-two-continuous-variables.md"
video_id: "k8GykC4ZXW0"
url: "https://www.youtube.com/watch?v=k8GykC4ZXW0"
lang: en
tags: ["ds-incubator", "ggplot2", "r-packages", "eda"]
key_topics: ["ggplot2", "covariation", "categorical-variables", "continuous-variables", "overplotting"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=k8GykC4ZXW0"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2021-12-14T00:00:00Z"
    usage_count: 171
usage_window: { from: "2021-12-14T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Tidy EDA: Covariation between two categorical variables and between two continuous variables

## Summary

The final 2021 EDA session with the tidyverse closes the covariation subsection, adding to the previous categorical-vs-continuous video. It uses the `diamonds` dataset and the tidyverse packages `dplyr` and `ggplot2` (via `library(tidyverse)` plus degraded-code live coding).

For two categorical variables the focus is `color` (ordered D best to J worst) and `cut` (ordered Fair to Ideal). After a `select(color, cut)` refresher, `geom_count` automatically maps the count of observations to point area (x=`color`, y=`cut`) revealing a pattern where Ideal diamonds cluster toward better colors with larger areas at top-left. Because area comparisons are hard, the speaker then manually counts with `diamonds %>% count(color, cut)` creating column `n`, and pipes into `ggplot(aes(color, cut, fill=n)) + geom_tile()` to map count to fill color (darker = fewer, lighter = more), noting the pipe `%>%` versus `+` inside ggplot (historical: ggplot predates the pipe).

For two continuous variables the focus is `carat` (weight, double) and `price` (integer, treated continuous) expected to covary strongly. A base `geom_point(aes(carat, price))` shows the expected right-up trend but suffers overplotting where dense points hide structure. The fix with transparency `geom_point(alpha=0.1)` (outside `aes`, as a constant) helps slightly but not enough for very large data. Two 2-D binning alternatives are shown on the filtered `smaller <- diamonds %>% filter(carat < 3)` (removing ~40 outlier rows): `geom_bin2d()` and its alias `geom_bin_2d()` map bin counts to fill with rectangular bins (lighter blue = ~6,000 obs), and `geom_hex()` with hexagonal bins (requires `install.packages("hexbin")`) reveals holes in the data.

To link the categorical techniques, the speaker discretizes `carat` into `carat2` via `mutate(carat2 = cut_width(carat, 0.1))` or `cut_number`, sorting with `arrange(carat)` and inspecting selected columns: `0.23` falls in `(0.15,0.25]` with three rows in one bin. Then `ggplot(aes(carat2, price)) + geom_boxplot()` and grouped variants `aes(carat, price, group = cut_width(carat, 0.1))` / `cut_number(carat, 20)` show price spread per carat bin. Finally the distinction `varwidth = FALSE` (default, equal widths, thin boxes for sparse bins) versus `varwidth = TRUE` (width ∝ n) and `cut_number(..., 20)` (20 equal-count bins, variable carat range) clarifies the covariation: boxes shift up and widen to the right, becoming larger as carat increases.

## Key Concepts & Tools Taught

- **[ggplot2]:** grammar-of-graphics plotting combining data (`ggplot(diamonds)`), aesthetics (`aes(color, cut, fill=n)`), and geoms (`+ geom_tile`, `+ geom_bin2d`) with `+` not `%>%`; abbreviated `diamonds` instead of `data = diamonds` highlights interesting arguments.
- **[covariation]:** relationship between two variables seen as systematic patterns in counts or price spread (e.g., more Ideal diamonds at better colors; larger carat associates with higher price).
- **[categorical-variables]:** ordered factors `color` (D–J) and `cut` (Fair–Ideal) explored via `geom_count` (area ∝ n) and via manual `count(color, cut)` + `geom_tile(aes(fill=n))`.
- **[continuous-variables]:** `carat` and `price` explored via scatter plots and binning; `filter(carat < 3)` trims outliers before 2-D bins.
- **[overplotting]:** many points stacked hide density; mitigated by `alpha = 0.1` transparency, and more effectively by `geom_bin2d` / `geom_hex` (needs `hexbin` package) mapping count to fill, plus discretizing with `cut_width`/`cut_number` + `geom_boxplot(varwidth=)` to show observation counts per box.

## Code Snippets & Formulas

Spoken calls dictated live (mangled caption fragments normalized here):

```r
library(tidyverse)  # "attaching the tigers package ... including ... deep player ... and also the package ggplot2 which is the start of the show" — tigers / deep player ← tidyverse / dplyr

# Two categorical: select and preview ordered factors
diamonds %>% select(color, cut)  # "if we want to select those two variables only we would use the verb select from the player" — select ← select

# Automatically count → area
ggplot(diamonds, aes(color, cut)) + geom_count()  # "use genome count which automatically maps the amount of the number of observations to the area of points" — genome count ← geom_count

# Manual count → fill
diamonds %>% count(color, cut)  # "i'm going to count first manually using d plier and the number of observations ... by color and cut ... what we get is a new column called n" — count ← count
diamonds %>% count(color, cut) %>% ggplot(aes(color, cut, fill = n)) + geom_tile()  # "but instead john tile ... now we use a third dimension ... to map it to the field color" — john tile / geom tile ← geom_tile

# Two continuous: filter then scatter with overplotting fixes
smaller <- diamonds %>% filter(carat < 3)  # "now we're gonna be working with this a little smaller data set that ... takes only the rows where karat is smaller than three ... only 40 observations are actually lost" — karat ← carat

ggplot(diamonds, aes(carat, price)) + geom_point()             # "is to use a scatter plot and remember that in ggplot2 is ... the function g on point" — g on point ← geom_point
ggplot(diamonds, aes(carat, price)) + geom_point(alpha = 0.1)  # "the argument that does that is alpha ... we made the points say a 10 percent transparent" — alpha ← alpha

# 2-D bins
ggplot(smaller, aes(carat, price)) + geom_bin2d()   # "there is a very interesting function ... called gm bin bin 2d" — gm bin bin 2d ← geom_bin2d
ggplot(smaller, aes(carat, price)) + geom_bin_2d()  # alias — "these two are the same thing i tried it ... compare them with identical and they are identical" — identical ← identical
ggplot(smaller, aes(carat, price)) + geom_hex()     # "the function is called geom hex ... now with hexagons as opposed to two squares" — geom hex ← geom_hex
install.packages("hexbin")  # "for that function gm hex to work you need to install the hex bin package ... with install.packages" — hex bin ← hexbin

# Discretize continuous → categorical then boxplots
smaller %>% mutate(carat2 = cut_width(carat, 0.1)) %>% arrange(carat) %>% select(price, cut, carat2) # "i'm going to use the function mutate ... to add a new column ... called 2 ... we are grouping continuous observations into bins that are as wide as 0.1" — mutate / carat2 ← mutate
ggplot(smaller, aes(carat2, price)) + geom_boxplot()  # naive categorical axis
ggplot(smaller, aes(carat, price, group = cut_width(carat, 0.1))) + geom_boxplot()       # "the way you do that ... directly with a new argument called group ... grouping the karat variable" — group ← group
ggplot(smaller, aes(carat, price, group = cut_number(carat, 20))) + geom_boxplot()       # "instead of using the cut with we're going to use the function cut number" — cut number ← cut_number
ggplot(smaller, aes(carat, price, group = cut_width(carat, 0.1))) + geom_boxplot(varwidth = TRUE)  # "if you say varwidth true ... we have very thin boxes for ... beans that have very few observations" — varwidth ← varwidth
```
