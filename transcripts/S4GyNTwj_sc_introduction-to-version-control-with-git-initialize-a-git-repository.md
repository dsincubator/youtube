---
type: Video Transcript
title: "Introduction to version control with Git: Initialize a Git repository"
description: "Today the data science equator is the first actually of a series of uh meet ups about git and git has been a tool that you know we..."
resource: "https://www.youtube.com/watch?v=S4GyNTwj_sc"
tags: ["ds-incubator", "git", "terminal", "snapshot-testing", "cloud"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=S4GyNTwj_sc"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2020-09-15T00:00:00Z"
    usage_count: 73
usage_window: { from: "2020-09-15T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

today the data science equator is the

first actually of a series

of uh meet ups about git and git has

been a tool that you know we have been

using a lot

uh some of us already uh you know

for years and are quite fluent and

others not so much uh and i think that

you know it is it's very well explained

in uh i don't know if you see my

um my screen uh it's very well explained

in this

uh little text here which you will not

probably be able to read but i will for

you

so i think the motivation is the

following like most learners

uh already use kit and have been using

it for years but a lot of us

don't don't really grasp what git is and

the mental model we don't have the

mental model of how it works

and that kind of allows us to work with

git up to a level but not beyond

so i would like you through this series

of meetups to really unleash

uh you know the power of git for you and

the idea is to you know

go slow and and give opportunity for

everyone to

expose those kind of broken mental

models that we might have

and once we understand how it works you

know you will realize that it becomes

uh i wouldn't say intuitive because this

kid is not intuitive

but at least less less horrible that it

can be sometimes

because it's truly powerful and and

although there are many

systems out there it is by you know by

far the most used in the world

and so i think you know you can become

like really really good uh

a really good worker with it uh so the

idea

because you know it's gonna be a series

and i don't want to kind of

do what i did before which is to kind of

um

assume things you know i want to cover

everything more or less with

structure what i'm going to be doing is

to follow a lesson that has been already

proved to work from code refinery

website

and the lesson is called uh introduction

to version control with git and and

actually it's it's pretty cool

it has some features that you know i've

learned things myself by you know

reviewing

the lesson um so it's not basic at all

it starts slow and you might think oh

you know this i already know i'm fine

you know you're happy to kind of

uh walk away and come back in another

meeting but

uh but i think especially the first one

is good because you know it gives us

some

understanding of you know the the the

basics of git

and and what's the mental model that we

need to understand what's coming

but also by following a lesson i'm

hoping that people

in the room or you know people i

couldn't join today could also be able

to

to to teach

this so you know today i'm gonna kick

off uh but also basically introduce the

lesson and the

the structure that we have so that if

any of you are interested in some

particular aspect of the series of

lessons

may you say hey look i volunteered to

teach this one because it's something i

really want to learn and you know i know

i know that you know by by teaching we

learn

very well a concept so maybe you know

this motivates

you to explore the the curriculum that

we have

and see if any of the lessons uh or or

any section in the lesson is something

that you would like to kind of present

yourself

as a way to kind of force yourself to

learn it better or

the opposite maybe something that you

already know very well and you feel

comfortable

and it's not gonna take up a lot of your

space so my approach has been to prepare

a little and just to be guided by the

lesson so i'm gonna be walking through

the lesson

with you and by doing so i'm gonna move

slow but

which means that uh for those who who

really need some time to practice

themselves you know

try things out that should give them

time to kind of keep

uh on track and you know those who maybe

a little faster because i know the

concepts they they can also go

to sections in the lessons that are for

advanced users

so this is kind of the landing page the

the issue

where i introduce the idea and i

encourage

um whoever you know is interested in

this series to go to the what should be

covered

uh there you will find a link to the to

the lesson

um so i'm gonna click there so it looks

like this

the lesson explains a little bit of you

know what's the goal of the whole lesson

and shows

many many many um sub lessons

but in particular i've been reviewing

the the notes for

for trainers and i think that the ones i

highlight here are the most important

ones also you know knowing the crowd

that we have i know that some people

already come with some knowledge

so i encourage you to uh you know today

hopefully we'll cover your motivation

and maybe basics

uh and then i encourage you to go

through the other ones and see if any of

that is something attracted to you and

you would like to teach it and if no one

does you know i will but uh

but i think it's a good idea to engage

someone else in teaching those lessons

and this is going to be the the basic uh

structure but then

i also know of many other resources that

are amazing like really good like just

to impress you let me click on this one

here for example

the advanced stuff explained with

animations

so for example when it when it get we

get to the point where we want to talk

about branching

uh you know this resource for example is

amazing because it's a

it's a visual guide that shows you know

how a git command

um changes the history of your

repository in a very very visual and

very intuitive way so maybe if you

choose to teach

this lesson maybe you know you want to

kind of jump outside a little bit of the

curriculum and show

you know these slides and explain you

know the theory behind

what we are teaching through these

resources so basically i'm inviting you

to use any resource

but just to you know get you started i

think that a very good starting point is

is the lesson that i mentioned before so

i'm going to skim through uh and you

know say

you know this is you know how you fix

merch conflicts and

you know it explains you know what

commands would take you there what you

need to clean and how you fix that stuff

anyway just just to impress you a little

bit

so um let's go now to the motivation

i think i won't spend a lot of time

there because motivation

uh is something that i believe most of

us here

um already have for learning it

and just peer pressure like a lot of us

you know need git

for just getting things done but uh

you know the lesson has a section uh

that

covers motivation but i'm gonna skip it

because i dislike it i prefer instead

the uh instructor guide so if you will

see that the lesson has this very handy

menu at the top so you go to instructor

guide and

that will help you if you choose to

teach any of these sections

i encourage you to go to instructor guy

because he will

it will help you use the material

from the perspective of the trainer and

and basically motivation is what i said

before

you know version control is is is

fundamental in the kind of work that we

do

and maybe one day we can get away

without it maybe there is a better

system but for now it's you know

we just need it there is a lot of tools

on top of git like you know i've been

you know encouraging people to use say

they use this

framework to hide all the details of kit

uh but now

you know that's done and you know that

you can you can get a lot of things done

with you know wrappers around it or with

git clients

or even from our studio but now i'm

intentionally going to expose the guts

of kit and we're going to be working a

lot on the terminal

also to get you familiarized with it

because sometimes you know

we land in the terminal and there is no

other way around it

and i would like you to be familiar not

be scared of the terminal and and

see but you know hopefully to unleash

the power but at least to not be scared

of it and to know how to get out of

of some you know messy situations from

the terminal

um without version control

the code can become a disaster very

quickly

uh mistakes do happen but you know if we

have the backup of kit

we are always safe imagine the the

analogy of a climber so we can climb a

rock but we are hooked to the rock

if we fall we're not gonna die if we

don't hook ourselves

a big a bad fall can be a disaster right

so that's the safety

it offers another thing is that you know

git in particular is very good for this

idea of branches that we're going to

discuss

later but basically what it allows you

is to work on many things at the same

time

and that's just reality you know

although you know we like to focus

on one thing at the time it is it is a

fact of life that

a lot of other things will be happening

in parallel while we do something

so the branching model of git is amazing

in allowing us to work on many projects

at the same time or even the same

project in different versions of it

uh also that unleashes collaboration

right so that's

super cool and reproducibility you know

we can go back to

previous versions of our projects we can

allow people to

reproduce what we have we have done and

here i think that

is the key of why i think this is

important for us uh

let me see in most cases people are not

do not feel comfortable yet with git

even when they use it

they lack a good mental model of how it

operates

and we are afraid of making mistakes

raise your hand if you if you feel

identified with

with that phrase that you know we don't

fully understand how it works and we are

a little afraid

to kind of things up

yeah yeah that's true um and then

there's other people that have never

used kid and are curious you know you

hear

it a lot and maybe this is a great

opportunity to kind of start from

scratch

making solid steps as opposed to

developing bad habits in a way like for

example pull commit messages and things

like that

um so yeah this lesson is all about that

about how to get things done with git

so enough for motivation let's move on

to the basics

and here is where i'm gonna be kind of

showing

um some of the theory and and

some code and i'm gonna be moving slow

and when we reach the end of the meeting

we're gonna stop

and continue next time i just you know

believe

that it is a point where um we just need

to cover this you know we just need to

kind of go slowly and make sure that we

all get it and if it takes you know

five minutes or ten minutes it's gonna

take that uh but then i will also be

open to feedback so you know

if from most of you i hear that it's not

being useful or too slow whatever then

we can change for to something else but

let's give it a go and see

if this if this works for them

before i move on to this do we have

anything like any comment or any

question

about you know the lesson in general the

plan

to look ahead a few meetups and the

motivation part that we have covered

so

perfect yes um

as long as you have access to a terminal

that is comfortable for you

that that cuts it and

generally people that work a lot with

git um

you know they have their favorite and

super fine-tuned

terminal so once you work a lot with the

terminal you you start making

it like really cool but i'm going to

avoid that to this to not distract

people but i'm just going to show you

what for example my terminal looks like

i'm going to expand it here and let's do

that i if i want to go to

my git repo say the data repo i just do

j data and that means jump to something

that matches the name data and that

takes me to a repository that

is that and i have cool shortcuts

something like you know i want to see

the status of this project i do

gss which means git status and i can see

the status of this project

it has colors it has the branch so

terminals can be

extremely powerful and can give you a

lot of comfort while you work

but for this workshop i'm going to be

using something more vanilla i'm going

to be using the bash terminal which is

this so if i want to do the same i have

to type

git status and that will give me the

same thing

so i will be demonstrating

a very vanilla terminal to not confuse

you

so that you know what comes from from

the framework i'm trying to teach

and as opposed to being distracted by

background differences between you know

my terminal and your terminal

but having said that exactly as you said

you know if you're in windows

you might be wanted you will be using

very likely the bash

terminal so you will need to type bash

in your

you know to execute the bash program and

that will give you

a terminal that feels like the one that

i have here

if you're on mac the terminal program is

excellent

and it will give you the same experience

if you're in linux you know the terminal

also counts by default same like with

mac

and you can fine tune it as i do to have

you know like a really cool

experience with lots of shortcuts and

things like that

and i am very tempted to use the

terminal from our studio

for two reasons one is because many of

you may not have

already a terminal you know like

that you already prefer or like or use

or are familiar with

and our studio has a tab that is called

terminal

so if you have installed git and you

have our studio you will have a terminal

and if you don't have anything of that i

can still share with you

a url like this one here right that i

can

paste on the google doc for mean

actually like really any studio cloud

project that you open

actually this is an entitled project

just for demonstration so you go to our

studio.cloud

you open any new project and you will

see that there is a tab that's called

terminal and you can use that one

right so i'm gonna be very likely

demonstrating things

here just to show you that you know

some an environment that you could

reproduce from the web browser basically

so you don't need to install anything

and then it's up to you when you

feel mature enough to start

investigating for the platform that you

use

mac windows linux or whatever that is

which

is you know the the tool that will help

you

work most efficiently but you know we we

thought we can't go

lower more lower level than the terminal

so determine that's why you know i think

it's important at this stage you know

now that we all know

some frameworks that wrap git you know

you know use these you know

i know they give a desktop application

you may use git kraken

but at this stage you know we already

already know all that let's go now

actually open the you know the the front

of the car and let's actually look at

the engine and let's just

learn how to work with this so

we are going to be working uh mostly

from the terminal right i think that's

all from the terminal in on purpose it

might feel a little uncomfortable in the

beginning but later hopefully

uh you will be kind of familiar and also

this will expose some of the problems

that we face because

when you are in your comfortable

environment okay you know what to expect

you know you know for example what

editor you have configured in your

computer but then you land in a project

like this one

and you want to make any modification to

a file on the terminal and you land in

vim

which is a horrible editor for people

who is not familiar with it

so i want to teach you how to get out of

being how to save files in theme

not because i'm interested in teaching

your vm but also but only because

at some point while working you know you

will end up

in that situation and it's it's good for

you to know what that is and how you get

out of trouble basically so basically we

are you know

we jump fast to motivate people and

empower people to use

really cool tools uh with little

understanding of the

basic models but now is the point where

we have to go back and start filling

those gaps i feel

um so yeah uh sorry the answer was was

uh

was long because you know your question

was a very good one um

so if you have already a terminal that

you like use it

if you don't i encourage you to go to

rstudio.cloud and just click on the tab

terminal and with that we should be able

to do everything that we need actually

i'm going to pop up

that and put it here on the side

so let's go to here

um where were we on the basics okay cool

so what is a git repository so the

the um way we are going to be using

um this lesson is with a repository we

are going to

create so i encourage you to to now get

access to some terminal where you can

start typing commands

if you don't have one remember our

studio cloud

so a git repository is just a folder

called git and it saves snapshots of the

history of your project

there is a bunch of analogies so let me

expand this there's a bunch of analogies

uh and the one that is shown here is one

that i like

so basically you know you um

when you are about to make this very

special save that it has you know this

that is called a commit commit is this

the the unit

of change that is fundamental to to get

right so um so that commit could be

imagined uh using the analogy of taking

a picture so that commit is actually a

picture that you took a snapshot

but before you take the snapshot you

have to frame you have to decide what

is going to be part of that snapshot

right so there is obviously a step

before it's not like just you know get

your camera and press the button

anywhere no

you take the camera and you point and

you decide what to include

in your you know in the stage of that

photo

and what's going to exclude right so the

step before

take a commit is then the staging and

and there are

commands for each of those stages so

they give command hit add

basically what you're saying is you're

framing and saying well i'm deciding

i'm going to put you know person a

person b and exclude person c

okay that's going to be where you know

the snap i'm preparing the snapshot once

you know i do git add i say yeah this is

what i want then you do git commit

and then you know you take the picture

and what you what it happens is when you

take that picture that snapshot

the commit containing that that snapshot

is get you know gets stored

in your photo album basically and that

photo album is the git repository that

folder i told you is called dot git

and we're gonna have a look at that

folder in a moment

so this kind of represents what's the

workflow so basically a file

changes your stage you know that file so

that you know you put that file you know

in the in the view of the camera and

when you're ready

you take the picture and that picture

gets stored in your git repository

then you edit that file this is like now

going now to the other row

you edit that file there is a new change

so you again you have to say what goes

you know to the to the next snapshot by

framing the game and then boom you take

a second commit

and that you store it in in your git

repository and then as any photo album

you can go back in time you know you can

travel through the snapshots that you

saved and

and look at the at the history right

uh but git goes you know here is where

the

analogy breaks because kit is even more

powerful it not only allows you to

review the history but also allows you

to change the history

and that is something that has some

risks because you know

if you saw the movie back to the future

you know what problems can come

with uh changing the past right that

then the future kind of all gets

messed up too so we are going to discuss

you know when it is safe to change the

history and when it is not and the long

story made sure

is that you know when you are already

sharing your git

history with someone else and now

it is not the time to change the the

past you know

you can change the past as long as only

you know what that past looked like

because you are working

locally in your computer but then as

well as some as

as soon as you push that and share with

someone else then you know

it's not a good idea to change the

history because you will change it for

everyone else

okay so um first step

in any so that was all the theory um

so do we have any comment or question

about that uh momentum

the very basic picture of you know what

uh what kit does this idea of framing

snapshot and an album

no yeah okay so

um the very first thing that we do uh

with a git

um you know when we have a repo is to

um configure it so

if you haven't done so you should um

check who is the user and git

email that git knows about that's you do

with kids

uh sorry let me make this big bigger one

downside of

our studio is that it uses a lot of

space here to the left so i can say

git config

minus minus list that will give me a

very long list

if there is things configured of

configurations

but i would also say that i can be more

specific and say instead of listing all

the configurations i can be more

specific and ask it

what are the specific um configurations

that i would like to look at

so you can type now git config

user dot name and if there is nothing

no output then what you do you can press

the arrow the up arrow to recover the

last command

and now you decide which is the username

that you want to be associated with so i

can say something like mauro

right with uh you know you leave a space

after user.name and you know quotation

marks

and then you press enter uh it says not

in a git repository so great so what's

what's going on here

i don't have i'm asking it for

information

uh but i'm not in a git repo so great

let's

actually create a git repo because i

haven't done that yet

so i'm going to be following the

instructions here in the lesson

uh we are going to be working with a

repo that we create

it's going to be called receipt recipe

we are going to make a recipe for

guacamole and one way in which you can

create

a folder from the terminal is with a

command

m k d which stands for make directory

so if i'm in our studio cloud i would be

kind of i

will have landed on on a place that is

called you know cloud projects

so this is what uh you know the

structure of my folder looks like

so i'm gonna make this even a little

smaller

so i can do from here i can do mk

fear make directory recipe

and that will create a folder here

called recipe

and there you see it right so this is

the very first

command that i typed from the terminal

so now what i want to do is to jump

inside recipe i want to do something

equivalent to

this to clicking into recipe and get in

there and see what there is which is

nothing because it's empty

so the way i move there is with the

command cd for change

directory cd change directory see how

i'm here in cloud projects but when i do

cd recipe i now get into

cloud projects recipe right so i'm here

now

if i want to see what are the contents

of that folder i do ls

and it should throw it should output

nothing because it is empty right

but what look what happens when i do

this command

git init so once i do git init and let

me see

first uh i want to make sure that i'm

showing

the hidden files so i'm in our studio

cloud and clicking on the option that

says show hidden files

because the git folder the dot git

folder

is hidden the dot means that it's going

to be

hidden by default so let's do now let me

clear this with ctrl

l i am going to type that

git init

and because i'm already inside recipe it

will know

that the git repository that i want to

initialize in it comes from initialize

is the one where i'm already in so i'm

already in a folder called recipe

and i did get in it and it says

initialized

empty git repository inside you know

this folder called

you know recipe i added the folder door

kit

so i still don't see it here on the

right and i suspect that it's probably

because i i haven't refreshed

so there you go i clicked on the on the

arrow here and i can see a folder

that is called dot git so that is now a

git repository

right any question here

as any other folder you get repository

you can explore it so you could click in

it

and and you will see a lot of if you

know you will see the basic structure of

it repository i recommend you do not

mess up with it because you know that

you would you know could probably get

your repo corrupt

and even if you wanted to remove the the

git tracking

of this project you just click this

folder and remove it

it is it is easy and also powerful right

so if you have a git project that you

have been tracking and you haven't

backed it up online or anything you know

just by removing that folder

you remove the whole history of the

project so be careful

so we are getting close to the end so

i'm going to

let's see uh only complete the step that

i was about to do before and i couldn't

which is to check

if git already knows who i am so i'm

going to do

git config

user.name to see if

let me expand this to see if git knows

who i am

so when i type i'm doing it again git

config username

there is no output meaning that it is

not configured so i'm going to make now

space

and say mauro

and now if i do again git config

username

so without a value

it is a question right and with the

value you are setting so this is a bit

confusing because

the command git config username you can

use it to set the username

or to ask what is the username so when i

say git config username i'm asking what

is the username

if there is one configured then i get an

answer

which in this case is my referee why

because i just said it in a step before

so i first did i first asked the

question i got no output

meaning that it wasn't set i then set

that parameter to module and now when i

ask again

i do get the output so it's configured

to modulate another very useful

um configuration that you need is email

so

user.email so i encourage you to follow

along if you haven't done so

and you your git should know your

username and your email those two pieces

of information are

fundamental to associate in every change

that you do to this commit

to you because git knows not only when

the changes were made but also by whom

and what's the email that we will later

use for

for github so in my case i do space

so let's let's repeat so if i don't give

any

value to this argument it will give it's

an answer

a question sorry it is a question so if

i ask the question what is the user

email configure

and if there is no answer that is

because it is not configured at all

so now i'm pressing the up arrow to

recover the last command

so i'm going to actually set it just by

saying in this case

gmail.com and run

i get no output and now i ask the

question again what is the user email

and there i have the answer in our

library so now i can do something like

git config

list remember with list i ask for all

the configurations that

git knows about and i get a bunch of

things

including username and email

and there is a few other options that um

at least at this stage is not very

important to discuss and actually i

don't even know

what they are okay so time to stop um

we have started with uh

with a lesson uh for keep basics

uh we use the terminal for you know in

this series for the first time we

created a directory with

a makedin we

change directory into that repository

and we initialize a git repository with

git in it

so getting it is one of the basic

commands

and we also configured the repository so

it knows

who we are so next session we are going

to be starting from

from here we are going to be exploring

the status and we are going to be

actually making changes in our git

repository

so that's the end of this video but

before saying bye i would like to see if

there is any questions or comments

and also i encourage you to send me

feedback maybe for through slack

about you know what you think of this

series coming along

so any questions or comment before we go

okay cool uh just a reflection quick

reflection

for now does it feel like too slow just

right or too fast

just right okay okay then

uh then we'll keep more or less at this

space okay thank you

very much again i encourage you to send

feedback uh

on slack and i'm going to incorporate

that in the next series i anticipate

this to be a long series so you know we

have to make it enjoyable

see you next time thank you

ciao
