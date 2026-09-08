---
type: source
title: "webdata: Using APIs"
source_file: "pCo14eM-KkQ_webdata-using-apis.md"
video_id: "pCo14eM-KkQ"
url: "https://www.youtube.com/watch?v=pCo14eM-KkQ"
lang: en
tags: ["ds-incubator", "apis", "r-packages", "web-scraping", "databases"]
key_topics: ["api-vs-scraping", "httr2-workflow", "imf-api", "package-search", "json-and-purrr-extraction"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=pCo14eM-KkQ"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 78
    last_modified: "2022-01-25T00:00:00Z"
usage_window: { from: "2022-01-25T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# webdata: Using APIs

## Summary

In the third meetup of the web-data series, the speaker argues for preferring APIs over "hardcore" web scraping (time-consuming, fragile, and potentially illegal per site policies, citing the "ethics in web scraping" rule "if you have an api then that's what you should be using") and shows how to discover and use them. After a portfolio of objectives (awareness of APIs, places to search, one end-to-end reproduction of CJ's IMF exchange-rate scraping with a different stack), the talk contrasts two complementary approaches for the same IMF task: a convenience wrapper and a general client. The wrapper `imfr` package exposes a function whose arguments (`database_id = "IFS"`, `indicator = "PCPI_IX"` → `PCPI_IX`, `frequency = "M"` month / "Q" quarter / "A" annual, `start_period`, `end_period`) map directly to API parameters and returns data with minimal knowledge of the underlying REST API, while `httr2` (successor to `httr`, still functional but superseded) is presented as the general-purpose tool for almost any RESTful API. For discovery, three layers are recommended: plain Google (`imf rest api` leads to docs and a blog on using the API with Python/R), a curated public-APIs repository searchable by topics like `finance` or keywords `exchange`/`currency`/`exchange rate`, and R-specific discovery via the `package_search` package (`package_search("imf")`, noting that `imf` alone surfaces `imfr` better than `imfr` as a keyword). The `tidyverse` is used for downstream handling. A caution is added that third-party packages/APIs may be unmaintained or not first-party, so recalculation strictness is valuable. The API anatomy is dissected on the IMF docs: a base URL, a `CompactData` method (caption "compact data is one of the methods documented ... you can think of methods ... functions in r ... think functions that you can use via the web browser"), an endpoint path built from `database_id`/`frequency`/`indicator` (`IFS/M.PCPI_IX`) and query parameters after `?` (`startPeriod=2000`, `endPeriod=2001`). The host documents XML but JSON is observed to work (caption notes documentation asked for XML and that didn't work → JSON did), returned JSON ("ugly to read for humans but beautiful for computers") is a deeply nested list where data live at `dataset → series` → items. The `httr2` pipeline mirrors this: `request(base_url)` creates lightweight request metadata, `req_url_path_append()` and `req_url_query()` extend it, `req_dry_run()` inspects, `req_perform()` executes to get a response, and `resp_body_json()` parses. Navigating the nested list to a data frame uses `purrr`: `pluck(dataset, "CompactData", "Series")` then `map`/`map_chr` to pull fields (`ref_area` two-letter country codes, `time_period`, `obs_value` exchange rate versus base currency). Q&A reaffirms `httr2`'s nicer API design (`req_*` for request objects, `resp_*` for response objects) under Hadley Wickham.

## Key Concepts & Tools Taught

- **[api-vs-scraping]:** Prefer APIs over scraping when available due to reliability, speed and legality (caption "prefer them over ... hardcore web scraping which can be difficult time consuming and also even illegal ... one of the ground rules actually the first one ... if you have an api then that's what you should be using").
- **[httr2-workflow]:** General REST client workflow `request()` → `req_url_*()` → `req_perform()` → `resp_*()` (caption "httr2 package is the start of the show ... relatively new package new iteration over the httr package which yeah it's now superseded but ... still works", "request object ... lightweight ... we keep extending ... appending the url ... when you actually do the request is when you call the request rig perform ... resp object ... manipulate with the rest underscore functions ... prefix ... tells you which input those functions like").
- **[imf-api]:** IMF CompactData method for `IFS` monthly `PCPI_IX` exchange-rate series, with database/frequency/indicator path components and query params `startPeriod`/`endPeriod`, XML vs JSON documentation mismatch (caption "compact data is one of the methods ... database identifier ... for example ifs at frequency ... m for month ... indicator ... p cpi underscore ix ... anything that goes after this question mark is what we call query parameters ... start period ... end period ... json ... format of this data is called json ... documentation was asking me to use xml and that didn't work ... json ... did").
- **[package-search]:** Finding wrapper packages via `package_search` (CRAN) search (caption "package that is called package search which allows us to search for packages on chrome ... you just call the package underscore search function and then pass some keywords ... typing i m f and not on f i m f r did not give the first hit ... two packages that may be useful ... it has a function with arguments that very nicely map to the parameters that the api provides ... function from the imfr package").
- **[json-and-purrr-extraction]:** Transforming nested JSON list into a data frame with `purrr::pluck` and `purrr::map` family (caption "deeply nested little bunch ... getting stuff out of a deeply nested list ... tools from the poor package specifically the plug function is very useful ... we plug the series object inside the dataset object inside the compact data object ... and using the map family ... sometimes just the map function and sometimes the map character to pull little pieces ... ref area ... two letters ... time period and observation ... exchange rate").

## Code Snippets & Formulas

```r
# Discovery
# Google: "imf rest api" → docs + article on API with Python/R
# Public APIs repo: search by topic 'finance' or keyword 'exchange' / 'currency api'
library(package_search)  # caption "package search ... on chrome ... package underscore search"
package_search("imf")
package_search("imfr")

# Convenience wrapper: imfr (caption "imf r package that wraps the api ... it has a function with arguments that very nicely map")
library(imfr)
# imf_data(database = "IFS", indicator = "PCPI_IX", freq = "M", start = 2000, end = 2001)
# frequency: m month, q quarter, a annual (caption "m stands for month ... also a queue that stands for quarter ... a for annual")
# indicators etc must be read from docs; database_id IFS, indicator PCPI_IX (caption "p cpi underscore ix")

# General client: httr2 (successor to httr) (caption "httr2 ... httr ... superseded ... hadley weekend")
library(httr2)
library(purrr)
library(dplyr)

# Build URL: base + CompactData method + database/frequency/indicator + query params
base <- "http://dataservices.imf.org/REST/SDMX_JSON.svc"  # caption "type on the web browser a url that has this format ... base ... all of this"
req <- request(base) |>
  req_url_path_append("CompactData") |>
  req_url_path_append("IFS/M.PCPI_IX") |>   # IFS = database, M = monthly, PCPI_IX = indicator (caption "database identifier ... frequency ... indicator ... p cpi underscore ix")
  req_url_query(startPeriod = 2000, endPeriod = 2001)  # caption "anything that goes after this question mark is what we call query parameters ... start period ... end period"

req_dry_run(req)          # caption "drive run function ... shows ... metadata"
resp <- req_perform(req)  # caption "when you actually do the request is when you call the request rig perform"
resp
resp_body_json(resp) -> j

# Nested JSON -> data frame via purrr (caption "plug the series object inside the dataset object inside the compact data object")
j_list <- resp_body_json(resp, simplifyVector = FALSE)
series <- pluck(j_list, "CompactData", "Dataset", "Series")  # caption "plug function ... series object inside the dataset object inside the compact data object"
# series is list of countries; extract tidily
tibble(
  ref_area = map_chr(series, ~ pluck(.x, "@REF_AREA")),  # two-letter codes (caption "ref area ... two letters symbols")
  data = map(series, ~ pluck(.x, "Obs"))
) |>
  tidyr::unnest(data) |>
  mutate(
    time_period = map_chr(data, ~ pluck(.x, "@TIME_PERIOD")),
    obs_value   = map_chr(data, ~ pluck(.x, "@OBS_VALUE"))  # exchange rate (caption "observation ... exchange rate based on on a base currency")
  )
```

```r
# Note on first-party vs third-party sources (CJ caution in transcript):
# "i always prefer to get stuff directly from a first party source searching for third-party sources ... should always be ... lower priority"
```
