---
type: source
title: "targets: Eexternal files and literate programming"
source_file: "jAkNwaGRku0_targets-eexternal-files-and-literate-programming.md"
video_id: "jAkNwaGRku0"
url: "https://www.youtube.com/watch?v=jAkNwaGRku0"
lang: en
tags: ["ds-incubator", "targets", "pipelines", "r-packages", "workflow"]
key_topics: ["targets", "external-files", "literate-programming", "tar-render"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=jAkNwaGRku0"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2021-03-02T00:00:00Z"
    usage_count: 178
usage_window: { from: "2021-03-02T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# targets: Eexternal files and literate programming

## Summary

The meetup extends the targets series to external files and literate programming, using a reproducible example where the same targets pipeline feeds two different reports about the relationship between ozone and day in the built-in `airquality` dataset. One report shows the exploration with a plot (flat horizontal line, wide uncertainty, no evidence of change through time), the other summarizes a linear model (`R-squared` near zero, non-significant p-value); both share most targets but cherry-pick subsets for each workflow.

The core lesson defines internal versus external files: any target that lives under `_targets/objects` is internal; everything else is external and must be declared with `format = "file"` plus a function that returns a path. An external input example stores a path to the CSV and reads it, while an external output example uses a `save_plot()` helper that calls `ggsave()` to save `output/plot.png` and then returns the path invisibly. This satisfies the requirement that an output target's command outputs a path.

The pipeline itself (`_targets.R`) is shown: it starts with `library(targets)` plus `library(tarchetypes)` from the tarchetypes/topia family, sets global `tar_option_set()` for shared packages and for sourcing functions from a package (instead of a plain `R/` folder), and defines targets such as `raw`, `data` (`clean()`), `fit` (`fit_lm()` wrapping `stats::lm(ozone ~ day)`), and `plot`. The talk stresses the targets manual quote that the bulk of computation should have happened upstream, so R Markdown reports should be mostly `tar_read()`/`tar_load()` calls pulling cached results rather than recomputing.

Finally, rendering is made programmatic: instead of clicking Knit, `tarchetypes::tar_render()` declares each `.Rmd` as a target (e.g., `lm.Rmd` → `lm.md` via `output_format = "md_document"` passed through `...` to `rmarkdown::render`), so `tar_make()` also builds `output/plot.png` and the rendered reports with full caching. The speaker notes versioning via Git tags/releases for revisiting past meetup states and handling internet issues during recording.

## Key Concepts & Tools Taught

- **[targets]:** pipeline framework where `_targets.R` lists named targets whose commands run in dependency order under `tar_make()`, with results cached in `_targets/objects`.
- **[external-files]:** files outside `_targets/objects` are external; to use them declare a target whose command returns a path and set `format = "file"` — as input (a path to read) or as output (a `save_plot()` + `ggsave()` that saves `output/plot.png` and returns the path invisibly).
- **[literate-programming]:** explaining the same superset of computations in multiple R Markdown workflows, each report consisting mainly of `tar_read()`/`tar_load()` calls per the manual quote "the bulk of the computation should have already happened upstream".
- **[tar-render]:** `tarchetypes::tar_render(name, path, output_format = "md_document")` makes rendering an R Markdown report itself a target, reusing the `rmarkdown::render` engine via `...`, so `tar_make()` builds plots and reports together and `tar_destroy()` can reset for a full rebuild.

## Code Snippets & Formulas

Spoken calls dictated live (mangled caption fragments normalized here):

```r
library(targets)       # "_target. r that defines a project as a Target project ... you start first by attaching targets" — Target ← targets
library(tarchetypes)   # "I'm attaching another package of the target Opia family which is called Target Target types" — Target Target types / Target Topia ← tarchetypes

tar_option_set(packages = c("ggplot2"))  # "with the function tar options set ... we Define options that are going to be passed to every Target" — tar options set ← tar_option_set
# functions moved to a package vs R/ — "we could just ... put them anywhere or we could put them in a package and then use that package in the pipeline"

# _targets.R sketch (names left, commands right)
list(
  tar_target(raw, "data/airquality.csv", format = "file"),  # external input: "the only thing that does is stores a path and that defines ... where to look for that file" — format equals file ← format = "file"
  tar_target(data, clean(raw)),
  tar_target(fit, fit_lm(data)),   # "it just calls the function LM from the stats package and creates a linear regression between ozone and day" — LM ← lm
  tar_target(plot, plot_lm(fit)),
  tar_target(plot_file, save_plot(plot, "output/plot.png"), format = "file")
)

save_plot <- function(p, path) {
  ggplot2::ggsave(path, p)  # "it is a very simple call to gplot to G save" — G save ← ggsave
  invisible(path)           # "because the main goal ... is to produce a side effect it is best practice to return the first argument invisibly" — invisible ← invisible
}

# External file distinction
# "there is a s folder called objects ... every Target that is internal ... leaves inside that folder ... anything outside that folder for Target is considered an external file" — objects ← _targets/objects

# Using cached results in reports — "most of the code Changs in your report should be just T calls to Tar read and tar load"
tar_read("fit")   # "T calls to Tar read and tar load" — Tar read ← tar_read
tar_load("plot")  # — tar load ← tar_load

# Programmatic rendering as a target
tarchetypes::tar_render(report_plot, "reports/plot.Rmd", output_format = "md_document") # "you can use the function tar render and tar render will produce a Target ... that is specifically focused to producing armd down reports" — tar render ← tar_render
tar_make()        # "we are now going to actually use Target ... Library targets ... and now we're going to do tar make" — tar make / tarake ← tar_make
tar_destroy()     # "I could do T destroy and recompute" — T destroy ← tar_destroy
```
