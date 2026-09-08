---
type: source
title: "cloud: Use case -- host shiny apps"
source_file: "JdFA31-vJUE_cloud-use-case-host-shiny-apps.md"
video_id: "JdFA31-vJUE"
url: "https://www.youtube.com/watch?v=JdFA31-vJUE"
lang: en
tags: ["ds-incubator", "shiny", "containers", "docker", "cloud"]
key_topics: ["shiny", "docker", "digitalocean", "shiny-server", "containers"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=JdFA31-vJUE"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 115
    last_modified: "2022-06-14T00:00:00Z"
usage_window: { from: "2022-06-14T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# cloud: Use case -- host shiny apps

## Summary

Use case 4 of the cloud computing series, showing how to host Shiny apps on a cloud droplet using Docker and the Rocker project. The premise is that a Shiny app needs a server— a computer running R that computes and serves HTML; locally your computer is that server, but to share via URL you need a remote host. Alternatives are `shinyapps.io` (free tier ~5 apps, paid 25/unlimited) or bundling the app inside an R package for others to run locally; using an existing cloud droplet is presented as cost-effective and unlimited.

The demo uses DigitalOcean: an already-created Ubuntu 20.04 droplet with Docker (1 GB RAM, 25 GB disk), identified by its IPv4 address. Connection is via `ssh root@<IPv4>` using an SSH key. Initial check `docker ps -a` shows no containers.

Workflow: (1) Create the app in a Rocker RStudio container. Run `docker run --rm -t -p 8787:8787 -v /mnt:/mnt --name rstudio -e PASSWORD=123 -e ROOT=TRUE rocker/rstudio` (the presenter breaks down `--rm` remove on stop, `-t` keeps terminal interactive detached, `-p 8787` droplet-to-container port meeting point, `-v /mnt:/mnt` volume mounting host ↔ container, `--name`, environment variables). Open `http://<IPv4>:8787` in browser, log in `rstudio`/`123`, create New Project → Shiny Application named `app` (template `app.R`), run it, then move it via `sudo mv ~/app /mnt` so it appears on the droplet host at `/mnt/app`. Stop the RStudio container with `docker stop rstudio`.

(2) Publish by moving the folder to where Shiny Server expects it: `mkdir -p /srv/shiny-apps && mv /mnt/app /srv/shiny-apps/`. An `ls /srv/shiny-apps` shows multiple apps can coexist, demonstrating no per-app limit.

(3) Serve with `docker run --rm -d -p 3838:3838 --name shiny -v /srv/shiny-apps/:/srv/shiny-server/ -v /var/log/shiny-server/:/var/log/shiny-server/ rocker/shiny` (port 3838 meeting point as documented for `rocker/shiny`, volumes mapping apps and logs). Verify with `docker ps`, then visit `http://<IPv4>:3838` for an index of apps and `http://<IPv4>:3838/app/` for the live app (also demoed with a second app). Remarks cover scaling limits of a small droplet, caution about Kubernetes auto-scaling blowing up bills, and the public-by-default nature of the URL. Pointers to Rocker website, volume docs, and the ds-incubator terminal/Docker series close the session.

## Key Concepts & Tools Taught

- **[shiny]:** R framework where UI code generates HTML frontend and server code handles behavior; a server computer runs R and exposes computation as a web app; runnable locally via Run button or remotely via a Shiny Server URL.
- **[docker]:** Container runtime used to isolate RStudio and Shiny Server; commands `docker ps`, `docker run`, `docker stop`; flags `--rm`, `-t`/`-d`, `-p`, `-v`, `--name`, `-e` explained in the demo.
- **[digitalocean]:** Cloud provider supplying a droplet (Ubuntu 20.04 on Docker) identified by IPv4; accessed via `ssh root@<IPv4>` with SSH key; $100/2-month credit mentioned; cost-control via caps/notifications noted.
- **[shiny-server]:** Program that serves apps found at `/srv/shiny-apps` (copied via `/srv/shiny-apps:/srv/shiny-server/` volume mapping inside `rocker/shiny`); exposes them on port 3838; logs at `/var/log/shiny-server/`; supports unlimited apps.
- **[containers]:** Isolated computers inside the droplet (rocker/rstudio and rocker/shiny images from the Rocker project); sharing between host and container done through mounted volume `/mnt`; naming and port mapping define the meeting point of the two networks.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```bash
ssh root@<IPv4>                         # "using ssh which is a program that allows me to use a special key ... ssh ... root the most privileged user ... at and i'm going to paste that address that i copied from from the dashboard of digitalocean"
docker ps -a                            # "do a docker ps to see if i have anything running with minus a ... container running"

docker run --rm -t -p 8787:8787 \       # "docker run will run a container minus minus remove will remove that container once it is stopped ... minus t is gonna leave the terminal available to interactive work ... minus p8787 is just a way to tell where two computers can meet"
  -v /mnt:/mnt \                        # "the minus v flag ... allows you basically to pass folders files ... on the left hand side you have the droplet so there is a directory inside the droplet a folder called mount mnt ... anything that i create inside the container and i put there in that folder mount is going to appear automatically on the droplet"
  --name rstudio \                       # "to name this container our studio because the purpose for me is going to be running our studio"
  -e PASSWORD=123 -e ROOT=TRUE \       # "environment viral called password with the numbers one two three ... environment variable called root ... to true so that inside the container i have privileges"
  rocker/rstudio                        # "comes from the rocker project it is a container that runs our studio and server it's called"
# access at http://<IPv4>:8787  login rstudio / 123

sudo mv ~/app /mnt                      # "use sudo ... to move the app directory to the directory m and t mount ... from the droplets ... now a docker ps ... there is a container there rstudio"
docker stop rstudio                     # "do a docker stop r studio ... it's gone because i said that remove flag"
ls /mnt && mkdir -p /srv/shiny-apps && mv /mnt/app /srv/shiny-apps/  # "making a directory inside the server folder called shiny apps and then we are moving the app that we have already in mount app ... to server chevy apps"

docker run --rm -d -p 3838:3838 \       # "we're going to ask docker to run a specific container that is coming from the image rugged shiny ... remove ... detached so the terminal is interactive now the address where the droplet meets the container is a different one it's 3838"
  --name shiny \
  -v /srv/shiny-apps:/srv/shiny-server \
  -v /var/log/shiny-server:/var/log/shiny-server \
  rocker/shiny                          # "that is coming from the image rugged shiny ... we're going to name it shiny ... the volume flag ... whatever we put in this server shiny apps folder ... are now going to appear inside the container that is running shiny server is going to appear in this other folder ... and the same thing for the logs"
docker ps                               # shows shiny container
# visit http://<IPv4>:3838 and http://<IPv4>:3838/app/
```
