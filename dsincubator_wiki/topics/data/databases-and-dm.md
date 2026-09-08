---
type: Reference
title: Relational Databases and dm
description: Working with relational databases in R, dm package, dbt structure, and
  data validation
lang: en
tags:
- ds-incubator
generated:
  by: agent:okf-wiki-builder/1.0
  at: '2026-09-08T04:00:00Z'
status: draft
sources:
- id: DeLK1OKNQlw
  resource: https://www.youtube.com/watch?v=DeLK1OKNQlw
  title: 'ds.database: Relational data with the dm package'
  author: process:yt-dlp
  usage_count: 251
  last_modified: '2022-09-13T00:00:00Z'
- id: DfVoYtCQlfU
  resource: https://www.youtube.com/watch?v=DfVoYtCQlfU
  title: The flow of data and Get data directly form the database
  author: process:yt-dlp
  usage_count: 24
  last_modified: '2020-04-28T00:00:00Z'
- id: FPZfMUwV73o
  resource: https://www.youtube.com/watch?v=FPZfMUwV73o
  title: 'R packages: Documenting'
  author: process:yt-dlp
  usage_count: 10
  last_modified: '2020-02-25T00:00:00Z'
- id: H9lARi3re9I
  resource: https://www.youtube.com/watch?v=H9lARi3re9I
  title: 'ds.database: Using a Relational Database Management System (RDBMS)'
  author: process:yt-dlp
  usage_count: 335
  last_modified: '2022-09-27T00:00:00Z'
- id: MJZ7ZsfG5lM
  resource: https://www.youtube.com/watch?v=MJZ7ZsfG5lM
  title: Wrapping up our discussion on how to manage and use data
  author: process:yt-dlp
  usage_count: 6
  last_modified: '2020-05-26T00:00:00Z'
- id: NuXgJtl9QDw
  resource: https://www.youtube.com/watch?v=NuXgJtl9QDw
  title: terminal. Running commands as administrator
  author: process:yt-dlp
  usage_count: 37
  last_modified: '2022-05-24T00:00:00Z'
- id: QxgEn2fwIOk
  resource: https://www.youtube.com/watch?v=QxgEn2fwIOk
  title: dbt installation
  author: process:yt-dlp
  usage_count: 76
  last_modified: '2024-06-22T00:00:00Z'
- id: Ulz8Vfnr2P4
  resource: https://www.youtube.com/watch?v=Ulz8Vfnr2P4
  title: 'ds.database: Validate data quality'
  author: process:yt-dlp
  usage_count: 107
  last_modified: '2022-09-20T00:00:00Z'
- id: WmzqpTZtFAw
  resource: https://www.youtube.com/watch?v=WmzqpTZtFAw
  title: dbt overview
  author: process:yt-dlp
  usage_count: 17
  last_modified: '2024-06-21T00:00:00Z'
- id: gGXwszGqZxM
  resource: https://www.youtube.com/watch?v=gGXwszGqZxM
  title: dbt structure
  author: process:yt-dlp
  usage_count: 40
  last_modified: '2024-06-24T00:00:00Z'
- id: pCo14eM-KkQ
  resource: https://www.youtube.com/watch?v=pCo14eM-KkQ
  title: 'webdata: Using APIs'
  author: process:yt-dlp
  usage_count: 78
  last_modified: '2022-01-25T00:00:00Z'
- id: qvQ_YmyjK0U
  resource: https://www.youtube.com/watch?v=qvQ_YmyjK0U
  title: 'ds.database: Relational data with dplyr'
  author: process:yt-dlp
  usage_count: 126
  last_modified: '2022-08-30T00:00:00Z'
---

# Relational Databases and dm

## Overview

Relational data in R is handled via DBI + `dm` + `dbt`. This Reference synthesizes three strands: RDBMS concepts ([source_H9lARi3re9I](../../sources/source_H9lARi3re9I_ds-database-using-a-relational-database-management-system-rdbms.md)), `dm`/`dplyr` relational patterns ([source_DeLK1OKNQlw](../../sources/source_DeLK1OKNQlw_ds-database-relational-data-with-the-dm-package.md), [source_qvQ_YmyjK0U](../../sources/source_qvQ_YmyjK0U_ds-database-relational-data-with-dplyr.md), [source_DfVoYtCQlfU](../../sources/source_DfVoYtCQlfU_the-flow-of-data-and-get-data-directly-form-the-database.md)), and `dbt` lineage ([source_QxgEn2fwIOk](../../sources/source_QxgEn2fwIOk_dbt-installation.md), [source_gGXwszGqZxM](../../sources/source_gGXwszGqZxM_dbt-structure.md), [source_WmzqpTZtFAw](../../sources/source_WmzqpTZtFAw_dbt-overview.md)), plus validation ([source_Ulz8Vfnr2P4](../../sources/source_Ulz8Vfnr2P4_ds-database-validate-data-quality.md)).

Query path complements [Web APIs](../workflow/web-apis.md) and [Tidying Data](../data/tidying-data.md); design in [Tidyverse Workflow](../tidyverse/workflow-overview.md).

## Key Concepts

- **RDBMS basics** ([source_H9lARi3re9I](../../sources/source_H9lARi3re9I_ds-database-using-a-relational-database-management-system-rdbms.md)): database = collection of tables with keys; `DBI::dbConnect(RSQLite::SQLite(), ":memory:")` / Postgres via `odbc`; `tbl(con, "my_table")` is lazy.
- **dm model** ([source_DeLK1OKNQlw](../../sources/source_DeLK1OKNQlw_ds-database-relational-data-with-the-dm-package.md)): `dm::dm(...)` wraps tables → `dm_add_pk` / `dm_add_fk` declares keys → `dm_draw` visualizes; `dm::copy_to` pushes local frames to DB.
- **dplyr on DB** ([source_qvQ_YmyjK0U](../../sources/source_qvQ_YmyjK0U_ds-database-relational-data-with-dplyr.md), [source_DfVoYtCQlfU](../../sources/source_DfVoYtCQlfU_the-flow-of-data-and-get-data-directly-form-the-database.md)): `tbl(con,"x") %>% filter %>% mutate %>% show_query` composes SQL; `collect()` materializes; prefer `filter` early to push predicate to DB.
- **dbt lineage** ([source_QxgEn2fwIOk](../../sources/source_QxgEn2fwIOk_dbt-installation.md), [source_gGXwszGqZxM](../../sources/source_gGXwszGqZxM_dbt-structure.md), [source_WmzqpTZtFAw](../../sources/source_WmzqpTZtFAw_dbt-overview.md)): `models/*.sql` with `{{ ref("stg_*") }}` → `dbt run` / `dbt test` / `dbt docs generate`; installation via `pip install dbt` / homebrew, `profiles.yml` holds `host`/`user`/`pass`.
- **Validation** ([source_Ulz8Vfnr2P4](../../sources/source_Ulz8Vfnr2P4_ds-database-validate-data-quality.md), [source_MJZ7ZsfG5lM](../../sources/source_MJZ7ZsfG5lM_wrapping-up-our-discussion-on-how-to-manage-and-use-data.md)): `dm_validate`, `pointblank` / `validate` checks for key uniqueness and FK integrity before `copy_to`.

## Example

```r
library(DBI); library(dplyr); library(dm)
con <- dbConnect(RSQLite::SQLite(), ":memory:")
copy_to(con, mtcars, "mtcars", temporary=FALSE)

my_dm <- dm(mtcars=tbl(con,"mtcars")) %>%
  dm_add_pk(mtcars, mpg)  # example key
my_dm %>% dm_draw()
tbl(con,"mtcars") %>% filter(cyl==6) %>% show_query() %>% collect()
```
```sql
-- models/stg_orders.sql
select * from {{ ref('raw_orders') }} where amount is not null
```
```bash
dbt run; dbt test; dbt docs generate && dbt docs serve
```

## Sources

| Video | Title | Views | Last Modified |
|---|---|---|---|
| [DeLK1OKNQlw](https://www.youtube.com/watch?v=DeLK1OKNQlw) | [ds.database: Relational data with the dm package](../../sources/source_DeLK1OKNQlw_ds-database-relational-data-with-the-dm-package.md) | 251 | 2022-09-13T00:00:00Z |
| [DfVoYtCQlfU](https://www.youtube.com/watch?v=DfVoYtCQlfU) | [The flow of data and Get data directly form the database](../../sources/source_DfVoYtCQlfU_the-flow-of-data-and-get-data-directly-form-the-database.md) | 24 | 2020-04-28T00:00:00Z |
| [FPZfMUwV73o](https://www.youtube.com/watch?v=FPZfMUwV73o) | [R packages: Documenting](../../sources/source_FPZfMUwV73o_r-packages-documenting.md) | 10 | 2020-02-25T00:00:00Z |
| [H9lARi3re9I](https://www.youtube.com/watch?v=H9lARi3re9I) | [ds.database: Using a Relational Database Management System (RDBMS)](../../sources/source_H9lARi3re9I_ds-database-using-a-relational-database-management-system-rdbms.md) | 335 | 2022-09-27T00:00:00Z |
| [MJZ7ZsfG5lM](https://www.youtube.com/watch?v=MJZ7ZsfG5lM) | [Wrapping up our discussion on how to manage and use data](../../sources/source_MJZ7ZsfG5lM_wrapping-up-our-discussion-on-how-to-manage-and-use-data.md) | 6 | 2020-05-26T00:00:00Z |
| [NuXgJtl9QDw](https://www.youtube.com/watch?v=NuXgJtl9QDw) | [terminal. Running commands as administrator](../../sources/source_NuXgJtl9QDw_terminal-running-commands-as-administrator.md) | 37 | 2022-05-24T00:00:00Z |
| [QxgEn2fwIOk](https://www.youtube.com/watch?v=QxgEn2fwIOk) | [dbt installation](../../sources/source_QxgEn2fwIOk_dbt-installation.md) | 76 | 2024-06-22T00:00:00Z |
| [Ulz8Vfnr2P4](https://www.youtube.com/watch?v=Ulz8Vfnr2P4) | [ds.database: Validate data quality](../../sources/source_Ulz8Vfnr2P4_ds-database-validate-data-quality.md) | 107 | 2022-09-20T00:00:00Z |
| [WmzqpTZtFAw](https://www.youtube.com/watch?v=WmzqpTZtFAw) | [dbt overview](../../sources/source_WmzqpTZtFAw_dbt-overview.md) | 17 | 2024-06-21T00:00:00Z |
| [gGXwszGqZxM](https://www.youtube.com/watch?v=gGXwszGqZxM) | [dbt structure](../../sources/source_gGXwszGqZxM_dbt-structure.md) | 40 | 2024-06-24T00:00:00Z |
| [pCo14eM-KkQ](https://www.youtube.com/watch?v=pCo14eM-KkQ) | [webdata: Using APIs](../../sources/source_pCo14eM-KkQ_webdata-using-apis.md) | 78 | 2022-01-25T00:00:00Z |
| [qvQ_YmyjK0U](https://www.youtube.com/watch?v=qvQ_YmyjK0U) | [ds.database: Relational data with dplyr](../../sources/source_qvQ_YmyjK0U_ds-database-relational-data-with-dplyr.md) | 126 | 2022-08-30T00:00:00Z |

## References

- dm documentation (cynkra/dm)
- DBI / dbplyr documentation
- dbt documentation (docs.getdbt.com)
- RSQLite / odbc docs

