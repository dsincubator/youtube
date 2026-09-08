---
type: Reference
title: GitHub Access Permissions
description: Managing organization access, permissions for GitHub organizations, and
  security best practices
lang: en
tags:
- ds-incubator
generated:
  by: agent:okf-wiki-builder/1.0
  at: '2026-09-08T04:00:00Z'
status: draft
sources:
- id: CvOVn2zwi3k
  resource: https://www.youtube.com/watch?v=CvOVn2zwi3k
  title: 'Docker: Using volumes and managing users'
  author: process:yt-dlp
  usage_count: 198
  last_modified: '2021-09-28T00:00:00Z'
- id: MJZ7ZsfG5lM
  resource: https://www.youtube.com/watch?v=MJZ7ZsfG5lM
  title: Wrapping up our discussion on how to manage and use data
  author: process:yt-dlp
  usage_count: 6
  last_modified: '2020-05-26T00:00:00Z'
- id: NF7HPKt55Yk
  resource: https://www.youtube.com/watch?v=NF7HPKt55Yk
  title: 'cloud: Use cases'
  author: process:yt-dlp
  usage_count: 25
  last_modified: '2022-06-07T00:00:00Z'
- id: NuXgJtl9QDw
  resource: https://www.youtube.com/watch?v=NuXgJtl9QDw
  title: terminal. Running commands as administrator
  author: process:yt-dlp
  usage_count: 37
  last_modified: '2022-05-24T00:00:00Z'
- id: OFjlPa7Uqeo
  resource: https://www.youtube.com/watch?v=OFjlPa7Uqeo
  title: Comparing remote setup “Ours” versus "Fork (of ours)"
  author: process:yt-dlp
  usage_count: 101
  last_modified: '2020-08-25T00:00:00Z'
- id: jyBv5ITO718
  resource: https://www.youtube.com/watch?v=jyBv5ITO718
  title: 'terminal: Create a custom command as a user in a multi-user system'
  author: process:yt-dlp
  usage_count: 16
  last_modified: '2022-05-17T00:00:00Z'
- id: xW05GsfhuiY
  resource: https://www.youtube.com/watch?v=xW05GsfhuiY
  title: 'wtf: Name and organize files'
  author: process:yt-dlp
  usage_count: 36
  last_modified: '2022-02-22T00:00:00Z'
- id: yldd8trFbaQ
  resource: https://www.youtube.com/watch?v=yldd8trFbaQ
  title: 'cloud: Resize data storage and share data with pins'
  author: process:yt-dlp
  usage_count: 22
  last_modified: '2022-06-21T00:00:00Z'
- id: z4RAuGrAm8c
  resource: https://www.youtube.com/watch?v=z4RAuGrAm8c
  title: Access permissions for a GitHub organization
  author: process:yt-dlp
  usage_count: 4440
  last_modified: '2019-11-26T00:00:00Z'
---

# GitHub Access Permissions

## Overview

Organization access is introduced as least-privilege: teams → roles (Read/Triage/Write/Maintain/Admin) → repo access, plus token scopes. Anchor is [source_z4RAuGrAm8c](../../sources/source_z4RAuGrAm8c_access-permissions-for-a-github-organization.md); supporting context from multi-user terminal ([source_jyBv5ITO718](../../sources/source_jyBv5ITO718_terminal-create-a-custom-command-as-a-user-in-a-multi-user-system.md), [source_NuXgJtl9QDw](../../sources/source_NuXgJtl9QDw_terminal-running-commands-as-administrator.md)) and `pins` cloud sharing ([source_yldd8trFbaQ](../../sources/source_yldd8trFbaQ_cloud-resize-data-storage-and-share-data-with-pins.md)).

Org work in [GitHub Workflow](../git/github-workflow.md) and [GitHub Issues Workflow](../data/github-issues-workflow.md); host users in [Terminal Setup](../terminal/terminal-setup.md).

## Key Concepts

- **Org structure** ([source_z4RAuGrAm8c](../../sources/source_z4RAuGrAm8c_access-permissions-for-a-github-organization.md)): Organization → Teams (e.g., `ds-incubator`) → Repos; invite via `People → Invite member`, team-scoped permissions.
- **Roles** ([source_z4RAuGrAm8c](../../sources/source_z4RAuGrAm8c_access-permissions-for-a-github-organization.md)): Read (clone), Triage (manage issues), Write (push branches), Maintain (manage settings without owner), Admin (full); prefer Write via PR, Admin only for owners.
- **Team sync** ([source_z4RAuGrAm8c](../../sources/source_z4RAuGrAm8c_access-permissions-for-a-github-organization.md)): team `Write` on `ds-incubator/*` inherits to new repos; outside collaborators get single-repo invites.
- **Tokens & host** ([source_z4RAuGrAm8c](../../sources/source_z4RAuGrAm8c_access-permissions-for-a-github-organization.md), [source_NuXgJtl9QDw](../../sources/source_NuXgJtl9QDw_terminal-running-commands-as-administrator.md)): `GITHUB_PAT` scope `repo` for `gh CLI`/`pins`; multi-user host uses `sudo` + `--privileged` not shared PAT — see [Terminal Setup](../terminal/terminal-setup.md).
- **Audit** ([source_z4RAuGrAm8c](../../sources/source_z4RAuGrAm8c_access-permissions-for-a-github-organization.md)): Org Settings → Audit log, remove via `People → Manage`; see [GitHub Workflow](../git/github-workflow.md).

## Example

```bash
# org setup (GitHub UI)
# Org Settings -> People -> Invite member -> Team ds-incubator (Write)
# Repo Settings -> Manage access -> Add team Write
gh auth login --with-token < GITHUB_PAT  # scope repo
```
```bash
# host multi-user (not GitHub)
sudo chown -R rstudio:rstudio /home/rstudio
sudo usermod -aG docker $USER
```

## Sources

| Video | Title | Views | Last Modified |
|---|---|---|---|
| [CvOVn2zwi3k](https://www.youtube.com/watch?v=CvOVn2zwi3k) | [Docker: Using volumes and managing users](../../sources/source_CvOVn2zwi3k_docker-using-volumes-and-managing-users.md) | 198 | 2021-09-28T00:00:00Z |
| [MJZ7ZsfG5lM](https://www.youtube.com/watch?v=MJZ7ZsfG5lM) | [Wrapping up our discussion on how to manage and use data](../../sources/source_MJZ7ZsfG5lM_wrapping-up-our-discussion-on-how-to-manage-and-use-data.md) | 6 | 2020-05-26T00:00:00Z |
| [NF7HPKt55Yk](https://www.youtube.com/watch?v=NF7HPKt55Yk) | [cloud: Use cases](../../sources/source_NF7HPKt55Yk_cloud-use-cases.md) | 25 | 2022-06-07T00:00:00Z |
| [NuXgJtl9QDw](https://www.youtube.com/watch?v=NuXgJtl9QDw) | [terminal. Running commands as administrator](../../sources/source_NuXgJtl9QDw_terminal-running-commands-as-administrator.md) | 37 | 2022-05-24T00:00:00Z |
| [OFjlPa7Uqeo](https://www.youtube.com/watch?v=OFjlPa7Uqeo) | [Comparing remote setup “Ours” versus "Fork (of ours)"](../../sources/source_OFjlPa7Uqeo_comparing-remote-setup-ours-versus-fork-of-ours.md) | 101 | 2020-08-25T00:00:00Z |
| [jyBv5ITO718](https://www.youtube.com/watch?v=jyBv5ITO718) | [terminal: Create a custom command as a user in a multi-user system](../../sources/source_jyBv5ITO718_terminal-create-a-custom-command-as-a-user-in-a-multi-user-system.md) | 16 | 2022-05-17T00:00:00Z |
| [xW05GsfhuiY](https://www.youtube.com/watch?v=xW05GsfhuiY) | [wtf: Name and organize files](../../sources/source_xW05GsfhuiY_wtf-name-and-organize-files.md) | 36 | 2022-02-22T00:00:00Z |
| [yldd8trFbaQ](https://www.youtube.com/watch?v=yldd8trFbaQ) | [cloud: Resize data storage and share data with pins](../../sources/source_yldd8trFbaQ_cloud-resize-data-storage-and-share-data-with-pins.md) | 22 | 2022-06-21T00:00:00Z |
| [z4RAuGrAm8c](https://www.youtube.com/watch?v=z4RAuGrAm8c) | [Access permissions for a GitHub organization](../../sources/source_z4RAuGrAm8c_access-permissions-for-a-github-organization.md) | 4440 | 2019-11-26T00:00:00Z |

## References

- GitHub Docs — Organization permissions and roles
- GitHub Docs — Managing team access

