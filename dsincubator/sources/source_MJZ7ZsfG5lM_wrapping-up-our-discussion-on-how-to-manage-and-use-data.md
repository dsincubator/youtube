---
type: source
title: "Wrapping up our discussion on how to manage and use data"
source_file: "MJZ7ZsfG5lM_wrapping-up-our-discussion-on-how-to-manage-and-use-data.md"
video_id: "MJZ7ZsfG5lM"
url: "https://www.youtube.com/watch?v=MJZ7ZsfG5lM"
lang: en
tags: ["ds-incubator", "dropbox", "databases", "pins", "workflow"]
key_topics: ["cache", "dropbox-vs-pins", "azure-remote", "offline-access", "computed-results-cache", "tidyverse-workflow"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=MJZ7ZsfG5lM"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 6
    last_modified: "2020-05-26T00:00:00Z"
usage_window: { from: "2020-05-26T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# Wrapping up our discussion on how to manage and use data

## Summary

This session wraps up the data-management series by defining what a **cache** is and comparing the current Dropbox-based workflow with a **pins** + Azure-based smart-cache alternative. The speaker defines a cache as a hardware or software component that stores data so future requests can be served faster — either a copy of data that lives elsewhere closer to analysis scripts or the result of an earlier expensive computation. Framed against the tidyverse data-science loop (import → tidy → transform → model → visualize → communicate), intermediate results are often saved manually to Dropbox or locally. Dropbox is described as a low-tech cache: it has a local and remote copy but provides no automatic logic to fetch from the local cache when offline or when the remote is faster. **pins** is presented as a tuned alternative that automatically creates a local cache and decides whether to fetch from Azure (the remote) or the local cache. The session includes a three-question formative assessment (faster than recomputing? faster than remote? slower but offline?), a discussion that a lazy database query can be faster than a local cache, Alex's point that caching computed results is more useful than caching the raw master table, and practicalities of cache management.

The discussion cautions that indiscriminate caching can duplicate storage — e.g., caching a 5-terabyte source plus three 1.5-terabyte filtered copies doubles the original size, mirroring the gigantic Dropbox folder many users accumulate — and covers that the cache is just a folder (`~/.cache/pins`) persisting across restarts, inspectable by size and last access, with proposals for tooling to prune data not used in six months and easy RStudio Cloud project refresh for the time-stamped flat-file demo.

## Key Concepts & Tools Taught

- **cache**: In computing a hardware or software component that stores data so future requests for that data can be served faster; the data may be the result of an earlier computation or a copy of data stored elsewhere.
- **tidyverse-workflow**: Analyst tasks from the tidyverse model — import, tidy (reshape), iterative transform/model/visualize loop, then communicate; at any step you may need to store a modified version or a closer copy, which a cache does in a fancier way.
- **dropbox-vs-pins**: **Dropbox** as manual low-tech cache with local + remote copies but no smart fallback logic (if offline, no automatic local read); **pins** as tuned system that knows where data lives remotely and automatically creates/uses a local cache.
- **azure-remote**: Azure as the remote side for shared data; pins pulls from Azure to local computer quickly and decides per-request whether to use Azure or the local cache.
- **offline-access**: With a local cache you can work offline even if the remote source is unavailable — equivalent to having Dropbox synced locally but with automatic routing.
- **computed-results-cache**: Having a cache of the original dataset is less useful than having a cache of computed results; long-running intermediate computations benefit most from caching, while a filtered aggregate may be cheaper to recompute in the database via lazy query than to cache massively duplicated files.
- **cache-management**: The cache is just a folder on your computer (hidden `.cache/pins` inside the home/server path); you can list, arrange by size and last access, and prune (e.g., remove everything not used in six months, smart sync/unsync analogy); persists across sessions and restarts.


## Code Snippets & Formulas

No executable R code dictated verbatim; concepts described in prose with mangled caption forms preserved:

```r
# cache definition (verbatim caption fragments)
# "in computing a cash is either a hardware or a software component that stores data so that future requests for that data can be served faster"  # cash <- cache
# "the data stored in the cache might be the result of an earlier computation or a copy of data store as well is elsewhere"  # copy elsewhere

# Dropbox vs pins routing (mangled)
# "pins will decide if it's gonna get it from Missouri or from the local cache"  # Missouri <- Azure / remote
# "pins package making sure that it's really locally stored"  # pins <- pins (caption "pins" correct)

# Cache location (shown on slide)
# "~/.cache/pins"  # folder called cache it starts with a dot which is just hides that folder ... and then there is another folder called pins and inside there is a bunch of that
# C:\Users\<name>\...\.cache\pins  # local folder on the server example

# Lazy DB note
# "you may query a database lazily meaning that you don't compute anything and you may access just like a few of the first few rows of data set that exist on the database"  # lazy query may be faster than local cache
```

