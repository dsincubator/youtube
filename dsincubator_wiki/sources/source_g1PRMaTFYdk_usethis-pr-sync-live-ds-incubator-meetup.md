---
type: source
title: "`usethis::pr_sync()` (live ds-incubator meetup)"
source_file: "g1PRMaTFYdk_usethis-pr-sync-live-ds-incubator-meetup.md"
video_id: "g1PRMaTFYdk"
url: "https://www.youtube.com/watch?v=g1PRMaTFYdk"
lang: en
tags: ["ds-incubator", "terminal", "pull-requests", "github", "git"]
key_topics: ["pr-sync", "usethis-helpers", "git-fork-workflow", "merge-conflicts", "pr-push", "pr-finish"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=g1PRMaTFYdk"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 7
    last_modified: "2019-11-06T00:00:00Z"
usage_window: { from: "2019-11-06T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# `usethis::pr_sync()` (live ds-incubator meetup)

## Summary

This live DS Incubator session deep-dives the "PR health" situation of syncing a pull request — extending the previous meetup's happy-path PR helpers — and answers the prompted question of how contributors handle a conflict that appears after the PR was opened because the source base branch advanced. The presenter explicitly shows both `usethis` helpers and their plain-terminal equivalents side-by-side, arguing helpers save brain for more useful work but both paths are valid.

The demo uses the `usethis` package. It opens with `library(usethis)` (caption "you would need to do is to color code cranly function library use this" ← `library(usethis)`). Wiring is created with `usethis::create_from_github("org/ABC", fork = TRUE)` (caption "create a fort first from the source repository into your user account and then create a clone locally you can do all of that with the function create from github ... takes us first argument the name of the organization and then the name of the repo with the syntax so owner slash rebel" ← `create_from_github`, `fork=TRUE` needed because presenter has push rights to the demo repo). The helper is contrasted with terminal plumbing templated on the slides: `git clone <url>` (caption "then you can open the terminal and do keep clone and then pass the URL to the git repository" ← `git clone`), `git remote add upstream <url>` (caption "it does for example it adds a remote which is basically a nickname ... you have to run git remote and upstream which is the nickname for the remote repository" ← `git remote add upstream`), `git pull upstream master` (caption "you pull what it does is first fetches like the metadata ... and then does an automatic merge ... if you we are now standing on master then git pull up stream master ... will synchronize your local master with the upstream master" ← `git pull upstream master`), and `git branch --set-upstream-to=upstream/master` (caption "you can do git branch set upstream to upstream master so if you're standing on master the upstream of this local branch is going to be the one you pass here" ← `git branch --set-upstream-to`). Diagnostics use `usethis::git_sitrep()` ("get sitrep secret stands for situation report" ← `git_sitrep`) whose relevant tail shows `origin` → `mauro/ABC` (fork) and `upstream` → `an org/ABC` (source).

The contributor flow is then exercised end-to-end. `usethis::pr_init("PR")` ("contributor would initiate a pull request with ... pr in it and the name of the PRS a purely need PR" ← `pr_init`) creates wiring and reminds to run `pr_push` when ready. The contributor edits `README` line 3 to "a Red Bull for demo" (caption "writes a line here in line 3 that says a Red Bull for demo that is to edit the readme file" ← `README` line 3 edit), saves, and `usethis::pr_push()` pushes the commit to `mauro:PR` and auto-opens a browser to the GitHub PR compare interface `mauro:PR (ABC)` → `org:master (ABC)` (caption "will pop up automatically that function will pop up a URL here ... pull request interface ... basically our commit lives in this branch PR of the rep of ABC in my user account" ← `pr_push`) — green, no conflict. The maintainer then adds the same line differently on `master` (`"a repository for table"` / "a repository for demonstration" variants — caption "contributor on the master branch of the source repository wrote in the exact same line something a little different for example ... a repository for table" ← upstream commit), so the PR that was green turns grey with "This branch has conflicts that must be resolved" and the conflicted file indicator points to `README`.

Locally `usethis::pr_sync()` (caption "locally the contributor can then run the ... function be our sink ... be our sync we'll do a lot of stuff ... synchronizes or it tries to synchronize our local branch ... with the source repository" ← `usethis::pr_sync`) attempts to synchronize the local PR branch with `upstream`, fails with `merge conflict please resolve before continuing` and "automatically pops up one of the files the conflict" showing the classic markers (caption describes `HEAD` vs incoming). Resolution rewrites line 3 to the combined "a repository for demonstration" (caption "basically what we did is ... edited the file to just keep this line a repository for demonstration" ← resolved line), saving and committing (with history now: base `README`, contributor commit, maintainer conflicting commit, merge-resolution commit — caption "we have just solved that conflict ... we moved great it was called emerged coming ok problem" ← merge-resolution commit). The fix is pushed with `usethis::pr_push()` ("we are ready to push we can run the function peer push and I will send that ... solving commit back to github" ← `pr_push`) or terminal `git push`, flipping the PR back to green "This branch has no conflicts with the base branch". The maintainer merges (presenter likes `squash merge` — caption "I like doing squash emerge because that kind of cleans the messy history of conflicting clicks and instead of having a bunch of comments ... we have just a single nice comment" ← `squash merge`) into `upstream master`. Cleanup is `usethis::pr_finish()` ("PR underscore finish ... will switch us back to master then it will pull the changes that were merged into the source repo from upstream master ... and then it's going to delete the PR branch" ← `pr_finish`), leaving the contributor ready for the next PR.

## Key Concepts & Tools Taught

- **[pr-sync]:** Helper that synchronizes the local PR branch with the upstream source branch (caption "tries to synchronize our local branch which is for a clone of our fork of the source repository it tries to synchronize that local branch with the source repository" ← `usethis::pr_sync`); fails with `merge conflict please resolve before continuing` and pops the conflicted file, requiring manual edit before pushing again.
- **[usethis-helpers]:** One-call wrappers that reduce error-prone terminal repetition: `library(usethis)`, `usethis::create_from_github("org/ABC", fork=TRUE)`, `usethis::git_sitrep()`, `usethis::pr_init()`, `usethis::pr_push()`, `usethis::pr_sync()`, `usethis::pr_finish()` — each doing many git steps (caption "if you can use your brain for something more useful than ... doing repetitive repetitive tasks that are error-prone then fine").
- **[git-fork-workflow]:** Full forking plumbing shown both as helper and as terminal template: fork → `git clone`, `git remote add upstream <url>`, `git pull upstream master` (fetch + merge), `git branch --set-upstream-to=upstream/master` to track local `master` against upstream — with `origin` = fork (`mauro/ABC`) and `upstream` = source (`an org/ABC`) as seen in `git_sitrep`.
- **[merge-conflicts]:** Produced when contributor and maintainer edit the same line of `README` (`a Red Bull for demo` vs `a repository for table/demo`), visible on GitHub as green → grey ("grey color and hatch situation" ← conflict state) with marker syntax (`<<<<<<< HEAD` / branch PR vs incoming upstream) that must be manually resolved to "a repository for demonstration" before merge.
- **[pr-push]:** Pushing the PR branch to the fork and auto-opening the browser compare URL for creation or for updating after a conflict fix (caption "that will pop up automatically ... will pop up a URL ... pull request interface ... our commit lives in this branch PR" ← `pr_push`).
- **[pr-finish]:** Tear-down after merge that switches back to `master`, pulls the newly merged upstream changes (`git pull upstream master` equivalent), and deletes the now-unneeded PR branch (caption "then it will pull the changes that were merged into the source repo from upstream master ... and then it's going to delete the PR branch because we no longer need it" ← `pr_finish`).

## Code Snippets & Formulas

Caption-mangled, normalized here (quote-to-name):

```r
library(usethis)                                    # "you would need to do is to color code cranly function library use this" ← library(usethis)
usethis::create_from_github("org/ABC", fork = TRUE) # "create a fort first from the source repository into your user account and then create a clone locally ... with the function create from github ... owner slash rebel ... fork equals true to force the creation of that fork" ← create_from_github
usethis::git_sitrep()                               # "get sitrep secret stands for situation report ... basically this is showing that we have a remote address with a nickname origin that is pointing to more elaborate ABC ... and is a second connection ... upstream ... pointing to the repository ABC but in the unborn organization" ← git_sitrep
usethis::pr_init("PR")                              # "contributor would initiate a pull request with ... pr in it and the name of the PRS a purely need PR ... that will create a lot of wiring for us and then we're ready to work" ← pr_init
# edit README.md line 3: "a Red Bull for demo"
# git commit -m "..."
usethis::pr_push()                                  # "the contributor locally would write that line they save the file and then run PR push ... that will do a bunch of things again ... will pop up automatically that function will pop up a URL" ← pr_push — PR mly:PR → org:master green no conflict
# maintainer commits same line on master: "a repository for table" (conflicting)
# GitHub PR turns grey: "This branch has conflicts that must be resolved"
usethis::pr_sync()                                  # "the contributor can then run the ... function be our sink ... be our sync we'll do a lot of stuff ... synchronizes ... our local branch ... with the source repository ... here it failed and shows an error that says merge conflict please resolve before continuing" ← pr_sync
# error: merge conflict please resolve before continuing
# conflicted README popped with markers: HEAD (a Red Bull for demo) vs upstream (a repository for table)
# resolve: edit line 3 → "a repository for demonstration", save
# git add README && git commit -m "resolve conflict"
usethis::pr_push()                                  # "we are ready to push we can run the function peer push and I will send that solving commit back to github" ← pr_push again — PR turns green "has no conflicts"
# maintainer merges: "I like doing squash emerge because that kind of cleans the messy history" ← squash merge
usethis::pr_finish()                                # "we can just run the function PR underscore finish ... will switch us back to master then it will pull the changes that were merged into the source repo from upstream master ... and then it's going to delete the PR branch" ← pr_finish

# Terminal equivalents shown on slides for those preferring plain git:
# git clone <url>                                   # "then you can open the terminal and do keep clone and then pass the URL" ← git clone
# git remote add upstream <url>                     # "it does for example it adds a remote ... you have to run git remote and upstream" ← git remote add upstream
# git pull upstream master                          # "you pull ... fetches like the metadata and then does an automatic merge ... git pull up stream master ... synchronize your local master with the upstream master" ← git pull upstream master
# git branch --set-upstream-to=upstream/master      # "you can do git branch set upstream to upstream master ... the upstream of this local branch is going to be ..." ← --set-upstream-to
```
