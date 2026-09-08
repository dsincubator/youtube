---
type: source
title: "`usethis::pr_synch()` (Español)"
source_file: "xx5WNZgQEdY_usethis-pr-synch-espanol.md"
video_id: "xx5WNZgQEdY"
url: "https://www.youtube.com/watch?v=xx5WNZgQEdY"
lang: es
tags: ["ds-incubator", "usethis", "terminal"]
key_topics: ["pr-sync", "create-from-github", "conflict-resolution", "git-sitrep", "pr-finish"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=xx5WNZgQEdY"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 7
    last_modified: "2019-11-04T00:00:00Z"
usage_window: { from: "2019-11-04T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# `usethis::pr_synch()` (Español)

## Summary

Video en español que enseña `usethis::pr_sync()` como solución cuando una solicitud de fusión (pull request) abierta entra en conflicto porque el repositorio fuente avanza en la misma línea (aquí `README.md` línea 3) antes de fusionarse. El flujo se muestra en RStudio pero se señala el equivalente en terminal.

Primero se carga `usethis` con `library(usethis)` y se crea un fork y clon local en un solo paso con `usethis::create_from_github("alcpor/abc", fork = TRUE)` (subtítulos: "create from here hub ... el primer argumento que tiene una composición del nombre de la organización y ... luego barra y luego el repositorio abc" / "for god's trump para forzar un fork" ← `create_from_github`, `fork = TRUE`), mostrando el comando git equivalente para quien prefiere la terminal como forma de reproducirlo y de entender qué ahorra la función. Con `usethis::git_sitrep()` (subtítulos: "análisis de la situación de red significa situation report / situation report" ← `git_sitrep`) se verifica que `origin` apunta a `mauro-lepore/abc` con permisos para empujar (fork) y `upstream` a `alcpor/abc`; se aclara que normalmente no se tendrá permiso de push a una organización que no se administra. Luego se inicia el trabajo con `usethis::pr_init("pr")` (subtítulos: "para iniciar una pool recueste vamos a usar la función pain y con el nombre de una rama" ← `pr_init`), se edita `README.md` línea 3 agregando "reposo ordenó por para ... decir un repositorio para demostración" y se envía con `usethis::pr_push()` (subtítulos: "función pere puig que se va a encargar de mover ese comité desde nuestro repositorio local a nuestro foro ... va a abrir una ventanita en el navegador" ← `pr_push`), que abre el comparador: rama `pr` en `mauro-lepore/abc` propuesta hacia `master` en `alcpor/abc`.

Para demostrar el conflicto, la organización agrega un commit en la misma línea 3 con mensaje diferente ("el repositor y el orden"). La PR en GitHub deja de mostrar "está disponible para hacer fundida" y muestra "This branch has conflicts ... conflicts that must be resolved" y el archivo en conflicto (subtítulos: "this branch cascón flix ... tiene conflictos que deben ser resueltos y muestra el archivo que está en conflicto" ← mensaje de conflicto). Localmente `usethis::pr_sync()` (subtítulos: "si nosotros corremos la función pr zinc en esta función va también a detectar si hay conflictos y va a abrir el archivo que tenga el conflicto" ← `pr_sync`) intenta traer los cambios de upstream y fusionarlos; falla y abre automáticamente `README.md` con marcadores de conflicto. La resolución elegida no es quedarse con una u otra versión sino escribir una nueva: "repository for demonstration" (subtítulos: "yo podría resolver este conflicto escribiendo en repository for demostration ... elegir resolver el conflicto no de una u otra forma sino de una nueva manera" ← resolución). Tras guardar y commitear, `usethis::pr_push()` de nuevo envía el commit de resolución al fork y la PR pasa a "ya no tiene conflictos con la rama base ... ramas de repositorio en organización al por y la rama más tarde" y queda verde para fusión. El mantenedor puede fusionar con el botón verde o hacer `squash and merge` ("combinar todos los comics asociados a esa solicitud de fusión en un único que deja la historia un poco más simple" ← `squash and merge`) y se cierra con `usethis::pr_finish()` (subtítulos: "función r finish que nos va a dejar nuevamente en la rama master en buen estado" ← `pr_finish`).

## Key Concepts & Tools Taught

- **[Sincronización de PR / pr-sync]:** `usethis::pr_sync()` trae cambios de `upstream`, intenta fusionar y, si hay conflicto, abre el archivo en conflicto para resolución manual (cita: "pr zinc ... va también a detectar si hay conflictos y va a abrir el archivo que tenga el conflicto" ← `pr_sync`).
- **[Crear desde GitHub / create-from-github]:** `usethis::create_from_github("alcpor/abc", fork = TRUE)` hace fork + clon local en un paso y muestra plantilla git equivalente (cita: "create from here hub ... primer argumento ... nombre de la organización ... barra y luego el repositorio abc" / "for god's trump" ← `create_from_github`).
- **[Resolución de conflictos / conflict-resolution]:** Conflicto en `README.md` línea 3 entre "reposo ..." local y "el repositor y el orden" de upstream; mensaje GitHub "This branch has conflicts" → resolución con nuevo texto "repository for demonstration" y push (cita: "escribir en repository for demostration ... no de una u otra forma sino de una nueva manera" ← resolución).
- **[Informe de situación Git / git-sitrep]:** `usethis::git_sitrep()` muestra `origin` → fork del usuario y `upstream` → fuente (cita: "análisis de la situación de red significa situation report ... el remoto con el nickname origin está apuntando a la cuenta de usuarios mauro le pone al repositorio a veces ... upstream apunta a la organización al por" ← `git_sitrep`).
- **[Finalizar PR / pr-finish]:** `usethis::pr_finish()` limpia el cableado de la PR y regresa a `master` (cita: "función r finish que nos va a dejar nuevamente en la rama master" ← `pr_finish`).

## Code Snippets & Formulas

Fragmentos dictados, mangleados en subtítulos y normalizados:

```r
library(usethis)                                           # "vamos a correr la función library y usted eso" ← library(usethis)
usethis::create_from_github("alcpor/abc", fork = TRUE)     # "create from here hub ... nombre de la organización ... barra y luego el repositorio abc ... for god's trump para forzar un fork" ← create_from_github
usethis::git_sitrep()                                      # "análisis de la situación de red significa situation report ... el remoto con el nickname origin ... upstream apunta a la organización" ← git_sitrep
usethis::pr_init("pr")                                     # "para iniciar una pool recueste vamos a usar la función pain y con el nombre de una rama" ← pr_init
# editar README.md línea 3: agregar "reposo ordenó por para con un atajo para decir un repositorio para demostración"
# git commit
usethis::pr_push()                                         # "función pere puig que se va a encargar de mover ese comité desde nuestro repositorio local a nuestro foro ... va a abrir una ventanita en el navegador" ← pr_push
# GitHub: "This branch has conflicts ... conflicts that must be resolved" — PR en conflicto en README.md
usethis::pr_sync()                                         # "si nosotros corremos la función pr zinc en esta función va también a detectar si hay conflictos y va a abrir el archivo" ← pr_sync
# Resolver conflicto en README.md línea 3 → "repository for demostration" (texto nuevo combinado)
# git add README.md; git commit
usethis::pr_push()                                         # "para enviar nuevamente a mi fork ... el conflicto se ha resuelto y ya puedo ver ... esta rama ya no tiene conflictos con la rama base" ← pr_push (segundo)
# Opcional del mantenedor: squash and merge — "combinar todos los comics ... en un único que deja la historia un poco más simple" ← squash and merge
usethis::pr_finish()                                       # "función r finish que nos va a dejar nuevamente en la rama master" ← pr_finish
```

