---
type: Video Transcript
title: "wtf: Holistic workflow (part 1)"
description: "Are an analyst or a developer so the goal of the series and this comes literally from the book is to build a holistic and project oriented workflow..."
resource: "https://www.youtube.com/watch?v=cKAXDJq5ZdA"
tags: ["ds-incubator", "workflow", "r-packages"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=cKAXDJq5ZdA"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2022-02-08T00:00:00Z"
    usage_count: 46
usage_window: { from: "2022-02-08T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

welcome to a new

series on the ds incubator today we are

going to be talking about

a bunch of topics uh covered in the book

what they forgot to teach you about are

by jenny ryan and jim hester this book

has a bunch of things that are

not

necessarily learned

in workshops and things like that so

but you know impact very strongly you

know your life as a person who works

with code either if you are an analyst

or a developer so the goal of the series

and this comes literally from the book

is to build a holistic and project

oriented workflow that addresses most of

the common sources of friction in data

analysis outside of doing your

statistical analysis itself and um

the

i mean

this

things that you will be able to do at

the end of the workshop i'm going to

mention them later as part of our

objectives so i'm going to move on to

the audience which was very nicely

expressed explicitly in the book itself

so the target learner of the book

is a moderate someone who has a moderate

amount of r and r studio experience

someone who is largely self-taught

someone who suspects that have

drifted into some ideas and credit

habits and may that may slow them down

or make their work

more brittle

and someone that is interested in

redesigning their our life to be more

effective and more self-sufficient which

i think

is most of us at two degrees

um so analyze developers at two degrees

i think most of it

most of us fit fit in all this uh

description so i think this is a good

content to cover in a series uh we have

covered some of the ideas in this book

before

but very loosely so this time i want to

make sure that we are not missing

anything important and hopefully the

materials here will also be useful for

people who are on border to two degrees

so that they have uh like a series of

lessons that they can

use to know um what we expect from from

ourselves

so

the reason why this is important is

because you know by addressing those

costs of friction we should be able to

work faster more effectively and our

work should be a bit more robust

so today the meetup is about the first

section of the book which kind of has

the the soul and the core of the content

which is this idea of the holistic

workflow and i

listed here a very ambitious number of

objectives i don't think we're gonna

have any you know time to cover them all

but hopefully to cover some of them

maybe this first four um so

i will be you know trying to talk about

and why and

you know how to set up r so that you

always start from a blank slate and then

you're forced to

save the source of your code and not the

the products

um the artifacts from your code

um your workspace in in word in

in our jargon and also we're gonna try

understand why we're restarting r is a

lot better than running

the function rm for remove which you can

use to do some but not all of the

cleaning that you need when you want to

start from fresh

and then understand why using the

project oriented workflow is a better

idea than using set wd to change working

directories from from one to the other

and i'll hopefully also try understand

how the here package can help you

particularly if you use our mcdonald's

documents i guess

those

four topics could be enough for today

but if we have more time we'll continue

to move on otherwise we'll continue on

the next session

uh as usual uh there is a

repository on github in the 2ds

organization uh and repo starts with a

ds dot prefix so that you can find

repositories related to the ac equators

so ds for data science and then

wtf is the

the name of the series so it's going to

be with us

for a few meetups so today we're going

to be talking about holistic workflows

so you can scroll down scroll up and

find the folder for chapter one

for meetup number one

which may be number one and two i guess

and here we have the materials for today

so in

today's

document i'm using you will see

a little later that i'm using the fs

package a little bit on the here package

a little bit and when i run library here

you also see

i mean we're going to learn about the

hero package in a moment but already

noted that um what it's

saying here is that the

it's aware of what is the root of the

project that hosts the document that i'm

running here so it's aware of

of this folder called yes dot what um

what i forgot

utf

um so that's something that we're going

to be

coming back to in a moment so all these

headings come literally from the book um

so maybe i should um kind of click on

one to show you where it takes you in

general beyond the ds incubator i

strongly recommend this book

so and i think it contains a lot of

wisdom that is hard to get elsewhere and

it's all condensed in one

very friendly to read book so i'm trying

in this series to highlight the most

important things so that you don't have

to bother bringing it by yourself but if

you do want to take that time i think

it's gonna be worth gold

um so the first subsection of of the

first part is this idea of saving the

source and blank slate

so in r um

by default r will ask you if you want to

save your workspace so for example if

you have some objects created during the

session

and then you exit r by default r will

kind of give you the chance for you to

save those objects that you created in

that session

and then next time that you restart r

we'll try to find that workspace and

reload it

that is a bad idea because um it doesn't

force you to um keep the source you

could potentially keep the artifacts of

the source but then you may drift to

a place where you cannot reproduce with

code the workspace that you are not

working with so you are basically

shooting yourself on the foot

so how you force yourself to always save

the source uh well by by always starting

from a blank slate so if every time you

start your r session there's nothing in

there you are forced to save the source

so you can reproduce the artifacts of

your code every time so we're going to

learn now how to do it in our studio

so by clicking

or i'm clicking this box here in the

options section i'm going to show you r2

in a second and by putting this drop

down menu to never you will be

asking r to not

reload your workspace this this line

here to not reload your workspace from

an r data file that might have been

saved previously

and then by putting here never you you

could be asking r to not save the words

the workspace at all

so in our studio this is what that looks

like and

you can go to tools and then you go to

global options

and right there the very first page is

that uh the one that you you have to

kind of check right so where it says

workspace make sure that this is

unchecked by default unfortunately it

comes checked so you have to uncheck it

and here

in where it says never that's something

that i put and i recommend you to put

but usually i think the default is ask

so you have to change it now

so i'm going to pause here because i

heard the hands up sound so let me

cancel here

let's see your beautiful faces

anyone has a question or comment here

um

[Music]

can you hear me now

honestly i don't know it's uh historical

reasons i guess uh i i'm tempted to ask

alex just to name someone here in the

meeting but if someone else knows the

history of that

uh setting um

i would love to hear

i suspect you know based on other i mean

this is a total guess but based on other

historical things that have been dragged

in r for ages like for example the the

default

things as factors

it was true that has changed in r4 it

took four versions of r to get rid of

that and i think that made sense at the

time to save computing time because

factors in some kind of analysis were

faster no longer that's the case so that

is essential to now get rid of that but

uh i think that you know if you have a

computer that is very slow think you

know 20 years ago when r started the 20

something 25 now maybe

um maybe

maybe it is a good idea to keep your

workspace because it would be so hard to

reproduce i don't know and maybe because

also it was you know

you were supposed to be a very hardcore

programmer if you were using art 25

years ago and maybe you would have

um like programmers practices that were

very defensive defensive anyway so maybe

saving the workflow and okay you are not

forced i mean by not saving the workflow

you are forced

to to keep the source but if you have a

good practice anyway you can keep the

source and

keep your workspace so it couldn't

really hurt yourself if you keep the

source but then

but then you can drift to this pattern

where you forget to say the source right

um

so yeah it's it's there's nothing

religious about

not keeping the source other than it

really forces you to display the good

practice of saving the

source right

so yeah it's an unpleasant i don't know

but um but hopefully this

this discussion illuminates some some of

the ideas

anything else

i'm gonna go back to

here

and i really would like this dynamic in

this series i'm not interested in

rushing too much especially in section

one of the book which i believe is

fundamental to every our user these days

no matter if you are a developer if you

are an artist or whatever you want to

call yourself i think like knowing these

little things um unfortunately

they tend to come too late in your our

life and by then you kind of hurt

yourself a lot and you felt a lot of

friction so you may even think as i

thought when i started r this is

certainly not for me because i

experienced so much friction and and

then you realize okay life you even get

used to that friction and you think that

okay

it has to be hard right because it's

programming that sounds like something

hard and then you realize that once you

embrace the practices that

that

are conventional and the practices are

best practices you realize that the

friction goes away you can engineer the

the friction away of your workflow by

following these these practices

so now we are at the at the point where

i would like to highlight

uh what's the best way to start from a

blank slate so we've now learned that

okay we asked r to not save our

workspace but then when we work we will

be generating some artifacts of our code

and and sometimes we change the code and

the objects that we created are still

hanging around and we may think

that the code reproduces the artifacts

that we have but in reality they don't

the code that we had before was the one

that produced the artifacts and now we

have changed the code and we haven't

updated the the artifacts so to avoid

that problem

it is a great idea to restart art often

and by often i mean many many many times

i usually try to write my code so that i

can

i can

basically restart r and refresh the

entire analysis every time i change some

meaningful piece of code that i'm not

100 sure that produces what it produces

right so that means maybe in an hour i'm

restarting my our session 20 times or

something like that you know like a lot

very frequently it could be a different

number for you there's nothing magic on

that how do you do that well you can do

it with the menus go and click in

session and restart r something like

here session restart r but there is a

keyword shortcut so because this is such

an important part of your workflow it's

very important to memorize that keyword

shortcut i think for mac users the

keyword shortcut became a little more

friendly right anyone here

using macs can can tell me which is the

keyword shortcut a new one for

restarting r

i mean they i think they

they by default the new versions of our

studio have an another one but i'm

i'm suspecting that they might have left

the old one there too which kind of

makes sense because in different

platforms is the same thing so shift

ctrl f10 and that will

refresh everything right so if

if uh you're thinking well but you know

my computations take a long time to run

so if i do that every time i will never

finish my work okay then there are some

um

strategies to deal with that and that

we're going to are going to cover later

but but still you will be able you know

once you embrace those practices then

you will be able to uh also to restart

your session and and some objects will

be kind of cached will be saved and

reused when you need them as opposed to

recomputed uh if nothing change in your

code so there are some systems that are

smart enough to notice if something

meaningful changed and if it did they

will you know the objects will be

recomputed and if they haven't they're

not

so the practice is not to not restart

your art session the practice is to

learn what are those tools that allow

you to restart your our session and

avoid competing things that do not need

to be recomputed

um

okay so uh

in in addition to the

to this um super important maybe crucial

keyboard shortcut ctrl shift f10 and

then there are a few others that i

listed here for you to explore it's this

idea that if you have another script for

example

you can you can run the entire

file with ctrl enter

or maybe you just want to run all the

code above of the line that you are

standing on and then you can press ctrl

alt b

or you want um

to to run just a selected line actually

sorry i was highlighting the wrong code

so let me show you what that looks like

a little bit so if this is an r file

here let me make this a little bigger

right so if i am in

line two and if i press

let's expand this a little bit too

let me restart my r session shift ctrl

f10

here it says restarting r i also like to

clear the console i'm going to press

ctrl l to clear that up and maybe now i

can press

shift ctrl f10 again

so if i am in line two and i can i can

change the focus of my source file

pressing ctrl one and then i move my

focus to here and then if i press ctrl

two and move my focus to here

right uh so if i'm in line two here if i

press um

shift ctrl enter everything runs so in

the console you can see number one

number two and number three right so

that's one keyword shortcut that is

pretty useful but sometimes you don't

want to run everything you just want to

run everything up to the line in which

you are so if i'm in line two and i

press

is it shift ctrl b

let me go back to my file

here

ctrl alt ctrl alt b

will run

let me clear that up the console if i am

in line two con ctrl alt b

runs one and two but not three so that's

pretty useful because generally you know

you're changing code on top seeing if

you know what's the state at this point

and then continue later and and then

another couple of good ones are for ctrl

enter will run the line where you are

and we'll move the focus to the next one

so you can press ctrl enter ctrl enter

enter one by one or if you want to run

in this case line two but not move your

focus to line three then you can do alt

enter and then number number two number

two number two always runs but your

course cursor stays in line too

okay so we are at 20 past is the time

where faria

will

kick me out let's

let's stop

let me finish with this little section

just to highlight that in

thank you

in our markdown the keyboard shortcuts

are different

sorry

so when you are using our magnum files

which are this other flavor of our

script where you can intermingle

code and pros something like hello

and then you have code then the story is

a little different so i

here in this drop down menu run you have

a bunch of options

so i instead of spending a lot of time i

encourage you to look at them

if you want to do the cooling to control

enter in another script and go line by

one line by line for example you would

do run next chunk so i could you know

run this chunk with a ctrl alt c then

press ctrl alt n and that will kind of

make me jump from one chunk to the other

and then there is a bunch of other

tricks that you can learn here so that

you can use your keyboard

to

send code to the console very

comfortably every either if it's

everything in the your script everything

above everything below or exactly where

you're standing at so i invite you to

look at that or

revisit this this file

so um i'm about to talk about something

quite important but it's more important

first to hear

questions if there is any or comments so

please go ahead

i'm gonna put your beautiful faces here

okay i don't hear any questions or

comment now

so maybe i'll move on a little more

um

so um we talked about restarting r and

i have seen and i have used this command

rm

when you do rm and the argument list you

equal that to ls what it does is it

looks into everything that you created

in your works space in your global

environment every object you create

there and it removes it from there so

for some people that is the way that

they use to kind of clean everything up

and start from scratch but the problem

with that

it makes your screen vulnerable to some

hidden dependencies such as uh you know

options that you change during your

script that are not invisible because

they are not recorded in your script

itself or maybe two packages that you

attached when you call your library you

know whatever titles and when you do rm

list equals ls you are not getting

rid of of those dependencies those

packages are still attached so you may

you know think that now okay now i'm

going to start using the function filter

from the package you know the old

package player which i discourage you to

do uh thinking that that's what you're

using and instead you are using a deep

player from

a package that you attach in in the

before you run around this rm this ls so

the problem with rm at least ls is

generally that it doesn't do what you

think it's doing so it doesn't clear

everything up it just does a very

superficial cleansing

only of the objects that live in your

golden environment

so there is a bit more information

here one aspect that does not change is

your working directory and and that is

useful

to mention because we are now about to

talk about project oriented workflow so

uh if you do

um

you know rm list equals ls um your

working director will be whatever it was

before you run that command which is

different to what happens when you

launch an entire

project

which does

restart your art session and you start

from a blank slate if you set up our

studio as i show you at the start of

this meetup

and sets up the working directory at the

root of the project so let's start

defining what a project is if it's

something so cool we should learn a

little bit more about that

so um

how about now are any comment or a

question about rm i know that that's a

very controversial thing

so maybe some of you have

comments here

and just to clarify i think the

controversy doesn't come from

um me or the community in general not

being convinced that

it's a generally bad practice

um

it comes from from legacy from you know

a lot of people use it and we are

sometimes resistant to changing our

practices and there is very good use of

that too so if that exists and you're

using it correctly then then carry on

but but also please pay attention to

what's coming next which is this idea of

a project oriented workflow because um i

mean if you know this the stuff that is

about to come and you continue to use rm

in a way that works for you then great

but if you do it because you don't know

the stuff that we're about to talk about

then then hopefully

your life

your life could improve a little bit

monica i hear you have a hand up go

ahead

that's a great one um i think i felt it

but my addiction to restarting r is

is so great that i yeah i tend to

restart so let me say what you said

again because unfortunately there is

some background noise so i'm using my

earplugs so your voice is not recorded

in the video so i'm going to say what

you say so when you're using that tools

and you you run a function

um interactively as opposed to say you

know through devtools test

um there is objects that are you know

being accumulated in your global

environment and then when you run our

devtools document for example um you get

a message i believe that tells you a

warning that tells you that you can't

you can't do it uh you need to first

remove that object from your global

google environment and asks you to

prompt you to do it with rm

honestly i yeah i i i think i just

restart everything um particularly in

another package

that uh

that everything is so designed to start

from from blanks like every time

but i should pay a bit more attention um

because i haven't

yeah i i don't think i read too much

in detail that message um i i see

someone who posted something uh maybe

you monica want to explain more but

maybe you can explain more about this

issue

yeah yeah yeah cool

yeah i think i would like to use this uh

as um

to kind of reinforce

uh

the idea that it's it's not a bad thing

right so

the tool itself if it's if it's used

well

then it won't hurt you right so i think

that you know what you just said money

guys is one good use maybe of rm lease

less

so it's i mean i think it's it's fair to

say hey you know it's not that you have

to abandon it you have to just not use

it in thinking that it will cleanse

everything so if you're aware of that

and and still in your use case it makes

sense then then continue you know using

it um i guess that that's the only

takeaway that that i could take but in

general what i we observe is that

i mean if you if you face something like

this it's you know once every

er so often

it's a very different scenario than

thinking okay

i i have you know that function in every

single script of my of my work so if you

find yourself like using it too much

maybe it's a signal that you you could

use a different workflow

that will

improve your ad life a lot

um

yeah

so faria says that she also experienced

the same thing and next time i

experience it i will pay more attention

i often work in a very automatic pilot

when i'm developing packages

and i kind of intuitively restart

so thanks a lot for that comment monica

yeah go ahead

mm-hmm

yeah okay that illuminates something so

far i'm going to reset what you said

again for the earphones thing and

sofaria says that the times that she

remembers experiencing that is when

she's

using scripts interactively creating

some objects on her global environment

and then

calling depth tools herself devtools not

all herself which will try to load

everything in in the package

and then you know it gets this error

saying that you know you can't do that

because you already have objects in your

environment i think the the the light

that i see there is that the workflow

that devtools proposes assumes that you

always start from a blank slate and

that's that should be your assumption

every time that you run a script so you

should write a script so assuming that

it's going to run for a blank slate so

devtools embraces that practice so

strongly that that doesn't let you

continue right um

so i'm kind of a little surprised and

curious to do it myself to see to try to

figure out why they could really would

say

remove it with rm as opposed to please

restart r and do it again right i think

the

i mean when you read the

i mean the the developer of the tools is

have the weekend and when you read his

workshops

which i attended once in person the

workflow that he suggests is like a

eurostar r and then you you know you do

the tools. with you know shift ctrl l so

that that practice of restarting and

loading uh good avoid this because by

your starting you would get rid of all

those objects in your global environment

and so yeah i'm super curious to know

why they would instead of asking you to

restart they could ask you to do rm

maybe because it's a bit more

conservative so even if you're if you're

somehow shooting yourself on the foot

you know they're not asking you to do

something that would wipe out things

that maybe were very valuable to you if

we took you know imagine there is a

computation that took an hour

for an object to create so i don't know

i i pay more attention and try to bring

some like next meetup

for now i think i'm gonna thank you

because we are beyond the time uh so

next time we are gonna it's kind of a

good starting point because next time

we're gonna start talking about project

oriented workflows

and how

um

how to

how they are implemented in ides such as

rstudio and and why that workflow can

completely get rid of your set wd calls

in your ad script

all right any departing comment before

we go

no question

okay then thanks a lot see you next time
