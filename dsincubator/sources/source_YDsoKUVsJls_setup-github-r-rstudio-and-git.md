---
type: source
title: "Setup: GitHub, R, RStudio, and Git"
source_file: "YDsoKUVsJls_setup-github-r-rstudio-and-git.md"
video_id: "YDsoKUVsJls"
url: "https://www.youtube.com/watch?v=YDsoKUVsJls"
lang: en
tags: ["ds-incubator", "github", "git", "github-issues", "terminal"]
key_topics: ["github-setup", "git-config", "rstudio-setup", "credential-helper", "github-clone"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=YDsoKUVsJls"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 142
    last_modified: "2019-10-15T00:00:00Z"
usage_window: { from: "2019-10-15T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Setup: GitHub, R, RStudio, and Git

## Summary

The inaugural DS Incubator meetup ensures the cohort shares a correct setup for GitHub, R, RStudio, and Git ahead of a March workshop, using the `ds-incubator` GitHub repository (issue tracker) and the "Happy Git with R" workshop resources as guides while only sampling the essentials live.

On GitHub, the speaker emphasizes registering a free account with a timeless username containing your real name (so you are discoverable for mentions, assignments, and credit) or at minimum adding your real name under `github.com → Settings → Profile → Name` via the People search. Updating software is motivated with the principle that pain increases disproportionately with time between actions (citing Mark Fowler's writing and Hadley Wickham's Keeper case) — updating R and RStudio often keeps pain minimal — with pointers to the Happy Git with R update instructions.

The hands-on segment introduces yourself to Git via the shell — Windows Git Bash is demoed explicitly ("Windows key and type git bash" → `git bash`). Five `git config --global` lines are shown, to be copied from the shared notes, edited for email/name, and pasted with Shift+Ins (Ctrl+V fails in the terminal): `user.name`, `user.email`, `push.default` (push from any branch easily), `core.editor` (default text editor, `nano` personally but `notepad` recommended for terminal beginners), and `credential.helper` set to `manager` to remember the GitHub username/password after first use. The command `git config --global --list` ("git config global least" → git config --global --list) verifies them.

Connection is proven with an end-to-end HTTPS clone-push loop: create a toy public repository `abc` with a README on github.com, copy the HTTPS URL (required for the `credential.helper` manager flow), then in RStudio use `File → New Project → Version Control → Git`, paste the URL, and create the project to clone it. After appending "a new line from local computer" to `README.md`, stage with Ctrl+A / check box, commit ("first commit from studio"), push (first push prompts for username/password, now cached), and verify on GitHub by refreshing — the new line appears; a second push succeeds without a prompt, confirming the manager helper works. The closing reflection advises that a Git client (e.g., GitHub Desktop, itself not highly recommended) is optional.

## Key Concepts & Tools Taught

- **[github-setup]:** Creating a free GitHub account; username should contain real name and be timeless; otherwise set real name in profile for discoverability via `2DegreesInvesting → People`.
- **[git-config]:** Introducing yourself to Git with `git config --global user.name "Your Name"` and `user.email`, plus `push.default`, `core.editor`, and verification via `git config --global --list`.
- **[rstudio-setup]:** Keeping R and RStudio up to date; Happy Git with R as canonical setup guide.
- **[credential-helper]:** `git config --global credential.helper manager` ("manager" → remember username/password after first entry) and using the HTTPS clone URL together with it.
- **[github-clone]:** End-to-end proof that local Git can talk to GitHub: create repo on github.com → copy HTTPS URL → RStudio New Project → Version Control → Git → clone → edit → stage → commit → push → refresh github.com to confirm line appears.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```bash
git config --global --list  # "git config global least" — list global configs
git config --global user.name "Mauro Lepore"
git config --global user.email "mauro@example.com"
git config --global push.default simple   # "helps you push commits to github from any branch in a very easy way"
git config --global core.editor nano      # "changes that default edit or text editor" — personal: nano; beginner: notepad
git config --global credential.helper manager  # "remember your username and password the first time that you give it"

# Pasting into Git Bash / terminal uses Shift+Ins, not Ctrl+V — "worst shift inst" → Shift+Ins
```

```r
# GitHub → RStudio clone flow (no code, via UI)
# 1. github.com → New repository → name abc → Initialize with README → Create repository
# 2. Copy HTTPS URL (green Code button → "closed with HTTPS" → HTTPS)
# 3. RStudio: File → New Project → Version Control → Git → Paste Repository URL → Create Project
# 4. Edit README.md → add "a new line from local computer" → Git pane → Check → Commit ("first commit from studio") → Push
# First push → enter username/password (now cached via credential.helper); second push → no prompt
# Verify: refresh github.com/2DegreesInvesting/abc — new line appears as bottom line
```
