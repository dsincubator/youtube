---
type: Playbook
title: R Markdown Communication
description: R Markdown documents, Quarto, GitHub-flavored markdown, mixing prose
  and code for reproducible communication
lang: en
tags:
- ds-incubator
generated:
  by: agent:okf-wiki-builder/1.0
  at: '2026-09-08T04:00:00Z'
status: draft
sources:
- id: -L2A_7XvD6Y
  resource: https://www.youtube.com/watch?v=-L2A_7XvD6Y
  title: Working with Git and GitHub from RStudio (part 2)
  author: process:yt-dlp
  usage_count: 15
  last_modified: '2020-08-18T00:00:00Z'
- id: -ho1CfoMHKQ
  resource: https://www.youtube.com/watch?v=-ho1CfoMHKQ
  title: 2020 09 08 code reviews -- in practice
  author: process:yt-dlp
  usage_count: 18
  last_modified: '2020-09-08T00:00:00Z'
- id: 0-zQ69P6VsY
  resource: https://www.youtube.com/watch?v=0-zQ69P6VsY
  title: 'Tidy EDA: The data-science workflow and toolkit: An overview'
  author: process:yt-dlp
  usage_count: 48
  last_modified: '2021-11-02T00:00:00Z'
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
- id: F92p3elUUSE
  resource: https://www.youtube.com/watch?v=F92p3elUUSE
  title: Publish a site on GitHub
  author: process:yt-dlp
  usage_count: 19
  last_modified: '2020-06-09T00:00:00Z'
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
- id: eQ-BFO3eZX8
  resource: https://www.youtube.com/watch?v=eQ-BFO3eZX8
  title: https://github.com/2DegreesInvesting/ds-incubator/issues/47
  author: process:yt-dlp
  usage_count: 21
  last_modified: '2020-06-02T00:00:00Z'
- id: erv1yJaNID8
  resource: https://www.youtube.com/watch?v=erv1yJaNID8
  title: 'reprex: overview'
  author: process:yt-dlp
  usage_count: 78
  last_modified: '2021-10-05T00:00:00Z'
- id: h6koYxwQFuE
  resource: https://www.youtube.com/watch?v=h6koYxwQFuE
  title: Working with Git and GitHub from RStudio (part 1)
  author: process:yt-dlp
  usage_count: 55
  last_modified: '2020-08-18T00:00:00Z'
- id: kNV8dDGF7Hw
  resource: https://www.youtube.com/watch?v=kNV8dDGF7Hw
  title: Conversaciones productivas sobre codigo (demo)
  author: process:yt-dlp
  usage_count: 5
  last_modified: '2020-09-01T00:00:00Z'
- id: moAei68dxr0
  resource: https://www.youtube.com/watch?v=moAei68dxr0
  title: 'ds.rpy: Running Python code from RStudio'
  author: process:yt-dlp
  usage_count: 373
  last_modified: '2022-07-26T00:00:00Z'
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

# R Markdown Communication

## Overview

R Markdown is the communicate phase of the data-science workflow: prose and code co-exist and knit to a report. [source_0-zQ69P6VsY](../../sources/source_0-zQ69P6VsY_tidy-eda-the-data-science-workflow-and-toolkit-an-overview.md) opens the series by knitting a `github_document` (`.md` rendered by GitHub vs raw `.html`), explaining YAML and `echo=TRUE/FALSE`. The reprex trilogy ([source_erv1yJaNID8](../../sources/source_erv1yJaNID8_reprex-overview.md), [source_BOcl8iuiDvU](../../sources/source_BOcl8iuiDvU_reprex-do-s-and-don-ts.md), [source_q17jsQrBPt0](../../sources/source_q17jsQrBPt0_reprex-package-philosophy.md), [source_wJnI0F_A-bU](../../sources/source_wJnI0F_A-bU_creating-reproducible-examples.md)) and communication talks ([source_4IXcu1g0zfk](../../sources/source_4IXcu1g0zfk_productive-conversations-about-code-part-1-of-2.md), [source_1lpcCHfozh0](../../sources/source_1lpcCHfozh0_conversaciones-productivas-sobre-codigo-argumentos.md), [source_H4ucsYPrC0g](../../sources/source_H4ucsYPrC0g_productive-conversations-about-code-part-2-of-2-demo.md), [source_kNV8dDGF7Hw](../../sources/source_kNV8dDGF7Hw_conversaciones-productivas-sobre-codigo-demo.md), [source_-ho1CfoMHKQ](../../sources/source_-ho1CfoMHKQ_2020-09-08-code-reviews-in-practice.md), [source_-L2A_7XvD6Y](../../sources/source_-L2A_7XvD6Y_working-with-git-and-github-from-rstudio-part-2.md)) frame minimal reproducible examples as the social version of R Markdown, while [source_F92p3elUUSE](../../sources/source_F92p3elUUSE_publish-a-site-on-github.md), [source_c3jANTGkB1U](../../sources/source_c3jANTGkB1U_shiny-publishing.md), [source_h6koYxwQFuE](../../sources/source_h6koYxwQFuE_working-with-git-and-github-from-rstudio-part-1.md), [source_eQ-BFO3eZX8](../../sources/source_eQ-BFO3eZX8_https-github-com-2degreesinvesting-ds-incubator-issues-47.md), [source_AUIJif93OJA](../../sources/source_AUIJif93OJA_a-systematic-debugging-workflow.md), [source_moAei68dxr0](../../sources/source_moAei68dxr0_ds-rpy-running-python-code-from-rstudio.md) add publishing, GitHub, and debugging contexts.

This Playbook complements [Tidyverse Data Science Workflow](../tidyverse/workflow-overview.md) and links to [Reproducible Examples](../communication/reprex.md) and [Project-Oriented Workflow](../workflow/project-oriented-workflow.md).

## Key Concepts

- **R Markdown structure**: YAML header (`output: github_document`), setup chunk ```{r setup, echo=TRUE}```, prose + ```{r}``` chunks; `github_document` knits `.Rmd` → `.md` so GitHub renders the report as webpage, not raw HTML — [source_0-zQ69P6VsY](../../sources/source_0-zQ69P6VsY_tidy-eda-the-data-science-workflow-and-toolkit-an-overview.md).
- **Chunk options**: `echo=TRUE` shows code + output, `echo=FALSE` output only; fig size etc. — [source_0-zQ69P6VsY](../../sources/source_0-zQ69P6VsY_tidy-eda-the-data-science-workflow-and-toolkit-an-overview.md).
- **Reprex as shareable R Markdown**: `reprex` renders clipboard code in a fresh temp session and copies commented output (`#>`) so recipient can paste + run; buggy `fs::path_ext_set(c("a","b"), "csv")` → `"a.csv"`/`"b.csv"` vs garbled captures version via `packageVersion("fs")` → 1.3.1 — [source_erv1yJaNID8](../../sources/source_erv1yJaNID8_reprex-overview.md).
- **Creation paths**: RStudio Addin *Render reprex selection* (`Shift+Ctrl+P` → `reprex` → Enter) or console `reprex()` (no args reads clipboard), `reprex(input="01_overview/issue205.R")`, `reprex({{...}})` with braces; `reprex::reprex_clean()` strips output, `Shift+Ctrl+A` auto-formats — [source_erv1yJaNID8](../../sources/source_erv1yJaNID8_reprex-overview.md).
- **Options**: `reprex(session_info=TRUE)` appends collapsible `<details>` with OS + versions; `venue="slack"` wraps triple backticks, `venue="r"` plain R; `wd=here::here()` retains wd for `readRDS("01_overview/paths.rds")` but recipient needs file — [source_erv1yJaNID8](../../sources/source_erv1yJaNID8_reprex-overview.md).
- **Philosophy**: minimal includes dependencies, accessible data, problem description, session context; often clarifies question before posting; venues: GitHub default, Slack, Gist for long snippets — [source_q17jsQrBPt0](../../sources/source_q17jsQrBPt0_reprex-package-philosophy.md), [source_BOcl8iuiDvU](../../sources/source_BOcl8iuiDvU_reprex-do-s-and-don-ts.md).
- **Publishing**: GitHub Pages / `pkgdown` style sharing; RStudio Team contexts — [source_F92p3elUUSE](../../sources/source_F92p3elUUSE_publish-a-site-on-github.md), [source_c3jANTGkB1U](../../sources/source_c3jANTGkB1U_shiny-publishing.md).
- **Cross-language**: [source_moAei68dxr0](../../sources/source_moAei68dxr0_ds-rpy-running-python-code-from-rstudio.md) notes R Markdown can run Python via `reticulate`.

## Example

```r
---
title: "My report"
output: github_document
---
```{r setup, echo=TRUE}
library(tidyverse)
```

library(reprex)
fs::path_ext_set(c("a","b"), "csv")
packageVersion("fs")
reprex(session_info = TRUE)
reprex(venue = "slack")
reprex(input = "01_overview/issue205.R")
reprex({ library(fs); fs::path_ext_set(c("a","b"), "csv") }, wd = ".")
reprex::reprex_clean()
```

## Sources

| Video | Title | Views | Last Modified |
|---|---|---|---|
| [-L2A_7XvD6Y](https://www.youtube.com/watch?v=-L2A_7XvD6Y) | [Working with Git and GitHub from RStudio (part 2)](../../sources/source_-L2A_7XvD6Y_working-with-git-and-github-from-rstudio-part-2.md) | 15 | 2020-08-18T00:00:00Z |
| [-ho1CfoMHKQ](https://www.youtube.com/watch?v=-ho1CfoMHKQ) | [2020 09 08 code reviews -- in practice](../../sources/source_-ho1CfoMHKQ_2020-09-08-code-reviews-in-practice.md) | 18 | 2020-09-08T00:00:00Z |
| [0-zQ69P6VsY](https://www.youtube.com/watch?v=0-zQ69P6VsY) | [Tidy EDA: The data-science workflow and toolkit: An overview](../../sources/source_0-zQ69P6VsY_tidy-eda-the-data-science-workflow-and-toolkit-an-overview.md) | 48 | 2021-11-02T00:00:00Z |
| [1lpcCHfozh0](https://www.youtube.com/watch?v=1lpcCHfozh0) | [Conversaciones productivas sobre codigo (argumentos)](../../sources/source_1lpcCHfozh0_conversaciones-productivas-sobre-codigo-argumentos.md) | 7 | 2020-09-01T00:00:00Z |
| [4IXcu1g0zfk](https://www.youtube.com/watch?v=4IXcu1g0zfk) | [Productive conversations about code (part 1 of 2)](../../sources/source_4IXcu1g0zfk_productive-conversations-about-code-part-1-of-2.md) | 13 | 2020-09-01T00:00:00Z |
| [AUIJif93OJA](https://www.youtube.com/watch?v=AUIJif93OJA) | [A systematic debugging workflow](../../sources/source_AUIJif93OJA_a-systematic-debugging-workflow.md) | 64 | 2024-06-04T00:00:00Z |
| [BOcl8iuiDvU](https://www.youtube.com/watch?v=BOcl8iuiDvU) | [reprex: Do's and don'ts](../../sources/source_BOcl8iuiDvU_reprex-do-s-and-don-ts.md) | 20 | 2021-10-12T00:00:00Z |
| [F92p3elUUSE](https://www.youtube.com/watch?v=F92p3elUUSE) | [Publish a site on GitHub](../../sources/source_F92p3elUUSE_publish-a-site-on-github.md) | 19 | 2020-06-09T00:00:00Z |
| [H4ucsYPrC0g](https://www.youtube.com/watch?v=H4ucsYPrC0g) | [Productive conversations about code (part 2 of 2 -- demo)](../../sources/source_H4ucsYPrC0g_productive-conversations-about-code-part-2-of-2-demo.md) | 7 | 2020-09-01T00:00:00Z |
| [_y_vnRM19lc](https://www.youtube.com/watch?v=_y_vnRM19lc) | [Setting expectations for open source participation: reprex](../../sources/source__y_vnRM19lc_setting-expectations-for-open-source-participation-reprex.md) | 8 | 2020-06-23T00:00:00Z |
| [c3jANTGkB1U](https://www.youtube.com/watch?v=c3jANTGkB1U) | [Shiny: Publishing](../../sources/source_c3jANTGkB1U_shiny-publishing.md) | 47 | 2021-08-10T00:00:00Z |
| [eQ-BFO3eZX8](https://www.youtube.com/watch?v=eQ-BFO3eZX8) | [https://github.com/2DegreesInvesting/ds-incubator/issues/47](../../sources/source_eQ-BFO3eZX8_https-github-com-2degreesinvesting-ds-incubator-issues-47.md) | 21 | 2020-06-02T00:00:00Z |
| [erv1yJaNID8](https://www.youtube.com/watch?v=erv1yJaNID8) | [reprex: overview](../../sources/source_erv1yJaNID8_reprex-overview.md) | 78 | 2021-10-05T00:00:00Z |
| [h6koYxwQFuE](https://www.youtube.com/watch?v=h6koYxwQFuE) | [Working with Git and GitHub from RStudio (part 1)](../../sources/source_h6koYxwQFuE_working-with-git-and-github-from-rstudio-part-1.md) | 55 | 2020-08-18T00:00:00Z |
| [kNV8dDGF7Hw](https://www.youtube.com/watch?v=kNV8dDGF7Hw) | [Conversaciones productivas sobre codigo (demo)](../../sources/source_kNV8dDGF7Hw_conversaciones-productivas-sobre-codigo-demo.md) | 5 | 2020-09-01T00:00:00Z |
| [moAei68dxr0](https://www.youtube.com/watch?v=moAei68dxr0) | [ds.rpy: Running Python code from RStudio](../../sources/source_moAei68dxr0_ds-rpy-running-python-code-from-rstudio.md) | 373 | 2022-07-26T00:00:00Z |
| [q17jsQrBPt0](https://www.youtube.com/watch?v=q17jsQrBPt0) | [reprex: Package philosophy](../../sources/source_q17jsQrBPt0_reprex-package-philosophy.md) | 20 | 2021-10-19T00:00:00Z |
| [wJnI0F_A-bU](https://www.youtube.com/watch?v=wJnI0F_A-bU) | [Creating reproducible examples](../../sources/source_wJnI0F_A-bU_creating-reproducible-examples.md) | 13 | 2019-12-10T00:00:00Z |

## References

- Hadley Wickham — *R for Data Science* (Communicate, R Markdown)
- `rmarkdown`, `quarto`, `reprex` documentation
