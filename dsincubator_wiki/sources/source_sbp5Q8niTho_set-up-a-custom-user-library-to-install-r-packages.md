---
type: source
title: "Set up a custom user library to install R packages"
source_file: "sbp5Q8niTho_set-up-a-custom-user-library-to-install-r-packages.md"
video_id: "sbp5Q8niTho"
url: "https://www.youtube.com/watch?v=sbp5Q8niTho"
lang: en
tags: ["ds-incubator", "r-packages"]
key_topics: ["libpaths", "r-libs-user", "renviron", "rprofile", "custom-library"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=sbp5Q8niTho"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2022-03-18T00:00:00Z"
    usage_count: 2691
usage_window: { from: "2022-03-18T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Set up a custom user library to install R packages

## Summary

A short extension to the broader “What They Forgot to Teach You About R” series, this video shows how to control where `install.packages()` places packages and how to set up a persistent custom user library. On a shared Linux/Docker system, the default library is a site-level path (without a username), visible via `.libPaths()[1]` and install messages; packages shipped with R live separately via `list.files(.libPaths()[2])`. To isolate user packages you can pass `lib` to `install.packages()` — e.g., a temporary directory — but for a permanent per-user location you configure environment and startup files.

The persistent setup is: open `.Renviron` via `usethis::edit_r_environ()` and add a line like `R_LIBS_USER=~/R/custom-library/%V` where `%V` expands to the R minor version, ensuring a trailing newline, saving and restarting R (`Sys.getenv("R_LIBS_USER")` then shows it but `dir.exists()` is still FALSE until created). Create the directory with `dir.create(Sys.getenv("R_LIBS_USER"), recursive = TRUE)` so intermediate paths are built; only after restart does `.libPaths()` show the new path, but not yet at the front. To make it default, inspect `?.libPaths` and call `.libPaths(c(Sys.getenv("R_LIBS_USER"), .libPaths()))` (stored e.g., in `out`), confirming with `.libPaths()[1]` and by installing `r2dii.data` which now goes to the custom library.

Because that change is session-only, for persistence edit `.Rprofile` via `usethis::edit_r_profile()` and insert `.libPaths(c(Sys.getenv("R_LIBS_USER"), .libPaths()))` so every session prepends the custom library; verification is restarting R and checking `.libPaths()[1]` equals the custom path, then reinstalling confirms the package lands there.

## Key Concepts & Tools Taught

- **[libpaths]:** `.libPaths()` ← `dot leave path` / `leave paths` — shows all library locations; `[1]` is default for `install.packages()`; can be queried, prepended, and inspected via `list.files(.libPaths()[1])` and `?.libPaths`.
- **[r-libs-user]:** Environment variable `R_LIBS_USER` ← `r leaves user` / `our leaves user` / `r leaves user` controlling user-library location; may include version placeholder `%V` ← `percent v` which R expands to minor version; initially `dir.exists(Sys.getenv("R_LIBS_USER"))` is FALSE if directory not created.
- **[renviron]:** File `.Renviron` edited via `usethis::edit_r_environ()` ← `use this for the use this package edit our environ` to set `R_LIBS_USER=~/R/custom-library/%V` (example `home then r and then custom leave`), must end with newline; after saving + restart `Sys.getenv("R_LIBS_USER")` reflects the new path.
- **[rprofile]:** File `.Rprofile` edited via `usethis::edit_r_profile()` ← `edit our profile` to prepend the custom library every session with `.libPaths(c(Sys.getenv("R_LIBS_USER"), .libPaths()))`, notes `.Rprofile` is inspected at start of every R session.
- **[custom-library]:** Full workflow to get a persistent personal library: `install.packages("pkg")` ← `install.packages from cran` defaults to site library; `install.packages("pkg", lib = Sys.getenv("R_LIBS_USER"))` targets user lib; after `.Renviron` + `dir.create(..., recursive=TRUE)` + `.Rprofile` + restart, the custom directory appears as `.libPaths()[1]` and receives new installs.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```r
install.packages("r2dii.data")  # "when you install another package say that you install it with install.packages from cran you could call it with the first argument alone"
.libPaths()                     # "the first element of the output of the function leave paths ... dot leave path prints every library" ← caption: "leave paths" / "dot leave path"
.libPaths()[1]                  # default library (site level, no username)
list.files(.libPaths()[1])      # "let's say that we want to inspect it so let's do a list files inside that directory"
list.files(.libPaths()[2])      # R's built-in shipped packages

# specifying library explicitly
install.packages("pkg", lib = Sys.getenv("R_LIBS_USER"))  # "what if you wanted to control that ... you can do that with the second argument to install the packages which is the argument leave" ← lib

Sys.getenv("R_LIBS_USER")       # "let's get this environment variable r leaves user ... this is the one that specifies where the user packages should go" ← "our leaves user" / "r leaves user"
dir.exists(Sys.getenv("R_LIBS_USER"))  # FALSE before creation → TRUE after
# create directory (recursive for intermediate paths)
dir.create(Sys.getenv("R_LIBS_USER"), recursive = TRUE)  # "we just created and make sure that we could recursively create any intermediate path"

# edit files via usethis (caption: "we can use the function use this for the use this package edit our environ to open that file")
usethis::edit_r_environ()       # add line: R_LIBS_USER=~/R/custom-library/%V  (or ~/R/custom/leave) where %V = "percent v" → minor version; ensure trailing newline, save, restart R
# after restart:
Sys.getenv("R_LIBS_USER")       # shows "~/R/custom-library/4.x" (expanded %V)

# prepend to libPaths for session
.libPaths(c(Sys.getenv("R_LIBS_USER"), .libPaths()))  # "it has an argument that you can use to set what is the first element ... pass that inside lead paths" ← ".libPaths(c(Sys.getenv(...)))"
out <- .libPaths(c(Sys.getenv("R_LIBS_USER"), .libPaths()))  # "let's do a lowercase so out now holds ... the first element is the one that we want"

# persist across sessions
usethis::edit_r_profile()       # "the place to put that would be our profile file so edit our profile ... here is where we want to set up leave paths to push to the front and the output of cis get and our lifts path"
# in .Rprofile add:
.libPaths(c(Sys.getenv("R_LIBS_USER"), .libPaths()))
# verify after restart:
.libPaths()[1]                  # should be "~/R/custom-library/%V" expanded
install.packages("r2dii.data")  # now lands in custom library
```
