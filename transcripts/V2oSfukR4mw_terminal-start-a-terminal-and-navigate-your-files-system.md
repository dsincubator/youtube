---
type: Video Transcript
title: "terminal: Start a terminal and navigate your files system"
description: "welcome to the ds incubator today we are  talking about what we are in the series  about the terminal and we are talking  today about starting the terminal and "
resource: "https://www.youtube.com/watch?v=V2oSfukR4mw"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=V2oSfukR4mw"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

welcome to the ds incubator today we are

talking about what we are in the series

about the terminal and we are talking

today about starting the terminal and

the basic commands to navigate your file

system

this is a recording after the actual

meetup because the video for the live

session for some reason finished earlier

someone told me that so we'll need to

repost the link to this longer full

video

so the

the resources that i used to prepare

part one uh are two one is the appendix

a of having it with r and it has a

section that talks about the shell and

also the unit shell

lesson of the carpentries here you have

the links to follow the original

resources

the objectives

um are to understand what is the shell

to start a shell to set up the listen

the lesson materials to navigate your

file system and

next time we're going to be talking

about modifying your file system doing

things like creating copying moving

files and also to remove files but we're

not going to be talking about that today

we don't have time for that

also we're gonna be

in part one and in another chapter we're

gonna be talking about how to compose

commands sort

the output that you get from the

terminal

and redirecting results

also i'm going to be showing how to edit

text files and these are

this is an addition to the plan that i

presented last week inspired by feedback

from cj in particular it happens that

sometimes you are dropping an

environment with with

very

weird

text editors and you don't have

an alternative so it's good to know how

those editors work and at least the

minimum

skills that you need to create a file

save a file and even leave that text

editor which can be surprisingly hard

and then in other parts we're going to

be talking about finding things

iterating and reusing code

also something that i didn't

think of before which is the idea of

users and privileges

most of us don't have a lot of

experience with multi-user systems but

the terminal is very

common in linux environments and i heard

that

some people

at 2 degrees

do need to interact with remote

computers which has which have

linux running on them and that is a

multi-user environment

and it's interesting to know

for this for those people interesting to

know you know the basics of how that

works and and why maybe files that you

create with one

that one user created might not be

accessible to another user and how you

you know what you can do to fix that and

also i'm going to be talking a little

bit about dot files which is something

that again i didn't consider last week

but now i think it's a good idea the

idea of basically setting up your

preferences for your system

and uh

how to restore those files in places

that allow you to recover if you lose

your um your system you break your

system you have to kind of restart your

system or you know you use your computer

and you have to start a new one how do

you quickly get the computer environment

that you like

all right so but focusing on what we

have for today um first thing

is to

make a little comment about what is the

shell and maybe for that go

to the folder that hosts the

materials of the day um

so the shell is simply a program to run

other programs in the same way that for

example if you have a windows computer

um

you know you you click on things and

programs start and and then you click on

other

you know or on

xs and programs close so all those

things um

allow you to interact

with programs from your computer so the

same thing is what you can do with a

shell

it's important because it's very fast

it's a very concise way to also express

what you want the computer to do and

it's everywhere so um

yeah having a

um like

a good command of the of the terminal is

um

tends to be very useful

and the most common shell is called bash

there's many shells and windows

confusingly has

by default a few

shells that are not

um

bash and

that is why it's very important to know

that bash word because if you are not

using bash what i'm showing here

may not work

um also you may have noticed that i use

the word shell and terminal

interchangeably it seems that there are

some differences or at least some people

are interested in highlighting those

differences not me so here i'm going to

be using the word shell or terminal or

command line or console

almost as synonyms

so how you go about studying a shell

so

if you are within our studio so let's

open uh here our studio

you can go to tools and you have a shell

entry there in that in the menu that

will pop up whatever shell is

configuring your system um to

to run so i'm going to close that and

and also you will see that um

you have a terminal here as well

here right so those are two places where

you can get access to a terminal inside

our studio and if you want to access the

terminal outside a studio

um

usually

that's um actually here

the idea of you know checking which

terminal you have might be important so

if you are already on a shell like i'm

here now you can type echo dollar sign

shell basically what we are doing here

something that we haven't covered yet is

the idea of printing the value that is

stored in what's called an environmental

variable the relevant variable here here

is shell and you

evoke

it with that dollar sign and echo is

just a command that you know prints the

contents of something um

and the output is uh is this one here

which is simply a path inside the

computer and that is showing me that i'm

using a shell it's not bash it's called

zsh it's it's very close to bash so for

the purposes of

of this meet up it could work but i'm

going to be using a different

environment though so you can reproduce

it

more easily

also you may want to check if you uh you

know that echo command that i show you a

dollar sign shell didn't work you might

want to check here in tools global

options you will see that there is an

entry for terminal

this is taking some time to update there

you go

um so see what you have here in new

terminals open with uh you may have the

option bash so i could probably probably

have the csh so here i have custom i'm

not sure how that appeared there but it

looks like it knows uh which shell to

invoke because when i i click there on

tool shell the one that opened was um

the one that i want and also when i

create a new shell a new terminal here

um you know i get the terminal that i'm

familiar with the one that i like

so going back to the

contents uh so so far we talked a lot

about the shell and our studio but if

you're outside our studio how do you

start a shell um

well

mac os um

has places where you can find

programs by their name i guess uh things

called spotlight you could you know use

spotlight to find

the program terminal just by typing

terminal i'm doing something similar

here by pressing the

what it could be the

the

start key i think it's calling windows

or the windows key so i press that in my

i'm using linux i'm on a new ubuntu

system and here i can start typing so i

can type terminal and that's how i

invoke a terminal and start using it i'm

going to close it

and if you're in windows

know that to get it bash terminal you

first need to install git and here i

give a link so that you can do so and if

you have any questions about

git

in particular what relates to r i

strongly recommend the book happy kit

with r which has that appendix a that i

mentioned before uh where you can learn

a lot about the shell uh but also has a

chapter six on how to install git

and with some useful

um

entries for debugging

issues debugging problems

um okay so if you're on windows then you

first need to install kit and then you

can start kit bash

maybe just by

pressing the windows key and start

typing git bash or just bash should give

you

a short link to start the program

so

you

um

assuming that you already started a

terminal then the next thing you

could

like to do to follow along is to get the

data that lives here in under the link

example data if i click there you know

this downloads folder

so download that folder and save it and

place it in desktop and that's where

it's going to be

for the rest of the lesson

of the meetup

i'm going to be using

a system that is running inside the

docker container because i would like to

provide a way for whoever is motivated

enough to reproduce

what you see in my computer so um the

way i'm doing that is um

actually you know we could do what we

have been showing so far so i could

start a shell here with toolshell

that would

open a terminal there on the directory

where i'm working which is the

repository dedicated to this meetup and

here um i have already

placed a couple of files that allow

um docker to know which computer

environment i want so all i need to do

now is docker compose up

and typing that will start an instance

of our studio on

a web browser so the next thing i want

to do here is go to a web browser create

a new tab and type localhost

and so localhost will be the place

where i can access our studio so the

username is our studio and the password

is one two three and that's how it's set

up

and it doesn't have to be a secure

password for this um use case and here

you can see

our studio very similar to what you have

when you work with our studio locally

so um

going back to the materials of the

lesson

now we are about to start talking a

little bit about the most common

commands to navigate your file system so

very

important is to know where we are so

print.pwd stands for print working

directory so i'm sorry

uh here i'm lost this is the type i want

so maybe what i can do is um like leave

our studio here and this tab here to the

right so i have a way to know what i

wanted to discuss so let's leave that

there and here i don't need all that

space

so i'm going to open the terminal here

okay

so print working directory tells us that

we are under slash home rstudio our

studio is the user and in

many systems that's how it works

the directory that is called the home

of that user

has the name of the user so um there is

a command actually that um

it wasn't planning to show today but uh

i think it's fine it's called who am i

that will tell you who is the user of

this computer the user is called rstudio

the name has been set up by the docker

image that i'm using um it wasn't me

so um

the so i know now that i'm in in the

home and also i could i could know that

because um the prompt here you know that

tilda dollar sign and blinking cursor

shows that tiddler so the tilde is the

short

uh

for for the home of a computer

so um

i'm in home and i can confirm that here

on the visual

interface here so if i click here you

know i'm in the home and under home i

can also see in the visual interface

that

there is there are two directories

desktop and projects so to know or to

get access to that same information from

the terminal you just do ls for list

so like list the contents and there

those two

those two directories are

so ls has a ton of options

so minus minus help

if it is configuring your system should

give you something like this so let me

expand this this is the help file for ls

as you can see there is a ton of options

and it can be a little overwhelming in

the beginning but

it's worth trying to make an effort to

understand what's going on so this is

the format the the general form of

um

and call to ls so i'm going to create a

new file here to kind of store that

so that we can analyze it a little bit

so basically you can see

ls which is the command then some

options that are in brackets because

they are optional you can you can choose

not to

to

pass any option and and maybe more than

one option so that's why you have dot

dot dot and same thing for file so you

can request

ls for a file or a directory but that's

optional that's why it's within brackets

and then dot dot dot

means that you know you can request the

contents for more than one fighter more

than one

um directory so for example valid codes

could be simply ls right because that's

the only compulsory thing the only thing

that is not on

um

within square brackets it could also be

valid to do an option like minus a which

stands for all so let's scroll up here

so all right the short form of

um maybe some other flag we could also

use uh there is one that i like if you

want to see

the

for example

a long list with some additional

information of the directory you could

also do minus l

right so these are

options

uh we could omit them and there are more

than one because you know this is

possible we have dot dot dot here and

then

the in the part of file um so that's uh

alternative and now let's

say that

we want to pass as an argument a

folder that we want to look into so that

could be desktop for example this

dot

right so this could be

the option of you know

the option that corresponds to file and

uh

we are not limited to just one we could

also projects you know the two

directories that we know live in there

so all of these are valid calls as it is

also valid to join different flags um so

minus a and minus l can become compacted

uh as minus a l together

uh and then here we could do the same so

these are valid calls so let's try them

out let's go here to the the terminal

if you want to clear um you know this

and

just for

to avoid confusion you can type clear

or you can do ctrl l and the two things

will just get rid of all the output

that you see there

so let's try ls minus

a

first that will give us the contents of

this directory including some files that

are hidden what are hidden files well

files and folders that start with a dot

uh so if you click here anymore and show

hidden files you'll see now that you

know there is a matching between the

files that we see in the visual

interface and here on the terminal

uh including some files that are for

configurations that we're going to be

talking about um later in the

series

so now i'm going to recover the last

command with the up arrow um and i keep

pressing i can't keep pressing to

recover other items in the history

or i can go back now with the down arrow

so

minus a is what i wanted and now i'm

going to add the l for

that long list of options

so here what we see is an output that is

more rich so we have information um

about who created who which which was a

user that created the you know specific

files and

but more importantly right now i want to

highlight for example

the time and date

when those files were created and why

because okay i'm going to add another

flag here and it's going to be

t

to sort for time so now the output is

sorted by date

so ls

minus alt could give me

just just what you see here

and i could do

let's do only ls for desktop and

projects for example

let's clear this up with ctrl l

ls

this stop

and

projects and

if you are wondering how did i type so

quickly well the answer is i did not

type that quickly i just typed a few key

strokes and then press tab for

autocomplete so those are some of the

of the few ways in which you can

write paths very efficiently in the

terminal so here you can see the output

now has like two sections the sections

for the context of desktop and the

section for the contents of terminal uh

so fair enough i'm gonna hide the hidden

and folders so if we click in desktop

there we see the contents of it and we

could you know continue clicking and

seeing um the the guts of that folder

but we're not gonna do it just now so

let's go back to the lesson we talked

about ls uh and now the next command

that um and by the way so the ls

so the help is not unique to ls um

most commands do have a flag that is

that invokes

help

but it may not work for you and that is

because the command when it was written

maybe um it was not

a thing

to

create a minus minus help flag but what

should work is um

which is a command that invokes the

manual for a command

however it won't work in this specific

system because this system has been

minimized to fit

very lightly inside a docker container

but if i show you

uh another terminal like in my computer

man ls one

ls does show the same thing that you get

with

ls help

right so if one doesn't work then try

the other one that's my um

advice

let's go back to the contents of listen

so now it's time to know how you

actually move so for now we have been

able to see the contents of different

um directories

but we haven't actually

moved anywhere we stayed all the time in

what was the home directory so

we can move with change directory for

example desktop

and now you can see the stuff appears in

the prompt that's not always the case it

depends on how you have configured your

computer or your your terminal to

display the prompt

so that's how it's configured here and i

think it's a nice thing to have always

an idea of where you're standing

and then

if if i want to go back i have an option

i can do cd

minus and that will take me to the last

place where i was so if i recover the

last command we see the minus the last

place where i was was desktop so that

should take me back to desktop so i

could do this

one time and again and all the time move

from one directory to the other

another thing you may have noticed is

when i did ls with minus a you may have

noticed that there is a dot and a dot

dot

so those are um ways

for you to refer to paths relative to

the place where you're standing so if i

do ls or if i do ls dot i'm doing the

same thing dot stands for here where i'm

right now

and dot dot stands for the parent so if

i do ls

dot dot that is the contents of the

parent of the stock which is of course

something that includes desktop right

because the parent of desktop has

desktop

as a child

and so yeah those are very

common uh useful um

tricks to know i guess uh and the very

last one i want to mention today is the

tilde

which as you know i said before it

stands for um

the home but you can also use it and to

explore things you know with less stila

for example or to change directory with

cd change directory that for example

will take us back where

okay then the last thing i want to

mention are a couple of tricks that i

learned actually when preparing for this

lesson um which here it is so some

tricks to um you know or you know advice

for writing but first that we know uses

and he didn't appear but uh what it uses

is backslash so where you could see a

front forward slash

in mac or linux in in windows i think

you will see a backslash

i think it does work if you use a

forward slash uh to write plans for

windows but yeah that's how it is and

sometimes it's hard

to type paths because

um the past may have

spaces and it's kind of difficult to um

yeah to know

which

you know if a space is something within

the path or something that belongs to a

second path that you're trying to type

so one trick that can help you with that

is that you can drag things you can drag

files

inside uh the terminal so for example

just a video if i drag there what it

does

is it pastes the path so i can now start

doing things with it so i could do ls

i'm going to press ctrl a that takes me

to the

um to the front of

anything that you are having the

terminal and if you want to go to the

end

you use the ctrl e so a

takes you to the first

column in the terminal and e to the last

one so um if i go to the beginning i

could do an ls for a file is just the

path of that file

and if i want to do for example ls for

the parent of that file so like every

video that should list all the videos

that i have here right so

yeah the trick that i wanted to show is

that you can drag a file to the terminal

just to get

very quickly the full path to that file

any other trick i want to share

okay out of the complete i already

showed that

so if you are

um

here for example an ls will show that i

have desktop and project so it's very

easy to design would be weight oh

that didn't come up very nicely so to

disability weight which um

for example that directory i wanna

create a path for so if i do d that is

enough to for the terminal to know that

i want to type desktop so d

plus the top completes the

uh the whole path and if i type p

and press the tab it completes the the

full word project but i keep pressing

tab

and i can get the contents of of that

folder so i keep pressing so now i press

and nothing happens so i'm going to

press one again once again and what what

happened is that

it was ambiguous um what exactly i want

to type so now i have to i'm presented

with all the options so now i could do

like zero zero for example and then tab

and that way that is unambiguous and

once again it's read me but it looks

like it's more than one readme so

pressing again i'm gonna it gives me

readmemd and readme rmd so i type r and

then tab and that completes the whole

path right so i'm going to clear this

with ctrl l as i said before and now i'm

going to press ctrl c which kind of

cancels what you are about to do so it

gives me a fresh

prompt with like no no path or anything

ctrl elegantly

i think that's all except for this one i

already mentioned that you can use the

up and down arrow um to recover commands

that you typed before and there is also

this search

previous command and i hop out here so

ls r doesn't work

ls

space r i don't know i think um it's not

working for me and i'm not quite sure

why um honestly but you may want to just

try and if i figure it out next time

i'll like you know

that's all i wanted to cover today um

wrapping up what we did is uh we learned

how to stylish the terminal and we

learned

very coarsely what a terminal is that

has we can refer to it at least in this

series as shell as terminal as command

line as console and also we learned how

to

um

start a terminal from inside our

outsider studio and a few commands are

very common for navigating your file

system all right that's all for now i

hope you find this content useful see

you next time
