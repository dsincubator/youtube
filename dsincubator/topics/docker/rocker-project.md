---
type: Reference
title: Rocker Project
description: Getting started with the Rocker project for R on Docker, Dockerfile best
  practices
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
- id: 3_0gUMqKikw
  resource: https://www.youtube.com/watch?v=3_0gUMqKikw
  title: 'Docker: Managing images'
  author: process:yt-dlp
  usage_count: 38
  last_modified: '2021-09-21T00:00:00Z'
- id: CvOVn2zwi3k
  resource: https://www.youtube.com/watch?v=CvOVn2zwi3k
  title: 'Docker: Using volumes and managing users'
  author: process:yt-dlp
  usage_count: 198
  last_modified: '2021-09-28T00:00:00Z'
- id: NF7HPKt55Yk
  resource: https://www.youtube.com/watch?v=NF7HPKt55Yk
  title: 'cloud: Use cases'
  author: process:yt-dlp
  usage_count: 25
  last_modified: '2022-06-07T00:00:00Z'
- id: OieR0VDxSRk
  resource: https://www.youtube.com/watch?v=OieR0VDxSRk
  title: 'docker: use cases'
  author: process:yt-dlp
  usage_count: 312
  last_modified: '2021-09-07T00:00:00Z'
- id: _pBqBfjTKI4
  resource: https://www.youtube.com/watch?v=_pBqBfjTKI4
  title: 'cloud: Introduction to cloud computing'
  author: process:yt-dlp
  usage_count: 39
  last_modified: '2022-05-31T00:00:00Z'
- id: kgGCNGLyqdg
  resource: https://www.youtube.com/watch?v=kgGCNGLyqdg
  title: 'Docker: docker-compose and env files'
  author: process:yt-dlp
  usage_count: 684
  last_modified: '2021-08-31T00:00:00Z'
- id: mamqEBZpbtw
  resource: https://www.youtube.com/watch?v=mamqEBZpbtw
  title: 'cloud: move data between a server and GitHub with the gh CLI'
  author: process:yt-dlp
  usage_count: 41
  last_modified: '2022-06-28T00:00:00Z'
- id: qY5ForDjgGY
  resource: https://www.youtube.com/watch?v=qY5ForDjgGY
  title: 'Docker: Getting started with the Rocker project'
  author: process:yt-dlp
  usage_count: 2117
  last_modified: '2021-08-24T00:00:00Z'
- id: uDx9NkoBqv8
  resource: https://www.youtube.com/watch?v=uDx9NkoBqv8
  title: Data science on a chromebook
  author: process:yt-dlp
  usage_count: 875
  last_modified: '2022-08-16T00:00:00Z'
---

# Rocker Project

## Overview

The Rocker Project (`rocker` = `docker` + `r`) publishes versioned Docker images for R, so analysts can run any R without touching the host and collaborators get the same failure or success. [source_qY5ForDjgGY](../../sources/source_qY5ForDjgGY_docker-getting-started-with-the-rocker-project.md) launches the series with `rocker/r-base` and `rocker/rstudio`, framing images as a FedEx laptop. [source_OieR0VDxSRk](../../sources/source_OieR0VDxSRk_docker-use-cases.md) dissects `rocker/verse:4.1.1`, [source_3_0gUMqKikw](../../sources/source_3_0gUMqKikw_docker-managing-images.md) notes versioned stack for pinning vs `devel`, [source_CvOVn2zwi3k](../../sources/source_CvOVn2zwi3k_docker-using-volumes-and-managing-users.md) covers volumes/users, [source__pBqBfjTKI4](../../sources/source__pBqBfjTKI4_cloud-introduction-to-cloud-computing.md) provisions a DigitalOcean droplet with Docker + Rocker, [source_NF7HPKt55Yk](../../sources/source_NF7HPKt55Yk_cloud-use-cases.md) shows isolation, [source_kgGCNGLyqdg](../../sources/source_kgGCNGLyqdg_docker-docker-compose-and-env-files.md) adds compose/env-files, and [source_mamqEBZpbtw](../../sources/source_mamqEBZpbtw_cloud-move-data-between-a-server-and-github-with-the-gh-cli.md) / [source_16Xn0ueeP-E](../../sources/source_16Xn0ueeP-E_azure-rstudio-server-and-pins.md) show cloud tie-ins.

This Reference details image choice and invocation; see [Docker Fundamentals](../docker/docker-fundamentals.md) and [Docker Use Cases](../docker/docker-use-cases.md).

## Key Concepts

- **Stack**: layered `r-ver` → `rstudio` → `tidyverse` → `verse` → `geospatial`; tag selects R version (`rocker/verse:4.1.1` vs `4.0` triggers pull if not cached) — [source_OieR0VDxSRk](../../sources/source_OieR0VDxSRk_docker-use-cases.md).
- **Entrypoint**: last arg chooses program: `... bash` yields Linux shell, `... R` yields R 4.1.1 (`q()` to quit) — [source_OieR0VDxSRk](../../sources/source_OieR0VDxSRk_docker-use-cases.md).
- **RStudio Server**: `docker run -d -p 8787:8787 -e PASSWORD=yourpassword rocker/rstudio` → `localhost:8787` (local) or `<ip>:8787` (cloud); user `rstudio` — [source_qY5ForDjgGY](../../sources/source_qY5ForDjgGY_docker-getting-started-with-the-rocker-project.md), [source__pBqBfjTKI4](../../sources/source__pBqBfjTKI4_cloud-introduction-to-cloud-computing.md).
- **Mounts**: `-v $HOME:$HOME` + `-w $HOME` keeps workdir; add `:ro` for read-only isolation — [source_OieR0VDxSRk](../../sources/source_OieR0VDxSRk_docker-use-cases.md), [source_CvOVn2zwi3k](../../sources/source_CvOVn2zwi3k_docker-using-volumes-and-managing-users.md).
- **Version pinning & devel**: versioned stack locks system deps; `devel` tag tests upcoming R — [source_3_0gUMqKikw](../../sources/source_3_0gUMqKikw_docker-managing-images.md).
- **Compose**: share via `docker-compose.yaml` in GitHub repo: `git clone <url>` → `cd <repo>` → `docker compose up`; `image:` for published, `build: context: .` + `Dockerfile` for custom (`microsoft/azure-cli`) — [source_OieR0VDxSRk](../../sources/source_OieR0VDxSRk_docker-use-cases.md), [source_kgGCNGLyqdg](../../sources/source_kgGCNGLyqdg_docker-docker-compose-and-env-files.md).
- **Azure tie-in**: [source_16Xn0ueeP-E](../../sources/source_16Xn0ueeP-E_azure-rstudio-server-and-pins.md) runs Rocker on Azure RStudio Server with `pins` + Dropbox.

## Example

```bash
docker run --rm -ti rocker/r-base
# R 4.1.1: 1 + 2

docker run -d -p 8787:8787 -e PASSWORD=yourpassword rocker/rstudio
# http://localhost:8787  rstudio / yourpassword

docker run --rm -it -v $HOME:$HOME -w $HOME rocker/verse:4.1.1 bash
ls; exit
docker run --rm -it -v $HOME:$HOME -w $HOME rocker/verse:4.0 R
q()

git clone https://github.com/<org>/<repo>.git
cd <repo>
docker compose up
```

## Sources

| Video | Title | Views | Last Modified |
|---|---|---|---|
| [16Xn0ueeP-E](https://www.youtube.com/watch?v=16Xn0ueeP-E) | [Azure, RStudio server, and pins](../../sources/source_16Xn0ueeP-E_azure-rstudio-server-and-pins.md) | 559 | 2020-05-19T00:00:00Z |
| [3_0gUMqKikw](https://www.youtube.com/watch?v=3_0gUMqKikw) | [Docker: Managing images](../../sources/source_3_0gUMqKikw_docker-managing-images.md) | 38 | 2021-09-21T00:00:00Z |
| [CvOVn2zwi3k](https://www.youtube.com/watch?v=CvOVn2zwi3k) | [Docker: Using volumes and managing users](../../sources/source_CvOVn2zwi3k_docker-using-volumes-and-managing-users.md) | 198 | 2021-09-28T00:00:00Z |
| [NF7HPKt55Yk](https://www.youtube.com/watch?v=NF7HPKt55Yk) | [cloud: Use cases](../../sources/source_NF7HPKt55Yk_cloud-use-cases.md) | 25 | 2022-06-07T00:00:00Z |
| [OieR0VDxSRk](https://www.youtube.com/watch?v=OieR0VDxSRk) | [docker: use cases](../../sources/source_OieR0VDxSRk_docker-use-cases.md) | 312 | 2021-09-07T00:00:00Z |
| [_pBqBfjTKI4](https://www.youtube.com/watch?v=_pBqBfjTKI4) | [cloud: Introduction to cloud computing](../../sources/source__pBqBfjTKI4_cloud-introduction-to-cloud-computing.md) | 39 | 2022-05-31T00:00:00Z |
| [kgGCNGLyqdg](https://www.youtube.com/watch?v=kgGCNGLyqdg) | [Docker: docker-compose and env files](../../sources/source_kgGCNGLyqdg_docker-docker-compose-and-env-files.md) | 684 | 2021-08-31T00:00:00Z |
| [mamqEBZpbtw](https://www.youtube.com/watch?v=mamqEBZpbtw) | [cloud: move data between a server and GitHub with the gh CLI](../../sources/source_mamqEBZpbtw_cloud-move-data-between-a-server-and-github-with-the-gh-cli.md) | 41 | 2022-06-28T00:00:00Z |
| [qY5ForDjgGY](https://www.youtube.com/watch?v=qY5ForDjgGY) | [Docker: Getting started with the Rocker project](../../sources/source_qY5ForDjgGY_docker-getting-started-with-the-rocker-project.md) | 2117 | 2021-08-24T00:00:00Z |
| [uDx9NkoBqv8](https://www.youtube.com/watch?v=uDx9NkoBqv8) | [Data science on a chromebook](../../sources/source_uDx9NkoBqv8_data-science-on-a-chromebook.md) | 875 | 2022-08-16T00:00:00Z |

## References

- Rocker Project documentation (rocker-project.org)
- Docker Hub (rocker images)
