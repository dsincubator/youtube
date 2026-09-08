---
type: Playbook
title: Productive Code Conversations
description: 'Principles for effective code discussions: reproducibility, speed, size,
  clarity, and tools (English and Spanish with lang: es tags)'
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

# Productive Code Conversations

## Overview

Productive code conversations are framed as four constraints: reproducible, fast, small, kind. This Playbook distills the bilingual series [source_4IXcu1g0zfk](../../sources/source_4IXcu1g0zfk_productive-conversations-about-code-part-1-of-2.md) / [source_H4ucsYPrC0g](../../sources/source_H4ucsYPrC0g_productive-conversations-about-code-part-2-of-2-demo.md) (English) and [source_1lpcCHfozh0](../../sources/source_1lpcCHfozh0_conversaciones-productivas-sobre-codigo-argumentos.md) / [source_kNV8dDGF7Hw](../../sources/source_kNV8dDGF7Hw_conversaciones-productivas-sobre-codigo-demo.md) (Spanish, `lang: es`), plus debugging support ([source_AUIJif93OJA](../../sources/source_AUIJif93OJA_a-systematic-debugging-workflow.md)) and `reprex` philosophy. It is the companion to [Code Reviews](../communication/code-reviews.md) and [Reproducible Examples](../communication/reprex.md).

See [Code Reviews](../communication/code-reviews.md) and [Reproducible Examples](../communication/reprex.md); tooling in [GitHub Workflow](../git/github-workflow.md) and [Debugging Workflows](../workflow/debugging-workflows.md).

## Key Concepts

- **Reproducible** ([source_4IXcu1g0zfk](../../sources/source_4IXcu1g0zfk_productive-conversations-about-code-part-1-of-2.md), [source_erv1yJaNID8](../../sources/source_erv1yJaNID8_reprex-overview.md)): attach `reprex` with `library()` calls and `sessionInfo()`; receiver can copy-paste to reproduce.
- **Fast / async** ([source_4IXcu1g0zfk](../../sources/source_4IXcu1g0zfk_productive-conversations-about-code-part-1-of-2.md)): prefer async PR comments over meetings; `gh pr review` + `reprex` avoids scheduling.
- **Small** ([source_4IXcu1g0zfk](../../sources/source_4IXcu1g0zfk_productive-conversations-about-code-part-1-of-2.md)): one topic per issue/PR, <200 lines, focused title; demo [source_H4ucsYPrC0g](../../sources/source_H4ucsYPrC0g_productive-conversations-about-code-part-2-of-2-demo.md) shows splitting big WIP.
- **Kind / arguments** ([source_1lpcCHfozh0](../../sources/source_1lpcCHfozh0_conversaciones-productivas-sobre-codigo-argumentos.md), [source_kNV8dDGF7Hw](../../sources/source_kNV8dDGF7Hw_conversaciones-productivas-sobre-codigo-demo.md)): discuss *arguments* (why) not people; Spanish series mirrors English with `lang: es` (e.g., `velocidad del equipo / team velocity`).
- **Tools** ([source_BOcl8iuiDvU](../../sources/source_BOcl8iuiDvU_reprex-do-s-and-don-ts.md), [source_q17jsQrBPt0](../../sources/source_q17jsQrBPt0_reprex-package-philosophy.md)): `reprex::reprex()`, `reprex::reprex_selection()`, GitHub suggested changes; see [Reproducible Examples](../communication/reprex.md).
- **Debugging link** ([source_AUIJif93OJA](../../sources/source_AUIJif93OJA_a-systematic-debugging-workflow.md)): productive questions include "what did you try?" + minimal reprex — see [Debugging Workflows](../workflow/debugging-workflows.md).

## Example

```r
# before asking, produce reprex
reprex::reprex({
  library(dplyr)
  df <- tibble(x=c(1, NA, 3))
  df %>% filter(x>1)  # unexpected NA row?
}, venue="gh")
# share plus context: reprex + sessionInfo + what-try
```
```md
<!-- PR description template -->
## Why (argument)
Small: fixes #47 isolate NA handling
## Reproducible
\`\`\`r reprex output \`\`\`
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

- reprex documentation
- GitHub Docs — Suggested changes
- Conversaciones productivas (Spanish series)

