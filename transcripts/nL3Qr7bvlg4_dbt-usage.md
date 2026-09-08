---
type: Video Transcript
title: "dbt usage"
description: "[Music]  welcome back to the DS incubator in this  video we're going to be talking about  the basic usage of DBT we're going to be  talking about DBT run to exe"
resource: "https://www.youtube.com/watch?v=nL3Qr7bvlg4"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=nL3Qr7bvlg4"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

[Music]

welcome back to the DS incubator in this

video we're going to be talking about

the basic usage of DBT we're going to be

talking about DBT run to execute

Transformations DBT test to validate the

Integrity of the transformed data and

DBT docs generate and DBT docs serve to

generate and access the documentation of

the

database one way in which we can execute

those commands is in GitHub code spaces

which I set up in the previous video the

one just before this one if you already

did that you may still have that um kth

have code space still running so I'm

going to click on that to get access to

that environment this code space should

already have the DBT tool installed

along with the other little pieces of

software that are needed for this to

work so uh I'm not gonna explore too

much of what's going on is this is

mostly to give you an idea of the

experience as a user that you would have

running uh a project or managing a

project that uses DVP so here let's go

to a new

terminal and let's do just that so DBT

run if you don't have DBT then this will

fail and it will remind you to go back

to the prev previous video and see the

installation instructions so this worked

successfully and now we can do DVD

test this will validate that the data

has been transformed the way we want um

we are not covering here know how to WR

to write the tests but simply how to run

them and finally we want to explore the

documentation so first we need to do DBT

docs generate and then

we're going to do DBT docs

serve so generate will create files that

are then browsable on a web browser and

serve will serve those files as if they

were a website the static website I got

bring so before I hit uh I I run DVD

serve I wanted to show you the status of

this kit

reposter because the fact that you see

this file is here these folders listed

here shows that the structure of this

repository has changed so those commands

what have uh created is a number of

files and folders inside the directory

where you have your DVT project so uh

let's do a the ad to see more details

about

um all and now need status to see more

details about what has been added here

so we can see that there is a logs

folder that has been added and also a

Target folder that has been add we're

going to see that Target folder in the

next video where we go the structure of

a DBT project but to begin with you can

see that there is for example a an index

file which

typically are is associated to websites

uh so uh the next step for us now is to

serve the website where we can the

documentation so we're going to do DVT

serve sorry I forgot to do DVD doc

ser and that will open a web browser

here it is automatically where we get

access uh to the documentation in the

form of a website that's pretty cool so

here is my Hello World little project

I'm going to keep keep continuing

clicking there and here is some

information some details about about my

data and the source code that generated

or transform the data okay that's all

for now uh again um the the goal was to

Simply get familiarized with how to use

the most basic commands in DVD
