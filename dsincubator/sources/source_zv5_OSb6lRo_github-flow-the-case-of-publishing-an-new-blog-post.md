---
type: source
title: "GitHub flow: The case of publishing an new blog post"
source_file: "zv5_OSb6lRo_github-flow-the-case-of-publishing-an-new-blog-post.md"
video_id: "zv5_OSb6lRo"
url: "https://www.youtube.com/watch?v=zv5_OSb6lRo"
lang: en
tags: ["ds-incubator", "github", "pull-requests", "git", "workflow"]
key_topics: ["github-flow", "pull-requests", "branching", "code-review-conversation", "merging"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=zv5_OSb6lRo"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 24
    last_modified: "2020-07-28T00:00:00Z"
usage_window: { from: "2020-07-28T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# GitHub flow: The case of publishing an new blog post

## Summary

A focused revisit of the **GitHub flow** timed before a tidyverse workshop where the flow will be practiced heavily. The deeper motivation is to lower the barrier for contributing **blog posts** to the data-science blog (which already has posts by Jakub and Vincent) and to show how the flow can serve intra-team communication (category pages like `packed analysis` / `scenarios`). The session is presented as both a live exercise and a conceptual breakdown, with a Google Doc roadmap, a four-minute GitHub video, and the presenter's offer to help turn a toy exercise into a real post.

**Live exercise (five minutes, GitHub UI only):** Participants go to the blog (`2020 07 28 dsi`), click the **GitHub icon (top-right)** that links to the source repository (`2DegreesInvesting/ds-incubator`-adjacent blog repo), then `Add file → Create new file` (path `/posts` mentioned but any change suffices — even an empty file — to open a conversation). File is named e.g., `my new post` / `mauro's boss` (caption "I'm going to type something silly like my new post ... mauro's boss so I invite you to do same" ← `Add file`), with sample content `the cool stuff is about to come` (caption "the cool stuff is about to come" ← file body). Scrolling to the bottom, the commit interface offers two radio options; as an Owner the presenter can commit directly to `master`, but instructions emphasize choosing **`Create a new branch for this commit and start a pull request`** (caption "instead of leaving this option set here you just click here on create a new branch for this commit and start a pull request ... where we are embracing this special flavor ... called the git flow" ← `Create a new branch ... and start a pull request`) and naming the branch (e.g., `mauro's-new-post`). Clicking **`Propose new file` / `Commit new file`** lands on the **Open a pull request** screen where an optional comment like `hey I have an idea ... I want to discuss` can be added; then **`Create pull request`** opens the PR. The maintainer (`mauro` / `jackson`) receives an email and the PR appears under `Pull requests`.

**Review workflow:** As a reviewer, navigating to `Pull requests` → selecting a PR (e.g., `jakob`, `daisy`) → tabs `Conversation` and `Files changed` ("I go to the um files change tab so that ... big pull request tab has subtabs conversation ... files changed that shows me what files have changed" ← `Files changed`) allows inline comments like `sounds great could you please do blah` and threaded discussion until ready; publishing corresponds to **`Merge pull request`** into `master`, which exposes the post on the website (caption "when we all agree ... we passed ... spell check and style guide ... then we manage that pull request and that merging process ... now suddenly becomes exposed and everyone else ... sees that public manifestation" ← `Merge`).

**Formal breakdown via diagram & video:** The diagram shows **branch creation** (fork icon → alternate timeline), **add commits** (snapshots of progress), **open pull request** (show changes for review/discussion — Melinda can add commits to Vijay's branch), then **discuss & review** and **deploy/merge**. Mapping to blog: `master` is the public website; other branches are half-baked posts not exposed. The GitHub video story (Sam, Vijay, Melinda, Mike, Eddie + Harvester L700 tractors) is mapped: Eddie = contributor with an idea who opens an **Issue** ("open an issue on github issues are discussion threads where people can report bugs request features" ← `Issue`) and later also acts as contributor; Vijay = coder who creates a branch "an alternate timeline where he can safely make changes" (caption "he creates a branch ... alternate timeline" ← `branch`); GitHub tracks snapshots and hosts **pull request discussion** alongside system messages; Melinda adding a commit exemplifies collaborative improvement; merging makes farmers benefit. For the blog, tractor = website.

**Extending & fork nuance:** Becauseorg members have write access, the fork distinction often confuses; if you lack push rights you must fork and the flow "just happens". Recommendation: **never use `master` for work** — always create a branch, even with admin rights, then `Merge`/`Squash and merge` (preserving history choice). The session closes by offering to turn a toy exercise file into a real submission (`reprex`, etc.) and by collecting feedback on whether the recap was needed.

## Key Concepts & Tools Taught

- **[github-flow / github-flow]:** Cycle: create branch → add commits → open pull request → discuss & review (files changed, conversation) → merge/deploy to `master` (website). Emphasis on not committing directly to `master`.
- **[pull-requests / pull-requests]:** Proposal mechanism hosting snapshots + conversation; from GitHub UI path `Add file → Create new file → Create new branch → Propose → Open pull request → Conversation / Files changed`.
- **[branching / branching]:** `Create a new branch for this commit` on GitHub; branch as alternate timeline where changes stay private until merge.
- **[code-review-conversation / code-review-conversation]:** Use of `Conversation`/`Files changed` tabs for threaded feedback, suggestions, style checks; deployment only after approval.
- **[merging / merging]:** `Merge pull request` (or `Squash and merge`) integrating the branch into `master` and publishing.

## Code Snippets & Formulas

Primary workflow is UI-driven (no terminal code in this exercise); GitHub UI paths with caption quotes:

```bash
# GitHub UI flow (no terminal, but quoted)
# "click here on this github icon on the top right I'm gonna make this my screen a little bigger you could navigate quickly to the github repository that hosts the source code" ← GitHub icon
# "post are inside this folder called posts but for you to submit your pull request you can change absolutely anything ... just to open a conversation" ← posts folder may change (but not required)
# Add file → Create new file → type "my new post" / "mauro's boss"  # "I'm going to type something silly like my new post ... mauro's boss" ← Add file
# Body: "the cool stuff is about to come"  # ← body
# Scroll → "Create a new branch for this commit and start a pull request"  # "instead of leaving this option set here you just click here on create a new branch for this commit and start a pull request" ← Create a new branch
# Branch name: "mauro's-new-post"  # ← branch name
# Propose new file → "hey I have an idea of course that I want to discuss"  # ← PR description
# Create pull request  # lands on PR; maintainer notified via email, appears under Pull requests
# Review: Pull requests → select PR → Files changed / Conversation  # "I go to the um files change tab ... big pull request tab has subtabs conversation ... files changed" ← review tabs
# Discuss: "sounds great could you please do blah"  # ← review comment
# Merge: "Merge pull request" (or Squash and merge) → exposes on website  # "when we all agree ... then we manage that pull request ... now suddenly becomes exposed" ← Merge

# Issue path (video context)
# "open an issue on github issues are discussion threads where people can report bugs request features or even just ask questions" ← Issue
# Branch concept (video)
# "he creates a branch of the code an alternate timeline where he can safely make changes" ← branch

# Local-clone workflow referenced as alternative (not demoed today but expected for workshop)
# git clone <repo> / gh repo clone; git checkout -b <branch>; git add; git commit; git push origin <branch> → PR
```

