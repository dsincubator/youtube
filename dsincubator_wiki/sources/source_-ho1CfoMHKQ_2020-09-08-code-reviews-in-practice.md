---
type: source
title: "2020 09 08 code reviews -- in practice"
source_file: "-ho1CfoMHKQ_2020-09-08-code-reviews-in-practice.md"
video_id: "-ho1CfoMHKQ"
url: "https://www.youtube.com/watch?v=-ho1CfoMHKQ"
lang: en
tags: ["ds-incubator", "github", "pull-requests", "r-packages", "code-reviews"]
key_topics: ["code-reviews", "reprex", "github", "pull-requests", "rmarkdown"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=-ho1CfoMHKQ"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 18
    last_modified: "2020-09-08T00:00:00Z"
usage_window: { from: "2020-09-08T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# 2020 09 08 code reviews -- in practice

## Summary

This continuation of the code-reviews series moves from conceptual properties to practical tools in R, focusing on how to have productive conversations about code. The presenter recalls the three properties from the prior week — the submitted code actually runs and reproduces an error or result, the output is included so a reviewer does not have to run it, and yet the code remains easy to run if the reviewer chooses to — and frames the goal as providing a reproducible environment without contaminating the reviewer's machine.

The first half demonstrates sharing a small snippet with the reprex package, showing the Addins menu workflow and then calling `reprex` directly with curly braces to handle multiple lines, and using the `here` package to build a portable path to a local `data/empty cars csv` file. With `session_info = TRUE` the output includes a collapsible session info dropdown for OS and package versions. Running `reprex` without extra arguments fails because by default it creates a temporary directory and working directory that does not contain the local data; adding `outfile = NA` tells reprex to use the current working directory instead, though the presenter notes this is less reproducible and the data must be shared separately via private channels when appropriate. The reprex output is then shared via a GitHub gist or as a file inside a pull request — including a path as low-friction as GitHub's web Add file → Create new file → Propose new file → Create pull request flow that creates a branch and review thread without local git setup, enabling line-level comments, starter review, approve/request changes, conversation resolution and merge.

The second half scales the same principles to longer code: the pull request remains the tool, and a GitHub document (`.Rmd` → `.md`) provides code alongside its output rendered as a browsable page on GitHub without storing `.html`. Parameterized R Markdown is shown as a way to expose parameters in the YAML header accessed via `params` (described as a list, e.g. `params$data`) so reviewers can vary inputs through a Shiny-powered knit-with-parameters interface without editing code.

## Key Concepts & Tools Taught

- **[code-reviews]:** Productive conversations about code that include runnable code, its output so the reviewer does not have to run it, and an easy path to run it deeper, leaving a searchable record for future decisions.
- **[reprex]:** R package for sharing a small runnable snippet together with its output and session info; can be invoked from the RStudio Addins menu or as `reprex::reprex({ ... })`.
- **[github]:** Collaboration platform used to share the reprex output via gists (new gist) or via a new file created directly in the web UI, providing discoverability versus private sharing.
- **[pull-requests]:** GitHub mechanism for code review that provides per-line comments, pending starter reviews, finish with approve or request changes, conversation resolution, and merge while preserving history.
- **[rmarkdown]:** GitHub document format that knits an `.Rmd` to `.md` / markdown so GitHub renders it as HTML, recommended for sharing a full file with output; includes parameterized documents where YAML params appear as elements of a `params` list for interactive knitting.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```r
reprex::reprex({
  library(tidyverse)          # "using a collection of packages in the timers" — tidyverse / timers ← tigers/timers
  # "getting some data that already exists in r because it comes by default with the package data set"
  # "filtering a few rounds so that's very simple"
})
# "you could probably highlight it ... and type here replex on your add-ins ... you should see something like replace selection or render replace"
# reprex ← replace / replex / fretbricks / red bricks / reprex selection ← replace selection

reprex::reprex({
  path <- here::here("data", "empty cars csv")  # "using the here here package ... creates a path ... that will always work" — here::here ← here here
  read.csv(path)
}, session_info = TRUE, outfile = NA)
# "i try to improve my replex a little bit by saying session information equals true" — session_info ← session information
# "the default as you can see here says error the red bricks basically doesn't find the data set empty cars csv"
#   because "by default replix will create a new little environment and a new working directory"
# "well and the way you do that is with that weird argument ... out file an a / out file equals n a"
#   → outfile = NA ← out file and a / out file equals n a

# Sharing
# "when you go to e to github when you go to the plus button there's always a new gist thing there" → GitHub gist
# "add file ... create a new file ... my rubrics dot md ... it says propose new file ... that suggests that it is going to create a pull request"
# reviewer workflow: Files changed → click plus → "starter review" → add comment → "finish the review" → approve / request changes → merge

# R Markdown GitHub document
# "i strongly recommend the github document because that format shows up really nice on github ... will have this md file with markdown file that github ... renders as an html"
# File → New File → R Markdown → From Template → GitHub Document → github_document ← github document
# "any file that has this format and leaves on github will have this md file ... rmd file and then you can just remove the template and start adding your own code"

# Parameterized R Markdown
# "parameterized our markdown documents ... parameterized armature documents" → parameterized R Markdown ← parameterized armature
params$data                      # "it allows you to access in the code parameters that are defined in the yamaha header as if they were an element of a list"
# YAML: params: data: "here::here(...)"  → "Knit with Parameters" UI powered by Shiny
```
