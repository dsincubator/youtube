# AGENTS.md — dsincubator transcript database pipeline

A metadata CSV + transcript database pipeline. The repo produces `data/dsincubator.csv`
(the authoritative catalog) and `transcripts/<id>.<lang>.json3` (raw YouTube auto-generated
captions) linked by the `id` join key.

## INPUTS

1. **`data/dsincubator.csv`** — authoritative catalog with columns
   `playlist_index,title,id,view_count,like_count,comment_count,upload_date,upload_date_iso,duration,duration_string,channel,uploader,url`.
   The `id` column is the join key for all transcripts.
2. **YouTube video ID** — derivable from the CSV `id` column. Watch URL: `https://www.youtube.com/watch?v=<id>`.

## DATA LAYOUT

```
transcripts/<id>.<lang>.json3   # raw YouTube auto-generated caption (json3 = richest timed format)
transcripts/manifest.tsv        # id | status | file | lang — join back to data/dsincubator.csv
data/dsincubator.csv            # metadata catalog (join key: id)
```

- `id` is the join key: `transcripts/<id>.<lang>.json3` ↔ `data/dsincubator.csv` row with matching `id`.
- `.lang.` is the detected original spoken language code (`en` for most videos, `es` for Spanish-titled ones).
- `json3` is YouTube's richest timed-text format: `events[]` with `tStartMs`/`dDurationMs` and per-word `segs[].utf8` + `tOffsetMs`. Use this for video editing; convert to readable `.txt`/`.tsv` later as needed.
- Never commit `raw/`, `.omo/`, `.Rhistory`, `.Rproj.user`, `*/blog_files`, `**/*.html`.

## MANIFEST FORMAT

`transcripts/manifest.tsv` has columns: `id`, `status`, `file`, `lang`.

- `status` is `ok`, `missing`, or `error`.
- Every `id` from `data/dsincubator.csv` (deduped) appears in the manifest — missing/error rows expose gaps via `csv LEFT JOIN manifest USING (id)`.
- `file` is the relative path when `status` is `ok`; empty otherwise.
- `lang` is the detected language code when `status` is `ok`; empty otherwise.

## THE SCRIPT: `bin/fetch-transcripts`

Reads deduped `id`s from `data/dsincubator.csv`, fetches one auto-generated caption track per video, writes `transcripts/manifest.tsv`.

Usage:
```sh
./bin/fetch-transcripts                  # full run (151 videos)
./bin/fetch-transcripts --count 3        # test run, first 3 IDs
./bin/fetch-transcripts --force          # re-fetch existing files
./bin/fetch-transcripts --cookies-from-browser chrome  # if YouTube bot-checks you
./bin/fetch-transcripts --sleep 5 --retries 5            # slower, more retries
```

Flags: `--count`, `--force`, `--cookies-from-browser BROWSER`, `--csv PATH`, `--out-dir DIR`, `--sub-format FORMAT`, `--sleep SECONDS`, `--retries N`, `--help`.

What it does per video:
1. Runs `yt-dlp --skip-download --write-auto-subs --sub-langs "en.*,es.*" --sub-format "json3/srv3/vtt/best" -o "transcripts/<id>.%(language)s.%(ext)s" -- "https://www.youtube.com/watch?v=<id>"`.
2. Retries on failure (3 by default, 2s between).
3. Logs full output to `/tmp/fetch-transcripts-<id>.log`.
4. Records result in `manifest.tsv`.

`--` before the URL protects IDs starting with `-` or `_`.

## VERIFICATION

After a fetch run, confirm completeness:
```sh
# Every id in the CSV has a transcript file
awk -F'\t' 'NR>1 && $2=="ok" {print $1}' transcripts/manifest.tsv | sort > /tmp/got.txt
cut -d, -f3 data/dsincubator.csv | sort -u > /tmp/expected.txt
comm -23 /tmp/expected.txt /tmp/got.txt   # IDs with no transcript
```

## TOKEN-SAVING RULES

1. **Never paste full transcripts into context.** Read `transcripts/<id>.json3` in slices.
2. **Batch independent reads.** Read multiple files in one turn when possible.
3. **Stop searching after 2 fruitless iterations.** If a fact can't be found in two tries, note the gap and move on.
4. **Full output to files.** Scripts print short `[prefix]` summary lines to stdout; verbose output goes to `/tmp`.

## QUALITY GATES

Before the database is considered complete:

- [ ] **Every id in CSV has a `transcripts/<id>.<lang>.json3`** (manifest status `ok`).
- [ ] **No missing/error rows in manifest** (or gaps are logged and accepted explicitly).
- [ ] **File extensions match actual downloaded format** (manifest `file` column must resolve to a real file).
- [ ] **Language codes in manifest match the video's original spoken language.**
- [ ] **Join integrity**: every `id` in `manifest.tsv` appears exactly once in `data/dsincubator.csv`.
