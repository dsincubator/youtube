---
type: source
title: "cloud: Use cases"
source_file: "NF7HPKt55Yk_cloud-use-cases.md"
video_id: "NF7HPKt55Yk"
url: "https://www.youtube.com/watch?v=NF7HPKt55Yk"
lang: en
tags: ["ds-incubator", "terminal", "cloud", "r-packages", "docker"]
key_topics: ["digitalocean-resizing", "ssh-remote-access", "rocker-images", "docker-detached-containers", "rstudio-background-jobs"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=NF7HPKt55Yk"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2022-06-07T00:00:00Z"
    usage_count: 25
usage_window: { from: "2022-06-07T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# cloud: Use cases

## Summary

This is the second meetup in the cloud-computing series, framed as three user-story use cases. The first is scaling compute up or down on demand: write code on a cheap machine, then rent a more powerful machine only for the analysis. The second is obtaining a complete, isolated R environment without polluting local configurations, and the third is running long-running processes unattended while the local laptop can be closed.

The scaling demo uses DigitalOcean droplets. The presenter logs in (noting the $100 credit over two months), opens the demo project droplet, shows that resizing requires powering off first ("you need to first turn off the droplet" with warnings), then resizes from a $10/month 2 GB instance to a $5/month 1 GB instance ("about half as well from ten dollars a month i will be going down to five dollars a month", fraction "$0.007" per hour), waits for the progress bar, and powers it back on. The same clicks apply to scaling up to memory-optimized presets (e.g., 16 GB for ~$80/month).

The isolation demo connects from a local terminal to the droplet via `ssh` ← "ssh" / "ssh roots" as `root` at the droplet's IP, clears with `Ctrl+l`, and then uses Rocker images ("the rocker project is ... probably the best place for our users because they build little computers called logger images or templates for computers called images"). A `rocker/rstudio` ← "rocker r studio" container is started and accessed at `<ip>:8787` with user `rstudio` / password `your password`, then `library(tidyverse)` ← "library uh time reverse" / "library tiny verse" fails, motivating the switch to `rocker/verse` ← "roker verse" / "rocker verse" (which bundles tidyverse and R Markdown) with `Ctrl+c`, `Ctrl+l`, up-arrow and editing the image name. The long-running demo creates a detached container (`--name my job` + `-d` ← "minus d flag which detaches"), starts RStudio on port with password `123`, scaffolds an RStudio project with `usethis::create_project()` ← "use this create underscore project", adds `R/<file>.R` with `usethis::use_r()` ← "use underscore r", runs a loop that writes numbered files every five seconds (`text`/`file` → `file1.txt` via `writeLines()` ← "write lines"), then launches it via RStudio's **Source as Background Job** ← "source as a logo job" with working directory set to project root. With detached mode and background jobs the console stays interactive (`1+1` → 2) and work can continue or the local machine can be shut down. Verification in the host terminal uses `docker ps` ← "docker ps", `docker logs my job` ← "docker logs", and `docker exec my job ls` ← "docker exec ... will execute anything in a container" (inspected as `docker exec my job ls /home/rstudio`, then `ls -t` ← "minus t which is ... sort ... by time" piped to `head`).

## Key Concepts & Tools Taught

- **[digitalocean-resizing]:** Resizing droplets (`resize the droplet` ← "resize the droplet") on DigitalOcean to scale CPU/RAM/disk; requires `Turn off` before `Resize`, pay-per-hour billing (e.g., 2 GB → 1 GB, $10 → $5/month, $0.007/hour), presets for memory vs. disk optimization.
- **[ssh-remote-access]:** Remote shell with `ssh` ← "ssh" / "ssh roots" as `ssh root@<ip>` ← "ssh ... root ... and then ... paste the address", host vs. server distinction, `ssh` key, console access, and `Ctrl+l` ← "ctrl l" to clear.
- **[rocker-images]:** Rocker Project image stack (`rocker/verse` ← "roker verse" / "rocker verse", `rocker/rstudio` ← "rocker r studio", `rocker/geospatial` mentioned) as pre-built, isolated environments with incremental software (R → RStudio → tidyverse → verse/geospatial), accessed via `8787` and `rstudio`/`your password`.
- **[docker-detached-containers]:** Docker lifecycle for use cases: `docker ps` ← "docker ps" to list `my job` container, `-d` detach ← "minus d flag which detaches", `--name my job`, `docker logs my job` ← "docker logs", `docker exec my job <cmd>` ← "docker exec ... my job and then anything ... will be executed ... inside the container", `Ctrl+c` to end foreground process, and inspection patterns `docker exec my job ls /home/rstudio/abc` + `ls -t` + `| head`.
- **[rstudio-background-jobs]:** RStudio **Source as Background Job** ← "source as a logo job" (Source menu) to run `R/<file>.R` unattended, setting working directory to project root, with `usethis::create_project()` ← "use this create underscore project" → `abc` project, `usethis::use_r()` ← "use underscore r" → `R/` file, `writeLines(text, file)` ← "write lines", and `library(tidyverse)` ← "library tiny verse" check to validate the image.

## Code Snippets & Formulas

Spoken commands dictated live (caption-mangled, normalized here):

```sh
# DigitalOcean — power off, then resize, then power on (via UI: ... > Resize the droplet)
# cost example: $10/month (2 GB) -> $5/month (1 GB), $0.007/hour

# Connect to droplet
ssh root@<droplet-ip>          # "ssh roots" / "ssh ... root ... paste the address"
# clear: Ctrl+l                 # "ctrl l"

# Rocker images — foreground rstudio, then verse
docker run --rm -p 8787:8787 -e PASSWORD="your password" rocker/rstudio  # "rocker r studio" at "<ip>:8787", user rstudio / "your password"
docker run --rm -p 8787:8787 -e PASSWORD="your password" rocker/verse    # "roker verse" / "rocker verse" — includes tidyverse + R Markdown

# Detached container for unattended work
docker run -d --name my job -p 8787:8787 -e PASSWORD=123 rocker/verse    # "minus d flag which detaches" / "give a name to the container ... my job"
docker ps                      # "docker ps" — shows my job (Up 6 minutes)
docker logs my job             # "docker logs if you want with the name of the container"
docker exec my job ls /home/rstudio          # "docker exec ... my job and then anything ... ls will be executed ... inside the container"
docker exec my job ls -t /home/rstudio/abc   # "minus t which is a flag to a list ... sort ... by time"
docker exec my job ls -t /home/rstudio/abc | head  # "pipe that into head to only see the last top ... 533 534"

# Inside RStudio Server (rocker)
# user: rstudio, password: "your password" (or 123 for detached)
```

```r
usethis::create_project("abc")   # "use this create underscore project and the name of the project"
usethis::use_r("my-script")      # "use underscore r that creates a file inside r"
library(tidyverse)               # "library tiny verse" / "library uh time reverse" — fails on rocker/rstudio, succeeds on rocker/verse
# long-running demo loop (writes a file every ~5 seconds, 1..100):
# for (i in seq_along(1:100)) { text <- as.character(i); file <- paste0(i, ".txt"); writeLines(text, file); Sys.sleep(5) }
writeLines(text, file)           # "write lines to actually write that file"
# RStudio UI: Source -> Source as Background Job  # "source as a logo job" — set working dir to project root, Start
1 + 1                            # console stays live after launching background job -> 2
```
