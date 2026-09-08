---
type: source
title: "Watch out for type inconsistent code"
source_file: "o9ZHNEl8UI8_watch-out-for-type-inconsistent-code.md"
video_id: "o9ZHNEl8UI8"
url: "https://www.youtube.com/watch?v=o9ZHNEl8UI8"
lang: en
tags: ["ds-incubator", "r-packages"]
key_topics: ["type-stability", "coercion-hierarchy", "vctrs-vec-c", "factors-and-dates", "vector-recycling"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=o9ZHNEl8UI8"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 17
    last_modified: "2020-03-03T00:00:00Z"
usage_window: { from: "2020-03-03T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Watch out for type inconsistent code

## Summary

Framed as a practical follow-up to Hadley Wickham's talk on type consistency, the meetup screens that talk and then discusses its implications. The motivating "WAT" examples show surprising base-R coercions: `c()` combining two factors (e.g., `factor("A")` and `factor("B")`) yields an integer vector `c(1,2)`, combining a `Date` with a `POSIXct` date-time produces a far-future or 1969 date, concatenating a factor with `NULL` drops attributes, and combining doubles with characters falls back in non-obvious ways — all accidents of history rather than intentional design. Similar pitfalls appear with `tibble`/`tidyverse` combinations where binding heterogeneous types can silently diverge. To remedy this, the vctrs package proposes a coherent, explicit coercion system: atomic vectors follow a simple hierarchy `logical → integer → double → character` visualizable as a linear tree where the output type is the first common ancestor (commutative, order-independent, symmetric), while richer s3 vectors (factors, dates, date-times, data frames) extend this into a forest where many pairs have no common parent and therefore error unless the user explicitly declares the desired prototype (`ptype`). The demo shows `vctrs::vec_c()` mirroring base `c()` but enforcing these rules: `vec_c(TRUE, 1L) → integer`, `vec_c(1L, 1.5) → double`, `vec_c(1.5, "a", ptype = character()) → character` via explicit cast, `vec_c(factor("a"), factor("b"))` order-sensitive for levels (`a,b` vs `b,a`) and `vec_c(factor("a"), factor("a", levels="b"))` errors, and cross-type mixes like `factor` + `double` or `Date` + `POSIXct` now error with an invitation to fall back to `list` as an explicit escape hatch (`ptype = list()`). Three principles of type stability are articulated: output type depends only on input types (violated by base `ifelse()` where the logical condition's values change whether the result is double or character, versus strict `dplyr::if_else()` requiring typed `NA`), argument order should not affect the type (symmetry of the hierarchy table), and a single consistent rule set should apply everywhere (contrasting `c()` → integer for factors versus `unlist()` → factor). The discussion closes with pragmatic guidance: package developers should adopt `vctrs` for robust internal contracts (end users need not call it directly), analysts should add an explicit final coercion (`as.character()`) to the expected type and beware of hidden coercion during binding and vector recycling (e.g., adding a length-3 integer to a length-2 vector recycles the shorter one), treating `NA` variants (`NA_logical`, `NA_integer`, `NA_real`, `NA_character`) as distinct typed values.

## Key Concepts & Tools Taught

- **[type-stability]:** Principle that output type depends solely on input types, and that naively guessing output while reading code should be easy; violated by `ifelse()`-style value-dependent return types (caption "type stability ... output type should only depend on the types of eating").
- **[coercion-hierarchy]:** Linear tree `logical → integer → double → character` where combining two atomics walks to their nearest common ancestor; forms a symmetric table and illustrated as following arrows to a single meet point.
- **[vctrs-vec-c]:** `vctrs::vec_c()` (caption "victors package ... convict underscore C" → normalized `vctrs::vec_c()`, "basically the same there's a C function you're familiar with from base ah but amazes consistency") enforcing the hierarchy with explicit `ptype` prototype escape hatch (`ptype = character()`, `ptype = list()`).
- **[factors-and-dates]:** Forest extension for non-atomic S3 vectors where coercions between e.g. `factor` ↔ `double` or `Date` ↔ `POSIXct` deliberately do not exist and instead error, forcing confrontation with mixed types (caption "cannot put your finger on facta and double and find any way to go to screen ... does not ... makes sense to combine a bad day and a date-time together ... much they became error").
- **[vector-recycling]:** Automatic repetition of the shorter vector when operating on unequal lengths (caption "recycling of vectors ... if you add a vector ... one is three elements long and one is two elements long ... will be repeated until it's enough to fill up the vector"), noted as convenient yet dangerous alongside coercion.

## Code Snippets & Formulas

```r
# Base surprising coercions (caption examples)
c(factor("A"), factor("B"))  # yields integer 1,2 (hope A,B → get 1,2)
c(as.Date("2020-01-01"), as.POSIXct("2020-01-01 12:00:00"))  # far future / 1969 dates (caption "Year 4,200,000 1097 ... weird date and 1969")
c(Sys.time(), NULL)  # loses / moves attribute
c(1.5, "a") # base coerces silently to character

# vctrs hierarchy (caption "logical logical you get logical ... double on a character you get a character ... submit / symmetry ... tree with no branches")
# logical -> integer -> double -> character
library(vctrs)

# vec_c enforces symmetric hierarchy (caption "victors package loads ... convict underscore C")
vec_c(TRUE, 1L)          # logical + integer -> integer
vec_c(1L, 1.5)            # integer + double -> double
vec_c(1.5, "a")           # double + character -> error (strict)
vec_c(1.5, "a", .ptype = character())  # explicit ptype escape hatch: "say actually I want the output to be a prototype this character type ... empty character" -> character

# Factors retain levels order-sensitively; different levels error
vec_c(factor("a", levels = c("a","b")), factor("b", levels = c("a","b"))) # levels a then B vs b then a (caption "liberals are a and then B if I combine be denied")
vec_c(factor("a"), factor("a", levels = "b"))  # error
vec_c(factor("a"), 1.5)                         # error: "cannot put your finger on facta and double"

# Dates / date-times
vec_c(as.Date("2020-01-01"), as.POSIXct("2020-01-01"))  # error by default (caption "much they became error ... have to confront ... weird data types")
vec_c(as.Date("2020-01-01"), as.POSIXct("2020-01-01"), .ptype = list())  # explicit fallback to list (caption "always fall back to a list because a list of not they anything else")

# Type instability violation: base ifelse vs strict dplyr::if_else
ifelse(c(TRUE, FALSE), 1L, "a")       # value-dependent return: double or character (violates stability)
dplyr::if_else(c(TRUE, FALSE), 1L, NA_integer_)  # requires typed NA: NA_logical, NA_integer, NA_real, NA_character (caption "know about all these different types of missing values ... NA")

# Recycling (caption "recycling of vectors ... two element vector will be repeated")
c(1L, 2L, 3L) + c(1L, 2L)  # length 3 + length 2 -> recycles to length 3

# Pragmatic guard for analysts (discussion takeaway)
x <- dplyr::pull(df, col)
as.character(x)  # explicit final coercion to expected type (caption "add a steps where you could coerce it ... calling as character")
```
