---
type: Video Transcript
title: "Comparing remote setup “Ours” versus \"Fork (of ours)\""
description: "excellent cool so  welcome then everyone to the ds equator  about working with remotes  uh and in particular we're going to be  talking about the  setup that is"
resource: "https://www.youtube.com/watch?v=OFjlPa7Uqeo"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=OFjlPa7Uqeo"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

excellent cool so

welcome then everyone to the ds equator

about working with remotes

uh and in particular we're going to be

talking about the

setup that is referred to as ours

the name comes from the book having it

with r and it is nice that they haven't

given a name to different setups so it's

a kind of easier to communicate

and the focus is going to be kind of

comparing

this setup that is simpler to the setup

that i have been kind of

generally recommending which is the fork

and clone setup

and it's called fork of hours so the

objectives of today is to compare those

two setups also to understand what this

simpler setup

it looks like and then discuss some of

the pros and cons

and there is where probably i will need

more of the help of alex because uh

i use the the setup that i'm going to be

talking about today

relatively less than the workflow that i

involves forks so maybe someone with

more experience with these setups

may understand more of the nuances of it

and we are going to also going to show

how to switch from one to the other and

that that is a task that i do

often because depending on what i do

sometimes i do need

one setup or the other so visually

this is what the two setups look like

before we have been working with this

one here on the right

that use this calls this fork

of ours it is fork because

uh you know on your user account you

have

a fork of the original repository and

the owner of the repository is not

you it's your organization for example

you work for in this case two degrees

and because we are all members of the

organization we could

request access to push commits to

the upstream repository to the main

repository

and therefore there is connections to

everything so from your local repository

here at the bottom right

you could push commits either to your

origin to your own user account or to

your

upstream so that is for example they

have setup that i use it is more complex

but it of course

gives you a lot of power and flexibility

and then on the left hand side is there

is a simpler

setup where you don't even bother

creating a fork

of the main repository into your account

so you just push and pull

from that one repository and that's

totally fine and sometimes that's the

only way i can do some things

and so this image here

shows the output of a function

in r that comes from the useless package

that is called git c

rep we have shown this um

function before it lists a few things in

relation to key to github and so on but

in particular i wanted to highlight

the the differences in terms of your

readiness to create pull requests so

both of them uh support the approach

where you create a pull request for any

change that you want to submit to

repository

so the forking that's nothing it doesn't

mean that

that the fact that in one of them you do

not fork it doesn't mean that you don't

create a branch so you always

create a branch and you always submit a

pull request and someone should review

that

request before it's merged but on the

left i'm sorry for the

very dim colors here uh what i'm showing

is you know the output of

uh the hours setup

and that shows that i have a remote

called origin

exactly as the image showed before and

it is pointing to the two degrees

investing in this case

the repository called demo and then i

can push so that confirms what the image

that i showed before

does so and it's also saying that there

is no such a remote as

upstream okay so let's go back to the

image

exactly this setup so there is one

origin there is no upstream

and i can push to this repository

and to the right we have the other

approach that i have shown in previous

meetings where i have an origin i have

an app stream the origin points to my

user account

and the upstream points to the in this

case

two degrees and i can i can push 22

degrees so i can push to upstream

uh and the origin has been forked from

the two degrees investing

so this is just in code showing

or confirming locally my repository you

know what setup i'm using

at any given time we still haven't

discussed

why you could use one or the other and

that's i think a question that daisy

wrote

the other day and i need the help of

alex to to kind of explain

more about the setup that we're talking

today

so both setups again i highlight that

work with

uh you know we encourage you to work

with branches uh do not you know work on

master

and and encourage reviews of those

requests

there is a little bit of information

here probably too much to read so i

condensed that in a table

and this is mostly for your quick

reference so when you're a little lost

and you want to review okay what was

each of them um doing

uh so this i think summarize it well so

if you're using the use this package

with you can you can create both setups

with a function create from github

uh the only difference is that you have

to pass the argument

for equal false to get the hours set up

and you say four equals true this should

be a

lowercase to get the uh

fork of ours it makes sense and in terms

of the branches so your master branch

in your local repository will be you

know track what's called tracking it

means that where it's gonna be like

pulley pushing commits and and pulling

commits from

uh it's going to be tracking the master

branch on the origin remote because it's

the only

remote that you have when you have the

setup that we are talking about today

the hours

so master locally tracks the name with

the same

the branch with the same name on the on

the remote origin because that's the

only one

and compared to the other approach where

your local master branch does not track

your

abstract your origin master branch

instead it tracks

the changes that are happening on

upstream and maybe this is a little bit

technical but

uh you know it has to be documented

somewhere so you can come back to it

later

and all of these things are happening

automatically if you use

the uh you know the function from the

use this package and if you don't then

it is even more important to understand

the details because you have to set that

up manually

when you create pull requests so you

have a new branch in this case let's

pretend that it's called pr branch then

your local branch on your r studio or

whatever you're working

will be tracking in the um

simpler setup we'll be tracking the only

remote that is available or so there you

know there's going to be a corresponding

branch on origin and that is what's

going to be tracking

and in the case of the fork approach it

is also going to be tracking your origin

because you first push to your fork

and then you should beat the request to

upstream from your fork

again i acknowledge that this is this is

technical but you might need this as a

reference in the

future and this is the bit where i'll

kind of shut up and let

alex explain a little bit what he sees

as the pros and cons of of these

setups so please alex go ahead and help

me

maybe so i can cover this

uh

so

[Music]

so

uh

uh

so

crazy

uh

hmm

uh

uh

cool thanks a lot

so

okay so i think uh the sole fact that

within the same organization

uh i mean different teams choose one or

the other it's just an expression that

you know as far as you

as long as you know one understands what

you're doing and uh

you can find the right tool for the

right job as they say

and the only issue with that is that

when for those who are not super

interested in these kind of technical

details

it's kind of uh pretty overwhelming to

say hey you have all these trillion

options i said well so what do you

recommend right what should i do

so i guess that the answer to that is

like let's talk about it

and uh i'm here to help so if anyone is

is wondering

um i mean if you have an opinion and and

can have good arguments for it then go

for it

and that's the purpose of this kind of

discussion so that everyone is uh

you know has the resources or links to

the resources

to learn more uh but then you know if

you are if you are unsure just check

check with us and we will try to

recommend something that works

for your scenario do you have a question

here i wanted to cover uh

a little bit of um how to switch from

one to the other

and then um the aspects of safety

that make uh working with any of these

two

uh yeah safe so but the pause here do we

have any question based on

what we have covered so far

hmm

uh

yeah i i am i offer

in the workshop actually we're going to

be putting this in practice and it's

going to be totally up to you if you

want to

if you really want to practice this

there's going to be lots of opportunity

and if you don't care about you know

github flows and stuff like that you can

just focus on

you know learning the tigers for example

but i will be

um encouraging you to practice because

this is

the kind of thing that it's it doesn't

become natural until you do it a million

times

uh yeah and and by presenting you with

the tools that abstract of these details

i also give you a set the same interface

that so you know for you as a scenario

analyst

it should be the same to work with one

or the other so it's just a matter of

setup it's just that argument that you

set for

if you use ucs for example the change is

just changing that argument

and you know one setup will be magically

happening or the other

and and then you know the way you work

is is very very similar and i want you

know to experience

you to experience that tomorrow uh on

wednesday and thursday

but then the risk of you know this

magical thing

is that when something does go wrong and

with git and github

always something goes wrong is that it's

important to at least

know where to go for more information i

don't

i this is not fun i i know it and and no

one that

you know is doing analysis should spend

too much time on this

so just know that this information is

here you know where to come back you

know who to contact

and but the experience for you as an

analyst should be through it

and that's what i'm going to be you know

striving to do tomorrow and the day

after

showing you that once things are set up

even if you don't care about the details

it should be more or less

pleasant and it should just work the

challenges are more human challenges are

the ones that alex

highlighted so the practices that make

uh

that that you know you know computers

will do what they do but many

you know we humans may make wrong

decisions

and that's what i wanted to cover next

so what what

the basic things that i know of that we

could put in place to work safely and

maybe alex knows a bit more about that

so there is here information about how

to switch

from one setup to the other in r and

also in the terminal so i'm not gonna

spend any time on that

and in terms of safety as far as i know

there is two levels one is the

permission level or

the repository which you know the

organization so two degrees has set

the the base role for anyone who joins

organization

to any new repository the base role is

the lowest that you can have which is

read

which is the safety measure so that you

can't create

harm unless someone changes the

permission

your permissions on one repository to

actually say push to master right

of course if you create the repository

you will be an owner of that repository

you will have permissions to do anything

but if you are invited to a new project

by someone else in their two-digit

organization by default you shouldn't be

able to create harm

and it should be someone giving you

permissions to push to master

and only then any any mistake could be

um

difficult to undo but in any case we are

working with git

which means that almost anything that

you do isn't doable

it's just that it's gonna take someone

who knows about git

right uh also i want to highlight that

as far as i understand owners can

override pretty much every rule

so that's one issue that we need to kind

of also solve that i think that we have

too many owners

in the two degrees organization like

people like me i don't know if i should

have

privileges to remove everything you know

so maybe not likely no and i do so

that's something that you know evolved

that way and

and finally protection rules so by

default when you create a

repository as far as i experienced it

myself the repository comes

with the master branch unprotected

meaning that you can

basically change the history of the of

everyone's repository and create a lot

of conflicts

and the best thing as far as the

understanding is to protect the master

branch

at least to avoid forced pushes so with

that i will leave the last couple of

minutes to alex to expand

on on safety and anything that that

you know i said that was wrong or could

be uh complimented

uh

ah

ugh

do you mean this uh this uh i mean the

the fact that by default when you

protect the branch

force pushes are not allowed or do you

mean anything else that i have mean i

may have missed like this this kind of

protection you mean

right cool

yes

hello

yeah yeah point

okay i think that also brings us to to

the end so we need to play a wrap up

um anyone here wants to i'm sorry alice

i carry you in there

in the middle of something go ahead

me

okay thank you very much everyone here

um hopefully this will

be also uh useful for anyone who watches

the recording

uh later okay thank you very much

and for those who for those who come

tomorrow to the workshop um my

recommendation is to work from anywhere

that you have a reliable internet

connection and that might not be the

berlin office

um uh yeah that's it and have a look at

the

tide ads repo which has some information

for setting things up thank you

bye
