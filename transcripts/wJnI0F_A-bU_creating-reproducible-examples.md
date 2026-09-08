---
type: Video Transcript
title: "Creating reproducible examples"
description: "Is the data sensing we're about creating reproducible examples there is at least two ways that I know of in which we can create reducible examples and one..."
resource: "https://www.youtube.com/watch?v=wJnI0F_A-bU"
tags: ["ds-incubator", "reproducibility", "github", "r-packages", "workflow"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=wJnI0F_A-bU"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2019-12-10T00:00:00Z"
    usage_count: 13
usage_window: { from: "2019-12-10T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

here record to this computer so okay

thank you very much again for joining

this is the data sensing we're about

creating reproducible examples there is

at least two ways that I know of in

which we can create reducible examples

and one is with the replica package the

rubrics package is designed specifically

for this purpose and it has a very good

documentation about how to use it so the

very first link here for this whole list

of links at point places that you are

welcome to kind of visit on your own

time I'm read a bit more I'm going to

kind of go very quickly through some of

the key points like with you but then

you're gonna come back to this before

after so the first thing it kind of

shows was how you use the package is

extremely simple basically you copy the

code for which you want to create a

reproducible example so you highlight

you know copy and then you just run on

your console the red breaks function and

that's all you need to do and red bricks

will do two things one is will create a

very nicely render HTML preview so you

will see if you are using our studio in

your viewer panel you will see something

like this that includes the code also

the output with a little comment and

then the second thing that we'll do is

an invisible thing you will put on your

clipboard the same thing but with

markers for syntax so that you know you

can kind of copy this code and then you

can go to for example a new issue and

then you can paste that code into the

body of a new issue something like this

so that github will render it this way

and the reason why this is particularly

nice is because you know as someone who

wants to get help from someone else then

that someone else can look at the code

look at the output without running and

have a vague idea of what's going on and

if they need to run it they can just

simply copy this code and go to an art

console and paste it because their

comments are

allow you to run this code so this is

executable right so if I press enter now

what I get is the output that was

contributed by the contributor and then

my output so I can compare you know one

right next to each other so that's the

usage of the Eustace package as you can

see it's very simple of course you could

include any packages that you need to

kind of to demonstrate you also add any

data then you need to demonstrate but

I'm going to cover the data problem

specifically before I get to that I

would like to kind of discuss the this

vignette from the rubrics package that

discusses the do's and don'ts of

producible examples and so very quickly

about the data what they have to say is

that it is best to use the smallest

simplest and most built-in data possible

and that is because you know we assume

that you know what we want to have a

conversation about is about the code

sometimes it is about the data and in

that case you know maybe you do have to

use some kind of proprietary data but if

you can't get away without that if you

can't get away with a very boring simple

and common data set like iris or empty

cars then go for it because that way all

the copy did load for the person who's

trying to help you will not go in trying

to figure out the data will go to trying

to understand what is the problem with

the code so you might want to use you

know functions like hair or sample to

just get tiny bits of data that you want

to share and then there is a few other

strategies that I'm going to cover later

on this person attention also it's best

to just focus on this on the key

messages that you want to convey with

your code so just include only what is

strictly necessary and sometimes their

problems are you experience might be

beautiful for example something like

differences in package versions between

you and someone else and in that case it

might be useful to use the argument to

replication info if you set that to true

it will kind of produce a little nice

drop down menu thing that you can expand

to see what's the details of the session

information of the person who run that

code to create who created that producer

example then whitespace and styling is

important because you know it allows the

reader to understand better what you're

trying to do so you might want to use

the arguments that equals true to red

bricks and then in general just be nice

so if you know if I invite you to a

party to a dinner in my house it would

be considered rude you know you're

getting my kitchen and you throw away

food or that I know you change the

furniture from you know getting my bed

when I move the furniture that's gonna

see the route right so same thing

happens with the red brick so you are

asking for help you give people

something they so they can help you so

you couldn't change the helpers

environment you couldn't remove for

example things from the global

environment of your helper you wouldn't

change the working directory of your

helper and also because that won't work

so if you set the working directory to

something that you only have in your

computer that won't that won't be useful

also you know don't rewrite function

don't overwrite functions that are very

common like me nor see from catenae if

you need to do your own version of a

very common function then you know use

mean - C - or something like that so you

don't overwrite an existing one and then

a couple of more points if you just have

to change some global options then

restore them back at the end if you have

to write files then we let them at the

end and don't delete stuff that you

haven't created yourself

so yeah just that so to leverage to do

that sometimes you will need to play

with temporary files and temporary

directories and R has very good features

for that so you might want to see the

help life or temp file our tenth-year to

kind of learn how to do that so you can

write stuff but not to the users not to

the helpers environment or no to the

helpers filesystem just

right whatever you want to run right to

a temporary file and then remove it at

the end when you're done so true is we

all acknowledge this is a lot of work

but the work that you put into

developing a good reproducible example

will kind of come back to you as

benefits in two ways one because a lot

of the time you won't even need to

submit your ability for example in the

process of building that reproduce you

will example you will likely learn a lot

about your program I'm very often use

you saw your column before you share it

with others and then they did this more

a few times when you actually yeah you

still having fewer things out then you

will be in a much better position to get

help quickly by providing a reproducible

example that you know at a glance can

kind of communicate the problem that

you're trying to solve so finally let's

talk about you know how to create data

sets on the fly that you could use with

rubrics so here is a spreadsheet you can

select some a little bit of data from a

spreadsheet you can use they are in from

the data pasta package to create a table

so it text a text version of stuff that

you copy from observe the world so some

that you copy from Excel you can use

that data passed a package with a very

convenient add-in let me see it again so

here you know we are copying some rows

and columns from Excel then going to a

Deans paste as triple that is a nothing

that becomes available when you install

the data pasta package and and these

text now travels with your reproducible

example so now it's executable before it

wasn't before your data lived in excel

file now it is plain text included in

the reproducible examples so you can

share it if you already have data in

your environment imagine that you have a

data frame for example the wings data

frame let's imagine you have that okay

you can touch the data Buster Prem

this is what that looks like and then

you run that a pasta the function of the

pasta and they will print the text

associated so again that's you know how

to move stuff from either outside the

world or from inside our session how to

move that from there to claim text that

you can then include in your

reproducible example so that is all

ready to cover about the replicas

package but then there are situations

where you have to go beyond repressed

and you may need to resource to other

strategies and one that I use Anna

recommend is using armored tank files so

let's see what that might look like

so why sometimes replicas doesn't work

well in cases where you need to read

stuff from your computer for a moment

let's forget about this here here call

I'm going to mention this in the next

slide but imagine you need to read B in

this file your file dot CSV and so if

you want to do that with the rip X

package you will fail because threads

has creates a temporary by working

directory which is different from the

working directory where you are kind of

standing so that will fail in for an

error but with our background you can do

that you can you know reading your file

dot CSV as you would normally do you you

know store that output into it say I

don't recall data and then you can start

using it so let me now explain why I'm

rubbing my path here to my file with

here here the reason is because they are

md5 so our madam files and have I got a

weird notion of working directory so if

you go to our studio you will see this

neat button here if you go to the neat

directory item you will see that by

default our McCown documents think that

the working directory is the place where

the document lives so the document

directory and that is easy to kind of

catch you because most likely or not if

you are in sa our studio

prochik or if you are standing on in our

packet you would expect that the working

directory will be the project itself and

not the place where they are might on

file is so that is why you use here here

so the package here here allows you to

create paths whatever you adding here

and within the parentheses will extend

the path to your working directory

I'm the working directory is what you

normally expect so that's about it so

how you create another madam file well I

think most of you have already done this

but if you haven't you have you can go

to file in our studio the new file

another Mac down I particularly use a

lot a flavor of our markdown armored arm

comes in multiple flavors so the flavor

that I like the most is they github

document and you can get it if you go to

this menu and then you click from

template and then here on github

document and the kind of our Mac down

document that you will get will be very

easy to share nicely in and I'll show

you that in a moment

so the workflow the entire workflow to

create a reproducible example with our

mouths down would be as follows so you

first create a file as I show you in the

previous slide then you start gonna

write in your file and as you could

normally do in any kind of code base

file so for example here I'm say you

know using the radar package then I'm

using the reader package to read this

file

I remember here to use the here-here

package to avoid any problems with the

working directory

so I'm storing the output here in the

data object now I'm showing what the

data looks like and then here I do

whatever right so usually this the Jews

will you really want to demonstrate you

know it comes after you have read in

some data so here is the relevant code

for your reference so when you're done

you simply hit the neat bottom so

this button here click here click there

and that will produce an MD version of

your art empty file so you will now have

a new file called your file dot MD and

and then you simply commit as usual and

push as usual and and then you share the

link to the MD file on it so for example

I've been working for this presentation

on so this presentation leaps on file

and so when I've rendered that I have

created or neither has created for me an

MD version and here is the link to that

file so let me click here to see what it

looks like so as you can see one you can

see nothing get well soon there you go

so this is the file this is what it

looks like it looks pretty neat

it has links and all that kind of stuff

the code renders so you can see the code

and output but of course behind the hood

this is an MD file that was produced by

knitter and it looks kind of like source

code right but github is clear enough to

render that MD file in in a very nice

way yeah very very real friendly so

that's why I like it have documents very

much because I have to do nothing

special to get this beautiful HTML like

render version so yeah with that I end

everything I had for today yet so if if

there is any question please go ahead

hi Mauro this fries are actually our

internet connection was down for like of

five or six minutes to go through the

your document again but thank you for -

you're very welcome very welcome maybe

once sorry go ahead

yeah this close you mentioned the sample

function that is creating sample data

out like if I add the data effective

that basically say with this data frame

and create a center what is it doing is

it I can I also define that it

anonymizes things or it's just like

creating like randomly lines yeah they

function sample as is it creates just

samples randomly a number of vector but

if you use the function from the player

sample n you can say how many things you

want to sample sample file for example

so let's take the empty cars which is a

long data frame but if I attach deep

layer I can use the sample n function

and the number of things they tell me of

rows that I want to sample and

immediately I get a random sample of

five rows that will be probably the one

that you will be using most of the time

okay yeah and the one thing that I

forgot to tell you is how I use the

Ripper X package and replace all so

comes with a DS so you can you can

select code instead of running the

function of repres on the console you

can come to adings

I hit here on rubrics selection and that

will render the Ripper X for you as you

can see now or if we are very lazy like

me so I go here to tools modify keyboard

shortcuts type here red bricks and you

are okay or you link a keyboard shortcut

to the add-in so now I can then email

refresh everything here so I can select

any code I'm press in my case I set it

to be ctrl R and B which I'm pressing

right now sorry

controller P and that triggers the

adding render selection so that's a very

quick way of creating reputable examples

okay do we have any other question no

okay thank you very much

this was a very very topic that was very

much interested in sharing because it's

kind of a opens the door to kind of very

friendly communications about code you

know asking for help sometimes can be

intimidating I'm a very good way to kind

of start that conversation with your

potential helper in a very good way is

by providing them with a very easy to

digest example so as I was for example

developing this presentation I submitted

a pull request to they use this solid to

the Frederick's package because I

thought that was there you know it was

just a couple of emails and and also all

nice so but certainly you know if you

don't make the effort as someone who is

trying to get help if you don't make the

effort to make the life of your helper

easier you will probably get help but it

will take way longer so the easier you

make their lives

the faster the turnover will be so with

that I thank you very much and I look

forward to the next data science in

greater thank you morrow i won
