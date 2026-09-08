---
type: source
title: "EDA with the tidyverse: Exploring Variation"
source_file: "26hbyVb00xs_eda-with-the-tidyverse-exploring-variation.md"
video_id: "26hbyVb00xs"
url: "https://www.youtube.com/watch?v=26hbyVb00xs"
lang: en
tags: ["ds-incubator", "r-packages", "ggplot2", "eda", "tidyverse"]
key_topics: ["ggplot2", "exploring-variation", "categorical-variables", "continuous-variables", "tidy-data", "geom-histogram"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=26hbyVb00xs"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 362
    last_modified: "2021-11-09T00:00:00Z"
usage_window: { from: "2021-11-09T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# EDA with the tidyverse: Exploring Variation

## Summary

This session is part of a series on exploratory data analysis with the tidyverse, focused on how to explore variation within a single variable using visual and analytical tools. Variation is introduced as the pattern of values when a variable is measured repeatedly, and alongside covariation between two variables, it forms the two generic questions applicable to almost any dataset. The R Markdown workflow is used as the communication tool, with the advice to list required packages at the top so RStudio can flag missing ones (demonstrated with the package `vegan` ← `vegan`).

Core definitions are reviewed via the tidy data paper: a variable is a column, a value is a cell, an observation is a row, and a dataset is tidy when each variable occupies its own column and each observation its own row, which tidyverse tools expect. Two variable types anchor the lesson — categorical variables that take a small set of values (e.g., `cut` in the `diamonds` dataset with values `ideal`, `premium`, `good`, `very good`, `fair`) and continuous variables that take ordered values along a continuum (e.g., `carat` such as `0.23`, `0.21`). The `diamonds` dataset from `ggplot2` illustrates both, with helpers like `relocate` ← `relocate` to bring a column to the front.

For categorical variation the template `ggplot(data) + geom_bar(aes(x = cut))` is used to count instances per level, mirrored analytically by `diamonds %>% count(cut)` which produces column `n` that `geom_bar` computes internally. For continuous variation the template `ggplot(diamonds, aes(x = carat)) + geom_histogram(binwidth = 0.5)` is used, emphasizing experimentation with `binwidth` ← `being with` / `bandwidth` to reveal or summarize detail, mirrored analytically by `cut_width(carat, width = 0.5)` ← `cut with unfriend` / `cut width` / `cut interval` followed by counting. A filtered view (`diamonds %>% filter(carat < 3)` into `smaller`) overlays groups by mapping `cut` to colour and using `geom_freqpoly` ← `geomoly` / `frequent freak poly` instead of stacked histograms to keep overlapping distributions readable. Resources highlighted are the `ggplot2` reference and cheatsheet and the `dplyr` single-table verbs reference.

## Key Concepts & Tools Taught

- **[ggplot2]:** Visualization package (`g plot 2` ← `gg plot 2` / `g block 2` / `digiplot2` in captions) used with the template `ggplot(data, aes(...)) + geom_*` for mapping variables to aesthetics.
- **[exploring-variation]:** Central EDA question — what is the distribution of values within one variable — framed as the pattern that emerges when measuring a variable twice and observing how its value changes.
- **[categorical-variables]:** Variables taking a limited set of values exemplified by `cut` in `diamonds`; explored with `geom_bar` counting instances per level and with `count(cut)` producing `n`.
- **[continuous-variables]:** Variables taking ordered values along a continuum exemplified by `carat`; explored with `geom_histogram` and its `binwidth` argument controlling column width.
- **[tidy-data]:** Principle that each variable is one column and each observation one row; long versus wide formats discussed (splitting `year_2020` / `year_2021`-style wide tables into long so `ggplot2` can map a single `year` column), with tidying prerequisites for analysis.
- **[geom-histogram]:** Histogram geometry that bins a continuous variable into intervals (`cut_width(carat, width = 0.5)` ← `cut with and friends` / `cut width`) and counts per bin; `binwidth = 0.5` demonstrated and alternatives like `0.75` suggested for sensitivity checks, contrasted with `geom_freqpoly` for overlaid groups.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```r
# package flagging demo
# "i don't have the package vegan ... as soon as i save the file ... package vegan required but it's not installed"

# categorical variation
library(ggplot2)                    # "the ggplot2 package and the deep player package both had of the tidyvirus"
diamonds %>% relocate(cut)          # "i'm using here the function relocate which basically takes the name of a column and puts it in the first position"
ggplot(diamonds, aes(x = cut)) + geom_bar()  # "always called the function ggplot2 in the data argument ... we are going to plot the diamonds data set ... choosing the gm bar because we want to represent the instances"
diamonds %>% count(cut)             # "take the data set diamond and then count the number of intense instances of the variable cut" → tibble with column n

# continuous variation
diamonds %>% relocate(carat)        # "let's take the diamonds data set and then let's relocate the column karat to the first position"
ggplot(diamonds, aes(x = carat)) + geom_histogram(binwidth = 0.5)  # "we used a geom bar ... here we are using historum histogram will first create a categorical version ... the mappings again we map the variable carrots to the x-axis ... and then we're going to choose how wide we want those columns to be"
# binwidth experimentation: "being with 0.5" / "being with sorry" / "try different with bandwidth ... 75 or whatever"
diamonds %>% mutate(carat_cut = cut_width(carat, width = 0.5)) %>% count(carat_cut)  # "the trick here ... is to use a function that creates a categorical variable from a continuous variable and that function is cut with unfriend ... we want to cut a continuous variable in chunks of 0.5 width ... then we count the instances ... help file ... cut interval cut interval cut number and cut width"

# overlaying groups
smaller <- diamonds %>% filter(carat < 3)  # "is simply taking the diamonds set and then filtering for carats that are smaller than three so that's how we created that data set smaller"
ggplot(smaller, aes(x = carat, colour = cut)) + geom_freqpoly(binwidth = 0.5)  # "the tool that we want is not geom histogram but instead geomoly so the polygon of frequencies ... map the cut the different cuts to different colors ... when you have overlying data sets ... a much useful tool is frequent freak poly"
# contrasted with: ggplot(smaller, aes(x = carat, colour = cut)) + geom_histogram(binwidth = 0.5)  # produces hard-to-read overlap

# resources linked: ggplot2 reference / cheatsheet / dplyr single-table verbs (filter, count, relocate, mutate, cut_width family)
```
