---
type: source
title: "WTF: Debugging R code"
source_file: "tLvRWRWeQK4_wtf-debugging-r-code.md"
video_id: "tLvRWRWeQK4"
url: "https://www.youtube.com/watch?v=tLvRWRWeQK4"
lang: en
tags: ["ds-incubator", "debugging", "r-packages", "github-issues"]
key_topics: ["debugging-strategies", "traceback", "browser", "binary-search", "caching"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=tLvRWRWeQK4"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2022-03-29T00:00:00Z"
    usage_count: 56
usage_window: { from: "2022-03-29T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# WTF: Debugging R code

## Summary

The final meetup of the “What They Forgot to Teach You About R” series (section `All is failed` / `All is fail`) is a live debugging walkthrough motivated by the speaker's work with the `passtax` team scraping/downloading many web pages via a long-running script that sources an entire file (`Source` / `Shift+Ctrl+Enter`) and hits an error near 90–99%. Beyond debugger mechanics (documented already), the focus is on strategies to iterate fast on slow processes.

Big-picture tactics demonstrated: make the problem self-contained and portable (avoid hard-coded paths with your username; use `here` package), reduce computation via caching (`pins`/`use_ping` helper: if dataset exists in a `cache` folder reuse it, otherwise create it — three lines) and via an `overwrite` argument (`overwrite = FALSE` avoids re-requesting HTML already saved, vs. `TRUE` which would take days), and reduce data size via tail/slice (e.g., `tail(unique, 1000)` from 44,000 rows or `slice(43000:nrow(unique))` / `mtcars[1:15]` vs. `16:32` → `20:32` binary search) to find the one corrupt row.

Debugger tools shown against the bug `cannot navigate to invalid url` caused by an empty string `""` where a URL should be: inspect `traceback()` / `Show Traceback` (colored, with file:line numbers linking to `write_dom_html` line 30), use `browser` inserted in the function (yellow highlight, `Browser>` prompt, environment is function not global; step with `n`/Next, `c`/Continue), note that `here`-package caveats about saving scripts for jump-to-definition and Alex's reminder to save often. Inside `browser`, inspect `url` (empty string), use `str(url)` ← `stir for structure` or `message(str(url))` for red output, and tag fix with `# FIXME` for later `Shift+Ctrl+F` global search. To handle loops with thousands of iterations, configure error handling via `options(error = recover)` which after an error offers a menu `1 2 3 4` to choose an environment to `browser` into (vs. manually typing `browser`). Other tools mentioned briefly: `debugonce` / `debug` (`browser`-like for one call), `message()`, `str()`, `reprex` for sharing, and locating functions via `Ctrl+.` → `write_dom_html`.

## Key Concepts & Tools Taught

- **[debugging-strategies]:** Iterate fast on long processes: self-contained/portable scripts (use `here` not personal paths), `Source` the whole file (`Shift+Ctrl+Enter`), reduce computation via cache and `overwrite = FALSE`, reduce data via tail/slice/binary search, get feedback via progress/messages before entering debugger.
- **[traceback]:** `traceback()` ← `trace back` and RStudio `Show Traceback` to see the sequence of calls before error; colored output with file:line links (e.g., `write_dom_html` line 30) reachable via `Ctrl+.` file finder; must save scripts frequently or definitions go stale.
- **[browser]:** `browser()` ← `browser is highlighted in yellow` — stops execution inside function environment (`Browser>` prompt); navigate with `n` (next line), `c` (continue), access objects like `url` directly; alternative is setting a breakpoint via RStudio margin or `options(error = recover)`.
- **[binary-search]:** General slicing strategy to narrow the bad row: start with `unique |> tail(1000)` or `slice(43000, nrow(unique))`, test if bug persists, then halve repeatedly (`1:15` vs. `16:32` → `20:32` on `mtcars` analogy) until a handful of rows remain inspectable by eye.
- **[caching]:** Cache pattern with `pins` / `use_ping` (`if pin exists read it else create`) — three-line helper code; also `overwrite` flag to skip re-downloading HTMLs already on disk, and keeping local `cache` folder under `pins` analogy; restores iteration from minutes to seconds.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```r
# running the slow script
source("script.R")  # "clicking here on source or just pressing shift ctrl and enter so that will run the whole thing" (long loop to 99%)
# big-picture: reduce computation
# use_ping / cache pattern (≈3 lines): "the idea is to create a cache so that the data set that i'm creating here if it already exists in a cache folder then to reuse it from there"
# if (pin_exists("unique")) pin_get("unique") else { data <- slow_step(); pin(data, board="cache"); data }
library(pins)  # mentioned for new interface after cache discussion
# use here for portability
library(here)  # "you could use packages such as the here package which we mentioned a few chapters ago" — avoid hard-coded "/Users/yourname/..."

# reducing data size (binary search)
unique |> tail(1000)  # "let's just get the tail of it just the last say i know a thousand rows and let's see if that thousand rows already get me the problem" — from ~44k rows
unique |> slice(43000:nrow(unique))  # "a good slice ... from the row number 43 000 to the row number ... last is and rows of unique"
# mtcars analogy
mtcars |> slice(1:15)   # "let's slice it from one to half of it so 1 to 15 and then you know we use this data set to see if the product is there"
mtcars |> slice(16:32)  # "if it is not there then we can explore rows 16 to 32"
mtcars |> slice(20:32)  # "now we can break this in half so we can go from a half of 16 to 32 so let's say here we go from 20 to 32"

# error and traceback
# error message: "cannot navigate to invalid url" — corrupt url is expect valid url vs "" 
traceback()          # "there is a function called traceback that you can you know call and it prints all this information"
# RStudio UI: Show Traceback (colored, with file:line → write_dom_html line 30)
# go to file:
# Ctrl+. → "write dom html" → line 30  # "you can press ctrl and the period the point symbol to pop up this go to file thing"

# browser inside function
browser()  # "browser is a function that will stop the execution of that function when it's called" — inserted as line in write_dom_html, highlighted yellow, prompt Browser>
# inside Browser>
url        # inspect → "" (empty string) — "what i get is an empty string ... data is corrupt and has an empty string where it should have an actual url"
str(url)   # "use the function stir for structure to print while the function execute executes information" ← str
message(url) # "run use the function message because the message function will print in red"
# tag for later
# FIXME: if (url == "") stop("bad url")  # "fix me to leave a note ... many teams do use this flag fix me when url is empty string ... search for fix me with shift ctrl f globally"

# error handling for loops
options(error = recover)  # "there is an option in r called options error and here you can you can do whatever you want ... in this case we can we can pass recover and so that kind of sets the handling of errors in such a way that when the error occurs ... you will be dropped in a debugger environment"
# after error, menu: "1 2 3 4 ... of where i want a browser to be inserted" — choose e.g., 6 to enter write_dom_html env
# also mentioned:
debugonce(write_dom_html) # "the back ones is something similar to ... introducing a browser statement ... without actually having to type it and the ones part comes from you know it's only one time"
reprex::reprex()           # "if we want to share with someone else use the replex package ... whole meetup dedicated to that"
```
