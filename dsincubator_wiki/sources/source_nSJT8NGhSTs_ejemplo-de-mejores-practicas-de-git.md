---
type: source
title: "Ejemplo de \"mejores practicas\" de Git"
source_file: "nSJT8NGhSTs_ejemplo-de-mejores-practicas-de-git.md"
video_id: "nSJT8NGhSTs"
url: "https://www.youtube.com/watch?v=nSJT8NGhSTs"
lang: es
tags: ["ds-incubator", "git", "workflow", "terminal", "cran"]
key_topics: ["atomic-commits", "commit-message-structure", "github-workflow", "branching", "r-package-scaffolding", "productive-tooling"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=nSJT8NGhSTs"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 110
    last_modified: "2020-12-22T00:00:00Z"
usage_window: { from: "2020-12-22T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Ejemplo de "mejores practicas" de Git

## Summary

Presentada en español como ejemplos vivos de prácticas Git en borrador en 2DegreesInvesting, la charla articula dos principios resumen — cada commit compartido debe contener cambios íntimamente relacionados y la historia compartida no debe reescribirse — desglosados en ocho reglas prácticas: commits pequeños y frecuentes para reducir conflictos, completar el trabajo antes de abrir una solicitud de fusión, probar el efecto deseado antes de commitear, estructurar el mensaje de commit como un email (sujeto ≤50 caracteres, cuerpo separado por una línea en blanco con líneas ~70 caracteres y expresando motivación/intención), usar intensivamente ramas y acordar un workflow (principalmente *GitHub workflow* basado en ramas que integra la regla de uso de ramas), y apoyarse en herramientas que aumentan productividad y evitan errores. La demostración arranca desde un repositorio recién inicializado en la rama `main` con un único commit inicial y un archivo `notas` con las reglas; mostrando una terminal muy personalizada (colores, nombre de rama visible) y alias como `gl` para un `git log` enriquecido, el orador contrasta `git log --oneline` con su alias informativo. Crea la rama `paquete` y, usando R y el paquete `usethis` (cargado vía `.Rprofile`), ejecuta `usethis::create_package(".")` in situ, `DESCRIPTION` editada para reemplazar placeholders, `usethis::use_mit_license()` (actualiza `DESCRIPTION` y añade `LICENSE`), y configuración de `README.Rmd`/`README.md` vía `use_readme_rmd()` y `build`/`render` (incluyendo el `.gitignore` para excluir `README.Rmd` del paquete). Cada paso se commitea de forma atómica (agregar esqueleto, editar descripción, agregar licencia, renderizar README), corrigiendo un commit mentiroso mediante `git commit --amend` (primero en modo *Work In progress* y luego con mensaje `Generate README.md`/`render README`). Se ilustra el formato de mensaje con sujeto corto y cuerpo envolvente a 70 caracteres, la necesidad de no dejar el archivo `notas` dentro del paquete (movido a `README.Rmd` bajo encabezados de prácticas y detalles, luego eliminado), y la protección de trabajo incompleto abriendo la solicitud de fusión como *Draft* con la CLI `gh` (`gh pr create --draft`) sobre una configuración *fork of ours* (`origin` → cuenta personal, `upstream` → organización). La verificación final incluye `R CMD check`/`check()` (reproducido vía wrappers `check` y `test` desde la terminal), `test` sin directorio `tests/` aún, y corrección del NOTE por `notas`; tras mover el contenido y eliminar el archivo, `R CMD check` queda limpio (salvo una nota horaria ya resuelta), permitiendo convertir el PR a listo para revisión y revisar en GitHub (pestaña *Files changed*, *Commits*) cómo cada commit pequeño porta mensaje de intención claro.

## Key Concepts & Tools Taught

- **[Commits atómicos / atomic-commits]:** cada commit compartido debe contener cambios íntimamente relacionados y ser pequeño (caption "cada comit ... debería contener cambios que están relacionados entre sí", "hacer comits que sean pequeños").
- **[Estructura del mensaje de commit / commit-message-structure]:** formato tipo email — sujeto ≤50 caracteres, línea en blanco, cuerpo ~70 caracteres, explica motivación no solo qué cambió (caption "estructura del mensaje de comit es como un email ... 50 caracteres o menos ... luego ... cuerpo ... alrededor de unos 70 caracteres ... debería expresar ... motivación ... nivel de intención").
- **[Workflow GitHub / github-workflow]:** trabajo en ramas revisadas antes de fundir a `main` (caption "kiub workflow ... workflow que más usamos ... muy fuertemente basado en ramas ... workflow conocido como kiub workflow" → GitHub workflow; "solicitud de fusión" → pull request).
- **[Ramas-branching / branching]:** crear y trabajar en `paquete` separada de `main` (caption "usar intensivamente ramas ... punto 6 ... crear una nueva rama la voy a llamar paquete"; `git log`, `git show`, `git commit --amend`).
- **[Andamiaje de paquete R / r-package-scaffolding]:** inicialización con `usethis` (caption "usethis::create_package ... usce ... create package", "use mit License ... use mit License creo varios archivos", `DESCRIPTION`, `NAMESPACE`, `LICENSE`, `README.Rmd` → `README.md` vía `build`/`render`, `R CMD check` / `check`, `test`).
- **[Herramientas productivas / productive-tooling]:** terminal personalizada y alias que evitan errores (caption "Estoy usando una consola muy personalizada ... colores ... nombre de la rama ... herramienta ... alias con gl ... Mostrar el log ... cuándo ... y Quién hizo ese comit"; `gh` CLI "G es un command application ... leamos cli de github ... gh pr create ... Draft").

## Code Snippets & Formulas

```bash
# Estado inicial y log personalizado
git status
git log --oneline          # caption "git log con una única línea"
gl                         # alias "gl ... Mostrar el log ... cuando ... y Quién"
git show HEAD              # caption "podríamos revisarlo con show"

# Workflow de ramas GitHub
git branch                 # caption "las ramas que tengo es solamente la rama Main"
git checkout -b paquete    # caption "crear una nueva rama la voy a llamar paquete"
ls

# Andamiaje de paquete R con usethis (desde R, paquete cargado en .Rprofile)
# usethis::create_package(".")   # caption "usce ... create package ... exactamente donde ya estoy parado"
# usethis::use_mit_license()     # caption "use mit License ... agregó ... LICENSE ... Descripción ... licencia"
# usethis::use_readme_rmd()      # implícito en "agregar la licencia ... y otra cosa ... archivo de ritm ... ritmi/rmd"
git add DESCRIPTION NAMESPACE
git commit -m "Add package skeleton"

# Editar DESCRIPTION (reemplazar placeholders) y commitear atómico
# edit DESCRIPTION
git add DESCRIPTION
git commit -m "Populate DESCRIPTION"

# Licencia
git add DESCRIPTION LICENSE .Rbuildignore
git commit -m "Add MIT license"

# README: Rmd → md (caption "build ... render md ... generate home page")
# en R: devtools::build() / rmarkdown::render("README.Rmd")
git add README.Rmd README.md .gitignore
git commit -m "render README"   # caption "render with me ... Generate README md"
# Corrección de commit mentiroso:
git commit --amend -m "Generate README.md"  # caption "amend ... Work In progress ... sacar PR"
# Mensaje con cuerpo:
# sujeto ≤50 chars, línea en blanco, cuerpo ~70 chars
git commit --amend -m "Generate README

Generate home page rendering README.Rmd to README.md"

# Verificación antes de compartir
R -q -e "devtools::check()"   # caption "check ... va a correr rc check ... y me va a decir si el paquete tiene algún problema"
# wrapper terminal
check
test                          # caption "test este comandito me corre test pero ... no existe ningún directorio de testat"
cat notas >> README.Rmd
rm notas
git add README.Rmd notas
git commit -m "Document practices in README"

# Solicitud de fusión draft con gh CLI sobre fork of ours
# origin → usuario, upstream → organización (caption "fork of hours donde mi origin apunta a mi cuenta ... appstream apunta a la organización")
gh pr create --draft --title "Create basic infrastructure" --body "Este es el primer ..."  # caption "gh ... create ... Draft Man Draft"
gh pr view --web
# Final: marcar listo tras R CMD check OK
gh pr ready  # implícito en "sacar a esta solicitud de fusión de la versión Draft"
```
