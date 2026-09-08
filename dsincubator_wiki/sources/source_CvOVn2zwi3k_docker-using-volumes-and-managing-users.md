---
type: source
title: "Docker: Using volumes and managing users"
source_file: "CvOVn2zwi3k_docker-using-volumes-and-managing-users.md"
video_id: "CvOVn2zwi3k"
url: "https://www.youtube.com/watch?v=CvOVn2zwi3k"
lang: en
tags: ["ds-incubator", "containers", "docker", "rocker", "terminal"]
key_topics: ["docker-volumes", "docker-users", "rocker-verse", "image-tags", "user-permissions"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=CvOVn2zwi3k"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 198
    last_modified: "2021-09-28T00:00:00Z"
usage_window: { from: "2021-09-28T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# Docker: Using volumes and managing users

## Summary

The final episode of the Docker series covers two leftover topics — the Rocker versioned image stack and image tags — then deep-dives into volumes and user management. The Rocker versioned stack (from `r-base` → `rstudio` → `tidyverse` → `verse`) is shown as layered images where `verse` inherits everything below it; the presenter highlights `rocker/verse` as containing R (pinable via tag), RStudio Server, `devtools`, tidyverse, and publishing tools (PDF), ideal for reproducible research when tags lock R/package/system-library versions. Tags are explained with three `docker run rocker/verse:<tag>` variants: a pinned R version, `devel` (upcoming unreleased R for anticipating breakage), and `latest` concepts.

The core lesson is `docker run --volume` / `-v` (`$(pwd):/home/rstudio` in the demo) to make a host directory available at a container path, mounting the host home into `/home/rstudio` because that image's user is `rstudio`. Live demo: `docker run --rm -it -v $(pwd):/home/rstudio rocker/verse bash`, then `pwd` → `/` (image root), `ls /home/rstudio` and `cd /home/rstudio; ls` showing the mounted host files, proving ephemeral containers can work on persistent host data. The pitfalls follow: `id` inside the default container shows `root` (most privileged) while host `id` shows `mauro` (uid 1000, limited); `touch a; echo hi > a; ls -lh a` creates a root-owned file that host `nano a` cannot write ("file is unreadable ... can only be read"), leaving results stuck. The fix is `--user rstudio` (or `--user $(id -u)` / numeric uid) so files are created as uid 1000, mapping host `mauro` ↔ container `rstudio`; demo with `echo hi > b; ls -lh` shows `b` owned by `rstudio:1000` vs `a` by `root`, and host `nano b` now succeeds. Closing Q&A covers `~`/`.` path handling, why containers default to root (images built as root for installing software, `sudo` stripped except Rocker re-adds it with `ROOT=TRUE` / `-e ROOT=TRUE` to allow `sudo` inside RStudio Server), how `rstudio` user and uid 1000 are created in the Dockerfile, that host-root maps to container-root (host `sudo rm a` can delete root-owned files), and that mounted volumes break strict reproducibility across hosts (different files, case sensitivity, host directory names).

## Key Concepts & Tools Taught

- **[docker-volumes]:** Host↔container directory sharing via `--volume` / `-v` short flag (`host_path:container_path`); compact vs verbose syntax; mounts persistent host data into ephemeral containers (demo `$(pwd):/home/rstudio`).
- **[docker-users]:** Containers default to `root`; host limited user (`mauro`, uid 1000) vs container `root` vs `rstudio` user; mismatch causes permission errors when editing container-created files on host.
- **[rocker-verse]:** Rocker versioned stack — `r-base` → `rstudio` → `tidyverse` → `verse`; `rocker/verse` bundles R + RStudio Server + `devtools` + tidyverse + publishing toolchain for reproducible research.
- **[image-tags]:** Tag after colon (`rocker/verse:4.1`, `rocker/verse:devel`, `latest`) to pin specific R version or test against upcoming R (`devel`); enables locking analysis environment vs anticipating breakage.
- **[user-permissions]:** Ownership (`ls -lh` shows `root` vs `rstudio`), `id` / `id -u`, numeric uid 1000 mapping host↔container, `nano` write denial on root-owned files; workarounds `--user rstudio`, `--user $(id -u)`, `sudo` on host, `-e ROOT=TRUE` / `ROOT=TRUE` env var to enable `sudo` inside RStudio Server; `sudo` absent in most images (stripped to save space).

## Code Snippets & Formulas

Spoken terminal calls dictated live (caption-mangled, normalized here):

```bash
docker run --rm -it --volume $(pwd):/home/rstudio rocker/verse bash
# "the use of the flag volume or for short minus v and the way you use it is you specify the path on the left the path in your host computer ... on a specific location in the container that goes to the right of the column ... alex likes a more verbose one"
# verbose alternative (Alex prefers): --mount type=bind,source=$(pwd),target=/home/rstudio

# Inside container — proving volume works and exploring filesystem
pwd                        # "pwd that prints the working directory and in this case is home mauro ... inside the container ... what i get is this slash and that is what's called the root directory"
ls /                       # "list all the files and directories in that root and you can see already the home directory there"
ls /home                   # "there is this our studio folder"
cd /home/rstudio && ls     # "if i change directory inside that directory with cd home rstudio ... i should see the same contents that i see in my own computer's home directory"

# User inspection and permission pitfall
id                         # "id is a command that allows you to identify who is running this container ... it says root which is the most privileged"
id -u                      # "i use the id minus u and evaluate that ... it will use your id in your system and pass it to the container"
echo hi > a                # "i could do echo hi and put that information inside a"
ls -lh a                   # "the command ls minus l ... ls lh ... tells me that the owner of this file is fruit [root] ... that's the user that created it"
nano a                     # "the command nano i could open an editor ... but see that it says file is unreadable that file cannot be written it can only be read because the user who has the privileges to change it is only the super user"

# Host side — same file appears but unwritable
ls -lh /tmp/b ; id         # host shows mauro uid 1000; file b owned by 1000 after fix vs file a owned by root
sudo rm a                  # "if i do sudo and then the action i want to do then i am able to modify it ... actions that you can't do as a limited user ... you need to do a pseudo in my system"

# Fixed run — specify user so container matches host uid
docker run --rm -it --user rstudio --volume $(pwd):/home/rstudio rocker/verse bash
# "to run it as not the root user but to specify that you are the specific user that has been defined in that image ... i learned that ... the user rstudio is the one who owns that home directory"
docker run --rm -it --user $(id -u) --volume $(pwd):/home/rstudio rocker/verse bash
# "sometimes you know i use the id minus u and evaluate that so that ... when you are trying to say which user you want to be inside the container ... it will use your id in your system and pass it to the container"
echo hi > b && ls -lh b    # "the file b was created by our studio ... id is number thousand ... in my host computer ... the nickname for the user id a thousand is mauro ... that means that in my host computer and in the container the id of the user ... is exactly the same"
nano b                     # "now i don't have any restriction about editing this file"

# RStudio Server privileged install — must enable at launch
docker run -e ROOT=TRUE -p 8787:8787 rocker/verse  # then in RStudio terminal: sudo apt update && sudo apt install <pkg>
# "that environment variable root ... allows you to ... from inside our studio server where you land as a limited user if you set that flag you can do sudo ... if you didn't do a minus e root equals true then you will be limited and you won't be able to run pseudo"
# contrast: docker containers don't have sudo available usually — "our studio had to explicitly add that back in because ... there's the default you're always running as root ... and it's just one more utility that would have taken up space"

# Tag variants
docker run rocker/verse:4.1 bash    # "with the tag that you specify after the column and after the name of the image you can get for example a very specific version of r"
docker run rocker/verse:devel bash  # "then also you might want to try for example the devel tag which allows you ... to anticipate if the new version of r ... will or will not work"
```
