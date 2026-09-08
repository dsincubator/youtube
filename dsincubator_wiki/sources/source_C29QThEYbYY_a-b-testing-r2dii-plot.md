---
type: source
title: "A/B testing r2dii.plot"
source_file: "C29QThEYbYY_a-b-testing-r2dii-plot.md"
video_id: "C29QThEYbYY"
url: "https://www.youtube.com/watch?v=C29QThEYbYY"
lang: en
tags: ["ds-incubator", "apis", "r2dii", "testing", "ab-testing"]
key_topics: ["r2dii-plot", "ab-testing", "apis", "prep-functions", "dplyr-filter"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=C29QThEYbYY"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 17
    last_modified: "2021-06-08T00:00:00Z"
usage_window: { from: "2021-06-08T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# A/B testing r2dii.plot

## Summary

Not about Shiny — instead a design review of two candidate APIs (called X and Y for internal reasons, analogous to A/B) for the upcoming `r2dii.plot` release, whose mission is "beautiful plots of r2dii data that are also informative and easy to use" and that plays with `r2dii.data`, `r2dii.match`, `r2dii.analysis`, `dplyr` and `ggplot2`. Data are outputs of `r2dii.analysis::target_sda()` and `target_market_share()`; the package ships minimal examples `sda` and `market_share` so testers need not run the full PACTA workflow. Installation is `devtools::install_github("2DegreesInvesting/r2dii.plot")` ("install underscore github and 2 degrees investing rti dot plot").

Both APIs produce the same three plot families — timeline, techmix (technology mix), and trajectory — but meet data requirements differently. API X ("thinner", fewer arguments) relies on caller preparation with `dplyr::filter()` to subset rows (sector, technology, region, scenario, year < 2025) and on internal "magic" about the expected schema, then calls `plot_trajectory()`, `plot_techmix()`, `plot_timeline()` directly. API Y ("thicker") ships explicit preparation helpers `prep_timeline()`, `prep_techmix()`, `prep_trajectory()` that embed the filtering, requires an explicit `value` column argument and extra args (`scenario`, `specs`, `main_line`, `additional_line_metrics`) with less magic and explicit specs tables for labels/colors/ordering.

The five-minute demo contrasts `market_share |> dplyr::filter(sector=="power", technology=="renewablesCap", region=="global", scenario_source=="...") |> plot_trajectory()` (X) versus `prep_trajectory(market_share, value="production", ...)` then `plot_trajectory(data, specs = ...)` (Y). Monica notes Y needs no external dplyr re-coding because relabeling/reordering happens inside the package via a specs data structure passed to the plotting function, enabling customization without knowing `dplyr`/`ggplot2`. Q&A surfaces trade-offs: X is simple to call but demands more general R knowledge; Y centralizes work in the package (heavier codebase, more maintenance, extra args) but hides tidyverse details from banking users. Feedback will be collected via a poll in the coding channel, distinguishing internal (2dii analysts) versus external (bank) user personas, and a concise re-record will be shared with stakeholders including George.

## Key Concepts & Tools Taught

- **[r2dii.plot (r2dii-plot)]:** R package for PACTA-aligned plots from `r2dii.analysis` outputs; website hosted at `r2dii.plot` with Articles comparing X/Y versions and Reference of plot functions.
- **[A/B testing of APIs (ab-testing)]:** Running two parallel interfaces (X and Y) for beta feedback before locking one release; X/Y naming temporarily for "internal reasons" vs usual A/B.
- **[API design comparison (apis)]:** Thin API X = caller does prep + few args + magic schema assumptions + informative errors; Thick API Y = package does prep + explicit args/specs + less magic, larger maintainable codebase ("the more arguments that we support ... the bigger the code base grows").
- **[Prep functions (prep-functions)]:** Y helpers `prep_timeline()`, `prep_techmix()`, `prep_trajectory()` ("prep underscore something like prep timeline prep techniques" → `prep_timeline`, `prep_techmix`, `prep_trajectory`) that filter and reshape before plotting; X has no prep helpers.
- **[dplyr filter pattern (dplyr-filter)]:** X data preparation via `dplyr::filter(sector == ..., technology == ..., region == ..., year < 2025)` and extension/customization via `dplyr` + `ggplot2` re-coding/reordering; Y replaces this with specs tables (`specs`, `main_line`, `scenario`) for labels/colors/order.

## Code Snippets & Formulas

Caption-mangled → normalized; no invented columns beyond transcript mentions:

```r
# install & data
devtools::install_github("2DegreesInvesting/r2dii.plot")  # "install underscore github and 2 degrees investing rti dot plot"
library(dplyr); library(ggplot2); library(r2dii.plot)
data(sda, package = "r2dii.plot")          # "little demo that i said it's called sda a little demo data set that we include with rti plot"
data(market_share, package = "r2dii.plot") # "example data set that is called market share"

# API X — thin, dplyr prep + direct plot
market_share %>%
  dplyr::filter(sector == "power", technology == "renewablesCap", region == "global",
                scenario_source == "weo", year < 2025) %>%  # "focusing on a specific sector ... technology ... region ... scenario source ... ears that are beyond 2025. sorry in low less than 2025."
  plot_trajectory()   # "plot underscore trajectory function in the version x right away that's what it's meant to do"
# also: plot_techmix(); plot_timeline()

# API Y — thick, explicit prep + specs
prepped <- prep_trajectory(market_share, value = "production")  # "there is a prep underscore trajectory y function here that does the filtering ... value argument ... holds the in this case the production data"
# other Y preps:
prepped_tm <- prep_techmix(sda)
prepped_tl <- prep_timeline(sda)

plot_trajectory(prepped,
  scenario = specs,                 # "what are they called scenario specs from good to bad the mainline metric and additional line"
  main_line = "projected",
  additional_line_metrics = NULL,
  value = "production")

# Y customization via specs table (instead of dplyr recoding)
specs <- tibble::tribble(
  ~label, ~color, ~order,
  "Bad",  "red",  1
)  # "you can change the order of the like the bars ... make custom labels ... change the colors you can rename the colors all these ... using a date or like a table like a data structure"
plot_techmix(prepped_tm, specs = specs)
plot_timeline(prepped_tl, specs = specs)
```
