---
type: source
title: "EDA: Unusual and missing values"
source_file: "HJCUlCgEnqM_eda-unusual-and-missing-values.md"
video_id: "HJCUlCgEnqM"
url: "https://www.youtube.com/watch?v=HJCUlCgEnqM"
lang: en
tags: ["ds-incubator", "ggplot2", "r-packages", "eda"]
key_topics: ["outliers", "missing-values", "ggplot2", "coord-cartesian", "if-else"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=HJCUlCgEnqM"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 13
    last_modified: "2021-11-30T00:00:00Z"
usage_window: { from: "2021-11-30T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# EDA: Unusual and missing values

## Summary

This session continues the tidyverse EDA series, moving from typical values to unusual and missing values. The presenter works with the `diamonds` dataset from ggplot2, focusing on the variables price, carat, x, y and z, after introducing repository notes in `ds.tidy.eda/05 unusual and missing values`.

The first objective is to detect outliers both visually and analytically. Visually, a histogram of `y` with `geom_histogram(aes(x=y))` shows a large white-space hint on the x-axis because a few extreme values are hidden when scaled to ~30,000 counts. Zooming with `coord_cartesian(ylim=c(0,50))` preserves data and reveals 9 points near 0 and near 30–60, whereas `xlim`/`ylim` is lossy and drops data with a warning about removed missing values. Analytically, filtering `filter(y < 3 | y > 20) |> select(price, x, y, z) |> arrange(y)` isolates those 9 rows; inspection shows data-entry errors such as price $5,139 with dimensions 0 and a 58.9 mm length.

The second objective is deciding when to treat outliers as missing values: repeat the analysis with and without them; if removal has no effect the replacement needs little justification, otherwise it must be documented. The demo keeps the rows but nullifies the faulty column with `mutate(y = if_else(y < 3 | y > 20, NA, y))`, creating `diamonds2`, and discusses `if_else` versus `case_when` (single condition compact versus stacked, more readable for many conditions). A scatter plot `geom_point(aes(x=x, y=y))` on `diamonds2` warns that 9 rows containing missing values were removed.

The final objective converts missing values into a logical variable for counting and plotting: `mutate(is_error = is.na(y))` producing `diamonds3`, then `count(is_error)` (9 TRUE, ~53,931 FALSE) and a bar plot of `is_error` zoomed again with `coord_cartesian` to make the 9 errors visible against the large FALSE bar.

## Key Concepts & Tools Taught

- **[outliers]:** Observations that do not fit the main pattern; illustrated by extreme `y` values hidden in a full-scale histogram and revealed by zooming.
- **[missing-values]:** Represented as `NA`; created by replacing data-entry errors so the row is kept but that column is nullified for downstream analysis and plotting.
- **[ggplot2]:** Package used with `ggplot(diamonds) + geom_histogram` and `geom_point` to visualise distributions; aesthetic mappings via `aes(x=y)` and histogram `binwidth` control.
- **[coord-cartesian]:** Zoom that preserves data by changing plot coordinates (`coord_cartesian(ylim=c(0,50))` / `coord_cartesian(ylim=c(0,100))`) versus `ylim`/`xlim` which crops data lossily and warns about removed missing values; both approaches discussed for handling scale and overplotting.
- **[if-else]:** Conditional replacement with `if_else(y < 3 | y > 20, NA, y)` inside `mutate`; contrasted with `case_when` which stacks multiple conditions with `~` for readability when many branches are needed, while `if_else` is more compact for a single condition.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```r
library(tidyverse)                          # "i'm going to run library titles" — attaches dplyr + ggplot2
select(price, carat, x, y, z)               # "we can use the function select as we learned"
?diamonds                                   # "i'm going to do question mark diamonds to get the health file"
ggplot(diamonds, aes(x = y)) +              # "the ggplot function has a first argument called data"
  geom_histogram(aes(x = y), binwidth = 0.5) # "the geom histogram and all geom functions have a mapping argument ... aes for aesthetic ... bandwidth the being with"
  coord_cartesian(ylim = c(0, 50))          # "function in gg plot 2 is called chord cartesian ... y limb ... minimum 0 and maximum 50" — preserves data
  # vs lossy:
  ylim(c(0, 50)) + xlim(c(3, 20))           # "is called while limb ... lossy basically loses data ... some missing values have been removed" — warning

diamonds |> filter(y < 3 | y > 20) |>       # "filtering only the rows where the variable y has values is either smaller than 3 or greater than 20"
  select(price, x, y, z) |>                 # "focus just on price x y and z columns"
  arrange(y)                                # "arrange the data set by the values of y"

between(y, 3, 20)                            # "function between which the player knows about ... pick the variables between 3 and 20"
diamonds2 <- diamonds |>
  mutate(y = if_else(y < 3 | y > 20, NA_real_, y)) # "if fails if else ... takes a condition ... if the variable y is less than 3 or more than 20 then transform those specific values in missing values"

ggplot(diamonds2, aes(x = x, y = y)) +
  geom_point()                              # "scatter plot is with a function g on point because the scatter plot is just a bunch of little points" — warns: removed 9 rows containing missing values

diamonds3 <- diamonds2 |>
  mutate(is_error = is.na(y))               # "function is an a which allows us ... is error ... true where the values of y are an a"
count(diamonds3, is_error)                  # "we can use the function count from the player ... count truths as ones and falses as zeros" — 9 TRUE

ggplot(diamonds3, aes(x = is_error)) +
  geom_bar() +
  coord_cartesian(ylim = c(0, 100))         # "zoom in into that plot maybe with a trick that we learned before with chords cartesian ... focus on the first hundred on the y-axis but with x-limb arguments"
```
