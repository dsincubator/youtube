---
type: source
title: "RStudio Team: Demo and discussion"
source_file: "F7JiD7oT4P8_rstudio-team-demo-and-discussion.md"
video_id: "F7JiD7oT4P8"
url: "https://www.youtube.com/watch?v=F7JiD7oT4P8"
lang: en
tags: ["ds-incubator", "github", "shiny", "git", "cloud"]
key_topics: ["rstudio-team", "rstudio-connect", "package-manager", "shiny", "git-integration"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=F7JiD7oT4P8"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2020-06-16T00:00:00Z"
    usage_count: 709
usage_window: { from: "2020-06-16T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# RStudio Team: Demo and discussion

## Summary

Demo and Q&A of the RStudio Team product suite, presented as the enterprise complement to the free IDE and packages. The speaker frames three integrated products: RStudio Server Pro (now Posit Workbench) as the development environment, RStudio Connect as the publishing platform, and RStudio Package Manager as an internal CRAN-like repository with curated and binary packages. The workflow shown is create in the IDE and publish to Connect with a single click, with dependencies, external files and R versions automatically bundled and recreated on the server.

The session walks through Server Pro's familiar IDE experience, multi-R-version and multi-session support, JupyterLab/Jupyter Notebook sessions under the same infrastructure, and scaling choices including Kubernetes pods and images versus a single cloud instance. Connect features covered include one-click publishing of a Shiny app, R Markdown, Jupyter notebooks and bookdown/blogdown content, access-rights and URL management, authentication integration that respects user ids and groups, parameterized R Markdown re-run by end users, and scheduling with email notification on completion or conditional logic. Package Manager is shown as a CRAN mirror or approved-subset repository, with time-travel via a dated URL to reproduce a past package environment, system prerequisite hints, and pre-built binaries for faster installs.

Discussion clarifies scaling limits (self-hosted, no vendor RAM ceiling; scale by server size), file persistence and the recommended collaboration model via Git rather than shared dropbox, Git integration from Server Pro (same as local IDE, unlike RStudio Cloud limitations with SSH/2FA), publishing to Connect directly from a GitHub repository with push-triggered updates, and the scope of time-travel as package-environment only, not code history, so a snapshot tool like renv or packrat is still needed alongside Package Manager.

## Key Concepts & Tools Taught

- **[rstudio-team]:** the commercial stack of three products working together — Server Pro, Connect, Package Manager — for development, publishing and package distribution.
- **[rstudio-connect]:** publishing platform where content created in Server Pro (Shiny, R Markdown, Jupyter, bookdown) lives after clicking publish, with automatic dependency bundling, viewer/collaborator permissions, custom URLs and dashboard discovery filtered by access rights.
- **[package-manager]:** internal repository for R packages (CRAN mirror or curated subset) providing binaries, system prerequisite metadata and version control via time-travel URLs.
- **[shiny]:** example data product published from the IDE to Connect; runtime controls and sharing via URL illustrate the end-user experience without requiring R.
- **[git-integration]:** Git push/pull from Server Pro works like the local IDE; Connect can also publish directly from a GitHub repository URL and auto-update on pushes, with Pro support for troubleshooting.

## Code Snippets & Formulas

No verbatim code blocks dictated; product interactions described and shown in the UI (mangled caption fragments normalized here):

```r
# RStudio Server Pro — session choice
# "you can actually open a jupyter lab or jupyter notebook session under this rstudio server pro infrastructure" — jupyter lab ← jupyter lab

# Publishing to Connect — one click bundles dependencies
# "all i'm doing is clicking publish and publishing to rstudio connect" — publish button ← clicking publish
# "everything this code depends on ... all of that is automatically bundled for you" — bundled dependencies

# Connect URL and permissions
# "i can alter the url so this url that connect kind of automatically assigns is not very descriptive" — alter url ← alter the url

# Package Manager — time travel
# "we have this idea of time traveling so say i have a script that i created six months ago ... go back and recall this time traveling back to a date where i know that this ... plug this url into my ide" — time traveling ← time traveling
# install.packages via dated repo URL (spoken as "plug this url into my ide") — no literal URL dictated; pattern is repo URL with date

# Git from Server Pro vs Cloud
# "the integration with git and the ability to push and pull with our studio server pro is exactly like you would have with the local ide" — push and pull ← push and pull
# "you can actually publish to connect directly from a github repository ... put that repository url here and then connect is going to scan github for pushes" — publish from git ← publish from git

# Scheduling parameterized reports
# "since this is our markdown i can actually put this on a schedule ... every day every week every month ... have an email sent out" — schedule ← put this on a schedule
```
