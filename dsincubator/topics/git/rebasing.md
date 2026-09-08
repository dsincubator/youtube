---
type: Playbook
title: Git Rebasing
description: Rebase vs merge, rewriting history, interactive rebase, and workflow
  implications
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
- id: eeUZ8dHsmG8
  resource: https://www.youtube.com/watch?v=eeUZ8dHsmG8
  title: Git practices by example
  author: process:yt-dlp
  usage_count: 22
  last_modified: '2020-12-22T00:00:00Z'
- id: hs_Pzxny7XE
  resource: https://www.youtube.com/watch?v=hs_Pzxny7XE
  title: Evita solicitudes de fusion interdependientes
  author: process:yt-dlp
  usage_count: 13
  last_modified: '2019-11-12T00:00:00Z'
- id: tbvsaXwtcPU
  resource: https://www.youtube.com/watch?v=tbvsaXwtcPU
  title: Moving commits across branches, rebasing, and squashing
  author: process:yt-dlp
  usage_count: 32
  last_modified: '2020-11-17T00:00:00Z'
- id: zC31jaKp1jQ
  resource: https://www.youtube.com/watch?v=zC31jaKp1jQ
  title: 'git branch (part 2): merge, delete'
  author: process:yt-dlp
  usage_count: 20
  last_modified: '2020-11-03T00:00:00Z'
---

# Git Rebasing

## Overview

Rebasing is presented as the alternative to merging for integrating changes: instead of creating a merge commit, `git rebase` replays commits from one branch onto another, producing a linear history. The incubator frames this with a clear safety rule — rewriting history (like Back to the Future) is safe when local and unsafe after `push` — and teaches concrete exercises: moving commits accidentally made on `master` to a feature branch, cleaning up a PR with `git rebase -i` (interactive), and squashing fixup commits before review.

The session `tbvsaXwtcPU` walks three exercises: (1) rescue commits from `master` by creating a branch, resetting `master`, and replaying; (2) interactive rebase to reorder, squash, or edit messages (`pick`/`squash`/`fixup`/`reword`); (3) syncing a feature branch with `main` via `git fetch` then `git rebase origin/main` versus `git merge`. Spanish guidance [source_hs_Pzxny7XE](../../sources/source_hs_Pzxny7XE_evita-solicitudes-de-fusion-interdependientes.md) adds the workflow rule for interdependent PRs: rebase the dependent branch onto the updated base rather than merging `main` into it, keeping dependency order explicit.

Trade-offs are explicit: rebase yields a cleaner, bisectable log but rewrites SHAs and requires `git push --force-with-lease` (not `--force`) if already pushed; merge preserves true chronology at the cost of merge commits. The choice interacts with branch deletion (`git branch -d`) and history inspection (`git log --graph`).

> **Bilingual note**: This topic includes Spanish-language sources; key concepts are shared in English with Spanish titles preserved in the Sources table.

## Key Concepts

- **Rebase vs merge**: `git rebase main` replays commits linearly; `git merge main` creates a merge commit — linearity vs fidelity to history — [source_tbvsaXwtcPU](../../sources/source_tbvsaXwtcPU_moving-commits-across-branches-rebasing-and-squashing.md).
- **Interactive rebase**: `git rebase -i HEAD~3` / `git rebase -i main` with actions `pick`, `squash`, `fixup`, `reword`, `edit`; squash noisy commits before PR — [source_tbvsaXwtcPU](../../sources/source_tbvsaXwtcPU_moving-commits-across-branches-rebasing-and-squashing.md).
- **Rescuing commits off master**: `git branch feature` → `git reset --hard HEAD~N` on `master` → `git checkout feature` replays — Exercise 1 in [source_tbvsaXwtcPU](../../sources/source_tbvsaXwtcPU_moving-commits-across-branches-rebasing-and-squashing.md).
- **Interdependent PRs**: rebase dependent branch onto updated base to keep chain explicit; avoid merging `main` into feature branches repeatedly — [source_hs_Pzxny7XE](../../sources/source_hs_Pzxny7XE_evita-solicitudes-de-fusion-interdependientes.md).
- **Safety and force-push**: only rebase local/unshared history; if pushed, use `git push --force-with-lease` after coordination — [source_eeUZ8dHsmG8](../../sources/source_eeUZ8dHsmG8_git-practices-by-example.md) and [source_5gmTK8Cb-WE](../../sources/source_5gmTK8Cb-WE_merge-conflicts.md).
- **Related**: [Branching and Merging](../git/branching-merging.md) for merge semantics, [Merge Conflicts](../git/merge-conflicts.md) for conflict markers that also appear during rebase, [Gitflow Workflow](../git/gitflow-workflow.md) for branching model.

## Sources

| Video | Title | Views | Last Modified |
|---|---|---|---|
| [5gmTK8Cb-WE](https://www.youtube.com/watch?v=5gmTK8Cb-WE) | [Merge conflicts](../../sources/source_5gmTK8Cb-WE_merge-conflicts.md) | 16 | 2020-11-24T00:00:00Z |
| [eeUZ8dHsmG8](https://www.youtube.com/watch?v=eeUZ8dHsmG8) | [Git practices by example](../../sources/source_eeUZ8dHsmG8_git-practices-by-example.md) | 22 | 2020-12-22T00:00:00Z |
| [hs_Pzxny7XE](https://www.youtube.com/watch?v=hs_Pzxny7XE) | [Evita solicitudes de fusion interdependientes](../../sources/source_hs_Pzxny7XE_evita-solicitudes-de-fusion-interdependientes.md) | 13 | 2019-11-12T00:00:00Z |
| [tbvsaXwtcPU](https://www.youtube.com/watch?v=tbvsaXwtcPU) | [Moving commits across branches, rebasing, and squashing](../../sources/source_tbvsaXwtcPU_moving-commits-across-branches-rebasing-and-squashing.md) | 32 | 2020-11-17T00:00:00Z |
| [zC31jaKp1jQ](https://www.youtube.com/watch?v=zC31jaKp1jQ) | [git branch (part 2): merge, delete](../../sources/source_zC31jaKp1jQ_git-branch-part-2-merge-delete.md) | 20 | 2020-11-03T00:00:00Z |

## References

- Git Docs — `git rebase`, `git rebase --interactive`
- Pro Git — Rebasing chapter
