---
type: Playbook
title: Testing Fundamentals
description: Introduction to testing, test structure, and basic workflow in R
lang: en
tags:
- ds-incubator
generated:
  by: agent:okf-wiki-builder/1.0
  at: '2026-09-08T04:00:00Z'
status: draft
sources:
- id: 9JcJFber21w
  resource: https://www.youtube.com/watch?v=9JcJFber21w
  title: 'Testing: Introduction'
  author: process:yt-dlp
  usage_count: 59
  last_modified: '2021-03-30T00:00:00Z'
---

# Testing Fundamentals

## Overview

Testing is introduced as the shift from manual inspection in the console to automated tests that can be run any number of times, crucial once a program exceeds what fits in one head and the impact of a change cannot be predicted. The series frames the work as "turning every mouse click into code" — painful at first but saving time from the mid-run onward. The single source for this topic ([source_9JcJFber21w](../../sources/source_9JcJFber21w_testing-introduction.md), 59 views) anchors on Hadley Wickham's *Mastering Shiny* testing chapter (and *R Packages* Testing chapter) as the most up-to-date synthesis.

The anatomy of a `testthat` test is taught with three parts: a string declaring intent, generating minimal explicit toy data on the fly (e.g., named vector `x` with elements `a=1`, `b=2` to test `as_vector` stripping names), and an expectation comparing actual output to expected output. Four levels of testing are outlined from the book: (1) functions (unit), (2) reactive components, (3) browser behavior (JavaScript), and (4) visuals (e.g., plots). The incubator series focuses on level 1 unit testing and level 4 visuals; key advice is to test at the lowest possible level for speed and stability, while design becomes more testable when functions accept injected parameters.

This fundamentals page underpins all subsequent testing topics and connects to package workflows where `usethis::use_testthat()` scaffolds the `tests/` directory.

## Key Concepts

- **Manual vs automated**: console inspection is ephemeral; `testthat` tests are repeatable and fast — [source_9JcJFber21w](../../sources/source_9JcJFber21w_testing-introduction.md).
- **Test anatomy**: intent string + toy data + `expect_*()` comparison — example `as_vector()` stripping names — [source_9JcJFber21w](../../sources/source_9JcJFber21w_testing-introduction.md).
- **Four levels**: 1) functions (unit) 2) reactive 3) browser 4) visuals — focus on 1 and 4 — [source_9JcJFber21w](../../sources/source_9JcJFber21w_testing-introduction.md).
- **Lowest-level principle**: test at the lowest feasible level for speed/stability; inject parameters to make design testable — [source_9JcJFber21w](../../sources/source_9JcJFber21w_testing-introduction.md).
- **Setup**: `usethis::use_testthat()` creates `tests/testthat/` — see [Creating R Packages](../r-packages/creating-packages.md) and [Package Testing Infrastructure](../r-packages/package-testing.md).
- **Next steps**: see [Test-Driven Development](../testing/test-driven-development.md), [Snapshot Tests](../testing/snapshot-tests.md), [Code Coverage](../testing/code-coverage.md).

## Sources

| Video | Title | Views | Last Modified |
|---|---|---|---|
| [9JcJFber21w](https://www.youtube.com/watch?v=9JcJFber21w) | [Testing: Introduction](../../sources/source_9JcJFber21w_testing-introduction.md) | 59 | 2021-03-30T00:00:00Z |

## References

- Hadley Wickham — *Mastering Shiny* Ch. Testing (testing levels, test anatomy)
- Hadley Wickham — *R Packages* Ch. Testing
- testthat documentation — `expect_equal()`, `expect_snapshot()`
