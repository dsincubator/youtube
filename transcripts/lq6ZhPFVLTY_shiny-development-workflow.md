---
type: Video Transcript
title: "Shiny: development workflow"
description: "so today the ds equator continues with  the series  about building shiny apps and i'm very  excited to  maybe the first time talk about  something fun at least "
resource: "https://www.youtube.com/watch?v=lq6ZhPFVLTY"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=lq6ZhPFVLTY"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

so today the ds equator continues with

the series

about building shiny apps and i'm very

excited to

maybe the first time talk about

something fun at least found to me which

is the idea of

workflow you know how you actually go

about developing an application

and the topics that we're going to be

covering today come mostly from chapter

5

of mastering shiny although that chapter

includes

some topics about debugging and red

bricks that we are not going to be

talking about today

we're going to serve those topics for

another meet up

and then the idea of workflow is also

covered in chapter 20 but in more depth

and not sure if we're going to get to

that but

um if we do then we're gonna be covering

only section 20.2.1 which is

uh talking well specifically about the

workflow for

um building shiny apps when they are

part of another package

and um and and just you know basically

keyboard shortcuts that you do

when you have a package as other than

just a normal normal project

but um but that's that's kind of uh

depending on time more

than anything i'd like to cover what i'm

highlighting here

can i check uh maybe with a with a

variable yes

if you can see my screen and that i'm

highlighting

for items in blue yes

thanks guys so good okay so the very

first

uh thing that the the book covers and i

think

is cool to notice is that our studio

itself helps you build shiny apps

by providing you with some templates for

example we can go to the files

uh menu we can create a new project

and among the list of things that we

have here we can choose a new directory

if you're going to build

an entirely new project for this shiny

app and we can choose shiny web

application

so that will give now we say something

like abc whatever name we want

and we choose where to put it and that

will create

you know the bare bones kind of a bare

bones kind of project

um including a demo of an app that then

you're supposed to

adapt to make it you know your own app

so the thing that i like from this

approach is taking a while and i feel

the time with

explanation the thing that i like from

this approach is that it's very easy to

get you know another studio project

a an app.r file that defines the app

and a file that is a dot git ignore that

already ignore some things that

usually you don't want to include in git

but then the downside is uh to me

is that the the template that it

provides

is quite quite complex to my taste i

like

more more than you know getting a lot of

stuff that then i have to remove

and then you know to inject what i

actually want i prefer

something that is even more minimal so

if i run this app

i'm now hearing this new project that i

created with the rstudio menu

i have here this run up button

if i click there you know at least i

will be able to visualize something

functional

and that's fine mostly when um

when it's your first app or the first

few apps and you don't really know

much about what goes in an app but you

know for example the station which i am

now which is kind of

more or less intermediate i already know

more or less what i want and then having

to come here and delete

the contents of the ui and then delete

the contents of the server

is a bit annoying to me so instead i

prefer

another approach which is the idea of

using the uh you know creating the

project

myself and creating an app.r file

and instead instead using a snippet a

snippet is these things that our studio

include that have a name associated to

them

so i i start typing shiny i don't even

complete the word

and i already see that there is a bunch

of things with a blue label

that are functions that come from the

package shiny in this particular case

but also at the very top i see an icon

that is white

and that's the icon for the snippet so

if i now hit tab

uh what will happen is that that snippet

will kind of manifest

itself and will populate this

before empty file now with the skeleton

of a shiny app

and so i like that approach better

because you know that gives me

more clearly the structure of an app the

ui the server

and the call to shiny app that uses that

ui on that server

and then i start you know feeling the

details so that's kind of the my

preferred approach

just now and my workflow you know again

changes as

as i you know develop more apps and

realize oh i could do this i could do

that

and i like this better now than i didn't

like before

so now with this i'm going to close this

up and cross this project

and go back to the main project that i'm

using for this series of meetups

uh i'm gonna basically build

on top of that where is that project

ds shiny i'm gonna start building

um a very small app that i think you saw

before in other meetups

and i'm gonna be covering other aspects

of the workflow so the very first aspect

that we cover already

is this idea that you can use templates

uh

either from the you know to create a

whole project that is a shiny app

or you know once you if you do the

project yourself you can create

uh a bare bones shiny app with this

snippet so now the second topic i'm

going to be covering

is more the idea of okay if i every time

that i do a change i need to go and

click that

run app button it doesn't sound like

that but eventually it gets very

annoying because we change you know our

app

very frequently so we want to probably

develop a workflow that includes some

keyword shortcuts that

do you know run that up and that we

quickly see

what's the result of our latest change

on the

viewer and one thing like to give you

the heads up

is that the debugging shiny apps is a

bit more complicated than debugging

a normal r code meaning that it is

useful to have

very quick feedback as soon as we change

something

and so in this you know context

having a very good workflow that feels

really fluid

um is is key to catch the problems

before they become

like a whole mess that we don't know

even when we introduce the problems

okay so this is the bare bones shining

up

um now adapted to

include a very small app so i'm using

here

a text input function

to allow the user to introduce their

name and then i'm outputting

um a message that is the combination of

the string hello with the name that the

user provides

so before we run this button run up

and i'm going to be exploring this drop

down menu in a second

and notice that um one thing that is

highlighted here

is that the app will run in the viewer

panel so here in my viewer i will

soon be see the app and also that the in

this section

uh it says that the app will run on the

console so let's see what that actually

means

now instead of clicking run up i'm going

to run the app

using a keyboard shortcut to introduce

you to my favorite workflow and because

i already have

the whole app in one file i can press

shift ctrl and enter and that will

source the file

so by doing so the app will actually

you know run in the same way that i run

if i had clicked that button

and all this also notice how the bottom

changed from run up to reload app

and that's important because now my

workflow um

includes making changes to the app

and then again pressing the same keyword

shortcut

that will reload the app and the

changes that i do should manifest

themselves on the viewer

so for example notice how the label of

the place where the user should input

their name in this case i'm going to say

mauro

the label is name question mark so let's

change that to say something like

what's

your name so the file hasn't

been saved yet uh i could not even save

it i could press shift ctrl enter

and that should pop up this window

to tell me if to ask asking me if i want

to save the file and now it's an

enter to save the file and at the same

time

it's reloading the app so once again my

workflow was

make a change press shift ctrl

enter then accept to save the file

and uh and that automatically you know

expresses that change directly on the

viewer so very quickly i can see

the effect of what i'm doing

alternatively i could do say that i want

to capitalize

the message here so that everything is

like in

title case instead of pressing shift

ctrl

enter right away i could do ctrl s to

save the file

so now if i do shift ctrl enter i won't

be asked for confirmation

with that pop-up which i find a little

annoying um

and immediately the app reloads so with

this we are learning

a new workflow where we don't even use

the mouse we are just

you know running the app with by

sourcing

the file we shift ctrl enter then we are

doing changes

as we wish and then whenever we are

ready we hit ctrl save and then shift

ctrl

enter and that you know shows the

updated app already on the viewer

so other options that we have is to see

uh

in terms of the viewer it's to see the

app on a panel as we did before

so let's stop this app and one way in

which you can stop it is clicking here

but again if you are more fond of the

keyboard

then you could press ctrl 2 to

move the focus to the um console

and then escape escape will terminate

the interrupt r and stop the application

so now let's see what happens if we

click

here run on a window or run external so

if i click run on a window

what will do shift ctrl enter is that

the app

will run in a window which i don't see

because it might be hidden here there

you go

that's the app window

right and what happens if we click on

the

run external is the same thing that we

get when we click here in opening

browser which basically

shows us the result uh the closest to

what the user will experience

because that's uh on the web browser

what they will see or or even their

phones

right so same thing we're going to say

mauro

and now huh the browser gives me

actually autocompletion from

other strings that may have recorded

somewhere and that's pretty cool i like

that

um all right so the one thing that

is sometimes annoying is that when a

shiny app

runs the console uh

is not available so if i run this app

let's do it here on the viewer so it's

kind of easier to see

that's right here on the viewer panel so

by the way you can also

run um something on the viewer saying

rstudio

api which is the package that um

i first do api we can use the function

viewer

with a url here and that will make

the app that is running that url appear

here on the viewer

but without clicking any button just

with with code and we'll see when that

is

useful in just a moment so for now let's

just remove that

so what i wanted to kind of stress now

is that uh and i'm going to make sure

that the app is running here on the

viewer panel so we can see quick

easier i'm going to press shift ctrl

enter once again to run the app

and notice how the console is now busy

right so i cannot do say if i want to do

one

plus one i hit enter and nothing really

happens

because the console is busy right

and that's that's not great because

sometimes you want to do you know use

that console for other purposes

while the app is running so the solution

to that

there is a couple of solutions let's

start with the simplest one the one that

is most integrated with our studio

which is to immediately click here to

run a job in the background

so instead of choosing the console you

choose the background

uh job background job to be you know

hosting that

or serving that app so now if i do the

same shift ctrl enter

notice how we see something similar to

what we saw before

except that the panel that is serving

that app

is no longer the console but the panel

jobs

we still get a url that we could use to

paste on the browser if we wanted

and we see the app running here on the

viewer

so that's pretty cool i also get the

reload up button here

so what let's say that we want to change

the message

and see that quickly express what is

your name i'm gonna hit ctrl s

to save and

shift ctrl enter to reload

so that's i expect

there you go that will be expressed on

the viewer

so quite quickly uh this workflow

running you know the job on the

background is kind of similar to running

it on the console

except that i have a console that is

functional and i can now do

one plus one and get what i want which

is two okay

um that is pretty good with me

and i think it's very nicely integrated

with our studio so i would recommend

that

workflow the only thing that i noticed

while i was preparing for this meetup is

that when you go to

the list of jobs that are running

for every change that you did and every

time you send

you know you press that reload up you

get a new job

running in the background i'm not very

sure how much

that would be a problem if you're

running you know a heavy app

and you did you know like 3 5 10 20 50

updates to it and how all these jobs

running

maybe it can be

a problem and so there is one other

approach that

you could use to run

not a new job every time you reload the

app but instead

a single job and kind of override that

that job every single time

and that's the topic that i'm going to

be covering next

before making it pause and asking for

for questions and comments

so let's stop uh everything so by the

way

one way in which you can quickly stop

all those jobs is simply by restarting

r so that's what i'm gonna do now

pressing the the keyboard shortcut

shift ctrl and f10 as you can see

um the highlighted button is terminate

job so i should be able to press enter

and i will reset restart r

hopefully let's see

maybe i should click it there terminate

jobs

let's see what i get in the console if

our is restarting

and i expected the jobs to kind of

cleanse i don't know

why they are going to steal maybe the

jobs are still kind of closing or i

don't know

that's not what i expected i expected a

starting good

finish them but instead let's see if

session

restart is what i did before let's let's

see if terminate our

closest there which one terminal yes

in previous runs i did get a pop-up that

was confirming that i had some open jobs

and asked me to confirm that i wanted to

close them as i restarted our session

so i'm not sure if this session in

particular is kind of stuck

uh but well in any case that probably

highlights the need

for maybe an approach that kind of

scales up

better when you when you have multiple

apps or your apps are bigger

so and that's that's something i wanna

um i would like to cover is because it's

not so

i mean i saw a documentary in the book

in mastering shiny but it took me a

while to kind of get it work

so i want to capture it here in this

video in case i forget later how to do

it

or in case someone else is also

struggling to set that up and the magic

is

uh is all driven by a single file

that you put at the root of the project

and you can call it whatever

i decided to call it out of reload

so this is the file it's very simple all

it does is sets the option

shiny dot out of reload to true

and then calls a shiny run app

so if the app is hosted in a file called

dot dot at the root of the project as

well

kind of alongside the autoreload file

then i don't need to pass any argument

to run up

but you will see in the help file run up

that the first argument is get working

directory

meaning that if you are you know if you

want to run an app that is in a

different directory then you will need

to pass some arguments here

but for example for this particular

example i am using an

app that is hosted alongside the

autoreload file

so this file should work so what you do

to

run this background job and make

all apps overwrite themselves in a

single job so that the jobs don't pile

up

is you know you create this file and

then you go to jobs manually yourself

and you start a local job and if you do

that with the active file

selected on the auto reload file that

you just created that file will

automatically be populated here on the

menu otherwise you know you browse the

file that you want

and the defaults usually are fine

because you want to work

from that working directory in this case

so i'm going to simply hit

start and that will start a new job

and it's going to be a single job uh

it's gonna emit

also this url that i'm gonna copy here

uh because notice how the viewer is not

showing

the app so if you want the viewer to

show the app then what you can do is

you can do r studio api

viewer view

no that's not what i want viewer

there you go and you pass the url that

you got from

from the job so with that the app will

display there

you can use it as you normally do and

notice that if we go to the file app and

we do the changes that we want say

we go back to a simpler phrase

let's say your name

name please let's see if i save it

immediately just by saving it it updates

i don't even need to

do shift ctrl enter i don't need to

resource the file so any

change that i do to the app that is

saved so i do the change i press ctrl s

and that immediately reflects on on the

viewer or wherever you are browsing

that app and the one last thing

is to confirm that if i go to jobs

and backtrack here there is only one job

so

each of the changes that i did did not

trigger a new job because i wasn't

resourcing the app i was just

saving it right saving that file and

that file is continuously being read

by this background job okay so those are

a few tricks that are not

super uh or not very commonly documented

some tricks that i found pretty cool and

that i found

documented in the book mastering shiny

those are the main things i think i

wanted to

cover today let me see if uh i'm missing

something crucial

while you um you

you know makes up the comments or

questions that you may have so go ahead

and let me know

what questions and comments you have

i already have a question but i think

that's not actually really helpful if i

were to work on an app again i would try

to use that workflow like that

yeah it's pretty exciting to see the

changes

um happen right away on the app

that's my my personal experience and

again because debugging

shiny is so hard at least not until i

i don't think it's gonna get any easier

until i become more

experienced in building shiny apps um

is that i want to see you know like

feedback super quick

and the one thing we're gonna be talking

about later

is that when we build a more complex app

then

the infrastructure of another package is

extremely helpful too

and that also gives us a new workflow

the waterfall that we already use

too when we build packages you know the

load all

function to source all the our functions

and we're going to have you know rcmd

check

those are great things that the package

workflow gives us we're going to be

talking about that later

but the one thing that breaks is this

this

one last trick that i showed when you

create an autoreload file

that just by saving the file you know

updates the app that i didn't get to

work

uh and i don't know if if it does work

uh but anyway so basically there is this

maybe

two workflows you know when you begin

the app you may

create that autoreload file to very

quickly have a draft of what you want to

build and then once you know

what you want then you kind of move to

the more featured workflow

of the our package and you have to kind

of drop the autoreload approach

um any other comments there

or questions

no okay cool all right then thanks a lot

for joining today

um we'll be

um following up uh next meet up also

with more

of these kinds of things a bit more more

live before we were

talking too much about theory and i felt

that it got a little boring

and maybe that's why we are so few today

but uh but yeah thanks a lot for joining

me

and see you next

dutch time bye-bye thanks
