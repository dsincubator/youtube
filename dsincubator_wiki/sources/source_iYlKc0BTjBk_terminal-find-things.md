---
type: source
title: "terminal: Find things"
source_file: "iYlKc0BTjBk_terminal-find-things.md"
video_id: "iYlKc0BTjBk"
url: "https://www.youtube.com/watch?v=iYlKc0BTjBk"
lang: en
tags: ["ds-incubator", "terminal", "cli"]
key_topics: ["grep", "find", "xargs"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=iYlKc0BTjBk"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2022-05-10T00:00:00Z"
    usage_count: 45
usage_window: { from: "2022-05-10T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# terminal: Find things

## Summary

This session teaches finding things in the terminal with `grep` and `find`, driven by three use cases: finding interesting flags in a help file, moving RStudio projects (flagged by `*.Rproj`) into a single organized folder while excluding Trash, and pruning Trash safely. The lesson runs in folder `03` inside a reproducible Docker-backed home environment.

For `grep`, the speaker explores `grep --help` piped into `grep` itself: `-i` for case-insensitive matches (so `f,` matches `F,` and `f,`); `-f` to read patterns from a file (a `patterns` file containing `f,`, `i,`, `v,`, `n,`); `-v` to invert matches; and `-n` to show line numbers, combined via pipes (e.g., filtering help through `cut`). It is shown that `grep` matches all occurrences, not just the first.

For `find`, the speaker contrasts `find` with no arguments (matches every file under a path) and its components: path, tests, and actions. Tests include `-name "*.Rproj"` and `-path "*trash*"` with negation `-not`. Actions include `-print` (implicit), `-ls`, `-delete`, and `-exec`. To move project folders rather than just the `.Rproj` files, the pipeline uses `dirname` (caption `dir name`/`their name`) to get parent directories, `xargs` (caption `sars`/`sarcs`/`ex`) or `xargs -I {}` to reformat newline-separated paths into space-separated command lines, and `mv -t` to move multiple sources into the `rs` destination. For deleting, the video covers `find trash -not -path "*trash"` plus `-delete`, and safer alternatives with `xargs rm -rf` and `find ... -exec rm -r -i {} \;` which asks for confirmation before descending and removing, emphasizing the danger of `find -delete` having no confirmation.

## Key Concepts & Tools Taught

- **[grep]:** search inside file contents with patterns and flags: `-i` ignore case, `-f patterns` read patterns from file, `-v` invert, `-n` show line numbers; piping `grep --help | grep -i "f,"` demonstrates case-insensitive filtering.
- **[find]:** locate files by path/tests/actions: `find ~/ -name "*.Rproj"`, `-path "*trash*"` combined with `-not` to exclude Trash, actions `-print`, `-ls`, `-delete`, `-exec rm -r -i {} \;` requiring the escaped semicolon.
- **[xargs]:** adapter that turns newline-separated `find` output into space-separated arguments for downstream commands; used with `dirname` to get parent folders and `mv -t rs` to move many directories at once, contrasted with the more general `find -exec` placeholder `{}`.

## Code Snippets & Formulas

Caption-mangled fragments kept alongside normalized forms:

```bash
# grep via help piped into itself — "i'm going to be passing the output of grep help ... pipe that into into grep itself"
grep --help | grep -i "f,"        # "f comma" + "insensitive to k" — minus i ← -i
grep -i -f patterns --help | grep # "minus f ... takes a pattern from file" — minus f ← -f
grep -v "pattern" file            # "v is cool because it helps to invert" — minus v ← -v
grep -n "pattern" file | cut      # "n is really cool because it allows you to show that the line numbers" — minus n ← -n

# find RStudio projects, excluding Trash
find ~ -name "*.Rproj"                            # "the name i want it to be ... that ends with our approach" — name ← -name
find ~ -not -path "*trash*" -name "*.Rproj"      # "i want that the path not too much ... anything then they were trash" — path / not path ← -path / -not -path

# Get parent dirs and move with xargs
find ~ -not -path "*trash*" -name "*.Rproj" | xargs -I {} dirname {} | xargs -I {} echo {}
# "if the command name if you give it a b it will give you a" — name ← dirname
# "we could pass sarcs to remove" / "this ah sarcs made a mistake ex" — sarcs / ex / sars ← xargs
find ~ -not -path "*trash*" -name "*.Rproj" -exec dirname {} \; | xargs mv -t ~/rs
# "and move takes ... files and a destination but you can invert this ... if we use the flag minus t" — minus t ← -t

# Pruning Trash — three variants taught
find ~/trash -not -path "*/trash" -print          # "i want to exclude the name of the folder itself" — path ← -path
find ~/trash -not -path "*/trash" -delete         # "we also have a very useful action is what is called delete" — delete ← -delete
find ~/trash -not -path "*/trash" | xargs rm -rf  # "we could pass sarcs to remove ... we are deleting not only files but also directories ... you can say f4 force" — remove / f4 ← rm -rf
find ~/trash -not -path "*/trash" -exec rm -r -i {} \;  # "and now we can do another action that is called x sec ... exec is more general than xrx ... you need to end the line with a semicolon and ... escape that thing" — x sec / xxx exec ← -exec, \; ← \;
# "you need to be ... escaping that semicolon" — semicolon escaped
```
