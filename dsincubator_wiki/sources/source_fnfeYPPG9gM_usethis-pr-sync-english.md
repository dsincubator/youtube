---
type: source
title: "`usethis::pr_sync( )` (English)"
source_file: "fnfeYPPG9gM_usethis-pr-sync-english.md"
video_id: "fnfeYPPG9gM"
url: "https://www.youtube.com/watch?v=fnfeYPPG9gM"
lang: en
tags: ["ds-incubator", "pull-requests", "github", "usethis", "r-packages"]
key_topics: ["pr-sync", "usethis", "pull-request-conflicts", "create-from-github", "pr-push", "pr-finish"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=fnfeYPPG9gM"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 8
    last_modified: "2019-11-04T00:00:00Z"
usage_window: { from: "2019-11-04T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# `usethis::pr_sync( )` (English)

## Summary

This short English screencast teaches `usethis::pr_sync()` as the fix for a common pull-request conflict scenario: a contributor's PR is open, the maintainer pushes a new commit to the source repository's base branch, and the PR now conflicts — here specifically on `README.MD` line 3. The presenter emphasizes the RStudio workflow and that terminal equivalents exist but are more verbose and error-prone.

Setup uses `library(usethis)` and `usethis::create_from_github("org/ABC", fork = TRUE)` (caption "function create from github also from the use of this package ... first and more important argument is a composition of the name of the organization ... slash the name of the repo ... example ABC ... fork equals throw" ← `usethis::create_from_github`, `fork=TRUE`). The function forks the source (`an org/ABC`) into the contributor's account (`mauro/ABC`), clones it locally, and shows the terminal equivalent as a multi-step template. Status is checked with `usethis::git_sitrep()` (caption "get a get situation report get sitrep ... shows the github pull requests redness" ← `git_sitrep`), displaying `origin` pointing to `mauro/ABC` (the fork) and `upstream` pointing to `an org/ABC` (the source). A PR is initiated with `usethis::pr_init()` ("PR in it"), which wires the branch and reminds to use `pr_push` when ready. The contributor edits `README.MD` line 3 to add "a new line ... and wrap off for demo" (caption "add a new line in line number 3 of the file read me dot MD with a string and wrap off for demo" ← `README.MD` edit), commits, and pushes with `usethis::pr_push()` ("PR Koosh" / "Pierre Bush" ← `usethis::pr_push`), which pushes the commit to the fork's `PR` branch and opens a browser to the GitHub compare view: `mauro:PR (ABC)` proposed into `org:master (ABC)` — green, ready to merge.

The conflict is then simulated: before merging, the maintainer commits the same line of `README` differently, so the PR that was green becomes conflicted on `README`. Locally the contributor runs `usethis::pr_sync()` (caption "locally we can run as contributors we can run the function PR sync and that will do a bunch of work as well ... it's gonna bring the changes from the upstream remote and ... try to merge them" ← `usethis::pr_sync`), which attempts to bring upstream changes into the local PR branch. It fails with `merge conflict please resolve before continuing` and automatically pops `README.MD` showing the conflict. The chosen resolution rewrites line 3 to a combined string "every post three for demonstration" plus marker comments (`C` from contributor, `M` from maintainer) explained in the demo, showing one commit by the contributor and one by the maintainer on the same line before the merge commit solving it. After saving, the contributor commits the resolution and pushes it back with `usethis::pr_push()` (caption "we now push that comment that solves the conflict back to our fork we can do that with the function Pierre Bush" ← `pr_push`), at which point the GitHub PR changes from "in conflict" / "branch has conflicts" to "has no conflict" / "no more country with a base branch" and becomes green again, mergeable (maintainer may choose a squash merge to summarize messy fixing commits into one clean commit — caption "may choose to not only do a simple marriage battle but to squash merge ... summarize the whole history ... in just one nice clean comment" ← `squash merge`). Work is closed with `usethis::pr_finish()` ("PR finish" ← `usethis::pr_finish`) which tears down the PR wiring and returns to `master` for the next contribution.

## Key Concepts & Tools Taught

- **[pr-sync]:** The helper that synchronizes a local PR branch with the upstream source — it fetches upstream and attempts a merge (caption "it's gonna bring the changes from the upstream remote and you know try to merge them ... with the repo stroke that we have locally" ← `usethis::pr_sync`); on conflict it errors `merge conflict please resolve before continuing` and opens the conflicted file for manual resolution.
- **[usethis]:** Package wrapping tedious Git/GitHub plumbing: `library(usethis)`, `create_from_github`, `git_sitrep`, `pr_init`, `pr_push`, `pr_sync`, `pr_finish` — each doing many terminal steps in one call and reducing error.
- **[pull-request-conflicts]:** Scenario where a PR conflicts because the base branch advanced on the same line (here `README.MD` line 3), visible on GitHub as grey "has conflicts" versus green "no conflicts" and requiring a merge-commit resolution before merge.
- **[create-from-github]:** One-call setup `usethis::create_from_github("org/ABC", fork = TRUE)` (caption "function create from github ... will first fork the source repository into ... our user account then we will create a local copy ... doing this from our studio" ← `create_from_github`) that forks, clones, and shows terminal template for those preferring plain git.
- **[pr-push]:** Pushing the PR branch to the fork and opening the GitHub compare/PR creation page (caption "I've run the function PR Koosh which again does a lot of work for us and including sending us to a web browser pointing to this particular address ... compare ... comitia have just pushed here living in the branch BR from the repository ABC" ← `usethis::pr_push`), used both for initial PR and for pushing the conflict-resolution commit.
- **[pr-finish]:** Cleanup helper that closes PR wiring and returns to `master`/`main` (caption "we can just run the function PR finish which will kind of close all the wiring that was created to work with this pull request and ... send us back to the master branch for our next request" ← `usethis::pr_finish`).

## Code Snippets & Formulas

Caption-mangled, normalized here (quote-to-name):

```r
library(usethis)                                    # "we usually do that with the function library use this" ← library(usethis)
usethis::create_from_github("org/ABC", fork = TRUE) # "function create from github also from the use of this package ... first ... argument ... name of the organization ... slash the name of the repo ... example ABC ... fork equals throw" ← create_from_github
usethis::git_sitrep()                               # "get a get situation report get sitrep ... where it shows the github pull requests redness ... there is a remote connection called origin pointing to my user account ... male brain slash ABC ... upstream ... pointing to the source repository ... an org slash ABC" ← git_sitrep
usethis::pr_init()                                  # "the first thing we would do to initiate a pull request is to run the function PR in it with this we get a lot of work for free" ← pr_init
# edit README.md line 3: add "a new line ... and wrap off for demo"
# git commit -m "add line for demo"
usethis::pr_push()                                  # "then I've run the function PR Koosh which again does a lot of work for us" / "Pierre Bush" ← pr_push — pushes PR branch to origin and opens browser compare BR: ABC → org ABC:master
usethis::pr_sync()                                  # "locally we can run as contributors we can run the function PR sync ... will do a bunch of work ... bring the changes from the upstream remote and ... try to merge them" ← pr_sync — fails on README conflict
# error: "merge conflict please resolve before continuing" ← merge conflict
# file popped: README.MD with conflict markers; resolve line 3 to "every post three for demonstration" (caption "I chose to rewrite the line three with a string every post three for demonstration" ← resolved line)
# git add README.md && git commit -m "resolve conflict"
usethis::pr_push()                                  # "we now push that comment that solves the conflict back to our fork we can do that with the function Pierre Bush" ← pr_push again
# GitHub PR: grey "this branch has conflicts ... must be resolved" → green "has no conflict ... no more country with a base branch"
# maintainer merges (often squash merge — "may choose to ... squash merge ... summarize the whole history ... in just one nice clean comment" ← squash merge)
usethis::pr_finish()                                # "we can just run the function PR finish which will kind of close all the wiring ... and ... send us back to the master branch" ← pr_finish
```
