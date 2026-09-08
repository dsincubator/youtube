---
type: Video Transcript
title: "Reusing your usethis setup across multiple rstudio.cloud projects"
description: "To set rcu cloud to use uh the github workflow fork and clone and basically what we want to do is to set up the use this package..."
resource: "https://www.youtube.com/watch?v=A_Q6nmUhcGA"
tags: ["ds-incubator", "cloud", "github", "git", "pull-requests"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=A_Q6nmUhcGA"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2020-08-11T00:00:00Z"
    usage_count: 31
usage_window: { from: "2020-08-11T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

in this video i want to show how to set

up

rcu cloud to use uh the github workflow

fork and clone and basically what we

want to do is to set up

the use this package if you're

interested in following along and seeing

the code that i'll be working with

you can come to this link and you will

find this document here so the very

first thing we want to do

is to create a new our studio project

where

we are going to be hosting basically

uh not just one but many projects

the reason why we want to do that is

because you know setting things up uh

is a little bit of take some effort as

you will see in this video

and we want to reuse that effort in

multiple projects that's kind of a

different

model than the approach that you would

use

the approach that is usual in our studio

cloud

where each project is you know one

standalone thing and if you want to

configure approach you need to do it

every time you create a new project but

we're going to kind of hack the system a

little bit

to create one project where we can or

you know

to create one to set up you know one our

studio cloud process where we can

set we can reduce that those settings

to work with multiple uh art studio

projects

so now this is where kind of the model

breaks

and and there is one our studio club

project that hosts

many r studio approaches generally the

mapping is one to one one of three

project

generally lives inside one our studio

cloud project but now we're going to be

doing

a different thing we're going to be kind

of hacking the system a little bit

to create a single rstudio cloud project

uh configure it correctly to work

fluently with use this

and inside it to nest a bunch of

our studio projects so the

sorry here step one let's go ahead and

create a new

project i'm gonna call this project home

because um basically all the uh our

studio projects that are gonna be hosted

within this our studio cloud project

are going to end up in the home

directory of

our studio cloud but that you will see

close closer to the end of this tutorial

so i'm going to

click here and call this home but you

can call it whatever really

and then the next step is to use these

packages

so use these and devtools

i'm going to run that and this is going

to start fairly quickly because now

our studio cloud uses um

install packages from from binary so it

should it should work

pretty quickly but in the meantime i'm

gonna

uh come here and explain what we're

gonna be doing next

so the next thing is to um

configure our um environment

to use use these in every interactive

session so that we don't need

to run the function library every time

they won't use this

and here i i want to make a little pause

to explain the relationship between

these two packages

once upon a time devtools was the only

package any crew

grew and then some functions that lived

in devtools were

extracted into this other package called

use this but still the tools

makes every functioning use this

available

and so the tools is in itself a package

and at the same time a meta package

because it also makes available

functions from other packages so what

we're going to be doing next is we're

going to be um

first we're going to attach devtools

just that you know we get access to this

function

and then the function dev use step tools

will just make

all of the tools available in every

interactive session including of course

every uh function in the use dispatch so

let's just copy this here and paste it

there let's see how this is going

should be close to the end

there we go and we're gonna paste that

code we're gonna do library the tools

use the tools and that opens this

file special file called our profile

where we need to

copy paste so basically every time this

interactive functions

they give you some instructions so

include the code

here inside the um

our profile so we copy paste it

and that will make them tools available

in every interactive session

and you know once we do that we need to

you know we can close a file

and we restart

this r right so you can also do it with

shift ctrl f10

you need to restart r for that to take

effect the next step

well here i wanted to show you a little

bit uh what's the situation of our

configuration

so far um our configuration is pretty

empty right now

as you can see for example git doesn't

even know our name and email and there

is a bunch of other things are unsaid

like for example they

have token and that's exactly what we're

gonna be doing in the rest of the

tutorial

so the first thing i want to do is to

set up

a git giving our name

an email and it is not any email it is

the email that is associated to our

github account

so here um you know the example uh

in my case i type

and the email that i'm gonna be using is

one that is attached to

to the github account that i'm going to

be using for this demo

so these are my credentials i run this

function

you may have done this on the terminal

before but use this provides this helper

that allows you to um to do it without

determinant just from r

so let's do another situation report and

now you see that my user and

my name and email for git is already

configured we still need to work on

personal token

so let's do that because for now uh

there is no way yet to uh for for use

this

to do stuff on our behalf on github

because it doesn't have

that token that key so let's run that

function

browse github token and that sends us to

gingham

here uh you can change the name that you

see here you're creating a

like a special password thing and

and usually you know you do you could do

uh

you could give it a name that is

descriptive for the the platform that

you are configuring

uh so i'm going to use the date of today

and our

studio cloud github path

because you will end up with many tokens

for different computers and different

environments

all the checks here are okay you just

need to click generate token

and you're good to go and then copy this

password here and this

is the password the only reason why i'm

showing this to you

is because i'm going to destroy it after

the demo but it's private information

you shouldn't share it with anyone you

just go to our studio cloud

and follow the instructions that you get

you got when you run

browse github token so the first thing

that function did is to send

us to github where we you know created a

token and we copied it to our clipboard

but then the second step here is to call

the func to call the function edit our

environment so it's gonna be

that

environment right with no argument we

just run that function this file opens

up

and now we have to type it have part

equals so this is what i'm doing i'm

following this instruction

github equals and now we paste

the password that we have and then make

sure that you end up the file with

uh a new line here right so you have to

have an empty line here

you can close the file then and restart

your session you have to

sort of save the file restart with uh in

this case i press i'm pressing shift

ctrl f10

you must restart right i'm doing it

twice because it's critical

and uh i mean one time should just

official i'm just a bit paranoid

and and then the next step is to start

actually so we you who we can celebrate

because we have achieved the

configuration that we wanted we are now

ready to use

very cool features from the use this

package that allow

us to work with the github flow in a

very easy way we don't need to kind of

set up things

uh anymore it's always you know use this

is gonna do a lot of the heavy lifting

for us

so let's clean this up and let's reflect

for a moment

uh on where we are so we are here on

cloud project which is just one

folder within uh the rstudio cloud

computer that i was given when i created

this home

project but um i'm going to be

first pasting that code oh so this funky

um quotation mark comes from probably

typing that on

on word uh

the alignment is not that important but

i wanted to demonstrate that you know

what we're going to be doing now

is when i create from github a github

a git repository that comes from

this owner the owner two degrees

investing and the repository is called

demo one

and we want to store

that repository in a destination

directory which is

the home directory of this uh rstudio

cloud computer

that we were giving and we are asking um

the function to please fork

the repository this is usually not

necessary if you don't have permissions

to push into the master branch of that

particular repository but it's kind of

nice to

make it explicit so what i'm doing and

even if i have privileges to push into

this particular repo

with for equals true i will be asking it

to create a fork first

into my user account and then i clone

from there

and where should i place that for that

clone well here in the

home directory so after doing this you

know we're gonna leave this

location in our studio cloud and we're

gonna end up in the home directory of

uh of this computer so i'm gonna run

that

um and now uh the the process

holds for a moment and asks us to

confirm which of these two protocols we

want to use

uh i'm gonna say two https

if you don't know what this means just

go for number two for https

and if you do know and you do have an

ssh

key then you may go with that one but

that is

beyond the scope of this tutorial so

just go for https which is one that

i recommend particularly for the first

steps uh continue with that

uh here is asking me if for the project

that i'm about to abandon if i wanted to

save

the r data file and say don't save i

don't care about that project at all

so as you can see our studio cloud is

you know closing that project and

reopening in a different location where

well until that demo right in the the

place where i asked it

to place demo tilla is the home

directory so as you can see here it's

kind of more explicit home

demo one so now we are

at this uh project that we just

forked and cloned from github it is a

git repo as you can see

and it has you know when it has used

this

clone this repo added a file called git

ignore

i also added a file called demo one r

studio project

uh so those two files are yet

kind of unknown to these um git

um to this kids repository

so the one thing we can do actually to

prove

that the setup is ready for put requests

is you know we could push a pull request

to this repository asking

to include these two files so we are not

gonna work from master

no no no uh on the github flow you work

with

a branch so you do pr

we are in it using use this the function

pr

need my cool or initialize let's call it

meaningful

initialize our studio

project this is the name of my branch

as you can see now the branch here is no

longer master it is called

initializer studio project and now we

are ready to create a commit

we can select those files click one box

that will check everyone

everything hit commit

it's a nice repo create a commit

but this is still on our studio cloud

and i want to push it

to github right so i want to submit a

pull request

asking the owners to of the report to

incorporate the changes that i have just

done locally

via a pull request i don't have the push

buttons available but that's no problem

because

use this is telling me that the next

thing i can do is run the function pr

push

and that is gonna create uh or it's

gonna send me uh to the place where i

can create a pull request so

the browser has just opened i'm now on

the owner's

repo and the two degrees investing

organization

demo one repo and as you can see this

interface allows me to confirm that

yes the branch that contains the changes

that i want to

submit is this one here initializer

studio project

from the uh from this repository

at my user account and i want to propose

those changes to be included in the

master branch of

the repository with the same name but in

the owner's organization that is

usually referred to as upstream here is

my

my commit which adds those couples files

actually just click there to explore

them

here these ch to change two files

changed the git ignore and the

approach the rstudio project file so

let's go one step back

create the pull request and hit here to

actually

do it so with that we finished the

the tutorial uh i have shown you how you

can configure

the uh like a home directory

into your r studio cloud computer where

you can nest

uh as you know you kind of should behave

as

your local computer does so now i have

one r studio project inside this

studio cloud project so now you know

with this model i'm kind of detaching

the um this idea of our studio cloud

project and our studio

project so there's to your cloud project

that i have just configured

has all the settings that i'd like to

work comfortably with

uh use this and uh it is one

a big r studio cloud project within

which i'm gonna start you know

forking and cloning a bunch of other

projects so for example i could do

a create from github another

repo something like 2 degrees

testing demo so this is demo one and i'm

gonna do demo so this is a completely

different repository

and i'm gonna put it where in the same

place right here at the home

uh and i'm gonna say fork equals

true and same thing that i did before

i'm going to say i want to use the

https protocol this is doing all the

heavy lifting for me

is closing that project opening another

one and as you can see if i navigate

so here know i landed into this

particular repository which i could

you know now again you know initialize a

pull request and start working with it

but what i wanted to show you is that if

i go you know to the parent to the home

directory

now here i have you know two

repositories demo and demo one

so this is the idea where you know we

have a kind of a little bit of a hack

uh done a little bit of hack to use uh

the home directory of their studio cloud

computer that we were given when we

created the the project

so we're going to use that home as a

place to store all our studio projects

and they all are going to share the

configurations they use

this setup that we kind of took care of

doing so with that thank you very much

for joining me i see you next time
