---
type: Video Transcript
title: "Project-oriented workflow"
description: "this is the first data science equator  following the retrospective last week so  I wanted to start by thanking everyone  for sharing your opinions and feedback"
resource: "https://www.youtube.com/watch?v=TEUbVjhooIg"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=TEUbVjhooIg"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

this is the first data science equator

following the retrospective last week so

I wanted to start by thanking everyone

for sharing your opinions and feedback

and in particular to CJ for believing

that that was a that was excellent

you know I got really really good ideas

and many of them have been great on

taking action and if you want to see

what's going on follow with that this

leak here or issue 18 at the that size

equator summarizes you know the distance

learn from from all the science

incubators up to today and will try to

make them better but the session of

today is focused on project or in the

work flow and the reason why and kind of

last minute decided to talk about this

is because I realized actually that I

have a kind of neglected to talk about

this to be explicitly in one of these

data science innovators workshops and

many of you already incorporate the

practices that we are going to be

discussing today so I apologize if it's

kind of boring because you're a

know-it-all but but if even if you

already incorporate these practices it

may be the case that it is not very

clear why you're we are doing things the

way we are doing so I you know found

very nicely articulated arguments about

why these practices are a good idea and

so instead of trying my best and failing

to explain why I basically follow this

blog by Jenny Brian and Chris my are

idle where she explains she focuses on

these two functions and not said working

directory and remove and I explains why

she believes that that's not a good idea

what problems those functions might be

suggesting in terms of what is the work

of the person using those punches so

yeah this this what you see on the

screen says that it's kind of an

aggressive in a way but in a funny way

because journey is a very nice person

she would never go into your offices at

your computer or fighter but she

confesses that after seeing code that

has to be manually before it runs and

hello you know which is for example

teaching classes and things like that

she doesn't and same thing for remotely

so let's go it started and start from

the basics basically trying to

understand what is the difference

between what is workflow and what is the

product of your work so she defines what

a flow as something that is your

personal taste something that is kept

embedded in your habits and the product

is the essence of your work so what you

your project is trying to do and he

machine you know

articulate he said I know we shouldn't

kind of hardwired our work workflow into

our product so our scripts should leave

no record of our kind of habits and

taste in these matters so I would like

to ask you everyone there and this also

follows the retrospective so one of the

things that we would like to improve is

to kind of learn by doing and if I you

know create homework to be done after

the decision I feel that I can be maybe

kind of putting too much pressure on you

so I would like to try let's destroy see

we can work on this together during

decision so here are four items that I

would like to kind of stop for a moment

and think if you believe that they are

they belong to what we define as the

workflow so your preferences and taste

or if it is the product of your work so

anyone brave enough to cipher

item number one you know the a leader

let you choose to write your mother code

do you think that's that's your personal

preference your taste or is that

something that should be embedded in

your streets hello hello good great okay

of course that's workflow that was an

easy one good to get started how about

the raw data like a call to where you

know you the raw data is should that be

part of your script or you send your

personal personal preference is that

product or product ray how about the

name of your home directory if that

appears in your script are you admitting

workflow into your script or is just the

product of your work that's workflow

right and that's that's where we

actually wanted to get to we're going to

be talking a bit more about that I have

to get rid of that home directory from

your strips how about the art code that

someone needs to run on the library

[Music]

right yeah I think in the road if it's

raw it's kind of I think I would point

certification easy flow that is wrong

because it hasn't even touch is not yet

a product but I think that in this

definition the product refers most

mostly to if it should be part of your

script because the script is the throat

and so basically he's trying to get to

the point where I mean if you are going

to say if you need to path to where the

data lives I will you know I think that

we agree that you know if you you know

bringing the data from somewhere the

path should be there and if it's private

as you said maybe you just need to you

know write a comment saying where you

got it from yeah I think it does it

comes from like a reproducibility

perspective which Jenny and people are

very happy ended up so they might argue

that if you can't provide your relatives

because it's private or something like

that then maybe your script should work

from some intermediary snack subset of

that that you are willing to use so that

it is reproducible you know are these

reproducible like within organizations

and I would just provide a normalized

but just only my control yeah so it's

really it just wouldn't make sure that

everybody someone might look without

someone who knows this good yeah privacy

is a big issue and also and now that we

bring this conversation also remember a

conversation I had with Constance's that

made me think that you know sometimes

you sometimes you want the script to

output something just cannot break the

code so that the code actually friends

and so maybe one thing you could do is

probably you know inject dummy data so

it doesn't say that it's fake it's

public because you invented it you

created it and the only purpose as long

as you clarify that is dummy data

the only person cause of it is just to

demonstrate how the code works so

someone can just know copy paste the

code and run okay so let's and this is

something that even when we now know

maybe what we should be do

unfortunately we still have a lot of

legacy code as you know lines that you

know we may want to refactor it to

something better that brooch is not near

to go back to every single line in our

you know go with a medium lines and

change everything a better idea could be

well every time you go to its script

see if you can improve something at this

one line and eventually if you go often

to that script eventually you will have

improving food I'm every project from

now on ideally should incorporate the

practices that we agree are a good idea

so for example here we have three chunks

of code the first chunk is this problem

that we mentioned before

right where the file contains the path

to my computer's he uses malroux

documents and that's workflow really

so someone reproducing my work doesn't

need backs as I need to see and I may

have like a mercy

[Music]

so the first chunk is certainly

something now if we have a chance to we

should prefactor so something better it

will be the second chunk where we just

know the only thing that we need to kind

of confess is still in there is he side

my project so the path sorry actually

inside my pressure so this part is

confusing because it says path to brush

it but I should say something like path

to file inside projects so for my over

there but then the path from my route

right the path everything that is like

see users mouth blah blah blah that's

not explicitly encoded right

I just just using a function from the FS

which stands for file system package to

create that for me so if I'm working on

a Mac on a Windows on a UNIX or a boon

to computer it doesn't really matter

that will always work so you can use

that to refactor the first child and

even better we you know idea that you

would even avoid

dis lucious because not all platforms

work the same way so the second thing is

good the sex the third thing is better

where we encoded nothing that prefers to

my work any question about that I think

a question yes so I'm thinking to get up

in the fact that everyone has that in a

different location so if I wanted to use

this command is there like some

flexibility in that regard of being able

to always find say get help folder in

the computer yes yes so what you are

doing so inside the brackets you I mean

all this is doing is finding what is

your home so this thing that I'm

highlighting it is the package that is

feeling it out and what's here as you

can see this example is actually invalid

so it's kind of up to you to type within

the bracket something that is actually

points to where you want the users to be

the problem of that we have in relying

so much on the Dropbox folder is

something like really tricky a way we

know we are trying to go to help people

overcome that by doing something very

similar to this we have a function that

is called I think it's called to di a

Dropbox which simply wraps this thing

and will not only these parts on your

occasions have been sent but also we

that will add everything that follows

you know to kind of drop you inside the

Dropbox folder so that way you can only

concentrate on every path inside exactly

there yeah you see the problem is not

everyone does that okay but I don't have

my back to me this is another

the conversation for another time but

yeah right in any case I think what we

are actually probably the next example

will show that but not the next back

soon and if we are working with a

project oriented workflow the where the

brush it believes that's a really matter

because you only refer to things inside

the project and if if we are struggling

to get stuff into the project from

outside the project then then we need to

have like yeah we do support each other

to try find ways to do it I mean the

project should not depend on anything

outside the project that you can yeah so

let's continue and hopefully we'll we'll

get to that

so next section is exactly that

self-contained projects so

self-contained approach it can be moved

around on your computer or on to other

computers absolutely change computers

all your colleague wants to you know

place that project somewhere they should

be able to do that and it should just

work which means that every script in

that project should prefer two things

inside the project in a relative way

without referring to where that project

leaves so nothing outside the project

itself you can refer to nested folders

using just relative paths and to bring

data from outside you know you can

provide like a link to a website or

something I hear is you know the problem

we do have knowledge that is that we

rely a lot on people having data and

specific folders in projects and so the

way Jenny Brier articulated and I think

it's a good way to put it it's like

agreeing that we will all thrive on the

left or the right hand side of your

problem so following conventions do it

does constrain our behavior a little but

that is going to make everyone's safer

so I and I know I do experience the

friction I know people experience the

friction in the organization by trying

to get data from those folders and I

think that I want to be involving that

to try to figure out how to reduce that

friction so maybe that could be a

personal conversation with with anyone

because we need to learn you know how

you know how is that you face that

friction so what do cell phone paint

brushes look like okay aces project

folder that contains all over I got

already one fine so this is in the ideal

world of course what we do is not that

the world we get data from outside the

proteins so that's that's how you know I

need to be part of these to help change

that and any our script should be able

to run from a fresh art process

with the working directory set to the

root of that project any our script

should create everything that it needs

and that thing that it creates should

even his own workspace or the folder

that contains abruption not outside any

our script now just nothing that we

didn't create so for example it doesn't

be stole a package that the user doesn't

help and let's see some examples to put

this thing in concrete could you likes

to us some questions before I mean to

examples or make comments okay let's see

what all these things look like so this

explore some violations of this idea of

self-contained projects so let's say I

am in a project and inside my project I

have a folder called data sets so sorry

I am in approach there you go

I am a project and to access my data to

create a path to my data I need to do

dot dot which takes me out of my project

and then access it a sibling for the

Icicle data sets and then inside it

there is my data so this is the simplest

scenario to represent what we are doing

when we are connect data from from our

Dropbox folder anyone has an idea how

where

should put these folder called data sets

to make it a self-contained project in

the project folder so how would this

path change once I do move data sets

inside my brochure just one top right is

that we say well that's one option but

we were suggesting just removing both

dots and the first slash okay so you

could just say data sets my data perfect

yeah you could do that exit so that

would be a way to reflect or you know

once you move the data sets inside the

brochure and I understand that it's not

feasible for us maybe because it also my

future that's my leaf or a Zurich server

or something but you know if you can

make it project self-contained how about

this one let me show you this is the

area where it should be paying attention

to remember a self-contained project

creates everything it needs if you are

restoring the object our data that by

default unfortunately our stores our

data and you have to actually come here

and do something to us are to stop doing

that so if you are storing our data and

relying on the output of previous

our processes if you rely on those

outputs for your current our process

then your version is not self-contained

because the project is not creating

everything it means it is relying on

stuff that was stored in a previous

session so how do you think you should

go to options and you see this panel

here how do you think you should change

this to encourage yourself to create

self-contained projects until instead

instead of asked never exactly so you

have to take here restore our data in

global space at setup antique that

should be black I'm here don't even ask

me

just never right so you're not bored

when you position are we just closed it

and everything that you didn't

explicitly write as a file it will be

gone and that's a good thing because

once you force yourself to do that you

will start writing code in a more

sustained way how about this one

I'm sorry here poor now I'm going to

pretty hurt your feelings I know that

that you like pillow because pillow what

it does is it it attaches a package same

as library if the packet exists in the

user's system and if the package does

not exist it installs the package but

following a strictly beyond preferences

following strictly definition by Johnny

Bryan of your water self-contained

Portugal booklet which kind of violation

[Music]

violation is telling where you are

changing something that you didn't

create in the script itself so now I'm

going to a party I take wine and then

when I leave the party you know I take

not the leftover wine that I took yes

you know you're affecting the system so

maybe the person who is buying your code

and has a very particular configuration

of the installation maybe some code

relies on a specific version of package

and when you install this package

maybe this package has some dependencies

and those dependencies break the code

the person who for staff trying to write

with our hand so it is considered rude

to say yeah

straightforward way

and now going as straightforwardly to

their specific problems of the function

set working yeah I understand

actually at the end of this notch in the

beginning of this blog Jenny sighs well

all of these like the caveat is that you

know it's not as the words for you is

good and the only problem is about you

you know I obviously works for you is

try and go on and with this I'm gonna

say I have I do myself and I've seen a

lot of people doing things that they

because they really know what they're

doing it is safe for them to do it but

probably would be not the kind of thing

that I would encourage a newcomer to do

so I know that in your hands for now

practice but in the same way that I've

heard you know XP

one of the to outsource of the pragmatic

programmer he said who is like a legend

he said that he has been experiencing

writing no text for six months and the

impact on his code has been new and he

was brave enough to write that in the

book and the other doctor was kind of

crazy

so I said well what I have to say is

that you know if you have been writing

code for 40 years then maybe just give

it a go and see how you go and you reach

that point well of course you know with

experience you really know what you're

doing and you decide in a very

controlled way what risks so I look at

that and before also I want to say that

our studio recently I believe

corporately this feature where if you

type library and the name of a package

that you don't have installed it would

immediately come up this thing telling

you that you don't have the package

install so if you want just click so

anyway they stole it for you so it is

you know it kind of does something

similar to P load except that you have

to kind of actively going on press a

button which I believe is yes I was

gonna try to stop that a bit short cause

we're running low on time on that there

are solutions to dealing with packages

and specific version types of packages

that we need to use this briefly touched

on presentation that it is but so rather

large computing topics we did it for

this format but maybe that's something

we need to do on my dress that good all

that stuff and that's something we can

result in this what time we have left

yeah I think the great thing of these

decisions is to expose the issues we

won't be able to solve it might at least

expose them and make people aware so

we're talking about sick work

directory this is you know Jenny Brian's

opinion on what's what's wrong with this

so this is what it would look like for

example where you have you know you said

they work in directory to a path that

only Jenny has and then you kind of rely

on that working directory in there to do

a bunch of things so to write other

paths and then for example here she's

also kind of showing this example where

she's getting an image from outside her

project director so what's wrong with

this a bunch of things I think we kind

of already cover that but basically the

path won't work for anyone except the

author and maybe not even the author

because in a week or two or a month or a

year you will have changed your paths

and I think we have break the pressure

is not self-contained or portable to run

anyone except you will need to manually

edit the paths which is kind of a pain

and also suggest things that like follow

me suggest that the user is using a

long-running art process and switching

gears from one project to the other by

calling set working directory are

supposed to mean something like this so

here I have enough three projects open

this one is you know I will start the

session and then working directory is

pointing to the project folder so in

this case RT I match this other project

from started the session and

automatically the working directory is

pointing to and this third one same

thing ever start the project and without

doing anything it's already pointing to

our tenant so instead of relying on

working on a set it manually

indirectly you can just rely on our

studio projects for example or on the

here here so that is what do you suggest

you should do instead either rely on

ours to your projects or you call the

function here which is very clever and

identifies the room of a project but a

bunch of things for example a three seed

folder or if the recent approach file or

if there is a dot here file so that is

like a way blower can be

any of you see and this will just work

for anyone you share the code with and

beautifully it also works with our item

files that have a very weird notion of

working direct and white laughs do you

have any comments there it's a default

that you can change but is it painful

before that goes against any other

convention so this is remove least also

has some problems and this is her

opinion about that what wrong again is

suggest that the user is running a

long-running process instead of kind of

restarting all the time and certified

fresh' session it does not in fact

remove a lot of things I mean it doesn't

create it's fresh and process it would

only the live objects that were created

and are still in the global environment

but it will not for example

restarting they touch packages that were

attached or you will not kind of reset

options that were set like several in

directory if you do it globally and we

will not change your tin directory so it

is it is not probably accomplishing when

you think of mine a comma so remove this

is not the way to create fresh process

and it is also hostile to anyone that

you ask help because you know if I went

if I am writing my own pressure is very

expensive objects to create options in

my environment that to me and I were to

run and then you know you must be for

help I run your call and your compound a

stat line it will remove all just in my

global environment and it is it is rude

as well to to leave that in scripts that

your gosh so what's better okay you

start from a blank slate which is kind

of the options that we saw before and

ticking that box a never store never ask

me if I need to store objects from

previous sessions include x1 press start

very often and by very often I mean very

often maybe every minutes it's kind of

like tea should you should be kind of

doing it almost automatically shift

control if that will do the trick for

you and we've run every script from the

top every time you restart when you run

the script from the top if you're

running long-running processes then what

you do well what you can do is you can

isolate the little bits that are

expensive that take a long time and you

can write explicitly narrow TS file and

then use you work on down your bounce

stream from that data you create scripts

that continually work by reading or if

this is something that you do very often

maybe you should be you know learning a

bit about Drake which is a package that

works exactly on that problem it will it

will catch the long-running data sets

and make sure that you are not running

things that should be updated ok this is

the end I'm sorry in a we went way too

long and this is what I wanted to end I

mean the importance of these practices

has a lot to do with whether your code

will be run by other people or not if

it's gonna run another machines or not

and if you're trying to run this in the

future or not so if you're doing

something for yourself for you know is

ephemeral and you're gonna do fine the

next 10 minutes because you're trying

something maybe you shouldn't worry at

all about we have been discussing today

so if if you sir

if that purposes then go ahead and be

and be happy without an end any any

questions comment so we didn't decide is

this I don't know at the end of services

must have a nice yes exactly

sorry that's what the title also remind

me

[Music]

[Laughter]

to the group because because it was safe

II see this issue but yeah we can have a

grin with clouds that you know it would

be great to have the discussion live but

then if it's what I think is that it's

exciting to say that we don't agree that

these practices are I might be helpful

for everybody okay I mean my suggestion

would be not don't change stuff that is

behind and start implementing these

practices from now onwards and if you

have to share any curve that has these

things will take a moment to kind of

refactor them before you share it so

everything that you touch is like you

know the more you go through a code the

more you will need that code so if every

time you do just a little bit improved

by a little bit in the long run what you

need the most

yeah I'm
