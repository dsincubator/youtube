---
type: source
title: "How to download a file from google drive into your R IDE"
source_file: "iNWBG3x4QVc_how-to-download-a-file-from-google-drive-into-your-r-ide.md"
video_id: "iNWBG3x4QVc"
url: "https://www.youtube.com/watch?v=iNWBG3x4QVc"
lang: en
tags: ["ds-incubator", "r-packages"]
key_topics: ["google-drive", "drive-download", "remote-server"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=iNWBG3x4QVc"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2024-07-19T00:00:00Z"
    usage_count: 251
usage_window: { from: "2024-07-19T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# How to download a file from google drive into your R IDE

## Summary

The video shows how to get a file that lives in Google Drive directly into an R session running on a remote server, without first downloading it to the local laptop and re-uploading. The speaker is connected via SSH to a remote machine running RStudio Server inside a Docker container (accessible by IPv4 + port) and demonstrates that the usual Drive UI download would land the file on the laptop, wasting bandwidth on a weak connection.

The solution uses the googledrive R package (by Jenny Bryan). From the package reference, the `drive_download` function can take a file identifier, including a Drive ID. The ID is extracted from the shareable Drive link (the long string between `/d/` and `/view`). By loading googledrive, wrapping the copied ID string with `as_id()`, and calling `drive_download()` on it, the file downloads straight from Drive into the server's filesystem. The speaker shows a terminal `ls` confirming the downloaded file size matches the Drive original and notes the transfer took a fraction of a second versus minutes when routing through the laptop.

## Key Concepts & Tools Taught

- **[google-drive]:** user's Drive as source for large files; share link contains the file ID needed for programmatic access.
- **[drive-download]:** function from the googledrive package that downloads a Drive file directly into the current R session's filesystem, accepting an ID as its `file` argument ("you look into the argument ... you'll see that file could be a bunch of things including ... an ID").
- **[remote-server]:** an R environment running on a remote host (Docker + RStudio Server accessed via IPv4 and port after an SSH connection), distinct from the local laptop; downloading to the laptop then uploading via the Files pane is wasteful.

## Code Snippets & Formulas

Spoken calls dictated live (mangled caption fragments normalized here):

```r
# Inspect remote container
# "if I do a Docker yes I can see here is my little container" — Docker yes ← docker ps

library(googledrive)  # "you load um attach your Google Drive package" — Google Drive uh our package ← googledrive

# Drive file ID from share link
# "you go to your ... share options and here you can ... copy the link and if you paste that in the browser you will see that it has a structor where there is this weird number ... so this is your ID" — this weird number ← Drive ID in share URL

as_id("1...weird_number_from_link...")  # "you can pass it into this little as ID helper ... passing your ID to the as ID Little Helper" — as ID ← as_id

drive_download(as_id("..."))  # "just call Drive download into that" — Drive download / drive download ← drive_download
# Verify
# "if you look into my terminal here is my downloaded file and you can see that is as big as it was on my drive" — ls in terminal ← ls
```
