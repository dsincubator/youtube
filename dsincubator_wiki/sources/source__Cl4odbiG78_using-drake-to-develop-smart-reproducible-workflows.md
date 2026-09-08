---
type: source
title: "Using drake to develop smart, reproducible workflows"
source_file: "_Cl4odbiG78_using-drake-to-develop-smart-reproducible-workflows.md"
video_id: "_Cl4odbiG78"
url: "https://www.youtube.com/watch?v=_Cl4odbiG78"
lang: en
tags: ["ds-incubator", "drake", "workflow", "r-packages", "reproducibility"]
key_topics: ["drake-workflow", "reproducibility-cache", "drake-vs-unit-testing", "dependency-tracking-md5", "drake-plan-targets"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=_Cl4odbiG78"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 13
    last_modified: "2020-05-05T00:00:00Z"
usage_window: { from: "2020-05-05T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# Using drake to develop smart, reproducible workflows

## Summary

This session introduces **drake** for smart, reproducible workflows as a way to standardize and automate checking what needs to be rerun, avoiding manual re-execution of every script line after a change. The speaker motivates drake for analyses with many modular components where changing one or two base components should not require rerunning an expensive full pipeline; drake shines when iteration is frequent and runtime matters. Compared with other workflow managers like Luigi/Airflow, **drake** is native to R — the `drake_plan` looks exactly like R code, so existing code can be adjusted rather than rewritten. It complements unit testing: tests assess individual functions while drake organizes the pipeline of calling those functions in the correct sequence. At its core drake uses a data frame of targets plus the code to build them, optionally with extra columns for rebuild rules; it builds a target, stores the result to a disk cache as an R data object, and marks it outdated if the code to create it or any dependency changes. Detection uses an MD5 of contents (mostly ignoring metadata unless told to look at it) and therefore notices changes to CSV files even on Dropbox. A concrete demo builds a plan with five targets — `raw_data` reading a raw Excel/CSV, a mutate output, `hist` via `create_plot`, `fit`, and a knitted `report`/`report.html` — visualizes the network (imported/outdated/up-to-date interactions), calls `make()` or `readd`/`loadd` for cached data, changes `create_plot` to show `hist` and downstream `report` become outdated, and rebuilds only outdated objects. Discussion notes scalability to 100 steps, one-time vs. iterative projects (useful already during development), and that the simplest linear script `a -> B -> C` can be copy-pasted into a plan by adding commas, with no auto-script-to-plan converter.

## Key Concepts & Tools Taught

- **drake-workflow**: Using `drake` to turn a sequence of scripts that must run in a specific order into an automated, reproducible pipeline where a computer determines what to rerun, with minimal reshaping if code already is modular.
- **reproducibility-cache**: Each target's result is stored to a disk cache as an R data object; if code or upstream dependencies change, drake marks it outdated and recreates only what is needed next `make()`, saving half the runtime on iterative fixes.
- **drake-vs-unit-testing**: Unit tests are good when working with functions (describing operations to assess); **drake** is good when working with data/pipelines (organizing the pipeline of calling those functions in correct sequence); they complement each other and drake can be called from within a package.
- **dependency-tracking-md5**: Change detection via MD5 against contents, mostly ignoring metadata; recognizes a CSV change even on Dropbox, and notices when a called function like `create_plot` (or a sourced package) changes.
- **drake-plan-targets**: A `drake_plan` is a data frame with targets (e.g., `raw_data`, mutated output, `hist` from `create_plot`, `fit`, knitted `report`) and commands; visualization shows objects/functions/files as imported/outdated/up-to-date and their dependencies, and `make()`/`vis_drake_graph()` update status; `readd`/`loadd` read cached targets.


## Code Snippets & Formulas

Caption-mangled forms kept alongside normalized R:

```r
# drake plan sketch (caption "drink" <- drake throughout)
library(drake)  # "Drake works really well for projects where there are many many different components"
drake_plan(
  raw_data = read_csv("raw_data.xlsx"),  # "have a target called raw data which reads in this enormous CSV file"
  data = mutate(raw_data, ...),          # "simple mutates on this data set to create the output data I'm naming it this target here"
  hist = create_plot(data),             # "histogram o'clock ... creating a naming to the target hist" # create plot <- create_plot
  fit = fit_model(data),                # "simple fit to that data and aiming at the target fit"
  report = knit("report.Rmd")           # "knitted report that we're calling the nuclear recalling report" # knitted report
)

# Make and inspect
vis_drake_graph(drake_plan)  # "visualize the Drake plan itself and of note structure so you see right here you can look objects functions and files which are imported outdated or up-to-date"
make(drake_plan)            # "you can make that plan"
readd(data) ; loadd(hist)   # "for the spy reads D kind of reads the cached grade data for the odds for the target data out so you can see what that data looks like" # reads D / grade data mangled for readd/loadd

# Change and invalidate
create_plot <- function(data) { ... ; create_plot + extra line }  # "we change this function here we can even change it back up here where we initiative to find route to add this extra line called a create plot"
vis_drake_graph(drake_plan)  # now hist is outdated as well as report / report.html downstream
make(drake_plan)  # rebuilds only hist and report - "it'll update only the objects that need to that it thinks are outdated"

# MD5 detection
# "a dozen md5 against the contents it mostly ignores metadata unless you tell it to specifically look at the metadata" # dozen md5 <- does an md5
```

