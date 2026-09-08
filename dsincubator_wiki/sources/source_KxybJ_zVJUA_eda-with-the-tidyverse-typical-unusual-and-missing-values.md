---
type: source
title: "EDA with the tidyverse: Typical, unusual, and missing values"
source_file: "KxybJ_zVJUA_eda-with-the-tidyverse-typical-unusual-and-missing-values.md"
video_id: "KxybJ_zVJUA"
url: "https://www.youtube.com/watch?v=KxybJ_zVJUA"
lang: en
tags: ["ds-incubator", "ggplot2", "tidyverse", "r-packages", "eda"]
key_topics: ["typical-values", "outliers", "missing-values", "ggplot2", "binwidth"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=KxybJ_zVJUA"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 168
    last_modified: "2021-11-16T00:00:00Z"
usage_window: { from: "2021-11-16T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# EDA with the tidyverse: Typical, unusual, and missing values

## Summary

Meetup 4 of ds.tidy.eda, presenting EDA with the tidyverse as a conceptual and toolkit overview covering typical, unusual and missing values, drawing on the R for Data Science book. Objectives are to visualise common and rare values, explore outliers analytically and by zooming into plots, transform confirmed incorrect values to missing values, and convert missing values to a logical variable for counting and visualisation.

Repo orientation points to folder 04 containing today's notes. Toolkit focus is `library(tidyverse)` (providing `dplyr` and `ggplot2`) and the `diamonds` dataset from ggplot2; help via `?diamonds` documents `price`, `carat` (weight), and dimensions `x`, `y`, `z` in millimetres. Initial exploration uses `select(price, carat, x, y, z)` and `glimpse` to show column types (e.g., `carat` double, `price` integer) and scalable row previews.

Typical values are introduced via bar charts versus histograms: taller bars indicate most common values, shorter bars and gaps prompt questions about rare ranges and why they occur. A filtered view `diamonds |> filter(carat < 3) -> smaller` and `ggplot(smaller, aes(x=carat)) + geom_histogram(binwidth=0.01)` reveals peaks aligned with grid lines at whole carats and nice fractions (1, 1.5, 1/4 increments) with a right-side bias. Group brainstorming attributes this to human choices—rounded carats are saleable, and customers complain more if slightly under than over, biasing cutters to the right. Cluster patterns are discussed as potentially random versus meaningful, with caution that appearance depends on parameters.

The second half generalises pattern pitfalls through `binwidth` sensitivity: `binwidth=0.01` shows fraction peaks, while `binwidth=0.5` collapses them into a single mode near 0.5 carat. The takeaway is to try many binwidths and tools (`geom_bar` for pre-counted discrete data versus `geom_histogram` for continuous discretisation, `cut_width`, `geom_density` overlay noted via audience suggestion) because no single default is correct; the right choice depends on the question, e.g., explaining cutting psychology versus summarising what people buy most. Closing previews the next session on outliers → missing values → logical values, echoing the workflow that treats incorrect entries as `NA` without dropping rows, then maps `is.na` to TRUE/FALSE for visualisation.

## Key Concepts & Tools Taught

- **[typical-values]:** Most common values in a distribution shown by the tallest bars in histograms/bar charts; used to ask which values dominate and why.
- **[outliers]:** Unusual values that do not fit the main pattern; identified by gaps, short bars, and by filtering to reveal extreme measurements.
- **[missing-values]:** Placeholder `NA` for incorrect entries kept as logical TRUE/FALSE for counting/plotting, rather than deleting entire rows which could leave too little data.
- **[ggplot2]:** Visualization system used as `ggplot(smaller, aes(x=carat)) + geom_histogram()` with aesthetic mappings in `ggplot` or `geom`; components include data, geom, mapping, and coordinate system.
- **[binwidth]:** Histogram tuning parameter (`binwidth=0.01` versus `0.5`) that drastically changes visible patterns and can mislead; recommended to explore many values to avoid hidden or false patterns, with alternatives like `geom_density` for continuous variables.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```r
library(tidyverse)                      # "when we you know do library television we get a bunch of packages ingredients the one that we're going to be working with today deep player and g plot 2"
?diamonds                               # "if you do question mark and the name of anything that exists in r ... question mark diamonds ... html type of file ... define each of those variables"
diamonds |> select(price, carat, x, y, z) # "comes with a function called select that allows us to kind of zoom in a specific set of columns ... price correct karat x y and z"
glimpse(diamonds)                       # "also a tool called glimpse ... comes with tidy verse specifically with d player package ... different view ... scales up very well ... type of column so for example cat is a double column"
# pipe pronounced as "then":
smaller <- diamonds |> filter(carat < 3) # "just the values just the rows where the column karat is less than three ... assign result to a new data set called smaller"

ggplot(smaller, aes(x = carat)) +
  geom_histogram(binwidth = 0.01)        # "we're going to be using a geom histogram which is the geometric representation ... and and this is what we get we choose a bandwidth that is very narrow just a 0.01 width"

ggplot(smaller, aes(x = carat)) +
  geom_histogram(binwidth = 0.5)         # "if i went like 0.5 if i just change the beam width i see a completely different pattern ... most of the diamonds are less than one cutout around like half of a carat"
# vs pre-counted:
# ggplot(counted, aes(x=carat, y=n)) + geom_bar(stat="identity")  # "the difference between the gm bar and the gm histogram ... jumbar once you already have something that is already straight ... jion histogram would discretize a continuous variable based on the beam width"
cut_width(carat, width = 0.5)           # "we cut we use a cut width from the ggplot2 package to cut a continuous variables in discrete intervals"
ggplot(smaller, aes(x = carat)) +
  geom_histogram(binwidth = 0.01) +
  geom_density(color = "blue")          # "you could probably try a gm density just to see what it looks like ... overlay the two ... color blue" — note y scales differ

# previewed workflow for next time (not executed in this session but objectives state):
# diamonds |> mutate(y = if_else(y < 3 | y > 20, NA, y)) |> mutate(is_error = is.na(y))
```
