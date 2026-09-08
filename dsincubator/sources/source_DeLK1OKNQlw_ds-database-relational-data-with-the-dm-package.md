---
type: source
title: "ds.database: Relational data with the dm package"
source_file: "DeLK1OKNQlw_ds-database-relational-data-with-the-dm-package.md"
video_id: "DeLK1OKNQlw"
url: "https://www.youtube.com/watch?v=DeLK1OKNQlw"
lang: en
tags: ["ds-incubator", "r-packages", "databases", "github-issues"]
key_topics: ["dm-package", "relational-data", "primary-key", "foreign-key", "dm-draw", "examine-constraints", "dm-flatten"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=DeLK1OKNQlw"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 251
    last_modified: "2022-09-13T00:00:00Z"
usage_window: { from: "2022-09-13T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# ds.database: Relational data with the dm package

## Summary

Chapter 2 of the relational-data series builds on the prior manual `dplyr` approach by introducing the `dm` (data model) package for working with multiple linked tables. Using a tiny demo of two tables — `companies` (2 rows, `companies_id`, service info) and `categories` (linked via `companies_id`) — with one deliberate orphan row in `categories` (`companies_id = 3` with no match in `companies`), the speaker shows how `dm` eases creation, visualization, validation, flattening, and `dplyr` integration.

A `dm` object is created like a list: `dm(companies, categories)` (caption "multiplier" for `dplyr`, "library dm for data model"), prints as lightweight metadata (table names, column counts, key counts), and is accessible via `$` or `[[` exactly like a list (`dm$companies`, `dm[["categories"]]`). Keys are added with `dm_add_pk(companies, companies_id)` (caption "add primary key") and `dm_add_fk(categories, companies_id, companies)` (foreign key pointing from `categories` to `companies`), after which printing the `dm` shows `primary key 1 / foreign key 1`.

With keys set, `dm_draw()` renders a graph with underlined primary keys and arrows from foreign-key tables to primary-key tables, focusing only on linking columns. `dm_examine_constraints()` then checks three database constraints in one call — uniqueness of primary keys, non-missing primaries, and referential integrity of foreign keys — reporting "unsatisfied constraints" due to the orphan row (which would produce `NA` on join). The manual `dplyr` equivalent is shown for contrast: `count()` distinct `companies_id` for uniqueness, `filter(is.na(companies_id))` for missing, and `anti_join(categories, companies, by="companies_id")` for referential integrity — far more verbose and costly on larger data. `dm_flatten_to_tbl(dm, start = categories, recursive = TRUE)` (caption "flatten ... start at the table categories and flatten every table that that table points to ... follow the arrows") materializes a spreadsheet-like wide table with one call, otherwise requiring repeated `left_join()` by column.

The `dm`'s tight `dplyr` integration is demoed two ways for removing the problematic row. Either `dm_zoom_to(categories) %>% filter(companies_id != 3) %>% dm_update_zoomed()` — zoom into one table, use plain `dplyr::filter()`, then update the model — or the more compact `dm_filter(dm, categories = companies_id != 3)` (caption "instead of filter it's just the m filter ... you explicitly say ... categories ... after the equal what we do is simply ... we get everything that we could have typed into a filter call including the parentheses"). After filtering, `dm_examine_constraints()` reports "all constraints satisfied" and the model is saved as `dm3`. The talk closes pointing to the `dm` website (`Get Started`, references, tutorials) and Q&A about `check` constraints (range 1/0, `NA` types, composite uniques) — answer "i don't know but i will find out", noting `pointblank` as complementary.

## Key Concepts & Tools Taught

- **[dm-package]:** R package `dm` for relational data models; `dm` objects are list-like, created via `dm()`, prefixed functions (`dm_*`), with cheap metadata print and `$`/`[[` access.
- **[relational-data]:** Data spread across linked tables (`companies` ↔ `categories` via `companies_id`); relationships defined by keys; referential integrity and why orphan rows matter.
- **[primary-key]:** Unique, non-missing identifier column; added with `dm_add_pk(companies, companies_id)`; checked for duplicates and `NA`s; underlined in `dm_draw()`.
- **[foreign-key]:** Column in child table pointing to parent primary key; added with `dm_add_fk(categories, companies_id, companies)`; arrow in graph points from foreign-key table to primary-key table; violated when a value has no parent match.
- **[dm-draw]:** `dm_draw()` visualization of the model — tables as boxes with linking columns, primary keys underlined, arrows showing direction; reduces complexity for many-table models.
- **[examine-constraints]:** `dm_examine_constraints()` one-call checker for three constraints (unique PK, non-missing PK, FK referential integrity); reports unsatisfied vs satisfied; expensive to replicate with manual `dplyr` (`count`, `filter(is.na())`, `anti_join`).
- **[dm-flatten]:** `dm_flatten_to_tbl()` (caption "flatten") to produce a flat wide table by following arrows from a start table (`categories` → `companies`), with `recursive = TRUE` vs default single-hop; replaces manual chained `left_join(by = "companies_id")` calls.
- **[dm-zoom / dm-filter]:** Two `dplyr` integration styles: (1) `dm_zoom_to(categories) %>% filter(...) %>% dm_update_zoomed()` — zoom, plain `filter()`, update; (2) compact `dm_filter(dm, categories = companies_id != 3)` with table name before `=` and filter expression including parentheses in place.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```r
library(dm)          # "library dm for data model"
library(dplyr)       # caption "library multiplier"

# Demo tables: 2-row companies + categories linked by companies_id
# categories has one orphan: companies_id == 3 with no parent

# Create data model — like list()
dm <- dm(companies, categories)  # "in the same way you create a list with the function list you create a data model with a function on the m"
dm                                # prints metadata: names, column counts, primary key 0 / foreign key 0
dm$companies                      # "as a list you can just call the dm object with the dot assign syntax and the name of a table"
dm[["categories"]]                # "if you prefer ... you could also use the square vertex syntax"

# Keys — all prefixed dm_*
dm2 <- dm %>%
  dm_add_pk(companies, companies_id)              # "add primary key ... to which table ... for example for companies and which is the column ... it's going to be a company's id"
dm2 <- dm2 %>%
  dm_add_fk(categories, companies_id, companies)  # "add the foreign key ... to another table so in this case it is categories and then the same column ... com japanese id here is a foreign key" — foreign key pointing from categories → companies

# Visualization & constraint checks
dm_draw(dm2)                      # "the function that does that is dm draw ... you see the two tables and you see an arrow pointing from the table that contains the foreign key pointing to the table that has the primary key and the primary key is highlighted in this case underlined"
dm_examine_constraints(dm2)       # "so you do that with the m examine constraints ... checks for at least three things ... here there is a node ... unsatisfied constraints ... every single value in a foreign key should point to a value that actually does exist in the other table"
# manual dplyr equivalents shown for contrast:
# count(companies, companies_id) — "counting the number of times that i get different values ... every primary key value should be unique ... output of zero rows shows that constraint is met"
# filter(companies, is.na(companies_id)) — "every value of a primary key ... should not be missing ... checking if there is any row that has a missing value"
# anti_join(categories, companies, by = "companies_id") — "if any of the values in categories is not much by valuing companies and indeed there is one" [orphan row]

# Flatten — one call vs manual joins
flat <- dm_flatten_to_tbl(dm2, start = categories, recursive = TRUE)
# "flatten every table that that table points to ... we start at categories and we follow the arrows ... that will be the entire data set in a spreadsheet in this kind of flat form ... you could get the columns that come from all of them ... as opposed to having to explicitly say merge this table and then another ... with by which column"
# recursive = TRUE — "you continue with the arrows as far ... every single table that is pointed to ... if you say ... defaults then only the first one that is reached by one arrow"

# dplyr integration — zoom + update
dm_zoom_to(categories) %>%        # "the feature that does that is the m zoom two so we zoom to ... for example the categories table"
  filter(companies_id != 3) %>%   # "we looked at the data we identified that is the road where company's id is number three so we want to exclude that one ... and because we know how to use the player we know that filter is the function"
  dm_update_zoomed()              # "basically what you do is you update the zoomed model ... you first filter that one table where the values were not three and then you updated the entire entire model ... store that in a dm number three"
dm3 <- dm2 %>% dm_zoom_to(categories) %>% filter(companies_id != 3) %>% dm_update_zoomed()

# Compact dm_filter
dm3_alt <- dm_filter(dm2, categories = (companies_id != 3))
# "instead of filter it's just the m filter ... makes a lot of sense ... you have to say ... so the syntax is a bit more compact ... we need to explain which table we want to work with ... explicitly say ... categories which is the name of the table ... after the equal what we do is simply ... we get everything that we could have typed into a filter call including the parentheses which is kind of weird"

# Re-check
dm_examine_constraints(dm3)       # "check those constraints ... and that should say now that all constraints are satisfied because the problematic row is gone"
```
