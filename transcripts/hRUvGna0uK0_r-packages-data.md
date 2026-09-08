---
type: Video Transcript
title: "R packages: Data"
description: "okay then I'll start recording so the  idea of today's video is to continue  with working with our packages rather  now whether you want to build your own  pack"
resource: "https://www.youtube.com/watch?v=hRUvGna0uK0"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=hRUvGna0uK0"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

okay then I'll start recording so the

idea of today's video is to continue

with working with our packages rather

now whether you want to build your own

packages or you want to contribute to

someone else's packages it is important

you know you know what's the structure

what tools are your disposal so that you

can you know build package contribute by

which is efficient so today we are going

to be focusing on data so the the

meet-up of today is associated to issue

number 24 of the science innovator and

it is based on the book chapter external

data from the book our packages so

basically we are we trying to cover

these three dot points which the chapter

expands on but mostly I'm gonna be

covering the first one which is you know

how to you know make datasets available

to the users of the package there are

other ways in which you may want to

include data in a package that is not

directly to be used by users so for

example if your functions in a package

meet data but it doesn't need to be

exposed to users you would put the data

somewhere else and that's item number

two and or if you want to share like the

raw state of it other side like a CSV

file or an excel file that goes

somewhere else as well but you know

given that we have a short time for

these sessions I'm gonna be focusing on

the main place where we work with data

and if there is any time when we can

discuss the other uses but it's they're

a bit more rare so I think it with the

first we're good to go so what I've done

is basically extracted the most relevant

information from that book chapter and

unmei like a little example for each of

the different kinds of data users that

you might be interested and so even if

we can't cover everything today this

chapter the chapter India data science

equator website associated today's video

you should have some like a digest of

the book chapter and if you're

interested anymore of course you go to

the book chapter and so then you know to

begin with up you're gonna be working

here in our studio cloud in our data

science enjoyed a workspace simply

because there we have all the kind of

developer tools available to us so for

example if I do on here on the console

if I do library then tools you know that

should be a better way so if you don't

have the tools your computer you can

either you study data science inquiry

workspace so today Claire's trying to

join is there are concerns here so I

think that the link would be the one

here yes so I'm gonna on the chat if I

need your chat yeah so if you can share

that link with her it is also in the

culinary out of the day so in the

meantime I'm gonna clean the depression

working on to kind of the bare bones to

show first first of all one check that

you know if you are contributing into a

package so for now forget about this

file here if you're contributing to a

package one of the first things you

could do you know once you get the

source of that package and is to run

some checks to make sure you know what's

the you know the beginning state so you

can

go to the beetle tab and run a check and

see you know what up won't you get so if

something is broken in the package then

you really know you're starting from

broken package and if something if

nothing is broken then anything that is

broken by you you need you know you

should trying to fix it before you you

make your submission so for example

right now I've run the checks and I

notice that is one warning it's about a

license that is missing a license file

so you know it's not related to this

particular topic but I could use the

function from useless I could use use

license say maybe MIT license and that

should be good to go okay so say that we

are now kind of decided we're ready to

actually a license needs the name like

mine here so I'm now again running

checks okay so say that I want to share

with the users in the first few rows of

the data set empty we are familiar with

we want to share a short version of that

and we decided to call it mini NT cars

it will be tempted to say create a

folder create called data and inside

there so you know this this line here

number two what it did it create this

folder here so maybe in that folder then

you want to put the data set that you

just created so you could use you know

the reader function right CSV to place

you know a CSV file inside data so if we

now go to the folder data you see that

the CSV file is there I mean in a normal

straight style of development you could

you know try again you will ask your

users to add to access the data from

there with something like like green are

real

and the name of the path where the forum

is but that's something that you don't

do in our package and I'll package that

is go to the folder data but in a

different way so right now you know

after I added a license before the

chicks are I'm gonna run the chicks

again and now after adding the folder

data and see what happens

okay I get a warning now that I have

added the folder data and I delete file

there and let's see what that is it is

saying that okay the reason it took a

file undocumented or shake old empty

cars okay so it's the package is not

realizing that we have added some data

it is kind of nudging us to add some

documentation to it so there's a few

things we need to do how do we go about

that okay the first thing we need to

know is that usually this line is that

you know we did here the first three

lines you know they are dealing with

getting the access the data from the

ultimate source and preparing it should

be recorded somewhere in the package and

where you can do that okay you could do

that in a data folder called raw data

bro so how you so you can create it

manually but it is I strongly don't

recommend it because there are a few

other things that you need to do so

instead what I recommend is to use a

function from the useless package use

data row and that function as you know

that from says not only adds the folder

data row but also adds that folded to a

file called build ignore for the moment

it's not very important to know what

that does but you know like in in the

gist of that is that it tells the

process that builds our packages to

can't ignore that folder and you know

the checks that you would normally do

will then work as you could normally

expect so the first thing you need to do

is then to add that folder by the

function you

a rope and inside that folder as a

template you get this file called data

set dot R in reality you should change

its name to the name of your data set so

my data set is called mini empty cars so

change the name to that and now here I

could paste the code that I know I need

to you know get the data from the source

and to prepare it and here I would say

what's the source you know if if you got

it from some website would say in this

case I got it

source is the data set empty cars so

there is a package in are called data

sets and it contains the data empty car

so to demonstrate that I'm gonna paste

it here on the console so if you want to

know more about that data so you can do

question mark Indy cars that is it's

empty cars and you could have all the

information okay so this code stays in

the package it's just not kind of

obvious it's not facing the user it's

just facing the developers but

developers should you know whoever

maintains this package where the status

that came from this line doesn't go now

we have to remove it because we are not

going to study data that way actually

what I'm going to do right now to avoid

confusion is to go to the data folder

and remove the file that I created when

I was you know pretending that this was

a script but it's not is it packaged so

now the data folder is completely empty

and I could even remove it actually just

remove it just to show what's going to

happen in just a moment so this line is

also not needed because we got the data

from the data set from the package data

set so we already have the data here

empty cars and now the next thing we

need to do is to pass that data set that

we just created the meaning that is it

here notice how the name of the file

matches the name of the data set that we

created and that we are

going to export exports means that this

data set is going to go it's a face the

user so now I'm going to run line three

interactively and what it's doing is

creating the folder data that I had

removed to kind of show exactly this I'm

it's saving an object called empty cars

inside the folder data and it's already

compressing it in the you know are

specific format RTF and that's we are

getting close to to the end of this

presentation so I'm gonna go try speed

up a little bit so what I'm doing now is

loading the package by doing their tools

don't all that's something that we saw

the other time the previous I think and

so that means that our data said mini

empty cut should be available for usage

just to you know show again what I've

just done I'm gonna restart the session

so now with the session for started if I

call the name meaning empty cars I

should not get it I should get an error

because the package they did object is

not loaded in my session so how would I

learn it okay with shift control L or by

running the flow oh they're every object

in my package is now available for me to

use including the object meaning and

keypad so now it is available so in a

package where we want to use the objects

that live inside that package you know

we can reuse the post mode or that's

before we export the data but how you

you know before we stole the package but

once the package is install and you can

install the package click install and

red star what that will do is it will

transform that source code that we are

working with as developers we will

install it in our system so some in a

different folder in a bomb kind of

compressed format somewhere else that

package will be stored so that now you

know the users of your package maybe

yourself or someone else can simply call

library and the name

your package and then the package itself

should contain the object that you have

just exported as you can see now now the

baggage demo contains the object mini

empty cars so you could use it here in

you know it could be the data object for

any of your fractions okay so the one

thing that I want to kind of show before

I open it for questions is the next step

so the next step is to document that

data set and where it would you document

that data set okay so you document in

the folder art so you can use the

function use our with the name of your

data set to create an art file inside

our folder that is called exactly as

your data set and right there what you

could do is quotes and the name of your

data set because sorry that is the

option that you want to document and the

minimum piece of information that you

could say you need to say in oxygen

comments so this pound sign and the

tilde is oxygen comment you have to say

write a little title something like a

copy of first few rows and maybe you

would like to use some of the tax the

proxy can provide to document things

including for example the source tab

where you would say from data sets if

you use square brackets that will be

transformed into a link so that the

person who reads your documentation will

click there I will be sent to that

documentation so I'm going to now click

here first I'm going to document so with

a function the tools document and click

here install and rest up so after you do

that I can use the function you know

Afghan unloading the package I could use

the function question mark and the name

of our data set

and we should now get access to the

documentation that we have just okay

that is the minimum that you need to

know about how to work with data and how

to add a new data set to a package and

then it's going to be up to a maintainer

to maybe you know ask you to little

things but with this this is the minimum

that you should know - hopefully deposit

checks okay so here we have a little

warning that has nothing to do with our

data so we have done with mini empty

cars is that compliant okay it was a lot

it was fast apologize for that but this

is like crucial because everything else

we do with in a package specifically in

our organization relies strongly on data

so it's crucial to know how to deal with

it okay what questions do we have to

clarify this is just for use with

packages because I mean this looks like

a cool thing that I could implement in

my code that is not a package that is

meant to be going in the direction of

being a package yeah absolutely

it actually works one really good use of

packages is to package that up so you

know you know we face that problem of

you know trying to access data sets my

computer and then I want to share with

someone else or I so what options

particularly if that is are a huge is to

create a package that only contains data

so they already in your dev tools

provides you with tools that once you I

know this is kind of a little difficult

to digest at first but once you become

familiar with it and they book you know

our priorities explains all just say you

know it's fairly easy to add to create a

little package for yourself at your

personal package like on things just

that

and you can just you know the library

and the name of the package that you

just created and you will have available

or the datasets that you want including

the documentation which is which is

great because no any other question and

people happy you see data in

contributions to packages that I have

managed so that's great

hopefully this will kind of make it

transparent what what happens under the

hood see the process of building the

package so you may have to just send

data and then you know you see that the

data becomes part of the package without

knowing the details of how it works but

I'm ready for you as a contributor but

it could be important to know is that

you know now the the package contains

that many empty cars datasets so you may

create a new function called F and maybe

that function you know needs that data

set inside so you can just call it and

without doing anything you don't need to

do you use loathe you don't need to use

real you don't need to do anything

because the function is already sorry

the data set is already inside your

pocket so it's available this object now

lives in fact if you want to be explicit

you could do something like demo right

so this could be you know you could call

this data and then do not apply our

filter data where something like this

and your function f should do something

should filter in a rows where seriously

less than three obviously there's

nothing there you go so you know I just

create a function that uses my data set

and I haven't used your low that haven't

used

anything any function to read because if

the packet already has that object

available it kind of leaves a system

where a global a global viable inside

the package it's not exposed to the user

only via the column column notation

because it's inside this is the

namespace of the package is that clear

any questions about that because I have

seen uses of you know load or things

like that anything ends that I could

clarify about that okay then nothing we

can wrap it up and the other cases that

I can mention are way more rare and so

it's not crucial for you to know you

know how to do that if you're interested

you have the information and also you

can extend by reading the original so

next time I think we're going to be

talking about you know functions and

testing so okay if there's no more

questions then call it done and see you

next time thank you goodbye
