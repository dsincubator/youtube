---
title: "Getting started with the Rocker project"
description: "Learn how to use Docker and pre-built Rocker container images for reproducible R data science without building images from scratch."
date: "2021-04-14"
categories:
  - docker
  - rocker
  - reproducibility
---

Welcome to the DS Incubator! Today we kick off a new series focused on working with Docker for reproducible research, software development, and data analysis. Rather than focusing on how to build custom Docker images from scratch—which is a topic on its own—our focus is on using pre-built images provided by the Rocker project.

KISS is our guiding principle: keep it simple and practical by leveraging existing tools to enhance our daily data science workflows.

This is for anyone who wants to use Docker containers to run R and reproducible analysis environments without getting bogged down in complex image configuration.

**Objectives:**

1. Find and explore the material repository (`ds.docker`) for the session.
2. Run R inside a container using pre-built Rocker images.
3. Understand essential `docker run` options such as `--rm` and `-ti`.

## Introducing Rocker: Docker Images for R

The Rocker project—whose name combines Docker and R—provides a fantastic collection of pre-built container images specifically tailored for R users. Instead of configuring system dependencies and R versions manually on your machine, you can pull a ready-to-use environment maintained by the community.

## Exploring the Rocker Project Resources

The Rocker project documentation provides everything you need to know about getting started, from base R images to version-specific environments and RStudio Server setups.

![Browsing the official Rocker project documentation and repository](images/video_02_rocker-website.jpg)

## Running R Inside a Container

To test our setup and run R immediately inside an isolated container, we use a simple `docker run` command with the base Rocker image:

```bash
docker run --rm -ti rocker/r-base
```

![Running R inside a container using docker run](images/video_03_run-r-container.jpg)

## Understanding `docker run` Syntax and Options

The `docker run` command structure consists of obligatory parameters followed by optional flags. Understanding options like `--rm` (which automatically cleans up the container file system upon exit) and `-ti` (which allocates a pseudo-TTY and keeps STDIN open for interactive processes) is essential for smooth container interaction.

![Reviewing docker run syntax and parameters](images/video_04_docker-run-syntax.jpg)

## Interactive Terminal Sessions with R

Using `-ti` with `docker run` opens an interactive terminal session where you can directly execute R commands from the console, examine session information, and interact with your analysis environment.

![Interacting with the R console inside the container terminal](images/video_05_interactive-terminal.jpg)

## Takeaways

Working with Docker through the Rocker project lets you spin up clean, reproducible R environments in seconds. By leveraging pre-built images rather than building your own from scratch, you can immediately focus on data analysis while ensuring complete reproducibility.

![Takeaways on using pre-built Rocker containers](images/video_05_interactive-terminal.jpg)

## Resources
- [Getting started with the Rocker project material](https://github.com/2DegreesInvesting/ds.docker/blob/main/01_get-started-with-rocker/README.md)
- [Meetup on YouTube](https://www.youtube.com/watch?v=qY5ForDjgGY)
- [Rocker Project](https://www.rocker-project.org/)
- [Docker run reference documentation](https://docs.docker.com/engine/reference/run/)
- [Docker documentation](https://docs.docker.com/)
