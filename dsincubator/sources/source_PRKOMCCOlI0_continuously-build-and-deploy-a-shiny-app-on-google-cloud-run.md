---
type: source
title: "Continuously build and deploy a shiny app on Google Cloud Run"
source_file: "PRKOMCCOlI0_continuously-build-and-deploy-a-shiny-app-on-google-cloud-run.md"
video_id: "PRKOMCCOlI0"
url: "https://www.youtube.com/watch?v=PRKOMCCOlI0"
lang: en
tags: ["ds-incubator", "shiny", "cloud", "google-cloud", "cloud-run"]
key_topics: ["google-cloud-run", "docker", "shiny-packaging"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=PRKOMCCOlI0"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 688
    last_modified: "2024-07-05T00:00:00Z"
usage_window: { from: "2024-07-05T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# Continuously build and deploy a shiny app on Google Cloud Run

## Summary

The video demonstrates how to containerize and continuously deploy a Shiny app on Google Cloud Run, building on a demo shared by Jacqueline Noes at Cascadia R 2024. The motivation is Cloud Run's ability to scale on demand, shut down when idle, and remain cheap even while running, which suits production Shiny apps with variable load.

The presenter structures the app as an R package, following the Mastering Shiny book. The app lives in `R/run_app.R` as a `run_app()` function that wraps `shinyApp()` and prints "Hello World", with `shiny` imported in `DESCRIPTION` (whole-package import because many Shiny functions are used) and `pkgload` suggested for loading. The launch file `app.R` sets deployment-required networking options — `port 8080` and `host 0.0.0.0` — then calls load-all and `run_app()`. The port choice is the main headache: `8080` is effectively required for Cloud Run despite trying `3838` (the rocker/shiny default), and must be set both in `app.R` options and exposed in the Dockerfile.

The Dockerfile starts `FROM rocker/shiny` (latest), which provides Shiny and Shiny Server, copies the project to the Shiny Server app directory, sets `WORKDIR`, installs `pak` and then `pak::pak()` to install the package plus dependencies, `EXPOSE 8080`, and `CMD Rscript app.R`. Local verification uses `docker build -t my-app` and `docker run --rm -p 8080:8080 my-app`, confirming the app is reachable at `0.0.0.0:8080`. For continuous integration, the GitHub repo `my-app` is connected via Cloud Run → Create service → Continuously deploy from GitHub with Cloud Build, selecting the repo and Dockerfile, completing authentication, and obtaining a service URL. Pushing to `main` triggers a rebuild — demonstrated by capitalizing the greeting, committing and pushing, then watching the new build appear in build history and the URL reflect the change.

## Key Concepts & Tools Taught

- **[google-cloud-run]:** Fully managed container service that builds and serves from a GitHub repo on every push, scales to demand and shuts down when idle.
- **[docker]:** Containerization workflow for the app: base image, copy, install, expose port, build and run locally before cloud deploy.
- **[shiny-packaging]:** Structuring a Shiny app as an R package per Mastering Shiny — app code in `R/run_app.R` as `run_app()`, `app.R` as thin launcher that loads the package and calls the function.
- **[port-8080-and-host-0.0.0.0]:** Networking options required for Cloud Run; `port 8080` must be set in `app.R` options and exposed in the Dockerfile, overriding the default `3838`.
- **[pak-package-installation]:** Using `pak` to install the package and dependencies inside the image rather than manual `install.packages` loops.
- **[continuous-deployment-from-github]:** Linking the GitHub repo to Cloud Run via Cloud Build (create service → set up continuous deploy → select `my-app` → choose `Dockerfile`) so pushes to `main` auto-rebuild.
- **[local-container-verification]:** Testing the containerized app with `docker build` / `docker run -p 8080:8080` and checking `0.0.0.0:8080` before deploying to the cloud.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```r
# app.R — port/host options required for Cloud Run
options(shiny.port = 8080, shiny.host = "0.0.0.0")  # "port and the hosts of this app ... important for deploying it to Google CL around"
pkgload::load_all()  # "Dev Tools load all actually is re-exporting uh the function load all from package load so here I'm calling package load itself" <- "package load"
run_app()            # "function name is runor app ... wraps the shiny app" <- "runor app"

# DESCRIPTION
# Imports: shiny   # "because it's used in the art directory"
# Suggests: pkgload  # "suggested ... we need it when the app deploys ... use it here in suggests" + "we need it to be installed in the environment"
```

```dockerfile
# Dockerfile — structure shown in video
FROM rocker/shiny  # "we start from the image rocker shiny the latest version" <- "rocker shiny"
COPY . /srv/shiny-server/my-app
WORKDIR /srv/shiny-server/my-app
RUN R -e "install.packages('pak')"  # "installing uh the package pack ... for that you need first to install" <- "pack"
RUN R -e "pak::pak()"              # "just call pack pack it allows us to install the package ... and all its dependencies" <- "pack pack"
EXPOSE 8080  # "expose the port 8080 which is ... almost a requirement uh for a Google Cloud run" <- "P 880"
CMD ["Rscript", "app.R"]  # "we're going to Simply call the the script app. R" <- "app. R"
```

```bash
docker build -t my-app -f Dockerfile .  # "we now can do a doer build we can tag this as um my app and let's build with the doer file" <- "doer build" / "doer file"
docker run --rm -p 8080:8080 my-app     # "we're going to do go run uh so this is going to be interactive we let's just remove it after ... the port is going to be uh 8080 to 8080 and the image is going to be my app" <- "go run"
# verifies listening on 0.0.0.0:8080  # "listening into the host 00000000 at the port 8080" <- "00000000"
gh browse  # "this is G browse so if I browse to GitHub you can see that yes I do have a repo it's in my user account it's called my app" <- "G browse"
# Cloud Run UI: Create service -> Continuously deploy from GitHub -> Set up with Cloud Build -> select my-app -> Dockerfile -> Create (authentication required)
```
