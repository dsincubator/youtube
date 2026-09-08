---
type: Reference
title: Package Documentation
description: Roxygen2 documentation, package-level docs, function documentation, and
  vignettes
lang: en
tags:
- ds-incubator
generated:
  by: agent:okf-wiki-builder/1.0
  at: '2026-09-08T04:00:00Z'
status: draft
sources:
- id: C27MVWqWSMs
  resource: https://www.youtube.com/watch?v=C27MVWqWSMs
  title: 'R packages: The whole game'
  author: process:yt-dlp
  usage_count: 30
  last_modified: '2020-02-01T00:00:00Z'
- id: FPZfMUwV73o
  resource: https://www.youtube.com/watch?v=FPZfMUwV73o
  title: 'R packages: Documenting'
  author: process:yt-dlp
  usage_count: 10
  last_modified: '2020-02-25T00:00:00Z'
- id: hRUvGna0uK0
  resource: https://www.youtube.com/watch?v=hRUvGna0uK0
  title: 'R packages: Data'
  author: process:yt-dlp
  usage_count: 8
  last_modified: '2020-02-11T00:00:00Z'
---
# Package Documentation

## Overview

Documentation is taught as two levels: low-level help files for each exported function and high-level project documentation (README, website). [source_FPZfMUwV73o](../../sources/source_FPZfMUwV73o_r-packages-documenting.md) is the dedicated session, complemented by the live roxygen demo in [source_C27MVWqWSMs](../../sources/source_C27MVWqWSMs_r-packages-the-whole-game.md) and the package-level-doc helper in [source_AFuVF0oWFMY](../../sources/source_AFuVF0oWFMY_creating-an-empty-r-package-up-to-the-best-standards.md). The core message: a consistent template (title, `@param`, `@return`, `@examples`) helps users know where to look and whether a section is intentionally absent, and a good `@examples` block is worth the effort because it is reused as a test and as README content.

The series also stresses the pickiness of README rendering: `README.Rmd` knits against the *installed* package, not source files, so a new function must be documented (`@export` → `NAMESPACE` via `devtools::document()`) and `devtools::install()`-ed before the README chunk can find it, and `README.Rmd` must be knitted to `README.md` before committing.

## Key Concepts

- **roxygen2 skeleton**: Code → Insert Roxygen Skeleton prompts for title, `@param x`, `@return`, `@examples`, `@export`; `devtools::document()` generates `man/*.Rd` and `NAMESPACE` so `?fct` works — [source_FPZfMUwV73o](../../sources/source_FPZfMUwV73o_r-packages-documenting.md) and [source_C27MVWqWSMs](../../sources/source_C27MVWqWSMs_r-packages-the-whole-game.md).
- **`@examples` as contract**: users jump to examples first; empty examples frustrate; writing a good example documents intended behavior and can be copy-pasted into a test (`use_test()`) and into `README.Rmd` — [source_FPZfMUwV73o](../../sources/source_FPZfMUwV73o_r-packages-documenting.md).
- **Package-level documentation**: `usethis::use_package_doc()` creates `R/<pkg>-package.R` for package-wide imports and description (`#' @keywords internal`); `usethis::use_tidy_description()` cleans `DESCRIPTION` — [source_AFuVF0oWFMY](../../sources/source_AFuVF0oWFMY_creating-an-empty-r-package-up-to-the-best-standards.md).
- **README workflow**: `usethis::use_readme_rmd()` scaffolds `README.Rmd` with executable chunks; `README.md` is the GitHub landing page; `devtools::install()` + `Kn knit` + commit both `Rmd` and `md` in sync — [source_FPZfMUwV73o](../../sources/source_FPZfMUwV73o_r-packages-documenting.md).
- **Package website**: `usethis::use_pkgdown()` → browsable reference, articles, and README at `https://<org>.github.io/<pkg>/`; see [source_AFuVF0oWFMY](../../sources/source_AFuVF0oWFMY_creating-an-empty-r-package-up-to-the-best-standards.md) for live site navigation.
- **Data documentation**: roxygen also documents datasets in `data/`; see [source_hRUvGna0K0](../../sources/source_hRUvGna0K0_r-packages-data.md) and [Creating R Packages](../r-packages/creating-packages.md).

## Example

```r
#' Summarize a numeric vector
#' @param x Numeric vector
#' @return Single number (max - min)
#' @export
#' @examples
#' max_minus_min(c(1, 3, 2))
max_minus_min <- function(x) max(x) - min(x)
# devtools::document() -> man/max_minus_min.Rd + NAMESPACE export
```

## Sources

| Video | Title | Views | Last Modified |
| [C27MVWqWSMs](https://www.youtube.com/watch?v=C27MVWqWSMs) | [R packages: The whole game](../../sources/source_C27MVWqWSMs_r-packages-the-whole-game.md) | 30 | 2020-02-01T00:00:00Z |
| [FPZfMUwV73o](https://www.youtube.com/watch?v=FPZfMUwV73o) | [R packages: Documenting](../../sources/source_FPZfMUwV73o_r-packages-documenting.md) | 10 | 2020-02-25T00:00:00Z |
| [hRUvGna0uK0](https://www.youtube.com/watch?v=hRUvGna0uK0) | [R packages: Data](../../sources/source_hRUvGna0uK0_r-packages-data.md) | 8 | 2020-02-11T00:00:00Z |
## References

- Hadley Wickham — *R Packages* (Whole game, Documenting, Testing, CRAN)
- Hadley Wickham — *R for Data Science* (Workflow, EDA, ggplot2, dplyr)
- `usethis`, `devtools`, `roxygen2`, `pkgdown`, `targets`, `drake`, `ggplot2` documentation
