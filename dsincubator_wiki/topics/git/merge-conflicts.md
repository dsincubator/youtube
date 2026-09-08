---
type: Playbook
title: Merge Conflicts
description: Understanding, avoiding, and resolving merge conflicts; manual and automated
  resolution strategies
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
- id: fnfeYPPG9gM
  resource: https://www.youtube.com/watch?v=fnfeYPPG9gM
  title: '`usethis::pr_sync( )` (English)'
  author: process:yt-dlp
  usage_count: 8
  last_modified: '2019-11-04T00:00:00Z'
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
- id: xx5WNZgQEdY
  resource: https://www.youtube.com/watch?v=xx5WNZgQEdY
  title: '`usethis::pr_synch()` (Español)'
  author: process:yt-dlp
  usage_count: 7
  last_modified: '2019-11-04T00:00:00Z'
---

# Merge Conflicts

## Overview

A merge conflict occurs when Git cannot automatically reconcile two changes to the same content. The canonical demo uses file `H` (avocados, cilantro, salt): prepends on one branch and appends ("half onion") on another auto-merge because touched lines differ, but concurrent edits to the same middle line ("one tablespoon" vs "three tablespoons cilantro") force manual resolution — which may be a third phrasing combining both. Git's diff engine matches content, not line numbers, so conflicts track semantic overlap, not positional edits alone.

Resolution is shown both manually (opening the file, editing `<<<<<<<` / `=======` / `>>>>>>>` markers, `git add` the resolved file, `git commit`) and with tooling (`git mergetool`, `usethis::pr_sync()` / `pr_merge()` helpers). Prevention guidance recurs: keep branches synchronized with `main`/`master`, scope each PR to one thing, split monolithic ~200-line files into modules so collaborators touch different files, and recognize that frequent conflicts often signal a communication or semantic conflict best caught by tests rather than pure Git mechanics.

Coverage is bilingual and workflow-integrated: English deep-dive [source_5gmTK8Cb-WE](../../sources/source_5gmTK8Cb-WE_merge-conflicts.md), best-practice examples [source_eeUZ8dHsmG8](../../sources/source_eeUZ8dHsmG8_git-practices-by-example.md), and Spanish interdependent-PR guidance [source_hs_Pzxny7XE](../../sources/source_hs_Pzxny7XE_evita-solicitudes-de-fusion-interdependientes.md) plus `usethis` sync demos in English [source_fnfeYPPG9gM](../../sources/source_fnfeYPPG9gM_usethis-pr-sync-english.md) and Spanish [source_xx5WNZgQEdY](../../sources/source_xx5WNZgQEdY_usethis-pr-synch-espanol.md).

> **Bilingual note**: This topic includes Spanish-language sources; key concepts are shared in English with Spanish titles preserved in the Sources table.

## Key Concepts

- **Conflict anatomy**: `<<<<<<< HEAD` / `=======` / `>>>>>>> branch` markers; Git cannot choose a winner when the same hunk diverges — [source_5gmTK8Cb-WE](../../sources/source_5gmTK8Cb-WE_merge-conflicts.md).
- **Manual resolution**: edit file to desired outcome, `git add <file>` stages resolution, `git commit` completes merge; `git status` tracks conflict state; `git diff` shows remaining hunks — [source_5gmTK8Cb-WE](../../sources/source_5gmTK8Cb-WE_merge-conflicts.md).
- **Tool-assisted**: `git mergetool`, RStudio merge tool, `usethis::pr_sync()` to sync PR branches — [source_fnfeYPPG9gM](../../sources/source_fnfeYPPG9gM_usethis-pr-sync-english.md) and [source_xx5WNZgQEdY](../../sources/source_xx5WNZgQEdY_usethis-pr-synch-espanol.md).
- **Prevention**: small focused PRs, frequent `git fetch` + `git merge main` or `git rebase main`, modular file decomposition (~200-line modules), early communication — [source_hs_Pzxny7XE](../../sources/source_hs_Pzxny7XE_evita-solicitudes-de-fusion-interdependientes.md).
- **Semantic conflicts**: contradictory requirements or untested behavior that merges cleanly but breaks logic — caught by [Testing Fundamentals](../testing/testing-fundamentals.md) and [Test-Driven Development](../testing/test-driven-development.md).
- **Related**: see [Branching and Merging](../git/branching-merging.md) for merge strategies and [Rebasing](../git/rebasing.md) for alternative history-linearization; [Git Fundamentals](../git/git-fundamentals.md) for diff/status basics.

## Sources

| Video | Title | Views | Last Modified |
|---|---|---|---|
| [5gmTK8Cb-WE](https://www.youtube.com/watch?v=5gmTK8Cb-WE) | [Merge conflicts](../../sources/source_5gmTK8Cb-WE_merge-conflicts.md) | 16 | 2020-11-24T00:00:00Z |
| [eeUZ8dHsmG8](https://www.youtube.com/watch?v=eeUZ8dHsmG8) | [Git practices by example](../../sources/source_eeUZ8dHsmG8_git-practices-by-example.md) | 22 | 2020-12-22T00:00:00Z |
| [fnfeYPPG9gM](https://www.youtube.com/watch?v=fnfeYPPG9gM) | [`usethis::pr_sync( )` (English)](../../sources/source_fnfeYPPG9gM_usethis-pr-sync-english.md) | 8 | 2019-11-04T00:00:00Z |
| [g1PRMaTFYdk](https://www.youtube.com/watch?v=g1PRMaTFYdk) | [`usethis::pr_sync()` (live ds-incubator meetup)](../../sources/source_g1PRMaTFYdk_usethis-pr-sync-live-ds-incubator-meetup.md) | 7 | 2019-11-06T00:00:00Z |
| [hs_Pzxny7XE](https://www.youtube.com/watch?v=hs_Pzxny7XE) | [Evita solicitudes de fusion interdependientes](../../sources/source_hs_Pzxny7XE_evita-solicitudes-de-fusion-interdependientes.md) | 13 | 2019-11-12T00:00:00Z |
| [xx5WNZgQEdY](https://www.youtube.com/watch?v=xx5WNZgQEdY) | [`usethis::pr_synch()` (Español)](../../sources/source_xx5WNZgQEdY_usethis-pr-synch-espanol.md) | 7 | 2019-11-04T00:00:00Z |

## References

- Git Docs — `git merge`, `git mergetool`
- usethis — `pr_sync()`, `pr_merge_main()` helpers
