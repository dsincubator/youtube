---
type: source
title: "Main usethis helpers for GitHub pull requests"
source_file: "CLCn5ZkCbrg_main-usethis-helpers-for-github-pull-requests.md"
video_id: "CLCn5ZkCbrg"
url: "https://www.youtube.com/watch?v=CLCn5ZkCbrg"
lang: en
tags: ["ds-incubator", "pull-requests", "r-packages", "github", "usethis"]
key_topics: ["pull-requests", "usethis", "pr-init", "pr-fetch", "pr-push"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=CLCn5ZkCbrg"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 18
    last_modified: "2019-10-29T00:00:00Z"
usage_window: { from: "2019-10-29T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# Main usethis helpers for GitHub pull requests

## Summary

Walkthrough of the main `usethis` pull-request helpers from its `pr_*` help file ("Eustace package" → `usethis`), emphasizing prerequisites: install `usethis` and create a GitHub personal access token via `usethis::browse_github_token()` → `browse_github_token` ("browse github token" → `browse_github_token`; docs at `usethis` Setup → "github personal target"). The flow is then shown for both roles.

**Contributor — initiate PR:** Fork the upstream repo (e.g. `2DegreesInvesting/ds`/`es`) via GitHub Fork button (owner becomes your account, e.g. "Mallory Libre"), then clone locally via RStudio → New Project → Version Control → Git → paste HTTPS URL. Shortcut `usethis::create_from_github("2DegreesInvesting/ds")` ("created from github and then you will give the name of the owner" → `create_from_github()`) does fork+clone in one step. Inside the local clone, `usethis::pr_init("my-feature")` ("PR in it function so that's what we are gonna do ... takes the name of the branch so something like my feature") creates branch `my-feature`, edits files, commits (e.g. `new file to` with "line by contributor"), and `usethis::pr_push()` pushes to your fork and opens the web "Create new request" page where `my-feature`'s commits travel into upstream `master`.

**Maintainer — fetch and amend:** Seeing PR #8 in the Pull Requests tab, the maintainer clones their own view of upstream, runs `usethis::pr_fetch(8)` ("fetch that good request using the function P R fetch ... have to give it the name the number" → `pr_fetch(8)`) which creates local branch `my-feature-mauro-lepore` (branch name + username suffix). History shows the two contributor commits; the maintainer edits the file (adds "line by de Montaigne"), commits "commit by the maintainer", then `usethis::pr_push()` pushes back to the PR branch. `usethis::pr_view()` ("P of view as a shortcut to just navigate to that PR on github") browses the PR. Merging is "Squash and merge" to collapse three commits into one in `master` with message like "you file to", optionally adding `Closes #...`. Cleanup is `usethis::pr_finish()` (branch removal) for both sides; advanced helpers `pr_sync()`, `pr_pause()`, `pr_resume()` are mentioned but not demoed. Q&A covers continuing work on a PR via the fork while awaiting merge, and branch-vs-fork policy (fork keeps contributor history clean and easy to squash).

## Key Concepts & Tools Taught

- **[Pull requests (pull-requests)]:** Fork → branch → commit → push → PR → fetch → amend → squash-and-merge workflow; GitHub PR numbers (e.g. #8) as identifiers.
- **[usethis PR helpers (usethis)]:** Package `usethis` ("useless packet" → `usethis`) with one-command wrappers that shell out to `git`/`GitHub` for each step, reducing manual error.
- **[pr_init (pr-init)]:** Contributor helper `usethis::pr_init("my-feature")` ("PR in it" / "P R in it") to start a feature branch off `master`; must not commit directly on `master`.
- **[pr_fetch (pr-fetch)]:** Maintainer helper `usethis::pr_fetch(number)` ("P R fetch") to fetch an open PR into a local branch named `<branch>-<username>` for review.
- **[pr_push / pr_view / pr_finish (pr-push)]:** `usethis::pr_push()` to push current PR commits (both roles) and open browser; `usethis::pr_view()` to browse PR; `usethis::pr_finish()` ("we are finished" → `pr_finish()`) to clean up local PR branch; plus `pr_sync()`, `pr_pause()`, `pr_resume()` for advanced syncing.

## Code Snippets & Formulas

Mangled quotes → normalized helpers; all names occur verbatim in transcript:

```r
# setup
install.packages("usethis")
usethis::browse_github_token()        # "includes a function called browse github token so this function if you don't have a token already you can use this function to create one"
# then follow https://usethis.r-lib.org/articles/articles/setup.html#git-github

# contributor: fork+clone shortcut
usethis::create_from_github("2DegreesInvesting/ds", fork = TRUE)  # "you could do what we have we have just done basically don't do it the fork and creating a level clone with a function created from github and then you will give the name of the owner 2 degrees best team"

# contributor: start PR branch
usethis::pr_init("my-feature")        # "if you want to initiate the whole request you use the pr init function ... takes the name of the branch so something like my feature"
# edit file(s): R/new file to → "align contributor" / "a line by contributor"
git commit -m "add file"
git commit -m "second commit"         # history: master → my-feature with 2 commits
usethis::pr_push()                    # "when you're ready to submit your request all you need to do is to run the function P R so let's do that ... PR push and again they use this package is going to be working Allen along with deeds" — pushes my-feature to fork and opens Create PR in upstream

# maintainer: fetch & amend
usethis::pr_fetch(8)                  # "fetch that good request using the function P R fetch ... you have to give it the number of the pull requests that you want to fetch so in this case it's number 8"
# branch now my-feature-mauro-lepore; history shows 2 contributor commits
# edit: add "line by de Montaigne" → git commit -m "commit by the maintainer"
usethis::pr_push()                    # maintainer pushes back to same PR branch
usethis::pr_view()                    # "we could run if we wanted the function P of view as a shortcut to just navigate to that PR on github"

# merge + clean
# GitHub UI: Squash and merge → single commit in master ("although the beer has three commits the history in the master branch we have only one")
usethis::pr_finish()                  # "it will get rid of the branch that was created for this request and do a little a little more cleanup" — contributor and maintainer run after merge
# advanced (mentioned only):
usethis::pr_sync()                    # "that magic is done by the PR sync" — sync upstream changes into PR
usethis::pr_pause(); usethis::pr_resume()  # "go back to you know the master branch and do other things and then you can resume your PR"
```
