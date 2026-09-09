---
okf_version: '0.2'
type: Concept
title: Manifests Dictionary
description: Dictionary for manifests/ — per-video fetch manifests (metadata + transcripts) kept readable after raw clean.
tags:
- ds-incubator
- data-dictionary
- manifests
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-09T02:33:45Z"
status: stable
sources:
- id: dsincubator-manifests
  title: "dsincubator manifests/"
  resource: "manifests/"
  author: "process:fetch-metadata"
  usage_count: 151
  last_modified: "2026-09-08"
---

# Manifests Dictionary ([manifests/](../manifests/))

Directory `manifests/` holds per-video fetch manifests kept readable after raw dumps/captions are archived as `assets/*.tar.gz` and cleaned.

**Location:** [manifests/](../manifests/) at bundle root (sibling of `data/`/`assets/`). Contains:

| File | Description |
|------|-------------|
| [metadata.tsv](../manifests/metadata.tsv) | `metadata` fetch manifest: `id | status | reason | file` (see [data/metadata-manifest.md](metadata-manifest.md)). |
| [transcripts.tsv](../manifests/transcripts.tsv) | `transcripts` fetch manifest: `id | status | file | lang` (see transcripts manifest below). |

Also see [data/metadata-manifest.md](metadata-manifest.md) for `metadata` manifest schema and raw archives [metadata-raw.tar.gz](../assets/metadata-raw.tar.gz) / [transcripts-raw.tar.gz](../assets/transcripts-raw.tar.gz) in [assets/](../assets/).

**Transcripts manifest columns** (`id | status | file | lang`):

| Column | Description |
|--------|-------------|
| `id` | YouTube video ID (join key). |
| `status` | `ok` / `missing` / `error` (per `bin/fetch-transcripts`). |
| `file` | Path to kept caption `transcripts/<id>.<lang>.json3` (or empty). |
| `lang` | Caption track `en-orig` / `es-orig` / `en` / `es` / `*-orig`. |

**Workflow:** `bin/fetch-metadata` → `manifests/metadata.tsv` + `assets/metadata-raw.tar.gz` → `bin/fetch-transcripts` → `manifests/transcripts.tsv` + `assets/transcripts-raw.tar.gz` → `bin/convert-transcripts` → `transcripts/*.md`.

**Release:** Manifests are small provenance logs, kept in repo (not release assets). History in `log.md` (tag `dsincubator-v0.0.1`).

