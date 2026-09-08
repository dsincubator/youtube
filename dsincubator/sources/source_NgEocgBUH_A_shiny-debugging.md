---
type: source
title: "Shiny: Debugging"
source_file: "NgEocgBUH_A_shiny-debugging.md"
video_id: "NgEocgBUH_A"
url: "https://www.youtube.com/watch?v=NgEocgBUH_A"
lang: en
tags: ["ds-incubator", "shiny", "reactivity", "debugging", "r-packages"]
key_topics: ["shiny-traceback", "browser-debugging", "message-glue-logging", "reactive-console", "input-type-coercion"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=NgEocgBUH_A"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2021-07-27T00:00:00Z"
    usage_count: 2326
usage_window: { from: "2021-07-27T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Shiny: Debugging

## Summary

The session classifies Shiny failures into three kinds: (1) an obvious error with a traceback printed by Shiny, (2) no error but an incorrect value, and (3) a Shiny-specific reactivity failure where values are correct yet the UI does not update on interaction. The first two reuse general R debugging tools; the third needs Shiny-specific tools.

The motivating example is a small app that takes a number via `selectInput` ← "select input", doubles it with a helper `times two` ← "times two" in `utils.R` / `utils.r` (via `R/utils.R` and `source("R/utils.R")`), subsets the built-in `cars` data frame with `head(cars, n)`, prints a table and draws a `plot(cars)` scatter. The app's UI has `selectInput("n", ...)` with space for `tableOutput("table")` ← "stable" / "a space for a table" and `plotOutput`, while the server defines a `reactive({ dataset <- head(cars, times_two(input$n)) })` ← "reactive value called dataset ... reactive because i'm using it in two places" and `renderPlot({ plot(dataset()) })` / `renderTable`. Running with Shift+Ctrl+Enter yields "non-numeric argument to binary operator" and a traceback highlighting `renderPlot` line 20 → `dataset` line 12 → `times_two` → `utils.R` lines 2 and 6.

Fixes are taught incrementally. Using `browser()` ← "function browser" (and RStudio breakpoints) the speaker steps with `n` (next) and `s` (step into `g`/`h` → `times_two`) and discovers the input is `"1"` (character) — `typeof(x)` ← "type of x is a character" / "type is ... character" — so `"1" + 1` fails while `1 + 1` succeeds. A minimal reproduction strategy is shown by shrinking the reactive to `input$n` directly, building a reprex. To observe behavior across UI interactions, `message()` ← "function message" combined with `glue` ← "glue package" is used: `message(glue("input n {input$n} ... type is {typeof(input$n)}"))` ← "message ... which we can combine conveniently with the glue package" prints on each select change, revealing that `head(cars, "3")` silently succeeds but mis-behaves (e.g., `"6"` yields many points not six). Coercing with `as.numeric(input$n)` ← "as numeric" fixes types 1 and 2. The remaining table-not-showing bug is a UI/server ID mismatch: `tableOutput("table")` with lowercase `t` in UI vs. `"Table"` with capital `T` in server (`renderTable`); lowercasing the ID reconnects the outputs. Finally, `shiny::reactiveConsole(TRUE)` ← "shiny cone reactive console" / "reactive console ... when you set it to true" is shown as a way to experiment with reactives at the console without building a full app, since bare `reactive({...})` otherwise errors "has to be used only in a reactive context".

## Key Concepts & Tools Taught

- **[shiny-traceback]:** Three error types — traceback error ("non-numeric argument to binary operator" in `renderPlot` → `dataset` → `times two`), silent wrong value (e.g., `head(cars, "6")` returns unsliced data), and stale UI; reading the highlighted traceback ("lines ... that relate to code that we wrote") to locate `app.R` line 20 and `utils.R` lines 2/6.
- **[browser-debugging]:** Interactive debugging with `browser()` ← "function browser or the checkpoints in our studio" placed before `times_two`, driving the debugger with `n` ← "type n and then enter ... move to the next line" (Next) and `s` ← "press s and then enter ... step into the function" (Step into `times two`/`g`/`h`), `View`/`Q` to quit ("capital q ... or ... red square"), and the minimal-repro strategy of shrinking code to expose the bug for a reproducible example ("shrink the problem to the minimum amount of code").
- **[message-glue-logging]:** Multi-input debugging with `message()` ← "function message" + `glue` ← "glue package" idiom `message(glue("input n {input$n} type is {typeof(input$n)}"))` ← "message ... glue", observing console on each UI change ("when i change to three ... this output here on the console") to distinguish character vs numeric across interactions.
- **[reactive-console]:** `shiny::reactiveConsole(TRUE)` ← "shiny cone reactive console ... when you set it to true ... enable that" / "reactive console" to make the R console a reactive context, allowing direct testing of `reactive({ as.numeric("6") ... })` without launching an app ("you can run any reactive on the console as if it was a shiny app"); contrasted with the error when `reactive()` is called outside a reactive context.
- **[input-type-coercion]:** Shiny `selectInput` ← "select input" returns character (`"1"`), so `times two` ← "times two" + `head`/`plot` need `as.numeric(input$n)` ← "as numeric" or switching to `numericInput` ← "numeric input"; also the reactivity wiring bug where `selectInput`/`select input` ID case mismatch (`"table"` lowercase `t` in UI vs. `"Table"` capital `T` in server) breaks `tableOutput`/`renderTable` connectivity ("the only connection ... is the id ... lowercase t on the ui and a capital t on the server").

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```r
library(shiny)                                           # "attaching the shiny package"
source("debugging/utils.R")                              # "that youtubes that are file i put them in a folder called debugging and here is my udlr file"
# utils.R: times two — buggy helper
times_two <- function(x) { x * 2 }                       # "function is called times two ... takes a number and multiplies it by two" — buggy
# app structure
ui <- fluidPage(
  selectInput("n", "n", choices = c(1, 3, 6)),          # "select input call that will allow the user to input a number"
  tableOutput("table"),                                  # "some space for a table" (buggy UI uses lowercase t)
  plotOutput("plot")                                     # "some space for a plot"
)
server <- function(input, output, session) {
  dataset <- reactive({                                   # "reactive value called dataset ... using it in two places"
    browser()                                            # "function browser" — fire interactive debugger
    message(glue::glue("input n {input$n} type is {typeof(input$n)}"))  # "printing messages to the console with the function message ... combine ... with the glue package"
    n <- as.numeric(input$n)                             # "as numeric" — fix character → numeric
    head(cars, times_two(n))                             # "head of cars" / "plot in base r ... dist and speed"
  })
  output$table <- renderTable({ dataset() })             # "render ... table ... using the data sets reactive"
  output$plot  <- renderPlot({ plot(dataset()) })        # "calling plot on data set" in "render plot reactive"
}
shinyApp(ui, server)
# run: Shift+Ctrl+Enter                                  # "press shift ctrl enter"

# console checks:
typeof("1")          # "type of x is a character" — vs typeof(1) numeric/double
"1" + 1              # "one literal one plus one ... give me the arrow that we see" -> error: non-numeric argument to binary operator
1 + 1                # -> 2
head(cars, 6)        # numeric -> 6 rows
head(cars, "6")      # "literal string six" -> silently not subsetting (no error but wrong value, many points)

# reactivity experiment without app:
shiny::reactiveConsole(TRUE)   # "shiny cone reactive console ... set it to true ... you can use the console as if it was a shiny app"
dataset <- reactive({ as.numeric("6") })
# vs error before enabling: "has to be used only in a reactive context"

# fix for non-updating table (type-3 bug): align IDs
# UI:  tableOutput("table")   # lowercase t
# Server: output$table <- renderTable(...)  # must be "table" not "Table" — "lowercase t on the ui and a capital t on the server"
```
