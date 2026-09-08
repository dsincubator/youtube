---
type: source
title: "terminal: Create a custom command as a user in a multi-user system"
source_file: "jyBv5ITO718_terminal-create-a-custom-command-as-a-user-in-a-multi-user-system.md"
video_id: "jyBv5ITO718"
url: "https://www.youtube.com/watch?v=jyBv5ITO718"
lang: en
tags: ["ds-incubator", "permissions", "terminal", "docker"]
key_topics: ["multi-user-system", "environment-variables", "shell-permissions", "custom-command"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=jyBv5ITO718"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2022-05-17T00:00:00Z"
    usage_count: 16
usage_window: { from: "2022-05-17T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# terminal: Create a custom command as a user in a multi-user system

## Summary

The session completes the terminal series by building a mental model of a multi-user system from the view of an ordinary user, culminating in creating a personal `hi` command that greets the logged-in user. The demo runs in a reproducible Docker container that hosts RStudio Server, accessed through a URL and login as user `rstudio` (not the presenter's personal name), illustrating that even a laptop can be multi-user.

Objectives are to log in with username/password, read environment variables `USER`, `HOME`, and `PATH`, write the `hi` command first as a script runnable with `bash`, and then promote it to a true command. Key background includes: `echo hi` vs `echo $USER` / `echo $HOME` (`/home/rstudio`, where the user has full privileges) and `echo $PATH`, a colon-separated list of directories the shell watches (e.g., `/usr/bin` where `which ls` and `which bash` show commands live). Typing a name not in `PATH` yields `command not found`, even if the binary exists elsewhere.

The fix for user-local commands is `~/.profile`, which on login includes `$HOME/bin` if it exists. The speaker shows `cat ~/.profile` and `ls ~` (no `bin` yet), creates it (`mkdir bin`), notes a new terminal is needed for `.profile` to be re-read, and then `echo $PATH` shows `/home/rstudio/bin`. Inside `~/bin`, the `hi` script is created with `vim` containing `echo hi $USER`; running `bash hi` works but plain `hi` gives `permission denied`. The remedy adds a shebang `#!/usr/bin/bash` (using `which bash` → `/usr/bin/bash`, caption "pound and a bang ... called shebang") and executable permission: `ls -l hi` shows `rw-` without `x`, then `chmod +x hi` (`change mode` + `x for executable`) yields `rwx` and color highlighting, so `hi` works from any directory. The coda explains the `rwx r-- r--` triple (owner `rstudio`, group `rstudio`, others), why group/others matter in teams, and previews `sudo` acting as `root` for privileged installs, noting IT-managed machines and per-user R package locations as common pain points.

## Key Concepts & Tools Taught

- **[multi-user-system]:** a single machine can have many accounts with distinct home directories and privilege scopes; an unprivileged user cannot install system software like Docker without IT, and even `which` prompts show the active account.
- **[environment-variables]:** `USER` holds the login name, `HOME` is `/home/rstudio` where the user may write freely, and `PATH` is the colon-separated watchlist of command directories; `which ls`/`which bash` → `/usr/bin` shows why those names work as commands.
- **[shell-permissions]:** `ls -l hi` displays `rwx` triplets for owner/group/others (`r` read, `w` write, `x` execute); a newly created file lacks `x`, causing `permission denied` until `chmod +x hi` (`change mode` add executable) grants it.
- **[custom-command]:** a user-private `~/bin` included via `~/.profile` plus a script with shebang `#!/usr/bin/bash` and `chmod +x` becomes a discoverable command (`hi` → `hi rstudio`) from any working directory; `vim` with `esc :wq` edits, and `bash hi` runs a script without that promotion.

## Code Snippets & Formulas

Caption-anchored commands (mangled → normalized):

```bash
echo hi                       # "echo is this command that if you say echo high it will respond high" — echo high ← echo hi
echo $USER                    # "evaluate the value of ... environment variable called user with capital letters user ... holds the name of the ... user that locked into that system" — user ← $USER
echo $HOME                    # "value of the home directory ... slash home slash rstudio" — home ← $HOME
echo $PATH                    # "value of the environment variable path which is ... a bunch of paths ... separated by columns" — path ← $PATH

which ls                      # "which ls will tell you okay ls lives in user slash bin" — which ls ← which ls
which bash                    # "which bash ... it lives in the same location slash user slash bin slash bash" — which bash ← which bash

cat ~/.profile                # "inspecting a file that ... it's called profile and it lives in your home directory so cat home slash dot profile" — dot profile ← ~/.profile
ls -l hi                      # "you do it with the command ls but you have to add the minus l flag" — minus l ← -l
# "there should be an x somewhere for execute that there is not" — rwx parsing
ls ~ ; mkdir bin ; ls ~       # "with make deer bean ... now i do have a bin folder" — make deer bean ← mkdir bin
cat > ~/bin/hi <<'EOS'
#!/usr/bin/bash               # "the way you specify that this is the declaration ... starts with a pound and a bang so it's called shebang ... better to specify the full path ... slash user slash bin slash bash" — pound and a bang / shebang ← #!/usr/bin/bash
echo hi $USER                 # "echo hi dollar sign ... evaluate user so that way when we invoke ... we would get a high our studio" — echo hi $USER ← echo hi $USER
EOS

vim hi                        # "i'm going to use the program theme to create a file ... i'm using veeam ... move to the commands mode with escape and then type shift column ... w saves ... q quits" — theme / veeam ← vim
bash hi                       # "use the comma the program bash to run that file ... when we do bash high we get the answer hi our studio" — bash high ← bash hi
hi                            # "if i type hi it just gets the answer" — hi ← hi (after chmod)
chmod +x hi                   # "you have to change ch the mode ... it's called chmod change mode ... you want to add ... x secure and what you want to execute the command hi" — ch / change mode / x secure ← chmod +x
# group/others detail: "three sets of permissions ... rwx for owner ... group ... others ... every new user ... belongs to ... a group that has their own name" — rwx ← rwx
```
