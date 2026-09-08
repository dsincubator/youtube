---
type: Video Transcript
title: "terminal. Running commands as administrator"
description: "Just one of the many things that you could install it's oh my zsh it's a it's an enhancer of your terminal it makes your terminal look pretty..."
resource: "https://www.youtube.com/watch?v=NuXgJtl9QDw"
tags: ["ds-incubator", "terminal", "git", "r-packages", "permissions"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=NuXgJtl9QDw"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2022-05-24T00:00:00Z"
    usage_count: 37
usage_window: { from: "2022-05-24T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

so welcome again to the ds incubator

today we are on the last meet up of the

series about working with the terminal

this meetup in particular complements

the previous one which was about working

a multi-level system from the

perspective of a normal user and today

we're going to be working in a

multi-level system

acting as the administrator now playing

the two roles really

there's a use case that motivates this

meet up which is the idea of installing

software which installing software

across the system is of course

an action that may impact multiple users

and that is something that only

administrators or people acting as

administrators can do

and so you have you have to have special

privileges for that this software i want

to be installing is just one of the many

things that you could install it's

called

oh my zsh it's a it's an enhancer of

your terminal it makes your terminal

look pretty as this one with colors with

the name of the branch where you're

standing if you're in a git repo with

some shortcuts to navigate your find

system with some aliases or many aliases

that are quite common so a lot of people

know about them

so a lot of great great stuff and so

usually you would go to a link like

install all my zsh and you know copy the

instructions which is basically copy

this and paste it but we're going to see

in a moment that life is not so simple

and that will expose precisely the topic

that i want to cover which is

the privileges to install things across

the system

specifically the objectives are to

understand what are the limits and the

powers of normal users versus

administrators

also that there is this command called

zuro which kind of stands for super user

doer

and that allows you to run commands as

administrators also the command apt get

which in many systems most servers

allow you to install software

and to understand how normal users

actually become

um administrators so what you know

what's the process for that

as usual the meet up

has a dedicated document in this case it

is

the last one here folder number five

uh install software and so i'm gonna

use this computer environment that i

have

here you can use it if you want you

don't have to by cloning the repo that

hosts this meetup then changing

directory into it and then running

docker composed up

so i'm going to move this to my right oh

you can see my whatsapp messages at the

background which you probably shouldn't

i'm going to open the terminal here

paste

what i got from there actually that will

print a bunch of outputs so i'm going to

do a minus d to detach the output from

the terminal so it doesn't clutter my

terminal and now i can move this to the

right make it a little smaller

and we're going to address the very

first question which is

what are the limits and powers of normal

users and administrators so the the

thing that i did there allows me now to

go to

a web browser and log in to that server

so let's make this bigger so the address

is this one so as a user of a multi-user

system i have a username it could be

mauro but in this system is rstudio i

have a password that the administrators

gave me or um you know they gave me and

then i changed because every user can

change their own password of course

and they should

so now i'm logged into this server so

this server the the front face of the

server is an art studio

session and which is intentional for you

you know to advertise in this audience

that working in a remote computer

doesn't have to be something scary you

know working from a remote computer

might mean for you something identical

to the experience that you have when you

work locally

but today the focus is not our studio it

is instead the terminal so let's go

there and i don't need anything other

than the terminal so i'm going to move

it here to the left

and held my notes to the right

so um

okay so we i touched on that a moment

ago the idea that if you're going to do

something like install software across

the system because there is

potential impact for multiple users then

a normal user would not be able to do

that you have to have super privileges

to be able to perform

actions that might affect

other users right beyond the scope of

your own privileges and so that is why

you know if you copy the instructions

that come from all my zsh and naively

paste them there

it would fail he would pay for

permissions but he also would fail for

something else you will see that first

so this address one

issue at the time

the first issue that we see here is that

this program that we are trying to

install requires another software that

is called zsh

because that is the software that this

tool enhances that we need to install

first so first we need to install then

that thing so we need to talk about

apt-get so apt

gets is something similar to if you are

another user to install the packages

right it is a function that allows you

to install software but then where the

software comes from you know if we go

back to the analogy of

our users the software might come from

you know the actual cran

repository or it might come from a

mirror of that repository that is hosted

by our studio or by the package manager

of our studio or by like a myriad of

other places so and there is

you know somewhere there is information

about which repository you want to use

and that is the case for r

same thing here for an entire system

there is a registry that has addresses

of different places where you might want

to install software and the best

practice is that every time you're going

to install any software

the first thing you do is you update

that registry that's always what you're

going to see

uh in in tutorials so that's why i

wanted to say that here so when i

naively try to run that that is the

first time we're going to see the

problem that is motivating the topic of

today so permission deny now is

giving us an indication that with the

privileges that we have as the user our

studio

we have no power to install this

software at least not in this way we may

be able to install it in a different

location one that we do have powers to

do whatever we want but not across the

entire system so okay let's get

to that

so how can we actually

do it well we need there's two ways or

at least two

actors that could do such a thing

one is the

administrator of the entire system which

is a user called root by convention in

every system

and so you may in some systems be the

root user and then

that command would have worked but if

not then there is another option there

are some users that may have belonged to

a group of users called zuro for super

user doers

and they act on behalf

of root so let me clear this up ctrl l

to clear the console so if i type groups

that groups is a command basically that

tells you to which group the user our

studio belongs so here we're seeing

three groups this the user studio

belongs to the group our studio as well

and every user does belong to their own

to a group that has their own name

also belongs to the group sudo which is

what we care about and belongs to

another group called staff but we don't

care about that so the fact that our

studio belongs to the group sudo means

that rstudio can type first the word

sudo which is a command and anything

that they type after that will be

run as if it was run by the

account root so to prove that i can run

the command who am i so you may remember

that i run that command a moment ago and

we got as output our studio so you may

hope that that's exactly what we're

gonna get and the answer is no we're

gonna get root because sudo the prefix

pseudo as a command makes any other

command be interpreted as is if it was

run by root right so now we we can do

this

you know use this new knowledge to do

something more interesting than just

printing the name of the user we can

actually use it

to run the command that the command that

failed before apt get update to update

the registry

of potential sources for packages let's

make this a little smaller and then

after that we are going to install the

software that we were told by the error

message that we needed to install which

is that

zsh program which is simply a terminal

similar to bash but it has

other features and this is the one that

oops sorry it didn't mean for that

that is the one that the software that

we instantly now works with so the

registry has been updated let me clear

this up

uh before i did ctrl l this time i just

typed clear which is the command that

does that

so now let me paste

with oops

sudo

apt

get install it looks like there was a

typo in apg as opposed to apt

apt-get install

i forgot to type the name

zsh which is the name of the software i

want to install

now i mistyped zoodle so

complicated let's clear this up one more

time suffer upgate

get install zsh so now that works

um

and we have uh to confirm that we want

to do what we want to do

and in a moment we're gonna get the

software and i'm going to be asked to um

also

i know actually you know we just

installed zsh so now we can actually

follow the instructions that we got from

from this page so we all finally go to

this point where we can just paste that

thing let's clear this up i'm going to

paste that

and that is the

the software

zsa all my zsh itself so already see how

beautiful the colors are at least i find

them beautiful and the terminal prompt

changed a little bit as you can see

and now um you know to demonstrate

a few very few of the features that you

can um you know

enjoy with all my zsh i'm going to show

you a little a little demo this is not

the focus of the meetup the meetup is

you know to learn about privileges and

users and stuff but still you know i

think this is pretty cool so as you know

you learned how to

install this software you might as well

learn what you're going to do with it

so first let me tomorrow i just want to

say 20 minutes thank you thanks

um i think i'm going to take up about

five minutes and then another five

minutes for questions

first thing i'm going to do because i'm

going to be using gideon moment so i'm

gonna tell you who i am so i saw i do

git config global user email and global

username

this is just configurations for git so

it knows who i am

and let me clear that up because that's

not super interesting and let's

initialize the repository and

let's call it abc

and now let's change directory to abc

and now you see something interesting we

see the name of the place where we're

standing which is pretty cool it's not

the default in many

terminals and also we see that we are a

negative rebel and we know the the

branch name we are by default in the

branch

called master

and

so

we could also create a new branch

usually you could do something like you

know git

say

check out minus b for branch and the

name of the branch say call it new but

all my zsh comes with a bunch of aliases

that are pretty common so you can do

something like git checkout branch

gcb and just the name of the branch and

that will create the branch and we

already moved to that one already

let's do a few more things so git status

short

gives you the status you can see that

the staging area and you know detected a

couple of files that are not being

tracked so we can add them to the

staging area with it at all

and now

gss will give us

that those files are have been added so

git commit add message

initialize

and you know that's the alias for git

commit at minus a you know git commit

yeah i and minus m for message like

anyway so just to to demonstrate that

there is a bunch of aliases that come

with with this terminal and the log

is also very pretty it tells you you

know the branches that you have with

different colors the user the how long

ago

the comic was made like really really

cool

okay so enough about well not enough

actually i can show you that for example

with tilda you immediately go to the

home directory without doing the cd

and okay that is all i wanted to show

you about

the demo of the tool that we have

installed and of the use case that we

use to motivate is this meetup but now

let's cover the last question which is

how do administrators gain their super

user powers and the answer is because

giving someone the the ability to

do something across the entire system is

something that affects potentially the

entire system then it makes sense that

the only and

the only users that can add other users

to the system and also to

the group of users that are privileged

to do anything

those users should be also super users

so the

first let's see who am i here in this

system i'm still our studio so let's do

a and sudos we need to add to use a

command to run a command that affects

the entire system that is the idea of

add a user

and we're going to add the user mauro in

this case so now we are asked to give a

password to mauro we may you know type

the temporary one give it

uh to the tomorrow and then hey mario

tell him tell them that they should

change it for

one that is

more secure then you can confirm a lot

of the information for the user and now

and the user manual could log in

as mauro and they have to enter the

password and now you can see that if i

type who am i now this is maura but by

default a normal user added by by a

super user the normal user will not

belong to the group

sudo it will just belong to the to the

group that has their own name so that

means that you know mauro can not do

sudo something let's do like at

get for example update right that will

fail but okay we can't enter the

password but still we fail because mauro

is not in the group of super users

but

they can exit you know that and log out

of the system

and now we are

our studio back again but r studio can

do sudo

av user mouldo but now also add them to

the group sudo so that is all that a

super user has to do

to transform another normal user into a

super user tour

so that's that's all they now

mauro could log into the system as man

will oops sorry

mauro

with their password and now mario does

belong to the group

zulu as you can see there meaning that

they can also do something like sudo apt

get

update or any command that you know

require super user privileges including

adding new users so that is to

demonstrate that command works and

that's all i want to cover so let's walk

very quickly through the takeaways

so first the administrators

can use the command sudo so

an administrator is

such

if they belong to the group sudo and

they can use the command sudo to run

system level commands and normal users

cannot

administrators can create new

administrators as i just showed you by

adding them to the group sudo

and in most servers

and many of your local computers if

you're running linux the command app

gets is what you want to install

software best practice is to always run

an update app get update and then update

app get installed on the name enable the

software and if you are not the root

user then you need to prefix this with

sudo otherwise you can just go with

without

all right that's it we still have four

minutes for

any comment if there is anything here

no i'm not surprised we have an audience

here of people with

a lot of experience in this um

but

um also i want to acknowledge that the

idea of multi-user systems and

particularly from the perspective of the

administrator is something that

not a lot of people

have experience on i include myself in

that and very recently um even well into

my my profession as a software developer

i didn't understand that very well

and and this meetup itself is great to

um

to learn myself

some of these concepts you know more

formally as opposed to just by doing

them

so with this i'm saying that you know if

if you found this super fast it it's

true it was super fast the meet ups in

general are more focused to people that

not administering other systems but for

completion i wanted to um

to core it and with this we just closed

the session that closed the series

and and next time we will come back with

some other

topic

if we don't have departing words then

i thank you all very much and see you

next

tomorrow thank you time

[Music]
