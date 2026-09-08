---
type: Playbook
title: Test-Driven Development
description: 'TDD methodology: write tests first, implement code, refactor; applying
  to R packages'
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
- id: co082qNN_Cs
  resource: https://www.youtube.com/watch?v=co082qNN_Cs
  title: 'R packages: Testing'
  author: process:yt-dlp
  usage_count: 15
  last_modified: '2020-02-18T00:00:00Z'
---

# Test-Driven Development

## Overview

Test-driven development is taught via the *Mastering Shiny* testing chapter's framing of three occasions for writing tests: after discovering a bug (write a test that exposes the bug, fix the code, keep the test as a regression canary), after exploratory code (once expected behavior becomes clear), and before code — test-driven development proper. The TDD demo is deliberately fast ("watching a tennis match") to expose the ordering; fluency comes only with practice, but the rule itself is accessible and prescribed: red → green → refactor.

The concrete rule is: first write a failing test that states the desired property, then write the minimum code that makes it pass, then aggressively refactor under the safety net of the tests. The pair [source_-9QCNwmpTOE](../../sources/source_-9QCNwmpTOE_test-driven-development.md) and [source_4AOKCiAh3NM](../../sources/source_4AOKCiAh3NM_testing-test-driven-development-tdd.md) demonstrate this in small R functions, while [source_9JcJFber21w](../../sources/source_9JcJFber21w_testing-introduction.md) supplies the test anatomy (intent string, toy data, expectation) and [source_co082qNN_Cs](../../sources/source_co082qNN_Cs_r-packages-testing.md) shows package integration via `usethis::use_testthat()` and `tests/testthat/` layout.

TDD is positioned as the workflow that justifies the later tooling topics: snapshot tests make coarse coverage quick before refactor, and coverage metrics confirm the safety net exists before aggressive refactoring.

## Key Concepts

- **Three occasions**: after a bug (regression canary), after exploratory code, before code (TDD proper) — [source_-9QCNwmpTOE](../../sources/source_-9QCNwmpTOE_test-driven-development.md).
- **Red–Green–Refactor**: failing test → minimal passing code → refactor under tests; speed is for exposure, not mastery — [source_4AOKCiAh3NM](../../sources/source_4AOKCiAh3NM_testing-test-driven-development-tdd.md).
- **Package scaffolding**: `usethis::use_testthat()`, `tests/testthat/test-*.R`, `devtools::test()` — [source_co082qNN_Cs](../../sources/source_co082qNN_Cs_r-packages-testing.md).
- **Test anatomy** (prerequisite): intent string + minimal toy data + `expect_*()` — [source_9JcJFber21w](../../sources/source_9JcJFber21w_testing-introduction.md) and [Testing Fundamentals](../testing/testing-fundamentals.md).
- **Refactoring payoff**: snapshot tests ([Snapshot Tests](../testing/snapshot-tests.md)) and coverage ([Code Coverage](../testing/code-coverage.md)) quantify safety before restructuring.
- **Bug-canary example**: write `expect_equal()` that currently fails, fix function, test becomes permanent guard — [source_-9QCNwmpTOE](../../sources/source_-9QCNwmpTOE_test-driven-development.md).

## Sources

| Video | Title | Views | Last Modified |
|---|---|---|---|
| [-9QCNwmpTOE](https://www.youtube.com/watch?v=-9QCNwmpTOE) | [Test driven development](../../sources/source_-9QCNwmpTOE_test-driven-development.md) | 17 | 2020-12-29T00:00:00Z |
| [4AOKCiAh3NM](https://www.youtube.com/watch?v=4AOKCiAh3NM) | [Testing: Test driven development (TDD)](../../sources/source_4AOKCiAh3NM_testing-test-driven-development-tdd.md) | 48 | 2021-04-13T00:00:00Z |
| [9JcJFber21w](https://www.youtube.com/watch?v=9JcJFber21w) | [Testing: Introduction](../../sources/source_9JcJFber21w_testing-introduction.md) | 59 | 2021-03-30T00:00:00Z |
| [co082qNN_Cs](https://www.youtube.com/watch?v=co082qNN_Cs) | [R packages: Testing](../../sources/source_co082qNN_Cs_r-packages-testing.md) | 15 | 2020-02-18T00:00:00Z |

## References

- Hadley Wickham — *Mastering Shiny* Ch. Testing (three occasions, TDD framing)
- testthat — `test_that()`, `expect_equal()`, `expect_snapshot()`
