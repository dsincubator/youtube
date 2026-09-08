---
type: source
title: "Creating an empty R package up to the best standards"
source_file: "AFuVF0oWFMY_creating-an-empty-r-package-up-to-the-best-standards.md"
video_id: "AFuVF0oWFMY"
url: "https://www.youtube.com/watch?v=AFuVF0oWFMY"
lang: en
tags: ["ds-incubator", "github", "r-packages", "workflow", "github-issues"]
key_topics: ["r-packages", "usethis-workflow", "package-setup", "github-workflow"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=AFuVF0oWFMY"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 126
    last_modified: "2024-07-16T00:00:00Z"
usage_window: { from: "2024-07-16T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Creating an empty R package up to the best standards

## Summary

The speaker creates a minimal R package called `tiltPolish` (caption `til polish`) demonstrating a best-practice setup from scratch. Starting from a `~/Git` folder, he calls `usethis::create_package("tiltPolish")` (already auto-loaded via `.Rprofile` with `library(usethis)` on line 3 using `usethis:::` shorthand) and optionally `usethis::use_rstudio()` to add the `.Rproj` file. He then runs `R CMD check`, adds a license with `usethis::use_mit_license()` but switches to `GPL-3` for this family, and initializes Git with `usethis::use_git()`, producing a clean check before an initial commit `initialize empty package` with fledge's `-m` conventional commit hint to populate the changelog, followed by `fledge::bump_version()`.

The GitHub remote is created with `gh repo create` using `gh` CLI (specifying `--public` and the organization rather than the user account) and pushed. Documentation foundations are scaffolded rapidly: `usethis::use_readme_rmd()` (prepopulated goal `polish til data`), rendering with `pak::local_install()` to resolve dependencies, adding GitHub links with `usethis::use_github_links()`, setting up a site with `usethis::use_pkgdown()` (defaults push the pkgdown workflow), `usethis::use_tidy_description()`, `usethis::use_package_doc()` for package-level docs, and `usethis::use_testthat()` plus `usethis::use_mit_license()` infrastructure, each step committed and pushed to `main` for speed (noting ideally pushes to main would be blocked). The first function `summarize_range` (later `summarize_til_range`) and its test are scaffolded with `usethis::use_r("summarize_range")` and `usethis::use_test()` using `skip("TODO")`/`stop` as a placeholder so `R CMD check` shows a reminder. Further housekeeping includes `usethis::use_code_of_conduct(contact = "gmail")` and handling of GitHub Actions via `usethis::use_github_action("check-standard")` on a branch `add-CI`, re-rendering README to expose the check badge, opening a PR that closes issue `#1` via `Closes #1` auto-expanding to the issue title, merging with `gh pr merge --squash --delete-branch`, and demonstrating version lifecycle with `fledge::bump_version()` / `fledge::finalize_version()` and the site deployment workflow. A Dockerized RStudio (`docker ps` container `r 4.4.0` vs `4.4.1`) and `rig` (`rig run`, `rig available`, `R next`, `R devel`) are shown for isolating the system and switching R versions cleanly.

## Key Concepts & Tools Taught

- **[R packages / r-packages]:** What defines a package (`DESCRIPTION` + `R/` + `man`); creating an empty package with `usethis::create_package()` and scaffolding subsequent infrastructure.
- **[usethis workflow / usethis-workflow]:** Helpers `use_rstudio()`, `use_mit_license()` / GPL-3, `use_git()`, `use_readme_rmd()`, `use_github_links()`, `use_pkgdown()`, `use_tidy_description()`, `use_package_doc()`, `use_testthat()`, `use_r()` / `use_test()`, `use_code_of_conduct()`, `use_github_action()`, all via `usethis::` (often shortened to `use this includes a function called use r`).
- **[package setup / package-setup]:** `R CMD check` loop (clean after license and `use_git`), `pak::local_install()` for dependencies, handling `DESCRIPTION` changes, and re-rendering README.
- **[GitHub workflow / github-workflow]:** `gh repo create --public --source .` for the `tiltPolish` repo in the work organization, `git push`, branch `add-CI` for Actions, `gh pr view`/`gh pr merge --squash` with branch deletion, and `Closes #1` linking to the setup issue.
- **[testing scaffold]:** `use_r("summarize_range")` creates `R/summarize_range.R` and `use_test()` creates `tests/testthat/test-summarize_range.R`; using `skip("TODO")` (caption `skip a skip with f too` / `skip with f`) as an intentional reminder that shows as TODO while tests still pass.
- **[documentation and site]:** `use_pkgdown()` adds pkgdown site infrastructure visible at the package URL; `use_tidy_description()` cleans `DESCRIPTION`; package-level doc via `use_package_doc()`.
- **[CI and versioning]:** `use_github_action("check-standard")` adds `R-CMD-check.yaml`; `fledge::bump_version()` and `finalize_version()` automate NEWS/changelog and `DESCRIPTION` version bumping.
- **[isolation tools]:** Docker (`docker ps` container `r 4.4.0`) for a lightweight replaceable RStudio engine, and `rig` (`rig run r-next`, `rig available`, alternative `R 4.5 devel`) for switching R versions.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```r
usethis::create_package("tiltPolish")  # "direct directly create package and I'm going to be calling it tilt uh polish" (caption "til polish")
usethis::use_rstudio()                 # "use our studio uh we'll simply add this little dot uh Aro file" → .Rproj
edit_r_profile()                       # "I can show you edit R profile uh you can see that I already have used this use here right in line three"
# R CMD check                          # "if I start running rcmd check we can check it from here" — missing license warning
usethis::use_mit_license()             # "use the MIT" — actually uses GPL-3: "in this family of repos we are using a gpl3 license"
usethis::use_gpl3_license()            # normalized for the GPL-3 choice
usethis::use_git()                     # "we need to do a git uh in it or we could use use this also it has a function called use git"
git add . ; git commit -m "initialize empty package"  # "ready to add everything to my station area and create a commit something like initialize empty package" (caption "station area")
fledge::bump_version()                 # "if you're using fledge which I love ... you can do a little asies got a little minus here to indicate that you want to add this commit message to the change log ... FL uh bump version"
gh repo create --source . --public     # "GH the GH CLI so GH repo create let's do the source that we have here and let's push this on a public repo" — with org flag for work account
usethis::use_readme_rmd()              # "Ry rmd and uh that should pop up that rify" → use_readme_rmd() → README.Rmd with "polish til data" goal
pak::local_install()                   # "with pack you could do local install to install that package" — installs package + deps to render README
usethis::use_github_links()            # "add the GitHub links so we're going to be simply copy and pasting"
usethis::use_pkgdown()                 # "use package down of course you know the website is super useful ... infrastructure has been added"
usethis::use_tidy_description()        # "we want to probably tidy description ... it did change something ... tidy we tidy description"
usethis::use_package_doc()             # "add package level doc ... good place to add what kinds of functions you're going to be importing"
usethis::use_testthat()                # "we're going to be testing our package of course so we need to use test that ... infrastructure ... suggesting test that and using test that edition three"
usethis::use_r("summarize_range")      # "whenever you want to create a new function this one is going to be C called summarize range ... he created this R file which lives in my R directory"
usethis::use_test("summarize_range")   # "when I do use use test which is probably the first file I'm going to be working on ... I'm going to do a skip a skip with f ... skip just going to show you what it looks like"
skip("TODO")                           # "if I now run my tests for this package then the test will pass ... but also you will see this to do right" — TODO reminder
usethis::use_code_of_conduct(contact = "maurolepore@gmail.com")  # "code of conduct requires details in the first argument so here we can say gmail"
usethis::use_github_action("check-standard")  # "R CMD check on GH actions ... add CI so R CMD check on GH actions"
gh pr create --fill --web              # "PR view on have on the website ... close number one ... pound then the issue is going to be expanded so I'm going to say close number one"
gh pr merge --squash --delete-branch  # "I like to squash my PRS and also delete the branch on GitHub"
fledge::bump_version(); fledge::finalize_version()  # "flet bump version ... fledge finalized version so if you do push through ..."
docker ps                              # "Docker um PS and if I show you my running containers and you can see that there is this container called R 4.4.0"
rig list ; rig run --version devel     # "rig um available ... R runel ... R devel ... rig run ... R next I think and there you go so this could be version 4.4.1"
```
