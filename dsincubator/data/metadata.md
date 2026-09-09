---
okf_version: '0.2'
type: Concept
title: Metadata CSV Dictionary
description: Column dictionary for metadata.csv — derived table of YouTube playlist metadata (one row per public video).
tags:
- ds-incubator
- data-dictionary
- metadata
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-09T02:33:45Z"
status: stable
sources:
- id: dsincubator-metadata-csv
  title: "dsincubator metadata.csv"
  resource: "metadata.csv"
  author: "Posit PBC"
  usage_count: 151
  last_modified: "2026-09-08"
---

# Metadata CSV Dictionary ([metadata.csv](metadata.csv))

Derived table built by `bin/fetch-metadata` from raw dumps `metadata/<id>.json` (see `assets/metadata-raw.tar.gz`). One row per public video; private/unavailable videos have no row (see `manifests/metadata.tsv`).

**Location:** [metadata.csv](metadata.csv) at bundle root (build intermediate; not shipped as release asset — see dictionaries `data/metadata-raw.md` for the shipped raw archive). For the canonical `dsincubator` bundle this lives at `data/metadata.csv`; per-bundle bundles expose it at `dsincubator/metadata.csv`.

**Release:** Raw dumps are published as `assets/metadata-raw.tar.gz` at bundle root in `assets/` (sibling of `manifests/`/`data/`) and attached as GitHub Release asset under tag `dsincubator-v0.0.1` (see `log.md`). See `data/metadata-raw.md`.

**Columns** (`playlist_index,title,id,view_count,like_count,comment_count,upload_date,upload_date_iso,duration,duration_string,channel,uploader,url` per `AGENTS.md:9`):

| Column | Description |
|--------|-------------|
| `playlist_index` | Playlist position (1-indexed integer from `yt-dlp --flat-playlist --print playlist_index`). |
| `title` | Video title as returned by YouTube (`title`). |
| `id` | YouTube video ID (11-char string; join key to `transcripts/<id>_<slug>.md` and `metadata/<id>.json`). |
| `view_count` | View count at fetch time (`view_count`; integer, may be empty if unavailable). |
| `like_count` | Like count (`like_count`; may be empty if disabled/hidden). |
| `comment_count` | Comment count (`comment_count`; includes available comments). |
| `upload_date` | Upload date as `YYYYMMDD` (`upload_date`). |
| `upload_date_iso` | Upload date normalized to ISO-8601 `YYYY-MM-DD` derived from `upload_date`. |
| `duration` | Duration in seconds (`duration`; integer). |
| `duration_string` | Human-readable duration `H:MM:SS` or `M:SS` derived from `duration`. |
| `channel` | YouTube channel display name (`channel`). |
| `uploader` | Uploader identifier (`uploader`). |
| `url` | Canonical watch URL `https://www.youtube.com/watch?v=<id>` derived from `id`. |

**Join key:** `id` → `transcripts/<id>_<slug>.md` (`resource: https://www.youtube.com/watch?v=<id>`) and `sources/source_<id>_<slug>.md`.

**Provenance:** `yt-dlp --skip-download --dump-single-json` per video → `metadata/<id>.json` (slimmed: `automatic_captions`/`subtitles`/`formats` pruned) → derived `metadata.csv`. Manifest `manifests/metadata.tsv` records terminal states (`ok`/`private`/`unavailable`/`error`).

**Workflow:** download raw → `assets/metadata-raw.tar.gz` sibling → derive `metadata.csv` → use for `fetch-transcripts`/`convert`/`distill`.

