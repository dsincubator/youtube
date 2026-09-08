---
type: Playbook
title: dsincubator Wiki
description: OKF v0.2 LLM wiki bundle root for dsincubator YouTube transcripts
okf_version: "0.2"
lang: en
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-playlist
    resource: "https://youtube.com/playlist?list=PLvgdJdJDL-APbB315sB3Lv_2VP2g0ioFO"
    title: "ds-incubator YouTube playlist"
    author: "Mauro Lepore"
---

# dsincubator Wiki

OKF v0.2 bundle transforming 151 transcript sources into 59 topic pages across 13 categories per `planning_manifest.json`.

## Structure

- `topics/` — 59 topic pages (each an OKF concept with `type` field). Entry point: [`topics/concepts-overview.md`](topics/concepts-overview.md). Directory index: [`topics/index.md`](topics/index.md) (§8).
- `sources/` — 151 distilled sources (one per transcript). Index: [`sources/index.md`](sources/index.md). See also [`sources/log.md`](sources/log.md) history.
- `references/` — External executors/attesters (§6.3): [`references/index.md`](references/index.md)
- `log.md` — Chronological bundle history (§9)
- `planning_manifest.json` — Plan defining topics, actor convention, verification tiers

## Actor Convention (§7)

- `agent:okf-wiki-builder/1.0` — LLM-generated concepts and sources
- `process:yt-dlp` — raw caption extraction
- `process:convert-transcripts` — transcript conversion
- `human:<reviewer>` — verified fields after human review (§5.2)

## Verification Tiers (§5.3)

- **Unverified**: no `verified` field — advisory
- **Machine-confirmed**: `verified: { by: process:nightly-verify, at: <date> }`
- **Human-reviewed**: `verified: { by: human:<reviewer>, at: <date> }` — TODO for topic pages

## Conformance (§11)

- Every concept has `type` field (§4.1)
- `sources` arrays include credibility signals (§5.1)
- No reserved filenames for concepts (§3.1): concepts use `concepts-overview.md`, not `index.md`
- `log.md` at bundle root (§9)
