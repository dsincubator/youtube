---
type: Video Transcript
title: "Azure, RStudio server, and pins"
description: "On how to use our asura board from a nursery server actually and in particular we are using us to your server on the cloud but I'm gonna..."
resource: "https://www.youtube.com/watch?v=16Xn0ueeP-E"
tags: ["ds-incubator", "pins", "r-packages", "cloud", "azure"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=16Xn0ueeP-E"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2020-05-19T00:00:00Z"
    usage_count: 559
usage_window: { from: "2020-05-19T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

yeah yeah okay great so this is this

data science in this meeting I'll get

going just letting me know that this is

being recorded that a certain sink

waiter made up on how to use our asura

board from a nursery server actually and

in particular we are using us to your

server on the cloud but I'm gonna

explain basically what we are doing and

why the format today is a little

different so for those who are joining

now and the first thing that we will

need to do is to go to the link that you

see on screen and show you my screen so

it might be kind of under some of your

windows the link is here bitly DSi pin

as you're also Jackson share that link

on the chat and on slag I think so

that's the first thing and then once you

get there please sign in by just typing

your name here

and the reason we want that is because

this meetup is gonna have a different

format it's gonna be a little workshop

like a tiny taste for what the workshop

will be about master the tidy verse so

yeah today we're not gonna be talking

about master database but we are gonna

you know use the same format so that you

know you experience that format so

basically this is a collaborative

document everyone can edit this document

the first thing you need to do is to

sign in there and we use that to see how

many people is achieving the the little

tasks that we give you so today beyond

learning something I I wanted to mostly

share this system so that we get used to

it and we are kind of ready to hit the

ground running when we run the actual

workshop which by the way may have been

around in a month and half from now I'm

gonna share the like a link to vote when

we can when it's kind of works best for

everyone

as usual it's best to kind of keep

yourself muted and we're gonna be

interacting with with me

and with Jackson mostly on writing more

than one speaking

so you will see that the document has a

number of sections you can navigate

those sections from them here on the

left the document has you know the

outline view and depending on how much

you zoom in or out you will be able to

see that or not the goal of the Meetup

today is to try the system for managing

data that includes asura to store data

remotely also an art studio server which

in this case is going to be in our

studio an instance of our studio code

cloud and that you are married using

that server because in conversations

with Alex and with Taylor

they've reminded me that one way which

we could share and big files for example

without the need of reading them through

the internet it's just by using a server

like a nurse to your server instance

which we have now we kind of kilt it

because we haven't been using it but I

think I'm gonna revive it and also we

are gonna be using the pins package

which I presented before but now

interact with as well so that's the goal

of the amitabh today beyond presenting

you the system so the first you will see

that each section has a questions so if

anything is unclear in any section just

go ahead and there and type you know

what's your question there and for now

and I see that some people join a little

later and make sure you are on this

document you can access this doc by

going to this link and make sure that

you open our pseudo cloud with this link

here so I'm going to go to that project

on our street or cloud and the first

thing I would like you to do is to open

the file that says 0 0

intro our MD which is an introduction to

the system that we are going to use are

also like as an excuse an introduction

to our McNown many of you are already

familiar but mostly it's to get a hang

of you know what the workflow for the

meetup is so you know basically I

present an objective for a particular

lesson so this is the lesson about the

introduction to our markdown the check

that is to run an arm our town

chunk code chunk and so your work is to

navigate it down to line 21 and press

play here so that you can run the chunk

and you see the output here on the on

the other McDow so that's just an excuse

and when you're doing that when you're

done you go ahead and click yes soon and

we should see as many yeses as people

has sign in in the Google Doc and then

also as an exercise to try you know what

it feels to write a question in writing

other than verbally then also write just

anything like hi for example in the

relevant section of the document and so

you would be doing what I just did

click run here then you go to the

document you go to the relevant section

which is the intro and you just here in

question you say hi

and y'all so you soon click yes which

I'm gonna do right now so go ahead

I also timed activities I'm gonna give

only just one minute or less maybe 30

seconds because that's a fairly quick

exercise so please go ahead because it's

mostly not so much about learning are

magnets mostly to get a hang of you know

the system you know doing something then

immediately saying yes I have

accomplished the goal and then go into

the document and asking a question if

you have one so basically just

experience the workflow this is a

reminder when you're done click on the

participants button in the bottom of

zoom and there should be an option to

vote YES in the actual participants for

rather than rather than sending it in

the chart perfect

thanks Jackson good you're gonna get

practice this a few more times today so

usually the tasks done end when everyone

is ready we don't expect that everyone

will always do every task because you

know some tasks are more challenging

than others and some tasks are going to

take longer but that's the way fine

that's what I expect

it so we are done with a zero-zero so I

can close that file the next one is zero

one is set up on a board this is a

little bit more realistic and

challenging so the objective is for you

to have the setup that you need to

access a place where we store data sets

on asura

for now it's a kind of test as reward so

it's not super super super private we

are probably going to destroy that but

your task is to open in our studio log

cloud open your environment and you do

that with a function use this edit our

environ and then when you are done with

that you have what you see here on the

screen except that at the end this is a

fake password the real password I pasted

it on the chat so maybe so that it

doesn't show up on my screen I'm gonna

ask Jackson to paste it again on the

chat because I know that some people

join a little later so if you check some

seed copied and paste it again on the

same chat

so go ahead I'm gonna give you a minute

to D to do this and then I'm gonna show

it myself so if you don't accomplish

this that's fine you're gonna see it in

the minute from now and when you're done

as usually you know click YES on the

participants panel if you have any

questions of course us in the doc and

Jackson is monitoring the quakes the

questions so he's trying to answer live

and if he can't because he's busy with

something else you know later we're

gonna make sure every question gets

answered

we have another ten seconds to go and

I'm gonna to show you know how how to do

this this particular challenge so they

are environment file is a file that

usually you don't store in your project

which is a great idea if you are if you

need to kind of store some kind of

secret that cannot be say push to get

how in a public repo so what you do then

is you open that file and you can open

in many ways but the a very easy way to

do it is with function use these edit

our environment so you just run that

function that will open a file like the

one you see here and so what you see is

the code that I share with you on the on

the file here so I'm gonna show you what

this looks like

so for for Azeri they setup that you

need is just these three lines line 19

line 20 which are exactly like that on

line 22 which Jackson's share on the

chat so how that looks like it looks

like like this in your iron bar so you

just paste that code there this is a

series of key and value pairs and the

key here you will have to replace with

your real value I'm not showing it on

screen because this is being recorded

and it is the private private key so

with that setup you may you need to make

sure that the the fire ends with a new

line so there has to be a new line here

like line 5 for example is empty here

and then you can you know save the file

with a little disk icon you can close it

if you want and then you can register

you have to restart to restart for

example what I'm doing now is I'm

pressing shift ctrl f10 but you can also

do it as you would normally do it and

maybe here in session you go in restart

our and also it reminds you of the

keyboard shortcut yeah so that was AI

was a task and Jackson can you tell me

more or less how many people accomplish

the the task so we've got three or four

yeses so far in the great artist

five now great this is also gonna be

recorded so you can release later on

your own on your own time so this is

done so by the way I'm gonna show you

that you know we can collapse little

things here and also we have in our Mac

now we have you know outlines here that

we can use to navigate the document so

that's something that you may we know as

you become more familiar with our Mac

done that you may be using a lot today

but also in the in the workshop about

mastering the Tigers that's how we

navigate through the content and so you

accomplish that task great so we can now

close that file and we are now going to

work on the last file

it's called zero to use a zoo board and

here is kind of the outline the

objectives of this file or this section

of the lesson is to let me expand this

so it's kind of easier to see actually

what does this is one way but then the

other way would be to collapse things

like this and pressing shift alt and oh

and that collapses all the headings so

basically objectives are described in

the headings of each of these

subsections so the first thing we want

to do is to use the pins package to

register our as well as your board so we

have already set it up we now need to

tell this particular document this

particular session that's gonna be

running in the our map town file that we

want to use that board that we have set

up another objective is that we want to

find datasets that exists now in our

board and then we also want to get those

datasets or one of those datasets then

we want to create a processed version of

that raw data set angry and save it in

in our local cache a a my local here I

say quote local because you know with

the idea that the Taylor and Alice gave

me you know on our our studio server we

can share a gosh so if you create an

output from a processed data set that

output can also be accessed not only by

you but also by other P

which is great because people don't need

to recompute things they can build on

work that you have done before then we

are

if I'm going to show this for you we're

not going to do this as an exercise

you're gonna visualize the structure of

the cache that the server kind of hosts

but all that machinery is built by a

pins and you will see that in a moment I

know you're gonna reflect on some

takeaway so that's that's this lesson so

let me expand the first block and let's

see how we use pins to to start right

using it so the task is composed by two

steps when you want to use a package you

always need to do library and the name

of the package and then particularly how

you register a board is with the with a

specific function so pins the pins

package includes a number of functions

to register different boards and if you

want to register an asura board this is

the function that you need to cope with

no arguments so your task now is pretty

straightforward basically do the two

things that I say here on the section

that you see here so I'm gonna give a

minute and see how we go when you're

ready please say yes on the participants

tab that should produce no output I

believe if there's no errors or anything

that might go silent and that will still

be a sign that things work well again if

you have questions ask those questions

in the relevant section I'm gonna

actually navigate there to see how we're

going okay nothing

far so this is how we usually go with

Jackson we could be teaching a lesson

and if anyone has a question while the

activity is happening someone will try

on the fly to answer it usually the one

that is not talking but if you know we

can't answer the question on the fly

before the of the next break we do go on

and answer the question okay so the time

is out now and how many people did

accomplish this task Jackson there are

seven people great okay so that that's

straightforward of course we are going

to register the Azzurri exactly as I as

I described here at the top now we run

this and and we get no output which is a

sign that things work well so the next

section is more exciting it's actually

well what how do we know that there is

stuff in that board so that your task

now is to search for a data set with a

keyword empty cards you could also use

the keyword MTC or MT because it will

just try much pins by name or by

description so please use the function

there's three ways in which you can find

pins I'm gonna show it in a moment but

you can search in your earth with your

cloud interface for a tab called

connections and see if you can find it

there also there is usually an audience

here see if you can find your pins

through the audience and finally do it

programmatically here on the chunk so

I'm gonna give you two minutes for that

Jackson if people if you see everyone

finishing early just let me know and I

will stop

I have one one more minute to go I need

more than that

as you can see penis is very well

supported by our studio that's why there

is a tab that includes a visualization

of the penis

there is also an adenine and actually

our studio develops pins and that's why

it has such a great support for it which

suggests that it seems like a safe tool

to learn because it's gonna stay for it

for a while right even though they are

giving it so much support how are you

going Jackson okay okay I will start

kind of talking about the visual ways of

exploring pins as you can see in the

connection tabs there is there is pins

here you can see a bunch of of boards

packages always are there some packages

contain pins that are accessible there's

always a local door that ping will

create for you when you pin anything

outside it will also create a local

board and we are going to explore it

also and then there's everyone so that's

where you know I can see that the recent

packet data said column t cars and I

could also filter here so I could click

here on the icon to see what the data

said looks like so that's done I could

also find here a nodding called find

pins here it is and now similar

interface you know I can search

specifically in one boy

if I wanted say in the Azzurri board and

see what a packet would that says I have

here it is empty cars and then finally I

want to whoops sorry

I want to use the programmatic way of

doing it because this is how you could

do it in your code and it's probably the

one that it is more useful for you and

penis fine we'll just search database of

potential data set that you you can

access so the next section is about

getting that data pins has if the

function will get soap in get so now we

want to actually get that data set to do

something so imagine that you know you

are working you want to read from your

our session from your script from your

package a data set that lives on Azure

storage and how do you go about that

okay you use the function ping get we

are getting close to the end of the

amitabh so I'm gonna give only a few

seconds here it's kind of also

straightforward

let's run one minute and see how we go

basically what the hints that I'm giving

here is well the challenge here is to

use the function ping get with the name

and this name of the data set goes in

quotes because it's just like the name

of it it's not a variable it's the name

of the object and you have to say in

which bore you want to read that data

sets from so the board is Azeri as I

speak I'm gonna start completing the

task you want to find it use the

function team get and because I want to

say do something with that data set I'm

gonna just store it in my data and so if

I now run this chunk what I see is that

effectively I have read that data set

from my from a zoo and maybe it's really

from a local cache

because if you read already this data

said once pins is clear enough to create

a local copy so that next time is gonna

take no time so this is the last little

challenge here the first part of it is

to now modify that data set that we

called my data just to extract the first

few rows with head and then we are gonna

use that process of with this we are

kind of pretending that we are running a

very expensive computation on the data

set here is just running the head are

you can imagine this could be a process

that takes one hour to compute and then

you want to create a pin of the computed

data set and store it in your local

cache and again by local now is the

server cache because as Alex and Taylor

suggested we are going to use an art

studio server interface like the one we

are doing just to share the cache across

to the III users so let's give you a few

seconds to maybe set the seconds to give

it a go and then I'll do it because we

are a little short of time okay 30

seconds have passed

Jackson do we have any one completed

task there we go perfect so we are gonna

call these small data it's just the

imaginary name of my process data so

what we do is you know we just compute

something or my data store it in a new

object now it only has six rows as

opposed to the original rows were 32 I

think and now all we need to do to kind

of create a copy in our local cache

local again quote server-side cache

shared cache in the server if you

the function team so that's all we need

to do it produces an output but the pin

is there if you want to explore your

local cache then let's see that if we

now want to say in it in a different

script here actually there we go

so if we now say in a different session

actually I can restart my session if it

wanted and here if I want to search for

that there's many ways you already know

for example to search in your

connections in in local like in the

local array see that in the local pin

board you have small data so how could

you do it automatically if like this

with being find I'm running it because

you're ready use this function before

here it is data set it exists in your

local cache this is not in Azura this is

in your local cache and how could you

use it well with a function ping get

which you already know about again

anywhere in your you know in your

scripts you could get stepped in and

start using it right so this is the data

set and finally just for you to kind of

know where pins stores this stuff and

this is how you would create a path to

the pins cache this is what it looks

like in the case of our studio server

and there's your cloud it is store under

this is the home kind of directory of

the user in a folder called cache and in

pins you don't really need to know that

but I really wanted to show you if you

so let's just explore the tree of that

cash to see what what pins is doing

under the hood so there is a local cache

that things created automatically for us

here it's storing that data set that we

called small data and it's also storing

that the data in full as well because we

pinned it through the Azur and bore so

this is the structure it's just a bunch

of folders and a bunch of files that you

know bins gets dragged off so that's the

end of the of the lesson

on the end of the Meetup it's exactly

9:30

so they take aways I would like you to

type so in your time if you now need to

run to the to the data hell meeting then

don't do it now please focus on that

meeting but I would like you to leave to

go back to the document whenever you can

sometime later today I'm dry some

takeaways there is a section dedicated

to takeaways and also some questions

that you may have that we didn't have

time to discuss in person and and

finally I didn't include that but I will

add a section for feedback if you think

that this format works or won't work for

the master date Oliver's workshop then

give us some ideas about how we can

change this format to a way that will

suite you better so we thought I say

goodbye and I keep reading the document

to see what you have to say bye bye

Thank You Jackson Norris I'm gonna stop

recording now also in the meeting is

gonna stop anyways in the five minutes

great
