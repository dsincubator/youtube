---
type: source
title: "Suggest/commit changes directly on a GitHub PR"
source_file: "ciJpIWs3t3k_suggest-commit-changes-directly-on-a-github-pr.md"
video_id: "ciJpIWs3t3k"
url: "https://www.youtube.com/watch?v=ciJpIWs3t3k"
lang: en
tags: ["ds-incubator", "github"]
key_topics: ["github-pr-suggestions", "batch-suggestions", "code-review-workflow"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=ciJpIWs3t3k"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 7007
    last_modified: "2024-06-04T00:00:00Z"
usage_window: { from: "2024-06-04T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Suggest/commit changes directly on a GitHub PR

## Summary

The tip demonstrates GitHub's suggested-changes feature for reviewing pull requests more quickly. When a reviewer selects one or more lines to comment on, a small icon appears; clicking it inserts a fenced code block with the `suggestion` label that encodes the diff (red = before, green = after). The author shows this menu and notes the recipient can then either "commit the suggestion directly" with a single commit or "add a suggestion to a batch" so multiple suggested changes are collected into one commit.

The key shortcut taught is that the icon is not required: typing the fence manually in any PR comment — three backticks followed by `suggestion` — creates the same interactive suggestion interface. From there the reviewer can choose to start a review to accumulate several suggestions, or add the suggestion as a single comment, both flowing through the standard Commit suggestion / Add to batch workflow.

## Key Concepts & Tools Taught

- **[github-pr-suggestions]:** Using the `suggestion` fenced code block on a GitHub pull request to propose a line-level change with before/after diff; invoked via the comment toolbar icon or by manually typing the fence.
- **[batch-suggestions]:** Collecting several suggestions with "Add suggestion to batch" and applying them together in one commit, versus "Commit suggestion" for a single change.
- **[code-review-workflow]:** The choice to "start a review" when intending multiple suggestions or "add this as a single comment" for isolated changes.

## Code Snippets & Formulas

Spoken interface actions dictated live (caption-mangled, normalized here):

```markdown
# Via the UI icon (easily missed) on selected lines → inserts suggestion block
# Manual equivalent — no icon needed:
```suggestion
# line in red is what it was before and then that line in green is what it is now
replacement line(s) here
```  # "you can type you know backtick backtick backtick suggestion and then create that type of Chunk"
```

Reviewer options quoted: "commit the suggestion directly" and "add a suggestion to a batch that will be then used to put multiple changes into a single comment"; "start a review if you think you're going to make more suggestions or add this as a single comment".
