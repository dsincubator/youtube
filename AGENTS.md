# AGENTS.md — dsincubator transcript database

Goal: build `data/metadata.csv` + `transcripts/<id>_<title>.md` (OKF v0.2 format) linked by `id`.

When repo state changes (new videos, updated transcripts, schema changes), update `README.qmd` and re-render with `quarto render README.qmd --to gfm --quiet`.

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
bin/fetch-metadata           # raw dumps + derive CSV
bin/fetch-transcripts        # fetch captions
bin/convert-transcripts      # json3 -> txt/tsv/md
README.qmd                   # Quarto source with live R chunks → rendered to README.md
README.md                    # Rendered output (git-flavored markdown)
```

- `json3` = `events[].tStartMs/dDurationMs` + `segs[].utf8/tOffsetMs` (word-level timing for editing).
- `.md` transcripts follow OKF v0.2: YAML frontmatter (`type`, `title`, `description`, `resource`, `tags`, `generated`, `status`, `sources`) + `# Transcript` body.
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

Titles are ASCII-slugified (`unidecode` → replace non-alphanumerics with `-`, lowercase). The `.md` format includes OKF v0.2 frontmatter (`type`, `title`, `description`, `resource`, `tags`, `generated`, `status`, `sources`). Skips videos without a json3 file.

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
- [x] `README.qmd`: created with live R chunks (Structure, Overview inc. `fs::dir_ls()` → `tibble()` → `purrr::map_chr()` → `left_join()`, Example transcript via `fs::dir_ls()[[5]]`); libs at top, `knitr::opts_chunk$set()` header, no `head()`/`Join Summary`.
- [x] `README.md`: rendered from `README.qmd` via `quarto render README.qmd --to gfm --quiet`.
- [x] Open question resolved: `sbp5Q8niTho` comment was deleted from YouTube (fetch succeeded, database stands).
- [x] `fetch-transcripts` prune fix: `pick_transcript`/`--force` now touch subtitle extensions only (earlier `*.*` glob deleted converted `.txt`/`.tsv` on re-runs).
- [x] Title sanitization: ASCII-only, lowercase, hyphen-separated words.

## NEXT

1. When repo state changes (new videos, updated transcripts, schema changes), update `README.qmd` and re-render with `quarto render README.qmd --to gfm --quiet`.
2. Re-run `./bin/convert-transcripts --format md` if new transcripts are fetched.
3. Optional: probe other open questions.

## QUALITY GATES

- [x] Every `id` in CSV (151 public videos; private ones have no rows) has `transcripts/<id>.<lang>.json3` (`status ok`).
- [x] No unexplained `missing`/`error` rows.
- [x] `manifest.tsv file` resolves to a real file; `lang` matches spoken language.
- [x] Join integrity: each manifest `id` appears exactly once in CSV.
