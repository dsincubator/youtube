---
type: source
title: "targets: Introduction"
source_file: "pbc6NX1n01Q_targets-introduction.md"
video_id: "pbc6NX1n01Q"
url: "https://www.youtube.com/watch?v=pbc6NX1n01Q"
lang: en
tags: ["ds-incubator", "targets", "pipelines", "r-packages", "workflow"]
key_topics: ["targets", "pipelines", "caching"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=pbc6NX1n01Q"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 2373
    last_modified: "2021-02-02T00:00:00Z"
usage_window: { from: "2021-02-02T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# targets: Introduction

## Summary

This meetup introduces targets as a general-purpose R package for long-running processes, following an earlier session on motivation. The presenter works through a minimal bare-bones project adapted from the walkthrough chapter of the targets manual, starting from an empty RStudio project and using the package's setup helper to create the required `_targets.R` file plus its edit helper to open it.

The core idea taught is the pipeline: each target is a named object defined by R code whose result targets stores in its objects folder, and `tar_make()` reads `_targets.R` and executes the steps in dependency order. The toy example has a `data` target that builds a data frame of random numbers and a `summary` target that applies a user-defined function to `data`. Finished targets are retrieved with `tar_read()` for reuse in the console or in reports, and network/glimpse helpers visualise how the targets relate.

The payoff demonstrated is caching: re-running `tar_make()` skips up-to-date targets and recomputes only targets whose code or upstream dependencies changed. The presenter shows this by adding `Sys.sleep()` to the user function `sum()` used by the `summary` target, so only `summary` reruns while `data` is skipped. The session also covers basic project organisation — moving functions to `R/functions.R` and sourcing them, plus declaring shared package options — and previews later topics such as good-target practices and debugging failures.

## Key Concepts & Tools Taught

- **[targets]:** An R package for managing long-running computations as a pipeline of named, stored objects rather than a sequence of scripts.
- **[tar_make]:** The function that reads the `_targets.R` file and executes the pipeline, running each target whose work needs doing.
- **[tar_read]:** Function for retrieving a finished target from the targets store into the console or a downstream report ("you can call the function tar read and you can give it the name of any of the targets").
- **[outdated/skipped targets]:** Status checks showing whether targets are up to date or need rerunning after code or dependency changes.
- **[pipeline dependencies]:** Later targets consume earlier targets (here `summary` uses `data` plus the `sum` function), forming an ordered dependency network that can be inspected with glimpse/network helpers.
- **[caching]:** Targets stores each result on disk and skips recomputation when nothing affecting that target changed, so only outdated branches rerun.

## Code Snippets & Formulas

No verbatim blocks in the transcript; spoken calls dictated live (caption-mangled, normalized here):

```r
library(targets)
tar_script()          # "we are going to use the function script" — creates _targets.R
tar_edit()            # "you can also use the function target edit which pops up the file"
tar_make()            # "just by calling the function uh tara make"
tar_read("summary")   # "you can call the function car read and you can give it the name of any of the targets"
tar_outdated()        # "it's called car outdated"
tar_glimpse()         # "entire glimpse" — cheap target-network preview
tar_network()         # "this network" — detailed target relationships
source("R/functions.R")  # "call the function source ... are functions dot r"
Sys.sleep(5)          # "there is a function in our base which is called cis sleep"
```
