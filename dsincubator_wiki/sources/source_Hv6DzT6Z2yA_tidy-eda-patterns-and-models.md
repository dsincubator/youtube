---
type: source
title: "Tidy EDA: Patterns and models"
source_file: "Hv6DzT6Z2yA_tidy-eda-patterns-and-models.md"
video_id: "Hv6DzT6Z2yA"
url: "https://www.youtube.com/watch?v=Hv6DzT6Z2yA"
lang: en
tags: ["ds-incubator", "r-packages", "ggplot2", "eda"]
key_topics: ["patterns", "models", "linear-model", "residuals", "covariation"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=Hv6DzT6Z2yA"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 42
    last_modified: "2021-12-21T00:00:00Z"
usage_window: { from: "2021-12-21T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# Tidy EDA: Patterns and models

## Summary

Final meetup of the 2021 tidyverse EDA series, covering patterns and models as tools to extract structure from data. The framing defines variation as adding uncertainty and covariation/patterns as reducing it; models extract patterns so the remaining variation can be inspected. Questions drawn from R for Data Science guide exploration: how to describe the relationship, whether the pattern could arise by chance, how strong it is, what other variables affect it, and whether it changes in subgroups.

Warm-up uses the built-in `faithful` dataset (`eruptions` = duration of eruption, `waiting` = waiting time). A scatter plot `ggplot(faithful, aes(x=eruptions, y=waiting)) + geom_point` shows longer waits associated with longer eruptions plus two clusters. The linear trend is extracted with `lm(waiting ~ eruptions, data=faithful)` and `modelr::add_residuals`, adding a `resid` column; plotting `eruptions` versus `resid` removes the diagonal line but leaves the clustering, demonstrating that the model captured the dominant linear covariation.

The main case revisits the unexpected `diamonds` relationship where `cut` (quality) versus `price` suggests fair (worst quality) diamonds are more expensive on average. The presenter shows this is confounded by `carat` (weight): `cut` versus `carat` reveals bigger diamonds tend to be worse quality, and `carat` versus `price` is strongly positive. To standardize for size, a model `lm(log(price) ~ carat, data=diamonds)` is fitted, `add_residuals` is applied and `exp(resid)` is computed to revert the log, yielding a size-adjusted price. Plotting `cut` versus that residual price restores the expected relationship—better cut costs more for a given weight—illustrating how models clarify relationships among three variables.

## Key Concepts & Tools Taught

- **[patterns]:** Observable covariation that reduces uncertainty; assessed by describing the relationship, its strength, and whether it could be coincidence.
- **[models]:** Tools for extracting a pattern from data so the residuals reveal what remains; used to remove the effect of a third variable.
- **[linear-model]:** Simple regression fitted with `lm(y ~ x, data)` (`lm(waiting ~ eruptions)` and `lm(log(price) ~ carat)`); takes a formula and data as the only required arguments.
- **[residuals]:** What is left after removing the modeled pattern, added with `modelr::add_residuals` into a new column `resid` (caption "receipt") and transformed back with `exp()` when the model used `log()`.
- **[covariation]:** Relationship between two variables—positive linear between `eruptions` and `waiting`, and confounded triad among `price`, `cut`, and `carat`—disentangled by modelling one covariation and inspecting the others on residuals.

## Code Snippets & Formulas

Spoken calls dictated live (caption-mangled, normalized here):

```r
library(tidyverse)                          # "we're going to attach the tigers as we usually do which comes with deep player and ggplot2"
library(modelr)                             # "plus model r which does not come with the television by default ... model r is just a very simple tool"

faithful |> glimpse()                       # "if i glimpse that ... data set faithful ... only two columns eruptions and waiting"
ggplot(faithful, aes(x = eruptions, y = waiting)) +
  geom_point()                              # "scatter plot which in ggplot2 ... you can do with a geometric representation called points so the geom point"

mod <- lm(waiting ~ eruptions, data = faithful) # "very simple linear model lm ... takes first a formula then a bunch of other arguments and finally data ... y variable here is price? waiting and x is eruptions"
faithful2 <- faithful |>
  add_residuals(mod)                        # "we're gonna be using that package ... to take the residuals of that model and add them to the data ... by calling this function here" — adds column resid "receipt"
ggplot(faithful2, aes(x = eruptions, y = resid)) +
  geom_point()                              # "we're going to plot eruptions versus residuals with a scatter plot ... what remains after we have extracted the pattern"

# diamonds confounded example
ggplot(diamonds, aes(x = cut, y = price)) + geom_boxplot()  # implied: "if we just plot quality versus price we see ... fair diamonds which are the ones of worst quality on average they seem more expensive"
ggplot(diamonds, aes(x = cut, y = carat)) + geom_boxplot()  # "here what we are plotting is cat which is the quality and karat which is the weight"
ggplot(diamonds, aes(x = carat, y = price)) + geom_point()

mod2 <- lm(log(price) ~ carat, data = diamonds) # "model is going to be ... we're using the log of price ... y variable here is price and the x variable ... is carat so the size"
diamonds2 <- diamonds |>
  add_residuals(mod2) |>
  mutate(resid = exp(resid))                # "we're going to do the exponential of it so kind to revert the effect of the transformation and that way we'll have things in the same unit"
ggplot(diamonds2, aes(x = cut, y = resid)) + geom_boxplot() # "if we plot quality now versus this residual price we see ... better diamonds are more expensive"
```
