---
type: source
title: "terminal. Running commands as administrator"
source_file: "NuXgJtl9QDw_terminal-running-commands-as-administrator.md"
video_id: "NuXgJtl9QDw"
url: "https://www.youtube.com/watch?v=NuXgJtl9QDw"
lang: en
tags: ["ds-incubator", "terminal", "git", "r-packages", "permissions"]
key_topics: ["sudo-administration", "apt-get-installation", "user-groups", "oh-my-zsh-demo", "docker-compose-setup"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=NuXgJtl9QDw"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2022-05-24T00:00:00Z"
    usage_count: 37
usage_window: { from: "2022-05-24T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# terminal. Running commands as administrator

## Summary

The final meetup of the terminal series contrasts normal-user vs. administrator powers on a multi-user system, motivated by installing system-wide software that affects all users. The extended demo installs `oh my zsh` ← "oh my zsh ... enhancer of your terminal" — a Z shell enhancer that adds colors, git branch in the prompt, navigation shortcuts and aliases — which requires first installing its dependency `zsh` ← "software that is called zsh because that is the software that this tool enhances".

The environment is a cloned workshop repo run via `docker compose up -d` ← "docker composed up" / "do a minus d to detach", accessed at `<host>:8787` as user `rstudio` (with a self-set password). Naively following the Oh My Zsh install page fails for two reasons: the missing `zsh` binary and lack of permissions for system-wide installs. The first fix introduces the Debian package manager `apt-get` ← "command called ... apt get which in many systems most servers allow you to install software" / "apt get update" / "apt get install", and the convention of running `sudo apt-get update` first to refresh the registry ("every time you're going to install any software the first thing you do is you update that registry") before `sudo apt-get install zsh` ← "sudo apt get install ... zsh" (mangled initially as "apg", "zsa", "sudo suffer upgate"). Without `sudo` ← "command called zuro which kind of stands for super user doer" / "zuro" / "pseudo" / "zulu" / "sudos", the update fails with "Permission deny" ← "permission deny now is giving us an indication that with the privileges that we have as the user our studio we have no power to install this software".

Membership is inspected with `groups` ← "groups is a command ... tells you to which group the user ... belongs" (showing `rstudio`, `rstudio`, `sudo` ← "belongs to the group sudo", plus `staff`) and `whoami` ← "command who am i" (returns `rstudio` bare, `root` when prefixed with `sudo` ← "sudo the prefix ... as is if it was run by root"). After installing `zsh` and then pasting the Oh My Zsh installer, the prompt becomes colored. A short tour demonstrates new aliases: `gcb <branch>` ← "git checkout branch gcb ... that will create the branch" for `git checkout -b`, `gss` ← "gss will give us that those files have been added" for `git status -s`, `git commit -a -m "initialize"` via `gcam`-style alias ("git commit add message ... alias for git commit at minus a ... minus m"), plus `git log` coloring and `~` ← "tilda you immediately go to the home directory without doing the cd". The last segment explains how superuser powers are granted: only existing sudoers can create users (`sudo adduser mauro` ← "sudo ... add a user ... we're going to add the user mauro ... give a password to mauro") and elevate them (`sudo usermod -aG sudo mauro` ← "av user mouldo but now also add them to the group sudo" / "add them to the group sudo"), verified by logging in as `mauro` (`whoami` → `mauro`), showing `groups mauro` initially lacks `sudo` (so `sudo apt-get update` fails with password but without group), then after elevation `groups` shows `mauro` in `sudo`/`zulu` and `sudo apt-get update` succeeds. Takeaways recap: administrators are members of `sudo` who can run system-level commands via `sudo`, can create new administrators by adding to `sudo`, and on Debian/Ubuntu the pattern is `sudo apt-get update` then `sudo apt-get install <package>` (without `sudo` only if already `root`).

## Key Concepts & Tools Taught

- **[sudo-administration]:** Superuser model — `root` is the omnipotent user ("administrator of the entire system which is a user called root"), `sudo` ← "zuro ... super user doer" / "pseudo" / "zulu" executes any following command as `root` ("sudo ... makes any ... command be interpreted as is if it was run by root"), demonstrated via `whoami` ← "who am i" vs. `sudo whoami` → `root`, and `Permission deny` when a normal user runs `apt-get update` without it, plus `Ctrl+l`/`clear` ← "ctrl l to clear the console" / "typed clear".
- **[apt-get-installation]:** Debian/Ubuntu package workflow `sudo apt-get update` ← "sudo apt get update to update the registry of potential sources" then `sudo apt-get install zsh` ← "sudo apt get install zsh" / "apg as opposed to apt" / "zsa", with the best-practice "update registry first" and recovery from typos ("apg", "zoodle") via `clear`.
- **[user-groups]:** Group membership as permission gate — `groups` ← "groups is a command ... tells you to which group the user ... belongs" shows `rstudio : rstudio sudo staff`, `whoami` identity, `sudo adduser mauro` ← "add a user ... add the user mauro ... temp password" and `sudo usermod -aG sudo mauro` ← "av user mouldo ... also add them to the group sudo" to promote; new user `mauro` initially not in `sudo` so `sudo apt-get update` fails, after promotion `groups` shows `zulu`/`sudo` and succeeds, plus note that owners can override rules.
- **[oh-my-zsh-demo]:** `oh my zsh` ← "oh my zsh ... makes your terminal look pretty ... with colors with the name of the branch" enhancer for `zsh` ← "software that is called zsh", installed after `zsh`, copy-pasting its installer from "install all my zsh", demoing aliases: `gcb <branch>` ← "gcb and just the name of the branch ... create the branch" (=`git checkout -b`), `gss` ← "gss" (=`git status -s`/`git status short`), `git add .` → `git commit -m "initialize"` via alias ("git commit add message ... git commit ... minus m"), colored `git log`, and `~` ← "tilda you immediately go to the home directory".
- **[docker-compose-setup]:** Reproducible multi-user lab via `git clone <repo>` → `cd <repo>` → `docker compose up -d` ← "docker composed up" / "do a minus d to detach the output", accessing RStudio Server at `<host>` as `rstudio`/password, and `git config --global user.email/name`, `git init abc`, `cd abc`, `git status`, branch workflow integrated with the new shell.

## Code Snippets & Formulas

Spoken commands dictated live (caption-mangled, normalized here):

```sh
# Lab setup
git clone <workshop-repo-url>       # "cloning the repo that hosts this meetup"
cd <repo>
docker compose up -d                # "docker composed up" / "do a minus d to detach"
# then browse to http://<host>:8787 as rstudio / <password>

# Identity & groups
whoami                              # "command who am i" -> rstudio
groups                              # "groups is a command ... tells you to which group the user ... belongs" -> rstudio : rstudio sudo staff
sudo whoami                         # "sudo ... prefix ... be interpreted as is if it was run by root" -> root
# clear: Ctrl+l / clear              # "ctrl l to clear the console" / "typed clear which is the command that does that"

# Package install — fails without sudo, succeeds with sudo
apt-get update                      # -> "Permission deny" ("permission deny now is giving us an indication ...")
sudo apt-get update                 # "sudo apt get update to update the registry" -> success
sudo apt-get install zsh            # "sudo apt get install zsh" (mangled as "apg", "sudos suffer upgate", "zsa"/"zoodle")
# then Oh My Zsh:
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"  # "paste that" from install page -> installs oh my zsh

# Git demo with oh-my-zsh aliases
git config --global user.email "you@example.com"  # "git config global user email"
git config --global user.name "Your Name"         # "global username"
git init abc                         # "initialize the repository and let's call it abc"
cd abc
# prompt now shows branch name / colors
git checkout -b new                  # long form; alias:
gcb new                              # "git checkout branch gcb and just the name of the branch that will create the branch"
git status -s                        # "git status short"
gss                                  # "gss will give us that those files are ... tracked" — alias for git status -s
git add .                            # "add them to the staging area with it at all"
git commit -a -m "initialize"        # "git commit add message initialize" / "git commit at minus a ... minus m"
git log --oneline --graph --decorate # "the log is also very pretty ... with different colors"
cd ~                                 # "tilda you immediately go to the home directory without doing the cd"

# Admin escalation
sudo adduser mauro                   # "sudo ... add a user ... add the user mauro ... give a password to mauro"
# (enter temporary password, confirm user info)
su - mauro                           # "mauro could log in ... they have to enter the password" -> whoami -> mauro
groups                               # as mauro -> "mauro : mauro" (not in sudo)
sudo apt-get update                  # as mauro -> fails ("mauro is not in the group of super users")
exit                                 # back to rstudio
sudo usermod -aG sudo mauro          # "av user mouldo but now also add them to the group sudo" / "add them to the group sudo"
su - mauro
groups                               # -> mauro : mauro sudo   ("mauro does belong to the group zulu")
sudo apt-get update                  # now succeeds -> "that command works"
```
