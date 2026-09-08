---
type: source
title: "wtf: Name and organize files"
source_file: "xW05GsfhuiY_wtf-name-and-organize-files.md"
video_id: "xW05GsfhuiY"
url: "https://www.youtube.com/watch?v=xW05GsfhuiY"
lang: en
tags: ["ds-incubator", "workflow", "git", "r-packages"]
key_topics: ["file-naming", "project-organization", "iso8601-date", "jenny-bryan-principles", "human-machine-readability"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=xW05GsfhuiY"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 36
    last_modified: "2022-02-22T00:00:00Z"
usage_window: { from: "2022-02-22T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# wtf: Name and organize files

## Summary

Closing the holistic workflow series and the book *What They Forgot to Teach You About R*, this session covers two project-orientation topics from Jenny Bryan: **naming files** so they order nicely and are readable for humans and machines, and **organizing the analysis/project** so collaborators can find things. A brief preview notes the next meetup will host a guest and later sessions will be more technical.

File-naming principles are taught via bad (`no`) vs good (`yes`) examples. Bad names discussed include `Joe's file names use spaces and punctuation.xlsx` and a long name containing `this string they let this and your career is over` with spaces, punctuation, `@`, `*`, `(` and symbols like `°`. Problems: spaces require escaping and are interpreted differently across platforms (RStudio may crash if a project path contains a space), punctuation breaks programmatic handling, and smashing words with symbols destroys human readability for important information. Good names follow Jenny Bryan's three principles: **machine readable, human readable, and plays well with ordering**. Machines like only hyphens `-` and underscores `_`; Jenny's convention separates semantic metadata components with `_` (e.g., `2022-02-22_abstract-for-sla`) and joins words inside a component with `-`. Human readability demands plain words, consistent lowercase (discussion: "only ever use lowercase filenames ... some OS case-sensitive, some not, Mac inconsistent" — if you have `01_smell-test.R` and `01_Smell-Test.R`, behavior is unpredictable), and no spaces. Ordering is achieved with zero-padded numeric prefixes (`Fig_01`, `Fig_02`) sorting naturally in any file browser and ISO 8601 dates `YYYY-MM-DD` (`year-month-day`) which sort chronologically and are internationally unambiguous (slide: "comprehensive map of countries that use month first — US and a piece of Canada" → most of world does not).

Project organization maps to the generic data-science workflow (import → tidy → transform → visualize → model → communicate). Code files per stage: `smell-test.R` (explore raw data, output is wisdom), `wrangle.R` (tidy raw Excel → clean `data.csv`), `visualize.R`/`model.R`, and `report.Rmd` to glue pieces. Inputs/outputs: raw data (often Excel) → clean `data.csv` → figures saved under `figs/histogram.png`, `scatter.png` → models saved as `model.rds` (or `.csv` for coefficients). 

Live demo converts a messy `abcd` project to a tidy one. Steps: create an RStudio Project (point-and-click or `usethis::create_project()` — caption "use this package to create a project"), add `README.Rmd` via `usethis::use_readme_rmd()` ("use readme rmd" — creates README with goal prompt), rename files: `smell_test.R` (underscore separating two words of same phrase) → `smell-test.R` (hyphen), enforce lowercase, add numeric ordering (`01_smell-test.R`, `02_wrangle.R`), move R scripts into `R/`, rename `"raw data"` (space) → `raw-data` and move to `data-raw/` (convention for R packages), create `data/` for processed `data.csv`, `figs/`, `reports/`/`vignettes` for R Markdown reports. The `README.Rmd` is shown as a report with `# Title`, `## Packages`, `fs::dir_tree()` display (caption "fs has a function called dear underscore tree that shows the tree of the directory" ← `fs::dir_tree`), and knitting to HTML preview. Path handling uses `here::here()` ("we talked about that ... path if I do quotes and press tab I already have opportunity to navigate inside my project" ← `here::here`) and `readxl::read_excel(here::here("data-raw", "raw-data.xlsx"))` then cleaning and `readr::write_csv(clean, here::here("data", "data.csv"))`.

## Key Concepts & Tools Taught

- **[file-naming / file-naming]:** Jenny Bryan's naming: lowercase, hyphens inside semantic components, underscores between components, numeric prefixes, natural sorting. Bad example `Joe's file names use spaces and punctuation.xlsx` illustrates failure for both machines and humans.
- **[project-organization / project-organization]:** Mapping workflow steps to files (`smell-test`, `wrangle`, `visualize`, `model`, `report.Rmd`) and to inputs/outputs (`data-raw/` raw Excel, `data/data.csv` clean, `figs/` PNGs, `models/` RDS).
- **[iso8601-date / iso8601-date]:** Date format `YYYY-MM-DD` (`2022-02-22`) sorts correctly and is the international standard (ISO 8601); discussion of `day/month/year` vs `month/day/year` pitfalls when sorting.
- **[jenny-bryan-principles / jenny-bryan-principles]:** Three tests: machine readable, human readable, plays well with ordering — separating metadata with `_` and allowing programmatic parsing (`strsplit(..., "_")`).
- **[human-machine-readability / human-machine-readability]:** Human: no symbol clutter, lowercase only; Machine: avoid spaces/`@`/`*`/`(`/`°` that break programmatic handling; example: `"contains look how it contains the string they let this"` unreadability plus programmatic pain from `@`, `*`, `(`.

## Code Snippets & Formulas

Caption-mangled with normalized forms:

```r
usethis::create_project("~/git/abcd")   # "use this package to create a project" ← usethis::create_project
usethis::use_readme_rmd()                # "use this package to you to create a readme ... use readme rmd" ← use_readme_rmd

# Renaming/ordering examples (file system actions in RStudio Files pane, also via shell):
# smell_test.R  -> smell-test.R          # "underscore is separating two pieces that belong together so smell test is phrase ... better name could be smell hyphen test" ← hyphen vs underscore
# WrAngLE.R     -> wrangle.R             # "always use lowercases so I don't need to remember if something is lowercase or uppercase" ← lowercase
# smell-test.R  -> 01_smell-test.R       # "it's a good idea to first call it zero one and underscore to separate this part of metadata" ← 01_
# wrangle.R     -> 02_wrangle.R

fs::dir_tree()                           # "fs has a function called dear underscore tree that shows the tree of the directory" ← fs::dir_tree
here::here("data-raw", "raw-data.xlsx")  # "I'm going to create a path with here ... path if I do quotes and press tab" ← here::here
readxl::read_excel(here::here("data-raw", "raw-data.xlsx"))
readr::write_csv(clean_data, here::here("data", "data.csv"))  # "write the clean data ... with the radar package with write csv" / "reader package" ← readr

# Organization folders created:
# R/  data-raw/  data/  figs/  reports/
```

