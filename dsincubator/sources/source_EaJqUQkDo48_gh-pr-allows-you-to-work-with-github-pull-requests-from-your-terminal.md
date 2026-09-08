---
type: source
title: "`gh pr` allows you to work with GitHub pull requests from your terminal"
source_file: "EaJqUQkDo48_gh-pr-allows-you-to-work-with-github-pull-requests-from-your-terminal.md"
video_id: "EaJqUQkDo48"
url: "https://www.youtube.com/watch?v=EaJqUQkDo48"
lang: en
tags: ["ds-incubator", "github", "terminal", "pull-requests"]
key_topics: ["gh-cli", "gh-pr-view", "gh-pr-checkout", "gh-pr-merge"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=EaJqUQkDo48"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 549
    last_modified: "2024-07-05T00:00:00Z"
usage_window: { from: "2024-07-05T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# `gh pr` allows you to work with GitHub pull requests from your terminal

## Summary

Short terminal demo (2:43) from RStudio's integrated terminal showing how the GitHub CLI (`gh`) handles pull requests without leaving the terminal. Starting from `gh pr list` revealing PR #118, the speaker shows `gh pr view 118 --web` to open the GitHub diff in a browser ("enjoy the beautiful diff" for the URL change), and `gh pr status` for check status ("give you a little bit more information ... if there is some checks you can see if they're passing or not ... everything is looking good"). For the review step he uses the web UI to inspect `Files changed` then marks review as done.

For merging, two equivalent paths are shown: clicking `Merge` in the GitHub UI versus staying in the terminal. The terminal merge workflow is: `gh pr checkout 118` ("drop you into that Branch after having pulled it from GitHub"), `gh pr checks` ("confirm that everything is looking green") on that branch, then `gh pr merge 118` with merge-strategy flavors — the speaker uses `--squash --delete-branch` ("typically use a squash and I want to delete the branch after it has been merged") and notes `--admin` may be required for protected branches needing admin privileges. The result merges the URL-change branch into `main` and (with `--delete-branch`) removes the feature branch, all operable from any terminal including RStudio's.

## Key Concepts & Tools Taught

- **[gh-cli]:** GitHub CLI `gh` for terminal-driven GitHub workflows; works from any terminal including RStudio's (`gh pr list`, `gh pr status`, `gh pr checks`, `gh pr view`, `gh pr checkout`, `gh pr merge`).
- **[gh-pr-view]:** Inspecting PRs: `gh pr list` (lists PR #118), `gh pr status` (richer check summary), `gh pr view 118 --web` (opens PR #118 diff in browser for review — caption "G PR view 118 on the web browser ... we can go to file changed and see that change corresponds to a change in a URL").
- **[gh-pr-checkout]:** Pulling a PR locally: `gh pr checkout 118` checks out and pulls the PR branch so subsequent `gh pr checks` and `gh pr merge` operate on that branch.
- **[gh-pr-merge]:** Merging with strategy flags: `gh pr merge --squash --delete-branch` (speaker's default: squash commits then delete feature branch), optional `--admin` for repositories requiring admin privileges, alternative is merging via GitHub web UI.

## Code Snippets & Formulas

Spoken terminal calls dictated live (caption-mangled, normalized here):

```bash
gh pr list                           # "GH be list I can see that there is one p request 118" → gh pr list
gh pr status                         # "if there is some checks you can see if they're passing or not — gh pr status and that will give you a little bit more information"
gh pr view 118 --web                  # "G PR view 118 on the web browser ... we can go to file changed and see that change corresponds to a change in a URL"
# review step done in browser, then either web Merge or terminal path:

gh pr checkout 118                    # "PR to count on the number of the pr ... that will give you drop you into that Branch after having pulled it from GitHub"
gh pr checks                         # "from here ... you can also do a GH PR checks to confirm that everything is looking good it's looking green" → gh pr checks
gh pr merge 118 --squash --delete-branch  # "you can do G PR merch and you may have some flavors of merch ... in my case I typically use a squash and I want to delete the branch after it has been merged"
gh pr merge 118 --squash --delete-branch --admin  # "if this repository requires Administration privileges then you may need to do admin as well"
```
