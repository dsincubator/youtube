---
type: source
title: "pins: Sharing versions of a dataset with pins and Dropbox"
source_file: "VCHu0uhGo2g_pins-sharing-versions-of-a-dataset-with-pins-and-dropbox.md"
video_id: "VCHu0uhGo2g"
url: "https://www.youtube.com/watch?v=VCHu0uhGo2g"
lang: en
tags: ["ds-incubator", "pins", "r-packages", "dropbox"]
key_topics: ["pins", "board-folder", "pin-read", "pin-list", "pin-versions", "pin-meta", "pin-write", "dropbox", "versioning", "qs", "cache"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=VCHu0uhGo2g"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 40
    last_modified: "2022-04-05T00:00:00Z"
usage_window: { from: "2022-04-05T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# pins: Sharing versions of a dataset with pins and Dropbox

## Summary

A practical walk-through of the `pins` package's new interface for versioned data sharing, framed as a release mechanism for a continuously evolving data set (here the `fasstax.data` package) hosted on Dropbox to avoid analysts' code breaking when columns are added or renamed. The session notes that `pins` 1's old interface (`pin`/`pin_get`) is now legacy — maintained but not improved — and the new interface is fully board-first and pipe-friendly.

After outlining analyst-facing goals on the `ds.pins` GitHub repository (intro folder), the speaker shows the helper `pins_path()` in `R/pins_path.R` that builds the unwieldy Dropbox path (spaces and the `2°` symbol) together with `library(pins)` plus `tidyverse` and `here` for portable paths. The core pattern is `board <- board_folder(path = pins_path())`; printing the board shows its path and two available pins `ep_agricultural_livestock` and `esa_sme`. Reading is `board %>% pin_read("esa_sme")` (old names were `pin`/`pin_get`, now `pin_read`/`board %>% pin_read`). Discovery uses `board %>% pin_list()` and `board %>% pin_versions("esa_sme")` which returns a data frame of version hashes with timestamps; the speaker pipes it through `slice(3) %>% pull(version)` to isolate a hash.

Inspecting a version uses `board %>% pin_meta("esa_sme", version = version)` (title `v1`/`v2`, description, size, rows, `url` in `metadata`). Pinning a specific version for reproducibility is `board %>% pin_read("esa_sme", version = version)`, recommended to be fixed at the top of each analysis script. Size internals are shown via `fs::dir_tree(pins_path())` revealing duplicated `qs` files (quick serialization, fast and compressed, similar to `RDS` but preferred in the demo; alternative `type` values exist and uncovered file types fall back to path-based storage). Publishing is briefly shown: sourcing `passtax.data`, using the same `board_folder`, then `board %>% pin_write(data, name = "esa_sme", title = "v1/v2 ...", description = ..., metadata = list(url = ...), type = "qs", versioned = TRUE/FALSE)` — with `versioned` togglable per pin or per board, and `pin_versions_delete`/`pin_version_prune` mentioned but not deep-dived. Finally the two design pillars are stressed: easy sharing and an OS-appropriate cache (`tools::R_user_dir`-style) so `pins` can cache without explicit paths, minimizing path-handling code that otherwise breaks.

## Key Concepts & Tools Taught

- **[pins]:** `pins` ← `package pins which we covered ... but pins changed the interface or at least added a new interface since pins number one became a legacy interface` — package for sharing/cacheing R objects as versioned pins.
- **[board-folder]:** `board_folder` ← `it has a function called board folder and you have to give it a path` / `pins has this idea of a board ... concept of a board which is you know you think of it as a folder` — `board <- board_folder(path = pins_path())` connects to the local Dropbox mirror; printing the board lists contained pins and their path.
- **[pin-read]:** `pin_read` ← `being ripped to read the data from a pin board` / `function pin grid which will give you` / `before a pin used a function called pin or pin get now ... are called different things so now it's being ripped` — `board %>% pin_read("esa_sme")` returns the latest version; `board %>% pin_read("esa_sme", version = hash)` pins a historical version.
- **[pin-list]:** `pin_list` ← `there is this very nice function pin list which will give you a list basically extracting this piece ... you know which options are available` — `board %>% pin_list()` enumerates pin names (e.g., `ep_agricultural_livestock`, `esa_sme`).
- **[pin-versions]:** `pin_versions` / `pin_versions()` ← `i can query for the versions with pin version` / `type pin underscore something and you know let the autocomplete inspire you ... list versions` — `board %>% pin_versions("esa_sme")` returns a data frame of version hashes and creation times; usable with `dplyr::slice`/`pull`.
- **[pin-meta]:** `pin_meta` ← `board pipe ping underscore something so meta for example ... gives me ... if i give it the name esa sme ... version is the specific version` — `board %>% pin_meta("esa_sme", version = version)` shows title/description/size/row count and arbitrary metadata.
- **[pin-write]:** `pin_write` ← `this function pin write which ... has a bunch of arguments including ... type of object ... title and ... description ... arbitrary metadata in a list passed to metadata` — `board %>% pin_write(data, name, title, description, metadata = list(url=...), type = "qs", versioned = TRUE)` publishes/updates a pin.
- **[dropbox]:** Dropbox as a board backend via `pins_path()` helper wrapping `here` — handles spaces and `2 degrees` symbols; board is a synchronized folder whose online copy matches analysts' local mirrors.
- **[versioning]:** Per-pin or per-board version flag (`versioned = TRUE/FALSE`) enabling hash-based history (or overwrite-only mode that delegates history to Git); pruning via `pin_version_delete`/`pin_version_prune`.
- **[qs]:** `qs` ← `i'm using the qs format which is quick serialization and comes from the qs package it's pretty clever in that is fast and compressed` / `will be rds by default` — `type = "qs"` vs `"rds"`/`"arrow"` etc.; unsupported types still storable as generic files with `pin_read` returning a path.
- **[cache]:** OS-cache concept — `pins` saves to the system-appropriate cache directory (`R_user_dir`-like) so `board_folder()` can `just saving in cash and beans will know` without hard-coding paths, reducing bug surface.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```r
library(pins)                          # "just use the package pins so library pins"
library(tidyverse); library(here)      # "also ... tidy diverse ... here package which ... very useful to create paths"
source(here::here("R", "pins_path.R")) # "sourcing a function that i created ... opinions underscore path and it lives in the art folder"
pins_path()                            # "pins path what you could see is something that might look familiar ... very horrible path to anything that we put inside dropbox ... spaces and symbols like the two degrees symbol"
board <- board_folder(path = pins_path())  # "pins has this idea of a board ... function called board folder and you have to give it a path ... board has been created"
board                                    # printed metadata lists path and two objects ... ep agricultural livestock / esa sme
board %>% pin_read("esa_sme")            # "new interface ... first argument is the board meaning that we can pipe that into the function pin grid ... pin or pin get now ... called different things so now it's being ripped" -> pin_read
board %>% pin_list()                     # "function pin list which will give you a list"
board %>% pin_versions("esa_sme")        # "i can query for the versions with pin version ... function is pin underscore something ... list versions"
versions <- board %>% pin_versions("esa_sme")
version <- versions %>% slice(3) %>% pull(version)  # "slice the third and row ... pull just the values of version"
board %>% pin_meta("esa_sme", version = version)    # "board pipe ping underscore something so meta ... give it the name esa sme ... version is the specific version"
board %>% pin_read("esa_sme", version = version)    # read a pinned version for stable analysis

# internals
fs::dir_tree(pins_path())               # "let's see what is the tree of that vfs tree of that path so basically to see what's the content" -> fs::dir_tree

# publishing (shown at end, not executed live)
board <- board_folder(path = pins_path())
board %>% pin_write(data, name = "esa_sme", title = "v2 ...", description = "...", metadata = list(url = "https://..."), type = "qs", versioned = TRUE)  # "function pin write which ... specifying the type of object ... qs format ... title ... description ... arbitrary metadata ... version to say okay turn on or off the versions"
board %>% pin_write(data, name = "ep_agricultural_livestock", type = "qs")
# version pruning mentioned: pin_versions_delete(), pin_version_prune()
```
