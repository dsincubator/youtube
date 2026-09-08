---
type: source
title: "Failing fast in dplyr chains"
source_file: "3rf1W9ceKhU_failing-fast-in-dplyr-chains.md"
video_id: "3rf1W9ceKhU"
url: "https://www.youtube.com/watch?v=3rf1W9ceKhU"
lang: en
tags: ["ds-incubator", "r-packages", "dplyr", "testing"]
key_topics: ["failing-fast", "assertr", "dplyr-chains", "traceback"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=3rf1W9ceKhU"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 5
    last_modified: "2020-06-30T00:00:00Z"
usage_window: { from: "2020-06-30T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# Failing fast in dplyr chains

## Summary

Presented as a farewell ds::incubator session, the talk introduces the fail-fast philosophy as applied to data-wrangling pipelines. The premise is that long-running transformations waste time and compute when an preventable input problem is only discovered at the end; validating parameters and intermediate expectations early lets the process abort near the source. While most listeners already apply this inside functions, the speaker argues it is underused inside ad-hoc analysis chains.

The contrast is made between the pre-tidyverse "save over df after each filter" style—where inserting a `stopifnot()` or guard between steps is trivial—and modern dplyr chains where inserting checks is tedious and creates unwanted intermediate objects. The newly discovered package `assertr` (caption "assert are" / "assert our" / "assert r" ← normalized `assertr`) is offered as a dplyr-native solution: pipeable assertions placed mid-chain that test before continuing and produce targeted error reports with column and row indices of failing values.

Demonstration uses the built-in `mtcars` (caption "empty cars") and fabricated `xxx` column checks, plus discussion of `traceback` for diagnosing long pipes, the tidyverse-aligned design of returning the data invisibly for pipeability, and more expressive validators like `verify` and row-wise assertions. Attendees discuss whether assertions belong only in development or also in production, the appeal of seamless in-chain checks versus `if`/`else` boilerplate, and how side-effect functions should return the first argument invisibly to remain pipeable.

## Key Concepts & Tools Taught

- **[failing-fast]:** Design principle of erroring early by checking parameters and invariants at the start of a process to avoid wasting time/resources on a doomed long run; applied to data pipelines as well as functions.
- **[assertr]:** R package by Tony Fischetti (caption "are events I made called assert are" ← normalized `assertr`) that inserts pipeable assertions directly into a dplyr chain without breaking the pipe.
- **[dplyr-chains]:** `dplyr` pipe (`%>%`) workflows (caption variants "deep ire chain" / "deep flier chain" / "deep liar chain" / "deep tire chain" ← normalized `dplyr`) where `assertr` checks can be placed mid-chain versus breaking the chain into intermediate objects with `DF` assignments.
- **[traceback]:** Diagnostic helper `traceback()` (caption "trace back" ← normalized `traceback`, also "our line last error" ← `rlang::last_error`) shown to locate which step in a long chain triggered a `assertr` failure, though `assertr` itself already reports column/row indices of failures.

## Code Snippets & Formulas

Caption-mangled, normalized here (quote-to-name):

```r
library(assertr)       # "there's this package that are events I made called assert are and what it does is it creates these like assert commands"
library(dplyr)         # "deep ire chain" / "deep flier chain" — dplyr (caption: "without leaving it but doing it in the middle and standstill then even continuing on ... into a deep tire chain")

# pre-tidyverse style vs dplyr chain (paraphrased from walkthrough)
df <- read.csv("emissions.csv")
df <- dplyr::filter(df, investor == "some")
stopifnot(!is.na(df$type))   # "make sure that all of these things are not and then I could also put this in a stop if not" ← stopifnot()

# inside a dplyr chain — breaking vs assertr
data %>% filter(investor == "x") %>% assert(...) %>% group_by(...) %>% summarise(...)
# caption: "which you can insert directly into a deep flier chain and this allows you to do some of those testings like within a deep tire chain without leaving it"

# assertr demo with mtcars (caption: "they're just using the empty cars built in data set")
mtcars %>% assert(in_set(cyl, c(4,6,8)), cyl)   # illustrative; real assertions: "all pass so it just moves through but if we ... want to make sure that has another name something for short it's gonna fail"

# error reporting
# "it tells you like exactly what failed it will tell you the column and index value where it failed and if it fails in multiple places ... which column and watch row"
traceback()            # "please show a case where the package throws an error and then you follow that with a call to trace back" — "if you run trace back you should get some output ... coming from eight"
rlang::last_error()    # "they're tied never actually use this our line last error but this is what they're telling me to do"

# design principle for pipeable side-effects
# "if your function is called mainly for its side effects it should return the the first argument invisible so if you do that what you end up with is ... a function that is pipeable ... will also try to return invisible the data"
fn <- function(data, ...) { warning("..."); invisible(data) }

# validators discussed
verify(data, nrow(data) > 0)   # "they verify is a sort of assertion of like some characteristics of the data frame"
assert_rows(data, rowMeans, within_bounds(0,1), everything())  # "they also have these like road row base assertions and these are kind of like doing a row lies inside of it"
```
