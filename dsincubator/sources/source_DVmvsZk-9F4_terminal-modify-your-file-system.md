---
type: source
title: "terminal: Modify your file system"
source_file: "DVmvsZk-9F4_terminal-modify-your-file-system.md"
video_id: "DVmvsZk-9F4"
url: "https://www.youtube.com/watch?v=DVmvsZk-9F4"
lang: en
tags: ["ds-incubator", "terminal", "git", "docker", "docker-compose"]
key_topics: ["file-system-operations", "vim", "nano", "dotfiles", "aliases", "pipes", "terminal-navigation"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=DVmvsZk-9F4"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 87
    last_modified: "2022-04-25T00:00:00Z"
usage_window: { from: "2022-04-25T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# terminal: Modify your file system

## Summary

Recorded replacement for a live session (overlap with another 2dii meeting), this terminal lesson modifies the file system using a `ds-terminal` repo with a Docker environment (`docker compose up`, `localhost` + `rstudio` / `123` password) and the lesson Rmd as guide. It opens with a fix for the prior meetup's `Ctrl+R` reverse-search demo: the video recorder's binding stole the keystroke, now removed, so `Ctrl+R` → type `cd`/`ls -F` → `Enter` correctly replays history.

The core covers `mkdir` (including `mkdir -p` for nested `folder1/abc/def`, `ls -R` to verify), `touch a.txt` + `cat` + `echo abc > a.txt` (overwrite `>` vs append `>>`), and the weakness of `echo` versus editors. `vim` is taught as ubiquitous fallback (`vim` ≈ `vi`): command vs insert mode (`i` to enter, `Esc` to exit, `dd` to delete line, `Shift+O` to insert above), `:w` to save, `:wq` / `:q` / `:q!` (quit without save when dirty, reminder "no write since last change"), with the concrete warning that bare `git commit` (no `-m "message"`) drops you into `vim` and requires at least `:q!` to abort an empty message (demo: `cd projects/terminal`, `git status -s`, `touch a`, `git add a`, `git config user.email`, `git commit` → `vim` → abort, then commit via Git panel).

`nano` is presented as friendlier: `nano a.txt` shows `^X` (`Ctrl+X`) hints, arrow navigation, no modes, and save prompts; installed on the demo Linux host via `apt update && apt install nano` (not present by default in the minimal container). File operations follow: `cp a b` (`cp` one file to another), `cp ~/.bashrc ~/.profile .` vs `cp ~/.bashrc config` vs `mv ~/.bashrc ~/.profile config` (move vs copy, `mv config dotfiles` vs `mv config new_folder`, `cp -r` / `-R` recursion requirement for directories), `rm` / `rm -i` (interactive, recommended), `rm -r -i` for directories (descend prompt then per-file confirm). Tab completion is highlighted throughout (`cp new<Tab>`).

Persistence is fixed with dotfiles and aliases: `alias` lists, `alias rm='rm -i'` makes the safe flag session-local, but child shells and new terminals lose it; therefore write `alias rm='rm -i'` into `~/.bash_aliases` via `vim ~/.bash_aliases` → `Esc` `:wq`, then every new process sources it and `rm` without `-i` still prompts. Additional `alias greetme='echo hello moto'` demo shows arbitrary commands. Composing commands uses pipes: `cat ~/.bashrc | head` (or `cat ~/.profile | head -n`), `cat ~/.bashrc | sort` (alphabetical), `cat -n` to prefix line numbers, chainable; help via `ls --help` or `man ls` (minimal image says "minimized to keep it sweet"). Takeaways: `vim` exit (`:q!`), `rm -i` safety + alias override, pipes for composition, `help`/`man` for flags, and `Ctrl+L` / `clear` vs `history` search (`ls -F`, `ls -a` vs `ls -A`, `~/` as home, `..` as parent, `pwd`, `cd`).

## Key Concepts & Tools Taught

- **[file-system-operations]:** Creating and mutating files/directories: `mkdir` (+ `-p` for parents), `touch`, `echo >` / `>>`, `cp` / `mv`, `rm -i` / `rm -r -i`, `ls -F` (slash for dirs, color), `ls -A`/`-a` for hidden, `pwd`, `cd`, `cd ~` / `..`, `ls -R` for recursion; Tab completion and `clear` / `Ctrl+L`.
- **[vim]:** Ubiquitous editor `vim`/`vi`; command mode vs insert mode (`i` enters, `Esc` exits), line ops (`dd` ×2 deletes line, `Shift+O` opens line above), save/quit `:w` / `:wq` / `:q!` (force quit without saving), fallback when `git commit` without `-m` drops into `vim` with empty-message abort.
- **[nano]:** Friendlier `nano` editor (`Ctrl+X` to exit, prompts to save buffer → filename → `Enter`); not always installed (`apt update; apt install nano`), preferred until invested in `vim`.
- **[dotfiles]:** Leading-dot configs in `$HOME` governing terminal look/feel: `~/.bashrc`, `~/.profile`, `~/.bash_aliases`; copied/moved via `cp ~/.bashrc .` or `mv` to project, persist across sessions unlike session-local aliases.
- **[aliases]:** Shell `alias` to create/override commands; `alias rm='rm -i'` (single quotes) forces interactive removal; `alias` alone lists; permanent fix writes to `~/.bash_aliases` so every new/bl child process inherits; also `alias greetme='echo hello moto'` style custom commands.
- **[pipes]:** Composing commands by feeding stdout of one into next: `cat ~/.bashrc | head`, `cat ~/.bashrc | head -n`, `cat -n ~/.bashrc | head`, `cat ~/.bashrc | sort`; chainable beyond two stages.
- **[terminal-navigation]:** History search `Ctrl+R` (reverse search, `Enter` to accept proposal for `cd ~`/`ls -F`), help discovery `ls --help` / `man ls`, and editing context (insert/normal modes, buffer vs file).

## Code Snippets & Formulas

Spoken terminal calls dictated live (caption-mangled, normalized here):

```bash
# Environment from previous series — Docker compose for lesson repo
docker compose up                 # "docker compose app to run the docker container that has the environment that i want to use called localhost"
# then browser: localhost, user: rstudio, password: "123" ("type r studio and the password123")

# History navigation (fix from last time)
# Ctrl+R → type cd → Enter      # "if you press ctrl r you enter this reverse search tool ... if you do cd immediately populate cd with tilde"
# why it failed before: "there was a conflict between the shortcut that does this thing and a shortcut that stopped the video in the program that i'm using to record"

# Basic navigation and listing
cd ~                              # "cd to home tilla is short form for home"
clear ; Ctrl+L                    # "clear with the word clear or with control l"
pwd                               # "print working directory ... home mauro"
ls -F                             # "ls which we learned about last time with minus f which shows differences between files and directories"
ls -a ; ls -A                     # "ls minus a and capital a is similar to a except that this dot and dot dot directories do not show up"
ls -R folder1                     # "ls recursively on a folder one"

# Creating directories
mkdir folder1 folder2 folder3     # "mk mk tier makes a directory so i could do folder one ... to make just that one directory"
mkdir -p folder1/abc/def          # "for that specific type of nested directory you need a minus b for parents ... that will work" → -p parents
# fails without -p: "abc def will create the directory def inside abc inside folder one but if i read that it fails"

# Creating files
touch a.txt                       # "to use the command touch for example a file called a txt creates the file"
cat a.txt                         # "you use cat to show the context of a file"
echo abc > a.txt                  # "whatever you give it so say abc it will respond ... you can redirect that to a dot txt if you use greater than symbol it will write the file or overwrite it"
echo hello > a.txt                # overwrite → "now the contents of atxt is no longer a b c d f ... the contents is hello"
echo abc >> a.txt                 # "to extend the file to append it i can do double greater than symbol ... a new line has been added"
echo hi > b.txt                   # "echo high redirected to 5b txt b doesn't exist but you have just created it"

# vim — the ubiquitous fallback
vim a.txt ; vi a.txt              # "vi which is pretty much the same thing ... veeam txt if the file doesn't exist we'll create it empty and if the file does exist it will open it"
# inside vim: i → type → Esc → dd → Shift+O → Esc → :w → :wq / :q / :q!
# "when you open the file you are dropped into what's called command mode which allows you to do things like the leading line by pressing two times d ... or by entering a line above ... with shift and oak"
# "you enter the edits then the other a or insert mode with i and you exit it with escape ... when you want to exit you have to type ... shift column and then tell how you want to exit ... w and enter will do the trick ... quit and save you first say with all you and then quit with queue"
# "i did w and equip my first saved ... :w ... :q ... if i do any edition ... and i want to exit without saving ... i will be reminded that there were changes that had not been written and if i want to really quit i have to do bank [:q!]"

# git + vim interaction
cd projects/terminal && git status -s  # "cd into projects and terminal repo which is a git repo and here i can do say a git status with minus s"
touch a && git add a                   # "i'm going to touch a ... git add a without defined to a station area"
git commit -m "some message"           # normal path: "takes a argument that is m for message"
git commit                             # "if you forget the m you will be dropped ... in this editor beam editor ... you may still be dropped into an editor ... at least you need to know a column q bank to exit the file without doing anything"
git config user.email "x@gmail.com"    # "i had to first like kind of target who i am with gmail.com"

# nano — friendlier alternative
nano a.txt                             # "nano is another program ... a dot txt if the file does not exist we'll create it ... this system will fail because it doesn't exist ... has to be installed"
apt update && apt install nano         # "in the linux system ... you will install a program doing something like this first updating the registry ... then you do ... install and the name of the program in this case nano"

# Copy / move — files and dotfiles, Tab completion
cp a b                                 # "one thing we could copy is one file from one place to the other ... let's say that we want to copy a to b and so now we have two files a and b"
cp ~/.bashrc ~/.profile .              # "we can copy ... bash rc ... and also profile ... if you want to copy them to the current directory you could type the whole path like tilde projects yesterday or you could use dot dot remember means here"
mkdir config && cp ~/.bashrc ~/.profile config  # "it would be nice to make a directory to host those files and call them say config"
mv ~/.bashrc ~/.profile config         # move vs copy — "you can move them instead of copying them ... move mv stands for move"
mv config dotfiles ; mv dotfiles/config .  # confusion demo — "what i did is i copied the ... i move config inside dot file the whole thing inside the directory"
mv config new_folder                   # "we can move config to a new folder ... as ls minus a config should not exist ... but new folder it should exist"
cp -r new_folder new_folder2           # "if you want to copy ... you can't ... we're asked to use if we want to do that to use the minus r for recursive flag" → cp -r / -R

# Removal — dangerous without -i
rm -i ~/.bashrc                        # "always recommend you to use the minus i flag because minus i will ask you for confirmation and the problem with rm is that it does not have an undo button"
rm -r -i new_folder                    # "remove pc directory ... you have to say recursively with the interactive flag it will ask you to first confirm if you want to send into the contents ... we present you with a question for each file ... after that ... configure we're going to remove the entire directory because it's now empty"
rm -i a b                              # "takes many files av we can give it all in one call"

# Aliases — session vs permanent via dotfiles
alias                                  # "the command alias by itself ... it shows a few aliases that you have configured"
alias rm='rm -i'                       # "if you give a command of the or a flag of the form rm equals quote rm is instead of ram is rm minus i then that is your new program ... every time you type ... remove it without the flag minus i you will still be asked"
# child process loses it: "if you start another batch terminal inside this one the children process ... typing alias does not show ... it is only when you exit the children process and stand in the parent process that you see the alias"
vim ~/.bash_aliases                    # "there is one called dot bash aliases which is responsible for storing aliases just like the one that i showed ... may not exist ... we can do vim and the file name to create it and now we can type the alias that we want rm should be rm minus i"
# then Esc :wq ; new terminals/sh now prompt even without -i

# Custom alias example
alias greetme='echo hello moto'        # "you could do alias greet me ... echo hello moto ... oops i think i made a mistake in the quoting it's a simple quote ... i have just created the command greet me"

# Pipes — composing commands
cat ~/.profile                         # "you can inspect the context of a text file with cad ... this is the file it's pretty short"
cat ~/.bashrc                          # "it's much longer so i may want to see just the head"
cat ~/.bashrc | head                   # "how can i get ... output and fit it into another command which is hell a head that shows just the head ... is with the pipe ... you can pipe it you can pass it as an input to a new command in this case head and that will compose ... cut and head so that the output of cat gets fed into a head"
cat ~/.bashrc | head -n 10             # -n prefix? "with a minus n flag because that will show the number of line"
cat ~/.bashrc | sort                   # "you can pipe either sort ... and it will sort the lines by alphabetical order"
cat -n ~/.bashrc | head                # "i do a lot is a cat with a minus n flag ... and then when i do head ... that kind of shows me how many lines are being displayed in this case 10"

# Help
ls --help ; man ls                     # "if you want to learn about the command less you can try ls minus minus help ... but if that's not the case then you can also try mine first so the commandment with the name of the command ... except in this system because it has been minimized to keep it sweet basically it's a docker container it has to be small"
```
