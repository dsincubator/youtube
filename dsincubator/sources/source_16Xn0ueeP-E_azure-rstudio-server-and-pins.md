---
type: source
title: "Azure, RStudio server, and pins"
source_file: "16Xn0ueeP-E_azure-rstudio-server-and-pins.md"
video_id: "16Xn0ueeP-E"
url: "https://www.youtube.com/watch?v=16Xn0ueeP-E"
lang: en
tags: ["ds-incubator", "pins", "r-packages", "cloud", "azure"]
key_topics: ["pins", "azure-board", "rstudio-server", "board-registration", "pin-find", "shared-cache"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=16Xn0ueeP-E"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 559
    last_modified: "2020-05-19T00:00:00Z"
usage_window: { from: "2020-05-19T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# Azure, RStudio server, and pins

## Summary

The meetup is a workshop-style rehearsal for the upcoming Mastering the Tidyverse series, using a collaborative Google Doc (`bitly DSi pin` / `bitly DSi pin` shared on chat and Slack) and participation voting (`YES` in the Zoom participants panel) to practice interactive delivery. The data-management goal is to share large files without repeated internet transfers by combining Azure blob storage with an RStudio Server instance on the cloud (RStudio Cloud project) and the `pins` package from RStudio.

Participants are guided through three hands-on tasks in an R Markdown project: opening `00 intro Rmd` and running a code chunk, configuring Azure credentials by opening the environment file with `usethis::edit_r_environ` ← `use this edit our environ` / `use these edit our environ`, adding three key-value lines (two fixed lines plus the secret pasted from chat) with a trailing newline, saving and restarting R (`Shift+Ctrl+F10` or Session > Restart R), and then using `pins` to register the board, discover datasets, and cache processed results. The RStudio Server is presented as a shared cache: processed outputs pinned locally are actually stored on the server's filesystem and become available to other users without recomputation.

The `pins` workflow demonstrated is: load the package, register the Azure board with the board-specific registration function called with no arguments, search existing pins with `pin_find` (by keyword `empty cars` / `MTC` / `MT` which matches name or description), retrieve one with `pin_get`, create a processed version (e.g., `head` of `my_data` into `small_data` as a stand-in for an expensive one-hour computation), and store it locally with `pin` (`pin(small_data, board = "local")` semantics). Exploration is also shown visually via the Connections tab (boards, packages, local board, Azure) and the `Find Pins` addin, and the final section inspects the on-disk cache structure under `~/.../cache/pins` (home directory, `cache/pins` folder) where `pins` manages local and Azure-backed copies.

## Key Concepts & Tools Taught

- **[pins]:** R package for pinning datasets to boards for discovery, retrieval and versioned caching; supported natively in RStudio via the Connections tab and addin.
- **[azure-board]:** Azure (`asura` ← `asura` / `Azeri` / `Azzurri` / `Azur` in captions) remote board used to store datasets centrally so they can be fetched programmatically rather than transferred manually.
- **[rstudio-server]:** RStudio Server instance on the cloud (referred to as `nursery server` ← `nursery server`, `our studio server`, `our studio cloud` / `RStudio Cloud` project) used as a shared execution environment where the cache is shared across users.
- **[board-registration]:** Setting credentials in `.Renviron` via `usethis::edit_r_environ` ← `use this edit our environ`, adding the three Azure key-value pairs, saving with trailing newline, restarting R, then registering with `board_register_azure()`-family call with no arguments and `library(pins)`.
- **[pin-find]:** Discovery helpers: `pin_find` ← `penis fine` / `pins fine` / `being find` programmatic search (`pin_find("empty cars", board = "azure")` semantics) plus visual search in Connections > Pins and the Find Pins addin, filtering by keyword such as `empty cars` or `mtcars`.
- **[shared-cache]:** Local/server cache (`local board` ← `local door` / `local array` / `local pin board`, `cache/pins` folder under home) where `pins` keeps a local copy of retrieved and newly pinned objects (`pin_get` to fetch, `pin` to store `small_data`), enabling reuse without recomputation; location shown as `~/cache/pins` with subfolders per board and dataset.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```r
library(pins)                         # "when you want to use a package you always need to do library and the name"
usethis::edit_r_environ()             # "use this edit our environ" / "use these edit our environment" — open .Renviron
# then in .Renviron add 3 lines: e.g. AZURE_STORAGE_ACCOUNT, AZURE_STORAGE_KEY, AZURE_STORAGE_ENDPOINT
# save, ensure trailing newline, then restart R: Shift+Ctrl+F10  # "pressing shift ctrl f10 but you can also do it as you would normally do it ... session restart"

# register Azure board (pins helper, called with no arguments)
board_register_azure()                # "pins the pins package includes a number of functions to register different boards and if you want to register an asura board this is the function that you need to cope with no arguments"

pin_find("empty cars", board = "azure")  # "penis fine we'll just search database" / "being find" / "you can search in your earth with your cloud interface" — also demoed via Connections > Pins and Find Pins addin
pin_find("mtcars")                    # "you could also use the keyword MTC or MT because it will just try much pins by name or by description"
pin_get("empty cars", board = "azure")   # "pins has if the function will get soap in get" / "use the function ping get with the name and ... in quotes ... and you have to say in which bore you want to read that data" → my_data <- pin_get("empty cars", board = "azure")
head(my_data)                         # part of creating processed version (first few rows)
small_data <- head(my_data)           # "we called my data just to extract the first few rows with head and then ... small data it's just the imaginary name of my process data"
pin(small_data, board = "local")      # "if you create an output ... you use ... the function team so that's all we need to do" / "store it in your local cache ... shared cache in the server"
pin_find("small_data", board = "local")  # "with being find I'm running it ... here it is data set it exists in your local cache"
pin_get("small_data", board = "local")   # "how could you use it well with a function ping get which you already know"

# visual alternatives mentioned:
# Connections tab > Pins  # "there is there is pins here you can see a bunch of boards ... packages ... local door ... everyone"
# Addin: Find Pins         # "also there is usually an audience here see if you can find your pins through the audience and finally do it programmatically"
# cache inspection:
# pins cache path: ~/cache/pins  # "this is the home kind of directory of the user in a folder called cache and in pins"
# tree of cache: local cache storing small_data  # "there is a local cache that things created automatically ... here it's storing that data set that we called small data"
```
