---
type: source
title: "Conversaciones productivas sobre codigo (demo)"
source_file: "kNV8dDGF7Hw_conversaciones-productivas-sobre-codigo-demo.md"
video_id: "kNV8dDGF7Hw"
url: "https://www.youtube.com/watch?v=kNV8dDGF7Hw"
lang: es
tags: ["ds-incubator", "reprex"]
key_topics: ["reproducibility", "reprex", "r-markdown", "github-workflow", "session-info"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=kNV8dDGF7Hw"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2020-09-01T00:00:00Z"
    usage_count: 5
usage_window: { from: "2020-09-01T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Conversaciones productivas sobre codigo (demo)

## Summary

Esta demo cierra la charla teórica sobre conversaciones productivas mostrando herramientas según la cantidad de código a discutir. Recuerda los tres requisitos: el código tiene que correr, el receptor no necesita correrlo porque ve el output junto al código, pero si quiere puede correrlo fácil copiando y pegando.

Para un fragmento pequeño se usa reprex: seleccionar unas líneas, usar el addin "Render reprex" o `reprex::reprex()` eligiendo la selección y marcando incluir `session_info`, lo que genera un markdown previsualizado con código, output comentado y `session information` (plataforma Ubuntu, versión de R y paquetes) útil para depurar errores. Al confirmar, produce un `*.md` copiable a un gist de GitHub (secreto para privado, público si se quiere) con syntax highlighting colapsable; el output queda comentado para no interferir al pegar en consola.

Cuando los datos vienen de `read.csv`, se muestra cómo hacerlos reproducibles sin archivo externo: pegar la representación textual del data frame (vía `datapasta` / "sacar la consulta texto") asignándola, por ejemplo, a `en_picaros`, y luego volver a hacer `reprex` incluyendo `session_info`. Si se fija `outfile = TRUE` (caption "out fire") o se usa el argumento para no correr en un directorio temporario, el reprex puede ejecutarse en el proyecto y encontrar `data/` en lugar de fallar.

Para un archivo completo conviene crear un repositorio en GitHub (vacío o clonado, incluso desde la interfaz web "create a new file" o "upload files") y subir el `Rmd` con sus datos (`data/`, `leamos.Rmd`), hacer `knit` a `md`/`html` (se recomienda opciones como `comment = "#>"`, `error = TRUE`, `collapse = TRUE` para un output compacto y que errores se muestren sin abortar) y publicar la solicitud de fusión (draft si no está listo). El revisor puede comentar línea por línea (threads como en Google Docs) y responder, quedando registro en Files y Conversation. Para varios archivos lo ideal es compartir el link del repo o un proyecto de RStudio Cloud / binder con dependencias ya instaladas, evitando pedir al revisor que instale paquetes localmente; si prefiere clonar local, `File → New Project → Version Control` desde la URL funciona, aunque ahora debe instalar librerías (el script avisa con `library()`). Finalmente muestra cómo traer una PR por número con `pr_fetch(15)` desde el clon local del repo central para reproducir exactamente los cambios de esa propuesta.

## Key Concepts & Tools Taught

- **[Reproducibilidad / reproducibility]:** conversación productiva exige código que corre, output visible y facilidad de re-ejecución; incluye dependencias, datos accesibles y `session_info`.
- **[reprex / reprex]:** paquete para compartir fragmento con su salida; el output queda comentado para ser copiado y pegado sin romper la ejecución, y puede incluir información de sesión.
- **[R Markdown / r-markdown]:** para un archivo, usar `Rmd` → `knit` → `md/html` con opciones `comment`, `error = TRUE`, `collapse` para generar una página visualizable como HTML sin descargar nada.
- **[Flujo en GitHub / github-workflow]:** crear repo (vacío, clonar o vía web), subir archivos, abrir PR/draft, revisión por comentarios en línea, y traer PR local con `pr_fetch()`; gist secreto/público para fragmentos.
- **[Información de sesión / session-info]:** incluir `session_info` en el reprex para registrar plataforma y paquetes, clave para errores no reproducibles.

## Code Snippets & Formulas

Llamadas dictadas en vivo (mangled + normalizada):

```r
# Fragmento mínimo → reprex
# "seleccionamos este código ... pemex elección ... opción de hacer una réflex basada en la selección ... Render reprex ... elegir por ejemplo la selección actual ... y quiero que me incluya la información de la sesión"
reprex::reprex(input = c("library(dplyr)", "mtcars %>% group_by(cyl) %>% summarise(n = n())"),
               session_info = TRUE)  # "render reprex ... incluir la información de la sesión" — Render reprex / reflex ← reprex
# "información sobre las sesiones ... plataforma ... ubuntu 11.04 ... versión de recorriendo es 4.02 ... versión de todos los paquetes" — información de la sesión ← session_info

# Datos reproducibles sin csv externo
# "podemos pegar y poner dentro del tipo el archivo de datos data frame ... sacar la consulta texto que puedes cortar exactamente y pegar"
# caption "con exceso teneis sacar la consulta texto" — sacar la consulta texto ← datapasta::tribble_paste / datapasta
en_picaros <- data.frame(  # ejemplo reconstruido desde texto copiable
  x = c(1, 2)
)  # "en picar y a esto se lo vamos a asignar ... en pícaros viene de todo este texto" — en picar / en pícaros ← en_picaros

# reprex que necesita archivos locales
# "fíjate que existe un argumento frisby tiene el argumento file hellfire puede ser ... una dirección de internet ... file hellfire" — file hellfire / frisby ← file
# "tienes ahí opciones ... y a cáritas dando las expresiones que vos querés correr en córdoba" / "hay un argumento a represas que le puedes agregar que te basura que se leía de out fire ... eso te va a permitir que en vez de correr 0 en paz" — out fire / represas ← outfile / reprex(outfile = TRUE)
reprex::reprex(input = read.csv("data/mtcars.csv") %>% head(), outfile = TRUE)

# Archivo completo → RMarkdown con opciones recomendadas
# "recomiendo ya de por sí usar el temple directamente ... eso tiene un complemento específico diseñado para comportarse genial"
# "recomiendo también otras versiones para que el código pueda ser corrido ... leamos le copio de represa y uso el comentario éste ... y que más gusto también error y por sus frutos porque si hay un error sin la opción verdadero en error ... no se completa ... con la opción en verdadero ... simplemente el error como deberías y finalmente ... collapse"
# en setup chunk:
knitr::opts_chunk$set(comment = "#>", error = TRUE, collapse = TRUE)  #  — comment / error verdadero / collapse ← knitr opts

# GitHub flujo mostrado
# "podrías destruirlo ... someterlos a un archivo entero ... puedes disfrutarlo sí y empezar la conversación ... creas un repositorio ... lo que quieras ... y ahí pones tu archivo ... agregas el ritmo ... crear un archivo nuevo / subirlos"
# "crear esta solicitud de fusión desde la ramita ... miremos ... a la rama master ... creemos esta solicitud de fusión ... raf para qué las personas que mantienen este repositorio sepan que estamos listos"
# "podría hacer un comentario sobre el código ... puedes empezar un comentario simples a empezar una revisión"
# Traer PR por número desde clon del repo central:
pr_fetch(15)  # "digamos que estamos en este repositorio ... y que hay varias solicitudes de fusión y esta última ... si quisieran correrse cogió ... esta es la solicitud de función número 15 entonces ... hacemos pierre fecha ... quiero traer que la solicitud de opción 15" — pierre fecha / pr fecha ← pr_fetch(15)
# Gist para fragmentos: "por ejemplo si yo me voy aquí a punto com podría agregar un nuevo chiste ... voy a llamar porque genera un archivo que es reconocible como markdown ... me place md ... si yo veo acá eso como también puedes crear un chip secreto" — chiste / chip secreto ← gist
```
