---
type: source
title: "git diff sha1 sha2 -- path, mv, rm, core.editor"
source_file: "XRF9tge--9I_git-diff-sha1-sha2-path-mv-rm-core-editor.md"
video_id: "XRF9tge--9I"
url: "https://www.youtube.com/watch?v=XRF9tge--9I"
lang: en
tags: ["ds-incubator", "git", "terminal", "cloud", "github-issues"]
key_topics: ["git-diff", "git-mv", "git-rm", "git-log", "core-editor"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=XRF9tge--9I"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 35
    last_modified: "2020-10-06T00:00:00Z"
usage_window: { from: "2020-10-06T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# git diff sha1 sha2 -- path, mv, rm, core.editor

## Summary

A terminal-focused continuation of CodeRefinery's Introduction to Version Control with Git (issue 62, Google Doc companion), covering three git topics: advanced `git diff` forms, filesystem operations through git, and configuring the commit editor.

Starting from a guacamole recipe repository with files `instructions` and `ingredients`, the speaker reviews `git status`, `git add` / `git commit -m`, and `git log` / `git log --oneline`, then demonstrates `git diff` in three modes: bare `git diff` comparing the index (last committed state) versus the working tree — illustrated by appending a line to `instructions.txt` with `echo` and reverting with `git checkout -- instructions.txt` (caption "K checkout") — then `git diff <sha1> <sha2>` comparing two commits identified by their SHAs copied from the log, and `git diff <sha1> <sha2> -- <path>` restricting the diff to a single file (e.g., `ingredients.txt`) for a cleaner, file-focused history walk. `touch` is used to create `newfile.txt`.

The second segment advocates managing renames and deletions through git rather than the OS or RStudio so history stays reversible and neatly tracked. `git mv newfile.txt renamed_newfile.txt` records a rename (RStudio's Git pane shows `R` and staging both files together triggers rename detection versus showing a deletion + addition), followed by `git commit -m "rename newfile to renamed_newfile.txt"`, and `git rm renamed_newfile.txt` followed by `git commit -m "delete renamed_newfile.txt"` for deletion.

The `git log --stat` and combined `git log --oneline --stat` views are introduced (per-file additions/deletions), and the "ultimate `git log`" alias is shared: `git log --oneline --decorate --graph` showing `HEAD` (where you are checked out) versus `master`, with `--graph` paying off once merge commits produce branching structure.

The final segment solves the RStudio Cloud `vim`-only editor problem. Without `-m`, `git commit` drops into `vim` (caption available verbatim as "Vim" at 1008). The fix is `git config core.editor <editor>` locally or globally (`--global`). Demo on a local `demo` repo shows `git config --local core.editor nano` (also noted: `notepad` on Windows) and then `git commit` opening `nano` where the user writes "add new file a", exits with Ctrl+X, confirms with `Y` and Enter, verified by `git log`.

## Key Concepts & Tools Taught

- **[git-diff]:** Three forms — `git diff` (index vs working tree), `git diff <sha1> <sha2>` (between two commits), and `git diff <sha1> <sha2> -- <path>` (path-filtered). Diff display: red minus lines for removals, green for additions.
- **[git-mv]:** `git mv <old> <new>` for renames; preserves history as a rename when both sides are staged, versus manual OS rename appearing as delete + add.
- **[git-rm]:** `git rm <file>` for deletions staged through git, followed by `git commit`.
- **[git-log]:** Log variants — `git log`, `git log --oneline`, `git log --stat` (per-file additions/deletions), combined `git log --oneline --stat`, and the recommended `git log --oneline --decorate --graph` showing branch pointers (`HEAD`, `master`) and graph for merges.
- **[core-editor]:** `git config core.editor` (with `--local` or `--global`) to replace the default commit-message editor; recommended alternatives `nano` (simple, with on-screen hints including `^X` for exit) and `notepad` on Windows versus the steep-learning-curve `vim` that RStudio Cloud restricts to.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```bash
git status                          # "G status" / "get status" ← git status
git log --oneline                   # "Git log one line" ← git log --oneline
git log --stat                      # "flag stat" ← --stat — per-file additions/deletions
git log --oneline --stat            # combined form
git log --oneline --decorate --graph  # "ultimate git log" — HEAD/master pointers + graph

git diff                            # "G diff" / "git div" ← git diff — index vs working tree
echo "new line" >> instructions.txt # "Echo ... add a new line at the end of the file"
git diff sha1 sha2                  # "G div sha one and sha two" — between two commits (SHAs copied via Shift+Ins)
git diff sha1 sha2 -- ingredients.txt  # "minus minus separator" — path-filtered diff

touch newfile.txt                   # "command touch I'm going to create that new file"
git add newfile.txt                 # "get add" ← git add — or `git add .` (dot adds everything; explicit preferred)
git commit -m "add newfile.txt"     # "G commit ... flag minus M" ← git commit -m

git mv newfile.txt renamed_newfile.txt       # "git MB which is for a move" ← git mv — rename
git commit -m "rename newfile to renamed_newfile.txt"

git rm renamed_newfile.txt          # "get remove RM for remove and the name of the file" ← git rm — tab completion for name
git commit -m "delete renamed_newfile.txt"

# Editor configuration
git checkout -- instructions.txt    # "K checkout" ← git checkout -- — restore file to index state
git checkout master                 # "check out Master" — switch branch
git config --local core.editor nano   # "core. editor ... Nano" ← core.editor — local vs --global
git config --global core.editor nano  # or `notepad` on Windows
git commit  # without -m drops into configured editor; nano → write message → Ctrl+X → Y → Enter
```
