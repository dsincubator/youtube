---
okf_version: '0.2'
type: DirectoryIndex
title: Data Index
description: Index of data dictionaries for dsincubator.
tags:
- ds-incubator
- data-index
---

# Data Index (Dsincubator)

Dictionaries describing the derived and raw datasets that underpin this bundle.

- [Metadata CSV Dictionary](metadata.md) — column dictionary for `metadata.csv` (derived table).
- [Manifests Dictionary](manifests.md) — directory dictionary for `manifests/` (both fetch manifests).
- [Metadata Manifest Dictionary](metadata-manifest.md) — dictionary for `manifests/metadata.tsv` (per-video fetch status).
- [Metadata Raw Archive Dictionary](metadata-raw.md) — field dictionary for `assets/metadata-raw.tar.gz` (raw `metadata/<id>.json` dumps).
- [Transcripts Raw Archive Dictionary](transcripts-raw.md) — schema dictionary for `assets/transcripts-raw.tar.gz` (raw `*.json3` captions).

History lives in bundle root `log.md` (no separate `data/log.md`; see `AGENTS.md:338`); release tags like `dsincubator-v0.0.1` are recorded there and in git. Raw archives are siblings at bundle root in `assets/`, manifests in `manifests/`, per distribution preferences.

