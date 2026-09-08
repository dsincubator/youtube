---
type: source
title: "reprex: Do's and don'ts"
source_file: "BOcl8iuiDvU_reprex-do-s-and-don-ts.md"
video_id: "BOcl8iuiDvU"
url: "https://www.youtube.com/watch?v=BOcl8iuiDvU"
lang: en
tags: ["ds-incubator", "reproducibility", "github", "reprex", "r-packages"]
key_topics: ["reprex", "smallest-built-in-data", "session-info", "reproducibility", "side-effects"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=BOcl8iuiDvU"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 20
    last_modified: "2021-10-12T00:00:00Z"
usage_window: { from: "2021-10-12T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# reprex: Do's and don'ts

## Summary

Follow-up in the `reprex` series (from the article "reprex do's and don'ts" on the package website) covering what makes a reproducible example (`reprex` ← "replicas" / "replex" / "red bricks" / "rubrics" in captions) excellent and help conversations about code. The session warns against data that is large, external, or project-dependent and shows progressive improvements: replacing a `here::here()` file read with smaller, built-in data (`mtcars` ← "md cards" / "memphic cars" / "empty car data"), then sampling to a minimal subset with `set.seed()` + `sample()` for random-yet-reproducible rows, then creating data on the fly with `read.csv(text = ...)` (including multiline literal with real line breaks) and with `tibble::tribble()` via the `datapasta` package ("data pasta" ← `datapasta`) or `dput()` ("d put"), preferring `tribble` for readability.

A second principle is "include commands on a strict need-to-run basis": remove creator-only scaffolding and add required dependencies (`library(tibble)`). Session information should be included via `sessionInfo()` (`utils` ← "i think is the utils package") or `devtools::session_info()` and via `reprex(..., session_info = TRUE)` which renders it in a collapsed dropdown, without clutter. The presenter shows `reprex(..., style = TRUE)` (powered by `styler` → "powered i think by the styler package") to be generous with whitespace, and polls on not taking liberties: assume a fresh R session (`Session → Restart R` / `Shift+Ctrl+F10` / `Shift+Cmd+0`), do not `rm(list = ls())`, do not `setwd()` to a private path (share the whole project on GitHub if a path is essential), do not overwrite base functions (`c` ← example `commas` vs `c`), do restore `options()` (e.g. `digits` ← "option called digits") by saving old options in `op` and `options(op)`, and do use `tempfile()`/`tempdir()` and clean up files you created.

Discussion reinforces not installing packages inside the reprex, avoiding file-system touches unless the bug is about I/O (use `read.csv(text = ...)` or `read.table()` with whitespace-delimited inline text), and minimizing dataset size (cut 100-line pastes to the few rows/columns that demonstrate the issue).

## Key Concepts & Tools Taught

- **[reprex (reprex)]:** R package for reproducible examples; `reprex::reprex({ ... })` renders code plus output for pasting; discussed from the vignette "reprex do's and don'ts".
- **[Smallest, simplest, most built-in data (smallest-built-in-data)]:** Reduce to the minimal subset that reproduces the problem; prefer `mtcars` ("md cards" / "empty car data") or inline synthetic data over external files; sample with `set.seed()` + `sample()` for reproducible random rows.
- **[Creating data on the fly]:** `read.csv(text = "mpg,cyl\n18.7,8\n...")` (second arg `text` — distinct from `readr::read_csv()`), `tibble::tribble()` generated via `datapasta::df_paste()` ("data pasta" → `datapasta`), and `dput()` (`"d put"`).
- **[Session info (session-info)]:** `sessionInfo()` from `utils` vs `devtools::session_info()`; `reprex(..., session_info = TRUE)` adds collapsed session info; shows OS (Ubuntu) and package versions.
- **[Reproducibility (reproducibility)]:** From Stack Overflow guidance referenced at end: include code that others can run without extra steps; minimize data while keeping conceptual coverage.
- **[Side effects / leave the world as you found it (side-effects)]:** Do not `rm(list = ls())` ("remove list ls" → `rm(list = ls())`), do not `setwd("/private/path")`, do not redefine `c`, do restore `options()` (save `op <- options(digits = 2)` then `options(op)`), do delete files you create or use `tempfile()`.

## Code Snippets & Formulas

Caption-mangled quotes shown → normalized forms; no invented function names beyond transcript:

```r
# data — smallest / built-in / reproducible
here::here("path/to/data.csv")  # "i'm using the this clever function here here that is aware of what a project means" — anti-pattern
mtcars                          # "mt cars data set" / "md cars" / "empty car"
head(mtcars, 2)[, c("mpg", "cyl")]
set.seed(123); object_rows <- sample(nrow(mtcars), 2)  # "in combination the function sample with the function set c so set c what it does is sets the random generator" → set.seed + sample
mtcars[object_rows, c("mpg", "cyl")]

read.csv(text = "mpg,cyl\n18.7,8\n21.0,6")  # "with the read.csv function you can create a dataset inside the function if you use the argument text" / "the first line here highlighted is uh defining what are the column names mpg comma seal" (seal → cyl)
# variant with real line breaks instead of \\n, and read.table(text=...) with whitespace/tab delimiting (CJ suggestion)

library(tibble)                              # "library table because of course packages are part of what you need to include"
tibble::tribble(                             # "function tribble of the table package" → tibble::tribble; "tribal" in captions
  ~mpg, ~cyl,
  18.7, 8,
  21,   6
)
# generated via datapasta: "package called data pasta" → datapasta::df_paste() / tribble_paste; dput:
dput(my_data)                                # "the function d put is similar ... d put the put off the put my data"

# reprex + session info + styling
reprex::reprex({                             # "you can pass multiple lines of code inside curly braces and then you know extend your replicas with arguments the argumentation info"
  library(tibble)
  tribble(~mpg, ~cyl, 18.7, 8)
}, session_info = TRUE)                      # "session info uh if you call if you set it to true we add decision information there" / collapsed dropdown
reprex::reprex({ x<-1 }, style = TRUE)      # "being generous with white space ... style equals true argument of repress it's power i think by the styler package"

# options restore pattern
op <- options(digits = 2)                   # "i'm changing options uh the option called digits so that when i print a big number it only shows me and a total of two digits"
pi  # prints 3.1
options(op)                                 # "first storing the previous options in an object and then passing it back to options"

# good vs bad liberties
# bad: rm(list = ls()); setwd("~/only-i-have"); commas <- function(...) paste(..., collapse=",") but naming it c
c <- function(...) paste(..., collapse = ",") # anti-pattern: "don't define a function with the name of a built-in function ... i called it commas ... be tempted to call this function just c but i would not do it"
tempfile()                                  # "r has a temp file antenna" → tempfile() — use for temporary files instead of leaving remove.txt
```
