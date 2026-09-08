---
type: source
title: "Data science on a chromebook"
source_file: "uDx9NkoBqv8_data-science-on-a-chromebook.md"
video_id: "uDx9NkoBqv8"
url: "https://www.youtube.com/watch?v=uDx9NkoBqv8"
lang: en
tags: ["ds-incubator", "docker", "git", "chromebook", "terminal"]
key_topics: ["chromebook", "chrome-os", "linux-development-environment", "docker-rocker", "dotfiles"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=uDx9NkoBqv8"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2022-08-16T00:00:00Z"
    usage_count: 875
usage_window: { from: "2022-08-16T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Data science on a chromebook

## Summary

A fun one-off inspired by Jeff Leek's 2017 “Data Science on a Chromebook” and by the speaker's own main workstation breaking, this talk argues you do not need a super-powerful machine for data science as an analyst or software developer. The tested device is a $120 Amazon Chromebook: two cores (vs. ~4–7 on the main station), 4 GB RAM (vs. 32 GB), 64 GB storage (vs. ~500 GB), making Windows/macOS impractical but Chrome OS (lightweight, app-based) sufficient.

After a tour of the lean keyboard (no Caps Lock → `Alt+Search` to lock, `Alt+Backspace` for Delete, two-finger tap/`Alt+click` for right-click) and the Files app (split into `My files` local — e.g., `Downloads` — vs. `Google Drive` online, where files are online by default unless marked “Available offline”), the easiest workflow is renting an on-demand cloud computer (e.g., DigitalOcean) accessed via the browser with username/password, scalable resources and covered in the prior cloud series — not demonstrated here — giving limitless computing through the browser.

The offline workflow is the focus: enabling the Linux development environment via `Settings → Developers → Linux development environment` (splitting disk, e.g., 30 GB for Linux + 30 GB for Chrome OS vs. default 10 GB recommendation because Docker images are 3–4 GB) creates a second system with a Terminal app (penguin icon). Key commands shown are `pwd` (print working directory / home) and navigating to `/mnt/chromeos/MyFiles/...` after sharing the top-level `My files` folder via right-click/option-click → `Manage Linux sharing` → `Mount on /mnt/chromeos`, demonstrating bidirectional visibility between `Downloads` in the Files app and `ls /mnt/chromeos/MyFiles/Downloads` in the terminal.

With Linux ready, the speaker links to Docker Engine install and to the DS incubator Docker series, using a `rocker/verse` image: `docker ps` lists the running `verse` container, and pointing the browser to its address (e.g., `localhost:8787`) launches a local RStudio Server instance (login with container-chosen username/password) that works offline, showing the same `~/git` project layout as the cloud instance. Docker is preferred to a direct RStudio Server install for cleanliness, disposability, and flexibility across containers.

Finally, to connect to GitHub, authentication via SSH or GitHub CLI (`gh auth login` for step-by-step SSH key creation and GitHub login) and `git config --global user.name` / `user.email` (minimum for commits) stored in `~/.gitconfig` and reused via a `dotfiles` repository (with `oh-my-zsh` terminal styling showing branch colors via `cd git/dsmissing` example) give the reusable, pleasant terminal experience. Takeaway: data science on a cheap Chromebook is feasible, with limitations mainly when offline.

## Key Concepts & Tools Taught

- **[chromebook]:** $120 Amazon device with 2 cores / 4 GB RAM / 64 GB storage (vs. main station 4–7 cores / 32 GB / 500 GB) used as a full data-science workstation; proves lightweight hardware suffices.
- **[chrome-os]:** Chrome OS lightweight app-based OS (like a tablet/iPad) with lean keyboard, Files app split `My files` (local, e.g., `Downloads`) vs. `Google Drive` (online, requires per-file `Available offline` for offline copy) and login via Google account.
- **[linux-development-environment]:** Chrome OS developer setting `Settings → Developers → Linux development environment` (search `dev` / `developers`) allocating disk (e.g., 30 GB) to run a Linux subsystem with Terminal app (penguin, `Ctrl++` zoom, `pwd` for home); how to enable and resize.
- **[docker-rocker]:** Docker Engine → `docker` images/containers pattern with `rocker/verse` ← `rockerverse` / `Rocker project` image providing RStudio Server offline at `localhost:8787`; `docker ps` shows running `verse` container, preferred over direct server install for clean disposability.
- **[dotfiles]:** Reusable configuration pattern: `gh auth login` CLI step-by-step for SSH, `git config --global user.name` / `user.email` → `~/.gitconfig`, and storing `oh-my-zsh` + `git` configs in a `dotfiles` Git repository to restore a pleasant terminal (shows `branch` + colors on `cd`).

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```sh
# enable Linux (Chrome OS UI):
# Settings (app) → search "dev" → Developers → Linux development environment → Create
# allocate e.g., 30 GB for Linux (Chrome OS recommends 10 GB but Docker images need 3–4 GB)

# Terminal app (penguin) after setup (zoom: Control plus)
pwd                   # "i go to pwd a command to print the working directory here you can see what's my home directory"
ls /mnt/chromeos      # "on linux you could do an ls on mount and there you will see there is a directory called chrome os"
ls /mnt/chromeos/MyFiles/Downloads  # after sharing top-level My files → Manage Linux sharing, compare to Files app → Downloads
# sharing step: Files app → My files (top level) → option-click → Manage Linux sharing → "yes i want to share the entire directory with linux and it's going to be mounted on the normal place on mount"

# Docker with Rocker (links to DS incubator Docker series)
docker ps             # "i can use docker to do a bunch of things including list all the images that are running inside containers here i'm running a container called verse inside from that started from an image from the rockerverse project"
# browser → localhost:8787 (or container-chosen address) → login user/password → RStudio Server (offline) showing ~/git layout

# GitHub auth & config (via terminal)
gh auth login         # "i personally use the gh cli so i install the gh cli ... and then i authenticate with gh out logging ... step-by-step guide to create ssh keys and to log into github"
git config --global user.name "Mauro Lepore"   # "you have to tell it who you are ... manipulated through git command something like git config ... global username for example and that's my name"
git config --global user.email "mauro@example.com"  # "or user email and that's my email those two configurations are the minimum that you need to be able to create commits"
cat ~/.gitconfig      # shows stored config; reused from dotfiles repo
# dotfiles pattern: git clone dotfiles repo → reuse configs for oh-my-zsh → terminal shows colors + git branch on cd git/dsmissing
```
