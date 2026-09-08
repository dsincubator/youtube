---
type: source
title: "Strong-style pair-programming: Submitting an R package to CRAN"
source_file: "BAS8yfLBnog_strong-style-pair-programming-submitting-an-r-package-to-cran.md"
video_id: "BAS8yfLBnog"
url: "https://www.youtube.com/watch?v=BAS8yfLBnog"
lang: en
tags: ["ds-incubator", "github-issues", "r-packages", "cran"]
key_topics: ["strong-style-pair-programming", "cran-submission", "r-cmd-check", "description-file", "cran-comments", "usethis"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=BAS8yfLBnog"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 638
    last_modified: "2020-03-16T00:00:00Z"
usage_window: { from: "2020-03-16T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# Strong-style pair-programming: Submitting an R package to CRAN

## Summary

A maintainer (Mauro) and contributor (Jackson) submit the in-development package `r2dii.data` (described as "art art to the eye data") to CRAN for the first time using strong-style pair programming, where the navigator directs and the driver (Jackson, sharing his screen) executes. The workflow is driven by a checklist opened with `usethis::use_release_issue()`. The pair walks through the checklist against the CRAN Policies: checking that the `DESCRIPTION` Title uses Title Case without a trailing period and that the Description is informative, verifying that every URL in DESCRIPTION/README resolves (404 fails cause rejection), confirming the MIT/open-source license, and preparing `cran-comments.md` (R CMD check results, reverse-dependency notes).

Testing coverage is shown locally with `devtools::check()` ("package step tools with a function check" → `devtools::check(remote = TRUE, manual = TRUE)`), on WinBuilder ("winter middle" → `devtools::check_win_devel()` / submission to the WinBuilder service) and on R-hub ("our hub check for crime" → `rhub::check_for_cran()`) across platforms (Windows Server 2008, Ubuntu Linux `r-devel`, Fedora) and R versions (`R release 3.6.3`, `R-devel`). The development version `0.0.1.9002` is kept until checks pass, then bumped to `0.0.2` with `usethis::use_version()` before submission; the dev suffix `9001/9002` is illegal on CRAN so the extra note is expected and acknowledged but not included in cran-comments.

Documentation is verified with `pkgdown::build_reference()` ("package down has a function called build reference") and inspecting the built `docs/reference` index for missing topics and rendering errors. Git hygiene is demonstrated: `.gitignore`/`use_git_ignore()` for the local `docs/` build folder, `git clean -n -d -f` dry-run then `git clean -d -f`, and moving work to a release branch (`release 0.0.2`). Final steps are `devtools::submit_cran()` ("tip tools to be to cram" → `devtools::submit_cran()`) with email confirmation from CRAN, plus GitHub Actions checks and pruning of `docs/` before committing.

## Key Concepts & Tools Taught

- **[Strong-style pair programming (strong-style-pair-programming)]:** Navigator/ driver split ("today I'm gonna be the navigator and Jackson is gonna be the driver") so a first-time submitter learns by doing; remote variant shares screens (one screen, one keyboard) instead of sitting side-by-side.
- **[CRAN submission (cran-submission)]:** Release workflow governed by the CRAN Policies document ("cran police's" → CRAN Policies) and the "Submission" section; human review on first submission, automatic on later updates if checks are clean; updates limited to about once per month.
- **[DESCRIPTION file (description-file)]:** Title must be in Title Case, no trailing dot; Description must be informative and convincing; all URLs must be valid.
- **[cran-comments.md (cran-comments)]:** File reporting how the package was tested ("first lady" → first section: test environments like Ubuntu + R 3.6.3; win-builder; R-hub), R CMD check results (0 errors/warnings/notes, handling the extra `9001` note), and reverse-dependencies (empty on first submission).
- **[R CMD check (r-cmd-check)]:** Canonical check via `R CMD check --as-cran`; wrappers are `devtools::check()`, `devtools::check_win_devel()` and `rhub::check_for_cran()`. Demonstrated with `devtools::check(remote = TRUE, manual = TRUE)` and assignment trick for polling (`obj <- rhub::check_for_cran()`).
- **[usethis release helpers (usethis)]:** Checklist and versioning helpers from `usethis` — `use_release_issue()` to open the issue template, `use_version()` to bump to `0.0.2`, `use_cran_comments()` to rewrite cran-comments, `use_git_ignore()` to ignore `docs/`.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled → normalized); quotes kept verbatim:

```r
usethis::use_release_issue()  # "use this column column release" / "use release issue" / "use these because maybe I'm using the wrong function youth release issue one folks"
# opens GitHub issue #15 in r2dii.data with checklist (version 0.0.1.9002 → 0.0.2)

usethis::use_version()        # "we could do something like release zero point zero point two" — bumps DESCRIPTION Version to 0.0.2

devtools::check(remote = TRUE, manual = TRUE)  # "run our CMD check via a package step tools with a function check and those parameters are pretty important because for example the remote equals true"
rhub::check_for_cran()        # "run our hub check for crime" / "run that okay so this service is supposed to be used by the maintainer"
# shown with: result <- rhub::check_for_cran(); then polling via object and checking via details section help

devtools::check_win_devel()   # "winter middle and that's a service that crime provides where you submit your package and grant checks it with Windows"
# alternative WinBuilder upload via web: https://win-builder.r-project.org/upload.aspx

pkgdown::build_reference()    # "package down has a function called build reference which is the fastest way which you can create the index"
# then verify colors: docs/reference built locally; inspect for red errors and linked author pages

# git hygiene
git status
git clean -n -d -f            # "do get clean exactly as you did and first do - any to run what's called a dry drive run"
git clean -d -f               # "you've removed the N and that would actually remove"
echo "docs" >> .gitignore     # via usethis::use_git_ignore("docs") — "you can use the function you get familiar with it from the useless packet is use it ignore"

devtools::submit_cran()       # "tip tools to be to cram" / "it's actually uploading the package the comments confirming the submission"
# requires maintainer email confirmation link: "someone has submitted this package to crime I need to confirm by clicking this link"
```
