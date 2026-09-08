---
type: source
title: "reprex: overview"
source_file: "erv1yJaNID8_reprex-overview.md"
video_id: "erv1yJaNID8"
url: "https://www.youtube.com/watch?v=erv1yJaNID8"
lang: en
tags: ["ds-incubator", "r-packages", "github", "github-issues", "reprex"]
key_topics: ["reprex", "reproducible-examples", "session-info", "venue-slack", "reprex-input"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=erv1yJaNID8"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 78
    last_modified: "2021-10-05T00:00:00Z"
usage_window: { from: "2021-10-05T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# reprex: overview

## Summary

This meetup opens a short series on the reprex package (word smash of reproducible examples) with a "quick exit point": after this overview attendees know enough to decide why and how to use it, while two follow-ups will cover vignette philosophy and tool design. The motivation is conversational: whether reporting a bug, requesting a feature, or asking on Slack/GitHub, including a good reprex dramatically raises success because the helper can see and re-experience the same problem rather than wading through private workload.

The worked example is a now-fixed bug in `fs 1.3.1` with `fs::path_ext_set(c("a","b"), "csv")` (caption "path extension set in the fs package ... supposed to whatever extension you say here to the right to each of the paths ... in the first argument" ← `fs::path_ext_set`). Expected output is `"a.csv"` and `"b.csv"`, but the buggy output is garbled as `b dot n a` (caption "instead i got b dot n a" ← buggy output). The presenter shows version capture with `packageVersion("fs")` returning `1.3.1` (caption "function package version fs that return 1.3.1" ← `packageVersion`).

Multiple creation paths are demonstrated. The most-used interactive path is highlighting code in RStudio and pressing `Shift+Ctrl+P` to open command navigation, typing `reprex`, and choosing the Render reprex selection add-in (caption "i press shift ctrl p to pop ... command navigation bar and then i start typing rep rex ... add-ins ... replic selection" ← Addins → reprex selection), which renders a viewer pane showing code plus commented output (`#>`). The same add-in is reachable via the Addins menu. A second path is clipboard-driven: `Ctrl+A` → `Ctrl+C` to copy, then `Ctrl+2` to the console and `reprex()` with no arguments (caption "the function replex itself ... will look for stuff that is in your clipboard ... if i copy that code now i can go to the console and just type replex" ← `reprex()`), which rebuilds the reprex in a fresh temporary environment and copies the result back to the clipboard so it can be pasted directly into a GitHub issue with `Ctrl+V`. Help is via `?reprex` or stepping on the name and `Ctrl+F1`. Options include `session_info = TRUE` (caption "session session info equals true" ← `reprex(session_info = TRUE)`) which appends a collapsible HTML `<details>` dropdown with OS (Ubuntu 20.04.3) and package versions including `fs`, useful for exposing the bug; venue optimization where GitHub is default but `reprex::reprex(venue = "slack")` (caption "replace underscore slack" ← `reprex_slack` / `venue="slack"`) wraps with triple backticks for Slack and `reprex::reprex(venue = "r")` (caption "replex dot underscore r ... creates the vanilla code without the backticks" ← `reprex` `venue="r"` ) gives plain R; `reprex(input = "01_overview/issue205.R")` (caption "input ... zero one overview and then search for the file issue at 205" ← `reprex(input = )`) for file-based rendering; and direct expression `reprex({ ... })` with braces for multi-line (caption "because this is a multi-line expression i need braces so if you're not familiar with the braces they allow you basically to inject multiple lines as if they were one" ← `reprex({ })`) formatted with `Ctrl+A` then `Shift+Ctrl+A`.

The opposite side shows why commenting matters: the recipient can select the pasted reprex, paste into their console and run it without breaking because output lines are commented (`#>`), immediately confirming the same `"a.csv"` vs buggy output. To iterate, `reprex::reprex_clean()` (caption "function replex underscore clean ... will go to your clipboard remove all those lines that belong to output" ← `reprex_clean`) strips output so the cleaned code can be edited (e.g., inlining `c("a","b")` instead of `files <- ...`) and re-rendered via the add-in. Gists (`gist.github.com` → `reprex example dot md` → Create public gist → collapsible `<details>` works) are recommended for long snippets versus inlining on Slack.

Finally the presenter covers non-self-contained data: `readRDS("01_overview/paths.rds")` (caption "read rds ... 0 1 overview paths ... give the path to that file" ← `readRDS`) works locally but fails in reprex's fresh temp context (`reprex` error), which is fixed by `reprex(..., wd = here::here())` / `wd = "."` style argument (caption "trick ... argument wd ... wd equals here that means working directory is where i'm standing right now" ← `reprex(wd = ...)`) so the working directory is retained, with the caveat that the recipient then needs the emailed/shared file to reproduce. The session closes linking to the philosophy discussion (minimal examples clarify thinking and often answer your own question before help) and to Docker for true environment pinning.

## Key Concepts & Tools Taught

- **[reprex]:** R package for shareable snippets that render code plus commented output to clipboard/viewer, invokable via RStudio Addin Render reprex selection (caption "i press shift ctrl p ... add-ins ... replic selection if i have selected the code and it's just if i just hit enter that will already create a rubrics" ← `reprex` add-in) or console `reprex()` from clipboard or file/expression, runnable by the recipient because output is commented.
- **[reproducible-examples]:** Principle that conversations about code should let the helper experience the same problem: include software dependencies, accessible data (private via private channels if needed), problem description, and session context; the minimal example workflow systematically clarifies assumptions and often solves the problem before posting.
- **[session-info]:** Optional inclusion with `reprex(session_info = TRUE)` (caption "session info equals true" ← `session_info`) that adds a collapsible HTML `<details>` dropdown reporting OS and package versions (e.g., Ubuntu 20.04.3 and `fs` 1.3.1) so bug-relevant versions travel with the snippet.
- **[venue-slack]:** Venue optimization for different paste targets: GitHub markdown default versus Slack triple-backtick (`reprex_slack` / `venue = "slack"` — caption "if you want to post that on slack it will look pretty ugly ... you do backtick backtick backtick it creates a code chunk ... you can do repress underscore slack" ← `reprex(venue="slack")`) and plain R (`reprex venue="r"` — caption "replex dot underscore r ... creates the vanilla code without the backticks" ← `venue="r"`), plus `reprex_clean` for stripping output before re-pasting.
- **[reprex-input]:** File and expression interfaces: `reprex(input = "01_overview/issue205.R")` (caption "input ... zero one overview ... issue 205" ← `input`) and `reprex({ ... })` with braces for multi-line (caption "because this is a multi-line expression i need braces" ← braces), and the `wd` trick (`wd = here` / `wd = "."` — caption "argument wd ... wd equals here that means working directory is where i'm standing" ← `wd`) for otherwise-non-reproducible file reads like `readRDS("01_overview/paths.rds")`.

## Code Snippets & Formulas

Caption-mangled, normalized here (quote-to-name):

```r
library(reprex)                         # "library replicas" ← library(reprex) — also safe to add to .Rprofile via usethis::edit_r_profile() ("edit underscore r underscore profile" ← edit_r_profile )
packageVersion("fs")                    # "function package version fs that return 1.3.1" ← packageVersion
# buggy call
fs::path_ext_set(c("a", "b"), "csv")   # "path extension set in the fs package is supposed to whatever extension you say here to the right to each of the paths ... in the first argument ... output expected a dot csv and b dot csv but instead i got b dot n a" ← path_ext_set
# expected: "a.csv", "b.csv" ; observed buggy: garbled "b dot n a"

# Creation — add-in
# highlight code → Shift+Ctrl+P → type "reprex" → Render reprex selection
# or Addins menu → reprex → Render reprex selection
# "the common navigation bar the one that i accessed by pressing shift ctrl p is no more than a shortcut to clicking here in the addings menu"

# Creation — clipboard / console
reprex()                                # "the function replex itself ... will look for stuff that is in your clipboard ... if i copy that code now i can go to the console and just type replex and that should just work" ← reprex()
# workflow: Ctrl+A → Ctrl+C → Ctrl+2 (console) → reprex() → Ctrl+V into GitHub issue/gist

# Options
reprex(session_info = TRUE)            # "session session info equals true ... output now ... has this drop down menu that if you click there you have information about ... operative system ubuntu 20.04.3 ... and it includes the version of for example fs" ← session_info
# HTML: <details> surrounds dropdown — "it has this html tag details which surrounds the thing that is going to be included in the drop down menu"
reprex(venue = "gh")                   # default GitHub markdown
reprex(venue = "slack")                # "repress underscore slack ... will create the output slightly tweaked optimized for slack" ← reprex_slack
reprex(venue = "r")                    # "replex dot underscore r ... creates the vanilla code without the backticks" ← venue="r"
# Slack usage: press ``` to open code chunk, paste venue="r" output

# File / expression interfaces
reprex(input = "01_overview/issue205.R")  # "input ... zero one underscore overview and then search for the file issue at 205" ← input
reprex({                                # "wrap all this in in red bricks ... because this is a multi-line expression i need braces"
  library(fs)
  files <- c("a", "b")
  fs::path_ext_set(files, "csv")
})
# formatting: Ctrl+A → Shift+Ctrl+A (RStudio auto formatter)

# Receiving side — output is commented so paste runs
# "the output is there but it's commented and you can compare it right away"
# "if the other person doesn't want to and they get what's going on they not need to run anything but then if they choose to it should be easy ... because the output is commented"

reprex::reprex_clean()                 # "function replex underscore clean ... will go to your clipboard remove all those lines that belong to output and make it clean so that you can paste it" ← reprex_clean
# clean → edit → re-render via Render reprex selection

# Non-self-contained data hack
readRDS("01_overview/paths.rds")       # "read rds and i would give the path to that file 0 1 overview paths ... i can create ... files ... that i showed you before" ← readRDS — fails in fresh reprex env
reprex({ readRDS("01_overview/paths.rds") }, wd = ".")  # "trick ... argument wd ... first i create the red bricks locally then i cut that code called red bricks ... wd equals here that means working directory is where i'm standing right now ... that should work" ← wd
# caveat: recipient needs the file emailed/shared to reproduce
getwd()                                 # "where i'm ... get wd where i'm in my system"
?reprex                                  # "if you do ... question mark repress or if you step on the name of the function and press con f1 you access ... the help file" ← ?reprex
```
