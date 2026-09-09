---
okf_version: '0.2'
type: DirectoryIndex
title: Assets Index
description: Index of release assets for youtube.
tags:
- ds-incubator
- assets-index
---

# Assets Index (Youtube)

Release assets (tarballs) at bundle root in `assets/` (siblings of `manifests/`/`data/`). Attached as GitHub Release assets.

- [metadata-raw.tar.gz](metadata-raw.tar.gz) — raw `metadata/<id>.json` dumps (slimmed)
- [transcripts-raw.tar.gz](transcripts-raw.tar.gz) — raw `*.json3`/`*.vtt` captions (if present)

Created by `bin/fetch-metadata` (`assets/metadata-raw.tar.gz`) and `bin/convert-transcripts` (`assets/transcripts-raw.tar.gz`), cleaned from `metadata/`/`transcripts/` (keep `manifests/` readable).
