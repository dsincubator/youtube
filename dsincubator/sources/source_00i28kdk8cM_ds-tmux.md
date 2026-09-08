---
type: source
title: "ds.tmux"
source_file: "00i28kdk8cM_ds-tmux.md"
video_id: "00i28kdk8cM"
url: "https://www.youtube.com/watch?v=00i28kdk8cM"
lang: en
tags: ["ds-incubator", "terminal", "docker", "tmux"]
key_topics: ["tmux", "terminal-windows", "terminal-panels", "detached-sessions", "ssh", "collaborative-terminal"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=00i28kdk8cM"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 88
    last_modified: "2022-08-08T00:00:00Z"
usage_window: { from: "2022-08-08T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# ds.tmux

## Summary

This session is a remake of a meetup originally led by Alex on `tmax` ← `tmax`/`tmux`, conceptually framed as terminal multiplexing for environments without a graphical user interface. The speaker first builds a mental model from GUI window management — moving, resizing, maximizing and covering windows, using multiple desktops and terminals side by side — then shows the equivalent on a remote machine reached via `ssh` ← `ssh` where the mouse is unavailable.

On a DigitalOcean server the speaker demonstrates `tmux` sessions, windows and panels: starting a new session that runs `zsh` ← `zsh`/`bash`, renaming windows with the prefix `Ctrl+b ,` ← `ctrl v`/`ctrl b and the comma`, creating new windows with `Ctrl+b c` ← `ctrl b and the letter c`, switching windows with `Ctrl+b 0/1` ← `ctrl b and ... the number of the window`, splitting the current window into panels with `Ctrl+b %` ← `ctrl b and percent which in my case is shift number five`, resizing panels with `Ctrl+b` + arrows ← `ctrl v and then with the ctrl pressed i can press the arrows`, renaming sessions with `Ctrl+b $` ← `ctrl b and dollar sign`, and managing the lifecycle with `tmux ls`, `tmux attach -t`, `tmux new -s`, detach `Ctrl+b d` ← `ctrl b and d`, and close `Ctrl+b x` / `Ctrl+b &` and `Ctrl+d` ← `ctrl v with x` / `ctrl b with and` / `ctrl d`.

Two additional workflows are shown: detached background execution — detaching a session with a long-running process so it continues while the terminal is used for other work and reattaching later — and collaborative work where two users on different machines `ssh` into the same host, list sessions with `tmux ls`, attach to the same named session (`d0s2` / `dos one`) with `tmux attach -t`, and see each other's keystrokes and edits in the same pane (demonstrated by creating `abc` in `/tmp` with `vim` and concurrent typing).

## Key Concepts & Tools Taught

- **[tmux]:** Terminal multiplexer (`tmax` ← `tmax` in captions) that provides sessions, windows and panels inside a single terminal, essential when no graphical interface is available.
- **[terminal-windows]:** Windows inside a `tmux` session (e.g., `terminal` and `docker`/`r` windows numbered 0, 1), created with `Ctrl+b c`, renamed with `Ctrl+b ,`, and switched with `Ctrl+b <number>`.
- **[terminal-panels]:** Panes created by splitting a window (`Ctrl+b %`), each running an independent process (e.g., two `docker run` instances), resized with `Ctrl+b` + arrows or `Ctrl+-`.
- **[detached-sessions]:** Sessions that keep running after detach (`Ctrl+b d`); inspected with `tmux ls` ← `tmax ls`/`dmx ls`/`tmxls`, reattached with `tmux attach -t <name>` ← `tmax attach ... minus t`, and newly created with `tmux new -s <name>` ← `dmax new ... if we do minus s`.
- **[ssh]:** Remote login demonstrated as `ssh root@<ipv4>` ← `ssh roots` / `ssh root at ... the server` to a DigitalOcean droplet (`penguin` vs `mauro` host) to obtain a non-GUI shell where `tmux` is needed.
- **[collaborative-terminal]:** Two users `ssh` into the same server, run `tmux ls` to see the same sessions, and `tmux attach -t d0s2` to share the exact terminal, enabling simultaneous editing visible on both sides.
- **[docker]:** Container execution inside `tmux` windows/panels shown as `docker run --rm -it` ← `poke run interactive players` / `docker run remove interactive` with images `roker`/`rocker/verse` and commands `bash` and `R`.

## Code Snippets & Formulas

Spoken commands dictated live (caption-mangled, normalized here):

```sh
ssh root@<ipv4>                  # "ssh roots" / "ssh root at the server" — connect to DigitalOcean droplet
tmux                             # "t-max is this program that when you run it you start a new tmax session"
tmux ls                          # "tmax ls" / "dmx ls" / "tmxls" — list sessions (e.g., dos one, d0s2)
tmux new -s d0s2                 # "dmax new if we do minus s we can name the session ... d0s2"
tmux attach -t d0s2              # "tmax attach and now you have to if it's name you have to say minus t and the name"
tmux attach -t dos_one           # "max attach decision named dos one" — reattach other session
# tmux key bindings (prefix Ctrl+b):
# Ctrl+b ,                       # "ctrl b and the comma" / "ctrl v" — rename window (e.g., to terminal / docker/r)
# Ctrl+b c                       # "ctrl b and the letter c" — create new window
# Ctrl+b 0 / Ctrl+b 1            # "ctrl b and to change the window you just type the number"
# Ctrl+b %                       # "ctrl b and percent which in my case is shift number five" — split pane
# Ctrl+b <arrows> (with Ctrl)   # "ctrl v and then with the ctrl pressed i can press the arrows" — resize pane
# Ctrl+b $                       # "ctrl b and dollar sign which for me is shift number four" — rename session
# Ctrl+b d                       # "ctrl b and d detaches from that team accession"
# Ctrl+b x / Ctrl+b &            # "ctrl v with x" / "ctrl b with and" — close pane / window
# Ctrl+d                         # "terminate the session we can do ctrl d"
docker run --rm -it rocker/verse bash  # "docker run remove interactive ... broker first ... and run bash first and now r"
# also: bash / zsh / R           # "the program being run at the moment is zsh i could run bash instead" / "here that docker image is gonna run r"
vim /tmp/abc                     # "create a new file inside a temp ... create file called abc" (edited with vim)
```
