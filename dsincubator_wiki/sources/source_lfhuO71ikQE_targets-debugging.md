---
type: source
title: "targets: debugging"
source_file: "lfhuO71ikQE_targets-debugging.md"
video_id: "lfhuO71ikQE"
url: "https://www.youtube.com/watch?v=lfhuO71ikQE"
lang: en
tags: ["ds-incubator", "targets", "debugging", "pipelines", "r-packages"]
key_topics: ["targets-debugging", "traceback-and-debug", "tar-meta-error", "debug-with-callr-foreground"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=lfhuO71ikQE"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 137
    last_modified: "2021-03-09T00:00:00Z"
usage_window: { from: "2021-03-09T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# targets: debugging

## Summary

This session covers debugging with **targets**, focusing on the first of three subsections in the *targets* manual's Debugging chapter (most important for medium-sized pipelines; the third is also touched), contrasting normal R debugging with pipeline debugging. It first refreshes standard tools on a toy example: `add_one(x) { x + 1 }` and `calculate(x) { add_one(x) * 2 }` are sourced, `calculate(1)` returns 4, but `calculate("1")` errors because a string cannot be added; `traceback()` shows the error originates not from `calculate` but from `add_one` line 2, and `debug(add_one)` (called with symbol, not string) enters a browse debugging environment with the file open, traceback-like stack navigation, and `n` (next) stepping, allowing inspection of the promise `x` which materializes to `"1"` revealing the type error — fixed by passing a double and un-debugging. The pipeline case uses an actual **targets** project (`_targets.R` plus `R/` functions) where `tar_visnetwork()` shows targets, with `data` → `lm_plot` → downstream reports; `lm_plot` is broken and out-of-date blocking downstream. `tar_make()` fails and identifies `target lm_plot` as the culprit; the manual (kept open) recommends inspecting `tar_meta` (a data frame with an `error` column) filtered to error rows to see the injected message `oh no`. The recommended interactive flow is: restart the session to protect expensive cached targets, run `library(targets)` plus `devtools::load_all()` to source `R/` (shortcut Ctrl+Shift+L), identify that the failing target's command is `plot_lm` (target name `lm_plot` vs. function `plot_lm`), call `debug(plot_lm)`, then `tar_make(names = lm_plot, callr_function = NULL)` i.e., `callr = FALSE` to bring the background `callr`-engine process to the foreground so the debugger can attach (targets normally runs in background and `traceback()` there is messy low-level). This lands in the familiar browse environment inside `R/plot_lm.R` where `n`/Next steps through the function, `data` and `region` etc. can be inspected until `stop("oh no")` is found, removed, the package rebuilt (`install`), session restarted, and `tar_make()` completes with `tar_visnetwork()` no longer showing a broken target. The speaker notes two other debugging modes — declaring the debug flag in `_targets.R` (interactive console) vs. workspaces (persistent, shows all dependencies but no in-body debugger view) — and closes by noting why normal `traceback()` fails on targets (complex low-level, not pointing to the right direction).

## Key Concepts & Tools Taught

- **targets-debugging**: Debugging a **targets** pipeline differs from vanilla R because targets run on a background `callr` process away from the global environment; the Debugging chapter proposes three approaches, the first (environment browser) being most useful for medium pipelines.
- **traceback-and-debug**: Outside targets, `traceback()` pinpoints where an error is thrown (e.g., line 2 inside `add_one` not `calculate`) and `debug(add_one)` (symbol, not string) enters a browse environment where `n` steps through the body and promises can be inspected (`x` materializes from promise to actual string value) to find type mismatches.
- **tar-meta-error**: `tar_make()` narrows the failing target (e.g., `lm_plot`); `tar_meta` is a data frame whose `error` column filtered to non-empty rows shows the injected error message (e.g., `oh no`) and target name, first place to look per manual.
- **debug-with-callr-foreground**: To interactively debug, restart session (to protect expensive caches), `library(targets)` + source `R/` via `load_all()`, `debug(plot_lm)` where `plot_lm` is the command behind target `lm_plot`, then `tar_make(names = lm_plot, callr_function = NULL)` (`callr = FALSE`) to run the pipeline in the foreground attached to the debugger, stepping through `R/plot_lm.R` with Next/`n` and inspecting objects (`data`, `zone`) until the bad line is fixed, then rebuild package and `tar_make()` succeeds.


## Code Snippets & Formulas

Caption-mangled with normalized R:

```r
# Vanilla debugging (outside targets)
add_one <- function(x) x + 1  # "called at one this function takes a an element and adds one" # at one <- add_one
calculate <- function(x) add_one(x) * 2  # "takes an object and applies the function at one first and then multiplies that times two"
calculate(1)  # -> 4  # "i fed the value one but then uh one was added to one that makes two and then was multiplied by two that makes four"
x <- "1"  # "if one instead of being a a double or an integer is a string"
calculate("1")  # error
traceback()  # "one of the mainstream tools that we have in r is the traceback which kind of shows us how we actually got to that point ... it came from the function not the one that i called which is calculate but instead from the function at one and specifically cm that is in line two" # cm <- column
debug(add_one)  # "we can use the function the debug and pass it the the symbol at one ... add one is an object that lives in my environment ... use the symbol as opposed to the string at one" # at one symbol
calculate("1")  # enters browse debugging environment # "something super interesting happens that you see ... we enter in this mode ... called a debugging environment where my console now looks a little different it has this browse thing"
# In debugger:
n  # next step # "you know i i run that function debug at one ... and then i do exactly what i did before basically to pass to you know to call the function calculate with the value"
x  # query promise # "x is still a promise it's called so it hasn't still be it hasn't been given a value yet ... as soon as i press x ... that promise materializes into the value that it has" -> "this is a string this is not a double"
# fix and retry, undebug via stop debugger

# Targets pipeline
library(targets)
tar_visnetwork()  # "this network gives you a very quick a nice overview of what the pipeline is like ... this pipeline has a bunch of targets here to the left and they all somehow get a data set ... lm plot is broken and therefore everything to the right of it is out of date" # targets network visualization
tar_make()  # tries to recompute; fails with "error so target is already giving us some information about uh what there is an error and also where the error is so it's in the target lm plot" # lm plot <- lm_plot
tar_meta  # "function that is called tar meta that you know it's a data frame that contains a bunch of information about targets but in particular you know we can explore uh the field error" # tar meta <- tar_meta
tar_meta$error  # filter to non-NA shows "oh no" injected error # "my error message was oh no"

# Environment-browser debugging recipe per manual
# Restart session first for safety # "because you are using expensive computations and you value what you have done a lot because it may have taken hours to produce ... restarting your session ... can protect you from destroying targets"
library(targets)
devtools::load_all()  # "i'm also going to source all functions in r and i did it in a very quick way shift control l ... this project is not only a target's project but it's also on our package so ... devtools load all at my disposal with keyboard shortcuts"
debug(plot_lm)  # "you ask to debug the function that uh produce the problem ... the broken targets is this one lm plot but ... the computation happens in the expression here in this command so the name that we need ... is plot lm" # plot lm <- plot_lm (R/plot_lm.R)
tar_make(names = lm_plot, callr_function = NULL)  # "the argument is called call r because there's a package that is the engine ... usually there is a function that you know runs to move the process to the background but now we're gonna say no so don't move it anywhere ... bring it here to the foreground" # call r <- callr, callr_function = NULL is callr = FALSE
# Now in browse: file R/plot_lm.R open, Next moves 11->12->13 etc., inspect "what is a zone" / "what is data" as data frame until "here is the problem that i have i have this score oh no so obviously i forgot to remove this line"
# Fix: remove stop("oh no"), rebuild:
devtools::load_all()  # or install package again # "because i'm in a package i need to rebuild the package now that i have removed i changed the source code"
# Restart + tar_make() -> completes, tar_visnetwork() shows lm_plot no longer broken
# why normal traceback fails: "if i do trace back here the traceback that i get is not as neat ... it's very complex and it deals with a lot of low level details that are not pointing me in the right direction"
```

