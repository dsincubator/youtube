---
type: source
title: "The pins package (demo and discussion)"
source_file: "-HtB6duQnD8_the-pins-package-demo-and-discussion.md"
video_id: "-HtB6duQnD8"
url: "https://www.youtube.com/watch?v=-HtB6duQnD8"
lang: en
tags: ["ds-incubator", "r-packages", "github", "pins", "github-issues"]
key_topics: ["pins", "boards", "github", "caching", "versioning"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=-HtB6duQnD8"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 11
    last_modified: "2020-04-21T00:00:00Z"
usage_window: { from: "2020-04-21T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# The pins package (demo and discussion)

## Summary

The meetup addresses a team requirement for a better system to manage and share data, enumerated in GitHub issue 38 with seven criteria including permission control, version control via GitHub, online and local access with caching, handling large files, playing well with R, low cost, and use of familiar tools. Discussion surfaces file-size limits as a critical characteristic, noting GitHub limits, a 15 gigabyte limit for OneDrive integration, and that Azure blob storage has no upper limit, plus the caveat that pinning reads data into memory.

The presenter evaluates the pins package as a lightweight layer to meet those requirements. A live demo shows pinning a remote URL and wrapping `read_csv` with `pin` so that `pin_info` tracks the resource and only re-downloads when changed, pinning a computed object under a name for pipeline caching and retrieving it later with `pin_get`, using `pin_find` on the packages board to discover datasets such as `nycflights13::flights` without installing the package, and registering a newly created GitHub repository as a board via `board_register` with a repo and token to pin datasets like `airquality` and then fetch them. The session closes with questions about cache location and persistence, whether cached data survives deletion of the remote, and acknowledgment that pins is a convenient interface across backends — GitHub, S3, local cache, Dropbox — but does not by itself decide long-term storage.

## Key Concepts & Tools Taught

- **[pins]:** R package from RStudio for pinning remote or computed resources with local caching, versioning and retrieval helpers, installed as a normal R package at version 0.4.0 at the time.
- **[boards]:** Named places where pins are stored and searched, including packages, GitHub, Azure and local boards; each pin can be discovered across boards and accessed through the same interface.
- **[github]:** Using a GitHub repository as a pins board by creating a repo, registering it with a repo name and personal access token, then pinning and retrieving datasets from it.
- **[caching]:** Pins tracks metadata for each remote URL and serves the local cache when the source has not changed, saving repeated downloads and enabling offline reuse after first fetch.
- **[versioning]:** Overwriting a pin creates a new version so prior versions remain accessible, managed with git-backed history on boards that support it.
- **[read_csv from URL]:** Base pattern that pins wraps — reading directly from an online URL with `read.csv` / `read_csv` — extended by wrapping the URL with `pin` to add caching.
- **[pin_find]:** Search function that matches a string in pin names and descriptions within a chosen board, demonstrated on the packages board to locate flight data.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```r
library(pins)                     # "attach the package and Compaq expression ... it is version zero point four point zero" — library(pins) ← attach the package
# "functions like rip dot CSV or read underscore CSV allow you to read data directly from an online source" → read.csv(url) / readr::read_csv(url)
url <- "https://.../data.csv"
read.csv(url)                     # ← rip dot CSV
readr::read_csv(url)              # ← read underscore CSV

read.csv(pin(url))                # "you simply you just wrap now the URL in pin and then the package will do all the magic" — pin(url) ← pin
pin_info(url)                     # "if I use the function pin underscore Inc oh I can show you here that ... the package knows something" — pin_info ← pin underscore Inc
pin_get("modified_data")          # "you're just with the function team get and the name that you just gave" — pin_get ← team get / ping get
pin_find("fat flight", board = "packages")  # "the function things find for example takes a string" — pin_find ← things find / pin finds
packageVersion("nycflights13")    # "if I call it the function package version on the package age flight ... it will fail because I don't have any stole" — packageVersion ← package version

# Board registration and pinning to GitHub
board_register_github(repo = "owner/demo-pins-3", token = Sys.getenv("GITHUB_TOKEN"))
# "you need to use the function sorry or register it has a repo argument ... the repo lives in my account ... demo - penis 3 ... I'm going to use ... use this key up token" — board_register ← register / penis ← pins

pin(airquality, "air_quality", board = "github")
# "I'm gonna call the function peace on air quality ... and I'm telling ping to register to store it on the board github" — pin ← peace

pin_get("air_quality", board = "github")  # "with ping get I'm giving the name of the data set ... and a board I want to use"
```
