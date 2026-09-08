---
type: Metric
title: Code Coverage
description: Measuring and improving code coverage, testthat coverage reporting
lang: en
tags:
- ds-incubator
generated:
  by: agent:okf-wiki-builder/1.0
  at: '2026-09-08T04:00:00Z'
status: draft
sources:
- id: bKRFCOkmpiw
  resource: https://www.youtube.com/watch?v=bKRFCOkmpiw
  title: 'Testing: Code coverage'
  author: process:yt-dlp
  usage_count: 32
  last_modified: '2021-04-20T00:00:00Z'
---

# Code Coverage

## Overview

Code coverage is defined as the analysis of which lines are exercised by the test suite, used to guide safe refactoring of already-written code. The single source [source_bKRFCOkmpiw](../../sources/source_bKRFCOkmpiw_testing-code-coverage.md) (continuing after the TDD session) argues: before touching a function such as `load_file()` you must ensure its behavior is covered by tests, otherwise refactoring can silently break it. The supporting package is `covr` (caption "cover package" → `covr`).

The generic API is `covr::package_coverage()`, `covr::file_coverage()`, `covr::report()`, and `covr::code_coverage()` with `covr::percent_covered()` helpers; results are shown as line-by-line green/red in the HTML report and as percentages in the console. The workflow pairs with `testthat`: coverage gates signal when the safety net is sufficient to refactor aggressively, and the metric is tracked across PRs rather than treated as an absolute target.

As a Metric topic, this page inventories how coverage is measured; interpretation and improvement lives in the companion Playbooks [Testing Fundamentals](../testing/testing-fundamentals.md) and [Test-Driven Development](../testing/test-driven-development.md), with snapshot tests accelerating coarse coverage for hard-to-test outputs.

## Key Concepts

- **Definition**: ratio of executed lines/branches to total; by-file and by-package — [source_bKRFCOkmpiw](../../sources/source_bKRFCOkmpiw_testing-code-coverage.md).
- **covr package** (`covr` ← "cover package"): `covr::package_coverage()`, `covr::file_coverage("R/load_file.R")`, `covr::report()`, `covr::percent_covered()` — [source_bKRFCOkmpiw](../../sources/source_bKRFCOkmpiw_testing-code-coverage.md).
- **Report reading**: HTML `report()` shows green (covered) / red (uncovered) per line; console `percent_covered()` summarizes — [source_bKRFCOkmpiw](../../sources/source_bKRFCOkmpiw_testing-code-coverage.md).
- **Refactor gate**: require coverage before restructuring `load_file()`-like functions — [source_bKRFCOkmpiw](../../sources/source_bKRFCOkmpiw_testing-code-coverage.md).
- **Snapshot shortcut**: `expect_snapshot()` quickly adds coarse coverage for snapshot-friendly outputs — see [Snapshot Tests](../testing/snapshot-tests.md).
- **Related**: [Testing Fundamentals](../testing/testing-fundamentals.md) (four levels), [Test-Driven Development](../testing/test-driven-development.md) (red-green-refactor under coverage), [Package Testing Infrastructure](../r-packages/package-testing.md) (CI integration).

## Sources

| Video | Title | Views | Last Modified |
|---|---|---|---|
| [bKRFCOkmpiw](https://www.youtube.com/watch?v=bKRFCOkmpiw) | [Testing: Code coverage](../../sources/source_bKRFCOkmpiw_testing-code-coverage.md) | 32 | 2021-04-20T00:00:00Z |

## References

- covr — `package_coverage()`, `report()`, `percent_covered()`
- testthat + covr integration via `covr::report()` HTML
