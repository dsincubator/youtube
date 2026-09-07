# dsincubator

Transcript database for the [ds-incubator YouTube playlist](https://youtube.com/playlist?list=PLvgdJdJDL-APbB315sB3Lv_2VP2g0ioFO&si=LOZAcXpa1L7JlVvc): `data/metadata.csv` (video metadata) + `transcripts/<id>.<lang>.json3` (auto-generated captions, one per video), linked by `id`.

## Fetch transcripts

```sh
# Dry run: list available caption tracks (writes nothing)
yt-dlp --skip-download --list-subs -- "https://www.youtube.com/watch?v=<id>"

# Test on 3 videos, then the full run (151 videos)
./bin/fetch-transcripts --count 3
./bin/fetch-transcripts
```

Video IDs come from `data/metadata.csv` (override with `--csv`). New playlist videos are picked up via `bin/fetch-metadata`, then re-running the script — existing transcripts are skipped.

## Refresh metadata

```sh
./bin/fetch-metadata           # append new playlist videos to data/metadata.csv
./bin/fetch-metadata --refresh # rewrite all rows with fresh counts
```
