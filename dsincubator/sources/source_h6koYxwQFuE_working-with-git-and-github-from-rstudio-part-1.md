---
type: source
title: "Working with Git and GitHub from RStudio (part 1)"
source_file: "h6koYxwQFuE_working-with-git-and-github-from-rstudio-part-1.md"
video_id: "h6koYxwQFuE"
url: "https://www.youtube.com/watch?v=h6koYxwQFuE"
lang: en
tags: ["ds-incubator", "git", "github", "workflow", "pull-requests"]
key_topics: ["rstudio-git", "github-document", "git-ignore", "git-staging", "fork-and-clone"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=h6koYxwQFuE"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 55
    last_modified: "2020-08-18T00:00:00Z"
usage_window: { from: "2020-08-18T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# Working with Git and GitHub from RStudio (part 1)

## Summary

This refresher prepares the group for an upcoming workshop where exercises will be submitted as pull requests to the `2DegreesInvesting/tidyds` workshop repository, aiming for a shared-page understanding so that the record serves future newcomers. The premise is that everyone already uses Git/GitHub but preferences vary (terminal vs clients); the session demonstrates the "minimum toolkit" wholly inside RStudio, with extensions being optional.

After framing objectives — practice as many Git/GitHub features as possible from RStudio (ignoring, removing, reverting, adding, modifying, committing, amending, pushing politely) and setting up a fork for the workshop — setup references the "Happy Git with R" book's remote configurations. The recommended "fork of theirs" (fork-and-clone) is advocated as safest and most flexible: it works for 2DegreesInvesting and for external owners, whereas non-fork setups demand careful permission/branch-protection management to avoid accidental pushes to `master/massive branch`.

Setup is performed in RStudio Cloud (repeatable on desktop after a prior 16-minute setup video) with `usethis::create_from_github("2DegreesInvesting/tidyds", fork = TRUE)` (caption "we use this package with a function create from github ... i want to create a clone in this rstudio cloud project a clone of the fork of this repository called two degrees investing tide eds" ← `create_from_github`). This forks, clones, and creates remote connections (permanent, so later `pr_*` helpers work) inside the current RStudio project.

The hands-on tutorial uses the `tidyds` clone which contains a `README` and a folder `00_setup` with `untitled.Rmd` + `untitled.html`. A branch is started with `usethis::pr_init("00_mauro")` (caption "we will be practicing ... github flow workflow branches are the core ... pr init initializes a branch so i'm going to call that branch zero zero ... my name" ← `pr_init`), preferred over the Git pane's New Branch icon because `pr_init` also sets upstream tracking and gives a reminder to run `pr_push` when ready. In `00_setup/untitled.Rmd` the YAML output `html_document` is changed to `github_document` (caption "i remove the html part and i do github document" ← `github_document`) and saved; the Git pane (caption "staging area what is called ... theatre ... stage for you" ← Git pane) immediately shows the file with `M` (modified, known to git) (caption "prefixed with an m which means modify so it refers to a file that existed already in the git repository" ← `M`). Reverting (`right-click → Revert`, confirm) removes the change and the file disappears from the stage, demonstrating revert before re-applying the change.

GitHub rendering nuances are shown via the RStudio source-pane dropdown "View current file on GitHub" (caption "this little icon here that is very hard to notice ... view the current file basically the file is opened on on your source pane" ← `View file on GitHub`) — both `untitled.Rmd` and `untitled.html` display source code with tags, not useful output. Clicking `Knit` renders `github_document`, generating `untitled.md` plus an HTML preview (caption "when we click the neat button ... that's not a feature of git it's just a feature of our markdown ... produce that render version that combines ... source code is run and then the output is presented" ← `Knit`). The new `md` is GitHub-interpretable and shows rendered input+output without needing to run code. Post-knit staging shows `M` for the modified `Rmd`, `D` for `untitled.html` (deleted — `github_document` by default removes the paired `html` — caption "github document by default looks for a file ... if there is an html file it will remove it ... D comes from delete" ← `D`), and `?` for `untitled.md` (untracked — caption "the question mark means that git does not know about that file yet ... it's not on that stage git is asking us ... do we want to include it" ← `?`), where ticking the box moves `?` → `A` (added to staging — caption "icon changes from the question mark to a a means addition ... we are explicitly telling it to try to start tracking that file" ← `A`).

Ignoring HTML output is demonstrated by right-clicking the staged `html` → `Ignore` (caption "ability to ignore files ... if you right click ... you will see that there is an option to ignore" ← `Ignore`), which previews creation of `.gitignore` in `00_setup` containing the filename (`untitled.html`) (caption "file is going to be called dot git ignore and it is going to contain this line basically the name of the file that we want to ignore" ← `.gitignore`). After `Save`, the pane shows `?` for `.gitignore` (still in working tree, not staged — caption "still not in the staging area so i have to tell you what to do" ← not staged) and inspection via `Open file` shows its one-line contents. Because `html` output is frequent, the presenter generalizes the ignore from `untitled.html` to a pattern `*.html` (caption "instead of saying okay forget about untitled html i could say ... forget about anything html ... change the git ignore file ... to take a pattern now not just the name of the file but a pattern that will match any html" ← `*.html`), saving and refreshing the Git pane (caption "staging area is not updated immediately sometimes you have to kind of refresh it" ← `Refresh`) whereupon `maurolepore.html` (and previously staged `html`) disappears from staging, confirming the pattern is honored.

Renaming is shown by renaming `untitled.Rmd` → `maurolepore.Rmd` via the Files pane Rename (caption "click here ... rename and then here you say something like in my case" ← `Rename`), which makes two stale products (`untitled.md` with `?` and `untitled_files/` with `?` — the figure folder produced by the earlier knit — caption "these two products become kind of obsolete because they have the name and title which is the name that ... had before" ← stale outputs) obsolete. Because both were never tracked (`?`), deleting them via `Delete` simply makes the lines disappear rather than producing a `D` (caption "if i remove it now ... it will disappear ... because git never knew of it ... it would be just gone ... could only have a d if i have ever added it and committed it" ← `?` delete = gone). The `maurolepore.Rmd` is then knit to produce `maurolepore.md` (and a new `_files` folder) plus `maurolepore.html` which is now ignored. Clicking the `md` preview shows the rendered version ready for GitHub (prior first-time knit on RStudio Cloud may prompt to install `tinytex` — caption "when you meet for the first time on our studio cloud it may ask you to install a package called tiny text" ← `tinytex`).

Staging-to-commit flow demonstrates amend. Adding `.gitignore` → Commit with message `ignore html` creates a commit; then noticing that `untitled.html` deletion (`D`) relates to the same problem, the presenter stages the `D`, ticks `Amend previous commit` (caption "instead of creating a new commit i can amend the previous commit by clicking here on amend previous commit ... i get the message that i typed last time ... amend that message by saying ignore and remove html" ← `Amend previous commit` → message `ignore and remove html`), showing one commit built in two steps. Next the rename pair `untitled.Rmd` (`M` old name staged) + `maurolepore.Rmd` staged together causes Git to detect a rename and display `R` (caption "when i click the two of them ... instead it was every name ... when i staged the two then git realizes ah okay it was a rename action ... new icon ... r stands for rename" ← `R` rename). Committing as `rename file to mauro` creates the second commit, and rendering/committing `maurolepore.md` as `render github document` forms the third; history inspection shows three independent commits since `pr_init`.

Finally `usethis::pr_push()` (caption "there is a hint here i just need to run the function pr push and that will send me to the web browser to the interface where i can actually create the pull request on the upstream repository" ← `pr_push`) sends the branch to the fork and opens the GitHub PR creation interface: `00_mauro` on `mauro:tidyds` → `master` on `2DegreesInvesting:tidyds`, with three commits presented for review.

## Key Concepts & Tools Taught

- **[rstudio-git]:** Working wholly from RStudio's Git pane and helpers: modifying, staging (`?`/`M`/`A`), reverting, ignoring, renaming (`R`), committing, amending, and pushing, as the minimum toolkit before optional terminal extensions.
- **[github-document]:** Switching `html_document` → `github_document` in `Rmd` YAML (caption "i remove the html part and i do github document" ← `github_document`) and clicking `Knit` (caption "when we click the neat button ... produce that render version" ← `Knit`) to generate `*.md` that GitHub renders beautifully (code + output) unlike raw `Rmd`/`html` which show only source/tags.
- **[git-ignore]:** Instructing Git to never track generated outputs via `.gitignore` (caption "to ignore ... you will be presented with ... file is going to be called dot git ignore and it is going to contain this line" ← `.gitignore`) — single filename `untitled.html` generalized to pattern `*.html` (“forget about anything html” ← `*.html`), requiring pane refresh to take effect, demonstrated with `untitled.html`/`maurolepore.html`.
- **[git-staging]:** Reading the staging area theatre: `M` modified tracked file, `D` deleted tracked file (knit removes paired `html`), `?` untracked (`untitled.md` never added), `A` added to staging, `R` rename detected when both old+new staged, `?`-files deleted without `D` because never committed, and refresh behavior (caption "staging area is not updated immediately sometimes you have to kind of refresh it" ← `Refresh`).
- **[fork-and-clone]:** Happy Git recommended remote setup using `usethis::create_from_github("2DegreesInvesting/tidyds", fork=TRUE)` (caption "we fork a repository from an organization and then we create connections to a clone that go both ways so you can push and pull" ← fork-and-clone) creating `origin` (fork) + `upstream` (source) connections, versus riskier non-fork setups requiring branch protection; branch start via `usethis::pr_init("00_mauro")` which wires tracking and reminds to `pr_push`.

## Code Snippets & Formulas

Caption-mangled, normalized here (quote-to-name):

```r
usethis::create_from_github("2DegreesInvesting/tidyds")  # "we use this package with a function create from github ... create a clone in this rstudio cloud project a clone of the fork of this repository called two degrees investing tide eds" ← create_from_github — forks + clones + sets remotes
usethis::pr_init("00_mauro")                              # "pr init initializes a branch so i'm going to call that branch zero zero ... my name" ← pr_init — creates branch + upstream tracking
# Files pane → 00_setup/untitled.Rmd → YAML: html_document → github_document
# "i remove the html part and i do github document" ← github_document
usethis::pr_push()                                        # "just run the function pr push and that will send me to the web browser to the interface where i can actually create the pull request" ← pr_push → fork 00_mauro → upstream master
```

```sh
# Git pane staging icons (captioned verbatim):
# M — modified: "prefixed with an m which means modify so it refers to a file that existed already in the git repository" ← M
# D — deleted: "github document by default looks for a file ... if there is an html file it will remove it ... D comes from delete" ← D
# ? — untracked: "the question mark means that git does not know about that file yet ... it's not on that stage" ← ?
# A — added to staging: "icon changes from the question mark to a a means addition" ← A
# R — rename: "when i staged the two then git realizes ah okay it was a rename action ... r stands for rename" ← R

# Revert
# right-click file → Revert → confirm → change disappears from stage
# "when you have modified a file ... you can always revert that change ... by clicking on the file ... navigate to the revert icon" ← Revert

# Ignore via RStudio
# right-click html → Ignore → preview .gitignore path + line → Save
# "when you right click ... you will see that there is an option to ignore ... there is this file ... called dot git ignore ... it is going to contain this line basically the name of the file that we want to ignore" ← .gitignore
# 00_setup/.gitignore contains:
untitled.html                 # initial — "untitled.html"
*.html                        # generalized — "forget about anything html ... pattern that will match any html" ← *.html
# after Save, Open file shows contents; Refresh hides now-ignored html files

# Rename
# Files pane → untitled.Rmd → Rename → maurolepore.Rmd
# staged pair untitled.Rmd + maurolepore.Rmd → R icon (rename)
# "instead it was every name ... when i staged the two then git realizes ah okay it was a rename action" ← R

# Rendering
# Knit button → preview + creates untitled.md / maurolepore.md + _files/ + deletes paired html
# "that's not a feature of git it's just a feature of our markdown so we click there i'm going to produce that render version" ← Knit
# Click Preview on .md → rendered beautiful version for GitHub
# tinytex prompt on first Cloud knit: "when you meet for the first time ... may ask you to install a package called tiny text" ← tinytex

# Commit — amend
# stage .gitignore → Commit → message "ignore html" → Commit
# stage D untitled.html → Commit → check Amend previous commit → message "ignore and remove html"
# "instead of creating a new commit i can amend the previous commit by clicking here on amend previous commit ... amend that message by saying ignore and remove html" ← amend

# Next commits
# stage R (rename) → Commit "rename file to mauro"
# knit maurolepore.Rmd → stage maurolepore.md → Commit "render github document"
# history: three commits since pr_init — inspect via History

# View on GitHub
# source pane dropdown → "View current file ... on github" → shows source code not rendered output for Rmd/html
# "when you click on that drop down you have an icon that says view the current file ... on github ... showing me that file and as you can see what i see here is just the source code" ← View file on GitHub

# Branch creation alternative (discouraged vs pr_init for tracking):
# Git pane → New Branch icon — "by clicking this icon here you can also create a new branch ... if you want to synchronize the branch with some remote ... those are things that i use this will do for me automatically"
```
