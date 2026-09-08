---
type: source
title: "Hazards of side effects and ways to leave the world as you found it"
source_file: "C0VuGkBZeKw_hazards-of-side-effects-and-ways-to-leave-the-world-as-you-found-it.md"
video_id: "C0VuGkBZeKw"
url: "https://www.youtube.com/watch?v=C0VuGkBZeKw"
lang: en
tags: ["ds-incubator", "testing", "r-packages"]
key_topics: ["side-effects", "on-exit", "withr-defer", "test-fixtures", "options"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=C0VuGkBZeKw"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 19
    last_modified: "2021-05-11T00:00:00Z"
usage_window: { from: "2021-05-11T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# Hazards of side effects and ways to leave the world as you found it

## Summary

Final session in the testing series, framed by two references on "test fixtures" — a `testthat` vignette and a tidyverse blog post by Jenny Bryan. The hazard is that code that changes global state (environment variables, `setwd()`, `options()`) leaves the next test starting from the wrong baseline, producing false positives not because code is wrong but because the assumed starting state is wrong (PACTA codebase given as the hard-case example).

A live demo contrasts a sloppy versus neat function around `options(digits)`. `sloppy()` does `options(digits = d)` without cleanup: `pi` initially prints 7 significant digits (`"one two three four five six seven significant digits"`), after `sloppy(2)` prints 2, but a later `pi` still prints 2 until the session is restarted. `neat()` stores the old state via `op <- options(digits = d)` (note: `options()` returns old options invisibly, a weird but intentional API) and restores with `on.exit(options(op))`, so after `neat(2)` a subsequent `pi` again prints 7.

Two caveats of `on.exit()` are covered: (1) defaults for `add` and `after` are usually not what you want — `add = FALSE` should be `TRUE` and `after = TRUE` should be `FALSE` — and (2) `on.exit()` cannot be wrapped in a helper because it has no way to target the caller's environment. Defining `local_digits()` with `on.exit()` inside `neat()` fails: `neat()` then prints 7 digits instead of the requested 1.

The fix is `withr::defer()` ("with r package ... function called the third the fair" → `withr::defer`; caption "the fair" = `defer`). It has the safer `add`/`after` defaults and an explicit `envir` argument defaulting to `parent.frame()`, allowing wrapping. Redefining `local_digits()` with `defer(options(op), envir = parent.frame())` makes `neat()` work. The `withr` package already ships wrappers like `withr::local_options()` ("local options") that replace the two-line pattern. The principle extends to `testthat` fixtures/local helpers: using `local_*` functions inside tests ensures each test leaves the world exactly as it found it, demonstrated with `testthat` expectations around `log()`.

## Key Concepts & Tools Taught

- **[Side effects / global state (side-effects)]:** Changes to `options()`, environment variables, or working directory that persist past the call ("code changes the state of the ecosystem around the code ... set up an environmental variable right or change ... the working directory"); hazards for testing.
- **[on.exit (on-exit)]:** Base R cleanup function that runs on function exit; pattern `op <- options(digits = x); on.exit(options(op), add = TRUE, after = FALSE)` restores state only for the calling function.
- **[withr::defer (withr-defer)]:** Replacement from `withr` with safer defaults and explicit `envir = parent.frame()` so cleanup can be wrapped in helpers; discussed as "the function deferred from the with our package" and requiring `envir`.
- **[withr local helpers (options)]:** Ready-made wrappers like `withr::local_options(digits = 3)` that set and automatically restore, replacing manual `options` + `on.exit`/`defer`.
- **[Test fixtures (test-fixtures)]:** `testthat` local fixtures (`local_*`) that leave the world as found after each test, preventing false failures from order dependence.

## Code Snippets & Formulas

Caption-mangled → normalized, with verbatim mangled quotes:

```r
# sloppy vs neat on options(digits)
pi  # default 7 significant digits: "one two three four five six seven significant digits"
sloppy <- function(d) {
  options(digits = d)  # "my slope is function what it does is takes the you know calls the function options and changes the option digits"
}
sloppy(2)
pi  # now 2 digits, persists: "i still get two significant digits when i was expecting seven"

neat <- function(d) {
  op <- options(digits = d)  # "we set the options ... but now we're gonna store that ... we already assigned that to an object because options has ... it sets ... but at the same time it returns the older options"
  on.exit(options(op), add = TRUE, after = FALSE)  # "these two arguments are generally most useful if they are not set as their default so the default of add is false and usually we want it true and after is usually true and usually we want it false"
  pi
}
neat(2); pi  # restored to 7: "we do have seven significant digits meaning that need effectively change the options just for the duration of itself"

# why on.exit cannot be wrapped
local_digits <- function(d) {
  op <- options(digits = d)
  on.exit(options(op), add = TRUE, after = FALSE)  # inside helper env, not caller
}
neat2 <- function(d) { local_digits(1); pi }  # expects 1 digit, gets 7: "it's giving me again the seven digits that are set by default ... on xc does not have a way to go up to the environment where neither calls it"
neat2()

# withr::defer with explicit parent.frame
library(withr)  # "package is called with r and the function that replaces on exit is the function called the third the fair" → withr::defer
local_digits <- function(d) {
  op <- options(digits = d)
  defer(options(op), envir = parent.frame())  # "it also has a second argument that is the environment where you define where that function will do the cleanup in which environment so usually what you want is the parent frame"
}
neat2(); pi  # now 1 digit then restored

# ready-made wrapper
neatest <- function(d) {
  withr::local_options(digits = d)  # "with our already includes a wrapper that says ... instead of writing those two lines of code are kind of confusing you just call the function local options"
  pi
}
neatest(3); pi  # 3 digits then restored to 7

# inside testthat
library(testthat)  # "i'm going to attach the test.package because i need it if there was a test"
test_that("local digits works", {
  withr::local_options(digits = 3)
  expect_equal(signif(pi, 3), 3.14)
  # after test, digits restored — "these functions allow you to leave the world exactly as you found it before each test"
})
```
