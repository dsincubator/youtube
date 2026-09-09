---
okf_version: '0.2'
type: Concept
title: Metadata Manifest Dictionary
description: Dictionary for metadata/manifest.tsv — per-video fetch status (id, status, reason, file) for raw dumps.
tags:
- ds-incubator
- data-dictionary
- metadata-manifest
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-09T02:23:48Z"
status: stable
sources:
- id: dsincubator-metadata-manifest
  title: "dsincubator metadata/manifest.tsv"
  resource: "metadata/manifest.tsv"
  author: "process:fetch-metadata"
  usage_count: 151
  last_modified: "2026-09-08"
---

# Metadata Manifest Dictionary ([metadata/manifest.tsv](../metadata/manifest.tsv))

Manifest produced by `bin/fetch-metadata` alongside raw dumps `metadata/<id>.json` (now archived as `metadata-raw.tar.gz`). One row per playlist entry; `status` records terminal state.

**Location:** [metadata/manifest.tsv](../metadata/manifest.tsv) (kept readable after `metadata/*.json` clean; not in `metadata-raw.tar.gz`). Also see [metadata.csv](metadata.csv) derived table and [metadata-raw.tar.gz](../metadata-raw.tar.gz) archive.

**Release:** Manifest is small provenance log, kept in repo (not a release asset). History lives in bundle root `log.md` (tag `dsincubator-v0.0.1`).

**Columns** (`id | status | reason | file` per `metadata/manifest.tsv` header):

| Column | Description |
|--------|-------------|
| `id` | YouTube video ID (playlist entry; join key to `metadata.csv` `id` and `transcripts/<id>_<slug>.md`). |
| `status` | Fetch status: `ok` (dump present), `private`/`unavailable` (terminal, with `reason`), `error` (transient). |
| `reason` | Human-readable reason for non-`ok` (e.g., `Private video`, `Video unavailable`); empty for `ok`. |
| `file` | Path to raw dump `metadata/<id>.json` when `status=ok`; empty otherwise. |

**Status values:** `ok` → row in `metadata.csv` + dump in `metadata-raw.tar.gz`; `private`/`unavailable` → no CSV row, no dump, skipped on later runs (`--refresh` re-probes); `error` → transient, retried next run.

**Provenance:** `yt-dlp --flat-playlist` index → `yt-dlp --dump-single-json` per `id` → `metadata/<id>.json` (slimmed) → `metadata.csv` + `metadata/manifest.tsv` → `metadata-raw.tar.gz` sibling → clean `metadata/*.json`.

**Workflow:** keep `metadata/manifest.tsv` readable for audit; `metadata-raw.tar.gz` holds dumps for GH release asset.

