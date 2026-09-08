# AGENTS.md — dsincubator transcript database + LLM wiki

Goal: build `data/metadata.csv` + `transcripts/<id>_<title>.md` (OKF v0.2 format) linked by `id`, then transform the 151 transcripts into an OKF v0.2 LLM wiki bundle (`dsincubator/`) per `planning_manifest.json`. **Wiki entry point: [`dsincubator/index.md`](dsincubator/index.md)** (§8/§12) — directory indexes [`dsincubator/topics/index.md`](dsincubator/topics/index.md) / [`dsincubator/sources/index.md`](dsincubator/sources/index.md), history [`dsincubator/log.md`](dsincubator/log.md) (§9).

When repo state changes (new videos, updated transcripts, schema changes, wiki plan/bundle changes), update `README.qmd` and re-render with `quarto render README.qmd --to gfm --quiet`.

## INPUTS

1. `data/metadata.csv` — columns `playlist_index,title,id,view_count,like_count,comment_count,upload_date,upload_date_iso,duration,duration_string,channel,uploader,url`. `id` is the join key. Maintained by `bin/fetch-metadata` (append new videos by default, `--refresh` rewrites all rows). The `transcript_path` column is computed on-the-fly in `README.qmd` via `fs::dir_ls()` → `tibble()` → `dplyr::left_join()`.
2. Watch URL `https://www.youtube.com/watch?v=<id>` derived from `id`.
3. Transcript files `transcripts/<id>_<sanitized-title>.md` (OKF v0.2) generated from `.json3` captions by `bin/convert-transcripts`.

## LAYOUT

```
data/metadata.csv            # derived table, 151 videos
metadata/<id>.json           # raw per-video dump (--dump-single-json incl. comments; caption/format URL listings pruned)
metadata/manifest.tsv        # id | status | reason | file (ok/private/unavailable/error)
transcripts/<id>_<title>.md  # OKF v0.2 transcript (YAML frontmatter + markdown body)
transcripts/manifest.tsv        # id | status | file | lang
planning_manifest.json       # wiki plan: 59 topic pages across 13 categories (44 + 8 missing topics + overview)
dsincubator/            # OKF v0.2 LLM wiki bundle (59 topics + 151 sources + index.md + log.md + references/)
dsincubator/index.md    # bundle root (okf_version 0.2 §12) — START HERE
dsincubator/topics/     # 59 topic pages (each an OKF concept with type) + topics/index.md (§8)
dsincubator/sources/    # 151 distilled sources + sources/index.md (§8) + sources/log.md (§9)
dsincubator/references/ # external executors/attesters (§6.3)
bin/fetch-metadata           # raw dumps + derive CSV
bin/fetch-transcripts        # fetch captions
bin/convert-transcripts      # json3 -> txt/tsv/md
README.qmd                   # Quarto source with 3 sections (Fetch → Example metadata/transcript → Wiki → Example topics/source) → rendered to README.md
README.md                    # Rendered output (git-flavored markdown)
```

- `json3` = `events[].tStartMs/dDurationMs` + `segs[].utf8/tOffsetMs` (word-level timing for editing).
- `.md` transcripts follow OKF v0.2: YAML frontmatter (`type`, `title`, `description`, `resource`, `tags`, `lang`, `generated`, `status`, `sources` + `usage_window`) + `# Transcript` body. Frontmatter is regenerated from spec by `bin/convert-transcripts` — never trust it, re-derive it (description = first substantive sentence, not caption filler; `tags` = topical keyword scan + `ds-incubator`; `generated.by` = `process:convert-transcripts` per §7; `lang` from caption track; `usage_count`/`last_modified`/`usage_window` from CSV).
- `lang` = original spoken language (`en` most videos, `es` for 6 Spanish-titled ones: `1lpcCHfozh0`, `EmDubkF8DpQ`, `hs_Pzxny7XE`, `kNV8dDGF7Hw`, `nSJT8NGhSTs`, `xx5WNZgQEdY`).
- The `g1PRMaTFYdk` duplicate rows are byte-identical, so either survives the collapse.
- The 3 `private` videos have no CSV rows and are never attempted by `fetch-transcripts`; the transcript gate below applies to the 151 public IDs only.
- `--count N` / `--limit N` take the first N IDs in sorted order. Add `--cookies-from-browser chrome` whenever output contains "Sign in to confirm you're not a bot".
- Never commit `raw/`, `.omo/`, `.Rhistory`, `.Rproj.user`, `*/blog_files`, `**/*.html`.

## PLAN

0. Metadata: `./bin/fetch-metadata --limit 2` (test), then `./bin/fetch-metadata` — raw dumps to `metadata/`, CSV derived. Direct connection; `--cookies-from-browser chrome` on bot-checks.
1. Test: `./bin/fetch-transcripts --count 3` — same connection rules.
2. Full run: `./bin/fetch-transcripts`.
3. Verify: `awk -F'\t' 'NR>1&&$2=="ok"{print $1}' transcripts/manifest.tsv | LC_ALL=C sort > /tmp/got.txt && python3 -c "import csv; print('\n'.join(sorted({r['id'].strip() for r in csv.DictReader(open('data/metadata.csv'))})))" | LC_ALL=C sort > /tmp/expected.txt && comm -23 /tmp/expected.txt /tmp/got.txt` — empty output = complete.
4. Gaps: `missing`/`error` rows in `manifest.tsv` are the accepted record of unavailable transcripts; re-run with `--force` or cookies before accepting.
5. Post-process: convert `json3` to readable formats — `bin/convert-transcripts` written and tested

## SCRIPT: `bin/convert-transcripts`

```
./bin/convert-transcripts                          # all videos (txt + tsv)
./bin/convert-transcripts --count 3                # first 3 (test)
./bin/convert-transcripts --format txt             # .txt only
./bin/convert-transcripts --format tsv             # .tsv only
./bin/convert-transcripts --format md              # OKF .md only
./bin/convert-transcripts --format both            # txt + tsv
./bin/convert-transcripts --format all             # txt + tsv + md
```

Reads `data/metadata.csv` for the video ID list and title, converts each `transcripts/<id>.*.json3` to:
- `<id>_<sanitized-title>.txt` (plain text)
- `<id>_<sanitized-title>.tsv` (tab-separated `<tStartMs>\t<text>`)
- `<id>_<sanitized-title>.md` (OKF v0.2: YAML frontmatter + `# Transcript` body)

Titles are ASCII-slugified (`unidecode` → replace non-alphanumerics with `-`, lowercase). The `.md` format includes spec-derived OKF v0.2 frontmatter: `title`/`resource` from CSV, `description` = first substantive sentence (filler-aware; caption fallback joins first content lines), `tags` = scored topical keyword scan (`TAG_RULES`, word-boundary for ≤3-char keys) + `ds-incubator`, `lang` from caption track (`en`/`es`), `generated.by` = `process:convert-transcripts` (§7), `sources` + `usage_count` (`view_count`) / `last_modified` (`upload_date_iso`) / `usage_window`. Skips videos without a json3 file.

## SCRIPT: `bin/fetch-transcripts`

```
./bin/fetch-transcripts                  # 151 videos
./bin/fetch-transcripts --count 3        # first 3 (test)
./bin/fetch-transcripts --force          # re-fetch existing
./bin/fetch-transcripts --cookies-from-browser chrome
```

Flags: `--count N`, `--force`, `--cookies-from-browser BROWSER`, `--csv PATH`, `--out-dir DIR`, `--sub-format FORMAT`, `--sleep SECONDS`, `--retries N`, `--help`.

Per video: `yt-dlp --skip-download --write-auto-subs --sub-langs ".*-orig" --sub-format "json3/srv3/vtt/best" -o "transcripts/<id>.%(ext)s" -- "https://www.youtube.com/watch?v=<id>"` — 3 attempts (1 s sleep), falls back once to `--sub-langs "en.*,es.*"` when no `*-orig` track exists, logs to `/tmp/fetch-transcripts-<id>.log`, records `id status file lang` in `manifest.tsv`. One file per video is kept (preferring `*-orig`; duplicates/translations pruned). `--` protects ids starting with `-`/`_`.

## SCRIPT: `bin/fetch-metadata`

```
./bin/fetch-metadata --limit 2        # smoke test (first 2 playlist entries)
./bin/fetch-metadata                  # fetch missing dumps, derive CSV
./bin/fetch-metadata --refresh        # re-fetch all dumps, drop removed rows
```

Flags: `--refresh`, `--playlist URL`, `--csv PATH`, `--meta-dir DIR`, `--limit N`, `--cookies-from-browser BROWSER`, `--sleep SECONDS`, `--retries N`, `--help`.

Raw-first: `yt-dlp --skip-download --dump-single-json` per video to `metadata/<id>.json` (skips existing dumps unless `--refresh`; corrupt dumps re-fetched), then `data/metadata.csv` derived from the store (atomic replace; refresh aborts when >2 and >10% of videos fail). Terminal states (`private`/`unavailable` with reason) are recorded in `metadata/manifest.tsv` and skipped on later runs — `--refresh` re-probes them. Per-video logs to `/tmp/fetch-metadata-<id>.log`.

## STATUS (2026-09-08)

- [x] `metadata/`: 151 dumps + `manifest.tsv` (154 rows: 151 `ok`, 3 `private` with reasons).
- [x] `data/metadata.csv`: 151 rows derived, join integrity holds.
- [x] `transcripts/`: 151/151 fetched, all `ok`; `.txt`/`.tsv`/`.md` (OKF v0.2) derived for all 151 via `bin/convert-transcripts`.
- [x] `bin/convert-transcripts`: supports `--format md` and `--format all`; generates OKF v0.2 transcripts with YAML frontmatter.
- [x] `README.qmd`: live R chunks (Structure, Fetch → Example metadata/transcript, Wiki → Example topics/source); libs at top, `knitr::opts_chunk$set()` header, no `head()`/`Join Summary`; restructured to workflow order (fewer/shorter headings).
- [x] `README.md`: rendered from `README.qmd` via `quarto render README.qmd --to gfm --quiet`.
- [x] Open question resolved: `sbp5Q8niTho` comment was deleted from YouTube (fetch succeeded, database stands).
- [x] `fetch-transcripts` prune fix: `pick_transcript`/`--force` now touch subtitle extensions only (earlier `*.*` glob deleted converted `.txt`/`.tsv` on re-runs).
- [x] Title sanitization: ASCII-only, lowercase, hyphen-separated words.
- [x] Frontmatter regen from spec (2026-09-08): `bin/convert-transcripts` re-derived all 151 `.md` frontmatters — actor fix (`process:convert-transcripts`), substantive descriptions, topical tags, `lang`, credibility signals (`usage_count`/`last_modified`/`usage_window`). Old frontmatter treated as untrusted.
- [x] Wiki pilot (2026-09-08): 3 distilled `dsincubator/sources/` done (`-9QCNwmpTOE` TDD, `pbc6NX1n01Q` targets, `1lpcCHfozh0` Spanish) + adversarial review (1 FAIL fixed: invented `tar_load`, rewritten `tags`, false `None mentioned`) → Extraction Prompt v2 below.
- [x] `sources/` (2026-09-08): **151/151** `dsincubator/sources/source_<id>_<slug>.md` distilled per Extraction Prompt v2 (frozen frontmatter, quote-to-name, anchored `key_topics`, bilingual headings for `es`) via parallel subagents + spot-checks.
- [x] `planning_manifest.json` aggregation: `source_files[]` populated for all 59 topics (0 unassigned); clustering verified.
- [x] `topics/` (2026-09-08): **59/59** `dsincubator/topics/` pages with `type` (§4.1), `sources` credibility (§5.1), actor `agent:okf-wiki-builder/1.0` (§7), cross-links (§6), `Attested Computation` for pipelines (§10); YAML quoting fixed for 3 topics.
- [x] Bundle assembly: `dsincubator/index.md` (okf_version 0.2 §12), `topics/index.md` (§8), `sources/index.md` (§8), `sources/log.md` (§9), `log.md` (§9), `references/` (§6.3); conformance check passed.
- [x] `README.qmd`: Wiki section points to bundle entry point; `README.md` re-rendered (workflow order, fewer headings, 1-row tables dropped).

## NEXT (fresh-agent runbook — start here)

0. Read this file top to bottom, then `planning_manifest.json` and [`dsincubator/index.md`](dsincubator/index.md). Do not touch `transcripts/` frontmatter by hand — `bin/convert-transcripts` owns it.
1. **Bundle is complete as of 2026-09-08**: `sources/` 151/151, `topics/` 59/59, bundle indexes + `log.md` present. The workflow below is the maintenance path.
2. **When a new video/transcript appears** (or existing transcript updated):
   a. Fetch: `./bin/fetch-metadata` → `./bin/fetch-transcripts` → `./bin/convert-transcripts --format md` (creates `transcripts/<id>_<slug>.md` OKF v0.2).
   b. Distill one source: scaffold frontmatter deterministically from transcript + `data/metadata.csv` (copy `title`, `tags`, `lang`, `usage_count`, `last_modified`, `usage_window`, `sources[]` byte-identical; `type: source`, `generated.by: agent:okf-wiki-builder/1.0`, `status: draft`; fill `key_topics` only) and write body per **Extraction Prompt v2** (Summary + Key Concepts + Code Snippets; `es` → Spanish body, English `key_topics` bilingual headings). Use `transcripts/<id>_*.md` glob for slug.
   c. Aggregation: re-read all `sources/` frontmatter + summaries → update `planning_manifest.json` `source_files[]` for affected topics; add a new topic if clustering demands it (keep `type` per §4.1).
   d. Topics: (re)generate affected `dsincubator/topics/` pages with cross-links (§6); pipelines stay `type: Attested Computation`.
   e. Bundle: touch `dsincubator/log.md` (§9) + `sources/log.md` with date + new `id`; ensure `dsincubator/index.md` (okf_version 0.2 §12) + `topics/index.md` (§8) + `sources/index.md` (§8) + `references/` (§6.3) still valid; conformance check vs §11.
   f. Housekeeping (always): update `README.qmd` (Fetch → Example metadata/transcript → Wiki → Example topics/source) + `quarto render README.qmd --to gfm --quiet`; commit. Re-run `./bin/convert-transcripts --format md` if `transcripts/` changed. For incremental adds, `status: draft` until human `verified` (§5.2); flip to `stable` + `verified: { by: human:<reviewer>, at: <date> }` only after review.
3. **Verification**: flip `status: draft` → `stable` and add `verified: { by: human:<reviewer>, at: <date> }` only after human review (§5.2).

## OKF LLM WIKI BUNDLE

Goal: Transform 151 transcript `.md` files into a structured OKF v0.2 knowledge bundle (`dsincubator/`). **Entry point: [`dsincubator/index.md`](dsincubator/index.md)** (§8/§12) — see also [`dsincubator/topics/index.md`](dsincubator/topics/index.md) / [`dsincubator/sources/index.md`](dsincubator/sources/index.md) and history [`dsincubator/log.md`](dsincubator/log.md) (§9).

### Key Documents
- `planning_manifest.json` — Plan defining 59 topic pages across 13 categories (44 + 8 missing topics + overview)
- `topics/` — Aggregated topic/concept pages (each an OKF concept with `type` field)
- `sources/source_<id>_<slug>.md` — Processed source files (1 per transcript)
- `sources/index.md` (§8 index) + `sources/log.md` (§9 history)
- `references/` — External resources for executors/attesters (§6.3)

### Actor Convention (§7)
All `generated.by` fields use `<producer>/<version>` or `process:<id>`:
- `agent:okf-wiki-builder/1.0` — for LLM-generated concept pages
- `process:yt-dlp` — for raw transcript sources
- `process:convert-transcripts` — for converted transcripts (emitted by `bin/convert-transcripts` since the 2026-09-08 spec regen)
- `human:<reviewer>` — for verified fields after human review

### Verification Tiers (§5.3)
- **Unverified**: No `verified` field; consumable but advisory
- **Machine-confirmed**: `verified: { by: process:nightly-verify, at: <date> }`
- **Human-reviewed**: `verified: { by: human:<reviewer>, at: <date> }` — **TODO**: add to all topic pages once ready for review

### OKF Corrections Applied (from agent review)
- `topics/index.md` renamed to `topics/concepts-overview.md` to avoid reserved filename conflict (§3.1)
- All topic concepts have `type` field assigned (§4.1)
- `sources` arrays to be populated with credibility signals (`author`, `usage_count`, `last_modified`) per §5.1
- Spanish transcripts tagged with `lang: es` in frontmatter
- `type: Attested Computation` assigned to targets/drake pipeline transcripts (§10)
- `log.md` planned at bundle root (§9)
- `references/` directory planned for executors/attesters (§6.3)

### Pipeline Steps
1. **Source generation**: LLM extracts concepts from each transcript → `sources/source_<id>_<slug>.md` (script scaffolds frontmatter; agent writes body only)
2. **Aggregation**: Read all source frontmatter + summaries → cluster into topics
3. **Topic generation**: Create 59 topic pages with cross-links (§6)
4. **Bundle assembly**: Create `index.md`, `log.md`, `references/`
5. **Verification**: Human review adds `verified` fields (§5.2)
6. **Conformance check**: Validate against §11

### Searching the wiki: qmd + rg (complements LLM)

[`qmd`](https://github.com/tobi/qmd) complements brute-force LLM (`cat`/`rg`) — local hybrid search (BM25 + vector + LLM rerank). Install: `npm install -g @tobilu/qmd` / `npx @tobilu/qmd` — <https://github.com/tobi/qmd>. Collection `dsincubator` is indexed; after changes: `qmd update && qmd embed -c dsincubator`.

```sh
qmd search "docker" -c dsincubator -n 2 | head -n 20          # fast BM25
qmd query "how to handle merge conflicts git" -c dsincubator -n 2 | head -n 20  # hybrid
qmd get qmd://dsincubator/sources/source_pbc6NX1n01Q_targets-introduction.md | head -n 20
rg -n "key_topics" dsincubator/sources/*.md | head -n 5        # exact grep
```

Use `qmd query` for prose/questions, `qmd search`/`rg` for symbols (`tar_make`); then `qmd get` to pull context. See `qmd --help` and `rg --help`.

Human browsing: open `dsincubator/` in [Obsidian](https://obsidian.md) — graph view, backlinks, [Dataview](https://github.com/blacksmithgu/obsidian-dataview) on frontmatter, [Marp](https://marp.app) decks from markdown. The LLM uses `qmd`; humans use the same files. Pair with [Obsidian Web Clipper](https://obsidian.md/clipper) → `raw/assets/` + `qmd context add` for richer context (per [Karpathy tips](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f#tips-and-tricks)).

### Extraction Prompt (v2 — hardened by 3-file pilot + adversarial review)
Distillation agents MUST follow these rules (pilot caught: invented `tar_load`, rewritten `tags`, unanchored `reproducibility`, false `None mentioned`, target/function conflation):
1. **Quote-to-name**: every package/function name must trace to an exact caption fragment (keep mangled quote + normalized form, e.g. `tar_read` ← `car read`, `covr` ← `cover package`). Cannot quote it → do not write it.
2. **Frozen frontmatter**: copy `tags`, `lang`, `usage_count`, `last_modified` byte-identical from the transcript. Only fill `key_topics`. Never invent tags.
3. **Anchored key_topics**: every slug must appear verbatim (case-insensitive) in a body heading or bolded concept. Non-English bodies use bilingual headings (`Velocidad del equipo / team velocity`). No generic fillers (`r`).
4. **No false `None mentioned`**: before claiming it, search for call patterns (`tar_*`, `expect*`, `use_*`, `Sys.sleep`, file paths). Spoken-but-mangled code → snippet with quote + normalized form.
5. **Disambiguate + don't over-normalize**: targets ≠ functions (`summary` target vs `sum()`); keep caption quote alongside any normalization; vague guard (`stop if not character`) stays vague.

### Missing Topics Added (from agent review)
- `topics/data/databricks-rstudio.md`, `topics/data/production-workflow.md`, `topics/data/r2dii-packages.md`, `topics/data/chromebook-data-science.md`, `topics/data/python-r-interop.md`, `topics/data/code-quality.md`, `topics/data/github-issues-workflow.md`, `topics/data/access-permissions.md`

## QUALITY GATES

- [x] Every `id` in CSV (151 public videos; private ones have no rows) has `transcripts/<id>.<lang>.json3` (`status ok`).
- [x] No unexplained `missing`/`error` rows.
- [x] `manifest.tsv file` resolves to a real file; `lang` matches spoken language.
- [x] Join integrity: each manifest `id` appears exactly once in CSV.
- [x] OKF bundle conformance: every concept has `type` field (§4.1) — 59 topics + 151 sources all `type`
- [x] OKF bundle conformance: `sources` arrays populated with credibility signals (§5.1) — `author`/`usage_count`/`last_modified` per §5.1, `usage_window` sibling
- [x] OKF bundle conformance: actor convention followed in all `generated.by` fields (§7) — `agent:okf-wiki-builder/1.0`, `process:convert-transcripts`, `process:yt-dlp`
- [ ] OKF bundle conformance: `verified` fields added after human review (§5.2) — TODO, all `status: draft` until human `verified`
- [x] No reserved filenames used for concept documents (§3.1) — `topics/concepts-overview.md` not `topics/index.md`; indexes are `index.md` per §8
- [x] `log.md` present at bundle root (§9) — `dsincubator/log.md` + `sources/log.md`
