---
type: source
title: "Daily Git workflows: \"Fork and clone\" explained"
source_file: "tetgpXHal5s_daily-git-workflows-fork-and-clone-explained.md"
video_id: "tetgpXHal5s"
url: "https://www.youtube.com/watch?v=tetgpXHal5s"
lang: en
tags: ["ds-incubator", "github", "git", "workflow", "pull-requests"]
key_topics: ["fork-and-clone", "origin-upstream", "git-sitrep", "create-from-github", "gh-cli"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=tetgpXHal5s"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2020-08-04T00:00:00Z"
    usage_count: 23
usage_window: { from: "2020-08-04T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Daily Git workflows: "Fork and clone" explained

## Summary

A theory-first follow-up to the simplified GitHub Flow, this talk visualizes the fork-and-clone workflow from *Happy Git with R* (Jenny Bryan & Jim Hester) to solve collaboration pitfalls. The take-home: if in doubt between the simpler `clone` vs. `fork and clone`, choose fork-and-clone — it is safer even when you could push directly to 2DegreesInvesting. It also previews tooling for the upcoming workshop: whether to use RStudio Git features, `usethis`, or `gh` CLI, and why automated setup avoids manual mistakes.

Images split GitHub (top) vs. local computer (bottom): yellow top-left = owner repository (e.g., `2degrees-investing/demo`, treated as not owned even if you are a member) → arrow `fork` to your GitHub fork (red top-right, fully under your control) → arrow `clone` down to your RStudio Project on your machine (`New Project → Version Control → Git`, pasting the HTTPS address). The happy path is local → `push` to your fork (red) → `pull request` to owner repo, but the missing link is owner repo vs. local clone: manually, after forking+cloning, `usethis::git_sitrep()` shows `origin` (`mauro-lepore/demo`, forked from `2degrees-investing/demo`) but `upstream` = `no such remote` (icon at top GitHub, bottom computer). As time passes and the owner adds commits, your fork+clone falls out of sync with no way to `pull` upstream changes — a common blocker when PRs depend on each other.

The manual fix is shown: on the owner's GitHub page copy its HTTPS address, then in the terminal `git remote add upstream <owner-address>`; rerunning `git_sitrep` confirms `origin` + `upstream` both present and you can now pull upstream and push origin, completing the triangle `pull upstream → push origin → PR upstream`. 

The automated alternative emphasizes learning analyst-brained tools over raw Git commands: `library(usethis)` → `create_from_github("2degrees-investing/demo", fork = TRUE)` (spec is `owner/repo`; `fork=TRUE` required if you have push access, otherwise implied) which in one call forks (if needed), clones to `~/Desktop/demo`, adds `upstream` remote, pulls upstream, and opens the RStudio Project. Verification via `git_sitrep` now shows both remotes. The same magic is available via the terminal `gh` CLI: `gh repo fork 2degrees-investing/demo` (with `gh auth login`, options to clone the fork locally and add upstream), demonstrated live after deleting the existing fork in Settings.

## Key Concepts & Tools Taught

- **[fork-and-clone]:** Triangle workflow owner repo → fork to your account (GitHub button `Fork`) → clone to local (`New Project → Version Control → Git` pasting HTTPS) → push to fork → PR to upstream; preferred when collaborating externally or even internally to avoid direct pushes.
- **[origin-upstream]:** Remote nicknames: `origin` = your GitHub fork (`mauro le pore demo`), `upstream` = owner's repo (`2degrees investing demo`); manual setup requires `git remote add upstream <address>` after copying owner's address; the triangle ensures you can `pull` upstream changes that would otherwise leave your clone stale.
- **[git-sitrep]:** `usethis::git_sitrep()` ← `git situation report seed prep` / `git seed rep` diagnostic that reports readiness for pull requests, listing `origin` address, `forked from`, and `upstream` status (`no such remote` when missing, correct after `add`); used to prove the missing link.
- **[create-from-github]:** `usethis::create_from_github("owner/repo", fork = TRUE)` — one-call automated setup that forks (creates copy under your account), clones to Desktop, adds `upstream`, pulls upstream, and opens the Project; lesson: prefer `usethis` automation over remembering terminal incantations.
- **[gh-cli]:** GitHub CLI `gh` ← `the gh command line application which is the basically the command line tool that git have created to interact with github` ; `gh auth login` + `gh repo fork 2degrees-investing/demo` (prompts `Clone the fork?`) performs the same fork+clone+upstream wiring from the terminal; alternative to RStudio's manual Git client usage.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```r
library(usethis)  # "usually you need to do library use this i don't generally need to do that because i did something on my art profile"

# diagnostic
usethis::git_sitrep()  # "remember that command git underscore seat situation report ... git situation report seed prep that tells me a lot about gate and github and r studio it tells me that in terms of my readiness for pull requests i have a remote repository that you know has a nickname called origin ... but notice that where it says upstream which is the nickname for the onus repo it says no such remote" 
# before add: origin = https://github.com/mauro-lepore/demo (forked from 2degrees-investing/demo), upstream = no such remote
# manual fix
# in terminal (RStudio Terminal tab):
# git remote add upstream https://github.com/2degrees-investing/demo  # "what you need to do to set up that missing connection is to type to add a new remote into your local git repository so it could be something like this ... git remote add up stream and then paste that address"
usethis::git_sitrep()  # after: shows origin + upstream (can push)
# after upstream added, rerun: "on the origin ... fork ... but also has already that connection that points to the onus ripple ... all that happened magically"

# automated fork-and-clone
create_from_github("2degrees-investing/demo", fork = TRUE)  # "i use a function that is called create from github that takes a repo specification with the format owner repo so owner would be 2 degrees investing and report would be deal ... because i have privileges to push ... i need to be specific about fork equals true" — does: fork → clone to ~/Desktop/demo → add upstream → pull upstream → open project
# if no push access: create_from_github("2degrees-investing/demo") # "if you don't have privileges ... even if you don't specify for it equals true the theme will happen anyway"

# manual RStudio clone path (caption):
# GitHub fork page → green button → copy HTTPS address (https://github.com/mauro-lepore/demo)  # "if you don't know which one you want you probably want the one that starts with https"
# In RStudio: New Project → Version Control → Git → paste address → Create Project
```

```sh
# gh CLI alternative (caption: "you also may like the gh terminal application ... you can also do something like gh repo fork and 2 degrees investing demo")
gh auth login               # setup + SSH
gh repo fork 2degrees-investing/demo --clone  # prompts "Clone the fork? ... it is cloning it locally it is doing everything"
# deletes demo to prove automation:
# GitHub fork → Settings → Delete repository (before re-running create_from_github)
```
