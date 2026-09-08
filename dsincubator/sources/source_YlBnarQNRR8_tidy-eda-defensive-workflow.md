---
type: source
title: "tidy EDA: Defensive workflow"
source_file: "YlBnarQNRR8_tidy-eda-defensive-workflow.md"
video_id: "YlBnarQNRR8"
url: "https://www.youtube.com/watch?v=YlBnarQNRR8"
lang: en
tags: ["ds-incubator", "workflow", "r-packages", "git", "eda"]
key_topics: ["defensive-workflow", "blank-slate", "project-oriented-workflow", "safe-paths", "here-package"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=YlBnarQNRR8"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 43
    last_modified: "2021-10-26T00:00:00Z"
usage_window: { from: "2021-10-26T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# tidy EDA: Defensive workflow

## Summary

Series kickoff for tidy EDA (exploratory data analysis with the tidyverse) framing the syllabus around *R for Data Science* chapter 7 but noting prerequisites are needed first. Stored in the `ds.tidy.eda` repository (folder `01_prerequisites`), the session defines a "defensive workflow" — habits around analysis rather than inside it that remove friction and make work reproducible — and argues that these habits are more valuable than any single EDA technique because without them reproduction fails.

Five elements are covered, each linked to Happy Git with R and What They Forgot to Teach You About R:

**Blank slate:** Start R from nothing on every restart. RStudio by default saves/restores `.RData`; this harms reproducibility when hidden objects affect results. Fix via `Tools → Global Options` (Save workspace = Never; uncheck Restore .RData) or via command palette (Ctrl+Shift+P → "save workspace"), or programmatically with `usethis::use_blank_slate()` (project vs user scope). Combine with habitually restarting R (`Session → Restart R` or palette → "restart R"). Acknowledgement that forgetting to share screen prompted a switch to show RStudio.

**Project-oriented workflow:** Organize work as an RStudio Project (File → New Project → New/Existing Directory) so the project root anchors all paths; the IDE then sets the working directory automatically. Recommended parent folder `~/git/` for discoverability, with fast access via `File → Recent Projects` (Alt+F → J) or launchers like Alfred. Distinction: "Project: None" in top-right means not using a project.

**Safe paths:** Never hard-code absolute prefixes (`C:/Users/mauro/...`) and never use `setwd()`. Paths must be nested inside the project and relative to its root. The `here` package (`here::here("data", "greeting.txt")` — "here column column" ← here::here) abstracts the prefix so the script works on any machine. Bad path `C:/Users/mauro/.../fragile space path` breaks on other OSes; portable convention uses ISO date prefix, no spaces (`2021-10-26_abstract-for-sla.docx`), following Jenny Bryan's file-naming slides.

**Data-science workflow & tools:** Recap of import-tidy-transform-visualize-model-communicate; series will use `ggplot2` for visuals and `dplyr` verbs (`select` and a few others) composed into pipelines, plus R Markdown (`*.Rmd`) to interleave prose and code. Acknowledge audience questions on what "project-oriented workflow" means and CJ's anecdote that forbidding `setwd()` and adopting RStudio Projects (which simply set working directory) eliminated prior ad-hoc `setwd`/`here` workarounds, recommending `file.path()` over manual `paste0` for programmatically building paths.

The session stops before the actual EDA exploration, positioning this defensive foundation as the first viable exit point for the series.

## Key Concepts & Tools Taught

- **[defensive-workflow]:** The set of setup habits (blank slate, projects, safe paths, naming) surrounding analysis that make it reproducible and low-friction, rarely taught alongside R syntax.
- **[blank-slate]:** Never saving/restoring workspace (`.RData`) between sessions; setting Save workspace to Never, disabling Restore .RData, using `usethis::use_blank_slate()`, and habitually restarting R.
- **[project-oriented-workflow]:** Working inside an RStudio Project (`.Rproj`) so the working directory is the project root automatically; project indicated in top-right corner, not "Project: None". Project folders are portable via zip or GitHub clone.
- **[safe-paths]:** Using project-relative paths only, avoiding `setwd()` and absolute hard-coded prefixes containing usernames. Bad example breaks when shared; correct pattern benefits from `file.path()` for delimiters.
- **[here-package]:** `here::here()` ("here column column" → here::here) to construct safe paths relative to project root, aware of `.Rproj` vs `.git` root vs `.here` marker.
- **[r-markdown]:** R Markdown as the document format to combine code and prose for the series.
- **[dplyr-and-ggplot2]:** Core tools for the upcoming EDA — `ggplot2` reusable plot template for variation, and a handful of `dplyr` verbs composed into pipelines.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```r
# Blank slate
# RStudio UI: Tools → Global Options → Save workspace → Never; uncheck Restore .RData on start
# Command palette: Ctrl+Shift+P → "save workspace" / "load workspace onstart"
usethis::use_blank_slate(scope = "project")  # "use this has a function called use blank slate" ← use_blank_slate
usethis::use_blank_slate(scope = "user")     # project vs entire user
# Session → Restart R  — or palette → "restart r" → Enter — habitually restart

# Project-oriented workflow
# RStudio: File → New Project → New Directory / Existing Directory → path ~/git/demo → Create Project (with git)
# Recents: Alt+F → J → select ds.tidy.eda
# With `here` marker: .Rproj / .git / .here file defines project root

# Safe paths — correct vs bad
here::here("data", "greeting.txt")  # "here column column" ← here::here — correct, project-relative, no prefix hard-coded
readr::read_csv(here::here("data", "mydata.csv"))
file.path("data", "mydata.csv")     # "file.path function to build paths programmatically rather than using paste zero" ← file.path — safer delimiters
# BAD — breaks on other machines/OSes:
# "C:/Users/mauro/.../data/greeting.txt" — absolute with username
# "C:/.../fragile space path/2021 my data.csv" — spaces, fragile delimiters

# Portable file naming (Jenny Bryan slides): good vs bad
# BAD: "abstract for sla.docx" (spaces, vague)
# GOOD: "2021-10-26_abstract-for-sla.docx" — YYYY-MM-DD prefix, hyphens, no spaces

# dplyr/ggplot2 starter (previewed for next meetups)
library(dplyr)
library(ggplot2)
# template: ggplot(data, aes(x = var)) + geom_*
```
