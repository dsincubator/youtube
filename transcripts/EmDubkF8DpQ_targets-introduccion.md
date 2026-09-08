---
type: Video Transcript
title: "targets: Introducción"
description: "estoy súper entusiasmado que en el data  science incoder estamos empezando con  una nueva serie la serie sobre el  paquete target siete juegos cantado la  seman"
resource: "https://www.youtube.com/watch?v=EmDubkF8DpQ"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=EmDubkF8DpQ"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

estoy súper entusiasmado que en el data

science incoder estamos empezando con

una nueva serie la serie sobre el

paquete target siete juegos cantado la

semana pasada al último sha week tenemos

el privilegio de reunirnos con él nos

contó un poco la motivación de targets y

le llamamos un poco también de sobre él

y lo conocimos que eso es bueno fue

genial como para comparar como para

empezar sin embargo hicimos nada

con código nada en vivo fue solamente

una charla y el día de hoy empieza

entonces esta nueva serie desde el punto

de vista de

de código

vamos a empezar bien despacio la idea

hoy es mostrar lo básico de targets más

o menos para entender cómo es la

estructura de un proyecto de targets y

cuál es el beneficio en la audiencia en

general de esta serie y de este

de este mitad en especial es cualquier

persona que trabaje con un código que

pueda correr lento

aisha y donde esta vez agrega mucho

valor puedes usar targets en proyectos

que no tengan código lento pero en

general no tiene demasiado beneficio ahí

a ver qué más podría contarles hay un

repositorio bueno lo que están viendo en

pantalla es el guiso asociado a esta

serie ese dicho el inicio número 70 del

repositorio la tasa de 50 en un tú

dirías investing y ahí voy a poner los

dos distintos recursos como por ejemplo

el link al repositorio hacemos clic ahí

y aparecemos en el repositorio que voy a

estar demostrando el día de hoy en

particular voy a estar mostrando lo que

está en este archivo 01 web free y voy a

hacer esto en vivo así que no hace falta

prestar atención ahora pero simplemente

sepan que hay ahí un registro de lo que

voy a mostrar si quieren volver a esto

con más tranquilidad después o si

prefieren el formato el texto el mes del

formato vídeo

además en el repositorio tenemos un

pequeño ritmo donde está el programa de

lo que vamos a estar haciendo ya hicimos

esta primera excepción la reunión con

cuidado y hoy estaríamos acá en el box

truck el objetivo del día de hoy es

y aprender cómo configurar un proyecto

de targets y explorar la estructura de

ese archivo de hecho vamos a usar el

archivo que viene por defecto cuando

creamos un proyecto de targets y vamos a

explorarlo un poco vamos a encontrar

alguna de estas funciones que son de las

más comunes de las más útiles a mi

entender y

y vamos a ver cómo sería un reporte

minimalista con targets y cómo sería

crear y transporte en minimalista con

tareas y vamos a hacer una pequeña

modificación diagonal del código que

viene con el ejemplo de juguete que

ofrece tablets vamos a modificar un

poquito para que se sienta más el efecto

de necesitamos el beneficio detalles

cómo se va a transformar ese código que

viene ahí en un código un poco más lento

y ver cómo tardes ayuda y bueno más

adelante vamos a ver otros tópicos y

luego está todo un poquito abierto

porque yo mismo estoy aprendiendo sobre

targets así que estoy tratando de

identificar cuáles son los temas más

útiles pero ya creo que estos tres

puntos

tiene como que lucena que va a ser lo

que vamos a estar hablando ha mostrado

sobre funciones como mover

nuestro código de una vez es código o

proyectos que tienen la estructura de

una secuencia de scripts cómo podemos

transformar esto en un pipeline de

funciones vamos a también abordar el

tema de las mejores prácticas y explorar

un poquito de babín hay un par de otros

temas más súper interesantes espero que

sean demasiado profundos para el

objetivo de esta serie

aquellas personas que estén interesadas

en aprender más el lugar siempre es este

el manual de targets que es fantástico

es un book town

ahí vamos a encontrar

el material que le da origen a lo que

está mostrando en esta serie de mitad

sin embargo nativo está muchísimo más

profundo o mejor explicado por supuesto

la documentación de wil es fantástica

así que aquellos que quieran aprender

más

ahí es donde puedes hacerlo entonces

bien que tenemos acá porque voy a hacer

es ponerme este archivo

voy a poner cada una pantalla al lado

para

para guiarme con él pero lo que me está

mostrando es demo en vivo así que

tenemos acá un proyecto de estudio

que como pueden ver solamente tiene un

único archivo del archivo de

de estudio

y no tiene además por ahora entonces el

primer paso para usar el paquete de

veces como de costumbre

hacemos library y ya tenemos acceso a

todas las funciones de targets la

primera función que voy a mostrar es

todas las acciones y tareas invitan

contar y entonces es una ayuda a buscar

las heras pero ya sé que la que quiero

hacer es usar ese script

tal script te ayuda a sentir un nuevo

repositorio a configurarlo a configurar

un nuevo proyecto de targets y lo que

hace es generar este archivo tan bajo

target punto r en la raíz del proyecto

entonces podríamos cliquear en ese

archivo y abrirlo o también existe la

función de ajustar

así que va a abrir el archivo y

demostrar su contenido vamos a expandir

un poquito la aparte de eso estoy acá

para ver qué es lo que tenemos acá

este archivo es muy chiquito es

minimalista pero sin embargo de pinta

muy bien

la pintura de qué es lo que pueden

estructurar fundamental de un proyecto

de targets entonces vamos a hablar un

poquito qué es lo que trae este archivo

como no se nos guía en el uso de este

paquete entonces este archivo es

fundamental sí y empieza siempre con las

llamadas o sea con las llamadas library

y el nombre de tablas y de esa forma

todas las funciones que se siguen abajo

y que pertenece al paquete de targets

como por ejemplo esta van a estar

disponibles es así cómo empieza el

archivo

este archivo y un bajo tan regio que

define al proyecto como un proyecto de

tardes

más abajo vamos a ver qué son los

distintos targets este es uno y este es

otro y todos esos suárez metidos adentro

una lista vamos a borrar ir borrando

como para que quede más limpia la

estructura de este archivo lo que ya

hicimos es usar estas estos funciones

start script y tal de taksim lo que hizo

fue creó el archivo

target punto de registrar edito abrió

entonces esa podemos

una vez que tenemos un pipeline

descripto como lo que tenemos en este

momento simplemente podemos correr la

función tal mail y vamos a sin entender

demasiado qué es lo que lo que tenemos

acá vamos allá simplemente correr a

presentar mails para para ver confusión

lo que hace targets es a usar estas

expresiones asociadas a cada uno de los

tres es una expresión y esta es otra

expresión si las cordes sabe targets

cómo hacer para correr

y cada una estas expresiones el

resultado de esas expresiones y voy a

hacer un único objeto que puede ser

guardado

en un archivo y se le da cuando en este

caso el resultado de correr esta

expresión

se guarda con el nombre se asocia el

nombre de data y el resultado de correr

esta expresión que subes depende de lo

que corremos antes se guarda bajo el

nombre este es amar es entonces cuando

hicimos darme lo que acá podemos ver es

que targets corrió el target llamado

data se hizo corrió esta línea destaca y

después también corrió el estar de

llamados a marek se recorrió está en mi

lista acá y terminado porque no había

más nada

entonces lo que una vez que la biblia

corrió al que target ya decimos llamamos

a la fusión medio para crear todos los

targets podemos usar la función flip en

este caso

en este caso en el caso del ejemplo nos

está proponiendo llamar por ejemplo a

esta madre como samar y ahora es un

objeto que existe que también conoce y

lo tiene guardado en un lugar de hecho

tienen guardado acá en esta carpeta con

bajos targets

y podemos simplemente hacer tan lisa

marie y vemos el resultado de ese objeto

tal como si hubiéramos nosotros mismos

corridos el código a mano y lo asignamos

a un objeto llamados amarillo y luego

imprimimos

samán

de hecho la estructura de esta carpeta

no es en este momento súper interesante

pero no se le quiere explorar allí va a

encontrar estos objetos que también es

que en nuestro nuestro nombre entonces

vamos a volver a cada país entonces con

esto podemos tomar

después de haber llamado al paquete

targets el archivo sigamos un poco con

la anatomía del archivo bien bajo tareas

después haber llamado a la función live

con un argumento targets lo que hacemos

es que ya sea definir directamente

cualquier función que necesitemos usar

en estas pipeline

en este caso la función sham wm la

usamos acá y esa función en algún lado

tiene que estar creadas una función que

hacemos nosotros es una función que

viene con el rebase compact y si la

función personal

entonces bueno en algún lado tenemos que

definir esta es una opción pero

obviamente esto es un ejemplo de

juguetes no es la corrupción la mejor

opción es definirlo en un archivo

y el autor de tales recomienda que ese

archivo viva en la carpeta r dentro de

archivos llamados funciones entonces

podríamos hacer eso ahora mismo si

quisiéramos podemos hacer crear

a la carpeta r ahí la tenemos y ahora

vamos a crear un nuevo archivo llamado

funciones

no hace falta que hiciéramos nada por

ahora vamos a salvarlas

vamos a poder entrar

esto sería la recomendación que hace el

autor

y en ese caso si nosotros no hubiéramos

esta función de acá

el archivo que acabamos de crear las

funciones si en ese caso en vez de

vamos pegar la función acá en texto

directamente hacemos todos

entonces de esta forma llamamos scripts

externos podría ser varias varios

archivos en este caso tenemos un solo

archivo llamado funciones pero podría

hacer una serie entonces ya vamos viendo

que vamos dejando más limpia la

estructura del archivo ataques primero

llamar a target luego

hacer shows en cualquier función que

necesites nuestra película y luego

tenemos opciones que son específicas de

targets así como no sé normalmente en el

código de análisis hacemos por ejemplo

la grada y playa bueno en este caso

estamos dando un país line de targets

esos paquetes se los pasamos y dentro

del argumento paquetes que si tuviéramos

más de un archivo simplemente lo que

queramos usar youtube

así es como lo haríamos

pero así es como llamaríamos a los

padres esta llamada target's luego

importar todas las funciones que

necesitemos luego sentir las opciones

que van a ser aplicables a todas las

partes si éste es un parque esto es un

aparador target este es un target este

es otro target y todo esto en conjunto

sería el piper

podemos hacer es decirle a tablets que

utilice estos paquetes en todos los

países o podríamos usar el argumento

paquetes dentro de la función de cada

uno de los planes pero estas son

funciones generales ya lo que vamos acá

afuera se aplica a todos los targets

pero después también tengo la opción de

controlar con algunos argumentos de la

función tan targets como se dice cómo

actúan las cada uno esos tales en forma

independiente como muy parecido hacia

una escalera la experiencia de usar

archivos de rd martãn en el primer champ

de todos suele ser un archivo unos

entrantes edad donde uno dice cuáles son

las opciones que aplican a todos los

chats

pero a su vez después sobreescribir con

opciones que una aplica a chance

específico entonces esas formas no

tienen como dos capas de control una a

nivel global y una a nivel particular

bueno y finalmente termina el archivo

que targets punto f con una lista de

targets y entonces este es un target

este es otro target y esta es una lista

de targets y eso es todo

esta es la anatomía de un archivo

targets punto

ahora bien

si yo hago dar make nuevamente como

pueden ver me está diciendo que ha

salteado los distintos tareas por qué

por qué no cambió nada en el código que

haya afectado a los tres que ya están

registrados entonces para ahorrar

computación

tal vez sabe que no hay nada que ha

cambiado y simplemente se salte entonces

por eso que nos hace ahorrar tiempo en

este caso quizás no sea muy evidente

porque esta definición

corre rápido de por ciclo si nosotros

hiciéramos sistema si existe un miedo

por ciento segundos por ejemplo

salud haríamos un cambio entonces si yo

corriera esta pipeline

nuevamente mail

van a ver que esto va a tardar un

poquito pues te está tomando esos cinco

segundos que yo le obligue a la función

son a esperar

entonces bueno ahora ya tiene algo más

sentido

target se hizo fue notó que el código

fuente de la función se cambió la correo

para rehacer el papel pero solamente

corrió que es corrió el target exámenes

porque porque es acá

en xamarin el único tal vez que depende

de la función sanz este otro target

llamado data no depende de esa función

entonces es 0 santiago es así como tales

súper eficientemente nos ayuda a

trabajar con código lento y ese es el

beneficio principal que nos trae

entonces bien a ver ya vimos la función

tal vez script tiene una función

edith una de funciones que pueden ser

interesantes incluso antes de correr tar

mail por primera vez sobre todo si el

pipeline es lento en la función start

clips que nos va a dar una pequeña

visualización abreviada de

el estado de ese parque eso está bueno

porque a veces uno ya puede identificar

visualmente que hay un problema con él

lo que creamos

incluso antes de subir el tiempo

necesario para correr el página otras

funciones que pueden ser útiles a ver

demos un dictó que las tiradas por aquí

las tenemos en él

archivo d

de workflow exactamente al principio

estalvis network funciona muy parecida

network viene de visualizar

la red de conexiones es parecida crisis

de mando un poquito más de tiempo que

hace más cosas para nosotros pero es

como también más informativa porque nos

da más información sobre que está

actualizado que no está actualizado

si por ejemplo ahora todos los targets

son actualizados porque también corrió

sin suicidarme

pueden ver que debería estar todo todo

se saltea también puedes buscar a

representar a ustedes para saber si hay

un target y está desactualizado y la

respuesta es no pero si nosotros

cambiamos nuevamente código fuente por

ejemplo de esta función para darle tres

segundos de espera de media 5 y ahora

nosotros pudiéramos correr estarte

identificaría que es target summer y

depende porque depende de sham de esa

función que acaba de cambiar entonces y

esta estatuilla lo cual también

significaría que si nosotros hacemos

tarvis network esperaríamos que este

target de a casa me cambie de color

y ahí está cambio porque porque ahora

está desactualizado y esto también está

desactualizado porque es esa mentalidad

samán y también depende de depende de

esa entonces y nos hacemos mail ahora

volvemos a correr ahora se está tomando

el tiempo que corresponde y vamos a ver

ahora si ya está

y entonces

como usaríamos esto en un reporte por

ejemplo bueno simplemente si nosotros

quisiéramos reportar los resultados del

análisis en un nuevo archivo digamos de

rr martin aun supongan se vamos a hacer

a borrar todos acá vamos que tenemos

este archivo

y queremos reportar reportar

dos análisis

entonces lo que tenemos que hacer es

simplemente usar los targets ya están

definidos o sea usando la función start

tweet bueno primero vamos a tener que

usar

así es como es de costumbre empezar con

un chain que haga

pero que haga una llamada a los paquetes

que necesitamos luego timezrit para leer

porque el plata estar dispersa maris

son maíz

y ya podemos hacer una pequeña previa

previsión y sesión y sesión hablo

vamos a guardar los targets vamos a

abordar la raíz

acá vemos cómo está el resultado

quedando me gusta esta idea de empezar a

correr el r manera lo antes posible

antes de no terminar para ir viendo cómo

va creciendo entonces hicimos un será

así

luego hicimos

importamos datos

los esperamos un poquito esto veo que me

queda un poco largo entonces para de

llamar 70 puede ser estar dadas para

hacer gentes o de cualquier otra la

miradita no es mal dato porque este es

el nombre del elemento que queremos leer

y vamos a hacer algo así entonces ahora

ya debería esto ser un poquito más chico

me encaja en la pantalla fantástico y

rip summer y ahí lo tenemos también

entonces ahí ya podemos jugar cómo es

que se que se hace como que es que se

usa el resultado de un piper simplemente

no estar que ya están creados no hay que

re computar los y ya ya llamamos a la

presión tal mente no hay que computar

los primeros usamos los leemos contar

read

o también podemos usar la función

karloff la diferencia es que están locos

lo que hacen los mete en nuestro web al

embargo como puedes ver acá bien también

de no tiene objeto si yo hago tarde

y no sólo asignada a data puedes ver que

en el archivo el objeto ha sido leído lo

que va con la consola pero mi ambiente

global no ha cambiado sin embargo si yo

hubiera hecho tar loud

se comporta cómo se comporta la función

lo normal de rivas y vemos qué datos

aparecen en ésta

y después

los datos digamos que quiero hacer

blogs de datos

y ahí está el reporte completo

bien esto este proceso de escribir el

archivo de remate también puede ser

incorporado en la función targets y de

hecho hay una función de llamada

aprender porque estoy

por el número que hay está

estar vender

esto es

[Música]

se llama tal friend evitar que tales

no es está en el paquete también

directamente sí no

en otro paquete del motor que da a

algunos algunas opciones algunas

funciones

son super super convenientes y que nos

ahorran escribir demasiado en la

de hecho no estoy seguro si lo metemos

acabamos elementos acá eso lo voy a

tener que confirmar porque cosas lo

comentó en otro vídeo vamos a hacer así

y acaso yo no podría decir el nombre del

archivo en este caso estoy

lb

e

y ahora cuando agotar médico

médico

paz y zinc

parece que no conozco estas funciones

recientemente bien de hecho es cierto

porque no he leído la alimentación y lo

dice un poco por intuición el nombre de

tareas por supuesto

y

al mail

[Música]

a esta utilizaban el reporte ya no tengo

que venir acá manualmente y hacer ni si

lo puedo dejar eso a cargo de él

de la pipe plan en sí mismo me molesta

que diga ante arriba vamos a ponerle

vemos

y fíjense no voy a hacer clic acá en

meet en vez voy a irme acá la consola y

voy a llamar a make le voy a decir a

tareas que se ocupe de hacer un render

de ese reporte entonces ahora para

confirmar su mejor archivos voy a fijar

si el archivo toy que es el resultado de

haber corrido

haber hecho sobre el rm de ahora si

tiene ese nuevo título

que yo le di y efectivamente hay drogas

o sea que efectivamente es target se

encargó de correr al archivo estoy rm de

en mi nombre con eso vamos cerrando

llegué al final de lo que quería

mostrarles hoy vamos a ver

si tengo algo más como para resumir

el beneficio creo que está claro que

solamente es notable cuando tenemos un

plan que es el largo que es lento y en

ese caso de nada podemos ahorrar

muchísimo tiempo usando tal es la

relevancia para mis colegas acá en turís

es que justamente esos tenemos varios de

estos procesos que son así que no

necesariamente es que sean

complicados simplemente hay muchos datos

son grandes hay muchos pasos intermedios

y muchas veces hay procesos que tardan

varios minutos y hasta horas en correr

así que targets espero pueda ser útil y

nos pueda ahorrar esa fricción y si

quisieran aprender más cómo les había

dicho pueden bien ir al repositorio

donde estamos trabajando hoy pueden ver

también el archivo este que después tres

si éste md es un poco lo que un resumen

de lo que les mostré el día de hoy y

también el último material de más

importante que tiene conocer es este de

acá el manual de targets que está súper

bien explicado muchísimos más detalles

de más profundidad de lo que alcancé a

mostrarles hoy y con eso también vamos

en un ratito empieza la reunión del 10

en cubierto con mis colegas en turís

pero no quería hacerlo antes de dejar

acá un registro en español también para

que la comunidad

latinoamericana y hispanoparlante en

general tengo la oportunidad de

introducirse también muchas gracias
