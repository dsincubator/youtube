---
type: Video Transcript
title: "git status, add, rm --cached, commit, log"
description: "Time it was a little uncomfortable to work on the terminal from our studio cloud space in here and i started typing and like status and then it..."
resource: "https://www.youtube.com/watch?v=AxpkFkfTF8o"
tags: ["ds-incubator", "git", "terminal", "snapshot-testing"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=AxpkFkfTF8o"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2020-09-22T00:00:00Z"
    usage_count: 247
usage_window: { from: "2020-09-22T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

today the data science equator

continues a series about working with

kit from the terminal

last time we created a new git

repository with the commands you see

here on screen

and today we're going to be working with

git status

so let's go to another studio um

session here and um and before we work

and remember that last time it was a

little uncomfortable to work

on the terminal from our studio cloud

because the prompt

uh was so long so i kind of ran out of

space in here and i started typing

commands

and like status and then it would kind

of

wrap under it so it was uncomfortable so

how can we change that

well the terminal is very flexible if

you are in a batch terminal you can use

ps1 as a variable that allows you to

define

whatever you want this prompt to be

so it could be i don't know count and

greater

uh done if you want it um

and and then the prompt will change to

that but uh that's uh

okay but not that useful instead we

could use some of the very special um

commands like for example backlash

backslash

grade capital w and that will give you

the name of the base directory where

you're standing

at which is basically this little tilde

here so that's nice we're gonna

uh do use that plus the dollar sign plus

space which is the uh okay a way to work

comfortably so let's record the last

command with the

up arrow so we are going to use

backslash w

plus this uh you know dollar sign symbol

and space so let's see how that looks

like that's what i want

right so now uh you know when we are in

home

uh i believe here we have no recipe

directory

so let's create it now so before we used

it

um you know in the last session we use

uh make deer

which is a terminal um command to create

the

the director recipe then we changed into

it and then we initialized the

repository today we want to do it a

little differently so we can do

directly hit lowercase

key in it and recipe

so if we get in it can take the name

of the directory to uh directly

initialize a repository there

so now we need to change into it so the

cd

and as you can see now we are in that

directory so where we are at is

right here so let me also kind of

navigate to

here let's also set this as working

directory

uh so we are on the same page in r and

the terminal

so uh this looks empty but it's not

fully empty if you look for

hidden files you will see that there is

a dot git folder which contains all the

information that it uses to keep

track of what it does but let's go back

to the

recipe directory so usually you don't

interact with those

files directly you just interact with

them through the

git interface just by typing commands

okay so

what we want to do now is to ask for

what's the status of this git repository

how do you do that

with it so git status gives you

information about any file that might

be untracked so something that you

haven't added specifically

to the git repository or files that have

been changed or have they have been

added or

uh you know a bunch of information that

is useful to you but it's

usually divided in two sections or it is

divided into sections that i'm gonna

demonstrate in a moment

so to reflect on what we read here

uh it is telling us the command is

telling us that we are on a

branch that is a concept that we're

gonna discuss later that is called

master which is the default

also it shows a little message which is

a message that was created by

kit when we initialized this repository

and it's also telling us that there is

nothing to commit

so coming is this idea of taking a

snapshot of the story

of the history of your project um and

there is nothing to be committed

really um and it is

giving us some hints about what we might

want to do it is telling us that we can

create or copy files

and then use git add to keep track of

them so let's do

that so for that we're gonna first

expand

this this way move here a little bit

i want to kind of be able to show you

what i'm doing on the terminal a little

bit of the files

and also a little bit of the you know

instructions that i'm following

so git status gave us uh something

similar to this there's nothing to

commit

but we are going to now create a file

we're going to add a new file so i'm

going to copy this text here

copy and i'm going to create a new file

with in this case i'm coming here

to the interface that our studio

provides i'm going to choose a text

file and i'm going to paste the text

that i copied from

the right i'm going to save this inside

the recipe f

folder or key directory now

with the name instructions.txt

i hit enter and the final appears here

and i can close it really because

it's it's already done and now i'm going

to add a second file

copy um doing the same thing

text file i'm going to paste i'm going

to click save

and i'm going to call it

ingredients txt in this case scroll down

save two files have been added so

that's that need does git know about

that sure it does let's do

it status and now you can see in red

these files are appearing in the area

where it says untracked files so these

files appear in red because

they are still in a kind of dangerous

mode if you do nothing

about them and they will do nothing so

get

one track files that you don't

explicitly tell it

to track so imagine you're climbing a

wall

now you're climbing with no row

basically

so what you want to do is to add these

files first

to the staging area remember using the

analogy of the

taking a picture that we saw last time

first you know frame

into these files tell you this is uh you

know

going to be part of the next snapshot

and then you add the comment

and how you do that well it's not all

that difficult all we need to do here is

to read

uh what information git is prompting us

here so let me expand this a little bit

like that

i'm just trying to drag this well let's

leave it at that

so if we want to include them

these files to the next commit we just

use git add and then the name of the

files

file for files dot dot so let's do that

for example we can do

it add and then ingredients

i'm not going to type the whole thing

i'm going to just dab a key a few key

strokes and then tap

and that you know will be how to

complete it and and i could now run

enter but i could also add more files

because there's dot dot right so i could

do now

instructions.txt what i did is i pressed

e n s t and then tab

and it was autocompleted and now i run

enter

and hit status again let's see what

happens okay what we now have is a

different thing

so we now have you know color green and

because these files are

already in the frame of the camera

are ready to be committed if we wanted

to remove any of these files from the

from the staging area from the frame of

the camera to exclude it from the next

commit we can use the commands that it

suggests we can use

for example remove

minus minus cachet and the name

ingredients.txt to exclude it from the

staging area so what's the git status

now

well one file is on the staging area and

the other file

is not right it's untracked so if we add

a new commit the only

file that could be committed is this one

here but no we want to add

all the files so let's do that again

kids if you want to move this file from

here to here

we just follow the instructions that we

see here so git i

and the name of the file ingredient.txt

right and that will add it another way

would be to say hey

everything in this working tree with the

symbol dot

but if you do that always do later a git

status because there is always the risk

that you add for example private

information

that you shouldn't add and if you do

that by accident if you commit that by

accident that's totally fine

just notify someone that can

undo that change and rewrite the git

history

or do it yourself as you will learn in

later sessions

there was a note that alex they did when

we were working live

uh but for three i forgot to press

record for that video

so i'm i'm recording this off uh not

live

but thanks alex that was a great comment

so it is very common unfortunately

commit things that um

that shouldn't be committed uh you know

the way to avoid that

is just to check the status um a lot to

be

mindful about you know what you add and

what you don't

but you know if you make a mistake we

all do just uh you know

either you know know how to fix that or

quickly tell everyone else or someone

that can help you

and do that that change because even if

you delete the file the file will stay

in the history so the

the file may not may have disappeared

from

from the latest commit that you see on

your working

directory but um it is in the history so

someone malicious could go back

in the history of git and record private

information for example passwords and

things like that

so be careful with it okay so we are

ready to

create our first commit but before i do

that i wanted to show you

uh how you go about learning it um

through git so one way is as we have

been doing now is just by following the

prompts and doing what

we are prompted to do but another way is

also to

explore the health files so for example

we use the command git status let's

recover that with the up arrow git

status

and now if we do minus minus help that's

one way to do it

we get to the help file and we exit the

help file following instructions at the

bottom with the queue

another way would be to do gibbs help

which is a command itself and then the

name of the command that you want help

for

right so that was a little fast sorry up

arrow git help

status will send you also to the help

file

how you read that well there is a little

bit of a description but then a synopsis

which reads as follows

everything here that is um just text is

uh compulsory so it status to to run the

command git status of course you have to

type git status

but then you may not run anything else

and that will work

as we as we just did before we were

using just git status and something

useful we got but also you have options

if you want if they are not compulsory

but you could add a bunch of options

what options could you add

well for example you can add these

options here all of these

are options for example the minus s or

minus one is short

so s is the short for sure it gives you

the output in the short format let's see

what that looks like

okay let's exit this with a queue and

now i arrow two

three times so i get to the i'm

navigating back to the history of

commands

not the gate history but the history of

commands in the terminal

and i recovered the git status command

and now i do space minus

s to get the status but in short form

so this is a very succinct way

right of getting something similar to

what i got

here right so that's why minus s stands

for sure

let's clear what we see here with the

command clear from

the terminal or also with ctrl l that's

another alternative so

once again git status without the flag

gives you

this long form with the flag gives you

this form

so s is the short for short

uh both return exactly the same thing so

that's

just about you know how you would go

about interpreting um

git uh help files so let's go back

actually to that

um to that help file

because there is another option that you

can use here

so you can separate your first options

with this

optional also minus minus um

separator and then the specific path

that you want

to to explore the status for what does

that mean okay so it means that you know

our git status kit status

so far has been for the entire kit

repository but what if we ask

specifically for the file

ingredients okay then we specify

ingredients and we get the

status just for that and notice this

minus minus flags

that separates a specific path is

something

very very very common in git and you

will see that in many other commands

that include that

so and a lot of the really cool power

that has comes from knowing these flags

and how to do

things that you can do either at the

general level on the repository or at

specific level into a complete

you know folder in your git directory or

a file

uh specific file so

that was it for git status and now we're

ready to create our first commit

git commit

has of course its health file um it's a

very long help file because there is a

lot

that you can do with git commit but um

[Music]

in short the most important command is

the minus m because

it is uh what allows you to after it

write a little message okay such

goes here so that message

just to stick with listen we're gonna

copy it from here

we want to add this message i'm going to

copy here copy

and i'm going to paste it here

in the terminal in a batch terminal

sometimes

you know a thing that called the c ctrl

v or command

v command one paste stuff instead you

need to press

shift inst so i mention it because it is

a common struggle and a simple solution

so there you go

so git commit minus m with a message

gives you uh create a commit like the

one that you're gonna see

soon but an alternative uh and one that

might get you in a little bit of

a trouble is to not use any other flag

so

do just keep coming in that case

git will open um

a text editor for you to force you to

write a commit message because the

commit message

is compulsory so if you don't add it

with the flag minus m here

then you will be prompted to something

like this

uh and which specific text editor if

it's notepad or vm

or nano whatever

that depends on how it is configuring

your computer

but this i'm showing you here

i'm showing you on purpose because it is

quite scary

uh the default uh text editor for many

many many

uh systems is v or vim

which is not intuitive at all so when

you

appear there you can start typing your

message

you can paste for example it takes that

copy from before adding

ingredients uh and instructions and

notice how when i pasted that i

i see here if the text says insert

that is because veeam has two modes the

insert mode

and then what's called the normal mode

which is quite abnormal actually

that um allows you to use the keyboard

to instead of um writing text to

actually call specific commands of this

text editor

so i'm showing you this precisely

because it's

it's tough uh so if you are in this

situation

uh the you know how do you kind of exit

this

okay first you need to go to the normal

command by pressing escape so you press

escape

that insert thing disappears and then

you have to press shift and column will

start entering here some commands

that allow you to interact with a file

system for example

i do queue

and bank will exit this

without doing anything we'll forget

about this file

this text file has been opened but if

you want to save it and actually create

the commit

then you could do q and w

so w will save and q would quit

and q could quit and bang will quit

without

saving right so q bang exit without

doing anything

q w exit saving

when you save this file the commit will

be finished so i don't want to do that i

want to

exit without saving and git status

should show me the same thing that i

showed before

and now i want to create a keep commit

with the message

myself here i'm going to paste the text

that i call it from there

and this is the quick message that so i

just created the commit

what i'm going to do now is to clear the

console with ctrl l

and ask for what's called the log so the

log is going back to that album

that contains all the pictures that you

took um in the history of your life

and and looking at those uh pictures so

tweet love

will then give you the latest of the

pictures that you took the last

no sorry we'll give you all the album in

this case we have only one comment

and that's why uh it's uh what is

showing us

here but if there were more commits it

should show more

so what we see is a unique identifier

for this commit

it is aimed to be a universally unique

number it's very hard for the two

commits to be exactly the same

it includes information about you know

who wrote it what's the

email and when and also a message that

is the one that you gave

to um the flag minus m

right so the commit message the

information of the date the author and

the sha

all of those are information that can be

mined into the

uh can be mine in the git repo and are

extremely useful

for exploring what uh what happened in

the past of this project

so it is super important to to write

meaningful commit messages and we're

gonna discuss that

later but the reason is not because we

are just you know

stubborn it is because uh you know the

the information that is associated to

each commit the metadata of each commit

is extremely useful for you for your

future self and also for your colleagues

to understand what is where and how to

you know basically record all the

information and to do

things like that okay i think we're

approaching the

end of what we covered today in the ds

incubator

uh uh okay one a couple of flags for git

log

so git log can get a little long when

you have many

uh commit messages and some of this

information like this very long shot

is it's not all that exciting

so you can do this log minus minus one

line

to do something similar to what you did

before with git status minus s so

basically you'll get a shorter version

of this vlog

okay you know you don't have all the

information but you know the cool stuff

is there

you have the shot to identify this

specific uh commit

this unique identifier of the coming and

you have um at least you know the

information

about who sorry about what what happened

in this community the message that you

wrote

another one that is useful is minus

runner stat there is a lot of useful

flags really in log but one this couple

that are

commonly used and are included here in

the lesson so you can combine flags

you're not limited to just one you can

do the git log on one line

and also request for the stat the stat

will give you like statistics of um you

know the files that changed

in this case you know the changes were

all additions that's why you see plus

plus plus

because five lines were added one two

three four five

and to the five instructions of txt and

in this case three lines were added

to the five ingredients.txt two five

changed

two files changed eight insertions in

total

all additions right so that's how you

interpret this gitlab so let's clear

this

and run it again just to uh have a clear

view

of kind of where is our stopping point

so

yeah we're gonna leave it here because

that is what we covered in the live

part of the ds equator and next time

we're gonna uh discuss ki

diff and from then onward so that's it

for today thank you and see you next

time
