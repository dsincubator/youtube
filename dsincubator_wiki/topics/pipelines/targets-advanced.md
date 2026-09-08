---
type: Attested Computation
title: targets Advanced Topics
description: Outdated targets, target networks, external files, literate programming,
  and queues
lang: en
tags:
- ds-incubator
runtime: r
computation_type: pipeline
generated:
  by: agent:okf-wiki-builder/1.0
  at: '2026-09-08T04:00:00Z'
status: draft
sources:
- id: dV9C2eIo5QQ
  resource: https://www.youtube.com/watch?v=dV9C2eIo5QQ
  title: 'targets: tar_cue(): Declare the rules that mark a target as outdated.'
  author: process:yt-dlp
  usage_count: 185
  last_modified: '2021-02-16T00:00:00Z'
- id: jAkNwaGRku0
  resource: https://www.youtube.com/watch?v=jAkNwaGRku0
  title: 'targets: Eexternal files and literate programming'
  author: process:yt-dlp
  usage_count: 178
  last_modified: '2021-03-02T00:00:00Z'
---
# targets Advanced Topics

## Overview

This Attested Computation deep-dives the freshness logic of `targets`. [source_dV9C2eIo5QQ](../../sources/source_dV9C2eIo5QQ_targets-tar-cue-declare-the-rules-that-mark-a-target-as-outdated.md) works through a three-target pipeline (`path` → `raw` via `read(path)` → `data` via `clean(raw)`) to show exactly when `tar_make()` decides to skip or rebuild, exposing `tar_cue()`. [source_jAkNwaGRku0](../../sources/source_jAkNwaGRku0_targets-eexternal-files-and-literate-programming.md) extends the same pipeline to file dependencies and literate programming (R Markdown/Quarto reports as targets).

The lesson is that caching is not magic but policy: `tar_cue(mode, command, depend, format)` declared globally (`tar_option_set(cue = ...)`) or per-target (`tar_target(..., cue = tar_cue(...))`) controls the policy. A participant use case — pinning a database-pull target to `mode = "never"` during iteration — grounds the abstraction.

## Key Concepts

- **Metadata and errors**: no `_targets/meta/meta` → every target outdated; `tar_destroy()` deletes the store so `tar_outdated()` returns all names; a target that errored (`stop("this is with an error")` inside `clean`) stays outdated until fixed — [source_dV9C2eIo5QQ](../../sources/source_dV9C2eIo5QQ_targets-tar-cue-declare-the-rules-that-mark-a-target-as-outdated.md).
- **`mode`**: `thorough` (default, hash everything), `always` (force rebuild), `never` (force up-to-date even after editing `clean` to add `"hello"`) — [source_dV9C2eIo5QQ](../../sources/source_dV9C2eIo5QQ_targets-tar-cue-declare-the-rules-that-mark-a-target-as-outdated.md).
- **`command` cue**: `tar_cue(command = TRUE)` (default) makes changing `read(path)` mark `raw` and downstream `data` outdated; `FALSE` disables that — [source_dV9C2eIo5QQ](../../sources/source_dV9C2eIo5QQ_targets-tar-cue-declare-the-rules-that-mark-a-target-as-outdated.md).
- **`depend` cue**: `depend = FALSE` breaks upstream propagation so editing `read()` leaves downstream `data` up-to-date even though `raw` is outdated — [source_dV9C2eIo5QQ](../../sources/source_dV9C2eIo5QQ_targets-tar-cue-declare-the-rules-that-mark-a-target-as-outdated.md).
- **`format` cue**: default `rds` vs `qs` storage; change of format marks outdated — [source_dV9C2eIo5QQ](../../sources/source_dV9C2eIo5QQ_targets-tar-cue-declare-the-rules-that-mark-a-target-as-outdated.md).
- **Scope**: global via `tar_option_set(packages = "readr", cue = tar_cue(...))` vs per-target via `tar_target(raw, read(path), cue = tar_cue(command = FALSE))` — [source_dV9C2eIo5QQ](../../sources/source_dV9C2eIo5QQ_targets-tar-cue-declare-the-rules-that-mark-a-target-as-outdated.md).
- **External files & literate programming**: `format = "file"` tracks on-disk CSVs; a report `.Rmd`/`.qmd` can be a downstream target that rebuilds only when its data target changes — [source_jAkNwaGRku0](../../sources/source_jAkNwaGRku0_targets-eexternal-files-and-literate-programming.md); see [targets Introduction](../pipelines/targets-introduction.md) and [Reproducible Workflows](../pipelines/reproducible-workflows.md).

## Attested Computation

- **Runtime**: `r`
- **Computation type**: `pipeline`
- **Attestation**: Policy is attested by the store: `tar_make()` reads `_targets/meta/meta` to decide. Verify by asserting `tar_outdated()` returns the expected set before `tar_make()`, after `tar_destroy()`, after an error, and after toggling `tar_cue(mode=...)` or `command`/`depend`. Use `tar_network()` to prove dependency edits propagate as configured.

```r
library(targets)
tar_outdated()  # inspect
tar_make()      # conditional recompute
tar_destroy()   # force full rebuild next run
# global
tar_option_set(cue = tar_cue(mode = "always"))
# per-target
tar_target(raw, read(path), cue = tar_cue(command = FALSE))
tar_target(db_data, get_data(), cue = tar_cue(mode = "never"))
tar_target(path, "data/file.csv", format = "file")
```

## Sources

| Video | Title | Views | Last Modified |
| [dV9C2eIo5QQ](https://www.youtube.com/watch?v=dV9C2eIo5QQ) | [targets: tar_cue(): Declare the rules that mark a target as outdated.](../../sources/source_dV9C2eIo5QQ_targets-tar-cue-declare-the-rules-that-mark-a-target-as-outdated.md) | 185 | 2021-02-16T00:00:00Z |
| [jAkNwaGRku0](https://www.youtube.com/watch?v=jAkNwaGRku0) | [targets: Eexternal files and literate programming](../../sources/source_jAkNwaGRku0_targets-eexternal-files-and-literate-programming.md) | 178 | 2021-03-02T00:00:00Z |
## References

- Hadley Wickham — *R Packages* (Whole game, Documenting, Testing, CRAN)
- Hadley Wickham — *R for Data Science* (Workflow, EDA, ggplot2, dplyr)
- `usethis`, `devtools`, `roxygen2`, `pkgdown`, `targets`, `drake`, `ggplot2` documentation
