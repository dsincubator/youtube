---
type: source
title: "webdata: Scrapping"
source_file: "sPE6MLGUPy4_webdata-scrapping.md"
video_id: "sPE6MLGUPy4"
url: "https://www.youtube.com/watch?v=sPE6MLGUPy4"
lang: en
tags: ["ds-incubator", "web-scraping", "containers", "r-packages", "apis"]
key_topics: ["web-scraping", "rvest", "polite-package", "selector-gadget", "javascript-rendering"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=sPE6MLGUPy4"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2022-01-18T00:00:00Z"
    usage_count: 32
usage_window: { from: "2022-01-18T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# webdata: Scrapping

## Summary

The second meetup in the webdata series (follow-up to an overview of APIs vs. scraping) dives into web scraping via one real 2DegreesInvesting example shared by CJ. After framing that scraping is a brute-force fallback when no public API exists (“maybe don't even start scraping — if you have a public API that provides the data ... avoid scraping altogether”), the speaker introduces ethics ground rules via the `polite` package website and notes the overhead/unsustainability of scraping across sites.

Technically, the session shows two scrape paths on the same website that lists developed vs. emerging market countries. For a simple table, the speaker uses the Chrome extension SelectorGadget (CSS selectors `td` for the first table, then `#boxes-container 1 li` for developed markets and `#boxes-container 2 li` for emerging after deselecting unwanted headers) to discover the selector, then in R uses `rvest::read_html(url)` impolitely vs. `polite::bow(url)` + `polite::scrape(bow)` politely (the latter consults `robots.txt` and identifies who you are, with rate limiting). Piping to `rvest::html_elements(css)` + `rvest::html_text()` / `html_text2()` extracts the text, demonstrating that what you see in the browser is what you get for this table.

For two colored tables on another page, the naive `read_html` + CSS selector returns `character(0)` because the content is JavaScript-rendered in the browser. The solution uses an out-of-CRAN RStudio headless-browser package (`chromote` / `RSelenium` family, captioned as `chrome oat promote for chrome and remote`) to emulate a browser, render the page, and then apply the same CSS extraction via a helper `scrape_css(url, css, politely=FALSE)` wrapping `bow`/`scrape` vs. `read_html`. The polite attempt fails with the rendered path (discussed by CJ as expected because the function operates on local rendered HTML, not a server request). Takeaways: scraping difficulty depends on the exact data fragment (even within one site), requires per-fragment reverse-engineering and human investment, may break when sites change, and using an API is always preferable; resources include a cognitive tool in progress and an issue to collect useful APIs.

## Key Concepts & Tools Taught

- **[web-scraping]:** Brute-force extraction from websites without an API; framed as the hard, non-scalable path vs. public APIs (ground rule: use API if available).
- **[rvest]:** Hadley Wickham's general web-scraping tool in R: `read_html(url)` to fetch entire page, `html_elements(css)` to focus on the fragment described by CSS, and `html_text()`/`html_text2()` to convert to text; demoed via a helper `scrape_css()` that encapsulates `html → html_elements → html_text`.
- **[polite-package]:** `polite` package implementing polite scraping ethics: three principles (seek permission, take slowly, respect `robots.txt`), with `bow(url)` + `scrape(bow)` as a drop-in polite replacement for `read_html()` that respects `robots.txt` (`robots.txt.txt` in caption) and throttles; demoed impolite vs. polite before extraction.
- **[selector-gadget]:** Chrome extension `SelectorGadget` to interactively discover CSS selectors: click on desired element (e.g., `Canada` or `Brazil`), deselect unwanted yellow highlights, copy selector strings `td`, `li`, `#boxes-container 1 li` (developed) and `#boxes-container 2 li` (emerging) to pass to R.
- **[javascript-rendering]:** Distinction between static HTML (what you see equals what you get via `read_html`) vs. JavaScript-rendered pages where source HTML lacks the data until the browser runs JS (analogy to knitting an R Markdown `mtcars` object: raw HTML shows empty cards, rendered view shows data); handled by a headless-browser package `chromote` ← `chrome oat promote for chrome and remote` (RStudio, not on CRAN, GitHub install) to fake a browser and render before scraping.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```r
library(rvest)   # "we're gonna be using the arvest package which is the general web scraping tool in r written by hadley wickham" (caption: "arvest")
library(polite)  # "also we're going to be using the polite package which is actually recommended by the arvest package if you are scrapping from one website multiple pages"
# library(chromote) # "another package which is not on crime ... by our studio and is called chrome oat promote for chrome and remote" ← chromote / RSelenium family, GitHub install, headless browser

# helpers shown
url <- "https://..."  # URL storing the page with developed-markets table; and second URL for colored tables page
# polite implements "three points ... first seeking permission and before getting any data ... then taking it slowly" and respects "robots.txt.txt" ← robots.txt

# impolite vs polite fetch (before extraction)
html_imp <- read_html(url)           # "the function read underscore html to get the entire page" — impolite
bow_obj <- bow(url)                  # "one that is called bow and then the other one that is called scrape those two functions come from the polite package"
html_pol <- scrape(bow_obj)          # "you simply replace written underscore html by these two and you are doing a polite request"

# extraction once html obtained (caption: "the first function in this pipe html element is focusing just on that extracting that piece of data ... and then is transforming that into a text")
html_imp |> html_elements("td") |> html_text()                # "td that is the description that i need to tell r which of all the information in this page i am interested in getting"
html_imp |> html_elements("#boxes-container 1 li") |> html_text()  # "pound boxes hyphen container having one space li that is the description of this piece of data ... developed market"
html_imp |> html_elements("#boxes-container 2 li") |> html_text()  # container two for emerging markets after clicking Brazil and deselecting technology

# helper wrapping politeness switch (caption: "i decided to wrap that in a little function like i called scrape css ... the magic is this these three lines ... once i have some html then i get the elements that are specified by the css ... and then i convert that to text")
scrape_css <- function(url, css, politely = FALSE) {
  html <- if (politely) bow(url) |> scrape() else read_html(url)
  html |> html_elements(css) |> html_text()
}
developed <- scrape_css(url, "#boxes-container 1 li")  # naive attempt returns character(0) → "i get character zero i get nothing" because JS not rendered

# JS-rendered path via headless browser (caption: "it is using this package from our studio called remote ... is imitating a browser ... and it's going to render the page for me" and line 112 html object now has rendered version)
# chromote / RSelenium block (not on CRAN):
# html <- chromote_render(url)  # "all of this and i do not intend to try explain what all of this is doing ... it is using this package from our studio called remote ... is imitating a browser inside this r session"
# then same extraction works:
# html |> html_elements("#boxes-container 1 li") |> html_text()  # now returns countries
# html |> html_elements("#boxes-container 2 li") |> html_text()  # emerging
```
