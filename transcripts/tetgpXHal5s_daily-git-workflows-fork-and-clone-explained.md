---
type: Video Transcript
title: "Daily Git workflows: \"Fork and clone\" explained"
description: "Of a theoretical way what the workflow looks like and because what we did last time although it did cover every step of the github flow is you..."
resource: "https://www.youtube.com/watch?v=tetgpXHal5s"
tags: ["ds-incubator", "github", "git", "workflow", "pull-requests"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=tetgpXHal5s"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2020-08-04T00:00:00Z"
    usage_count: 23
usage_window: { from: "2020-08-04T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

and today uh dds equator is

a follow-up of last meetup where we

covered

the simplified version of the github

flow and today we are going we are going

to kind of explore it in uh

in more of a kind of a theoretical way

to try visualize

what the workflow looks like and

because what we did last time although

it did cover every step

of the github flow is you may have not

realized because a lot of the magic came

directly from github so it

does a lot of things for you uh when you

do the kind of shortcut approach that we

used last week

so today um i you know i

you know i started developing the

materials

and realized that probably um i'm too

ambitious so i don't think we'll kind of

probably get to the practical part

so hopefully this will be the motivating

um section and next week we can probably

get

uh to do something hands-on or you can

do

the hands-on part on your own at home

so basically the idea is uh to follow i

mean i'm following

the instructions from the book happy git

with r

and it has a section dedicated to this

daily workflow that is called

fork and clone and it is one of the most

useful workflows because it helps

basically collaborate happily with

others

and and the kind of take-home message

from

from the chapter of that book is that if

you are in doubt about which workflow to

follow if the kind of simpler workflow

clone or this more complex workflow fork

and clone

if you're in doubt then you would

probably want to do foregone clone

because it's kind of safer

and even when i'm working with myself

many times i

i do the more complex workflow fork

and clone because and sometimes i want

to contribute

to the for example repositories that

live in two degrees

not as as a maintainer but as a

collaborator so

you know this hopefully will make sense

soon

so the objectives of of kind of the

meet up although it might be broken up

in two is to first

understand uh visually what this

workflow

looks like and

second to probably expose some

problems that we might have in our

setups

uh to motivate the

more automatic way of setting things up

that use this

allows or other frameworks allow i'm

gonna be focusing mostly on use this but

there is also for example

great automated setup via

the the gh

command line application which is the

basically the

the command line tool that git have

created to interact with github

from the command line from the terminal

and maybe your

maybe your git client also has some

automatic setups but because there are

infinite not information a great number

of uh of git

of keep clients you kind of need to

figure out depending on what's your

preference depending on what is the

client that you use you will need to

figure out how to do that

yourself so i'm gonna explain uh kind of

the more vanilla approaches and then you

can adapt that to your own

to your your own like kids

so um you may have realized that

the the github issue it kind of is now a

little bit out of sync with the document

that you are seeing

here and by the way if you are lost um

the git have the the document is is as

usual the date of today

uh minus dsi for this incubator

uh so the dog for is a little bit out of

sync because as

i developed the content i kind of

changed my mind about a few things so

i will need to update the github issue

but um

maybe that's not that important so the

first thing why this is important is

because the gita

again the git and the foreground clone

workflow

is is very common and second

it is important because we are going to

be using this workflow during the

upcoming thai dds workshop

and i am you know expecting to dedicate

every meetup before the workshop

to refresh some of the tools that we

will use during the workshop but even if

you don't join the workflow the workshop

this series of meetups should also be

helpful

uh because this is has been almost a

year since last time we covered this

this topic so it's good to refresh and

also because new people have joined the

organization

after we deliver that content um

it is also important because they use

this package so you know

the reason why i want to introduce you

again maybe today use this package

is because it helps you implement the

github flow

in a very automatic way so you don't

have to think too much about it and you

can avoid some of the common mistakes

and finally another goal of this meetup

is also to

make you a bit more familiar with the

git features that you have already

available to you

through our studio which some people i

know

use but maybe other people do not use so

before you decide if

if you want to use them or not it's i

think it's a good idea to have a good

understanding of what you can how you

cannot do

directly from a studio before you kind

of add

some other tool some other layer to your

to your work

so the the idea uh of what we're going

to be covering

probably across two meetups is first

today we're gonna be visualizing the

workflow with some images that i

borrowed from

the git the happy git with our book uh

i'm gonna to

focus on the challenges that a manual

workshop

might present and to consider some of

the advantages that automatic

workflow or automatic setup can give you

uh and the practice part i'm still not

sure if we're gonna do it as a homework

or um or next week we'll figure that out

later

so um this

image represents here in yellow

in the top left a repository

that you can imagine leaves for example

in the two degrees organization

so it is them even when we do belong to

the organization we can think

of the two degrees organization as

something that is not

something that we owe it's kind of owned

by the organization so

we can refer to that um repository

as the repository of some owner in this

case the organization

we belong to the fork and clone

workflow first takes that

repository and creates a clone of that

but it has a particular name when that

clone then becomes your own

and that name is fork so what you do is

you replicate

the owner's repo into your own account

and that is where you get this other one

here on the top

right so that is the fourth part

of the fork and clone

workflow the clone part is where you

bring that

that is now on github so see that how

this or horizontal line splits

stuff that is here on github this is the

icon of github at the top

and at the bottom we have the icon of

our computer so everything that happens

from this

horizontal line up is happening online

right

so on the left we have on github

the owner repo and on the right we have

uh our own repo but again on github so

so far this arrow from left to right all

you did there is the

four part and then this arrow that goes

down

is downloading that uh your copy of the

repo

into your local computer and that is the

clone part so the the whole thing

is the fork and clone workflow

so um how good you do that well there is

a button

on github that you can click to create

that fork

and then you can copy the address of

your

um repo and

you know give it to our studio for

example so that our studio clones it

and we're gonna be looking at you know

how to do it in a moment but for now

i wanted to kind of have this uh this

picture so

because the focus of today's beat up is

understanding

i want to make a pause here to see if

this image makes sense

and if you have any questions at this

point

okay it looks like it's clear right

thumbs up right if it's clear

yes probably you already see saw these

images and again they come from the

amazing book

happy git with art by jenny ryan and jim

hester

so what is the challenge as you noticed

uh you know with the setup that i showed

you before you would be ready

to do this happy path where you know

once you

you're in your local computer here to

the top to the bottom

uh right let me make this a little

bigger

if i can yes so here is your computer

here is your art studio project with uh

you know the clone

that you pull from your repo that is

in intern a fork from their repo their

owner's rate

so you can add commits you can change it

in any way because you own that thing

right

and then you know there is this happy

path where you can push the changes that

you do locally

to your own repo here you know the one

in red

and you can even submit a pull request

of course you cannot

change the owner's repo directly you can

do it only through

a pull request the complication here is

that because

you know this is a parenthesis because

we do have access to the github

organization

of two degrees sometimes we don't

realize that we are actually pushing

commits directly into

the owner's repo right but for now let's

let's just

imagine that we always behave uh in this

particular way

where we behave we even with two degrees

um repos we behave as if we were

external collaborators which is

something that i do myself a lot

so this is a happy path right from from

your local repo

to your own repo on github and then from

your own repo on github

to their repo to the owner's repo say to

the greece repo

via a pull request but not it is unhappy

path

so there is no arrow so i'm gonna go

jump back again to the previous slide

so there is no connection between the

two degrees organization repo for

example and

your repo on your computer

you what the problem or the challenge is

that

um as you know time passes

people may continue to add changes

to the owner's record so someone else

may add commits

and the honest report falls out of sync

with the code that you have in your own

repo and the code that you have both so

in your own repo both

on github and locally so this is one of

the challenges of the manual

configuration so let me show you a

little bit

up to this stage what i mean by i lack

this connection here so for this

i'm going to go to i think i have here

a link somewhere yes i have this

repository

i'm sure you know many of you did this

many times uh

and i'm i'm expecting you to be a little

bored because yeah i already know this

but i'm hoping that you will from from

kind of breaking the concepts down a

little bit more and digging into

the theory more that we have before that

you get some kind of aha

so with that better understanding i'm

hoping that you will be also able to

kind of solve novel problems as opposed

to

solving them in a more kind of okay step

one step two step three

you know understand what's going on and

how to fix their problems

so notice that i'm here in one

repository and

that is in the two degrees organization

so i call this a repository that is in

someone else's

repository i would like to you know use

the

approach fork and clone to propose some

changes to this repository uh

the first thing i would like to do is to

create a fork and github you know gives

me this button here

to create forks i already see that

there's three uh

people that have forked this so i'm

curious to see who they are actually i

seem to be one of those so to show this

um so you know that

just means i already clicked that bottom

so i you know when i clicked

here the fork my user account doesn't

appear there because i have already

forked but all i did is just to click

that button so you can you can do it too

so because i did click that button and

then i can go to my own

repo right so you can see that this is

under my user account and it looks

just the same

except that i have total control over

this repository i can do whatever i want

right

so at this point i am on this stage

i am here where i

you know i clicked that button and i

moved

the original repo i moved a copy of it

they called

fork into my user account i'm here so

now the next step i'm going to do is

this step

where i kind of use the address

of this remote repository on github

to clone it into my local computer so

how do i go

about that so you know from

my repo the one that is under my user

account

i go to the green button here

and i click uh here or copy basically

what i want to do is to copy this

address

there is two possible addresses that you

can copy

if you don't know which one you want you

probably want the one that starts with

https

uh but i use a different protocol it's

something that you may not need to worry

about the first day that you do this or

probably not even the tenth day or

anything

but i use a different protocol the thing

is that whatever it is here you can copy

and then you go to uh and because you

know we use

r i'm gonna go to our studio

and i have in my remember i copied that

address

on my clipboard so i could paste it for

example basically here right it's there

um but i'm gonna paste it in a very

specific place i'm gonna go to the

projects icon and click on new project

from the options here the one that you

want is the one that says version

control

then the one that says kit and then i'm

going to paste

the address there so this most of you

did it already

but what i want to get at is i want to

show you

the connections that i have now to prove

you

that there is a broken link there is one

link that i don't have that i don't have

a connection directly to the owner's

repo that is the whole point of doing

this little demon

here so as you can see now my local

repository

my local clone of my red bone github

looks just like my own repo on github

right so it all looks

good but what happens if i do

a git situation

report use this gives me this hand this

handy function that is called

git situation report seed prep

that tells me a lot about gate and

github and r studio it tells me

that in terms of my readiness for pull

requests

i have a remote repository

that you know has a nickname called

origin that isn't that important right

now

but the address of that thing is here in

mauro lepore

demo it has been forked

from 2 degrees investing demo

but notice that where it says upstream

which is the nickname

for the onus repo it says

no such remote

with the situation that i have again

here

i again let's go back to

here we are at this situation where

i have done this part of the triangle

but i'm missing this one here

so if i go down one slide i could change

my repository locally i could push

changes to my own repo and i could

submit pull requests

but if at any point the um

owner's report changes because someone

in the meantime adds new commits

i don't have a way from my local

computer

to pull those changes inside

my you know work my put requests in work

so that is one of the challenges i mean

it's not a big deal

there is of course a way to create that

connection

um but my point

is that you can create those that

connection in an automatic way

without you having to type any weird

command on for example the terminal

so the if you read the instructions of

for example

the book um happy git with r um

just just to name many what you will

find

is that uh what you need to do to set up

that

you know missing connection is to type

uh

to add a new remote uh into your

um local git repository so it could be

something like

this let me show you so what i would

need to do

here is i would need to go to the

owner's repository

get the address to the owner's

repository

and then go to our studio and do

something

like on the terminal and i'm not

expecting you to follow or anything

you would need to do something like git

remote

add up stream and then paste that

address that you got there

and by doing so

the new remotes that you would have in

your computer could be

two you would have one local repository

in your computer

pointing to two different places one

is your origin so the repository that

you have on your

own github account and the other one

points to

the owner's account this connection that

i have just created

okay is not difficult to type but you

need to know you need to know about the

terminal you need to know about remotes

you need to know about upstream i don't

know if it's a good idea i don't know if

everyone needs to know this

because there is automatic ways to do

that

and that is what i wanted to show you

next

the first thing i'm going to do so now

i'm going to rerun

the command git seed rep to see if

remember that here i have something that

says no such remote

remote set for upstream let's see if

that's changed now

okay notice how after i added

that new remote so i added that

connection that points you know to the

top

left that points to the owner's repo now

notice how i do have that connection it

says

on the origin so the nickname of my

for my um yeah fork on github is called

origin remember

that is pointing to my own github

account

and then with the nickname upstream i

have now a connection pointing to the

owner's icon

okay and it says you can push so this is

different to what you see

here before i created that connection

so making a little pause here the

takeaway from this

little demo is that yes you can do

things

manually but yes it is a bit of a pain

because it's very easy to forget to

create this kind of connection

and then you're kind of stuck in in not

being able

to pull changes that are happening on

the owner's repo

while you are working with a pull

request and sometimes while you work

with the pull request

the changes that are being added to the

main

to the owner's repo are relevant to what

you're working on because there are

conflicts because one thing builds on

the other

so you do want that connection in most

cases

except for very very very simple pull

requests

so let me do now something uh

to inspire you to read

how to set things up in a way that you

can

leverage the power of tools that do all

this

automatically for you so this is where i

want to get you have two

row two roots you either learn more

about git and you

read the ugly commands that you know

like commands like git remote ad

upstream

and an address or you learn something

more

kind of closer to the analysis um

brain that is something more intuitive

you know i'm happy doing the ugly git

commands and i use them all the time but

you know that's my thing that's what i

do for

for a living right so i read those kinds

of books you know i hang out with those

people on internet

but i don't think you should i mean if

you want you're welcome to do it but i

don't think it's

you know it's something that you should

know

so instead i recommend other more

automated

approaches so the first thing i'm going

to do is i'm going to close this project

and also i'm going to open my terminal

you don't need to kind of know about

this

but you know in my desktop

uh let's see what i have i know actually

i think i'm good to go

yeah i'm good to go um

so what i want to show you is now a

different

approach where i use

they use this package to create all

those connections

automatically for me so i don't have to

think much about it another approach so

you know if you're gonna use the use

this package

usually you need to do library use this

i don't generally need to do that

because i did something on my art

profile which is a special file that you

know where you can configure things

that are always available in every

session but usually you would do library

use this

let me do this a little bigger and now i

use a function that is called create

from github that takes

a repo specification with the format

owner repo so owner would be in this

case 2 degrees

investing and report would be deal

in my case because i have privileges to

push to

the to the degrees organization i need

to be specific about fork

equals true and to tell it

that i really want to create a fork

first

but before i do that what i'm going to

do is i'm going to go to my fork

because remember i already forked so i

want to kind of

to inspire you like truly i want to

demonstrate how

um use this can even create default for

me so i don't need to go

to github so i'm going to come here to

the settings

and i'm going to delete this repo from

here

i need to say

okay i'm gonna destroy my fork

of uh of the main repository

uh so now

i'm going to run this function right

create from github

with the specification owner repo and in

my case i specify

fork equals true if you don't have

privileges to push

to this repo to degrees demo then even

if you don't specific

specify for it equals true the theme

will happen

anyway you will just do it because there

is no other alternative right

so okay i run that command

and you can see that you know use this

is doing a bunch of things for me

i mean a lot more that i can remember

honestly so let's go back and try to

break down

down that so

i mean if you can automate something why

not right so there is already you know

these processes are so systematic and so

easy to to transform into a program that

does it for you that people have done it

and have done

done it well and in a way that every

time repeats

what you want so this command has

created uh

in my desktop a folder called demo that

you know

gets this is where i put the stuff it

has forked

from the two degrees investing demo then

i has cloned that thing

from my fork into the local

computer and then it has added that

upstream remote

you know that connection remember that

you know the whole point of

my little first demo was to kind of

demonstrate that there was a missing

connection

so that connection is no longer missing

here because use this did it for me

directly

and then it pulls changes from upstream

just in case

someone has added anything there so

automatically could bring

any change that happened kind of the

last minute on the owner's repo so now

your local repo is a reflection

of the last second of the history of of

that owner's repo

and then he's doing a bunch of other

things that maybe you know

this is uh like for example opening the

project you know

very convenient so let's go to that

project so you know this step where

the project got automatically opened by

our studio

what it resulted is in this other thing

so open this window automatically for me

and now if i type remember that command

so let's do library use this

so if i type remember that command git

underscore seat

situation report what would you expect

on my readiness to submit pull requests

well you would expect that this function

because it does all the magic for me

has not only a connection to my origin

but also a connection

to you know that link that i wanted to

create right to my upstream

so let's run that and here we are so the

situation report shows

that this repository

has a connection to my origin the one i

that i have even if i do it manually but

also has already that connection that

points to the onus ripple

all that happened magically for me so

let's go back to the slide

to kind of the brief so we are in this

happy situation

right where the function create from

github

created this connection directly for me

and i can now do the triangle the

triangle is as follows you

always pull changes from your owner's

repo

you always push them to your own repo

and then you submit a pull request to

upstream

right

and the last uh yeah and that's the the

last you know part of this kind of

motivational

um first meet up so hopefully the next

time we are going to

implement this um

i could hope that this has will kind of

have motivated for

people to go to let me scroll up i'm

sorry for um

for kind of getting you dizzy i hope to

have motivated you to go to this link

here that say set up use this

so with this you if you do what says

here

i'm hoping that you will have your local

art studio ready to

run the functions of use this and ready

to make your life easy

and also ready to work

during the workshop with your own

rstudio as opposed to our studio cloud

the reason why sometimes we use our

studio cloud is because you know and i'm

sure that i can set

things up in a way that you know will

work for you because i don't know you

know how you have your thing set up

but if you do follow these instructions

it should work

and if it doesn't work reach out just

you know

slap me and then we can set up a help

desk

because i'm truly interested in you

having the setup correct that this is

something that is a pain that you go

through

once per computer and you're done and

then life is so

much better

if you are if you are

someone like jackson you also may like

uh the gh terminal

application it is amazing and i use it a

lot

because he taught it stewie and i love

it so you can also do something like

gh repo fork and 2 degrees 2 degrees

investing demo

and that thing will do all the magic

that that i showed you

and it is asking me if i want to clone

the fork

it is also noticing that the fog already

exists i say yes

it is cloning it locally it is doing

everything

that i show you this is not something

for you to reproduce this is just to

motivate you

life is not as painful as you think

you know i know there is a lot of

friction i know there is a lot of pain

but

once you set things up it takes no

time like truly this is just to motivate

you hopefully by next time you will have

tried things out you will have faced

some problems you have

it will have consulted with me or

jackson on anyone else

and we will have helped you kind of get

to this stage where things

just work okay

i can't hear you claire um

are we good to go okay i'm very sorry

for not

making this an interactive tutorial as

we usually do

but i felt that at this point we needed

to go through

every step slowly so i encourage you to

leave your questions and comments on the

google doc and i now need to finish

because i'm sorry i'm going

running late okay thank you very much

everyone here

good thank you bye everyone
