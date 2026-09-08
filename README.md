

# dsincubator

Transcript database for the [ds-incubator YouTube
playlist](https://youtube.com/playlist?list=PLvgdJdJDL-APbB315sB3Lv_2VP2g0ioFO&si=LOZAcXpa1L7JlVvc):
`data/metadata.csv` + `transcripts/<id>_<title>.md` (OKF v0.2 format),
linked by `id` — then transformed into an OKF v0.2 LLM wiki bundle
**[`dsincubator/`](dsincubator/index.md)** per `planning_manifest.json`.

## Structure

    data/metadata.csv            # derived table, 151 videos
    metadata/<id>.json           # raw per-video dump (yt-dlp)
    transcripts/<id>_<title>.md  # OKF v0.2 transcript (YAML frontmatter + body)
    transcripts/manifest.tsv     # id | status | file | lang
    planning_manifest.json       # wiki plan: 59 topic pages across 13 categories
    dsincubator/            # OKF v0.2 wiki bundle → see Wiki below
    dsincubator/sources/    # 151 distilled sources (one per transcript)
    dsincubator/topics/     # 59 topic pages (each an OKF concept with type)
    dsincubator/index.md    # bundle root (okf_version 0.2 §12)
    dsincubator/log.md      # bundle history (§9)
    bin/fetch-metadata           # raw dumps + derive CSV
    bin/fetch-transcripts        # fetch captions (json3)
    bin/convert-transcripts      # json3 -> txt/tsv/md (OKF v0.2)
    bin/distill-sources          # transcript .md + CSV → sources/source_<id>_<slug>.md
    bin/cluster-topics           # auto-cluster sources → planning_manifest.json
    bin/generate-topics          # manifest + sources → topics/{category}/{topic}.md
    bin/assemble-bundle          # generate index.md, indexes, log.md, references/
    bin/build-wiki               # orchestrator: runs full pipeline
    requirements.txt             # Python deps for clustering (numpy, scipy, sklearn, hdbscan)

## Fetch

### Quick start (any playlist)

``` sh
# Build a wiki for any public playlist in one command
./bin/build-wiki --playlist "https://youtube.com/playlist?list=..." --name dslab --tag ds-lab --out-dir ./dslab --count 3
```

### Individual steps

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

# Convert json3 → readable formats
./bin/convert-transcripts --format md --count 3   # test
./bin/convert-transcripts --format md              # all 151 → transcripts/<id>_<slug>.md (OKF v0.2)
./bin/convert-transcripts --format all             # txt + tsv + md

# Distill sources (extract key_topics + restructure body)
./bin/distill-sources --csv data/metadata.csv --transcripts-dir transcripts --out-dir dsincubator/sources --tag ds-incubator

# Auto-cluster sources into topics
./bin/cluster-topics --sources-dir dsincubator/sources --out-file planning_manifest.json --bundle-name dsincubator

# Generate topic pages
./bin/generate-topics --manifest planning_manifest.json --sources-dir dsincubator/sources --out-dir dsincubator/topics

# Assemble bundle (index.md, indexes, log.md, references/)
./bin/assemble-bundle --bundle-dir dsincubator --manifest planning_manifest.json --bundle-name dsincubator --bundle-tag ds-incubator
```

> **Note on `sources/` summaries:** `bin/distill-sources` as shipped is
> **deterministic and offline** — it scaffolds frontmatter from
> `data/metadata.csv` + `transcripts/*.md` and fills `key_topics` via
> word-frequency. The 151 `dsincubator/sources/` distilled via LLM
> (Extraction Prompt v2 at `AGENTS.md:178`) are not reproduced by
> `build-wiki`; the generalized bundles (`dslab`, `dshangout`) currently
> contain placeholder summaries. Replace the placeholder with an LLM
> pass (`--llm` flag) to get Summary + Key Concepts + Code Snippets per
> Extraction Prompt v2.

Run directly via `bin/build-wiki` (no task runner):

``` sh
./bin/build-wiki --playlist "https://www.youtube.com/playlist?list=PL..." --name dslab --tag ds-lab --out-dir ./dslab --count 3
```

### Example metadata

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

### Example transcript

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

## Wiki

👉 **Start here: [`dsincubator/index.md`](dsincubator/index.md)** —
bundle root (OKF v0.2, 151 sources → 59 topics). Indexes:
[`dsincubator/topics/index.md`](dsincubator/topics/index.md) (§8) with
entry
[`dsincubator/topics/concepts-overview.md`](dsincubator/topics/concepts-overview.md),
[`dsincubator/sources/index.md`](dsincubator/sources/index.md). History:
[`dsincubator/log.md`](dsincubator/log.md) (§9). References:
[`dsincubator/references/`](dsincubator/references/).

Build pipeline: 1. `./bin/build-wiki` — one-command orchestrator (fetch
→ transcripts → convert → distill → cluster → topics → bundle) 2. Or
step-by-step: `bin/distill-sources` → `bin/cluster-topics` →
`bin/generate-topics` → `bin/assemble-bundle`

### Generalized bundle — `dslab` example

Any public playlist can produce a bundle. Tested with **dslab**
(`PL9HYL-VRX0oSeWeMEGQt0id7adYQXebhT`, 27 videos) →
[`dslab/index.md`](dslab/index.md) (§12) +
[`dslab/README.md`](dslab/README.md).

``` sh
./bin/build-wiki --playlist "https://www.youtube.com/playlist?list=PL9HYL-VRX0oSeWeMEGQt0id7adYQXebhT" --name dslab --tag ds-lab --out-dir ./dslab --count 3  # quick test
./bin/build-wiki --playlist "https://www.youtube.com/playlist?list=PL9HYL-VRX0oSeWeMEGQt0id7adYQXebhT" --name dslab --tag ds-lab --out-dir ./dslab          # full (27)
```

Outputs: `dslab/metadata.csv`, `dslab/transcripts/<id>_<slug>.md` (body
`00:08: text` per `tStartMs`, deterministic — no LLM; `lang` prefers
`en-orig`/`es-orig`), `dslab/sources/`, `dslab/topics/`,
`dslab/index.md` (§12), `dslab/log.md` (§9).

Full pipeline: 151 `sources/` distilled per Extraction Prompt v2 (frozen
frontmatter, quote-to-name, anchored `key_topics`) →
`bin/cluster-topics` uses TF-IDF + HDBSCAN auto-clustering with
silhouette evaluation → aggregation populates `planning_manifest.json`
`source_files[]` → 59 `topics/` with cross-links (§6) and
`Attested Computation` for pipelines (§10) → bundle assembly (`index.md`
§8, `topics/index.md` §8, `sources/index.md` §8, `log.md` §9,
`references/` §6.3). Status 2026-09-08: `status: draft` until human
`verified` (§5.2).

### Example topics

``` r
manifest <- jsonlite::read_json("planning_manifest.json")
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

### Example source

``` r
fs::dir_ls("dsincubator/sources", regexp = "source_.*\\.md$")[[1]] |> readLines(n = 40) |> writeLines()
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

### Example topic

``` r
fs::dir_ls("dsincubator/topics", regexp = "\\.md$", recurse = TRUE)[[2]] |> readLines(n = 40) |> writeLines()
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

### Search the wiki with qmd (complements LLM)

[`qmd`](https://github.com/tobi/qmd) complements brute-force LLM
(`cat`/`rg`) — local hybrid search (BM25 + vector + LLM rerank) without
loading the bundle. Install: `npm install -g @tobilu/qmd` or
`bun install -g @tobilu/qmd` / `npx @tobilu/qmd` —
<https://github.com/tobi/qmd>. Collection `dsincubator` is indexed;
after changes: `qmd update && qmd embed -c dsincubator`.

``` bash
qmd search "docker" -c dsincubator -n 2 | head -n 20
#> qmd://dsincubator/sources/source_RO-OdWXfpBc_docker-managing-containers.md:3 #66fb87
#> Title: Docker: managing containers
#> Context: OKF v0.2 LLM wiki bundle distilled from 151 ds-incubator YouTube transcripts into 59 topic pages across 13 categories (cloud, communication, data, docker, git, pipelines, r-packages, shiny, testing, tidyverse) + 151 sources. Covers R workflows: targets pipelines, testthat/TDD, git/GitHub, Docker, tidy EDA, reprex. Each source carries YouTube provenance (author process:yt-dlp, usage_count, last_modified); topics cross-link per §6. Entry: topics/concepts-overview.md; indexes: topics/index.md, sources/index.md.
#> Score:  73%
#> 
#> @@ -2,4 @@ (1 before, 79 after)
#> type: source
#> title: "Docker: managing containers"
#> source_file: "RO-OdWXfpBc_docker-managing-containers.md"
#> video_id: "RO-OdWXfpBc"
#> 
#> 
#> qmd://dsincubator/sources/source_3_0gUMqKikw_docker-managing-images.md:3 #163c4e
#> Title: Docker: Managing images
#> Context: OKF v0.2 LLM wiki bundle distilled from 151 ds-incubator YouTube transcripts into 59 topic pages across 13 categories (cloud, communication, data, docker, git, pipelines, r-packages, shiny, testing, tidyverse) + 151 sources. Covers R workflows: targets pipelines, testthat/TDD, git/GitHub, Docker, tidy EDA, reprex. Each source carries YouTube provenance (author process:yt-dlp, usage_count, last_modified); topics cross-link per §6. Entry: topics/concepts-overview.md; indexes: topics/index.md, sources/index.md.
#> Score:  73%
#> 
#> @@ -2,4 @@ (1 before, 58 after)
#> type: source
#> title: "Docker: Managing images"
```

``` bash
qmd query "how to handle merge conflicts git" -c dsincubator -n 2
#> Expanding query... (0ms)
#> ├─ how to handle merge conflicts git
#> ├─ lex: guide to resolving
#> ├─ vec: guide to resolving git merge conflicts
#> ├─ vec: steps for managing git merge conflicts
#> └─ hyde: The process of handle merge conflicts git involves several steps. Fir...
#> Searching 5 queries...
#> Embedding 4 queries... (1.3s)
#> Reranking 27 chunks... (1ms)
#> qmd://dsincubator/sources/source_g1PRMaTFYdk_usethis-pr-sync-live-ds-incubator-meetup.md:9 #af78f9
#> Title: `usethis::pr_sync()` (live ds-incubator meetup)
#> Context: OKF v0.2 LLM wiki bundle distilled from 151 ds-incubator YouTube transcripts into 59 topic pages across 13 categories (cloud, communication, data, docker, git, pipelines, r-packages, shiny, testing, tidyverse) + 151 sources. Covers R workflows: targets pipelines, testthat/TDD, git/GitHub, Docker, tidy EDA, reprex. Each source carries YouTube provenance (author process:yt-dlp, usage_count, last_modified); topics cross-link per §6. Entry: topics/concepts-overview.md; indexes: topics/index.md, sources/index.md.
#> Score:  85%
#> 
#> @@ -8,4 @@ (7 before, 63 after)
#> tags: ["ds-incubator", "terminal", "pull-requests", "github", "git"]
#> key_topics: ["pr-sync", "usethis-helpers", "git-fork-workflow", "merge-conflicts", "pr-push", "pr-finish"]
#> generated:
#>   by: "agent:okf-wiki-builder/1.0"
#> 
#> 
#> qmd://dsincubator/topics/git/merge-conflicts.md:58 #eceefc
#> Title: Merge Conflicts
#> Context: OKF v0.2 LLM wiki bundle distilled from 151 ds-incubator YouTube transcripts into 59 topic pages across 13 categories (cloud, communication, data, docker, git, pipelines, r-packages, shiny, testing, tidyverse) + 151 sources. Covers R workflows: targets pipelines, testthat/TDD, git/GitHub, Docker, tidy EDA, reprex. Each source carries YouTube provenance (author process:yt-dlp, usage_count, last_modified); topics cross-link per §6. Entry: topics/concepts-overview.md; indexes: topics/index.md, sources/index.md.
#> Score:  62%
#> 
#> @@ -57,4 @@ (56 before, 28 after)
#> 
#> Resolution is shown both manually (opening the file, editing `<<<<<<<` / `=======` / `>>>>>>>` markers, `git add` the resolved file, `git commit`) and with tooling (`git mergetool`, `usethis::pr_sync()` / `pr_merge()` helpers). Prevention guidance recurs: keep branches synchronized with `main`/`master`, scope each PR to one thing, split monolithic ~200-line files into modules so collaborators touch different files, and recognize that frequent conflicts often signal a communication or semanti...
```

Use `qmd query` for prose/questions, `qmd search`/`rg` for exact symbols
(`tar_make`, `expect_snapshot`), then `qmd get` to pull context. See
`qmd --help` and `rg --help`.

See other [tips and
tricks](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f#tips-and-tricks)
(thanks `@karpathy`).
