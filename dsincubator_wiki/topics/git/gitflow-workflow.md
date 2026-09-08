---
type: Reference
title: Gitflow Workflow
description: Gitflow branching model, release branches, and conventional commit patterns
lang: en
tags:
- ds-incubator
generated:
  by: agent:okf-wiki-builder/1.0
  at: '2026-09-08T04:00:00Z'
status: draft
sources:
- id: -9QCNwmpTOE
  resource: https://www.youtube.com/watch?v=-9QCNwmpTOE
  title: Test driven development
  author: process:yt-dlp
  usage_count: 17
  last_modified: '2020-12-29T00:00:00Z'
- id: 4AOKCiAh3NM
  resource: https://www.youtube.com/watch?v=4AOKCiAh3NM
  title: 'Testing: Test driven development (TDD)'
  author: process:yt-dlp
  usage_count: 48
  last_modified: '2021-04-13T00:00:00Z'
- id: 9JcJFber21w
  resource: https://www.youtube.com/watch?v=9JcJFber21w
  title: 'Testing: Introduction'
  author: process:yt-dlp
  usage_count: 59
  last_modified: '2021-03-30T00:00:00Z'
- id: OofNbCXEVgU
  resource: https://www.youtube.com/watch?v=OofNbCXEVgU
  title: Gitflow workflow
  author: process:yt-dlp
  usage_count: 162
  last_modified: '2021-05-25T00:00:00Z'
- id: Pi__2Hze4_0
  resource: https://www.youtube.com/watch?v=Pi__2Hze4_0
  title: Setup for R package development
  author: process:yt-dlp
  usage_count: 28
  last_modified: '2020-02-04T00:00:00Z'
- id: _Cl4odbiG78
  resource: https://www.youtube.com/watch?v=_Cl4odbiG78
  title: Using drake to develop smart, reproducible workflows
  author: process:yt-dlp
  usage_count: 13
  last_modified: '2020-05-05T00:00:00Z'
- id: lq6ZhPFVLTY
  resource: https://www.youtube.com/watch?v=lq6ZhPFVLTY
  title: 'Shiny: development workflow'
  author: process:yt-dlp
  usage_count: 54
  last_modified: '2021-07-20T00:00:00Z'
- id: mamqEBZpbtw
  resource: https://www.youtube.com/watch?v=mamqEBZpbtw
  title: 'cloud: move data between a server and GitHub with the gh CLI'
  author: process:yt-dlp
  usage_count: 41
  last_modified: '2022-06-28T00:00:00Z'
- id: uDx9NkoBqv8
  resource: https://www.youtube.com/watch?v=uDx9NkoBqv8
  title: Data science on a chromebook
  author: process:yt-dlp
  usage_count: 875
  last_modified: '2022-08-16T00:00:00Z'
---

# Gitflow Workflow

## Overview

Gitflow is taught as a structured branching model for releases: `main` (or `master`) holds production-ready state, `develop` integrates ongoing work, feature branches sprout from `develop`, and `release` / `hotfix` branches stage stabilization and patches before merging back to both `main` and `develop`. The core demo [source_OofNbCXEVgU](../../sources/source_OofNbCXEVgU_gitflow-workflow.md) frames this as "pretty much every use case sorted — served me well," starting from the simple `main` + short-lived feature PR workflow and showing when it breaks (interdependent branches where one implements a function the other uses).

In the incubator, Gitflow is contextualized against simpler GitHub Flow (direct `feature` → `main` PRs via `zv5_OSb6lRo`) and against R-package release cadence where `develop` accumulates commits before a CRAN-bound release. Conventional commits and tagging support the release branches; the simple workflow remains functional until dependency chains force sequencing or rebasing. Related package and pipeline sessions reference Gitflow when coordinating multi-package releases and `drake`/`targets` pipelines that must stay compatible across `develop` and `release`.

As a Reference topic, this page inventories the model without prescribing a single Gitflow tool (git-flow CLI vs manual `git branch`/`git merge`); choice depends on team size and release frequency.

## Key Concepts

- **Branches**: `main` (production), `develop` (integration), `feature/*` (from `develop`), `release/*` (stabilize), `hotfix/*` (from `main`) — merge back to both `main` and `develop` — [source_OofNbCXEVgU](../../sources/source_OofNbCXEVgU_gitflow-workflow.md).
- **When to use**: breaks down when feature branches are interdependent; simple GitHub Flow (`feature` → `main` PR) suffices until then — [source_OofNbCXEVgU](../../sources/source_OofNbCXEVgU_gitflow-workflow.md) and [source_zv5_OSb6lRo](../../sources/source_zv5_OSb6lRo_github-flow-the-case-of-publishing-an-new-blog-post.md).
- **Releases and tagging**: `git flow release start v1.2.0` / `finish`, `git tag -a v1.2.0`, version bumps — [source_OofNbCXEVgU](../../sources/source_OofNbCXEVgU_gitflow-workflow.md).
- **Conventional commits**: scoped messages supporting changelog generation (referenced in R-package sessions) — [source_Pi__2Hze4_0](../../sources/source_Pi__2Hze4_0_setup-for-r-package-development.md).
- **Alternatives**: GitHub Flow (one `main` + PRs) vs Gitflow (dual `main`/`develop`) — choose by release cadence; drug-store analogy for hotfixes — [source_OofNbCXEVgU](../../sources/source_OofNbCXEVgU_gitflow-workflow.md).
- **Related**: [Branching and Merging](../git/branching-merging.md) for merge mechanics, [Rebasing](../git/rebasing.md) for sequencing interdependent PRs, [GitHub Workflow](../git/github-workflow.md) for PR tooling, [Creating R Packages](../r-packages/creating-packages.md) for CRAN release context.

## Sources

| Video | Title | Views | Last Modified |
|---|---|---|---|
| [-9QCNwmpTOE](https://www.youtube.com/watch?v=-9QCNwmpTOE) | [Test driven development](../../sources/source_-9QCNwmpTOE_test-driven-development.md) | 17 | 2020-12-29T00:00:00Z |
| [4AOKCiAh3NM](https://www.youtube.com/watch?v=4AOKCiAh3NM) | [Testing: Test driven development (TDD)](../../sources/source_4AOKCiAh3NM_testing-test-driven-development-tdd.md) | 48 | 2021-04-13T00:00:00Z |
| [9JcJFber21w](https://www.youtube.com/watch?v=9JcJFber21w) | [Testing: Introduction](../../sources/source_9JcJFber21w_testing-introduction.md) | 59 | 2021-03-30T00:00:00Z |
| [OofNbCXEVgU](https://www.youtube.com/watch?v=OofNbCXEVgU) | [Gitflow workflow](../../sources/source_OofNbCXEVgU_gitflow-workflow.md) | 162 | 2021-05-25T00:00:00Z |
| [Pi__2Hze4_0](https://www.youtube.com/watch?v=Pi__2Hze4_0) | [Setup for R package development](../../sources/source_Pi__2Hze4_0_setup-for-r-package-development.md) | 28 | 2020-02-04T00:00:00Z |
| [_Cl4odbiG78](https://www.youtube.com/watch?v=_Cl4odbiG78) | [Using drake to develop smart, reproducible workflows](../../sources/source__Cl4odbiG78_using-drake-to-develop-smart-reproducible-workflows.md) | 13 | 2020-05-05T00:00:00Z |
| [lq6ZhPFVLTY](https://www.youtube.com/watch?v=lq6ZhPFVLTY) | [Shiny: development workflow](../../sources/source_lq6ZhPFVLTY_shiny-development-workflow.md) | 54 | 2021-07-20T00:00:00Z |
| [mamqEBZpbtw](https://www.youtube.com/watch?v=mamqEBZpbtw) | [cloud: move data between a server and GitHub with the gh CLI](../../sources/source_mamqEBZpbtw_cloud-move-data-between-a-server-and-github-with-the-gh-cli.md) | 41 | 2022-06-28T00:00:00Z |
| [uDx9NkoBqv8](https://www.youtube.com/watch?v=uDx9NkoBqv8) | [Data science on a chromebook](../../sources/source_uDx9NkoBqv8_data-science-on-a-chromebook.md) | 875 | 2022-08-16T00:00:00Z |

## References

- Atlassian — Gitflow Workflow
- Vincent Driessen — A successful Git branching model (original Gitflow article)
- Git Docs — `git branch`, `git merge`, `git tag`
