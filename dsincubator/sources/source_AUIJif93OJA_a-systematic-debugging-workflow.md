---
type: source
title: "A systematic debugging workflow"
source_file: "AUIJif93OJA_a-systematic-debugging-workflow.md"
video_id: "AUIJif93OJA"
url: "https://www.youtube.com/watch?v=AUIJif93OJA"
lang: en
tags: ["ds-incubator", "r-packages", "debugging", "workflow", "cloud"]
key_topics: ["debugging-workflow", "reproducibility", "reprex", "posit-cloud"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=AUIJif93OJA"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 64
    last_modified: "2024-06-04T00:00:00Z"
usage_window: { from: "2024-06-04T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# A systematic debugging workflow

## Summary

A report arrives as a screenshot with an error, version number, and the function `profile_emissions` from a known package (caption "profile emissions", package "indicator after"). The systematic response is to avoid guessing in a contaminated local session: first locate the function and version on the package reference site and confirm it is the latest, then consider that the reporter's failure may stem from outdated dependencies. The preferred move is to attempt reproduction in a fully fresh, isolated environment — demonstrated with Posit Cloud (posit.cloud) by creating a new RStudio project from scratch.

The reproduction steps are shown live: following the package's installation instructions, trying `devtools` then switching to `pak::pkg_install()` (caption "pack pack") when toolchain requirements appear, installing rapidly, creating a new file, running `library(indicator)` (caption "indicator after"), and pasting the help example for `profile_emissions`. Auxiliary arguments like `seed` and `options` are stripped to keep the example minimal; running this minimal call succeeds and produces output, indicating the reported bug does not reproduce on the latest version with current dependencies. To structure the next conversation, the speaker turns the running code into a shareable reproducible example using the `reprex` package: wrapping the lines in `reprex()` / using the RStudio addin `Render reprex`, which creates both a local HTML URL and markdown code ready to paste into a GitHub gist (`gist.github.com` → new gist `reprex of til indicator after MD`). That gist URL, plus sharing the entire Posit Cloud project (which encapsulates the successful run), becomes the basis for asking the reporter to update dependencies: the suggested reply is essentially "could you try in a fresh environment / do you need to update your packages?"

## Key Concepts & Tools Taught

- **[debugging workflow / debugging-workflow]:** Systematic triage of a bug report: check function, version and reference docs, attempt reproduction in a clean room before changing code.
- **[reproducibility / reproducibility]:** Isolating the bug from local contamination to determine whether the issue is code or environment/dependency version.
- **[reprex]:** R package that wraps runnable code (via `reprex()` or the RStudio addin) to produce a markdown snippet previewable and shareable.
- **[Posit Cloud / posit-cloud]:** Free isolated RStudio environment (`posit cloud`, caption "posit Cloud") — create a new RStudio project from the workspace (`new project` → `new RStudio project` or `from GitHub`) and share the whole project as the execution context.
- **[pak installation / pak]:** Alternative installer `pak::pkg_install()` presented as smarter/quicker than `devtools::install_*`, used to install the package and its dependencies in the fresh environment.
- **[minimal example]:** Stripping `seed`/`options`/`print` noise and focusing on the failing call alone (the `profile_emissions` example) to make the reprex as small as possible.
- **[Gist sharing]:** Creating a `gist` (caption "my gist uh mod.com and create a gist of that ... repx of til indicator after MD") so the markdown output has a URL that can be posted privately or publicly.
- **[dependency update hypothesis]:** When reproduction fails, the next question is whether the reporter needs to update dependencies, rather than assuming a code bug.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```r
# Locate function and version
# "let's look for the function profile emissions in the package that I know" — profile_emissions() in package 'indicator'
# Reference site → reference section → profile emissions — version "latest"

# Fresh environment
# "create a new project ... in posit Cloud ... workspace you go to new project and then you choose new RStudio project"
pak::pkg_install("2DegreesInvesting/indicator")  # "if we don't have the tools here let's see then I would probably install a different package instead so ... I want to do is install pack which is another package"
library(indicator)                                # "library indicator is called indicator after bit of a weird name"
profile_emissions()                               # "function profile emissions ... I see the name of the function that causes the problem ... let's copy that code there and place it here ... just this right this could be enough" — minimal help example
# stripped: seed, options, print handling — "I don't care much about the seat here I don't care about the options um just printing things"

# Make it reproducible
reprex::reprex({ profile_emissions(...) })        # "we can use the package red breakes uh to create a reproducible example ... you call rrex rrex H and if you have multiple lines of code which in this case I do have you just bace everything in in raises" → reprex
# via addin: "once you install the package you will also have here an addin that allows you to highlight the code and um just create repx"
# output: "this will create a file uh with a URL right so this URL is a local URL so it's basically a file inside this system but also what it created is this beautiful uh code that I can paste anywhere for example in a gist"
# Gist: new gist "repx of til indicator after MD" → preview markdown
# Possibly share whole Posit Cloud project: "I can also share the full environment where I noticed that there is no back as far as I can tell"
```
