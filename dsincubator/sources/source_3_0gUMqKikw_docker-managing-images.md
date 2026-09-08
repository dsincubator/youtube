---
type: source
title: "Docker: Managing images"
source_file: "3_0gUMqKikw_docker-managing-images.md"
video_id: "3_0gUMqKikw"
url: "https://www.youtube.com/watch?v=3_0gUMqKikw"
lang: en
tags: ["ds-incubator", "docker", "containers", "workflow", "github-issues"]
key_topics: ["docker-images", "dangling-images", "docker-prune", "rocker-project", "xargs"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=3_0gUMqKikw"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 38
    last_modified: "2021-09-21T00:00:00Z"
usage_window: { from: "2021-09-21T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# Docker: Managing images

## Summary

This session closes a short Docker series focused on image management (with a glimpse at volumes) for end users. After recapping that Part 1 covered superficial use of images and containers, the presenter moves to how images are listed, filtered, and removed to reclaim disk space, noting that duplicate tags and anonymous images can consume gigabytes.

The hands-on demo uses the `docker` CLI: `docker images` lists all local images and reveals `<none>` entries, `docker images ubuntu` implicitly filters by repository, `docker rmi` (spoken as "docker remove image") removes a single tagged image such as `ubuntu:14.04`, and `docker images -q` extracts only image SHAs for batch deletion via piping through `xargs` into `docker rmi`. Deduplication nuances appear when child layers block removal until parents are deleted.

A second thread addresses dangling images—untagged layers that remain after rebuilding an image with the same tag. The speaker shows `docker images --filter "dangling=true"` (with short form `-f`) to isolate them and the same `-q | xargs docker rmi` pattern to delete them. The session then broadens to workflow philosophy with Alex: disposable/reproducible design, preference for Dockerfile-driven rebuilds over committing running containers, the container/image lifecycle ordering (remove containers before images), and the complementary `docker image prune` / `docker container prune` batch commands, plus brief mention of the Rocker project's versioned stacks for pinning or testing against `devel` R.

## Key Concepts & Tools Taught

- **[docker-images]:** Listing and filtering images with `docker images` (caption "docker images" verbatim) and implicit repo filter `docker images ubuntu`; `docker images --help` and explicit `--filter` are shown, plus `alpine` as a minimal-image example.
- **[dangling-images]:** `<none>` repository/tag images ("known as a repository and known as tag") caused when a rebuilt tag orphans the prior image; inspected with `docker images --filter "dangling=true"` (caption "dangling equals true") and short form `-f dangling=true`.
- **[docker-prune]:** Opposite-direction batch cleanup via `docker image prune` / `docker container prune` (caption "docker image prune and docker container prune" / "docker image groom" → `prune`) that removes images without containers or stopped containers, contrasted with targeted `docker rmi -q` deletion.
- **[rocker-project]:** Rocker project's image stacks for reproducible research, including a versioned stack for locking system dependencies and a `devel` tag for testing upcoming R versions.
- **[xargs]:** Shell piping helper `xargs` (caption "xrx is the command" / "pipe that intoxarix" ← normalized `xargs`) for feeding quiet IDs (`-q` / `minus q` meaning `quiet`, caption "stands for quiet so what you see is only the sha" / `image id`) one-by-one into `docker rmi`.

## Code Snippets & Formulas

Caption-mangled, normalized here (quote-to-name):

```sh
docker images                          # "docker images to list all the images that i have"
docker images --help                   # "if you need help you could type help and learn a little bit"
docker images ubuntu                   # "docker images ubuntu just the name of ... repository"
docker rmi ubuntu:14.04                # "docker remove image ubuntu" + "1404" — caption: "the command that we're going to be using is the docker remove image ... docker remove image ubuntu and let's do 1404"
docker images -q                       # "minus q parameter flag ... stands for quiet so what you see is only the sha ... that says image id"
docker images ubuntu -q | xargs docker rmi  # "piping that so i press the up arrow and then i type you know xrx is the command ... pass each of those strings ... to the right ... docker remove image for each of those ids" + "pipe that intoxarix ... docker remove image"
docker images --filter "dangling=true" # "docker images with the filter command ... you can also use just one hyphen and f and then you can say dangling equals true"
docker images -f "dangling=true" -q | xargs docker rmi  # "with the minus q again ... i get just the ids and now ... pipe that intoxarix ... docker remove image ... those images seem to have been deleted"
docker run alpine:latest               # "can you do docker run alpine latest — alpine is just a minimal linux distribution"
docker container ls                    # "docker container ls shows you all containers that have not been removed" (vs "docker ps shows you actively running containers")
docker image prune                     # "docker image prune will go through and get rid of any image that does not have a container associated with it"
docker container prune                 # "docker container prune will go through and get rid of any container that is not running"
docker rmi --force alpine:latest       # "docker rmi alpine latest ... dash dash force"
docker container rm 2ee9               # "docker container remove for docker container rm and then the hash is 2ee9"
docker container stop practical_gates  # "docker container stop practical gates"
```
