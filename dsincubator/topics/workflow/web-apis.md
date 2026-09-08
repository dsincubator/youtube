---
type: Playbook
title: Web APIs and Data
description: Using APIs for data collection, web scraping, and working with web data
  in R
lang: en
tags:
- ds-incubator
generated:
  by: agent:okf-wiki-builder/1.0
  at: '2026-09-08T04:00:00Z'
status: draft
sources:
- id: C29QThEYbYY
  resource: https://www.youtube.com/watch?v=C29QThEYbYY
  title: A/B testing r2dii.plot
  author: process:yt-dlp
  usage_count: 17
  last_modified: '2021-06-08T00:00:00Z'
- id: pCo14eM-KkQ
  resource: https://www.youtube.com/watch?v=pCo14eM-KkQ
  title: 'webdata: Using APIs'
  author: process:yt-dlp
  usage_count: 78
  last_modified: '2022-01-25T00:00:00Z'
- id: sPE6MLGUPy4
  resource: https://www.youtube.com/watch?v=sPE6MLGUPy4
  title: 'webdata: Scrapping'
  author: process:yt-dlp
  usage_count: 32
  last_modified: '2022-01-18T00:00:00Z'
---

# Web APIs and Data

## Overview

Web APIs and scraping extend data import beyond files to live HTTP. Anchors are [source_pCo14eM-KkQ](../../sources/source_pCo14eM-KkQ_webdata-using-apis.md) (API fundamentals with `httr`/`jsonlite`) and [source_sPE6MLGUPy4](../../sources/source_sPE6MLGUPy4_webdata-scrapping.md) (scraping with `rvest`); related is [source_C29QThEYbYY](../../sources/source_C29QThEYbYY_a-b-testing-r2dii-plot.md) (issue data via API). It complements [Docker Use Cases](../docker/docker-use-cases.md) for containerized fetch.

Related to [Relational Databases and dm](../data/databases-and-dm.md) (databases vs APIs); env setup in [Terminal Setup](../terminal/terminal-setup.md) and [Cloud Fundamentals](../cloud/cloud-fundamentals.md).

## Key Concepts

- **API vs scraping** ([source_pCo14eM-KkQ](../../sources/source_pCo14eM-KkQ_webdata-using-apis.md), [source_sPE6MLGUPy4](../../sources/source_sPE6MLGUPy4_webdata-scrapping.md)): API = structured `GET` with token → JSON; scraping = parse HTML when no API (`rvest::read_html` + `html_nodes` + `html_text`).
- **httr flow** ([source_pCo14eM-KkQ](../../sources/source_pCo14eM-KkQ_webdata-using-apis.md)): `httr::GET(url, add_headers(Authorization=paste("token", Sys.getenv("GITHUB_PAT"))), query=list(...))` → `httr::content(resp, as="text")` → `jsonlite::fromJSON` → `tibble`.
- **Pagination & rate limits** ([source_pCo14eM-KkQ](../../sources/source_pCo14eM-KkQ_webdata-using-apis.md), [source_C29QThEYbYY](../../sources/source_C29QThEYbYY_a-b-testing-r2dii-plot.md)): loop `page` param, `gh` CLI / `httr::RETRY`, respect `X-RateLimit-Remaining`.
- **Scraping flow** ([source_sPE6MLGUPy4](../../sources/source_sPE6MLGUPy4_webdata-scrapping.md)): `rvest::read_html(url) %>% html_nodes(".css") %>% html_text() %>% readr::parse_number` plus `polite::bow` / `Sys.sleep` courtesy.
- **Auth via env** ([source_pCo14eM-KkQ](../../sources/source_pCo14eM-KkQ_webdata-using-apis.md)): `usethis::edit_r_environ()` → `GITHUB_PAT=...` → `Sys.getenv`; see [Terminal Setup](../terminal/terminal-setup.md).

## Example

```r
library(httr); library(jsonlite)
resp <- GET("https://api.github.com/repos/2DegreesInvesting/ds-incubator/issues",
            add_headers(Authorization=paste("token", Sys.getenv("GITHUB_PAT"))))
stop_for_status(resp)
issues <- fromJSON(content(resp, as="text", encoding="UTF-8"))
tibble::as_tibble(issues)

library(rvest)
html <- read_html("https://example.com/table")
html %>% html_nodes("table tr td") %>% html_text()
```

## Sources

| Video | Title | Views | Last Modified |
|---|---|---|---|
| [C29QThEYbYY](https://www.youtube.com/watch?v=C29QThEYbYY) | [A/B testing r2dii.plot](../../sources/source_C29QThEYbYY_a-b-testing-r2dii-plot.md) | 17 | 2021-06-08T00:00:00Z |
| [pCo14eM-KkQ](https://www.youtube.com/watch?v=pCo14eM-KkQ) | [webdata: Using APIs](../../sources/source_pCo14eM-KkQ_webdata-using-apis.md) | 78 | 2022-01-25T00:00:00Z |
| [sPE6MLGUPy4](https://www.youtube.com/watch?v=sPE6MLGUPy4) | [webdata: Scrapping](../../sources/source_sPE6MLGUPy4_webdata-scrapping.md) | 32 | 2022-01-18T00:00:00Z |

## References

- httr documentation
- rvest documentation
- GitHub REST API docs
- polite package

