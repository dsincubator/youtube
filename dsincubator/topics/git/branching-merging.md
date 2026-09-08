---
type: Playbook
title: Git Branching and Merging
description: Branching workflows, merging strategies, fast-forward merges, and merge
  commit history
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
- id: EaJqUQkDo48
  resource: https://www.youtube.com/watch?v=EaJqUQkDo48
  title: '`gh pr` allows you to work with GitHub pull requests from your terminal'
  author: process:yt-dlp
  usage_count: 549
  last_modified: '2024-07-05T00:00:00Z'
- id: MU8E_gpylPE
  resource: https://www.youtube.com/watch?v=MU8E_gpylPE
  title: git branch (part 1)
  author: process:yt-dlp
  usage_count: 25
  last_modified: '2020-10-27T00:00:00Z'
- id: OFjlPa7Uqeo
  resource: https://www.youtube.com/watch?v=OFjlPa7Uqeo
  title: Comparing remote setup “Ours” versus "Fork (of ours)"
  author: process:yt-dlp
  usage_count: 101
  last_modified: '2020-08-25T00:00:00Z'
- id: OofNbCXEVgU
  resource: https://www.youtube.com/watch?v=OofNbCXEVgU
  title: Gitflow workflow
  author: process:yt-dlp
  usage_count: 162
  last_modified: '2021-05-25T00:00:00Z'
- id: g1PRMaTFYdk
  resource: https://www.youtube.com/watch?v=g1PRMaTFYdk
  title: '`usethis::pr_sync()` (live ds-incubator meetup)'
  author: process:yt-dlp
  usage_count: 7
  last_modified: '2019-11-06T00:00:00Z'
- id: hs_Pzxny7XE
  resource: https://www.youtube.com/watch?v=hs_Pzxny7XE
  title: Evita solicitudes de fusion interdependientes
  author: process:yt-dlp
  usage_count: 13
  last_modified: '2019-11-12T00:00:00Z'
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
- id: tbvsaXwtcPU
  resource: https://www.youtube.com/watch?v=tbvsaXwtcPU
  title: Moving commits across branches, rebasing, and squashing
  author: process:yt-dlp
  usage_count: 32
  last_modified: '2020-11-17T00:00:00Z'
- id: z4RAuGrAm8c
  resource: https://www.youtube.com/watch?v=z4RAuGrAm8c
  title: Access permissions for a GitHub organization
  author: process:yt-dlp
  usage_count: 4440
  last_modified: '2019-11-26T00:00:00Z'
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

# Git Branching and Merging

## Overview

Branches are Git's parallel realities: lightweight pointers to commits that move forward with each new commit, unlike tags which stay fixed on a release snapshot. The dsincubator series teaches branching as the enabler of parallel work — a team can develop multiple features concurrently on separate branches and later combine them onto the main line (`master`/`main`/`trunk`). Part 1 visualizes branches and `HEAD` with two use-case animations; Part 2 practices the merge lifecycle and deletion, emphasizing that a pull request is just a branch pushed to a remote for discussion.

Merging is taught with concrete recipe-file examples and live terminals: fast-forward merges when the target has not diverged, versus three-way merges that create a merge commit when both lines diverge. Remote setup matters — the *ours* vs *fork of ours* comparison shows how `origin`/`upstream` remotes affect fetch/merge. The simple workflow `main` + short-lived feature branches merged via PR works until branches become interdependent, at which point coordination or [Gitflow Workflow](../git/gitflow-workflow.md) is needed.

The material recurs across 13 videos with bilingual coverage (Spanish [source_hs_Pzxny7XE](../../sources/source_hs_Pzxny7XE_evita-solicitudes-de-fusion-interdependientes.md) and [source_nSJT8NGhSTs](../../sources/source_nSJT8NGhSTs_ejemplo-de-mejores-practicas-de-git.md)) and connects directly to conflict resolution and history-rewriting topics.

> **Bilingual note**: This topic includes Spanish-language sources; key concepts are shared in English with Spanish titles preserved in the Sources table.

## Key Concepts

- **Branch as movable pointer**: `git branch` / `git checkout -b feature` / `git switch -c feature`; `HEAD` points to current branch; `git log --oneline --graph --decorate --all` visualizes — [source_MU8E_gpylPE](../../sources/source_MU8E_gpylPE_git-branch-part-1.md).
- **Merge strategies**: fast-forward (`git merge feature` when `main` is ancestor) vs three-way merge commit; `git merge --no-ff` forces a merge commit; delete with `git branch -d` / `-D` — [source_zC31jaKp1jQ](../../sources/source_zC31jaKp1jQ_git-branch-part-2-merge-delete.md).
- **Remotes and PRs**: `git remote -v`, `git fetch` / `git merge` vs `git pull`, `gh pr create` / `gh pr view`; comparison of *ours* vs *fork of ours* remote setups — [source_OFjlPa7Uqeo](../../sources/source_OFjlPa7Uqeo_comparing-remote-setup-ours-versus-fork-of-ours.md) and [source_EaJqUQkDo48](../../sources/source_EaJqUQkDo48_gh-pr-allows-you-to-work-with-github-pull-requests-from-your-terminal.md).
- **When simple workflow breaks**: interdependent PRs (one implements a function, another uses it) require sequencing or rebasing; see [Merge Conflicts](../git/merge-conflicts.md) and [Rebasing](../git/rebasing.md).
- **History and tags**: tags mark releases (`git tag v1.0`); branches move, tags stay — [source_7igKU5JVmxM](../../sources/source_7igKU5JVmxM_inspecting-the-history.md) via `git show` and range `v1.6.3..v2`.
- **Naming and hygiene**: avoid long-lived diverging branches; keep PRs small and focused; synchronize with `main` frequently — [source_OofNbCXEVgU](../../sources/source_OofNbCXEVgU_gitflow-workflow.md) and [source_zv5_OSb6lRo](../../sources/source_zv5_OSb6lRo_github-flow-the-case-of-publishing-an-new-blog-post.md).

## Sources

| Video | Title | Views | Last Modified |
|---|---|---|---|
| [5gmTK8Cb-WE](https://www.youtube.com/watch?v=5gmTK8Cb-WE) | [Merge conflicts](../../sources/source_5gmTK8Cb-WE_merge-conflicts.md) | 16 | 2020-11-24T00:00:00Z |
| [EaJqUQkDo48](https://www.youtube.com/watch?v=EaJqUQkDo48) | [`gh pr` allows you to work with GitHub pull requests from your terminal](../../sources/source_EaJqUQkDo48_gh-pr-allows-you-to-work-with-github-pull-requests-from-your-terminal.md) | 549 | 2024-07-05T00:00:00Z |
| [MU8E_gpylPE](https://www.youtube.com/watch?v=MU8E_gpylPE) | [git branch (part 1)](../../sources/source_MU8E_gpylPE_git-branch-part-1.md) | 25 | 2020-10-27T00:00:00Z |
| [OFjlPa7Uqeo](https://www.youtube.com/watch?v=OFjlPa7Uqeo) | [Comparing remote setup “Ours” versus "Fork (of ours)"](../../sources/source_OFjlPa7Uqeo_comparing-remote-setup-ours-versus-fork-of-ours.md) | 101 | 2020-08-25T00:00:00Z |
| [OofNbCXEVgU](https://www.youtube.com/watch?v=OofNbCXEVgU) | [Gitflow workflow](../../sources/source_OofNbCXEVgU_gitflow-workflow.md) | 162 | 2021-05-25T00:00:00Z |
| [g1PRMaTFYdk](https://www.youtube.com/watch?v=g1PRMaTFYdk) | [`usethis::pr_sync()` (live ds-incubator meetup)](../../sources/source_g1PRMaTFYdk_usethis-pr-sync-live-ds-incubator-meetup.md) | 7 | 2019-11-06T00:00:00Z |
| [hs_Pzxny7XE](https://www.youtube.com/watch?v=hs_Pzxny7XE) | [Evita solicitudes de fusion interdependientes](../../sources/source_hs_Pzxny7XE_evita-solicitudes-de-fusion-interdependientes.md) | 13 | 2019-11-12T00:00:00Z |
| [jYvJO2lENbY](https://www.youtube.com/watch?v=jYvJO2lENbY) | [Git remotes](../../sources/source_jYvJO2lENbY_git-remotes.md) | 6 | 2020-12-01T00:00:00Z |
| [nSJT8NGhSTs](https://www.youtube.com/watch?v=nSJT8NGhSTs) | [Ejemplo de "mejores practicas" de Git](../../sources/source_nSJT8NGhSTs_ejemplo-de-mejores-practicas-de-git.md) | 110 | 2020-12-22T00:00:00Z |
| [tbvsaXwtcPU](https://www.youtube.com/watch?v=tbvsaXwtcPU) | [Moving commits across branches, rebasing, and squashing](../../sources/source_tbvsaXwtcPU_moving-commits-across-branches-rebasing-and-squashing.md) | 32 | 2020-11-17T00:00:00Z |
| [z4RAuGrAm8c](https://www.youtube.com/watch?v=z4RAuGrAm8c) | [Access permissions for a GitHub organization](../../sources/source_z4RAuGrAm8c_access-permissions-for-a-github-organization.md) | 4440 | 2019-11-26T00:00:00Z |
| [zC31jaKp1jQ](https://www.youtube.com/watch?v=zC31jaKp1jQ) | [git branch (part 2): merge, delete](../../sources/source_zC31jaKp1jQ_git-branch-part-2-merge-delete.md) | 20 | 2020-11-03T00:00:00Z |
| [zv5_OSb6lRo](https://www.youtube.com/watch?v=zv5_OSb6lRo) | [GitHub flow: The case of publishing an new blog post](../../sources/source_zv5_OSb6lRo_github-flow-the-case-of-publishing-an-new-blog-post.md) | 24 | 2020-07-28T00:00:00Z |

## References

- CodeRefinery — Branching and merging lesson (animations)
- GitHub Docs — About branches, About merge methods
