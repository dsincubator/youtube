---
type: source
title: "Tidying data"
source_file: "VA3qaeTKTYk_tidying-data.md"
video_id: "VA3qaeTKTYk"
url: "https://www.youtube.com/watch?v=VA3qaeTKTYk"
lang: en
tags: ["ds-incubator"]
key_topics: ["tidyr", "gather", "spread", "pivot-longer", "pivot-wider", "billboard", "tidy-selection", "names-prefix"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=VA3qaeTKTYk"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 16
    last_modified: "2020-04-07T00:00:00Z"
usage_window: { from: "2020-04-07T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# Tidying data

## Summary

A focused comparison of tidyr's older reshaping verbs `gather`/`spread` and their newer replacements `pivot_longer`/`pivot_wider`, using the built-in `billboard` data set where each row is a track (artist, track, date entered) and 76 columns `wk1`…`wk76` hold weekly chart ranks. The intended reshape is long: one `week` column and one `rank` column instead of 76 wide columns.

For `gather`, the speaker details signature `gather(data, key, value, ...)` and shows the default problem that enumerating `wk1, wk2, wk3…` is tedious; selection idioms are then surveyed: numeric indices (`4:79`), negative selection (`-1:-3`), open ranges (`wk1:wk76`), and tidyselect helpers `starts_with("wk")` and `matches("^wk\\d+$")` (regex for `wk` followed by numerals). Custom output names are encouraged (`week`/`rank` vs default `key`/`value`) and quoting keys as string literals is recommended for clarity.

`pivot_longer` is contrasted: it takes a single `cols` argument (e.g., `cols = wk1:wk76` or `cols = -c(artist,track,date.entered)` or `starts_with`/`matches`), so the multi-argument gather form is invalid. Defaults `names_to = "name"` and `values_to = "value"` work without explicit naming, but `names_to`/`values_to` can be set to `week`/`rank`. New `pivot_longer` powers are highlighted: `names_prefix = "wk"` strips the common prefix so `wk1` becomes `1`, and `names_transform = list(week = as.integer)` (captioned as `names we want the week column to be an integer`) coerces the week to integer rather than character. The episode also covers `spread`/`pivot_wider` to reverse the operation: `spread(key = week, value = rank)` vs `pivot_wider(names_from = week, values_from = rank)`, plus `sep` in `spread` and `names_prefix` in `pivot_wider` to restore `wk` prefixes, and notes that only `pivot_*` can handle multiple `names_to`/`values_to` columns at once (avoiding type coercion to character when column types differ). Discussion links the reshaping choice to `dplyr`'s SQL heritage (naturally long) versus modern column-oriented `mutate` usage, and recommends Hadley's tidy-data papers.

## Key Concepts & Tools Taught

- **[tidyr]:** `tidyr` ← `todd ER has been changing all the tiny versions been changing` / `Toddie are these functions` — package providing tidy-data reshaping verbs; `gather`/`spread` remain available (not soft-deprecated) but `pivot_longer`/`pivot_wider` are strongly recommended.
- **[gather]:** `gather` ← `they gather and spread functions have now been replaced with these newer functions called pivot longer pivot wire` — `gather(data, key, value, ...)` e.g. `gather(billboard, key = "week", value = "rank", wk1, wk2, ...)`; supports bare column enumeration, numeric ranges, negative and range selections.
- **[spread]:** `spread` ← `lives is spread ... spread them out into like further comments` — `spread(data, key, value)` e.g. `spread(billboard_long, key = week, value = rank)` with `sep` to re-add prefixes.
- **[pivot-longer]:** `pivot_longer` ← `pivot longer which is the new version` — `pivot_longer(data, cols = wk1:wk76, names_to = "week", values_to = "rank")`; single `cols` argument, helpers `starts_with("wk")`, `matches("^wk\\d+$")`; can take `names_prefix` and `names_transform`.
- **[pivot-wider]:** `pivot_wider` ← `pivot wider is pretty similar to spread` — `pivot_wider(data, names_from = week, values_from = rank)` with `names_prefix = "wk"` to restore wide column names.
- **[billboard]:** `billboard` data set — `artist`, `track`, `date.entered`, plus `wk1:wk76` rank columns; the long form has `week` and `rank` as the two reshaped columns.
- **[tidy-selection]:** helpers `starts_with("wk")` ← `you can use starts with for instance will select any column that starts with wk` and `matches("^wk\\d+$")` ← `matches which is a regex ... any column that starts with wk then has numerals after that` to select columns without enumerating.
- **[names-prefix]:** `names_prefix` ← `you can set this names prefix and what this will do is it will tell pivot longer once it makes this names column the prefix is going to be what you see and then ... it will automatically remove that from the names column` — plus type coercion (`names_transform`/`names_ptypes`) to make week integer: `for the names we want the week column to be an integer`.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```r
library(tidyr)

# gather — old interface (source calls it "IDR ... gather" / "key and value ... dot dot after that")
billboard %>% gather(key = "week", value = "rank", wk1, wk2, wk3)  # tedious enumeration

# selections surveyed for gather (and partly for pivot_longer)
billboard %>% gather(key = "week", value = "rank", 4:79)               # "put the number of the column so this for through and ..."
billboard %>% gather(key = "week", value = "rank", -c(1:3))            # "you can also negatively selects columns ... D selecting all the columns we don't want"
billboard %>% gather(key = "week", value = "rank", wk1:wk76)           # "specify the start column and then end column and then it automatically selects all the columns in between"
billboard %>% gather(key = "week", value = "rank", starts_with("wk"))  # "these tidy selection functions ... starts with for instance will select any column that starts with wk"
billboard %>% gather(key = "week", value = "rank", matches("^wk\\d+$"))# "matches which is a regex ... starts with wk then has numerals after that"

# explicit naming (more readable than key/value)
billboard %>% gather(key = "week", value = "rank", wk1:wk76)

# pivot_longer — new interface (single cols argument)
billboard %>% pivot_longer(cols = wk1:wk76)                             # default names_to = "name", values_to = "value"
billboard %>% pivot_longer(cols = wk1:wk76, names_to = "week", values_to = "rank")
billboard %>% pivot_longer(cols = -c(1:3), names_to = "week", values_to = "rank")
billboard %>% pivot_longer(cols = matches("^wk\\d+$"), names_to = "week", values_to = "rank")
billboard_long <- billboard %>% pivot_longer(cols = wk1:wk76,
                                             names_to = "week", values_to = "rank",
                                             names_prefix = "wk",        # "names prefix ... once it makes this names column the prefix ... automatically remove that"
                                             names_transform = list(week = as.integer))  # "for the names we want the week column to be an integer"

# reversing with spread / pivot_wider
billboard_long %>% spread(key = week, value = rank)                     # "pretty simplistic you just tell it those two column names"
billboard_long %>% spread(key = week, value = rank, sep = "_")          # "using a separator ... it will take the name ... adding ... week underscore"
billboard_long %>% spread(key = week, value = rank, sep = "")           # "if you put a string but with nothing in it then it ... will still combine them but it won't separator"
billboard_long %>% pivot_wider(names_from = week, values_from = rank)
billboard_long %>% pivot_wider(names_from = week, values_from = rank, names_prefix = "wk")
# multi-column remark (not deep-dived): pivot_* can take vectors names_to/values_to with names_ptypes/values_ptypes to avoid coercion to character
```
