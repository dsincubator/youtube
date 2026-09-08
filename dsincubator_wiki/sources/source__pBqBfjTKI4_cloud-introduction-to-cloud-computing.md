---
type: source
title: "cloud: Introduction to cloud computing"
source_file: "_pBqBfjTKI4_cloud-introduction-to-cloud-computing.md"
video_id: "_pBqBfjTKI4"
url: "https://www.youtube.com/watch?v=_pBqBfjTKI4"
lang: en
tags: ["ds-incubator", "cloud", "docker", "terminal", "dropbox"]
key_topics: ["cloud-computing", "client-server-droplet", "digitalocean-droplet", "docker-rocker-rstudio", "ssh-authentication", "cloud-costs-and-security"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=_pBqBfjTKI4"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 39
    last_modified: "2022-05-31T00:00:00Z"
usage_window: { from: "2022-05-31T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# cloud: Introduction to cloud computing

## Summary

This opening session of the cloud series defines **cloud computing** as delivery of computing resources as a service — resources you rent, not own, managed by the provider — and motivates it for organizations, researchers, developers, and interns who may not yet use it. Benefits are mapped per stakeholder: organizations save money by renting powerful machines only when needed instead of buying expensive hardware that ages; researchers get resources on demand without HR/shipping waits and with easy, safe software installs; developers get purpose-built templates and tooling close to the job; students/interns get quick access to a functional environment with private data already present. Data-storage examples like Dropbox and web-apps like Shiny are noted as cloud uses, but the focus is vanilla servers (a server is just a computer that serves a client). The live demo uses **DigitalOcean**, which calls a server a **droplet**, to create a project, choose **Ubuntu** (common Linux distribution) and a **Marketplace** image with **Docker** preinstalled (maintained by DigitalOcean), keep the $5/month basic droplet (25 GB storage), pick a nearby region, authenticate via **SSH keys** (vs. password, generated via RStudio per *Happy Git with R*), and create the droplet — noting creation takes a couple minutes. Alex's intervention adds concerns: the cloud is someone else's computer, so consider data sensitivity and security (providers' bread-and-butter but you are on the hook for leaks), and watch costs since most providers bill by the hour — an anecdote of forgetting a $5 machine for two years causing a $120 bill and the On/Off toggle. Exploration from console and from the local terminal via `ssh root@<ipv4>` (IPv4 address stable for the resource) shows `whoami` → `root`, `pwd`, `ls`, `ls -a` (hidden files), `ls /`, confirming **Docker** works with `docker run hello-world` (pulls from Docker Hub and prints hello). The session then launches RStudio Server via the **Rocker** image (`rocker/rstudio`), mapping port 8787 and replacing `localhost:8787` with `<droplet-ip>:8787` in the browser, logging in as `rstudio` with the chosen password, showing near-identical RStudio experience without local R installation and clarifying the manager vs. vanilla user roles.

## Key Concepts & Tools Taught

- **cloud-computing**: Delivery of computing resources as a service owned/managed by the cloud provider (you rent, not own); examples include Shiny web-apps, Dropbox data storage, and vanilla servers; managed for you (installs, fixes) so clients get expected service.
- **client-server-droplet**: A server is a computer that provides a service to your local computer (the client); different providers name it differently — DigitalOcean calls it a **droplet**.
- **digitalocean-droplet**: Hands-on creation flow: create Project → Create Droplet → choose OS **Ubuntu** (Marketplace) or vanilla → pick $5/month basic plan, optional storage/region → authenticate via **SSH keys** or password → name (ugly name reminds to delete) → Create → progress bar; demo duration noted.
- **docker-rocker-rstudio**: The droplet is created with **Docker** (allows mini-computers/ mini computers inside the server) via Marketplace template; verified with `docker run hello-world` (image template for little computer pulled from Docker Hub); then `rocker` images provide RStudio Server, run via Docker and accessed at `<ip>:8787` vs. local `localhost:8787`.
- **ssh-authentication**: Connection via `ssh root@<ipv4>` (IPv4 address from the droplet's detail page) using the private SSH key generated when creating the droplet; first use requires `yes` to save as known key; console commands `whoami`, `pwd`, `ls`, `ls -a` to explore.
- **cloud-costs-and-security**: Downside considerations: cloud is someone else's computer — assess sensitivity/trust before putting data there (security is provider's bread-and-butter but leak liability is yours); billing by the hour and need to turn off resources (On/Off button, shut down to stop charges) to avoid runaway bills.


## Code Snippets & Formulas

Caption-mangled fragments with normalized forms:

```bash
# Create droplet (DigitalOcean UI)
# "in digital ocean they call servers a droplet" # droplet
# "you could have clicked before but on top of that already i have installed docker" # docker

# Authenticate & connect
ssh root@<ipv4>  # "you can ssh to this droplet in a terminal as root doing the following ssh root which is the name of the user ... and this weird number" # ssh <- ssh, ipv4 <- address like 123.45...
# "every computer on the cloud has an address like a virtual space in the internet where you can find that resource and that address comes from here so the very first thing to the left is that thing called ipv4 that number that is the address" 
yes  # save ssh key as known on first connection

# Explore server
whoami  # -> root  # "see who i and i expect to get roots because i logged in as a user root"
pwd
ls ; ls -a ; ls /  # hidden files and directories, root folders

# Verify Docker
docker run hello-world  # "docker run an image that is well used i commonly use to test that docker is working well and it is an image called hello world" # hello world <- hello-world image from Docker Hub -> "Hello from Docker"

# Rocker RStudio
docker run rocker/rstudio  # "one provider of docker images that is a rocker the rocker project they are very awesome and they have a bunch of very useful little computers that allow you to ... run in our studio" # rocker
# Access: http://<droplet-ip>:8787  # "instead we need the address that we get from here ... and we type column and always 8787" # :8787, localhost vs droplet ip
# login rstudio / your password  # "in this case our studio and a password in this case the one that our project set up which is your password very not safe"
```

