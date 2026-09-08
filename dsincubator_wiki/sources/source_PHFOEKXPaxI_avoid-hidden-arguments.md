---
type: source
title: "Avoid hidden arguments"
source_file: "PHFOEKXPaxI_avoid-hidden-arguments.md"
video_id: "PHFOEKXPaxI"
url: "https://www.youtube.com/watch?v=PHFOEKXPaxI"
lang: en
tags: ["ds-incubator", "code-quality"]
key_topics: ["hidden-arguments", "explicit-arguments", "required-data-argument", "informing-user", "global-options-stringsAsFactors", "lazy-evaluation"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=PHFOEKXPaxI"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 29
    last_modified: "2019-12-03T00:00:00Z"
usage_window: { from: "2019-12-03T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# Avoid hidden arguments

## Summary

The session teaches the tidyverse design-guide principle to avoid hidden arguments because they make functions hard to reason about — to predict the output you must also know hidden global state. It opens with a minimal example `y <- 1` and `add(x) { x + y }`: calling `add(1)` returns 2, but if `y` later changes to 10 the same call returns 11, a surprising result that is ill-advised. General advice: all inputs should be explicitly shown in the function signature; the result should depend only on input values. Two remediation steps are shown: (1) make hidden inputs explicit options, (2) inform the user of decisions made. This is demonstrated by refactoring `prepare_data()` which originally read `mtcars` from a hidden global `path`: first `data` is moved into the definition (`prepare_data(data)`), then a guard `if (missing(data)) message("using data with names", names(data))` is added to announce the default, and finally the recommended form requires `data` with no default (`prepare_data <- function(data)`) which yields the free error "argument data is missing with no default". The talk also covers when external state is acceptable: global options like `stringsAsFactors` for `data.frame` are poor because the same call returns a factor vs. a character after `options(stringsAsFactors = FALSE)` — such options should affect display (e.g., rows printed) not computation — whereas `read_csv(path)` depending on file contents is expected and not surprising. A Q&A notes confusion around `missing(data)` interacting with a default that still references the global `path`, and a comment on lazy evaluation: in R the missing-argument error is not thrown until the object is accessed, so expensive work before that access would still run.

## Key Concepts & Tools Taught

- **hidden-arguments**: A function that silently uses a global variable (e.g., `y` in `add`) produces different results for the same input when global state changes, making it hard to reason about and to test.
- **explicit-arguments**: Remediation step one: move hidden inputs into the signature so they become explicit options (e.g., `prepare_data(data)` instead of reading global `path`).
- **informing-user**: Step two: if an argument is missing and a default is used, inform the user explicitly of the decision, e.g., print a message `using data with names <names>`.
- **required-data-argument**: For core data arguments (usually called `data` or `x`/`y`), require them with no default so the caller must be intentional; R then gives the free error when `data` is not supplied and the function body stays simple without `if (missing(...))` checks.
- **global-options-stringsAsFactors**: `data.frame` with global option `stringsAsFactors` is a poor design: same call `data.frame(x = "a")` returns a factor with `stringsAsFactors = TRUE` and a character with `FALSE`; global options should generally only affect display (rows printed) not computation, for historical reasons but now discouraged (hence needing `stringsAsFactors = FALSE` in `data.frame`/`read.csv`).
- **expected-external-dependency**: `read_csv(path)` depending on file contents is an external dependency but not surprising — you expect to get what the file contains, so it is acceptable.
- **lazy-evaluation**: R's lazy evaluation means an error for a missing required argument is thrown only when the object is first accessed; expensive calculations before that access would still run, motivating explicit checks rather than relying on the free error alone.


## Code Snippets & Formulas

Caption-mangled spoken forms kept alongside normalized R:

```r
# Hidden argument demo (caption "the variable Y changes from 1 to 10")
y <- 1
add <- function(x) x + y  # "right in a little function that is called ad and what it does it takes the input X and then that's why" # ad <- add
add(1)  # -> 2  # "if we pass the argument the value want to add then what we get is 2 because now X has the value 1 but then it adds Y and Y is also 1"
y <- 10
add(1)  # -> 11  # surprising two results for same input

# Refactoring prepare_data (caption "prepare data", "free dot CSV" <- read.csv/read_csv)
# Original hidden-argument form:
path <- tempfile()  # "storing basically what I have here is just a path to a file and into that path thing I'm just writing a toy data set the empty cars" # empty cars <- mtcars
prepare_data <- function() {
  data <- read.csv(path)  # "free dot CSV pass" <- read.csv(path)
  data[1:2, 1:2]
}
prepare_data()  # reads hidden path

# Step 1 explicit:
prepare_data <- function(data) {  # "data moves book to the definition of the function"
  data[1:2, 1:2]
}

# Step 2 informing user:
prepare_data <- function(data = read.csv(path)) {  # "because data has a default read CSV pass" # read CSV pass <- read.csv(path)
  if (missing(data)) message("using data with names ", paste(names(data), collapse = ", "))  # "if the argument data is missing ... we can print a message like using data with names and just you know give the names of the dots"
  data[1:2, 1:2]
}

# Recommended required argument (no default) — simpler:
prepare_data <- function(data) {  # "data does not have a default meaning that it is a required argument ... it's also super simple it doesn't have an a default here and we don't need to check for missing data"
  data[1:2, 1:2]
}
try(prepare_data())  # "I'm using the function try ... so that I can show the error" -> "Error in prepare_data : argument \"data\" is missing, with no default"

# Global option example
data.frame(x = "a")  # depends on global option stringsAsFactors
# "the global option strings as factors so with the global option that comes by default with that develops a is true ... return a factor but now if we change there all options to be strings as factors equals false ... what we get is a string" # strings as factors <- stringsAsFactors
options(stringsAsFactors = FALSE)

# Expected external state (not surprising)
read.csv(path)  # "the function Vreede underscore csv call with a particular path ... of course it depends also on the contents of the file ... but that's fine" # Vreede underscore csv <- read_csv / read.csv
```

