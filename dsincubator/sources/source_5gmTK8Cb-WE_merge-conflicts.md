---
type: source
title: "Merge conflicts"
source_file: "5gmTK8Cb-WE_merge-conflicts.md"
video_id: "5gmTK8Cb-WE"
url: "https://www.youtube.com/watch?v=5gmTK8Cb-WE"
lang: en
tags: ["ds-incubator", "merge-conflicts", "rebasing", "pull-requests", "workflow"]
key_topics: ["merge-conflicts", "git-merge", "rebase", "pull-requests", "git-diff"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=5gmTK8Cb-WE"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 16
    last_modified: "2020-11-24T00:00:00Z"
usage_window: { from: "2020-11-24T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# Merge conflicts

## Summary

A focused terminal session on solving and avoiding merge conflicts in git, explicitly framed as a companion to Alex's earlier workflow lessons. The opening defines a merge conflict with a recipe-file illustration: file `H` originally has three lines (two avocados, cilantro, salt). If one branch prepends a line while the other appends "half onion," git auto-merges because the touched lines differ; if both branches edit the same middle line to "one tablespoon" vs "three tablespoons cilantro," git cannot choose a winner and demands human resolution, which may even be a third phrasing combining both.

The middle third shifts to prevention and process. Alex and CJ clarify that git's diff engine matches content, not line numbers, so adding lines at top versus bottom rarely matters by itself. Prevention guidance stresses planning branch strategy (keep long-lived branches synced with `main`/`master`), scoping each pull request to one thing to reduce overlap, decomposing monolithic files into ~200-line modules so collaborators touch different files, and recognizing that many merge conflicts signal a communication or semantic conflict (e.g., contradictory requirements best caught by tests) rather than a purely technical glitch.

The closing demo manufactures a conflict in a fresh repo: branching `like cilantro` → "more cilantro" and `dislike cilantro` → "half cilantro" from a common base, merging one branch cleanly into `master` then merging the second to trigger a conflict, inspecting via `git status` / `git diff`, resolving manually by editing markers and `git add` + `git commit`, and contrasting with the automated `git merge -X ours` strategy that lets the current branch silently win. Practical notes cover `git merge --abort` (also the escape for a `git pull` that is `fetch` + `merge`), `git fetch` + `merge` semantics, and who should resolve conflicts (the PR author).

## Key Concepts & Tools Taught

- **[merge-conflicts]:** Same file, same line edited differently on two branches → git requires human choice; illustrated with avocado recipe where top/bottom additions auto-merge but simultaneous middle-line changes ("one tablespoon of cantro" vs "three tablespoons of cilantro") conflict, requiring either one side or a merged third version.
- **[git-merge]:** Integrating a branch into the current branch with `git merge <branch>` (caption "get merge" / "G merge" / "git merge" ← `git merge`); `git pull` is `git fetch` followed by `git merge` (caption "pool do a g fetch first and then emerge" / "kid pull it is exactly G fetch follow but G merge" ← `git pull`), and `git merge --abort` (caption "get merge aboard" / "merge abort" ← `git merge --abort`) aborts an in-progress conflict to return to the prior state.
- **[rebase]:** Alternative to merge that replays commits atop the target, changing SHA history and omitting a merge commit; `git checkout -b` creates and checks out a branch (caption "git check out minus B which is a command that creates the branch and checks it out at the same time" ← `git checkout -b`), and `git merge -X ours` (caption "G merge using the flag minus X hours tells that the the branch hours means the branch I'm standing" ← `git merge -X ours`) auto-prefers current-branch hunks.
- **[pull-requests]:** Workflow unit of one thing per PR—small, single-purpose pull requests that merge cleanly, pushed early/often, keep local branches updated from upstream, and are made squash-friendly if teams later squash-merge; ownership rule that the PR author resolves conflicts.
- **[git-diff]:** Inspecting conflicts with `git status` (caption "G status" ← `git status`), `git diff` (caption "G diff" / "edit div" ← `git diff`), `git diff --cached` (caption "G diff Cas" / "what I have already in the staging area" ← `git diff --cached`), `git log --oneline --graph --decorate --all` (caption "show you the log just one line maybe graph and decorate" ← `git log --oneline --graph --decorate`) and `git reflog` (caption "refed log" ← `git reflog`) for navigating manufactured conflict history.

## Code Snippets & Formulas

Caption-mangled, normalized here (quote-to-name):

```sh
git branch                                   # "Branch yes I am a master H so that's the only branch that I have"
git checkout -b like-cilantro                 # "git check out minus B which is a command that creates the branch and checks it out at the same time"
# edit ingredients.txt: "more cilantro"
git diff                                     # "I could do a g diff as well you see that ... I added more cilantro"
git add ingredients.txt; git commit -m "more" # "get add uh ingredients.txt get commit with the message more"
git checkout master                          # "I'm going to get check out Master"

git checkout -b dislike-cilantro             # "check out a new branch that is called this like cantro ... use the flag minus B"
# edit ingredients.txt: "half cilantro"
git commit -a -m "less"                      # "just be commit minus M if you ... give it the a name of the file it does the equivalent to commit and add"
git log --oneline --graph --decorate --all   # "show you the log just one line maybe graph and decorate H"
git reflog                                   # "what I did with the refed log is something you don't need to know"

# merging
git merge like-cilantro                      # "if I merge one of them say G merge uh like cilantro that's fine"
git merge dislike-cilantro                   # "if I now merge the other one ... now I see a merged conflict"
git status                                   # "what happens if I now merge ... how do I explore the merged conflict ... just edit div ... G status to see"
git diff                                     # "what you can do is just edit div and that will show you ... which is the file with the conflict"
# manual resolve: edit file removing <<<<<<< / ======= / >>>>>>> markers, keep desired line(s)
git add ingredients.txt                       # "the way you mark the merge conflict is solve is with G ad G ad ingredients"
git diff --cached                            # "if I do get diff Cas to see what I have already in the staging area"
git commit -m "fix merge conflict manual"    # "get commit with the message fix merge conflict manual"
git merge --abort                            # "when you ... are still not ready to merge conflicts ... just to get merge aboard ... if ... the last command that you run ... was get pool ... what I need to do if I want to abort is get mer aort"

# automated preference
git merge -X ours dislike-cilantro           # "G merge using the flag minus X hours tells that the the branch hours means the branch I'm standing right now that should win"
git merge -X theirs dislike-cilantro         # opposite strategy (mentioned as automated ways)

# pull = fetch + merge
git pull                                     # "some commands like pool do a g fetch first and then emerge"
git fetch; git merge origin/master           # decomposition — "G fetch follow but G merge"
```
