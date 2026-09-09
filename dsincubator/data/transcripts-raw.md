---
okf_version: '0.2'
type: Concept
title: Transcripts Raw Archive Dictionary
description: Schema dictionary for transcripts-raw.tar.gz — raw caption files (json3/srv3/vtt) before deterministic OKF markdown conversion.
tags:
- ds-incubator
- data-dictionary
- transcripts-raw
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-09T02:33:45Z"
status: stable
sources:
- id: dsincubator-transcripts-raw
  title: "dsincubator transcripts-raw.tar.gz"
  resource: "transcripts-raw.tar.gz"
  author: "process:yt-dlp"
  usage_count: 151
  last_modified: "2026-09-08"
---

# Transcripts Raw Archive Dictionary (`assets/transcripts-raw.tar.gz`)

Raw captions downloaded by `bin/fetch-transcripts` via `yt-dlp --skip-download --write-auto-subs --sub-langs "en-orig,es-orig,en.*,es.*" --sub-format "json3/srv3/vtt/best"` (fallback `--sub-langs ".*-orig"` once). One file per public video, preference `en-orig` > `es-orig` > `*-orig` > `en` > `es`; duplicates/translations pruned.

**Location:** `assets/transcripts-raw.tar.gz` at **bundle root** in `assets/` (sibling of `manifests/`/`data/`). Contains raw `*.json3`/`*.vtt`/`*.srv3` etc. (kept `transcripts/*.md` + `manifests/transcripts.tsv` readable in `manifests/`). Archive is cleaned from `transcripts/` after conversion by `bin/convert-transcripts`: workflow `download raw → generate assets/transcripts-raw.tar.gz sibling → generate transcripts/<id>_<slug>.md` (`mm:ss: text` per `tStartMs`, deterministic, no LLM) → remove non-`.md` from `transcripts/`.

**Release:** Attached as GitHub Release asset together with the final repo version (manual after review). Version tag recorded in `log.md` as `dsincubator-v0.0.1` and in git as `dsincubator-v0.0.1`. See `log.md`.

**Archive creation:** `bin/convert-transcripts` auto-creates `assets/transcripts-raw.tar.gz` after every run (raw `*.json3`/`*.srv3`/`*.vtt`/`*.srt`/`*.tsv`/`*.txt` inside `transcripts/` → tar sibling → clean raw files, keep `.md`).

**Schema — `*.json3` (``) per `AGENTS.md:39`:**

| Path | Type | Description |
|------|------|-------------|
| `events[]` | array | Caption events (one per cue). |
| `events[].tStartMs` | integer | Event start time in milliseconds. |
| `events[].dDurationMs` | integer | Event duration in milliseconds. |
| `events[].segs[]` | array | Word-level segments inside the event. |
| `events[].segs[].utf8` | string | Caption text fragment (may be word or phrase; join to form `text`). |
| `events[].segs[].tOffsetMs` | integer | Offset of this segment relative to `tStartMs`. |
| `events[].segs[].acAsrConf` | integer (0-1) | ASR confidence (present when available). |

Deterministic transcript conversion (`bin/convert-transcripts --format md`): each `events[]` → one line `mm:ss: text` (or `h:mm:ss: text` when ≥1h) derived from `tStartMs`; plain body `text` is `"".join(segs[].utf8)`. Frontmatter is re-derived per spec (description from first substantive sentence, tags via `TAG_RULES`, `lang` from track `en-orig`/`es-orig`, `usage_count`/`last_modified`/`usage_window` from `metadata.csv`).

**Multi-format note:** Some videos have only `vtt`/`srv3` fallback (e.g., 13 `vtt`-only in `dshangout` — still archived; `.md` derived where `json3` available, else `vtt` may require manual conversion). See `manifests/transcripts.tsv` (`id | status | file | lang`) for per-video track chosen (also `transcripts/manifest.tsv` for compat).

