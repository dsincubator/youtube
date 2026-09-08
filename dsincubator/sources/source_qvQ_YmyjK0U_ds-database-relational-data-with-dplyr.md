---
type: source
title: "ds.database: Relational data with dplyr"
source_file: "qvQ_YmyjK0U_ds-database-relational-data-with-dplyr.md"
video_id: "qvQ_YmyjK0U"
url: "https://www.youtube.com/watch?v=qvQ_YmyjK0U"
lang: en
tags: ["ds-incubator", "databases", "dplyr", "r-packages", "docker-compose"]
key_topics: ["mutating-joins", "filtering-joins", "primary-key", "foreign-key", "left-join"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=qvQ_YmyjK0U"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2022-08-30T00:00:00Z"
    usage_count: 126
usage_window: { from: "2022-08-30T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# ds.database: Relational data with dplyr

## Summary

The opener of a three-chapter series on relational data (chapter 1 = dplyr basics; chapter 2 = dm package for data models; chapter 3 = remote SQL databases), this session defines relational data as a collection of related tables and follows Chapter 13 of *R for Data Science*. It targets anyone working with real-world data where insights are spread across tables.

Using a toy example of two tables (`companies` with `companies_id` + `information` — e.g., id 1 Alpha sells solar panels/wind mills, id 2 Beta sells steel/installs solar panels — and `categories` with `companies_id` + `sector` — id 1 Energy, id 2 Metallurgy+Energy, plus an orphan id 3 with no match in `companies`), the speaker shows relationships are always defined between pairs of tables via a key column and live-codes the setup. A more realistic illustration uses `nycflights13` (flights linked to planes via `tailnum`).

The bulk of the talk walks through graphs of join types: mutating joins add columns (inner_join drops non-matches; left_join keeps all `x` with NAs for misses — presented as the most common and safest; right_join symmetric; full_join keeps everything) and filtering joins add no columns (semi_join keeps rows in `x` with a match in `y`; anti_join keeps rows with no match). A section on duplicated keys explains that one-sided duplicates duplicate the matched column values, two-sided duplicates yield a cartesian product (four rows from 2×2), referencing a joint use with Monica for combinations. Finally, key validation is motivated by a current project with Miria: primary keys must be unique and non-missing (checked via `count()` then `filter(n > 1)` expecting zero rows, and `filter(is.na(key))`), and foreign keys must reference existing primary keys (checked via `anti_join()` expecting zero rows), with discussion of whether to drop the orphan or recover the missing company.

## Key Concepts & Tools Taught

- **[mutating-joins]:** Joins that add columns while matching rows; class split into `inner_join` (drops rows without a match) and outer joins (`left_join`, `right_join`, `full_join`); rationale that inner is dangerous on large un-inspected tables.
- **[filtering-joins]:** Joins that filter rows without adding columns: `semi_join` keeps rows in `x` with a match in `y`, `anti_join` keeps rows with no match; used as a convenience to filter one dataset by another, including for validation.
- **[primary-key]:** Key defined as unique identifier for a table (e.g., `companies_id` in `companies`); properties: all values unique and no value missing; validated by `count(primary_key)` → `filter(n > 1)` and `filter(is.na(primary_key))`, both expected to return zero rows.
- **[foreign-key]:** Key in another table that references the primary key (e.g., `companies_id` in `categories` is not a primary key because it duplicates but is a foreign key to `companies`); validated by `anti_join(categories, companies, by = "companies_id")` expecting zero rows; the toy example intentionally has one orphan (id 3) to illustrate the problem.
- **[left-join]:** Most common dplyr verb `left_join(x, y, by = "key")`; keeps all rows of left table `x` even without a match (NA in `y` columns), requiring explicit `by` argument; demoed live as `companies |> left_join(categories, by = "companies_id")` after defining the two toy tables, with comment that `right_join`/`full_join` are convenience variants.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```r
library(dplyr)  # "the player so i'm going to um first attach it to my session" / "we're going to kind of define it and use the player to manipulate it"
# caption consistently says "deep layer verb called left join" / "player" ← dplyr

# toy data (two tables)
companies  # "the table called companies has only two companies ... alpha ... beta" 
# companies_id | information
categories # "the table categories we have a column called sector" 
# companies_id | sector (plus orphan id 3)

# most common join (caption: "joining two tables is with this deep layer verb called left join")
companies |> left_join(categories, by = "companies_id")  # "we do companies first and then using this case the base pipe and we do a left join with categories ... you should explicitly say which is the key variable using the argument by so you say categories id" ; also correction "companies id i made a mistake there typo"

# inner / outer variants walked via graphs
inner_join(x, y)  # "if you use the function inner underscore join" — keeps matched rows 1,2 only
left_join(x, y)   # "the left join is the one that i showed ... we want all the rows including those that do not match ... missing value"
right_join(x, y)  # "the right join is the same thing except that now the focus is on the right hand side"
full_join(x, y)   # "the full join gets you every single row and every single column"

# filtering joins
semi_join(x, y)   # "this is a semi join that's the function that does this trick ... keeps the rows that much observations on the other table"
anti_join(x, y)   # "as opposed to the anti-join that that's the opposite wherever you see a match ... you what you get is the other rows that do not match ... handy when you want to validate"

# duplicate-key behavior (caption graphs)
# x: id2 has x2,x3; y: id2 has y2 → 2 rows (x2-y2, x3-y2)
# x: id2 has x2,x3; y: id2 has y2,y3 → 4 rows cartesian product (x2-y2, x2-y3, x3-y2, x3-y3)

# key validation (chapter primary-key / foreign-key)
companies |> count(companies_id) |> filter(n > 1)          # "whatever is your primary key you know you take the data set and count called the function count ... you see if it meets the property ... filter for values where n is greater than one" — expect 0 rows for valid PK
categories |> count(companies_id) |> filter(n > 1)          # "if i count company ids in that table and then filter for ends greater than one i don't get a zero row table" — not a PK
companies |> filter(is.na(companies_id))                    # "no value of the primary key should be missing ... with the function is an a you can do that" — expect 0 rows
anti_join(categories, companies, by = "companies_id")       # "every single value that appears in a foreign key also appears actually is referencing an actual value in the primary key ... the anti-join function ... what you would expect if it is a valid key is to get a zero row" ; toy returns 1 orphan row (id 3)
```
