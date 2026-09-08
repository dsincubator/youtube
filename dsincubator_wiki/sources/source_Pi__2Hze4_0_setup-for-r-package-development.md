---
type: source
title: "Setup for R package development"
source_file: "Pi__2Hze4_0_setup-for-r-package-development.md"
video_id: "Pi__2Hze4_0"
url: "https://www.youtube.com/watch?v=Pi__2Hze4_0"
lang: en
tags: ["ds-incubator", "r-packages", "github", "cloud", "git"]
key_topics: ["r-package-development", "usethis", "rstudio-cloud"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=Pi__2Hze4_0"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 28
    last_modified: "2020-02-04T00:00:00Z"
usage_window: { from: "2020-02-04T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# Setup for R package development

## Summary

This session covers the setup needed for R package development in advance of a six-week remote hackathon on the r2dii analysis package. After confirming the in-person retreat is postponed, the presenter focuses on enabling contributions that get accepted quickly, noting friction when contributors are accustomed to scripts and projects but not packages.

The recommended starting point is Hadley Wickham and Jenny Bryan's R Packages book, specifically Chapter 2 "The whole game" ("the whole game" — a concise overview of tools to create packages, add functions, check and test them that can be read in an hour or two). The demo package `they were packaged` is created with `usethis::create_package("they were packaged")`, turned into a Git repository with `usethis::use_git()`, published to the 2degreesInvesting organization with `usethis::use_github("2DegreesInvesting/they were packaged")`, forked to the user account `greece demo` via the Fork button, and cloned into RStudio Cloud via "New project from GitHub" by pasting the HTTPS or SSH clone URL. RStudio Cloud is promoted as a way to start with a pre-configured development environment (devtools etc.) to avoid local installation friction.

Core dev setup uses `usethis::edit_r_profile()` to open `~/.Rprofile`, paste the snippet from the ds-incubator handbook that makes `usethis` and `devtools` available on every `Restart R` (`Ctrl+Shift+F10`), and notes that only package-development packages (usethis/devtools/testthat) belong in `.Rprofile` — not data-analysis packages like ggplot2 or devtools-like tools should live inside scripts. The second setup rule is a clean session: in Tools → Global Options → General uncheck "Restore .RData into workspace at startup" and set "Save workspace to .RData on exit: Never". The presenter previews next-session topics (`use_r`, `use_data` and the special `data/` folder), and fields questions about SSH vs HTTPS with two-factor auth on RStudio Cloud (each new project needs its own authorization; HTTPS with credential manager often just works), GitHub template vs `usethis` incremental building (forking a template pre-fills .gitignore and file structure, while the presenter's preference is bottom-up via `usethis` → `use_template("travis")` from the `heart`/ArtiUseThis personal template package), and whether building packages from scratch is required versus understanding `R CMD check`, `use_test`, and `use_document` to keep contributions passing.

## Key Concepts & Tools Taught

- **[r-package-development]:** Package structure and development approach as covered in R Packages Chapter 2 "The whole game" — overview of creating, adding functions, checking and testing packages.
- **[usethis]:** Package helpers for creating and wiring packages: `create_package`, `use_git`, `use_github`, `edit_r_profile`, `use_r`, `use_data`, `use_template`.
- **[rstudio-cloud]:** RStudio Cloud project via "New project from GitHub" using the clone URL (SSH or HTTPS), providing a pre-configured package-development environment and isolation per-project (each project needs separate auth).
- **[devtools-and-testthat-setup]:** Two heavily used packages for building packages; made available at startup via `edit_r_profile` rather than added to `.Rprofile` for analysis packages.
- **[clean-session-configuration]:** Start from a blank slate — uncheck restore .RData, set Save workspace to Never, and restart with `Ctrl+Shift+F10` so no objects leak between sessions.
- **[github-cloning-and-forking]:** Flow org repo → fork to personal account (`greece demo`) → copy SSH/HTTPS link → clone into RStudio Cloud.
- **[package-templates]:** Alternative of forking a template repo vs incremental `usethis` building; personal templates stored in `inst/templates` with `use_template()` (e.g., Travis config) in the speaker's `ArtiUseThis` package.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```r
# Chapter reference
# "chapter two which is called the whole game so they're at this link" <- "the whole game"

# Creating the demo package
usethis::create_package("they were packaged")  # "with the function from the use this package create package and then you just pass it the name of the package you want to create" <- "use this package create package"

usethis::use_git()                # "then I use the function use it to transform my package into also a git repository" <- "use it"
usethis::use_github("2DegreesInvesting/they were packaged")  # "then I use the function use github and I gave the name of the organization where I want to post that package" <- "use github"

# RStudio Cloud clone
# "New project -> New project from github you just paste a link click OK" <- clone URL (SSH or HTTPS)

# Startup configuration
usethis::edit_r_profile()  # "you can use the function use these any our profile ... in particular function edit our profile and that function will open and our profile file" <- "use these any our profile" / "edit our profile"
# paste snippet from handbook into ~/.Rprofile, then:
# "you need to rest a little shift ctrl F then" <- "rest ... shift ctrl F" = Restart R (Ctrl+Shift+F10)

# Mentioned for package work
usethis::use_r()       # "these functions you gotta grow and use data" discussion -> use_r for adding functions <- "gotta grow"
usethis::use_data()    # "use data because the kind of contributions ... storing data in a folder called data which is very confusing because they folder called data in an R package has some very specific properties" <- "use data"
usethis::use_template("travis", package = "heart")  # "you can use a function use template and then you say which template you want to use so I think in my case Travis ... is the heart" <- "use template" / "Travis" / "heart"
# Tools → Global Options -> General: uncheck "Restore .RData" + "Save workspace to .RData on exit: Never" -> Apply
```
