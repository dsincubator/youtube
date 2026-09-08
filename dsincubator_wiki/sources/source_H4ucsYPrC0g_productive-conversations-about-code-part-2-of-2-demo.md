---
type: source
title: "Productive conversations about code (part 2 of 2 -- demo)"
source_file: "H4ucsYPrC0g_productive-conversations-about-code-part-2-of-2-demo.md"
video_id: "H4ucsYPrC0g"
url: "https://www.youtube.com/watch?v=H4ucsYPrC0g"
lang: en
tags: ["ds-incubator", "github", "r-packages", "pull-requests", "cloud"]
key_topics: ["reprex", "github", "pull-requests", "code-reviews", "r-markdown"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=H4ucsYPrC0g"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2020-09-01T00:00:00Z"
    usage_count: 7
usage_window: { from: "2020-09-01T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Productive conversations about code (part 2 of 2 -- demo)

## Summary

A hands-on companion to the prior conceptual session on what makes a conversation about code productive, this demo focuses on tooling in R for sharing code at three scales. The framing principle is that productive conversations should involve code that runs, that the helper does not have to run if they choose not to, but that is easy to run if they do, with session information and data included.

For a few lines of code, the speaker demonstrates the reprex package in RStudio Cloud: highlighting a `dplyr` pipe on `mtcars`, using the Addins → reprex menu, rendering with the append session info option and sharing via a GitHub gist or GitHub issue, noting that output is commented out so pasting code and output still runs, and covering two data-handling patterns — recreating a dataset with `dput` text for pasting, and reading local CSVs either by hosting the file at a URL that `read_csv` can read or by running reprex with `outfile = NA` and `session_info = TRUE` so the chunk runs in the current working directory rather than reprex's temporary directory.

For a whole file, the recommendation is an R Markdown GitHub document (`output: github_document`) with `comment = "#>"` (matching reprex) and complementary knitr options `error = TRUE` and `collapse = TRUE`, using the `here` package to make paths robust and showing that rendering produces an `.md` that renders as a web page on GitHub and is easy to copy-paste. Multiple files are handled by sharing an RStudio Cloud project link (adjusting access permissions to Everyone to enable cloning) or a pull request: the workflow shown creates a branch (`code review`), commits the `.Rmd`, `.md` and `data/mtcars.csv`, pushes with `pr_push`, opens a draft PR, and uses the Files changed tab for line-specific reviews with pending comments, high-level approval, and resolve-conversation. The session also demonstrates the helper `usethis::create_from_github` and `pr_fetch` for reviewers to clone a repo or fetch a specific PR (e.g., `pr_fetch(14)`) from either origin or upstream, emphasizing that fetching preserves both master and PR branches and that uploading a single file via the GitHub web UI is an alternative for small contributions.

## Key Concepts & Tools Taught

- **[reprex]:** R package for creating reproducible examples from a highlighted code chunk; output is commented out so the whole block remains runnable, with session info optionally appended.
- **[github]:** platform for sharing examples as gists or issue comments, where `.md` files render as HTML with syntax highlighting.
- **[pull-requests]:** GitHub mechanism for proposing changes, creating draft PRs, commenting on specific lines in Files changed, submitting reviews, and resolving conversations.
- **[code-reviews]:** productive conversations anchored in runnable code, discoverable in the repository, with reviewer-friendly environments that lower the cost of reproducing.
- **[r-markdown]:** authoring format for a single-file document; a GitHub document with `comment = "#>"` mirrors reprex behavior and renders nicely on GitHub for review.

## Code Snippets & Formulas

Spoken calls dictated live (mangled caption fragments normalized here):

```r
# Minimal chunk to share with reprex
library(dplyr)           # "you want to attach some patches packages"
mtcars %>% filter(cyl > 4)  # "filter still greater than four" — filter still

# reprex via RStudio Addins
# "you can highlight the code and come here to addings and type the breaks" — reprex ← replex / the breaks
# Menu: Addins → reprex → Render reprex with append session information
reprex::reprex()  # "renderer price will give you an interface ... appending the session information" — render reprex
reprex::reprex_clean(clipboard = TRUE)  # "replex clean will clean at the output let's see if it works" — replex clean

# Including data — recreating with dput
# "you can create with a function d put you can create a text output from the data set that then you ... can copy" — dput ← d put
dput(mtcars)  # copy output to paste and recreate mtcars

# Including data — reading from URL vs local path
readr::read_csv("https://.../mtcars.csv")  # "read csv can't read urls directly and not just paths" — read csv ← read csv
# Alternative: out.file runs in working dir
reprex::reprex(outfile = NA, session_info = TRUE, {  # "so to reprix takes a number of arguments and this one called out file is very little known" — out file ← out file
  mtcars <- readr::read_csv(here::here("data", "mtcars.csv"))  # "recommend using the here package to create paths" — here ← here
  mtcars %>% filter(cyl > 4)
})

# Single-file R Markdown for review — YAML header
# "so what i recommend for your pica document is to also add as output to add the setting comments equals the same that replex uses"
---
output:
  github_document:
    comment: "#>"   # "comments equals the same that replex uses" — comments
    # optional: error: true, collapse: true — "error equals true ... collapse equals true"
---

# Creating the GitHub document via pull request
usethis::pr_init("code-review")  # "what i do want to do is to create uh to initialize support requests so let's do pr pr init and ... branch is gonna be code review" — pr init ← pr init
usethis::pr_push()  # "you have ... following the recommendation here with vr push so that will create a pull request" — pr_push ← vr push
usethis::create_from_github("owner/repo", destdir = "~/", fork = TRUE)  # "they could so if you did where is your code here ... to create from github this is a function from the use this package" — create_from_github ← create from github
usethis::pr_fetch(14)  # "they could do easily enough to do pr fetch 14 and they will get you know locally ... the pr" — pr fetch ← pr fetch
```
