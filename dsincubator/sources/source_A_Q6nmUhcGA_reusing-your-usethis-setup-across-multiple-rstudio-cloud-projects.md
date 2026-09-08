---
type: source
title: "Reusing your usethis setup across multiple rstudio.cloud projects"
source_file: "A_Q6nmUhcGA_reusing-your-usethis-setup-across-multiple-rstudio-cloud-projects.md"
video_id: "A_Q6nmUhcGA"
url: "https://www.youtube.com/watch?v=A_Q6nmUhcGA"
lang: en
tags: ["ds-incubator", "cloud", "github", "git", "pull-requests"]
key_topics: ["rstudio-cloud", "usethis-setup", "github-pat", "fork-and-clone"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=A_Q6nmUhcGA"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 31
    last_modified: "2020-08-11T00:00:00Z"
usage_window: { from: "2020-08-11T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Reusing your usethis setup across multiple rstudio.cloud projects

## Summary

The usual RStudio Cloud model maps one RStudio project to one Cloud project, requiring repeated configuration for each new GitHub workflow. The tutorial hacks this by creating a single Cloud project called `home` that will host many nested RStudio projects inside its home directory, so setup is done once and reused. The configuration makes `usethis` (and via the meta-package `devtools`) available in every interactive session and authenticates the machine to GitHub once.

The step-by-step chain is shown in the `home` project: install `usethis`/`devtools` (now from binaries, fast), run `library(devtools); devtools::use_usethis()`? Actually `devtools::use_dev_tools()` (caption "dev use step tools" / "use the tools") to append code to `.Rprofile` that auto-loads `usethis` helpers every session, then restart R with `Shift+Ctrl+F10`. Check status with `usethis::git_sitrep()` (caption "situation report") showing missing name/email and `GITHUB_PAT`. Set Git identity matching the GitHub account with `usethis::use_git_config(user.name, user.email)` (caption "git giving our name an email"), then verify again. For GitHub auth, run `usethis::browse_github_token()` → `usethis::create_github_token()` (caption "browse github token") opening GitHub PAT settings, generate a token labeled with date/platform (e.g., "2020-08-11 rstudio cloud github path"), copy the one-time password, then store it with `usethis::edit_r_environ()` adding `GITHUB_PAT=...` (caption "edit our environment" then `github equals` and paste, ensuring a trailing newline) and restart the session — double-restarting for safety. After this, `git_sitrep` confirms name/email and token are set.

With the home now configured for the GitHub flow `fork-and-clone` (caption "fork and clone"), the workflow is demonstrated: `usethis::create_from_github("2DegreesInvesting/demo1", destdir = "~/", fork = TRUE)` (caption "create from github a github a git repository that comes from this owner ... destdir which is the home directory ... fork equals true") clones a repo into `~/` using `https` (protocol choice prompt answered with option 2). On reload the Cloud project relocates from the container's `home` placeholder to `~/demo1`, now a Git repo enriched with `.gitignore` and `demo1.Rproj`. To prove the setup, `usethis::pr_init("initialize-rstudio-project")` (caption `pr need my cool or initialize` / `pr we are in it`) creates a branch, commits the two new files, and `usethis::pr_push()` opens the browser on the upstream `2DegreesInvesting/demo1` repo to create the pull request (`~/demo1` → upstream `master`). The pattern is then repeated for a second repo `demo` / `2DegreesInvesting/demoTesting` (caption "2 degrees testing demo") cloned into the same `~/`, showing `~/demo` and `~/demo1` now siblings under `~/`, each inheriting the shared `.Rprofile`/`.Renviron` configuration.

## Key Concepts & Tools Taught

- **[RStudio Cloud / rstudio-cloud]:** RStudio Cloud (caption "rcu cloud", "our studio cloud") project model; creating a `home` host project to break the 1-to-1 mapping and nest many RStudio projects in `~/`.
- **[usethis setup / usethis-setup]:** `usethis` → extracted from `devtools` (now a meta-package exposing `usethis` functions); `use_devtools()`/`use_usethis` helper that writes to `.Rprofile` (`edit_r_profile`) to auto-load helpers in every interactive session, followed by `Shift+Ctrl+F10` restart.
- **[GitHub PAT / github-pat]:** Personal access token workflow: `browse_github_token()` / `create_github_token()` to generate on GitHub, then `edit_r_environ()` with `GITHUB_PAT=` plus newline, restart, verify with `git_sitrep` (initially "no token" cross, after "has been discovered").
- **[git config]:** `usethis::use_git_config(user.name = ..., user.email = ...)` matching the GitHub account email, vs raw `git config --global user.name`.
- **[fork and clone / fork-and-clone]:** `usethis::create_from_github("2DegreesInvesting/demo1", destdir = "~/", fork = TRUE)` for the fork-and-clone GitHub flow (prompt choosing `https` vs `ssh`, recommendation `https` for beginners).
- **[pull requests]:** `usethis::pr_init()` / `pr_branch` to create a feature branch (`initialize-rstudio-project`), then staging `.gitignore`+`.Rproj`, committing, and `pr_push()` to open the upstream PR page (`master` ← `initialize-rstudio-project` fork).
- **[shared home directory]:** The hack that `~/` (the Cloud container's home) becomes the container for all repos (e.g., `~/demo`, `~/demo1`) so they all share the single configuration.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```r
install.packages(c("usethis", "devtools"))  # "use these and devtools ... install packages from from binary so it should work pretty quickly"
library(devtools)                           # "once upon a time devtools was the only package ... then some functions extracted into use this but still the tools makes every functioning use this available ... devtools is itself a package and at the same time a meta package"
devtools::use_devtools()                    # "the function dev use step tools will just make all of the tools available in every interactive session" → append to .Rprofile (caption "use the tools")
# edit .Rprofile: "include the code here inside the our profile so we copy paste ... close file and restart this R with shift ctrl f10"
usethis::git_sitrep()                       # "situation of our configuration ... our configuration is pretty empty ... git doesn't even know our name and email ... situation report" — first report empty
usethis::use_git_config(user.name = "Mauro Lepore", user.email = "maurolepore@gmail.com")  # "set up a git giving our name an email and it is not any email it is the email that is associated to our github account"
usethis::git_sitrep()                       # second report: user.name/email now configured, still no PAT
usethis::browse_github_token()             # "browse github token and that sends us to gingham" → opens GitHub PAT page
usethis::create_github_token()             # "you could give it a name that is descriptive ... 2020-08-11 and our studio cloud github path ... generate token and you're good to go"
usethis::edit_r_environ()                  # "call the function edit our environment so it's gonna be that environment with no argument"
# then in .Renviron:  GITHUB_PAT=<paste>  # "github equals and now we paste the password ... make sure that you end up the file with a new line ... close and restart Shift Ctrl F10 must restart ... doing it twice because it's critical"
usethis::create_from_github("2DegreesInvesting/demo1", destdir = "~/", fork = TRUE)  # "when i create from github a github ... owner the owner two degrees investing and the repository is called demo one and we want to store that repository in a destination directory which is the home directory ... fork equals true ... place that for that clone well here in the home directory"
# prompt: "which of these two protocols ... say two https ... if you don't know just go for number two for https ... if you do have an ssh key then you may go with that"
# after clone: "as you can see our studio cloud is closing that project and reopening in a different location where ... home demo one so now we are at this project that we just forked"
usethis::pr_init("initialize-rstudio-project")  # "we are not gonna work from master ... on the github flow you work with a branch so you do pr we are in it using use this the function pr need"
usethis::pr_push()                         # "use this is telling me that the next thing i can do is run the function pr push and that is gonna create or it's gonna send me to the place where i can create a pull request"
# second example same pattern:
usethis::create_from_github("2DegreesInvesting/demoTesting", destdir = "~/", fork = TRUE)  # "a create from github another repo something like 2 degrees testing demo so this is demo one and i'm gonna do demo ... and i'm gonna put it where in the same place right here at the home and fork equals true"
# verification: listing ~/ shows "demo" and "demo one" siblings
```
