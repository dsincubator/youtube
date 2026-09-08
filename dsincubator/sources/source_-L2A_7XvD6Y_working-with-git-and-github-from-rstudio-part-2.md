---
type: source
title: "Working with Git and GitHub from RStudio (part 2)"
source_file: "-L2A_7XvD6Y_working-with-git-and-github-from-rstudio-part-2.md"
video_id: "-L2A_7XvD6Y"
url: "https://www.youtube.com/watch?v=-L2A_7XvD6Y"
lang: en
tags: ["ds-incubator", "github", "git", "pull-requests"]
key_topics: ["git", "github", "rstudio", "github-document", "history-filtering"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=-L2A_7XvD6Y"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 15
    last_modified: "2020-08-18T00:00:00Z"
usage_window: { from: "2020-08-18T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# Working with Git and GitHub from RStudio (part 2)

## Summary

This is a continuation of a longer session on working with Git and GitHub from RStudio, split to respect time and covering two topics that were not reached previously. The presenter works from a document that culminates in submitting a pull request with changes to a file that itself produces a rendered output, and uses it to illustrate how history and rendering appear both locally and on GitHub.

First, the history panel is shown filtered at different granularities: by default the entire project history with remotes and commits since branch creation, then narrowed to a specific branch, then to a directory such as `co2 setup`, and finally to a single file such as `readme`, where only the one commit touching that file remains. The diff view at the bottom shows before in red and after in green, and the takeaway is that the staging area versus history distinction plus branch/directory/file filters help locate changes to a specific file. Second, the presenter contrasts previewing a `github document` source `.Rmd` locally as HTML with how GitHub renders the companion `.md` directly as HTML without needing an `.html` file, recommends the github_document format because the `.md` is the interesting output, and demonstrates the RStudio shortcut that opens the currently active file on GitHub in the browser, which after the pull request points to the fork.

## Key Concepts & Tools Taught

- **[git]:** Version control history that RStudio surfaces with branch, directory and file filters and a red/green diff to inspect changes between states before and after a commit.
- **[github]:** Remote host where a pull request is submitted and where the rendered output of the contributed file can be browsed directly, including viewing the active file on GitHub from RStudio via the dedicated icon.
- **[rstudio]:** IDE whose Git pane provides a History view filterable by branch and by directory or single file, plus View file on GitHub for the active document.
- **[github-document]:** R Markdown output format (`github_document`) that knits `.Rmd` to `.md` so GitHub renders it as a web page; the `.Rmd` alone is source without output while the `.md` is the render the reviewer should use, avoiding storing raw `.html` which GitHub shows only as source.
- **[history-filtering]:** Technique of narrowing the project log to commits that touch only a selected branch, directory or file, useful when the full history is too broad.
- **[pull-requests]:** Workflow where changes to a file that produces an `.md` are submitted as a pull request, and reviewers examine the rendered `.md` on GitHub.

## Code Snippets & Formulas

No verbatim blocks in the transcript; the demo is UI-driven. The format and file concepts referenced are:

```r
# "with the github document armada file that produces an md file as a product" → R Markdown github_document ← github document
# YAML header: output: github_document
# Source: file.Rmd  → knit → file.md (rendered on GitHub as HTML)
# "if you do ... it won't show anything useful it will just show the source code of the html and not the render" — storing raw .html not useful

# History filtering in RStudio Git pane:
# History → Branch selector → Directory filter ("co2 setup") → File filter ("readme")
# Diff view: before (red) / after (green)
```
