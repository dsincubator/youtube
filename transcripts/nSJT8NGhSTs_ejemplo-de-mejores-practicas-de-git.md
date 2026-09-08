---
type: Video Transcript
title: "Ejemplo de \"mejores practicas\" de Git"
description: "Hoy el 10 incubator va a cubrir la idea de ejemplos Mostrar ejemplos sobre un conjunto de prácticas sobre git que estamos tratando de acordar en la organización..."
resource: "https://www.youtube.com/watch?v=nSJT8NGhSTs"
tags: ["ds-incubator", "git", "workflow", "terminal", "cran"]
lang: es
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=nSJT8NGhSTs"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2020-12-22T00:00:00Z"
    usage_count: 110
usage_window: { from: "2020-12-22T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

hoy el 10 incubator va a cubrir la idea

de ejemplos Mostrar ejemplos sobre un

conjunto de prácticas sobre git que

estamos tratando de acordar en la

organización en tu degis donde yo

trabajo eh estas prácticas Se podrían

resumir en dos puntos uno es la idea de

que cada comit en

eh en un repositorio o sea acada comit

que uno comparte eh con otros colegas

debería estar eh relacionado debería

contener cambios que están relacionados

entre sí eso aplica específicamente a

comits compartidos cuando uno trabaja

localmente antes de compartir esos

cambios con la gente uno tiene muchísima

más libertad de hacer efectivamente lo

que quiera y puede reescribir la

historia y la segunda de las prácticas

que resume todo es la idea de que de

vuelta los comits que son compartidos

e no deberían ser cambiados O sea la

historia de un repositorio que ya ha

sido compartido eh debería permanecer eh

Y no ser reescrita porque si no genera

un montón de dolores de cabeza más

detalladamente eh las prácticas en las

que hasta este momento estamos Este es

un proceso eh Dinámico en el que estamos

ahora eh todavía no no acordamos en en

las prácticas Pero esto es está en

estado borrador y lo que tenemos hasta

el momento son esta ocho estas ocho

prácticas sobre eh de vuelta que aplican

a cambios que han sido compartidos eh la

primera es la idea de que nuevamente los

cambios que uno comparte deben

estar los cambios que están en un comit

compartido deberían estar íntimamente

relacionados

eh hacer comits que sean pequeños hacer

comits frecuentemente como para evitar o

minimizar los las chances de conflictos

entre

comits cada comit Debería

ser cada comit en realidad digamos

Cuando uno hace un trabajo

e eh específico quizás pueda tener

varios pequeños comits pero todos

apuntan a completar un trabajo eh Y si

ese trabajo no está completo todavía no

está listo entonces la idea de que

cuando uno somete una solicitud de

fusión para ser revisada el trabajo

debería estar completo

e punto cuatro que uno debería haber

testeado

eh que el efecto que produce esos

cambios que inu Endo con el comit es el

efecto deseado que no hay efectos

inesperados

eh cinco que la estructura del mensaje

de comit es como un en un email esto

significa que tiene una línea sujeto una

línea como título con algunas

características 50 caracteres o menos y

luego quizás haya o no un cuerpo de ese

copit que está separado por una línea en

blanco de el sujeto y en general se

las líneas deben tener una longitud de

alrededor de unos 70 70 caracteres para

que no se vaya hacia el infinito para la

derecha y sea difícil de leer y además

debería expresar Cuáles son cuál es la

motivación de los cambios a ese nivel

nivel de intención no tanto qu ocurrió

porque el que ocurrió lo muestra el

covid en sí mismo el punto se

usar usar intensivamente ramas eso

Quizás lo combinemos con el punto s

porque el punto s dice de acordar en un

workflow y los dos workflows más

mencionados de hecho el workflow que más

usamos nosotros es esta idea de kiub

workflow que está muy fuertemente basado

en ramas O sea que este punto 6 está

casi incorporado en el punto s qu bueno

que articul esto veo esa posibilidad de

resumir aún más la información que

tenemos y el punto o es ide de usar las

herramientas que a uno le permiten ser

más productiva o productivo incluso

evitar errores hay las herramientas que

abstraen detalles que son muy comúnmente

que muy comúnmente derivan en

errores Entonces como todas estas ideas

son poco accionables si no tenemos en la

cabeza un ejemplo claro de qué queremos

decir con estas cosas son bastante

abstractas Estas ideas el 10 incubator

hoy va a demostrar cada una de estas

prácticas con ejemplos Quizás lo que

podría hacer

es

Mostrar estas notas en una terminal y

dejar acá un costadito vamos aar un poco

para que se vea más y luego vamos a abir

otra terminal AC a la

derecha o quizás puedo dejar en el fondo

vamos hacer eso vamos dejar acá en el

fondo bien grandecitas como para que se

vean bien y en esta otra

terminal Ahí vamos de vuelta a eh

PR Ahí estamos vamos a demostrar qué es

lo que tenemos acá Este repositorio está

recién iniciando estoy en una rama llama

Main que es la rama por defecto ahora en

en este repositorio eh vamos a mostrarte

el el log de este repositorio como es

que hay solamente un único comit con el

mensaje inicializar el repositorio con

algunas notas y esas notas son las que

leyeron en la otra consola entonces acá

ya puedo empezar a hablar de alguno de

los puntos de las prácticas que viemos

hasta hasta ahora una es la idea de

herramientas o sea acá están viendo que

yo estoy usando una consola muy muy muy

personalizada p colores ves el nombre de

la rama en la que estoy parado acá y

Esta es una herramienta que para mí es

muy importante Por ejemplo si yo no

tengo el nombre de la rama en la que

estoy parado a veces me encuentro

haciendo comics en la rama equivocada

Entonces el hecho usar una heram mienta

que la

personalices me hace mucho más

productivo y menos propenso a cometer

errores también puedes ver que por

ejemplo yo uso muy intensivamente los

aliases con gl o lo que hago es Mostrar

el log de una forma que contiene

información que me resulta muy útil a mí

cuándo por ejemplo fue el comit y Quién

hizo ese comit no es información por

defecto en el git log tradicional un git

log normal sería algo así eh un git log

con una única línea sería algo así pero

ves que falta información falta a m por

ejemplo acá el nombre y el tiempo de

comit que esto me más ú entonces Bueno

ese es uno de los puntos vamos a

revisarlo estaría tocando acá en esta

idea de usar herramientas que tean más

productivo comit often quizás también

porque fíjate que el primer comit fue un

comit muy

chiquitito quise hacer acá era abr para

acá

muy chiquitito

eh podríamos revisarlo con show eh

simplemente agregué un único archivo

estas poquitas líneas que muestran la

las notas sobre las que voy a basar esta

presentación que estoy basando ena

presentación bien ahora

eh hablemos un poquito de workflow

también eh la práctica

eh siete nosotros trabajamos con ramas

eh que son luego revisadas antes de ser

fundidas a la rama principal en este

caso Main eh Ese es el workflow conocido

como kiub workflow y es el workflow que

estoy utilizando ahora como ejemplo

Entonces lo primero que tendría que

hacer si quisiera

e generar

eh una solicitud de fusión y empezar a a

inicializar una conversación con mis

colegas para revisar lo que estoy

haciendo ahora debería empezar Una

ramita por el momento eh las ramas que

tengo es solamente la rama Main pero

podría Iniciar una nueva rama eh

permítanme que no voy a explicar mucho

de los atajos que estoy usando se el

foco de esta presentación no es

eh Cómo usar la herramienta sino del

hecho de ver que estoy usando

herramientas que para mí me hacen Eh

trabajar más rápido y efectivamente me

puedo concentrar en lo que quiero

comunicar en vez de eh No sé en las

idiosincrasias de los comandos y y demás

entonces Bueno voy a crear una nueva

rama la voy a llamar

eh paquete

esta ramita eh va a contener este mismo

repositorio pero en un formato paquete

de r ese va a ser como la excusa que

estoy usando para mostrar Este ejemplo

para ilustrar estas prácticas

Entonces como este repositorio está muy

vacío voy a hacer un eles para que veas

que hay solamente un archivo esto

obviamente no es todavía un paquete r

vamos a iniciar r y vamos a eh usar el

paquete usce eh que de hecho podría no

usar este

namespace como prefijo de las funciones

porque yo ya lo tengo agregado a ya lo

estoy cargando mediante mi r profile Así

que voy directamente usar la función

create package y en este caso lo que voy

a hacer es un truquito para decir que

paquete Quiero crear Es uno que es

exactamente donde ya estoy parado ahora

mismo lo voy a llamar con el mismo

nombre así se va a llamar el paquete y

le damos enter vamos a decir que

sí y vamos a salir

de

r como pueden ver ahora vamos a ver qué

pasó el comit sigue siendo el mismo pero

staging tiene dos archivos nuevos uno

llama descripción

llace sería un buen momento ahora

agregar esto

y hacer

un vamos hacer el mensajito va a

ser de hecho vamos hacer

Creo que este mensaje va ser adecuado

Entonces ahora mi Station está limpia y

ahora ya tengo un comit un chiquitito

como para cumplir con la

práctica que tenemos acá

of y que cada cambio en el Comic debería

estar timamente relacionado por porque

por ejemplo si yo ahora

quisiera cambiar el archivo de

descripción Permítame mostrarte Qué es

lo que tiene ese comit ese comit por

ejemplo agregó un archivo llamado

descripción pero tiene como

muchos placeholders espacios donde hay

información que tienen que ser cambiada

e y eso no lo no lo hice en ese Comic

simplemente agregué el archivo pelado

como estaba y er en otro comit que sigue

voy a cambiar información los

placeholders por información eh real el

namespace está vacío ahí no tengo que

hacer nada vamos entonces a hacer

eh editar descripción para que

acá vamos a hacer

esto vamos a borrar esta línea y agregar

eh

ejemplo de

[Música]

eso ya está y ver esta información es

correcta bien Eso es todo lo que puedo

hacer ahora entonces vamos a

[Música]

genera nuevo comit ahí podemos ver

entonces ya tres comits quizás podríamos

agregar algo más como por ejemplo una

licencia que este paquete todavía no

tiene de hecho eso podría ser también

como una de las como una práctica que

uno puede acordar en organización que

cada proyecto tiene que tener por

ejemplo

un archivo de licencia que en este caso

todavía no lo

tengo y otra cosa que es casi

e indispensable es un archivo de ritm y

una vez que tengas ese archivo de ritmic

que explica Cuál es eh digamos el

objetivo de este eh paquete luego Podría

quizás borrar ese archivo eh llamado

notas una de las cosas que voy a hacer

ahora es

e a ver a ver a ver tenemos r tenemos

namespace tenemos descripción Eh bueno

agregar la licencia Entonces vamos a

hacer eh

use mit

License por ejemplo

e Entonces

ahora vamos a ver que ese

eh Esa llamada esa función use mit

License creo varios archivos acá vamos a

hacerlo acá arriba para que lo vean eh

Por ejemplo eh el archivo de descripción

Ahora tiene esta nueva línea eh que ha

sido editada licencia

y después hay un par de archivos que

antes no

estaban no eran parte de este

repositorio de Entonces vamos a

agregarlos ahí están

verde y vamos a hacer un

comit como ves estoy haciendo un comit

con varios archivos pero están todos

interrelacionados la idea de agregar

a la idea de agregar una

licencia Así que todos estamos

cumpliendo con la con la mejor práctica

de de hacer eso de que todos los

e cambios asociados a un comit están

íntimamente interrelacionados ahora mi

Station está limpia mi com Ahí está

vamos incrementando el tamaño de

este de la historia de este repositorio

moviendo hacia adelante y la otra cosa

que quería agregar era el archivo de RM

vamos a volver a hacer ahora

use Este es el archivo acá ya

podríamos editarlo ya que estamos con

algo así

como qué más tenemos acá

de cran no lo vamos a borrar porque este

paete no va ir a

cran me gustar

Blanca bien y ahora ejemplo todavía nada

no vamos a agregar nada no tenemos nada

y vamos a borrar el resto de información

y ya

estamos ups no estoy en terminal estoy

en Ahora sí eh fíjate también que el

archivo git ignore ha sido modificado eh

había sido inicializado ese archivo

había sido creado cuando creamos el

archivo License pero ahora tiene una

nueva línea

e esta línea de Eh ritm sí ese archivo

no Debería Debería ser excluido de El

pill del

paquete Entonces vamos a hacer un comit

que

diga rne

Ah lo que me está diciendo es que

[Aplausos]

debería hacer nit al archivo vamos a

usar la función de llam

build que va a hacer algunas cositas

[Música]

más Mientras tanto vayamos a revisar có

venimos con las prácticas

este punto lo usamos eh hacer comits que

estén timamente relacionados hemos este

también quizás estos Se podrían

eh fundir no quizás no está bien la idea

de que mantenan los comits pequeños

eh la idea de compartir los cambios

cuando estén completos bueno eh la razón

por la que estoy agregando estos

archivos eh fundamentales como ritmi y

licencia es justamente porque sin eso yo

Considero que el trabajo eh aún un

paquete vacío está sería incompleto O

sea me gusta que que esas dos piezas de

información estén la mis asía que estoy

trabajando para cumplir con este

requisito test before you commit eso es

algo que todavía no hemos

hecho que la estructura de comit tenga

eamos cumpla con algunos requisitos eso

todavía no lo hemos hecho he hecho

solamente a ver lo he hecho en el

sentido de que cada comit puede tener

básicamente dos partes una una que es el

sujeto que es obligatoria y deb tener 50

caracteres o menos Y eso sí lo he estado

cumpliendo hasta ahora pero hasta ahora

no he tenido una excusa digamos para un

comit que

explique más información en un en el

cuerpo así que eso lo voy a hacer ahora

con modo de un

ejemplo usar ramas eso sí lo hamos

estado haciendo que eso est es parte

workflow que uso para trabajar en

general y estoy usando herramientas para

hac más productivo Así que las únicos

dos puntos sobre los que tengo

que hacer hincap

estos dos el cu y el C para

cumplir cumplirlos y

demostrar estas prácticas con un ejemplo

entonces vayamos a esta otra

terminal parece que sigue trabajando

curioso vamos a ver qué está pasando

acá el archivo parece como que ha sido

modificado ya

Sí porque Se generó un rmd no sé que no

sé que parecería como que esto quedó ahí

este

trabado vamos a cancelar esto

e también lo que podría hacer es abrir

e el proyecto nr Studio porque vamos a

abrir un proyecto lo tengo por aquí eh

al al ser un paquete ahora también se

agregó el archivo de r Studio entonces

muy cómodo para mí trabajarlo en Studio

o

debería que estamos

acá Ah no no se agregó ese archivo

entonces Genial porque es un buen

ejemplo de algo quiero hacer

[Música]

entonces render

md y bueno

acá vamos a

hacer para que me deje hacer un comit

con

rmi con RM solamente Ah perdón claro no

tengo el ritme md O sea que es r no se

completó o sea quizás s debería eh vamos

a hacer el build Esto entonces De hecho

también me sirve como para mostrar un

ejemplo lo que yo quería hacer era hacer

un render del rmi para que el comit

contenga rmi rmd y contenga el rmi md

sin embargo hice un comit fue

inintencional pero me viene bárbaro para

mostrar una que que estoy como medio

violando una práctica

e si yo te muestro el comit este comit

el último dije render with me pero eso

es una mentira Por qué

bueno

kit Fíjate que cambié solamente el

archivo rmd y no agregué el archivo md

es una mentira lo primero que podría

hacer

es

kit

amend Ah

[Música]

va vamos a hacer Work In progress

esto no está

terminado Entonces ahora ves que es un

recordatorio para m de que todavía estoy

trabajando sobre es he terminado

Entonces ahora vamos vamos a ver si me

sale

perd vamos ver si me sale

usar con eso

facer el hecho de que Ah ahí lo tenemos

vamos a

agregarlo ahí lo vemos al rmy que esa

versión

renderizada md que es la versión

renderizada del R

rmd Entonces con eso ahí sí ya podría

satisfacer

e

el esta idea de que el comite

anterior agrega o renderiza ritmi

Entonces vamos a hacer una cosa

vamos a

nuevamente endar el com

anterior ahos

sacar PR Ah hace lo que quería hacer

ahora muestro

RM md Entonces el comit message render

rmd RM

md ahora es Es

verdad De hecho no me gusta

mucho porque uno renderiza que renderiza

md o renderiza rmd para generar nmd

entonces acá vamos a

decir vamos a de

vuelta

generate

md a ver cómo estamos generate

md Bueno ahora este mensaje creo que la

mejor forma

sería de escribirlo

sería y no especificar si es md o rmd

porque las dos las dos los dos archivos

forman parte del mismo comit Entonces

ahora sí estoy contento con esta

historia de este repositorio eh bien lo

que me estaría faltando entonces

recuerden es

e quizás ahora también podría usar como

excusa para poner en práctica esta idea

de de usar un comit que tenga un cuerpo

vamos a volver a amarlo entonces si yo

quisiera cumplir con esa práctica eh y

este comit necesitara digamos

más

información yo haría primero hago una

línea en blanco est de acá dejo en

blanco y esta otra la uso para escribir

Entonces ahora acá diría algo así

como

render rend

md

generate home

page algo así not que acá hice un rap

acá a esta altura eh Y usé como guía

el esta esta primera

línea esto muy intencionalmente esta

primera línea tiene 50 caracteres y

sería más o menos la referencia para

cuán largo Debería ser la línea uno de

cualquier comit message la línea de

sujeto eh Y el resto eh de las líneas e

son un excelente ejemplo de eh cuánto

más o menos Debería ser el largo del

resto del cuarpo entonces la primera

línea esta de por acá la uso como no más

larga que esta esta parte y después

cualquier otra línea del cuerpo uso no

más larga que esta que esta de acá que

tiene más o menos unas 70 por ahí Eso es

útil porque luego en guja uno puede ver

leer los mensajes de comit sin tener que

como arrastrar hacia la derecha para ver

eh el mensaje completo Entonces ahora

ahí tenemos y también sirve acá en la

consola si yo quisiera hacer un git show

eh hemos Está bueno poder ver todo el

mensaje acá y no no tener que irse a la

derecha para para ver qué pasó entonces

listo esto ya está eh listo para ser

compartido podría crear e una solicitud

de fusión ahora veamos Perdón voy a

prestar atención a dónde está mi rama eh

origin Y

upstream acá en este caso tengo un Setup

que se llama

e fork of hours donde mi origin apunta a

te voy a mostrar

dónde mi origin apunta a mi cuenta de

usuario y mi appstream apunta a la

organización investing entonces la

solicitud de fusión vamos a crear ahora

nuevamente volviendo a la idea de

herramientas G es un command l

application que usa un montón es el

leamos cli de github y podemos hacer

un create y a veces lo hago en versión

Draft Man Draft para no

alertar a nuestros colaboradores

colaboradores hasta tanto y est

listo porque de hecho una cosa que me

estoy olvidando o que me estoy acordando

que me olvidé es que no hice los testeos

adecuados Así que Genial que estoy

generando una de fusión en versión Draft

porque no está lista para ser compartida

todavía No cumplí una de las prácticas

que es esto test before y cómo lo vamos

a hacer Bueno lo vamos a hacer

simplemente conand

check no s qu pasó ahí parecería como

que no Se generó solit de fusión A lo

mejor estoy mal de internet creo que sí

acá roito de internet Esto bueno

Mientras tanto lo que voy a hacer

es ar

check podría hacerlo R con de Tools pero

como lo tengo cargado puedo hacer

directamente check eso va a correr rc

check en el paquete primero lo construye

el paquete sea hace un bando de paquete

y luego

corre

cm check y me va a decir si el paquete

tiene algún

problema mientras tanto por correr un

comando más livianito todavía que es

test eh De hecho para ser un poco más

honesto Yo lo que hago es tengo rappers

alredor de esas funciones que uso mucho

y las llamo directamente desde eh desde

la terminal entonces si yo quiero correr

test haría algo así como test este

comandito me me corre test pero test no

dice que no existe ningún directorio de

testat fair Enough porque no lo agregué

vamos a hacer el s Eh no tengo ningún

test ad porque todavía no tengo ningún

test y no tengo ninguna función el de

hecho r creo que debería estar vacío

está vacío pero OK Porque este es mi

primer solicitud de fusión donde Estoy

compartiendo un

paquete pasillo simplemente con la

infraestructura que luego voy a usar

para agregar lo que sea que quiera

agregar vamos a ver cómo estamos de

check esto sigue corriendo y mientras

tanto vamos a ver si puedo resolver mi

situación de internet

acá WiFi

parece como que estoy usando la

red qu no

indicada genial resuelto vamos

entonces vamos

a chequear que no tenga nada que tenga

agre y vamos hacer G

eni porque todavía cck

no se

completó aquí en el body podría escribir

un

mensaje este es el primer

mensaje el primer comentario que va

aparecer en la solicitud de fusión

request y creo que lo más indicativo

[Música]

Eso es todo lo que hice hasta ahora el

resto lo podría borrar no lo necesito

creo que ese es un mensaje fair no estoy

muy seguro si esto está e

en 70 80 pero estamos por ahí o sea no

no no quiero que se se vaya demasiado a

la derecha Así que eh sin ponerme

demasiado piqui eh con exactamente

cuántas cuántos caracteres tiene la

línea me preocupo de que no de que la

línea no sea demasiado larga básicamente

Eso es todo lo que lo que estoy mirando

entonces continúo con los prompts de del

de c gh está empujando acá a mi upstream

y de hecho podría ver la solicitud de

fusión

eso me abre un browser y acá está mi

mensajito acabo de escribir AC están

todos los que acabo de hacer

podría ver aquí

en t que dice Fil ch hay s archivos

que agre ah

tiene su pequeña descripción Real de lo

que está

haciendo No hay mucho más para ver ahí

está la

licencia qué más el namespace que está

vacío porque no tengo nada en este

paquete

todavía fre me file que tiene la

estructura que meus Y eso también me

permite tocar sobre el punto que

mencionabas que mencionábamos antes de

eh usar herramientas que a uno lo hacen

más productivo sea todos estos cambios

que estoy haciendo Honestamente son muy

rápidos e gracias a las herramientas que

eh que estoy usando por ejemplo Us this

eh que si eso uno lo hiciera a mano Eh

escribís abrís creas un nuevo archivo

ritm y demás tendrías que memorizar que

saber todas estas cosas

e eh la información la estructura

instalación ejemplo todo eso tendría que

recordar hacerlo y no realmente no no me

acuerdo no sé si tu escribo mal No

sabría ni ni qué escribir porque eh Me

me apoyo muchísimo en las herramientas

que utilizo veo también que el primer el

sujeto del primer de esta solicitud de

fusión es muy críptico entonces voy a

hacer lo voy a

renombrar

basic vamos a editar de una forma un

poquito más informativa Qué es esta

información esto es nuevo para mí

working

Ah simplemente está

diciendo estoy haciendo

acá Bueno si esta si esta si el

resultado de cmd check es correcto ya

estoy listo

para para sacar a esa solicitud de

fusión de la versión Draft y ponerlo en

como

activo lo que veo acá es que hay dos

notas una no me llama no es problema es

que no se pudo verificar eh la Hora eso

No sé si es por alguna configuración de

mi mi computadora pero esta otra sí esta

otra son las está detectando que el

archivo en notas no es un archivo

estándar en un paquete entonces Genial

porque me había olvidado hacer eso lo

que vamos a hacer es primero veamos Ah

más vamos a hacer Cat

not para esto que está acá y eso lo que

vamos a hacer lo vamos a agregar

a al archivo

Entonces ahora vamos a

editar O sea al final yo debería

tener las prácticas pero no las quiero

Ahí las

quiero

principio

prácticas acá acá sería genial vamos Ah

Enton

[Música]

se transforma en dos

puntos y esto acá

es

detalles esto de hecho

necesita esto necesita

acá Este

disquito qué me está pasando ahí y

ahí genial ahora vamos a hacer

un de

vuelta y Ah lo tenemos Entonces ahora

podría hacer un nuevo comit acá tenemos

estos dos archivos modificados con camb

que quise agregar

PR Esto es lo que y vamos a empujar Este

cambio a solicitud de fusión y ya con

eso podría hacer otro Ah perdón porque

todavía lo que no hice es

remover

el las notas Enton vamos a

hacer y ahora

y ahora s check debería darme un

resultado limpio quizás esa única nota

sobre el horario que no me preocupa la

vamos a dejar así pero en vez de dos

notas como tuve anteriormente debería

tener solamente

una porque eliminado el archivo notas

que

esar y con eso

completé este trabajo

de acá

completé cumplir con este requisito este

trabajo de agregar la estructura básica

de un paquete en este caso básico lo

defino arbitrariamente para básico Ah

significa tiene un que tiene una

licencia y que el archivo de descripción

por ejemplo contiene información básica

sobre es el objetivo de este paete vamos

a efectivamente W Ahora sí Ah como estoy

conectado a internet pudo verificar el

horario y todos los checks me dan Ok

entonces podría incluso hacer PR Ah

checks

e en online parece que no tengo ningún

check Así que eso lo hago por por

reflejo O sea no configuré ninguna

action todavía y lo voy a hacer quizás

más adelante pero fuera de este

video Entonces ahora sí tenemos todo en

condiciones y podría sacar a esta eh

solicitud fusión de la versión

eh Draft para decir que esto está listo

para ser

revisado y bueno Okay ya con eso eh

algún colega vamos a hacer acá a no sé

Jacob Sí podría ser pero no lo vamos a

sacar porque no quiero alertar e esto es

una e es un demo e Así que no quiero

eamos

ocupar el tiempo de mis colegas e aquí

podemos ver por ejemplo eh Cómo es el

efecto de haber hecho agregado un cuerpo

a un commit message puedo expandir ahora

esta estos tres puntitos Sí porque este

mensaje de comit esta es la parte del

sujeto y la parte del cuerpo la veo

cliqueando aquí y expandiendo eh Y

pueden ver que porque tomé la precaución

de de de hacer un rap acá una 70 a 70

caracteres de cada línea el mensaje no

se me va como loco hacia la derecha y es

bastante cómodo de ver eh y bueno con

eso termina este video eh vamos a

revisar las prácticas e

e resumidas cuentas eh cuando

compartimos los cambios como estoy

haciendo ahora a través de una solicitud

de fusión esos cambios deben estar todos

íntimamente relacionados en cada comit

ehen pueden podría navegar comit por

comit eh cada uno de estos eh Y pueden

ver que si venimos acá Ah no perdón a

comits aquí comits Ah acá podemos ver

todos los comics que he hecho sí e

Empezando por

acá y ahora los cambios que vemos aquí

son exclusivamente aquellos que se

refieren a ese comit y puedo avanzar con

next a ir viendo el resto de los cambios

cada comit message como como cada comit

era pequeño es muy fácil escribir un

mensaje que explica la intención de ese

eh comite en particular en este caso

explicar por ejemplo Por qué de qué se

se trata de este paquete y simplemente

cambia esta este placeholder por

información real ahora vamos a next qué

es lo que hizo este otro comit create

basic infrastructure acá agrego

licencia aquí está el archivo de

licencia este comit message está ah Aquí

está Perdón acá mitc tiene sentido

ahora rby este ritmi lo que hizo fue

agregó ritmi a ignor agregó el rmd de

ritm y también agregó el md de ritm

genial Ah el otro

com

fue agregar el

archivo practices Ah agregar las PR las

prácticas al archivo ritm aquí están si

explica Cuáles son las prácticas que

estoy ilustrando con este con este video

y ahí se terminó eso fue todo eso a su

vez está digamos corresponde al gran

trabajo de crear la estructura básica de

un paquete Entonces esto ya está listo

para ser

revisado muy bien con eso termina este

video Espero que les haya sido útil
