---
type: source
title: "R packages: Documenting"
source_file: "FPZfMUwV73o_r-packages-documenting.md"
video_id: "FPZfMUwV73o"
url: "https://www.youtube.com/watch?v=FPZfMUwV73o"
lang: en
tags: ["ds-incubator", "r-packages"]
key_topics: ["roxygen2", "documentation", "readme", "examples", "pkgdown"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=FPZfMUwV73o"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2020-02-25T00:00:00Z"
    usage_count: 10
usage_window: { from: "2020-02-25T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# R packages: Documenting

## Summary

Final installment of an R packages series, focused on documenting packages at two levels: low-level help files for functions and high-level project documentation. The speaker frames good documentation as useful to both users, who often jump straight to the examples section and are frustrated when it is empty, and developers, who use examples as a communication vehicle for intended behavior and rely on a consistent template (arguments, return value, examples) so readers know exactly where to look and when a section is intentionally absent.

The live demo uses a demo package that has been in development and testing. From Code → Insert Roxygen Skeleton the speaker shows the roxygen2 template prompting for title, parameter `@param X`, `@return` value and an `@examples` section, emphasizing that investing in a good example pays off because the same example can be copied into a test and into higher-level documentation. For high-level docs, the session covers README: GitHub renders `README.md` as the project landing page, and `usethis::use_readme_rmd()` creates `README.Rmd` that allows executable chunks and ships with a starter template. The presenter copies the package example into the README example section and renders it, encountering the characteristic pickiness of README — it knits against the installed package, not the source files, so a new function like `max_minus_min` must first be documented, trigger namespace generation via `@export`, and be installed before README can find it, and `README.Rmd` and `README.md` must be kept in sync by knitting before committing. The session closes by noting that a package website (e.g., via pkgdown) surfaces all documentation and by briefly navigating an existing package site to show where information is found.

## Key Concepts & Tools Taught

- **[roxygen2]:** documentation system that generates help files from in-source comments; the skeleton enforces a standard structure and prevents forgetting important sections.
- **[documentation]:** low-level function help with a consistent template (title, parameters, return value, examples) whose consistency helps both authors and readers locate information.
- **[readme]:** high-level project overview rendered on GitHub; authored as `README.Rmd` so code chunks execute and the `README.md` output is what users see.
- **[examples]:** the most-visited help section; a good example is worth effort, reusable as a test and as README content, and its absence makes a function hard to understand.
- **[pkgdown]:** tooling for building a package website that aggregates reference, articles and README into a browsable site.

## Code Snippets & Formulas

Spoken calls dictated live (mangled caption fragments normalized here):

```r
# Roxygen skeleton — standard help template
# "to code and insert oxygen skeleton what I get is this thing ... prompts me to type a title explain what X is explain what the return value is" — oxygen skeleton ← oxygen skeleton
# In R/file.R above a function:
#' Title
#' @param x description
#' @return vector / data frame
#' @export
#' @examples
#' # example code here

# High-level README with usethis
# "I use this package has this function use readme and it has two flavors ... they usually are MD to run" — use_readme ← use readme
usethis::use_readme_rmd()   # "creates a readme the RMD file which allows you to run not only ... type text files with run code its executable" — use_readme_rmd ← use readme

# README pickiness — must install before knitting
# "readme gets the functions not from the source code ... but ... from the installation of the package demo in my system" — install before knit
devtools::install()  # via Build tab → Install → "including installing the start session" — install

# Document and generate NAMESPACE
# "I did add this time it's called export export tag ... makes of fungus available to your users and I think I might have forgotten to document my package so the documentation creates ... a namespace" — export tag ← export
devtools::document()  # "I documented the package I created a namespace" — documented the package

# Render README (keep Rmd and md in sync)
# "if I now make this file clicking here I should get the render version of the readme" — knit README.Rmd → README.md ← make this file
# "these files MD and our MD need to be synchronized so you always need to meet your hair MD before you create a commit" — synchronized ← synchronized

# Reusable example
# "if you wrote a test you can just you know copy/paste the test itself and ... this could be the example here but it also could be the example in higher level documentation for example reading" — copy test to example
```
