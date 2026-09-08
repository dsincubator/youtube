---
type: source
title: "gh  repo create and gh browse to create and browse a GitHub repo from the terminal"
source_file: "q-hsaxVA1kc_gh-repo-create-and-gh-browse-to-create-and-browse-a-github-repo-from-the-terminal.md"
video_id: "q-hsaxVA1kc"
url: "https://www.youtube.com/watch?v=q-hsaxVA1kc"
lang: en
tags: ["ds-incubator", "github", "terminal"]
key_topics: ["gh-repo-create", "gh-browse", "github-cli", "terminal-git-status"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=q-hsaxVA1kc"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 357
    last_modified: "2024-07-03T00:00:00Z"
usage_window: { from: "2024-07-03T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# gh  repo create and gh browse to create and browse a GitHub repo from the terminal

## Summary

In a brief 1-minute demo, the speaker shows how to create a GitHub repository from the terminal with the GitHub CLI (`gh`). Starting from a local directory that already has a commit (visible via `git status` and `git log`) but is not yet on GitHub (no remote), the speaker consults `gh` documentation and runs `gh repo create --source=. --public`. The command completes in a few seconds and creates the remote repository, after which `gh browse` is used to open the repository page in the web browser, confirming its existence even before a `README` makes it visually appealing.

## Key Concepts & Tools Taught

- **[gh-repo-create]:** Creating a remote repo from a local directory with `gh repo create` (caption "GH CLI ... GH re create and typically you have to say where is the source ... with minus minus Source Dot and you have to say if it's going to be public or private").
- **[gh-browse]:** Opening the just-created repo on GitHub from the terminal (caption "I can do now GH browse to go to GitHub and and there it is").
- **[github-cli]:** General reference to the `gh` CLI documentation used to discover the commands (caption "here is the documentation ... GH CLI which I have been using a lot").
- **[terminal-git-status]:** Verifying local state with `git status` showing something to commit and `git log` showing an existing commit before pushing (caption "it's status shows that there's something to commit and if I do a little log ... I do have a CIT so ... this repo is not on GitHub yet").

## Code Snippets & Formulas

```bash
# Inside a local git repository with at least one commit, no remote yet
git status   # caption "status shows that there's something to commit"
git log --oneline  # caption "if I do a little log ... I do have a CIT"

# Create remote repository from current directory
gh repo create --source=. --public   # caption "GH re create ... minus minus Source Dot ... public or private"
# alternatives: --private, --source=. , --public

# Browse to the newly created repository
gh browse  # caption "GH browse to go to GitHub and and there it is"
```
