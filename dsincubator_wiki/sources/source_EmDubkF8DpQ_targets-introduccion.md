---
type: source
title: "targets: Introducción"
source_file: "EmDubkF8DpQ_targets-introduccion.md"
video_id: "EmDubkF8DpQ"
url: "https://www.youtube.com/watch?v=EmDubkF8DpQ"
lang: es
tags: ["ds-incubator", "targets", "pipelines"]
key_topics: ["targets", "pipelines", "caching"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=EmDubkF8DpQ"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2021-02-02T00:00:00Z"
    usage_count: 73
usage_window: { from: "2021-02-02T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# targets: Introducción

## Summary

Sesión en español que introduce el paquete targets como herramienta para código lento, continuando la charla previa con Will Landau. El presentador parte de un proyecto vacío de RStudio, carga el paquete y usa el ayudante de configuración para crear el archivo `_targets.R` y abrirlo para inspeccionar su anatomía. El video recorre la evolución de una secuencia de scripts hacia un pipeline de funciones, muestra cómo definir funciones en `R/functions.R` y referenciarlas con `source`, y cómo declarar paquetes globales que aplican a todos los targets.

El núcleo es el concepto de pipeline: una lista de targets nombrados donde cada expresión se guarda con un nombre (`data`, `summary`) y `tar_make()` ejecuta las expresiones en orden de dependencias almacenando resultados en `_targets/`. Los resultados se leen con `tar_read()` o se cargan con `tar_load()`, y ayudas visuales como `tar_glimpse()` y `tar_visnetwork()` muestran el estado de la red. El beneficio demostrado es el caché: al re-ejecutar `tar_make()` se saltan los targets actualizados y solo se recomputa lo desactualizado; al añadir `Sys.sleep()` a la función `sum()` del target `summary`, solo ese branch se vuelve a correr mientras `data` se saltea. Cierra integrando el pipeline a un reporte R Markdown con `tar_read()` y con un target que renderiza el reporte, y remite al manual de targets para profundizar.

## Key Concepts & Tools Taught

- **[targets / targets]:** paquete de R para gestionar cómputos largos como un pipeline de objetos nombrados y almacenados, en lugar de una secuencia de scripts.
- **[pipelines / pipelines]:** lista de targets donde cada uno es un objeto nombrado definido por código R; aquí `data` construye un data frame y `summary` / `amar es` depende de `data` y de la función `sum` / `sham wm`.
- **[caching / caching]:** targets guarda cada resultado en disco y salta la recomputación cuando nada que afecta al target cambió; solo las ramas desactualizadas se re-ejecutan, ahorrando tiempo en código lento.
- **[tar_make / tar_make]:** función que lee `_targets.R` y ejecuta el pipeline, corriendo cada target cuyo trabajo necesita hacerse.
- **[tar_read / tar_read]:** función para recuperar un target terminado desde el almacén hacia la consola o un reporte.
- **[Estructura del proyecto]:** mover funciones a `R/functions.R` y traerlas con `source`, declarar `packages` globales y también a nivel de target individual, y organizar `_targets.R` en llamadas a librería, importación de funciones, opciones y lista de targets.

## Code Snippets & Formulas

Llamadas dictadas en vivo (mangleado en subtítulos, normalizado aquí):

```r
library(targets)                # "hacemos library y ya tenemos acceso a todas las funciones de targets" — library(targets) ← hacemos library
tar_script()                    # "tal script te ayuda a sentir un nuevo repositorio a configurarlo" — tar_script ← tal script
tar_edit()                      # "existe la función de ajustar así que va a abrir el archivo" — tar_edit ← ajustar
tar_make()                      # "simplemente podemos correr la función tal mail" / "dar make" — tar_make ← tal mail
tar_read("summary")             # "podemos usar la función flip ... en este caso ... llamar por ejemplo a esta madre como samar" / "llamar 70 puede ser estar dadas para hacer gentes" → "ri p summer" — tar_read ← tar read / flip
tar_load("data")                # "si yo hubiera hecho tar loud se comporta cómo se comporta la función lo normal" — tar_load ← tar loud
tar_glimpse()                   # "estalvis network funciona muy parecida network viene de visualizar" — tar_glimpse ← stalvis
tar_visnetwork()                # "tarvis network ... nos da más información sobre que está actualizado" — tar_visnetwork ← tarvis network
tar_outdated()                  # "si por ejemplo ahora todos los targets son actualizados porque también corrió sin suicidarme ... representar a ustedes para saber si hay un target y está desactualizado" — tar_outdated ← está desactualizado
source("R/functions.R")         # "podríamos hacer eso ... crear un nuevo archivo llamado funciones" / "hacemos todos entonces de esta forma llamamos scripts externos" — source ← hacemos todos
Sys.sleep(5)                    # "si nosotros hiciéramos sistema si existe un miedo por ciento segundos por ejemplo salud haríamos un cambio" — Sys.sleep ← sistema si existe un miedo
```
