---
type: source
title: "Evita solicitudes de fusion interdependientes"
source_file: "hs_Pzxny7XE_evita-solicitudes-de-fusion-interdependientes.md"
video_id: "hs_Pzxny7XE"
url: "https://www.youtube.com/watch?v=hs_Pzxny7XE"
lang: es
tags: ["ds-incubator", "git"]
key_topics: ["interdependent-pull-requests", "git-branching", "squash-merge", "pr-sync", "subtle-conflicts"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=hs_Pzxny7XE"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2019-11-12T00:00:00Z"
    usage_count: 13
usage_window: { from: "2019-11-12T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Evita solicitudes de fusion interdependientes

## Summary

La charla demuestra por qué conviene evitar solicitudes de fusión interdependientes y qué problemas sutiles aparecen cuando no se puede evitar. El escenario de partida es un contribuidor que abre una PR 1 desde master, y antes de que sea fusionada abre una PR 2 desde la punta de PR 1. Desde la perspectiva del mantenedor, PR 1 se revisa, se renombra la función `f` a `mi f` y el archivo `f.R` a `mi_f.R`, y se fusiona a master con squash merge reescribiendo el mensaje con número de PR, agradecimiento y firma.

Al sincronizar PR 2 con el nuevo master no hay conflicto en el sentido estricto de git, pero sí un conflicto de intención: ahora coexisten `f.R` con `f()` (commit original de PR 2) y `mi_f.R` con `mi f()` (commit que vino de master). El video muestra cómo limpiar esa PR 2 moviendo la nueva función `g` (que llamaba a `f`) de `f.R` a `mi_f.R`, editándola para que llame a `mi f`, y borrando `f.R`, para luego hacer `pr_push` con tres commits. Tras el segundo squash merge, la historia queda lineal con un commit por PR, y el contribuidor cierra el ciclo con `pr_finish` (cambiar a master, pull y borrar la rama local).

Todo el flujo se opera con el paquete justice (alias didáctico de usethis/github helpers) partiendo de un fork clonado localmente.

## Key Concepts & Tools Taught

- **[Solicitudes interdependientes / interdependent-pull-requests]:** abrir PR 2 desde la punta de PR 1 antes de que PR 1 sea fusionada genera duplicación y trabajo extra de limpieza aunque git no marque conflicto.
- **[Ramas / git-branching]:** cada PR vive en su rama (`pr1`, `pr2`); crear la segunda desde un padre que no es master dispara la advertencia de justice ("desde un padre que no sea la rama master").
- **[Squash merge / squash-merge]:** la mantenedora colapsa los commits de cada PR en un único commit en master, reescribiendo el mensaje para añadir número de PR, usuario contribuidor, agradecimiento y firma.
- **[Sincronización de PR / pr-sync]:** tras fusionar PR 1, el contribuidor sincroniza PR 2 con master (`pr_sync` / `pr-5`) para traer los cambios del repositorio fuente antes de limpiar.
- **[Conflictos sutiles / subtle-conflicts]:** duplicación de archivos `f.R` y `mi_f.R` sin conflicto git automático, que exige mover `g`, actualizar la llamada de `f` a `mi f` y borrar `f.R`.

## Code Snippets & Formulas

Llamadas dictadas en vivo (fragmentos de caption mangled + forma normalizada):

```r
library(justice)  # "la primer llamada que tenemos que hacer es library justice" — library justice ← library justice

# Crear fork y clon local — "hacer click en el botón folks ... luego hacer un clon local copiando la dirección"
# "una función del paquete ilustres esta función se llama create from here hub"
create_from_github()  # "create from here hub" ← create from here hub

# Iniciar PR (nombre de rama asociado)
pr_init("pr1")        # "lo hacemos por ejemplo con la función pr y knicks y el nombre de la rama" — pr y knicks ← pr y knicks

# Empujar y abrir PR en GitHub
pr_push()             # "la función pr puso ... la función pere puig nos deja en una interfase" — pr puso / pere puig ← pr_push

# Advertencia al iniciar PR 2 desde punta de PR 1
# "el paquete justice nos da una alarma cuando queremos iniciar la ... pr-2 desde la punta de pr 1 y nos dice si estamos seguros que queremos crear una rama local ... desde un padre que no sea la rama master"

# Perspectiva mantenedora: traer PR por número
pr_fetch(5)           # "la función pr fecha con el número asociado a la solicitud ... con la función perfect 5" — pr fecha / perfect 5 ← pr_fetch

# Sincronizar PR 2 con nuevo master
pr_sync()             # "correr la función pr-5 para sincronizar su ... solicitud número 2 ... con el nuevo estado del repositorio fuente" — pr-5 ← pr-5
# Limpieza manual mostrada:
# mover g de f.R a mi_f.R, editar g para que use mi f en vez de f, y remover f.R

# Finalizar tras squash merge
pr_finish()           # "podemos correr la función pvr finch que lo que va a hacer es cambiar a la rama master ... luego hacer un pull ... y finalmente borrar la rama pr2" — pvr finch ← pvr finch
```
