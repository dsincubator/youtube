---
type: Video Transcript
title: "wtf: Installing R packages (part 2)"
description: "so this is the ds equator about  installing packages we already had one  meetup last week and today i'm gonna be  covering uh a second part of it  hopefully the"
resource: "https://www.youtube.com/watch?v=9yrckf6Km-U"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=9yrckf6Km-U"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

so this is the ds equator about

installing packages we already had one

meetup last week and today i'm gonna be

covering uh a second part of it

hopefully the last about installing

packages

um the reason why i'm

going to actually i'm going to repeat a

little bit of uh what i covered last

time because i think it's very important

it's the idea of installing packages

from um

from private repositories

and and a few things have changed in you

know the ecosystems of tools that make

that possible so i wanted to

show what are you know those things here

um i'll be working with a computer

environment that

you can reproduce if you want you could

clone the repo that i'm working with you

know and change your directory to it and

then just run local compose up and so

that you if you want you can reproduce

what i'm running here so the

let's see where we left last time okay

we left here

where um i very briefly showed how to

install packages from a github

repository that is private there is a

video now on youtube

that you can check

specifically that so if you that's all

you want maybe share that specific link

with people so they don't have to see

other things

um

so the

let me expand this so i have a terminal

on

my console on my left so there we go

so uh the

what i'm going to be doing today is to

walk through the setup of what we call a

github token which is a private

key or password whatever you want to

call it that allows you to communicate

to

github

from your computer

and among the things that you can do

with such a

like a private piece of information is

to install packages from private

repositories so i showed last time that

if i wanted to for example install this

package naively

um just you know running what we usually

run for

installing packages from github the

function devtools

install underscore github

this should fail because this specific

computing environment is not set up

to talk to github in any way this is a

fresh computer environment so i'm on the

app that all the options that the

function uh message or the error message

gives us the one that is um that i know

you know is the the problem is that we

don't have the required permissions to

access this repository

so the

the one function that you need to

call to then

um follow its guidance is is this one

here is a function from the use this

package called gh underscore token

underscore help

so that will give you an idea of what's

going on and how you can move forward

as you can see there is this cross here

saying hey there is no access personal

token

on github so the host is online um you

know the you know that from from this

computer environment i can talk to

github but not

uh do things that require an access

token because there is no such a thing

yet

so it is telling me that i can create

one with this function create underscore

github underscore token so i'm going to

copy that and paste it here but this is

a function from the use this package so

if you haven't uh called library you can

also do use this column column that

syntax let me move this a little bit

so by running that function i'm going to

be sent to github

i need to

first you know enter my password to kind

of get to my settings

and now i'm you know presented with this

screen where i can um

type the name for this token

it's a good idea to write something

meaningful like you know the computer in

which you are

intending to use that token and maybe

the date so that if you know a long time

after now you forget about

that token you have an idea of you know

what was the intention so now i'm gonna

write the lead

on the date of today um 2022 march 22

because i want to delete this i'm going

to show this which is private

information and

and then i'm going to have to delete it

very quickly after that

so i'm going to generate the token for a

single time i'm going to see the token

here i'm going to refresh the page that

will make the token to go away

and i will never be able to see it again

so

um the way you set that up um is you

know now following the instructions of

the message that we have here

again let me move this message forward

from here um so

we are being

um asked to run

this function here to actually register

that token locally

and so that's what we're going to do so

the fact the the the package that has

that function is called git credits

and then

i'm going to type set so git create set

is the function that allows us now to

enter the token so i'm gonna paste it

there and run

and i'm gonna clean up my console so now

the token has been set so if i if i

called the function ga token help once

again and now you see that there is no

more red cross here it says that the the

personal access token has been found has

been discovered

right um so

um that's you know pretty much all i

need to do so let's go back to the

instructions try and now re run the the

command that we wanted to to run to

install the package and so i'm going to

scroll down so we did this this bit you

know the the function gh token help gave

us instructions we created

it token with a create github token then

we set it up locally with git credits

underscore set and now we have just

confirmed that you know all seems to be

doing well

but note the following so if i try to

rerun that function

um let me paste that here uh i still get

a failure and the same failure and

that's very confusing and the reason is

because that function has um

an argument that you have to explicitly

set

to let it know of the token they have

set so there is this function from yet

another package so here you can sense

the complexity and that's why you know i

think this deserves a video and a lot of

attention because it's quite complex to

do something as simple as to install a

package from the private repository so

if i run this this function gh and you

know talking and

what i get is an indication that yes the

token is there and a little bit of what

it is but the reason why it is not shown

in full is to protect my my you know the

privacy of what i'm doing here so it's a

very bad idea to show the token to

people you know to do what i'm doing

right now and the reason why i'm doing

this is a demo but i'm gonna destroy

that token like right away before i

publish this video outside two degrees

so now i can then use that um secret you

know that token

to

um

to pass it directly to the argument

of underscore token

and of the function install underscore

github so let's do that and that should

install the package as we can see now we

do not get the same error message we

just get a notification a message

information that the package is being

downloaded

from the head on the repo so that's

that's all good and and while this

happens let me reflect a little bit on

what has just happened um you know we

want something relatively simple i think

to install the package from a github

repo it happens to be private so i need

some privileges okay i did the setup and

now i expect that to just work um but it

didn't because this function uh devtools

underscore and install and the score

github is kind of picky and once an

explicit argument so let me tell you

that there is a better solution for that

and so you can do what i just did and

explicitly pass the auto token but

you can also use another function from a

clever package that is called pack and

the function is called

pkg for package underscore install let

me show you that in action in a moment

but before i do that

let me here just run and i'm going to

press enter

to allow that to continue i was being

asked to decide if i wanted to update

packages and so i just went with the

default

so now

i want to show you that if i run this

other function um

[Music]

i do not need to pass explicitly uh the

author the authorization token and here

i know the typo

because this function is clear enough to

recognize that token from wherever it is

set up so i'm going to just run that

installing now a game from github but

now with a different function not the

one that we use more commonly the one

that comes from the remotes package and

that is called um

installers or github now i'm using a

functional guns from the pack package

and it's called

um pkg underscore install

when you you know with the same function

you can install packages from cran or

from github and when you give it um

a string that has the format that you're

seeing here like repo slash package it

will assume that you know you want to

install something from github and that's

what it's going to be looking for and if

you just pass a string that has no you

know

slash thingy slash component then it

will assume that it's from from cran and

will look player

okay so this is to introduce you to this

new tool relatively new the package pack

has been there for a while but it's

improving

very rapidly so if you experience some

friction with this package say two years

ago now i think

you will you would have a much better

user experience it is built by

two developers that i really admire one

is jimmy hester but the main one is

well i'll look at it in a moment um here

it is

from gabor there you go from governor so

it promises to be a great great tool um

okay now that i showed you that i'm

gonna delete that token uh i don't want

anyone to

do things that um

you know uh that you shouldn't

so i'm gonna delete now even if you have

that token now you're gonna be able to

do anything so now if i rerun this

function now that i've removed the token

from github notice what happens you know

i should get a failure or not yeah there

you go there is an error here because

the token that i have installed locally

has no corresponding token on github i i

remove that token so i no longer i'm

able to use it

uh locally to talk to github

okay so that kind of i think you know

shows the entire loop of how this works

okay so enough about installing

packages so

next we're going to be talking about how

to control where the packages go

and before i do that let me go back to

your faces and ask if there is any

comment or question here maybe any

experience with the pack package which

i'm pretty new to

comments questions

okay that's fine i mean selling packages

for many of us is something that we do

regularly and with no friction

but

those who are relatively new to r

particularly when they try to install

packages from private repos may

experience frictions and now

here is a record of

the video record of how to do it so the

next thing i want to show is um

this idea of how to control where the

packages

come

where packages go so let me

again get that file that i had a moment

ago here on the screen

okay

and

the defaults are generally clever you

don't need to do much but in some

occasions you may want

to change things um

a little bit so i'm gonna try to show

the the few cases where you might want

to do that and how to actually do it to

begin with you know the trick is all um

or mostly from this function called

leave paths so this function if you know

if you go to the help file you will you

know find what it is all about

and

as it says here it is the function that

controls

let me go back to the notes

here

it controls you know how to get and set

the library trees um within which

packages are looked for so basically you

install packages that

means that some files will be located

somewhere in your computer and and it

could be more than one place

so when you run the functions such as

install.packages for example or pack

underscore

or packaging underscore install and

those functions will look through you

know all the possible places where you

may have packages installed or where you

would like to install your packages so

when you call library for example you

know that function needs to be aware of

all the places where you might have a

packages installed yes there is no no is

there is more than one so if i just call

this function i get all the paths where

packages

you know are installed

the one that belongs to the user is the

very first one um

and

that is what you also learn when you

read about the leap argument of the

function

install package so if you go to the

health file of install packages you will

see that the second argument is called

leap and the description of it says that

if the if you don't give any explicit

argument to leave

if missing it will default to the first

element of the path so this one here the

one that is highlighted

right this one here so the other library

here for example in this particular

system is reserved for packages that

come and by default with r

packages like base for example or like

utils

and then this one here is reserved for

packages that i still install as a user

and or in this particular system which

is a multi-user system any user installs

in their system

um so the way to to know where the

packages will go is simply calling leave

paths and asking for the very first

argument so if if i just call install

packages with the name of a package then

that is where the package is going to be

installed

um

so one thing you could do if you are

curious is to see

let's copy paste this is to see which

packages

have been installed and you know there's

a few ways in which you could do it but

one way is to just list the contents of

that path of the path that is the

default path for packages that the user

installs so here you will recognize the

names of some packages like shiny or

test that which are of course packages

that are extensions of the r ecosystem

they are not packages that come out of

the box with uh with r so if i do the

same for the second path you would

recognize packages like bass

like

oodles right as i just said before

so now knowing this thing uh you could

do that you could do that you know this

new knowledge to do something like for

example install a package that you want

to just test for a second and then like

throw it away

so

one scenario where you may want to do

that is when you want to install the

package from um you know the development

version of a package that you already

have installed so for example here i

have the package

rte data

so let me see if i do package

pack catch

version

of r2dii data what do i get i get 0.2.2

so what if i wanted to test

the development version of this package

just to try it but leave my system

untouched well one thing you can do is

to use that leap

argument which is which happens to be in

the second position of just about every

function that needs it

and pass

specifically a temporary directory so

the temporary template function gives

you

a directory that is valid for as long as

the r session lasts

so you can use that

to

basically define that as your temporary

library so i could do something like

this and say

let me clear this up so i paste it again

and fits here on the screen make it a

little bigger

so i can say hey pack install from

github this package called rta data

and put it in my temporary directory so

if i just run that

let's see what happens

we should get also a message somewhere

by credentials

oh i think that

uh

that's weird because i should not need

a token for this

i think but let me try now dev tools

install

github as you can see i'm pretty new to

the pack package so it just failed this

one also failed

to do

okay what we can do is to solve this

problem quickly

that prediction yeah by creating a new

token as we learned before from use this

create

token

go here

type again

delete me from the day of today

generate the token

copy it

refresh the page

now go back to

studio

um and do

git credits

set

pass it there

what do i want to do i want to

replace the one

and i want to

paste it now

so there was you know a token

and uh

i just um reset it

so i changed the one that we had before

and for a new one and now let's see if

the trick works

i didn't expect to need a token at all

for that uh call but it looks like

yeah i did oh but no actually

credentials to make sure that you give a

token is valid

um

[Music]

replace not sure what's going on really

so let's see

what

yeah i guess that this okay let's do

this locally my system here uh

okay that's the quickest solution i can

think of

so let's try

uh

vs

not sure really what

you know

issue

is happening there but the first thing i

want to do is to delete this token

because as i said before that spread

information

and

second i'm opening another

computer environment in this case is my

local computer environment here i do

have all the you know tokens and

everything set

so it should just work um

i'm going to open the file that we were

using as a guide

once again

and we're gonna scroll down to

okay here how to install packages to a

temporary directory so

let's see this

i expect it should work what i'm saying

here is i'm asking the pack package to

install packages into this temporary

directory and here it is working sorry i

couldn't figure out on the fly what was

the program and

and and then the second thing you need

to do is okay the package is installed

but

if i do package version

and i ask for rti data you will see that

it still detects the installed package

that is in the default library which as

we learned is the one that comes from

leave paths

which is this one here so it is not the

one that comes from temp there right so

how do we actually use the package from

template okay what we do need to do is

to use the same

in this case

library

r2dai data

but now the second argument again has to

be templar because we have to say from

where

we want the package to be

looked for so

now the package did work so if i do a

package version

again

i should expect

the well let me restart because the one

that was attached

uh so what i need to do is really is

detach

the other package so they attach the

r2dii data

package

this is kind of something that we rarely

do and now i do library that package

from

that temporary

from that temporary library still

maybe the package on

on github is also

uh

has also the that

version as opposed to the development

version that's really weird

well a lot of things not working as i

expected but the point i want to show is

that

you know you can

install packages in uh

maybe if i use i wonder if i used a

different function remote

ins

install packages install github

from to the grease

investing

r2dii data and we do this in temp there

i wonder if

this function um you know

maybe i'm trying to be too clever

well anyway as you can see

maybe the you know if anything these

highlights is the complexity of

extending our packages you know with me

having done this a million times i'm

still struggling to

um to make these points clear so let me

then work

say again

five minutes morning oh great thanks cj

i forgot to assign you as a time keeper

but lovely thank you you do that

okay let me walk through this then

theoretically uh because the demo is

an absolute disaster today um

so what we did is to you know what we

did is we installed

a package in a

temporary directory just you know using

the second argument to um

you know function like install the

packages

or you know package install

and library which all have that leave or

leave dot lock

argument the name is different but it

does the same

and then the final thing i want to show

is you know the another use case where

you want to have a project specific

library so the very

best way to do that is to use the

excellent package

rm

so with that let me go to my

let's see if i can show it here in the

other

here in this other environment let me

restart

so rm um

has

you of course you have to have it

installed and then it has a function

called init so that's all you need to do

uh to this to define a library that is

specific to your project it will add

a folder in your um

project

that is called rm and inside it you will

see this folder called um library

uh so it has done just now everything

that it needs to set it up uh and now

notice that if i do dot leave a path

which is the

function that we learned about today

notice that the very first um

path there which is as we learned the

one that is defined as the user library

the one is going to be used by default

when we install packages now it is out

has been set by rm to this path that

lives inside the project where i'm

working right now which is basically

this library here is the path to this

one here you can recognize the name of

it right now right here so now there's

nothing else that you need to do you

just continue to use your project

and and it will it will just you know

use packages from that specific project

specific library and the very last thing

uh i want to mention that i recorded um

a video about how to install uh packages

in a custom

um library that you defined in a

in a permanent way and the video

is on youtube um

and you are welcome to go and watch it

i'm not going to cover it here because i

first because it's very complex and

second because i don't think

it is a common enough use case that

deserves our time here instead i would

like to

go back to your faces and ask you if

we have any comments or questions

all right nothing apparently today

i apologize for the traumatic demo

sometimes it happens um i tried to buy a

few things on the fly but i was unable

um

but uh yeah that's real life i guess it

kind of demonstrates the point that

installing packages is not always as

easy it's getting better it's getting

better and i encourage you to

explore tools like

the new package pack or the rm package

all of those

have been designed to make our

experience installing packages better

and although it didn't work as i

expected today

for me um

in general you know my life as someone

who installed packages often has been

improved a lot

lately

anyway thanks a lot for joining us again

uh and next time i think we're gonna

have the last meet-up of this series um

about the book what they forgot to teach

you about art

thank you

ciao
