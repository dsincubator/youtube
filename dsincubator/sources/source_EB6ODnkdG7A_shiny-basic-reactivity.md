---
type: source
title: "Shiny: Basic reactivity"
source_file: "EB6ODnkdG7A_shiny-basic-reactivity.md"
video_id: "EB6ODnkdG7A"
url: "https://www.youtube.com/watch?v=EB6ODnkdG7A"
lang: en
tags: ["ds-incubator", "reactivity", "shiny", "r-packages", "refactoring"]
key_topics: ["shiny-reactivity", "reactive-graph", "reactlog", "reactive-expressions", "refactoring"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=EB6ODnkdG7A"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 64
    last_modified: "2021-07-13T00:00:00Z"
usage_window: { from: "2021-07-13T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# Shiny: Basic reactivity

## Summary

Continuation of the Shiny series on reactive expressions and reactivity, focusing on the reactive graph as a mental model for how inputs and outputs connect via the server function. The talk opens with a minimal greeting app ( `textInput("name")` → `renderText(paste("hello", input$name))` → `textOutput("greeting")` ) to illustrate producer/consumer: `input$name` (tilted input symbol) flows to `output$greeting` (output symbol). The `reactlog` package is then introduced to make the graph concrete: `reactlog::reactlog_enable()`, run the app in background, `Ctrl+F3` to open the log viewer showing `input$name` left → `output$greeting` right with arrow dependency; stepping through initialization shows inputs defined → output selected at random (Shiny picks any output to compute) → server declares `greeting` needs `input$name` → connection created and cached → laziness means recompute only when that input changes.

A second variant extracts `paste(...)` into `string <- reactive({ paste("hello", input$name) })` with `renderText(string())` (caption "instead of coding paste directly on the red and the render text function i extract it into a reactive"), deliberately overkill for this trivial app but introducing the intermediate node that has both input and output shapes (caption "it can fit the input on the left and also it can be fitted into the output"). The graph now has three nodes: `input$name` → `reactive(string)` → `output$greeting`; without a `label` the node shows raw code, fixed by `reactive({...}, label = "string")` (caption "using an argument that the reactive function has that is called label").

The payoff uses Hadley's *Mastering Shiny* comparison app: two distributions (`n1`/`mean1`/`sd1` and `n2`/`mean2`/`sd2`) summarized by a plot (bandwidth `0.2` tweakable) and a `t.test`. With `x1 <- rnorm(n1,...)` and `x2 <- rnorm(n2,...)` defined *inside* `renderText`/`renderPlot`, the log shows dense bipartite graph: every output depends on every input, so changing `n1` recomputes both `x1` and `x2` because Shiny invalidates the whole output if any of its inputs changes. Refactoring to `x1 <- reactive({ rnorm(n1, ...) })` / `x2 <- reactive({...})` outside outputs and calling `x1()`/`x2()` inside isolates dependencies: `x1` depends only on `n1/mean1/sd1`, `x2` only on `n2` group, `t.test` depends on both `x1`/`x2`, so tweaking `n1` recomputes only `x1` branch — graph becomes sparse and computation is lazy (caption "saves computation time ... only things that need to be computed ... as lazy as possible"). UX caveat from Alex: if computations are inherently 300 ms+ (perceivable instant threshold), reactive recompute on every keystroke still feels slow; consider non-reactive triggers like `actionButton()` / `observeEvent()` / `eventReactive()` and `isolate()` under *Controlling timing of evaluation* so the user controls when heavy work runs, even if total time is longer it feels faster.

## Key Concepts & Tools Taught

- **[shiny-reactivity]:** Paradigm where outputs react to inputs; dependency defined in `server` function (`output$greeting <- renderText(paste(... input$name ...))`); laziness — only invalidated branches recompute when an input changes, saving time.
- **[reactive-graph]:** Visual model of producer→consumer arrows; inputs (left) → reactive expressions (middle, diamond) → outputs (right); dependency language ("`greeting` has a reactive dependency on `name`"; with intermediate, "`greeting` depends on `string` which depends on `name`"); dense vs sparse graph signals need for refactoring.
- **[reactlog]:** `reactlog` package tooling: `reactlog::reactlog_enable()` before launch, then `Ctrl+F3` (caption "ctrl and f3") in the running app to open the viewer; stepping through initialization → connection caching → replay of input changes; color cues (caption notes expected green for ready inputs).
- **[reactive-expressions]:** `reactive({ ... })` creating a cached, invalidatable node; called as `string()` / `x1()` function; `label = "string"` argument for readable node names (caption "label there you go we can call it string"); separates computation from render functions to isolate dependencies.
- **[refactoring]:** Extracting `x1`/`x2` sampling outside `render*` into `reactive()`s so `t.test` and plot each call `x1()`/`x2()`; changes graph from "every input → every output" to "n1 group → x1 → consumers, n2 group → x2 → consumers"; demo with Hadley app shows before/after graphs and timing implication.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```r
library(shiny)
library(reactlog)

# Minimal greeting app — one input, one output
ui <- fluidPage(
  textInput("name", "Name"),
  textOutput("greeting")
)
server <- function(input, output, session) {
  output$greeting <- renderText({
    paste("hello", input$name)   # "we paste the string hello with the name that the user gave in the input and we assigned that to the greeting output"
  })
}
shinyApp(ui, server)
# Graph mental sketch: input name --arrow--> output greeting
# "greeting has a reactive dependency on name"

# Visualizing with reactlog
reactlog::reactlog_enable()      # "if you don't have it you'll need to install and all you need to do is to run the function red log react log enable"
# run app in background, then Ctrl+F3  — "you can press ctrl and f3 and that will pop up this new window that shows the elements of your app and their connections — input dollar sign name ... output dollar sign greeting ... this arrow"

# Variant with intermediate reactive — overkill for trivial app but teaches the node
server2 <- function(input, output, session) {
  string <- reactive({           # "instead of coding paste directly ... i extract it into a reactive in this particular application this is not necessary at all but it is just for demonstrations"
    paste("hello", input$name)
  })
  output$greeting <- renderText(string())
}
# Graph: input$name -> reactive(string) -> output$greeting
# "between the input and the output we now have this new node ... has properties of both inputs and outputs because notice how it can fit the input on the left and also it can be fitted into the output"
# dependency phrasing: "greeting has a reactive dependency on string and then string has a reactive dependency on name"

# Readable label for the reactive node
string <- reactive({ paste("hello", input$name) }, label = "string")  # "using an argument that the reactive function has that is called label — label there you go we can call it string"
# Without label: "the reactive expression does not have a name ... instead it has just the code so that is hard to read"

# Hadley comparison app — dense (inefficient) vs refactored (sparse)
# Before — x1/x2 inside output (dense):
# output$t_test <- renderText({
#   x1 <- rnorm(input$n1, input$mean1, input$sd1)   # "both x1 and x2 both of them are defined inside the call that is assigned to output so shiny will detect that x1 changes and will recompute both x1 and x2 because both of them are inside this output — shiny recomputes everything within one output"
#   x2 <- rnorm(input$n2, input$mean2, input$sd2)
#   t.test(x1, x2)$p.value
# })

# After — extract reactives outside outputs (sparse):
x1 <- reactive({ rnorm(input$n1, input$mean1, input$sd1) })  # "the definition of x1 and x2 no longer is inside the calls that are assigned to the outputs but instead are outside the outputs inside the server function"
x2 <- reactive({ rnorm(input$n2, input$mean2, input$sd2) })
output$t_test <- renderText({ t.test(x1(), x2())$p.value })  # "we can use x1 as you could normally do with every reactive expression where you call them as if they were a function — x1 is used here and x1 is used here but if only for example n1 changes then only x1 will recompute but not x2"
output$plot   <- renderPlot({ plot(density(x1()), density(x2())) })
# Graph after: "a lot cleaner now a t-test has a dependency erected dependency of x1 and on x2 but in turn x1 has only a dependency on everything that relates to the one inputs ... and not a dependency on everything that is related to the two inputs"
# "small refactoring in the server function has a huge impact on what is computed when the users play with the app"

# Timing control — when reactive is still too slow (300 ms perceptible threshold)
# "consider using not reactive components ... if a process is inherently slow letting the user feel like they have control over when it runs is better ... consider having that be a button not a reactive"
# See Mastering Shiny section: "controlling timing of evaluation ... add a click button that say okay now compute ... they are free to change everything and then when they're ready they click a button one time"
# actionButton("go", "Compute") + eventReactive(input$go, { ... }) / observeEvent + isolate()
```
