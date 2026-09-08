---
type: Video Transcript
title: "Conversaciones productivas sobre codigo (demo)"
description: "En un vídeo anterior estuve hablando sobre la idea de mantener conversaciones sobre códigos que sean productivos los elementos que las instructivas y como asadas pero hablé sobre..."
resource: "https://www.youtube.com/watch?v=kNV8dDGF7Hw"
tags: ["ds-incubator", "reprex"]
lang: es
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=kNV8dDGF7Hw"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2020-09-01T00:00:00Z"
    usage_count: 5
usage_window: { from: "2020-09-01T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

en un vídeo anterior estuve hablando

sobre la idea de mantener conversaciones

sobre códigos que sean productivos los

elementos que las instructivas y como

asadas pero hablé sobre cómo hacerlas a

un nivel más bien teórico no hice esto

había una demostración entonces en este

vídeo quería hacer

la parte final de aquella charla

[Música]

donde mostrará una tablita en la que se

describe según la cantidad de código que

tenés pues sería la herramienta más

quizás apropiada para esa cantidad de

código para correr el código y también

para publicarlo y mantener la

conversación entonces lo primero que

quería discutir es entonces el escenario

en el que tenemos solamente un poquito

de código solamente un pedazo digamos un

par de líneas

y entonces hacer vamos crear una

infraestructura alrededor de eso

no tiene mucho en este caso a trabajar

en el caso de r por ejemplo con

properties

para que te que nos permite cumplir con

todas las expectativas que hacen que una

conversación sobre código sea productiva

y de hecho para recordar eso es súper

importante vamos bien para arriba son

básicamente tres elementos primero que

el código tiene que correr segundo que

una persona que lo recibe tiene que no

les tiene que no necesitará correrlo

porque el código no solamente está ahí

sino además que está el agua del código

y tercero que si la persona que lo

recibe decide cortar lo que sea fácil es

o sea el código corre no lo tengo que

correr pero si quisiera lo puedo correr

de una forma fácil entonces bajando de

vuelta a la tablita a que nos

encontramos reprex implementa esas tres

propiedades de una composición sobre

código productiva y luego lo puedes

compartir

quizás quizás quizás si corresponden o

en algún chiste vamos a ver eso veamos

creo que es evidente yo creo que quiero

mostrar cómo funciona

digamos que quiero trabajar con el

repositorio

no lo voy a guardar en mi director y voy

a hacer

lo voy a disfrutar en mi cuenta de

usuario

acá estoy simplemente creando un clon

local de una bifurcación que hice de un

repositorio sobre el cual esta cuenta

particular de usuarios no quiere

privilegios para mojar

entonces en su repositorio de

demostración está muy vacío hagamos de

cuenta que queremos generar una

compartir tener una conversación sobre

algo así como

[Música]

adjuntamos en talleres

y luego debemos buscar

y hacemos un quintero sobre cilindro

por qué

este código lo puedo correr en mi

consola pero quiero tener una discusión

sobre él entonces voy a hacer es un re

producto

como si nadie y los aliens simplemente

pidiendo el reflex puedes encontrar por

ejemplo opción de hacer una réflex

basada en la selección

que tenemos acá

seleccionamos este código

pemex elección

ahí está pensando exactamente bueno acá

yo lo emocional

y en este caso me está preguntando si

quiero abrir un archivo para poder

copiar

esto es que se previsualizar acá en el

visualizador de esta textura

puede ser que no porque podemos hacer

mucho mejor que lo que vamos a hacer

en este caso estamos mostrando el output

pero por ejemplo estamos incluyendo

información que es bastante importante

en mantener una acción productiva que es

la idea de por ejemplo incluir la

información entonces cómo hacemos eso

bueno puedo resaltar el texto en este

caso voy a hacer el render reprex esto

me abre una interfase que me permite

elegir por ejemplo la selección actual

lo voy a publicar en

por ejemplo y quiero que me incluya la

información de la sesión vamos a

correrlo de esa forma

ya esto nos pone más cerca de mantener

una conversación productiva si yo ahora

voy hacia abajo vas a ver qué dice

información sobre las sesiones de este

stroke down medio te muestra información

sobre la plataforma en este caso esto es

tuyo claves del corriente sobre ubuntu

11.04 en la versión de recorriendo es

4.02 la lista y también la versión de

todos los paquetes que tengo

y eso es muy importante en muchos casos

sobre todo cuando estamos hablando de

errores

recomendaciones

en este caso ya si le interesaría

compartir este código el cinema no voy a

hacer un paso más voy a decir que no por

ahora dos para mostrar otras situaciones

en las que por ejemplo existe archivo

en pícaros

no tengo porque viene por defecto en r

pero qué tal si fuera un archivo que no

es tan fácil compartir un archivo que se

lo leí de un archivo csv bueno como

generar una reflex auto alguna opción

esconder

podemos pegar y poner dentro del tipo el

archivo de datos data frame por ejemplo

de datos que quieras generar una tenemos

compartir ese set de datos pero en forma

de código entonces informe textos con

exceso teneis sacar la consulta texto

que puedes cortar exactamente

y pegar

en el archivo de texto esto es

equivalente

a esto y ahora

vamos a hacer

en picar y a esto se lo vamos a asignar

entonces ahora en pícaros viene de todo

este texto que acá se tiene el efecto

deseado que es el de generar este hacer

llamado en picar y de eso podemos sobre

eso podemos construir entonces ahora

podrían seleccionar todo esto otra vez

volver a la reflexión

y generar el autor aunque habíamos

discutido antes que hacer una

preselección con el argumento de incluir

la sesión de la información de la sesión

es réflex dejando porque vamos a abordar

lo que estaba haciendo antes vamos a

repetir y ahora sí entonces es decir que

la selección corriente y acordate

siempre de poner la sesión de la

información

él

en este caso ahora si va a decir que sí

que me lo haré

y hasta acá para que me dé un archivo

que yo pueda copiar y esto podría

pegarlo

por ejemplo si yo me voy aquí a punto

com podría agregar un nuevo chiste

voy a llamar porque genera un archivo

que es

reconocible como markdown entonces me

place md

si yo veo acá eso como también puedes

crear un chip secreto lo cual en el caso

que tenga que mantener una conversación

privada sería ideal pero

al público y no tan genial porque veo el

código incluso con la

y sintax highlighting y también veo el

código y el agua y esto cumple con los

requisitos de conversaciones productivas

porque esto es fácil de correr para

lanzar primero correr porque sabemos en

el código correo segundo no lo tengo que

correr porque veo el output pero si

quisiera correr no sería fácil correr o

porque lo puedo simplemente copiar y

pegar en la consola y eso va a correr

porque porque el output está no es

comentado o sea que no va a interferir

con la corrida de escoria

hay un paso más que puedes hacer que es

el caso de si en vez de compartir de

esta forma quisiera compartirlo vamos a

borrar vamos a que fuera que quisiera

compartir este archivo con un archivo

csv y walter es un par de opciones de

publicar que vamos a hacer es que hemos

hecho no tengo hacer idealmente los

contenidos pondrías en algún archivo

online de manera que podrías leerlo

directamente con un 'sí'

fíjate que existe un argumento

frisby tiene el argumento file hellfire

puede ser un variado también si vos

tenés

si los archivos también pueden ser

esto quiere decir que fire puede ser

una dirección de internet si vos tenés

tu archivo guardado en el kit japonés

por ejemplo le pasa a ser el dakar dice

víctor valera genial otra opción es

cuando tienes guardado localmente en

este caso tenemos un sitio llamado data

y que digamos que en ese directorio

tenemos que vamos a abordar

[Música]

y vamos a abordar en picar dentro del

archivo

pero dentro del campo

entonces ahora la catarata tiene este

archivo indicar si es beat

entonces lo que haría es algo así como

2

o mejor aún

harías algo así como quiere

nada

y ya no usarías la barrita sino que

usarías que con conversión

entonces este archivo esto se iba a

correr acá en mi sesión de estudio pero

qué pasaría cuando quiero hacer un

réflex

selection muestra que debería darme un

error porque porque el reflex corre en

una sesión paralela y en un directorio

temporario donde no tiene acceso a la

carpeta sin embargo tienes ahí opciones

[Música]

es simplemente

y a cáritas dando las expresiones que

vos querés correr en córdoba esto sea si

yo quisiera correr esto que tenemos acá

te voy a fallar porque lo mismo que

hacer lo que acabo de hacer

efectivamente pero hay un argumento a

represas que le puedes agregar

que te basura que se leía de out fire en

él

eso te va a permitir que en vez de

correr 0

en paz entonces ahora con el argumento

de poder

esto va a correr ex va a cobrar no en el

archivo temporal

donde está trabajando en este genial

entonces ahora sí funciona para que esto

sea en

andrés que estamos planteando para una

[Música]

d

este track de un medio que habíamos

visto antes otra vez acá

un poco sí entonces ahora el

visualizador vez que corrió corrió

dentro de éste volveré crazy abajo

tenemos la sesión

entonces ahora si quiero nuevamente

decir sí por favor dame un archivo que

pueda copiar y pegar lo como un archivo

de marta

y

vemos los mismo objetivos esto debería

ser lo mismo empezar por un archivo

vacío le da su nombre le asegura de que

tenga la extensión md para que sea

interpretado como tal

guardado which is y ya puede compartir

este link con la persona que es

entonces ahora volvamos a donde

estábamos hagamos descubrir esta línea

si eran unos casos las discusiones en

particular sobre algo que está en un

repositorio y en ese caso también es

una hija y yo vamos a ir por ejemplo a

este repositorio y yo quisiera hacer un

issue acá eso es genial porque aunque

quiero reportaron un back o algo así

en general porque el mismo primera

represa lo que quería hacer era

esto representa este archivo me pregunto

si quiero copiarlo en general seguro

estás corriendo el negro estudio

localmente

pero en el caso como estoy en el estudio

cloud no tiene acceso al portapapeles

a pesar de que vivía y yo también es

inteligente y muestra los archivos con

formato con sintaxis md de marcaron nos

muestran también tal como esperas

sinde highlighting y demás y sigue

siendo colapsable

así que fantásticos les cumplimos con

esta niña de por acá ahora vamos a ver

qué tal si bueno en la réflex es

quizás un poco grande entonces conviene

más hacerlo y compartirla en un archivo

completo

bueno que así comentábamos en este

repositorio territorio

sí por qué no

digamos que estoy

podría destruirlo pero bueno sólo para

demostrar que por eso no es el enfoque

de ésta

de esta charla simplemente si quieres

someterlos a un archivo entero para

tener una discusión sobre un archivo

entero si está sucia un repositorio

puedes disfrutarlo sí y empezar la

conversación y sino simplemente creas un

repositorio a vos mismo que no es

no disiparon nada simplemente bien sacar

este repositorio

lo que quieras

y ahí pones tu archivo

con éxitos perdidos y sin nada bien acá

estás

de hecho vamos a agregar un ritmo para

que muestre una interfase con unas que

agregas el ritmo eso se ve un poco más

bonito

la frontal la página frontal del

repositorio tienes de interfaces que

incluye esto que tenía yo que es un

archivo incluso sí si quieres compartir

marchara 3 ningún repositorio asociado a

ese archivo simplemente genera uno

ahí mismo desde github si quieres no

hace falta ni siquiera que lo que no me

estás en tu ver estudio que los clones

puedes simplemente poner agregar

archivos cual crear un archivo nuevo

subirlos y lo tenéis subir si no puedes

crear un archivo y sí

que nos hiciera

crear una carpeta simplemente

construyendo una carpeta y luego un

paréntesis y crear el archivo

y acá le pegas el texto que vos quieras

si es fácil puedes crear un archivo

nuevo en un repositorio nuevo un archivo

propósito entonces habiendo dicho eso te

dice si quieres por ejemplo hacer un

cómic dentro de la rama principal o en

una rama accesoria hemos vivido acción

ahora más historia

réflex

y represa ahora estoy usando con el

sentido más amplio la palabra donde es

un ejemplo reproducible no

necesariamente tiene que ser algo hecho

con con el paquete reflex podría hacer

cualquier cosa que incluya texto código

y ahí está mi archivo y puedo generar la

solicitud de fusión ahora mismo e

incluso puedo generar como una

un borrador de manera que estoy

comunicando la persona con el que quiero

mantener esta conversación que este

archivo no está listo entonces digamos

efecto pasado incluido en la rama

principal y acá tendrías todas las

herramientas que normalmente tienes a tu

disposición para hacer la revisión y

mantener la discusión sin embargo me

estoy saltando es la idea de que en ese

archivo

localmente también volvamos a cerrar

esta idea primero acá

acá vemos tenemos en este caso este

comparte un archivo un nuevo generador

de este ente reprex

genera el texto del pp lo estoy pegando

dentro un nuevo archivo vd que lo cree

el repositorio nuevo para mostrar

simplemente que es fácil que es crear

compartir un archivo con estas

herramientas con reflex para generar el

código del hampa y con el yihab como una

interfaz para debemos poder publicar ese

archivo en algún lado y para tener una

interfase sobre la que tengas a la

discusión por ejemplo en este caso las

personas compartir el vínculo a estas en

situ de fusión a estudiar por respuesta

y de esa persona puede empezar la

revisión como lo haría por ejemplo si

quiere hacer algo acá

genial podría por qué darle

y

se puede empezar su revisión y esos

comentarios que te escriben aparecen con

esta interfase que parecida a los track

times y es que tienes

por ejemplo en world y la otra persona

luego puede responder y positivo y luego

se puede resolver a los geniales que esa

conversación se aparece también en la

solapa so estaba durante esta la solapa

de files en east pero también aparecen

como un resumen en la solapa de

conversación donde aparece digamos cada

uno de los comentarios que se agregan

aparecen acá y una vez que se adquiere

un comentario general gracias

[Música]

dios

si puedo empezar mi revisión y los

comentarios que se dice que se que se

hicieron sobre líneas en particular

aparecen muy bien especificados debajo

del comentario general y acá está listo

digamos el espacio para empezar para que

la persona responde

parece que la conversión hacia los

cuentos simplemente se crece hacer clic

en resolver la conversación lo que es

genial porque tiene un registro dentro

de la conversación de tu respuesta

y está colapsada conversación ahora pero

ahí está una que está resuelto falta

verla pero si quisiera volver

entonces genial estamos en esta línea

excepto que no hable es todavía de

dortmund

como cuál es el rol que juega elijas en

esta discusión bueno la idea siguiente

acá estaba haciendo reprex como un

archivo descartable pero qué tal si

en vez de eso quiero tener mucho texto y

muchas muchas implicaciones que hacer

conviene crear un archivo de marta

puedes generar el efecto acá html y

luego modificar un poco pero yo

recomiendo ya de por sí usar el temple

directamente porque porque eso tiene un

complemento específico diseñado para

comportarse genial

quiero mostrar fíjate como el output es

que el documento se llama tienes ya con

alguna opción acá que es

es útil porque adjudicada alguno de los

12 código que pones a abajo pero

recomiendo también otras versiones para

que el código pueda ser corrido

[Música]

voy a guardar esto como leemos

vas a abordarlo acá mismo a la raíz del

proyecto no tengo nada texto que para

correr pero no vamos a dejar el archivo

termo estaba con su código ok si esto va

correr gente que los el output de este

código tiene empieza como comentado de

manera tal que que lea esto lo puede

copiar esto ya es de por sí muy útil

pero bueno aprovechó oportunidad para

recomendar algunas opciones sólo que uso

de algún com en

leamos le copio de represa y uso el

comentario éste

y que más gusto también error y por sus

frutos porque si hay un error sin la

opción verdadero en error lo que pasaría

es que este archivo de implícitamente no

no se completa entre con la opción en

verdadero lo que hace si compete

simplemente el error como deberías y

finalmente este espacio que está acá por

ejemplo entre el código y el agua no

demasiado

pérez iago collapse

pues ya con esto el auto que vas a ver

es un poquito diferente más este como

compacto y fácil de copiar y de pegar

te haga con sola copia del texto que

venía haga ahí se estropeó acá y esto

con correa

entonces bien cuando vos hacés mí en un

archivo de aeromar none lo que pasa es

que te genera

un archivo de

m genera este output staples y lo

provincialistas es exactamente lo que

verías opciones que me pareció lo que

verías en quizá si lo muestra como si

fuera un archivo html si fuera una

página de internet para tu análisis lo

cual es genial porque en este caso

todavía no lo he empujado pero lo

primero que hacer digamos todo estos

archivos que saca de réflex son la

contaminación archivos temporales réflex

entonces lo que voy a hacer es

simplemente agregar a mi cómic los

archivos que corresponden el demo el de

mueve de que se la tiró los archivos

asociados a esto todo lo demás lo dejó

fuera del cómic

que más el archivo de los datos lo vemos

incluir

bien esto es lo que va a mí correr

entonces

[Música]

como digo obviamente tenemos que

escribir algo mucho más sutil y lo que

haga va a poner para este d

si quieres estar de todos los archivos y

parte

de este demo pero bueno lo hago así

rápidas se van

vamos de vuelta entonces ahora sí a

crear mi comida ya lo hice perdón

empujarlo de hecho ya interesante vamos

a deshacer un error que acabo de hacer

para demostrar cuál sería la mejor

práctica estoy en la rama master muy

bueno carga y lo que sería indicado es

casi el cómic en la rama en otra rama

hay un par de opciones que tengo para

mover

lo que mejor ha sido además emitir

recetas

vamos a poner estado conectado a un

comité antes de donde estamos ahora

entonces abás y yo refresco master para

sacar los archivos que dice tengo que

dar el último comité pero antes

agregamos ahora lo que voy a hacer es

vamos a especializar una nueva rama para

mostrar cuál sería el flujo de trabajo

correspondiente y linux

iremos

pues ahora está ramita aparece acá ahora

sí vamos a esa rama

y ahora para seguir las instrucciones de

verdad que me da

y me dice que tengo que recordarles

empujar al concierto podría despojar de

por acá pero me gusta es un montón de h

de subtes que hacen que el trabajo sea

más más entonces bien estoy va a punto

de someter esta solicitud de función

desde la ramita miremos de mí de este

repositorio demo en una cuenta de

usuario a la rama master como una

proposición del repositorio que tiene

mismo nombre pero en esta cuenta

de organización creemos esta solicitud

de fusión hagamos acá en este caso un

raf para qué

las personas que mantienen este

repositorio sepan que estamos listos

para

fundir el proscrito de fusión pero sí

que queremos mantener una conversación

del muchacho que cambiaron acabemos todo

lo que hay el archivo de datos vemos el

archivo de ahora estamos oficiando como

si fuera la persona que reviste vista

pero también como los trópicos podría

hacer un comentario sobre el código por

ejemplo

ya puedes empezar un comentario simples

a empezar una revisión

e

acá vemos el archivo m de que es el

producto de haber hecho el mi archivo rm

y el último es que una imagen png

también por visualizar todos los

archivos relacionados a esta función y

estamos en espera de que hay

entonces resumiendo

y lo más interesante ahora de hecho es

cuando usted ya tenéis el archivo md

generado como lo tengo acá

empecé con este archivo y zenit acá

este archivo de media automáticamente

por el proceso de nick y este archivo md

que se genera en ese archivo lo puedes

compartir pero puedes visualizar el kit

hub

y este vínculo lo compartís con

cualquier persona

el código tal como hemos recomendado

lo que hace justamente cumpliendo las

propiedades de una conversación

productiva porque está el código que

corre no vemos y que nos debe acordar

porque lo veo violado puntos y cielo

puede copiar y pegar en mí

con solá y de viejo

así que bien entonces vamos a discutir

este escenario tenemos un solo archivo

pero en realidad fíjate que en realidad

no fue solamente un archivo fueron

varios archivos de hecho solicitud de

fusión y último cómic tiene como

habíamos dicho veces estos textos varios

archivos entonces en este caso también

es importante dejamos destacar qué

en cierres pidió clave el super un tipo

yo podría compartir también este link

lo cual es genial porque la persona que

revisa mi proyecto

yo le doy este link no pueden recibir

directamente y empezar a trabajar sin

instalar en sus computadoras

ninguno de los paquetes que necesito

como dependencias de este proyecto lo

cual es políticamente correcto si no

corresponde tomarse libertades sobre las

computadas de otras personas y nuestro

porque esto

el código que queremos discutir queremos

conversar tiene dependencias de ir a

otra persona tiene que correr no estamos

alguna forma obligando a instalar esas

dependencias para poder ver la discusión

entonces en esos casos quizás es mejor

crear un proyecto de estudio cloud que

ya tiene tres dependencias instaladas y

la persona con la que tenemos la

conversación lo puede abrir servirse a

correr y sin modificar su propio

computador

y si no tienen ese proyecto tampoco es

gran cosa porque en digamos desde el

repositorio en sí verdad podrían ellos

copiar la dirección de ekin dónde está

ese repositorio

y abrir un nuevo proyecto ahora con la

opción de nuevo proyecto de dirija

entonces a la sedeso pegan el vínculo y

pueden generar directamente de ricky de

hub un un clon en el estudio clave pero

claro la única diferencia que bueno

ahora tienen que instalar ellos mismos

los paquetes que sean dependencias del

proyecto

no es un gran problema porque incluso de

avisa si un script

por ejemplo llama por library llama en

un paquete para mirar un paquete que

está instalado porque yo hiciera

y

ah

vamos así

o

bueno es que me está avisando que vean

esté instalado servicio de instalar

porque esto quiere decir que es el paso

más importante es tener el repositorio

en github con el vínculo a posteriori ya

es muy fácil para la persona que va a

revisar tu código y generar un proyecto

que no contamine su propio sistema

podría haber un proyecto pero aún mejor

si quiere facilitar la comunicación ya

crear

directamente y otros sé que ellos

quieren de mieres y si se van por la

ruta vamos a borrar este proyecto si

ambos la ruta de hacerle fecha ocurre

pues que acaba de someterse si quieren

importar el código que acaba de someter

otra ruta para ello sería simplemente

usar la observación de esas solicitudes

de función desafiar vamos a demostrar

eso a ver en qué estado estamos acá

entonces por ejemplo digamos que estamos

acá en este

en este repositorio estamos trabajando

con esta repositorio dentro de esta

organización y que hay varias

solicitudes de fusión y esta última ya

mi código en la que la persona que

quiera revisar que mande la conversación

contigo la conversión la va a tener acá

mismo en los países

6 acá en conversación si es de la

interfase que usan para la discusión

pero si quisieran correrse cogió saben

que esta es la solicitud de función

número 15 entonces se viene esto

sería sobre el tuyo y tiran directamente

de esa solicitud de fusión para

demostrarlo voy a abrir otro proyecto

simplemente para cambiar el directorio

y voy a borrar el proyecto que está

asociado al repositorio demo

y lo vamos a empezar a decir que no

y estoy empezando de cero con un

repositorio que es un clon

de repositorio la organización central

pero ahora voy a hacer variar fecha hoy

quiero ver la solicitud de fusión

15 ok entonces hacemos pierre fecha está

dentro para que te justice le digo que

quiero traer que la solicitud de opción

15 y como ves es a su disposición tiene

este par de archivos más

la capita de datos

estos dos archivos y este archivo y

tomás que corresponden a los cambios

agregados a su criterio entonces ahora

si podría no sería muy fácil por esta

razón a volver a correr el código y

verlo discutirlo y entonces lo más

importante de todos es mover tu código a

níjar que está justamente diseñado para

mantener nuestras destructivas

bueno con eso cubrimos

este último paso

y se termina tenemos acá espero que les

haya sido útil entonces cubrimos

básicamente la parte de primero en otro

vídeo anterior la parte más teórica de

por qué está la población es de código

productiva cuáles son los elementos más

importantes código que tiene que correr

juego que no tengo que correr pero que

se hiciera de manera fácil y básicamente

hemos compartido un par de ideas

lo último que dejar son con herramientas

de hecho que permite implementar esas

ideas de la forma más fluida posible y

vimos cómo trabajar con herramientas

según la cantidad de herramienta a

utilizar según la cantidad código que

tenga mucho código poco código como en

este caso puede ser reflex y

compartirlas simplemente por solar

artist y cuando tenés un archivo o

varios archivos ya estamos pensando en

trabajar dentro de repositorios de git

hub si es solamente un archivo puedes

usar la interfase de giza para agregar

archivos subirlo desde tu computadora oa

greco creado ahí en el aire

pero está súper recomendable usar y

quizás dos meses porque te permiten

visualizar directamente los archivos

como si fuera una página de internet

y finalmente si tienes muchos archivos

bueno quizás quieras pensar en crear un

proyecto de estudio claro que ya tenga

las dependencias del código que quieras

discutir ok espero que les haya servido

gracias
