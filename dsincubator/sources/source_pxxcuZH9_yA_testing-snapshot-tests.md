---
type: source
title: "Testing: Snapshot tests"
source_file: "pxxcuZH9_yA_testing-snapshot-tests.md"
video_id: "pxxcuZH9_yA"
url: "https://www.youtube.com/watch?v=pxxcuZH9_yA"
lang: en
tags: ["ds-incubator", "snapshot-testing", "testing", "r-packages", "github"]
key_topics: ["snapshot-testing", "expect-snapshot", "png-vs-svg", "testthat", "vdiffr", "ggplot2-snapshot"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=pxxcuZH9_yA"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 175
    last_modified: "2021-04-27T00:00:00Z"
usage_window: { from: "2021-04-27T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Testing: Snapshot tests

## Summary

In the testing series, the speaker introduces snapshot testing conceptually (saving expected output in a separate file rather than inline code) and motivates three situations where it is preferable: outputs with awkward escaped strings (e.g., needing to escape end-of-line characters), very large objects (e.g., a `ggplot2` object whose internal list structure is too verbose to write inline), and binary formats such as plot images (PNG). Monika and CJ extend the discussion to image testing. The core demo builds a tiny wrapper `si()` for session information that outputs a `<details>` HTML dropdown hiding session info, making an R Markdown document readable (one line "blah blah blah" plus collapsible details). Testing `si()` with traditional `testthat::expect_equal()` is awkward because the output concatenates multi-line text and printed messages that cannot be easily stored in a vector; instead `testthat::expect_snapshot(si())` is used (and `expect_snapshot(..., error = TRUE)` for expected errors when calling the no-argument function with an argument). First run prompts to accept the snapshot and writes a file under `tests/testthat/_snaps/` (seen as `simd`/`html` file); the snapshot is an `.md` file viewable directly on GitHub, capturing console output, messages, warnings and errors, so a pull request can be reviewed without running code. When the implementation changes (e.g., removing the reminder message), the next test fails with a diff showing the previously present message no longer there; accepting the intentional change is done via `testthat::snapshot_accept("...")`, after which tests pass. Monika reports that PNG-based snapshots via `expect_snapshot_file()` (saving a new PNG and binary-comparing to the stored one) proved brittle: Mauro's Linux-generated PNG differed on her macOS even with one-pixel anti-aliasing/font differences invisible to the eye, causing spurious CI failures and constant errors while actively developing the `r2dii.plot` package. CJ proposes a more robust alternative: testing the SVG vector description instead of the rasterized PNG. Any `ggplot2` or base plot converted to SVG via text-based markup (rectangles, text tags) is less sensitive to OS/font/anti-aliasing and diffs as lines of text, making failures show precisely which attribute (e.g., color `grey` vs `black`) changed, allowing such tests to run in continuous integration and be practical for collaborators. The complementary `vdiffr` package (caption "v differ ... manages this svg style testing and it's integrated with test that") is recommended as the ergonomic wrapper around this SVG workflow, while low-level SVG export could be done manually. Discussion also covers that `expect_snapshot()` captures standard output, messages, warnings and errors (errors require explicit `error = TRUE`), and hints at `expect_snapshot_file()` and `expect_snapshot_value()` serialization options (JSON readable but lossy vs binary `.rds` exact) and the caveat of unstable `plot_env` inside `ggplot2` objects (requiring `plot$plot_env <- NULL` before snapshotting).

## Key Concepts & Tools Taught

- **[snapshot-testing]:** Storing expected output in a separate file rather than inline code, useful for awkward strings, huge objects and binary images (caption "snapshot test is the idea of saving the output ... not encode on the test file but instead on a separate file ... it's not ... in front of your eyeballs").
- **[expect-snapshot]:** `testthat::expect_snapshot()` interface capturing console output, messages, warnings and errors (with `error = TRUE`) in `tests/testthat/_snaps/*.md` (caption "one of the main functions that we use from the test that package ... expect snapshot and it takes the function that you want to test ... first time ... save a file ... under the folder tests test that right and snaps ... as precisely marked as a message ... also captures errors ... saying error equals true").
- **[png-vs-svg]:** Raster PNG binary comparison is machine-sensitive (OS, font version, anti-aliasing) versus SVG text vector description that diffs as GitHub-style line diffs (caption "safe to png is very sensitive to the machine ... using a linux and i have a mac ... somehow the png was rendered slightly differently ... one pixel is different ... anti-aliasing ... converting it into an svg it has a more stable output because it's not affected by the fonts ... svg is a description of a vector graphic in text ... precisely the lines that change").
- **[testthat]:** Testing framework orchestrating snapshot accept workflow (`Ctrl+Shift+T` to run tests, `snapshot_accept()` to update intentional changes; caption "run them with ctrl shift t ... confirm to save ... test passed ... run this code ... snapshot accept with the name of the file that contains that snapshot").
- **[vdiffr]:** Package wrapping SVG-based visual testing integrated with `testthat` (caption "package called v differ ... vdiffr ... manages this svg style testing and it's integrated with test that ... a lot easier you could hypothetically do this yourself like instead of exporting a png exported svg but if you different package makes it a lot easier").
- **[ggplot2-snapshot]:** Snapshotting the underlying list structure of a ggplot object via `str()` while nullifying the volatile `plot_env` (caption "you can capture you know if you do str and a ggplot2 object you get the list ... one of the elements ... is plot underscore env which is run specific ... to make a snapshot test that was useful ... had to ... kill it ... assign ... null").

## Code Snippets & Formulas

```r
# Motivating wrapper for session info as collapsible HTML (caption "small rmd file ... blah blah blah and then the session information ... use this tag to wrap around ... details")
si <- function() {
  cat("<details>\n<summary>Session info</summary>\n")
  cat(paste(capture.output(sessionInfo()), collapse = "\n"))
  cat("\n</details>\n")
  message("Remember to copy manually from the console")  # caption "little message as a reminder ... not automatically copied"
}

# Traditional expectation is awkward
si()  # prints multi-line <details> + message;很难 to put into expect_equal

# Snapshot test in tests/testthat/test-si.R (caption "expect snapshot and it takes the function ... s i")
library(testthat)
test_that("si snapshot", {
  expect_snapshot(si())                # captions output, message
  expect_snapshot(si(1), error = TRUE) # caption "does not take an argument ... if i did pass an argument this should fail ... saying error equals true"
})

# Run tests (caption "run them with ctrl shift t ... pop-up menu ... test passed")
# First run saves tests/testthat/_snaps/si.md (or simd/html) viewable on GitHub
# Inspect snapshot file:
# tests/testthat/_snaps/si.md contains <details> block + "Message <...>" marking

# Intentional change workflow (caption "if i remove the message ... snapshot test will tell me ... error ... you can see before ... now the message is no longer there")
# 1. modify si() (remove message)
# 2. tests fail with diff
# 3. accept:
snapshot_accept("si")  # caption "run the function snapshot accept with the name of the file that contains that snapshot"
# re-run tests -> pass

# PNG snapshot (brittle) discussion
# expect_snapshot_file("path/to/current.png", "plot.png") # caption Monika: "expect snapshot file ... save a png file and then ... compared ... snapshot format you actually save a png file"
# Issue: same PNG renders differently on Linux vs macOS due to font/anti-aliasing -> spurious diff (caption "differences which were just related to ... linux and ... mac ... one pixel is different")

# Robust SVG alternative proposed by CJ (caption "testing the fsvg output ... svg ... more stable ... not affected by fonts")
# Manual:
# svglite::svglite("plot.svg"); print(ggplot_object); dev.off()
# Compare SVG text diff

# vdiffr wrapper (caption "v differ ... managers this svg style testing")
# install.packages("vdiffr")
# vdiffr::expect_doppelganger("my-plot", ggplot_object)

# Nullify volatile environment in ggplot object before snapshotting (caption "plot underscore env ... run specific ... had to nullify ... i got rid of ... assign ... null")
p <- ggplot(mtcars, aes(wt, mpg)) + geom_point()
p$plot_env <- NULL
expect_snapshot_value(p, style = "json")  # readable vs binary serialization trade-off (caption "serialization ... json file to an rda file ... readability ... reproducibility")
# or
expect_snapshot_value(p, style = "serialize") # binary
```
