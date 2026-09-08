---
type: Video Transcript
title: "A systematic debugging workflow"
description: "in this video I'm going to show a  systematic approach to exploring a  potential P so I see a report someone  sends me a snapshot of a screenshot of  some code "
resource: "https://www.youtube.com/watch?v=AUIJif93OJA"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=AUIJif93OJA"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

in this video I'm going to show a

systematic approach to exploring a

potential P so I see a report someone

sends me a snapshot of a screenshot of

some code with an error so um let's

explore uh I see a version number I see

the name of the function that causes the

problem and I know where the function uh

comes from in which package it lives so

let's look for the function profile

emissions in the package that I know um

and um let's see also if this version

number is the last uh number on the

package so I go to that package called

indicator after uh I go to the reference

section I see the function profile um

emissions here and I also see that the

version number is the latest what I

don't know if if it's the person

installing this bagage has a system with

all the kind newer dependencies so the

best thing we can probably do

is know we're going to try run this code

here but also we can try install the

package in a completely fresh

environment and so this is uh the

installation instructions for um this

package uh and the best place I can use

to try this out um would be a fully

isolated environment right one

environment that doesn't have um

Potential contaminations from other um

sources so in this case I'm using a

posit Cloud um

computer right so this is completely

free service you can go to posit cloud

and from there uh you can create a new

project so how you do that um you know

in the workspace you go to new project

and then you choose if you have a

template or in this case I did new art

studio project you can also get source

code from GitHub if if that's what you

need to do um let's go back one step to

the project that I had just created this

is like fully empty

and uh what I'm going to do is try base

those instructions I think it's going to

fail because uh you know we need to

install T tools first if you want this

to to work and if we don't have the

tools here let's see then I would

probably install a different package

instead so that's right so I don't have

the dev tools and it's fine I can um you

know install Dev tools but instead what

I want to do is install pack which is

another package that um has a function

that allows me to install

um this so I'm going to do pack pack and

this function will know what to do so

it's kind of equivalent but it does

things in a way there a little smarter

and the interface is really nice it's

already downloading very quickly a bunch

of packages uh that are um required and

I'm going to P here the video so it's

not so long for

you okay that took a about a minute um

it's complete so what I'm going to do is

just create a new file here uh and when

I'm going to I just installed the

package um and I want to load it so I'm

going to do

library indicator is called indicator

after bit of a weird name and now I'm

going to paste the code that comes from

the h file that I'm I'm interested in um

running so go to the example section

let's copy that code there and place it

here um let's see looks good so this

second part is not important to me uh

because I want to focus on this specific

function here um all right yeah let's

let's just do

that um just going to attach a bunch of

packages I don't care much about the

seat here I don't care about the

options um just printing things a little

bit because so if I remove the C I don't

need with r

um just to keep things simple you know

um there you go so let's run that well

to make things even simpler so what I

want to do is just this right this could

be enough okay let's see how that

goes all right we get output so we did

not reproduce the bro so this indic case

to me that um the problem is not in the

maybe in this specific version of the

package because this version is the one

that uh the

person uh share with me let's confirm

that right yes but in other dependencies

of that package so one thing we could do

so let's see if we have rep breaks

here we don't so we can use the package

red

breakes uh to create a reproducible

example of what we have here so the way

it works is basically you call

rrex

rrex H and if you have multiple lines of

code which in this case I do have you

just bace everything in in

raises um and there you go I mean once

you install the package you will also

have here an add in that allows you to

highlight the code and um just create

repx um so it could be an alternative so

in this case I'm going to U run the

code and this will create a file uh with

a URL right so this URL is a local URL

so it's basically a file uh inside this

this system but also what what it

created is this

beautiful uh code that I can paste

anywhere for example in a gist so let's

do let's go to my gist my gist uh

mod.com and create a gist of that um so

new

gist let's call it

repx of til

indicator

after MD for a markdown I want to paste

that there if I do a preview you know I

can show you the code here so the beauty

of this is that I can share the code

um through a URL through a link right

something that I can post could be even

a secret G it doesn't have to be public

um well maybe yeah because secret means

that people that have the link will be

able to see it so with this URL I can

now start a conversation with a person

that um that uh share me sent to me that

that back report and not also I can do

that but I can also share the the

project this is super important I can um

share the the full environment where I

noticed that there is no back as far as

I can tell so we can kind of continue

the

conversation uh to see um you know which

dependencies uh must uh be updated so

for these two to run so in

this fresh

Environ me okay so um sorry I can proce

your bug in

fresh

enironment uh do you need to

update

your

packages okay that could be a maybe not

the the most um evoc

expressive message but enough to to get

the conversation all right that's my

systematic approach to starting a

conversation about um the discovery of

the B
