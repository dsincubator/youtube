---
type: source
title: "wtf: Holistic workflow (part 1)"
source_file: "cKAXDJq5ZdA_wtf-holistic-workflow-part-1.md"
video_id: "cKAXDJq5ZdA"
url: "https://www.youtube.com/watch?v=cKAXDJq5ZdA"
lang: en
tags: ["ds-incubator", "workflow", "r-packages"]
key_topics: ["holistic-workflow", "project-oriented-workflow", "blank-slate", "here-package", "restart-r"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=cKAXDJq5ZdA"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 46
    last_modified: "2022-02-08T00:00:00Z"
usage_window: { from: "2022-02-08T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# wtf: Holistic workflow (part 1)

## Summary

This session opens the wtf (What They Forgot) series based on *What They Forgot to Teach You About R* by Jenny Bryan, Jim Hester and colleagues (book by "jenny ryan and jim hester"). The stated goal is a **[holistic-workflow]** that is project-oriented and removes common friction outside statistical analysis itself. The target learner is a self-taught R/RStudio user with moderate experience who may have drifted into brittle habits and wants a more effective, self-sufficient R life.

The core of part 1 is the blank-slate principle. By default R offers to save the workspace (`*.RData`) and reload it on restart, which encourages keeping artifacts instead of source; the speaker shows the RStudio Global Options → General setting where "Restore .RData into workspace at startup" should be unchecked and "Save workspace to .RData on exit" set to Never (defaults are checked / Ask). Saving source and always starting clean forces reproducibility and prevents the state where saved objects no longer match current code.

The second half argues that restarting R is far superior to clearing objects with `rm(list = ls())`. `rm(list = ls())` only removes objects from the Global Environment but leaves hidden state such as `options()` and attached packages, so code can appear to work due to dependencies absent from the script (e.g., `filter()` resolving to `dplyr` after an earlier `library(tidyverse)` remains attached). The recommended practice is to restart often — the speaker notes roughly 20 restarts per hour during active development — and to write scripts that run from a blank slate. Tools that avoid full restarts, such as targets memoisation, are previewed for later. The demo walks through RStudio keyboard shortcuts for restarting and for sending code to the console line-by-line versus chunk-wise, in both plain `.R` scripts and `.Rmd` documents, and closes by previewing the next topic: the **[project-oriented-workflow]** and replacing `setwd()` with the **[here-package]**.

## Key Concepts & Tools Taught

- **[holistic-workflow]:** A project-oriented workflow that addresses friction outside the analysis itself, drawn directly from *What They Forgot to Teach You About R* — "build a holistic and project oriented workflow that addresses most of the common sources of friction in data analysis outside of doing your statistical analysis itself".
- **[blank-slate]:** Configuring R/RStudio to never save or restore the workspace so each session starts empty, forcing the author to save source that reproduces artifacts.
- **[restart-r]:** Frequently restarting the R session (Ctrl+Shift+F10 / Shift+Ctrl+F10, Session → Restart R) as the reliable way to ensure reproducibility; the speaker notes restarting 20 times per hour and notes Mac shortcut variants.
- **[project-oriented-workflow]:** The principle that each project carries its own working directory (replacing `setwd()` calls) — previewed as the next section's focus.
- **[here-package]:** The `here` package ("here package" / "library here") for building paths relative to the project root; `library(here)` reports the project root; contrasted with `fs` package usage shown earlier.
- **[rm-list-ls]:** The pitfall of `rm(list = ls())` ("when you do rm and the argument list you equal that to ls" / "rm list equals ls") — only wipes Global Environment objects, not options, search path, or working directory.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```r
# Blank-slate setup (RStudio UI)
# Tools → Global Options → General → uncheck "Restore .RData into workspace at startup"
# Set "Save workspace to .RData on exit" to Never  # "by putting this drop down menu to never you will be asking r to not reload your workspace"

library(here)          # "when i run library here" — reports project root (here::here())
library(fs)            # "using the fs package a little bit" — file-system helpers demoed

rm(list = ls())        # "when you do rm and the argument list you equal that to ls" — superficial clean, does NOT clear options/packages/wd

setwd("path/to/project")  # "using set wd to change working directories" — discouraged in favour of project-oriented workflow

# Keyboard shortcuts (caption fragments)
# "shift ctrl f10 and that will refresh everything" / "session restart r" → Restart R (Session → Restart R)
# "ctrl l to clear that up" → Ctrl+L clear console
# "shift ctrl enter everything runs" → Shift+Ctrl+Enter run whole file
# "ctrl alt b will run" → Ctrl+Alt+B run up to current line
# "ctrl enter will run the line where you are and we'll move the focus to the next one" → Ctrl+Enter
# "alt enter and then number number two ... your cursor stays in line too" → Alt+Enter run without moving
# "ctrl one ... ctrl two" → Ctrl+1 focus source, Ctrl+2 focus console
# R Markdown variants: "run next chunk ... ctrl alt c then press ctrl alt n" → Run Current Chunk / Next Chunk via Run dropdown
```
