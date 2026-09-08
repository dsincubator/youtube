---
type: source
title: "cloud: More ways to move data"
source_file: "VRG95a4aBW4_cloud-more-ways-to-move-data.md"
video_id: "VRG95a4aBW4"
url: "https://www.youtube.com/watch?v=VRG95a4aBW4"
lang: en
tags: ["ds-incubator", "containers", "docker", "cloud", "terminal"]
key_topics: ["ssh", "scp", "docker-volumes", "bind-mount", "named-volume", "chown", "digitalocean"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=VRG95a4aBW4"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 30
    last_modified: "2022-07-12T00:00:00Z"
usage_window: { from: "2022-07-12T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# cloud: More ways to move data

## Summary

A hands-on session in the cloud series covering general-purpose data movement between a local machine, a remote server (DigitalOcean droplet) and Docker containers, complementing the prior `gh CLI` / GitHub-releases approach with lower-level, more portable techniques.

The first half assumes an `SSH` key linking the local computer and the remote droplet (setup via *Account → Security → Add SSH key* on DigitalOcean, with a droplet IP such as `docker wound...`). Demo data is prepared locally with `mkdir /tmp/data && cd /tmp/data && touch a.csv b.csv && ls data`. Transfer to the server is shown with `scp -r data root@<IP>:/tmp` (captioned `s copy that is secure copy that is what uses the ssh key` and `recursively the data folder`), verified with `ls /tmp/data` over SSH. The reverse direction is `scp -r root@<IP>:/tmp/data ~/Downloads` from the local terminal; the speaker notes `SSH` provides encrypted, secure transit if intercepted.

The second half covers Docker volumes as the Docker-recommended way to share data between host and containers, and between containers. Two bind-type concepts are contrasted: a **bind mount** where host path maps to container path (e.g., `/bind_mount:/home/rstudio/bind_mount`) and a **named volume** managed entirely by Docker (`my_volume:/home/rstudio/my_volume`) where the host location is not specified and is therefore portable across hosts. Demo containers are `rocker/verse` with `docker run --name my_container -d --rm -v my_volume:/home/rstudio/my_volume -v /bind_mount:/home/rstudio/bind_mount -e PASSWORD=... -p 8787:8787 --privileged` logic (password and `-p 8787:8787` mapping, `--privileged`/`ROOT=TRUE` to allow `sudo`). The named volume is inspected with `docker volume ls` and the bind mount with `ls /bind_mount`; both appear empty. Inside RStudio Server's terminal the bind mount initially requires `sudo touch bind_mount/a.csv` (permission denied otherwise), fixed globally with `sudo chown -R rstudio:rstudio /home/rstudio` (captioned `change the ownership of anything recursively inside home ... r studio our studio ... colon ...` with a typo `arts studio` corrected). After fixing, `touch bind_mount/a.csv` and `touch my_volume/b.csv` succeed. Bidirectional sharing is proven by creating `a.csv` inside the container and seeing it from the server via `ls /bind_mount`, then creating `c.csv` on the server and seeing it inside the container. Cross-container sharing uses the same named volume: a second interactive container `docker run -ti --rm -v my_volume:/my_volume bash` mounts the existing named volume at `/my_volume`; `ls /my_volume` shows `b.csv` created in the first container, demonstrating container-to-container sharing without touching the host filesystem.

## Key Concepts & Tools Taught

- **[ssh]:** `ssh` ← `ssh is just a command line tool that allows you to say okay who is the user that's going to connect to a server ... user is going to be root and ... the address of that remote computer` — `ssh root@<IP>` establishes the encrypted channel; `scp`/`ssh` depend on an `SSH` key added under DigitalOcean *Security → Add SSH key*.
- **[scp]:** `scp` ← `s copy that is secure copy that is what uses the ssh key ... securely copy recursively the data folder` / `s copy because we're going to copy not just one file but an entire directory ... need to call recursively` — `scp -r data root@<IP>:/tmp` (local → remote) and `scp -r root@<IP>:/tmp/data ~/Downloads` (remote → local); the `r` flag copies whole directories.
- **[docker-volumes]:** Docker Volumes — Docker's preferred mechanism to share/persist data between containers and between host and containers; recommended reading link provided in the meetup.
- **[bind-mount]:** `bind mount` ← `another volume is is called a bind mount basically how to explicitly say where in the host computer that volume leaves ... at the root ... folder is going to be called bind mount` — `-v /bind_mount:/home/rstudio/bind_mount` maps an explicit host path; sharing is verified by `touch` on one side and `ls` on the other.
- **[named-volume]:** `named volume` ← `the other flavor ... you only say where the folder will live in the container but you don't specify any location on the host ... just say name ... that directory that is going to be managed entirely by docker ... delegating the responsibility ... data is more portable` — `-v my_volume:/home/rstudio/my_volume`; inspected via `docker volume ls`; shared across containers by re-mounting the same name.
- **[chown]:** `chown` ← `use sudo to act as the administrator only once and then just change the ownership ... ch own change the ownership of anything recursively inside home rstudio ... r studio our studio because our studio is actually two things it's the ... group ... colon ... r studio colon rstudio` — `sudo chown -R rstudio:rstudio /home/rstudio` fixes permission-denied writes to bind mounts.
- **[digitalocean]:** DigitalOcean droplet as the remote `host` (IP-based address, e.g. `docker wound blah blah`), with project/droplet creation and `ssh root@<IP>` login pattern.

## Code Snippets & Formulas

Spoken commands dictated live (caption-mangled, normalized here):

```sh
# prepare fake data locally
mkdir /tmp/data && cd /tmp/data   # "mkdir ... temp directory already exists ... but data doesn't"
touch a.csv b.csv; ls data        # "i'm going to touch some data ... a dot csv and b dot csv"

# connect to droplet
ssh root@<DROPLET_IP>              # "ssh is just a command ... user root at the address of that remote computer ... number that you see here is the address"
# DigitalOcean: Account -> Security -> Add SSH key  # "if you already have an account in digitalocean ... add ssh key ... instructions ... creating that connection"

# local -> remote
scp -r data root@<IP>:/tmp         # "we securely copy recursively the data folder ... as the user root at the address ... column slash tmp ... copy data to the tmp directory"
# verify on remote: ls /tmp/data  # shows a.csv b.csv

# remote -> local (run from local terminal)
scp -r root@<IP>:/tmp/data ~/Downloads   # "copy from the server ... to ... home directory ... downloads ... we're copying things in a secure way so s copy"

# docker volumes on the droplet
docker volume ls                  # "docker volume ... list the volumes ... named docker volume ... already exists"
ls /bind_mount; ls /              # "if i do an ls on root ... by mount the volume exists ... getting no output means that the directory exists but is empty"

# run rocker/verse with both volume types (reconstructed from narration)
docker run --name my_container -d --rm \
  -v my_volume:/home/rstudio/my_volume \
  -v /bind_mount:/home/rstudio/bind_mount \
  -e PASSWORD=... -p 8787:8787 -e ROOT=TRUE \
  rocker/verse
docker ps                         # confirm "my container container already running"
# browser: http://<IP>:8787  user: rstudio  pass: ...  # "i mapped it to the port 8787 ... log into our studio"

# inside container terminal (home = /home/rstudio)
sudo touch bind_mount/a.csv       # "i will try to create a new file with the command touch ... inside the bind mount ... a dot csv ... it will fail ... only the root could write"
sudo chown -R rstudio:rstudio /home/rstudio  # "use sudo to act ... change the ownership ... recursively inside home rstudio ... r studio colon rstudio ... i committed a typo arts studio"
touch bind_mount/a.csv            # now succeeds without sudo
touch my_volume/b.csv
ls bind_mount; ls my_volume

# verify from server
ls /bind_mount                    # shows a.csv after container created it

# create from server, see in container
touch /bind_mount/c.csv
# in container: ls bind_mount    # shows c.csv

# share named volume to a second container
docker run -ti --rm -v my_volume:/my_volume bash  # "create a new container ... ti means interactive ... volume already exists ... that volume will actually with its contents populate the new container ... at the root ... only runs bash"
ls /my_volume                      # shows b.csv — moved data from one container to another via named volume
```
