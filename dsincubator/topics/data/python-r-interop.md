---
type: Playbook
title: Python/R Interoperability
description: Running Python code from RStudio, reticulate, and cross-language workflows
lang: en
tags:
- ds-incubator
generated:
  by: agent:okf-wiki-builder/1.0
  at: '2026-09-08T04:00:00Z'
status: draft
sources:
- id: -HTH2ylnT7Q
  resource: https://www.youtube.com/watch?v=-HTH2ylnT7Q
  title: 'ds databricks4r: Databricks for RStudio users'
  author: process:yt-dlp
  usage_count: 1166
  last_modified: '2023-10-22T00:00:00Z'
- id: moAei68dxr0
  resource: https://www.youtube.com/watch?v=moAei68dxr0
  title: 'ds.rpy: Running Python code from RStudio'
  author: process:yt-dlp
  usage_count: 373
  last_modified: '2022-07-26T00:00:00Z'
---

# Python/R Interoperability

## Overview

Python↔R interop via `reticulate` (R→Python) and `rpy2` / `rpy` (Python→R) lets the incubator keep tidyverse idioms while calling Python libs (pandas, sklearn) or vice versa. Anchors are [source_moAei68dxr0](../../sources/source_moAei68dxr0_ds-rpy-running-python-code-from-rstudio.md) (rpy demo) and [source_-HTH2ylnT7Q](../../sources/source_-HTH2ylnT7Q_ds-databricks4r-databricks-for-rstudio-users.md) (Databricks mixed notebooks).

Pairs with [Databricks and RStudio](../data/databricks-rstudio.md); env in [Terminal Setup](../terminal/terminal-setup.md); doc via [R Markdown Communication](../tidyverse/rmarkdown-communication.md).

## Key Concepts

- **reticulate (R→Python)** ([source_moAei68dxr0](../../sources/source_moAei68dxr0_ds-rpy-running-python-code-from-rstudio.md)): `library(reticulate); py_config()` → `import pandas as pd` via `py_run_string` / `import()` → `r_to_py(tibble)` / `py_to_r(df)` bridges types.
- **rpy (Python→R)** ([source_moAei68dxr0](../../sources/source_moAei68dxr0_ds-rpy-running-python-code-from-rstudio.md)): `import rpy2.robjects` (or `rpy`) → `robjects.r('library(dplyr)')` → shove R objects into Python via `pandas2ri`.
- **RStudio support** ([source_moAei68dxr0](../../sources/source_moAei68dxr0_ds-rpy-running-python-code-from-rstudio.md)): reticulate's Python REPL pane, `use_condaenv`/`use_virtualenv` selectors, `RMarkdown` engines `python` and `r` in same doc — see [R Markdown Communication](../tidyverse/rmarkdown-communication.md).
- **Databricks mixed** ([source_-HTH2ylnT7Q](../../sources/source_-HTH2ylnT7Q_ds-databricks4r-databricks-for-rstudio-users.md)): notebook cells `%python` / `%r`; data stays on Spark/Delta, language switches with `reticulate` under hood — see [Databricks and RStudio](../data/databricks-rstudio.md).
- **When to cross** ([source_moAei68dxr0](../../sources/source_moAei68dxr0_ds-rpy-running-python-code-from-rstudio.md)): Python for deep-learn/sklearn, R for tidyverse/viz; keep interface narrow and test with `testthat` — see [Code Quality](../data/code-quality.md).

## Example

```r
library(reticulate)
use_condaenv("r-reticulate")
py_run_string("import pandas as pd; df = pd.DataFrame({'x':[1,2]})")
py$df %>% dplyr::mutate(y=x+1)

# Python calling R
# Python: import rpy2.robjects as ro; ro.r('library(dplyr)')
```

## Sources

| Video | Title | Views | Last Modified |
|---|---|---|---|
| [-HTH2ylnT7Q](https://www.youtube.com/watch?v=-HTH2ylnT7Q) | [ds databricks4r: Databricks for RStudio users](../../sources/source_-HTH2ylnT7Q_ds-databricks4r-databricks-for-rstudio-users.md) | 1166 | 2023-10-22T00:00:00Z |
| [moAei68dxr0](https://www.youtube.com/watch?v=moAei68dxr0) | [ds.rpy: Running Python code from RStudio](../../sources/source_moAei68dxr0_ds-rpy-running-python-code-from-rstudio.md) | 373 | 2022-07-26T00:00:00Z |

## References

- reticulate documentation (rstudio/reticulate)
- rpy2 documentation
- Databricks Python/R interop guide

