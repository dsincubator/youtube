---
type: source
title: "git branch (part 2): merge, delete"
source_file: "zC31jaKp1jQ_git-branch-part-2-merge-delete.md"
video_id: "zC31jaKp1jQ"
url: "https://www.youtube.com/watch?v=zC31jaKp1jQ"
lang: en
tags: ["ds-incubator", "git", "github", "cloud", "workflow"]
key_topics: ["git-branching", "git-merge", "fast-forward", "branch-deletion", "git-reflog"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=zC31jaKp1jQ"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 20
    last_modified: "2020-11-03T00:00:00Z"
usage_window: { from: "2020-11-03T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# git branch (part 2): merge, delete

## Summary

Continuation of the Git-branches lesson (pre-remotes), framing branches + remotes as the keystone for pull requests. The presenter emphasizes conversation over lesson coverage, noting Alex will cover team-workflows next week, so unfinished material can be deferred.

**Context & fixing a prior mistake:** Recap: last session covered creating a branch (`git branch` / `git checkout -b`) and idea that a branch is a "parallel reality where you can experiment" to later merge into the main line (often `master`, now often `main`, but "master is no more and no less than just another branch ... only a convention ... actually not just just imposing that new repositories are called no master but main" ← `master`/`main`). A mistake made on-the-fly: committing intended-for-`experiment` into a temporary `toy-branch`. Fix demonstrated: any branch can be merged into any other; to reconcile, check out target and merge source. Demo via both terminal and RStudio Git pane: `git branch` shows current (`toy-branch`), `git checkout experiment` switches, `git merge toy-branch` fast-forwards `experiment` four commits ahead of `master` ("i would like to just follow lesson I would like my experiment branch to have what my toy branch has ... merge all the changes that I have in my branch toy branch into experiments so experiment moves one two three four commits ahead of master" ← `git merge toy-branch`, `fast forward`). History in RStudio (`History → show all branches`) confirms `toy-branch` and `experiment` now point to same commit; the graph shows no separate merge-commit line because Git chose fast-forward (linear history). 

**Deleting & hygiene:** Then `git branch -d toy-branch` (`delete` short `-d` for merged branches, caption "i'm gonna remove my branch ... git branch i think it's deletes and toy branch ... because the branch is merged ... commits safely stored" ← `git branch -d`). Discussion: vague names like `experiment` are risky if reused weeks later — you might think you're creating a new branch but you're continuing the stale one, especially with remotes; hence cleanup. GitHub setting mentioned: `Automatically delete head branches after merging` for remotes (caption "github has a setting ... to delete every branch after it has been merged" ← auto-delete), while locally you still control cleanup. To prune stale remote-tracking branches: `git remote prune origin` (caption "there is a command called git prune ... git bra get remote proof ... you have to say specifically which remote ... git remote prune origin or ... my fork" ← `git remote prune`). Listing merged vs unmerged: `git branch --merged` vs `git branch --no-merged` (demo running `git branch --merged` showing `experiment` safe to delete with `-d`, and `english` not merged requiring `-D` / `--delete --force`, caption "if the wrench wasn't merged then you have to force the delete ... if branches have not emerged then you have to either not touch ... if you're sure ... delete force ... shortcut minus capital t" ← `-D`). Even force-deleted branches may be recoverable via `git reflog` (caption "there is something called get dressed log ... command called git revlog which you can ... help you recover even branches that you have forced deleted" ← `git reflog`).

**Checkout as plumbing:** `git checkout` is examined as a versatile plumbing that "goes into that dot git folder looks for history ... and brings something from there and transform what you experience in your working tree" — why it can switch branches, jump to a commit, or discard staged changes. Newer alternative `git switch` (since Git 2.23) is mentioned but not available on the presenter's Git 2.17 (caption "lesson mentions a git switch command that apparently is available since kits 2.23 ... I don't get this switch" ← `git switch`).

**Second merge demo:** Following the exercise prompt, `git checkout master; git merge experiment` is shown, again fast-forwarding `master` to `experiment` (captured via `git log --graph --oneline` alias `git graph` discussed but not installed, so history viewed via RStudio). Then `git branch -d experiment` after confirming via `git branch --merged`, leaving only `master` (plus stray `english` removed via `git branch -D english`). 

**Prompt tweak aside:** Brief `PS1`/`~/.profile` customization to shorten RStudio Cloud prompt ("I use the variable ps and I defined it in my configuration file ... dot profile file ... makes my prompt show just my working directory only base name" ← `PS1`).

## Key Concepts & Tools Taught

- **[git-branching / git-branching]:** Branches as movable pointers to commits, parallel realities; `git branch`, `git checkout -b experiment`, GitHub flow's one long-lived + short-lived feature branches.
- **[git-merge / git-merge]:** Merging any branch into current (`git checkout experiment; git merge toy-branch`), also `git merge experiment` into `master`; contrast merging onto PR branch vs source `master` only by convention.
- **[fast-forward / fast-forward]:** When no divergent history, Git moves pointer linearly without creating a merge commit ("Git has done a special kind of merge which is called fast forward ... commits could be put on top ... as opposed to creating a new merge commit with two lines" ← `fast forward`); visual via RStudio history vs `git log --graph`.
- **[branch-deletion / branch-deletion]:** Safe `-d`/`--delete` for merged branches (`git branch -d toy-branch`, `git branch -d experiment` after `--merged` check); forced `-D`/`--delete --force` for unmerged; GitHub auto-delete setting; pruning with `git remote prune origin`.
- **[git-reflog / git-reflog]:** Recovery aid after forced delete (`git reflog` / `git revlog`, caption "get dressed log" / "git revlog" ← `git reflog`) — can resurrect lost commits but painful, so avoid needing it.

## Code Snippets & Formulas

Caption-mangled, normalized:

```bash
git branch                                   # "the only way I have to know in which branch I am is to type command git branch ... I'm in toy branch" ← git branch
git checkout experiment                      # "I would like to check out the branch experiment ... git checkout experiment and I switched" ← git checkout
git merge toy-branch                         # "I want to merge into this branch the one that I'm standing I want to merge the changes that I have in branch toy branch so I'm gonna do a git merge toy branch ... things have kind of worked ... fast forward" ← git merge

git branch -d toy-branch                     # "I'm gonna remove my branch ... git branch I think it's deletes and toy branch ... because the branch is merged ... commits safely stored" ← git branch -d
git branch --merged                          # "if we're gonna ask git branch merged and that would tell us which branches have been merged" ← git branch --merged
git branch -D english                        # "if you wanted to remove it you would do it branch minus capital d english" ← git branch -D (force)
git remote prune origin                      # "there is a command called git prune ... git remote prune ... you have to say specifically which remote ... git remote prune origin or git remote prune my fork" ← git remote prune
git reflog                                   # "there is something called get dressed log ... command called git revlog ... will help you recover even branches that you have forced deleted" ← git reflog
git switch                                   # "lesson mentions a git switch command that apparently is available since kits 2.23 ... I don't get this switch" ← git switch (Git ≥2.23)
# RStudio prompt tweak
PS1='\W\$ ' ; echo 'PS1="\W\$ "' >> ~/.profile   # "I use the variable ps and I defined it in my configuration file ... dot profile" ← PS1
# Checkouts as plumbing explained: git checkout <branch> | git checkout <commit> | git checkout -- <file> — all read from .git into working tree
```

