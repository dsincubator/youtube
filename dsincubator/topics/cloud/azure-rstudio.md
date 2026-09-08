---
type: Reference
title: Azure and RStudio Server
description: Azure RStudio server, remote computing setups, and cloud IDE configurations
lang: en
tags:
- ds-incubator
generated:
  by: agent:okf-wiki-builder/1.0
  at: '2026-09-08T04:00:00Z'
status: draft
sources:
- id: 16Xn0ueeP-E
  resource: https://www.youtube.com/watch?v=16Xn0ueeP-E
  title: Azure, RStudio server, and pins
  author: process:yt-dlp
  usage_count: 559
  last_modified: '2020-05-19T00:00:00Z'
- id: MJZ7ZsfG5lM
  resource: https://www.youtube.com/watch?v=MJZ7ZsfG5lM
  title: Wrapping up our discussion on how to manage and use data
  author: process:yt-dlp
  usage_count: 6
  last_modified: '2020-05-26T00:00:00Z'
- id: _pBqBfjTKI4
  resource: https://www.youtube.com/watch?v=_pBqBfjTKI4
  title: 'cloud: Introduction to cloud computing'
  author: process:yt-dlp
  usage_count: 39
  last_modified: '2022-05-31T00:00:00Z'
---

# Azure and RStudio Server

## Overview

Azure-hosted RStudio Server is presented as the incubator's shared compute for `pins`-based data distribution. [source_16Xn0ueeP-E](../../sources/source_16Xn0ueeP-E_azure-rstudio-server-and-pins.md) is the anchor: participants join an RStudio Cloud/Server project, configure Azure credentials once, then reuse a server-side cache so expensive computations are not repeated per user. The pattern pairs with the [Data Movement and Storage](../cloud/data-movement.md) playbook and the general cloud framing in [Cloud Computing Fundamentals](../cloud/cloud-fundamentals.md).

See [Cloud Computing Fundamentals](../cloud/cloud-fundamentals.md) and [Data Movement and Storage](../cloud/data-movement.md); persists similarly to Docker volumes ([Docker Fundamentals](../docker/docker-fundamentals.md)).

## Key Concepts

- **RStudio Server on cloud** ([source_16Xn0ueeP-E](../../sources/source_16Xn0ueeP-E_azure-rstudio-server-and-pins.md)): RStudio Cloud / Server project (referred to as "nursery/our studio server") as shared execution where `~/cache/pins` persists across users.
- **Azure blob board** ([source_16Xn0ueeP-E](../../sources/source_16Xn0ueeP-E_azure-rstudio-server-and-pins.md)): Azure storage as a `pins` board holding central datasets (demo key `empty cars` / `mtcars`), fetched programmatically via `pin_get`.
- **Credential setup** ([source_16Xn0ueeP-E](../../sources/source_16Xn0ueeP-E_azure-rstudio-server-and-pins.md)): `usethis::edit_r_environ()` → add three Azure key-value lines (account/key/endpoint with secret pasted from chat), trailing newline, Save, `Shift+Ctrl+F10` restart.
- **Board registration & discovery** ([source_16Xn0ueeP-E](../../sources/source_16Xn0ueeP-E_azure-rstudio-server-and-pins.md)): `library(pins)` → `board_register_azure()` (no args) → `pin_find("empty cars", board="azure")` / `pin_find("mtcars")` (matches name or description) plus visual via Connections > Pins and Find Pins addin.
- **Shared cache reuse** ([source_16Xn0ueeP-E](../../sources/source_16Xn0ueeP-E_azure-rstudio-server-and-pins.md)): `small_data <- head(my_data)` as stand-in for hour-long compute → `pin(small_data, board="local")` stores in server's `~/cache/pins`; others fetch via `pin_get("small_data", board="local")` without recomputing.
- **Cloud framing** ([source__pBqBfjTKI4](../../sources/source__pBqBfjTKI4_cloud-introduction-to-cloud-computing.md), [source_MJZ7ZsfG5lM](../../sources/source_MJZ7ZsfG5lM_wrapping-up-our-discussion-on-how-to-manage-and-use-data.md)): when data is private or bulky, cloud-hosted RStudio + pinned data avoids repeated internet transfers; see also [Data Movement and Storage](../cloud/data-movement.md).

## Example

```r
library(pins)
usethis::edit_r_environ() # add AZURE_STORAGE_* lines, save, restart (Shift+Ctrl+F10)
board_register_azure()

pin_find("empty cars", board="azure")
my_data <- pin_get("empty cars", board="azure")
head(my_data)

small_data <- head(my_data)  # placeholder for expensive computation
pin(small_data, board="local")
pin_find("small_data", board="local")
pin_get("small_data", board="local")
# Connections tab > Pins  and  Addins > Find Pins  provide GUI equivalents
```

## Sources

| Video | Title | Views | Last Modified |
|---|---|---|---|
| [16Xn0ueeP-E](https://www.youtube.com/watch?v=16Xn0ueeP-E) | [Azure, RStudio server, and pins](../../sources/source_16Xn0ueeP-E_azure-rstudio-server-and-pins.md) | 559 | 2020-05-19T00:00:00Z |
| [MJZ7ZsfG5lM](https://www.youtube.com/watch?v=MJZ7ZsfG5lM) | [Wrapping up our discussion on how to manage and use data](../../sources/source_MJZ7ZsfG5lM_wrapping-up-our-discussion-on-how-to-manage-and-use-data.md) | 6 | 2020-05-26T00:00:00Z |
| [_pBqBfjTKI4](https://www.youtube.com/watch?v=_pBqBfjTKI4) | [cloud: Introduction to cloud computing](../../sources/source__pBqBfjTKI4_cloud-introduction-to-cloud-computing.md) | 39 | 2022-05-31T00:00:00Z |

## References

- pins Azure board documentation
- usethis::edit_r_environ documentation
- RStudio Server administration guide

