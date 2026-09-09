---
okf_version: '0.2'
type: Concept
title: Metadata Raw Archive Dictionary
description: Field dictionary for metadata-raw.tar.gz — raw per-video dumps metadata/<id>.json (yt-dlp --dump-single-json, slimmed).
tags:
- ds-incubator
- data-dictionary
- metadata-raw
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-09T02:23:48Z"
status: stable
sources:
- id: dsincubator-metadata-raw
  title: "dsincubator metadata-raw.tar.gz"
  resource: "metadata-raw.tar.gz"
  author: "Posit PBC"
  usage_count: 151
  last_modified: "2026-09-08"
---

# Metadata Raw Archive Dictionary (`metadata-raw.tar.gz`)

Raw per-video dumps `metadata/<id>.json` produced by `yt-dlp --skip-download --dump-single-json` (with `--write-comments` where enabled). Each file is the richest record per video; post-processing (CSV, wiki) is separate from fetching.

**Location:** `metadata-raw.tar.gz` at **bundle root** (sibling of `metadata/`, not inside it). Contains only `<id>.json` files (excludes `metadata/manifest.tsv`). `automatic_captions`, `subtitles`, `formats`, `requested_formats`, `requested_downloads` are pruned by `slim_dump()` in `bin/fetch-metadata` (≈97% bytes, expiring URLs) — not in the archive. Remainder is kept as-is (≈ `id,title,description,channel,uploader,view_count,like_count,comment_count,upload_date,chapters,comments` plus lightweight fields like `duration, tags, timestamp, availability, thumbnails, etc.`).

**Release:** Attached as GitHub Release asset together with the final repo version (manual after review, not in `bin/build-wiki`). Version tag recorded in `log.md` as `dsincubator-v0.0.1` and in git as `dsincubator-v0.0.1`. See `log.md`.

**Archive creation:** `bin/fetch-metadata` auto-creates `metadata-raw.tar.gz` after CSV derive (re-created on every `--refresh` or new fetches): `tar -czf metadata-raw.tar.gz metadata/*.json`.

**Core fields** (sample from `<id>.json`):

| Field | Description |
|-------|-------------|
| `id` | YouTube video ID (join key; filename `<id>.json`). |
| `title` | Video title. |
| `description` | Full video description (YouTube `description`; may be long, markdown-unescaped). |
| `channel` | Channel display name. |
| `uploader` | Uploader handle/ID. |
| `view_count` | View count at dump time. |
| `like_count` | Like count (may be null if hidden). |
| `comment_count` | Comment count at dump time. |
| `upload_date` | Upload date `YYYYMMDD`. |
| `chapters` | Auto-detected chapters (`chapters[]: {start_time, title, end_time}`; may be empty). |
| `comments` | Top comments array when `--write-comments` enabled (may be truncated by YouTube; `comments[]`). |

Additional preserved fields (selected): `duration`, `tags`, `categories`, `timestamp`, `availability`, `channel_id`, `uploader_id`, `webpage_url`, `thumbnails`, `heatmap`, `chapters`, `comments`.

Pruned (reproducible/expired): `automatic_captions`, `subtitles`, `formats`, `requested_formats`, `requested_downloads`.

**Manifest:** `metadata/manifest.tsv` (`id | status | reason | file`) records terminal states `ok`/`private`/`unavailable`/`error` — not archived, lives in `metadata/`.

