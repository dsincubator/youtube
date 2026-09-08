---
type: source
title: "docker: use cases"
source_file: "OieR0VDxSRk_docker-use-cases.md"
video_id: "OieR0VDxSRk"
url: "https://www.youtube.com/watch?v=OieR0VDxSRk"
lang: en
tags: ["ds-incubator", "docker", "terminal", "containers", "docker-compose"]
key_topics: ["rocker-verse-images", "docker-run-vs-compose", "volume-mounts", "reproducible-r-versions", "sharing-environments"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=OieR0VDxSRk"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2021-09-07T00:00:00Z"
    usage_count: 312
usage_window: { from: "2021-09-07T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# docker: use cases

## Summary

A focused follow-up on using (not authoring) Docker images, this meetup demonstrates a handful of practical use cases with a single Rocker image. The framing explicitly separates usage from image maintenance ("very focused on the usage of the images and we'll cover next the maintenance of the images how to remove images how to remove containers how to stop them") and the long-term goal of not becoming an author unless needed.

The core idea is that many analyst needs are already solved by published images. Using `rocker/verse:4.1.1` ← "image that is called rocker verse ... describing which version of r i want to be installed ... saying 4.1.1 i'm saying that i want that image to have that particular version" (layered Rocker stack: `r-ver` → `rstudio` → `tidyverse` → `verse`), the speaker dissects a `docker run` command piece by piece, noting both `docker` (vanilla) and `docker compose` ("we covered two ways to do the same thing with docker one was using the vanilla command docker and the other was using docker compose which was basically a simpler interface") and promising a README with the exact command.

First use case: a Bash terminal on demand. For macOS/Linux this is trivial, but on Windows a Linux `bash` ← "bash is just the name of one kind of terminal" terminal is valuable for the upcoming Unix-terminal series. Running `docker run ... bash` ← "by typing the name of the program i'm telling the container to start particularly with that ... bash" yields a shell ending in `home` because the command mounts the host home (`-v $HOME:$HOME` / `$HOME` variable ← "trick is done in these commands here ... my computer knows what is the path to my home directory ... variable called home ... key is home and value is whatever is the actual path") and sets `--workdir $HOME` ← "work deer which i'm saying ... i want it to start from a particular directory ... jumping inside that home directory". Inside, `ls` shows the host's files, `cd ..` → `ls` shows `/` vs. `~/home`, `cd $HOME` returns, and `exit`/`Ctrl+d` ← "you can also do usually a ctrl c no ctrl d a ctrl d would type exit" leaves the container. Tweaks shown: replacing `bash` with `R` launches R 4.1.1 (`R` ← "let me remove the word bash and let me type just r ... running r 4.1.1") and then `q()` ← "queue button paren" to exit; changing the tag to `rocker/verse:4.0` pulls a different R version ("roger verse 4.0 ... docker notice that i don't have already ... the image ... going to ... docker have and it's finding it there and then it's pulling it"), enabling either trying a newer R without touching the host or reproducing a bug on an older R.

Second set of use cases revolves around avoiding installation side-effects and sharing. A Windows-syntax digression addresses that `$HOME` / quoting may fail on native Windows and suggests workarounds: Git Bash ("git shell ... command shell that looks like ... windows command prop but ... has all the same commands as linux") or WSL ("windows subsystem for linux ... installs a whole linux machine as part of your windows"), and defining a `HOME` env var ("home is not a built-in environment in windows but adding a new global ... you can define your own home environment"). On provenance, Alex notes Docker's laziness/cache ("a lot of the things are already stored somewhere where docker knows about ... it's gonna reduce it from there ... idea of cash") and fallback to Docker Hub ("docker have ... repository ... similar ... github is a repository for git repositories ... docker hub is a repository for docker images"). Another isolation pattern is mounting read-only with `-v $HOME:$HOME:ro` ← "if you add another colon and then ro to the end of that that mounts that directory as read only" to get a one-way mount that allows experiments "with a sledgehammer inside the docker container and not worry about breaking the things that are on my actual computer". For sharing a whole environment, the repo pattern is introduced: place a `docker-compose.yaml` ← "file ... called docker hyphen compose.yaml" in a GitHub repo, share its URL, then `git clone <url>` → `cd <repo>` → `docker compose up` ← "docker compose up and that will do the trick ... docker compose up is aware of where it is being run from". An example `docker-compose.yaml` (datastore repo, lines like `services:` plus indented services at lines 3/12/23) is inspected, noting `image: microsoft/azure-cli` ("image microsoft azure cli ... very similar to ... image rocker rstudio ... go grab this image out of docker hub") vs. `build: context: .` + `Dockerfile` ("build context ... we have our own docker image that we want to build ... not something that is already on docker hub"). Beyond the immediate demo, broader uses are cited: databases like `postgres` ("whenever i'm working with databases i never install postgres on my local machine ... always run it from a docker container because postgres is kind of a pain"), finicky software with hard uninstalls, and any open-source project that publishes a Dockerfile for quick reproduction ("if we're ... find interesting ... sustainable technology projects ... very often there will be a docker file that ... you can just kind of spin up and click go"). The next sessions are scoped as management (stop/start/remove images/containers) before potentially covering the terminal series; authoring images is deferred as too broad.

## Key Concepts & Tools Taught

- **[rocker-verse-images]:** Rocker layered stack `rocker/verse:4.1.1` ← "rocker verse ... can be used with a bunch of pretty much with any version of r" with tag selecting R version (e.g., `4.1.1` vs `4.0` ← "modify ... the column ... 4.0 ... tag was called the tag component") and its relation `r-ver` < `rstudio` < `tidyverse` < `verse`; entrypoint determines UX (`bash` vs `R`).
- **[docker-run-vs-compose]:** Two interfaces to the same runtime — `docker run` (vanilla, explicit flags) vs. `docker compose` ← "vanilla command docker and the other was using docker compose which was basically a simpler interface ... all this ... text ... surely looks intimidating", with `docker-compose.yaml` declaring `services:` ← "line two is services that's just part of the docker compose specification" and each service indented at lines 3/12/23.
- **[volume-mounts]:** Bind mounts and working directory — `-v $HOME:$HOME` ← "the trick is done ... variable called home ... contains information ... key value pair ... share this command ... pasted ... would be looking for something that says mauro" plus `:ro` suffix ← "if you add another colon and then ro ... mounts that directory as read only" for one-way read-only isolation ("run around with a sledgehammer ... not worry about breaking"), `--workdir $HOME` ← "work deer ... i want it to start from ... home directory" vs. default `/` (root slash), and shell navigation `ls` ← "lists the files ... an ls here", `cd ..`, `cd $HOME`, `exit`/`Ctrl+d` ← "ctrl d would type exit" and `Ctrl+l` ← "clear the console with ctrl l".
- **[reproducible-r-versions]:** Versioned execution without host pollution — run any R via image tag: `docker run ... rocker/verse:4.1.1 R` → R 4.1.1 then `q()` ← "queue button paren" to quit vs. `rocker/verse:4.0 R` → R 4.0 which triggers a pull from Docker Hub ← "docker have ... docker hub ... repository for docker images" if not cached, leveraging Docker cache/laziness ("try to be as lazy as possible ... if it detects ... already installed ... it's gonna reduce it from there"), useful for trying latest or reproducing on older R.
- **[sharing-environments]:** Reproducible sharing via GitHub + Compose — repo contains `docker-compose.yaml` ← "docker hyphen compose.yaml", consumer does `git clone <url>` ← "git clone and you paste that url", `cd <repo>`, `docker compose up` ← "docker compose app" / "docker compose up", plus `build:` vs `image:` distinction ("line four is image microsoft azure cli ... go grab this image out of docker hub ... lines 13 and 14 ... build context ... we have our own docker image ... build this fresh every time") for custom `Dockerfile` images.

## Code Snippets & Formulas

Spoken commands dictated live (caption-mangled, normalized here):

```sh
# Base image / tag selection
docker run --rm -it -v $HOME:$HOME -w $HOME rocker/verse:4.1.1 bash   # "rocker verse ... 4.1.1 ... i want that image to have that particular version" / "by typing ... bash i'm telling the container to start ... with that program"
# inside:
ls                    # "lists the files that i have in the current directory"
cd ..; ls             # "cd dot dot which takes me back to the root ... slash here there is no slash home"
cd $HOME; ls          # "city home and now it takes me there" — back to mounted home
exit                  # "run exit" / "ctrl d would type exit"
# clear: Ctrl+l        # "clear the console with ctrl l"

# Run R instead of bash, pick version
docker run --rm -it -v $HOME:$HOME -w $HOME rocker/verse:4.1.1 R     # "let me remove the word bash and let me type just r ... running r 4.1.1"
# inside R:
q()                   # "queue button paren" — quit R
# try older/newer R without touching host:
docker run --rm -it -v $HOME:$HOME -w $HOME rocker/verse:4.0 R       # "modify it to get the exact version of r ... tag component ... 4.0" -> pulls from Docker Hub if missing

# Docker Hub & cache mental model
# docker will "try to be as lazy as possible ... if it detects ... already installed ... it's gonna reduce it from there ... idea of cash"
# otherwise pulls from Docker Hub: "docker have and it's finding it ... docker hub ... repository for docker images"

# Windows compatibility notes:
# $HOME must be defined or quoted; Git Bash handles linux syntax ("git shell ... has all the same commands as linux")
# or WSL: "windows subsystem for linux ... installs a whole linux machine as part of your windows"
# HOME is not built-in on Windows ("home is not a built-in environment in windows ... you can define your own home environment")

# Read-only mount for safe experimentation:
docker run --rm -it -v $HOME:$HOME:ro -w $HOME rocker/verse:4.1.1 bash  # "if you add another colon and then ro ... mounts that directory as read only"

# Sharing an environment (compose file in a GitHub repo)
git clone https://github.com/<org>/<repo>.git   # "git clone and you paste that url that you copied"
cd <repo>                                       # "do a cd to get inside that repo"
docker compose up                               # "docker compose app" / "docker a hyphen compose up ... will do the trick"

# Example docker-compose.yaml excerpt (datastore, as narrated):
# docker-compose.yaml                           # "file that is called docker hyphen compose.yaml"
# services:
#   azure-cli:
#     image: microsoft/azure-cli                # "image microsoft azure cli ... go grab this image out of docker hub"
#   datastore:
#     build:
#       context: .                              # "build context ... we have our own docker image that we want to build ... not ... already on docker hub"
# (lines 2: services, 3/12/23: distinct services; "three ... maybe four or five different containers ... are actually going to be activated when you run docker compose up")

# Other use cases cited:
# postgres pattern: run DB in container, not locally ("never install postgres on my local machine ... always run it from a docker container because postgres is kind of a pain")
```
