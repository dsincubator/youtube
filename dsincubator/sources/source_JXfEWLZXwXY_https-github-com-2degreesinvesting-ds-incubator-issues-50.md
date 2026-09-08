---
type: source
title: "https://github.com/2DegreesInvesting/ds-incubator/issues/50"
source_file: "JXfEWLZXwXY_https-github-com-2degreesinvesting-ds-incubator-issues-50.md"
video_id: "JXfEWLZXwXY"
url: "https://www.youtube.com/watch?v=JXfEWLZXwXY"
lang: en
tags: ["ds-incubator", "r-packages", "ggplot2", "github", "github-issues"]
key_topics: ["ggplot2", "aesthetics", "geom", "gapminder", "data-frame"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=JXfEWLZXwXY"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 4
    last_modified: "2020-07-07T00:00:00Z"
usage_window: { from: "2020-07-07T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# https://github.com/2DegreesInvesting/ds-incubator/issues/50

## Summary

First of two meetups responding to GitHub issue 50 on plotting tools, motivated by the departure of two visualization experts and a need for a more standardized, efficient workflow. After opening discussion—including use of Excel, ggplot2, and JavaScript library highcharter and its three layers (static plot, hover information, click event that generates a new chart)—the session argues for starting with ggplot2.

The rationale: most participants already know ggplot2; it originated in Hadley Wickham's PhD thesis implementing the Grammar of Graphics (theory from 1976); and as part of the tidyverse it centers on the data frame, so data flows easily between tidying and visualization, unlike tools built on vectors or lists. The core workflow is import → tidy → visualize → communicate.

The grammar is explained as data (spreadsheet rows/columns) + geometric representation + aesthetic mappings + coordinate system (usually 2D x/y, occasionally polar). The ggplot2 template is `ggplot(data) + geom_* (mapping = aes(x=..., y=..., color=..., size=..., shape))`. Mappings include x, y, colour, size, shape. Geoms include point, line, boxplot, smooth, etc.; choosing a geom that looks like the desired plot is the main decision, with sensible defaults.

Hands-on in an RStudio Cloud project uses the Gapminder dataset (year, lifeExp / life expectancy, gdpPercap / GDP per capita, continent, country). A boxplot `ggplot(gapminder, aes(x=year, y=lifeExp)) + geom_boxplot()` tests hypotheses that life expectancy increased over time and varies by continent. Iterative refinement maps `color=continent` to show separate trends, then switches to `geom_point` and `geom_smooth(method=lm, se=TRUE)` to display uncertainty ribbons and per-continent smooth lines, demonstrating how small changes to the template answer richer questions. Reference resources highlighted are the ggplot2 website reference gallery, the cheat sheet, and the online draft of ggplot2 book version 3.

## Key Concepts & Tools Taught

- **[ggplot2]:** R package implementing the Grammar of Graphics; members of the tidyverse ecosystem; template `ggplot(data) + geom_* + aes()`; sensible defaults require only data, geom, and mappings to produce a plot.
- **[aesthetics]:** Mappings from data-frame columns to visual channels via `aes(x=..., y=..., color=..., size=..., shape=...)` (caption "AES is short for aesthetics"); explained as how a column ends up on x-axis, y-axis, colour, size or shape.
- **[geom]:** Geometric representation of data such as `geom_point`, `geom_line`, `geom_boxplot`, `geom_smooth`; selected by matching the function's preview to the desired chart; reference section lists all geoms with thumbnails.
- **[gapminder]:** Example dataset with year, lifeExp, gdpPercap, continent and country used for live demos of life expectancy over time.
- **[data-frame]:** Central tidyverse data structure ("you can think of it as a spreadsheet") that flows between packages; ggplot2 shares it, enabling seamless massaging and plotting, versus vectors or lists.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```r
ggplot(data = gapminder, aes(x = year, y = lifeExp)) +  # "basic recipe for a teacher plot ... you need to pass the data which more commonly you pass it to this function that creates the basic ggplot and the function is called you plot ... explicitly the argument data"
  geom_boxplot()                                        # "I want to represent the data with a box plot so I'm using the German box plot that is available in ggplot2 ... mappings are passed to the function is AES is short for aesthetics ... X which I map in to ear and Y I'm up into life expectancy" — X=year, Y=lifeExp
# alternative mapping placement (same result):
ggplot(gapminder, aes(x = year, y = lifeExp)) + geom_boxplot()

ggplot(gapminder, aes(x = year, y = lifeExp, color = continent)) +
  geom_point()                                          # "I want to add a new mapping that let me see the different patterns across continents ... color equals continent ... continent has to be a variable in the data set" — three dimensions X Y colour

ggplot(gapminder, aes(x = year, y = lifeExp, color = continent)) +
  geom_smooth()                                         # "instead of using the individual points to use a linear model that represents and captures all the variation ... by using a different genome like the GM smooth which creates progressions with different methods" — gray uncertainty ribbon + per-continent lines

# quick data inspection in demo:
gapminder |> select(year, lifeExp, gdpPercap)           # "here I selected the columns year life expectancy and GDP per capita and then everything else"
```
