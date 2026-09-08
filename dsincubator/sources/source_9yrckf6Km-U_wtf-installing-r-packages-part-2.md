---
type: source
title: "wtf: Installing R packages (part 2)"
source_file: "9yrckf6Km-U_wtf-installing-r-packages-part-2.md"
video_id: "9yrckf6Km-U"
url: "https://www.youtube.com/watch?v=9yrckf6Km-U"
lang: en
tags: ["ds-incubator", "github", "r-packages", "git", "r2dii"]
key_topics: ["github-pat", "r-packages-installation", "libpaths", "pak"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=9yrckf6Km-U"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 129
    last_modified: "2022-03-22T00:00:00Z"
usage_window: { from: "2022-03-22T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# wtf: Installing R packages (part 2)

## Summary

A continuation of the installation series, focused on two pain points: installing from private GitHub repositories and controlling where packages land. The demo runs from a reproducible isolated environment (a repo cloned and started with `docker compose up`) that is intentionally fresh with no GitHub credentials, so `install_github` fails with a permissions error.

The workflow taught is: diagnose with `usethis::gh_token_help()`, create a personal access token with `usethis::create_github_token()` (naming it with machine and date, e.g., `2022 march 22`, and deleting it right after the demo), store it locally with `gitcreds::gitcreds_set()` (caption as `git credits set` / `git create set`), and verify again with `gh_token_help` / `gh_token` (caption `gh and you know talking`) which now shows the token is discovered. Even after this, `remotes`/`devtools::install_github()` requires the token passed explicitly via its `auth_token` argument, demonstrated with a live `devtools::install_github("org/repo", auth_token = gh_token())` call. As a smoother alternative, the `pak` package's `pak::pkg_install("repo/package")` (also shown as `pkg for package underscore install`) is presented: it auto-discovers the token, accepts `"repo/package"` for GitHub vs bare name for CRAN, and is highlighted as rapidly improving (authors credited as Jim Hester and Gábor Csárdi — caption `governor`/`from governor`).

The second half covers library paths. Defaults are explained via ` .libPaths()` (caption `leave paths` / `live paths`) and the `lib` argument of `install.packages` / `pak::pkg_install` / `library()`. The first entry of `.libPaths()` is the user library; the second holds base packages like `base`, `utils`. Listing the user library shows extensions like `shiny`, `testthat`. Two use cases are demonstrated: a temporary install with `lib = tempdir()` / `tempfile` directory valid for the session, tested with `pak::pkg_install("2DegreesInvesting/r2dii.data", lib = tempdir())` and then `library(r2dii.data, lib.loc = tempdir())` plus `packageVersion` checks and `detach` to switch; and a project-specific library via `renv::init()` (caption `rm`, `rm has function called init`) which creates `renv/library` inside the project and prepends that path to `.libPaths()`, visible by re-calling `.libPaths()`. A permanent custom user library via setting `.libPaths` is referenced only via a separate YouTube video as too complex for the live session.

## Key Concepts & Tools Taught

- **[GitHub PAT / github-pat]:** Personal access token as a private key/password to authenticate the local machine to GitHub for private repo installs; created with date-labeled name, copied once, refreshed to hide, and deleted immediately after demo.
- **[R packages installation / r-packages-installation]:** `install.packages`, `devtools::install_github`, `remotes::install_github`, and `pak::pkg_install`; how expiration/deletion of the token re-breaks installs (error after deleting token).
- **[pak / pak]:** Modern installer `pak::pkg_install("repo/package")` (caption `pack`, `pkg for package underscore install`) that auto-detects `GITHUB_PAT`, understands `"repo/package"` vs bare CRAN name, and is built by Gábor Csárdi (and Jim Hester).
- **[gh_token helpers]:** `usethis::gh_token_help()` to diagnose ("there is no access personal token"), `usethis::create_github_token()` to open GitHub settings, and `gitcreds::gitcreds_set()` ("git credits set") to store the PAT, plus `gh_token()` / `gh()` to inspect it partially hidden.
- **[auth_token argument]:** `devtools::install_github(..., auth_token = gh_token())` requiring explicit passing; shown failing without it even when PAT is stored, then succeeding when passed.
- **[libPaths / libpaths]:** `.libPaths()` controls where R looks for libraries ("controls how to get and set the library trees within which packages are looked for"); first element is user library, others are system/base; the `lib` argument defaults to first entry.
- **[temporary library]:** Installing to `tempdir()` via `pak::pkg_install(..., lib = tempdir())` and loading via `library(pkg, lib.loc = tempdir())` to test a dev version (example `r2dii.data` 0.2.2) without polluting the user library; session-scoped.
- **[project-specific library with renv]:** `renv::init()` (caption `rm` and `init`) creates `renv/library` inside the project and reorders `.libPaths()` so the project library becomes the default user library.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```r
devtools::install_github("2DegreesInvesting/private-package")  # "function devtools install underscore github ... should fail ... don't have the required permissions to access this repository" — naive private install
usethis::gh_token_help()          # "gh underscore token underscore help ... saying hey there is no access personal token on github"
usethis::create_github_token()    # "create underscore github underscore token ... going to be sent to github ... enter my password ... type the name ... 2022 march 22"
gitcreds::gitcreds_set()          # "git create set / git credits underscore set ... enter the token ... paste it there" (caption "git create set", "git credits set")
usethis::gh_token_help()          # re-check: "personal access token has been found has been discovered"
gh_token()                        # "gh and you know talking" → gh_token() / gh() to inspect partially hidden token
devtools::install_github("org/repo", auth_token = gh_token())  # "to pass it directly to the argument of underscore token and of the function install underscore github"
pak::pkg_install("2DegreesInvesting/r2dii.data")  # "pack and the function is called pkg for package underscore install ... with the same function you can install from CRAN or from GitHub ... string that has format repo slash package"
pak::pkg_install("2DegreesInvesting/r2dii.data", lib = tempdir())  # "pack install from github ... and put it in my temporary directory"
.libPaths()                       # "leave paths" / "live paths" — controls library trees
.libPaths()[1]                    # "very first one ... is the user library ... will default to the first element of the path"
list.files(.libPaths()[1])        # "list the contents of that path ... names of some packages like shiny or test that"
install.packages("pkg", lib = tempdir())  # "second argument is called leap ... if you don't give any explicit argument to leave it will default to the first element"
library("r2dii.data", lib.loc = tempdir())  # "library r2dai data but now the second argument again has to be templar because we have to say from where we want the package to be looked for"
packageVersion("r2dii.data")      # "package pack catch version of r2dii data what do i get i get 0.2.2"
detach("package:r2dii.data")      # "detach the other package ... rarely do and now i do library that package from that temporary library"
tempdir()                         # "temporary template function gives you a directory that is valid for as long as the r session lasts"
renv::init()                      # "rm has you of course you have to have it installed and then it has a function called init ... will add a folder in your project that is called rm and inside it you will see library" (caption "rm")
.libPaths()                       # after renv::init first entry becomes project path "renv/library ... lives inside the project"
docker compose up                 # "change your directory to it and then just run local compose up" — reproduced isolated environment (caption "local compose up")
```
