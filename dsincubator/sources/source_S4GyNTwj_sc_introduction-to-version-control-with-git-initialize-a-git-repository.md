---
type: source
title: "Introduction to version control with Git: Initialize a Git repository"
source_file: "S4GyNTwj_sc_introduction-to-version-control-with-git-initialize-a-git-repository.md"
video_id: "S4GyNTwj_sc"
url: "https://www.youtube.com/watch?v=S4GyNTwj_sc"
lang: en
tags: ["ds-incubator", "git", "terminal", "snapshot-testing", "cloud"]
key_topics: ["git-initialization", "version-control", "terminal-workflow"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=S4GyNTwj_sc"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 73
    last_modified: "2020-09-15T00:00:00Z"
usage_window: { from: "2020-09-15T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# Introduction to version control with Git: Initialize a Git repository

## Summary

This is the first of a planned long series demystifying Git for the data science incubator, following learner feedback that most people already use Git but lack a working mental model and fear breaking things. The presenter pledges to go slow and fix broken mental models, then accelerate, inviting others to teach sections to learn by teaching.

The curriculum follows the CodeRefinery lesson "Introduction to version control with Git" (link from the incubator issue), supplemented by the instructor guide and visually rich resources such as "Advanced Git explained with animations" for branching. The landing issue links to the lesson's goal and its many sub-lessons, but the trainer notes highlight the most relevant ones for this crowd while encouraging volunteers for later topics.

Motivation is framed as essential infrastructure: Git is the dominant VCS worldwide, and like a climber's hook it provides safety — mistakes are recoverable when hooked, disastrous without. Its branching model lets many things happen in parallel — multiple branches of a project, concurrent work, and collaboration — and enables reproducibility by traveling through history, with a caution: Git also allows rewriting history (like Back to the Future), safe only when local and unsafe after sharing via `push`.

The instructional heart introduces the three-stage metaphor: framing (deciding what to include) is `git add` to the staging area, taking the picture is `git commit` to the `.git` photo album, and the album itself is the `.git` directory. A second edit → stage → commit cycle builds the second photo, and the history is browsable — but rewriting shared history after `push` is discouraged.

Practical onboarding covers terminals: the presenter shows a heavily customized terminal (shortcuts like `j data` to jump, `gss` for colored `git status` with branch) but will demo in a vanilla `bash` terminal to avoid distraction, noting Windows users should run `bash`, macOS/Linux terminals work out of the box, and RStudio Cloud's Terminal tab is a zero-install alternative (any RStudio Cloud project has it, or a shared URL). The first hands-on steps are shown live in RStudio Cloud: `mkdir recipe` creates a folder for a guacamole recipe (visible in cloud file pane), `cd recipe` enters it, `ls` shows emptiness, `git init` initializes an empty repository (creating hidden `.git`, revealed by checking "Show hidden files" and refreshing), and `git config user.name` / `git config user.email` configures identity — demonstrated both as a query (no value → answer, no output if unset) and as a setter (`git config user.name "mauro"` / `git config user.email "...@gmail.com"`), then verified with `git config --list` which also shows unrelated settings. The session ends inviting feedback on pacing (consensus: "just right") and previewing next time's focus on `git status` and making changes.

## Key Concepts & Tools Taught

- **[git-initialization]:** Creating and configuring a repository — `mkdir`, `cd`, `ls`, `git init` creates hidden `.git`, `git config user.name`/`user.email` (query vs setter) and `git config --list`.
- **[version-control]:** Why Git matters — dominant VCS, safety net for mistakes (climber analogy), enable collaboration, and reproducibility via history; rewriting shared history after `push` risks breaking others' future.
- **[terminal-workflow]:** Vanilla `bash` for teaching vs personalized terminals; RStudio Cloud Terminal tab as browser-based alternative; Windows `bash`, macOS/Linux defaults; shortcuts `j`/`gss` as examples of later personalization but not used in demos.
- **[staging-and-committing]:** Photo metaphor: `git add` is framing (choose what belongs in the snapshot), `git commit` is taking the picture, stored in the `.git` album; workflow file → `git add` → `git commit` → history, then edit → stage → second commit.
- **[code-refinery-lesson]:** Following the CodeRefinery "Introduction to version control with Git" lesson and its instructor guide as the structured path, with auxiliary visual resources for branching and merge-conflict resolution.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```bash
mkdir recipe                          # "we are going to make a recipe for guacamole and one way in which you can create a folder from the terminal is with a command m k d which stands for make directory ... i can do mk fear make directory recipe and that will create a folder here called recipe" <- "m k d" / "make directory" / "mk fear make directory recipe"
cd recipe                             # "the way i move there is with the command cd for change directory cd change directory ... when i do cd recipe i now get into cloud projects recipe" <- "cd for change directory" / "cd recipe"
ls                                    # "if i want to see what are the contents of that folder i do ls and it should ... output nothing because it is empty" <- "ls"
git init                              # "once i do git init ... it says initialized empty git repository inside ... this folder called ... recipe i added the folder door kit" <- "git init" / "door kit" (= .git)
# RStudio Cloud: check "Show hidden files" to reveal .git; click refresh arrow

git config --list                     # "i can say git config minus minus list that will give me a very long list if there is things configured" <- "git config minus minus list"
git config user.name                  # "you can type now git config user dot name and if there is nothing no output then ..." <- "git config user dot name"
git config user.name "mauro"          # "i can say something like mauro right with ... you leave a space after user.name ... then you press enter ... First asked the question I got no output meaning that it wasn't set i then set that parameter to module and now when i ask again i do get the output so it's configured to modulate" <- "mauro" / "module" / "modulate"
git config user.email                 # "another very useful configuration that you need is email so user dot email" <- "user.email"
git config user.email "mauro@gmail.com" # "i'm going to actually set it just by saying ... gmail.com" <- "gmail.com"
git add                               # "they give command hit add basically what you're saying is you're framing ... i'm going to put ... person a person b and exclude person c ... once ... i do git add i say yeah this is what i want" <- "hit add"
git commit                            # "then you do git commit and then ... you take the picture and ... the commit ... gets stored in your photo album ... that photo album is the git repository that folder ... called dot git" <- "git commit" / "dot git"
# Terminal shortcuts shown but not used for teaching:
j data                                # "if i want to go to my git repo say the data repo i just do j data and that means jump to something that matches the name data" <- "j data"
gss                                   # "i want to see the status ... i do gss which means git status and i can see the status" <- "gss" (= git status)
git status                            # vanilla equivalent shown: "if i want to do the same i have to type git status and that will give me the same thing" <- "git status"
bash                                  # "if you're in windows you ... will be using very likely the bash terminal so you will need to type bash in your ... to execute the bash program" <- "bash"
```

Reference: CodeRefinery Introduction to version control with Git lesson and Instructor Guide; advanced visual guide for branching (animation).
