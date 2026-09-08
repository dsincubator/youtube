---
type: Video Transcript
title: "Set up a custom user library to install R packages"
description: "This video shows how to control where your packages go and specifically how to set up a custom user library this is an extension of a meetup of..."
resource: "https://www.youtube.com/watch?v=sbp5Q8niTho"
tags: ["ds-incubator", "r-packages"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=sbp5Q8niTho"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2022-03-18T00:00:00Z"
    usage_count: 2691
usage_window: { from: "2022-03-18T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

this video shows how to control where

your packages go and specifically how to

set up a custom user library

this is an extension of a meetup

of the ds incubator that covers the

topic but it stops at

how to work with a temporary library

because that is a more general use case

the idea of setting up a custom user

library may come

useful

occasionally but not so much that i

think it's not worth um using that

timing it is a greater life but here i

will leave a record and leave a video in

the um youtube list so that if you are

interested to do that you know how to do

it

again this is part of the bigger uh of

the

series of the ds incubator about the

book what they forgot to teach you about

are

so the

normally when you install another

package say that you install it with

install.packages from cran you could

call it with the first argument alone

let's say that you want to install this

package this is how most commonly we

install packages but where do packages

go okay the message that prints here

tells us it so in this case it's going

to this library so it is a library that

doesn't include our user name it's

installing at the level of the site so

this is um this system that i'm using

here is a docker container using a linux

system that is shared across

multiple users so every package that i'm

installing here um you know is installed

at a level that is accessible to other

users

so

what if you wanted to control that what

if you are a user and want to install

packages just on your system and not

into the

kind of site level library all right you

can do that with the second argument to

install the packages which is the

argument leave so that is what specifies

uh where they go so the in the decision

query will show that we could you could

do it in a temporary directory

the package could install there and and

then you know you could simply use it

from that directory um

but in this case we want to install it

in a user um library that we haven't yet

set up so first we would need to set it

up so how does

uh

you know that default uh of the argument

leave um

work well the way it works is that it is

the first element of the output of the

function leave paths

so this function when you print it with

no argument let me clear this up make

this a little bigger and write it again

so the function dot leave path

prints um every library that you have a

setup

and in particular the very first one

here which might now look familiar from

the message that i printed before is the

one that is used by default when you

call install the package so basically

path element one so you could have a

quick look into it let's say

that we want to inspect it so let's do a

list files inside that directory so here

you may um recognize these names as the

names of some packages that are

extensions of the backgrounds that come

with chrome with um

r

so the ones that come with r in this

system are installed in this other

path in this other library

so that you know the the patches that

come out of the box with r are separate

from the ones that you install as a user

uh either in your custom library which

we haven't set up yet or at the site

level

so now how do we add a path to leave

paths and how do we ensure that it is

set up as the custom path all the time

that i install the package as a user all

right so the trick is this so there is

an environment variable called um our

let me show you as i type and

let's

get this environment variable r

leaves user so this is the one that

specifies

where

the user packages should go but for that

path to be used

and first

the directory has to exist so if i do um

directory

exists to ask if that directory exists

we get false so we could create that

path and then set it up in a way that i

haven't shown you yet but instead we're

gonna do something

a little bit more um personal so this

path um is is a very fine one actually

the one that i usually use but what if

we wanted to um

you know use our own

you know name for a library here so the

place where you can set that up

uh basically what you need to do is to

set up the environment variable art libs

user but where okay the place is the r

environment file so let's do that so we

can use the function use this for the

use this package edit

our environ to open that file and now

set it up here so r leaves

user it takes the value say that we want

to put it here in home

then r and then custom

leave and that that's a you know fine

name but uh remember to always set up

your libraries so that they include the

name the version the minor version of r

that you're using and the way you do

that is with percent v so this will be

expanded by r to the minor version of

earlier you see and then also remember

remember to end this r environment file

always with a

new line

with nothing else then save the file you

can close it if you want and for it to

take action

we have to do a couple of things first

now we need to restart r

but if i now call

the environment the environment

if i inspect the environment variable

um with as i said before our leaves user

so we do get

the as an answer the path that we just

created but the fact that we created

that path doesn't mean that we created

the directory in our system so i can do

uh

we can query that with uh

exists and we should get a false right

so the the way to create the directory

um one way could be this

we just created and make sure that we

could recursively create any

intermediate path

to the one that we are where we want to

create so now if we query if the

directory exists now we do get it true

so we are close to what we need but not

quite so if i call leave path

i still get

only two paths and the reason is because

we haven't restarted the system

so we do it now again and now the path

appears here but still we are not quite

there so the directory for it to be used

as default has to appear in the first

place

so if you look into the help file of the

functionality path you will see that it

has an argument that you can use

to set what is the first element of uh

you know that call so uh

that is then what we need to do

sis

get him so the way to get the

path that we want could be this calling

sysgen our leaves user

and then if we pass that inside lead

paths then the output of leak path

will be oh sorry let me

this

i

don't like let's do a lowercase so out

now holds um you know the same element

is done before but the first element is

the one that we want so this call to the

path will lead to um the default

behavior that we want so basically if i

now do

uninstall packages

uh for rtdi data for example that

package should go to um the custom

library that we want but we are still

not fully there now i promise we are

really close

uh because the issue is that if i

restart my system

and

install the package again it will go

elsewhere and the reason is that we have

not set a

leap path permanently but we have only

done it for the

session uh where we defined uh you know

that the first element of this path

would be our custom library so the way

to apply that so note that you know the

fact to confirm it is this right the

message shows that the package when we

re installed it went somewhere else so

the

way to set it up permanently is to edit

our uh our not our environment file in

this case so the the place to put that

would be our profile file so edit our

profile uh we'll open up that um

file our profile and here is where we

want to set up uh leave paths

to um push to the to the front and the

output of cis get and

our lifts path our leaves user sorry

right so this is um how um we can set up

our our profile so that in every session

our profile is a file is always um you

know inspected

in the beginning of every our session so

in this way leadpath will every time you

restart r will always be set to the

custom use custom user library so we can

we can prove that let's restart the

decision here

and

and now we can do

a dot leap paths

and see how in the front we have the

custom larry so now just to confirm that

that all works we could

install packages same package rti data

and it should go to where we want which

is our custom user library so let's just

confirm that here and then end the video

thanks very much
