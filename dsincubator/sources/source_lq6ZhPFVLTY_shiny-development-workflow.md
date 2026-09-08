---
type: source
title: "Shiny: development workflow"
source_file: "lq6ZhPFVLTY_shiny-development-workflow.md"
video_id: "lq6ZhPFVLTY"
url: "https://www.youtube.com/watch?v=lq6ZhPFVLTY"
lang: en
tags: ["ds-incubator", "shiny", "workflow", "debugging", "r-packages"]
key_topics: ["shiny-workflow", "rstudio-template-and-snippet", "shift-ctrl-enter-reload", "background-job", "shiny-autoreload"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=lq6ZhPFVLTY"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 54
    last_modified: "2021-07-20T00:00:00Z"
usage_window: { from: "2021-07-20T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# Shiny: development workflow

## Summary

This session on **Shiny workflow** — drawn from *Mastering Shiny* chapters 5 (workflow) and 20.2.1 (workflow when Shiny is part of a package) while deferring debugging and reprex to another meetup — argues that a fluid workflow is key because debugging Shiny is harder than normal R and quick feedback catches problems before they become a mess. It first highlights what **RStudio** does for you: starting a new project via File → New Project → New Directory → Shiny Web Application scaffolds a `app.R` plus `.gitignore` and a Run App button with a runnable demo — helpful for first apps but overly complex if you know what you want, since you must delete `ui`/`server` boilerplate. The preferred minimal alternative is to create the project and `app.R` yourself and use the **shinyapp snippet** (white icon vs. blue package functions): typing `shiny` shows blue `shiny` functions but the white-snippet `shinyapp` at the top; hitting Tab populates the skeleton `ui`, `server`, and `shinyApp(ui, server)` call, giving a clear structure to fill. A small greeting app is then built (`textInput("name")` + `renderText(paste("Hello", input$name))`) to demonstrate iterative workflow. Instead of clicking **Run App**, the recommended shortcut is `Shift+Ctrl+Enter` to source the file (runs in Viewer pane and Console); the button flips to **Reload App** and subsequent saves/changes are reloaded with the same shortcut, prompting to save if unsaved. Options to display are contrasted: `Run in Viewer Pane` (default), `Run in Window` (pop-out window hidden behind), `Run External` / Open in Browser (closest to user experience on web/phone, shows autocompletion). The console being busy while the app runs (e.g., `1+1` does nothing) motivates running as a **Background Job**: choosing `Run App with Job` / **Background Job** instead of Console runs the app via the Jobs pane — still yields a URL and Reload App button plus Viewer — but keeps the console free (`1+1` → 2). A caveat is that each Reload creates a new job, piling up 5–50 jobs for heavy apps. The more scalable single-job approach is an `autoreload.R` file at the project root containing `options(shiny.autoreload = TRUE); shiny::runApp()` (no argument if `app.R` is alongside, otherwise `getwd()`/path), launched manually via Jobs → Start Local Job with the `autoreload` file selected (auto-populated) → Start. The resulting single job emits a URL that can be shown in the Viewer with `rstudioapi::viewer(url)`; now any change saved with `Ctrl+S` to `app.R` is reflected immediately in the Viewer without resourcing, and the Jobs pane stays at one job. The talk notes this `autoreload` trick does not work inside an R-package-based Shiny infrastructure (where `load_all()` and `R CMD check` workflows take over) and closes by inviting questions on browser choice and noting earlier theory-heavy sessions caused lower attendance.

## Key Concepts & Tools Taught

- **shiny-workflow**: Concern is how you go about developing an application fluidly; quick feedback matters because debugging Shiny is more complicated than normal R and problems compound if not caught early.
- **rstudio-template-and-snippet**: RStudio helps via **New Project → Shiny Web Application** template (bare bones project with `app.R` and `.gitignore` demo) vs. preferred **snippet** `shinyapp` (white icon, Tab to expand to `ui`/`server`/`shinyApp` skeleton) when you want more minimal control.
- **shift-ctrl-enter-reload**: Workflow shortcut `Shift+Ctrl+Enter` sources the file to run the app (Viewer + Console), button becomes **Reload App**; make a change, `Ctrl+S` to save, then `Shift+Ctrl+Enter` to reload and see the change instantly on Viewer; also `Ctrl+2` to focus console + `Esc` `Esc` to stop the app.
- **background-job**: Alternative to console busy-state is to run the app as a **Background Job** (Jobs pane) via Run App → Background Job → `Shift+Ctrl+Enter`; app still appears in Viewer plus a URL, but console stays free; downside each Reload spawns a new job.
- **shiny-autoreload**: Single-job scalable trick: create `autoreload.R` at project root with `options(shiny.autoreload = TRUE)` and `shiny::runApp()`, start via Jobs → Start Local Job selecting that file; the job's URL viewed via `rstudioapi::viewer(url)` updates on mere file save (`Ctrl+S`) without resourcing, keeping only one job; not compatible with package-based (`load_all`) workflows.


## Code Snippets & Formulas

Mangled fragments with normalized R:

```r
# RStudio template vs snippet
# File -> New Project -> New Directory -> Shiny Web Application  # creates project with app.R + .gitignore + demo
# Alternative: create app.R yourself + type shiny -> blue shiny functions vs white snippet icon on top -> Tab expands
shinyapp  # snippet name -> expands to:
# ui <- fluidPage(...)
# server <- function(input, output) {...}
# shinyApp(ui, server)  # "so that gives me more clearly the structure of an app the ui the server and the call to shiny app that uses that ui on that server" # shiny app <- shinyApp

# Small app example
library(shiny)
ui <- fluidPage(textInput("name", "name ?", value = ""))  # "text input function to allow the user to introduce their name" # text input <- textInput
server <- function(input, output) {
  output$greeting <- renderText(paste("Hello", input$name))  # "outputting a message that is the combination of the string hello with the name"
}
shinyApp(ui, server)

# Iterative workflow shortcuts (caption "shift ctrl and enter" -> Shift+Ctrl+Enter)
# Shift+Ctrl+Enter  # source the file -> runs in Viewer pane # "because i already have the whole app in one file i can press shift ctrl and enter and that will source the file"
# Button flips Run App -> Reload App
# Change label from "name ?" to "what's your name" -> Shift+Ctrl+Enter -> prompt to save -> Enter -> Viewer reloads
# Alternative: Ctrl+S to save then Shift+Ctrl+Enter without prompt # "instead of pressing shift ctrl enter right away i could do ctrl s to save the file so now if i do shift ctrl enter I won't be asked for confirmation"

# Display modes
# Run in Viewer Pane (default), Run in Window (pop-out), Run External / Open in Browser -> "closest to what the user will experience because that's on the web browser what they will see or or even their phones"
# URL via rstudioapi::viewer(url) # "you can also run something on the viewer saying rstudio api which is the package that i first do api we can use the function viewer with a url here"

# Console busy problem & background job
1 + 1  # when app running on console, Enter does nothing because console busy
# Solution: Run App -> Background Job (Jobs pane) instead of Console
# Shift+Ctrl+Enter now serves via Jobs pane, Viewer still shows, console free -> 1+1 -> 2
# Each Reload -> new job pile up: "when you go to the list of jobs that are running for every change that you did and every time you send you know you press that reload up you get a new job running"

# Autoreload single-job approach
# File autoreload.R at root:
options(shiny.autoreload = TRUE)  # "sets the option shiny dot out of reload to true" # shiny dot out of reload <- shiny.autoreload
shiny::runApp()  # "and then calls a shiny run app ... if the app is hosted in a file called dot dot at the root ... then i don't need to pass any argument ... first argument is get working directory" # dot dot <- .. / app.R, get working directory <- getwd()
# Launch: Jobs -> Start Local Job with autoreload.R active (auto-populated) -> Start -> single job with URL
rstudioapi::viewer("http://127.0.0.1:XXXX")  # paste URL from job to show in Viewer # "you pass the url that you got from from the job so with that the app will display there"
# Now edits to app.R -> Ctrl+S -> auto updates in Viewer without Shift+Ctrl+Enter; Jobs stays at one job -> scalable
# Note: "the one thing that breaks is this one last trick that i showed when you create an autoreload file that just by saving the file you know updates the app that i didn't get to work ... maybe two workflows ... when you build a package is extremely helpful too ... load all function to source all the our functions"
```

