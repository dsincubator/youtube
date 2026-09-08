---
type: source
title: "Git practices by example"
source_file: "eeUZ8dHsmG8_git-practices-by-example.md"
video_id: "eeUZ8dHsmG8"
url: "https://www.youtube.com/watch?v=eeUZ8dHsmG8"
lang: en
tags: ["ds-incubator", "git", "r-packages", "workflow", "terminal"]
key_topics: ["git-commit", "git-amend", "git-rebase-interactive", "usethis", "github-workflow", "commit-message-structure"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=eeUZ8dHsmG8"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 22
    last_modified: "2020-12-22T00:00:00Z"
usage_window: { from: "2020-12-22T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# Git practices by example

## Summary

This meetup demonstrates seven draft Git practices for shared commits through a single end-to-end example: building the infrastructure of a minimal R package and opening a pull request. The presenter stresses that the practices apply to shared history — locally you may rewrite, but once a commit is shared you cannot rewrite it — and that each practice is still draft and open to critique. The walkthrough uses a custom terminal (showing branch `main`, colors, and the `glol` alias) to make history readable while emphasizing tooling that reduces error.

Starting from an empty repo containing only `notes`, the presenter creates a new branch with `git checkout -b new-package`, then scaffolds a package with `usethis::create_package(".")` (caption "create package from ... use this package" ← normalized `usethis::create_package`) so the current working directory becomes a package (`DESCRIPTION`, `NAMESPACE`, empty `R/`). The first commit `create package` is made with a granular, related set of files (`DESCRIPTION` + `NAMESPACE`), demonstrating that changes in one commit should be closely related and small and that a collection of commits should tell the story of a feature branch / pull request.

Next `usethis::use_mit_license()` ("use MIT license") updates `DESCRIPTION` (`License: file LICENSE`), adds `LICENSE`/`LICENSE.md` and edits `Rbuildignore`. An initial commit misses the new files, so the presenter stages them and repairs the incomplete commit with `git commit --amend` ("keep commit amend ... use MIT lense" ← `git commit --amend`) to make the commit do what its message promises. Then `usethis::use_readme_rmd()` ("use read me rmd" ← `usethis::use_readme_rmd`) adds `README.Rmd`/`Rbuildignore`; an intentional `git commit -m "add readme"` (caption "at read me") is blocked by a pre-commit hook that requires rendering `README.Rmd` to `README.md` because GitHub renders `md` nicely, not `Rmd`. The presenter forces it with `--no-verify` ("no verify this hint here" ← `git commit --no-verify`) to show an incomplete commit, renders with `knitr::knit("README.Rmd")` ("use kner to knit the file rme rmd" ← `knitr::knit`), stages the generated `README.md` + `man/` and commits `render to ND` again with `--no-verify`, then squashes the two README commits into one complete commit via `git rebase -i main` ("G rase interactive minus E ... get Reas interactive ... use a main" ← `git rebase -i main`, `s` for squash) and rewrites the combined message.

The package is checked with `devtools::check()` ("Dev tools has a function is called check" ← `devtools::check`) and the shortcut `R check` wrapper, revealing a `nonstandard files` warning for the `notes` file. The presenter moves `notes` into `README.Rmd` (`cat notes`, `cut notes` → redirect to `README.Rmd`, `rm notes` → "remove notes"), re-knits, and commits `move notes to read me` with `--no-verify` and rendering. After editing `DESCRIPTION` and `README.Rmd` to describe the package goal ("examples of G practices" / "give an example of git practice"), pruning template text about CRAN, re-knitting, and commits `add explain go of this package` and `prune read me`, the log shows granular, self-contained commits. Finally `gh pr create --draft` ("GH PR create and I like doing it with the minus d flag" ← `gh pr create --draft`) pushes the feature branch, creates a draft PR (`create basic package` with subject/body email structure: subject ≤50 chars, body wrap ~72), marks it ready, and inspects the commit tab to confirm each commit and the feature as a whole are complete and testable.

## Key Concepts & Tools Taught

- **[git-commit]:** Creating small, related, complete commits that do what the message promises; granular history where each commit and each feature (branch/PR) is self-contained and tells a story, demonstrated with `git add` + `git commit -m "create package"` after `create_package`.
- **[git-amend]:** Repairing an incomplete commit before sharing with `git commit --amend` (caption "keep commit amend ... use MIT lense" ← `git commit --amend`) to add forgotten `LICENSE`/`LICENSE.md` files so the `use MIT license` commit becomes complete without a new commit.
- **[git-rebase-interactive]:** Squashing related commits into one complete unit with `git rebase -i main` (caption "G rase interactive minus E" / "get Reas interactive ... use a main" ← `git rebase -i main`, `s` for squash) applied to the two `README` commits (`README.Rmd` vs `README.md`) so both files land in one commit.
- **[usethis]:** Productivity helpers that scaffold package infrastructure reproducibly: `usethis::create_package(".")` (caption "create package"), `usethis::use_mit_license()` ("use MIT license"), `usethis::use_readme_rmd()` ("use read me rmd"), plus `knitr::knit` to render `README.Rmd` → `README.md` when a hook requires it.
- **[github-workflow]:** Feature-branch workflow on `main`: `git checkout -b new-package`, develop locally, test with `devtools::check()` / `R check`, then `gh pr create --draft` (caption "GH PR create ... minus d flag" ← `gh pr create --draft`) to propose the branch for merge into `master`.
- **[commit-message-structure]:** Email-like structure with compulsory subject (≤50 chars for GitHub's one-line display) and optional body wrapped ~70 chars (caption "the subject has 50 characters or less ... the body ... try to rra it at around 70 characters"), demonstrated in the PR title/body `create basic package`.

## Code Snippets & Formulas

Caption-mangled, normalized here (quote-to-name):

```sh
git checkout -b new-package          # "there get check out Branch a new Branch I'm going to call it um uh new package" ← git checkout -b
git status                           # "if I query the G status"
git add DESCRIPTION NAMESPACE        # "to add everything to the staging area ... the two files that were added"
git commit -m "create package"       # "create package"

git diff                             # "show you at least the diff of description"
git commit --amend                   # "let's just amend the previous commit ... keep commit amend ... use MIT lense"
git commit --no-verify -m "add readme"  # "no verify this hint here" ← --no-verify
git rebase -i main                   # "G rase interactive minus E" / "get Reas interactive ... use a main" ← git rebase -i (s to squash)
git log                              # "glol and I show you a very nice ... the log of this repos"
git show --stat                      # "G show with stat ... to show you ... which files I modified"

R
usethis::create_package(".")         # "create package from ... they use this ... use this package and I'm going to use a little trick ... current working directory ... is going to become an package so it's called practices demo"
usethis::use_mit_license()           # "use the MIT license oops sorry license ... use this added that for me" ← use_mit_license
usethis::use_readme_rmd()            # "let's run the function use read me rmd ... I'm going to add the file rme rmd" ← use_readme_rmd
knitr::knit("README.Rmd")            # "use kner to knit the file rme rmd ... NE meter ... NE meet R me read me R&D ... need R me rmd" ← knitr::knit
devtools::check()                    # "Dev tools has a function is called check ... because Dev tools I have already added it to my our profile I can just run check" ← devtools::check
# R check — terminal wrapper around devtools::check
# "I can now run R check from here from the terminal ... I don't need to enter R to just run that"
cat notes                            # "let's do that is I could do cut notes ... cat notes"
ls                                   # "if I do LS you'll see that the contents ... just this noes file"
```

Branch shown as `main` (caption "the name of the branch that I'm standing on it's called main it is the default branch"); alias `glol` noted for pretty log (caption "I type this glol and I show you a very nice ... log").
