

# dsincubator

Transcript database for the [ds-incubator YouTube
playlist](https://youtube.com/playlist?list=PLvgdJdJDL-APbB315sB3Lv_2VP2g0ioFO&si=LOZAcXpa1L7JlVvc):
`data/metadata.csv` + `transcripts/<id>_<title>.md` (OKF v0.2 format),
linked by `id` — then transformed into an OKF v0.2 LLM wiki bundle
**[`dsincubator_wiki/`](dsincubator_wiki/index.md)** per
`planning_manifest.json`.

## Structure

    data/metadata.csv            # derived table, 151 videos
    metadata/<id>.json           # raw per-video dump (yt-dlp)
    transcripts/<id>_<title>.md  # OKF v0.2 transcript (YAML frontmatter + body)
    transcripts/manifest.tsv     # id | status | file | lang
    planning_manifest.json       # wiki plan: 59 topic pages across 13 categories
    dsincubator_wiki/            # OKF v0.2 wiki bundle → see Wiki below
    dsincubator_wiki/sources/    # 151 distilled sources (one per transcript)
    dsincubator_wiki/topics/     # 59 topic pages (each an OKF concept with type)
    dsincubator_wiki/index.md    # bundle root (okf_version 0.2 §12)
    dsincubator_wiki/log.md      # bundle history (§9)
    bin/fetch-metadata           # raw dumps + derive CSV
    bin/fetch-transcripts        # fetch captions (json3)
    bin/convert-transcripts      # json3 -> txt/tsv/md (OKF v0.2)

## 1. Fetch

Raw-first pipeline: `yt-dlp` dumps to `metadata/` and `transcripts/`,
then CSV derived.

``` sh
# Metadata: test then full (append new by default)
./bin/fetch-metadata --limit 2        # smoke test (first 2 playlist entries)
./bin/fetch-metadata                  # fetch missing dumps, derive data/metadata.csv
./bin/fetch-metadata --refresh        # re-fetch all dumps, drop removed rows

# Transcripts: test then full
./bin/fetch-transcripts --count 3     # test
./bin/fetch-transcripts               # 151 videos (one *-orig json3 per video)
# add --cookies-from-browser chrome whenever output contains "Sign in to confirm you're not a bot"
# --force re-fetches existing
```

## 2. Example: What was fetched

### Metadata + transcripts (joined by `id`)

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

### Example transcript (5th file, first 30 lines)

``` r
fs::dir_ls("transcripts/", regexp = "[.]md")[[5]] |> readLines(n = 30) |> writeLines()
#> ---
#> type: Video Transcript
#> title: "2020 09 08 code reviews -- in practice"
#> description: "Code that person submitting the code to you know getting to a standard where at least the code runs even if if running the code means producing an..."
#> resource: "https://www.youtube.com/watch?v=-ho1CfoMHKQ"
#> tags: ["ds-incubator", "github", "pull-requests", "r-packages", "code-reviews"]
#> lang: en
#> generated:
#>   by: "process:convert-transcripts"
#>   at: "2026-09-08T04:02:00Z"
#> status: stable
#> sources:
#>   - id: youtube-original
#>     resource: "https://www.youtube.com/watch?v=-ho1CfoMHKQ"
#>     title: "YouTube auto-generated caption (json3)"
#>     author: "process:yt-dlp"
#>     last_modified: "2020-09-08T00:00:00Z"
#>     usage_count: 18
#> usage_window: { from: "2020-09-08T00:00:00Z", to: "2026-09-08T04:02:00Z" }
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
```

## 3. Process

Convert captions to readable OKF v0.2 and distill into the wiki bundle.

``` sh
# Convert json3 → readable formats (txt + tsv + md)
./bin/convert-transcripts --format md --count 3   # test
./bin/convert-transcripts --format md              # all 151 → transcripts/<id>_<slug>.md (OKF v0.2)
./bin/convert-transcripts --format all             # txt + tsv + md

# Wiki build (done 2026-09-08: 151 sources → 59 topics → bundle)
# 1. sources/ : distill each transcript → dsincubator_wiki/sources/source_<id>_<slug>.md
#    per Extraction Prompt v2 (frozen frontmatter, quote-to-name, anchored key_topics)
# 2. aggregation : read all sources → populate planning_manifest.json source_files[]
# 3. topics/  : 59 pages with cross-links (§6), Attested Computation for pipelines (§10)
# 4. bundle assembly : index.md (§8), topics/index.md (§8), sources/index.md (§8), log.md (§9), references/ (§6.3)
```

## 4. Example: What was processed — the wiki

👉 **Start here:
[`dsincubator_wiki/index.md`](dsincubator_wiki/index.md)** — bundle root
(OKF v0.2, 151 sources → 59 topics). Directory indexes:
[`dsincubator_wiki/topics/index.md`](dsincubator_wiki/topics/index.md)
(§8) with entry point
[`dsincubator_wiki/topics/concepts-overview.md`](dsincubator_wiki/topics/concepts-overview.md),
and
[`dsincubator_wiki/sources/index.md`](dsincubator_wiki/sources/index.md).
History: [`dsincubator_wiki/log.md`](dsincubator_wiki/log.md) (§9).
External attesters:
[`dsincubator_wiki/references/`](dsincubator_wiki/references/).

Status 2026-09-08: **151/151 sources** and **59/59 topics** complete
(type §4.1, sources credibility §5.1, actor `agent:okf-wiki-builder/1.0`
§7, cross-links §6, `Attested Computation` for `targets`/`drake` §10);
`planning_manifest.json` `source_files[]` populated; bundle indexes and
`log.md` present; `status: draft` until human `verified` (§5.2).

``` r
manifest <- jsonlite::read_json("planning_manifest.json")

tibble(
  bundle = manifest$bundle_name,
  okf_version = manifest$okf_version,
  transcripts = manifest$total_transcripts_processed,
  topics = length(manifest$topics)
)
#> # A tibble: 1 × 4
#>   bundle           okf_version transcripts topics
#>   <chr>            <chr>             <int>  <int>
#> 1 dsincubator_wiki 0.2                 151     59
```

``` r
topic_paths <- purrr::map_chr(manifest$topics, "topic_filename")

tibble(path = topic_paths) |>
  mutate(category = stringr::str_extract(path, "(?<=topics/)[^/]+")) |>
  filter(path != "topics/concepts-overview.md") |>
  count(category, name = "topics") |>
  arrange(dplyr::desc(topics))
#> # A tibble: 12 × 2
#>    category      topics
#>    <chr>          <int>
#>  1 data              11
#>  2 tidyverse          8
#>  3 git                6
#>  4 r-packages         5
#>  5 shiny              5
#>  6 cloud              4
#>  7 pipelines          4
#>  8 testing            4
#>  9 communication      3
#> 10 docker             3
#> 11 workflow           3
#> 12 terminal           2
```

### Distilled sources (live)

``` r
wiki_sources <- dir_ls("dsincubator_wiki/sources", regexp = "source_.*\\.md$") |>
  tibble(source_path = _)

tibble(
  sources_done = nrow(wiki_sources),
  sources_pending = manifest$total_transcripts_processed - nrow(wiki_sources)
)
#> # A tibble: 1 × 2
#>   sources_done sources_pending
#>          <int>           <int>
#> 1          151               0
```

``` r
wiki_sources |> head(10) |> select(source_path)
#> # A tibble: 10 × 1
#>    source_path                                                                  
#>    <fs::path>                                                                   
#>  1 dsincubator_wiki/sources/source_-9QCNwmpTOE_test-driven-development.md       
#>  2 …i/sources/source_-HTH2ylnT7Q_ds-databricks4r-databricks-for-rstudio-users.md
#>  3 …ator_wiki/sources/source_-HtB6duQnD8_the-pins-package-demo-and-discussion.md
#>  4 …ources/source_-L2A_7XvD6Y_working-with-git-and-github-from-rstudio-part-2.md
#>  5 …bator_wiki/sources/source_-ho1CfoMHKQ_2020-09-08-code-reviews-in-practice.md
#>  6 …ce_0-zQ69P6VsY_tidy-eda-the-data-science-workflow-and-toolkit-an-overview.md
#>  7 dsincubator_wiki/sources/source_00i28kdk8cM_ds-tmux.md                       
#>  8 …i/sources/source_0qUs4hi7ozo_retrospective-about-meetups-in-2020-response.md
#>  9 dsincubator_wiki/sources/source_16Xn0ueeP-E_azure-rstudio-server-and-pins.md 
#> 10 …ces/source_1lpcCHfozh0_conversaciones-productivas-sobre-codigo-argumentos.md
```

### Example distilled source (first pilot, first 40 lines)

``` r
fs::dir_ls("dsincubator_wiki/sources", regexp = "source_.*\\.md$")[[1]] |> readLines(n = 40) |> writeLines()
#> ---
#> type: source
#> title: "Test driven development"
#> source_file: "-9QCNwmpTOE_test-driven-development.md"
#> video_id: "-9QCNwmpTOE"
#> url: "https://www.youtube.com/watch?v=-9QCNwmpTOE"
#> lang: en
#> tags: ["ds-incubator", "r-packages", "refactoring", "tdd", "testing"]
#> key_topics: ["test-driven-development", "testthat", "refactoring"]
#> generated:
#>   by: "agent:okf-wiki-builder/1.0"
#>   at: "2026-09-08T04:00:00Z"
#> status: draft
#> sources:
#>   - id: youtube-original
#>     resource: "https://www.youtube.com/watch?v=-9QCNwmpTOE"
#>     title: "YouTube auto-generated caption (json3)"
#>     author: "process:yt-dlp"
#>     usage_count: 17
#>     last_modified: "2020-12-29T00:00:00Z"
#> usage_window: { from: "2020-12-29T00:00:00Z", to: "2026-09-08T04:00:00Z" }
#> ---
#> 
#> # Test driven development
#> 
#> ## Summary
#> 
#> The session presents test-driven development through the framing in the testing chapter of Mastering Shiny: there are three occasions for writing tests. The first is after discovering a bug, where you write a test that exposes the bug, fix the code, and leave the test as a canary against regression. The second, most familiar occasion is writing tests after the code, which suits exploratory work where the expected behavior only becomes clear through experimentation. The third is test-driven development proper: when the expected behavior is known, write the test before the production code.
#> 
#> The speaker demonstrates this with a minimal R package example using usethis and testthat. He creates a package, adds an R file for a planned `greet` function with `use_r`, and generates the matching test file with `use_test`, which also sets up the testthat infrastructure. The first TDD cycle starts with a failing test asserting that `greet` with no input returns hello world, then implements only the minimum code needed to make that test pass, running tests with Ctrl+Shift+T and committing before continuing.
#> 
#> Two further cycles extend the function: greeting a caller by name with a default argument of world, and then requiring character input by adding an input check first specified with an `expect_error` test. Each cycle follows write failing test, write minimal passing code, and refactor without accumulating technical debt. The session closes with group discussion on negative tests, tests as a contract with other programmers that discourages breaking changes, and test coverage via the covr package, noting that full coverage does not guarantee correctness and can give false confidence.
#> 
#> ## Key Concepts & Tools Taught
#> 
#> - **[Test-driven development (TDD)]:** Writing the test before production code when expected behavior is known, then implementing only enough code to pass.
#> - **[Bug-canary / regression test]:** Writing a test that exposes a discovered bug first, fixing the bug, and keeping the test so future regressions are caught immediately.
#> - **[Writing tests after code]:** Writing tests once exploratory coding has clarified what a function should do.
#> - **[testthat]:** R testing framework used for expectations such as equality checks and expected errors, run per-file or whole-package with Ctrl+Shift+T.
#> - **[usethis package workflow]:** Using helpers to create a package, add an R file with `use_r`, and scaffold the matching test file with `use_test` plus the testthat infrastructure.
```

### Example topic (first 40 lines)

``` r
fs::dir_ls("dsincubator_wiki/topics", regexp = "\\.md$", recurse = TRUE)[[2]] |> readLines(n = 40) |> writeLines()
#> ---
#> type: Playbook
#> title: Cloud Computing Fundamentals
#> description: Introduction to cloud computing, Google Cloud Platform, Azure, and remote
#>   computing concepts
#> lang: en
#> tags:
#> - ds-incubator
#> generated:
#>   by: agent:okf-wiki-builder/1.0
#>   at: '2026-09-08T04:00:00Z'
#> status: draft
#> sources:
#> - id: 16Xn0ueeP-E
#>   resource: https://www.youtube.com/watch?v=16Xn0ueeP-E
#>   title: Azure, RStudio server, and pins
#>   author: process:yt-dlp
#>   usage_count: 559
#>   last_modified: '2020-05-19T00:00:00Z'
#> - id: 2WBj5Oex_Fc
#>   resource: https://www.youtube.com/watch?v=2WBj5Oex_Fc
#>   title: An overview our our resources at 2dii
#>   author: process:yt-dlp
#>   usage_count: 8
#>   last_modified: '2020-01-28T00:00:00Z'
#> - id: AUIJif93OJA
#>   resource: https://www.youtube.com/watch?v=AUIJif93OJA
#>   title: A systematic debugging workflow
#>   author: process:yt-dlp
#>   usage_count: 64
#>   last_modified: '2024-06-04T00:00:00Z'
#> - id: A_Q6nmUhcGA
#>   resource: https://www.youtube.com/watch?v=A_Q6nmUhcGA
#>   title: Reusing your usethis setup across multiple rstudio.cloud projects
#>   author: process:yt-dlp
#>   usage_count: 31
#>   last_modified: '2020-08-11T00:00:00Z'
#> - id: BYtt2cXW4qg
#>   resource: https://www.youtube.com/watch?v=BYtt2cXW4qg
#>   title: 'ds.terminal: Use case - customize and reuse your home'
```
