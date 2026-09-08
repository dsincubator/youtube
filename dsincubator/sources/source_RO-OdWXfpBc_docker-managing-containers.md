---
type: source
title: "Docker: managing containers"
source_file: "RO-OdWXfpBc_docker-managing-containers.md"
video_id: "RO-OdWXfpBc"
url: "https://www.youtube.com/watch?v=RO-OdWXfpBc"
lang: en
tags: ["ds-incubator", "containers", "docker", "docker-compose", "terminal"]
key_topics: ["docker-containers", "docker-ps", "docker-compose"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=RO-OdWXfpBc"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 47
    last_modified: "2021-09-14T00:00:00Z"
usage_window: { from: "2021-09-14T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# Docker: managing containers

## Summary

This meetup is part two of the Docker containers series, now moving beyond minimum viable usage into management. The stated objectives are to run persistent containers (as opposed to the ephemeral `--rm` containers used so far), to list and inspect status with the star command `docker ps`, and to stop, start, attach and remove containers — both one at a time and in batch when many accumulate and consume disk.

The demo starts from a Rocker Project command from the Rocker home page that creates a container running an R session. Removing the `--rm` flag switches from ephemeral to persistent (the default for `docker run`). In another terminal `docker ps` shows a table with one entry: status `up`, running for ~12 seconds, created just before it started (creation and running are two steps that `docker run` does together), with an auto-generated name (e.g., `great ...`). Stopping is shown both by quitting R with `q`/`Ctrl-D` and generally with `docker stop <name>` (demonstrated via tab autocomplete), with `docker help` and a brief note that stopping shuts down a computer and needs time to finish; re-running `docker ps` then shows an empty table.

The distinction between stopped-but-present and removed is clarified with `docker ps -a` (the `-a`/`--all` flag), which lists all containers including those with status `exited` from earlier experiments, not just `up`. With help from Alex, the image vs container analogy is restated: an image is the hard drive, a container is that hard drive being executed by a processor/monitor — so multiple containers from the same `r-base` image are parallel computers started identically but diverging over time. Management continues with `docker start <name>` to restart, where `docker ps -a` now shows that container `up` again but the R session is not yet in the foreground — requiring `docker attach <name>` to reattach the session (then `1+1` works). Removal is shown with `docker rm <name>` (or `docker remove`), which by default only removes `exited` containers, keeping running ones unless `--force` is used (not recommended for clean shutdown). Batch operations use `docker ps -q` to get only IDs (available on many docker commands) combined with command substitution `docker rm $(docker ps -aq)` or more incrementally with a pipe to `xargs` ("sarks" in captions) — `docker ps -q | xargs docker stop` / `docker rm` — and filtering with `docker ps --filter status=exited/running/created -q`.

Finally `docker compose` is presented as the convenient way to work with multiple related containers: in the repo folder for this day a `docker-compose.yml` describes two services (`rstudio` and `root/admin`), `docker compose up` creates and starts both (verified with `docker ps` vs `docker compose ps` for scoped status), and `docker compose down` stops and removes them together, while unrelated containers from `docker ps -a` remain. The closing warns that Docker partitions disk space and cleaning unused containers/images often resolves "partition full" errors, and notes `dangling images` as the next filtering use case.

## Key Concepts & Tools Taught

- **[docker-containers]:** Persistent vs ephemeral containers; `docker run` creates and runs, `--rm` makes it ephemeral, default is persistent until explicitly removed.
- **[docker-ps]:** Star command `docker ps` (processes) to list running containers; `-a`/`--all` shows all including `exited`, `-q` shows IDs only, `-f`/`--filter status=` filters by status, with help via `docker help` and reference docs.
- **[docker-compose]:** `docker compose up` to create/start all services defined in `docker-compose.yml`, `docker compose ps` for scoped status, `docker compose down` to stop and remove them together.
- **[container-vs-image]:** Image is a hard drive, container is that image being executed — multiple containers from the same `r-base` image are identical at start but diverge through use.
- **[lifecycle-commands]:** `docker stop` to stop, `docker start` to restart, `docker attach` to reattach the foreground session, `docker rm`/`remove` to delete, `docker create` to create without running, `docker --help`.
- **[batch-management-with-xargs]:** Using `docker ps -q` IDs with `$(docker ps -aq)` substitution or the incremental pipe `| xargs` ("sarks") to stop/start/remove many containers at once; `docker rm` without `-f` skips running containers.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```bash
docker run rocker/r-base        # one-liner from Rocker home page starting an R session; previously with --rm for ephemeral
docker run --rm rocker/r-base   # ephemeral variant: "before we use ephemeral containers which we told docker to do that just by adding this flag minus minus remove rm" <- "minus minus remove rm" / "remove flag"
docker run rocker/r-base        # persistent (default): "we're going to remove that remove flag because today i want to show you persistent containers which is actually the default behavior of the docker run command" <- "remove that remove flag"

docker ps                       # "the start of the show is going to be a command called docker ps" <- "docker ps" (+ "star command" alias)
docker ps -a                    # "if we stop a container ... let's do docker ps minus a and here you see that i have actually a bunch of containers ... they all show ... status exited" <- "docker ps minus a" / "status up" / "exited"
docker ps -q                    # "one very useful flag ... is the minus q flag ... instead of printing the whole table ... it prints just the ids" <- "minus q"
docker ps -aq
docker ps --filter status=exited -q  # "that flag allows us to filter that table ... for example let's do ... status created ... or status = running / exited" <- "filter" / "status created" / "status equals exited"
docker ps -f status=created -q
docker --help                   # "remember that you can always do docker help and you will see all the options" <- "docker help"
docker help                     # alias

docker stop great_leather_bear  # "i'm going to type docker stop great i don't need ... type the whole thing ... there is autocomplete ... tab" <- "docker stop" / "tab"
# shutdown pause: "it's going to take a little while because we are shutting down a computer"
docker start great_leather_bear # "if there is a docker command a docker stop command very likely there is a docker start command ... i'm gonna do docker start that container" <- "docker start"
docker attach great_leather_bear # "what's missing here is the attach stage so what we need to do is of course type docker attach" <- "docker attach"
# inside attached R:
1+1   # "i can do something like one plus one and as we are used to experiencing in r you know we get the output"
q     # "we can exit this r section with quit with q apparent parent but and also we could do with ctrl d" <- "quit with q" / "ctrl d"
# Ctrl-L clears console, Ctrl-D alternative quit, Tab completes name

docker rm charming               # "docker remove takes a single argument which is the name of one container so ... docker remove charming" <- "docker remove" / "charming"
docker remove --help
docker rm $(docker ps -aq)      # "one way in which you'll see it a lot on the docker documentation is with ... you just wrap the command that what you want to ... be kind of repeated for each call to occur remove" <- "docker remove" wrapping
docker ps -q | xargs docker stop  # "i prefer a different syntax ... extend this command with a pipe into a command called sarks which all it does is takes each of those values from the left hand side of the pipe and puts them all the way to the right ... it's very similar to the pipe that you might be familiar with in r ... now i could do something like docker start ... automatically xrx is gonna be moving all of those things" <- "sarks" (= xargs) / "xrx"
docker ps -q | xargs docker rm   # "if i wanted to remove them all i would now be able to do the same thing but remove stop and replace that for rm" <- batch rm

# docker compose
docker compose up               # "you can start whatever that token compose file describes ... with docker compose app whatever ... i took some time ... environment that contains two containers so ... docker composed up ... created not just one but two containers one is called our studio user and the other one is called root admin" <- "dorking compose" / "tokens compose" / "docker composed up"
docker compose ps               # "i can do docker compose ps and that will give me ... only the status of the containers that i'm working with" <- "docker compose ps"
docker compose down             # "you can also do something like docker compose down and that will ... stop the containers and then remove them" <- "docker compose down"
docker create ...               # "this new command docker create creates a container but doesn't run it" <- "docker create"
```
