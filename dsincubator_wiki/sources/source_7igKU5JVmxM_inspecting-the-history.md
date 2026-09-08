---
type: source
title: "Inspecting the history"
source_file: "7igKU5JVmxM_inspecting-the-history.md"
video_id: "7igKU5JVmxM"
url: "https://www.youtube.com/watch?v=7igKU5JVmxM"
lang: en
tags: ["ds-incubator", "git", "terminal", "snapshot-testing", "r-packages"]
key_topics: ["git-log", "git-grep", "history-search", "git-shortlog"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=7igKU5JVmxM"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 21
    last_modified: "2020-12-15T00:00:00Z"
usage_window: { from: "2020-12-15T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# Inspecting the history

## Summary

The final session of the terminal Git series focuses on inspecting repository history, primarily through `git log`, demonstrated in a live terminal against the `usethis` repository (maintained by Jenny Bryan). The speaker distinguishes three complementary search strategies: `git grep` for the current working tree snapshot, `git log --grep` for commit messages, and `git log -S` (capital S, pickaxe) for finding added, modified or deleted content anywhere in history — noting that `-S` can locate a deleted function by its text and that `-p` shows the patch diff.

The demo walks through finding commits by the author string "Mauro" and recovering that text from deleted test files (e.g., manual tests for `pr_find`). Further filtering covers `--author`, `--since` with flexible date expressions (`since last week`, `since last year`), alias creation via `git config --local alias.<name>`, the short `git -p`/`-n` counts, and range syntax `v2..HEAD` and `v1.6.3..v2` to see changes between releases. Practical release tasks are shown with `git tag`, `git shortlog -s` piped to `sort -n -r` to count commits per contributor, `git show` (explained as `git log -p -1`), and `git blame`/`annotate` to find who last touched a line. Time travel is demonstrated with `git checkout <sha>`/`-b`, checking out a tag, checking out a single file from the past, and noting that the same techniques exist in GUIs like GitKraken, RStudio or GitHub Desktop. The concept of `git bisect` is deliberately excluded as an advanced follow-up.

## Key Concepts & Tools Taught

- **[git log / git-log]:** Core command for exploring commit history; focus of the session with many filters (`--grep`, `-S`, `-p`, `--author`, `--since`, ranges, `-n`, `--oneline --graph --decorate`).
- **[git grep / git-grep]:** Searching the current snapshot only ("git has a GP command that allows you to basically um explore any piece of text that exists in the current working tree" → `git grep`).
- **[history search with -S / history-search]:** `git log -S` (capital S) finds the commit that added or removed a string anywhere in history, even deleted code, unlike `--grep` which matches only commit messages.
- **[patch view with -p]:** Adding `-p` to `git log` shows the diff of each commit, allowing recovery of a specific deleted chunk rather than an entire file.
- **[author and date filtering]:** `git log --author="Mauro"` (case-insensitive) and `git log --since="last week"` / `since last year` with very flexible date parsing to narrow history.
- **[tag ranges]:** Limiting log to a range such as `v2..HEAD` or `v1.6.3..v2` to see commits between releases, with `^`/`~1` for parent references and confirming the tag is included with `^` syntax.
- **[git shortlog / git-shortlog]:** Summarizing contributors between tags (`git shortlog -s v1.6.3..v2.0.0`) and piping to `sort -n -r` to rank committers for release notes (example: Jenny 231+13, Hadley 23, speaker 1).
- **[aliases]:** Creating shortcuts via `git config --global alias.<name>` or `--local` (e.g., `glol` / `lg` for `log --oneline --graph --decorate`) and inspecting with `alias grep for log`.
- **[git show and count flags]:** `git show` as shortcut for `git log -p -1`; `-n1`/`-n3` to limit commit count, combined as `git log -p -n1`.
- **[git blame / annotate]:** `git blame <file>` (also called `annotate`) shows who edited each line and when, useful to find the right person to ask about unfamiliar code.
- **[checkout and time travel]:** `git checkout <tag>` or `<sha>` or `git checkout -b explore-commit <sha>` to travel to a past snapshot, `git checkout <branch> -- <file>` to restore a single file, then `git diff` showing the restored change in green/red.

## Code Snippets & Formulas

No verbatim commit history shown as static blocks; spoken terminal calls dictated live (caption-mangled, normalized here):

```bash
git grep "TODO"                # "g grip" / "git has a GP command" — search current working tree
git grep "Mauro"               # "let's do if I do g grip and I try to find say my name let's do Mao"
git log --grep="Mauro"         # "G log GP actually digs into commit messages" / "g log minus minus grap"
git log --grep="Mauro" -i      # regex-aware commit-message search ("it understands Regular Expressions")
git log -S "Mauro"             # "for that you use minus capital S it's not lower case it's capital S" — pickaxe search entire history
git log -S "Mauro" -p          # "if I do the flag minus P P is for patch so then I get not just the commit information but also I actually do get the changes"
git log --author="Mauro"       # "call that command go g lol l and now I can use the flag althor" → --author
git log --since="last week"    # "flag like SC and the date specifications ... since last week / since last year"
git log --oneline --graph --decorate  # "git log uh one line and the flag ... crate" — dense aliased view
git config --global alias.lg "log --oneline --graph --decorate"  # "you can create your own aliases by doing git config ... Global ... Local ... alias"
git log --oneline --graph --decorate --all  # fancy alias `glol` shown
git log v2..HEAD               # "V2 and the present ... V two and if I say just B2" → start/end range
git log v2^..HEAD              # "let's add one hat here to say well they commit prior to V2" → include tagged commit
git log v1.6.3..v2.0.0          # "we're interested in V 1.6.3 and V2" — between releases
git tag                        # "get tag what do we get so we have you know two 1.63"
git shortlog -s v1.6.3..v2.0.0  # "short log and it has a flag minus s that makes it very succinct"
git shortlog -s v1.6.3..v2.0.0 | sort -n -r  # "pipe that to sort ... sort it in reverse ... explicitly with n and R for reverse because I want the highest committer at the top"
git show                       # "get show for example you know it show just shows one commit" → shortcut for git log -p -1
git log -p -n1                 # "G show is just a special case of git log with the minus P flag and the minus n count to one"
git log --oneline              # "log minus minus one line to do something similar to what you did before with git status minus s"
git log --oneline --stat       # "minus runner stat ... will give you like statistics of the files that changed"
git blame NEWS.md              # "r g blame ... blame a file news for example MD you will know who edited each line"
git checkout v2                # "if I wanted to check out the tag V2 I can do like get check out as I go with a branch V2"
git checkout -b explore-commit <sha>  # "checkout check out minus V for branch and I'm going to create one called explore commit and I'm going to paste the Sha"
git checkout explore-commit -- NEWS.md  # "check out ... from the branch explore so say that ... news file is particularly interesting there so I can check it out"
git checkout master            # "to give get check out just Master right so I'm going to check out everything here so my work inry is clean"
```
