---
type: source
title: "Shiny: Your first shiny app"
source_file: "p-p_4ZcDIGw_shiny-your-first-shiny-app.md"
video_id: "p-p_4ZcDIGw"
url: "https://www.youtube.com/watch?v=p-p_4ZcDIGw"
lang: en
tags: ["ds-incubator", "shiny", "r-packages"]
key_topics: ["shiny-app-structure", "fluidpage-layout", "shinyapps-io-deployment", "ui-controls-selectinput", "server-reactivity-render"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=p-p_4ZcDIGw"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 275
    last_modified: "2021-06-01T00:00:00Z"
usage_window: { from: "2021-06-01T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Shiny: Your first shiny app

## Summary

Opening a broad-but-light series on building and polishing Shiny apps for minimum viable products that can be deployed to production, the speaker — following Hadley Wickham's *Mastering Shiny* (recently released in print) chapter 1 — explains that every Shiny app consists of two pieces: the user interface (how it looks) and the server (how it works). A minimal deployable app requires only a directory containing a single file `app.R`. The standard boilerplate is `library(shiny)`, `ui <- fluidPage("Hello World")`, `server <- function(input, output, session) {}`, and `shinyApp(ui, server)`; RStudio exposes this as a snippet triggered by typing `shinyapp` and pressing Tab. `fluidPage()` is a layout function that generates HTML under the hood, sparing authors from hand-writing HTML/CSS/JS. Running the app can be done via the Run App button (which appears only when a `shinyApp()` call is present), Ctrl+Shift+Enter to `source()` the file, or sourcing manually; the app opens in the RStudio Viewer and at a `localhost` URL reachable in a browser via "Open in Browser", and is stopped by closing the viewer/browser window or the Stop button. Deployment to the free `shinyapps.io` service (up to five apps on the free tier) via the Publish button is demonstrated, including account setup, naming from the directory, and overwriting an already-published "my first app". The UI is then extended with three controls: `selectInput("dataset", "Dataset", choices = ls("package:datasets"))` to let users pick any built-in dataset, plus `verbatimTextOutput("summary")` and `tableOutput("table")` placeholders for results. `ls("package:datasets")` versus default `ls()` to query the `datasets` package environment is explained. Finally, server behavior is wired by matching output IDs to render functions: `output$summary <- renderPrint({ summary(get(input$dataset, "package:datasets")) })` and `output$table <- renderTable({ get(input$dataset, "package:datasets") })`, illustrating the pairing of `verbatimTextOutput`↔`renderPrint` and `tableOutput`↔`renderTable` (a cheat-sheet is promised). Selecting e.g. `airquality` instantly populates the summary and interactive table, with a note that reactive expressions will be covered in the next session.

## Key Concepts & Tools Taught

- **[shiny-app-structure]:** Two main components `ui` and `server` combined by `shinyApp(ui, server)`; minimal skeleton with `library(shiny)` and `app.R` convention (caption "major pieces of a shiny app ... user interface and the server ... ui and a server ... call to shiny up ... passing as arguments the user interface ... and the server").
- **[fluidpage-layout]:** `fluidPage()` layout function that produces HTML (caption "fluid page ... one what's called layout function ... creates html ... shiny will do all that html weird stuff under the hoods").
- **[shinyapps-io-deployment]:** Publishing online via `shinyapps.io` and the Publish button (caption "deploy it to a service ... shinyapps.io ... little button here ... publish ... accounts where you may want to publish ... up to five applications you get for free ... title appears by default using the name of the directory where i put my file up dot r ... hit publish").
- **[ui-controls-selectinput]:** User-facing inputs and output placeholders (caption "select Input ... choices ... ls package column datasets", "select menu ... drop down menu ... label ... data set", "verbatim output and table output ... will be creating spaces for things to exist").
- **[server-reactivity-render]:** Connecting chosen dataset to outputs with `get()` + `summary()` and matching renderers (caption "input dollar sign data set ... placeholder ... get to get the data set ... from the package data set ... function summary to create a summary", "we need to use a specific rendering function ... render print and ... render table ... pairing the ids that we created in the user interface with objects that we define with exact name on the server function ... summary summary ... table here and there is a table here").

## Code Snippets & Formulas

```r
# Minimal boilerplate (caption "boilerplate of a minimal shiny app ... library the package shiny ... ui <- fluidPage('Hello World') ... server ... shinyApp(ui, server)")
# Trigger snippet: type 'shinyapp' + Tab in RStudio (caption "start typing shiny ... snippet ... icon of a little paper ... snip ... hit tab")

library(shiny)

ui <- fluidPage(
  "Hello World"
)

server <- function(input, output, session) {
}

shinyApp(ui, server)
# File must be named app.R inside a directory e.g. my-first-app/app.R (caption "create a directory ... inside that directory to put a file called apps.r ... name is important")

# Inspect HTML generation (caption "if i run fluid page on itself ... what i would expect to see here is just html")
fluidPage("Hello World")

# Running (caption "button called run app ... becomes available when a call to shiny app exists ... remove that call ... run app disappeared ... sourcing ... shift ctrl enter")
# - Click Run App / Open in Browser (localhost URL), or
# - Ctrl+Shift+Enter (source app.R)

# Extended UI with dataset selector and output placeholders (caption "paste this for now ... ls package:datasets")
ui <- fluidPage(
  selectInput("dataset", "Dataset", choices = ls("package:datasets")),
  verbatimTextOutput("summary"),
  tableOutput("table")
)
# Show dataset choices source
ls()  # global env: object x etc if x <- 1 exists
ls("package:datasets")              # caption "ls package column ... package data set ... vector with all the names of the data sets"

# Server wiring (caption "pairing ... summary summary ... table here ... get ... summary")
server <- function(input, output, session) {
  output$summary <- renderPrint({
    summary(get(input$dataset, "package:datasets"))  # caption "input$dataset ... will be replaced by ... air quality ... get ... summary"
  })
  output$table <- renderTable({
    get(input$dataset, "package:datasets")
  })
}
# Mapping to remember (cheat sheet promised): verbatimTextOutput ↔ renderPrint , tableOutput ↔ renderTable
```
