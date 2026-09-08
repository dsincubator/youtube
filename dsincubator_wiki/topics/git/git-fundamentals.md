---
type: Playbook
title: Git Fundamentals
description: 'Core git concepts: initializing repos, staging, committing, diffs, status,
  and log'
lang: en
tags:
- ds-incubator
generated:
  by: agent:okf-wiki-builder/1.0
  at: '2026-09-08T04:00:00Z'
status: draft
sources:
- id: 5gmTK8Cb-WE
  resource: https://www.youtube.com/watch?v=5gmTK8Cb-WE
  title: Merge conflicts
  author: process:yt-dlp
  usage_count: 16
  last_modified: '2020-11-24T00:00:00Z'
- id: 7igKU5JVmxM
  resource: https://www.youtube.com/watch?v=7igKU5JVmxM
  title: Inspecting the history
  author: process:yt-dlp
  usage_count: 21
  last_modified: '2020-12-15T00:00:00Z'
- id: AxpkFkfTF8o
  resource: https://www.youtube.com/watch?v=AxpkFkfTF8o
  title: git status, add, rm --cached, commit, log
  author: process:yt-dlp
  usage_count: 247
  last_modified: '2020-09-22T00:00:00Z'
- id: Q9S7CvXu3KY
  resource: https://www.youtube.com/watch?v=Q9S7CvXu3KY
  title: 'Remote setup: Fork (of ours)'
  author: process:yt-dlp
  usage_count: 15
  last_modified: '2020-12-08T00:00:00Z'
- id: S4GyNTwj_sc
  resource: https://www.youtube.com/watch?v=S4GyNTwj_sc
  title: 'Introduction to version control with Git: Initialize a Git repository'
  author: process:yt-dlp
  usage_count: 73
  last_modified: '2020-09-15T00:00:00Z'
- id: XRF9tge--9I
  resource: https://www.youtube.com/watch?v=XRF9tge--9I
  title: git diff sha1 sha2 -- path, mv, rm, core.editor
  author: process:yt-dlp
  usage_count: 35
  last_modified: '2020-10-06T00:00:00Z'
- id: ciJpIWs3t3k
  resource: https://www.youtube.com/watch?v=ciJpIWs3t3k
  title: Suggest/commit changes directly on a GitHub PR
  author: process:yt-dlp
  usage_count: 7007
  last_modified: '2024-06-04T00:00:00Z'
- id: dZOfEF19yDk
  resource: https://www.youtube.com/watch?v=dZOfEF19yDk
  title: Undoing things with git
  author: process:yt-dlp
  usage_count: 19
  last_modified: '2021-01-05T00:00:00Z'
- id: eQ-BFO3eZX8
  resource: https://www.youtube.com/watch?v=eQ-BFO3eZX8
  title: https://github.com/2DegreesInvesting/ds-incubator/issues/47
  author: process:yt-dlp
  usage_count: 21
  last_modified: '2020-06-02T00:00:00Z'
- id: eeUZ8dHsmG8
  resource: https://www.youtube.com/watch?v=eeUZ8dHsmG8
  title: Git practices by example
  author: process:yt-dlp
  usage_count: 22
  last_modified: '2020-12-22T00:00:00Z'
- id: g1PRMaTFYdk
  resource: https://www.youtube.com/watch?v=g1PRMaTFYdk
  title: '`usethis::pr_sync()` (live ds-incubator meetup)'
  author: process:yt-dlp
  usage_count: 7
  last_modified: '2019-11-06T00:00:00Z'
- id: jYvJO2lENbY
  resource: https://www.youtube.com/watch?v=jYvJO2lENbY
  title: Git remotes
  author: process:yt-dlp
  usage_count: 6
  last_modified: '2020-12-01T00:00:00Z'
- id: nSJT8NGhSTs
  resource: https://www.youtube.com/watch?v=nSJT8NGhSTs
  title: Ejemplo de "mejores practicas" de Git
  author: process:yt-dlp
  usage_count: 110
  last_modified: '2020-12-22T00:00:00Z'
- id: pxxcuZH9_yA
  resource: https://www.youtube.com/watch?v=pxxcuZH9_yA
  title: 'Testing: Snapshot tests'
  author: process:yt-dlp
  usage_count: 175
  last_modified: '2021-04-27T00:00:00Z'
- id: q-hsaxVA1kc
  resource: https://www.youtube.com/watch?v=q-hsaxVA1kc
  title: gh  repo create and gh browse to create and browse a GitHub repo from the
    terminal
  author: process:yt-dlp
  usage_count: 357
  last_modified: '2024-07-03T00:00:00Z'
- id: qqKhQdejUOM
  resource: https://www.youtube.com/watch?v=qqKhQdejUOM
  title: Project management on GitHub
  author: process:yt-dlp
  usage_count: 8727
  last_modified: '2022-08-23T00:00:00Z'
- id: tbvsaXwtcPU
  resource: https://www.youtube.com/watch?v=tbvsaXwtcPU
  title: Moving commits across branches, rebasing, and squashing
  author: process:yt-dlp
  usage_count: 32
  last_modified: '2020-11-17T00:00:00Z'
- id: xyNydg5IUok
  resource: https://www.youtube.com/watch?v=xyNydg5IUok
  title: Good commit messages, .gitignore, GUIs
  author: process:yt-dlp
  usage_count: 19
  last_modified: '2020-10-13T00:00:00Z'
- id: zC31jaKp1jQ
  resource: https://www.youtube.com/watch?v=zC31jaKp1jQ
  title: 'git branch (part 2): merge, delete'
  author: process:yt-dlp
  usage_count: 20
  last_modified: '2020-11-03T00:00:00Z'
- id: zv5_OSb6lRo
  resource: https://www.youtube.com/watch?v=zv5_OSb6lRo
  title: 'GitHub flow: The case of publishing an new blog post'
  author: process:yt-dlp
  usage_count: 24
  last_modified: '2020-07-28T00:00:00Z'
---

# Git Fundamentals

## Overview

Git is taught in the dsincubator as essential infrastructure — a safety net that makes mistakes recoverable and enables collaboration and reproducibility by traveling through history. The curriculum follows CodeRefinery's *Introduction to version control with Git* and opens with the photo metaphor: `git add` frames the shot (choosing what belongs in the snapshot), `git commit` takes the picture, and the `.git` directory is the photo album. A second edit → stage → commit cycle builds history, but rewriting shared history after `push` is unsafe.

Fundamentals focus on the daily loop: initializing a repository (`git init`), configuring identity (`git config user.name` / `user.email`), inspecting state (`git status`, `git diff`), staging (`git add`, `git rm --cached`, `git add .` with caution), committing (`git commit -m`), and reading history (`git log`, `git show`, `git blame`, `git grep`). Terminal workflow is demonstrated in vanilla `bash` and via the RStudio Cloud Terminal tab; aliases (`gss` for `git status`, `PS1="\w $ "` prompt tweaks, `git config alias`) illustrate personalization without obscuring basics.

Across 20 videos, the same cautions recur: untracked files are unsafe (red in `git status`), `git add .` can accidentally stage secrets, and `git log` will retain anything ever committed — so committed private data requires history rewriting and quick help. Help is built-in (`git status --help`, `git help status`, `--` separator to scope commands to a path).

> **Bilingual note**: This topic includes Spanish-language sources; key concepts are shared in English with Spanish titles preserved in the Sources table.

## Key Concepts

- **Init and config**: `mkdir recipe; cd recipe; git init` creates hidden `.git`; `git config user.name "mauro"` / `git config user.email` (query vs setter) and `git config --list` verify settings — see [source_S4GyNTwj_sc](../../sources/source_S4GyNTwj_sc_introduction-to-version-control-with-git-initialize-a-git-repository.md).
- **Staging area and photo metaphor**: `git add ingredients.txt` → green "changes to be committed", `git rm --cached ingredients.txt` unstages, `git add .` risks secrets; `git status -- ingredients.txt` and `git status -s` (short) scope output — [source_AxpkFkfTF8o](../../sources/source_AxpkFkfTF8o_git-status-add-rm-cached-commit-log.md).
- **Diffs**: `git diff` (unstaged), `git diff --staged`, `git diff SHA1 SHA2 -- path` compare snapshots; path separator `--` is mandatory before file args — [source_XRF9tge--9I](../../sources/source_XRF9tge--9I_git-diff-sha1-sha2-path-mv-rm-core-editor.md).
- **History inspection**: `git log`, `git log --oneline --graph --decorate`, `git log --grep` / `git log -S` (pickaxe) / `git grep`, `git show` (= `git log -p -1`), `git blame`/`annotate`, `git shortlog -s`, tags and ranges (`v1.6.3..v2`) — [source_7igKU5JVmxM](../../sources/source_7igKU5JVmxM_inspecting-the-history.md).
- **Undoing**: `git checkout <sha>`, `git checkout branch -- file`, `git reset`/`revert` patterns — [source_dZOfEF19yDk](../../sources/source_dZOfEF19yDk_undoing-things-with-git.md); See also [Branching and Merging](../git/branching-merging.md) and [GitHub Workflow](../git/github-workflow.md).
- **Good commits**: atomic messages, `.gitignore`, GUI alternatives (RStudio Git pane, GitKraken, GitHub Desktop) — [source_xyNydg5IUok](../../sources/source_xyNydg5IUok_good-commit-messages-gitignore-guis.md) and bilingual best-practice [source_nSJT8NGhSTs](../../sources/source_nSJT8NGhSTs_ejemplo-de-mejores-practicas-de-git.md).
- **Workflow hygiene**: related to [Merge Conflicts](../git/merge-conflicts.md) and [Rebasing](../git/rebasing.md) — fundamentals underpin all branching strategies.

## Sources

| Video | Title | Views | Last Modified |
|---|---|---|---|
| [5gmTK8Cb-WE](https://www.youtube.com/watch?v=5gmTK8Cb-WE) | [Merge conflicts](../../sources/source_5gmTK8Cb-WE_merge-conflicts.md) | 16 | 2020-11-24T00:00:00Z |
| [7igKU5JVmxM](https://www.youtube.com/watch?v=7igKU5JVmxM) | [Inspecting the history](../../sources/source_7igKU5JVmxM_inspecting-the-history.md) | 21 | 2020-12-15T00:00:00Z |
| [AxpkFkfTF8o](https://www.youtube.com/watch?v=AxpkFkfTF8o) | [git status, add, rm --cached, commit, log](../../sources/source_AxpkFkfTF8o_git-status-add-rm-cached-commit-log.md) | 247 | 2020-09-22T00:00:00Z |
| [Q9S7CvXu3KY](https://www.youtube.com/watch?v=Q9S7CvXu3KY) | [Remote setup: Fork (of ours)](../../sources/source_Q9S7CvXu3KY_remote-setup-fork-of-ours.md) | 15 | 2020-12-08T00:00:00Z |
| [S4GyNTwj_sc](https://www.youtube.com/watch?v=S4GyNTwj_sc) | [Introduction to version control with Git: Initialize a Git repository](../../sources/source_S4GyNTwj_sc_introduction-to-version-control-with-git-initialize-a-git-repository.md) | 73 | 2020-09-15T00:00:00Z |
| [XRF9tge--9I](https://www.youtube.com/watch?v=XRF9tge--9I) | [git diff sha1 sha2 -- path, mv, rm, core.editor](../../sources/source_XRF9tge--9I_git-diff-sha1-sha2-path-mv-rm-core-editor.md) | 35 | 2020-10-06T00:00:00Z |
| [ciJpIWs3t3k](https://www.youtube.com/watch?v=ciJpIWs3t3k) | [Suggest/commit changes directly on a GitHub PR](../../sources/source_ciJpIWs3t3k_suggest-commit-changes-directly-on-a-github-pr.md) | 7007 | 2024-06-04T00:00:00Z |
| [dZOfEF19yDk](https://www.youtube.com/watch?v=dZOfEF19yDk) | [Undoing things with git](../../sources/source_dZOfEF19yDk_undoing-things-with-git.md) | 19 | 2021-01-05T00:00:00Z |
| [eQ-BFO3eZX8](https://www.youtube.com/watch?v=eQ-BFO3eZX8) | [https://github.com/2DegreesInvesting/ds-incubator/issues/47](../../sources/source_eQ-BFO3eZX8_https-github-com-2degreesinvesting-ds-incubator-issues-47.md) | 21 | 2020-06-02T00:00:00Z |
| [eeUZ8dHsmG8](https://www.youtube.com/watch?v=eeUZ8dHsmG8) | [Git practices by example](../../sources/source_eeUZ8dHsmG8_git-practices-by-example.md) | 22 | 2020-12-22T00:00:00Z |
| [g1PRMaTFYdk](https://www.youtube.com/watch?v=g1PRMaTFYdk) | [`usethis::pr_sync()` (live ds-incubator meetup)](../../sources/source_g1PRMaTFYdk_usethis-pr-sync-live-ds-incubator-meetup.md) | 7 | 2019-11-06T00:00:00Z |
| [jYvJO2lENbY](https://www.youtube.com/watch?v=jYvJO2lENbY) | [Git remotes](../../sources/source_jYvJO2lENbY_git-remotes.md) | 6 | 2020-12-01T00:00:00Z |
| [nSJT8NGhSTs](https://www.youtube.com/watch?v=nSJT8NGhSTs) | [Ejemplo de "mejores practicas" de Git](../../sources/source_nSJT8NGhSTs_ejemplo-de-mejores-practicas-de-git.md) | 110 | 2020-12-22T00:00:00Z |
| [pxxcuZH9_yA](https://www.youtube.com/watch?v=pxxcuZH9_yA) | [Testing: Snapshot tests](../../sources/source_pxxcuZH9_yA_testing-snapshot-tests.md) | 175 | 2021-04-27T00:00:00Z |
| [q-hsaxVA1kc](https://www.youtube.com/watch?v=q-hsaxVA1kc) | [gh  repo create and gh browse to create and browse a GitHub repo from the terminal](../../sources/source_q-hsaxVA1kc_gh-repo-create-and-gh-browse-to-create-and-browse-a-github-repo-from-the-terminal.md) | 357 | 2024-07-03T00:00:00Z |
| [qqKhQdejUOM](https://www.youtube.com/watch?v=qqKhQdejUOM) | [Project management on GitHub](../../sources/source_qqKhQdejUOM_project-management-on-github.md) | 8727 | 2022-08-23T00:00:00Z |
| [tbvsaXwtcPU](https://www.youtube.com/watch?v=tbvsaXwtcPU) | [Moving commits across branches, rebasing, and squashing](../../sources/source_tbvsaXwtcPU_moving-commits-across-branches-rebasing-and-squashing.md) | 32 | 2020-11-17T00:00:00Z |
| [xyNydg5IUok](https://www.youtube.com/watch?v=xyNydg5IUok) | [Good commit messages, .gitignore, GUIs](../../sources/source_xyNydg5IUok_good-commit-messages-gitignore-guis.md) | 19 | 2020-10-13T00:00:00Z |
| [zC31jaKp1jQ](https://www.youtube.com/watch?v=zC31jaKp1jQ) | [git branch (part 2): merge, delete](../../sources/source_zC31jaKp1jQ_git-branch-part-2-merge-delete.md) | 20 | 2020-11-03T00:00:00Z |
| [zv5_OSb6lRo](https://www.youtube.com/watch?v=zv5_OSb6lRo) | [GitHub flow: The case of publishing an new blog post](../../sources/source_zv5_OSb6lRo_github-flow-the-case-of-publishing-an-new-blog-post.md) | 24 | 2020-07-28T00:00:00Z |

## References

- CodeRefinery — Introduction to version control with Git (lesson + instructor guide)
- Pro Git — `git status`, `git add`, `git commit`, `git log`, `git diff` documentation
