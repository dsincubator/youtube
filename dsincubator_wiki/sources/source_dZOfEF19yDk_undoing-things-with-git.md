---
type: source
title: "Undoing things with git"
source_file: "dZOfEF19yDk_undoing-things-with-git.md"
video_id: "dZOfEF19yDk"
url: "https://www.youtube.com/watch?v=dZOfEF19yDk"
lang: en
tags: ["ds-incubator", "git"]
key_topics: ["git-checkout-discard", "git-reset-unstage", "git-revert", "git-commit-amend", "git-reset-hard"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=dZOfEF19yDk"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 19
    last_modified: "2021-01-05T00:00:00Z"
usage_window: { from: "2021-01-05T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Undoing things with git

## Summary

The lesson, deferred from the "Introduction to Version Control with Git" series, covers four ways to undo work, grouped by whether they rewrite history. The presenter works in a minimal repo with a `file.txt` ("a file it has ... this R Studio project file") and demonstrates each command's effect via `git status` and `git log --oneline`.

First, discarding unstaged or staged changes to recover the last committed state using `git checkout`. From an `experiment` branch the speaker modifies `file.txt` (`echo IU` / `hi you`, later `hey you good morning`), stages with `git add file.txt`, and shows that `git checkout master` alone fails when the change conflicts but `git checkout -f` / `--force` (`minus f for Force ... minus minus- force or minus F Master`) switches branch and drops working-tree changes, leaving a clean status. More selective discards use `git checkout -p -- file.txt` (`minus spe flag` → `-p`) to interactively choose hunks (`discard this hunk from the work tree yes no quit`) and `git checkout -- file.txt` / `git checkout .` ("checkout dot which and does everything that you have on the working through") to restore specific or all files. Unstaging without discarding uses `git reset -- file.txt` ("reset this file ... we can reset that file and what that will do ... went from being staged ... to modified but not staged") separating the `--` file separator.

Second, safe undo of committed work with `git revert HEAD` ("revert the head of the command" → `git revert HEAD`). After committing `edit file dxt` ("edit file dxt" message), the revert opens an editor prefilled with `Revert "edit file dxt"`; accepting it creates a new commit that applies the inverse, leaving original SHAs intact. The speaker stresses this is the only history-preserving undo safe after pushing/shared branches ("once you have shared a repost ... do not change its history").

Third, rewriting the last commit with `git commit --amend` ("get commment amend ... lets you amend basically you pop up the particular commit and you change it"). The demo edits the revert's message to `rever the commit with message block` / `revert commit with message BL` and shows via `git log --oneline` that the SHA changes (`E74 blah` → new value), confirming history was rewritten and therefore unsafe on shared branches but encouraged for local cleanup before sharing.

Fourth, rewinding history wholesale with `git reset --hard <sha>` ("get reset and we're going to add the flag heart ... paste the Sha of the commit to which I want to reset"). The `experiment` branch head moves back to an earlier commit (`HEAD has now moved to this to this shot`), discarding later commits. The safety net `git reflog` ("is called a ref log ... Type G ref log") is shown for recovery, but the overarching rule is stressed: committing often preserves work, while `checkout` discards of uncommitted work are irrecoverable ("what's there is gone and it's gone forever because that's stuff we haven't committed").

## Key Concepts & Tools Taught

- **[git-checkout-discard]:** Using `git checkout` variants to discard working-tree changes and return to the last commit — `checkout <branch>` (`git checkout master` / `git checkout experiment`), forced branch switch `checkout -f master` / `--force`, file-targeted `checkout -- file.txt` / `checkout .`, and interactive patch `checkout -p -- file.txt` ("minus spe flag is going to let me select more specifically ... discard this hunk from the work tree").
- **[git-reset-unstage]:** Unstaging with `git reset -- file.txt` ("get reset in this case File ... separator minus minus ... clearly shows what's on the far right is a file path") that moves a file from staged back to modified, distinct from discarding.
- **[git-revert]:** `git revert HEAD` / `git revert <sha>` / `git revert experiment` as a history-preserving undo that creates a new inverse commit ("create a new commit that without modifying the history basically UND do and does is it and does what the previous commit did") with default message `Revert "<original message>"`, safe for shared/pushed branches.
- **[git-commit-amend]:** `git commit --amend` to fix the last commit's content or message ("even the commit message"), which rewrites the SHA ("this shy is different to the one that was before") and therefore rewrites history — appropriate only before sharing.
- **[git-reset-hard]:** `git reset --hard <sha>` to rewind the branch pointer and working tree to an earlier state ("reset hard that allows you to go back to any commit and completely forget about the rest"), with `git reflog` as recovery and `git log --oneline` for inspection.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```bash
git status                          # "if I do a status you can see that my status is clean"
git checkout experiment             # "I could do a g check out branch uh experiment so I can check out a new Branch experiment"
echo "hi you" >> file.txt           # "Echo IU and I put that at the end of the file a file" / "hi you at the end"
git status                          # shows file modified
git add file.txt                    # "Say I do G add file txt ... the file has been added to the staging area"
git checkout master                 # "just to check how uh that uh master Branch so let's start with just the name of the branch"
git checkout -f master              # "if we do minus f for Force ... minus minus- force or minus F Master ... what we do is we switch to master but now the status uh is clean"
git checkout -- file.txt            # "when you do check out something for example a file you can narrow on a specific file" — discard file's working-tree changes
git checkout -p -- file.txt         # "you can use this minus P flag that allows you to Select more specifically" → git checkout -p -- file.txt
# interactive prompt: "discard this hunk from the work tree yes no quit ... manually edit the current hun"
git checkout .                      # "could even do G checkout dot which and does everything that you have on the working through"
git reset -- file.txt               # "I could do is to reset this file uh get reset in this case File so I like using this separator minus minus"
git log --oneline                   # "I can show you g bog one line ... at the very top we have a new commit here on experiment"
git revert HEAD                     # "what one way to do that would be with G revert ... notice that it ... head or the reference experiment any of the three things Point ... give me the same result"
# editor opens with: Revert "edit file dxt"  # "the word revert and then between double quotes the exact same commit message"
git commit --amend                  # "what does it do well it lets you amend ... basically you pop up the particular commit and you change it"
git reset --hard <sha>              # "say that I want to go back to this particular State ... take the Sha here and say get reset and we're going to add the flag heart"
git reflog                          # "there is a way to recover to the previous state with something that is called a ref log ... Ty G ref log"
```
