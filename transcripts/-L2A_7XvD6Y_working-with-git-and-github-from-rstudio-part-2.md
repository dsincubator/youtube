---
type: Video Transcript
title: "Working with Git and GitHub from RStudio (part 2)"
description: "This is a continuation of uh another video that where we were talking about working with kid and github from our studio the reason why i split is..."
resource: "https://www.youtube.com/watch?v=-L2A_7XvD6Y"
tags: ["ds-incubator", "github", "git", "pull-requests"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=-L2A_7XvD6Y"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2020-08-18T00:00:00Z"
    usage_count: 15
usage_window: { from: "2020-08-18T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

this is a continuation of uh

another video that where we were talking

about working with kid

and github from our studio the reason

why i split is because um it went

too long and i had to finish to respect

other people's

time but uh here is a little bit of what

i

i didn't have time to cover it's not a

lot so

the this document let me sorry for for

making you dizzy so this document here

is the one that

describes what we just did all the way

to the end now

and we didn't reach this these two

aspects here

and also i wanted to show you uh what

the

github document looks like on github so

um we have just created a pull request

submitted a pull request and with

changes to a file

that produces a um with the github

document armada

file that produces an md file as a

product

and i would like to show you you know

what the git history

looks like uh which we did cover in the

previous

um video but what we did encore is how

to kind of filter the

the history of the project at the level

of a directory or a file

so what we get by default when we open

the the little history panel

is a history of the entire project where

you can see the different

remotes that you have and in this case

you know from

the point where we created the branch

every commit that we did

but interesting you can of course select

different branches here

the branch that we have now is uh

probably this one is the one that we

care about and you can also select

directories so you could filter you know

just stuff

on uh that co2 setup

um directory as you can see there is

less information here because we have

subsetted the commits that touch

that directory and we could also do that

at the level of

file so we could say well changes to

only the file readme

and that's that's the one commit that

touched with me

or changes that touch this one

file here let's choose it and here is

the commit

so that's useful because sometimes you

just

want to understand changes that happen

to a specific file

and that's a very little known feature

of our studio at least one that

maybe not doesn't come every day and

therefore

by the time you need it you may have

forgotten it so as you can see here in

the

at the bottom of the history you get a

view of the diff so what changed

between you know the stakes before and

after of this file before in red and

after in green

and you can also let's go back to all

commits

yeah so if you click in changes you

would see the staging area so now the

safety area is clean

so there's nothing there to show but if

i click in history i get

uh you know a view of the history ads

and i you know remember the takeaway

from here is that you can filter

that history in a number of ways that

are

useful uh and finally i wanted to show

you

the let's close this panel

i want to show you what the md file

looks like

on github so this is the output

that uh we get locally we have discount

source

uh code and you know locally

you preview it in like an html um

version but the interesting bit is that

on github

that md file without actually we could

even remove this thing it doesn't

it doesn't matter because we're not even

dragging it on kit i showed that in the

previous video

but this file when we go to github and

remember we can do it

using this um icon which is a really

interesting feature of

um of our studio we can click in the

icon view that file so whatever file we

have

active now we can we appears here and we

can view that

on github directly and before i

submitted the pull request it sent me to

the main repo but now that i did submit

the request

it sends me to my fork which is cool

i can see now the md file so in the

directory that we are you have we have

it working there is the rmd

the rmd is not all that interesting

because it's all the source code without

the output

and the md and the md is a lot more

interesting and that's the reason why i

encourage you to use github document

is because you know you get the render

version something very similar to the

html version that i showed you before

uh but uh you know the you don't have to

produce the html because github

already renders the md as

an html so that's those uh were the

things that

i was i was missing from the previous

video and i wanted to show you

hey how to filter the history of a

remote

repository by a directory and by file

and how to um no well we did cover how

to view a file on github but basically

how

an md file renders us an html without

you having to actually

store html because if you do

uh it won't show anything useful it will

just show

the source code of the html and not the

render out

so that's it thank you very much and i

hope you have learned something

interesting here
