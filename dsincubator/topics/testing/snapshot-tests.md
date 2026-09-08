---
type: Playbook
title: Snapshot Tests
description: Using testthat snapshot tests to refactor safely and verify output stability
lang: en
tags:
- ds-incubator
generated:
  by: agent:okf-wiki-builder/1.0
  at: '2026-09-08T04:00:00Z'
status: draft
sources:
- id: 5wHl9N4fBBU
  resource: https://www.youtube.com/watch?v=5wHl9N4fBBU
  title: 'ds.production: From an MVP to production'
  author: process:yt-dlp
  usage_count: 87
  last_modified: '2023-06-17T00:00:00Z'
- id: 7igKU5JVmxM
  resource: https://www.youtube.com/watch?v=7igKU5JVmxM
  title: Inspecting the history
  author: process:yt-dlp
  usage_count: 21
  last_modified: '2020-12-15T00:00:00Z'
- id: 9JcJFber21w
  resource: https://www.youtube.com/watch?v=9JcJFber21w
  title: 'Testing: Introduction'
  author: process:yt-dlp
  usage_count: 59
  last_modified: '2021-03-30T00:00:00Z'
- id: AxpkFkfTF8o
  resource: https://www.youtube.com/watch?v=AxpkFkfTF8o
  title: git status, add, rm --cached, commit, log
  author: process:yt-dlp
  usage_count: 247
  last_modified: '2020-09-22T00:00:00Z'
- id: MU8E_gpylPE
  resource: https://www.youtube.com/watch?v=MU8E_gpylPE
  title: git branch (part 1)
  author: process:yt-dlp
  usage_count: 25
  last_modified: '2020-10-27T00:00:00Z'
- id: S4GyNTwj_sc
  resource: https://www.youtube.com/watch?v=S4GyNTwj_sc
  title: 'Introduction to version control with Git: Initialize a Git repository'
  author: process:yt-dlp
  usage_count: 73
  last_modified: '2020-09-15T00:00:00Z'
- id: UeECMfOFIHk
  resource: https://www.youtube.com/watch?v=UeECMfOFIHk
  title: 'Testing: Using snapshot tests to refactor safely'
  author: process:yt-dlp
  usage_count: 24
  last_modified: '2021-05-04T00:00:00Z'
- id: pxxcuZH9_yA
  resource: https://www.youtube.com/watch?v=pxxcuZH9_yA
  title: 'Testing: Snapshot tests'
  author: process:yt-dlp
  usage_count: 175
  last_modified: '2021-04-27T00:00:00Z'
---

# Snapshot Tests

## Overview

Snapshot testing saves expected output in a separate file rather than inline code and is the incubator's tool for refactoring untested features without changing user-visible behavior. Conceptually introduced in [source_pxxcuZH9_yA](../../sources/source_pxxcuZH9_yA_testing-snapshot-tests.md), it is preferable in three situations: outputs with awkward escaped strings (e.g., needing to escape end-of-line characters), very large objects (e.g., a `ggplot2` object whose internal list structure is too verbose to write inline), and binary formats such as plot images (PNG). Monika and CJ extend the discussion to image testing and the trade-off between brittle inline expectations and coarse snapshots.

The practical payoff is shown in [source_UeECMfOFIHk](../../sources/source_UeECMfOFIHk_testing-using-snapshot-tests-to-refactor-safely.md): the feature `scatter_plot_penguins` (bill depth vs bill length for three penguin species from `palmerpenguins`, replacing `iris`) starts at 0% file coverage (red in `covr` report). Adding `expect_snapshot()` quickly yields coarse coverage so the feature can be refactored safely. The Git-fundamentals sources folded into this topic ([source_7igKU5JVmxM](../../sources/source_7igKU5JVmxM_inspecting-the-history.md) et al.) reflect that snapshot files live under `tests/testthat/_snaps/` and are version-controlled — `git diff` after `testthat::snapshot_accept()` shows added snap files.

Snapshots are thus both a testing and a Git topic: reviewing snap diffs is code review, and approving snaps is a conscious `git add` of new expected output.

## Key Concepts

- **When snapshots beat inline**: escaped strings, large objects (`ggplot2` internals), binary PNGs — [source_pxxcuZH9_yA](../../sources/source_pxxcuZH9_yA_testing-snapshot-tests.md).
- **Refactor safely**: add `expect_snapshot()` for coarse coverage on 0%-covered feature `scatter_plot_penguins` before restructuring — [source_UeECMfOFIHk](../../sources/source_UeECMfOFIHk_testing-using-snapshot-tests-to-refactor-safely.md).
- **File layout**: `tests/testthat/_snaps/<test-name>.snap` stores expected output; `snapshot_accept()` / `snapshot_review()` updates — [source_pxxcuZH9_yA](../../sources/source_pxxcuZH9_yA_testing-snapshot-tests.md).
- **Git integration**: snaps are committed (`git add tests/testthat/_snaps/`), diffed (`git diff`), and reviewed as part of PR — link to [Git Fundamentals](../git/git-fundamentals.md) and [Branching and Merging](../git/branching-merging.md).
- **Visual vs unit**: snapshot tests cover level 4 visuals (plots) and level 1 coarse output — extends [Testing Fundamentals](../testing/testing-fundamentals.md) four levels.
- **Workflow**: `expect_snapshot()` → `devtools::test()` fails first run (new snap) → review → `snapshot_accept()` — [source_UeECMfOFIHk](../../sources/source_UeECMfOFIHk_testing-using-snapshot-tests-to-refactor-safely.md) and [source_5wHl9N4fBBU](../../sources/source_5wHl9N4fBBU_ds-production-from-an-mvp-to-production.md).
- **Related**: [Test-Driven Development](../testing/test-driven-development.md) (snapshots as quick canary), [Code Coverage](../testing/code-coverage.md) (measure before refactor).

## Sources

| Video | Title | Views | Last Modified |
|---|---|---|---|
| [5wHl9N4fBBU](https://www.youtube.com/watch?v=5wHl9N4fBBU) | [ds.production: From an MVP to production](../../sources/source_5wHl9N4fBBU_ds-production-from-an-mvp-to-production.md) | 87 | 2023-06-17T00:00:00Z |
| [7igKU5JVmxM](https://www.youtube.com/watch?v=7igKU5JVmxM) | [Inspecting the history](../../sources/source_7igKU5JVmxM_inspecting-the-history.md) | 21 | 2020-12-15T00:00:00Z |
| [9JcJFber21w](https://www.youtube.com/watch?v=9JcJFber21w) | [Testing: Introduction](../../sources/source_9JcJFber21w_testing-introduction.md) | 59 | 2021-03-30T00:00:00Z |
| [AxpkFkfTF8o](https://www.youtube.com/watch?v=AxpkFkfTF8o) | [git status, add, rm --cached, commit, log](../../sources/source_AxpkFkfTF8o_git-status-add-rm-cached-commit-log.md) | 247 | 2020-09-22T00:00:00Z |
| [MU8E_gpylPE](https://www.youtube.com/watch?v=MU8E_gpylPE) | [git branch (part 1)](../../sources/source_MU8E_gpylPE_git-branch-part-1.md) | 25 | 2020-10-27T00:00:00Z |
| [S4GyNTwj_sc](https://www.youtube.com/watch?v=S4GyNTwj_sc) | [Introduction to version control with Git: Initialize a Git repository](../../sources/source_S4GyNTwj_sc_introduction-to-version-control-with-git-initialize-a-git-repository.md) | 73 | 2020-09-15T00:00:00Z |
| [UeECMfOFIHk](https://www.youtube.com/watch?v=UeECMfOFIHk) | [Testing: Using snapshot tests to refactor safely](../../sources/source_UeECMfOFIHk_testing-using-snapshot-tests-to-refactor-safely.md) | 24 | 2021-05-04T00:00:00Z |
| [pxxcuZH9_yA](https://www.youtube.com/watch?v=pxxcuZH9_yA) | [Testing: Snapshot tests](../../sources/source_pxxcuZH9_yA_testing-snapshot-tests.md) | 175 | 2021-04-27T00:00:00Z |

## References

- testthat — `expect_snapshot()`, `snapshot_accept()`, `snapshot_review()`
- covr — `report()` showing 0% → covered transition
- palmerpenguins — `penguins` dataset used in scatter-plot example
