---
type: source
title: "Testing: Using snapshot tests to refactor safely"
source_file: "UeECMfOFIHk_testing-using-snapshot-tests-to-refactor-safely.md"
video_id: "UeECMfOFIHk"
url: "https://www.youtube.com/watch?v=UeECMfOFIHk"
lang: en
tags: ["ds-incubator", "snapshot-testing", "refactoring", "r-packages", "testing"]
key_topics: ["snapshot-testing", "expect-snapshot", "refactoring", "test-coverage", "ggplot2", "brittleness", "skip-on-os"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=UeECMfOFIHk"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 24
    last_modified: "2021-05-04T00:00:00Z"
usage_window: { from: "2021-05-04T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# Testing: Using snapshot tests to refactor safely

## Summary

A follow-up to the snapshot-testing introduction, this session shows how `expect_snapshot()` can quickly add coarse coverage to an untested feature so it can be refactored without changing user-visible behaviour. The running example is `scatter_plot_penguins`, a feature that plots bill depth vs bill length for three penguin species from the `palmerpenguins` data set, designed as a replacement for `iris`.

The speaker demonstrates that the feature currently has 0% file coverage (red in the covr report via `Shift+Ctrl+P`), so removing code still leaves all tests passing — a sign it is unsafe to refactor. Planned improvements include styling to the 80-character mark and making axis/title labels user-configurable via a new helper rather than hard-coding. The workflow: create a test file with `usethis::use_test()`, reuse the package's documented examples to build `p <- scatter_plot_penguins(...)`, inspect the `ggplot` object's `str()` / viewer output, delete the volatile `plot$plot_env` environment element (shown changing from `...258` etc. on each run), then `expect_snapshot(str(p))` and `Shift+Ctrl+T` to generate the initial snapshot (first run emits a warning that a new snapshot was created). A second coverage run turns the file fully green, and deleting label code now fails the snapshot with a diff on `labels`.

Refactoring proceeds in two stages: style-only changes (verified by rerunning tests) and a behavioural split extracting `penguins_labs()` that accepts `title`, `x`, `y` and `...` and uses `rlang` helpers (`%||%` fallback) to merge user input with opinionated defaults. The intentional label change triggers a snapshot failure, resolved by `snapshot_accept()` (captioned `accept snap` / `snapshot accept`). A viewer check confirms `p` vs `p + penguins_labs()` behaviour. Trade-offs are discussed with Monika: snapshots are fast but brittle — a snapshot passing on Ubuntu fails on macOS/Windows due to subtle `ggplot` object differences, so the team agrees to `skip_on_os()` / limit CI to Ubuntu and to skip on CRAN (the `testthat` default for snapshots). The session also notes `expect_snapshot(error = TRUE)` captures formatted error/message/warning output as users see it on the console.

## Key Concepts & Tools Taught

- **[snapshot-testing]:** Technique that saves a serialized `str()`/output rendering to an `.md`/`.snap` file and compares future runs to detect any intentional or accidental change in behaviour.
- **[expect-snapshot]:** `expect_snapshot` ← `snapshot tests do expect snapshot allows me to in this case pass the structure of p` / `expect snapshot captures everything including output and also conditions` — captures structure/output (and with `error = TRUE`, errors/warnings) as a snapshot.
- **[refactoring]:** Restructuring code (style, extraction of `penguins_labs()`) without changing observable behaviour, guarded by the snapshot safety net.
- **[test-coverage]:** `covr` report via RStudio Addins `Shift+Ctrl+P` / `Shift+Ctrl+R` ("report test coverage for a file or a package") — red vs green lines indicate uncovered vs covered feature code.
- **[ggplot2]:** Visualization via `ggplot2` where `print(p)` renders to the viewer but `str(p)` reveals layers/scales/labels; the `plot_env` slot is deliberately stripped (`p$plot_env <- NULL`) to stabilize snapshots.
- **[brittleness]:** Snapshots pass locally on Ubuntu but fail on macOS/Windows and on continuous integration due to environment-dependent object differences; mitigated by limiting the environments in which they run.
- **[skip-on-os]:** `skip_on_os` ← `skip on os not keep on is keep on os` / `skip on os` — `testthat` helper to skip snapshot tests on specific operating systems (and by default on CRAN, where snapshots are not run).

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```r
# setup
usethis::use_test("scatter_plot_penguins")  # "function use test in the use this package ... it will use the same name to create a test file"
palmerpenguins::penguins                    # "beautiful data set called penguins in the package palmer penguins"

# inspect feature (mgcv/penguins labs example)
p <- scatter_plot_penguins(penguins)
str(p)               # "you can ask for example the structure of p ... list that underlies the g block object"
p$plot_env <- NULL   # "you just you know apply new to p dollar sign and the element ... plot m ... so my snapshot ... removing the element and plot m" — normalizes to plot_env / plot m (environment slot)
# stability note: plot_env changes every run ("two three five eight" -> refreshed env name is random)

# snapshot test
test_that("scatter plot penguins hasn't changed", {
  expect_snapshot(str(p))   # "snapshot tests do expect snapshot allows me to ... pass the structure of p ... and save that in a file"
})

# run via
# Shift+Ctrl+T  # "running the test shift ctrl t ... I'm creating a new snapshot ... it prints the output ... second run warning won't be produced"
# Shift+Ctrl+P  # "press shift ctrl p because i want to produce coverage ... coverage report for file or package ... all in green before it was in red"

# after intentional change
snapshot_accept("scatter_plot_penguins")  # "run snapshot accept ... basically copy paste this code to the console ... refresh the snapshot"
# alternative helper named in captions: "accept snap or stop shot accept with the name of the feature"

# refactored helper (enables user-supplied labels)
penguins_labs <- function(title = NULL, x = NULL, y = NULL, ...) {
  labs(title = title %||% "my title", x = x %||% "bill length in millimeters", y = y %||% "bill depth", ...)
}
# implementation captions: "create another function that is let's call it penguins labs ... allow the user to pass dot dot dot ... package arlang we use package parlang lang ... import from arlang ... rlang::`%||%`"

# brittleness mitigation
testthat::skip_on_os(c("mac", "windows"))  # "skip on os not keep on es keep on os ... skip on os"
testthat::skip_on_cran()                   # "by default they do not run on cran ... it's acknowledged that snapshot tests are kind of brittle"
```
