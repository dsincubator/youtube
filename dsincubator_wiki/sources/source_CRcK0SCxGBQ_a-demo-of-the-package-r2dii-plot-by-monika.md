---
type: source
title: "A demo of the package r2dii.plot (by Monika)"
source_file: "CRcK0SCxGBQ_a-demo-of-the-package-r2dii-plot-by-monika.md"
video_id: "CRcK0SCxGBQ"
url: "https://www.youtube.com/watch?v=CRcK0SCxGBQ"
lang: en
tags: ["ds-incubator", "r-packages", "r2dii", "github-issues"]
key_topics: ["r2dii-plot", "emission-intensity", "tech-mix", "trajectory-plots", "ggplot2-customization", "2dii-colors", "theme-2dii"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=CRcK0SCxGBQ"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 74
    last_modified: "2022-03-01T00:00:00Z"
usage_window: { from: "2022-03-01T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# A demo of the package r2dii.plot (by Monika)

## Summary

Monika presents the `r2dii.plot` package developed with Mauro as a plotting layer on top of the other `r2dii` packages (`r2dii.data`, `r2dii.match`, `r2dii.analysis`) that returns `ggplot2` objects. After setup with demo data from `r2dii.data`, she shows how the package expects PACTA-shaped data already filtered by sector or technology and filtered for the appropriate metric/scenario before plotting. The package provides three plot families — emission-intensity, tech-mix, and trajectory (market-share) — each with two interfaces: a standardized `qplot_*` quick-plot and a bare-bones `plot_*` function.

Quick plots (`qplot_emission_intensity`, `qplot_techmix`, `qplot_trajectory`) apply opinionated defaults: five-year span, title/subtitle, and color labels, requiring only a prior `filter()` for sector/technology/region/metric. The bare-bones `plot_emission_intensity` / `plot_techmix` / `plot_trajectory` functions plot data as-is, inferring labels from the data (not title-cased, dash-separated) and showing the full time span unless constrained. Customization is shown via three strategies used together: function parameters (`span_5y`, `convert_label`), mutating input data (filtering time span, adding `label` / `label_tech` columns that override auto-generated labels, factorizing to control color order), and `ggplot2` layers (`labs()`, `scale_color_manual()` / `scale_fill_manual()` with hex codes and manual labels, `scale_color_r2dii()` family). The final section covers styling helpers usable on any `ggplot`: `theme_2dii()` (based on `theme_classic`, clean styling) and `scale_color_r2dii()` / `scale_fill_r2dii()` including sector-colors (e.g., blue automotive, orange power) and tech-colors (shades of orange for power), plus a preview of a forthcoming `r2dii.colours` package. Discussion covers GitHub issues for feature requests/bugs, informative error messages when data shape is wrong, why saving/exporting gives different sizes across OS/R settings (`ggsave()` with explicit size as short-term fix), and that PACTA assumptions (sector names, metric values like `projected`) are still partly hard-coded.

## Key Concepts & Tools Taught

- **[r2dii-plot]:** R package for PACTA portfolio-analysis plots built on top of `r2dii.data` / `r2dii.match` / `r2dii.analysis`; returns `ggplot` objects so `ggplot2` functions apply.
- **[emission-intensity]:** Plot family for emission intensity by sector; quick version via `qplot_emission_intensity` after filtering for a sector (e.g., cement), bare-bones via `plot_emission_intensity`; parameters `span_5y` and `convert_label` replicate quick-plot behavior.
- **[tech-mix]:** Technology-mix (market-share) bar/chart family; quick `qplot_techmix` and bare `plot_techmix`; requires filtering for metric/scenario and sector; labels and colors customizable via input `label` / `label_tech` columns and `scale_fill_manual()`.
- **[trajectory-plots]:** Volume/market-share trajectory line plots; quick `qplot_trajectory` (filter for one technology + region) and bare `plot_trajectory`; adding a `label` column derived from `metric` overrides scenario/portfolio/benchmark line labels.
- **[ggplot2-customization]:** Three-strategy customization: (1) `plot_*` parameters, (2) modifying input data (filter time span, add label columns, factor order), (3) adding `ggplot2` layers — `labs()` for title/x/y, `scale_color_manual()` / `scale_fill_manual()` with hex values and `labels` argument, `scale_color_r2dii()` / `scale_fill_r2dii()` for 2dii palettes.
- **[2dii-colors]:** `scale_color_r2dii()` and `scale_fill_r2dii()` families — base 2dii palette, sector colors (PACTA sectors), power-tech shades — usable on any `ggplot` (demo with `geom_line()` / bar chart); order of data/factor matters for mapping.
- **[theme-2dii]:** Styling helper `theme_2dii()` ("theme to the i" / "theme to the ai" in caption) that works like a `ggplot` theme, based on `theme_classic`, for clean 2dii-branded output on any plot.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```r
# Data prep (r2dii.data + match/analysis) then filtering before plotting
filter(data, sector == "cement")   # "we filter for cement sector because this is the sector that we want to plot"

# Quick plots — standardized, 5-year span, auto title/labels
qplot_emission_intensity(data)     # "we just run q plot emission intensity on our data and we get a plot which has a title"
qplot_trajectory(data)             # "quick plot for volume trajectory which is used with market share like data ... you have to filter for one technology and also for a region"
qplot_techmix(data)                # "the same for the technics chart you can create a quick techniques ... you have to filter for metric column ... you can only have one scenario row which is the target"

# Bare-bones plot functions + parameters replicating quick-plot behavior
plot_emission_intensity(data)      # "how the plot looks if we don't do any customization so just how it comes out of the plot emission intensity function"
# parameters: span_5y, convert_label  — "it has also parameters called span five years and convert label ... convert label will take a function to apply on the and overall labels"
labs(title = "...", x = "...", y = "...")  # "then we use the labs function from ggplot to add our custom labels so to add a title and x and y label"

# Modifying input data to customize
# "filter the time span in the data" — filter(data, year %in% ...)
# "add columns label and label tech which are then used by our plotting functions ... if you add it yourself then it will use that instead"
# "use the factorization to get the right order of the colors"

# ggplot color scales
scale_color_manual(values = c("#..."), labels = c("..."))  # "we also use the scale color manual which is also a ggplot function and we pass some color values in forms of hex codes and labels"
scale_fill_manual(values = c("#..."), labels = c("..."))   # "we use the labels parameter from the scale fill manual function to add our own labels for the colors"

# 2dii styling — works on any ggplot, not only r2dii.plot
theme_2dii()                       # "theme to the ai function that works like a ggplot theme and it gives you our plots with our 2dii styling which is basically well it's based on the classic theme"
scale_color_r2dii()                # "then i use the scale color r to the ai with labels that i specify also in the order that i want to use two dii colors in my plot" — "it's just a line plot it's not any plot from the r2di package"
scale_fill_r2dii()                 # sector/tech variants — "the blue for automotive and the orange for power ... these are shades of orange that you can apply on your bar charts if it's showing technologies from the power sector"

# Saving — same as any ggplot
ggsave("plot.pdf", width = ..., height = ...)  # "like what we use is the gg save function and i was like knowing that it was possible to set the plot size" — short-term fix for differing OS/R rendering; size still may vary

# Help / data checks
?plot_techmix                      # "check the help file for example if you run question mark blood techniques you will see the help file and then you can see what are the requirements"
```
