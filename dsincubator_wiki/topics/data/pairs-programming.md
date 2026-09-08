---
type: Playbook
title: Pairs Programming and Strong Style
description: Pair programming techniques, strong-style pair programming, and collaboration
  strategies
lang: en
tags:
- ds-incubator
generated:
  by: agent:okf-wiki-builder/1.0
  at: '2026-09-08T04:00:00Z'
status: draft
sources:
- id: BAS8yfLBnog
  resource: https://www.youtube.com/watch?v=BAS8yfLBnog
  title: 'Strong-style pair-programming: Submitting an R package to CRAN'
  author: process:yt-dlp
  usage_count: 638
  last_modified: '2020-03-16T00:00:00Z'
- id: UR4vwDkJMhc
  resource: https://www.youtube.com/watch?v=UR4vwDkJMhc
  title: Pair programming
  author: process:yt-dlp
  usage_count: 8
  last_modified: '2020-03-10T00:00:00Z'
---

# Pairs Programming and Strong Style

## Overview

Pair programming in the incubator follows strong-style (idea originator ≠ typist) as a structured code-review alternative. Anchors are [source_UR4vwDkJMhc](../../sources/source_UR4vwDkJMhc_pair-programming.md) (general pairing) and [source_BAS8yfLBnog](../../sources/source_BAS8yfLBnog_strong-style-pair-programming-submitting-an-r-package-to-cran.md) (strong-style demo for CRAN submission). It pairs with [Code Reviews](../communication/code-reviews.md) and [Code Quality](../data/code-quality.md).

Async complement [Code Reviews](../communication/code-reviews.md) and [Productive Conversations](../communication/productive-conversations.md); quality guard in [Code Quality](../data/code-quality.md).

## Key Concepts

- **Roles** ([source_UR4vwDkJMhc](../../sources/source_UR4vwDkJMhc_pair-programming.md), [source_BAS8yfLBnog](../../sources/source_BAS8yfLBnog_strong-style-pair-programming-submitting-an-r-package-to-cran.md)): navigator (owns idea, reviews each keystroke) vs driver (types, asks clarifying questions); swap on timer or task boundary.
- **Strong-style** ([source_BAS8yfLBnog](../../sources/source_BAS8yfLBnog_strong-style-pair-programming-submitting-an-r-package-to-cran.md)): "for an idea to go from head to code, it must go through someone else's hands" — enforces articulation and catches hidden assumptions.
- **Session shape** ([source_UR4vwDkJMhc](../../sources/source_UR4vwDkJMhc_pair-programming.md)): 25-min pomodoro, one screen shared, navigator dictates intent ("add `stopifnot(is.character(x))`") not keystrokes, driver verbalizes.
- **When to pair** ([source_UR4vwDkJMhc](../../sources/source_UR4vwDkJMhc_pair-programming.md)): onboarding, CRAN gate (`R CMD check` failures), debugging unfamiliar code; solo for trivial edits.
- **CRAN case** ([source_BAS8yfLBnog](../../sources/source_BAS8yfLBnog_strong-style-pair-programming-submitting-an-r-package-to-cran.md)): pair applied to polish `r2dii` submission (DESCRIPTION/NAMESPACE roxygen fixes) — see [CRAN Submission](../r-packages/cran-submission.md).

## Example

```md
# strong-style session
Navigator: "We need to guard filter_data(x) for character."
Driver: types stopifnot(is.character(x))
Swap every 20-25 min, commit after green tests.
```
```r
filter_data <- function(x){ stopifnot(is.character(x)); x[x>0] }
```

## Sources

| Video | Title | Views | Last Modified |
|---|---|---|---|
| [BAS8yfLBnog](https://www.youtube.com/watch?v=BAS8yfLBnog) | [Strong-style pair-programming: Submitting an R package to CRAN](../../sources/source_BAS8yfLBnog_strong-style-pair-programming-submitting-an-r-package-to-cran.md) | 638 | 2020-03-16T00:00:00Z |
| [UR4vwDkJMhc](https://www.youtube.com/watch?v=UR4vwDkJMhc) | [Pair programming](../../sources/source_UR4vwDkJMhc_pair-programming.md) | 8 | 2020-03-10T00:00:00Z |

## References

- Birgitta Böckeler — Strong-Style Pair Programming
- r2dii CRAN submission walkthrough

