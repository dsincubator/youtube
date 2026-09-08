---
type: source
title: "terminal overview"
source_file: "yOJZHRGF3Bk_terminal-overview.md"
video_id: "yOJZHRGF3Bk"
url: "https://www.youtube.com/watch?v=yOJZHRGF3Bk"
lang: en
tags: ["ds-incubator", "terminal", "shell", "docker-compose"]
key_topics: ["unix-shell", "filesystem-navigation", "piping-and-redirection", "terminal-customization", "finding-things"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=yOJZHRGF3Bk"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 41
    last_modified: "2022-04-12T00:00:00Z"
usage_window: { from: "2022-04-12T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# terminal overview

## Summary

Opening the **terminal (Unix shell)** series (based on Software Carpentry's *The Unix Shell*), this overview gives a high-level map of what the terminal is, what it does best, and when *not* to use it. The terminal is framed as a tool to interact with other tools (vs clicking GUIs); it shines when a task must be repeated hundreds of times, but for one-off expressive data work R may be better. The session interleaves conceptual discussion with a live demo using a file explorer (left) and a terminal (right), plus audience Q&A on extensions, cross-platform differences, and help systems.

**Navigation:** The demo mirrors GUI actions: `pwd` (print working directory) shows location ("to see where I am I can print the working directory pwd" ← `pwd`), `ls` lists contents, `ls -l` detailed view, `ls -1` one-column view, `cd <dir>` changes directory ("if I want to get into desktop well then I change directory into desktop" ← `cd`). Tab autocomplete is shown for paths (`D<Tab>` fails ambiguous, disambiguated then completes), `history` via up-arrow, `clear` / `Ctrl+L` to clear screen. Customization touches `PS1` prompt variable in `~/.profile` ("I use the variable ps and I defined it in my configuration file ... dot profile file ... makes my prompt show just my working directory only the base name" ← `PS1`).

**Modifying:** `mkdir <name>` creates directories (`make dear a` ← `mkdir`), `touch b.txt` creates files, `rm -i b.txt` interactive remove requiring confirmation ("to make it safer I can type a flag that is an interactive remove to get a confirmation" ← `rm -i`), and navigation back with `cd ..`.

**Combining & composing:** Flags combine (`ls -lhS` shows human-readable sizes sorted, `-r` reverses — "I could combine flags with ... l to list things ... but also to ... sort them ... uppercase S will sort files by size ... r to reverse the sort" ← `ls -lhS -r`). Pipes compose commands: `|` feeds output as input ("pipe operator that allows you to feed the output of one command as the input to another" ← `|`), analogous to `%>%` in R; example `wc -l *` ("word count counts not only words but also counts lines if I say minus l ... to make sure that I'm gonna get the count for everything here I use the asterisk which stands for god of all" ← `wc -l`) piped to `sort` and redirected with `>` to `out.txt` ("if I wanted to redirect the output not just to console but to a file ... greater than symbol that will send it the standard output" ← `>`), then displayed with `cat out.txt`. Data explored under `shell-lesson-data/north/` (`*` expansion, line counts 300 vs 17/10).

**Broader map & community notes:** Finding files/text (`find`, `grep`, `xargs`), loops (`for` in bash vs R), and shell scripting/`alias` for reuse (`alias rm='rm -i'` — "I transform the rm command ... into one that is more safe because at least I have to confirm" ← `alias`) are previewed as later deeper dives, with emphasis on curating the 20% of tools yielding 80% value. Help via `man <command>` ("man is a function that you pull up the functions the help files for these commands" ← `man`) versus Stack Overflow is debated; Alex stresses remembering *that* something can be done over memorizing flags, and warns Mac commands differ slightly from Ubuntu demo (`ssh`, `ls` flags etc.), Windows users can get a shell via Git Bash. The Q&A confirms extensions are just naming conventions on Linux (`b.txt` vs `b.R` vs `b.py` — "you can create a file with any extension which is kind of powerful and dangerous ... if you use misleading extensions then you will be misled" ← extension).

## Key Concepts & Tools Taught

- **[unix-shell / unix-shell]:** Terminal as interface to tools, powerful & dangerous, complement to GUIs (Shiny, Dropbox, R). Carpentry syllabus preview.
- **[filesystem-navigation / filesystem-navigation]:** `pwd`, `ls`/`ls -l`/`ls -1`, `cd <dir>`, `cd ..`, `mkdir`, `touch`, `rm -i`, `clear`/`Ctrl+L`, tab autocomplete, up-arrow history.
- **[piping-and-redirection / piping-and-redirection]:** Composing flags (`ls -lhS -r`), pipe `|` (`wc -l * | sort`), redirect `>` (`... > out.txt`), inspect with `cat`.
- **[terminal-customization / terminal-customization]:** `PS1` in `~/.profile` to shorten prompt to basename; `alias rm='rm -i'` for safety.
- **[finding-things / finding-things]:** Preview of `find` (file search), `grep` (text search), `xargs`/`for` loops for iteration, and `man` help files vs online help.

## Code Snippets & Formulas

Caption-mangled, normalized:

```bash
pwd                         # "to see where I am I can print the working directory pwd" ← pwd
ls; ls -l; ls -1            # "list the files and do an ls list ... minus l which modifies the command ... minus one which will show one column" ← ls
cd desktop                  # "if I want to get into desktop well then I change directory into desktop" ← cd + Tab autocomplete
cd ..                       # "move back a little bit which I can do with dot dot to go back" ← cd ..
mkdir a                     # "create a new directory with my dear and ... forgot to pass an argument ... make dear a" ← mkdir
touch a/b.txt               # "create a file with touch ... inside a ... called ... b dot txt" ← touch
rm -i a/b.txt               # "to make it safer I can type a flag that is an interactive remove to get a confirmation" ← rm -i
clear; Ctrl+L               # "if I want to clear I can type clear ... or ... press a ctrl and l" ← clear

ls -lhS                     # "combine flags ... l to list ... S will ... I add information about size ... h will make it in human readable ... uppercase S will sort files by size" ← ls -lhS
ls -lhSr                    # "another flag here r to reverse the sort" ← -r
# Sorting GUI analogy: click column in file browser ↔ ls -S

wc -l *                     # "first do word count counts not only words but also counts lines if I say minus l ... use the asterisk which stands for god of all" ← wc -l
wc -l * | sort              # "use the pipe so the result of computing the lines count ... then pass to sort" ← pipe |
wc -l * | sort > out.txt    # "if I wanted to redirect the output ... to a file ... greater than symbol that will send it the standard output into a file" ← >
cat out.txt

PS1='\W\$ ' ; echo $PS1 >> ~/.profile  # "I use the variable ps and I defined it in my configuration file ... dot profile ... makes my prompt show just my working directory only the base name" ← PS1
alias rm='rm -i'            # "I transform the rm command ... into one that is more safe" ← alias
man ls; man grep            # "man is a function that you pull up the functions the help files" ← man
```

