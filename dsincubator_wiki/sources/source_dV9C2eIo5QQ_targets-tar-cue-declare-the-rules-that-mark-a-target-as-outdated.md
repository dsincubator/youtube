---
type: source
title: "targets: tar_cue(): Declare the rules that mark a target as outdated."
source_file: "dV9C2eIo5QQ_targets-tar-cue-declare-the-rules-that-mark-a-target-as-outdated.md"
video_id: "dV9C2eIo5QQ"
url: "https://www.youtube.com/watch?v=dV9C2eIo5QQ"
lang: en
tags: ["ds-incubator", "targets", "pipelines", "r-packages", "cloud"]
key_topics: ["tar-cue", "tar-make-skipping", "mode-always-never", "command-and-depend-cues", "targets-metadata"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=dV9C2eIo5QQ"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 185
    last_modified: "2021-02-16T00:00:00Z"
usage_window: { from: "2021-02-16T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# targets: tar_cue(): Declare the rules that mark a target as outdated.

## Summary

The meetup deep-dives the `tar_cue()` control in the `targets` package, which declares the rules that mark a target as outdated and therefore tells `tar_make()` whether to recompute or skip each target. The presenter works from a minimal three-target pipeline (`path` → `raw` → `data`) defined in `_targets.R` on RStudio Cloud, recapping the file structure ( `library(targets)`, `source()` of helper scripts such as `R/functions.R` containing `read` / `clean`, global `tar_option_set()` / `options()` settings, and a list of `tar_target()` calls). The pipeline uses a custom `read` wrapper around `read_csv(..., col_types = ...)` (reader package, "read underscore csv" / "reader package ... part of the tigers" → `readr`) and a toy `clean` that mutates a data frame.

The core lesson is how `targets` decides outdatedness. Four checks are covered: (1) no metadata (`_targets/meta/meta` folder absent) → every target is outdated; destroying it with `tar_destroy()` ("function called tar destroy uh that folder boom is gone") and then `tar_outdated()` returns all three names, so `tar_make()` rebuilds everything. (2) a recorded error in the previous run → that target remains outdated on every subsequent `tar_make()` until fixed (demoed by inserting `stop("this is with an error")` into `clean`, so `data` stays outdated and repeatedly fails). (3) change of stored object's class/format. (4) the fine-grained cues exposed by `tar_cue()`: `mode` (`thorough` [default], `always`, `never`), `command`, `depend`, and `format`. `mode = "always"` forces all targets outdated; `mode = "never"` forces them up-to-date even after editing `clean` to add `"hello"`. The cues can be set globally via `tar_option_set(cue = tar_cue(...))` or per-target via the `cue` argument to `tar_target()`. Flipping `command = TRUE` (default) versus `FALSE` controls whether changing the expression `read(path)` marks `raw` (and downstream `data`) outdated. Flipping `depend = FALSE` breaks the upstream dependency so editing `read` leaves `data` up-to-date even though `raw` is outdated. The `format` cue governs storage format (default `rds` versus `qs`) and is presented without live demo. Two layers of control (global vs per-target) are emphasized, and a use case contributed by a participant — setting a database-pull target to `cue = tar_cue(mode = "never")` during iterative development to avoid re-querying — illustrates why `never` exists.

## Key Concepts & Tools Taught

- **[tar-cue]:** `targets::tar_cue()` — the function whose arguments declare what makes a target outdated ("tar q which is the function in the package in charge of defining the rules that make a target out of date").
- **[tar-make-skipping]:** How `targets::tar_make()` ("are make" / "tarmac" → `tar_make`) uses those rules to decide to run or skip each target; inspected with `tar_outdated()` / `tar_outdated` ("character 0 meaning that there is no target that is out of date").
- **[mode-always-never]:** The `mode` argument of `tar_cue()` with defaults `thorough` ("the default of this argument is photo" → `thorough`), `always` ("if i consider that targets are always out of date") which recomputes everything, and `never` ("never look at anything") which keeps everything up-to-date.
- **[command-and-depend-cues]:** The `command` cue ("the second argument is called command" → `command = TRUE/FALSE`) that makes a change to the target's expression trigger rebuild, and the `depend` cue ("each target depends on other targets" → `depend = TRUE/FALSE`) that propagates upstream changes to downstream targets; both togglable globally or inside `tar_target(..., cue = tar_cue(...))`.
- **[targets-metadata]:** The `_targets/meta` store ("folder targets is where target is storing metadata ... one called meta and there we see a file called methods again") whose absence forces a full rebuild, and `tar_destroy()` ("function called tar destroy") that deletes it.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```r
library(targets)                # "start with library targets"

tar_edit()                      # "function tar edit which will open the file underscore targets.r which is which defines the pipeline"
# _targets.R skeleton:
library(targets)
source("R/functions.R")         # "one where we source any files that might contain functions"
tar_option_set(packages = "readr")  # "for all targets i'm using the package titles" → readr/tidyverse declared globally
# options() alternative mentioned: "the plain you know based our function options which you could if you needed then you would call it here"
list(
  tar_target(path, "data/file.csv"),                 # "create a target that actually contains the path to a file that lives in the data folder"
  tar_target(raw, read(path)),                       # "second target that i called raw and which basically it is a data frame that results from reading with a custom function read"
  tar_target(data, clean(raw))                       # "third target here defines a new target called data and it is the result of ... applying the function clean"
)

# Helpers shown
read  <- function(path) readr::read_csv(path, col_types = cols())  # "just a call to read underscore csv and i'm using the argument called types to silence the messages"
clean <- function(data) dplyr::mutate(data, ...)                  # "performs a mutation adding a column and replacing the base or replacing an existing column"

tar_outdated()                  # "function called tar outdated ... will tell me if any of the target is out of date"
tar_make()                      # "function are make will use that kind of knowledge to decide if a target should run or should be skipped" / "tarmac will actually compute"
tar_destroy()                   # "actually there is a function called tar destroy uh that folder boom is gone"
tar_cue(mode = "thorough")      # default; "the default of this argument is photo" → thorough
tar_cue(mode = "always")        # "if we say q equals guitar q we give it the mode not the default but a different one let's say always" → tar_cue(mode = "always")
tar_cue(mode = "never")         # "we start with uh with the mode never ... consider every aspect is up today"

# Global vs per-target application
tar_option_set(cue = tar_cue(mode = "always"))   # "just an argument that you can use either inside the call to tire option set so you set the queue for all targets in one go"
tar_target(raw, read(path), cue = tar_cue(command = FALSE))  # "you can also do it in any of the targets individually" / "queue argument in each of these calls to entire underscore target"

tar_cue(command = TRUE)         # default; "the second argument is called command ... the expression that we pass to each step in the pipeline is called a command"
tar_cue(command = FALSE)        # "if i say command false ... change in the command that defines the target does no longer trigger"
tar_cue(depend = TRUE)          # default dependency propagation
tar_cue(depend = FALSE)         # "if i say depend equals false ... the computation of data does not depend on anything"

tar_cue(format = "rds")         # default "to be saved as an rds file ... there is other formats that are supported for example the qs format"

# Use case quoted: participant sets database pull to never rebuild while iterating
tar_target(db_data, get_data(), cue = tar_cue(mode = "never"))  # "when i was pulling data from a database i set that target to never rebuild so that i wouldn't have to go back and actually pull from the database every time"
```
