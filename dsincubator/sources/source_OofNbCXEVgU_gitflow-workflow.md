---
type: source
title: "Gitflow workflow"
source_file: "OofNbCXEVgU_gitflow-workflow.md"
video_id: "OofNbCXEVgU"
url: "https://www.youtube.com/watch?v=OofNbCXEVgU"
lang: en
tags: ["ds-incubator", "github", "testing", "workflow", "cran"]
key_topics: ["gitflow-branch-model", "develop-vs-main", "release-branches", "hotfix-branches", "code-vs-output-review"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=OofNbCXEVgU"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2021-05-25T00:00:00Z"
    usage_count: 162
usage_window: { from: "2021-05-25T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Gitflow workflow

## Summary

A best-practice Git branching talk led by Alex, framed as "pretty much every use case ... sorted ... served me well". The simple starting workflow is `main`/`master` with short-lived feature branches merged via PR — "you have your main or master branch and then you'll take a branch off of that make some commits ... and merge it ... this is a functional workflow right up until it isn't" — which breaks when branches are interdependent (e.g., one implements a function, the other uses it; "one branch doesn't make a whole lot of sense without the other") because between merges "the thing doesn't work anymore" and "our system should not be broken at any point".

The fix is the Gitflow triad: long-lived `develop` (alias `dev`/`develop` ← "call this thing development or dev or develop") plus durable `main` at the top, with short-lived `feature/*` branches off `develop` (deletable when done) that merge to `develop`, which later merges to `main`. Mentality shift: `main` "isn't going to have all of the latest coolest newest things ... but it works" — a stable product — while `develop` "should work most of the time but is not guaranteed to ... maine must work". This frees teams to be ambitious on `develop` without breaking what everyone else depends on.

CI is discussed as complementary but insufficient: "that assumes you have perfect 100 ci testing which is not a realistic thing ... second it also assumes that none of the branches have interdependencies ... how many times ... can't be merged ... until pr 228 has been merged ... when you're using this sort of system you can merge whatever ... when it's done" — Gitflow removes ordering pain. Another practical win: long builds (~4-hour build + manual testing) happen once off a `release` branch rather than repeatedly on feature branches.

The `release` branch lifecycle is detailed: a short-lived `release` ← "this one is called release" cut from `develop` (red in the diagram) used to stabilize — `README`, `NEWS`, version bumps ("a really common thing to see on the release branches ... updating the readme or updating the notes files or bumping version numbers") — then merged to `main` (producing the production release) and back to `develop` so release-time fixes propagate. Naming is conventional (`develop`, `main`, `feature/*`, `release/*`, `hotfix/*`) but arbitrary; the speaker renames live to show workflow invariance. The R-package context maps Gitflow to GitHub default-branch expectations: by convention `remotes::install_github()` ← "install github ... default branch ... would get ... development version ... expected to work but also understood there might be bugs" without extra `ref`; ideally the default branch delivers a working product (not "does it work or does it not ... which day did i install it"), with bleeding-edge via explicit `ref = "develop"`. Gabor's model is cited: CRAN is `main` (released product), GitHub `main` maps to `develop` in classic Gitflow if distribution is not CRAN.

Institutionally, the model adds formality and parallel review tiers. Feature→`develop` code review is small and fast ("totally willing ... that you will break the develop branch frequently ... i ... merge ... into develop ... tag one of you ... take a look ... cool we throw it in"); `develop`→`main` via release is an **output review** not a line-by-line code review — "these two are code reviews this is not a code review ... it probably touches 200 different files and it's 4 000 lines ... that is okay you shouldn't be inspecting the code here because the code has already been ... inspected ... what this one is is looking at the outputs making sure that the system as a whole is doing what you're expecting" with stakeholders/managers checking compiled reports. This avoids haunted "massive gif file" PRs with 14 features ("i would actually much prefer to review very small individual features ... the bigger it gets the more panicked i get") and reduces context switching, though the speaker acknowledges skepticism and that bugs/merges still happen, just less critically, with a stable `main` always shippable.

Emergency flow: two paths after a release when new work has landed on `develop`. Normal bug → `feature/thanks bud` ← "feature slash thanks bud" via normal release cycle (2 weeks/month, "it'll get picked up in the next release ... beginning of july"). Critical bug → `hotfix` ← "your emergency bug fix branch" / "branch off of maine ... one of the very few times that you make a branch off of maine" (orange) cut from `main`, fixes production directly, merges to `main`, then merges back to `develop` and resolves conflicts there. Q&A on `squash and merge` ← "am i not using squash and merge on this" is raised under diff-file sizing concerns. The meetup closes with implementation support and next steps.

## Key Concepts & Tools Taught

- **[gitflow-branch-model]:** Simple `main`→feature→`main` vs. Gitflow: long-lived `main` (stable) + `develop` (integration) plus short-lived `feature/*` off `develop`, `release` from `develop`, and `hotfix` off `main` — all non-durable branches deletable when done ("maine will always exist develop will always exist but every other branch can be deleted when it's done").
- **[develop-vs-main]:** Durable-branch contract: `main` must always work ("maine must work ... our system should not be broken at any point"), `develop` may break ("develop is a branch that should work most of the time but is not guaranteed to ... you'll break the develop branch frequently") enabling exploratory work; `develop` accumulates features, `main` receives only release merges ("main branch only has a few commits on it but at each commit you know that the system works").
- **[release-branches]:** `release` ← "this one is called release" branch for pre-release hardening: cut from `develop`, build/test, update docs/version ("updating the readme or the notes files or bumping version numbers"), merge to `main` and back to `develop` ("once you're happy ... that gets merged in ... and then it would also ... get merged back into develop"), making long build/test (4-hour build + manual) a once-per-release activity ("it is a lot easier to have that happen once in a while off of a release branch").
- **[hotfix-branches]:** Emergency hotfix off `main` ← "you make a branch off of maine it's one of the very few times that you make a branch off of maine" (orange branch) for today-fix production bugs, bypassing `develop`, then merge to `main` and back-merge to `develop` ("cool bug is fixed ... back into production ... and then ... you can merge this thing back into develop"), versus normal path `feature/thanks bud` ← "feature slash thanks bud" via scheduled release.
- **[code-vs-output-review]:** Two-tier review: small feature→`develop` **code review** (e.g., flag-ordering interdependency "can't be merged until pr 228 has been merged", `--feature` prefixes), vs. release→`main` **output review** — not line-by-line over "200 different files ... 4 000 lines" but stakeholder sign-off on system outputs/compiled reports ("persons x y and z can you all three ... sign off ... this is a ... subtle frame shift") to avoid massive unfocused PRs and to manage `squash and merge` ← "am i not using squash and merge" diff size.

## Code Snippets & Formulas

Spoken workflow dictated live (caption-mangled, normalized here):

```sh
# Simple start (functional until interdependent features)
# main/master ──●──●──●
#                \     \  feature/* -> PR -> merge
git checkout -b feature/my-feature main
# ... commits, PR, merge -> main
# breakage window when feature A implements function, B uses it: "between here ... one ... has been merged in but the other one hasn't ... the thing doesn't work"

# Gitflow — add durable develop
git checkout -b develop main          # "call this thing development or dev or develop"
# main (top) stays stable; develop integrates
git checkout -b feature/foo develop   # "feature prefix ... other branches get prefixed with like a feature prefix"
# ... review, CI (if present), merge to develop
git checkout develop; git merge --no-ff feature/foo; git branch -d feature/foo
# when features accumulate, cut release (short-lived, red)
git checkout -b release/1.2.0 develop  # "this one is called release"
# ... on release: update README / NEWS / version bump ("updating the readme or the notes files or bumping version numbers"), build & manual test
git checkout main; git merge --no-ff release/1.2.0; git tag v1.2.0   # release -> main becomes production
git checkout develop; git merge --no-ff release/1.2.0               # propagate release fixes back to develop ("that gets merged ... and then it would also get merged back into develop")
git branch -d release/1.2.0

# Hotfix (critical prod bug) — rare branch off main (orange)
git checkout -b hotfix/critical-fix main   # "you make a branch off of maine it's one of the very few times that you make a branch off of maine"
# ... fix only prod issue ("you're just saying i am only worrying about fixing things today")
git checkout main; git merge --no-ff hotfix/critical-fix; git tag v1.2.1
git checkout develop; git merge --no-ff hotfix/critical-fix   # "you can merge this thing back into develop and deal with the consequences"

# Normal bug after release — schedule as feature
git checkout -b feature/thanks-bud develop  # "feature slash thanks bud" -> picked up "in two weeks or a month ... next release ... beginning of july"

# GitHub / R pkg mapping (discussion)
# remotes::install_github("org/pkg")        # installs default branch (convention: develop or main) — "what is on github on your default branch ... what you would get by default if you use install github is a development version"
# remotes::install_github("org/pkg", ref = "develop")  # explicit edge
# CRAN = main equivalent ("released is the product on cran ... cram would be ... original ... main") — GitHub main may map to develop if not shipping to CRAN

# Review tiers
# feature -> develop: small code review (prefer "very small individual features rather than ... massive ... 14 features ... bam ... gif file")
# develop -> main (via release): output review ("these two are code reviews this is not a code review ... 200 different files and it's 4 000 lines ... what this one is is looking at the outputs")
# squash & merge mentioned: "do we get am i not using squash and merge on this or do we like what's the how does how do you manage the div file"
```
