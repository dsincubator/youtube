

# dsincubator

Transcript database for the [ds-incubator YouTube
playlist](https://youtube.com/playlist?list=PLvgdJdJDL-APbB315sB3Lv_2VP2g0ioFO&si=LOZAcXpa1L7JlVvc):
`data/metadata.csv` + `transcripts/<id>_<title>.md` (OKF format), linked
by `id`.

## Structure

    data/metadata.csv            # derived table, 151 videos
    transcripts/<id>_<title>.md  # OKF transcript (YAML frontmatter + body)
    transcripts/manifest.tsv     # id | status | file | lang
    bin/fetch-metadata           # raw dumps + derive CSV
    bin/fetch-transcripts        # fetch captions
    bin/convert-transcripts      # json3 -> txt/tsv/md

## Overview

``` r
dsi <- readr::read_csv("data/metadata.csv", show_col_types = FALSE)
dsi |> glimpse()
#> Rows: 151
#> Columns: 13
#> $ playlist_index  <dbl> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16,…
#> $ title           <chr> "How to download a file from google drive into your R …
#> $ id              <chr> "iNWBG3x4QVc", "bR0RYYwiDRM", "AFuVF0oWFMY", "PRKOMCCO…
#> $ view_count      <dbl> 251, 615, 126, 688, 549, 357, 40, 32, 76, 17, 43, 64, …
#> $ like_count      <dbl> 2, 5, 1, 12, 2, 2, NA, 1, 1, NA, 3, NA, 15, 10, 1, 3, …
#> $ comment_count   <dbl> 0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, …
#> $ upload_date     <dbl> 20240719, 20240719, 20240716, 20240705, 20240705, 2024…
#> $ upload_date_iso <date> 2024-07-19, 2024-07-19, 2024-07-16, 2024-07-05, 2024-…
#> $ duration        <dbl> 258, 142, 1415, 1028, 163, 75, 406, 263, 183, 234, 118…
#> $ duration_string <time> 04:18:00, 02:22:00, 23:35:00, 17:08:00, 02:43:00, 01:…
#> $ channel         <chr> "Mauro Lepore", "Mauro Lepore", "Mauro Lepore", "Mauro…
#> $ uploader        <chr> "Mauro Lepore", "Mauro Lepore", "Mauro Lepore", "Mauro…
#> $ url             <chr> "https://www.youtube.com/watch?v=iNWBG3x4QVc", "https:…
```

``` r
dsi |> select(upload_date_iso, title, url)
#> # A tibble: 151 × 3
#>    upload_date_iso title                                                   url  
#>    <date>          <chr>                                                   <chr>
#>  1 2024-07-19      How to download a file from google drive into your R I… http…
#>  2 2024-07-19      The  simplest way to run multiple R sessions in the sa… http…
#>  3 2024-07-16      Creating an empty R package up to the best standards    http…
#>  4 2024-07-05      Continuously build and deploy a shiny app on Google Cl… http…
#>  5 2024-07-05      `gh pr` allows you to work with GitHub pull requests f… http…
#>  6 2024-07-03      gh  repo create and gh browse to create and browse a G… http…
#>  7 2024-06-24      dbt structure                                           http…
#>  8 2024-06-23      dbt usage                                               http…
#>  9 2024-06-22      dbt installation                                        http…
#> 10 2024-06-21      dbt overview                                            http…
#> # ℹ 141 more rows
```

Lists `.md` transcripts from the filesystem, extracts the video `id`,
and left-joins with `data/metadata.csv`.

``` r
transcript_files <- dir_ls("transcripts", regexp = "\\.md$") |>
  tibble(path = _) |>
  mutate(filename = path_file(path))

transcript_ids <- transcript_files |>
  mutate(id = purrr::map_chr(filename, ~ dsi$id[startsWith(.x, paste0(dsi$id, "_"))][1])) |>
  select(id, transcript_path = path)

joined <- dsi |>
  left_join(transcript_ids, by = "id")

joined |>
  select(id, title, transcript_path)
#> # A tibble: 151 × 3
#>    id          title                                             transcript_path
#>    <chr>       <chr>                                             <fs::path>     
#>  1 iNWBG3x4QVc How to download a file from google drive into yo… …-your-r-ide.md
#>  2 bR0RYYwiDRM The  simplest way to run multiple R sessions in … …he-same-ide.md
#>  3 AFuVF0oWFMY Creating an empty R package up to the best stand… …t-standards.md
#>  4 PRKOMCCOlI0 Continuously build and deploy a shiny app on Goo… …e-cloud-run.md
#>  5 EaJqUQkDo48 `gh pr` allows you to work with GitHub pull requ… …ur-terminal.md
#>  6 q-hsaxVA1kc gh  repo create and gh browse to create and brow… …he-terminal.md
#>  7 gGXwszGqZxM dbt structure                                     …t-structure.md
#>  8 nL3Qr7bvlg4 dbt usage                                         …4_dbt-usage.md
#>  9 QxgEn2fwIOk dbt installation                                  …nstallation.md
#> 10 WmzqpTZtFAw dbt overview                                      …bt-overview.md
#> # ℹ 141 more rows
```

## Example transcript

``` r
fs::dir_ls("transcripts/", regexp = "[.]md")[[5]] |> readLines(n = 30) |> writeLines()
#> ---
#> type: Video Transcript
#> title: "2020 09 08 code reviews -- in practice"
#> description: "today the data science incubator is a  continuation  of what we started last week so the  focus is discussing  code reviews and last week we talked  about  most"
#> resource: "https://www.youtube.com/watch?v=-ho1CfoMHKQ"
#> tags: ["youtube", "ds-incubator"]
#> generated:
#>   by: "bin/convert-transcripts"
#>   at: "2026-09-08T02:25:20Z"
#> status: stable
#> sources:
#>   - id: youtube-original
#>     resource: "https://www.youtube.com/watch?v=-ho1CfoMHKQ"
#>     title: "YouTube auto-generated caption (json3)"
#>     author: "process:yt-dlp"
#> ---
#> 
#> # Transcript
#> 
#> today the data science incubator is a
#> 
#> continuation
#> 
#> of what we started last week so the
#> 
#> focus is discussing
#> 
#> code reviews and last week we talked
#> 
#> about
```

## Fetch / Refresh Commands

``` sh
# Transcripts
./bin/fetch-transcripts --count 3   # test
./bin/fetch-transcripts               # full

# Metadata
./bin/fetch-metadata --limit 2      # test
./bin/fetch-metadata              # append new
./bin/fetch-metadata --refresh    # rewrite all

# Convert to readable formats (txt, tsv, md)
./bin/convert-transcripts --format md --count 3
./bin/convert-transcripts --format md
```
