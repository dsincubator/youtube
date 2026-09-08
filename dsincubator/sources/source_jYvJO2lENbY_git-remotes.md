---
type: source
title: "Git remotes"
source_file: "jYvJO2lENbY_git-remotes.md"
video_id: "jYvJO2lENbY"
url: "https://www.youtube.com/watch?v=jYvJO2lENbY"
lang: en
tags: ["ds-incubator", "git", "github", "terminal", "workflow"]
key_topics: ["git-remotes", "clone-and-ssh-urls", "fetch-merge-vs-pull", "upstream-tracking", "pr-workflow"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=jYvJO2lENbY"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 6
    last_modified: "2020-12-01T00:00:00Z"
usage_window: { from: "2020-12-01T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# Git remotes

## Summary

This terminal-focused Git session explains remotes — repositories living outside your local computer (sometimes even inside it) — as a concept relative to a local repository, and is motivated by a real case: the `r2dii.match` R package hosted in the `2degreesinvesting` organization. The speaker surveys scattered lesson material (quick introduction to setting up a remote, cloning → Collaboration with Distributed Version Control) but chooses to cherry-pick key concepts via a live demo from a local `tmp` folder. Cloning is presented as the common way to connect a remote to a local repository (vs. creating from scratch): `git clone <url>` downloads the `.git` folder containing both current state and full history into the current location. Two URL forms are shown under the Code button — HTTPS (`https://github.com/...`) and SSH (`git@github.com:2degreesinvesting/r2dii-match.git`) — noting SSH adds security and recommending follow-up on differences. After cloning, `cd r2dii-match` and `git remote` lists the nickname while `git remote -v` shows the mapping (`origin` → long URL). The talk emphasizes that `origin` is just a default nickname and multiple remotes can exist (e.g., `origin` for your fork, `upstream` for the organization source of truth). Synchronization is stressed before starting a PR branch: `git fetch origin` brings all metadata but does not merge; `git merge origin/master` merges `origin/master` into `master` (a remote branch referenced as `<remote>/<branch>`); `git pull` is the shortcut for fetch+merge, and bare `git pull` uses already-configured tracking. Tracking is inspected via `git branch` (boring) vs. `git branch -vv` (verbose) which shows `master [origin/master]` meaning local `master` tracks `origin/master`. A PR workflow is walked through: `git checkout -b PR` to create and switch, create `file a` via `touch file a`, `git status`, `git add`, `git commit`, `git log --oneline --graph --decorate` showing `master` and `PR` diverge, then `git push -u origin PR` (`-u` = `--set-upstream`) to create `PR` on `origin` and associate tracking — verified by `git branch -vv` now showing `PR [origin/PR]` — enabling bare `git push`/`pull`. On GitHub the new branch is detected with a Compare & Pull Request prompt, the PR is created and later closed, the remote branch deleted, `git fetch` reveals the deletion, then locally `git checkout master` and `git branch -d PR`. The takeaway is to keep two places in sync continuously: your own PR branch on the remote via `git pull` and the upstream `master` via `git fetch origin` + `git merge origin/master` to avoid falling far behind and incurring merge conflicts; tooling like `usethis::pr_sync` or `gh pr` and the speaker's `pr_sync`/`R sync` wrapper abstract this tedious dual tracking.

## Key Concepts & Tools Taught

- **git-remotes**: A remote is any repository outside the one you consider local; `git remote` lists nicknames, `git remote -v` shows verbatim fetch/push URLs.
- **clone-and-ssh-urls**: `git clone <url>` downloads a repository (including `.git` history) into the current folder; URLs may be **HTTPS** (`https://...`) or **SSH** (`git@github.com:owner/repo.git`); SSH is more secure; copying from GitHub's Code button is the source.
- **fetch-merge-vs-pull**: `git fetch origin` only brings metadata, no local change; `git merge origin/master` actually merges remote branch into current branch (`<remote>/<branch>` syntax); `git pull` is the shortcut that does fetch+merge; `git pull origin` vs. `git pull origin master` syntax is disambiguated.
- **upstream-tracking**: `git branch -vv` shows tracking connections (e.g., `master [origin/master]` auto-configured on clone); for a new branch `PR` there is initially no bracket, so bare `pull` has no target until `git push -u origin PR` creates `origin/PR` and sets upstream, after which bare `git pull` knows to fetch origin's `PR`.
- **pr-workflow**: Full lifecycle demoed: `git checkout -b PR` → edit `touch file a` → `git add` → `git commit` → `git log --oneline --graph --decorate` → `git push -u origin PR` → GitHub Compare & PR → close PR → delete remote branch → `git fetch` to learn deletion → `git checkout master` → `git branch -d PR`; the importance of syncing both your PR and `origin/master` frequently is stressed.


## Code Snippets & Formulas

Caption-mangled forms with normalized git CLI:

```bash
# Clone (caption "you have to give it you know in the same way when you visit a web page you need to visit you know a URL like something that starts with like https whatever")
git clone git@github.com:2degreesinvesting/r2dii-match.git  # SSH URL # "when you click here on the main page ... there is this address here that is the URL that I used to connect basically my GitHub repository with my logo repository if I click on the https tab this URL will transform"
# alternative HTTPS: https://github.com/2degreesinvesting/r2dii-match.git

cd r2dii-match
ls  # see cloned folder
git remote        # -> origin  # "if I do just that I will get a name which is a nickname for the remote but that is not very informative"
git remote -v     # -> origin  git@github.com:2degreesinvesting/r2dii-match.git (fetch) + (push)  # "you would usually want give remote minus VV v stands for veros" # minus VV <- -v / -vv
# "origin is just a nickname a way that I can use to refer to that address without spelling it out"

# Fetch vs merge vs pull
git fetch origin          # "to fetch to bring all the metadata Associated to this repository from the remote ... you could be explicit and say what do you want to fetch I want to fetch from the address origin"
git merge origin/master   # "what does this mean well you already know what a g merge is ... you are standing on One Branch in this case master and you say get merged some other Branch ... is just a branch so you can refer to a branch by giving it the name of the remote slash the name of the Branch" # get merged <- git merge
git pull                  # "there is a shortcut which is get ... if you do G pool ... git will try to use any setup configuration that it already has" # get pool <- git pull -> fetch + merge
git pull origin           # correct explicit form (caption shows confusion with "git pull origin Master")
git branch                # boring list
git branch -vv            # verbose shows "local Master branch is automatically tracking changes on the origin Master Branch so that when I do git pull the branch that git will pull from the remote is the one that is configured" # master [origin/master]

# Create PR branch
git checkout -b PR        # "the way I generally do do it is get check out sorry I didn't mean to do that get checkout minus B which creates a new branch and then checks it out" # get checkout minus B <- git checkout -b
git log --oneline --graph --decorate  # shows master and PR at same commit then PR ahead by one
touch file_a && git add . && git commit -m "add file a"
git push -u origin PR     # "the command is of course get push you can say minus U which is a way to express U stands for upstream" # minus U <- -u ; "this will create a branch PR called PR on the remote origin that will be tracking automatically my PR Branch locally"
# After push: git branch -vv now shows "PR [origin/PR]" -> bare git pull knows origin/PR

# Sync before continuing work
git pull                       # update own PR branch (fetch origin + merge origin/PR)
git fetch origin && git merge origin/master  # keep up with upstream master # "to keep really in sync is to now also merge the master Branch from the origin"

# Cleanup after closing PR on GitHub
git fetch                     # shows deletion of remote PR branch
git checkout master
git branch -d PR             # destroy local PR # "destroy the branch minus d PR" # minus d <- -d
# PR sync wrapper mentioned: "R sync and that will pull ... wrapper around the function from use this PR sync think and that does all that magic" # use this PR sync <- usethis::pr_sync via pr_sync / R sync
```

