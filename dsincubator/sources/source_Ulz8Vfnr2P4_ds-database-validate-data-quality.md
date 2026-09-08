---
type: source
title: "ds.database: Validate data quality"
source_file: "Ulz8Vfnr2P4_ds-database-validate-data-quality.md"
video_id: "Ulz8Vfnr2P4"
url: "https://www.youtube.com/watch?v=Ulz8Vfnr2P4"
lang: en
tags: ["ds-incubator", "r-packages", "workflow", "pipelines", "databases"]
key_topics: ["pointblank", "create-agent", "interrogate", "col-vals-not-null", "col-vals-in-set", "action-levels", "yaml-write", "data-dictionary", "foreign-keys"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=Ulz8Vfnr2P4"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 107
    last_modified: "2022-09-20T00:00:00Z"
usage_window: { from: "2022-09-20T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# ds.database: Validate data quality

## Summary

This session presents data-quality validation with the `pointblank` package, motivated by a question about validating relational data from the prior `dm` meetup. The speaker frames `pointblank` as analyst-friendly tooling whose reports are readable by non-coders (managers, stakeholders) and shareable as CSV excerpts of failing rows.

The central workflow — called the data-quality workflow — has three steps: create an agent that holds the validation plan, add any number of validation functions, and `interrogate` the agent to compute a report. A toy model with `companies` (primary key `company_id` with `Alpha`/`Beta`) and `categories` (foreign key `company_id` with three rows, one orphan) illustrates failures. `action_levels` configures thresholds for warnings vs stops (e.g., one failure triggers a warning shown as a yellow dot, with `W`/`S`/`N` columns for warn/stop/notify). The validation table lists each step, columns checked, allowed values, and failure counts, with extracts for non-conforming rows.

Four validation functions are demoed: checking that a key column has no missing values, that a foreign key's values are within the parent's set, that a column is numeric, and that rows are distinct across all columns. Secondary workflows are then contrasted: an ETL/pipeline mode where passing data flows through validation and becomes validated output (otherwise it stops/warns), and two function families for other contexts — `expect_*` variants for `testthat` unit tests and `test_*` variants returning `TRUE`/`FALSE` for `if` assertions (the speaker notes plain `is.numeric` + `expect_true` is often simpler). The talk closes on gathering requirements: `yaml_write` serialises the agent to a human-readable YAML for discussion with non-programmers, and a spreadsheet data dictionary (Google Sheets) with columns for type, uniqueness, and allowed sets serves as a code-free requirements interface.

## Key Concepts & Tools Taught

- **[pointblank]:** `pointblank` ← `point blank package` / `appointment package` / `point-blank` — R package for declarative data validation with agent-based reporting.
- **[create-agent]:** `create_agent` ← `create agent which is an object special object that stores information about what you want to validate` — holds the target data set and the accumulating validation plan; does no computation until interrogated.
- **[interrogate]:** `interrogate` ← `integrating that agent` / `function interrogate` / `integrate agent` — executes the agent's plan and returns the interactive validation table.
- **[col-vals-not-null]:** `col_vals_not_null` ← `call underscore Val ... value you are looking for something about the values of specific columns` — validates that values in `companies IDs` are not null (primary-key check).
- **[col-vals-in-set]:** `col_vals_in_set` ← `valves in set so it verifies that the values of the column ... is included in a limited subset` — checks that `company_id` in `categories` is within `unique(companies$company_id)`; the foreign-key integrity check that motivated the session.
- **[col-is-numeric]:** `col_is_numeric` ← type-check validation (`checking that the column companies ID is of type numeric`).
- **[rows-distinct]:** `rows_distinct` ← `checking that the rows ... in all the columns of the categories table ... are all distinct`.
- **[action-levels]:** `action_levels` ← `action levels which allow you to create a report that gives you a warning or ... more severe than a warning` — thresholds inside `create_agent` or per-validation function controlling `W`/`S`/`N` (warn/stop/notify) severities.
- **[validation-pipeline]:** ETL workflow where data is piped through validation functions that act as filters — if all conditions pass the same data is returned validated, otherwise warnings/errors signal the problem.
- **[expect-true]:** `expect_*` vs `test_*` vs base checks — `expect_` (`expect underscore ... good fit for your tests`) for `testthat` expectations, `test_` (`test underscore and it returns either true or false`) for branching `if`, and direct `is.numeric` + `expect_true` as the speaker's preferred lower-level alternative.
- **[yaml-write]:** `yaml_write` ← `Write um sorry a yaml right` / `yellow right with the name of path` — exports the agent to YAML for non-code stakeholders to review steps (`type agent`, `table categories`, `steps`).
- **[data-dictionary]:** Spreadsheet-with-definitions (Google Sheets) listing data sets, columns, expected types and uniqueness constraints — proposed as a shareable requirements-gathering interface between developers, analysts and managers.
- **[foreign-keys]:** Relational integrity concept — every value of a foreign key (e.g., `categories.company_id`) must exist in its parent primary key (`companies.company_id`).

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```r
library(pointblank)                              # "attach it so we do library Point Blank"
library(tibble)                                  # "TiVo package to create some toy data sets" -> tibble

agent <- create_agent(tbl = categories,
                      actions = action_levels(warn_at = 1))  # "create agent and here I'm doing ... action levels which allow you to create a report that gives you a warning"
agent %>%
  col_vals_not_null(columns = company_id)        # "call underscore Val ... columns which is the argument that takes the name of the column ... companies IDs is are not no"
  col_vals_in_set(columns = company_id, set = unique(companies$company_id))  # "valves in set so it verifies that the values ... is included in a limited subset"
  col_is_numeric(columns = company_id)           # "checking that the column companies ID is of type numeric"
  rows_distinct()                                # "checking that the rows ... are all distinct"
  interrogate()                                  # "function interrogate and the output ... is this interactive point-blank validation table"

# ETL / pipeline mode (data as filter)
data %>% col_vals_not_null(columns = x, actions = action_levels(warn_at = 1))

# unit-test variants
expect_col_is_numeric(data, columns = x)         # "expect underscore and it's a good fit for your tests ... point blank package ... starts with expect underscore"
test_col_is_numeric(data, columns = x)           # "test underscore and it returns either true or false ... suitable for if"
# speaker preference:
expect_true(is.numeric(data$x))                  # "is numeric ... I would more likely use directly is numeric and I get the same result"

# sharing requirements
agent %>% yaml_write(path = "agent.yaml")       # "yaml right" / "yellow right with the name of path ... captures all those steps in a way that is devoid of code"
```
