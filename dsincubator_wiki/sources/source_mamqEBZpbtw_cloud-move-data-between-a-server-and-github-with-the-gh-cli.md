---
type: source
title: "cloud: move data between a server and GitHub with the gh CLI"
source_file: "mamqEBZpbtw_cloud-move-data-between-a-server-and-github-with-the-gh-cli.md"
video_id: "mamqEBZpbtw"
url: "https://www.youtube.com/watch?v=mamqEBZpbtw"
lang: en
tags: ["ds-incubator", "github", "containers", "git", "cloud"]
key_topics: ["gh-cli", "github-releases", "tar-compression", "ssh-authentication", "digitalocean-droplet", "docker-rockerverse"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=mamqEBZpbtw"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 41
    last_modified: "2022-06-28T00:00:00Z"
usage_window: { from: "2022-06-28T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# cloud: move data between a server and GitHub with the gh CLI

## Summary

The speaker demonstrates how to move relatively large data between a cloud server and GitHub using the `gh` command-line interface, addressing the limitation that `git` commits are not suitable for large files. The demo runs on a fresh DigitalOcean droplet (IPv4 address), accessed via SSH into a container from the rockerverse project (`rocker/verse`-derived image) exposing port 8787 for RStudio (user `rstudio` / chosen password). After basic `git config` setup (user name and email), the walkthrough installs `gh` on the Debian-based container, shows `gh` help (`gh` → `gh auth login`), authenticates by creating an SSH key via `gh auth login` (choosing GitHub.com, SSH protocol, no passphrase, default title `GitHub CLI`, browser device-code flow and 2FA), clones a repository with `gh repo clone` versus traditional `git clone <url>` (owner/repo shorthand), creates small CSV files in `data/`, commits them, and discusses the 2 GB-per-asset GitHub Releases mechanism for larger payloads. The release workflow is then shown end-to-end: `gh release create v1` in a dedicated `assets` repository, compressing the folder with `tar -czf data.tar.gz data/`, uploading with `gh release upload v1 data.tar.gz`, downloading elsewhere with `gh release download v1 -p "data.tar.gz" --repo 2DegreesInvesting/ds.cloud` (pattern-matched asset), and extracting with `tar -xzf data.tar.gz`. The talk also references the `piggyback` R package that wraps Releases for data, notes that one release already holds >10 GB across multiple 2 GB assets, and discusses trade-offs: Releases provide versioned provenance and release notes but can complicate corrections of bad data versus managing time-stamped paths or checksums on a plain file server.

## Key Concepts & Tools Taught

- **[gh-cli]:** Command-line application for GitHub (caption "with the gh command line application"); entry point for all operations.
- **[github-releases]:** GitHub feature for attaching large binaries to releases (caption "github releases" / "create releases and then attach the files as binaries"); limit 2 GB per asset, unlimited number of assets.
- **[tar-compression]:** Compressing a folder before attaching (caption "`tar` ... `c4 create` the `z` for compressed as like a gcp and `f` is to tell ... which file is the one that I want to host the archive" → normalized `tar -czf data.tar.gz data/` and `tar -xzf` for extract).
- **[ssh-authentication]:** Authenticating a fresh environment to GitHub via SSH key creation through `gh` (caption "`gh auth login`", "create an ssh key", "passphrase", "title for the ssh key ... GitHub CLI").
- **[digitalocean-droplet]:** Fresh cloud server used for the demo (caption "little droplet and a server on digitalocean", "that number ipv4", connect as `fruits` user to the droplet address).
- **[docker-rockerverse]:** Running containers inside the droplet from the rockerverse project (caption "using containers inside your droplets", "running a container from the rockerverse project", `docker ps` to verify `gh` container, `--rm` and `-d` detached mode, RStudio on port 8787).

## Code Snippets & Formulas

Caption-quoted commands with normalized forms:

```bash
# Connect to DigitalOcean droplet (caption "user fruits ads ... paste the address")
ssh fruits@<droplet-ipv4>

# Run rockerverse container with RStudio on 8787 (caption "running a container from the rockerverse project ... i'm going to be the root user ... calling it gh ... remove ... detach")
docker run --rm -d -p 8787:8787 -e PASSWORD=yourpassword --name gh rocker/verse

# Verify container
docker ps  # caption "docker ps i should see that gh container running"

# Basic git identity setup inside container
git config --global user.name "Mauro Lepore"
git config --global user.email "mauro@example.com"

# Install gh CLI on Debian/Ubuntu container (caption shows curl/apt install sequence)
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
sudo apt update && sudo apt install gh -y

# Help and authentication flow (caption: "gh and then enter" → help, "gh out" → gh auth, "gh auth login")
gh
gh auth login
# Prompts: GitHub.com / SSH / yes create SSH key / no passphrase / title GitHub CLI / Login with a web browser → copy device code → paste → authorize

# Clone via gh (shorthand owner/repo) vs traditional git (caption "gh and the subcommand repo clone" vs "git clone with the url")
gh repo clone 2DegreesInvesting/ds.cloud
# equivalent: git clone https://github.com/2DegreesInvesting/ds.cloud.git

# Create small data inside cloned repo
mkdir -p data
echo "a,b\n1,2" > data/a.csv
echo "a,b\n3,4" > data/b.csv
git add data && git commit -m "new data" && git push

# Release-based large-file workflow (caption "gh release create" / "gh release upload" / "gh release download")
gh release create v1 --repo maurolepore/assets --title "v1" --notes "" --target main
tar -czf data.tar.gz data   # caption: "tar ... c4 create the z ... f ... data.tar.gz ... data"
gh release upload v1 data.tar.gz --repo maurolepore/assets
gh release download v1 -p "data.tar.gz" --repo 2DegreesInvesting/ds.cloud  # caption: "gh release download ... v1 ... -p for the pattern ... --repo"
tar -xzf data.tar.gz && ls data
```

No R code mentioned; R-package reference kept verbatim:

```r
# R package wrapping Releases (caption "piggyback package ... uses extensively that idea")
# install.packages("piggyback")
# piggyback::pb_upload("data.tar.gz", repo = "maurolepore/assets", tag = "v1")
# piggyback::pb_download("data.tar.gz", repo = "maurolepore/assets", tag = "v1")
```
