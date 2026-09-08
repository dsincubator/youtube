---
type: source
title: "Productive conversations about code (part 1 of 2)"
source_file: "4IXcu1g0zfk_productive-conversations-about-code-part-1-of-2.md"
video_id: "4IXcu1g0zfk"
url: "https://www.youtube.com/watch?v=4IXcu1g0zfk"
lang: en
tags: ["ds-incubator", "code-reviews", "reproducibility", "r-packages"]
key_topics: ["code-reviews", "reproducibility", "reprex", "r-markdown", "styler"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=4IXcu1g0zfk"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 13
    last_modified: "2020-09-01T00:00:00Z"
usage_window: { from: "2020-09-01T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# Productive conversations about code (part 1 of 2)

## Summary

Part 1 of a two-part series reframes "code reviews" as the broader set of productive conversations about code, from a one-line Slack snippet to a multi-file pull request, borrowing language from Jenny Bryan and the Google engineering practices guide. The opening argues that without the actual runnable code and its observed output, collaboration feels like troubleshooting a family member's computer over the phone: you cannot reproduce the other's experience. Hence every productive exchange must deliver code that actually runs in a fresh R session, the accompanying output so the reviewer need not run it to see the issue, and an easy path to run it if they choose.

From there the talk moves from intent to system, grounded in Google's guide and Advanced R's reproducibility advice. Intentions include aiming for reproducibility, optimizing team speed over individual speed (avoiding shortcuts that burden the reviewer), responding promptly without interrupting focus work, keeping conversations small and scoped to one thing, writing for the reader's perspective, capturing discussion in discoverable places inside the code/commit, and treating reviews as continuous improvement rather than perfection. Systems for achieving this include style guides—specifically the tidyverse style guide as adapted by Google—and tooling tied to artifact size: small snippets via reprex, single-file work via GitHub-Flavored R Markdown, and multi-file projects via RStudio Cloud from a GitHub repo.

## Key Concepts & Tools Taught

- **[code-reviews]:** Productive conversations about code (term borrowed from Jenny Bryan) covering the spectrum from inline snippets to formal pull requests, whose purpose is sustaining product and research quality; evaluated as "looks good to me" for incremental improvement.
- **[reproducibility]:** Making a problem reproducible by providing four elements: software dependencies (`library()` calls), data (hosted or bundled, with private handling), clear prose stating the problem and expected outcome, and session info (R/platform/package versions).
- **[reprex]:** `reprex` package for 1–2 line exchanges (caption "reprint replace is the name of the package that allows you to create code and output" / "robrex implements these ideas" ← normalized `reprex`) that renders copy-pasteable code + commented output meeting all three requirements (runs, shows output, easy to rerun).
- **[r-markdown]:** R Markdown with `github_document` output (caption "github document output so basically you would be writing an ar markdown file ... output format github document ... produces an empty file a markdown file that github creates automatically a web page for" ← normalized `rmarkdown::github_document`) for single-file conversations shared as a link; pull requests add inline code-review UI.
- **[styler]:** `styler` package (caption "styler package is the tool that implements that and a few other tools kind of interface with it" ← `styler`) applying the shared style guide (tidyverse → Google) across a file or package so reviews focus on logic, not formatting; complemented by Gophen's reader-expectation prose guide.

## Code Snippets & Formulas

Caption-mangled, normalized here (quote-to-name):

```r
# Reproducibility checklist (described)
library(dplyr)           # "you generally start with a bunch of calls to library package whatever because you know those packages might be dependencies"
# include data — host on website or share project with data
# include clear prose: problem + expected output — "what is that you're actually expecting"
sessionInfo()            # "session information ... are you running r on linux ... which version of r and which version of each package ... there is functions in r for example that give you all of that"

# Tooling by size
# 1–2 lines → reprex
reprex::reprex({         # "reprint replace is the name of the package that allows you to create code and output that meets the three requirements" / "robrex"
  library(dplyr)
  mtcars %>% filter(cyl == 4)
})
# sharing: GitHub gist alternative — "there is also github gists which is beautiful ... just a repository made up of just one file ... you can also create a new gist"

# Single file → R Markdown github_document
# ---
# output: github_document
# ---
# knit → .md rendered as web page (caption: "strongly recommend the github document output ... you would be writing an ar markdown file ... github creates automatically a web page ... you can share just a link ... they click there and they already see your code and your output")

# Multiple files → RStudio Cloud from GitHub
# New Project > From GitHub repo → paste address → creates cloud project with dependencies (caption: "from any repository on github you can go to our studio cloud and when you create a new project you are given the option to create a new person from a github repo")

# Style automation
styler::style_file("R/functions.R")   # "styler package is the tool that implements that ... you can just ... create the style following that guide at the level of an entire say package or at the level of an entire file"
styler::style_pkg()                    # whole-package styling
# Reader perspective prose guide — George Gopen (caption: "george gophen ... reader's protection approach")
```
