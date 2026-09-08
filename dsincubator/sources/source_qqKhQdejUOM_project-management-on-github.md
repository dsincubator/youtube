---
type: source
title: "Project management on GitHub"
source_file: "qqKhQdejUOM_project-management-on-github.md"
video_id: "qqKhQdejUOM"
url: "https://www.youtube.com/watch?v=qqKhQdejUOM"
lang: en
tags: ["ds-incubator", "github-issues", "github", "pull-requests", "dropbox"]
key_topics: ["github-projects", "backlog", "kanban-board", "milestones", "iteration-field"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=qqKhQdejUOM"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2022-08-23T00:00:00Z"
    usage_count: 8727
usage_window: { from: "2022-08-23T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Project management on GitHub

## Summary

The meetup teaches project management with GitHub Projects, aimed at project managers (who may not write code) and analysts/developers, with the premise that if code already lives on GitHub, managing the project there avoids extra tools and keeps overhead low. Using a demo organization (`an org`, described as a collection of folders like a Dropbox account) and a project named `lit` (Lithuania companies data from yellow pages), the speaker shows creating a GitHub Project from scratch via the Projects tab → green button → choose Table or Board vs. templates, renaming the title, and adding work items.

A table view is used to import existing work: `Add items from repositories` pulls issues and pull requests from two repositories (`lead code` for scraping and `data` for storing scraped data). Open items appear green, closed/purple. A draft issue is created (`polish documentation about the data set`), assigned to `mauro`, with Status set to To do. The Board view (kanban) is introduced as an alternative graphical view of the same data where dragging cards edits the table.

To move from a raw backlog to actionable insight, the speaker unhides/adds fields: `Milestone` (e.g., `data is ready`) and `Linked pull requests`, filters with `is:open` and `is:issue` syntax, and groups by milestone. A new custom Iteration field (type Iteration, two-week cadence, with generated dates) is created, items are assigned to current vs. next iteration, grouped by iteration, and saved as a new view `open issues by iteration` (keeping the original `backlog` view). Both views are shareable URLs.

Switching to the developer/analyst hat, a draft issue assigned in the current iteration is converted to a real issue (choosing the `data` repository) and its metadata is updated: Milestone `data is ready`, Status `In progress`. The board updates automatically. A linked pull request is then merged (`Merge pull request` → confirm), which automatically changes the linked issue's status to `Done` and the PR color from green to purple, demonstrating end-to-end traceability from conversation (issue) to action (PR) to project status.

Q&A corrects the name `backlog` (in Scrum it should be the to-do list, not the whole board), notes boards can add statuses like `in review` / `on hold`, and discusses linking issues with `#<number>` or `org/repo#<number>`, reviewer inference from PR reviewers, and whether linked pull requests can hold multiple items.

## Key Concepts & Tools Taught

- **[github-projects]:** GitHub Projects as a low-overhead project manager; free tier includes private projects; lives in a tab inside a GitHub Organization (collection of repositories/folders, compared to a Dropbox account).
- **[backlog]:** Table view renamed to `backlog` — the long list of past and future work items (issues, PRs, drafts) serving as the collection that is filtered/grouped into actionable views.
- **[kanban-board]:** Board view of the same project data where dragging cards between columns (To do → In progress → Done) edits the underlying table; described as `kanban` in the transcript.
- **[milestones]:** Team-defined `milestone` field values (e.g., `data is ready`) already tagged on issues to organize work meaningfully and group/filter views.
- **[iteration-field]:** Custom Iteration field (two-week units, with auto-generated date ranges) added via `New field → Iteration`; used to allocate items to `current iteration` vs. `next iteration` and to group the view by iteration; saved as `open issues by iteration` while preserving `backlog`.

## Code Snippets & Formulas

No R code; GitHub Projects workflow spoken live (caption-mangled, normalized here):

```text
# Project creation
# GitHub UI: Organization → Projects tab → Create project → Table or Board vs. Template

# Backlog building
# Table → + → Create draft (draft issue)  # "create something that is called a draft ... a draft issue"
# Table → Add items from repositories      # pull issues/PRs from repos "lead code" and "data"

# Fields (add/hide like Excel columns)
# + (far right) → Milestone               # "the other one is called milestone"
# + → Linked pull requests                 # "linked pull requests"

# Filtering/grouping syntax in view header
is:open                                   # "if we click there ... we can as choose specifically open items"
is:issue                                  # "we can do for example issues only because pull requests can be redundant"
# Issue linking in comments
#123                                      # "from one issue mentioned another issue using the syntax pound number of issue"
org/repo#123                              # "if it belongs to another repo you have to actually mention the organization slash repo pound number of issue"

# Iteration field creation
# + → New field → Iteration (two-week cadence)  # "you can't create a column that hosts ... in this case github was clear enough to come up with this iteration type"
# Group: Group by → Iteration              # "i'm going to group by iteration"
# Save: Save changes as a new view → "open issues by iteration"  # "save this view as a new view"

# Developer actions
# Draft → Convert to issue → choose repository ("data")  # "clicks on the draft issue and converts it to an actual issue"
# Edit issue: Milestone = "data is ready", Status = "In progress" / "Done"
# Pull request → Merge pull request → Confirm  # "click here on the button that says merge pull request"
# Auto-update: draft gray circle → green issue, Status "Done", PR green → purple
```
