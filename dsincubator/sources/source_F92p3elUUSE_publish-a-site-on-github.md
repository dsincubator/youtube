---
type: source
title: "Publish a site on GitHub"
source_file: "F92p3elUUSE_publish-a-site-on-github.md"
video_id: "F92p3elUUSE"
url: "https://www.youtube.com/watch?v=F92p3elUUSE"
lang: en
tags: ["ds-incubator", "github", "r-packages", "git", "cloud"]
key_topics: ["github-pages", "distill", "git-config", "r-markdown"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=F92p3elUUSE"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2020-06-09T00:00:00Z"
    usage_count: 19
usage_window: { from: "2020-06-09T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Publish a site on GitHub

## Summary

Follow-up to a distill blog-building session, this meetup shows how to publish a site on GitHub Pages. The presenter distinguishes two cases: a site for a single repository and a site for an entire user or organization. For a repository site, the flow is create a public repo (example `CV` / `resume`), go to Settings → GitHub Pages, choose a theme such as Minimal, and commit an `index.md` file whose rendered theme immediately publishes at `username.github.io/repo`.

For a user/org site, the repository must be named exactly `username.github.io` (e.g., `malreaux-libre.github.io` pattern shown) and then populated as a full distill blog. The demo moves to RStudio Cloud to reuse installed packages: configure Git identity with `git config --global user.name` and `git config --global user.email` (the email must match the GitHub profile), clone the empty `username.github.io` repo with `git clone`, create the blog inside that folder with `distill::create_blog()` (the presenter pastes the call that references the cloned repo path), and then apply two GitHub Pages-specific tricks that differ from the earlier blog build: set the site output directory to the repository root and add an empty `.nojekyll` file at the blog root to bypass the default Jekyll processing, revealing it via Show hidden files.

The site is built by opening the `.Rproj`, using the Build pane → Build Website, then selecting all changed files in the Git pane, committing (e.g., "build site") and pushing with username and password/token, after which the content is live at `username.github.io` without a repo suffix. The session notes that private repos still produce a public site, and flags that two-factor authentication complicates the username/password push flow and requires SSH keys or a personal access token with a longer setup.

## Key Concepts & Tools Taught

- **[github-pages]:** GitHub's static-site hosting; repository sites live at `username.github.io/repo` and user/org sites at `username.github.io` when the repo name matches exactly.
- **[distill]:** R package used to scaffold a blog inside the cloned Pages repository, whose rendered `index.html` becomes the site entry point.
- **[git-config]:** telling Git who you are before the first push, by setting the global user name and the email associated with the GitHub profile.
- **[r-markdown]:** underlying authoring format for pages and posts (`index.md` / `index.Rmd`) rendered through the distill site build; the published `index.html` is what browsers serve.
- **[jekyll-bypass]:** GitHub Pages uses Jekyll by default, so Pages sites built with distill need a `.nojekyll` file to tell Pages not to use Jekyll and to serve the site as-is.

## Code Snippets & Formulas

Spoken terminal and R calls dictated live (mangled caption fragments normalized here):

```r
# GitHub Pages — repo site URL pattern
# "the format ... is your username ... dot github dot IO and then slash and the name of the repo" — username.github.io/repo ← "dot github dot IO"

# Tell Git who you are (RStudio Cloud terminal)
# "we're gonna give it global options so you say - - global ... user dot name" — git config ← "git comfy ... - - global"
git config --global user.name "mauro lepore"   # "my user name is mobile a bullet"
git config --global user.email "mauro@example.com"  # "has to be the email that is associated to your profile"

# Verify config
git config --global user.name    # "if I ask it to give me what's the global user name then you should know who I am"
git config --global user.email

# Clone the Pages repo
git clone https://github.com/username/username.github.io.git  # "we can give it to get by saying deep clone this rebel" — git clone ← deep clone

# Create distill blog inside the cloned folder (run in R, parent directory of the repo)
# "what I'm pasting here is exactly what ... so in my case is ... I'm going to create a blog inside there"
distill::create_blog(dir = "username.github.io")  # "this still will put stuff inside this folder" — create_blog ← create a blog

# GitHub Pages tricks — edit _site.yml and add .nojekyll
# "you want to change where it says output directory instead of creating the site ... you wanted to create it at the root of your blog folder so you say dot"
output_dir: "."   # in _site.yml — output directory ← output directory
# "we also need to create a new file that will tell it have to not use the default framework called Jacob so do not use Jacob" — .nojekyll ← Jacob
# File: .nojekyll (empty) at the blog root — "you need to call it dot no check here this way" — .nojekyll ← dot no check

# Build the site (RStudio Build pane)
# "go to build ... build website so you click there you should see ... your blog built" — Build Website ← build website

# Commit and push from the IDE
git add .
git commit -m "build site"  # "I can say something like build site commit and then close"
git push  # "it's going to ask for my username ... and for my password" — push
```
