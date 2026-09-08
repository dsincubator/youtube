---
type: Video Transcript
title: "pins: Sharing versions of a dataset with pins and Dropbox"
description: "so thanks everyone here we are at the ds  incubator today  uh on a meetup about the package pins  which we covered some time ago but pins  has  um  changed the "
resource: "https://www.youtube.com/watch?v=VCHu0uhGo2g"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=VCHu0uhGo2g"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

so thanks everyone here we are at the ds

incubator today

uh on a meetup about the package pins

which we covered some time ago but pins

has

um

changed the interface or at least added

a new interface since pins number one

the old interface

became a legacy interface um

i think

we are discouraged to use it because

they say that they're gonna maintain it

and keep it alive but want to updates or

like improvements to it so they're

pushing for the new interface

um so that's one reason to talk about

pins today but another reason is more um

like practical and related to the work

that i'm doing with the past tax project

and so i wanted to use this space to you

know share the idea of pins in general

to talk about the new interface but also

and to present one potential way in

which i could distribute

a continuously evolving data set

uh in a way that analysts can use and so

they can use different versions of the

data

and not break new code so the fear here

is that if i change the data set in some

way by adding a column by renaming a

column maybe they're all code dies you

know breaks

and so there is a number of ways in

which we could you know create a release

um

what we do what do we call it a release

framework and release um

but

um

but the pins is one way in which we

haven't think

or we haven't discussed so i would like

to present it as one potential solution

to provide and release um a plan

monica i hear you say something or i

read you say something you know you're

asking if you miss something about a

joke or above

about

about a joke that someone wrote and i

missed or something about what i'm

trying to explain

no it's about a joke i feel like i'm

missing something

i find jackson's jokes very

confusing sometimes

i just laugh because he's funny

[Laughter]

so i pretend i know he's talking about

okay so here we are talking about pins

um and the idea is mainly to is a is a

very narrow

specific

use case

is the idea of sharing different

versions of an evolving data set

as pins which are basically our objects

and

i'm using dropbox as one

online

platform

i don't particularly like dropbox in

general but it is a tool that for this

case could be useful in the team where

i'm working with passtax and it's it's

you know very much used so it could be

used with minimal kind of overhead

everyone knows the tool

and uh it plays really well with the

idea of local

boards of

folder boards with pins

as i already said i already mentioned

the idea that pins has changed the

interface so basically the objectives of

of the meetup are going to be

learning about the idea from the

perspective of an idea analyst someone

who needs to just free data that i for

example put publish on dropbox so i'm

not going to be focusing so much on the

publishing side of things so that is

what in my head is kind of part two of

this meetup and it's one part that is

not confirmed so if we have time i'm

gonna show very briefly how i published

the pins that i'm going to be using

today for the example but if we don't

have time you know i'm i'm good with

just showing here leaving a record of

how an analyst could use this idea of

pins

to inject in their analysis different

versions of data sets that i'm

delivering to them

so thus the audience is of course you

know analysts from 2di but also people

from anywhere that you know might find

this idea

useful and and

i already said why this is important

because sometimes you know if you use a

new data with all code things break

basically

um

the

specific things we're going to be doing

today is you know read the latest

version of a specific pin

and

list all the pins that are available in

the board and you know i have i have for

example published somewhere explore the

various versions of one specific pin so

you may publish different objects but

for each object you may have different

versions and you might want to explore

that and by exploring i mean trying to

read for example what is the description

of the version of the data set versus

another one so explore the different

meta the different metadata of a

specific ping

and and then once you find the version

that you want how you actually go about

reading that specific version and as i

said if we have time we we may see how i

publish the beans on on dropbox

so that's it so let me jump to

um well let me as usual i'm going to

walk you through the structure of a ds

incubator series generally you know this

is a github uh repository somewhere on

the tourist organization in this case

it's ds.pins

and each meetup is hosted in inside a

folder in this case number one intro um

and what you're gonna read here on

screen is the same that you know you can

see here on my r studio

viewer panel

so i'm gonna be walking through this um

so this document again

someone pretend me um

develops a data set and they publish it

to a folder in dropbox and you say an

analyst have access to that roblox

folder and it is in sync with your local

computer so you have a copy in your

computer of that dropbox folder that

lives online so i think we are all

familiar with that framework so i won't

spend much time on that

but um

then uh what i'm going to be doing first

is the setup um

setting this up is is fairly

straightforward you just use the package

pins so library pins

so this is um

maybe a clarification i should do i mean

this specific framework for distributing

data is one uh where i have in my head

you know

the idea of analysis that uses r

right

and so there may be other ways to

distribute the data

even

in dropbox too but this media is focused

for those who actually choose to use r

then i'm going to also be using other

packages

all the packages that come in the thai

diverse because

they're convenient for some

manipulations that i'm going to be doing

later on and you don't have to use the

tigers but i like it so i do and also

i'm going to be using the here package

which as we saw in the last series is

very useful to create paths that can be

ported to different computers so

basically this project works in my

computer and should also work just the

same in your computer too

also i'm going to be sourcing a function

that

i created to read to basically to create

a path

inside this specific um

sorry to create a path and to the

dropbox folder to the copy of the drug

portfolio that i have in my computer and

the name of the file that contains that

function is is this opinions underscore

path and it lives in the art folder of

this specific brochure that i'm showing

to you

so now if i if i use that function pins

path what you could see is something

that might look familiar to those who

work in 2 degrees which is this a very

horrible path

to anything that we put inside dropbox

and i say horrible because it contains

things that are generally very ill

advised

for um paths like spaces and symbols

like the two degrees symbol

unfortunately that's something that we

can't we cannot do a lot about without

at least a huge effort so we just live

with that and so this function pins path

is something that i could build as well

for the analysts working in um in our

team uh so they don't have to you know

know the tricks that uh you might need

to know to write such a complicated uh

path that you know has so much potential

to break

so uh so far there is nothing um nothing

related to pain so what what is related

to pin is the very simple idea of

basically um telling the package pins

where to look for objects and then

reading the object so that's the whole

meet up is about that

so pins has this idea of a board a

concept of a board which is you know you

think of it as a folder

and you have to tell pins where that is

so

it has a function called board folder

and you have to give it a path

uh to tell it exactly where to locate

that folder and and you know because

this path is so difficult to type you

know that's why i use this function so

you know just i'm going to pass pins

path

and with that now the board has been

created so if i print the object board

it's simply some metadata that bins

knows about

to look for things and here we already

have a little description which says you

know the path to that place in my

computer and which is of course you know

in sync uh

on to the dropbox online and then it's

in with your own

computers locally

and it contains two different objects

one is called ep agricultural livestock

and the other one is called

esa

sme

so this is all you need to do on your

end so you first you know use the

library the package with library pins

and then you create the board giving it

the path to where that folder is

and then the next thing you could do is

just to read the the pin and this kind

of demonstrates um

the new interface for pins where the

first argument is the board meaning that

we can pipe that into the function pin

grid so before a pin used a function

called pin or pin get

now those functions in the new interface

are called different things so now it's

being

ripped to read the data from a pin board

and yes you can use

the board explicitly here

but the pipe makes it very readable so

i'm going to use it

then the second argument is is name

so usually because it's such a common

argument we won't

use it explicitly we just use the value

that we want to pass to name esa

sme

say that you know i want to read that

particular um

pin right so i run that code and that

here it is you know the data set that

is behind that name as simple as that so

pretty much if you walk away from this

meetup with that you know you already

achieved a lot uh but then you may

wonder okay how do i even know that that

is an option um and one is you know as i

show before you know if just being the

name of the board then you would see a

very short summary of what you have

there but there's also a few other

functions and they are all in the new

interface they are all

using as a first argument board so

that's how you always kind of start

doing anything on pins you just start

with the board that contains what you're

looking for and there is this very nice

function pin

list

which will give you a list basically

extracting this piece that you know we

saw on the board and now you know you

know which options are available to you

which dataset's available to you but

then as i said before um

it is

it is possible to create different

versions of a specific ping

so let's do that so if i have a board

then i can query for

the versions with pin version as you can

see the the

the

new interface is pretty um

structured pretty systematic you know

always start with the board then

type pin underscore something and you

know let the autocomplete inspire you in

what you want to do and so if i type

there i already see that there's a few

things that i can do with versions and

the one that i want to see is just to

list versions

but if you choose

to know more opinions lately i could be

talking also about you know pin version

delete this version prune but those are

functions we are not going to be

covering today

and now you have to be a bit more

specific you have to say you know the

name the second argument and of the

thing that you want to know something

about the versions that you want to see

so in this case let's say esa

sme so if i want to see the versions of

that data set here they are

you can think of it so here you can

already recognize

that some beans have been created

at different points in time and these

points in time were all very close to

each other because and i've been

preparing this as a demo for today but

you can think that in real life you know

i would be

for example publishing a new pin every

week or every month or whenever there is

an update to the data

so you would be able to filter this data

set as you would normally do with tools

from for example

the tide diverse package

just to get the specific version say

this one here that you want um so um

[Music]

for convenience i'm gonna rerun this

code here i'm going to assign

the result of that to

to an object called versions because now

it's a data set that is kind of easier

to work with and so let's use tidy verse

here to

you know manipulate this a little bit so

if i if i query versions and say that i

want to get you know the third version

here so this one here um i mean instead

of typing the whole thing i could do

something like versions

and versions and then slice

the third

and row that will give me just that one

row and then i could pull

just the values of version so that gives

me the string that i want so let me

clear that up

go with the arrow up to get the code

that i want and now the specific version

that i'm interested in i'm going to

store it in the object version

so version now contains just a piece of

text that i can use

inside

um

[Music]

a number of functions in the pins

package to know more about that so for

example here i can do uh well as usual

with with pins board pipe

ping underscore something so meta for

example gives me if i give it the name

esa sme i can say okay the version

is the specific version that i'm

interested in right so the one i stored

in the object version

so that one will give me the metadata

associated to this file where i can see

okay so this is you know v1 for example

in the title and it says a little

description of what that data is so this

is all information that someone like me

who develops the data set would be

including in the metadata for the for

the reader to know more about that data

and decide if they want that data or

something else

um so another thing that you would you

know might want to do is to you know

once you know the version instead of

just knowing about the metadata you may

just read it but you're you'll think

you're in a specific version right so

whatever came with that specific version

so the name is the same esa underscore

sme but the dataset might have changed

you might have you know had

you know maybe different columns maybe

you know different names for the same

columns

and you as analysts want your code to be

stable so you could probably

read for each analysis analysis is a

very specific version you put it at the

top of your file and you make sure every

time you run that code that code will

run successfully regardless of what it

is the latest version of that data set

you could be using one specific version

for one specific analysis

um so this is what we have just covered

and that's about it so this is a good

place to stop for questions and answers

and answers and then if this time i'm

going to show you

how i created that how i published the

data which is very simple too and short

so let's go back to your faces

let's see if someone has

anything to say

cj please go ahead

i mean just out of curiosity when you

save these versions so they do some sort

of gif of them to reduce the size or

does it like

inflate the size

like duplicated

yes thanks cj um yeah just like you i

was interested in seeing the internal

structure of that thing

so remember that with uh pins path this

is a little custom helper that i built

you know i can access the

the directory where i have all that so

let's see what is the tree of that vfs

tree

of that path so basically to see what's

the content and

as you suggest there is

totally duplicated data

you know you can choose the argument

type

for

specifying the type of object and that

you want to save for example in this

case i'm using the qs

format which is quick serialization and

comes from the qs package it's pretty

clever in that is fast and compressed

but

but yes i think two times so two

versions of a data set might even

duplicate the

uh the size so it is not probably the

most um size efficient way to share data

and this is on top of

any version control that you might want

to do right so you

at the same time that you're creating

versions

with this kind of hash type of thing

you may also be hosting this as a

developer in uh in a git repository i

mean that you know you could see the

evolution of that

let me go back to your faces

yes cj or hippies

so then to follow from that you said

there are you can use different types so

like is it is it any type or

whatever and then also like

why did you why did you choose or prefer

this um qs type that i've never heard of

and also like what

what are the features of this qs type

that they'd save um does it save

like column types can it say something

besides the data frame

yes in general um

[Music]

pins are designed to

or the package pins is designed to store

objects in general

and the qs is simply one way of saving

objects in r that is very similar to rds

so this might be a little jargon for

those who are not so close to the kind

of coding side of things but

um but rds is one way in which you can

save objects of any type

and cube quick serialization is a

package that that's the same so it's

basically another flavor of rds and the

reason um is that i learned about it is

because it has been advertised by by

this package i didn't know much about it

i mean i didn't know about it before and

so i thought oh let's see how it works

and i did find that was faster and um

and uh more compressed and rds um

which is what what says here

so i liked it i tried it i didn't try it

for real in a big big project and it's

working just fine so i'm kind of liking

it and

you know any other format here i think

is supported

and i'm not sure if there's plans

including arrow which is new and very

powerful i'm not sure about the plans

for expansion to these types

and

and there is something that i'm not

gonna be covering here today but uh some

objects that i i know from what i've

read here very quickly some objects

might not be supported by pins

and there is still a way to

read and write them so basically pins

you could use pins to store things that

pins doesn't understand in a native way

just as any random file that you might

be able to write

and then pins will give you still the

ability of cache and all of that but

output just a path basically and then

you handle that path by reading it with

whatever you know tool you need to read

that very weird imagine format

let's go back to your faces here

i think you know this actually brings me

to two big big features uh of pins

um

that um

were considered when the signing pins

and this i'm just paraphrasing what i

read in the

health files so that you know i showed

recently um so the very first

um

goal of pins is to make data

easy to share

right

but then there is a second kind of side

effect if you want or a second goal

which is second to the ability of

sharing things and that is the cache

the idea of saving data somewhere in

your computer that you don't have to

specify explicitly uh cache in computers

are quite

consensus so there are some directories

that each operating system you know like

mac windows and linux

defined as okay this is the place where

you know you should say cached object

and that's great because that means that

you know you can say something like okay

pins just save this wherever you know

and pins knows and knows in my computer

as much as it knows in your computer so

that releases me from having to write

any code that handles paths you know

something like uh

um

yeah i don't have to to write codes and

read from this specific place just say

just saving in cash and beans will know

you know and that's huge it doesn't seem

like a lot but you know at two weeks we

know that that's huge and because things

come from very odd places and sometimes

you know a lot of our code

is just handling paths and a lot of our

code breaks precisely because of that so

the more we minimize the surface for

bugs the more we can focus on the actual

things that we care about in our code

all right then we still have a few

minutes i would like to maybe show very

briefly you know how you actually create

pins i think that by now that might be

even intuitive because you already

learned about the very consistent new

api which is this idea of board

pipe and pin underscore something so i

show you ray for example and then you

know all you need to know is that this

is right right

so with this function is is the one that

you use to uh to create

um or yeah to publish pins inside the

board

so i have this file here which is the

one that i used to create the pins that

i'm showing you here

so let's just walk through uh the

printed code so thanks jackson for being

patient i i realized that um you noted

that i i already opened the floor for

questions and you didn't interrupt so

thanks for that

um so this is how you publish pins

actually i could expand this more

because i'm not going to type any code

i'm here using the pins package of

course the source of the data that i'm

going to be publishing comes from a

package called passtax.data

and i use the package here to create

portable paths um

i'm using the same function that i

showed you before to create a very

difficult to type

path to our dropbox folder

um

i create the same the board in the same

way that you created when you want to

read the pin the same thing you do when

you want to write it and then there is

this function pin write which which has

a bunch of arguments including arguments

that allow you to specify as i mentioned

before cj the type of object that you

want to save if you don't specify it it

will be rds by default

and then some metadata that again is

optional um something i think would be

typed here automatically if you don't do

it

explicitly something like you know the

size of the object how many rows or

things like that

but then you know the more you spend

time thinking about what's useful

uh information to share i think the more

use user use is going to be that data

set

and and then if what you want to share

with your colleagues is beyond the

arguments like something that doesn't

fit in title and doesn't fit in

description you can always give

arbitrary metadata in a list passed to

metadata so for example here i use this

argument to pass

the url where the original data comes

from

and you can specify version

to say okay turn on or off the versions

so here i'm advertising that pins can

help us

share different versions without our

analysts knowing much about for example

git

but also know that you can turn it off

and then the objects won't grow

as as you re-save them so with

version off what you can do is just

overwrite continuously the objects that

you create and share always the latest

and greatest and then leave it to your

version control system the one we use

kit

um

to

give to it you know to that specific

tool and the powers of going back in

time which is totally doable right so

either you choose the feature version

from pins or you use version control but

then version control is maybe a tool

that is kind of closer to the

development side of things and maybe not

a tool that is very intuitive for

everyone else

uh so here i i did the same thing a

second time for like the version two of

this data set uh the only thing it

changes in this code is is the string

that says that this is version two uh

version one and version two and then i

did the same thing for different objects

so here i'm saving not know how i'm

saving or writing

ping with this data set ep agriculture

and livestock and here at the top i was

handling a different data set and the

esa sme

um

so here i'm just reusing data from a

package but in real life you know you

would be doing a ton of manipulations

maybe to create the data that you want

to share and that's and that's all and

then you know you may have noted that

pins tells you if you are

creating a new version of a pin

um or if you are replacing the

the version that you had before and you

can set something that we know we might

talk about that

in an extended version of this series if

you want otherwise we won't

but you can say that you want the

version feature for a specific pin or

for the entire

pin

board that's that's something that pins

allows you to do

okay back to your little faces

let's see if there's any last comment or

question

okay last thing i want to say uh is oh

thank you i'm very proud to finish on

time today and i'm advertising this poll

on slack on the coding channel

um

for the next years inquiry series and i

i thank you for having been very patient

uh up to this point in april five i

haven't haven't this year asked for a

feedback about

the

meetups because i have had like some

things that were kind of burning to

actually actually do work with the

passtax team i wanted to share

information that um

that we needed but now i'm opening the

series for vote so feel free to go to

the coding channel find this post and

add your vote about which topic you

would like

us to talk about starting next meetup

and one of the options is you know an

extended version of of this meetup where

you would see more the development side

of things of beats

but so far we are

more interested in learning the general

aspects of unix

to unleash the power of your terminal

okay thank you all very much i see you

next time
