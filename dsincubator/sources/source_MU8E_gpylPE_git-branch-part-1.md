---
type: source
title: "git branch (part 1)"
source_file: "MU8E_gpylPE_git-branch-part-1.md"
video_id: "MU8E_gpylPE"
url: "https://www.youtube.com/watch?v=MU8E_gpylPE"
lang: en
tags: ["ds-incubator", "git", "workflow", "github", "snapshot-testing"]
key_topics: ["git-branch", "merging", "head", "git-tags", "github-workflow"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=MU8E_gpylPE"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 25
    last_modified: "2020-10-27T00:00:00Z"
usage_window: { from: "2020-10-27T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# git branch (part 1)

## Summary

Part 1 of a deep-dive on branching and merging, framed as how a team can work on multiple features in parallel and later combine them onto the main line (conventionally `master`, increasingly renamed to `main`/`trunk` to avoid slavery connotation). Commits are the fundamental unit of change; both branches and tags are pointers to commits, distinguished by mobility: a branch moves forward with each new commit, a tag stays fixed and is ideal for marking release snapshots.

The presenter uses two visual metaphors: a linear chain `M1→M2→M3` with `master` pointing to `M3`, and a central trunk with feature branches depicted as an octopus adding glasses versus a hat. Each feature lives on its own branch as a transparent film layered over the base octopus, so only the change is stored, not a full copy; merging layers yields the combined figure (glasses + hat). Emphasis is placed on always branching off updated `master` (i.e., sync local `master` with remote `master`) to avoid pull requests that inadvertently include already-merged commits, and on communication to reduce merge conflicts where the same file/line is touched on two branches (requiring manual resolution or an explicit flag to prioritize one side).

The branching structure is made tangible via `git log`: plain `git log` is verbose, so the session builds `git log --all --graph --decorate --oneline` to show branches, with an alias `git graph`. `git branch` lists branches and marks the current one with `*` (and colour, depending on config). The SHA is explained as the universally unique identifier of each commit, shown abbreviated in the graph view. `HEAD` is introduced as the keyword for the current commit. Workflow comparison contrasts the simple GitHub workflow (one long-lived `master` + tiny feature branches merged back) with more complex workflows like `dev` → `master` that require careful sequencing and often cause dependent PR chains; rebasing is mentioned as a way to linearize history by cutting and re-stacking branches, but with the caveat that rewriting shared history is unsafe.

Hands-on demonstrates: inspecting history in the `ds-incubator` repo, cleaning the working tree with `git checkout .` (noting its danger), creating a branch `git branch experiment`, checking it out with `git checkout experiment` (or shortcut `git checkout -b experiment` / `git checkout -b toy_branch`), editing `ingredients.txt` to add `cilantro`, staging with `git add ingredients.txt` (also via RStudio), inspecting `git diff`, committing `git commit -m "add cilantro"`, and observing `HEAD` move to the new commit on the new branch. The session ends acknowledging an accidental commit to `toy_branch` as an illustrative mistake.

## Key Concepts & Tools Taught

- **[git-branch]:** A movable pointer to a commit that layers a change (transparent film) over the base project, enabling parallel feature development without copying the whole codebase.
- **[merging]:** Combining feature branches into the main line; merge commits preserve branching structure, while rebase linearizes by rewriting history and should not be used on shared branches; conflicts arise when the same line is edited on both sides and require human resolution.
- **[head]:** Keyword for the current commit/branch (`HEAD` moves when checking out or committing); contrasted with `master` and SHA abbreviations in `git log`.
- **[git-tags]:** Immovable pointers to a specific commit, used to mark release snapshots that can be referred to by a human-friendly name versus a SHA.
- **[github-workflow]:** Simple workflow with one permanent branch (`master`/`main`/`trunk`) plus small feature branches merged back after review; contrasted with `dev`-branch workflows that add sequencing pain for dependent changes.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```bash
git log                                 # "kit log ... too much information ... instructor"
git log --all --graph --decorate --oneline  # "so graph is what's going to make the git log to show the branches ... all is going to show all branches ... decorate add some colors ... one line makes the history a bit more clear"
git branch                              # "command git branch now shows that there is a branch called english ... there is a little asterisk on the branch that we are standing on"
git checkout .                          # "i did git checkout dot which checks out everything and that is kind of a bit of a dangerous command but ... just want a clean staging area"

git branch experiment                   # "lesson is suggesting to create a new branch called experiment"
git checkout experiment                 # "have to check out the branch ... git checkout experiment ... switched to that branch"
git checkout -b toy_branch              # "you can do a shortcut for kids branch plus check out branch and that is minus b ... not only create the branch but also move you to that branch so move the head"
git status                              # "do a little git status to see what's going on ... there is a file there ... git status is clean"
git diff                                # "with kit diff i see okay i added cilantro"
git add ingredients.txt                  # "git add ingredients.txt i use the tab ... then i do enter"
git commit -m "add cilantro"            # "do git commit with a little message that says add cilantro ... now head has moved along with the changes"
# also mentioned alias:
git graph                               # "alias git graph or using the full thing ... in kids you can create shortcuts to commands that you use very often and alex has kindly shared his favorite aliases"
```
