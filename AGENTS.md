# AGENTS.md — YouTube talk → blog post pipeline

A URL-in, blog-out pipeline. A future agent receives only (a) the GitHub repo
URL containing the talk's material `README.md` and (b) the YouTube video link,
and produces a finished blog post with minimal token cost.

## INPUTS

Two required inputs, everything else derivable:

1. **Material repo URL** — GitHub repo containing the talk's `README.md`.
   Clone/fetch to read the source material. If no repo exists (video
   description has no repo link), use the no-material fallback: create a
   placeholder `<slug>/README.md` (see LAYOUT CONTRACT) instead of cloning.
2. **YouTube video URL or ID** — e.g. `https://www.youtube.com/watch?v=qqKhQdejUOM`
   or bare `qqKhQdejUOM`.

Derivable values from input 2:

- **Video ID** → `transcripts/<id>.{txt,tsv}` (e.g. `transcripts/qqKhQdejUOM.txt`).
  Only two formats: `.txt` (single-line transcript, for drafting) and `.tsv`
  (`start duration text` columns, for frame timestamps). Do NOT fetch `.json` —
  it duplicates the `.tsv` and wastes tokens.
- **Talk slug** → folder name (e.g. `project_management_on_github`)
- **Post date** → Quarto front-matter `date` (fixed `YYYY-MM-DD` — never
  `today` or `last-modified`, which reshuffle listing order on every render;
  see <https://quarto.org/docs/websites/website-blog.html>). Full runs use
  the material date (fetch from the material README; video upload date is
  NOT the material date; do not guess). No-material runs use the video
  upload date.

## VIDEO METADATA LOOKUP

`data/dsincubator.csv` is the authoritative local lookup for video metadata
(dates, titles, URLs, counts, etc.). Use it instead of re-fetching from
YouTube. Key columns: `title`, `id`, `url`, `upload_date_iso`,
`view_count`, `like_count`, `comment_count`, `duration`,
`playlist_index`, `channel`, `uploader`.

- `upload_date_iso` is the calendar date to use when a video date is
  needed (matches the front-matter `date` policy).
- `id` is the YouTube video ID used to join to transcripts
  (`transcripts/<id>.{txt,tsv}`).

Example (R):

```r
d <- readr::read_csv("data/dsincubator.csv", show_col_types = FALSE)
dplyr::filter(d, id == "<video-id>") |>
  dplyr::select(title, upload_date_iso, url, like_count)
```

## LAYOUT CONTRACT

### Per-talk folder

```
<slug>/
  README.md              # source material (fetched from input repo), or no-material
                         # fallback placeholder (see below) when no repo exists
  transcripts/<id>.txt   # single-line transcript (drafting)
  transcripts/<id>.tsv   # start/duration/text columns (frame timestamps)
  images/                # all visual assets
  blog.md           # the finished output
  .omo/                  # runtime-only; NEVER read as input
```

Never render or commit `blog.html` / `blog_files/` — rendered HTML is
throwaway preview output, not a deliverable. `blog.md` is final.

**Talk README rule**: every `<slug>/README.md` points to the video, whatever
else it holds:

```
# <Video title>

[YouTube video](<youtube-url>)
```

**No-material fallback**: when no material repo exists, the README is just
that — title plus video link, nothing else. No Objectives, no sections —
the transcript becomes the sole source, and front-matter `date` is the
video upload date instead of a material date.

### Image naming

- **Featured**: `video_NN_topic.ext` — one per blog section, chosen by the
  visual-pick stage (stage 5). `NN` is the section order; `topic` describes
  what the image actually shows (e.g. `video_01_backlog-table.png`,
  `video_04_convert-to-issue.jpg`). The picker sees the pixels, so encode
  the image-specific topic in the name. Keep the source extension (never
  re-encode just to rename).
- **No manual screenshots on fresh runs.** There is no screen-capture step:
  all frames come from the video (stage 4). Pre-existing timestamp PNGs in
  a talk folder are legacy; reuse one only if it beats every extracted
  frame, otherwise prune unreferenced files at the end.

### Quarto front matter

Every `blog.md` opens with YAML front matter (per
<https://quarto.org/docs/websites/website-blog.html>); the title lives
there, so the body never repeats it as a `# Title` heading.

```
---
title: "<Title matching README heading>"
description: "<One-line post summary>"
date: "<YYYY-MM-DD>"
categories:
  - <topic>
  - <topic>
---
```

Rules:
- `date` is fixed (`YYYY-MM-DD`) — never `today` or `last-modified`,
  which reshuffle the blog listing on every render.
- `date` is the material date on full runs, the video upload date on
  no-material runs (see INPUTS).
- Keep `categories` to 1–3 lowercase topic tags.

### blog.md structure

```
<YAML front matter above>

> [!WARNING]                          # ONLY when stage 6 docs research finds
> <details><summary>What may look different today</summary>  # real deltas; omit
>                                       # entirely otherwise ("unchanged" is noise).
> - <verified delta bullets, from stage 6 docs research>
> </details>

Welcome paragraph.

Goal / KISS paragraph.

Audience line ("This is for anyone who ...").

**Objectives:**
1. ... (mirrors README objectives)
2. ...
3. ...

## <Hat / perspective section 1>
Prose paragraph(s) preserving speaker's first-person voice.

![Caption describing the image](images/video_NN_descriptive.jpg)

## <Hat / perspective section 2>
...

## Takeaways
Takeaway prose.

![Takeaways image](images/video_NN_takeaways.jpg)

## Resources
- [Title](verified-url).
- [Original material](github-url).
- [Meetup on YouTube](youtube-url).
- [Current docs child pages](verified-urls).
```

**Placement rule**: images go AFTER the text they illustrate (traditional
article convention). Each image closes its section, never opens it.

**Header rule**: the date lives in front-matter `date`, never in a banner.
The WARNING block appears ONLY when stage 6 docs research finds real deltas —
if nothing changed, omit it entirely (a note saying "unchanged" is noise).
At most ONE alert block at the top: never stack NOTE + WARNING — two boxes
look broken and say the same thing twice. The canonical docs link lives in
Resources, not in a second banner.

## 7 ORDERED STAGES

### Stage 1 — Scaffold + fetch material + video metadata

**Purpose**: Create the folder, get the README, and inspect video metadata
without downloading the video.

```sh
# Clone or fetch the material repo into <slug>/. If the material is a
# file or subfolder inside a larger repo, clone then copy just that path
# (or use a sparse checkout) — the talk folder needs only its README.md.
git clone <material-repo-url> <slug>

# No-material fallback: if no repo exists, scaffold the folder and write
# the placeholder README (title + playlist link) instead of cloning.
# mkdir -p <slug>/transcripts <slug>/images

# Fetch video metadata only — never download the full video yet.
yt-dlp -F --skip-download "<youtube-url>" > <slug>/video-formats.txt 2>&1
```

**Expected outputs**: `<slug>/README.md`, `<slug>/video-formats.txt`

### Stage 2 — Transcript fetch and wrap

**Purpose**: Get the transcript and wrap it for token-cheap reading.
The transcript stays OUT of context — read it in slices during drafting.

```sh
# Fetch transcript (auto-saves to transcripts/<id>.{txt,tsv}).
youtube-transcript "<youtube-url>" --out <slug>/transcripts/

# Wrap the single-line .txt to ~200-char lines for manageable reads.
python3 -c "
import textwrap
t=open('<slug>/transcripts/<id>.txt').read()
open('/tmp/transcript-<id>-wrapped.txt','w').write('\n'.join(
  textwrap.wrap(t, 200)))
"
```

**Expected outputs**: `<slug>/transcripts/<id>.txt`,
`<slug>/transcripts/<id>.tsv`, `/tmp/transcript-<id>-wrapped.txt`

### Stage 3 — Draft text pass

**Purpose**: Write the blog prose. Preserve the speaker's first-person voice.

Rules:
- Cohesive one-idea paragraphs.
- Objectives list mirrors the README's **Objectives** (same count, same order).
  On no-material runs, derive 1–3 objectives from the transcript instead
  (stated as such in the post).
- Cut filler: door, notes, refresh, music, oops, "um", "uh".
- Rewrite visual-deictic lines ("click here", "as you can see") into plain
  action descriptions.
- No new claims beyond what the transcript and README support.
- Read the wrapped transcript in slices; quote key lines, never paste the
  full transcript into context.

**Expected outputs**: Draft prose in working notes (not yet a file).

### Stage 4 — Download clips + frame extraction

**Purpose**: Get a small video file and extract frames at section timestamps.

```sh
# Download only 720p (or ≤1080p fallback). Small MP4s, /tmp only.
yt-dlp -f "136+140" --merge-output-format mp4 "<youtube-url>" \
  -o /tmp/talk-<id>.mp4

# Extract triplets around ~6 section timestamps: T-3s, T, T+3s
# (or: youtube-frames /tmp/talk-<id>.mp4 <timestamps> <slug>/images/,
# which also writes images/manifest.tsv with columns
# file timestamp width height bytes).
ffmpeg -hide_banner -loglevel error -ss <T-3> -i /tmp/talk-<id>.mp4 \
  -frames:v 1 -q:v 2 <slug>/images/_tmp_<section>_a.jpg
ffmpeg -hide_banner -loglevel error -ss <T> -i /tmp/talk-<id>.mp4 \
  -frames:v 1 -q:v 2 <slug>/images/_tmp_<section>_b.jpg
ffmpeg -hide_banner -loglevel error -ss <T+3> -i /tmp/talk-<id>.mp4 \
  -frames:v 1 -q:v 2 <slug>/images/_tmp_<section>_c.jpg
```

**Expected outputs**: `/tmp/talk-<id>.mp4` (~25–54 MB),
`<slug>/images/_tmp_*.jpg` (raw frames), `<slug>/images/manifest.tsv`

### Stage 5 — Visual pick

**Purpose**: Select exactly 1 winner per section. Never force a frame.

Criteria (legibility at ~800 px width):
- Key UI element visible (buttons, tables, panels).
- No black frames, blur, occlusion, or transition frames.
- Reject transition frames (e.g. desktop-overview / Mission-Control style
  frames near music cues).
- Never pick frames that merely reiterate the README (e.g. a filmed slide
  showing the objectives or takeaways bullets). The image must show something
  the text cannot say: the actual UI state, button, or result.

If a section has no good frame, go imageless. Never force a bad frame.
(On a re-run of an old talk, a pre-existing timestamp PNG may be reused
only if it beats every extracted frame.)

Rename winners to `video_NN_topic.ext` (see Image naming) where `NN`
matches the section order in the blog.

**Expected outputs**: `<slug>/images/video_NN_descriptive.jpg`
(one per section), updated `manifest.tsv` with picks.

### Stage 6 — Assemble blog

**Purpose**: Combine prose and images into `blog.md`.

Rules:
- Images AFTER the text they illustrate (traditional article convention:
  each image closes its section, never opens it).
- 1–2 sentence captions summarizing the adjacent text.
- YAML front matter first (see Quarto front matter): `title`,
  `description`, fixed `date`, `categories`. No `# Title` heading in the body.
- WARNING block below the front matter ONLY when docs research finds real
  deltas: `> [!WARNING]` plus the `<details>` delta list (verify every docs
  URL — never invent). The date already lives in front matter — never repeat
  it in the block. If nothing changed, omit the block entirely.
- Resources section: original material, YouTube, current docs child pages
  (the canonical docs link lives here, not in a second banner).
  On no-material runs omit the original-material line.
- Every docs URL must be fetched and verified during assembly — never invent.

**Expected outputs**: `<slug>/blog.md`

### Stage 7 — Verify

**Purpose**: Catch every error before the post is done.

Checklist:
- Every referenced image exists on disk.
- No dangling visual refs (image paths that don't resolve).
- Filter/code strings (e.g. `is:open is:issue`) appear quoted exactly as in source.
- No Q&A sections unless explicitly requested.
- All docs URLs in Resources were fetched (not invented).

```sh
# Verify every image in blog.md exists.
grep -o 'images/[^)]*' <slug>/blog.md | while read img; do
  [[ -f "<slug>/$img" ]] || echo "MISSING: $img"
done
```

**Expected outputs**: Clean verification output; `<slug>/blog.md` is final.

## TOKEN-SAVING RULES

1. **Never paste full transcripts or video output into context.** Use files,
   manifests, and short summaries only. Read wrapped transcript in slices.
2. **Batch independent reads.** Read multiple files in one turn when possible.
3. **Stop searching after 2 fruitless iterations.** If a docs URL or fact
   can't be found in two tries, note the gap and move on.
4. **Reuse `ses_`/`bg_` continuation IDs.** Don't restart sessions;
   continue existing ones to preserve context.
5. **Full output to files.** Scripts print only short `[prefix]` summary
   lines to stdout; everything verbose goes to `/tmp` or the talk folder.

## QUALITY GATES

Before the blog is final, all must pass:

- [ ] **Images exist** — every `images/` ref in `blog.md` resolves.
- [ ] **Images evenly distributed** — roughly one featured image per section.
- [ ] **Captions match text** — each image caption summarizes its adjacent prose.
- [ ] **Objectives mirror README** — numbered list matches the source material
  (or the transcript on no-material runs, stated as such).
- [ ] **Front matter valid** — `title`, `description`, fixed `date`
  (`YYYY-MM-DD`, never dynamic), 1–3 categories; no `# Title` in the body.
- [ ] **WARNING conditional** — present with the `<details>` delta list ONLY
  when real deltas were verified (at most one alert at the top — never
  NOTE+WARNING; no date inside — it lives in front matter); omitted when
  nothing changed.
- [ ] **Resources complete** — original material, YouTube, current docs pages
  (original-material line omitted on no-material runs).
- [ ] **Voice preserved** — first-person speaker voice maintained throughout.
- [ ] **No invented URLs** — every docs URL was fetched and verified.

## TOOLING SPECS

All scripts live in `~/git/agents/bin/` and follow the house style of
`rcheck` / `rcheck-summary`: `#!/usr/bin/env bash`, `set -u`, manual
`while`/`case` argument parsing, `-h|--help` support, stdout = short
`[prefix]` summary lines only, full output to files, exit codes preserved,
lowercase-hyphenated names, `/tmp` timestamped logs.

### youtube-transcript

- **Args**: `<youtube-url> --out <dir>`
- **Stdout contract**: `[youtube-transcript] fetched <id>.txt, <id>.tsv`
- **File outputs**: `<dir>/<id>.txt`, `<dir>/<id>.tsv`
- **Behavior**: Fetches transcript via yt-dlp, writes both formats.
  Full transcript to files; stdout is one short summary line.

### youtube-formats

- **Args**: `<youtube-url>`
- **Stdout contract**: `[youtube-formats] <resolution> <ext>` (one line
  per format, from `yt-dlp -F`)
- **File outputs**: none (stdout is the format list)
- **Behavior**: Lists available formats. Used in stage 1 to pick the
  correct format code before downloading.

### youtube-frames

- **Args**: `<video-file> <timestamps-file> <out-dir>`
- **Stdout contract**: `[youtube-frames] extracted N frames to <out-dir>`
- **File outputs**: JPEG frames in `<out-dir>/`
- **Behavior**: Extracts frames at timestamps from a manifest file.
  Uses ffmpeg with `-ss <T> -q:v 2`.

### youtube-manifest

- **Args**: `<video-file>`
- **Stdout contract**: `[youtube-manifest] <width>x<height> <duration>s`
- **File outputs**: none (probe only; the per-frame `manifest.tsv` is
  written by `youtube-frames` during extraction)
- **Behavior**: Probes video dimensions and duration. Used in stage 1 to
  confirm a downloaded format is readable before extracting frames.

### Skill and command placement

- **Orchestration skill** → `agents/skills/youtube-blog.md`
  (the `agents/skills/` dir is empty but conventional; place the skill
  definition here following opencode skill format).
- **Optional slash command** → `agents/commands/youtube-blog.md`
  (YAML `description` frontmatter + `$ARGUMENTS` body; opencode discovers
  commands from `~/.config/opencode/commands/*.md`).
- **Settings** → `agents/settings/` (empty; add shared defaults here if
  needed later).

---

*Conventions grounded in `~/git/dsincubator/youtube/project_management_on_github/`
and `~/git/agents/`. Proven numbers this session: 720p ≈ 25–54 MB vs 59 PNGs
≈ 72 MB; 6 section JPEGs ≈ 1.5 MB total. No invented repo conventions.*
