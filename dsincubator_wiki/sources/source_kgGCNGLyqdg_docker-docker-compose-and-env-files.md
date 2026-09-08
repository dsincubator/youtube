---
type: source
title: "Docker: docker-compose and env files"
source_file: "kgGCNGLyqdg_docker-docker-compose-and-env-files.md"
video_id: "kgGCNGLyqdg"
url: "https://www.youtube.com/watch?v=kgGCNGLyqdg"
lang: en
tags: ["ds-incubator", "docker", "containers", "docker-compose", "rocker"]
key_topics: ["docker-run", "environment-variables", "volume-mounts", "env-files", "docker-compose"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=kgGCNGLyqdg"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 684
    last_modified: "2021-08-31T00:00:00Z"
usage_window: { from: "2021-08-31T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# Docker: docker-compose and env files

## Summary

This session continues a Docker series and dissects a long `docker run` command that launches a `rocker/rstudio` container. The presenter breaks down `docker run -e PASSWORD=your-password --rm -p 8787:8787 rocker/rstudio`, explains image tags (e.g. R versions), environment variables as machine-wide post-its, `--rm` cleanup, and port `8787` as a doorbell/buzzer for connecting via `localhost:8787` to the RStudio server, including that `PASSWORD` inside the container becomes the RStudio login.

It then demonstrates changing the password by editing `-e`, shows a bind volume mount `--mount type=bind, source=$(pwd)/r, target=/home/rstudio/r` to share a host folder `R/script1.R` bidirectionally with the container (saving inside the container writes through to the MacBook), and notes case-sensitivity pitfalls. To avoid leaking secrets into shell history (`~/.histfile` with ~10k recent commands), it introduces a `.env` file (`PASSWORD` and `COOL_VAR=foo/bar`) loaded with `--env-file .env` and which must be added to `.gitignore`. Finally it translates the entire CLI invocation into a `docker-compose.yml` (service `rstudio`, `image: rocker/rstudio:latest`, `env_file: .env`, `ports: ["8787:8787"]`, volume mount) runnable with `docker compose up`, discusses `docker-compose.yaml` vs `.yml` naming, override files, multiple compose files, and closes with why Docker matters for reproducibility, debugging, GitHub Actions, and delivering a prebuilt PACTA-and-friends image to banks/IT.

## Key Concepts & Tools Taught

- **[docker-run]:** `docker run` creates a new little machine (box within a box) from an image; `rocker/rstudio` defaults to `latest` tag, tags distinguish versions (e.g. R 3.7) — "rocker r studio is the name of what we want to tell it to run and it defaults to the latest tag".
- **[environment-variables]:** Machine-wide post-its affecting the whole OS; `-e PASSWORD=your-password` sets literal string `your-password` inside the container, read by RStudio Server to set the login; shown via `env`/`printenv` lists differing per MacBook vs container, and `HOME` as example.
- **[volume-mounts]:** Bind mount taking a host folder into the container and back: `--mount type=bind source is print working directory slash r target is home rstudio r` ← `$(pwd)/r` → `/home/rstudio/r`; editing `script1.R` inside RStudio writes through to host.
- **[env-files]:** `.env` file holding secrets (`password` and `cool variable pool bar` / `COOL_VAR` with value `foo bar` → `production`/`fubar`), passed with `dash n file is dot n env` ← `--env-file .env`; must be gitignored; avoids passwords in history file (`hist file` / `~/.histfile`).
- **[docker-compose]:** `docker-compose.yml` (or `.yaml`) as declarative replacement for the long `docker run` line — service `rstudio` with `image: rocker/rstudio:latest`, `env_file`, `ports`, `volumes`; run with `docker composed compose up` ← `docker compose up`; supports override files and multiple compose files (datastore project with five).

## Code Snippets & Formulas

Spoken captions mangled (quote kept) with normalized form:

```bash
docker run -e PASSWORD=your-password --rm -p 8787:8787 rocker/rstudio
# "we ran this docker run dash the password is your password dash rm dash p 87 87 87 87 rock garage studio"

# environment variables
-e PASSWORD=your-password   # "dash e is saying i want to pass an environment variable"
--rm                       # "dash rm flag means remove everything after we're done"
-p 8787:8787               # "dash p87 87 ... expose port 8787"
# connect
# "go to localhost which is the name of my apartment building" then "ring doorbell 8787" → RStudio login with "your-password"

--mount type=bind,source=$(pwd)/r,target=/home/rstudio/r
# "dash dash mount type is bind source is print working directory slash r target is home rstudio r"

# secrets file
cat .env
# PASSWORD=<secret>
# COOL_VAR=foo bar   # "cool variable pool bar" / "cool bar is production" / "fubar" / "poo bar"
docker run --env-file .env -p 8787:8787 --mount type=bind,source=$(pwd)/r,target=/home/rstudio/r rocker/rstudio
# "dash n file is dot n env" ← --env-file .env
# then "add the environment variable file the end file to your git ignore"

# docker compose
# docker-compose.yaml / docker-compose.yml
cat docker-compose.yaml
# services:
#   rstudio:
#     image: rocker/rstudio:latest
#     env_file: .env
#     ports: ["8787:8787"]
#     volumes: ["./r:/home/rstudio/r"]
docker compose up
# "docker composed compose up" / "docker compose up"
# "whatever your current working directory is if you use docker compose that will look ... for dockercompose.yaml"
```
