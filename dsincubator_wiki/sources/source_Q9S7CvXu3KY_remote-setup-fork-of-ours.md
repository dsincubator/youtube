---
type: source
title: "Remote setup: Fork (of ours)"
source_file: "Q9S7CvXu3KY_remote-setup-fork-of-ours.md"
video_id: "Q9S7CvXu3KY"
url: "https://www.youtube.com/watch?v=Q9S7CvXu3KY"
lang: en
tags: ["ds-incubator", "git", "pull-requests", "terminal", "github"]
key_topics: ["fork-of-ours", "github-workflow", "gh-cli"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=Q9S7CvXu3KY"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 15
    last_modified: "2020-12-08T00:00:00Z"
usage_window: { from: "2020-12-08T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# Remote setup: Fork (of ours)

## Summary

This session closes the "working with Git from the terminal" series by contrasting two remote setups from Happy Git with R: `ours` and `fork of ours`, both under the umbrella of the GitHub workflow — one long-lived `main`/`master` branch plus short-lived topic branches merged via pull request, never pushing directly to `main`.

The previous meetup covered `ours`, the simplest setup where every team member has push privileges to the main repository's `master` branch and pushes feature branches directly to that repo (with auto-delete of contributed branches enabled). The presenter now endorses this simple setup for internal 2degrees work.

Today's focus is `fork of ours`, the more complex setup required when external collaborators lack push privileges to the main line of development. The contributor forks the main repository (e.g., `2degreesInvesting/demo`) to their own user account (`mauro lepore`), clones their fork locally, pushes the change to their fork, and opens a pull request back to `2degreesInvesting/demo`. In the demo the user edits `README.md` in the browser, GitHub creates a branch `patch-2` on the fork, and the PR proposes merging `mauro lepore/demo:patch-2` into `2degreesInvesting/demo:master` (PR #21).

The core friction taught is how a maintainer/reviewer adds commits to a fork-hosted PR. The manual Happy Git approach — clone the contributor's fork via its URL into a second local directory where `origin` points at the fork — is possible but awkward. Instead the presenter recommends abstractions: the `usethis` package or the GitHub CLI `gh`. Live, the maintainer ensures `master` tracks `origin/master` (`git branch -vv`, `git branch -u origin/master`, `git remote -v`, `git pull`), then runs `gh pr checkout 21` to fetch the PR. That command creates a local branch `patch-2` wired to the PR so that `git push` after editing `README.md` (changing `.` to `!`, `git diff`, `git add README.md`, `git commit -m "at bank"` then `git push`) automatically goes to the contributor's branch — despite `git remote` showing only `origin` → `2degreesInvesting`. Refreshing the PR confirms two commits: the contributor's original and the maintainer's "bank". 

The second half manually reproduces the wiring to demystify it: create branch `git checkout -b patch-2`, `git remote add mauro_lepore git@github.com:mauro lepore/demo`, `git fetch mauro_lepore`, `git branch -u mauro_lepore/patch-2`, then demonstrate failures before/after fetching/merging, and discuss `git push` divergence, the "command line instructions" on the PR page (which only checkout locally and avoid pushing back), and why `gh` and `usethis` abstract this painfully manual upstream/remote bookkeeping.

## Key Concepts & Tools Taught

- **[fork-of-ours]:** Complex remote setup where contributors without push access fork the main repo to their user account, clone their fork, push there, and PR back to the upstream main repo; contrasted with the simpler `ours` setup where everyone pushes branches directly to the main repo.
- **[github-workflow]:** Pattern of one long-lived `main`/`master` plus short-lived feature branches always merged via pull request (never pushing directly to `main`), with auto-delete of merged branches.
- **[gh-cli]:** GitHub CLI `gh` that automates the manual remote/branch wiring — `gh pr checkout <number>` fetches the fork PR, creates a local tracking branch, and makes subsequent `git push` transparently update the contributor's fork.
- **[git-remote-and-branch-tracking]:** Upstream connections: `git remote -v`, `git branch -vv`, `git branch -u origin/master` (or `-o`/`--set-upstream-to`), `git fetch`, `git pull` (= fetch + merge), `git checkout -b`, `git remote add <name> <url>`.
- **[maintainer-push-to-fork-PR]:** Workflow for a maintainer to check out PR #21, inspect (`git show`, `git log --oneline`), amend a file (`git status -s`, `git diff`, `git add`, `git commit -m`, `git push`) and have the commit appear in the contributor's PR timeline.
- **[happy-git-with-r-reference]:** The book's section on everyday Git patterns and the specific appendix describing how to push commits to someone else's fork by cloning from their fork URL.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```bash
git remote -v                          # "let's have a quick look again ... with the command git remote minus v you can see that in this case the remote origin here ... is pointing to the two degrees investing organization" <- "git remote minus v"
git branch -vv                         # "let's run the command git branch with the flag minus vv that should show not only the branch but also if there is a connection to an app to a remote ... in kind of brackets" <- "git branch ... minus vv"
git branch -u origin/master            # "i'm going to add that with the command hit branch minus ooh which is a short for apps set setup at stream ... i want to create a permanent connection between this branch ... and the branch master on the origin remote" <- "hit branch minus ooh" / "setup at stream"
git pull                               # "when i do git pull actually what i'm doing is ... git fetch to get all the metadata from that remote and then a git merge so i'm gonna do git pull because it's kind of a shortcut" <- "git pull" / "git fetch" / "git merge"

gh pr checkout 21  # "what i usually do is i use the command line gh ... and i do check out and the number of the pr ... i think i forget ... but did i run gh i forgot to say pr for pull request checkout 21." <- "gh" / "pr" / "check out and the number of the pr" — "gh stands for github it is a common line application that you have is developing" <- "gh stands for github"
# after gh pr checkout, branch patch-2 is created tracking the PR

git show                               # "we could do hit show to see what is the last commit" <- "hit show"
git log --oneline                      # "they could do something like git log one line to see how that one change at the top relates to the history" <- "git log one line"
git diff                               # "i could do git diff uh and there you will see ... this change from ... the red dot to the exclamation mark" <- "git diff"
git status -s                          # "i could do git status minus s to verify that the file has changed" <- "git status minus s"
git add README.md                      # "so now the next step would be to add this change to the staging area with git add in this case readme dot md" <- "git add"
git commit -m "bank"                   # "finally i could do a commit ... git commit minus m and the message ... at bank bank there you go" <- "git commit minus m" / "at bank"
git push                               # "if i push what's gonna happen let's try git push and this is a bit of the mystery ... and the beauty of using a dedicated tool ... if i do git remote I have only one remote and it's called origin ... and yet when i do git push ... git knows where to send that commit which is to the branch in the account of that user" <- "git push"

# Manual wiring (shown to explain transparent magic)
git checkout -b patch-2                # "i basically created by a branch here git check out minus v to create the branch ... and call it ... patch two" <- "git check out minus v" / "patch two"
git remote add mauro_lepore git@github.com:mauro_lepore/demo  # "i'll go ahead and just do it so i would do git add give sorry git remote hit remote add and then i would say something like mauro lepore ... and start giving the remote url so in this case it's git at github.com demo" <- "git remote hit remote add" / "mauro lepore"
git fetch mauro_lepore                 # "i want to fetch all the metadata ... so what i could do is get fetch and the name of the remote ... mauro" <- "get fetch" / "mauro"
git branch -u mauro_lepore/patch-2     # "i know i'm going to create a permanent connection between the master brand sorry between the patch branch locally and the remote branch patch too ... git branch minus o to set the upstream ... and the one on the remote which is ... mauro le pure patch two" <- "git branch minus o" / "mauro le pure patch two"
git merge mauro_lepore/patch-2         # "i could do git fetch to get the metadata and then immerse git merge in this case moto ... patch two" <- "immerse git merge" / "moto"
touch a; git add a; git commit -m "new a"  # "let's touch a new file called a ... git add a git commit new a" <- "touch a new file called a" / "git add a" / "new a"
```
