---
type: Video Transcript
title: "Data science on a chromebook"
description: "I'm again to the dsin creator today we're gonna be talking about data science on a chromebook it is a meetup that lasts only today it's a fun..."
resource: "https://www.youtube.com/watch?v=uDx9NkoBqv8"
tags: ["ds-incubator", "docker", "git", "chromebook", "terminal"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=uDx9NkoBqv8"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2022-08-16T00:00:00Z"
    usage_count: 875
usage_window: { from: "2022-08-16T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

i'm again to the dsin creator today

we're gonna be talking about data

science on a chromebook it is a meetup

that lasts only today it's a fun meetup

and it is inspired by the blog post by

jeff lick in 2017 data science on the

chromebook and also by my original need

to

use a computer when my main computer

broke down it's right now in the

workshop i've been using this chromebook

for about a week now maybe a little more

and i'm having a lot of fun

so it i would like to talk today to data

science scientists in general including

analysts and software developers

which

we usually think that we might need a

super powerful computer and for um

and today i i'm hoping to demonstrate

that we can get away with something very

lightweight and

so this meetup will help you if you are

like me and your main station main

computing station broke down or if you

are interested in saving a few dollars

maybe you want to get started in data

science

but you find that

um like a normal computer is too

expensive uh today i'm gonna show you

how you can you can get started with not

so much money so first i'm going to be

overviewing my chromebook then i'm going

to be showing how you can start

by using

a computer

online

with unlimited resources or resources

that you buy on demand or you rent on

demand from cloud providers like

digitalocean for example and third i'm

going to be talking about how to set up

your own chromebook to work offline and

that is when the limitations are going

to be exposed you're gonna be limited to

the very little resources that your

computer has

so let's start by talking a bit about

the laptop that i i'm having here on my

hands it's it costed 120 bucks on amazon

and it has only two cores where compared

to my main station which has

maybe five or seven i think

uh four gigabytes of memory of ram

memory my main computer has i think 32

gigabytes of memory and only 64

gigabytes of storage and my main

computer has uh i think half of a

terabyte

so as you can see this is much much

smaller than my main computer and um

and it's not a problem for chrome os as

the software the operating system that

this computer is running and maybe with

these very limited resources we're going

to be able to run windows or or mac os

at least not the latest versions of them

but chrome os is super lightweight it's

based on apps it has it comes already

with a few apps i'm going to show you

some here

and it works pretty much like a

um

like an ipad or a tablet

the keyboard is pretty lean i'm going to

click here to show you an image of the

keyboard that i have and there are a few

keys that i was used to using

on my other computer and i lack here for

example the caps lock

doesn't exist instead i have to press

alt and

the search

key

hopefully why these refresh

refreshes um

well i can make my point anyway um there

you go so this this search key is

you use it for a bunch of things and

to

[Music]

for example to lock apps you do alt and

that key

or to do dell you have dell as you can

see you have to press alt and backspace

and what else you don't have a right

click so if you if you click here

nothing happens what you have to do is

alt and um

and click or the with two fingers to tap

so that is uh maybe similar to what my

users are used to um

it was

you know it took me a little bit to get

used to that but it's fine i'm very

happy with this uh with this very simple

keyboard give me a second i need to

uh

here

say that i'm still in the call in the

call well so back to the notes um the

file system

it looks like this let me open the files

up

and here you see

that there's two types of files local

files here in my files and online files

on google drive so you log in here to

with your um

google account i'm logging here with one

account you could add more if you want

and by doing so then

immediately you have access to the

google drive associated to that google

account

okay

so um these files that you can see here

on my drive are not actually locally

stored they are online and this is just

a few of them

unless you

choose specifically for a particular

file to be displayed online and in that

case offline in that case you have it

you have a copy offline but not not by

default

and in my files usually you have just

downloads i did something that i'm going

to explain in a bit so i also have linux

files i'm going to explain that in a

moment let's close this up

and that was the overview that i wanted

to share with you so now let's get to

work so now we have this chromebook

it looks like i have just explained how

do we actually do that science with it

the easiest way would be to use a

computer on the cloud something that you

already set up on for example digital

ocean

i have one here that i'm used for

rstudio

you can see this is a a website and i

log in to this computer with a username

and a secure password

and only i can access there and

in this in this computer and i do actual

work and i can make it bigger or smaller

depending on my needs with that i'm

going to be paying more or less

depending on the resources that i want

so i'm not going to explain how to set

one up here because i covered that in a

series about cloud computing so you see

you could see the videos about um you

know from this ds equator's um

playlist the videos about cloud

computing so there i show how to set up

a computer on the cloud and how to scale

your computing resources up and down

but the long story short is that once

you do that setup you can get um this

image from the web browser access to a

limitless computer okay so i'm gonna

close that then the what rest is okay

what do you do when you are offline so

if you are on the plane or

you know you have internet or whatever

you may want to still work so the chrome

book doesn't come with developer tools

but you can set a developer environment

here a link to instructions from uh from

from chrome os actually to to see how

that works but that's that's um

you know

a little too detailed in short what you

want to do is you know go to your

settings um so you can pop up the

settings from here or

as usual go to the apps settings is no

more no less than an app so you can

start typing settings or you find it

there on the icons and click there

and

you can find for

developer tools

here

right so you can start typing dev

developers and there you go

and in developers you will find the

section about linux development

environment so i have already set one up

it's super simple just click to to

create when everything happens for you

you will have to choose or later change

this the amount of this space that you

want to reserve for that system because

what you'll be doing is basically

splitting your um disk uh so that one

part of this is going to host the chrome

os as it came and the other part is

going to host this linux system so two

systems inside the same computer

but you need to see say how much space

you want for each so i chose 30

gigabytes for my linux environment and

another 30 and a little more for chrome

os with that uh i think um you know i

made that decision so that i have enough

space to

install vocker on my linux environment

so that then you can use docker to

install any other software that i need

and the images the docker images

usually can go up to you know the ones

that i use can go up to a few gigabytes

maybe three or four gigabytes so they're

pretty large so i need certainly more

than the recommended disk space that i

re here it recommends that

chrome os recommends 10 gigabytes but

you know i need i need more

so

that's how you um

[Music]

yeah you set that up so once you do that

then you can find the terminal app which

appears once you have completed that

setup let me move this out of here out

of the way

and

you see this little window the one that

you want to click you see on the penguin

you get a penguin terminal

it's starting now and here it is

a little small so i'm going to do

control plus to make this a little

bigger i go to pwd a command to print

the working directory here you can see

what's my home directory

so the so there is a terminal here right

so that's that's the beginning

next uh you may want to see okay how do

i how can you access files from linux

that live on

your

on your chrome os side of the system

right so um and the other way around so

if you pop up the files app

you can see that

under my files i see linux files but if

you want from linux to access

the chrome files like for example the

ones that i unlock in downloads you have

to you know kind of option click on the

on the folder that you want to share in

my case i option click on

my files so the entire

the top level directory in my chrome os

system and and there is where you can

choose your uh how to manage linux

sharing so basically here is why you say

yes i want to share

the entire directory with linux and it's

going to be mounted on the normal place

on mount so let me show you how that

works so on linux you could do an ls on

mount and there you will see that there

is a directory called chrome os

and there is my files so inside my files

there is the downloads that we were

talking about right so

downloads

that's you know you can see all the

files that you can download which you

can also see

from uh

files from the files app

just to convince ourselves of that so we

have this view of the content of

downloads from the terminal and now

while these the freshest refreshes there

you go

if i click on downloads the same files

appear here all right so there is this

communication between the two systems

that

that we have

so now back to the notes

uh so again we

install the developer environment we um

are sharing some files so we can move

things around between systems and and

now what i could do is install docker

engine uh here is a link to the

instructions from docker on how to do it

and here is a link to the ds incubator

series dedicated to docker and that's

where you can see

how

to use docker in particular you'll see

how to use it with

images from the rocker project so here

is a link to using the image rocker

first what does that do well with that

you can create um basically let me show

you here so i have this this environment

right and now i can use docker

to

do a bunch of things including list all

the images that are running inside

containers here i'm running a container

called verse

inside from that started from an image

from the rockerverse project

and that is here at this address in

i chose

this address in particular so what you

need to do is simply to point your web

browser to that address and and there

you will have

an instance of our studio server running

and that is local you don't need an

internet connection so if i go

to that

address

here you log in with the um

with a username

and the password that you chose for

that particular

um

container when you created it

and what you're going to see is

something very similar to what you saw

before except that now we are looking

we're working locally so we could be

offline

and still be able to

start this

instance of our studio server

you can of course you know go to the

instructions to install our studio

server on your sorry this is taking a

little while but you know have a few

things things to say in the meantime

so you there you go so you

you could install our studio center

directly on your linux environment as

opposed to using a docker image but i

find it more clean to do it you know

through docker why because you know you

made

first because the instructions are kind

of

awkward and you can trust that the

images from rockerverse did it well

and second because if you can dispose a

container very easily

but you know once

and then or maybe use multiple different

containers in your same system and so

it's a lot more flexible so here is my

my system

looked from uh here's a git directory

for example and it has a few folders and

the same thing you could see here

um

there's my git directory and inside kits

that's what i have and that's because of

the way i started it on this container

and again to get that actually done and

there are a few um

docker commands that you need to know

about but i'm not gonna cover them again

here instead you can refer to the ds

docker

series or

of meetups and then you will see

everything about that

all right so now the next thing is you

you have a you know install linux you

have you're sharing files with the

chrome os system you are running docker

and inside it you're running and with

docker you're running install docker and

with docker you are running for example

rstudio server and you're using it from

the web browser

offline so now you want to connect to

github and and for that you need ssh

keys and or

a different way to connect but you know

in many places

we use ssh because it is a secure way to

talk between computers and so the way i

do it you could do it in many ways

including using rstudio to set up your

ssh keys for great instructions about

that i recommend the book happy kit with

r i personally use the gh cli so i

install the gh cli which is a common

line that allows you to interact with

github from the terminal here is

a link to the instructions to do that

and then i authenticate with gh

out logging

so that will give me a step-by-step

you know guide to

create ssh keys and to log into github

with my

you know as myself so that i can access

all my private repos and everything

then the next thing would be to

configure git so you have to tell it who

you are and that is done in a file

called git config which usually you

manipulate it through git command

something like git config and let's

let's see and here how it works so you

could do something like git

config

and then if you want a configuration

that is global

you will do global

username for example and that's my name

or user email and that's my email those

two

configurations are the minimum that you

need to be able to create commits for

example and so i did it once and then

stored that in a you know that goes to

your configurations go to this file

called config that lives in your home

directory i did it once and then store

it in a repository called dot files and

i uh reuse those.files so my git

configurations are pretty long i have a

few

a few things that i like about to

configure about git uh and not only with

git i do constantization for many other

programs so i have stored all those

files in a repository called.files you

can watch a little more about what those

files are and how you can

you know basically inspect them save

them and then reuse them here is a link

to the video

uh

so

with those configurations then your life

on the terminal will be a lot a lot more

pleasant

i also use a bunch of other programs in

particular oh my csh and which makes

terminal look like what you see here for

example if i do a cd into git

let's say

ds miss which is the

redbone that hosts this

this um

meetup and you can see immediately that

it looks pretty cool has some colors it

shows the branch in which i'm staying

the kit branch in which i'm standing

if i started a

vanilla terminal i couldn't have

information for example about the the

branch to know which branch i'm using i

need to do that branch

and only then i would know

so um yeah that that

comes from zsh

oh my csh that customization that i do

and i recommend you to also

you know find

the configurations that you want for all

the programs that you use commonly and

then store them in a dot files

repository and reuse them

all right so that's the end of the

meetup there are a couple of takeaways

to summarize the

this session

and it's this idea that you can do data

science on a cheap chromebook okay there

are limitations for sure but they are

relatively few and mainly when you are

working offline all right that's all for

today i hope that you enjoyed
