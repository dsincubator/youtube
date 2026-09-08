---
type: Video Transcript
title: "How to download a file from google drive into your R IDE"
description: "[Music]  in this video I would like to talk about  how to download a file that you have in  your drive say that you have a file in  drive and the file is pretty"
resource: "https://www.youtube.com/watch?v=iNWBG3x4QVc"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=iNWBG3x4QVc"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

[Music]

in this video I would like to talk about

how to download a file that you have in

your drive say that you have a file in

drive and the file is pretty pretty

large and you would typically go to

those you know dot dot dot uh icons and

click on download but what would that do

that will download it inside your laptop

your computer but in this case I want to

download it inside a an our environment

that is running in a server so let me

show you what that looks like so I had

to First create a secure connection to

that

server uh and now if I do a Docker yes I

can see here is my my little container

so you can see that uh the uh the

address where I'm going to find my know

this is running R Studio server on on

this uh remote computer computer and

this is the port where I'm going to find

my little my little computer and uh also

how I got there is with uh the the ipv4

address of of my server so that means

that I need to here first pass all that

stuff that came you know that I used to

in my SSH call and here is the port so

obviously this is not this is not a a

normal environment right it's not in

your laptop so if if you download the

file after waiting for how many how many

minutes you need to wait to download you

know the how you know however big is

your file the file will not land where

you want and then you have you could

need to kind of upload it again into

your server maybe you know from the

files interface uh with the upload

bottle would be one way but you know

that moves the file from your drive to

your laptop and then from your laptop to

your server so that's way too much know

waste of of Internet Resources so the

point is you know how can you move that

file from your drive straight into that

remote little computer and the answer

there there are many but you know one

way is with the amazing Google Drive uh

our package by I think it's by Jenny

Bryan I guess pretty sure it's it's her

uh so if you look into the argument of

the uh so first you know if you go to

the reference you can find the download

uh Drive the drive download f

um H file and in the argument you'll see

that file could be a bunch of things

including U an ID so how do you get that

ID and and then you can pass it into

this little as ID helper now so here is

how so you have your file again you know

you go to your um to wherever you go get

your share options and here you can you

know copy the link and if you paste that

in the browser you will see that it has

a structor where there is this weird

number right here so this is your ID

right so this is what we need now I

already copied that into my clipboard so

I come here to my our session and here

is the uh ID that I pasted so following

the head file that I just showed you is

super straightforward you just you know

call uh you load um attach your Google

Drive package right then create that

file uh you know passing your ID to the

as ID Little Helper and then just call

Drive download into that right so in

this case it's going to fail because I

already did it so if you look into my

terminal here is my downloaded file and

you can see that is as as big as it was

on my drive so in this case it's not

huge and it did take only like a

fraction of a second to download from

drive into my server but when I tried to

do that into my laptop it was taking

forever because I'm right now uh in a

very weak internet connection so it made

no sense for me to you know move that

fight around all the internet just to

get it where I want it to be so I hope

this uh this helps you know this um

little trick Sav me many times and I

hope you it saves you sometime too
