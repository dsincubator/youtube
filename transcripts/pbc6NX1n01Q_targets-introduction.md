---
type: Video Transcript
title: "targets: Introduction"
description: "I'm stopping now i wanted to welcome to the first meetup of the series about in which we are going to be showing code you know last week..."
resource: "https://www.youtube.com/watch?v=pbc6NX1n01Q"
tags: ["ds-incubator", "targets", "pipelines", "r-packages", "workflow"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=pbc6NX1n01Q"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2021-02-02T00:00:00Z"
    usage_count: 2373
usage_window: { from: "2021-02-02T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

i'm stopping now i wanted to welcome

everyone

to the first meetup of the series about

target

in which we are going to be showing code

as uh

you know last week we had the pleasure

of

having will actually introduce the

motivation for while using

targets and and

today we are going to start actually

getting our hands

dirty the uh

first i'd like to confirm that you're

seeing my screen here something that

reads who is the audience

yes okay cool so as uh

i'm hoping that we learned from

will last week uh it is a tool that is

very of very general application

so i do see potential use cases in two

degrees

but i think that the audience of this

meetup is kind of much broader you know

it could be anyone who is running a

process

that takes a long time to run basically

and that's where

you know there is a payoff in using

targets

um

the sea levels uh i'm trying to kind of

follow

a little bit the retrospective that we

did last time and i'll learn from that

feedback

um the syllabus uh the first meet up was

the motivation that

we already did and today we are to be

doing a little bit of a work through the

work comes from the amazing

manual the targets manual that um

has a chapter called walkthrough but

what we're going to be doing today

is much more minimal a much much much

much more simple just the bare bones of

what a target's project is

and we're gonna be learning how to set

it up using a function from the target's

package itself

and then using some of the most commonly

used most common

most useful functions in the targets

package

we are going to be creating a report

actually that uses the targets that are

made by this framework and hopefully

we'll

you know by the end we will understand

what is the benefit especially when we

make

a change in a function of that minimal

example

that makes that function run very slow

and then we'll see hopefully

concretely what the benefit is and then

in the future um the things that i think

so far will be current is

the idea of functions how you can move

uh

your project from from having a sequence

of scripts

to having a pipeline of functions we're

going to be addressing best practices in

the creation of

what will define as a good target

and we're going to be talking a bit

about you know what to do when things go

wrong

there's more topics in the manual which

i you know recommend

you to read if you are interested in the

framework but if you are not

maybe some of the chapters here may mean

maybe not relevant like for example

there is stuff about

uh cloud computing and high performance

computing so some things that may

come handy at some points it's good for

you to know where to look for

that information but i don't think we're

going to be covering that here

so sorry for not having like ex specific

suit items in each of these topics and

the reason is that

target is new to me too so i need to

kind of go again

and regain those chapters practice them

and you know figure out what i really

want to

show here also i welcome contributions

here so

if anyone here in the room wants to

deliver a specific meet up

uh in this series please please feel

free to

to do so so see those requirements well

so far

zero requirements you don't need to know

anything to be here today and

and the benefit that i'm hoping you to

take away from this particular meet up

is that you will know

hopefully if target is a tool that um

you may want to know more about or not

basically um

so okay let's get started so i i'm gonna

do it like in a very

bare bones way we start with an empty

project

can you confirm that you're seeing my r

studio here

yes cool so as you can see on the files

pane there is nothing here in this

project except for this file that

defines their studio project there is an

empty

project and i forgot to say sorry let me

go back for a second

here the there is a repository right

that is called

ds targets and

and there is a file called zero1

walkthrough

so that read me that um file

and it's kind of a script that i'm

following right behind the hoods on

another screen

uh so that's pretty much what you can

free again if you want to go back to

this material and you don't feel like

uh watching the whole video uh again so

i'm gonna

stick this to my other screen here and

use that

so uh everything starts as

with any other package right like using

the package means you know

calling the function library and calling

the name of the package

and now we have access to every function

in the targets ecosystem

so we are going to use the function

script

this function is the one that you need

to set up

right the targets project so just by

doing

that you will see that now my files pane

has a new file called targets

i could click here and that's uh you

know probably what

you will be doing too but you can also

use the function

target edit which pops up the file

automatically for you

the file comes with a toy

example and that's exactly what we're

going to be walking through today

and some instructions so they i'm hoping

that

by following these instructions we will

um kind of learn what is the basic

structure of a target's

project every time so the the targets

project is defined by this file so it

must

if a target's project must have this

file it has to have

this specific name underscore targets

dot

r this file has to start with

or has to have a call to library and the

name of

targets right because you know the

functions that we that are included

in this script use the targets package

right so for example this function here

which starts with star underscore is

kind of very clearly a function that

comes from the targets package

so to get that function to work you know

we do need this line here right

so i'm going to be kind of removing

lines here to kind of

clean this up and leave the bare bones

structure of

the packet of the fire kind of exposed

to your eyeballs

so this is basically done

so the next though what we did is we

call the function entire script which

created this

file and we call the function edit which

allow

you know it opens the file now uh

you know next we are i'm gonna be

showing you know what it

what the content of this file actually

is and how you create it

but uh but we can even just run

the project we can run the targets we

can

the word for this is we're going to make

the targets

just by calling the function uh tara

make so

bear with me for now i'll just call that

function let the magic

happen and then we're going to see

what's going on

so tarmac is the function that once you

find a pipeline in code

tarmay will actually do the work

right so it will read into this file you

will see

what needs to be done and it will just

go ahead and do it

and we already have some information

here so

the first thing that this function did

was to run a target

called data and the second thing that he

did was to run a target called

summary there was nothing else to do so

then

the pipeline ended so where is this data

and this summary coming from well it

comes from here so this data

is just a name that in this particular

case

is totally arbitrary you know will when

he built this example he decided that

the name of that target is going to be

that right so when you when i say target

you can think

an object somewhere that you know you

can use you know it would be

x if you assigned to x the number one

well your target could be x right

so each target in this case data

has a name in this case data and an

expression

right that is code that will run in

r to produce one output and y out that

output is going to be assigned to that

object right it's going to be stored

somewhere so that somewhere is

specifically this folder that targets

created for me

so if i dig into that folder i go into

the objects

subfolder and i can see already that the

two names

of the files that i see in there are the

names that match you know what targets

was actually

doing for me right so this is kind of

dissecting a little bit

the the guts of the target project so

the expression here

for that will run when targets does its

magic is this one here

so it's created a data frame um

with some kind of random numbers in

there

and then the second target this is you

know getting more interesting

is calling a function that is not a

function that comes with

r but a function that the user defined

in here

and and it is using

applying that function to a to it to a

predefined target so that is applying it

to the target that was created in the

previous pipe

in the previous step here right so this

is the first step of the pipeline

creates the target's data and then we in

the second step

we use the target data and apply a

custom custom-made function

so uh do we have any questions so far

pretty simple good i mean i have to kind

of of course apologize that this does

not relate to your

your real life experience real life

experiences are way more complex than

this but

let's start simple so the

um the next thing you can do after you

do run

make after you do this basically

is to start using those targets right

you can use them directly in the console

if you want

why because they are stored somewhere

where targets know here in this in this

folder here right so you can call the

function car

read and you can give it the name of any

of the targets

that uh that you know that you created

right so we have two data and summary

that's called

summary for example

so and this is the result this is the

the object

summary this is the contents of it i

could also do it on data

and it will print a long data set here

right so i could also do head of that

showing that you know once you have a

target you can retrieve it with target

right and then you can do anything that

you would do normally in

in r so that that said you can give it a

different name

and then you can do head of that set for

example i mean you can do anything right

so there you have just the data sets are

com

pre-computed for you you can use them in

any way that you are already familiar

with you could create an amazon document

if you want for example

but then let's let's keep moving on this

uh

on this minimal file one other thing

that you can do

is to move your functions somewhere else

right because

in real life we don't have just one

function you have many many many

functions

and the place where will recommends to

you know put those functions is in the

folder r

right and if you have just one file

maybe you just call that

file functions. or something right so

let's do that let's create a new folder

here

called r and and then

let's just create a new file called

functions

functions and this story here in r

so my file now is here it's empty so far

but you know i can i can move the code

from here to here

and now we start slowly building

a little bit of infrastructure that will

support

better a project for you know just in

anticipation for this to scale up

but you're going to start small you know

then of course you do need those

functions to be available in this script

so the next thing that you will do

is to call the function source right and

the name of the file in this case

are functions oops

dot r there you go so with that that's

exactly what's saying here

so now you know the file starts with a

call to targets

to library targets follows with a call

to source

and any number of functions that you

need to source and then continues with

some

options that you might want to pass

globally to every target so if you have

experience working with our markdown

you may have noticed that generally our

mcdonald's

files start with a setup chunk where you

can set up

options that will apply to every chunk

in the file

and then you have the option to set up

some

[Music]

options that are specific to individual

chunks

same thing here so here at the top you

could define

options like for example the packages

that your targets need

and you can tell targets to apply

that those options to every target or

you could use also

the argument packages inside each of

your targets if you want those packages

to be available only in that target

i'm going to make a pause here because i

i think i saw a question or a comment on

the chat

um go ahead

uh

that's a good question let's see um my

guess could be that the answer is no

that you will know that they are made

but uh let's i mean i'm very very new to

target so let's try that out so tar

make uh would be one function to call

but you're already familiar with it you

will try to make the pipeline so instead

i'm going to use this as an opportunity

to show a new function uh it's called

car

outdated uh so if it returns

zero it means that all the targets are

up today

and i would like to show off some what

other function that

one that allows you to visualize the

the network of relationships between

objects

and that is star well these two you can

do entire uh

glimpse to begin with generally entirely

dreams is very cheap to run and you can

even run it before

the pipeline has been made um

but it won't give you a lot of

information it's just a very nice quick

way to visualize

the relationship between targets but if

you want to get a little bit more data

you can do

this network

and and there you see you start seeing

relationships you start seeing that

uh you know how the different targets

relate to each other so you know to

create a summary you need

the data and you also need the function

sum and only then you can create a

summary right

so this is um this is all up today

so what cj was saying is something i

would like to touch

uh well maybe

not just now give me just one more

second and and then i'm going to

actually

outdate that function so that we see

what that actually means so we've been

talking about this idea of you know

targets being up to date or outdated

what does that mean

okay so so far what we have is

we first load the target package we then

source the

f function that we need then we pass any

option

including the packages that we need so

if we if we if we needed more packages

which is

not the case right here you would say

something like say that we need g plot2

now you just you would do something like

this so this is kind of the equivalent

to doing

in your normal script something like d

player and then g

2

and so on and so forth right so you do

not do this in this case

because those packages have to be kind

of injected in the targets when they are

created right so instead you do it this

this way here and you may have you know

whatever style that you like maybe you

do like to have one line per package you

could do it this way if you like

and then this file will always end with

returning a list where each element of

the list

is one of those targets that you want to

define right

so here is one target you know the one

called

data here is another target right the

one called summary

and here is a list of targets right

there's many ways to do this you could

also do something like

uh data and then you could do

uh summary and then you could create a

list with

theta and summary right so this

should be the same if i understand

correctly

uh except that you know there is a comma

here that shouldn't

be here i'll just clean this up as well

i mean this is absolutely not necessary

uh

but uh i just want to play with it so

let's see if this works

let's do tarmac once again

there you go tara make i'm expecting

this

it looks like i broke something here

so escape data is kept summary okay so

because i did not change those

it's kept the pipeline it looks like i

screw up something here

sister okay so i'm gonna be a bit more

conservative then and then do what i did

here

it looks like i need to learn something

more before i get into this

uh this kind of weird way of expressing

the pipeline so let's

run this okay now that it looks it looks

better

uh all right any questions so far we are

now going to

the more exciting part to try to

demonstrate why you even want to do

all this this go through all this

trouble

ah that's a good question

uh i guess that

yeah yeah that's a great uh question um

i don't know actually

um because he would think that he would

be internally doing something like uh

something like library uh gp people also

bad name right and this should throw an

error so why that error is not being

exposed in the pipeline

that's the question yeah that's a good

one uh let's let's

make a note why not

fail if live

thank you thanks a lot

okay so i'm gonna remove this this is

right so i'm still expecting that uh

you know all the targets will be skipped

yeah that's fine so now

what i'm going to do is i'm going to

change the function

in a way that makes it up out of date

and also in a way that hopefully will

demonstrate why you would even want

to use targets so

there is a function in our base which is

called cis sleep

which you can use to just make a

function wait for a little bit right so

let's let's make this function wait for

i know if i want to be really awkward

let's maybe wait for 10 seconds but

it's a bit too much let's do five

seconds um i think we have a question

there monica or

was that a comment skip the case

our target skip in the case is not

needed to

run them

this kept exactly yes so um

basically there is a cache so when the

targets run

the pipeline the first time it stored

this object

file in uh remember i show you this

target folder created an object in this

case data and summary

and the second time that i you know i

tried

to to run the pipeline before it

actually recomputes everything

it checks if the code changed in any way

that could

potentially change the result if the

result is going to be the same then

there is no point in recomputing things

so it just doesn't right it just skips

it

so it's that's the yeah

absolutely so that's why you want to use

uh targets basically but but if you do

change the source code so targets will

also analyze the source code of every

function

that you make part of that pipeline and

if it does change

then it will recompute right so let's so

the function sum is part of my pipeline

see how it is here

meaning that targets will be watching

right for the source code of that

function so if i now

change the source code here and if i ask

here okay

let me the output give you the updated

the object

so now you can read summary why because

the function sum

is used by the the target summary

therefore

the target summary is outdated needs to

rerun

to basically comply with a new uh

implementation of a function sum

so let's actually run it right if i do

that make you know i recompute

but not every aspect of the pipeline so

targets will skip data

right because it is it does not depend

on uh some notice how the target data

here

has nothing to do with sum right so that

means that imagine now that you have a

very complex

workflow and only half of your workflow

you know depends on the change that you

have just made that also means that you

can save half of the time that

it could have taken otherwise to

recompute the whole thing and that's

when

the benefit comes so while i was talking

i kind of distracted you

sorry for that but the point was to

demonstrate that

this function sum was slow basically so

let's change it

for 10 seconds and just wait for 10

seconds and watch it

so if i do tarmac

it should take some time here right it

is because the function

sum is waiting in the real life you will

not

write a call to a function to to for a

function to wait what we

will be doing is just calculating a lot

of stuff

right so you will be pulling big data

sets you will be doing very expensive

mergers joints and stuff like that

well that is when your functions are

paid to run

and you don't want to recompute things

that do not need necessary to be

recomputed

so what would be the benefit well okay

so i had to wait but i had to wait only

once

now if i want to change something in my

pipeline say that you know i change

uh well actually anything that i touch

now

will will outdate the targets but if i

do target make

again it should go very fast it should

skip everything because nothing has

really changed

right and with this i'm very close to

the end um

i would like to you know highlight that

again

the um the targets are now available for

you to use

you could stick them for example in

another markdown document

if you will and and maybe if

there is no many questions i may show it

today but if we do have questions i will

move that to

uh like a more realistic use case uh in

the next meet up

so we are exactly at the time when i

would like to stop

thank you cj and and ask for a round of

voices

maybe just yet just a quick round of

voices like to see if anyone has any

comment or want to pass cj you're first

uh

so

fair enough fair enough i think we will

learn more as as we explore more targets

and the place to start probably could be

the tarq

underscore queue function which explains

how you define

what actually triggers a target to

recompute

and uh it's pretty clever you know there

are things you can say hey

look watch for this url give me the data

of this url and if this url

changed for example data store provides

us with

data sets through some kind of website

interface

uh you know targets you know we can tell

targets to watch for that file

just watch for the timestamp of that

file and only pull the data

if it has changed and if it hasn't then

just just fine

and the other place i would start

reading is the actually the the

underscore target function where

basically there

is you know there's a ton of information

there about you know all the things that

you could do

with um yeah with you know urls and

files and stuff

uh but you know i invite you to explore

i will explore my own and maybe

in a couple of meetups we'll have an

answer for that

constanza any question or comment or

pass

alex thanks

alex

oh

thank you i hope to go back to the best

practices section

and i know if alex you would

have any time at all it would be great

maybe to engage you in that in that

section

uh claire you're next

[Music]

so

oh

yes i think uh i think i agree that

my understanding is that you declare in

that file

everything that needs to run but my

understanding is also that you do not

run it manually it's not that i do

source

underscore targets dot r what i do is i

got to adjust

altar make sure that i make if i explore

the source code i would expect somewhere

that it would be actually sourcing that

file

i'm not sure where but i'm pretty sure

that that's what it does but you

wouldn't do it manually you would just

call

telemach

you go

so

awesome yeah i think it's going to

become clear when we actually show

how for example you can create two

different our markdown documents

with the same target pipeline so you

have a comprehensive pipeline that is a

super set of all the sub workflows that

you can run

and then you know you combine the

targets in whatever way that each report

kind of is meaningful to you so i think

it does acknowledge

account for that but then it's also very

free gives you the freedom for you to

define

you know what is actually a project and

what is this

workflow of that approach jackson i mean

i need to hurry up a little bit sorry

jackson

yeah yeah

i'm pretty sure that alex might have uh

explored that that question

um unfortunately we don't have time to

answer it now but uh

i'm very very keen to hear the answer

monica

absolutely yeah use cases definitely

monica

yeah i totally agree i also wanted to

say that um

well as you know this is extremely

helpful and he's also willing to meet us

again maybe later in the process of

understanding

what we can do so we accumulate some

questions and then we probably invite

him again

uh to try get some answers from him uh

thanks a lot everyone for being here i'm

gonna

you know post this video it's gonna be

here for those

who couldn't join um uh yeah see you

next time
