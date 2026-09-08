---
type: Video Transcript
title: "dbt installation"
description: "[Music]  in this video we're going to be  installing DBT in a GitHub code space I  choose gith code space because it allows  us to very quickly access an enviro"
resource: "https://www.youtube.com/watch?v=QxgEn2fwIOk"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=QxgEn2fwIOk"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

[Music]

in this video we're going to be

installing DBT in a GitHub code space I

choose gith code space because it allows

us to very quickly access an environment

where this type of installations

installation instructions will work

without contamin our own development

environment so let's copy that code and

let's go to one GitHub code space you

can access that by going for example to

the repo where I'm hosting this uh

series of uh videos this is DS inator

DVT you'll see a green button there it

says code space and you can hit here on

create code space on the main branch of

this

repo everyone has uh some free time to

use um GitHub code spaces it takes a

little a little while and then you'll be

dumped into a vs code editor and here

you have a terminal after a little bit

you will be able to paste the code just

there that we copied from the

installation instructions actually you

can click on the file if you did go to

the repo that I showed you here you will

have the installation instructions you

can you know copy one by one if you want

or just copy the whole thing and paste

it right there I'm going to do that what

this is going to be doing is while you

know I paste this and it runs I'm going

to be explaining a little bit of what

that command does let's bace everything

there so first we're going to be

installing Python and also pip and then

we use pip to install DBT core which is

the essential piece of software U

about of which you know this these

tutorials are about and uh then we're

going to be using pip again to install

what's called a database adapter so that

is a piece of software that knows the

details of particular database in this

case that TV and connects it to DBT core

I'm choosing D TV because it is a very

simple database it's very cool if you

want to actually use it for for real

usage but particularly cool for this

example because it requires almost no

configuration and you can run something

uh without having an account in any kind

of cloud uh database provider okay so um

let's see now let's run the pep install.

TP in case I didn't run before and that

should be it so now we can try verifying

with um DBT version to see if that D

install and there we are we have DBT

installed next we are going to be

talking a little bit about the basic

usage and later we're going to be

talking about the structure of the DVT

project
