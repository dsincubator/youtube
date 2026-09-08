---
type: Video Transcript
title: "targets: tar_cue(): Declare the rules that mark a target as outdated."
description: "so today the ds equator is about  tar q which is the function in the  package  in charge of  defining the rules that make  a target out of date which then  the "
resource: "https://www.youtube.com/watch?v=dV9C2eIo5QQ"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=dV9C2eIo5QQ"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

so today the ds equator is about

tar q which is the function in the

package

in charge of

defining the rules that make

a target out of date which then

the functions are make

will use that kind of knowledge to

decide if a target should run or should

be skipped

to escape so that is in response

to quite a bit of interest that you know

we have seen here in these meetings and

trying to understand what exactly

is happening and to try uh understand a

bit more

how to predict if tarmac will actually

compute something or we'll skip it

so on the one hand we hopefully by the

end of this meeting we will understand

um how it works and and we will be more

able to predict that behavior but also

we will learn how to tweak

the default behavior because it is a

bunch of options that we can set

to change that behavior in a way that

may match our own

needs better so i'm going to jump here

to

the one r studio cloud instance

i'm working from our studio cloud

because i recently messed up my computer

and everything is not working

so that was a great solution to getting

a

running environment quickly so

i'm using a very um so let me start by

starting my session can you confirm

thumbs up if you see

something that looks like our studio

yeah cool so i'm gonna expand this

so as usual um we're gonna start with

library

targets and i you know i should also

say two things first to ask for a

timekeeper cj can you

kick me out at 25 past

thank you and then a requirement so

this is the third fourth uh edition of

this series and the requirements

i mean every session so far has been

kind of self-contained

and i think that this one is two and i'm

gonna explain um

briefly you know what um basically the

basics in case you didn't join previous

beatducks

but but we're gonna move fast i'm not

gonna be talking about the basics so the

basics are covered in previous meetups

so i'm hoping that even if you didn't

attend enemy times this one should be

more or less meaningful but uh but for

a better picture you should probably go

back to at least to the meetup about the

basics of targets

so once we uh you know load the package

we can use

all of these functions including the

function tar

edit which will open the file

underscore targets.r which is which

defines the pipeline

and we have covering the basic section

in the basics meetup

what is the structure of the file and so

i'm gonna

talk through what i read here in the

file as a way to

refresh our brains it usually has a few

sections so the very first section is

just a call to library targets because

this file needs access to functions that

exist in the

package target then the the section

after that is

one where we source any files that might

contain

uh functions that we need to use in the

target

a pipeline then there is a section where

we define

options at the global level for all of

the targets

here i do not have for example a call to

options so the plain

you know based our function options

which you could if you needed then you

would call it here too you know

at the level where you know where to

find things globally

and then we have a list of targets a

list of calls to tar

underscore target and each of these is

you know our targets and this our

pipeline

so like a collection of targets make a

pipeline and this pipeline

has only very simple steps just

three steps the first one we

create a target that actually contains

the path to a file that lives in the

data folder

and so let's have a quick look at that

file now

there we go expand this a little bit

here

this is the file that the first target

is gonna be reading

then we have a second target that i

called raw

and which basically it is a data frame

that results from reading

with a custom function read and that we

can go

and see what it looks like so i'm going

to do ctrl

dot to open the go to file

thingy and i'm going to do read now

hit enter to jump to that function here

it is this is just a call to read

underscore csv

and i'm using the argument

called types to silence

the messages that we get for the column

specifications of a data frame when we

read it with

read underscore csv that function comes

from the

reader package which is part of the

tigers that's why

i did here in the options section

for all targets i'm using the package

titles

the third target here defines a new

target called data

and it is the result of read of

passing the data frame that we read in

the previous step

and applying the function clean so if we

do

clean this is what the function looks

like

it's like a toy example very simple just

takes the

data set that is input and um

performs a mutation adding a column

and replacing the base or replacing an

existing column

so there is not a lot to think about the

complexity of the pipeline because the

focus of this meetup is

not you know the importance of the

analysis it is instead you know how

we um understand what's going to happen

um with the targets when are they

updated or when are they

out of date okay that was the overview

so with targets you might remember that

we have a function called tar

outdated um so if i call that function

the output that i get will tell me if

any of the target is out of date

and therefore if it needs to be

recomputed so for example right now the

output is character 0 meaning that there

is no

target that is out of date which means

that if i run the function

make what i expect is all targets

to be skipped so nothing will actually

be recomputed because the targets are

out of deck

so let's have a quick look at the

documentation

of the function um here

to tarq so that is the source of the

information that i used to

learn about this idea of target queues

so we're going to be covering as much as

we can

of this help file um the the

arguments that we're going to be

covering are all of this

if we have the time and they are

explained in the argument section

and also there is a little detail

section before we then get to the

arguments

uh there is three um aspects

or three criteria that targets will look

for

to decide if targets need to be run or

not

so and to begin with the very first

thing that targets do

is to see if there's any metadata

associated to

the pipeline if there is no metadata

it's going to be

all targets will run and that makes

sense right so if i

uh have a quick look inside the folder

targets

you will see two folders one called meta

and there we see a file called methods

again and it looks like that so

basically

here in this folder targets is where

target is storing metadata so if we

destroy that metadata

actually there is a function called tar

destroy uh that folder boom

is gone and now targets uh has no

metadata so if

we run our outdated

we should get the output that every

target is out of date

meaning that tarmey could recompute them

all

right so with that we will uh you know

as you can see it says that

for every target path data

and pipe and

raw they all run right because they have

to be recomputed so if

we do it once again they will be uh skip

skipped because they have already uh

there is some metadata for them so that

is the meaning of this first item here

so if we have no metadata make sense you

know targets will go and recompute

everything

so the other the second point is if

there is an

error i mean this i didn't figure out a

good way to kind of show an example and

that is kind of meaningful basically

what it means is if uh

you know if i break this function say

that i go to

the clean function and i break it

stop with uh this is

with an error uh i mean you would expect

like that target will continue to try

run that target um even if it didn't

change

because but it's because it's broken and

it's giving you the opportunity to fix

it

so if i do try out dated i will see that

now the target that depends

on that function the data is called data

and the function is clean

the function is broken now it's clean

you expect that that target will be out

of that

so now if i do a tarmac

you know it will try to run that target

and it will fail it will throw an error

but even when i already run you know the

tarmac

if i write it again it will still try

again right because last time there was

an error so that's that's what this

um bullet means right so

as long as there is an error target will

continue to try

uh rerun that particular tag so let's

undo this

so if i you know undo that uh now

title data should say it's all good to

go right

and therefore tarmac will skip all

targets and actually

is running he's running the data because

last time

it was uh it was broken so now it has

pre-computed it has

uh stored it again so if i now run start

and make

there you go now it all is all skipped

so let's move on to another way and this

one i do not have an example for it

basically it's saying that if the output

of the

target and is say you know a vector

of characters and then the the class for

some reason changed to

uh i know it's a data frame instead of

just a vector

then targets will try to recompute it as

well but i didn't come up with a good

example

so i guess and it's i think it's kind of

quite

intuitive uh you know the class of the

thing

that the output produces changed you

know it makes sense that you know it

needs to be recomputed you know that

target is out of thing

and then there is um this other um

item here that talks about um now is the

first time you're going to be using the

actual

function that this help file describes

it is the function target q

and you will see at the top that target

uh includes a bunch of arguments so the

first

argument is mode so let's talk about

that one when you see

that one argument takes many options

usually you know the default

internally usually is set so that the

first one is the default

that would be it would be mean for a

developer to choose it's

different default so the default of this

argument is photo so that is the

behavior that we are kind of already

intuitively familiar with but now let's

tweak them a little bit to see what

happens

so first of all where do we call that

function okay the

the queue is just an argument that you

can use

either inside the call to tire

option set so you set the queue for all

targets in one go

or you can also do it in any of the

targets individually right so

you know if you see there is also a

queue argument in

each of these calls to entire underscore

target

so you can define a queue for a

particular target

or you can define a queue for the entire

pipeline right that's that's

the freedom that you have now with these

two layers of control

so let's pronounce that at the global

level so

we know to begin with that um

we know that our target pipeline is our

is updated right so let me clean this

with control l

run outdated and what i expect is

character zero because all my targets

you know have already run nothing has

changed so

as long as i keep calling time outdated

i should always get

a character 0. but what happens

if we play with that argument there

so if we say q equals guitar

q we give it the mode

not the default but a different one

let's say always

if i consider that targets are always

out of date then what would you expect

to happen

if i now run outdated consider that i

haven't changed

any code anywhere right i'm just

changing the i'm just sending targets to

interpret

the um you know how targets are updated

or not

in a different way but i haven't touched

anything in the pipeline

so if i now run this function you can

see that

targets thinks that everything is out of

that

so basically this is kind of completely

um

changing the behavior in which target

interprets things and everything is

going to be

re-run over and over again if i run our

mac

so before you know all targets were

skipped because all targets were out

up to date but now through this argument

i have told targets to think no they are

all

out of date and i want you to rerun them

all the time

and we can do the opposite as well we

start with uh

with the mode never so so once that some

things are

out of um actually let me for a moment

before i show you this let's go back to

the default and one way to go to the

default is to just remove that

so now i everything is up to date

okay so let me clean this with control l

so let's go to a function and do

something that we kind of know

that will will make the target out of

date which is for example to change

you know this function call let's add i

know

hello so the source code of this

function has changed

and targets is noticing it because one

of the criteria that we're gonna get to

that later

is to basically read the text

inside the body of function remove the

format and things and remove the spaces

and then see if the string remains the

same or not so now it's not written

it's not the same because i have added

the string hello

meaning that uh i mean if i run now

start outdated i would expect the target

data

to be out of leg right because the

source code or the function clean

has changed but if i

do this if i tell target hey

never look at anything just you know

so what you will think

is that it will behave as if nothing has

had changed in clean so we saw before

they always

right where you know even if something

didn't change

then everything would be considered out

of date and now this is the other

extreme where with never we say hey

whatever i do forget about that consider

every aspect is

up today um so with that

we covered that mode argument

and we are ready to let me see if we did

recover yeah everything is good now

so let's see what else we can learn so

this other argument called command

where does it come from okay so their

main command

if you look at the health file of tart

targets

let's have a quick look at that with f1

and jump to the help file

scroll down a little bit and you see

that the second argument is called

command

so this is command right so you can

write it explicitly or match it by

position

right but uh oops but uh but there it is

the second argument the expression that

we pass

to each step in the pipeline is called a

command right

so with this um

with this argument to target you what we

are saying is that

the um the command

this command this expression if if it

changed

there should trigger the to tell

targets to consider that you know

command or that target in particular out

of play so if i say new here

the default behavior so to go back to

the default behavior let me remove this

for a second so this could be

the default behavior and what i have

just done is i have changed

not the function read itself i just

changed the command

inside the pipeline that calls that

function so what would

what would happen here okay let's have a

look

so if i run tar outdated by default

target would think that that particular

target is out of date

and any dependency of it is out of date

too so that's why

you know it considers the two out of the

here

and i can change that

if i say i'm not sure i think i can do

it here too let me

reformat this a little differently for

comfort so i'm gonna

uh say command

and the default is true right so if i

say

false we expect the opposite behavior so

let's do command

false

and run it are outdated so now what we

get

is that you know a target has changed

its behavior

and now a change in the command

that uh defines the target does no

longer

trigger the um you know that

it couldn't trigger a target right so if

i do tarmac

everything will be skept right because

now target thinks that

it is um they are updated right and the

same thing i could do remember

i'm actually this comma here is so

remember that this command i could also

call it inside the target here right

it's the same thing

except that now it's going to be looking

just

into that particular target as opposed

to the whole

target of course if i move this

from here to here it's a totally

different story right why because

this is the target that is being

modified which command is modified

and this is the target that is ignoring

the command meaning that in

with this way of expressing the queue

uh this command raw will be

out of date right so let's confirm that

and there you go

and it's not only raw but also data

because data then depends on raw and

then you know we have this chain of

dependencies that are being um

traced by by targets

um similarly we have these other two um

arguments i would like to cover i'm not

sure if i'm gonna do the two but maybe

the at least depend i think i can cover

that one

so depend um is this idea that you know

each target depends on other targets so

what happens

if i change an upstream target right so

now let's go back to the

situation we had before

this is say so this is the default let's

run

outdated now everything is up today

let's clean with ctrl l

and let's say that i want to change this

target

at the level of the function so i go to

the function and i add

here hello what i expect is you know

read now changed therefore raw is out of

date

and because data depends on raw then

both targets are out of date right so

let's run

outdated and we confirm right this

target didn't change

it does not depend on raw it's the

opposite right raw depends on path but

not half

on row so because i changed something

here

these two commands these two uh targets

are out of date

but i could change that if

i say depend

equals false right so now i'm saying

that the computation of

data does not depend on anything like

basically so if i run

outdated now you can see that the only

thing that is out of date

is the target raw and not the target

data which we know depends on it right

i'm not still very sure in which cases

we will want

to you know modify the behavior like

this but i'm sure that once we get a bit

more practice with targets we will find

use cases uh for this i have um

a minute to cover them a bit less than

that over the other argument

um maybe i'm not going to do a lot of

justice justice to it basically

in the same way that um we can define

cues for for a lot of things we can also

find cues for when

the the type of the format of the file

that is stored inside targets so these

files here called

inside of other objects these files

default

to be saved as an rds file like

there is other formats that are

supported for example the qs

format i'm not going to show it here but

i think that with with you know having

seen me

uh play with the other arguments i think

you can you can figure that one out as

well

and so and also i don't think it's super

important because it would be rare that

we would ask

targets to save the files in a different

way it's it's very useful i think

but maybe not the you know thing that

you would do the first day that you use

targets so with that i am thanks cj

i'm already um at the limit i would like

to

run a little round of voices to see if

there's

some questions or comments that you

would like to make i have cj first

um no not nothing to say it's

interesting that he offers these options

of um different ways of testing targets

it's kind of cool but i haven't i have

to

think about how that would come out

totally encourage i mean

ucj were one of the persons who are more

interested in learning

about these queues and i thank you for

that the

it's it's pretty well documented it's

not a lot of documentation to read

um so i haven't covered this section so

maybe

if you want to read this in a couple of

paragraphs you will have a full picture

of what's going on here

um no not really questions i'm just um

maybe i missed it um why would you use

that you never want anything to throw

uh or to to make it outdated i mean

there's never options

confusing me

yeah i don't have right now like a use

case um

because i haven't used it much myself

other than for teaching purposes

so yeah i kind of struggle with like

bringing this

you know down to like everyday life i'm

pretty sure we will find scenarios but

i don't have anything unfortunately to

share

maybe if we have uh will in the closing

meeting

we can ask him you know what uses people

have found for

for this yaco

uh also not really any questions um

as of now but i i mean it starts to

all make a bit more sense and like be a

clearer picture so yeah

thanks for that um yeah thanks yeah i

think

even if we don't find a use case for

these things uh like

opening the magic box and understanding

how the tricks work

i think it's useful um yeah and moneygun

yeah i also don't really have anything

to add

thank you alex

um i'll i'll just chime in that one

use case that i had for having the never

was when i was pulling data from a

database

i set that target to never rebuild

um so that i wouldn't have to go back

and

actually pull from the database every

time

um it was very useful when i was like

just

building my pipeline and then i could

run it quickly and then

once i had that correct i switched it

over to actually rebuilding every now

and then

nice um and i also like you know the

finding

finer grained control that we have at

the level of each

target um because

you know maybe as alex suggests

sometimes you know

you know you know you want to experiment

quickly with something

and you don't want to consider what's

happening somewhere else

so great okay thanks thanks a lot um

with this

we can kind of wrap up here any exiting

comment before we go

[Music]

and for once we finish one minute before

the

the half hour thank you very much see

you next time

thanks bye
