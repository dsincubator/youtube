---
type: Playbook
title: Production Workflow
description: From MVP to production, deployment patterns, and production data science
  workflows
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
- id: EB6ODnkdG7A
  resource: https://www.youtube.com/watch?v=EB6ODnkdG7A
  title: 'Shiny: Basic reactivity'
  author: process:yt-dlp
  usage_count: 64
  last_modified: '2021-07-13T00:00:00Z'
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
- id: bKRFCOkmpiw
  resource: https://www.youtube.com/watch?v=bKRFCOkmpiw
  title: 'Testing: Code coverage'
  author: process:yt-dlp
  usage_count: 32
  last_modified: '2021-04-20T00:00:00Z'
- id: pxxcuZH9_yA
  resource: https://www.youtube.com/watch?v=pxxcuZH9_yA
  title: 'Testing: Snapshot tests'
  author: process:yt-dlp
  usage_count: 175
  last_modified: '2021-04-27T00:00:00Z'
- id: xxtpMXvVM3s
  resource: https://www.youtube.com/watch?v=xxtpMXvVM3s
  title: 'Refactoring: How to prepare for dplyr 1.0.0'
  author: process:yt-dlp
  usage_count: 129
  last_modified: '2020-03-24T00:00:00Z'
---

# Production Workflow

## Overview

MVP-to-production is framed as layering engineering rigor (tests, CI, snapshots, coverage) onto an exploratory analysis without rewriting history. The anchor is [source_5wHl9N4fBBU](../../sources/source_5wHl9N4fBBU_ds-production-from-an-mvp-to-production.md), with Git/testing support from [source_7igKU5JVmxM](../../sources/source_7igKU5JVmxM_inspecting-the-history.md) / [source_AxpkFkfTF8o](../../sources/source_AxpkFkfTF8o_git-status-add-rm-cached-commit-log.md) and snapshot/coverage anchors. It builds on [Project-Oriented Workflow](../workflow/project-oriented-workflow.md) and [Reproducible Workflows](../pipelines/reproducible-workflows.md).

Starts at [Project-Oriented Workflow](../workflow/project-oriented-workflow.md) and [Reproducible Workflows](../pipelines/reproducible-workflows.md); ships via [Docker Fundamentals](../docker/docker-fundamentals.md) and [Google Cloud Run](../cloud/google-cloud-run.md).

## Key Concepts

- **MVP vs production** ([source_5wHl9N4fBBU](../../sources/source_5wHl9N4fBBU_ds-production-from-an-mvp-to-production.md)): MVP = script that works once; production = tested, versioned, CI-green, deployable via Docker/Cloud Run.
- **History hygiene** ([source_7igKU5JVmxM](../../sources/source_7igKU5JVmxM_inspecting-the-history.md), [source_AxpkFkfTF8o](../../sources/source_AxpkFkfTF8o_git-status-add-rm-cached-commit-log.md)): `git log --oneline`, `git status`, `git diff` before each production commit; `R CMD check` gates CRAN.
- **Test harness** ([source_5wHl9N4fBBU](../../sources/source_5wHl9N4fBBU_ds-production-from-an-mvp-to-production.md), [source_UeECMfOFIHk](../../sources/source_UeECMfOFIHk_testing-using-snapshot-tests-to-refactor-safely.md), [source_bKRFCOkmpiw](../../sources/source_bKRFCOkmpiw_testing-code-coverage.md)): add `testthat` snapshots to lock current output before refactor, raise coverage from MVP ~0 to guarded; `covr::report` tracks.
- **Refactor safely** ([source_xxtpMXvVM3s](../../sources/source_xxtpMXvVM3s_refactoring-how-to-prepare-for-dplyr-1-0-0.md)): snapshot → refactor (e.g., dplyr 1.0 `across`) → `expect_snapshot` passes → delete legacy.
- **Deploy** ([source_PRKOMCCOlI0](../../sources/source_PRKOMCCOlI0_continuously-build-and-deploy-a-shiny-app-on-google-cloud-run.md), [source_5wHl9N4fBBU](../../sources/source_5wHl9N4fBBU_ds-production-from-an-mvp-to-production.md)): `Dockerfile` + GitHub Actions → Cloud Run / RStudio Connect mirrors MVP's manual run but reproducible — see [Docker Fundamentals](../docker/docker-fundamentals.md).

## Example

```r
# MVP snapshot
testthat::expect_snapshot(my_analysis(mtcars))
# refactor, then
covr::report()
```
```bash
git log --oneline; git status; R CMD check --as-cran
docker build -t myapp . && gcloud run deploy --image gcr.io/.../myapp
```

## Sources

| Video | Title | Views | Last Modified |
|---|---|---|---|
| [-9QCNwmpTOE](https://www.youtube.com/watch?v=-9QCNwmpTOE) | [Test driven development](../../sources/source_-9QCNwmpTOE_test-driven-development.md) | 17 | 2020-12-29T00:00:00Z |
| [4AOKCiAh3NM](https://www.youtube.com/watch?v=4AOKCiAh3NM) | [Testing: Test driven development (TDD)](../../sources/source_4AOKCiAh3NM_testing-test-driven-development-tdd.md) | 48 | 2021-04-13T00:00:00Z |
| [5wHl9N4fBBU](https://www.youtube.com/watch?v=5wHl9N4fBBU) | [ds.production: From an MVP to production](../../sources/source_5wHl9N4fBBU_ds-production-from-an-mvp-to-production.md) | 87 | 2023-06-17T00:00:00Z |
| [7igKU5JVmxM](https://www.youtube.com/watch?v=7igKU5JVmxM) | [Inspecting the history](../../sources/source_7igKU5JVmxM_inspecting-the-history.md) | 21 | 2020-12-15T00:00:00Z |
| [9JcJFber21w](https://www.youtube.com/watch?v=9JcJFber21w) | [Testing: Introduction](../../sources/source_9JcJFber21w_testing-introduction.md) | 59 | 2021-03-30T00:00:00Z |
| [AxpkFkfTF8o](https://www.youtube.com/watch?v=AxpkFkfTF8o) | [git status, add, rm --cached, commit, log](../../sources/source_AxpkFkfTF8o_git-status-add-rm-cached-commit-log.md) | 247 | 2020-09-22T00:00:00Z |
| [EB6ODnkdG7A](https://www.youtube.com/watch?v=EB6ODnkdG7A) | [Shiny: Basic reactivity](../../sources/source_EB6ODnkdG7A_shiny-basic-reactivity.md) | 64 | 2021-07-13T00:00:00Z |
| [MU8E_gpylPE](https://www.youtube.com/watch?v=MU8E_gpylPE) | [git branch (part 1)](../../sources/source_MU8E_gpylPE_git-branch-part-1.md) | 25 | 2020-10-27T00:00:00Z |
| [S4GyNTwj_sc](https://www.youtube.com/watch?v=S4GyNTwj_sc) | [Introduction to version control with Git: Initialize a Git repository](../../sources/source_S4GyNTwj_sc_introduction-to-version-control-with-git-initialize-a-git-repository.md) | 73 | 2020-09-15T00:00:00Z |
| [UeECMfOFIHk](https://www.youtube.com/watch?v=UeECMfOFIHk) | [Testing: Using snapshot tests to refactor safely](../../sources/source_UeECMfOFIHk_testing-using-snapshot-tests-to-refactor-safely.md) | 24 | 2021-05-04T00:00:00Z |
| [bKRFCOkmpiw](https://www.youtube.com/watch?v=bKRFCOkmpiw) | [Testing: Code coverage](../../sources/source_bKRFCOkmpiw_testing-code-coverage.md) | 32 | 2021-04-20T00:00:00Z |
| [pxxcuZH9_yA](https://www.youtube.com/watch?v=pxxcuZH9_yA) | [Testing: Snapshot tests](../../sources/source_pxxcuZH9_yA_testing-snapshot-tests.md) | 175 | 2021-04-27T00:00:00Z |
| [xxtpMXvVM3s](https://www.youtube.com/watch?v=xxtpMXvVM3s) | [Refactoring: How to prepare for dplyr 1.0.0](../../sources/source_xxtpMXvVM3s_refactoring-how-to-prepare-for-dplyr-1-0-0.md) | 129 | 2020-03-24T00:00:00Z |

## References

- usethis production checklist
- testthat snapshot docs
- covr documentation

