---
type: source
title: "Moving commits across branches, rebasing, and squashing"
source_file: "tbvsaXwtcPU_moving-commits-across-branches-rebasing-and-squashing.md"
video_id: "tbvsaXwtcPU"
url: "https://www.youtube.com/watch?v=tbvsaXwtcPU"
lang: en
tags: ["ds-incubator", "git", "rebasing"]
key_topics: ["git-branch", "git-reset-hard", "rebasing", "squashing", "reflog"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=tbvsaXwtcPU"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2020-11-17T00:00:00Z"
    usage_count: 32
usage_window: { from: "2020-11-17T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Moving commits across branches, rebasing, and squashing

## Summary

A practical Git-from-the-terminal session on branch manipulation, presented as three optional exercises building on prior branch and remote lessons to master PR workflows (a PR is just a branch off main for discussion via a remote). 

Exercise 1 — moving commits off master: reproducing the common mistake of committing on `master` (`main` line of development) because of forgetting to branch or wanting to lock useful work, the speaker creates `touch B` → `git add B` → `git commit -m "add B"` on `master` (verified via `git status -s` — no output when clean — `git branch` with `*`, `git log --oneline --decorate`). To fix, a new branch `git branch new-branch` is created at the same commit, checked out (`git checkout new-branch`), and then `master` is rewound one commit. Two techniques are compared: the lesson's `git checkout master; git reset --hard <SHA>` (demonstrated to require being on the branch; attempt `git reset --hard master <SHA>` fails with `cannot do reset with path`) vs. the preferred explicit `git branch -f master <SHA>` (or `git branch -f master HEAD~2`/`^^`/`master`) which moves any branch without checkout; warning to create the new branch before hard-resetting or the SHA won't appear in `git log` without `all` and must be recovered via `git reflog` (obscure but recoverable — any committed SHA is recoverable).

Exercise 2 — rebasing: using a history where `master` adds `C` (`touch C; add; commit "add C"`) diverging from `new-branch` adding `B`, the speaker demonstrates `git log --graph --decorate --all` to see the fork and then `git checkout new-branch; git rebase master`. The operation replays `B` on top of `C`, yielding a linear history and changing the SHA of `B` (saved as `D5V4D2` before vs. after). The trunk/branch analogy (cut branch and stick it at top, like overtaking a car) emphasizes that rebase rewrites history and should never be done after `git push` when shared, or teammates will see conflicting identifiers.

Exercise 3 — squashing: with two commits `B` and `D` atop `master` (`git log` shows two ahead), the speaker shows `git reset --soft master` (or `--soft HEAD~2`/`^^`/`SHA`) which pops changes into the staging area (`git status -s` shows `A B`, `D`), then `git commit -m "add B and D"` creating a single combined commit, cleaning a locally experimental history before sharing via a PR.

Q&A notes `git reflog` recovery, the backup branch pattern (`backup-A` before experimenting), and that rebase/squash are fine locally to tell a clearer story but must be avoided after sharing or require closing the PR.

## Key Concepts & Tools Taught

- **[git-branch]:** Branches as references/labels to a commit at the top of history; `git branch` lists (asterisk `*` is current), `git branch <name>` creates at current HEAD, `git checkout <branch>` moves HEAD, with `--decorate/--all/--graph` log flags to visualize.
- **[git-reset-hard]:** Rewinding a branch pointer; `git reset --hard <SHA>` must be run while checked out on that branch (explicit `git reset --hard master <SHA>` fails), while `git branch -f <branch> <SHA>` forces the branch to any SHA explicitly without checkout; use before hard-reset to create a new branch to avoid losing the commit from `log` (recover via `reflog`).
- **[rebasing]:** `git rebase <upstream>` (e.g., `git rebase master` while on `new-branch`) cuts the current branch and replays its commits on top of upstream, linearizing history but changing SHAs; analogy of moving a tree branch to the top / overtaking a car; history-rewriting, so only before `git push`.
- **[squashing]:** `git reset --soft <target>` (alias `git reset --soft master` / `HEAD~2`) pops commits to staging area preserving changes (`git status -s` shows them), then `git commit -m "add B and D"` combines into one; common to clean experimental local commits before sharing.
- **[reflog]:** `git reflog` ← `a g ref log that is a place where you can recover stuff that you removed completely` — obscure recovery log for commits not pointed to by any branch after hard resets/deletions; advice to commit valuable work immediately because committed objects are durable.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```sh
git status -s           # "i did g status um with a minus s flag remember what we get is a compact status ... if there is nothing added to the staging area the output is nothing"
git branch              # "git Branch because git Branch tells me with an Asic asterisk which is the branch in which I am standing"
git log --oneline --decorate        # plus variants --graph --all: "i can improve my g log ... i can say decorate ... it will tell me which branch ... is pointing to that commit" ; "if I do all I see all branches" ; "I can add one more flag that is called graph"
touch B; git add B; git commit -m "add B"  # "let's create for example a new file so I'm going to do touch B ... I'm going to add it to the staging area ... I can do g commit ... add B" → later "touch C", "add C", "touch D", "add D"

# Exercise 1: move commits off master
git branch new-branch                 # "a branch is simply a reference to a commit ... if I now create a new Branch with Git Branch let's call it new branch"
git checkout new-branch               # "we already did ... we created a new branch and now we going to rewind the master Branch"
git checkout master; git reset --hard <SHA>  # lesson approach: "to tell G ... reset has hard ... will move that Branch ... paste the Sha ... I'm standing on master ... git reset hard and we can paste the Sha"
# attempt fails: git reset --hard master <SHA>  # "cannot do res have reset with path so maybe I wrong ... I have to change to master and then from there hard reset"
# preferred explicit:
git branch -f master <SHA>            # "uses one feature of the command G branch that is the minus F or Force flag which allows you to move a branch wherever ... git Branch Master ... minus F you move the branch" ; also SHA or HEAD~2 / HEAD^^ / branch name forms

# checkout helpers
git checkout <branch>                 # switching between master / new-branch, verified with git branch
git branch -f master HEAD~2           # "you can say TIA two another way would be to say hat hat as many hats as commits you want to go back another way would be to just say the Sha ... another way would be to refer to that commit using its name of the branch"

# Exercise 2: rebase
git checkout new-branch
git rebase master                     # "so we're going to do G rase master ... we are going to rase it ... it's rewinding the history and then replaying the commits on the top" (caption: rase ← rebase)
# before SHA: D5V4D2  # saved to file before rebase to show SHA changes
git log --oneline --decorate --graph --all  # shows linear after rebase, branch pattern disappears

# Exercise 3: squash
git reset --soft master               # "remember we are two commits away from master ... soft and uh you can say soft master ... will just refer to this specific commit ... looks like nothing happened but if I do G status minus s you see that now the changes A and B have been popped up" (soft is default)
# also: git reset --soft HEAD~2  / HEAD^^  / <SHA>
git status -s                         # shows A B / D in staging
git commit -m "add B and D"           # "I can now create a new commit with a message add B and D"
git log --oneline --decorate --graph  # now single commit ahead

# recovery & safety
git reflog                # "there's something that very cure is called a g ref log" — recover SHAs
git branch backup-A       # "usually I create a branch that's called backup ... I screw up there and then if I don't like it I just destroy it with G br delete"
git branch -D <branch>    # delete branch
```
