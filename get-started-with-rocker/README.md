# Getting started with the Rocker project

[YouTube video](https://www.youtube.com/watch?v=qY5ForDjgGY)

This document shows how to find the information you need to learn Docker from examples in the wild.

## Run R inside a container ([Rocker project](https://www.rocker-project.org/)):

```bash
docker run --rm -ti rocker/r-base
```

## Reference for `docker run` ([Docker documentation](https://docs.docker.com/engine/reference/run/))

* [General form](https://docs.docker.com/engine/reference/run/#general-form)

```bash
docker run [OPTIONS] IMAGE[:TAG|@DIGEST] [COMMAND] [ARG...]
```

Note `docker run` are obligatory; the rest are optional:

* `--rm`

> By default a container's file system persists even after the container exits. ... If instead you’d like Docker to automatically clean up the container and remove the file system when the container exits, you can add the --rm flag.
-- https://docs.docker.com/engine/reference/run/#clean-up---rm

* `-ti`

> For interactive processes (like a shell), you must use -i -t together ... often written -it.
-- https://docs.docker.com/engine/reference/run/#foreground

