---
type: Reference
title: tmux Terminal Multiplexer
description: Using tmux for terminal multiplexing, session management, and productive
  terminal workflows
lang: en
tags:
- ds-incubator
generated:
  by: agent:okf-wiki-builder/1.0
  at: '2026-09-08T04:00:00Z'
status: draft
sources:
- id: 00i28kdk8cM
  resource: https://www.youtube.com/watch?v=00i28kdk8cM
  title: ds.tmux
  author: process:yt-dlp
  usage_count: 88
  last_modified: '2022-08-08T00:00:00Z'
---

# tmux Terminal Multiplexer

## Overview

tmux is introduced as the "terminal session manager" that keeps long jobs alive after SSH disconnect and splits one terminal into panes/windows. The sole anchor is [source_00i28kdk8cM](../../sources/source_00i28kdk8cM_ds-tmux.md), which frames tmux as insurance for cloud work (DigitalOcean droplet) and pairs it with `docker run -d`. It complements [Terminal Setup and Navigation](../terminal/terminal-setup.md).

Requires [Terminal Setup and Navigation](../terminal/terminal-setup.md); see also [Docker Fundamentals](../docker/docker-fundamentals.md) (detached containers) and [Cloud Computing Fundamentals](../cloud/cloud-fundamentals.md).

## Key Concepts

- **Problem solved** ([source_00i28kdk8cM](../../sources/source_00i28kdk8cM_ds-tmux.md)): closing laptop or SSH drop kills foreground jobs; `tmux` decouples shell from terminal window.
- **Session lifecycle** ([source_00i28kdk8cM](../../sources/source_00i28kdk8cM_ds-tmux.md)): `tmux new -s <name>` / `tmux new` → work → `Ctrl+b d` (detach) → `tmux ls` → `tmux attach -t <name>`; `tmux kill-session -t <name>`.
- **Windows & panes** ([source_00i28kdk8cM](../../sources/source_00i28kdk8cM_ds-tmux.md)): `Ctrl+b c` new window, `Ctrl+b n/p` next/prev, `Ctrl+b ,` rename; `Ctrl+b %` vertical split, `Ctrl+b "` horizontal, `Ctrl+b o` cycle, `Ctrl+b x` close pane.
- **Persisted long jobs** ([source_00i28kdk8cM](../../sources/source_00i28kdk8cM_ds-tmux.md)): `R -q -e 'Sys.sleep(3600)'` or `docker run rocker/rstudio` inside tmux survives disconnect; `docker run -d` is the Docker-native alternative — see [Docker Fundamentals](../docker/docker-fundamentals.md).
- **Config** ([source_00i28kdk8cM](../../sources/source_00i28kdk8cM_ds-tmux.md)): `~/.tmux.conf` for mouse, history; pairs with dotfiles in [Terminal Setup](../terminal/terminal-setup.md).

## Example

```bash
tmux new -s work
# inside: panes, long job
R -q -e 'Sys.sleep(3600)'
Ctrl+b %; Ctrl+b " # splits
Ctrl+b d              # detach, safe to close laptop
tmux ls
tmux attach -t work
tmux kill-session -t work
# alternative: detach containers without tmux
docker run -d --name my_job rocker/verse sleep infinity
docker logs my_job
```

## Sources

| Video | Title | Views | Last Modified |
|---|---|---|---|
| [00i28kdk8cM](https://www.youtube.com/watch?v=00i28kdk8cM) | [ds.tmux](../../sources/source_00i28kdk8cM_ds-tmux.md) | 88 | 2022-08-08T00:00:00Z |

## References

- tmux manual (man tmux)
- Ham Vocke — A Guide to Customizing tmux

