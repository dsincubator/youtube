---
type: Playbook
title: Shiny Publishing
description: Publishing Shiny apps, deploying to web, hosting options, and Shiny Server
lang: en
tags:
- ds-incubator
generated:
  by: agent:okf-wiki-builder/1.0
  at: '2026-09-08T04:00:00Z'
status: draft
sources:
- id: JdFA31-vJUE
  resource: https://www.youtube.com/watch?v=JdFA31-vJUE
  title: 'cloud: Use case -- host shiny apps'
  author: process:yt-dlp
  usage_count: 115
  last_modified: '2022-06-14T00:00:00Z'
- id: c3jANTGkB1U
  resource: https://www.youtube.com/watch?v=c3jANTGkB1U
  title: 'Shiny: Publishing'
  author: process:yt-dlp
  usage_count: 47
  last_modified: '2021-08-10T00:00:00Z'
- id: p-p_4ZcDIGw
  resource: https://www.youtube.com/watch?v=p-p_4ZcDIGw
  title: 'Shiny: Your first shiny app'
  author: process:yt-dlp
  usage_count: 275
  last_modified: '2021-06-01T00:00:00Z'
---

# Shiny Publishing

## Overview

Publishing moves a local `app.R` to a URL others can visit. The incubator contrasts `rsconnect` (shinyapps.io / RStudio Connect via `publish` button) with containerized hosting on [Google Cloud Run](../cloud/google-cloud-run.md). Anchors are [source_c3jANTGkB1U](../../sources/source_c3jANTGkB1U_shiny-publishing.md) (the publish flow), [source_JdFA31-vJUE](../../sources/source_JdFA31-vJUE_cloud-use-case-host-shiny-apps.md) (cloud host case), and [source_p-p_4ZcDIGw](../../sources/source_p-p_4ZcDIGw_shiny-your-first-shiny-app.md) (first app as deployable artifact).

Builds on [Shiny Fundamentals](../shiny/shiny-basics.md); deploy via [Google Cloud Run](../cloud/google-cloud-run.md) and [Docker Fundamentals](../docker/docker-fundamentals.md); quality via [Shiny Debugging](../shiny/shiny-debugging.md).

## Key Concepts

- **Local run vs deployed** ([source_p-p_4ZcDIGw](../../sources/source_p-p_4ZcDIGw_shiny-your-first-shiny-app.md)): `shinyApp(ui,server)` / Run App button runs on `localhost`; publishing pushes code + `renv.lock` / `DESCRIPTION` to a server.
- **rsconnect path** ([source_c3jANTGkB1U](../../sources/source_c3jANTGkB1U_shiny-publishing.md)): install `rsconnect`, `rsconnect::setAccountInfo(name, token, secret)` (account → Tokens), then `rsconnect::deployApp()` or RStudio's blue Publish button; select files to bundle, choose shinyapps.io or Connect server.
- **Bundle contents** ([source_c3jANTGkB1U](../../sources/source_c3jANTGkB1U_shiny-publishing.md)): `app.R` / `ui.R`+`server.R`, `rsconnect/` metadata, dependencies auto-detected; `publishDoc` / `deployApp` logs show deployment progress.
- **Cloud alternative** ([source_JdFA31-vJUE](../../sources/source_JdFA31-vJUE_cloud-use-case-host-shiny-apps.md), [source_PRKOMCCOlI0](../../sources/source_PRKOMCCOlI0_continuously-build-and-deploy-a-shiny-app-on-google-cloud-run.md)): Docker image (`rocker/shiny` base) → push to Container Registry → Cloud Run scales to zero, billed per request; continuous build via GitHub Actions.
- **Post-deploy** ([source_c3jANTGkB1U](../../sources/source_c3jANTGkB1U_shiny-publishing.md)): manage instance size, logs via dashboard; see [Docker Fundamentals](../docker/docker-fundamentals.md) and [Google Cloud Run](../cloud/google-cloud-run.md).

## Example

```r
# rsconnect path
install.packages("rsconnect")
rsconnect::setAccountInfo(name="<account>", token="<token>", secret="<secret>")
rsconnect::deployApp("path/to/app")  # or click Publish in RStudio

# Cloud Run path (sketch)
# Dockerfile FROM rocker/shiny
# docker build -t gcr.io/<project>/myapp . && docker push gcr.io/<project>/myapp
# gcloud run deploy myapp --image gcr.io/<project>/myapp --platform managed
```

## Sources

| Video | Title | Views | Last Modified |
|---|---|---|---|
| [JdFA31-vJUE](https://www.youtube.com/watch?v=JdFA31-vJUE) | [cloud: Use case -- host shiny apps](../../sources/source_JdFA31-vJUE_cloud-use-case-host-shiny-apps.md) | 115 | 2022-06-14T00:00:00Z |
| [c3jANTGkB1U](https://www.youtube.com/watch?v=c3jANTGkB1U) | [Shiny: Publishing](../../sources/source_c3jANTGkB1U_shiny-publishing.md) | 47 | 2021-08-10T00:00:00Z |
| [p-p_4ZcDIGw](https://www.youtube.com/watch?v=p-p_4ZcDIGw) | [Shiny: Your first shiny app](../../sources/source_p-p_4ZcDIGw_shiny-your-first-shiny-app.md) | 275 | 2021-06-01T00:00:00Z |

## References

- rsconnect documentation
- RStudio Connect administration guide
- Google Cloud Run documentation

