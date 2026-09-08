---
type: source
title: "Shiny: Basic reactivity"
source_file: "rirpOpTYVg4_shiny-basic-reactivity.md"
video_id: "rirpOpTYVg4"
url: "https://www.youtube.com/watch?v=rirpOpTYVg4"
lang: en
tags: ["ds-incubator", "reactivity", "shiny"]
key_topics: ["shiny-reactivity", "reactive-context", "render-functions", "input-output", "laziness"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=rirpOpTYVg4"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2021-06-29T00:00:00Z"
    usage_count: 258
usage_window: { from: "2021-06-29T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Shiny: Basic reactivity

## Summary

The second meetup in the Shiny series covers Basic Reactivity from *Mastering Shiny*, contrasting imperative scripting (lines run once in order, error if `x` not defined) with Shiny's declarative reactive paradigm where code is a recipe executed when needed. Starting from a minimal app (UI defined as `ui`, Server defined via `server` function, launched with `shinyApp(ui, server)` that asks for a name and renders `Hello` + input reactively as the user types `Mauro` letter-by-letter), the speaker unpacks the `server` arguments `input` and `output` (with `session` deferred) using deliberate errors.

Inputs are read-only (browser is source of truth) — attempting `input$count <- 10` throws `Can't modify read-only reactive value 'count'`. Inputs must be read inside a reactive context — reading `input$count` inside `message()` outside a consumer throws `Can't access reactive value 'count' outside of reactive consumer`. Outputs must be assigned through a render function (`output$greeting <- renderText(paste("Hello", input$name))`) and are write-only (reading an output like `message(output$greeting)` errors); correct use wraps assignment in `render*` (e.g., `renderText`). The reactive graph is introduced: inputs are producers/consumers, reactive expressions are both, outputs are producers, with render functions creating the reactive context that makes the magic flourish.

The final sections explain laziness (computation only when needed, enabling efficiency but backfiring silently — e.g., assigning to `output$grxx` instead of `output$greeting` yields no error because Shiny never runs code not demanded, detectable via `Ctrl+Alt+K` highlighting). Discussion notes that reactive functions run continuously so filter/data manipulation should be kept minimal in UI and deferred to server, with reference to Joe Cheng's 2019 RStudioConf talk on performance.

## Key Concepts & Tools Taught

- **[shiny-reactivity]:** Reactive programming as a declarative paradigm (recipe, not immediate imperative execution) where typing in the browser triggers the app to react and expose output without rerunning a script; contrasted with linear script execution.
- **[reactive-context]:** Requirement that reactive values be accessed inside a reactive consumer; error `Can't access reactive value 'count' outside of reactive consumer` when reading `input$count` via plain `message()` instead of inside `render*`/`reactive()`.
- **[render-functions]:** Family `renderText`/`render*` functions that create the reactive context for assignment (`output$greeting <- renderText(paste("Hello", input$name))`) and enable Shiny's lazy evaluation; omitting them on either assignment or reading triggers the consumer error.
- **[input-output]:** `input` list (read-only, source of truth is browser, IDs defined in UI like `name`/`count` default 100) vs. `output` list (write-only through `render*`, placeholder IDs like `greeting` defined in UI, consumed in server); common errors demonstrated for each direction.
- **[laziness]:** Shiny's lazy evaluation — computation happens only when an output with the correct ID is demanded; mistyping the ID (`grxx` vs `greeting`) produces silent failure (no error, output never shown), diagnosed by checking IDs with `Ctrl+Alt+K` highlighting.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```r
library(shiny)  # "i'm going to call library shiny i'm going to define this ui which is is a simple numeric input"

ui <- fluidPage(
  textInput("name", "What's your name?"),  # "we define some inputs and we create some placeholders for outputs each of those have ids so in this case the name id is an input"
  textOutput("greeting")                   # "the output it also has an id in this case it's called greeting and then what we do is we kind of build the output object"
)
server <- function(input, output, session) {  # "he starts explaining about what you can do what you cannot do with the different arguments of the server function and he in this part focuses on the input and output only"
  output$greeting <- renderText({       # "notice how we wrap that into this render function so that is the function that defines that context"
    paste("Hello", input$name)          # "we were pasting a string to the user's input" / "where we paste the hello string to the input that the user gave me" (line 11)
  })
}
shinyApp(ui, server)  # "and then it calls the two components with the function shiny app"

# error demos (quotes exact messages)
input$count <- 10  # "say that inside the server function i wanted to change the value of count to 10" → Error: "can't modify a read-only reactive value count" / "Can't modify a read-only reactive value count"
message(input$count)  # inside server but outside reactive context (line 42: "it is using it in a normal function in the function messages it's not using it in a reactive context") → Error: "can't access a reactive value count outside of a reactive consumer"
output$greeting <- paste("Hello", input$name)  # without render (line 58: "i'm not wrapping the line 58 in any function") → prompts to use render function
message(output$greeting)  # reading output directly → outputs cannot be read

# correct vs. bad assignment illustrating laziness (line numbers referenced in talk)
# good:
output$greeting <- renderText(paste("Hello", input$name))  # works (greeting object single e? caption: "assign the input to an object called greeting with double e")
# bad (silent, no error):
output$grxx <- renderText(paste("Hello", input$name))  # "instead of assigning to greeting i assign to gir xx thing it's not going to be an error because shinee is not even running this code ... laziness kind of sometimes backfires" — diagnose with Ctrl+Alt+K highlighting IDs
```
