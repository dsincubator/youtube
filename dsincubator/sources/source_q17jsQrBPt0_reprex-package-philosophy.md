---
type: source
title: "reprex: Package philosophy"
source_file: "q17jsQrBPt0_reprex-package-philosophy.md"
video_id: "q17jsQrBPt0"
url: "https://www.youtube.com/watch?v=q17jsQrBPt0"
lang: en
tags: ["ds-incubator", "r-packages", "reprex", "rmarkdown"]
key_topics: ["reprex-philosophy", "callr-separate-process", "rmarkdown-render", "copy-paste-reproducibility"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=q17jsQrBPt0"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 20
    last_modified: "2021-10-19T00:00:00Z"
usage_window: { from: "2021-10-19T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# reprex: Package philosophy

## Summary

As the final meetup of the `reprex` series, the talk distills the package's philosophy into three tenets — code must run for everyone, others should not have to run it, and if they choose to run it they should be able to copy-paste and run it — and shows how that philosophy maps to a minimal implementation. The source is the "reprex do's and don'ts" article on the `reprex` website, augmented with runnable examples. The first tenet (code must run for everyone, not just its author) is enforced by executing the reprex in a separate R process via the `callr` package: the demo defines `y <- 1:4` in the global environment and then creates a reprex that calls `mean(y)` without `y` in its scope, which errors visibly instead of silently succeeding in the author's session because the fresh process lacks `y`. The second tenet (others should not have to run code) is implemented via `rmarkdown::render()`: the same way an `.Rmd` renders code plus its console output into a document, a reprex captures code alongside output (the two-line `reprex` readme example wrapped in `reprex::reprex()` / `reprex_r()`), so readers see the result without executing it. The third tenet (copy-paste runnable if chosen) is demonstrated by the `comment` argument: with the default `#> ` output comment the rendered output can be copied and pasted as valid R, while forcing `comment = "> "` (mimicking the R prompt) produces output that fails with "unexpected symbol `>`" when pasted. To prove that a clear philosophy makes implementation trivial, the speaker builds a toy `reprexmaker` as a GitHub-flavored R Markdown document (`output: github_document`) with `knitr::opts_chunk$set(error = TRUE, collapse = TRUE, comment = "#>")`: `error = TRUE` ensures the separate-process error surfaces rather than aborting knitting, `collapse = TRUE` merges chunks for tidier rendering, and `comment = "#>"` provides the copy-paste property; removing any of these is shown live to break the corresponding guarantee. Alternative entry points like the RStudio add-in and keyboard shortcuts are noted but the function-based `reprex()` is used for clarity.

## Key Concepts & Tools Taught

- **[reprex-philosophy]:** Three principles — self-contained code that errors when incomplete, output pre-rendered so readers need not run, and output comment allowing copy-paste rerun (caption "there's three things really to the package philosophy the first thing is that the code must run for everyone not just for the person ... the second ... anyone ... should not have to run the code ... the third ... if they choose to run it the others should be able to just copy and paste that code and it should run").
- **[callr-separate-process]:** Using `callr` to spawn a fresh R process whose global environment does not contain caller objects (caption "the cal they call our package is the package that allows you to run code from inside r but in a separate process ... call r ... to create a totally independent process that doesn't know about anything that lives in your global environment").
- **[rmarkdown-render]:** Reusing `rmarkdown::render()` to capture code plus console output in the same document (caption "in the words of the article they use our markdown render ... to create a file like that where you know you have code and you have output ... output that would go to the screen ... boom appears in the same document").
- **[copy-paste-reproducibility]:** Controlling the output comment so pasted code remains valid R (caption "this argument called comment where i could change the default comment which is ... hash and greater than symbol ... default but now i intentionally changed it to ... greater than symbol ... will try to do some computation ... unexpected symbol greater than ... so if i try to copy paste and run this code ... will try ... error").

## Code Snippets & Formulas

```r
# Tenet 1: code must run for everyone via separate process (callr)
y <- 1:4  # defined in global env, not inside reprex
reprex::reprex({
  mean(y)  # caption: "assigning the values one to four to the object y but ... in the global environment ... then when i ... creating the replics ... that object y is not available ... what i get is this error"
})
# Error: object 'y' not found  -> signals missing self-containedness

# Inner mechanism (caption "cal they call our package ... call r")
# callr::r(function() mean(y))  # fresh process, no y

# Tenet 2: others should not have to run code -> rmarkdown::render captures output
library(reprex)
reprex::reprex({
  1:4
  mean(1:4)  # caption "very first code that you see in the ... readme file is these two lines ... i'm wrapping it here in the function replace ... output that you get contains the code ... but also contains the output"
}, venue = "gh")
# Output is rendered .md containing both input and result 2.5, so readers see without running

# Tenet 3: copy-paste runnable via comment prefix
reprex::reprex({ mean(1:4) }, comment = "#> ")   # default, pasteable (caption "comment hash pound and greater than")
reprex::reprex({ mean(1:4) }, comment = "> ")    # mimics R prompt -> pasting yields error "unexpected symbol greater than" (caption "will try to do some computation ... unexpected symbol greater than")

# Toy reprexmaker as github_document Rmd (caption "simply another markdown file ... github document document flavor ... basis of my replex maker")
# In reprexmaker.Rmd YAML: output: github_document
# ```{r setup}
# knitr::opts_chunk$set(error = TRUE, collapse = TRUE, comment = "#>") # caption "error equals true ... collapse equals true ... comment hash pound and greater than"
# ```
# ```{r}
# y  # not defined here, so error surfaces (error = TRUE) instead of knitting failure
# mean(y)
# ```
# ```{r}
# y <- 1:4
# mean(y) # -> 2.5 with comment "#>" (pasteable)
# ```
```
