---
type: source
title: "Creating reproducible examples"
source_file: "wJnI0F_A-bU_creating-reproducible-examples.md"
video_id: "wJnI0F_A-bU"
url: "https://www.youtube.com/watch?v=wJnI0F_A-bU"
lang: en
tags: ["ds-incubator", "reproducibility", "github", "r-packages", "workflow"]
key_topics: ["reproducibility", "reprex", "datapasta", "r-markdown", "here-package", "session-info"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=wJnI0F_A-bU"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 13
    last_modified: "2019-12-10T00:00:00Z"
usage_window: { from: "2019-12-10T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Creating reproducible examples

## Summary

This meetup introduces two complementary ways to create **reproducible examples (reprexes)** for productive code conversations: the **reprex** package for minimal snippets, and an **R Markdown** (`github_document`) workflow for cases requiring reading local files. The core philosophy is that requesting help must minimize the helper's effort: the example should be based on runnable code, include output, be copy-paste reproducible, and allow the helper to run it without side effects.

The `reprex` workflow is simple: highlight code, run the reprex addin / `reprex()` ("red bricks function" ← `reprex()`), which renders a nicely formatted HTML preview in the Viewer and puts a syntax-highlighted Markdown version on the clipboard for pasting into a GitHub issue body, including output as comments so it remains executable and comparable. The companion vignette on **do's and don'ts** stresses using the smallest, simplest, most built-in data (e.g. `iris` or `mtcars` rather than proprietary data), sampling tiny slices with `head()` / `sample()` / `dplyr::sample_n()`, including only strictly necessary code, using `reprex(..., session_info = TRUE)` and `style = TRUE` (caption "use the argument to replication info if you set that to true" ← `session_info`, "use the arguments that equals true to red bricks" ← `style`), and being nice: don't alter the helper's global environment, working directory, or overwrite common functions like `mean`/`c` (caption "don't overwrite functions that are very common like me nor see from catenae ... use mean - C - or something" ← `mean`, `c`). Temporary files/directories (`tempfile`, `tempdir`, caption "help life or temp file our tenth-year" ← `tempfile`, `tempdir`) should be used for any disk writes and cleaned up, with global options restored.

When `reprex` cannot read local files (it runs in a temporary working directory different from the user's), the alternative is an R Markdown document. The file is created via File → New File → R Markdown → From Template → GitHub Document (caption "armored tank" / "armored arm" ← R Markdown github document), written normally with `library()`, `readr::read_csv(here::here(...))` to avoid `Rmd`-specific working directory issues ("our madam files and have weird notion of working directory ... that is why you use here here" ← `here::here`), and rendered with Knit to produce a `.md` that GitHub renders as HTML-like output, shared via link. `datapasta` bridges external data: copy rows from Excel/Sheets and use the Addin `Paste as tribble` or `datapasta::df_paste()` / tribble constructor (caption "use they are in from the data pasta package to create a table ... text version ... you can use that data passed a package with a very convenient add-in ... paste as triple" ← `datapasta`, `tribble`) to embed data as plain text in the reprex, same for data already in the environment via the package's helper.

## Key Concepts & Tools Taught

- **[reproducibility / reproducibility]:** Productive conversation requires code that runs and that the helper can also run easily; investing in a reprex saves iteration time and often solves the problem before posting.
- **[reprex / reprex]:** R package designed for this purpose; workflow is copy code → `reprex()` / addin `reprex selection` (caption "run on your console the red breaks function" / "rubrics package" / "replica package" / "Eustace package" ← `reprex`) → preview plus clipboard Markdown with `#>` commented output.
- **[datapasta / datapasta]:** Copy from Excel/world outside R → R text via `tribble` paste addin; from inside R via `datapasta` helpers — "how to move stuff from either outside the world or from inside our session ... to plain text" (caption "data pasta package ... paste as triple" ← `tribble`/`datapasta`).
- **[r-markdown / r-markdown]:** Alternative when reprex fails due to file reading; create an R Markdown `github_document`, use `here::here()` for paths, Knit to `.md`, commit and share the link (caption "how you create another madam file ... flavor ... github document" / "hit the neat bottom" ← `knit`).
- **[here-package / here-package]:** `here::here()` builds paths relative to the project root, fixing the R Markdown working-directory quirk where the knit directory is the document's folder, not the project root (caption "that is why you use here here ... create paths whatever you adding here" ← `here::here`).
- **[session-info / session-info]:** Include package versions and R version via `reprex(..., session_info = TRUE)` ("argument to replication info if you set that to true ... drop down menu ... details of the session information" ← `session_info = TRUE`) and style with `style = TRUE`.
- **[temporary files]:** Write only to `tempfile()`/`tempdir()` (caption "see the help life or temp file our tenth-year" ← `tempfile`, `tempdir`) and remove at end; restore options.

## Code Snippets & Formulas

Caption-mangled, normalized here:

```r
reprex::reprex()                          # "run on your console the red breaks function" / "replica package" / "rubrics package" ← reprex()
# Addin: reprex selection                # "you can select code ... come to addings I hit here on rubrics selection" ← reprex Addin
reprex(..., session_info = TRUE)          # "use the argument to replication info if you set that to true" ← session_info = TRUE
reprex(..., style = TRUE)                 # "you might want to use the arguments that equals true to red bricks" ← style = TRUE
head(iris); sample(iris); dplyr::sample_n(mtcars, 5)  # "you might want to use you know functions like hair or sample" / "create a center ... sample n you can say how many things you want to sample" ← head, sample, sample_n

# datapasta — outside → inside
# 1. Copy rows in Excel → RStudio Addin: Paste as tribble  # "copy from observe the world ... data pasta package with very convenient add-in ... paste as triple that is a nothing" ← tribble
tibble::tribble(~x, ~y, 1, 2)              # normalized tribble

# inside R → text
# datapasta::df_paste(mtcars) / tribble_paste  # "you can touch the data Buster Prem ... run that a pasta the function of the pasta" ← datapasta

# R Markdown alternative (when reprex cannot read file.csv due to temp wd)
# File → New File → R Markdown → From Template → GitHub Document
here::here("data", "file.csv")            # "rubbing my path here to my file with here here ... create paths whatever you adding here" ← here::here
readr::read_csv(here::here("data", "file.csv"))  # "using the radar package then I'm using the reader package to read this file ... store that output into data" ← readr
clean_data <- dplyr::rename(raw_data, speed = old_speed)  # demo cleaning step before writing
readr::write_csv(clean_data, here::here("data", "data.csv"))

tempfile(); tempdir()                     # "see the help life or temp file our tenth-year" ← tempfile, tempdir
```

