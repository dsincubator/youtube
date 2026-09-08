---
type: source
title: "Tidy EDA: The data-science workflow and toolkit: An overview"
source_file: "0-zQ69P6VsY_tidy-eda-the-data-science-workflow-and-toolkit-an-overview.md"
video_id: "0-zQ69P6VsY"
url: "https://www.youtube.com/watch?v=0-zQ69P6VsY"
lang: en
tags: ["ds-incubator", "ggplot2", "rmarkdown", "workflow", "eda"]
key_topics: ["workflow", "rmarkdown", "ggplot2", "dplyr", "eda"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=0-zQ69P6VsY"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 48
    last_modified: "2021-11-02T00:00:00Z"
usage_window: { from: "2021-11-02T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# Tidy EDA: The data-science workflow and toolkit: An overview

## Summary

The session opens the exploratory data analysis series with an overview of the data-science workflow and the tidyverse toolkit, drawing on Hadley Wickham's R for Data Science, chapter 7. The workflow diagram is presented as import, tidy, then an iterative loop of transform, visualize and model, followed by communicate. Tidy data is introduced with its formal tidyverse definition, emphasizing that once data is tidy the EDA tools can be deployed to generate and answer questions and surface new questions.

The toolkit overview starts with R Markdown as the communication tool. A new R Markdown file is knitted to demonstrate the YAML header, the setup chunk with `echo`, mixing prose and code chunks inserted as ` ```{r}`, the behavior of `echo = TRUE` versus `FALSE`, and the preference for the `github_document` output which knits `.Rmd` to `.md` so GitHub renders it as a web page rather than raw `.html`. The tidyverse is then introduced as a collection of packages attached together with `library(tidyverse)`, bringing `ggplot2` and `dplyr` among others. ggplot2 is taught as the implementation of the Grammar of Graphics: data plus a coordinate system plus a geometric representation yields a plot. The layered template `ggplot(data = diamonds) + geom_bar(mapping = aes(x = cut))` is built up, and the empty plot case is shown to convey that the default is a Cartesian coordinate system. Finally, dplyr is presented as the data-frame player with a small set of verbs, demonstrating `select(cut, price)`, the pipe `%>%` for readable sequential composition versus nesting, and compound examples with `count(cut)` and `filter(n > 10000)`, plus the distinction between running a pipeline and assigning it with `<-` to a new object.

## Key Concepts & Tools Taught

- **[workflow]:** Data-science steps of import, tidy, iterative transform/visualize/model, and communicate, where tidy data unlocks the transform-visualize-model loop and communication captures thinking in writing.
- **[rmarkdown]:** Communication format based on R Markdown files with a YAML header, setup chunk options like `echo`, interleaved prose and ` ```{r}` code chunks, knitting to `github_document` (`.md`) for GitHub-rendered pages versus `html_document`, and mixing text with code and output including figures.
- **[ggplot2]:** Visualization package implementing the Grammar of Graphics (data + coordinate system + geometric representation); key ideas include layered grammar, geoms, mappings, and the template structure.
- **[dplyr]:** Data transformation package whose core verbs operate on data frames; used for selecting columns, counting distinct values and filtering rows, typically composed with the pipe for readability.
- **[eda]:** Exploratory data analysis as an iterative, question-generating practice enabled once data is tidy, supported by dplyr for manipulation and ggplot2 for visual exploration.
- **[tidyverse]:** Collection of packages that together support the workflow steps, attached as a group and whose shared datasets like `diamonds` are used throughout the demos.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```r
library(tidyverse)              # "if i type library titlers / library tie divers ... I get a bunch of packages" — library(tidyverse) ← library titlers / library tie divers
# "the package you know chichi plot2 which is the one that i'm going to be talking about" — ggplot2 ← chichi plot2 / digiblot 2
# "the tool to transform data ... called dplyer for data frame" — dplyr ← deep player / deployer / dplyer / the plier

# R Markdown
# File → New File → R Markdown → Knit / nit → "it's called nit" — knit ← nit
# YAML: output: github_document — "i usually like a different flavor ... called github document" → rmarkdown::github_document ← github document
# ```{r setup, echo = TRUE} — "echo equals true means that you will see code ... inside this code chunks that are defined by bacterique curly braces"
# "if you say equal eco equals false instead of seeing the code and the output you only see the output"

ggplot(data = diamonds) + geom_bar(mapping = aes(x = cut))
# "basically you have to call this function called ggplot and tell it which data set you want to use in this case the dataset diamonds comes with ggplot2"
# "and then you add a new layer by adding the plus symbol ... in the other layer you define the geometric representation that you want in this case i want to represent my data with a bar so i use the geom bar"
# "the idea of mappings ... you know how you map your data to the geometric representation ... we want to put the column called cut on the x axis"
# empty case: ggplot(data = diamonds) → gray empty Cartesian coordinate system

# dplyr and pipe
diamonds                                # "if i just call diamonds and print that to the console ... this data set that has a bunch of variables including cats and including price" — diamonds ← cats (cut mangled)
dplyr::select(diamonds, cut, price)     # "very important verbs that the player contains is the verb select" — select ← select
diamonds %>% select(cut, price)         # "this weird thingy operator is called the pipe" — %>% ← pipe; "you can read that code actually fairly clearly so take the data set diamonds and then select the columns cut and price"
diamonds %>% select(cut, price) %>% count(cut) %>% filter(n > 10000)
# "we take the data set diamonds and then we select the columns cut and price then we count the unique values of the column cut and then we fill there only the rows where the n column ... is greater than ten thousand"
# count ← count ; filter ← fill there (caption "fill there" for filter)
diamonds %>% filter(cut == "Ideal", color == "J")  # "filter rows where cut equals ideal ... also where color equals j"

# Assignment vs pipe iteration
selected <- diamonds %>% select(cut, price)  # "if you run the pipe on pipeline on diamonds it's not assigning it to a new object yet ... you would need to assign that to diamonds or ... called diamonds reshaped"
```
