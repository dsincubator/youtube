---
type: source
title: "terminal: Start a terminal and navigate your files system"
source_file: "V2oSfukR4mw_terminal-start-a-terminal-and-navigate-your-files-system.md"
video_id: "V2oSfukR4mw"
url: "https://www.youtube.com/watch?v=V2oSfukR4mw"
lang: en
tags: ["ds-incubator", "terminal", "shell", "docker", "git"]
key_topics: ["terminal", "shell", "bash", "pwd", "ls", "cd", "tab-completion", "docker-environment"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=V2oSfukR4mw"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 19
    last_modified: "2022-04-19T00:00:00Z"
usage_window: { from: "2022-04-19T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# terminal: Start a terminal and navigate your files system

## Summary

A post-meetup recording covering Part 1 of a shell series: what the shell is, how to start one, and how to navigate the file system (modifying the filesystem, sorting/redirection and text editing are deferred). Resources are the *Happy Git with R* appendix (shell section) and the Software Carpentry Unix Shell lesson, both linked in the meetup materials.

The shell is introduced as simply a program to run other programs, analogous to a graphical desktop but driven by typing, praised for speed, conciseness and ubiquity. `shell`, `terminal`, `command line` and `console` are used interchangeably, with `bash` as the focal shell — present on macOS/Linux and on Windows via Git Bash (the speaker notes his prompt shows `zsh`/`custom` which is `bash`-like). Starting methods are shown: on Linux via the Super/Windows key typing `terminal`, inside RStudio via *Tools > Shell* or the Terminal tab (configured at *Tools > Global Options > Terminal → New terminals open with: bash*), and on Windows by installing Git then launching Git Bash, with a pointer to *Happy Git with R* Chapter 6 for installation and debugging.

A reproducible demo environment is built with Docker: the meetup repository contains a `Dockerfile` and `docker-compose.yaml`; `docker compose up` starts an RStudio Server at `localhost` (`rstudio`/`123`) providing a clean terminal to follow along. Data for the lesson is downloaded from `example data` to `~/Desktop`. Inside the browser terminal `pwd` reveals `/home/rstudio` (`~` for home), `whoami` confirms the user, and `ls` lists `desktop` and `projects` matching the Files pane. The help system (`ls --help` / `man ls`, where `man` may be absent in minimal containers) explains command syntax: `ls [OPTIONS] [FILE]...` with flags `-a` (all including dotfiles), `-l` (long list with dates/ownership), and `-t` (sort by time, combinable as `-alt`). Navigation uses `cd desktop`, `cd -` (back to previous), `cd ~` (home), `.` (here) and `..` (parent). Windows backslash vs forward slash is noted. Productivity tips include dragging a file into the terminal to paste its full path, `Ctrl+A` / `Ctrl+E` for line start/end, `Ctrl+L` / `clear` to clear the screen, `Ctrl+C` to cancel, `Tab` for path completion (with ambiguous cases listing options), and `Up`/`Down` arrow history plus `Ctrl+R` reverse search.

## Key Concepts & Tools Taught

- **[terminal]:** `terminal` / `command line` / `console` ← `terminal shell command line console almost as synonyms` — the text interface to the system for running programs by typing.
- **[shell]:** `shell` ← `shell is simply a program to run other programs` — the program that runs other programs; precursor to the graphical desktop.
- **[bash]:** `bash` ← `most common shell is called bash` / `bush` / `flash` (caption variants); `zsh` ← `not bash it's called zsh it's very close to bash` — the focal shell; `echo $SHELL` ← `echo dollar sign shell ... prints the contents of ... environmental variable` shows the current shell path; Windows obtains `bash` via `Git Bash` after installing Git.
- **[pwd]:** `pwd` ← `print.pwd stands for print working directory` / `print working directory ... home slash rstudio` — shows `/home/rstudio` with `~` shorthand for home.
- **[ls]:** `ls` ← `ls for list ... list the contents` — list directory contents; flags `ls -a` (`-a which stands for all`), `ls -l` (long format with user/date), `ls -t` (sort by time), `ls --help` / `man ls` for help; `ls -alt`, `ls desktop projects`, `ls .` / `ls ..` (`dot stands for here ... dot dot stands for the parent`).
- **[cd]:** `cd` ← `we can move with change directory for example desktop` — `cd desktop`, `cd -` (previous directory), `cd ~` (home), plus `clear` / `Ctrl+l` to clear, `Ctrl+c` to cancel, `Ctrl+a`/`Ctrl+e` to jump to line start/end.
- **[tab-completion]:** `Tab` ← `press tab for autocomplete ... type partial path then Tab ... quickly type paths ... d plus the top completes ... p and press the tab ... readmemd and readme rmd` — autocomplete and ambiguous-resolution listing; `Up`/`Down` arrow recall history, `Ctrl+r` reverse search.
- **[docker-environment]:** Reproducible lab via `docker compose up` ← `all i need to do now is docker compose up and typing that will start an instance of our studio on a web browser ... type localhost ... username is our studio and the password is one two three` — runs RStudio Server at `http://localhost` for students to follow along device-independently.

## Code Snippets & Formulas

Spoken commands dictated live (caption-mangled, normalized here):

```sh
# shell identity
echo $SHELL                        # "type echo dollar sign shell ... prints the value stored in environmental variable shell ... path inside the computer ... i'm using ... zsh it's very close to bash"
bash; zsh; csh                     # "most common shell is called bash ... windows has ... bash and ... confusingly has by default a few shells that are not bash"

# opening shells (described)
# Linux: Super/Windows key -> type "terminal" -> Enter  # "pressing the start key ... windows key ... i can start typing so i can type terminal"
# macOS: Spotlight -> type "terminal"
# RStudio: Tools > Shell ; Terminal tab              # "you can go to tools and you have a shell entry ... you have a terminal here as well"
# RStudio config: Tools > Global Options > Terminal > New terminals open with  # "see what you have here in new terminals open with ... i have custom"
# Windows: install Git -> Git Bash                 # "if you're in windows ... you first need to install git ... then you can start kit bash ... happy kit with r ... chapter six on how to install git"

# reproducible demo env
docker compose up                  # "docker compose up ... will start an instance of our studio on a web browser so ... go to localhost"
# browser: http://localhost  user: rstudio  pass: 123

# first navigation inside the container's bash terminal
pwd                                # "print working directory ... we are under slash home rstudio"
whoami                             # "command ... who am i that will tell you who is the user"
ls                                 # "list the contents ... those two directories are ... desktop and projects"
ls -a                              # "minus a which stands for all ... including some files that are hidden ... dot"
ls -l                              # "if you want to see a long list with some additional information ... minus l"
ls -t                              # "to sort for time so now the output is sorted by date"
ls -alt                            # "ls minus alt could give me"
ls desktop projects                 # "ls for desktop and projects ... two sections"
ls --help; man ls                  # "ls has a ton of options ... ls minus minus help ... which is a command that invokes the manual for a command ... man ls"
cd desktop; cd -; cd ~; cd ..      # "we can move with change directory ... cd minus and that will take me to the last place ... dot stands for here ... dot dot stands for the parent ... tilde stands for the home"
# typing aids
# Tab  # "if i type d that is enough ... d plus the top completes ... pressing again gives readmemd and readme rmd"
# drag file -> terminal pastes path  # "you can drag things ... drag files inside the terminal ... it pastes the path"
clear; Ctrl+l; Ctrl+a; Ctrl+e; Ctrl+c; Up; Down; Ctrl+r  # "type clear or you can do ctrl l ... ctrl a takes you to the first column ... e to the last ... ctrl c cancels ... recover the last command with the up arrow ... search previous command"
```
