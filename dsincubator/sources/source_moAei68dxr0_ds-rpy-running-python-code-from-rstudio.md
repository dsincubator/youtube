---
type: source
title: "ds.rpy: Running Python code from RStudio"
source_file: "moAei68dxr0_ds-rpy-running-python-code-from-rstudio.md"
video_id: "moAei68dxr0"
url: "https://www.youtube.com/watch?v=moAei68dxr0"
lang: en
tags: ["ds-incubator", "r-packages", "python", "rmarkdown", "cran"]
key_topics: ["reticulate", "r-markdown", "python-chunks", "anaconda-conda", "python-environments", "spacy-language-model"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=moAei68dxr0"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 373
    last_modified: "2022-07-26T00:00:00Z"
usage_window: { from: "2022-07-26T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# ds.rpy: Running Python code from RStudio

## Summary

Motivated by a collaboration with Miria, the speaker — whose team is primarily fluent in RStudio but occasionally needs Python — explores how to run Python code from RStudio without switching IDEs, including the desire to intermix R and Python in the same report. The demo repo folder `01_demo` contains both an R Markdown document and a standalone `.py` script with realistic Python code that depends on several packages. Out of the box, R Markdown documents with a `python` engine do not knit until the R package `reticulate` is installed (`install.packages("reticulate")`); once installed, a chunk header `{python}` replaces `{r}` and executes. Interactively, sending a Python line with Ctrl+Enter triggers `reticulate` to render the usual R console prompt `>` into a Python console (`>>>`) and run code line-by-line; `source("script.py")` also executes the whole script (noting that `print()` behaved differently interactively versus via `source()`). The main friction reported is locating the correct Python binary and its associated packages. Python tolerates multiple versions/distributions and per-project environments, unlike R's usual single global library, so RStudio must be told which interpreter to use. Standard Python installers (`pip install`, `conda install`) run from the system shell, not from the Python console, and package sources vary (PyPI via pip, conda channels, conda-forge). The `renv`-like isolation that `reticulate` offers via `virtualenv` and `conda` helpers was attempted but failed; the reliable workaround was setting the environment variable `RETICULATE_PYTHON` (caption "reticulate underscore python") in a project `.Renviron` file pointing to the Anaconda installation (`~/anaconda3/bin/python`), which Anaconda bundles together with R, RStudio and ~7500 Python packages. One remaining manual step was installing the `spaCy` language model `en_core_web_sm` (caption "spacey ... spicy model n core web sm") via `conda install` from `conda-forge`, required for the example script. Miria confirms her failure stemmed from not forcing `RETICULATE_PYTHON` to point at the Anaconda distribution, and discussion closes on tooling and documentation gaps that still make the first 3–4 hours of setup painful versus an ideal 10-minute experience.

## Key Concepts & Tools Taught

- **[reticulate]:** R package bridging R and Python; back-end that auto-launches a Python console and enables `python` engine in R Markdown (caption "package called reticulate", "the back end of this interface between python and r").
- **[r-markdown]:** Document format combining prose and code chunks; `r` chunks versus `python` engine chunks once `reticulate` is present (caption "our markdown" → R Markdown, "code and the pros is differentiated by chunks").
- **[python-chunks]:** Using chunk header `{python}` (caption "you can also use the engine python ... instead of saying r here what you say is python") to run Python code inside an `.Rmd`, and keeping equivalent `.py` file (`dot pi` extension) runnable via Ctrl+Enter or `source()`.
- **[anaconda-conda]:** Distribution and package manager that bundles Python, R, RStudio and thousands of packages (caption "project in python that is called anaconda ... contains python itself it also distributes r and r studio ... more than ... 7500 packages python packages").
- **[python-environments]:** Per-project isolated environments and the challenge of selecting the interpreter; `reticulate` helpers for virtualenv/conda and the overriding environment variable `RETICULATE_PYTHON` (caption "reticulate underscore python ... environment variable ... python binary", helpers `install_python`, `virtualenv`, `conda_install` with `forge` argument).
- **[spacy-language-model]:** Specific model dependency in the example script (caption "spacey package ... language module ... spicy model n core web sm" → normalized `spaCy` + `en_core_web_sm`; tool `conda` with `conda-forge`).

## Code Snippets & Formulas

```r
# Prerequisite for Python in R Markdown (caption "install reticulate")
install.packages("reticulate")
library(reticulate)

# R Markdown: Python chunk header (caption "you can also use the engine python")
# ```{python}
# import spacy  # example import in demo script
# print("hello from python")
# ```

# Interactive execution: place cursor on Python line and press Ctrl+Enter
# -> reticulate auto-prints wrapper and turns `>` into Python `>>>` console
# source() the equivalent .py script
source("01_demo/script.py")  # caption "if i source it it does print the output"

# Force RStudio/reticulate to use the Anaconda interpreter
# In .Renviron (project-level):
RETICULATE_PYTHON=~/anaconda3/bin/python  # caption "reticulate underscore python ... anaconda3 and there is python"
# alternatively in R:
Sys.setenv(RETICULATE_PYTHON = "~/anaconda3/bin/python")
reticulate::py_config()  # inspect which python is active

# reticulate environment helpers mentioned (caption "reticulate has a bunch of very good tools to manage those environments")
reticulate::install_python(version = "3.10")
reticulate::virtualenv_create("r-reticulate")
reticulate::conda_install(envname = "base", packages = "spacy", forge = TRUE)  # caption "conda installed ... it has a forged argument ... set to true"
reticulate::py_install("pandas", pip = TRUE)
```

```bash
# Shell-level Python package installation (caption "you would go to a terminal and do ... honda install or pip install")
conda install -c conda-forge spacy
conda install -c conda-forge en_core_web_sm  # caption "this model ... within the spacey package ... conda forge"
# or
pip install spacy
python -m spacy download en_core_web_sm
```
