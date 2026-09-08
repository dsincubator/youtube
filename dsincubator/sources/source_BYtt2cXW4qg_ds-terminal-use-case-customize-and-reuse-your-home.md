---
type: source
title: "ds.terminal: Use case - customize and reuse your home"
source_file: "BYtt2cXW4qg_ds-terminal-use-case-customize-and-reuse-your-home.md"
video_id: "BYtt2cXW4qg"
url: "https://www.youtube.com/watch?v=BYtt2cXW4qg"
lang: en
tags: ["ds-incubator", "terminal", "git", "cloud", "docker"]
key_topics: ["dot-files", "alias", "terminal-navigation", "git-config", "rstudio-cloud"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=BYtt2cXW4qg"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 25
    last_modified: "2022-05-03T00:00:00Z"
usage_window: { from: "2022-05-03T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# ds.terminal: Use case - customize and reuse your home

## Summary

Use case that ties together the file-system navigation, editing, dot-files, and alias skills from the ds.terminal series: how to customize the terminal/home environment and then reuse it on another computer or an ephemeral RStudio Cloud project. The demo starts in a fresh Docker container (RStudio `localhost` with user `rstudio` / password `123`) and treats it as a local machine.

Exploration uses `pwd` ("print wd print working directory"), `cd ~` ("change directory tilde which is short for home"), and `ls -a` (hidden files) — finding the help with `ls --help | head` to recall `-a` as "almost all except `.` and `..`". Target dot-files are `.bashrc`, `.profile`, `.gitconfig`, and a new `.bash_aliases`. Configuring `git` shows persistence: `git config --global user.name "mauro lepore"` and `git config --global user.email` create `~/.gitconfig` (inspected with `cat ~/.gitconfig` + tab completion). Aliases demonstrate ephemerality: `alias rm="rm -i"` lives only in the current shell; persisting requires writing to `~/.bash_aliases` via `echo 'alias rm="rm -i"' >> ~/.bash_aliases` or editing with `vim` (enter insert mode with `i`, save/quit with `Esc` then `:wq`). A second alias persists `R` with safe defaults: `alias R="R --no-save --no-restore-data"` matching RStudio Global Options ("always start from a blank slate / never save .RData"). Verification requires a new shell (`exit` then `bash`, or open new terminal) because aliases are read at shell start; `alias` should then list both.

Reuse is shown by collecting dot-files: `mkdir ~/.dotfiles` then `cp ~/.bash_aliases ~/.gitconfig ~/.bashrc ~/.profile ~/.dotfiles/` and `ls -a ~/.dotfiles`. Optionally `git init` inside dotfiles for versioning. To share with RStudio Cloud, the folder is archived with `zip -r dotfiles.zip ~/.dotfiles` (recursive), moved to a project-accessible location, and uploaded via the Cloud Upload button (which auto-unzips). In the Cloud home (`cd ~; ls -a; alias` shows nothing), files are restored with `cp -r ~/.dotfiles/. ~/` or `cp -r dotfiles/* ~/` (recursive) and proven by opening a fresh terminal where `alias` now shows `rm -i` and colored `ls`, and `touch a; rm a` prompts interactively.

## Key Concepts & Tools Taught

- **[Dot-files (dot-files)]:** Hidden configuration files (`~/.bashrc`, `~/.profile`, `~/.gitconfig`, `~/.bash_aliases`) that store terminal and tool preferences; inspected via `ls -a` and moved as a reusable bundle.
- **[Alias (alias)]:** Shortcuts defined with `alias name="command"` (e.g. `alias rm="rm -i"` for safe removal, `alias R="R --no-save --no-restore-data"`); ephemeral in one shell versus persistent when stored in `~/.bash_aliases` and re-read on new shell startup.
- **[Terminal navigation (terminal-navigation)]:** Core commands `pwd` ("print wd"), `cd ~`, `ls`, `ls -a`, `cat`, `less` (paging with `/` search for `alias`), `clear` / `Ctrl+L`, `cp`, `mv`, `mkdir`, and help via `ls --help | head`.
- **[git config (git-config)]:** `git config --global user.name` and `user.email` writing to `~/.gitconfig`, demonstrated with `cat` and `ls -a` before/after; dot-file to be copied for reuse.
- **[RStudio Cloud reuse (rstudio-cloud)]:** Pattern for ephemeral environments: `zip -r dotfiles.zip ~/.dotfiles` → upload in RStudio Cloud → `cp -r` back to `~` → open new terminal to load aliases; `ls -a` before/after verifies.

## Code Snippets & Formulas

Caption quotes given → normalized commands:

```bash
pwd                      # "print wd print working directory"
cd ~                     # "move to the home with cd change directory tilde which is short for home"
ls -a                    # "ls minus a shows me almost all which is all except for the dot and the dot directories"
ls --help | head         # "i'm going to pipe that to compose the ls help command with head so once i get the output of help then i'm going to just ask for the first few rows"
cat ~/.gitconfig         # via tab completion "if i use tab you know that auto completes"
less ~/.bashrc           # "instead i'm gonna use a less ... forward slash command that allows you to type for a pattern that you want to search inside that file" → /alias then Enter
# git identity
git config --global user.name "mauro lepore"   # "press the up arrow to recover the last command and actually add my username here so it's mauro lepore"
git config --global user.email "mauro@example.com"

# alias — ephemeral vs persistent
alias                                  # "if you just print the the word alias what you get is a list of all the aliases"
alias rm="rm -i"                       # "alias is little commands ... safer way of removing files ... alias rm for example equals uh and then quotes rm minus i"
alias                                  # verify rm -i appears; new terminal shows not there
echo 'alias rm="rm -i"' >> ~/.bash_aliases   # "redirect the output of echo ... greater than greater than and then the name of the file"
cat ~/.bash_aliases
vim ~/.bash_aliases                     # "enter an editor and i'm using vim ... you enter the program in what's called the command mode ... you type the i and that will make you fall in this insert mode ... press escape ... type shift and column ... save with w and quit with q" → i, Esc, :wq
# second alias matching RStudio options
# alias R="R --no-save --no-restore-data"  # "in r you start r with the flags no save and no restore data"

# collect and share
mkdir ~/.dotfiles                       # "make directory and let's call it dot files" → mkdir dotfiles
cp ~/.bash_aliases ~/.gitconfig ~/.bashrc ~/.profile ~/.dotfiles/  # "you can give as many files as you want to copy and then if you give it at the end a folder dot files all those files will be copied"
ls -a ~/.dotfiles
zip -r dotfiles.zip ~/.dotfiles        # "sip a folder into a single file ... zip ... recursively ... call you first give the name of the file that you want to create it's going to be called dot file zip and then you have to tell it where the files come from in this case recursively inside the directory.files"
mv dotfiles.zip ~/projects             # move to RStudio project folder for access
# in RStudio Cloud home:
cd ~; ls -a                            # shows no git config / bashrc
alias                                  # no aliases
cp -r ~/.dotfiles/* ~/                 # "copy cp everything here dot which is you know all the files in this directory and we're going to move them to uh the home directory ... i think i may need the recursive flag let's see yes i need the recursive flag so minus r"
# then new terminal:
alias                                  # now shows rm -i and R alias; "new terminals so basically you're restarting the terminal environment and only then the alices are going to be red"
touch a; rm a                          # prompts "remove it because i'm using the interactive version of rm through the alias"
ls                                     # now with colors
```
