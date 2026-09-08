# AGENTS.md — dsincubator transcript database

Goal: build `data/metadata.csv` + `transcripts/<id>.<lang>.json3` linked by `id`.

## INPUTS

1. `data/metadata.csv` — columns `playlist_index,title,id,view_count,like_count,comment_count,upload_date,upload_date_iso,duration,duration_string,channel,uploader,url`. `id` is the join key. Maintained by `bin/fetch-metadata` (append new videos by default, `--refresh` rewrites all rows).
2. Watch URL `https://www.youtube.com/watch?v=<id>` derived from `id`.

## LAYOUT

```
data/metadata.csv            # derived table, 151 videos (rebuild collapses the g1PRMaTFYdk duplicate)
metadata/<id>.json           # raw per-video dump (--dump-single-json incl. comments; caption/format URL listings pruned)
metadata/manifest.tsv        # id | status | reason | file (ok/private/unavailable/error)
transcripts/<id>.<lang>.json3   # one auto-generated caption per video, richest timed format
transcripts/manifest.tsv        # id | status | file | lang
bin/fetch-metadata           # raw dumps + derive CSV
bin/fetch-transcripts        # fetch captions
```

- `json3` = `events[].tStartMs/dDurationMs` + `segs[].utf8/tOffsetMs` (word-level timing for editing; derive readable `.txt`/`.tsv` later).
- `lang` = original spoken language (`en` most videos, `es` for 4 Spanish-titled ones: `EmDubkF8DpQ`, `nSJT8NGhSTs`, `hs_Pzxny7XE`, `xx5WNZgQEdY`).
- The `g1PRMaTFYdk` duplicate rows are byte-identical, so either survives the collapse.
- The 3 `private` videos have no CSV rows and are never attempted by `fetch-transcripts`; the transcript gate below applies to the 151 public IDs only.
- `--count N` / `--limit N` take the first N IDs in sorted order. Add `--cookies-from-browser chrome` whenever output contains "Sign in to confirm you're not a bot".
- Never commit `raw/`, `.omo/`, `.Rhistory`, `.Rproj.user`, `*/blog_files`, `**/*.html`.

## PLAN

0. Metadata: `./bin/fetch-metadata --limit 2` (test), then `./bin/fetch-metadata` — raw dumps to `metadata/`, CSV derived. Direct connection; `--cookies-from-browser chrome` on bot-checks.
1. Test: `./bin/fetch-transcripts --count 3` — same connection rules.
2. Full run: `./bin/fetch-transcripts`.
3. Verify: `awk -F'\t' 'NR>1&&$2=="ok"{print $1}' transcripts/manifest.tsv | sort > /tmp/got.txt && python3 -c "import csv; print('\n'.join(sorted({r['id'].strip() for r in csv.DictReader(open('data/metadata.csv'))})))" > /tmp/expected.txt && comm -23 /tmp/expected.txt /tmp/got.txt` — empty output = complete.
4. Gaps: `missing`/`error` rows in `manifest.tsv` are the accepted record of unavailable transcripts; re-run with `--force` or cookies before accepting.
5. Post-process: convert `json3` to readable formats — `bin/convert-transcripts` written and tested

## SCRIPT: `bin/convert-transcripts`

```
./bin/convert-transcripts                          # all videos
./bin/convert-transcripts --count 3                # first 3 (test)
./bin/convert-transcripts --format txt             # .txt only
./bin/convert-transcripts --format tsv             # .tsv only
./bin/convert-transcripts --format both            # both formats
```

Reads `data/metadata.csv` for the video ID list, converts each `transcripts/<id>.*.json3` to `<id>.*.txt` (plain text) and `<id>.*.tsv` (tab-separated `<tStartMs>\t<text>`). Skips videos without a json3 file.

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
- [x] `transcripts/`: full run in progress, 115/151 converted so far
- [x] `bin/convert-transcripts`: written and tested (json3 → .txt/.tsv)
- [x] Open question resolved: `sbp5Q8niTho` comment was deleted from YouTube (fetch succeeded, database stands)

## NEXT

1. Wait for `./bin/fetch-transcripts` to complete (151 transcripts)
2. Re-run the step-3 verify one-liner — empty output = complete
3. Run `python3 bin/convert-transcripts data/metadata.csv transcripts both` to generate readable .txt/.tsv from all .json3 files
4. Optional: probe other open questions

## QUALITY GATES

- [ ] Every `id` in CSV (151 public videos; private ones have no rows) has `transcripts/<id>.<lang>.json3` (`status ok`).
- [ ] No unexplained `missing`/`error` rows.
- [ ] `manifest.tsv file` resolves to a real file; `lang` matches spoken language.
- [ ] Join integrity: each manifest `id` appears exactly once in CSV.
