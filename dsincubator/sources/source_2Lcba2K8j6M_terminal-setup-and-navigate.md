---
type: source
title: "terminal: Setup and navigate"
source_file: "2Lcba2K8j6M_terminal-setup-and-navigate.md"
video_id: "2Lcba2K8j6M"
url: "https://www.youtube.com/watch?v=2Lcba2K8j6M"
lang: en
tags: ["ds-incubator", "terminal", "shell", "git", "docker"]
key_topics: ["terminal", "shell", "bash", "rstudio-terminal", "file-navigation", "docker-environment"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=2Lcba2K8j6M"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 16
    last_modified: "2022-04-19T00:00:00Z"
usage_window: { from: "2022-04-19T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# terminal: Setup and navigate

## Summary

This session opens a series on working with the terminal, covering setup and basic navigation as Part 1 (continued in the next meetup). Motivation includes configuring text editors like `vim` when no alternative is available, demystifying multi-user systems for analysts who encounter Ubuntu servers for large computations, and introducing dotfiles for reproducible system configuration. The episode draws on the appendix of Happy Git with R and the Software Carpentry lesson on shell basics, both linked from the meetup materials.

The core idea is that the shell is a program to run other programs, analogous to a graphical interface but driven by typing; `shell`, `terminal`, `command line` and `console` are treated as pseudo-synonyms, with `bash` ← `bash` / `bush` as the focal shell (present on macOS and Linux, available on Windows via Git). Getting a shell is shown on Linux via the applications launcher typing terminal, inside RStudio via Tools > Shell and the Terminal tab next to Console, and on Windows by installing Git to obtain Git Bash. RStudio terminal settings (Tools > Global Options > Terminal > New terminals open with) are inspected to confirm `bash` (the speaker uses `zsh` ← `zsh` / `custom` which is similar to `bash`).

A reproducible environment is offered via Docker: the meetup repository contains a `Dockerfile` and `docker-compose.yaml`; running `docker compose up` starts an RStudio Server instance reachable at `localhost` with username `rstudio` and password `123`. Inside that server's terminal tab the first navigation commands are demonstrated: the prompt shows `~` for home, `pwd` ← `print working directory pwt` reveals `/home/rstudio`, and `ls` ← `list files ls` lists `desktop` and `projects`, matching the RStudio Files pane. Path-entry ergonomics are highlighted, such as tab completion (`ls` + `des` + `Tab` completes to `desktop`) and history recall with the up arrow.

## Key Concepts & Tools Taught

- **[terminal]:** Umbrella term for the text-based interface to the system, interchangeable in this context with shell, command line and console for running programs by typing.
- **[shell]:** Program to run other programs, contrasted with graphical clicking; taught as concise, ubiquitous and fast.
- **[bash]:** Featured shell (`bash` ← `bash` / `bush` / `flash` in captions, also `zsh` as a `bash`-like variant) — default on macOS/Linux and supplied on Windows by installing Git/Git Bash.
- **[rstudio-terminal]:** Accessing a shell inside RStudio via Tools > Shell, Terminal tab, and configuration at Tools > Global Options > Terminal > New terminals open with (e.g., confirming `bash`).
- **[file-navigation]:** Locating oneself with `pwd` (`print working directory` ← `print working directory pwt`) showing `/home/rstudio` / `home slash rstudio` from prompt `~` (home), and listing directory contents with `ls` (`list files` ← `list files ls`), with tab completion and history (`up arrow`, `Ctrl+r`/`command r` mentioned) to ease typing paths like `desktop`.
- **[docker-environment]:** Reproducible Linux environment for the series provided by `Dockerfile` + `docker-compose.yaml` in the repo; `docker compose up` → RStudio at `localhost` (`username rstudio`, `password 123`) — a containerized `bash` terminal alongside the file navigator.

## Code Snippets & Formulas

Spoken commands dictated live (caption-mangled, normalized here):

```sh
# shells mentioned
bash                            # "it's called bash and mac hazbash linux hasbash and windows has flash if you install git"
zsh                             # "the shell that i'm using is called zsh which is similar to bush but with some tweaks"
# synonyms: terminal / shell / command line / console  # "some pseudo synonyms are terminal shell command line console"

# opening shells (described, not typed):
# Linux: press Windows/super key → type "terminal" → Enter
# RStudio: Tools > Shell ; Terminal tab next to Console
# RStudio config: Tools > Global Options > Terminal > "New terminals open with" → bash  # "you can see what things you have configured including goal options ... tools load options ... terminal section ... new terminals open with"
# Windows: install Git → launch "Git Bash"  # "in windows again you need to install git ... you type git bash because that's where the terminal comes from"

# reproducible env
docker compose up               # "once you have the repo locally all you need to do is docker compose up so you type that and that will start an rstudio instance on your web browser"
# then in browser: http://localhost  username: rstudio  password: 123  # "type localhost which is the address where our studio serves this service ... username our studio ... password is something that i said very difficult one two three"

# first navigation inside RStudio Server's bash terminal
pwd                             # "print working directory pwt" → /home/rstudio  # "the home directory is under home slash rstudio"
ls                              # "list files ls for list files and that will show you the contents of that directory ... desktop and projects"
ls desktop                      # "if i want to do here the same thing i can do ls and now i have to type desktop"
# typing aids mentioned:
# Tab completion: type partial path then Tab  # "if i type a few keystrokes and then press the tab the terminal will complete the path for me"
# History: Up arrow  # "with the up arrow you recover previous commands"
# Reverse search: Ctrl+r (described as "control r" / "command r" / "r l s c")  # "if you press command r ... control r or r well it's not working here to r l s c"
```
