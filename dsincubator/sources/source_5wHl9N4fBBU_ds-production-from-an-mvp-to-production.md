---
type: source
title: "ds.production: From an MVP to production"
source_file: "5wHl9N4fBBU_ds-production-from-an-mvp-to-production.md"
video_id: "5wHl9N4fBBU"
url: "https://www.youtube.com/watch?v=5wHl9N4fBBU"
lang: en
tags: ["ds-incubator", "git", "refactoring", "r-packages", "snapshot-testing"]
key_topics: ["refactoring", "snapshot-testing", "r-packages", "mvp-to-production", "here-package"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=5wHl9N4fBBU"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 87
    last_modified: "2023-06-17T00:00:00Z"
usage_window: { from: "2023-06-17T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# ds.production: From an MVP to production

## Summary

This capstone talk reframes "productionizing" as the disciplined transformation of a minimum viable product that works for a few people on their laptops into software that works for everyone everywhere. Using the skyscraper analogy to convey hidden engineering complexity, the presenter grounds the method in Martin Fowler's definition of refactoring—small behavior-preserving restructuring steps that compound into significant architecture improvement while keeping the system continuously functional—and extends it to everything needed before refactoring can start safely.

The demonstration (four sequential steps, with two-and-a-half hours of linked live coding) begins with reproducing an MVP analysis: an R Markdown/Quarto document (caption "rmd" / "quarto" ← `R Markdown`) that loads packages, reads `input/swim.csv` (swimmers, locations, water temperature), localizes English via a lookup joining "Beach"/"Coast" as US and "Seashore"/"Seaside" as UK, and converts Fahrenheit to Celsius with `F_to_C(x) = (x-32)*5/9`. The known defect—`(x-32)*5/9` mis-implemented as `509` (caption "509 is applied" / "91 ... 95 ... 32.8" temperature examples)—is intentionally left unfixed until a safety net exists. Infrastructure work then isolates code from private/large data and ports the analysis into a proper R package via `usethis::create_package()` and `devtools::check()` / MIT licensing, using a temporary custom `here()` shim (caption "here function" / "Library here" ← `here::here`) to redirect paths from the working directory to `~/Downloads/MVP/input/input_name`.

Step two captures snapshot tests for the intermediate `localized` and final `clean` objects: a bespoke `element_render(path, envir=e)` helper executes the document into a fresh environment `e` and snapshots `e$localized` and `e$clean` via `testthat` snapshot testing (stored under `tests/testthat/_snaps/capture-outputs.nsi.md`, created with `usethis::use_test("capture-output")` and run via `devtools::test()`). Step three then performs behavior-preserving refactorings—renaming the `here` shim to `mvp_path`, extracting localization and censification into `R/` functions, and adding documentation—each validated by snapshots. Only in step four, once modularity and tests are in place, does the workflow turn to behavior-changing improvements: discussing the `509` bug, un-skipping the `expect_equal(32.8)`-style check, fixing the formula, removing duplication, and, when new behavior is well-specified, using TDD.

## Key Concepts & Tools Taught

- **[refactoring]:** Behavior-preserving restructuring per Fowler—many small steps that alter internal structure without changing external output, kept safe by continuous testing and a continuously working system; contrasted with behavior-changing fixes and feature additions that follow only after the safety net exists.
- **[snapshot-testing]:** Capturing golden outputs of `localized` and `clean` (`expect_snapshot` workflow via `testthat`) to lock current behavior during refactoring; snapshots stored as `.nsi.md` under `_snaps`, with private-data handling by isolating private snapshots in a git-ignored subfolder.
- **[r-packages]:** Standardized package infrastructure created with `usethis::create_package()` (caption "create package creates an empty package"), licensed with `usethis::use_mit_license()`, extended with files via `usethis::use_r()` (caption "use R from they use this package"), tested via `usethis::use_test()` (caption "use test from the useless package so if you give it a name say capture output") and validated with `devtools::check()` / `devtools::test()` (caption "devtools check ... devtools test" ← `devtools`).
- **[mvp-to-production]:** Four-step pipeline: (1) reproduce the MVP from a zip/`~/Downloads/MVP` archive, (2) snapshot intermediate/final outputs, (3) refactor into small documented modules in `R/`, (4) improve behavior (fix bugs, deduplicate, add features via TDD), with links to live demos for implementers and high-level narrative for managers.
- **[here-package]:** `here::here()` for building paths relative to the project root (caption "here function that creates paths that are nested in the folder where the function is being called The Working directory" / "Library here which is the package here" ← `here`), temporarily shimmed as `here <- function(...) file.path("~/Downloads/MVP", ...)` / renamed to `mvp_path` to decouple code from data location with minimal churn.

## Code Snippets & Formulas

Caption-mangled, normalized here (quote-to-name):

```r
# Step 0 — concepts
# refactoring: "a disciplined technique for restructuring an existing body of code altering its internal structure without changing is external Behavior ... from the book refactoring"
# formula: F_to_C(x) = (x - 32) * 5/9   # caption: "the function F to C here applies you know x minus 32 times 5 or 9. and 509 is applied" + bug: "if you want to convert 95 to Celsius you will get a different result so this is a bar"
f_to_c <- function(x) (x - 32) * 5/9     # "F to C" ← f_to_c internal helper (caption: "there is nothing on top of F to C this is what we call an internal function")

# MVP layout
# ~/Downloads/MVP/  input/swim.csv  output/  readme.Rmd → readme.md  *.Rproj
here::here("input", input_name)           # "here function ... creates paths that are nested in the folder where the function is being called"

# Step 1 — reproducibility & package scaffolding
here <- function(...) file.path("~/Downloads/MVP", ...)  # temporary shim — "we are actually going to write our own here function and instead of using the original definition we are going to Define it differently to point to where we have the data ... these dot means that I can again pass any number of strings"
usethis::create_package("production")     # "create package creates an empty package"
usethis::use_mit_license()                # "use an MIT license inside this file it defines that it's an MIT license"
usethis::use_r("censify_temp")            # "use R from they use this package and automatically ... had a file that was empty"
devtools::check()                         # "check just by running that and we will know if there's any errors any warnings any node"
# inst/extdata handling — "use this package to create a subdirectory called inst exit data ... files that will you know install along with the package"

# Step 2 — snapshot testing
usethis::use_test("capture-output")       # "use test from the useless package so if you give it a name say capture output it's going to create a new file under the directory tests"
e <- new.env()
element_render <- function(path, envir = e) { rmarkdown::render(path, envir = envir) }  # paraphrased — "function element that render ... given a path ... will execute that script and ... using an argument called envir in there with object e ... we create first a new environment"
# in tests/testthat/test-capture-output.R
# expect_snapshot(e$localized); expect_snapshot(e$clean)  # "write two tests that would test that the objects localized and clean did not change"
devtools::test()                          # "when you run the test with a function called devtools test all of this will run ... there were some snapshot tests and it will automatically print the output of the object e-localized and e-clean"
# _snaps/capture-outputs.nsi.md / capture-output.nsi.md created under _snaps (caption: "under a directory called snaps underscore snaps it added automatically this file called capture outputs underscore nsi.md")
# private data: keep private snapshots in separate git-ignored directory, run via testthat::test_dir

# Step 3 — refactor (behavior-preserving)
mvp_path <- function(...) file.path("~/Downloads/MVP", ...)  # renamed shim — "name MVP path is a new name it holds the same function that before was assigned to the here function"
# extract censify_temp and localization helpers into R/, keep bug intact — "even if we know that is about we just leave it alone and this is just refactoring"

# Step 4 — behavior change after discussion
# previously skipped: expect_equal(censify_temp(...), 32.8)  # "I Google ... what would be the conversion of 91 Fahrenheit to Celsius and it was something like 32.8 ... these tests fails ... skipping this test with fix me"
# fix: replace 509 with *5/9; remove skip — "now I'm ... there was some code that was a game multiplying um by five over nine and that's gone so that was the fixed about fixed and then the test also ... I removed that line that said skip"
```
