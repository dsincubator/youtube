---
type: Video Transcript
title: "Evita solicitudes de fusion interdependientes"
description: "ahora os voy a hablar sobre el problema  de la solicitud de defunción  interdependientes que quiero decir con  eso permítanme presentar la siguiente  situación "
resource: "https://www.youtube.com/watch?v=hs_Pzxny7XE"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=hs_Pzxny7XE"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

ahora os voy a hablar sobre el problema

de la solicitud de defunción

interdependientes que quiero decir con

eso permítanme presentar la siguiente

situación

supongo que suena construido ahora un

contribuidor y estoy trabajando en una

solicitud de fusión

luego antes de que se solicitó de fusión

sea incluida en el repositorio fuente

aquí quiero someter esta solicitud de

fusión empiezo una segunda solicitud de

fusión desde la punta de la primera

ahora la perspectiva de la mantenedora o

el mantenedor esta persona observa la

solicitud de función número uno la

revisa hace algunos cambios e incluye el

repositorio fuerte ahora la solicitud de

fusión número dos que dependía del

estado inicial de la solicitud de

función número uno la turista fusión

número dos ahora quedo con algunos

conflictos que no son necesariamente

conflictos en el sentido estricto de los

conflictos que observa bits pero si es

una situación en la que no se puede en

que la solicitud difusión no es

perfectamente vale entonces en este caso

quiero demostrar el día de hoy con una

motivación para evitar hacer solicitud

de fusión que son interdependientes y en

el caso de que no

podamos evitarlo para tener una idea de

qué problemas podemos llegar a encontrar

bien voy a estar usando el paquete y

ustedes aquí no lo estoy mostrando en

pantalla pero la primer llamada que

tenemos que hacer es library justice

para poder usar las condiciones de este

paquete además voy a estar asumiendo a

partir de ahora de que ya tenemos una

copia local de nuestra bifurcación del

repositorio fuente entonces si utilizase

la mano pueden ir a un repositorio

fuente hacer click en el botón folks que

significa bifurcación para así crear

nuestro foro luego hacer un clon local

copiando la dirección de ese de esa

filtración normalmente en el botón verde

que dice clonar y digamos vincular esa

dirección en el estudio una forma muy

fácil de hacer todo eso es también con

una función del paquete ilustres esta

función se llama create from here hub y

es alumno que yo usé en particular para

deshacer todo en clave de el cablerío

que necesito para esta demostración con

ese estado ya con todo conectado ahora

sí voy a mostrar desde la perspectiva de

un contribuidor o una construida como

iniciamos una solicitud de función

lo hacemos por ejemplo con la función pr

y knicks y el nombre de la rama el de

rama que queremos asociar a esta

solicitud de fusión eso es lo que corro

aquí y está mostrado en pantalla y todo

el cablerío entonces queda conectado en

ese estado ya podemos empezar a hacer

cambios vamos a empezar a trabajar en

este caso creó una función

efe que es una función muy sencilla y la

pongo en un archivo llamado f punto r

para que la función y el archivo tengan

nombres que empatan

luego sabes archivo algún comité y lo

empujó a guinea como empujo bueno para

la función pr puso esa función va a

dejarme en una ventana de mi navegador

que luce algo así coloquemos en la

segunda mitad de la parte de abajo de

esta pantalla donde tenemos una

interfase en la que podemos chequear que

el commit que hicimos acá en la rama pr1

asociada a esta puzzle quest dentro del

repositorio en este ejemplo abc de el

dueño mauro le pone ese comité quiere

ser sometido a la rama master del

repositorio abc del dueño

org

vemos también que mucho color verde lo

cual significa buenas noticias significa

que esta rama no tiene un conflicto con

la rama base con esta rama master bien

la respuesta no tiene conflictos con

master

y estaríamos en condiciones de hacer

clic en este botón crear por respuesta

para pasarlo

ahora bien como les decía lo que estoy

mostrando ahora es este caso no ideal en

este caso que queremos evitar en el que

iniciamos una solicitud de fusión número

2 pr 2 puestos desde la punta de la

solicitud de fusión número 1 antes de

que la solicitud de fusión número uno

sea fundida con la repositorio central

si lo que queremos evitar y por lo tanto

el paquete justice nos da una alarma

cuando queremos iniciar la pgje la pr-2

desde la punta de pr 1 y nos dice si

estamos seguros que queremos crear una

rama local una respuesta local

desde un padre que no sea la rama master

como decía eso es lo que queremos evitar

pero en este caso hagamos de cuenta que

estamos absolutamente seguro de lo que

queremos hacer entonces voy a elegir la

opción todos para rosell

ahora bien ya estamos en nuestras

rama asociada a la solicitud de función

número dos así que empezamos a hacer los

cambios que queremos agregar supongamos

que lo que queremos hacer es agregar una

nueva función g entre las líneas 5 y 7

en este archivo dentro del mismo archivo

donde estaba

efe porque porque bueno en la función

que va a estar llamando a la función efe

creemos que es una buena idea colocar

los archivos

bien entonces el archivo efe r contiene

ahora no sólo la función f que ya

existían sino además esta nueva función

g

avancemos por aquí salvamos de archivo y

hacemos en un cómic podemos borrar la

función para re puig para enviar ese

cómic nuevamente a nuestra diputación en

github nuevamente la función pere puig

nos deja en una interfase como la que

dieron anteriormente donde podemos

chequear que el commit que hicimos en la

rama pr2 del repositorio abc del dueño

mauro quiere ser fusionado con la rama

master del repositorio a veces del dueño

al por vemos verde ningún problema y

hacemos clic en el botón crear y crear

solicitud de función

ahora bien cambiemos de perspectiva

ahora hago de cuenta que somos la

mantenedora o mantenido de este

repositorio desde esa perspectiva con un

clon local también de este repositorio

la mantenedora podría correr la función

laurel y justice para empezar a usar las

funciones de justice y luego la función

pr fecha con el número asociado a la

solicitud de fusión y aquí paremos un

segundo recuerden para nosotros

mentalmente la solicitud de función

número uno

en realidad está asociada a un número

que viene a agregar arbitrariamente o

secuencialmente y en este par caso

particular esa certeza que cuesta uno

para el que tiene el número 5 entonces

con la función perfect 5 la mantenedora

de este paquete recibe la solicitud de

fusión

que para la construido ahora o

construido eran 62 son número 1 por eso

que acabamos perder fecha en esta

llamada a la función con el número 5

pero aquí abajo vemos que la rama de la

que viene es la rama llamada pr 1 porque

ese es el nombre arbitrario que le dio

la mantenedora o el mantenedor pero ha

construido grado contribuido de esta

solicitud de funcionar en particular

bien avancemos ahora además de cuenta

que la mantenedora de este paquete ve en

la solicitud de fusión y decidí hacer

algunos cambios pequeños por ejemplo

a la función que se llamaba f aquí

mostrar en rojo la decide llamar main

andrés con eso se hace un pequeño cambio

el nombre de la función y para emparejar

la función con el nombre del archivo

también cambie el nombre del archivo

entonces la situación verde de la

situación que ha dejado la mantenedora

de este paquete y la situación en rojo

en la situación que había dejado la

contribuidora contribuidor del paquete

de la fusión entonces bien ahora vamos a

mirar aquí arriba

la mantenedora de este paquete acá y un

mensaje de comida y lo empecé con la

letra m simplemente como para más

explícitamente demostrar cuál es el rol

de la persona al hacer este cómic pero

por supuesto que tienen que escribir

si son mantenedoras o contribuidoras

entonces por el mensaje que escribe esta

mantenedora es por ejemplo renombrar

la función a mi me mandes cordial a mí

efe

bueno con ese cómic hecho ahora el

próximo paso sería para esta mantener a

empujar la solicitud difusión hija

entonces lo puedo hacer para función

pere puig al igual que lo había dicho

antes la contribuidora o contribuidor de

la solicitud de fusión

ahora bien en este en esta pantalla en

la parte de abajo lo que estamos viendo

es cómo se vería la secuencia de cómics

hechas

al repositorio fuente una vez que la

solicitud de fusión ha sido fundida con

la rama principal de brahma master y de

una forma especial de una forma que sea

más

waters que lo que hace es colapsa lo que

sí hay varios comités asociados a esa

solicitud y fusión los colapsa en un

único comité y le da a la persona que

está haciendo él se colapse

o lanzamiento estando la posibilidad

también de reescribir el mensaje del

cómic entonces acá en particular este

squash merge que hace la contribuidora

el parón la mantenedora de este paquete

lo que está haciendo es cambiar el

mensaje de commit lo entronizó un poco

agrega el número de la solicitud de

función a la que está asociado agrega

también un

cuando el nombre de usuario de la

constructora ha construido y también

agradece ha contribuido ahora o

contribuir aquí en el mensaje y hace una

firma de esta revisión con su primer

nombre segundo nombre apellido y el

línea de la mantenedora o mantenedor

bueno eso sería como luciría el producto

final de haber fundido la solicitud de

fusión número 1 a la rama central master

del repositorio y fuentes

ahora bien recuerden que había una

solicitud de fusión en número 2

en que la contribuidor ha construido de

esta solicitud de fusión quería someter

también entonces el siguiente paso

cuando uno cuando una solicitud de

fusión que no está trabajando es

fusionar una recibí un email se entera

que ha sido aceptada otras a entonces

esta contribuidora podría venir a su

repositorio a su clon local del

repositorio bifurcado del repositorio

fuente y correr la función pr-5 para

sincronizar su

en solicitud número 2 que es en la que

está trabajando ahora con el nuevo

estado del repositorio fuente que

incluye no solamente el commit o los

cambios hechos por la construido la

inicialmente en la solicitud de función

número uno sino que además incluye

cualquier modificación que era mantener

ahora un mantenedor del repositorio

fuente hay incorporada entonces bien

hace en este caso desde la perspectiva

de la construido ahora corremos la

función pr-5

y no vemos nada raro ningún error aquí

porque no hay en el sentido estricto de

git no hay ningún conflicto pero desde

una perspectiva de la intención de la

construido ahora o del mantenedor

si el conflicto y es el siguiente

recuerde que la contribuidora había

creado este archivo efe con la función f

y luego la contribuidora había creado

no había renombrado a mí f

renombrando el archivo y la función sin

embargo al hacer una sincronización de

la pool revueltos con el reportero

central lo que vemos es que ambos

archivos existen eso porque bueno porque

él aburre quest 2 tiene aún el comité en

esa rama existe el commit quien creó el

archivo efe con la función f

pero

las olas

el commit que viene sincronizado desde

la actualizada rama master del

repositorio fuente tiene el commit que

cambió ese archivo y permanece archivo

al nombre me efe y la función vida

entonces ahora nos encontramos con que

estos dos comités están ahí esos buscan

tipo cambio están ahí y son duplicados o

sea no necesitamos eso en estas

solicitudes de número dos tenemos que

limpiar esta situación entonces es bien

veamos cómo lo podríamos hacer en el

lenguaje de comidas bien el primer paso

que podríamos hacer vamos a enfocarnos

por el momento de la parte superior de

esta pantalla el primer paso sería hacer

un comité que mueva la función g que

estaba anteriormente en archivo efe

punto r y lo movemos al archivo efe

punto ar

y luego editamos la función g para en

vez de usar la social efe puse la

función efe

y el tercer paso sería remover el

archivo

enseñar los pasos que tendríamos que

hacer para limpiar esta solicitud de

función número dos problemas sutiles que

no han sido alertados automáticamente

por la función pero 5 % son conflictos

en el sentido estricto de keats

habiendo limpiado entonces esta

solicitud de fusión ahora si podemos

correr la función de r

push para enviar esta serie decomisos

tres comités nuevamente a kim para que

la mantenedora de este repositorio los

puedas revisar y potencialmente rechazar

o aceptar

entonces bien ahora volviendo a la

perspectiva de la mantenedora vemos que

ha hecho un squash march y otra vez esas

eran varios cómics asociados a la

solicitud de función número dos pero los

ha colapsado en un único comité para

dejar la historia de este repositorio

bien limpia y escribe algunas notas

algunos comentarios por ejemplo que se

relacionan a la solicitud de función

número cinco que le agradece para

contribuidor o contribuido ahora y

también firma con su propio nombre de su

apellido y su vídeo

ahora bien ya el trabajo está terminado

entonces

supongamos desde la perspectiva de la

construido ahora bueno podemos correr la

función pvr

finch que lo que va a hacer es cambiar

a la rama master del repositorio local y

luego hacer un pull o sea traer los

metadatos del repositorio central y

luego fundir los con el repositorio

local

trayendo de esa forma o sincronizando de

esa forma el repositorio local con el

repositorio weight y finalmente borrar

la rama pr2 que estaba asociada a su

función número 2 que ya ha sido

fusionada así que no lo necesitamos más

entonces lo que tenemos localmente ahora

es una historia de git mostrando la aquí

abajo limpia en donde hay este primer

comino este cómic del medio que vemos

aquí es el commit que ingresó al

repositorio central luego de haber

incorporado la solicitud de fusión

número 1 que tenía el número que tenía

que ver donde ni el número 5 y este otro

cómic que es el asociado a la solicitud

de fusión número 2 o sea que por cada

solicitud de fusión y respectivamente de

cuántos comités tenía cada una de ellas

luego hacer los cuales merge existe

ahora un único comité por cada solicitud

de fusión con una historia lineal una

historia limpia y bien clara de lo que

ha pasado

entonces si quisiéramos ver cómo luce el

archivo final en este último como

podemos ver esta es la diferencia aquí

podemos ver que tenemos en el archivo

efe tenemos la función mi jefe y abajo

primero función g que usa la función may

efe en su cuerpo muy bien con eso

terminamos de

y demostrar lo que quería contarles hoy

recuerdo estamos viendo este problema de

solicitud de fusión interdependientes

que es un problema que queremos evitar a

toda costa en el caso de que no podamos

bueno este vídeo les muestra el tipo de

problemas con el que se puede encontrar

qué tipo de cosas hay que buscar y cómo

resolverlas muchas gracias
