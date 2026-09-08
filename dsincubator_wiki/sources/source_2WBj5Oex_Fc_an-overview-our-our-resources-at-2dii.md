---
type: source
title: "An overview our our resources at 2dii"
source_file: "2WBj5Oex_Fc_an-overview-our-our-resources-at-2dii.md"
video_id: "2WBj5Oex_Fc"
url: "https://www.youtube.com/watch?v=2WBj5Oex_Fc"
lang: en
tags: ["ds-incubator", "dropbox", "github-issues", "github", "r-packages"]
key_topics: ["dropbox", "github-issues", "rstudio-cloud", "r-packages", "coding-channel"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=2WBj5Oex_Fc"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 8
    last_modified: "2020-01-28T00:00:00Z"
usage_window: { from: "2020-01-28T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# An overview our our resources at 2dii

## Summary

The session surveys lesser-known resources available to staff at 2 Degrees Investing Initiative, presented as a walkthrough of existing infrastructure rather than a deep technical dive. It opens with the data-science-incubator book/website—a short-link e-book containing all lessons and slides sorted by date, with a Discourse comment section for feedback—framed as reusable infrastructure for any team's documentation that could be turned into a book with commenting.

The second block demonstrates RStudio Cloud (our studio dot cloud) as a free, isolated R environment for sharing reproducible work. The presenter shows a workspace owned by the incubator where new projects get a container preinstalled with tidyverse and dev tools, so attendees can `library(tidyverse)` without local installation friction and share a link that guarantees identical package versions via the project snapshot.

The final sections cover collaboration hygiene: the active coding channel (preferred over direct messages for discoverability), the resources repository where GitHub issues are labeled and filterable (e.g., best-practices label), the proposed-topics board where meetup ideas are voted with +1 emoji, a book chapter collecting common pitfalls when moving from scripts to R packages (especially global-environment assumptions), and the umbrella r2dii package family whose reference section has a search box for functions like Dropbox helpers that resolve local Dropbox paths for transitioning projects away from magic-path folders.

## Key Concepts & Tools Taught

- **[dropbox]:** Handling the local 2DII Dropbox folder and building portable paths to datasets, searchable in the r2dii reference site by typing "Dropbox" to find helpers that map local Dropbox directories without hard-coded absolute paths.
- **[github-issues]:** The resources repository—GitHub issues labeled by topic (e.g., best practices) for filtering and exploring prior resources, exemplified by a post by Alex labeled and browsable via label clicks.
- **[rstudio-cloud]:** RStudio Cloud (caption "our studio dot cloud" ← normalized `RStudio Cloud`) workspaces, base projects that spawn isolated containers with tidyverse/devtools preinstalled and shareable via URL, with permission tiers (viewer vs contributor) controlling who can modify the base image.
- **[r-packages]:** r2dii package family as an umbrella project bundling many packages, with a searchable reference section for discovering functions by keyword and viewing usage examples.
- **[coding-channel]:** The coding Slack channel (caption "coating chalid kernel" / "decoding channel" / "calling channel" ← normalized `coding channel`) as the primary venue for Q&A, preferred over DMs so solutions are searchable and reusable.

## Code Snippets & Formulas

Caption-mangled, normalized here (quote-to-name):

```r
library(tidyverse)   # "library tiny wares" / "tiny verse" — tidyverse (caption: "if i do library tiny wares for example")
library(devtools)    # "their tools" / "tech tools" / "tiny tools" — devtools/det tools helpers (caption: "all the packages that come with the installation of tech tools")
# Search in r2dii reference: type "Dropbox" in search box (caption: "you can type the function name or anything were like for example Dropbox ... if she act easily access directories in your local copy of the to dii Dropbox folder")
# Workspace sharing: copy RStudio Cloud project URL (caption: "just by copying the link to the project that you are at ... copying the link and sharing that with someone")
```

No additional verbatim function calls were dictated; the r2dii Dropbox helper name was described but not spelled in captions, so not listed as a named function.
