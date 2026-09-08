---
type: source
title: "cloud: Resize data storage and share data with pins"
source_file: "yldd8trFbaQ_cloud-resize-data-storage-and-share-data-with-pins.md"
video_id: "yldd8trFbaQ"
url: "https://www.youtube.com/watch?v=yldd8trFbaQ"
lang: en
tags: ["ds-incubator", "cloud", "pins", "dropbox", "r-packages"]
key_topics: ["cloud-storage", "digitalocean-volumes", "pins-sharing", "file-permissions", "docker-containers"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=yldd8trFbaQ"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 22
    last_modified: "2022-06-21T00:00:00Z"
usage_window: { from: "2022-06-21T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# cloud: Resize data storage and share data with pins

## Summary

Motivated by a real data-volume bottleneck while working with Lina on a **DigitalOcean droplet** that ran out of space, this cloud-data meetup demonstrates two user stories: (1) **increase disk space** as data grows, and (2) **share data across teammates** more robustly than Dropbox, using the **pins** package and a properly permissioned shared volume. The second part on moving data is deferred.

**Resizing storage:** Two conceptual approaches are contrasted: buying a bigger hard drive vs attaching an external drive. In DigitalOcean UI: `Resize` tab first shows only memory/CPU options; `Disk, CPU and RAM` warns "this is a permanent change ... you cannot go back because that could cause data to be lost ... you can expand you cannot shrink" (caption "message here that this is a permanent change" ← resize warning). Options with more disk appear (e.g., `160GB`, `320GB` up to expensive `300GB → $125/month` — caption "some options have more disk space 160 320 ... very expensive" ← pricing). Cheaper is to **`Add Volume`** (attach external drive analogue via USB), e.g., `100GB` "pretty cheap" named `volume`, attached to the existing `25GB` droplet, with "automatic format and mount" checked (caption "click here and create volume ... attached to the droplet ... comes already with 25 gigabytes but I'm going to add this 100 gigabytes on top" ← `Add Volume`). Volumes can be resized later ("you can go to increase size"), multiple volumes can be attached, so effectively no limit.

**Inspecting the volume:** Connecting via `ssh root@<ipv4>` (caption "copy this address here called ipv4 ... use the program ssh and say hey I'm going to be the root user at this specific address" ← `ssh root@<ipv4>`) and running `df -h` ("command df which allows you to inspect information about the file system ... flag minus h which is means human freedom ... more readable" ← `df -h`) shows `/dev/vda1 ... 25GB` and the attached device `... 100GB` mounted at `/mnt/volume` (caption "where it is it's mounted on a slash mount volume ... volume is the name I gave ... mount is a directory ... chosen by DigitalOcean" ← `/mnt/volume`), verifiable via `ls /mnt`.

**Sharing data:** Dropbox problems cited are path brittleness across machines, needing desktop sync, and local-disk bloat. The better system uses `pins` (R and Python). Behind the scenes, a Linux multi-user permission setup is required: `mkdir /mnt/volume/shared` ("we want to create a directory inside it that we're going to dedicate to shared data ... make there ... shared" ← `mkdir`) and `chmod a+rwx /mnt/volume/shared` (caption "command change mode ... change those permissions so that everyone all that's the a stands for all gets read write and execute permission ... now shared prints in green and every group of three letters here have r w and x" ← `chmod a+rwx`) inspected via `ls -l`/`ll`. Only `/mnt/volume/shared` is made world-writable, not the whole volume, preserving privacy for per-user data.

Analysts each get a **Docker container** ("mini-computer") built from RStudio images with a password and access via `<ipv4>:8787` (`8787` for Lina, `8788` for Mauro, caption "I'm running a little computer on that cloud for linda ... name that computer linda ... connect to that computer on specific address with number 8787 ... password is one two three" ← `docker`), verified running with `docker ps`. Both log into RStudio (`rstudio` user). They then use pins to write/read:

- **Lina (writer):** `library(pins); board <- board_folder("/mnt/volume/shared/pins")` (caption "she's going to create what's called a board ... board is simply a pointer to a folder ... function that comes from pins it's called board folder and she's going to give the address ... mount volume inside that share and she's going to write a specific folder called pins inside that shared volume" ← `board_folder`) and `board %>% pin_write(mtcars, "my_data")` or `pin_write(board, mtcars, "my_data")` (caption "the object that she's gonna write is the object empty cars ... pin has been written" with `mtcars` example ← `pin_write`). Existence verifiable on host via `ls /mnt/volume/shared/pins/my_data`.
- **Mauro (reader):** `library(pins); board <- board_folder("/mnt/volume/shared/pins"); board %>% pin_read("my_data")` (caption "instead of writing data he's going to use it to read it so board which I'm going to use the pipe that comes from base so the board and he's gonna use bin breed with the name my data" ← `pin_read`).

Wrapped with analyst-focused summary: you get a browser link, login `rstudio`/`***`, have an environment with packages, ask admin to add volume space when needed, use the shared ` /mnt/volume/shared` via `pins` (`board_folder` → `pin_write`/`pin_read`).

## Key Concepts & Tools Taught

- **[cloud-storage / cloud-storage]:** Need to increase disk as data grows; managed via cloud provider resizing or volume attachment; per-hour billing implications.
- **[digitalocean-volumes / digitalocean-volumes]:** UI: `Resize` (permanent expand-only) vs `Add Volume` (100GB cheap, auto-format/mount at `/mnt/volume`); evidence via `ssh root@<ipv4>` + `df -h` + `ls /mnt/volume`.
- **[pins-sharing / pins-sharing]:** `pins::board_folder("/mnt/volume/shared/pins")` → `pin_write()` → `pin_read()` pipe, as better Dropbox for R/Python; board is pointer, not data; demo with `mtcars`/`emptycars`.
- **[file-permissions / file-permissions]:** `mkdir /mnt/volume/shared` + `chmod a+rwx` (`a`=all, `rwx`=read/write/execute) + `ls -l` to verify; limited to shared subfolder for privacy.
- **[docker-containers / docker-containers]:** Per-analyst isolated RStudio containers (`docker run` with port 8787/8788, `docker ps` to list), password auth, volume mounted inside.

## Code Snippets & Formulas

Caption-mangled, normalized:

```bash
# Resize vs Add Volume (DigitalOcean UI)
# Dashboard → Droplet → Resize → Disk, CPU and RAM → "permanent change ... you cannot go back" ← resize
# Add Volume → 100GB → name "volume" → attach to droplet (25GB + 100GB) → Create Volume  # "pretty cheap" ← Add Volume

# Inspect via SSH
ssh root@<ipv4>               # "copy this address here called ipv4 ... use program ssh and say hey I'm going to be the root user at this specific address" ← ssh
df -h                         # "command df ... flag minus h ... human freedom ... more readable" ← df -h
# -> /dev/vda1  25G ... ; /dev/sda  100G  /mnt/volume  # "droplet comes with 25 gigabytes ... second line ... 100 gigabytes mounted on slash mount volume" ← df output
ls /mnt/volume                # should show "volume" inside /mnt
ls -l /mnt                    # inspect permissions

# Prepare shared folder (admin once)
mkdir /mnt/volume/shared      # "create a directory inside it ... dedicated to shared data ... make there ... shared" ← mkdir
chmod a+rwx /mnt/volume/shared  # "command change mode ... everyone all that's the a stands for all gets read write and execute permission ... now shared prints in green ... have r w and x" ← chmod
ls -l /mnt/volume             # verify drwxrwxrwx

# Provide per-analyst containers (admin, Docker knowledge)
docker ps                     # "command docker ps shows running little computers inside that droplet" ← docker ps
# docker run ... --name linda -p 8787:8787 -v /mnt/volume/shared:/mnt/volume/shared rstudio image (password 123)
# docker run ... --name mauro -p 8788:8787 ...

# Inside RStudio (Lina & Mauro)
```
```r
library(pins)                                      # "they need to install pins package" ← pins
board <- board_folder("/mnt/volume/shared/pins")  # "she's going to create what's called a board ... board is simply a pointer to a folder ... board folder ... mount volume inside that share ... pins inside that shared volume" ← board_folder
board %>% pin_write(mtcars, "my_data")            # "the object that she's gonna write is the object empty cars ... empty cars ... pin has been written" ← pin_write (example uses mtcars, also described as empty cars)
board %>% pin_read("my_data")                     # "instead of writing data he's going to use it to read it so board which I'm going to use the pipe ... and he's gonna use bin breed with the name my data" ← pin_read
# host check: ls /mnt/volume/shared/pins/my_data  # confirms pin persisted
```

