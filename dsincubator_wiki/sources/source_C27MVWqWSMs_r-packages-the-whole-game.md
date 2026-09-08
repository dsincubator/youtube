---
type: source
title: "R packages: The whole game"
source_file: "C27MVWqWSMs_r-packages-the-whole-game.md"
video_id: "C27MVWqWSMs"
url: "https://www.youtube.com/watch?v=C27MVWqWSMs"
lang: en
tags: ["ds-incubator", "r-packages", "cloud"]
key_topics: ["r-packages", "devtools", "usethis-workflow", "pkgdown", "r-cmd-check"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=C27MVWqWSMs"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 30
    last_modified: "2020-02-01T00:00:00Z"
usage_window: { from: "2020-02-01T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# R packages: The whole game

## Summary

Overview of the "Whole game" chapter of Hadley Wickham's *R Packages* (plus Charlotte and Hadley's "Building Tidy Tools" RStudio::conf 2020 workshop) focused on the contributor scenario — adding to someone else's package without `create_package()` or `use_git()`. The workflow is "modify → `load_all()` → explore in console → iterate", with the Edit → "Build" tab as the developer's friend.

Demonstrated from the `favors`/`factors` example repo cloned into the data-science incubator RStudio Cloud workspace: initial setup uses `usethis::use_devtools()` and `usethis::use_usethis()` to attach helpers at startup and `use_blank_slate()` to start each R session empty. Creating R files is `usethis::use_r("fct-reorder")` ("half pint is the sorry the file shown in the examples" → `use_r("half pint"` file)) which creates `R/fct.R`, then pasting the example `fct()` function and loading with `devtools::load_all()` via `Ctrl+Shift+L` (skeleton: "you don't even need to save the fire because when you do go home or the keyboard shortcuts which is what I use shift control L you get this prompt to save the file and that will attach everything"). `fct("a", "c")` is then available from the package environment.

Checks are run with `devtools::check()` from the console or Build tab. The initial check warns about no license — fixed with `usethis::use_mit_license("Author Name")` ("use MIT license that would add so it meets the name of the outdoor" → `use_mit_license`). Documentation is via roxygen2: place cursor on function name → Code → Insert Roxygen Skeleton → fill `@param`, `@description`, `@examples`, then `devtools::document()` (or Document menu) to generate `man/` and make `?fct` help appear. Re-running `check()` should now pass with no warnings. Installation is `devtools::install()` or the Install button, after which `library(factors)` makes `fct()` usable in a fresh session — source to binary installed on system.

## Key Concepts & Tools Taught

- **[R packages: The whole game (r-packages)]:** Chapter/workshop framing packages as conventions + tools that simplify contributing (10-step game: `use_r`, `load_all`, `check`, `use_mit_license`, `document`, `install`).
- **[devtools workflow (devtools)]:** `devtools::load_all()` (`Ctrl+Shift+L`) simulating install & attach, `devtools::check()`, `devtools::install()`; plus RStudio Build tab shortcuts; `R/packages` have separate environments from `globalenv()`.
- **[usethis helpers (usethis-workflow)]:** `usethis::use_devtools()`, `use_usethis()`, `use_blank_slate()`, `use_r(name)` to create `R/*.R`, `use_mit_license()`, `use_git()`-like setup but skipped here for contributor case; creating local clone via RStudio → New Project → Version Control → Git.
- **[roxygen2 documentation (pkgdown)]:** Roxygen skeleton (`#' @param`, `#' @examples`), then `devtools::document()` to build `man/` and `?fct`; later browsable via `pkgdown` reference index (cross-link to this video's pkgdown segment).
- **[R CMD check (r-cmd-check)]:** `check()` aggregates warnings (license, documentation); fixing warnings until 0/0/0 before install.

## Code Snippets & Formulas

Transcript-mangled → normalized:

```r
# setup (one-time)
usethis::use_devtools()    # "use these use the tools if you run that function what you get is no like this code that you can paste"
usethis::use_usethis()     # attaches usethis
usethis::use_blank_slate() # "start every session from a completely black slate" — devtools option

# contributor clone
# RStudio: File → New Project → Version Control → Git → paste GitHub URL for 2degrees/factors (shown in Cloud workspace)

usethis::use_r("fct")      # "use R is a function from the use this package ... it takes the first argument is the name of a file half pint is the sorry the file shown in the examples" → use_r("fct")
# paste function
fct <- function(x, y) paste(x, y)  # demo function from book
devtools::load_all()       # "when you do go home or the keyboard shortcuts which is what I use shift control L you get this prompt to save the file and that will attach everything"
fct("a", "c")

# check → fix → document → install loop
devtools::check()          # via console or Build tab "from the build tab which is the friend of the developers"
# Warning: No license
usethis::use_mit_license("Author")  # "so we can run that function that you see there use MIT license that would add so it meets the name of the outdoor"

# document
# cursor on fct → Code → Insert Roxygen Skeleton
#' Title
#' @param x First string
#' @param y Second string
#' @examples fct("a","c")
devtools::document()       # "if you do it on the concepts fine or you can also do it from here" → Document; then ?fct shows help

devtools::check()          # now passes no warnings
devtools::install()        # "here is for convenience the bottom that does that" → Install; package now usable via library(factors)
library(factors); fct("a","b")
```
