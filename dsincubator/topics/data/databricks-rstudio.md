---
type: Reference
title: Databricks and RStudio
description: Using databricks4r for Databricks integration with RStudio
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
---

# Databricks and RStudio

## Overview

Databricks runtime for R (`databricks4r`) is presented as a bridge allowing RStudio users to offload Spark jobs without leaving the tidyverse idiom. The sole anchor is [source_-HTH2ylnT7Q](../../sources/source_-HTH2ylnT7Q_ds-databricks4r-databricks-for-rstudio-users.md), which demos connecting from RStudio to Databricks via `sparklyr`/`databricks4r` and using `dplyr` verbs that translate to Spark SQL.

Compute via [Databricks + dplyr](../tidyverse/dplyr-verbs.md); share via [Data Movement](../cloud/data-movement.md); mix languages in [Python/R Interop](../data/python-r-interop.md).

## Key Concepts

- **Why Databricks for R** ([source_-HTH2ylnT7Q](../../sources/source_-HTH2ylnT7Q_ds-databricks4r-databricks-for-rstudio-users.md)): Spark scales beyond single-machine `dplyr`; Databricks provides managed clusters with R kernel; `databricks4r` wraps auth + cluster config.
- **Connection** ([source_-HTH2ylnT7Q](../../sources/source_-HTH2ylnT7Q_ds-databricks4r-databricks-for-rstudio-users.md)): `library(sparklyr); library(databricks4r)` → `dbConnect(databricks4r::databricks(...), host, token)` with PAT from `usethis::edit_r_environ()`; `spark_connect` variant shown for cluster id + workspace URL.
- **dplyr over Spark** ([source_-HTH2ylnT7Q](../../sources/source_-HTH2ylnT7Q_ds-databricks4r-databricks-for-rstudio-users.md)): `tbl(sc, "hive_table") %>% filter %>% mutate %>% collect` composes Spark SQL lazily, mirroring local `dplyr` — see [dplyr Verbs](../tidyverse/dplyr-verbs.md).
- **Python/R interop** ([source_-HTH2ylnT7Q](../../sources/source_-HTH2ylnT7Q_ds-databricks4r-databricks-for-rstudio-users.md), [source_moAei68dxr0](../../sources/source_moAei68dxr0_ds-rpy-running-python-code-from-rstudio.md)): Databricks notebooks mix `%r` / `%python`; `reticulate` patterns carry over — see [Python/R Interoperability](../data/python-r-interop.md).
- **Managed data path** ([source_-HTH2ylnT7Q](../../sources/source_-HTH2ylnT7Q_ds-databricks4r-databricks-for-rstudio-users.md)): Delta tables as source-of-truth vs local `pins`; see [Data Movement and Storage](../cloud/data-movement.md) and [Relational Databases and dm](../data/databases-and-dm.md).

## Example

```r
library(sparklyr); library(databricks4r)
# .Renviron: DATABRICKS_HOST=..., DATABRICKS_TOKEN=...
sc <- spark_connect(method="databricks", host=Sys.getenv("DATABRICKS_HOST"),
                    token=Sys.getenv("DATABRICKS_TOKEN"))
dplyr::tbl(sc, "my_delta") %>% filter(year>2020) %>% count(sector) %>% collect()
```

## Sources

| Video | Title | Views | Last Modified |
|---|---|---|---|
| [-HTH2ylnT7Q](https://www.youtube.com/watch?v=-HTH2ylnT7Q) | [ds databricks4r: Databricks for RStudio users](../../sources/source_-HTH2ylnT7Q_ds-databricks4r-databricks-for-rstudio-users.md) | 1166 | 2023-10-22T00:00:00Z |

## References

- databricks4r documentation
- sparklyr Databricks guide
- Databricks Runtime for R docs

