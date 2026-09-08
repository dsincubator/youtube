---
type: source
title: "Shiny: Wrap up and demo"
source_file: "uk-I5WrZsAc_shiny-wrap-up-and-demo.md"
video_id: "uk-I5WrZsAc"
url: "https://www.youtube.com/watch?v=uk-I5WrZsAc"
lang: en
tags: ["ds-incubator", "shiny", "reactivity", "r-packages", "docker"]
key_topics: ["shiny-golem", "shiny-modules", "reactive-map", "packaging-shiny", "shiny-retrospective"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=uk-I5WrZsAc"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2021-08-17T00:00:00Z"
    usage_count: 19
usage_window: { from: "2021-08-17T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Shiny: Wrap up and demo

## Summary

The final session of the Shiny series wraps up ~10 meetups (longest DS incubator series; testing was second with seven) with a retrospective, discussion, and two production demos. Content covered: building a basic Shiny app and reactivity (new mental model, `reactlog`/reactivity as a paradigm shift from linear code, discussed via *Mastering Shiny*), workflow (keyboard shortcuts, viewer vs. browser), debugging (general R tools plus Shiny-specific laziness challenges), packaging Shiny apps as R packages for distribution, and publishing (simplest strategies).

Retrospective: feeling coverage was ambitious and overly technical; wish to cut or aim for smaller, superficial topics that fit half-hour chunks without becoming boring. What went well: the speaker learned enough to ship a production app (Scenario Selector Tool) and the cohort built a usable public app (Jackson's UK oil & gas North Sea licenses). Format debate: lecture (half-hour segmented) vs. workshop (hands-on, needs consecutive hours) — lecture suits Tuesday brain-fried audiences who want to relax, while dedicated multi-hour workshops suit focused skill transfer like the upcoming `packyou` Docker image.

Demo 1 — Scenario Selector Tool (Mauro + Jackson + Alex): live at its URL, repo `github.com/2DegreesInvesting/scenario-selector` (caption: `tutorials investing ds.shiny` / `github.com tutorials investing`), with selectors left, plot and table, and a README section `Learning Shiny` linking each book chapter to its code illustration via `code` hyperlinks. Demo 2 — Jackson's North Sea oil & gas dashboard (with Adrian, hosted on `shinyapps.io`): splash page → interactive equity table + leaflet-style map of sub-blocks, query by company (e.g., `Repsol`, `BP`), pop-ups and Reset Table, plus a separate full dataset view (252 pages, 1.8 MB largest file). Implementation details: R package structure with standard files (`tests`, `DESCRIPTION`, `NAMESPACE`), `golem` framework for scaffolding (now considering lighter alternatives), exported `run_app()` that runs locally or on `shinyapps.io`, `app_ui` + `app_server` exposing a single `assets_map` module pair (`mod_assets_map_ui` / `mod_assets_map_server`), maps/tables as outputs with reactives on marker clicks for highlighting, data sourcing reproducibility (raw data in `data-raw` with Python scripts for company ownership, maintained UK government data pulled manually, 1.8 MB cache kept in-app for fast spin-up in a couple seconds), and a JS styling workaround namespacing modules via pasting `ns()` output into a JavaScript string debugged in Chrome DevTools.

## Key Concepts & Tools Taught

- **[shiny-golem]:** `golem` framework for scaffolding a Shiny app as an R package with standard structure (`DESCRIPTION`, `NAMESPACE`, tests), exported `run_app()` to launch locally or on `shinyapps.io`; talk notes considering alternatives to reduce `golem` overhead.
- **[shiny-modules]:** Modularization via `app_ui`/`app_server` wrapping a `mod_assets_map` module pair (`module_ui` / `module_server`); `run_app()` calls `app_ui` + `app_server` which call the module, enabling separation of concerns.
- **[reactive-map]:** Reactive map/table dashboard pattern: outputs (`map`, `table`) driven by reactives that respond to user clicks on markers, with highlighting logic and `Reset Table` interactions; data pre-processing kept inside the app for interactive development but could be externalized.
- **[packaging-shiny]:** Packaging/distributing Shiny apps as R packages as covered in the series, with the production app example showing reproducibility (raw data in `data-raw`, Python scripts for ownership, provenance links) and deployment considerations (two apps composited via iframe, UX overlay added by a front-end developer beyond the Shiny server).
- **[shiny-retrospective]:** Series retrospective and format guidance: ~10 half-hour lecture chunks (segmented) work for sick/bad-topic breadth vs. multi-hour consecutive workshops for deep skill transfer; trade-off between learning-by-doing and lecture accessibility for brain-fried Tuesday audiences.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```r
# golem-packaged Shiny app structure (caption: "use the golem framework to generate all the scaffolding and stuff like that ... although i'm probably soon going to switch to a different framework because i think that golem has way too much overhead")
# scaffolding files seen: DESCRIPTION, NAMESPACE, tests/, R/run_app.R, R/app_ui.R, R/app_server.R, R/mod_assets_map.R, data-raw/
golem::create_golem()          # implied scaffolding (caption: "golem has way too much overhead")
library(northSeaDash)          # "if i have a look at the structure ... in the structure of an r package ... use the golem framework"
run_app()                      # "hit run up it's just an exported function from the r package and it runs everything locally" ← run_app / "hit run up"; also "show in the viewer pane" option
# in R/run_app.R:
# run_app <- function() { shinyApp(ui = app_ui(), server = app_server) }

# modular UI/server (caption: "all this app is is a golem call to app ui an app server ... the server is really basic it's just a module call to to this assets map module")
app_ui <- function() {
  fluidPage(mod_assets_map_ui("assets"))
}
app_server <- function(input, output, session) {
  mod_assets_map_server("assets")
}
# module pair (caption: "this module pair of functions is where the actual functioning")
# R/mod_assets_map.R: mod_assets_map_ui / mod_assets_map_server with map + table outputs, reactives on click, highlighting

# data prep (caption: "i extracted as much of the data processing as i could outside of the server ... it really just processes mostly at the very beginning ... i could do this data raw and have it run outside")
# data-raw/ scripts (including python library for company ownership): "i've kept explanations and the source code for how i did all of my kind of data like raw data pre-processing in this data raw folder ... python library"
# cache kept in-app: largest file 1.8 MB  # "how big is the data file ... the biggest one is 1.8 megabytes ... the app it spins up like in a couple seconds"

# JS namespacing workaround (caption: "i was trying to write some javascript ... the module is namespaced and i have to call this namespace map i had to do some funky jumping between javascript and r and pasting the output of the r namespace function into a javascript string")
# in mod: paste0(session$ns("map"), " ... ") -> JS string styling

# deployment (caption: "two different shiny apps ... both hosted on shinyapps.io ... captured this entire app in an iframe in html and then their front-end developer was able to add this interactivity on top")
# Scenario Selector repo: github.com/2DegreesInvesting/scenario-selector ; Learning Shiny README links: "code highlighted too as a hyperlink ... that will take you to some part of the code"
```
