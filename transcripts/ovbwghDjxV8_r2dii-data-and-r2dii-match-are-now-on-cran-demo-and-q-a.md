---
type: Video Transcript
title: "r2dii.data and r2dii.match are now on CRAN: Demo and Q&A"
description: "wait yes I can I can record now so we  actually recording the Meetup go ahead  okay  so hello everybody  we have Mauro and Jax and I have talked  about her deci"
resource: "https://www.youtube.com/watch?v=ovbwghDjxV8"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=ovbwghDjxV8"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

wait yes I can I can record now so we

actually recording the Meetup go ahead

okay

so hello everybody

we have Mauro and Jax and I have talked

about her decided to beacon is coding

helpdesk program or whatever you want to

call it and basically we want to set

aside each each of us a set aside to 30

hour or 30 minute blocks per week where

we put it in our calendar that this is

time we're doing the helpdesk and we

would like if other people an

organization would like to sign up for

those times and do a kind of like live

coding session with us and the idea

would be that maybe you have a real

problem or something that you're

actually trying to figure out on your

own and you'd like to do a session with

us and work on it together

so hopefully this mites well one reason

off whatever probably we're working with

but we thought it'd also be a cool way

to encourage more like interaction and

get used to each other's coding styles

and its type of things so it's kind of

an experiment but we'll see how this

goes hopefully some of you try it out we

all three of us already have these

events in our calendars so you can see

on Jackson's screen here that there's a

coding help desk repository on github

which has some instructions about how to

use it but basically if you go into your

Google Calendar and you you in the other

calendars section you add Morrow and

Jackson and my calendar and then you

click the checkbox on it then you should

be able to see our events and we have

our incident Thank You Jackson

I only see Jackson's where Jackson's

Tuesdays where are yours Jackson can you

it can you click on mine okay here's

mine so for instance on yeah I don't

know why it's don't see everything here

they are so I have to help Dex sessions

on Thursday so if you wanted to do this

with me then you come and look at my

calendar I will always be on Thursdays

Mara's will always be on Wednesday such

actions or are always on Tuesdays at

least for the time being yeah and if you

want to schedule this time if you see

that this block is here then you can add

an event on the same time and just

invite me and then I'll I'll accept the

event and delete this like time block

holder from my calendar and yeah then

we'll meet over slack and we can or you

can share your screen with us and we can

talk about whatever problem you're

having or and it doesn't necessarily

have to be a big problem that you're

working on either if it's something you

want to talk about if you in general

like to use

yeah that's hi dr package and you want

some support or some ideas about how to

use it just generally we'd be happy to

do that as well so use it forever you

know whatever purpose you think is

useful or if you're just lonely I think

especially it could be helpful so we get

questions often it's helpful to Rica

moments where you can just go go over

one on one and then inform oh I'm sorry

it might be helpful to more general

discussions I'm not yeah so I'm so

taking it too seriously please use it

please try to use it because we think

it'll be interesting and fun and yeah

keep us connected and keep us learning

from each other so try it out but yeah

more on the help desk maybe next week or

as we

see if people are using it or not if

that's the favorite piece of gym so we

now have officially two packages

published on cran

one only which is a great item and worth

kind of having a discussion about and

what I want to do today was just kind of

highlight what those two packages are

how to find them how to install them how

to use them how to suggest that they

should have more features and kind of

contribute to the next release to cran

when that time comes and yeah I'm just

trying to go over that process in

general so the two packages that are

published are two di data and are two di

match and these are kind of the first

two packages underneath the art we di

suite which is the name of that we do

decide to use English all over the TV

our packages and so I wanted to

highlight first how do we find out what

we already have so how do you know that

might be difficult to just know what

these functions that exist are know what

they do no way to find them so the

website it's important to kind of keep

an eye on is this main art we di package

website so essentially this is going to

be this wrapper for all of the RTI

packages that we write and it's going to

kind of include this entire RTI

infrastructure just a half under one

umbrella and in particular under this

news tab you can see our release notes

for various package releases and so if

you click on this we see oh look our to

depart to di match was published our

publishing is available on cran and this

is how you can install it and this is

how you can move it we haven't fully

finished finish bumpy's these news

articles but this is kind of going to be

a place where if you don't if you're not

necessarily a confession decoding

channel you can still see the progress

that's being made with the suite of

tools same thing for data here

those this is a good table to see for

kind of if the packages released if

there's an important extra package that

add some some new functionality that's

really important and also potentially

some kind of simple examples of how we

use common functions within the package

but we also have is this reference tab

which is going to have a global

reference of every object in all of the

our TDI packages and so this you can use

to say alright I want to match financial

portfolios of my material these are the

functions that currently exist in our

TDI cheapest and if you click on this

question mark it takes you to the

documentation for that function I'm very

bad bad packages website so we now are

at the RTD I match this package website

and we have essentially this is just

this is just the function documentation

it's the same thing we pull up from the

art studio console which is on packaged

own website so I'll let you kind of go

through this this our TDI reference tab

on your own and kind of have a look at

what's available bearing in mind that

this is not our GDI is not fully

polished yet positi-- as a meta package

it's just kind of a good branch don't

have a look over a kind of umbrella I

don't have a look at before you got

intended a packages so to see the actual

cran publications I have links here and

I'll post all of this on the PSP

they have repository but just to have a

look and confirm to yourself our TDI

data and I forget matched both present

unfriend and we're going to be including

our URLs to our websites respectively

for these packages but this is the first

release of these packages and as I had

before these are this is the same links

to the actual package documentation

websites so they have it's kind of a

standard way of document

in our package online but they'll have

quick installation tips for how to

install the package as well as a very

very thick bones example and then a more

in-depth get started section which tries

to really highlight all of the

functionality of a package vanilla and

easy to understand and read through

right so I'll let you guys also read the

details of these pages at your leisure

but what I wanted to go through first is

essentially I I just set up an art

studio session that kind of highlights

most of the functionality that I think

is especially useful in the first

release of both these packages and I'm

just gonna kind of blaze through a demo

of it right now and I'll include the

Sprint's that run for this demo as well

and as a skater at github and you guys

couldn't go through it again on your own

and prove yourself the packages

installed everything works as you expect

so and everyone see my screen okay I

should have I thought maybe a little bit

earlier program fool okay antastic

and is it is it big enough I think it

would be nice but if it's doing

uncomfortable to you and it should be

fine so we have two packages in that are

currently that have been released and so

I'm just gonna kind of go through this

go through the motions of using those

packages right off the bat if you guys

have any questions feel free to

interrupt them just ask me so it's just

loaded packages and you can install

since these are kind of published and

now actually even up Windows binaries

available for installation wrote easily

so you can actually now install these

packages as you would any other package

from ours by calling installed on

packages and the package

RTI is now installed and just to prove

yourself that these packages load as

you'd expect today they turn out to get

much I would expect it to load so I want

to look at our TDI data first and just

kind of give you guys an idea of what

the purpose of it is and how it might be

useful to you and also have how you may

suggest other things to be included in

it that makes it more useful to you so

the idea behind our TDI data is to have

a public-facing package but contains all

of the template data sets that are

necessary to do most to the eye analysis

tasks but since it's public facing will

have all the data and all of the fields

be completely synthetic and completely

fake and so this allows two things this

is this fake day that can allow for

demonstration purpose for demonstration

purposes which allow it to be feet

become clear to potentially external

parties or even internal parties how to

use each of the functions that we have

and the other useful purpose of this is

to be used for for actually writing

tests so to have consistent

demonstration data that you can bet use

five times to make sure that things are

as you expect and I mean even if you

don't actually use the tenth of them or

did it in this exactly for your tests

which is some spliced version of it it's

still helpful to have kind of a starting

point where you know exactly what this

data frame should be platform at it does

so with our TDI data loaded right there

the first thing I'm gonna call is this

function data dictionary in Bangkok so

maybe I can just type in the console

over here R to the I theta

I'm calling to see all the objects that

are available in its package you can

have a look at those separately but this

data dictionary file is helpful metadata

file and box that's quickly call

documentation up through so by calling

question mark package name : : depiction

area um I was able to cut out this

documentation file for his data son

so what data dictionary is is a data set

that provides a metadata about all data

sets in the package are two di data so

before kind of explaining that let's

just have a look and see what I mean so

this data set is kind of in campaign

capsule it's all at our to di data has

to offer and it includes data set names

so he'll be demo itself it itself is in

fact the data set within the package ISO

classification is such that all of these

are just names of all the individual

data sets all of the column names within

each of those data sets the type of each

of those fields within my dataset and

then a brief definition of what that

mean to say it's so for instance LD time

sub data which I said data was quoting

database this is how cool to kind of

ensure that that each column name is

consistent and ECR is also actually

describing what you'd expect it to

describe and not some other random field

that you know that conflicting name is

gonna file for instance if everything

was just called name and every data said

you might not know exactly what that

name refers to so it's helpful to have

concise definitions for all of those

data frames now that's this data

dictionary meta object we can have a

look also at an individual data frame

and again let's take a look at the

documentation first we can always call

it documentation for any of our data

side scuse me question mark package name

colon colon 1 with demo or also I mean

conversely you don't have to specify the

names base package so you can just call

question mark alone book demo if the

package is loaded I just like the

explosiveness of identifying the

namespace

so looks like a look at this one book

demo and I mean it's probably exactly

what you expect financial portfolios

it's a fake long book it's a fake

corporate bond or a corporate debt loan

book and it's what I'm using to develop

II Bank software and to both the the

next tests as I move forward so let's

have a look at this data side we don't

have to go through it necessarily and

call them by column but I mean it just

includes things that you might expect

ideal own microphone take her name alone

take her etcetera etcetera

yeah I mean I'm not gonna go and go over

and call them I call them right except

it's a fake phone book and just maybe to

highlight also that this

if you filter the data dictionary for

data set equals Lombok demo you can then

see all the column names that are going

to be present in that demo and you can

do this for any data set if you're

curious about what specifically the each

each column name fits in these demo data

sets actually represents and what was

intended by the media developer when

they when they wrote that so we have we

have this this kind of a clump or did it

you can you can save it as a lump of as

an object in the global environment I

mean obviously I'm not gonna go to an

art tutorial but you can even save all

of these data sets as objects in the

global environment we also have a a LD

LD demo demo data set so this is a

completely synthetic that made up random

numbers it's a completely synthetic data

set that you can use for testing your

code and posting new features that

you're writing without having to use

real data from Taylor thank you single

time so did that helps I don't know

beyond that in art CGI data we have this

classification bridges so I mean I'm not

gonna get into detail but these fridges

essentially a bridge from the I said

classification standards to the eyes

classification standard and we also have

this meta file that has all all sector

classifications that we currently have

purchase for so it just had some that

you have a little less than ten minutes

ahead okay good well that's enough for

data so the idea behind data is not

necessarily that's extremely useful on

its own I mean it's just it's a lot of

time or they decide stop hold for

looking at what I mean that may not come

into your life directly the real

purpose for it is that it helps in

developing the all of the later

infrastructure because we're in the

rapid so when we write kind of more the

rest of the analysis workflow or the

matching process or any other process

the 2d I includes in its analysis it's

easy it's nicely it will always refer

back to this arch of this data package

and always have a data frame that's

going to be consistent and something

that you you expect so to kind of show

what I mean by this

I'm gonna load the matching library and

so I'm sorry it's gonna check

so I'm gonna load up this this RTI Maps

package and now in the same ways before

there's not there is documentation for

the entire package so you can pull up

the documentation for the package itself

I'm going to push my car to get match

and this gives this kind of description

overall in front of what this package

into achieve so it's this is really just

fuzzy name matching for the for the

bank's word but in principle it's going

to be extended to all of the matching

that we do between financial portfolios

and physical assets so we can actually

we can run through a quick a quick demo

to show how easy it is to actually come

up the matching so by calling our TDI

data here I'm actually I'm saving these

demo data sets into my global

environment so I now have loan book and

Al D which are these demo datasets from

the last package we also are going to

need this come up in that explain why

for now and let's have a look at this

function match name so this is another

function one of any one the main

functions its present in this match

package and where does this matches a

loan book and acid level data set by the

name underscore star columns and so what

that means is I mean you can read

through the description yourself but

essentially it runs present

an algorithm between all names but they

said that are formatted using this name

underscore star system so your name

underscore direct lending or name

underscore parent name underscore

ultimate parent and and it compares

those against names that are in a

passive level data side so I'm not gonna

keep explaining but I mean to actually

run this matching it's as simple as

calling match name you say I heard yeah

match name with the loan book and a of

the arguments I haven't typed here but

you guys know what it means it's just

just find match name on these two you

two objects so it takes me about a

second 30 seconds to run and now that's

the entire thanks for the matching

process is almost complete essentially

so we can have a look if you want I mean

it's not the interesting columns are

kind of at the end here this is the

original name that was in the in the one

book this is the name that's in our

asset level data and this is the score

of the match so you can see a lot of

these are her scores of one aasta.martin

aasta.martin what if you sort from the

bottom you can see obviously and we

either cement and American cement or not

matches and they both have the word

cement in them but they're not

necessarily good not just and so I mean

you have to go through and many valid it

is before I get maybe too far into but

there's also I just ran the matching in

with the regular arguments but we also

have this bisector blood my sector is

only going to try and match between

entities that are in the same sector

across both datasets so if you have our

company and one dataset and oil and gas

company in the data so even though the

names might be identical it's not gonna

find those matches if by sector equals

true and you can read through the

documentation for the recipes documents

at your leisure but it's all it's all

talk wasn't yeah

directions sorry just Kate's not that

you have about four minutes

if you can leave some beautiful question

study great yeah maybe I'll maybe I'll

leave this now I mean you guys did it

there's kind of examples of how to use

of the argument further down here I'll

just I'll just kind of leave this leave

this with you guys and you can run

through the script on your honor and

also to highlight that pretty much

everything I'm going through is is

really just what's on this get started

path so if you want to look through the

documentation and look through this

Archie I'm ass file and you couldn't go

through this documentation tab in there

you're gonna get all the information but

I was I was just fun for now so maybe

I'll stop now

thank you very much yes I would love to

hear what thoughts people have or

questions or suggestions erases or some

typos that need to be fixed in the demo

so the minimum score is it will be na if

you don't if it doesn't find a match

with a score higher than that I know so

actually it actually saw filters it

sunsets it only shows the results with

the minimum score that's greater than

this threshold so many points it'll cut

those out and also is the thing to note

is that it won't it won't output a long

book that's the same size as the input

number because there's a potential for

hunting matches at various levels within

the one book so if you have a match at

Direct Loan taker between acquiring

ultimate parent you can have as many as

3 times the number of output rose I

salute you input those question for the

the data package is this where all the

data will eventually come from then no

so so the idea for the data by I mean in

principle I think the way that we see it

is the data package is where all of the

big data will come from so the data

package is meant to be kind of like a

template for what each of these standard

data sets should look like to have an

idea of how to get that

whoa but where's all of our proprietary

data is still going to be your tailor

it's still gonna be processed in the

same way it's just meant to have so that

we have kind of like a standard kind of

idea of exactly what each data frame

represents and what all the fields are

true then be using this for testing to

see whether the data files are in the

expected format or how will we manage

like if data files change structure yeah

so this is something that we're gonna

have to obviously the hope is that data

files don't change structure so much but

of course that's going to happen so when

that does happen yeah I think the hope

is that our TDI data adds a bit of a

hurdle for words changing data structure

not to make it impossible but to make

sure that if we are changing data

structure we're sure that it's a

necessary change and we think a lot

about it and make sure that we we are

being a little bit more consistent about

that the idea with that is to have these

more kind of like well-defined like God

but like like ideal they just had

templates and use that for my mouse

escape they do have to change or if you

have if you have a query or some kind of

for you just find that in the issues

file or in the issues tab from our TDI

data and this is kind of like Oh already

we have conversations going on this for

instance here okay so if there is any

kind of query or you through saying hey

where the hell's this I need this trying

to go to it and figure out how to

resolve that if at least we added or if

it needs to be a new data set or not

enough time I wish we had more time for

questions I'm sure people have them can

you please direct the questions to us

maybe if it's easy for you in calling

channel I will make sure they learned in

their corresponding issues that we need

thank you all very much and I say bye

and I live Jackson the last word

[Laughter]
