---
type: source
title: "wtf: Holistic workflow (part 2)"
source_file: "ek3b0m1iCdk_wtf-holistic-workflow-part-2.md"
video_id: "ek3b0m1iCdk"
url: "https://www.youtube.com/watch?v=ek3b0m1iCdk"
lang: en
tags: ["ds-incubator", "workflow", "github-issues", "git", "r-packages"]
key_topics: ["project-oriented-workflow", "here-package", "r-projects", "restart-r", "relative-paths"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=ek3b0m1iCdk"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 14
    last_modified: "2022-02-15T00:00:00Z"
usage_window: { from: "2022-02-15T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# wtf: Holistic workflow (part 2)

## Summary

This session covers project-oriented workflow as the "most important meetup of the series" within the WTF (What They Forgot to teach you about R) holistic-workflow strand, building on the previous meetup about starting from a blank slate and restarting R often. The presenter first revisits Monica's question about `rm` versus restarting when working on an R package, showing that the general advice to restart is usually better, but targeted `rm` has a legitimate use that should not be demonized.

Using a temporary package `abc` with a function `f(x) = x + 1` and later `f(x) = x * x + 10`, the demo contrasts the package-developer workflow of editing `R/f.R` and pressing `Shift+Ctrl+L` (`devtools::load_all()` — caption "shift ctrl l or calling dev tools load all" ← `devtools::load_all`) which saves the file and loads the package without leaving objects in the global environment, versus pressing `Ctrl+Enter` on the function definition which creates an `f` object in `.GlobalEnv`. Calling `f(1)` from the package returns `11`, but the global copy returns `101`, causing a namespace conflict that `load_all` detects and suggests fixing with `rm(list = "f")` (caption "rm list list equals f" ← `rm(list = "f")`). Restarting would also work but would wipe other valuable global objects, so the message recommends `rm` specifically for that case. Comments reinforce that `rm(list=ls())` at the top of a script (caption "rm list equals ls" / "rm list ls" ← `rm(list = ls())`) is a lazy fake restart that does not unload packages or reload `.Rprofile` and is discouraged in favor of truly restarting, especially when `.Rprofile` loads `tidyverse`.

The second half defines project-oriented workflow and portability. The core rule is that projects must be portable: code that works only on your machine does not work for the team. The bad example is Jenny Bryan's absolute path `setwd("/Users/jenny/.../fufi/data")` plus `library(ggplot2)`, reading `data/file.csv` and writing `figs/plot.png` with paths relative to a subdirectory — which breaks for anyone else (caption "set wd ... which sets working directory wd stands for that ... with some kind of path that i only work that i only have" ← `setwd`). A less-bad convention is to call `setwd(".../fufi")` once at the top of a script and use paths relative to the root, but the robust definition is a folder containing everything the project needs, with every path relative to the root. RStudio Projects (a folder with a `.Rproj` file — caption "the folder has a specific file and that ends like which extension is our approach" ← `.Rproj`) and git repositories (which drop a `.git` folder at the root — caption "the git program drops a folder at the root and that defines the root") give a formal root that tools can discover. The `here` package (caption "here package" ← `here::here`) leverages that root so `here("data", "file.csv")` and `here("figs", "plot.png")` construct OS-independent paths by separating components with commas rather than hard-coded slashes/backslashes. Inside R Markdown the default working directory is the document's directory, not the project root, which breaks relative construction like `file.path("01_holistic_workflow", "shortcuts.R")` inside a subdirectory; replacing `file.path` with `here` fixes it because `here` is root-aware. The IDE demo shows RStudio automatically setting `getwd()` to the project root, restarting R, and restoring open files when a `.Rproj` is opened (seen in the top-right "Project: None" vs project name), versus needing manual `setwd` otherwise, and how to work with multiple projects in insulated sessions via the projects menu arrow opening a new session plus external launchers like Albert/Alfred (`Shift+Space`, type project name). The session ends reinforcing that portability is the most important team practice and pointing to coding help desks for friction, including the absolute vs relative path distinction prompted by CJ.

## Key Concepts & Tools Taught

- **[project-oriented-workflow]:** Definition that a project is a self-contained folder holding all inputs including data, with the project directory as root and all paths relative to it; portability is mandatory ("the project must be portable ... if you have something that works in your computer it doesn't work on mine it just doesn't work").
- **[here-package]:** Wrapper that discovers the project root (`.Rproj` or `.git` folder) and replaces `file.path`/`path` with `here("data", "file.csv")` (caption "here package ... completely remove the need to hard code tasks ... you construct paths embraced by the here function ... separate the different components by commas" ← `here::here`), correctly handling OS separators and R Markdown defaults.
- **[r-projects]:** RStudio's formal project notion — a folder containing a `.Rproj` file (caption "that ends like which extension is our approach" ← `.Rproj`) — whose launch sets `getwd()` to the root, restarts R cleanly, and restores files; git repos similarly define root via `.git` so `here` works even without `.Rproj`.
- **[restart-r]:** Guidance to start from a blank slate by restarting R often rather than `rm(list = ls())` (caption "rm list equals ls ... fake way ... doesn't do all of that stuff" ← `rm(list=ls())`), with the narrow exception of `rm(list="f")` for removing a single shadowing object reported by `devtools::load_all()` via `Shift+Ctrl+L`.
- **[relative-paths]:** Contrast of absolute paths (`/Users/jenny/.../fufi` — caption "this entire thing is an absolute path it encodes every single folder inside the computer" ← absolute path) that encode the full filesystem and break on other machines versus relative paths (`data/file.csv`, `figs/plot.png` relative to `fufi` root — caption "this is a path that doesn't contain the entire information ... related to the root of the project ... so this is relative" ← relative path) that are portable when anchored at the root; includes the R Markdown pitfall where document-dir is not project-dir.

## Code Snippets & Formulas

Caption-mangled, normalized here (quote-to-name):

```r
# Package workflow — targeted rm vs restart
# create package abc + file R/f.R
f <- function(x) x + 1                 # initial f
f <- function(x) x * x + 10            # changed to x times x plus 10
f(1)  # package version → 11 vs global copy → 101  # "if i give it 1 gives me 11 ... if i just call the function f that leaves in my global environment ... i get 101"
# Ctrl+Enter runs line and creates f in .GlobalEnv
# Shift+Ctrl+L saves + loads package
devtools::load_all()                   # "shift ctrl l or calling dev tools load all directly so that loads the entire package" ← load_all
rm(list = "f")                         # "rm list list equals f ... i have to quote this" ← rm
rm(list = ls())                        # "rm list equals ls is not great ... basically clears your thing" ← rm(list=ls()) — discouraged as script header
# restart R session — preferred general cure; preserves no objects, reloads .Rprofile / libraries

# Project paths
setwd("/Users/jenny/.../fufi/data")    # "start your project in a specific directory using the function set wd ... with some kind of path that i only work that i only have" ← setwd — bad, not portable
setwd("/Users/jenny/.../fufi")         # less-bad: set to root at top, then relative
read.csv("data/file.csv")              # then paths relative to root ... "inside data look for the csv file"
ggsave("figs/plot.png")                # "inside fix you know save this png file" (figs/plot.png)

# Portable replacement
here::here("data", "file.csv")         # "you construct paths embraced by the here function ... separate the different components by commas" ← here
here::here("figs", "plot.png")
file.path("01_holistic_workflow", "shortcuts.R")  # "to reach that shortcuts.r file ... create a path from the root" — fails in R Markdown default wd
# in R Markdown: default wd is document dir, not project root, so file.path fails; here() succeeds
getwd()                                # "if i ask what's my working directory it says ... it sets the working directory to the root of the project"
library(tidyverse)                     # "i have library tidy bursts as part of my r profile because i just want that to get loaded" ← library(tidyverse) tied to .Rprofile reloading on restart

# IDE project tricks
# RStudio: File → Recent Projects / top-right Project menu
# click name → open in current session (closes current project, R restarts, open files restored)
# click arrow → open in new session → insulated GlobalEnv (x <- 10 appears in one session only)
# Albert/Alfred launcher: Shift+Space → type project name → launch .Rproj
```
