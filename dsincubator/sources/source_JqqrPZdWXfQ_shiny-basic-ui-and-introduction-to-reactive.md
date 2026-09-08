---
type: source
title: "Shiny: Basic ui and introduction to reactive()"
source_file: "JqqrPZdWXfQ_shiny-basic-ui-and-introduction-to-reactive.md"
video_id: "JqqrPZdWXfQ"
url: "https://www.youtube.com/watch?v=JqqrPZdWXfQ"
lang: en
tags: ["ds-incubator", "shiny", "reactivity"]
key_topics: ["shiny", "ui", "reactivity", "inputs", "outputs"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=JqqrPZdWXfQ"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 222
    last_modified: "2021-06-22T00:00:00Z"
usage_window: { from: "2021-06-22T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# Shiny: Basic ui and introduction to reactive()

## Summary

Shiny fundamentals session focusing on UI structure and a gentle introduction to reactivity, building on a previously shown minimal app. The presenter stresses Shiny's encouragement to separate user-interface code (frontend HTML) from server code (backend behavior), glued by `shinyApp(ui, server)`. The bare-bones skeleton is obtained via the RStudio snippet `shinyApp` → Tab, which creates `library(shiny)`, a `ui` object using `fluidPage`, a `server` function, and the final `shinyApp()` call that connects them through shared IDs.

For inputs, every input function shares a predictable naming pattern with the suffix `input` (except the inconsistent `actionButton`) and a required first argument `inputId` (unique string) plus a second argument `label` (free text). Scanning for `input` reveals `textInput`, `sliderInput`, `dateInput`, `selectInput` (dropdown) and alternatives `radioButtons`, plus `fileInput` and `actionButton`; knowing the input structure plus RStudio's tab-completion lets learners discover new inputs by typing `input`. Demo runs a UI-only app with `fluidPage` wrapping several inputs, showing each input's HTML rendering and how the file must be named `app.R` for the Run App button (workaround: source the whole file).

Outputs are parallel: suffix `output`, first argument `outputId`, and placeholders created with `textOutput`, `plotOutput`, `tableOutput` (downloadOutput flagged as more complex). On the server side, each output ID is assigned via `output$<id> <- render*({...})`, where `renderText` is presented as analogous to `print`, `renderPlot` for plots and `renderTable` for tables. The distinction is reinforced by breaking the app: changing `some_plot` to `plot` disconnects UI and server, leaving white space. Discussion clarifies file conventions (`app.R` single-file versus legacy `ui.R` + `server.R`, and modular server files), the reactive programming paradigm's overhead, and that stakeholder users need not learn these low-level details because the team can build apps for them.

The closing introduces `reactive({...})` as a cache for shared computations—illustrated with `head(mtcars,15)` (caption "empty cars") computed once and reused in both a plot and a table, then called as `data()`—to avoid recomputing expensive operations on every react and to speed up apps. Debugging challenges around brackets and the preview of next meetup on reactivity and Shiny debugging are noted.

## Key Concepts & Tools Taught

- **[shiny]:** R package for interactive apps that separates frontend HTML generation from backend behavior, connected by `shinyApp(ui, server)`; conventions require `app.R` for the Run button.
- **[ui]:** User-interface definition—typically `fluidPage(...)` containing HTML placeholders; each element is just HTML text and maps inputs/outputs via IDs.
- **[reactivity]:** Reactive programming paradigm where Shiny tracks `input` changes and lazily re-executes dependent code; `reactive({...})` wraps a computation so it runs once and its value is reused via `data()` across multiple renders.
- **[inputs]:** UI controls with names containing `input`, first argument `inputId` (unique) and second `label`; examples `textInput`, `sliderInput`, `dateInput`, `selectInput`, `radioButtons`, `fileInput`, `actionButton` (noted exception lacking `input` suffix); numeric variations include sliders.
- **[outputs]:** Display placeholders `textOutput`, `plotOutput`, `tableOutput` (plus `downloadOutput`) identified by `outputId`; server assignments `output$<id> <- renderText/renderPlot/renderTable` render the content, analogous to `print`.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```r
library(shiny)                          # "we you know usually start by attaching the shiny package"

# skeleton via snippet "shiny up" + Tab
ui <- fluidPage(                        # "this function here fluid page ... fluid page itself is just a little bit of html text"
  textInput(inputId = "name", label = "Free text"),   # "if you want an input that is a text then there's going to be a function that is called text input ... first argument ... input id ... second argument label"
  sliderInput(inputId = "number", label = "Numeric input", min = 0, max = 100, value = 50),
  dateInput(inputId = "date", label = "Date"),
  selectInput(inputId = "choice", label = "Limited choices", choices = c("a","b")),
  radioButtons(inputId = "radio", label = "Limited choices"),
  fileInput(inputId = "file", label = "File uploads"), # "button for file uploads ... gives you an interface for choosing files"
  actionButton(inputId = "go", label = "Go")           # "action bottom one action button is one other function ... unfortunately doesn't have the suffix input"
)

# output placeholders
textOutput(outputId = "some_text")      # "for text outputs ... help file ... now it's called output id but ... same idea ... create a placeholder on the page for some text"
plotOutput(outputId = "some_plot")
tableOutput(outputId = "some_table")

server <- function(input, output) {
  output$some_text <- renderText({ "some other text" }) # "render function on the server side ... render text would be the equivalent to in the console called the function print"
  output$some_plot <- renderPlot({ plot(head(mtcars, 15)) })
  output$some_table <- renderTable({ head(mtcars, 15) }) # "render table function ... head empty cars ... for to show only 15 rows"
  data <- reactive({ head(mtcars, 15) })   # "reactive function what is doing is saving the kind of computation ... wrapping the code have empty cars ... computed only once and then let shiny reduce the value every time"
  # reused as:
  # output$some_plot <- renderPlot({ plot(data()) })
  # output$some_table <- renderTable({ data() })  # "you just call the name that you created here but you call it as a function"
}

shinyApp(ui = ui, server = server)      # "this shiny app function glues the two together and shiny will know how to connect the user interface with the backend based on some ids"
```
