---
type: source
title: "Project-oriented workflow"
source_file: "TEUbVjhooIg_project-oriented-workflow.md"
video_id: "TEUbVjhooIg"
url: "https://www.youtube.com/watch?v=TEUbVjhooIg"
lang: en
tags: ["ds-incubator", "r-packages", "workflow", "dropbox", "reproducibility"]
key_topics: ["project-oriented-workflow", "workflow-vs-product", "setwd", "rm", "here", "fs", "rstudio-projects", "self-contained-projects", "p-load", "dropbox-path", "drake"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=TEUbVjhooIg"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 32
    last_modified: "2020-01-14T00:00:00Z"
usage_window: { from: "2020-01-14T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# Project-oriented workflow

## Summary

This session reframes everyday R coding choices through Jenny Bryan's essay on project-oriented workflow, drawing on her blog post about `setwd` and `rm`. The core distinction is **workflow** (personal taste and habits, such as which editor you prefer) versus **product** (the essence of what the project does). Hard-wiring workflow into the product — for example with absolute paths or reliance on a long-running workspace — harms reproducibility and portability for you and for collaborators.

The speaker walks through four test cases (editor choice, raw data location, home-directory name, R code needed to run) to train the audience to spot workflow leaked into scripts. Solutions are then demonstrated: incremental refactoring (fix one line each time you touch a script rather than rewriting everything), dummy data for non-shareable sources, and repeated emphasis that conventions constrain individuals a little but make everyone's work safer.

Practical examples show the progression from an absolute path containing `/Users/mauro/documents` to a path built inside the project with `fs::path()`-style helpers, and finally to no hard-coded outside path at all — relying instead on RStudio Projects or the `here` package to find the project root. A self-contained project is defined as one whose scripts can run from a fresh R process with the working directory at the project root, create everything they need inside the project, and change nothing outside what they create. Violations covered include `../datasets` escapes, restoring `.RData` on startup, and `p_load`/`pacman::p_load` installing packages for the user. Dropbox friction is addressed with a helper that wraps the `fs`/`here` logic to locate the Dropbox folder portably. The talk closes noting that long-running expensive steps should be isolated to explicit `RDS` files or managed by the `drake` package.

## Key Concepts & Tools Taught

- **[project-oriented-workflow]:** Organising all code, data and outputs inside a single movable project folder so scripts never depend on paths outside it.
- **[workflow-vs-product]:** Jenny Bryan's distinction — workflow is personal taste/habits, product is the essence of the analysis; do not hard-wire workflow into product.
- **[setwd]:** `setwd` ← `said working directory` / `set working directory` / `not said working directory` — changing the working directory to a hard-coded absolute path (e.g., `/Users/jenny/...`); fails for anyone else and even for the author after paths change.
- **[rm]:** `rm` ← `remove` / `remove and ... remove` — removing objects from the global environment; captioned as the second problematic function alongside `setwd`.
- **[here]:** `here` / `here::here()` ← `function here which is very clever and identifies the room of a project` — finds the project root via criteria like `.Rproj`, `.here` file or `R/` folder; works with R Markdown's odd working-directory behavior.
- **[fs]:** `fs` ← `function from the FS which stands for file system package` — builds portable paths (`fs::path()`) that work across Mac/Windows/Unix without encoding the home directory.
- **[rstudio-projects]:** RStudio Projects (`.Rproj`) that set the working directory to the project root automatically on startup, removing the need for manual `setwd`.
- **[self-contained-projects]:** Projects that can be moved between computers, refer to files only with relative paths inside the project, run from a fresh R process, create everything they need in their own workspace/folder, and touch nothing outside.
- **[p-load]:** `p_load` ← `pillow` / `P load` — installs a package if missing then attaches it; described as rude because it mutates the user's library and can break version-sensitive code (contrast with RStudio's quiet install prompt on `library()`).
- **[dropbox-path]:** Helper concept wrapping `fs`/`here` to locate the shared Dropbox folder portably across machines (captioned as `to di a Dropbox which simply wraps this thing`), handling spaces and the `2°` symbol in the Dropbox path.
- **[drake]:** `drake` ← `Drake which is a package that works exactly on that problem` — manages long-running pipelines by caching intermediate results and skipping up-to-date steps.

## Code Snippets & Formulas

No verbatim code blocks in the transcript; spoken calls dictated live (caption-mangled, normalized here):

```r
setwd("/Users/mauro/documents/...")  # "not said working directory and remove" — absolute path anti-pattern
rm(list = ls())                      # "remove" — clearing global environment; not a substitute for a fresh process
fs::path("data", "my-data.csv")     # "using a function from the FS which stands for file system package"
here::here("data", "my-data.csv")   # "function here which is very clever and identifies the room of a project"
# RStudio Projects: open .Rproj => working directory at project root  # "instead of relying on working on a set it manually indirectly you can just rely on our studio projects"
p_load(dplyr)                        # "you like pillow because pillow what it does is it it attaches a package same as library if the packet exists ... if not it installs" — pacman::p_load
# incremental refactoring: fix one line per visit
# dummy data pattern: inject synthetic public data to demonstrate code when real data is private
# restart fresh: Session > Restart R (captioned "shift control if" / "tick that box a never store never ask")
```
