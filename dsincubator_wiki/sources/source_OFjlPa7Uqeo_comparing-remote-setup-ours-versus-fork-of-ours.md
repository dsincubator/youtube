---
type: source
title: "Comparing remote setup “Ours” versus \"Fork (of ours)\""
source_file: "OFjlPa7Uqeo_comparing-remote-setup-ours-versus-fork-of-ours.md"
video_id: "OFjlPa7Uqeo"
url: "https://www.youtube.com/watch?v=OFjlPa7Uqeo"
lang: en
tags: ["ds-incubator", "permissions", "pull-requests", "github", "git"]
key_topics: ["ours-vs-fork", "usethis-create-from-github", "git-remotes-tracking", "branch-protection", "permissions-model"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=OFjlPa7Uqeo"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2020-08-25T00:00:00Z"
    usage_count: 101
usage_window: { from: "2020-08-25T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Comparing remote setup “Ours” versus "Fork (of ours)"

## Summary

This meetup compares two GitHub remote setups from *Happy Git with GitHub*: the simpler **Ours** (no fork) versus **Fork (of ours)** / fork-and-clone that the series has generally recommended. Both workflows insist on branches and pull-request review ("you always create a branch and you always submit a pull request and someone should review that request before it's merged"); forking does not mean skipping branches.

Visually, Fork-of-ours has two remotes from the local repo (bottom right): `origin` pointing to the personal fork (`<user>/demo`) and `upstream` pointing to the organization (`2DegreesInvesting/demo`) with push access to both, while Ours has a single `origin` pointing directly to `2DegreesInvesting/demo` and no `upstream`. The distinction is confirmed locally with `usethis::git_sitrep()` ← "function in r that comes from the useless package that is called git c rep" / "git c rep" / "git situation report", which reports "there is no such a remote as upstream" for Ours and shows `origin = 2degrees ... demo` vs. for Fork `origin = <user>` and `upstream = 2degrees ... can push 22 degrees`.

A quick-reference table focuses on `usethis::create_from_github()` ← "function create from github" arguments and tracking. Both setups use `create_from_github(repo, fork = FALSE)` ← "for equal false to get the hours set up" for Ours vs. `fork = TRUE` ← "four equals true ... to get the fork of ours" (both initially captioned as "for equal" / "four equals") to scaffold. In Ours, `master` locally tracks `origin/master` because origin is the only remote; in Fork, local `master` tracks `upstream/master` (not `origin/master`), while a PR branch like `pr-branch` tracks its `origin` counterpart after pushing to the fork before opening a PR to upstream. The speaker notes that daily analyst work is identical after setup — "just changing that argument and ... one setup will be magically happening or the other ... the way you work is very very similar" — and defers the switch mechanics (`git remote` manipulation in R or terminal) to a reference slide.

Safety is covered in two layers. Repository/organization permissions set the base role to `read` ("lowest that you can have which is read ... you can't create harm unless someone changes the permission") so a new invitee cannot push to `master` until explicitly granted; owners, however, "can override pretty much every rule" and the org currently has too many owners. At the branch level, new repos default to an unprotected `master` ("comes with the master branch unprotected meaning that you can basically change the history ... and create a lot of conflicts"), and the recommendation is to protect `master` at least to block force pushes ("protect the master branch at least to avoid forced pushes"). Git's recoverability ("almost anything that you do isn't doable" — captioned, meant undoable — "it's just that it's gonna take someone who knows about git") is emphasized, alongside where to find help. The session closes noting trade-offs and that the choice depends on context, with Alex providing pros/cons and an invitation to test both setups in the upcoming workshop.

## Key Concepts & Tools Taught

- **[ours-vs-fork]:** Two remote topologies — **Ours** (single remote: `origin` → `2DegreesInvesting/demo`, no `upstream`/`app stream`) vs. **Fork (of ours)** (two remotes: `origin` → personal fork, `upstream` → `2DegreesInvesting/demo`, "you could push commits either to your origin ... or to your upstream"), both requiring PR branches; illustrated with the fork diagram and `git_sitrep` output ("exactly this setup so there is one origin there is no upstream ... and i can push to this repository" vs. "i have an origin i have an app stream ... can push 22 degrees").
- **[usethis-create-from-github]:** Scaffolding helper `usethis::create_from_github()` ← "function create from github" with `fork = FALSE` ← "for equal false to get the hours set up" / "for equal false" vs. `fork = TRUE` ← "four equals true ... to get the ... fork of ours" / "four equals true", abstracting remote creation (same analyst experience after setup: "just changing that argument ... magically happening").
- **[git-remotes-tracking]:** Tracking semantics — Ours: local `master` tracks `origin/master` ("master locally tracks the name with the same ... on the origin remote because that's the only one"); Fork: local `master` tracks `upstream/master` not `origin/master`, while PR branch `pr-branch` ← "pr branch" tracks `origin/pr-branch` ("your local branch ... will be tracking ... the only remote ... so there's going to be a corresponding branch on origin" vs. "also going to be tracking your origin because you first push to your fork and then you should beat the request to upstream"); verified via `usethis::git_sitrep()` ← "git c rep" / "git situation report".
- **[branch-protection]:** GitHub branch protection to prevent history rewriting — new repos default to unprotected `master` ("by default ... master branch unprotected meaning that you can ... change the history ... and create a lot of conflicts"), protect `master` "at least to avoid forced pushes" ← "avoid forced pushes" / "force pushes are not allowed" when protected; complements PR review.
- **[permissions-model]:** Organization permission layers — base role `read` for new members ("base role for anyone who joins ... to any new repository ... is the lowest ... read which is the safety measure"), explicit grant needed to `push to master`, many `owners` can "override pretty much every rule" (too many owners is a risk), but Git remains recoverable ("almost anything ... isn't doable ... gonna take someone who knows about git") — know where to get help.

## Code Snippets & Formulas

Spoken commands / calls dictated live (caption-mangled, normalized here):

```r
usethis::git_sitrep()   # "function in r that comes from the useless package that is called git c rep" — "git c rep" / "git situation report"
# Ours output: origin -> 2DegreesInvesting/demo (can push), no upstream ("there is no such a remote as upstream")
# Fork output: origin -> <user>/demo, upstream -> 2DegreesInvesting/demo ("i have an origin i have an app stream ... upstream points to the ... two degrees")

usethis::create_from_github("2DegreesInvesting/demo", fork = FALSE)  # "for equal false to get the hours set up" — Ours (single remote)
usethis::create_from_github("2DegreesInvesting/demo", fork = TRUE)   # "four equals true ... to get the fork of ours" / "four equals true" — Fork (of ours)
```

```sh
# Remotes & tracking (as reported by git_sitrep)
git remote -v
# Ours: origin  https://github.com/2DegreesInvesting/demo.git (fetch/push)
# Fork: origin  https://github.com/<user>/demo.git
#       upstream https://github.com/2DegreesInvesting/demo.git

# Branch tracking examples:
# Ours: local master tracks origin/master
# Fork: local master tracks upstream/master (not origin/master)
git branch -vv                # shows tracking: master -> origin/master  vs  master -> upstream/master
git checkout -b pr-branch     # "pr branch" — "you always create a branch"
git push -u origin pr-branch  # Ours & Fork both track origin/pr-branch for PR branches
# then open PR: Fork: origin/pr-branch -> upstream/master; Ours: origin/pr-branch -> origin/master

# Safety / protection (GitHub Settings -> Branches -> Branch protection rule)
# - Protect master: check "Require pull request reviews before merging" and "Do not allow force pushes"
#   ("protect the master branch at least to avoid forced pushes" / "force pushes are not allowed")
# Organization: set base permission to Read ("base role ... is the lowest ... read")

# Switching setups (reference slide — not typed live):
git remote add upstream https://github.com/2DegreesInvesting/demo.git   # add upstream to move Ours -> Fork
git remote rename origin upstream; git remote add origin https://github.com/<user>/demo.git  # conceptual
# or in R: usethis helpers manage remotes ("how to switch from one setup to the other in r and also in the terminal ... i'm not gonna spend any time on that")
```
