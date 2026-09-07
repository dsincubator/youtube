# AGENTS.md — dsincubator transcript database

Goal: build `data/dsincubator.csv` + `transcripts/<id>.<lang>.json3` linked by `id`.

## INPUTS

1. `data/dsincubator.csv` — columns `playlist_index,title,id,view_count,like_count,comment_count,upload_date,upload_date_iso,duration,duration_string,channel,uploader,url`. `id` is the join key.
2. Watch URL `https://www.youtube.com/watch?v=<id>` derived from `id`.

## LAYOUT

```
data/dsincubator.csv            # 152 rows, 151 unique ids (g1PRMaTFYdk duplicated)
transcripts/<id>.<lang>.json3   # one auto-generated caption per video, richest timed format
transcripts/manifest.tsv        # id | status | file | lang
bin/fetch-transcripts           # fetch script
```

- `json3` = `events[].tStartMs/dDurationMs` + `segs[].utf8/tOffsetMs` (word-level timing for editing; derive readable `.txt`/`.tsv` later).
- `lang` = original spoken language (`en` most videos, `es` for 4 Spanish-titled ones).
- Never commit `raw/`, `.omo/`, `.Rhistory`, `.Rproj.user`, `*/blog_files`, `**/*.html`.

## PLAN

1. Test: `./bin/fetch-transcripts --count 3` — run on a direct connection; add `--cookies-from-browser chrome` if YouTube returns "Sign in to confirm you're not a bot".
2. Full run: `./bin/fetch-transcripts`.
3. Verify: `awk -F'\t' 'NR>1&&$2=="ok"{print $1}' transcripts/manifest.tsv | sort > /tmp/got.txt && cut -d, -f3 data/dsincubator.csv | sort -u > /tmp/expected.txt && comm -23 /tmp/expected.txt /tmp/got.txt` — empty output = complete.
4. Gaps: `missing`/`error` rows in `manifest.tsv` are the accepted record of unavailable transcripts; re-run with `--force` or cookies before accepting.
5. Post-process later: convert `json3` to readable formats — out of scope for this step.

## SCRIPT: `bin/fetch-transcripts`

```
./bin/fetch-transcripts                  # 151 videos
./bin/fetch-transcripts --count 3        # first 3 (test)
./bin/fetch-transcripts --force          # re-fetch existing
./bin/fetch-transcripts --cookies-from-browser chrome
```

Flags: `--count N`, `--force`, `--cookies-from-browser BROWSER`, `--csv PATH`, `--out-dir DIR`, `--sub-format FORMAT`, `--sleep SECONDS`, `--retries N`, `--help`.

Per video: `yt-dlp --skip-download --write-auto-subs --sub-langs "en.*,es.*" --sub-format "json3/srv3/vtt/best" -o "transcripts/<id>.%(language)s.%(ext)s" -- "https://www.youtube.com/watch?v=<id>"` — retries 3× (2 s sleep), logs to `/tmp/fetch-transcripts-<id>.log`, records `id status file lang` in `manifest.tsv`. `--` protects ids starting with `-`/`_`.

## QUALITY GATES

- [ ] Every `id` in CSV has `transcripts/<id>.<lang>.json3` (`status ok`).
- [ ] No unexplained `missing`/`error` rows.
- [ ] `manifest.tsv file` resolves to a real file; `lang` matches spoken language.
- [ ] Join integrity: each manifest `id` appears exactly once in CSV.
