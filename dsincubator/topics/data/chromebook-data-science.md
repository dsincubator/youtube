---
type: Playbook
title: Data Science on a Chromebook
description: Doing data science on a Chromebook, setup, and workflow considerations
lang: en
tags:
- ds-incubator
generated:
  by: agent:okf-wiki-builder/1.0
  at: '2026-09-08T04:00:00Z'
status: draft
sources:
- id: uDx9NkoBqv8
  resource: https://www.youtube.com/watch?v=uDx9NkoBqv8
  title: Data science on a chromebook
  author: process:yt-dlp
  usage_count: 875
  last_modified: '2022-08-16T00:00:00Z'
---

# Data Science on a Chromebook

## Overview

A Chromebook is framed as a viable thin-client for R data science when heavy compute is offloaded to cloud (RStudio Cloud/Server, GitHub Codespaces, DigitalOcean). The sole anchor is [source_uDx9NkoBqv8](../../sources/source_uDx9NkoBqv8_data-science-on-a-chromebook.md), which walks Linux (Crostini) enablement, Chrome extensions, and terminal parity.

Cloud host in [Cloud Fundamentals](../cloud/cloud-fundamentals.md); container in [Rocker Project](../docker/rocker-project.md); terminal in [Terminal Setup](../terminal/terminal-setup.md).

## Key Concepts

- **Why Chromebook** ([source_uDx9NkoBqv8](../../sources/source_uDx9NkoBqv8_data-science-on-a-chromebook.md)): cheap, managed, long battery; limitation is local CPU/RAM, solved by cloud.
- **Enable Linux** ([source_uDx9NkoBqv8](../../sources/source_uDx9NkoBqv8_data-science-on-a-chromebook.md)): Settings → Advanced → Developers → Linux development environment (Crostini) → Terminal → `sudo apt update` → `r-base` / `rstudio` or browser-based RStudio Cloud; `docker` available in Linux container.
- **Browser-first workflow** ([source_uDx9NkoBqv8](../../sources/source_uDx9NkoBqv8_data-science-on-a-chromebook.md)): pos.it.cloud / `rocker/rstudio` on droplet at `<ip>:8787`; `gh CLI` and `pins` unchanged — see [Cloud Fundamentals](../cloud/cloud-fundamentals.md).
- **Dotfiles portability** ([source_uDx9NkoBqv8](../../sources/source_uDx9NkoBqv8_data-science-on-a-chromebook.md), [source_BYtt2cXW4qg](../../sources/source_BYtt2cXW4qg_ds-terminal-use-case-customize-and-reuse-your-home.md)): `~/` + `.bashrc` sync via GitHub dotfiles repo restores Chromebook quickly.
- **Limits & trade-off** ([source_uDx9NkoBqv8](../../sources/source_uDx9NkoBqv8_data-science-on-a-chromebook.md)): no heavy local Docker builds; use [Rocker Project](../docker/rocker-project.md) remotely.

## Example

```bash
# on Chromebook Linux terminal
sudo apt update && sudo apt install r-base
# or use cloud
ssh root@<droplet-ip>
docker run -d -p 8787:8787 -e PASSWORD=... rocker/verse
# browse https://<ip>:8787
```

## Sources

| Video | Title | Views | Last Modified |
|---|---|---|---|
| [uDx9NkoBqv8](https://www.youtube.com/watch?v=uDx9NkoBqv8) | [Data science on a chromebook](../../sources/source_uDx9NkoBqv8_data-science-on-a-chromebook.md) | 875 | 2022-08-16T00:00:00Z |

## References

- Chromebook Linux (Crostini) docs
- RStudio Cloud guide

