---
type: source
title: "wtf: Installing R packages (part 1)"
source_file: "XG8DetPZP4c_wtf-installing-r-packages-part-1.md"
video_id: "XG8DetPZP4c"
url: "https://www.youtube.com/watch?v=XG8DetPZP4c"
lang: en
tags: ["ds-incubator", "r-packages", "docker", "cran", "github"]
key_topics: ["install-packages", "libpaths", "repos", "r-profile", "r-package-libraries"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=XG8DetPZP4c"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 84
    last_modified: "2022-03-15T00:00:00Z"
usage_window: { from: "2022-03-15T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# wtf: Installing R packages (part 1)

## Summary

Part 1 of the WTF series (What They Forgot to teach you about R — personal R administration) clarifies where R packages come from and where they go, drawing on the book and on troubleshooting experience within 2degrees. The focus is the three key arguments of `install.packages()`: `pkgs` (which packages), `lib` (where inside your computer packages are installed), and `repos` (where online to fetch from).

Live in RStudio — both locally and inside a Docker-provided RStudio environment for reproducibility — the speaker shows `?install.packages` help, explains `.libPaths()` ("dot leave path" / "leave path") returning the ordered library locations where the first element is the default install target, and demonstrates that a library is simply a directory containing one subdirectory per package (e.g., `dplyr`, `DT`) each with a `DESCRIPTION` file, inspectable via file explorer or `browseURL(.libPaths()[1])`. The install message "Installing packages into ..." and "trying URL ..." is mapped back to `lib` and `repos`, and the default `repos` of `https://cloud.r-project.org` (the CRAN mirror reached by googling "cran") is shown to be reproducible with explicit `repos` and `lib` arguments.

The second half covers alternative repositories: RStudio Package Manager (`packagemanager.rstudio.com`) for faster binary installs on Linux and for freezing to a snapshot date for reproducibility. The `options(repos = ...)` line to be placed in `.Rprofile` (edited via `usethis::edit_r_profile()`, user-level or project-level) is copied from the site, pasted, saved with a trailing newline, and R restarted; `options("repos")` then confirms the new default persists. An extended Q&A clarifies that `lib` can be set per `install.packages()` call or persistently via `.Rprofile`/`.libPaths`, and outlines a temporary-library pattern for testing packages without touching the system — to be detailed in part 2.

The talk closes with installing from GitHub: public packages via `devtools::install_github("2DegreesInvesting/r2dii.data")`, and the failure mode for private repos without a configured GitHub token — an authentication error (sometimes shown as "unknown package") — which `gh_token_help()` and its companion functions help create locally and on GitHub. A corrupt library (one broken subdirectory can block other packages) is noted as a common happiness issue remedied by understanding library locations.

## Key Concepts & Tools Taught

- **[install-packages]:** `install.packages()` and its three controlling arguments — `pkgs` (what to install), `lib` (destination directory on disk), `repos` (source URL). Help accessed with `?install.packages` and tab completion.
- **[libpaths]:** `.libPaths()` ("dot leave path" → .libPaths) returning the ordered set of library directories; the first element is the default `lib`. Location confirmed with `.libPaths()[1]` and `browseURL()`.
- **[r-package-libraries]:** Library as a folder of package subfolders (`dplyr`, `DT`, etc.) each containing `DESCRIPTION` and other files; corruption of one subfolder can break usage of other packages.
- **[repos]:** Repository URL argument; default `https://cloud.r-project.org` for CRAN. Install messages "Installing packages into ..." (lib) and "trying URL ..." (repos) echo the two arguments. Controlled persistently with `options(repos = "https://...")`.
- **[r-profile]:** Startup file `.Rprofile` (edited with `usethis::edit_r_profile()`, "edit our profile" → edit_r_profile) for setting `options(repos)` persistently at project or user level; requires R restart to take effect, verified with `options("repos")`.
- **[cran]:** The Comprehensive R Archive Network; contrasted with RStudio Package Manager binaries and date-frozen repositories for speed and reproducibility.
- **[docker]:** Use of a Docker container to provide an isolated RStudio environment so the demo is reproducible without affecting the host machine.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```r
?install.packages  # "question mark" help — retrieve help file; tab completion for function name
install.packages("r2dii.data")  # "install dot packages" ← install.packages — uses default lib and repos

.libPaths()        # "dot leave path" / "leave path" ← libPaths — returns library directories
.libPaths()[1]     # first element is default lib
browseURL(.libPaths()[1])  # "browse url" ← browseURL — open library folder in file explorer

# Explicit defaults equivalent to the bare call
install.packages("r2dii.data", lib = .libPaths()[1], repos = "https://cloud.r-project.org")
# "repos is simply a url ... https cloud.rproject.org" — default CRAN mirror

options(repos = c(CRAN = "https://packagemanager.rstudio.com/..."))  # from RStudio Package Manager page; "outside r studio" snippet
usethis::edit_r_profile()   # "edit our profile" ← edit_r_profile — open .Rprofile; scope = "user" or "project"
options("repos")            # retrieve current repos after restart

# GitHub installs
devtools::install_github("2DegreesInvesting/r2dii.data")  # "install underscore github from the package devtools" — public repo
devtools::install_github("2DegreesInvesting/private.repo") # expected failure without token/permissions — "unknown package" / permission error
gh_token_help()  # "gh token help" ← gh_token_help — guides creating and storing GitHub token (creds)
```
