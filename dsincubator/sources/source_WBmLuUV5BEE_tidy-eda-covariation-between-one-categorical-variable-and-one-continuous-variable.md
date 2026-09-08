---
type: source
title: "Tidy EDA: Covariation between one categorical variable and one continuous variable"
source_file: "WBmLuUV5BEE_tidy-eda-covariation-between-one-categorical-variable-and-one-continuous-variable.md"
video_id: "WBmLuUV5BEE"
url: "https://www.youtube.com/watch?v=WBmLuUV5BEE"
lang: en
tags: ["ds-incubator", "ggplot2", "r-packages", "eda"]
key_topics: ["covariation", "ggplot2", "boxplot", "density", "frequency-polygon"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=WBmLuUV5BEE"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 49
    last_modified: "2021-12-07T00:00:00Z"
usage_window: { from: "2021-12-07T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Tidy EDA: Covariation between one categorical variable and one continuous variable

## Summary

A DS Incubator session on exploring covariation — the tendency of two variables to vary together — focused on one categorical and one continuous variable. Using the `tidyverse`, the speaker works with the `diamonds` dataset from `ggplot2` (variables `cut` — an ordered factor with levels fair < good < very good < premium < ideal — and `price`) and the `mpg` dataset (`class` and `hwy`) to show how the choice of visualisation depends on variable types.

The session first builds a frequency polygon (`geom_freqpoly`) mapping `price` on x and colouring by `cut`. The raw count scale is dominated by the much larger `ideal` group, compressing the `fair` curve, so the speaker switches the y aesthetic from the default `count` to `..density..` so the area under each curve standardizes to one, making comparison possible and revealing a surprising pattern: fair diamonds — the lowest quality — appear to have the highest average price.

A second visualisation uses `geom_boxplot`, explained as a summary from histogram to box: median prominently marked, box spanning 25th to 75th percentile (interquartile range), whiskers to the last non-outlier point, and outliers beyond 1.5 × IQR plotted individually. The boxplot confirms the price pattern and shows that `cut` plots in sensible ordered-factor order.

The talk then turns to coding style: removing repeated explicit argument names (`data =`, `mapping =`, `aes()`) that become visual noise, storing `ggplot2` objects in variables (e.g., an `aes(x = class, y = hwy)` object), distinguishing `ggplot(mapping)` versus `geom_*(mapping)` inheritance, ordering unordered factors with `reorder(class, hwy, median)` for readability, and flipping overlapping axis labels with `coord_flip()` (a companion to `coord_cartesian()`).

## Key Concepts & Tools Taught

- **[covariation]:** Definition as two variables varying in a related way; exploration strategy depends on whether variables are categorical or continuous.
- **[ggplot2]:** Grammar of graphics; building plots from a data set, aesthetic mappings, and geometric layers. Argument-noise reduction by omitting repeated `data =` and `mapping =` names.
- **[frequency-polygon]:** `geom_freqpoly` with `aes(x = price, colour = cut)`. Default y is `count`; switching to `..density..` standardizes each curve to area one for comparison across groups of different sizes.
- **[density]:** The `..density..` computed variable (`dot dot density` in captions) used as `y = ..density..` inside `aes()` to normalize frequency polygons.
- **[boxplot]:** `geom_boxplot` summary — box 25th–75th percentile, median line, interquartile range, whiskers to last non-outlier, outliers beyond 1.5 × IQR. Interpretation via visual mapping from 1-d distribution to histogram to box.
- **[ordered-factor]:** `cut` stored as an ordered factor; `mpg::class` as unordered character; inspecting levels with `dplyr::distinct()` + `pull()` and reordering with `reorder()` by median `hwy` for sorted display.
- **[coord_flip]:** `coord_flip()` to flip coordinate system when x-axis labels overlap, contrasted with `coord_cartesian()` for limits.
- **[storing-ggplot-objects]:** Any `ggplot2` element (including an `aes()` mapping) can be stored in an R object and reused across layers; demonstration with `class_highway` and `class_reorder_by_median_hwy` mappings passed to `geom_boxplot()`.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```r
library(tidyverse)  # "library television" / "loading the tibers" — tidalverse ← tibers / television

# Selecting columns — dplyr helper
dplyr::select(diamonds, cut, price)  # "using deep flyer the select function comes from d player" — deep flyer ← dplyr, select

# ggplot2 — explicit vs compact argument style — "we have been using gt plot 2 already quite a bit" → ggplot2 ← gt plot 2
ggplot(data = diamonds, mapping = aes(x = price, colour = cut)) + geom_freqpoly()
ggplot(diamonds, aes(price, colour = cut)) + geom_freqpoly()  # "removing the data equal explicit call" — same plot, less noise

# Frequency polygon — count vs density
ggplot(diamonds, aes(price, colour = cut)) + geom_freqpoly()                  # y defaults to count
ggplot(diamonds, aes(price, y = ..density.., colour = cut)) + geom_freqpoly() # "dot dot density" — normalizes area to 1

# Boxplot — aes inheritance at ggplot vs geom level
ggplot(diamonds, aes(x = cut, y = price)) + geom_boxplot()  # "geom box plot" — geom_boxplot ← geom box plot
ggplot() + geom_boxplot(mapping = aes(x = cut, y = price))  # mapping can live in either layer; top-level applies to all layers

# Ordered vs unordered factors
dplyr::distinct(diamonds, cut) %>% dplyr::pull(cut)  # "the function distinct coming from d player and then we pull the var" — distinct / pull
# cut levels: fair < good < very good < premium < ideal (ordered)
# class levels: unordered strings (e.g., suv, pickup, compact)

# Storing aesthetics in a variable
class_highway <- aes(x = class, y = hwy)  # "class underscore highway" — aes ← a e s
print(class_highway)
ggplot(mpg, class_highway) + geom_boxplot()  # variable reused as mapping

# Ordering for readability
class_reorder_by_median_hwy <- aes(x = reorder(class, hwy, median), y = hwy)  # "the function reorder of the d player package" — reorder
ggplot(mpg, class_reorder_by_median_hwy) + geom_boxplot() + coord_flip()  # "core flip" / "chord cartesian function" — coord_flip ← core flip / chord flit, coord_cartesian
```
