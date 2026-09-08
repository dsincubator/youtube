---
type: Video Transcript
title: "ds.tmux"
description: "welcome to the yes incubator this is an  introduction to tmax it's a meetup that  was led by alex last week but  unfortunately i failed to record it so  i'm gon"
resource: "https://www.youtube.com/watch?v=00i28kdk8cM"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=00i28kdk8cM"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

welcome to the yes incubator this is an

introduction to tmax it's a meetup that

was led by alex last week but

unfortunately i failed to record it so

i'm gonna do a remake it's not exactly

as he did it it's gonna be my take

i'm gonna be comparing tmax with the way

we manage

different windows in our graphical user

interface whatever

operative system you have that might be

windows mac or in my case

right now i'm using a chromebook

so you know i'm going to show how we

naturally manage

um windows in and panels and desktops in

a computer where we have access to a

graphical user interface and then

how much

more challenging it is

when we don't have a graphical user

interface and how we can do it when we

want to work in such an environment

and and then is when t-max is going to

be great

also um we'll show how tmax helps us

detach processes

so they can write in the background

while we do other things with the with

the terminal and finally how to log into

a session that someone else is using so

that two people can work from different

places in the world at the same time on

the same

terminal

so let's get into that

so the first part is nothing uh that

might surprise you it's you know let's

let's first build the mental model that

will help us then understand what is the

cool thing about tmax so here i'm

showing

one

screen

with chrome in it

and

for us using a graphical user interface

like in this case the one that chrome

provides

it's very easy to move windows around so

i can detach it from

the you know i can make it not take up

the whole space of the screen but move

it to a left and here in the background

i have another program actually the

brand that browses files in this system

and so this is a minimal example to show

that

we are kind of used to managing multiple

programs right at the same time and

displaying them on the same screen if

you want to maximize one of them

you can easily do it with the windows if

you want to close it completely you got

to easily do it too and sometimes you

may want to

one program cover

the other so for example here i can

maximize this window and it's going to

cover the one in the background and i

can change to the one in the background

and make that one take up all my screen

so all of that are things that we're

used to doing

we can also do that when we work on the

terminal

as long as we are

in an environment that offers a

graphical user interface that is no

problem let's let's show

that for example if i move

to this other desktop

in the same

computer here i have a terminal and in

this terminal i may be running

bash

this is actually what i'm running bash

if i do unless i can see the directories

that have any system for example i may

open another terminal because i may want

to run a different process

that covers the one

that is that before was in the front now

it's in the back

and i can make this a little bigger

maybe

i may be running a different for example

docker i can do

poke run

interactive

players

um

so let's run this to just to show that

um we can run

and here inside that program here that

docker image is gonna run r so we're

doing

two different things in this terminal

i'm running r inside of the container

and i can move it to the right and in

the background i have just bash running

as well

so you know this is how we would manage

two

programs in this case on the shell

right at the same time right and we can

resize them for example something like

this all right no rocket science for now

you may know or not different shortcuts

to these things if you don't you may

just drag things you know maximize them

from here close terminals from here and

so on and so forth

but

what happens when you do not have a

graphical user interface and you cannot

use the mouse to do all the things that

i have been showing and that is the case

when you work for example on

a remote computer for example if i log

in to

a computer on digital ocean i have one

here so i can do ssh

roots

and here i need to find

my account in digital ocean

let's go to digitalocean.com

and i'm going to log in because i have

an account with them

and here

i'm gonna look for a project

uh here is a

server called mauro and i'm gonna

copy the ipv4 address all right so

that's all i need so now i can go back

to the terminal so i'm gonna paste that

right there

okay so i'm gonna with this what i'm

gonna be doing is using this terminal to

connect to a remote computer i need to

give

a password here

and this should connect and here i am

notice that the user now

is

roots and the computer is called mauro

before i was in a different system i was

the user model not the user root and the

computer was called penguin not

so this is to convince you that i'm you

know although it looks similar this is a

completely different computer

and here i don't have

a graphical user interface to interact

with the system so i need to

resource to other tools so let's clear

this up with ctrl l and this is when

t-max

is going to help so t-max is this

program that when you run it

you start a new tmax session it's

something similar to

creating a new desktop in your computer

that starts with no program or in this

case it starts with one program the the

program in the

being run at the moment is zsh i could

run bash instead for example and if i do

that

you will see that the name under here

i think soon will change

maybe not until i create a new window

in any case what we have there i just

changed what we have here it can be read

as the following so i'm in a window

called bash is marked by the asterisk as

the active window is the only one i have

for now it's also numbered um with the

number zero and this is running in a

session that is also a number with

number zero

so i could rename

the

this window with so any command that you

do in tmax has to be prefixed with ctrl

v so i press ctrl v

and then the comma that would be access

to rename the window i'm going to call

it a terminal for example and hit enter

also if i want to create a new window i

can do it with ctrl b and the letter c

you will see now that there is this new

window there and i could also

uh rename it uh

to for example with ctrl b comma i could

really name it to say docker

song or maybe not docker going is called

r

control b comma

docker

r so let's do that

and now here i'm gonna do

docker

run

remove

interactive let's use the image broker

first i have here

and run

bash first

and now r

right so here i have this window number

one that is running docker

and i have this other window uh

with the number zero that is running the

terminal how am i gonna change from one

window to the other or ctrl b and to

change the window you just type the

number of the window that you wanna

focus on in this case zero will take me

to terminal and there it is and if i

want to go back to

the window number one i press ctrl b and

the number one so this is equivalent

to uh in a

system like this one uh

to focus on one window or

the other so i can click here window

number one actually i can use ctrl 1 to

focus on that one and then ctrl 2 will

focus on this right so it's the same

thing that we are doing um

now here

with

tmax

right

and

that not only that doesn't end there i

can also split this screen

i can do

ctrl b

and percent which in my case is shift

number five and as you can see i have

just created another

panel inside the window the active

window which is a docker r here i could

do

something

else like docker run

maybe another um

um instance of

uh

rocker

reverse

and let's do it um this time i'm going

to run rd comment directly

yeah but these two sessions completely

separate from each other if i wanted to

resize i don't have a mouse i can't drag

uh this dragon this doesn't work so what

i have to do is ctrl v

and then with the ctrl pressed i can

press the arrows and that will resize

things like that

yeah if i want to resize the whole thing

then i can do a ctrl minus

and that will kind of shrink everything

in proportion but resize the windows

ctrl v and the arrows while you keep

press the control button

all right so we've learned how to create

your windows how to move between one

window and the other how to create

panels and now let's see how we can

rename the session so we can do ctrl b

and dollar sign which for me is shift

number four and that will be um

you know gives us the ability to rename

this session let's call it uh

do for digital ocean and position one

for example s1

all right i hit enter and now we have

things a bit more organized we have a

session running here called dos one and

one window called terminal and the other

window called docker and this window

logger has has two panels

so if we want to close a panel it's ctrl

v with x

you know we get a confirmation if we

want to close it

and if we wanted to close the whole

window is ctrl b

with and

again we get a confirmation we want to

close this window we say yes and in this

case we are now

with just one window

and if we want to work at the even

higher level at the level of sessions

then

we um

you know we may want to create more than

one session so and i could create

another terminal here and then log into

the same server and then work from that

terminal or i could detach the terminal

that i have um right now so this

terminal is attached to the session

number one but i could attach it with

ctrl b

and

d detaches from that team accession but

the session is running and that is

pretty cool because you may be in that

session running a long running process

that may take days and while you do that

um on the background on the front

front ground foreground

you may want to have an interactive

terminal like the one that i have here

right where you can type things uh so i

can i can investigate which sessions i

have with tmax

ls which show that i have that dos one

session right in the background and i

could reattach to it with ctrl v

um oh sorry with tmax

attach and now you have to if it's name

you have to say minus t and the name of

the session in this case is one we

reattach that session ctrl v d the

touches from it

um we may want to create another session

uh and we can do it with dmax new

if we do minus s we can name the session

let's call it you know ds

d0s2 in this case for example and so and

now we are attached to that one so if we

do a t max ls now we can see that there

is two sessions and we are attached to

position number two

so and that's uh you know how we can

attach and detach we already learned how

to

create windows create panels close

panels close windows and and we

may want to now also show how you can

collaborate with someone else in a

different part of the world so let's do

let's open another terminal pretending

that this is a terminal run from a

computer

somewhere else not the one that you're

holding your hands so say that you want

to work with a colleague

and your colleague

also has access to a terminal and

they're going to log in to

the same

server on digitalocean that is running

the computer that you're running so

this is looking good so let's do and

they are going to also do ssh

root at

the

server

oh no not that

let's get the

ipv4 number from here

and paste it

there

there you go so someone else so here on

the left it's you here on the right

someone else logs into the same session

or to the same server

and they're going to investigate which

teamwork sessions are running the marks

ls they can see the same two sessions

that we see here on our own computer so

this is our computer and they decide to

log in to session number two which is

the same one that

we are logged in here so how they do

that

they do it with tmax attach

and

t for is the flag that we need to pass

the name of a session d0s2

so here we attach to

that session and you can see that if i

type something here on the right that

immediately appears also on the left

that's great because these two people

the one on the left and one on the right

in different parts of the world are

working on the exact same terminal they

can also for example create a new file

inside a temp this change directly to

tim and create file called abc

and so now the person on the list says

hi

i'm person a

and the person on the

right can continue editing the success

hi

personally

okay so the two people working exactly

at the same time uh

to say that if i came in beam column w q

closes the file

so

all right if we want to close the

um

terminate the session we can do ctrl

d

and that should let me check

dmx ls

yes because that was the last window

that that session had closed in that

window closed decision as well so let's

uh try the same with the last

session that we have here now from the

left i'm going to attach

max

attach

decision

sorry decision

named

dos one and with this what i want to

show is once again that if i close this

window which we can do with

ctrl d

it will um

i keep going ctrl d ctrl d now if i do a

tmxls i should see no server running

all right that wraps up

finishes the meetup of today to wrap up

we learned to use

tmax to manage windows manage panels

manage sessions and in a way that

resembles the way we manage

also the similar or equivalent items

when we have a graphical user interface

but t-max becomes necessary particularly

when you are working on a computer with

no um graphical user interface you know

if you have a graphical user interface

you may you may want to use it anyway if

you like it but there is almost

is crucial when you have

such a tool

alright i hope that you find this useful

see you next time
