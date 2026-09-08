---
type: source
title: "dbt installation"
source_file: "QxgEn2fwIOk_dbt-installation.md"
video_id: "QxgEn2fwIOk"
url: "https://www.youtube.com/watch?v=QxgEn2fwIOk"
lang: en
tags: ["ds-incubator", "dbt", "databases", "github"]
key_topics: ["dbt", "github-codespaces", "pip-installation"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=QxgEn2fwIOk"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 76
    last_modified: "2024-06-22T00:00:00Z"
usage_window: { from: "2024-06-22T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# dbt installation

## Summary

This video installs dbt in an isolated environment to avoid contaminating the local development setup. The presenter chooses GitHub Codespaces because it provides a quickly accessible VS Code environment in the browser where the documented installation steps work reliably, and everyone gets some free Codespace hours.

The workflow starts from the `2DegreesInvesting/ds-incubator` repository (series `DS inator DVT`), clicking the green **Code** button → **Create codespace on main**. After a short startup the user is dropped into a VS Code editor with an integrated terminal. The installation instructions are stored as a file in that repo; the presenter copies the whole block and pastes it into the terminal.

The pasted commands first install system Python and `pip`, then use `pip` to install `dbt-core` — described as the essential piece of software for these tutorials — and then `pip` again to install a database adapter, a thin plugin that connects dbt-core to a specific database. DuckDB is chosen for the adapter (`dbt-duckdb`) because it is very simple, requires almost no configuration, and can run without an account on any cloud provider, yet is capable for real usage. After running the `pip install` block, verification is shown with `dbt --version` (caption: `DBT version`), which confirms `dbt` is installed. The session ends by previewing next topics: basic `dbt` usage and the structure of a `dbt` project.

## Key Concepts & Tools Taught

- **[dbt]:** Data Build Tool core (`dbt-core`) plus adapter architecture; dbt handles transformations on top of a database rather than replacing it.
- **[github-codespaces]:** Browser-based VS Code environment launched from a GitHub repo (Code → Create codespace on main) that provides an isolated terminal where installation commands can be run without polluting the local machine; includes free usage quota.
- **[pip-installation]:** System setup sequence: install `Python` and `pip`, then `pip install dbt-core`, then `pip install <adapter>` for the chosen database.
- **[duckdb-adapter]:** The `duckdb` adapter (caption: `D TV`) that links dbt-core to DuckDB; selected for minimal configuration and no cloud account requirement.
- **[verification-with-dbt-version]:** Confirming the installation succeeded by running `dbt --version`.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```bash
# Launch Codespace
# GitHub repo -> Code button -> "create code space on the main branch of this repo" <- "create code space on the main branch"
# Editor: VS Code with integrated terminal

# Installation block copied from repo file and pasted into Codespace terminal
sudo apt-get update && sudo apt-get install -y python3 python3-pip  # "first we're going to be installing Python and also pip" <- "installing Python and also pip"

pip install dbt-core   # "we use pip to install DBT core which is the essential piece of software ... this these tutorials are about" <- "pip to install DBT core"
pip install dbt-duckdb # "then we're going to be using pip again to install what's called a database adapter ... in this case that TV and connects it to DBT core I'm choosing D TV because it is a very simple database" <- "database adapter" / "that TV" / "D TV" (= DuckDB)

pip install --upgrade pip  # "let's see now let's run the pep install TP in case I didn't run before" <- "pep install TP"

dbt --version  # "now we can try verifying with um DBT version to see if that D install and there we are we have DBT installed" <- "DBT version"
dbt --help
```
