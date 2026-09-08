---
type: source
title: "Docker: Getting started with the Rocker project"
source_file: "qY5ForDjgGY_docker-getting-started-with-the-rocker-project.md"
video_id: "qY5ForDjgGY"
url: "https://www.youtube.com/watch?v=qY5ForDjgGY"
lang: en
tags: ["ds-incubator", "docker", "rocker", "terminal", "reproducibility"]
key_topics: ["docker-rocker", "docker-run", "rstudio-in-docker", "reproducibility-via-docker", "docker-reference-help"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=qY5ForDjgGY"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 2117
    last_modified: "2021-08-24T00:00:00Z"
usage_window: { from: "2021-08-24T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Docker: Getting started with the Rocker project

## Summary

As the inaugural meetup of a series on Docker for reproducible research, the talk emphasizes usage of pre-built images over building images from scratch and introduces the Rocker project (`rocker` = `docker` + `r`) as a source of Docker images for R. Context is the `ds.docker` repository on the 2DegreesInvesting GitHub organization, whose `README` holds the syllabus and check-boxed capabilities (e.g., using a Unix terminal on Windows). The speaker, relatively new to Docker with support from Alex, demonstrates two entry points: first running plain R, then running RStudio from the browser. Prerequisites are a working Docker installation (install instructions linked from the Rocker site per OS; help desk offered for per-machine troubleshooting). The first command, `docker run --rm -ti rocker/r-base`, is executed in a host Ubuntu terminal and starts R 4.1.1, verified by `1 + 2 = 3`, to illustrate that the experience is not host-bound — the containerized R would work even if R were not installed locally. The second command chain launches RStudio Server: `docker run -d -p 8787:8787 -e PASSWORD=yourpassword rocker/rstudio` (the `-p 8787:8787` publishes the service, `-e PASSWORD=...` sets the login, `-d` detaches), after which pointing the browser to `localhost:8787` and logging in as `rstudio` / `yourpassword` yields a full RStudio session, described as "not your computer" — accessible from any machine with Chrome and Docker alone, without installing R or RStudio locally. The motivation framing, expanded by Alex, likens a Docker image to FedEx-ing a specially set-up laptop: instead of sharing fragile setup instructions line-by-line, you ship the entire working computer so collaborators get the same behavior or the same failure, making debugging deterministic. Timing guidance is given: use raw local exploration for rapid prototyping, then once a script is sketched and ready to share, move it into a container to capture the exact system and R dependencies (beyond `renv`'s R-only scope, covering external system libraries). The remainder breaks down the `docker run` CLI: every Docker command starts with `docker`, `docker --help` lists subcommands (`run` = "run a command in a new container"), `docker run --help` filters to that subcommand, and the definitive Docker reference pages (`docs.docker.com/reference`) document required versus optional brackets. Specifically, `docker run --rm -ti rocker/r-base` is dissected: `rocker/r-base` is the image placeholder (Rocker maintains many images; this one starts R by default), `--rm` (clean-up section) creates ephemeral computers that are deleted on exit to save disk (half of Alex's 128 GB example), and `-ti` provides an interactive TTY terminal versus non-interactive detached logs for the RStudio image, which is interacted with via the browser instead. Prerequisites and scale cautions (disk usage) are reiterated.

## Key Concepts & Tools Taught

- **[docker-rocker]:** Rocker project providing Docker images for R (caption "project called rocker provides which is a word smashed between docker and r so docker images for r").
- **[docker-run]:** `docker run` to start a command in a new container, with required `docker`, `run`, `IMAGE` versus optional `[OPTIONS]` (caption "the very first page has two the two lines ... the first line ... if you have already in docker installed what we'll do we'll start r but in docker ... i'm gonna jump to a terminal ... paste that line ... run it ... started r in my computer ... 4.1.1 ... docker run ... runs a command in a new container").
- **[rstudio-in-docker]:** Running RStudio Server in a container publishing `8787`, logging in as `rstudio` (caption "how can i use docker to run our studio ... docker ... port 8787 ... localhost8787 ... log into our studio ... user is going to be our studio and the password is going to be your password ... was set in this command ... sign in ... that is our studio ... not your computer ... from the web browser").
- **[reproducibility-via-docker]:** Docker as FedEx laptop for sharing reproducible analyses beyond `renv`, capturing system dependencies and anti-friction for collaborators (caption "bundling up something into a doctor image rather than just doing it the way i've always done it ... think of this as a new computer ... except it is a computer that you can send to someone ... putting it into a fedex envelope and sending it to you ... sharing your analysis ... ultimate form of a reproducible example ... docker image contains not just the system info in r but like also all of the different things that live outside of r").
- **[docker-reference-help]:** Self-learning via `docker --help`, `docker run --help`, and online reference pages (caption "the word docker is gonna be in the beginning ... you can help yourself is just type docker dash help ... filtered manual specifically for a docker run ... the what's called the reference so for every command in docker there is a reference page ... not very easy to digest the first time ... the ones that are embraced by brackets are optional and the ones that are not are obligatory").

## Code Snippets & Formulas

```bash
# Prerequisite: Docker installed (link from rocker-project.org, per OS: mac / windows / linux)

# Self-help entry points (caption "docker dash help ... runs a command in a new container")
docker --help
docker run --help
# More detailed: https://docs.docker.com/engine/reference/commandline/run/  (reference page)

# 1. Plain R in a container (caption "rocker/r-base ... will do what i just showed you which is start another session")
docker run --rm -ti rocker/r-base   # caption "docker run --rm -ti rocker/r-base" (captured as "roger slash rbase")
# Inside container:
R
# R version 4.1.1 ... 1 + 2  -> 3

# 2. RStudio Server in a container (caption "you need to do ... running our studio in the terminal ... publishing that address ... localhost 8787")
docker run -d -p 8787:8787 -e PASSWORD=yourpassword rocker/rstudio
# -d detached, -p 8787:8787 publish, -e PASSWORD sets login
# Then browse to http://localhost:8787  (caption "pointed the browser to that address ... localhost 8787 it was auto completed ...")
# Login: user = rstudio , password = yourpassword (caption "user is going to be our studio and the password is going to be your password ... sign in")

# Verify and clean up (caption "ctrl l ... open the terminal ... remove ... cleaning up section ... --rm ... creates ephemeral computers ... delete that computer ... doesn't take up space")
docker ps
docker logs <container>
docker stop <container>  # --rm ensures auto-removal
```

```r
# R inside container behaves identically
1 + 2  # -> 3
```
