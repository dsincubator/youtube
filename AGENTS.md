# YouTube playlist → transcripts & knowledge-base support

**Goal of this repo**: Pull YouTube transcripts and related data (metadata + captions) from any public playlist to provide clean, deterministic source material for later knowledge-base creation.

Primary output is citable transcripts + metadata (`data/metadata.csv`, `metadata/<id>.json`, `transcripts/<id>.*.json3` → `transcripts/<id>_<slug>.md`). The OKF v0.2 wiki assembly (`{out-dir}/wiki/index.md` via `bin/assemble-wiki` / `bin/export-wiki`) is a downstream example consumer of that data, not the core goal.

Do not edit `transcripts/` frontmatter by hand — `bin/convert-transcripts` owns it. When repo state changes, update `README.qmd` and run `quarto render README.qmd --to gfm --quiet`.
## Conventions for AI agents

- **Determinism:** The deterministic first pass (above) must stay deterministic — no LLM. See contract below.
- **Naming:** User-facing term is **wiki** (not bundle). `wiki` = assembled OKF bundle at `{out-dir}/wiki/`. Code uses `wiki` canonical; `bin/assemble-bundle` remains as shim → `bin/assemble-wiki` (flag aliases removed; use `--wiki-name`/`--wiki-tag`/`--from`/`--to`).
- **Flag consistency:** Same concept = same flag name everywhere, no aliases:
  - Directory in/out: `--from` / `--to` (e.g. `assemble-wiki --from ./dslab`, `export-wiki --from ./dslab --to ./dslab-wiki`, `build-wiki --to ./dslab`).
  - File inputs: `--csv`, `--manifest`, `--meta-dir` stay descriptive (no generic alias — disambiguates `file vs dir` and tools with 2 inputs/outputs like `fetch-metadata`).
  - Wiki identity: `--wiki-name` / `--wiki-tag` (no `--bundle-*`/`--name`/`--tag` aliases).

---

## Workflow

### 1. One-command (preferred)

```sh
./bin/build-wiki \
  --playlist "https://www.youtube.com/playlist?list=PL9HYL-VRX0oSeWeMEGQt0id7adYQXebhT" \
  --wiki-name dslab \
  --wiki-tag dslab \
  --to ./dslab \
  --count 3

./bin/export-wiki --from ./dslab --to ./dslab-wiki
```

### 2. Step-by-step (for debugging)

```sh
OUT=./dslab
PLAYLIST="https://www.youtube.com/playlist?list=PL9HYL-VRX0oSeWeMEGQt0id7adYQXebhT"

# Step 1: Playlist dumps → metadata.csv
./bin/fetch-metadata --playlist "$PLAYLIST" --csv "$OUT/data/metadata.csv" --meta-dir "$OUT/metadata" --limit 3

# Step 2: Captions per video ID
./bin/fetch-transcripts --csv "$OUT/data/metadata.csv" --to "$OUT/transcripts" --count 3

# Step 3: Captions → OKF v0.2 transcripts/*.md (deterministic, no LLM; uses *.json3 tStartMs)
./bin/convert-transcripts --csv "$OUT/data/metadata.csv" --from "$OUT/transcripts" --format md --wiki-tag ds-lab --count 3

# Step 4: Assemble wiki tree (transcripts, descriptions, indexes) — deterministic only (no topics)
./bin/assemble-wiki --from "$OUT" --wiki-name dslab --wiki-tag ds-lab --playlist-url "$PLAYLIST"

# Step 5: Export clean wiki
./bin/export-wiki --from "$OUT" --to ./dslab-wiki
```

> **Determinism contract:** The first pass (`bin/build-wiki` → fetch → transcripts → `convert-transcripts` → `assemble-wiki`) MUST remain fully deterministic and offline after the `yt-dlp` fetches (no LLM, no external APIs). This guarantees a reproducible, citable wiki (transcripts + descriptions) with zero model variance. Agents MUST NOT squeeze LLM summarization, embeddings, or topic clustering into this pass. LLM work (better `description`, `key_topics`, `topics/`) is strictly optional post-processing (see Optional LLM tools) and requires explicit user opt-in + re-index.

---

## Tools (`bin/`)

Run from repo root. All scripts support `-h` / `--help`. Canonical names use **wiki**; `bundle` aliases are kept for backward compat and are noted as `# alias …`.

### `bin/build-wiki` (orchestrator)
Runs fetch → transcripts → convert → assemble (does not run optional LLM tools or export).

```sh
./bin/build-wiki --playlist URL --wiki-name NAME --wiki-tag TAG --to DIR [--count N]
```

| Flag         | Default  | Meaning                        |
| ------------ | -------- | ------------------------------ |
| `--playlist` | required | YouTube playlist URL           |
| `--wiki-name`| `dslab`  | Wiki identifier                |
| `--wiki-tag` | `ds-lab` | Frontmatter tag on transcripts |
| `--to`       | `dslab`  | Project output directory       |
| `--count N`  | all      | First N videos (`-n` short)    |

### `bin/fetch-metadata`
Raw-first: `yt-dlp --dump-single-json` per video → `metadata/<id>.json`, derived `data/metadata.csv`. Default fetches missing dumps only; `--refresh` re-fetches all. Skips private/unavailable videos (logged in `metadata/manifest.tsv`). Archives dumps to `metadata-raw.tar.gz`.

CSV columns: `playlist_index,title,id,view_count,like_count,comment_count,upload_date,upload_date_iso,duration,duration_string,channel,uploader,url,description`.

```sh
./bin/fetch-metadata --playlist URL --csv PATH --meta-dir DIR [--refresh] [--limit N]
```

| Flag | Default | Meaning |
|------|---------|---------|
| `--playlist` | default playlist | Playlist URL |
| `--csv` | `data/metadata.csv` | Derived CSV table |
| `--meta-dir` | `metadata` | Raw JSON directory |
| `--refresh` | off | Re-fetch all dumps |
| `--limit N` | all | First N entries |
| `--skip-comments` | off | Skip yt-dlp comments |
| `--cookies-from-browser` | none | e.g. `chrome`, `firefox` |
| `--sleep` / `--retries` | 1 / 2 | Seconds sleep / attempts per video |

### `bin/fetch-transcripts`
Reads IDs from CSV and writes caption files (`json3` preferred) plus `transcripts/manifest.tsv`. Keeps best track: `en-orig` > `es-orig` > `*-orig` > `en` > `es`.

```sh
./bin/fetch-transcripts --csv PATH --to DIR [--force] [--count N] [--cookies-from-browser chrome]
```

| Flag | Default | Meaning |
|------|---------|---------|
| `--csv` | `data/metadata.csv` | Input metadata CSV |
| `--to` | `transcripts` | Output directory |
| `--force` | off | Re-fetch existing captions |
| `--count N` | all | First N unique IDs (`-n` short) |
| `--sub-format` | `json3/srv3/vtt/best` | Subtitle format |
| `--cookies-from-browser` | none | e.g. `chrome` |
| `--sleep` / `--retries` | 1 / 3 | Seconds sleep / attempts per video |

### `bin/convert-transcripts`
Converts `transcripts/<id>.*.json3` into OKF v0.2 `.md` (`00:08: text` per event derived from `tStartMs`, deterministic, no LLM). Deterministically (re-)generates frontmatter each run from `*.json3` + CSV `title` — minimal set only: `type: transcript` (required), `title`/`resource` (raw), `tags` (`--tag` if non-empty + topical keywords), `lang` (from `*.json3` filename), `generated.by/at: process:convert-transcripts`. No `description` heuristic (removed per ml03; LLM summarization is optional post-processing). Adds `See also: [description](../descriptions/<id>_<slug>.md)` cross-link (ml02, resilient to empty title/description). Archives raw captions to `transcripts-raw.tar.gz`.

```sh
./bin/convert-transcripts --csv PATH --from DIR --format md [--wiki-tag TAG] [--count N]
```

| Flag        | Default             | Meaning                                        |
| ----------- | ------------------- | ---------------------------------------------- |
| `--csv`     | `data/metadata.csv` | Input CSV                                      |
| `--from`    | `transcripts`       | Directory containing captions and output `.md` |
| `--format`  | `both`              | `txt`, `tsv`, `md`, `both`, `all`              |
| `--wiki-tag`| *(empty)*           | Tag for frontmatter; if empty no wiki tag is added |
| `--count N` | all                 | First N videos (`-n` short)                    |

### `bin/assemble-wiki` (canonical; `bin/assemble-bundle` is a shim)
Builds `{wiki-dir}/wiki/`: copies transcripts, writes `descriptions/<id>_<slug>.md` (`type: description` — directory-name default, see note) from CSV `description`, writes `index.md`, `log.md`, `metadata/metadata.csv` + `metadata.md`, `references/`, and directory indexes. Deterministic only; `topics/` is not built here (see Optional LLM tools).

> **Note on `type`:** OKF v0.2 §4.1 requires `type` but does not register a closed taxonomy — any string is conformant, consumers MUST tolerate unknown types. Our types now default to the directory name for symmetry and provenance: `transcript` (`wiki/transcripts/<id>_<slug>.md` via `bin/convert-transcripts`), `description` (`wiki/descriptions/<id>_<slug>.md` via `bin/assemble-wiki`), `metadata`/`Bundle`/`DirectoryIndex`/`Log`/`References` for indexes. Previous `Video Transcript`/`Concept` were equally valid but asymmetric; directory-name types make the source explicit. Frontmatter fields we use in the deterministic pass (ml05): `type` (required), `title`/`resource` (raw), `tags` (`wiki-tag` + topical keywords from `TAG_RULES`), `lang`, `generated.by/at` — plus `See also` cross-links (ml02).

> **Minimal deterministic frontmatter:** In the first pass keep only what's required or raw+useful: `type`, `title`/`resource` (raw), `tags`/`lang` (raw/derived), `generated`. Heavy provenance (`usage_count`, `last_modified`, `usage_window`, `status`, extra `sources[]` details) is omitted here — add it in LLM post-processing if needed.

```sh
./bin/assemble-wiki --from DIR --wiki-name NAME --wiki-tag TAG --playlist-url URL [--manifest MANIFEST]
```

| Flag           | Default                            | Meaning                |
| -------------- | ---------------------------------- | ---------------------- |
| `--from` | `.`                       | Project directory (wiki root) |
| `--manifest`   | `manifests/planning_manifest.json` | Topic plan (optional, only for post-processing re-index) |
| `--wiki-name`| `dslab`                            | Wiki identifier      |
| `--wiki-tag` | `ds-lab`                           | Tag in generated pages |
| `--playlist-url`| manifest / empty                  | Playlist URL           |

### `bin/export-wiki`
Copies indexed wiki files from `--from` (or `--from/wiki`) to `--to`. Excludes intermediaries (`data/`, `manifests/`, `assets/`, tarballs, `planning_manifest.json`).

```sh
./bin/export-wiki --from DIR --to DIR
```

| Flag     | Meaning           |
| -------- | ----------------- |
| `--from` | Project wiki dir  |
| `--to`   | Exported wiki dir |

---
## Directory Layout

Expected output of a new build (`--to`):

```
bin/                        # Build tools (run from repo root, --help for each)
├── build-wiki              # Orchestrator: fetch → transcripts → convert → assemble
├── fetch-metadata          # Playlist → metadata/<id>.json + data/metadata.csv
├── fetch-transcripts       # data/metadata.csv → transcripts/<id>.*.json3
├── convert-transcripts     # transcripts/*.json3 → transcripts/<id>_<slug>.md
├── assemble-wiki           # → wiki/ (deterministic)  # shim: assemble-bundle
└── export-wiki             # wiki/ → clean export (no intermediaries)

{out-dir}/                  # Wiki root (what bin/* creates)  # legacy term: bundle root
├── data/metadata.csv       # Intermediary (NOT in wiki)
├── metadata/               # Intermediary (raw JSON dumps)
├── transcripts/            # Intermediary (raw captions + <id>_<slug>.md)
├── manifests/              # Intermediary (metadata.tsv, transcripts.tsv, planning_manifest.json)
├── assets/                 # Intermediary (metadata-raw.tar.gz, transcripts-raw.tar.gz)
└── wiki/                   # OKF wiki (what export-wiki copies)
    ├── index.md            # Entry point
    ├── README.md, AGENTS.md, log.md
    ├── metadata/metadata.csv + metadata.md
    ├── transcripts/<id>_<slug>.md
    ├── descriptions/<id>_<slug>.md
    ├── topics/             # Only after optional post-processing (distill→cluster→generate→re-index)
    └── references/
```

---

## Conventions

- **Join key:** `id` connects CSV ↔ `transcripts/<id>_<slug>.md` ↔ `descriptions/<id>_<slug>.md` ↔ `https://www.youtube.com/watch?v=<id>`.
- **json3 format:** `events[].tStartMs/dDurationMs` + `segs[].utf8/tOffsetMs`.
- **Bot detection:** Pass `--cookies-from-browser chrome` to fetch scripts if YouTube prompts for sign-in.

----

### Optional LLM tools (topic generation)

Default wikis are transcripts + descriptions only (deterministic). Topics are optional post-processing — ask the user if they want to do this *after* a minimal wiki is built, then re-index.

1. `bin/distill-sources`: Transcript `.md` → `sources/source_<id>_<slug>.md`.
   ```sh
   ./bin/distill-sources --csv PATH --from DIR --to sources/ --wiki-tag TAG [--count N]
   ```
2. `bin/cluster-topics`: TF-IDF clustering of `sources/` → `manifests/planning_manifest.json` (requires `scikit-learn`).
   ```sh
   ./bin/cluster-topics --from DIR --to manifests/planning_manifest.json --wiki-name NAME --playlist-url URL
   ```
3. `bin/generate-topics`: Manifest + sources → `topics/{category}/{topic}.md`.
   ```sh
   ./bin/generate-topics --manifest manifests/planning_manifest.json --from DIR --to topics/
   ```
4. Re-index wiki to surface topics: re-run `bin/assemble-wiki` (acts as re-indexer):
   ```sh
   ./bin/assemble-wiki --from ./dslab --wiki-name dslab --wiki-tag ds-lab --playlist-url "$PLAYLIST"
   # regenerates wiki/index.md, wiki/topics/index.md and per-category indexes from the manifest
   ```

Non-interactive: `bin/build-wiki` stops at the deterministic wiki and never prompts. Pass an explicit flag or run the 4 steps above when you want topics.

