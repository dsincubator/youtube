---
type: Playbook
title: Code Reviews
description: Productive code conversations, code review best practices, reviewing
  pull requests, and feedback
lang: en
tags:
- ds-incubator
generated:
  by: agent:okf-wiki-builder/1.0
  at: '2026-09-08T04:00:00Z'
status: draft
sources:
- id: -ho1CfoMHKQ
  resource: https://www.youtube.com/watch?v=-ho1CfoMHKQ
  title: 2020 09 08 code reviews -- in practice
  author: process:yt-dlp
  usage_count: 18
  last_modified: '2020-09-08T00:00:00Z'
- id: 1lpcCHfozh0
  resource: https://www.youtube.com/watch?v=1lpcCHfozh0
  title: Conversaciones productivas sobre codigo (argumentos)
  author: process:yt-dlp
  usage_count: 7
  last_modified: '2020-09-01T00:00:00Z'
- id: 4IXcu1g0zfk
  resource: https://www.youtube.com/watch?v=4IXcu1g0zfk
  title: Productive conversations about code (part 1 of 2)
  author: process:yt-dlp
  usage_count: 13
  last_modified: '2020-09-01T00:00:00Z'
- id: H4ucsYPrC0g
  resource: https://www.youtube.com/watch?v=H4ucsYPrC0g
  title: Productive conversations about code (part 2 of 2 -- demo)
  author: process:yt-dlp
  usage_count: 7
  last_modified: '2020-09-01T00:00:00Z'
- id: OofNbCXEVgU
  resource: https://www.youtube.com/watch?v=OofNbCXEVgU
  title: Gitflow workflow
  author: process:yt-dlp
  usage_count: 162
  last_modified: '2021-05-25T00:00:00Z'
- id: ciJpIWs3t3k
  resource: https://www.youtube.com/watch?v=ciJpIWs3t3k
  title: Suggest/commit changes directly on a GitHub PR
  author: process:yt-dlp
  usage_count: 7007
  last_modified: '2024-06-04T00:00:00Z'
- id: zv5_OSb6lRo
  resource: https://www.youtube.com/watch?v=zv5_OSb6lRo
  title: 'GitHub flow: The case of publishing an new blog post'
  author: process:yt-dlp
  usage_count: 24
  last_modified: '2020-07-28T00:00:00Z'
---

# Code Reviews

## Overview

Code review is taught as the incubator's core feedback loop linking GitHub PRs, reprex, and pairing. Anchors are [source_-ho1CfoMHKQ](../../sources/source_-ho1CfoMHKQ_2020-09-08-code-reviews-in-practice.md) (practical checklist), [source_H4ucsYPrC0g](../../sources/source_H4ucsYPrC0g_productive-conversations-about-code-part-2-of-2-demo.md) / [source_4IXcu1g0zfk](../../sources/source_4IXcu1g0zfk_productive-conversations-about-code-part-1-of-2.md) / [source_1lpcCHfozh0](../../sources/source_1lpcCHfozh0_conversaciones-productivas-sobre-codigo-argumentos.md) (conversation principles), with PR tooling from [source_ciJpIWs3t3k](../../sources/source_ciJpIWs3t3k_suggest-commit-changes-directly-on-a-github-pr.md). It feeds directly into [Productive Code Conversations](../communication/productive-conversations.md) and [Reproducible Examples](../communication/reprex.md).

Pair with [Productive Code Conversations](../communication/productive-conversations.md) and [Reproducible Examples](../communication/reprex.md); PR flow in [GitHub Workflow](../git/github-workflow.md) and [GitHub Issues Workflow](../data/github-issues-workflow.md).

## Key Concepts

- **Why review** ([source_-ho1CfoMHKQ](../../sources/source_-ho1CfoMHKQ_2020-09-08-code-reviews-in-practice.md)): catches bugs early, spreads knowledge, keeps main green; small frequent reviews beat big infrequent ones.
- **Conversation principles** ([source_4IXcu1g0zfk](../../sources/source_4IXcu1g0zfk_productive-conversations-about-code-part-1-of-2.md), [source_1lpcCHfozh0](../../sources/source_1lpcCHfozh0_conversaciones-productivas-sobre-codigo-argumentos.md)): reproducibility, speed (async), small size, clarity; ask arguments (why) not just solutions.
- **PR mechanics** ([source_ciJpIWs3t3k](../../sources/source_ciJpIWs3t3k_suggest-commit-changes-directly-on-a-github-pr.md)): Review → Suggest → Commit suggestion vs Comment → Approve/Request changes; `gh pr view` / `gh pr review`.
- **Reviewer checklist** ([source_-ho1CfoMHKQ](../../sources/source_-ho1CfoMHKQ_2020-09-08-code-reviews-in-practice.md)): run `reprex`, test edge cases, check naming/style, suggest concrete code not vague "fix this".
- **Author prep** ([source_-ho1CfoMHKQ](../../sources/source_-ho1CfoMHKQ_2020-09-08-code-reviews-in-practice.md)): keep diff <200 lines, add reprex, self-review diff first, link issue — see [GitHub Issues Workflow](../data/github-issues-workflow.md).
- **Pairing alternative** ([source_UR4vwDkJMhc](../../sources/source_UR4vwDkJMhc_pair-programming.md), [source_BAS8yfLBnog](../../sources/source_BAS8yfLBnog_strong-style-pair-programming-submitting-an-r-package-to-cran.md)): strong-style pairing for synchronous review — see [Pairs Programming](../data/pairs-programming.md).

## Example

```r
# author: keep PR small with reprex
reprex::reprex({
  library(dplyr)
  tibble(x=c(1,NA)) %>% filter(!is.na(x))
})
```
```bash
gh pr view 42
gh pr review 42 --approve --body "LGTM, consider req(input$x)"
# reviewer: Suggested change button -> Commit suggestion
```

## Sources

| Video | Title | Views | Last Modified |
|---|---|---|---|
| [-ho1CfoMHKQ](https://www.youtube.com/watch?v=-ho1CfoMHKQ) | [2020 09 08 code reviews -- in practice](../../sources/source_-ho1CfoMHKQ_2020-09-08-code-reviews-in-practice.md) | 18 | 2020-09-08T00:00:00Z |
| [1lpcCHfozh0](https://www.youtube.com/watch?v=1lpcCHfozh0) | [Conversaciones productivas sobre codigo (argumentos)](../../sources/source_1lpcCHfozh0_conversaciones-productivas-sobre-codigo-argumentos.md) | 7 | 2020-09-01T00:00:00Z |
| [4IXcu1g0zfk](https://www.youtube.com/watch?v=4IXcu1g0zfk) | [Productive conversations about code (part 1 of 2)](../../sources/source_4IXcu1g0zfk_productive-conversations-about-code-part-1-of-2.md) | 13 | 2020-09-01T00:00:00Z |
| [H4ucsYPrC0g](https://www.youtube.com/watch?v=H4ucsYPrC0g) | [Productive conversations about code (part 2 of 2 -- demo)](../../sources/source_H4ucsYPrC0g_productive-conversations-about-code-part-2-of-2-demo.md) | 7 | 2020-09-01T00:00:00Z |
| [OofNbCXEVgU](https://www.youtube.com/watch?v=OofNbCXEVgU) | [Gitflow workflow](../../sources/source_OofNbCXEVgU_gitflow-workflow.md) | 162 | 2021-05-25T00:00:00Z |
| [ciJpIWs3t3k](https://www.youtube.com/watch?v=ciJpIWs3t3k) | [Suggest/commit changes directly on a GitHub PR](../../sources/source_ciJpIWs3t3k_suggest-commit-changes-directly-on-a-github-pr.md) | 7007 | 2024-06-04T00:00:00Z |
| [zv5_OSb6lRo](https://www.youtube.com/watch?v=zv5_OSb6lRo) | [GitHub flow: The case of publishing an new blog post](../../sources/source_zv5_OSb6lRo_github-flow-the-case-of-publishing-an-new-blog-post.md) | 24 | 2020-07-28T00:00:00Z |

## References

- Google Engineering Practices — Code Review
- reprex documentation
- GitHub Docs — Reviewing pull requests

