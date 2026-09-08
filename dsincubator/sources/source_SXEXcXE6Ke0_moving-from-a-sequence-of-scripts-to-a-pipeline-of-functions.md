---
type: source
title: "Moving from a sequence of scripts to a pipeline of functions"
source_file: "SXEXcXE6Ke0_moving-from-a-sequence-of-scripts-to-a-pipeline-of-functions.md"
video_id: "SXEXcXE6Ke0"
url: "https://www.youtube.com/watch?v=SXEXcXE6Ke0"
lang: en
tags: ["ds-incubator", "targets", "pipelines", "r-packages", "github"]
key_topics: ["targets-pipeline", "functions-vs-scripts", "caching"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=SXEXcXE6Ke0"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 617
    last_modified: "2021-02-09T00:00:00Z"
usage_window: { from: "2021-02-09T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# Moving from a sequence of scripts to a pipeline of functions

## Summary

The session is a pedagogical adaptation of the `targets` book chapter on why pipelines should be expressed as functions rather than sequences of scripts, following the earlier adapted walkthrough chapter. The speaker's angle for 2degrees analysts is how to shift project structure from numbered script files to pure functions that fit targets' opinionated layout.

The starting point is the `r2dii/targets` demo repo's `R/` folder with three scripts: `01_data.R` reads `data/raw_data.csv` with `here()` + `read.csv`, does a small transformation (replace an `NA`/value with a mean — described as an algorithm), and writes a cleaned object to a hand-rolled `objects/` cache; `02_model.R` reads that cached file and fits a linear model (`lm`) and saves `fit.rds`; `03_plot.R` builds a histogram/plot from the clean data. Sourcing any of them creates a file in `objects/`. A glue report `report.*.R` sources all three with `here::here()` and prints `dataset`, `fit`, and `hist`, knittable via the RStudio "Knit" button to HTML, while an R Markdown version (`report.Rmd` with `github_document` output) instead sources a helper file via `source("R/functions.R")` → `source_all()` (a custom helper that sources every `R/*.R` file) and displays the same objects, showing the middle ground where packages are attached once in the report rather than in every script.

Refactoring isolates the meaningful computation: hardcoded paths become function arguments, `read.csv`/`writeRDS`/`library()` boilerplate that dominates each script is dropped — the former is not needed inside functions (last value auto-returned, assigned is not required) and the latter is handled centrally. The resulting `R/functions.R` defines `read_and_clean(path)`, `fit_model(dataset)` (caption calls creating the model), and `create_plot(dataset)` (caption calls creating plot/histogram), each containing only the interesting line(s) from its predecessor and returning the object implicitly, halving line counts and liabilities.

These functions are glued via `_targets.R`, created with `targets::tar_script()` and opened with `tar_edit()`. Its anatomy is reviewed: top-level `library(targets)`, globals section sourcing `R/functions.R` (or `source_all()` for many files) and setting `tar_option_set(packages = "tidyverse", cue = ... , quiet)`, options that pass to every target, plus per-target `packages` if needed. The target list ends the file: `tar_target(file, "data/raw_data.csv", format = "file")` for the external-file target (requires `format = "file"` — topic of a future meetup), `tar_target(dataset, read_and_clean(file))`, `tar_target(fit, fit_model(dataset))`, and `tar_target(hist, create_plot(dataset))`, each named object plus an expression where inputs are previous targets. With the pipeline ready `tar_make()` is run — already cached so targets are skipped — and `tar_visnetwork()`/`tar_network()` would visualize dependencies (attempt failed in session), while the report that uses targets calls `tar_make()` if needed and retrieves objects via `tar_read("fit")` etc., previewing the recommended `tar_render()` approach for knitting R Markdown inside the pipeline.

## Key Concepts & Tools Taught

- **[targets-pipeline]:** `_targets.R` structure — `library(targets)`, globals (`source("R/functions.R")` or `source_all()`), `tar_option_set(packages = ...)`, and a trailing `list(tar_target(name, expression))` executed with `tar_make()` and inspected with `tar_visnetwork`/`tar_network`/`tar_read`.
- **[functions-vs-scripts]:** Moving from numbered scripts (`01_data.R`, `02_model.R`, `03_plot.R` that `read`/`writeRDS` a manual `objects/` cache and are glued via `source(here(...))` in `report.R`/`report.Rmd`) to pure functions (`read_and_clean(path)`, `fit_model(dataset)`, `create_plot(dataset)`) where path is an argument, return is implicit, and I/O boilerplate disappears.
- **[caching]:** Manual cache in `objects/` (`saveRDS`/`readRDS`) versus targets' automatic cache — targets stores each target's return value and skips up-to-date targets, recomputing only outdated branches; `format = "file"` target for tracking the raw CSV file.
- **[r-markdown-reporting]:** Reporting patterns — `report.R` glued scripts plus `here` plus Knit to HTML, `report.Rmd` with `github_document` that sources `functions.R`/`source_all()` and displays `dataset`/`fit`/`hist`, and future `tar_render()` for rendering inside the pipeline (vs ad-hoc `tar_read` in the Rmd).
- **[here-package-and-source-all]:** `here::here()` for path-safe sourcing and a custom `source_all()` helper that loops `source` over every `R/*.R` file to expose functions globally to the pipeline.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```r
# Starting script structure (01_data.R pattern)
library(tidyverse)  # "it's also calling packages in here so it's you know attaching the tidy verse" <- "tidy verse"
here::here("data", "raw_data.csv")  # "i'm using the function here from the here package which is kind of clever about where to find things" <- "here from the here package"
read.csv(here::here("data", "raw_data.csv"))  # "it's reading a data set from the folder data and ... using that path to read the data" <- hard-coded path
# transform: replace NA/value with mean — "replacing an ace with the mean of basically an ace with one algorithm" <- "ace" (= NA/mean)
saveRDS(dataset, here::here("objects", "dataset.rds"))  # manual cache: "arbitrarily chose a folder for storing such objects ... think of this as a cache ... save the processed output in a new data set a new object" <- "objects"

source(here::here("R", "01_data.R"))   # sequential sourcing in report.R: "we would usually do ... source each of those files one at a time here i'm using the function here" <- "source each of those files" + "here"
source(here::here("R", "02_model.R"))  # "all it does is now it takes the input from the object ... applying a linear model and then again saving as an output" <- "applying a linear model"
source(here::here("R", "03_plot.R"))   # "what it does is create a plot for the data set" <- "create a plot"
# knit: "you can also click here to knit an r file similar to ... knitting an arm markdown file ... produces html ... pdf" <- "knit"

# Refactored functions in R/functions.R (only meaningful line survives)
read_and_clean <- function(path) {    # helper extracted: path argument replaces hardcoded here() call
  dat <- read.csv(path)
  # body: "then we have this ... essentially this ... except we are not assigning the result to an object because r by default will return ... last thing" <- function body
  dat[is.na(dat)] <- mean(dat, na.rm = TRUE)  # normalized from "replacing ace with mean"
  dat
}
fit_model <- function(dataset) {
  lm(y ~ x, data = dataset)  # "only thing that we really care about is this line here when we create a model" <- "create a model"
}
create_plot <- function(dataset) {
  hist(dataset$x)  # "interesting bit was the plot creating the plot same thing here so that's only that survives" <- "creating the plot"
}

source("R/functions.R")               # "i'm sourcing a file called functions ... that file ... has helper function ... source all ... that sources every file that lives in the r folder" <- "sourcing those functions"
source_all <- function() { lapply(list.files("R", pattern = "\\.R$", full.names = TRUE), source) }  # definition shown
source_all()                          # "when i run this line number 33 every file every r file in the r folder will be sourced" <- "source all"

# _targets.R scaffolding (formal file that must live in project root)
library(targets)                      # "we are using the targets package then we have access to all its functions ... start with a call to library target" <- "library target"
tar_script()                          # "is this function called target start script that will create a script with a toy basically example" <- "target start script"
tar_edit()                            # "you could also use the function tar edit that will open the file that you're looking at" <- "tar edit"
tar_option_set(packages = c("tidyverse"), quiet = TRUE)  # "there is a section where you refer to anything that is global ... we want them here ... Also global is ... when we attach the tigers it's very verbose so i'm saying hey be a little quiet" <- "global" / "tigers" (= tidyverse) / "quiet"
list(
  tar_target(file, "data/raw_data.csv", format = "file"),  # "very first target ... looks into that specific path ... data raw underscore data.csv and basically creates a target that only contains a path ... you have to say formal equals file" <- "formal equals file" (= format = "file")
  tar_target(dataset, read_and_clean(file)),   # "first step was to read and clean the data ... name of target ... expression ... uses function ... which path it takes ... from previous target" <- target name / expression
  tar_target(fit, fit_model(dataset)),         # "we are going to store the object into a new target called target fit ... call to function that we define and data set ... comes from target defined before" <- "target fit"
  tar_target(hist, create_plot(dataset))       # "we repeat process now we create a histogram we call that object target hist and we use function create plot ... input ... is the one that we defined ... two steps above" <- "target hist" / "create plot"
)

tar_make()                            # "with this i'm ready to do something like tar make ... it's saying that the targets are going to be skipped because i already ran the pipeline" <- "tar make" / "skipped"
tar_read("fit")                       # "just by calling for example a function type read we discussed it last time to read each of the targets and report on them" <- "type read" (= tar_read)
tar_visnetwork()                      # "some of the coolest functions like target this network and i will show us a visualization to understand how the targets are connected" <- "target this network" (tar_visnetwork / tar_network)
tar_render(report.Rmd)                # "recommendation is to knit the report inside the pipeline using actually a function that comes from another package that is called archetypes it's called tar render" <- "tar render" (targets / archetypes)
```
