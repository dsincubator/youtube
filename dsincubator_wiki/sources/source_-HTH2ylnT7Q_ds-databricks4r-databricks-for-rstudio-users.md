---
type: source
title: "ds databricks4r: Databricks for RStudio users"
source_file: "-HTH2ylnT7Q_ds-databricks4r-databricks-for-rstudio-users.md"
video_id: "-HTH2ylnT7Q"
url: "https://www.youtube.com/watch?v=-HTH2ylnT7Q"
lang: en
tags: ["ds-incubator", "terminal", "shell", "python", "github"]
key_topics: ["databricks", "rstudio", "workspace", "cluster", "sparkr"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=-HTH2ylnT7Q"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 1166
    last_modified: "2023-10-22T00:00:00Z"
usage_window: { from: "2023-10-22T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# ds databricks4r: Databricks for RStudio users

## Summary

This tutorial walks RStudio users through Databricks, asking whether Databricks replaces RStudio or complements it and what frictions to expect. The presenter compares Databricks to a racing car — powerful but not an everyday driver — and proceeds tab by tab through the Databricks workspace from the perspective of an analyst already comfortable in RStudio.

The demo covers the workspace where folders, `.r` files and notebooks are created, showing that each file must be explicitly attached to a running cluster unlike the always-available session in RStudio, and that the interface offers an output panel (R console) and a terminal panel (shell). Notebooks are presented as the closest analogue to R Markdown / Quarto / Jupyter, with per-chunk language selection and a magic marker that is inserted when markdown is chosen, while only `py`, `sql`, `r` and `scala` extensions are accepted for files. Frictions highlighted include the limited text-editing capabilities, the separation of file creation from compute attachment, and the need to wait minutes for a cluster to start.

Further tabs demonstrate repos cloned from a GitHub URL with a basic commit-and-push workflow that lacks advanced git operations and does not expose a `.git` directory in the terminal, the catalog as a frontend to tables stored in Azure storage containers (including Parquet tables), reading data via the catalog versus local files, provisioning a cluster with the ML runtime for RStudio Server where auto-terminate must be disabled and sudo is unavailable, and a jobs/workflows tab for scheduling notebooks on a chosen cluster.

## Key Concepts & Tools Taught

- **[databricks]:** Unified cloud platform explored tab by tab as a complement or alternative to RStudio, with distinct workspace, catalog, workflow and compute areas.
- **[rstudio]:** Reference environment whose always-on local session, rich editor and filesystem assumptions contrast with Databricks' detached-file-and-compute model.
- **[workspace]:** Area where users create folders, `.r` files and notebooks; items created under Home appear under Workspace and each file can be bound to the same or a different cluster.
- **[cluster]:** Compute resource that must be started and attached per file or notebook, shows green when ready, powers both the output console and terminal, and for RStudio Server requires the ML runtime with auto-terminate disabled.
- **[sparkr]:** R package for working with the catalog via `tableToDF`; the presenter notes it was archived on CRAN in 2021 for lack of maintenance and mentions sparklyr as the alternative with a similar API.
- **[repos]:** Workspace tab that clones a GitHub repository from a URL and exposes branch creation, file editing, diff viewing and commit-and-push directly, but without history rewriting features and without a usable git repo from the terminal.
- **[catalog]:** Frontend to tables (e.g. `default.country`) hosted in Azure containers that can be materialized in SQL or in R via Spark and inspected with display helpers.
- **[azure-storage]:** Reading from Azure Storage with the AzureStor package via a container URL, a SAS token stored in `.Renviron` via `usethis::edit_r_environ`, and helpers that wrap container creation and CSV reading.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```r
print("Hello World")            # "print uh hello world Hello World" / "print uh as I did before hello"
getwd()                         # "print um get working directory" / "get WD"
ls()                            # "like an LS to see what files are there"
pwd                             # "a print WD to see where I'm standing" — shell pwd ← print WD
# terminal navigation
# "CD change working directory to SL capital W work work space" → cd workspace; ls repos
git status                      # "git status for example" — returns "not recognized a Rebo"
ls .git                         # "l dogit I it says that there's no such um FAL directory" — .git disabled for repos
```

```r
# Spark / catalog
library(SparkR)                 # "spark r package" — line 968
path <- "raw_default_country"   # "path is the same that you see here in SQL ... I put that into a varal path"
df <- tableToDF(path)           # "a function called table 2df that takes that path" — SparkR::tableToDF ← table 2df
class(df)                       # "do something like class of data and that will tell us that it's a spark data frame"
head(df)                        # "other functions that are common like head for example um may not work"
display(df)                     # "you have to call the function display as opposed to ... printing the name of the table"

read.csv("data/dataset/file.csv")  # "like read Are For example read CSV H with the path to that data set" — local CSV read

# Python chunk
import os                       # "in Python I will do something like import OS"
os.getcwd()                     # "os. get current working directory H" — Python cwd check
```

```r
# Azure Storage
# "pack package azour store with a capital A and capital S" → AzureStor
# "you can access your IR environment file with use this edit r v [environ]" → usethis::edit_r_environ()
# "the function C get and that will be you know read that token" → Sys.getenv("SAS_TOKEN") — vague guard kept as captioned "C get"
sas <- Sys.getenv("SAS_TOKEN")  # "read the value giving it the name of the variable to the function C get"
cont <- blob_container(url)      # "you pass it to the function BL container along with with a URL" — blob_container ← BL container
storage_read_csv(cont, "data/irs.csv")  # "a function ... called Storage R CSV" — AzureStor helper ← Storage R CSV

# Alternative
library(sparklyr)               # "another package called sparkly R ... which seems to be the best alternative" — sparklyr ← sparkly R
```
