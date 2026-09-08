---
type: source
title: "r2dii.data and r2dii.match are now on CRAN: Demo and Q&A"
source_file: "ovbwghDjxV8_r2dii-data-and-r2dii-match-are-now-on-cran-demo-and-q-a.md"
video_id: "ovbwghDjxV8"
url: "https://www.youtube.com/watch?v=ovbwghDjxV8"
lang: en
tags: ["ds-incubator", "cran", "r-packages", "r2dii", "github"]
key_topics: ["r2dii-data", "r2dii-match", "cran-installation", "data-dictionary", "loanbook-demo", "name-matching"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=ovbwghDjxV8"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 91
    last_modified: "2020-03-31T00:00:00Z"
usage_window: { from: "2020-03-31T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# r2dii.data and r2dii.match are now on CRAN: Demo and Q&A

## Summary

The meetup announces that two packages of the 2degreesInvesting `r2dii` suite — `r2dii.data` and `r2dii.match` — are now on CRAN, and demonstrates purpose, installation, and contribution workflow while advertising a parallel `coding helpdesk` office-hours experiment. The helpdesk is framed as 30-minute weekly slots bookable via Google Calendar (other calendars → add Mauro/Jackson/Michelle calendars, invite on a blocked time, meet over Slack screenshare) for live coding help on any problem, including general `r2dii` usage. The `r2dii` umbrella website (pkgdown) is presented as the discovery surface: its News tab lists release notes (publishing available on CRAN with install snippets and vignettes) and its Reference tab provides a global index of all objects across the suite, linking each function to its package site documentation. CRAN pages with install tips and `Get Started` articles are also highlighted. In a live RStudio demo, both packages can now be installed as binaries via `install.packages("r2dii.data")` / `install.packages("r2dii.match")` and load as expected. `r2dii.data` is explained as a public-facing synthetic template layer: fully fake data for demos and for deterministic tests. Its central metadata object `data_dictionary` enumerates every dataset, column name, column type and concise definition in the package (e.g., `loanbook_demo`); filtering `data_dictionary` by `dataset == "loanbook_demo"` reveals the schema for that fake corporate loan book (`id_loan`, `loan_size`, `name_direct_lender`, etc.). Other template sets include `ald_demo` (synthetic asset-level data with random numbers) and `iso`/`sector classification` bridges (`ISIC` → `GICS`) exposed via helper dictionaries. `r2dii.match` is introduced as fuzzy name-matching between financial portfolios and physical assets: the main function `match_name()` matches on star-column families (`name_direct_lender`, `name_parent`, `name_ultimate_parent`) against asset-level names, producing a score (1 = perfect match, lower scores fuzzy) and optionally restricting matches by `by_sector = TRUE`. Example execution `match_name(loanbook_demo, ald_demo)` runs in ~30 seconds and returns up to three rows per loan when matches exist at multiple name levels; results are filtered by `min_score` threshold. Q&A clarifies governance: `r2dii.data` is a deliberate hurdle/template where structural changes require issue discussion in the `r2dii.data` GitHub issues tab to avoid silent breaking changes, while proprietary real data continue to be processed from internal pipelines referencing these templates.

## Key Concepts & Tools Taught

- **[r2dii-data]:** Template/synthetic public package containing fake demonstration and test data for the entire analysis workflow (caption "idea behind our TDI data is to have a public-facing package but contains all of the template data sets that are necessary ... be completely synthetic and completely fake").
- **[r2dii-match]:** Fuzzy name-matching package for bank portfolios to asset-level data (caption "our TDI Maps ... essentially fuzzy name matching for the for the bank's word ... matching financial portfolios of my material ... function match name").
- **[cran-installation]:** First CRAN release enabling standard install with Windows binaries (caption "now actually even up Windows binaries available ... you can actually now install these packages as you would any other package from ours by calling installed on packages and the package RTI is now installed").
- **[data-dictionary]:** Metadata dataset describing every dataset/column/type/definition in `r2dii.data` (caption "function data dictionary ... data set that provides a metadata about all data sets in the package ... includes data set names ... column names ... type ... brief definition").
- **[loanbook-demo]:** Fake corporate bond/loan book used for development and tests (caption "one book demo ... fake long book ... fake corporate bond or a corporate debt loan book" → normalized `loanbook_demo`).
- **[name-matching]:** Matching across `name_*` star columns with sector-aware and thresholded output (caption "function match name ... matches a loan book and acid level data set by the name underscore star columns ... bisector ... only going to try and match between entities that are in the same sector ... minimum score ... filters ... only shows the results with the minimum score that's greater than this threshold").

## Code Snippets & Formulas

```r
# Discovery via pkgdown umbrella and CRAN (caption "main art we di package website ... Reference tab ... question mark")
# https://2degreesinvesting.github.io/r2dii/  -> News & Reference
# CRAN: https://cran.r-project.org/package=r2dii.data  https://cran.r-project.org/package=r2dii.match

# Installation now that packages are on CRAN with binaries (caption "installed on packages and the package RTI is now installed")
install.packages("r2dii.data")
install.packages("r2dii.match")
library(r2dii.data)
library(r2dii.match)

# Inspect package contents
ls("package:r2dii.data")
ls("package:r2dii.match")

# Data dictionary metadata (caption "question mark package name : : depiction area ... data dictionary")
?r2dii.data::data_dictionary
data_dictionary  # columns: dataset, column, type, definition (caption "names of all the individual data sets all of the column names ... type ... brief definition")
dplyr::filter(data_dictionary, dataset == "loanbook_demo")

# Individual template datasets (caption "question mark package name :: 1 with demo ... one book demo ... if the package is loaded ... question mark alone book demo")
?r2dii.data::loanbook_demo
loanbook_demo
?r2dii.data::ald_demo
ald_demo
# Other template sets (caption "classification bridges ... bridge from the I said classification standards to the eyes classification standard")
r2dii.data::iso_classification
r2dii.data::sector_classifications

# Make available in global environment for demo
loanbook <- r2dii.data::loanbook_demo
ald <- r2dii.data::ald_demo

# Fuzzy name matching demo (caption "calling match name you say I heard yeah match name with the loan book")
?r2dii.match::match_name
matched <- match_name(loanbook, ald)               # caption "match name with the loan book and a ... second to run"
matched
# Scores: score == 1 perfect (e.g., aasta.martin), lower fuzzy (American cement) (caption "score of the match ... her scores of one aasta.martin ... sort from the bottom ... cement")

# Sector-restricted and thresholded matching (caption "bisector ... by sector equals true ... minimum score ... only shows the results with the minimum score")
matched_sector <- match_name(loanbook, ald, by_sector = TRUE)
matched_filtered <- match_name(loanbook, ald, min_score = 0.8)
# Output size: up to 3x input rows (one per name level: direct_lender / parent / ultimate_parent) filtered by min_score

# Contribution workflow for template changes (caption "find that in the issues file or in the issues tab from our TDI data")
# https://github.com/2DegreesInvesting/r2dii.data/issues
```
