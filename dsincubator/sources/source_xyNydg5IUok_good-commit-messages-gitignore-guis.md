---
type: source
title: "Good commit messages, .gitignore, GUIs"
source_file: "xyNydg5IUok_good-commit-messages-gitignore-guis.md"
video_id: "xyNydg5IUok"
url: "https://www.youtube.com/watch?v=xyNydg5IUok"
lang: en
tags: ["ds-incubator", "git", "terminal", "github", "r-packages"]
key_topics: ["commit-messages", "gitignore", "glob-syntax", "assume-unchanged", "git-guis"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=xyNydg5IUok"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 19
    last_modified: "2020-10-13T00:00:00Z"
usage_window: { from: "2020-10-13T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Good commit messages, .gitignore, GUIs

## Summary

The last lesson of the first Git-from-terminal series covers three tightly scoped topics: writing useful **commit messages**, managing ignored files with **.gitignore**, and choosing **GUIs** versus the terminal. The narrative stays close to `git log` and `git status` behavior and includes a live Q&A with Alex on dangers and best practices.

**Commit messages:** The subject line is what `git log --oneline` and GitHub's commit list show, so it must be self-contained. The recipe taught is: one subject line ≤50 characters ("if I keep going I will reach point where I should stop ... 50 characters is recommended limit because ... github won't show more than 50 characters and then it will start rubbing" ← `50`), then one empty line, then any number of paragraphs wrapped ideally at ≤80 characters ("my recommendation would be to keep more or less to normal 80 characters length because ... you write software ... you use any extra space for other things" ← `80`). RStudio's commit UI counts characters and helps enforce this; the high-level line explains *why*, lower paragraphs explain *what*.

**Ignoring files:** Best practice is that everything in the working tree is either tracked or ignored, to avoid repeatedly remembering what not to commit. `.gitignore` is a plain text file (convention: file called `git ignore` / `.gitignore`) listing paths to ignore. Demo adds file `b` to `.gitignore` and shows `git status` going clean, then proves modifications to `b` no longer appear. Glob syntax (`*.txt`, `*.Rproj.user`, `.Rproj.user`, etc.) allows compact patterns, linked for further learning. `usethis::use_git_ignore()` adds entries programmatically; demo removes `b` from the file manually, then re-adds via `usethis::use_git_ignore("b")` (caption "this comes from the use this package ... this function should have added the file b to get ignored ... wasn't refreshed" ← `usethis::use_git_ignore`) and also shows bulk adding via `lapply(c("a","b","c"), usethis::use_git_ignore)` — "if my list contains just define ... l apply to ... pass ... list of files" ← `lapply`. An extended edge case is handling a file already tracked (e.g., `a`) where adding it to `.gitignore` does not untrack it: it stays in `git status` and in history. The presenter demonstrates `git update-index --assume-unchanged a` (caption "if you do a git update index and you can tell it and assume that ... file a ... no assume unchanged" ← `git update-index --assume-unchanged`) to hide further local changes, notes `git update-index --no-assume-unchanged a` to undo, and warns that changes remain in history and will reappear for others on pull — a nuance Alex reinforces: "before you commit something ... putting something in the git ignore file that protects against the future but it does not fix the current situation ... [if you committed passwords] ... [cleaning] well beyond scope ... complicated flowchart of have you already pushed". Global `.gitignore` is introduced via audience share: a file in user settings (not the repo) applying to every repository, e.g., for `.DS_Store`, `vim`/`sublime` temp files, configured per GitHub's templates for R/Python.

**GUIs:** Approved tools discussed are **GitKraken**, **Sourcetree**, and **RStudio's Git pane** ("what I use personally is our studios interface and a lot of the terminal" ← RStudio Git). GUIs make it hard to make mistakes by clearly showing committing files and push state, and are recommended for everyday workflows. The terminal remains essential for non-standard workflows; when you hit its limits, communicate with the team rather than forcing GUIs. A tip for RStudio's pane not refreshing: navigate away and back, or click the refresh button next to branch name, or use `Ctrl+L`.

## Key Concepts & Tools Taught

- **[commit-messages / commit-messages]:** Format: subject ≤50 chars, blank line, body wrapped ~80 chars; why: `git log --oneline` and GitHub UI truncate beyond 50; RStudio commit counter helps.
- **[gitignore / gitignore]:** `.gitignore` as text file listing ignored paths; after adding `b` and committing, `git status` hides `b`; Glob patterns `*.txt`, `**/.Rproj.user`; programmatic helper `usethis::use_git_ignore()` plus vectorized `lapply`.
- **[glob-syntax / glob-syntax]:** Compact pattern language for `.gitignore`, linked for learning; demo shows `*.txt` ignoring every txt file.
- **[assume-unchanged / assume-unchanged]:** `git update-index --assume-unchanged <file>` (caption "git update index and assume ... unchanged ... file that you want git to assume that it is unchanged" ← `--assume-unchanged`) and `--no-assume-unchanged`; discussion of global vs per-clone effect and danger (Alex warns: only for your clone, won't propagate, can cause merge mess, rarely recommended; the R Markdown date-output edge was the motivating niche).
- **[git-guis / git-guis]:** `GitKraken` (caption "deep kraken" ← GitKraken), `Sourcetree`, RStudio Git pane; trade-off: GUIs excellent for standard commits/pushes with clear diff, harder for bespoke workflows where terminal + team communication is better.

## Code Snippets & Formulas

Caption-mangled, normalized:

```bash
# Commit message structure (RStudio commit pane shows char count)
# "first line is very important because it's the line that will appear on the git log"
# subject: 50 chars max
# <empty line>
# body: paragraphs wrapped ~80 chars  # "my recommendation ... to keep more or less to the normal 80 characters length" ← 50/80

# .gitignore workflow
touch b; git status            # b appears as untracked
echo "b" >> .gitignore          # "you have this git ignore file ... it's just a text file ... called git ignore ... if I say now v I add the file b to the git ignore" ← .gitignore
git status                     # b no longer shown; only .gitignore change
git commit -m "b to b ignore"  # "let's commit the file get ignored ... bit ignore"
# modify b → git status stays clean  # proves ignore

# programmatic
usethis::use_git_ignore("b")   # "this comes from the use this package ... this function should have added the file b" ← usethis::use_git_ignore
lapply(c("a","b","c"), usethis::use_git_ignore)  # "you may be using a function like l apply to ... pass list of files ... function would be use this use git ignore" ← lapply

# glob patterns for .gitignore
echo "*.txt" >> .gitignore     # "could use something like ... star dot txt ... will not every txt file" ← *.txt
# GitHub gitignore templates: github.com/github/gitignore  # "github has a repository where they just have a bunch of template get ignore files ... common get ignore files for every r project" ← templates

# Already-tracked file edge
# file a was committed before being added to .gitignore → stays in git status after adding to .gitignore
git update-index --assume-unchanged a   # "if you do a git update index and you can tell it and assume that ... file a you're gonna say now is unchanged" ← --assume-unchanged
git status                               # a disappears
git update-index --no-assume-unchanged a # "say no assume unchanged ... a appears back" ← --no-assume-unchanged
# global gitignore: ~/.gitignore_global + git config --global core.excludesFile  # discussed as "global get ignored ... file that lives on your computer not as part of the git repository ... applies to every repository" ← global

# GUI refresh
# RStudio: Git pane → Refresh button next to branch name / navigate to Environment/History and back  # "navigate away to a different pane and then come back ... or there is a little refresh button on the top right there next to the branch name" ← refresh
```

