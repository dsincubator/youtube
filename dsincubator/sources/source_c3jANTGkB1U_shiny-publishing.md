---
type: source
title: "Shiny: Publishing"
source_file: "c3jANTGkB1U_shiny-publishing.md"
video_id: "c3jANTGkB1U"
url: "https://www.youtube.com/watch?v=c3jANTGkB1U"
lang: en
tags: ["ds-incubator", "shiny", "github", "docker", "containers"]
key_topics: ["shinyapps-io", "gist-reprex-sharing", "mybinder-org", "install-r-runtime-txt", "docker-cache-reuse", "r-package-shiny-deployment"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=c3jANTGkB1U"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 47
    last_modified: "2021-08-10T00:00:00Z"
usage_window: { from: "2021-08-10T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# Shiny: Publishing

## Summary

This closing session of the Shiny series maps methods to publish a Shiny app by ability to keep it free, setup complexity for the developer, and audience (web-browser only vs. has R). It outlines three tiers and where to learn more via syllabus links. **Super simple for browser users:** **shinyapps.io** (Shiny team's service) is the simplest for both developer and user — log in (via Sign Up, confusingly), connect RStudio via Manage Accounts → paste the token/code from shinyapps.io's token section, publish via the publishing button, control the app name in the URL (`<name>.shinyapps.io/<app-name>`), demonstrated with `admin` invoice and timesheet apps; the user then only needs a browser, but free tier is limited to ~5 apps. **Super simple for R users:** if the app fits in one script (including `library(shiny)`), create a **reprex** and share as a single-file **gist** on `gist.github.com` (a repo is a folder, a gist is a single file with history) as `my app.md` with ```r fences, make it public, shorten via `git.io` (GitHub link shortener), and recipients run it locally with `Ctrl+Enter` — simplest for the developer but requires the user to have R. **Middle complexity for browser users:** **mybinder.org** via **Binder** — handles more than 5/20/500 apps for free by spinning a server on demand; the speaker cites Florencia's slide deck. Setup requires `install.R` (e.g., `install.packages("shiny")`) and `runtime.txt` (R version + MRAN snapshot date, a clone of CRAN on a specific date) plus the `app.R` folder at the GitHub repo root (example RStudio's `rocker` alternative host not needed here). Binder reads the repo, builds a Docker container, and serves the app at a clunky Binder URL (shortenable). It takes time the first time because it builds a full Docker container with all scripts (excellent reproducibility for papers), then reuses the container (Docker cache) quickly until the repo changes. The user experience is fluid (just a link, no R needed). **Complex R-package-based methods** are only outlined: packaging the Shiny dashboard/application as an R package (e.g., `golem`) distributed via CRAN/local install lets users with sensitive, private data run the app locally on their own machine without data ever leaving their system — the only viable path when clientele are twitchy about data leaving or when aggregates cannot be safely de-identified. Discussion notes that well-documented dependencies and toy data are crucial for this route, since secure offline machines may allow only two read-only network shares and require all versions upfront; missing a dependency can delay work by weeks. The need for accessible toy datasets (still missing for PACTA) is highlighted as a reproducibility enabler.

## Key Concepts & Tools Taught

- **shinyapps-io**: Free (limited) hosting via **shinyapps.io**; developer logs in, connects RStudio via token copy-paste from dashboard, publishes to `<name>.shinyapps.io/<app>`; user needs only a browser; easy to set up and use but app count limited.
- **gist-reprex-sharing**: For R audiences, share a standalone app as a **reprex** single script via a public **gist** on `gist.github.com` (`my app.md` with ```r fences, Markdown), shortened with `git.io`, runnable by copying into R with `Ctrl+Enter`; no folder structure, version-tracked like a repo.
- **mybinder-org**: Free multi-app alternative **mybinder.org** that builds and hosts an app or RStudio session on demand from a GitHub repo, spinning a server for the visitor; user gets just a link, no R required; suitable for papers needing reproducible code + app.
- **install-r-runtime-txt**: Binder setup needs `install.R` (declare `install.packages(...)` for needed packages) and `runtime.txt` (specifies R version and MRAN snapshot date) at repo root alongside `app.R`.
- **docker-cache-reuse**: First Binder build creates a full **Docker** container (hence slow but standalone and reproducible) pulling from **Docker Hub**; subsequent visits reuse the cached container until the repo changes, then cache is invalidated and rebuild is required.
- **r-package-shiny-deployment**: Complex route packages the Shiny app inside an **R package** (private-data pattern: public code, private data); users install the package locally and launch the app without internet, so sensitive data never leaves their machine; requires complete dependency documentation and toy data (emphasis on availability for PACTA).


## Code Snippets & Formulas

Mangled spoken forms preserved:

```r
# shinyapps.io
# "shiny apps dr io which is service developed by the shiny team" # shiny apps dr io <- shinyapps.io
# "you log into shinyapps.io you just go to shinyapps.io and then it's kind of tricky that the login to get to the login you have to click on the sign up" # sign up -> log in
# RStudio UI: Manage Accounts -> paste token code from shinyapps.io -> Publish button
# URL pattern: mauro-lepore.shinyapps.io/admin-app  # "how the url I'm typing here starts with my name then follows with signing apps that i owe and then the name of the app"

# gist sharing (caption "gist dot github dot com" <- gist.github.com, "reprice" <- reprex)
library(shiny)  # standalone app needs attached environment line 1
# ```r
# ui <- fluidPage(textInput("name", "name ?"))
# server <- function(input, output) {...}
# shinyApp(ui, server)
# ```
# create gist: my app.md  # "I'm going to call it my app.md i like md because md is stands for markdown ... backtick by tickbacktickr r then paste the code and again but tick back tick back tick"
# shorten: https://git.io/XXXX  # "i do git.io which is aware of links that live on github and then you can shorter them" # git.io

# mybinder.org (caption "my vendor" <- mybinder, "mybinder dot org" <- mybinder.org)
# Repo structure:
# ./
#  app.R
#  install.R        # "install dot r where you will declare calls like install.packages shiny" # install dot r <- install.R
install.packages("shiny")  # "install dot r"
#  runtime.txt      # "runtime dot txt" # runtime.txt specifies R version + MRAN snapshot date like "r-2021-08-10"
# "the runtime the text only the only thing that it does is explains the r version that you want to run and the exact date from uh from which you would like all packages to be installed so basically a snapshot of mrang which is like a clone of cran" # mrang <- MRAN
# Binder URL creation via mybinder.org interface from GitHub repo -> launch -> Docker build -> app URL "a little clunky it's developed you know by by binder it's not a user friendly url but you can always shorten it"

# Docker cache note (Jackson Q&A)
# "does it spin up a like a docker container every time you click on the link so it wouldn't it wouldn't uh like it'll take that long every time" -> answer: first time creates container as long as it takes, second time reuses container via cache until repo changes, then rebuild; "docker has an amazing cache system meaning that docker knows what stuff can be reused and what time was stuff has to be rebuilt"
```

