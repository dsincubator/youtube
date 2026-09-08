---
type: source
title: "https://github.com/2DegreesInvesting/ds-incubator/issues/47"
source_file: "eQ-BFO3eZX8_https-github-com-2degreesinvesting-ds-incubator-issues-47.md"
video_id: "eQ-BFO3eZX8"
url: "https://www.youtube.com/watch?v=eQ-BFO3eZX8"
lang: en
tags: ["ds-incubator", "r-packages", "cloud", "github", "github-issues"]
key_topics: ["distill-blog", "create-blog", "create-post", "build-website", "import-post", "netlify-publishing"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=eQ-BFO3eZX8"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 21
    last_modified: "2020-06-02T00:00:00Z"
usage_window: { from: "2020-06-02T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# https://github.com/2DegreesInvesting/ds-incubator/issues/47

## Summary

Framed as empowering knowledge workers to think by writing ("if you think without writing you only think that you're thinking" — Leslie Lamport), this meetup walks participants through creating and publishing a personal blog with the **`distill`** framework and sharing posts with the 2Degrees organization blog. The delivery uses a collaborative Google Doc ("collaborative document that you're looking at") and an RStudio Cloud project linked from the issue, with participants following along live.

The workflow is demonstrated step by step in RStudio. From the Cloud project directory the speaker runs `distill::create_blog("my blog")` ("create blog so just use that function to create your own blog" — caption also "this still create blog" → `distill::create_blog`; locally achievable via `install.packages("distill")` and the RStudio New Project → Website dialog, but Cloud is preferred today). This scaffolds a new folder containing an RStudio project file (`.Rproj`), `index.Rmd`, `about.Rmd`, and `_posts/`. Opening the `.Rproj` moves the working directory into the blog itself. Building via the Build pane → `Build Website` ("navigate to the tab called build ... hit directly on build website" — note the tab only appears when inside the blog directory) renders the HTML, viewable in the Viewer and expandable to a browser. Participants inspect source-to-output mapping (e.g., editing `index.Rmd` title from "My blog" to "My cool blog" then rebuilding) to build a mental model.

Next, `distill::create_post("My post")` ("function on on the distant package call create post" → `distill::create_post`; shows "a bunch of red colored things" but works) creates a dated folder under `_posts/` with a source `.Rmd` and, after `Build Website`, a rendered `.html`. The crucial YAML header edit `self_contained: true` ("change the parameter self-contained to the value true") is required for portability. Publishing is then shown by exporting the generated `_site` folder (Files → More → Export → `site.zip`) containing all HTML assets, downloading it, and dragging the unzipped folder onto Netlify Drop ("very cool service by Ned leaf" / "Ned leaf ... serves web sites" → Netlify; "just by dragging a bunch of HTML files it serves the block for you") which instantly serves the site at a public URL and renders the post.

The final segment shows how the 2Degrees blog can ingest external content: the speaker copies a published post URL (e.g., Jackson's post) and, from a local checkout of the `ds` blog (`Data Science at 2 Degrees`), runs `distill::import_post(url)` ("gonna use the function we still import post and all I need to do here is to paste a link to the post that I want to import"), answers the licensing prompt affirmatively, previews the imported draft, and rebuilds the organization blog which now lists the imported post at the top alongside existing posts. Questions about importing non-distill/Jekyll sites are discussed, with the advice that any self-contained HTML can be imported and that themes/CSS can be customized.

## Key Concepts & Tools Taught

- **[distill-blog]:** The `distill` R package ("a framework that is called distilled this is just an hour package and it's very well-suited for scientific reports" → `distill`) as a minimalist alternative to heavier site frameworks for scientific blogs.
- **[create-blog]:** `distill::create_blog()` ("create blog so just use that function") — scaffolds a blog folder with `.Rproj`, `index.Rmd`, `about.Rmd`, and `_posts/`; requires being in the parent Cloud Project directory.
- **[create-post]:** `distill::create_post("My post")` ("there is this function on on the distant package call create post" → `create_post`) — creates a new post folder/file under `_posts/` and an HTML draft after building.
- **[build-website]:** RStudio Build pane → Build Website, only available inside the blog project (working directory shows `my blog`), that renders `_site/` from the source `.Rmd` files.
- **[import-post]:** `distill::import_post(url)` ("gonna use the function we still import post") — imports a post by URL into another distill blog (here the 2Degrees blog), prompting for a publishing license, with the requirement that the source post have `self_contained: true`.
- **[netlify-publishing]:** Exporting the `_site` folder (More → Export → `site.zip`) and dragging it to Netlify ("drag that folder that contains all those HTML to a service that can serve a great" → Netlify Drop) to publish.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```r
install.packages("distill")        # "of course install the package this deal with install the packages quote this deal quote" — setup alternative locally
distill::create_blog("my blog")    # "this still create blog and here I'm gonna say ... my blog" / "create blog so just use that function to create your own blog" — creates folder my_blog with .Rproj, index.Rmd, about.Rmd, _posts/
# Project switch: click my_blog.Rproj to move working directory into the blog itself
# Viewer refresh via circular arrow; editing index.Rmd title then rebuilding

distill::create_post("My post")    # "there is this function on on the distant package call create post ... I'm gonna say my post and hit enter" — creates _posts/<date>-my-post/
# YAML requirement for portability:
# self_contained: true   # "change the parameter self-contained to the value true" — in post's YAML header

# Build step (RStudio UI, only inside blog project)
# Build → Build Website  # "go to that tab and hit directly on build website" — renders _site/

# Export & publish (UI)
# Files → select _site → More → Export → site.zip → download → drag folder to Netlify Drop
# "just by dragging a bunch of HTML files it serves the block for you" → https://app.netlify.com/drop (caption: "Ned leaf")

distill::import_post("https://<netlify-url>/posts/my-post/")  # "gonna use the function we still import post and all I need to do here is to paste a link to the post that I want to import" — from 2Degrees blog RStudio instance
# prompt: "have a license to publish this" → answer yes
# then Build Website again to render imported post at top of organization blog
```
