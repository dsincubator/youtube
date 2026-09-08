---
type: source
title: "pins"
source_file: "kS_0s0eS1Xw_pins.md"
video_id: "kS_0s0eS1Xw"
url: "https://www.youtube.com/watch?v=kS_0s0eS1Xw"
lang: en
tags: ["ds-incubator", "r-packages", "pins", "github"]
key_topics: ["pins-cache", "pin-info-and-pin-get", "pin-find-boards", "github-board"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=kS_0s0eS1Xw"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 13
    last_modified: "2020-04-21T00:00:00Z"
usage_window: { from: "2020-04-21T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# pins

## Summary

This session presents the `pins` R package as a thin layer over existing storage to improve how data is managed and used, addressing the same problem as earlier data-management meetups (issue #38). After pointing to the polished `pins.rstudio.com` site and vignettes (learned in ~2 hours, install from CRAN via `library(pins)` plus `tidyverse` for convenience), the speaker notes CRAN version usage. A live demo first reads a remote resource (e.g., Facebook oil URL or any GitHub remote) directly with `read_csv(url)` and shows the result is available but slow, requires re-download each call, and fails offline or if the source disappears. Wrapping the URL in `pin()` (caption “P” / “team”) solves this: `pin(url)` downloads once, keeps a local cache, makes work faster and safer, redownloading only when the source has changed, and serving from local cache if the source disappears. `pin_info()` on the object is then shown to reveal metadata (rows, columns, etc.). A second pattern pins a computed/analyzed object — starting from the retrieved dataset, piping through a couple of summaries (standing in for any complex computation) into `pin(name = "analysis")` — again inspectable via `pin_info("analysis")` and retrievable quickly via `pin_get()` without recomputing, great for long-running analyses. Finding datasets is covered via `pin_find()` across boards: `pin_find("flights", board = "packages")` searches crates/packages boards and returns a data frame of matching resources; you can use data from `nycflights13` without installing it via `pin_get("owner/flights", board = "packages")`. Crucially, a GitHub repository can be used as a board for sharing any object: a new empty `demo Pins` repo is created under the speaker's account (risky live demo), registered locally via `board_register_github(repo, token)` where the token is retrieved without public exposure via a helper function, then a dataset like `diamonds` is pinned (`pin(diamonds, board = "demo")`), appears on GitHub as a folder with `data.csv` versions after refresh, and is fetched with `pin_get("diamonds", board = "demo")`.

## Key Concepts & Tools Taught

- **pins-cache**: `pins` wrapping of a remote URL (e.g., `pin(url)`) creates a local cached copy; subsequent `pin_get` or `read` is fast and offline-safe, redownloading only when the remote changes; solves wait on every `read_csv(url)`.
- **pin-info-and-pin-get**: `pin_info(name)` shows metadata about a pinned object (rows, columns, etc.) for both raw URL pins and analyzed datasets; `pin_get(name)` (and `pin()` as pipe target) stores and retrieves objects quickly for long-running computations, demonstrated with a grouped summary piped into `pin("analysis")`.
- **pin-find-boards**: `pin_find("search_string", board = "packages")` finds resources across boards (different places `pins` knows about); boards include packages on CRAN, so you can discover and then fetch a dataset from a package you haven't installed.
- **github-board**: Registering a GitHub repository as a board via `board_register_github(repo, token)` (token retrieved privately) lets you store and share any R object as a pin; demonstrated by creating an empty `demo-pins` repo, registering it, pinning `diamonds`, seeing the folder/version on GitHub, and retrieving via `pin_get` with `board` argument.


## Code Snippets & Formulas

Caption-mangled forms preserved (pins often mangled as beans/teens/pings):

```r
library(pins)  # "today I'm gonna show the beans package these relates to the same problem" # beans <- pins ; "you can find the website at pings dot our studio common" # pings <- pins
library(tidyverse)

# Direct remote read (slow, not cached)
url <- "https://..."  # "maybe you know maybe you don't know you can read data directly from a remote source imagine you know github or whatever" 
read_csv(url)  # works but "what happens if you go offline what how many resource disappears and you know do you really want to wait all the time for that data set to download every time"

# Pinned URL (local cache)
pin(url)  # "by know before by wrapping basic the URL in the function P it will create a local version of that data so it will download once and keep there only a local computer and only will download it again if it detects that the source has changed" # P <- pin
pin_info(url)  # "you makes your work for faster ... you have made about this is how so within info and the name of an object you can learn what information pins so another way" # within info <- pin_info
read_csv(pin(url))  # fast / offline-safe "you still have cash remotely sorry locally that team will ultimately be used" # cash <- cache, team <- pin

# Pinning a computed object
data %>% group_by(...) %>% summarise(...) %>% pin("analysis")  # "you may want to benefit from pins is by actually creating like a share or an object that you know took some time to compute ... you just call you can including your pipe the ping and just a name for this new version of analysis data set" # ping <- pin
pin_info("analysis")
pin_get("analysis")  # "you can just get it from there from the cashier with pin gates and you don't need to compute the thing again" # pin gates <- pin_get, cashier <- cache

# Finding across boards
pin_find("flights", board = "packages")  # "if you say being find and you tell it exquisite that the kind of pin works with ports you can look for information in different places those places are called boards" # being find <- pin_find, ports <- boards
# Returns data frame with every much ... "just a data frame with every much of the work flying in any of the databases that we knows about on the board carriages" # board carriages <- board packages
pin_get("owner/flights", board = "packages")  # direct use without installing nycflights13/hflights package

# GitHub board
# create repo on GitHub: mauro-lp/demo-pins empty
board_register_github(repo = "mauro-lp/demo-pins", token = get_token())  # "you what you could do is to create a new repository ... let's see if I can little risky ... demo oops ... Now I know what's the name ... I registered a board first and now I can started using there we go" # board_register_github
pin(diamonds, board = "demo")  # pin a dataset to GitHub board
pin_get("diamonds", board = "demo")  # fetch specifying board
```

