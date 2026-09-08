---
type: Video Transcript
title: "targets: debugging"
description: "so today the ds equator will be covering  debugging with targets uh  there are three sections or subsections  in the chapter debugging in the target  manual and"
resource: "https://www.youtube.com/watch?v=lfhuO71ikQE"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=lfhuO71ikQE"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

so today the ds equator will be covering

debugging with targets uh

there are three sections or subsections

in the chapter debugging in the target

manual and and i think the most

important one is the first one

for users at least of medium-sized

pipelines so that's the one that i would

like to cover today

and then maybe we're gonna cover the

third one uh not very sure if you know

when i have time for the second one

so we're gonna be talking about um

basically the idea

of debugging when something goes wrong

and you need to find where the program

is to fix it

there are some tools that you can use

normally outside a

pipeline and in a pipeline so but the

two approaches are a little bit

uh different so let me show you first

what we mean by debugging uh i guess

that

we are familiar with the term but you

know the tools may not be

very familiar because most of the time

we just debug by printing things on the

console and seeing

what we get and so that's the approach

that we most of the time have to fixing

problems

but there are tools that we can use and

we have covered those in da's incubator

meetups before i think jackson covered

one or two

topics meetups on that topic but just as

a very

quick overview so here i am in r um

for a moment forget about targets just

talk about the idea of debugging

so say that i have a function here

called

at one this function takes a an element

and adds

one and then i have another function

that takes an object

and applies the function at one first

and then multiplies that

times two so i could um

i could run this uh first i'm gonna

run this uh lines from one to six

to basically put that on my environment

so you can see now that at the very

bottom here in my environment i have the

function at one and the function

calculate

sorry what did i do there there we go so

i mean if if i

you know give a sensible value to x here

and then

i feed uh so say like i fit it with the

number one let's

make this a little bigger um

so now this should work fine so

calculate will

do what i expect it to do so for example

it returns the value

four right because uh you know they

they've

i fed the value one but then uh

one was added to one that makes two and

then was multiplied by two that makes

four

right so that's that's good no problem

with that but then what happens if for

some reason x becomes

i know the string one instead of uh

of the value uh one uh let's see what

that happens there

okay so if one instead of being a a

double

or an integer is a string then when i

fit it to calculate i get an

error so you can see here in red to my

right

let's expand this a little bit so how

would i go about

finding the problem well one of the

mainstream tools

that we have in r is the traceback which

which kind of shows

us how we actually got to that point to

that error

and so that's a very useful function

because you know it points

exactly where the error came from

it came from the function not the one

that i called which is calculate

but instead from the function at one and

specifically cm that is in line

two so here if i go to the function at

one

here you know in line two that's pretty

cool right very precise so we exactly

know where product comes from

and then we could try you know figuring

out what was going on with that line and

you know what it makes sense right

because if

one is a string or doesn't know how to

sum the string one to the number one

right

um but there is even better tools so now

uh you know now that we know where the

problem comes from so we know that comes

from the function at one

we can use the function the debug

and pass it the the symbol at one so

add one is an object that lives in my

environment

right so let's review that

here so i one is it's an object so i can

use

um i can use the symbol as opposed to

the string at one

and so you know i i run that function

debug

at one because that's the function i

want to debug

and then i do exactly what i did before

basically to pass to you know to call

the function calculate

with the value that you know i have

passed before

and now you know something super

interesting happens that you see

that you know we enter in this mode

which is a different

mode it's called a debugging environment

where my console now looks a little

different

it has this browse thing uh and also

um i you know the the this

kind of file is open where

the definition of the function r1 is

available to me

and also i have here the traceback

something similar to what i showed you

before

uh and i could jump to different steps

in the stack

it's called in the stack of what you

know the functions that were called to

the point

where an error was thrown but here is

the

the point where we are interested right

not one um

so now i could i can use these tools

here like for example say next

or press the letter n and then enter

to jump from well from the you know from

the arguments

into the body of the function and if the

function was long say

10 lines i could press you know n enter

10 times and move along the body of the

function

but one interesting thing is that we now

have as you can see in this environment

mode

in this debugging mode in we are inside

the environment of the function so we

have access to the objects

as they are as they exist inside the

body of the function for example the

value

x so x is still a promise it's called so

it hasn't still

be it hasn't been given a value yet but

uh

but as soon as i press x you know x i

mean this value if i want to query what

is the value that x holds

that promise materializes into the value

that it has

and now i can inspect exactly what the

function is seeing when it runs

and interestingly i realized oh shoot

this is a string this is not a double so

obviously i did something wrong there

so that's how uh you know we do back

um and we can go here and say oh sure

you know i realized that this shouldn't

have been

a string it should have been um

a double or an in digit right so i can

stop by debugger i know right what it is

and now i can try again and it now works

oops actually it doesn't

what else that i did wrong

maybe i need to restart my session to

show

this example

ah because i didn't source the functions

okay

there you go so this is the expected

behavior right

okay so any questions so far i mean this

is the a brief

overview of um like normal debugging

outside a pipeline for targets any any

comment or question there

okay take that i said no and i'll move

on so sorry if this is like um

a repetition of something that you

already know but because we are going to

be

adding a layer of complexity now

i thought that it was important to make

sure that you know we refresh

the tools like debug and trace back that

we have

at our disposal so now let's think of

target so let's start my session

let's uh i could you know let's actually

let's leave this here i'm gonna so i'm

in a targets project

um as you can see here i have a targets

folder i have a targets file

it's not very important to look at the

details of the file just now

actually it's the exact same file that

we saw

the last meetup i haven't changed it uh

except for for a comment that is there

i'm going to show you in a moment

so let's say that we want to explore

this pipeline

how do we go about that so the first

thing we do is

we attach the targets package

and you know already that you can do

for example this network this network

gives you

a very quick a nice overview of what the

pipeline is like so let's see

okay i see that since last last time

let me kind of move things around a

little bit

so this pipeline has a bunch of targets

here to the left

and they all somehow get

a data set right um everything that is

output here to the right somehow points

to this

data so data is an object that um

is a data set that was first you know

cleaned and there was a raw data then it

became a data set

and that data was used to produce a

bunch of things like

to feed it in your model to produce a

report this

is a report and these other two things

too which is this is another report

that depends on this target that is

broken so the

this target called lm plot is broken and

therefore

everything to the right of it is out of

date because you know with that target

broken

everything downstream from there you

know won't work so we need to

fix this target here and we need to find

where the problem is so okay we're gonna

do

debugging with the target pipeline so

how do we go about that

so the first thing you would do is you

know we are in target so tarmac

is your your friend you know it will try

to

recompute things that um that are

described in the pipeline so the

pipeline here is

uh here to the left um so this is a list

of of targets and the ones are more

relevant to us

are here uh so let's see uh we know that

the the

from the plot even you know we know that

the target that was broken was called lm

um plot which is this target here but

let's see how that would be kind of

exposed through

a call to tarmac so let's say that we

want to again recompute the

the pipeline and and we see that it

works all the way up to this point

where we get

an error so target is already giving us

some information

about uh what there is an error

and also where the error is so it's in

the target lm plot

so it is you know we narrowed down the

problem of trying to find the

the bug uh to this specific

target also and very importantly because

debugging targets is not

um exactly the same as the bug

in vanilla r importantly we had a link

to basically the manual so that

is something that i strongly recommend

so actually i'm going to be

using this here to my to the left of my

screen

to follow actually the steps that the

manual recommends

so basically it is a link to the chapter

that we are talking about today

uh and in and i as i read you know i

realized that

there is a bunch of um methods there's

three methods and the one that i'm gonna

be covering today is the first one

and also it's telling me that there is a

function that is called

tar meta that you know it's a data frame

that contains a bunch of information

about targets

but in particular you know we can

explore uh

the field error

so error is just a column in that data

frame and

and uh as you can see all we have that

we have done is just narrowed down that

data frame to the specific column that

shows the errors and the name of the

targets

and and here we see that um there was an

error in this

one uh right so this is another view

of you know where to find the problem

first so that's the very first place

to start i see

was that a hand yeah go ahead

yeah sure it's showing the error message

so i wrote a very informative error

message

um you know it is an error that i inject

of course on purpose for the demo

um my error message was oh no

um actually i don't know maybe the let's

see what the names of

uh i'm not very sure how to explore the

format so i'm reading what column names

we have

in uh in the entire meta that's

something interesting to

try to explore um on our own time yeah

so how we could go about that now

okay so in the i'm again i'm reading i

it looks like i'm looking at you but

actually i'm looking at the at the

manual and reading the instructions so

we enter now this first mode of

debugging that the manual proposes which

is called

environment browser so that's the the

experience that is the most similar to

the one that i showed you

when we are debugging in vanilla r so

the very first thing that

manu recommends is that we restart the

session

so usually you use targets because you

are using expensive computations and you

value what you have done

a lot because it may have taken hours to

produce

so you know by you know in the money

explains you know how kind of restarting

your session

uh and before you actually start

debugging can protect you from

destroying targets that you care about

that you're gonna

you know work hard to produce to compute

so

the first um and advice or guideline

that is

well the first thing we need to do is of

course to to

use targets so let's do library targets

i'm also going to source all functions

in r

and i did it in a very quick way shift

control l for me

because as i mentioned a couple of

meetups ago

this project is not only a target's uh

project but it's also on our package so

that means that i have

tools like devtools load all uh at my

disposal with

keyboard shortcuts which just pressing

that keyboard shortcut it loads

everything

in my r folder so everything is is kind

of ready to go

now the miner says okay now what you do

is you you call the bug

which is the same function that i showed

you before we were

working with vanilla r and now

you you call the function there or you

ask to debug the function

that uh produce the problem and this is

where you know we have to be a little

clever right because you know the

targets told us that the broken targets

is this one

lm plot but as you can see that target

is actually

um store is just a name right but the

computation

happens in the expression here in this

command so the command

is the one that we want to debug so the

name that we need to inject there is

plot lm right so what we want to debug

is the function plot lm

which is the it may be different the

name that one that you get from the

target

um pipeline

so i'm to run that so now it's ready the

the buyer to be kind of fired so by the

way in five minutes i should stop so i'm

gonna nominate jackson

because it's just where kenya and kind

enough to talk today

to kick me out of the meet up in

five minutes okay so

um next step is to run tar

um make so we already we did something

very similar to what we did in vanilla r

right and now we want to remake this uh

pipeline so we run our make

but now we can be more specific you can

say so tarmay has an argument that's

called names

that allows me to say okay what is the

target

in which i want to focus so again think

that we want to focus on this one

specific place

and we want to save any potential extra

computation that we don't need to

to do so now what we put here is the

name of the target so the target that we

want to make

is lm plot and it makes sense right so

we are debugging

the function or the command yeah the

function that holds the commands

for this other tag right but there is

one more argument that we're gonna

add here and this is probably the most

important part of the meet up

and this is the idea that you know

targets run on a background process

every time

and that's why it's hard to the back

because we don't have in our global

environment the objects that it has

that target has when it's computing

things

and why is it difficult well because if

we want to explore what target is seeing

then then how how do we enter that

environment

and that's what we're going to do now so

what we're going to do is we're going to

bring that process that usually runs at

the background we're going to

bring it here to the foreground and so

we can play with it

and so the argument is called call r

because there's a package that

that is the engine of that process uh

it's called our function

usually there is a function that you

know runs to move the process to the

background

but now we're gonna say no so don't move

it anywhere just kind of bring it to me

i think that's all i need to do and when

i did that and now i'm back to the

familiar now familiar

debugging environment so as you can see

um

i automatically opened this file because

i have a source code the file is called

plot underscore lm

it has the function called plot

underscore lm

and i can use you know the next and

things here you know let's press next

and it moves from the line 11 to line

12.

uh i can now query i can do again next

if i want let's click here again

next so now that i have you know i'm in

line 13 so that means that i can ask for

okay so what is a zone

okay it's new right and because it is

assigned here

right and and i i have also okay what is

data

okay data is a data frame i can inspect

it and so on and so forth

right so that's the process so now we

are inside the function i want to debug

and i keep

you know either pressing next here or

entering m

n until i reach the point that i want to

the back so here is the problem

that i have i have this score oh no so

obviously i forgot to remove this line

right and and that is what's going to

fix the problem

because i'm in a package i need to

rebuild the package now that i have

removed

i changed the source code of another

package basically so i'm

installing the package again so now with

that

done i can restart my session

use targets again

and now do tarmac

and that should complete with no

troubles as you can see the the

targets that was everything was kept

except for the targets that were broken

before

which is this one lm plot and now it

works fine i could do it our

uh this network and now remember that

there was a broken

um target there well now i expect it to

no longer be broken let's see

i think i have it somewhere ah here it

is so let's expand

this and show it to you

okay so remember this target was broken

before

now it's not right

so that wraps up the um

meet up the uh problem that

we haven't covered actually is this

other two

ways of debugging uh let me show you

what those are

uh so the debug option is very similar

to what we did it's just that you set

things

up not kind of interactively on the

console as i did but you do it on the

underscore target.r file which is kind

of the main targets file

and then workspaces has a benefit and a

downside the benefit is that is is

persistent

so if you um you know if you want to

retrieve

all the dependencies of the target that

has the problem

workspaces will do that for you it is

the best fit for

situations where your pipeline is super

complex and that you

you just want to see the whole picture

uh it's not so much for interactive work

the downside is that you don't get

a debugger mode all the the things that

you get is just

the targets that depend on the

problematic target but you don't get a

view

inside the body of the functions that

produce that target

anyway for good for you to know where to

look for the information when you need

it so with this

i'm i'm here at a 25 past so i'm going

to stop here

and open the room for a quick round of

voices um

first uh yeah actually let's let's do

the questions and comments ask the

friend of voice so the first in my list

here is antoine

antoine would you like to comment on us

something

thank you thanks a lot uh cj

[Laughter]

yeah yeah actually the

the thing that i forgot to mention

actually

uh is why you would do all this hassle

uh

let me stop here this function again and

install the package

uh so i'm gonna i'm gonna i'm i'm back

to where i was before

um what i want to show you is why the

normal

mainstream tools don't work so let me do

library targets and that are

make so the problem with

the why we need this extra layer of

tooling

is because the normal tools won't work

so if i do you know i have just run a

pipeline and it doesn't work

uh there is an error so if i do trace

back here

the traceback that i get is not as neat

as the one that i showed you before i

see it's like it's very complex and it

deals with a lot of low level details

that are not

pointing me in the right direction so

that's why actually we need extra tools

as opposed to just

uh like the normal traceback that i show

you here right

um so you know for some reason your

comments which i

reminded me that i forgot to show you

know why the normal

tooling fails with targets

any comment about that or i should i

move to the next person

claire

cool thanks jackson

um

i totally endorsed that comment uh so

just one more time

jackson gave a dsm quarter meet up about

that

also it's very well documented in

because every ide has its own device

so our studio has its own debugger and

it works pretty nice as

jackson is suggesting so also our studio

website has um

basically like i've written i made

videos as well about how to debug

with arch studio um yeah i think it's

worthwhile

your time a thousand times jakob

perfect yeah monika

yeah yeah that's true

uh

sure you're very welcome okay so with

this we come to the end of this meet up

and um and again my suggestion would be

that it would be the end of the series

because i

i notice as i walk through the series

how complex

and powerful right targets is but the

complexity also means that

the meetups might not be very useful

until

you reach the point where you need them

so the next two topics that i have in

mind

are topics that are kind of at the level

of depth

way beyond what we've seen so far and

while i think they are important i also

think that they will become important

only after you have kind of played with

targets quite a bit

so um i won't make a decision like right

now i will kind of consult you on slack

um before you know i made such a strong

decision to stop now and to give the two

other topics that i'm thinking about

but but just leave you thinking so you

can expect

me to reach out to you in the next

couple of days and also if you have

interest in in meetups in delivering

meetups

next tuesday and the one following that

one let me know

with that i thank you very much and i

see you next time
