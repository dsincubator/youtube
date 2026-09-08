---
type: source
title: "Shiny: Packages"
source_file: "O_tkgjsUT6g_shiny-packages.md"
video_id: "O_tkgjsUT6g"
url: "https://www.youtube.com/watch?v=O_tkgjsUT6g"
lang: en
tags: ["ds-incubator", "shiny", "r-packages", "workflow", "testing"]
key_topics: ["shiny-app-as-package", "usethis-workflow", "description-imports", "load-all-dev-workflow", "r-cmd-check"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=O_tkgjsUT6g"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2021-08-03T00:00:00Z"
    usage_count: 59
usage_window: { from: "2021-08-03T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Shiny: Packages

## Summary

Presented as one of the last chapters of the Shiny series, this meetup argues that R packages are infrastructure for scaling Shiny development when apps become numerous or large, and for distributing them. A single-file app (`app.R`) that lets users pick a dataset from the base `datasets` package (e.g., `cars` ← "empty cars", `BOD`, `VoD` / `vo d` described as "this very tiny data frame") and renders a `summary` + `table` is refactored live into a minimal package following the *Mastering Shiny* "Converting an existing app" guide.

Benefits highlighted are threefold: (1) workflow — reusing package tooling and keyboard shortcuts, (2) distribution — packaging gives an installable artifact (`install_github` ← "install underscore github and install your app" hosting on GitHub or CRAN, plus exported launcher functions), and (3) testing — easy `testthat` infrastructure, including special frameworks for reactive functions.

The live steps are: create an `R/` folder ("create a folder and call it r it has to be called that way ... convention in our packages"), move `app.R` into `R/` (noting `app.R` is discoverable at the root for shinyapps.io but renameable inside `R/`), wrap all code in a function (`dataset_summary` ← "let's call it because this creates a data set summary ... data set or summary data set summary data set" — no arguments, indent the body, function `summary data set`), then turn the project into a package by adding a `DESCRIPTION` ("any project that has a file called description with a correct structure ... will become automatically in our package") via `usethis::use_description()` ← "use this use description ... add in the root ... this file called description" (`myApp` example), and regenerating the `.Rproj` via `usethis::use_rstudio()` ← "use this use rstudio ... asking me if i want to overwrite it" so RStudio recognizes a package project. RStudio must then be restarted by reopening the project via the switcher ("click on the name of the same project ... not just restarting your r session which you could do with shift ctrl f10 but it is restarting our studio"), after which the **Build** tab appears (previously absent) with **Check**.

With the new package, `Ctrl+Shift+L` (`devtools::load_all` ← "ctrl shift l and that will load all the functions and so you no longer need to source any code") loads the app without `source()`, prompting to save if needed, then calling `summaryDataSet()` launches it; subsequent history `↑` + Enter retriggers, and edits (e.g., label to "DATA SET" ← "data set all caps") appear after another `load_all`. A second advantage — bundling multiple apps as multiple wrapper functions in one package — is noted.

A participant adds that package checks help reproducibility and collaboration versus stray scripts ("ensures that reproducibility of the app ... don't have some stray scripts ... packages that fall together it forces you to develop like that"). The speaker then makes the package incrementally CRAN-compliant. Running **Check** (`R CMD check` ← "command that is called rcmd check") initially reports 2 warnings + 1 note (severity: errors > warnings > notes). The first violation is `library(shiny)` ← "library ... called library" inside a package; instead dependencies belong in `DESCRIPTION` `Imports` ("if you need to use a package inside another package ... you list that package in a field called imports inside the file description") via `usethis::use_package("shiny")` ← "use this use underscore package ... say which package is the one that we want to use ... shiny", plus an import declaration (`@import shiny` or per-function `@importFrom`) — illustrated as "the function fluid page comes from shiny and then the function select input also comes from shiny ... instead ... you can just say add import and say the name of the package ... this is considered not a good practice and instead the better practice is to import each function specifically but in the case of ... shiny app where chinese use so heavily this is ... an exception". After removing `library(shiny)` and adding the import, **Check** improves to 1 warning. The remaining warning requests a `LICENSE` file, fixed via `usethis::use_mit_license()` ← "use uh something like mit license" ("use this without that license file"), after which the package approaches clean compliance. The next meetup plan is publishing (audience-dependent: local R install vs. pure web browser) and a conditional show-and-tell before closing the series.

## Key Concepts & Tools Taught

- **[shiny-app-as-package]:** Moving a Shiny single-file app (`app.R` → `R/app.R`; `app.R` name special at root for shinyapps.io but arbitrary inside `R/`) and wrapping all code in `dataset_summary()` ← "summary data set ... function ... we don't need to pass any argument ... paste the code ... indenting" to obtain an exported launcher callable as `summaryDataSet()` / `dataset_summary()`, enabling multiple apps per package via multiple wrappers.
- **[usethis-workflow]:** Scaffolding helpers `usethis::use_description()` ← "use this use description ... add ... file called description" (creates `DESCRIPTION` turning folder into package), `usethis::use_rstudio()` ← "use this use rstudio ... overwrite it" to regenerate `.Rproj` as package project, and `usethis::use_package("shiny")` ← "use this use underscore package ... shiny" to add `Imports`, plus restarting RStudio via project switcher (not just `Shift+Ctrl+F10`) to activate the **Build** tab ("is the tab that package developers use ... check ... following the policies of crime").
- **[description-imports]:** Declaring dependencies in `DESCRIPTION` `Imports` ← "you list that package in a field called imports inside the file description" instead of `library(shiny)` ← "library shiny but actually here you're seeing the check is actually talking about this precise issue" / "library ... if you need to use a package inside another package", and importing functions (`shiny::fluidPage` ← "function fluid page comes from shiny", `shiny::selectInput` ← "function select input also comes from shiny") vs. package-wide `@import shiny` ← "you can just say add import and say the name of the package ... this is considered not a good practice" — acceptable as an exception for heavily-used Shiny.
- **[load-all-dev-workflow]:** Iterative development cycle `Ctrl+Shift+L` ← "ctrl shift l and that will load all the functions" (= `devtools::load_all()` / `Load All`) replacing `source()`, saving prompt ("that will pop up this window that com asks me to confirm if i want to save"), `↑` history to recall `summaryDataSet()` ("because i called the function summary that i said before it is in the history"), `Ctrl+1` to jump to source pane, `Ctrl+Enter` to source, and `Ctrl+Shift+T` ← "press shift ctrl t and i would ... run all my tests" (= `devtools::test()` / `testthat`), enabling fluid edits (e.g., label to caps).
- **[r-cmd-check]:** Package validation `R CMD check` ← "command that is called rcmd check" via **Build → Check** button, interpreting errors/warnings/notes severity ("errors are the worst ... warnings are the second worst and then the notes"), detecting missing `LICENSE` ← "there is no file basically called license so we need ... every package needs a license" fixed with `usethis::use_mit_license()` ← "use uh something like mit license", and installability via `remotes::install_github("<user>/myApp")` ← "install underscore github".

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```r
# App before packaging (single file app.R)
# explores base datasets package: datasets::cars, BOD/VoD ("very tiny data frame vo d")
# ui: shiny::fluidPage + shiny::selectInput + tableOutput/plotOutput; server: reactive + renderTable/renderPlot -> shinyApp(ui, server)
# launch single-file: source app.R -> shinyApp

# Step 1: create R/ and move app.R -> R/app.R, then wrap:
dataset_summary <- function() {                     # "let's call it ... summary data set ... we don't need to pass any argument"
  # paste prior app.R contents here, indented
  ui <- shiny::fluidPage(
    shiny::selectInput("dataset", "Dataset", choices = c("cars", "BOD")),
    shiny::tableOutput("table")
  )
  server <- function(input, output, session) { ... }
  shiny::shinyApp(ui, server)
}

# Step 2: make package
usethis::use_description()           # "use this use description ... add in the root ... this file called description" -> creates DESCRIPTION (Package: myApp)
usethis::use_rstudio()               # "use this use rstudio" -> overwrite .Rproj as package project
# restart RStudio via project switcher (click project name) — not just Session -> Restart R (Shift+Ctrl+F10)
# Build tab appears -> Check

# Dependency handling (instead of library(shiny)):
usethis::use_package("shiny")        # "use this use underscore package ... shiny" -> DESCRIPTION Imports: shiny
# In R/roxygen: either per-function
# @importFrom shiny fluidPage selectInput tableOutput shinyApp
# or package-wide (exception for Shiny-heavy apps):
# @import shiny                        # "you can just say add import and say the name of the package"
library(shiny)                         # REMOVE this line from package code ("we can remove that code to library")

# Iterative workflow
# Ctrl+Shift+L                         # "ctrl shift l and that will load all the functions" -> devtools::load_all()
dataset_summary()                      # launch app after load_all; recall via Up arrow + Enter
# Edit: change label to "DATA SET" ("data set all caps"), Ctrl+Shift+L, then Up -> Enter to see reflected

# Testing & checking
# Ctrl+Shift+T                         # "press shift ctrl t and i would ... run all my tests" -> devtools::test() / testthat (incl. shinytest for reactives)
# Build -> Check                       # "command that is called rcmd check" -> R CMD check; severity: errors > warnings > notes
usethis::use_mit_license()             # "use uh something like mit license" -> adds LICENSE / LICENSE.md

# Distribution
remotes::install_github("your-org/myApp")  # "install underscore github and install your app" -> install & launcher via exported function
```
