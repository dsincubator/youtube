---
type: source
title: "Access permissions for a GitHub organization"
source_file: "z4RAuGrAm8c_access-permissions-for-a-github-organization.md"
video_id: "z4RAuGrAm8c"
url: "https://www.youtube.com/watch?v=z4RAuGrAm8c"
lang: en
tags: ["ds-incubator", "permissions", "github", "pull-requests", "r-packages"]
key_topics: ["github-permissions", "organization-roles", "team-access", "repository-permissions", "branch-protection", "least-privilege"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=z4RAuGrAm8c"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 4440
    last_modified: "2019-11-26T00:00:00Z"
usage_window: { from: "2019-11-26T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Access permissions for a GitHub organization

## Summary

This governance meetup reframes everyday Git mishaps as an organizational permissions problem. The presenter regularly makes two mistakes when *not* using `usethis`: copying the wrong remote URL (source instead of fork) and committing directly on `master` instead of a PR branch. What happens on `git push` then depends on the permissions configured for the 2° Investing GitHub organization, which is the focus of the talk.

**Walk-through of failure modes:** The ideal flow is `usethis::create_from_github()` → fork & local clone, `usethis::pr_init()` → new PR branch and work, `usethis::pr_sync()` → sync fork, `usethis::pr_push()` → push PR branch to fork. When forgotten, four scenarios after `push` are enumerated: (1) commit goes to `PR` branch of *fork* (desired), (2) to `master` of fork (correct URL but wrong branch), (3) to `PR` branch of *source* (impossible if PR branch never created), (4) to `master` of *source* — possible if the pusher has push/ admin rights on the source and accidentally overwrites production (caption "push privileges ... sometimes I don't know if I have that privilege" ← push privilege). Role matters because owners can "push a commit to the massive range of production" even unintendedly.

**GitHub's permission model:** Three organization-level roles plus outside collaborators and teams. **Owner** = complete administrative access to the entire org ("organization owners have admin permissions ... by default for every repository owned by the organization" ← Owner, quote from GitHub help, caption "decisive quote ... organization owners have admin permissions"), illustrated with the org `2DegreesInvesting` → `People` → `30 members` → filter `role: owner` shows `6 owners` (Claire, Klaus, Mauro, Mike, Tyler, plus one) and detail page "as an owner Klaus has admin access to all repositories". **Billing manager** is mentioned but dismissed as irrelevant. **Member** = everyone else; org can set a **base repository permission** for members that applies to all repos (slide under `Settings → Member privileges` → `Base permission`: can be `Read` (least permissive), `Triage` (skipped), `Write` (push), `Maintain` (skipped), `Admin` (powerful: can delete repo/change security, caption "decisive ... sensitive action so you can delete the repo or you can change security issues" ← Admin). Default shown for the org is `Read` ("the two degrees invest in organization has their default repository permission said to me [read] ... therefore Jackson will have by default ... read access" ← base permission Read). If set to `Admin`, every member would have admin on every repo they don't even know about. **Teams** group people to grant privileges in bulk ("you may want to manage access permission for multiple members ... you can do that with ... T ... group people in formal teams ... set privilege for everyone in that team" ← Teams). **Outside collaborator** has no org membership; must be granted per-repo, one-by-one — the most protective approach ("if you're on a side collaborator you by default have access to no repository so you have to give them specific access to ... one purple at a time" ← Outside collaborator).

Zooming to **one repo (`art-dai`)** → `Settings → Collaborators and teams`: three simultaneous channels are demoed for user **Jackson**: (1) top window = *everyone gets by default just by being a member* (`Read` as per base permission), (2) middle = `Banks` team privilege on this repo, set to `Read` as well ("what's default privilege that the bank teams ... gets to this record ... I decided to say that you read so now everyone in team only can read" ← Team `Banks` Read), (3) bottom = direct **collaborator** added with `Admin` to allow project board management ("because Jackson is creating and managing the project board ... he needed higher permissions ... Admin ... I added him as a collaborator ... I gave him admit" ← `Admin` per-repo). If `Admin` were set on the team, *every* bank member would get admin, but per-collaborator keeps blast radius small.

**Branch-level protection** (`Settings → Branches` → rule matching `master`): can disable force pushes (`cannot push force ... change history ... they can add commits but ... cannot rewrite them` ← `force push`) and require PR reviews, etc. The demo enables `Protect master branch — disable force pushing` used org-wide.

Takeaways: apply **least privilege** ("people should have probably just the access that they need and know more" ← least privilege) and be **pragmatic** (book *The Pragmatic Programmer*, 20-year-old; quote from James Clear *Atomic Habits*: "you do not rise to the level of your goals you'd fall to the level of your systems" ← pragmatism quote). Use `usethis` as the system protecting against URL/branch mistakes; reflect on who truly needs Owner status (CJ prefers not to be owner unless strong reason: "I actually prefer that ... unless there's really strong reason ... temporarily give me").

## Key Concepts & Tools Taught

- **[github-permissions / github-permissions]:** Interaction between personal errors (wrong URL, master commits) and org/repo permission configuration determining push outcome.
- **[organization-roles / organization-roles]:** `Owner` (full admin to all repos), `Billing manager` (not covered), `Member` (base permission applies), `Outside collaborator` (per-repo grant) — demo with 30 members / 6 owners.
- **[team-access / team-access]:** Teams grouping members and assigning a privilege per repo (e.g., `Banks` team → `Read` on `art-dai`).
- **[repository-permissions / repository-permissions]:** Levels `Read` (see/discuss, can still PR via GitHub flow), `Triage`/`Write` (push), `Maintain`, `Admin` (delete, security) — with guidance on when to use `Read` vs `Write`.
- **[branch-protection / branch-protection]:** Rule for `master` disabling `force push` / history rewriting; demo in `Settings → Branches`.
- **[least-privilege / least-privilege]:** Principle to grant only needed access plus pragmatic systems (usethis workflow, Clear quote) to avoid relying on willpower.

## Code Snippets & Formulas

Not a live-coding session; conceptual walkthrough with GitHub UI navigation and usethis helpers (caption-mangled):

```r
# Intended usethis flow (introduced to contrast with manual errors)
usethis::create_from_github("2DegreesInvesting/repo") # "with the function for example create from github" ← create_from_github — forks source to user then clones
usethis::pr_init("my-feature")                         # "with a function and then ... then ... you know we ... synchronize our for our local Fork ... with for example the function P our sink ... and then we push ... with function P R push" ← pr_init
usethis::pr_push()                                     # push PR branch to origin (personal fork)
# Failure scenarios discussed: pushing to master of source if Owner/Admin mistakenly pushes with wrong URL/branch  # "my commit goes to the master branch of a sort of ripple ... if I have pushed privileges" ← push to master

# GitHub UI paths shown
# Organization → People → filter role: owner  # "there are 30 members ... filter for role owner ... one two three four five six owners" ← People filter
# Organization → Settings → Member privileges → Base permission = Read  # "if I go to Settings tab I can click on member privileges and I can set base permission for every member" ← Base permission
# Repo art-dai → Settings → Collaborators and teams  # three windows: (1) default org Read, (2) Banks team Read, (3) Jackson as collaborator Admin
# Repo → Settings → Branches → Branch protection rule for master  # "you can create a rule by which a branch which name matches for example master ... so that people can not say push force" ← branch protection
```

GitHub help quote preserved:

> "Organization owners have admin permissions ... by default for every repository owned by the organization" — displayed slide.

Other memorable quotes captured verbatim:

- "you do not rise to the level of your goals you'd fall to the level of your systems" ← James Clear, *Atomic Habits*

