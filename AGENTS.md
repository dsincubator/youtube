# AGENTS.md — transcript database + LLM wiki

Goal: build `data/metadata.csv` + `transcripts/<id>_<title>.md` (OKF v0.2 format) linked by `id`, then transform N transcripts into an OKF v0.2 LLM wiki bundle per `planning_manifest.json`. **Wiki entry point: [`{bundle_name}/index.md`]({bundle_name}/index.md)** (§8/§12). The pipeline is parameterized — any public YouTube playlist can produce a bundle via `bin/build-wiki`.

When repo state changes (new videos, updated transcripts, schema changes, wiki plan/bundle changes), update `README.qmd` and re-render with `quarto render README.qmd --to gfm --quiet`.

## INPUTS

1. `data/metadata.csv` — columns `playlist_index,title,id,view_count,like_count,comment_count,upload_date,upload_date_iso,duration,duration_string,channel,uploader,url`. `id` is the join key. Maintained by `bin/fetch-metadata` (append new videos by default, `--refresh` rewrites all rows). The `transcript_path` column is computed on-the-fly in `README.qmd` via `fs::dir_ls()` → `tibble()` → `dplyr::left_join()`.
2. Watch URL `https://www.youtube.com/watch?v=<id>` derived from `id`.
3. Transcript files `transcripts/<id>_<sanitized-title>.md` (OKF v0.2) generated from `.json3` captions by `bin/convert-transcripts`.

## LAYOUT

```
# Build repo (contains ./bin/*) — run pipeline here, then export wiki
bin/fetch-metadata           # raw dumps + derive CSV
bin/fetch-transcripts        # fetch captions
bin/convert-transcripts      # json3 -> txt/tsv/md
bin/distill-sources          # transcript .md + CSV → sources/source_<id>_<slug>.md
bin/cluster-topics           # auto-cluster sources → manifests/planning_manifest.json
bin/generate-topics          # manifest + sources → topics/{category}/{topic}.md
bin/assemble-bundle          # generate index.md, indexes, log.md, references/, metadata/
bin/build-wiki               # orchestrator: runs full pipeline → project-outdir/
bin/export-wiki              # --from project-outdir --to /exported-wiki/ (wiki only)

project-outdir/              # build output (intermediaries + wiki); compress whole dir for GH release of build-repo
├── manifests/               # intermediaries (NOT indexed in wiki)
│   ├── planning_manifest.json  # wiki plan (moved from bundle root, not indexed)
│   ├── metadata.tsv         # metadata fetch manifest (from metadata/manifest.tsv)
│   └── transcripts.tsv      # transcripts fetch manifest (from transcripts/manifest.tsv)
├── assets/                  # intermediaries (NOT indexed) — *.tar.gz release assets
│   ├── metadata-raw.tar.gz
│   └── transcripts-raw.tar.gz
├── data/                    # intermediaries (NOT indexed) — build-only CSV etc.
│   └── metadata.csv         # derived table, N videos (build intermediate; wiki copy is metadata/metadata.csv)
├── metadata/                # raw per-video dump (intermediary, pruned, kept for re-derive)
│   └── manifest.tsv         # legacy compat copy (canonical is manifests/metadata.tsv)
├── transcripts/             # raw captions + transcripts/<id>_<slug>.md (intermediary; wiki copy is wiki/transcripts/)
│   └── manifest.tsv         # legacy compat copy
└── wiki/                    # OKF v0.2 LLM wiki bundle — EXPORTED via bin/export-wiki (indexed)
    ├── index.md             # bundle root (okf_version 0.2 §12) — START HERE (§8/§12)
    ├── README.md            # recommends adding summaries/ via LLM (see wiki/AGENTS.md)
    ├── AGENTS.md            # wiki maintenance / querying (separate from build AGENTS.md)
    ├── log.md               # bundle history (§9)
    ├── metadata/            # wiki metadata (indexed)
    │   ├── metadata.md      # column dict for metadata.csv (was data/metadata.md)
    │   └── metadata.csv     # derived table (copy of project-outdir/metadata.csv, indexed)
    ├── transcripts/         # transcripts/<id>_<slug>.md OKF v0.2 (deterministic, indexed)
    ├── topics/              # N topic pages + topics/index.md (§8) (indexed)
    ├── sources/             # N distilled sources (only dsincubator; dslab/dshangout have no sources/ — deterministic bin/* only)
    ├── references/          # external executors/attesters (§6.3) (indexed)
    └── planning_manifest.json is NOT in wiki (stays in project-outdir/manifests/)

README.qmd                   # Quarto source → rendered to README.md (build repo)
README.md                    # Rendered output (build repo, not wiki)
```

- `json3` = `events[].tStartMs/dDurationMs` + `segs[].utf8/tOffsetMs` (word-level timing for editing).
- `.md` transcripts follow OKF v0.2: YAML frontmatter (`type`, `title`, `description`, `resource`, `tags`, `lang`, `generated`, `status`, `sources` + `usage_window`) + `# Transcript` body with deterministic timestamps (`00:08: text` per event derived from `tStartMs`, no LLM). Frontmatter is regenerated from spec by `bin/convert-transcripts` — never trust it, re-derive it (description = first substantive sentence, not caption filler; `tags` = topical keyword scan + bundle tag (`ds-incubator` default, `--tag` override); `generated.by` = `process:convert-transcripts` per §7; `lang` from caption track; `usage_count`/`last_modified`/`usage_window` from CSV).
- `lang` = original spoken language (`en` most videos, `es` for 6 Spanish-titled ones: `1lpcCHfozh0`, `EmDubkF8DpQ`, `hs_Pzxny7XE`, `kNV8dDGF7Hw`, `nSJT8NGhSTs`, `xx5WNZgQEdY`).
- The `g1PRMaTFYdk` duplicate rows are byte-identical, so either survives the collapse.
- The 3 `private` videos have no CSV rows and are never attempted by `fetch-transcripts`; the transcript gate below applies to the 151 public IDs only.
- `--count N` / `--limit N` take the first N IDs in sorted order. Add `--cookies-from-browser chrome` whenever output contains "Sign in to confirm you're not a bot".
- Never commit `raw/`, `.omo/`, `.Rhistory`, `.Rproj.user`, `*/blog_files`, `**/*.html`.

## SCRIPT: `bin/convert-transcripts`

```
./bin/convert-transcripts                          # all videos (txt + tsv)
./bin/convert-transcripts --count 3                # first 3 (test)
./bin/convert-transcripts --format txt             # .txt only
./bin/convert-transcripts --format tsv             # .tsv only
./bin/convert-transcripts --format md              # OKF .md only (body 00:08: text, deterministic)
./bin/convert-transcripts --format both            # txt + tsv
./bin/convert-transcripts --format all             # txt + tsv + md
./bin/convert-transcripts --format md --tag ds-lab --count 3  # tag override
```

Reads `data/metadata.csv` for the video ID list and title, converts each `transcripts/<id>.*.json3` to:
- `<id>_<sanitized-title>.txt` (plain text)
- `<id>_<sanitized-title>.tsv` (tab-separated `<tStartMs>\t<text>`)
- `<id>_<sanitized-title>.md` (OKF v0.2: YAML frontmatter + `# Transcript` body with deterministic timestamps `00:08: text` per event derived from `tStartMs`, no LLM)

Titles are ASCII-slugified (`unidecode` → replace non-alphanumerics with `-`, lowercase). The `.md` format includes spec-derived OKF v0.2 frontmatter: `title`/`resource` from CSV, `description` = first substantive sentence (filler-aware; caption fallback joins first content lines), `tags` = scored topical keyword scan (`TAG_RULES`, word-boundary for ≤3-char keys) + bundle tag (`ds-incubator` default, `--tag` override), `lang` from caption track (`en`/`es` via `.*-orig` priority `en-orig`/`es-orig`), `generated.by` = `process:convert-transcripts` (§7), `sources` + `usage_count` (`view_count`) / `last_modified` (`upload_date_iso`) / `usage_window`. Skips videos without a json3 file.

## SCRIPT: `bin/fetch-transcripts`

```
./bin/fetch-transcripts                  # 151 videos
./bin/fetch-transcripts --count 3        # first 3 (test)
./bin/fetch-transcripts --force          # re-fetch existing
./bin/fetch-transcripts --cookies-from-browser chrome
```

Flags: `--count N`, `--force`, `--cookies-from-browser BROWSER`, `--csv PATH`, `--out-dir DIR`, `--sub-format FORMAT`, `--sleep SECONDS`, `--retries N`, `--help`.

Per video: `yt-dlp --skip-download --write-auto-subs --sub-langs "en-orig,es-orig,en.*,es.*" --sub-format "json3/srv3/vtt/best" -o "transcripts/<id>.%(ext)s" -- "https://www.youtube.com/watch?v=<id>"` — 3 attempts (1 s sleep), falls back once to `--sub-langs ".*-orig"` when no `en`/`es` track exists, logs to `/tmp/fetch-transcripts-<id>.log`, records `id status file lang` in `manifest.tsv`. One file per video is kept (preferring `en-orig` > `es-orig` > `*-orig` > `en` > `es`; duplicates/translations pruned). `--` protects ids starting with `-`/`_`.

## SCRIPT: `bin/fetch-metadata`

```
./bin/fetch-metadata --limit 2        # smoke test (first 2 playlist entries)
./bin/fetch-metadata                  # fetch missing dumps, derive CSV
./bin/fetch-metadata --refresh        # re-fetch all dumps, drop removed rows
```

Flags: `--refresh`, `--playlist URL`, `--csv PATH`, `--meta-dir DIR`, `--limit N`, `--cookies-from-browser BROWSER`, `--sleep SECONDS`, `--retries N`, `--help`.

Raw-first: `yt-dlp --skip-download --dump-single-json` per video to `metadata/<id>.json` (skips existing dumps unless `--refresh`; corrupt dumps re-fetched), then `data/metadata.csv` derived from the store (atomic replace; refresh aborts when >2 and >10% of videos fail). Terminal states (`private`/`unavailable` with reason) are recorded in `metadata/manifest.tsv` and skipped on later runs — `--refresh` re-probes them. Per-video logs to `/tmp/fetch-metadata-<id>.log`.

## STATUS (2026-09-09)

- [x] `metadata/`: 151 dumps + `manifest.tsv` (154 rows: 151 `ok`, 3 `private` with reasons).
- [x] `data/metadata.csv`: 151 rows derived, join integrity holds.
- [x] `transcripts/`: 151/151 fetched, all `ok`; `.md` (OKF v0.2) derived for all 151 via `bin/convert-transcripts` (deterministic `mm:ss: text`, `transcripts-raw.tar.gz` sibling archived + cleaned).
- [x] `bin/convert-transcripts`: supports `--format md` and `--format all`; generates OKF v0.2 transcripts with YAML frontmatter; auto-creates `transcripts-raw.tar.gz` sibling.
- [x] `bin/fetch-metadata`: auto-creates `metadata-raw.tar.gz` sibling after CSV derive (only `<id>.json`, excludes `manifest.tsv`).
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
- [x] `data/` directory (2026-09-09): **151/151** ok via `bin/assemble-bundle` — `data/metadata.md` + `data/metadata-raw.md` + `data/transcripts-raw.md` + `data/index.md` (§8) as `type: Concept` (§4.1) with `sources[]` credibility + `agent:okf-wiki-builder/1.0` (§7), cross-links to `transcripts-raw.tar.gz`/`metadata-raw.tar.gz` release assets (`log.md` tag `dsincubator-v0.0.1`); verified on `~/git/dsincubator/dslab` (23/23, `LDHGENv1NP4: 3288 events`) + `~/git/dsincubator/dshangout` (217/230 md, 13 `vtt`-only, `HtKgIrOnJc8: 2992 events`) — deterministic `mm:ss: text`, archives at bundle root, `README.md` per `dslab` style.

## NEXT (fresh-agent runbook — start here)

0. Read this file top to bottom, then `planning_manifest.json` and [`dsincubator/index.md`](dsincubator/index.md). Do not touch `transcripts/` frontmatter by hand — `bin/convert-transcripts` owns it.
1. **Bundle is complete as of 2026-09-09**: `sources/` 151/151, `topics/` 59/59, bundle indexes + `log.md` + `data/` 4/4 present (`data/metadata.md`, `data/metadata-raw.md`, `data/transcripts-raw.md`, `data/index.md` §8). For maintenance, see `## GENERALIZED WORKFLOW` for the parameterized pipeline.
2. **When a new video/transcript appears** (or existing transcript updated):
    a. Fetch: `./bin/fetch-metadata` → `./bin/fetch-transcripts` → `./bin/convert-transcripts --format md` (creates `transcripts/<id>_<slug>.md` OKF v0.2).
    b. Distill one source: scaffold frontmatter deterministically from transcript + `data/metadata.csv` (copy `title`, `tags`, `lang`, `usage_count`, `last_modified`, `usage_window`, `sources[]` byte-identical; `type: source`, `generated.by: agent:okf-wiki-builder/1.0`, `status: draft`; fill `key_topics` only) and write body per **Extraction Prompt v2** (Summary + Key Concepts + Code Snippets; `es` → Spanish body, English `key_topics` bilingual headings). Use `transcripts/<id>_*.md` glob for slug. See `bin/distill-sources --help`.
    c. Aggregation: re-read all `sources/` frontmatter + summaries → update `planning_manifest.json` `source_files[]` for affected topics; add a new topic if clustering demands it (keep `type` per §4.1). See `bin/cluster-topics`.
    d. Topics: (re)generate affected `dsincubator/topics/` pages with cross-links (§6); pipelines stay `type: Attested Computation`. See `bin/generate-topics`.
    e. Bundle: touch `dsincubator/log.md` (§9) + `sources/log.md` with date + new `id`; ensure `dsincubator/index.md` (okf_version 0.2 §12) + `topics/index.md` (§8) + `sources/index.md` (§8) + `references/` (§6.3) still valid; conformance check vs §11. See `bin/assemble-bundle`.
    f. Housekeeping (always): update `README.qmd` (Fetch → Example metadata/transcript → Wiki → Example topics/source) + `quarto render README.qmd --to gfm --quiet`; commit. Re-run `./bin/convert-transcripts --format md` if `transcripts/` changed. For incremental adds, `status: draft` until human `verified` (§5.2); flip to `stable` + `verified: { by: human:<reviewer>, at: <date> }` only after review.
3. **Verification**: flip `status: draft` → `stable` and add `verified: { by: human:<reviewer>, at: <date> }` only after human review (§5.2).

## OKF LLM WIKI BUNDLE

Goal: Transform N transcript `.md` files into a structured OKF v0.2 LLM wiki bundle per `planning_manifest.json`. **Wiki entry point: [`{bundle_name}/index.md`]({bundle_name}/index.md)** (§8/§12).

### Key Documents
- `planning_manifest.json` — Plan defining topic pages across categories per `bundle_name`
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
qmd search "docker" -c dsincubator -n 2          # fast BM25
qmd query "how to handle merge conflicts git" -c dsincubator -n 2  # hybrid
qmd get qmd://dsincubator/sources/source_pbc6NX1n01Q_targets-introduction.md
rg -n "key_topics" dsincubator/sources/*.md | head -n 5
```

Use `qmd query` for prose/questions, `qmd search`/`rg` for symbols (`tar_make`); then `qmd get` to pull context. See `qmd --help` and `rg --help`.

See other [tips and tricks](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f#tips-and-tricks).

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

- [x] Every `id` in CSV (public videos; private ones have no rows) has `transcripts/<id>.<lang>.json3` (`status ok`).
- [x] No unexplained `missing`/`error` rows.
- [x] `manifest.tsv file` resolves to a real file; `lang` matches spoken language.
- [x] Join integrity: each manifest `id` appears exactly once in CSV.
- [x] OKF bundle conformance: every concept has `type` field (§4.1).
- [x] OKF bundle conformance: `sources` arrays populated with credibility signals (§5.1) — `author`/`usage_count`/`last_modified` per §5.1, `usage_window` sibling.
- [x] OKF bundle conformance: actor convention followed in all `generated.by` fields (§7) — `agent:okf-wiki-builder/1.0`, `process:convert-transcripts`, `process:yt-dlp`.
- [ ] OKF bundle conformance: `verified` fields added after human review (§5.2) — TODO, all `status: draft` until human `verified`.
- [x] No reserved filenames used for concept documents (§3.1) — `topics/concepts-overview.md` not `topics/index.md`; indexes are `index.md` per §8.
- [x] `log.md` present at bundle root (§9).
- [ ] Bundle-specific conformance verified per `## GENERALIZED WORKFLOW` quality gates (silhouette > 0.3, 100% coverage, separation ratio).

## GENERALIZED WORKFLOW — Build wiki for ANY public playlist

Goal: parametrize the entire pipeline so `bin/build-wiki` produces a complete OKF v0.2 LLM wiki bundle for any public YouTube playlist. Output directory is an argument with a sensible default (working directory). Tested with `dslab` playlist (`PL9HYL-VRX0oSeWeMEGQt0id7adYQXebhT`) at `./dslab/`.

### Parameters

| Param | Flag | Default | Description |
|-------|------|---------|-------------|
| `playlist_url` | `--playlist` | ds-incubator playlist | YouTube playlist URL |
| `bundle_name` | `--name` | slugified playlist title | Bundle identifier (`dslab`) |
| `bundle_tag` | `--tag` | same as `bundle_name` | Tag used in source frontmatter (`ds-lab`) |
| `out_dir` | `--out-dir` | `./{bundle_name}` | Output directory |
| `count` | `--count` | 0 (all) | Limit for testing |

### Architecture

**Fetch/transcript layer (already generalized):**
- `bin/fetch-metadata` — `--playlist`, `--csv`, `--meta-dir`
- `bin/fetch-transcripts` — `--csv`, `--out-dir`
- `bin/convert-transcripts` — `--csv`, `--out-dir`, `--format md`

**Wiki layer (new scripts to create):**
- `bin/distill-sources` — transcript `.md` + `metadata.csv` → `sources/source_<id>_<slug>.md`
- `bin/cluster-topics` — all `sources/` → `planning_manifest.json` (auto-clustering + eval)
- `bin/generate-topics` — manifest + sources → `topics/{category}/{topic}.md`
- `bin/assemble-bundle` → `index.md`, `topics/index.md`, `sources/index.md`, `log.md`, `references/`
- `bin/build-wiki` — orchestrator (runs full pipeline with `--count N` support)

`bin/build-wiki` is the standalone orchestrator (no task runner).

### Script Specs

#### `bin/distill-sources`
```
./bin/distill-sources --csv <csv> --transcripts-dir <dir> --out-dir <sources/> --tag <tag> [--count N]
```
- Reads `transcripts/<id>_<slug>.md` (OKF v0.2) + `metadata.csv`
- Scaffolds frontmatter deterministically: `type: source`, `title`, `tags: [<bundle_tag>, ...]`, `lang`, `usage_count`, `last_modified`, `usage_window`, `sources[]`, `generated.by: agent:okf-wiki-builder/1.0`, `status: draft`
- LLM fills **only** `key_topics` (Extraction Prompt v2: quote-to-name, anchored, bilingual headings for `es`)
- Restructures body into: Summary, Key Concepts & Tools Taught, Code Snippets & Formulas
- Writes `sources/source_<id>_<slug>.md`

#### `bin/cluster-topics`
```
./bin/cluster-topics --sources-dir <dir> --out-file <manifest.json> --bundle-name <name> --playlist-url <url>
```
- Loads all `sources/` frontmatter + summaries
- **Embedding**: TF-IDF vectorizer (not `sentence-transformers` — too heavy) on title + key_topics + summary text → dense vectors
- **Clustering**: HDBSCAN (auto-discovers K) if N ≥ 5; simple tag-overlap clustering if N < 5
- **Evaluation** (automated, no human):
  - Silhouette score > 0.3 (coherence)
  - Coverage: 100% sources assigned
  - Separation: inter-cluster > intra-cluster × 1.5
  - LLM-as-judge via agent framework: "Do all sources in this cluster share a coherent theme?" (per cluster)
  - Topic title quality: non-generic, descriptive (LLM judge)
- **Retry**: If any metric fails → adjust `min_cluster_size`/`min_samples` → re-cluster → re-eval (max 3 attempts)
- Writes `planning_manifest.json` with `bundle_name`, `okf_version`, `playlist_url`, `topics[]` (topic_filename, topic_title, type, description, source_files[])

#### `bin/generate-topics`
```
./bin/generate-topics --manifest <json> --sources-dir <dir> --out-dir <topics/>
```
- Reads `planning_manifest.json` + all `sources/` frontmatter + summaries
- For each topic: generates OKF concept page with `type` (§4.1)
- `sources[]` with credibility signals (§5.1): `author`, `usage_count`, `last_modified`
- Cross-links (§6): `see also:` to related topics
- `Attested Computation` for pipeline topics (§10): `runtime`, `computation_type`
- Actor: `agent:okf-wiki-builder/1.0`
- Writes `topics/{category}/{topic}.md`

#### `bin/assemble-bundle`
```
./bin/assemble-bundle --bundle-dir <dir> --manifest <json> --bundle-name <name> --bundle-tag <tag> --playlist-url <url>
```
- Generates `index.md` (bundle root, OKF v0.2 §12) matching README.md format:
  - Title from playlist (e.g., `# <Title> Wiki`)
  - `Knowledge base of ... [Playlist](url) ... [LLM wiki](karpathy) in [OKF](gcp) v0.2`
  - `Both humans and AI-agents should start at [index.md](index.md)`
  - `See [tools, tips and tricks](karpathy#optional-cli-tools) ...`
  - **Contents — START HERE** section with links (no Build section — tools in separate repo)
- `topics/index.md` (directory index §8) + `topics/concepts-overview.md` (concept listing §3.1)
- `sources/index.md` (directory index §8) + `sources/log.md` (history §9)
- `log.md` (bundle root history §9)
- `references/index.md` (§6.3)
- `README.md` — brief sentence + links (rendered from template)

#### `bin/build-wiki` (orchestrator)
```
./bin/build-wiki --playlist <url> --name <name> --tag <tag> --out-dir <dir> [--count N]
```
- Runs: fetch-metadata → fetch-transcripts → convert-transcripts → distill-sources → cluster-topics → generate-topics → assemble-bundle
- `--count N` limits all steps to first N videos (full pipeline test)

### Requirements

**`requirements.txt`** — Python deps for clustering:
```
numpy>=1.24
scipy>=1.11
scikit-learn>=1.4
hdbscan>=0.8
PyYAML>=6.0
```
Install: `pip3 install -r requirements.txt`

No task runner — use `bin/build-wiki` directly.

### Search Integration (suggested, not enforced)

README.md includes a pointer to `qmd`:
```markdown
## Search the wiki

[`qmd`](https://github.com/tobi/qmd) provides local hybrid search (BM25 + vector + LLM rerank) over the bundle.
```bash
qmd collection add ./dslab --name dslab
qmd embed -c dslab
qmd search "topic" -c dslab -n 3
qmd query "question" -c dslab -n 3
```
```

### Bundle Tag Convention

- **Bundle name**: slugified playlist title (e.g., `dslab`)
- **Bundle tag**: same as bundle name (e.g., `ds-lab`), used in `tags: ["ds-lab", ...]`
- **No `ds-incubator` references** in new bundles
- Frontmatter `tags` = `[bundle_tag, <extracted_topics>]`

### Distribution Preferences

- **Transcripts**: `transcripts/<id>_<slug>.md` bodies are deterministic `mm:ss: text` per `tStartMs` (no LLM) — keep `.md` + `manifest.tsv` readable in `transcripts/`. Raw captions (`*.json3`, `*.vtt`, `*.srt`, `*.srv3`, `*.tsv`, `*.txt`) archived as `transcripts-raw.tar.gz` at **bundle root** (sibling of `transcripts/`), not inside it. `bin/convert-transcripts` auto-creates this archive and cleans raw files from `transcripts/` after every run (workflow: download raw → generate `transcripts-raw.tar.gz` sibling → generate `.md` under `transcripts/` → remove non-`.md` from `transcripts/`).
- **Metadata**: `metadata/` raw dumps (`metadata/<id>.json` per video + `metadata/manifest.tsv`) archived as `metadata-raw.tar.gz` at **bundle root** (sibling of `metadata/`), not inside it. `bin/fetch-metadata` auto-creates this archive after CSV derive and cleans `metadata/*.json` from `metadata/` (keep `manifest.tsv` readable; workflow: download raw → `metadata-raw.tar.gz` sibling → derive `metadata.csv` → remove `*.json` from `metadata/`); `metadata.csv` (derived table, bundle root `data/metadata.csv` for `dsincubator` 151, per-bundle `bundle/metadata.csv`) is build intermediate used by `fetch-transcripts`/`convert`/`distill` but not shipped; only dictionaries are published.
- **README**: bundles emit `README.md` at bundle root per `dslab/README.md` wording — `# <Title> Wiki`, `Knowledge base of ... [Playlist](url) ... [LLM wiki](karpathy) in [OKF](gcp) v0.2`, `Both humans and AI-agents should start at [index.md](index.md)`, `See [tools, tips and tricks](karpathy#optional-cli-tools) ...` (no image; `raw/assets/graph.png` deleted).
- **Data directory**: bundles emit `data/` as `type: Concept` dictionaries (§4.1) + indexes:
  - `data/metadata.md` — column dictionary for `metadata.csv` (`playlist_index,title,id,view_count,like_count,comment_count,upload_date,upload_date_iso,duration,duration_string,channel,uploader,url` per `AGENTS.md:9`) — auto-generated from header + static descriptions.
  - `data/metadata-raw.md` — field dictionary for `metadata-raw.tar.gz` (`<id>.json` skimmed `automatic_captions/subtitles/formats` pruned, rest kept: `id,title,description,channel,uploader,view_count,like_count,comment_count,upload_date,chapters,comments`) — auto-generated by sampling one dump + static annotations; explains `metadata-raw.tar.gz` is attached as GH release asset.
  - `data/transcripts-raw.md` — schema dictionary for `transcripts-raw.tar.gz` (`events[].tStartMs/dDurationMs` + `segs[].utf8/tOffsetMs/acAsrConf` per `AGENTS.md:39`) — auto-generated from one `json3` sample + static annotations; explains `transcripts-raw.tar.gz` is attached as GH release asset.
  - `data/index.md` (§8) — directory index listing the three dictionaries.
  - `data/` has no separate `log.md`; history lives in bundle root `log.md` (`AGENTS.md:182`) which records release tags.
- **Releases**: `transcripts-raw.tar.gz` + `metadata-raw.tar.gz` attached as GH release assets together with final repo version. Version tag recorded in bundle `log.md` (e.g., `dslab-v0.0.1`, `dshangout-v0.0.1`) and in git as `bundle-v0.0.1`. Release creation is manual after review (not in `bin/build-wiki`). `.gitignore:11` ignores `**/transcripts-raw.tar.gz` and `**/metadata-raw.tar.gz`.

### NEW BUILD / EXPORT LAYOUT (prunes old `data/` + `manifests/`/`assets` from wiki index)

**Rule: nothing in the wiki `index.md` mentions a build-intermediary.** Build intermediaries stay in `project-outdir/` (or bundle root `manifests/`/`assets/`/`data/` before export) and are **NOT** indexed. Only wiki content is indexed and exported.

* **`metadata/metadata.csv` + `metadata/metadata.md` (indexed) replaces `data/metadata.md` + `./metadata.csv`**  
  `bin/assemble-bundle` now writes `wiki/metadata/metadata.md` (was `data/metadata.md`) as `type: Concept` (§4.1) + copies `project-outdir/metadata.csv` (or `data/metadata.csv`/`bundle/metadata.csv` build intermediate) → `wiki/metadata/metadata.csv` (indexed). Old `data/` is intermediary-only (NOT indexed); link in wiki is `[metadata.csv](metadata/metadata.csv)` (was `[metadata.csv](metadata.csv)`).
* **`manifests/planning_manifest.json` (NOT indexed) replaces `planning_manifest.json` at bundle root**  
  `bin/cluster-topics --out-file manifests/planning_manifest.json` (was `planning_manifest.json`). `bin/generate-topics --manifest manifests/planning_manifest.json`. Not listed in any `index.md`.
* **`project-outdir/` intermediaries (NOT indexed):** `manifests/` (`metadata.tsv`, `transcripts.tsv`, `planning_manifest.json`), `assets/` (`*.tar.gz`), `data/` (`metadata.csv` build copy)
* **`wiki/` indexed:** `index.md`, `README.md`, `AGENTS.md` (wiki maintenance, separate from build `AGENTS.md`), `log.md`, `metadata/metadata.csv` + `metadata/metadata.md`, `transcripts/*.md`, `topics/**`, `sources/` (only `dsincubator`; `dslab`/`dshangout` have no `sources/` — deterministic `bin/*` only), `references/`  
  `sources/` is **NOT** generated by `bin/build-wiki` for `dslab`/`dshangout`; `wiki/README.md` recommends adding `summaries/` via LLM (see `wiki/AGENTS.md`). `planning_manifest.json` is never in `wiki/`.
* **Export:** `bin/export-wiki --from project-outdir --to /exported-wiki/` copies **only** wiki dirs (`index.md`, `README.md`, `AGENTS.md`, `log.md`, `metadata/`, `transcripts/`, `topics/`, `sources/` if present, `references/`) to `--to` (clean wiki). Build repo is compressed whole (`project-outdir/` including intermediaries) for GH release of build-repo.

### TODO — archive (2026-09-09 and earlier — pruned, keep latest only)

- [x] `requirements.txt` + Python deps + `bin/*` pipeline (`distill`/`cluster`/`generate`/`assemble`/`build-wiki`) + `AGENTS.md` generalizations + `README.qmd`
- [x] `dslab` verified 23/23 (`LDHGENv1NP4: 3288 events`), `dshangout` 217/230 md, 13 `vtt`-only
- [x] `data/` dictionaries 2026-09-09 (`metadata.md`/`metadata-raw.md`/`transcripts-raw.md` + `index.md` §8) + `metadata-raw.tar.gz` sibling + `transcripts-raw.tar.gz` sibling + `graph.png` cruft cleaned + `transcripts/manifest.tsv` re-tracked + `metadata/*.json` cleaned after tar

### TODO — next (fresh-agent start here)

- [x] **Remove `sources/` from `dslab`/`dshangout`**: deterministic `bin/*` only; `dsincubator` keeps `sources/` (already has LLM summaries). Update `index.md` Contents to not list `sources/` for those bundles.
- [ ] **Add `data/` directory to bundles** (fresh-agent runbook — deterministic, no LLM) — **PRUNED: see NEW BUILD / EXPORT LAYOUT above** (old `data/` + `manifests/`/`assets` no longer indexed; now `metadata/metadata.csv` + `metadata/metadata.md` indexed, `manifests/planning_manifest.json` not indexed)
  - Old subtasks pruned (now: `bin/assemble-bundle` writes `wiki/metadata/` + `project-outdir/manifests/planning_manifest.json`; `bin/fetch-metadata` still creates `metadata-raw.tar.gz`; `.gitignore` already covers `**/*.tar.gz`)
- [x] **New build / export layout** (this plan):
  - [x] `bin/fetch-metadata`: keep `metadata-raw.tar.gz` at bundle root sibling; `metadata.csv` is build intermediate (`data/metadata.csv` or `bundle/metadata.csv`) — wiki copy is `wiki/metadata/metadata.csv`
  - [x] `bin/assemble-bundle`: **prune** `data/`/`manifests/`/`assets` from wiki `index.md`; generate `wiki/metadata/metadata.md` (§4.1) + `wiki/metadata/metadata.csv` (copy) + `wiki/metadata/index.md` sibling; `manifests/planning_manifest.json` (not indexed) via `bin/cluster-topics --out-file manifests/planning_manifest.json`; wiki `index.md` Contents links only `transcripts/` + `topics/` + `sources/` (dsincubator only) + `metadata/` + `references/` + `log.md`
  - [x] `bin/build-wiki`: ensure `project-outdir/` structure (intermediaries + `wiki/`); `data/metadata.csv` build copy stays in `project-outdir/data/` (not wiki)
  - [x] `bin/export-wiki`: new `bin/export-wiki --from project-outdir --to /exported-wiki/` — copies **only** wiki dirs (`index.md`, `README.md`, `AGENTS.md`, `log.md`, `metadata/`, `transcripts/`, `topics/`, `sources/` if present, `references/`) to `--to`; verify no `data/`/`manifests/`/`assets` leaked
  - [x] `.gitignore:11` already ignores `**/transcripts-raw.tar.gz` + `**/metadata-raw.tar.gz`; keep
  - [x] Test on both bundles: `~/git/dsincubator/dslab` (23/23 via dslab_build --count 3 pilot) + `~/git/dsincubator/dshangout` (217/230 md, 13 `vtt`-only) — verify wiki `metadata/*.md` indexed, `manifests/planning_manifest.json` not indexed, `index.md` has no `data/`/`manifests/`/`assets` links, `export-wiki` clean (`/tmp/dslab` 19 files, no leaks)
- [ ] **qmd integration**: `qmd collection add ./dslab --name dslab && qmd embed -c dslab` — NEXT (after export layout lands)

### IDEAS / PLAN

All future plans, local model optimization strategies, evaluation frameworks, generalized pipeline tasks, new bundle targets, and advanced architecture ideas (from `awesome-llm-wiki`) are fully detailed in **`ideas/`**:
- [`ideas/local-llm-workflow-optimization.md`](ideas/local-llm-workflow-optimization.md) — Local-first pipeline optimization & model routing
- [`ideas/eval-plan.md`](ideas/eval-plan.md) — Comprehensive evaluation plan (T1–T5 tasks × models, judge calibration, CI gates)
- [`ideas/generalized-wiki-pipeline.md`](ideas/generalized-wiki-pipeline.md) — Generalized pipeline scripts & dslab execution plan
- [`ideas/new-bundles.md`](ideas/new-bundles.md) — Expansion to ds-handout, ds-lab, and rOpenSci
- [`ideas/awesome-llm-wiki-ideas.md`](ideas/awesome-llm-wiki-ideas.md) — Advanced blueprints (Dream Cycles, two-pass distillation, MCP, Pydantic, graphwiki)
- [`ideas/wiki-maintenance-workflows.md`](ideas/wiki-maintenance-workflows.md) — Day-2 maintenance, incremental ingest, verification (§5.2), gap analysis
