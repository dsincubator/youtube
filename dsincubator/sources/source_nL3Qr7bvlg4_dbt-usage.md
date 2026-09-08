---
type: source
title: "dbt usage"
source_file: "nL3Qr7bvlg4_dbt-usage.md"
video_id: "nL3Qr7bvlg4"
url: "https://www.youtube.com/watch?v=nL3Qr7bvlg4"
lang: en
tags: ["ds-incubator", "dbt"]
key_topics: ["dbt-run", "dbt-test", "dbt-docs-generate", "dbt-docs-serve", "github-codespaces", "target-folder"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=nL3Qr7bvlg4"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 32
    last_modified: "2024-06-23T00:00:00Z"
usage_window: { from: "2024-06-23T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# dbt usage

## Summary

In the third video of a short dbt series, the speaker demonstrates the four most basic dbt commands for day-to-day use. Executed inside a GitHub Codespace that was provisioned in the previous installation video (already containing the `dbt` tool and its dependencies), the commands are: `dbt run` to execute transformations, `dbt test` to validate the integrity of transformed data (not covering how to author tests, only how to run them), and `dbt docs generate` followed by `dbt docs serve` to generate and browse database documentation as a static website. The walkthrough opens a terminal in the Codespace, runs each command sequentially (`dbt run` reports success, `dbt test` validates, `dbt docs generate` creates files, `dbt docs serve` opens an auto-launched browser showing a small Hello World project with source details). To illustrate side effects, the speaker runs `ls -a` and `git status`, revealing that the commands created a `logs/` folder and a `target/` folder (the latter containing an `index.html` and other assets that will be examined in the next video on dbt project structure). The goal is to familiarize users with the feel of operating a dbt project rather than deep-diving into authoring transformations, tests, or documentation.

## Key Concepts & Tools Taught

- **[dbt-run]:** Execute transformations (caption "DBT run to execute Transformations" / "DBT run ... this worked successfully").
- **[dbt-test]:** Validate transformed data integrity (caption "DBT test to validate the Integrity" / "DVD test this will validate ... not covering how to write the tests but simply how to run them").
- **[dbt-docs-generate]:** Create documentation files as a static site (caption "DBT docs generate ... generate will create files that are then browsable on a web browser").
- **[dbt-docs-serve]:** Serve the generated site locally on a web browser (caption "DBT docs serve to generate and access the documentation ... serve will serve those files as if they were a website the static website ... DBT docs serve ... will open a web browser ... access to the documentation in the form of a website").
- **[github-codespaces]:** Cloud environment where commands are executed (caption "one way in which we can execute those commands is in GitHub code spaces which I set up in the previous video ... this code space should already have the DBT tool installed").
- **[target-folder]:** Build artifact directory created by dbt commands containing `index.html` and other site files, alongside `logs/` (caption "there is a logs folder that has been added and also a Target folder that has been add ... there is for example an index file which typically are is associated to websites").

## Code Snippets & Formulas

```bash
# Inside GitHub Codespace terminal (environment from previous installation video)
dbt run       # caption: "DBT run to execute Transformations" / "DBT run if you don't have DBT then this will fail"
dbt test      # caption: "DBT test to validate" / "DVD test this will validate that the data has been transformed"
dbt docs generate  # caption: "DBT docs generate ... will create files"
dbt docs serve     # caption: "DBT docs serve ... will serve those files ... that will open a web browser"

# Inspect side effects after running commands
ls -a
git status
# shows addition of logs/ and target/ (target/index.html)

# If dbt is not installed the speaker notes it will remind to revisit installation video
```
