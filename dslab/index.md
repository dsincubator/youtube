---
okf_version: '0.2'
type: Bundle
title: Dslab LLM Wiki Bundle
description: OKF v0.2 LLM wiki bundle for dslab — 5 topics from 23 sources.
tags:
- ds-lab
- wiki-bundle
generated:
  by: agent:okf-wiki-builder/1.0
  at: '2026-09-08'
status: stable
---

# Posit Data Science Lab Wiki

Generated from the YouTube [Playlist](https://www.youtube.com/playlist?list=PL9HYL-VRX0oSeWeMEGQt0id7adYQXebhT).

Welcome to the **Dslab** knowledge base bundle, structured according to the Open Knowledge Format (OKF) v0.2.
Transcripts are deterministic: `transcripts/<id>_<slug>.md` bodies are `mm:ss: text` per event from `tStartMs` (no LLM), language prefers `en-orig`/`es-orig`.

## Contents — START HERE
- **Bundle root:** [`index.md`](index.md) (§12)
- [Topics Overview](topics/concepts-overview.md) — all concepts (§3.1)
- [Topics Index](topics/index.md) (§8)
- [Sources Index](sources/index.md) (§8) + [Sources Log](sources/log.md) (§9)
- [Bundle History Log](log.md) (§9)
- [References](references/index.md) (§6.3)

## Build
```sh
./bin/build-wiki --playlist "https://www.youtube.com/playlist?list=PL9HYL-VRX0oSeWeMEGQt0id7adYQXebhT" --name dslab --tag ds-lab --out-dir ./dslab --count 3  # quick test
./bin/build-wiki --playlist "https://www.youtube.com/playlist?list=PL9HYL-VRX0oSeWeMEGQt0id7adYQXebhT" --name dslab --tag ds-lab --out-dir ./dslab          # full
just wiki  # if just installed
```

## Search
```sh
qmd search "topic" -c dslab -n 3
qmd query "question" -c dslab -n 3
```
