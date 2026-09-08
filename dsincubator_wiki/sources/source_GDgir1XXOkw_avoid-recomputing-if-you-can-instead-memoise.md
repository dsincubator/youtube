---
type: source
title: "Avoid recomputing if you can! Instead memoise"
source_file: "GDgir1XXOkw_avoid-recomputing-if-you-can-instead-memoise.md"
video_id: "GDgir1XXOkw"
url: "https://www.youtube.com/watch?v=GDgir1XXOkw"
lang: en
tags: ["ds-incubator", "memoisation"]
key_topics: ["memoisation", "caching", "performance"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=GDgir1XXOkw"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2024-06-06T00:00:00Z"
    usage_count: 43
usage_window: { from: "2024-06-06T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Avoid recomputing if you can! Instead memoise

## Summary

A short tip on speeding up programs by caching expensive function calls and returning the cached result when the same inputs recur. The speaker illustrates memoisation with a deliberately slow function `f` that simply sleeps for a given number of seconds. Timing the first call `f(3)` takes about three seconds and a second identical call takes another three seconds, showing the cost of recomputation.

The fix demonstrated is `memoise::memoise()`: wrapping `f` into a memoised version `fm` leaves the first call at the full cost but subsequent calls with exactly the same arguments return virtually instantly by retrieving the stored result instead of recomputing. The video points to Wikipedia for the concept and emphasizes how large an improvement a single wrapper call provides.

## Key Concepts & Tools Taught

- **[memoisation]:** storing the result of a function call keyed by its inputs and returning the stored value on later identical calls, as described on Wikipedia.
- **[caching]:** the speed-up mechanism: after the first computation, later calls with the same arguments are served from cache with near-zero elapsed time.
- **[performance]:** measuring elapsed time with `system.time` to show the three-second cost of `f(3)` and the near-instant cost of `fm(3)` on repeat.

## Code Snippets & Formulas

Spoken calls dictated live (mangled caption fragments normalized here):

```r
# Slow toy function
# "say that I have a function f that that's something you know that is pretty slow so in this case that slow thing is just calling system sleep"
f <- function(x) {
  Sys.sleep(x)  # "system sleep for whatever time you want" — system sleep ← system sleep
  x
}

# Timing the cost
system.time(f(3))   # "let's do a call that would take three seconds ... it takes three seconds" — system time ← system time
# second identical call also ~3s — "call the same function with the same argument one more time well unfortunately we have to wait another 3 seconds"
system.time(f(3))

# Memoised version
# "you call the function memorize in the package memorize and you create a modified version" — memorize ← memorize
library(memoise)           # "package memorize" — memoise ← memorize
fm <- memoise(f)           # "you memorize that function" — memoise ← memorize

system.time(fm(3))  # first call still ~3s — "when you call it the first time it's going to take still the three seconds"
system.time(fm(3))  # cached — "if I call now FM which is the memoized version ... you see how ... it virtually takes no time" — FM ← FM
# "the result is not being recomputed instead is being retrieved from the cach" — retrieved from the cach ← retrieved from the cach
```
