---
type: Playbook
title: Reproducible Examples
description: 'Creating reprex: package philosophy, do''s and don''ts, and how to share
  reproducible code snippets'
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
- id: AUIJif93OJA
  resource: https://www.youtube.com/watch?v=AUIJif93OJA
  title: A systematic debugging workflow
  author: process:yt-dlp
  usage_count: 64
  last_modified: '2024-06-04T00:00:00Z'
- id: BOcl8iuiDvU
  resource: https://www.youtube.com/watch?v=BOcl8iuiDvU
  title: 'reprex: Do''s and don''ts'
  author: process:yt-dlp
  usage_count: 20
  last_modified: '2021-10-12T00:00:00Z'
- id: H4ucsYPrC0g
  resource: https://www.youtube.com/watch?v=H4ucsYPrC0g
  title: Productive conversations about code (part 2 of 2 -- demo)
  author: process:yt-dlp
  usage_count: 7
  last_modified: '2020-09-01T00:00:00Z'
- id: _y_vnRM19lc
  resource: https://www.youtube.com/watch?v=_y_vnRM19lc
  title: 'Setting expectations for open source participation: reprex'
  author: process:yt-dlp
  usage_count: 8
  last_modified: '2020-06-23T00:00:00Z'
- id: c3jANTGkB1U
  resource: https://www.youtube.com/watch?v=c3jANTGkB1U
  title: 'Shiny: Publishing'
  author: process:yt-dlp
  usage_count: 47
  last_modified: '2021-08-10T00:00:00Z'
- id: erv1yJaNID8
  resource: https://www.youtube.com/watch?v=erv1yJaNID8
  title: 'reprex: overview'
  author: process:yt-dlp
  usage_count: 78
  last_modified: '2021-10-05T00:00:00Z'
- id: kNV8dDGF7Hw
  resource: https://www.youtube.com/watch?v=kNV8dDGF7Hw
  title: Conversaciones productivas sobre codigo (demo)
  author: process:yt-dlp
  usage_count: 5
  last_modified: '2020-09-01T00:00:00Z'
- id: q17jsQrBPt0
  resource: https://www.youtube.com/watch?v=q17jsQrBPt0
  title: 'reprex: Package philosophy'
  author: process:yt-dlp
  usage_count: 20
  last_modified: '2021-10-19T00:00:00Z'
- id: wJnI0F_A-bU
  resource: https://www.youtube.com/watch?v=wJnI0F_A-bU
  title: Creating reproducible examples
  author: process:yt-dlp
  usage_count: 13
  last_modified: '2019-12-10T00:00:00Z'
---

# Reproducible Examples

## Overview

A `reprex` (reproducible example) is the minimum runnable snippet plus session info that lets someone else reproduce a bug or idea in one paste. Anchors are [source_erv1yJaNID8](../../sources/source_erv1yJaNID8_reprex-overview.md) (overview), [source_BOcl8iuiDvU](../../sources/source_BOcl8iuiDvU_reprex-do-s-and-don-ts.md) (dos/don'ts), [source_q17jsQrBPt0](../../sources/source_q17jsQrBPt0_reprex-package-philosophy.md) (philosophy), [source_wJnI0F_A-bU](../../sources/source_wJnI0F_A-bU_creating-reproducible-examples.md) (creation), with open-source framing ([source__y_vnRM19lc](../../sources/source__y_vnRM19lc_setting-expectations-for-open-source-participation-reprex.md)) and conversation context ([source_4IXcu1g0zfk](../../sources/source_4IXcu1g0zfk_productive-conversations-about-code-part-1-of-2.md), [source_1lpcCHfozh0](../../sources/source_1lpcCHfozh0_conversaciones-productivas-sobre-codigo-argumentos.md)).

Use in [Code Reviews](../communication/code-reviews.md) and [Productive Code Conversations](../communication/productive-conversations.md); powers [Debugging Workflows](../workflow/debugging-workflows.md).

## Key Concepts

- **Philosophy** ([source_q17jsQrBPt0](../../sources/source_q17jsQrBPt0_reprex-package-philosophy.md)): help others help you by removing ambiguity; low-friction, copy-paste runnable, includes dependencies.
- **Create** ([source_wJnI0F_A-bU](../../sources/source_wJnI0F_A-bU_creating-reproducible-examples.md), [source_erv1yJaNID8](../../sources/source_erv1yJaNID8_reprex-overview.md)): in RStudio select code → `reprex::reprex()` / Addin → chooses `venue="gh"` (GitHub-flavored) or `"r"`/`"slack"`; auto-runs with fresh session, trims `>`, captures output + `sessionInfo()` opt.
- **Dos** ([source_BOcl8iuiDvU](../../sources/source_BOcl8iuiDvU_reprex-do-s-and-don-ts.md)): minimal data (`tibble`, `dput(head)`, `reprex::reprex(si=TRUE)`), `library()` explicit, `set.seed` if random, small focused question.
- **Don'ts** ([source_BOcl8iuiDvU](../../sources/source_BOcl8iuiDvU_reprex-do-s-and-don-ts.md)): no screenshots, no `View()`, no absolute paths, no truncated error, no huge data dump — use `datapasta`/`dput` for subset.
- **Open-source expectations** ([source__y_vnRM19lc](../../sources/source__y_vnRM19lc_setting-expectations-for-open-source-participation-reprex.md)): concise reprex raises response likelihood; maintainers prioritize reproducible issues.
- **Pair with code reviews** ([source_-ho1CfoMHKQ](../../sources/source_-ho1CfoMHKQ_2020-09-08-code-reviews-in-practice.md)): every PR description and bug report should include reprex — see [Code Reviews](../communication/code-reviews.md) and [Productive Conversations](../communication/productive-conversations.md).

## Example

```r
reprex::reprex({
  library(dplyr)
  # minimal data inline
  df <- tibble::tibble(x=c(1, NA, 3), y=c("a","b","c"))
  df %>% filter(!is.na(x)) %>% summarise(n=n())
}, venue="gh", si=TRUE, advertise=FALSE)
# paste output into GitHub issue/PR
```
```r
# don'ts: avoid this
# x <- read.csv("/Users/me/huge.csv")  # absolute path, huge
# View(x)  # not reproducible
```

## Sources

| Video | Title | Views | Last Modified |
|---|---|---|---|
| [-ho1CfoMHKQ](https://www.youtube.com/watch?v=-ho1CfoMHKQ) | [2020 09 08 code reviews -- in practice](../../sources/source_-ho1CfoMHKQ_2020-09-08-code-reviews-in-practice.md) | 18 | 2020-09-08T00:00:00Z |
| [1lpcCHfozh0](https://www.youtube.com/watch?v=1lpcCHfozh0) | [Conversaciones productivas sobre codigo (argumentos)](../../sources/source_1lpcCHfozh0_conversaciones-productivas-sobre-codigo-argumentos.md) | 7 | 2020-09-01T00:00:00Z |
| [4IXcu1g0zfk](https://www.youtube.com/watch?v=4IXcu1g0zfk) | [Productive conversations about code (part 1 of 2)](../../sources/source_4IXcu1g0zfk_productive-conversations-about-code-part-1-of-2.md) | 13 | 2020-09-01T00:00:00Z |
| [AUIJif93OJA](https://www.youtube.com/watch?v=AUIJif93OJA) | [A systematic debugging workflow](../../sources/source_AUIJif93OJA_a-systematic-debugging-workflow.md) | 64 | 2024-06-04T00:00:00Z |
| [BOcl8iuiDvU](https://www.youtube.com/watch?v=BOcl8iuiDvU) | [reprex: Do's and don'ts](../../sources/source_BOcl8iuiDvU_reprex-do-s-and-don-ts.md) | 20 | 2021-10-12T00:00:00Z |
| [H4ucsYPrC0g](https://www.youtube.com/watch?v=H4ucsYPrC0g) | [Productive conversations about code (part 2 of 2 -- demo)](../../sources/source_H4ucsYPrC0g_productive-conversations-about-code-part-2-of-2-demo.md) | 7 | 2020-09-01T00:00:00Z |
| [_y_vnRM19lc](https://www.youtube.com/watch?v=_y_vnRM19lc) | [Setting expectations for open source participation: reprex](../../sources/source__y_vnRM19lc_setting-expectations-for-open-source-participation-reprex.md) | 8 | 2020-06-23T00:00:00Z |
| [c3jANTGkB1U](https://www.youtube.com/watch?v=c3jANTGkB1U) | [Shiny: Publishing](../../sources/source_c3jANTGkB1U_shiny-publishing.md) | 47 | 2021-08-10T00:00:00Z |
| [erv1yJaNID8](https://www.youtube.com/watch?v=erv1yJaNID8) | [reprex: overview](../../sources/source_erv1yJaNID8_reprex-overview.md) | 78 | 2021-10-05T00:00:00Z |
| [kNV8dDGF7Hw](https://www.youtube.com/watch?v=kNV8dDGF7Hw) | [Conversaciones productivas sobre codigo (demo)](../../sources/source_kNV8dDGF7Hw_conversaciones-productivas-sobre-codigo-demo.md) | 5 | 2020-09-01T00:00:00Z |
| [q17jsQrBPt0](https://www.youtube.com/watch?v=q17jsQrBPt0) | [reprex: Package philosophy](../../sources/source_q17jsQrBPt0_reprex-package-philosophy.md) | 20 | 2021-10-19T00:00:00Z |
| [wJnI0F_A-bU](https://www.youtube.com/watch?v=wJnI0F_A-bU) | [Creating reproducible examples](../../sources/source_wJnI0F_A-bU_creating-reproducible-examples.md) | 13 | 2019-12-10T00:00:00Z |

## References

- reprex package (tidyverse/reprex)
- Jenny Bryan — reprex do's and don'ts
- R for Data Science — Reproducible examples

