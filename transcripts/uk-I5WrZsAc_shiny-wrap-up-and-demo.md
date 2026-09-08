---
type: Video Transcript
title: "Shiny: Wrap up and demo"
description: "Today the ds equator is the last in the series about building shiny apps and today we are going to wrap up the meetup overview of what we've..."
resource: "https://www.youtube.com/watch?v=uk-I5WrZsAc"
tags: ["ds-incubator", "shiny", "reactivity", "r-packages", "docker"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=uk-I5WrZsAc"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2021-08-17T00:00:00Z"
    usage_count: 19
usage_window: { from: "2021-08-17T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

today the ds equator is the last in the

series about building shiny apps and

publishing shiny apps

today we are going to wrap up the meetup

by

uh maybe going very briefly through an

overview of what we've covered doing a

super brief retrospective

maybe opening

some discussion and then doing some

demos

of apps that we have built recently

as we kind of learned shiny

so

to begin then um this is the page that

we have been using to collect the

different topics that we covered

throughout this series the syllabus

is here at github.com tutorials

investing

ds.shiny

and

the first thing we did is

um

build a very basic shiny app

and

we talked a bit about reactivity

um including

the react log productivity being a

completely different

paradigm for programming to the one that

we are used

which kind of poses a challenge for

understanding shiny and because we need

to learn a new mental model about how

things work so we covered that that took

up quite a bit of space in this series

then we talked about workflow so how

you actually go about working with shiny

uh which um

keyword shortcuts you might want to to

know about and how you set up the viewer

so that the app appears either on the

web browser if you want or in the viewer

panel if you want and things like that

also how the workflow well actually that

we covered later so then we covered

debugging so some strategies that um

you may want to know about when you uh

when something is going wrong and how

you can fix that including some tools

that you can use that you are you might

be already using

if you are debugging art code in general

but then there are some

challenges that shiny poses that are

unique to shiny and then there are some

tools that you need

that are specific to the bug problems in

shiny

finally or almost finally

then we covered the idea of

packing or packaging

shiny apps so distributing building

shiny apps and sharing shiny apps in

our packages

and finally we cover very briefly

some strategies for publishing shiny

apps we cover the most simple ones as a

little bit of a retrospective i think

that we

um

we you know chinese such a big topic

maybe i was a bit ambitious in how much

i wanted to cover so i kind of end the

series feeling that um

we haven't covered everything that i

wish i would have covered but also i

decided to kind of cut it short in a way

because i also felt that um

because there is so much to know about

shiny that um

that it was going to be um too boring

and too technical

so

uh yeah that's um that's my sentiment of

of what didn't go so well what did go

well

is that at least i learned a lot about

shiny to the point that i could use what

i have learned to

build a shiny app that is now in

production and is serving a purpose for

two degrees uh if there is time i'm

going to show that one but i'm more

interested in showing an app that

jackson built

jax are you still there can you can i

hear your voice

awesome

because i saw my internet

being weak for a moment

and then the one thing uh we could

improve i think is uh the idea of trying

to aim for um less content because this

is so far the longest series that we

have had with

something about 10 meters

then the second longest was testing

which took seven meetups and was also a

little long so i'm going to be trying to

um

to only aim for more like superficial um

coverage of different topics or smaller

topics so we can cover them in depth but

not take up so much space

so that is my side of the retrospective

so i we have some people in the room so

i'm gonna um

open

the room for a little bit of a

discussion to see if my sentiment about

the this series is shared if you have

any other things to add in terms of what

went well what didn't go so well and

what we could do to improve

maybe five minutes to discuss that

i do i motivate

maybe in this area we're gonna leave you

outside because you haven't

been in the series until today but

jackson has and alex have so i'm

interested in hearing you know just a

few words of what you think went well

didn't go so well and could improve so

let's start with jackson

yeah i think uh what went well is we

were able to kind of i mean you were

able to go over the entire scope not the

entire scope but a very good overview of

shiny from kind of

um like best practices to publishing and

i think

at least

the resources and kind of tools that are

necessary to go through that process

we kind of went over

um which i think is awesome because as

you said it's a pretty huge topic and

having a resource to just jump back to

and say oh i need to read up more on

reactive values now or something like

this is helpful

and i think on the flip side to that of

course

there's there's so much that needs to be

learned um

especially i think with with shiny um

shifting from like the normal coding

paradigm

that uh the normal the

kind of paradigm that we're used to um

uh

that

it kind of like it doesn't it almost

doesn't make sense to show everything

unless people are actively running

examples um i think that a lot of it

won't make sense until you run into

problems and have to debug yourself and

i think

um only a couple only a handful of the

participants actually have worked with

shiny before and i think the ones that

hadn't probably

might not understand why some of the

topics were uh

were as important as they are um i

probably won't understand that until

they actually get their hands dirty with

working on the projects

thank you alex you have any opinion any

comment

yeah um i

i'll start that i know that shiny is the

topic near and dear to your heart

um

which i think is

hashem in this

um

you handled this topic which is not an

easy topic you handled it very well and

i think a big part of that was

this time around you really focused uh

as jax mentioned on what

sets programming in shiny apart from

other programming that people have done

that you have done in r

um it does involve changes in thought

and i thought you

tried to explain that very well

um

as far as the format goes i think

this one you did as

more of a lecture format whereas in the

past you've tried to pull

i would almost call them workshops

i think

that

the lecture format works well uh for you

and you you did a really good job of

segmenting things into half-hour chunks

um which

made the lecture format work whereas in

the past that workshop format is really

tough to do

over several weeks with half hour

sessions

um so

i i think that this is a really good

resource that we have in our library now

on

the sort of nuts and bolts what you need

to go from zero to production in shiny

thanks alex yeah as you just mentioned i

explore different approaches to

um

leading the ds equator

and uh

i i have been conflicted particularly

with this idea that i learned i learned

through books and through you know

influential

teachers that i admire that

for people to learn well they have to do

things and that's how i also learn well

but then it's true that for that you

also need time so i i also learn from

other people who have a lot of

experience teaching that sometimes you

shouldn't be too afraid about the the

lecturing format because it's uh i think

that the ds inquiry also became a good

space to just hang out and relax and

sometimes people might want to join

with their brains in a more relaxed mode

as opposed to now i need to kind of do

stuff you know and i'm expected to you

know to do this exercise otherwise i'm

out of the ds incubator so that could be

scary it's particularly for tuesdays

where people are that have their brains

fried in in two degrees they have so

many meetings

so i i'm so far i'm settling in this

format

accepting that it's not the greatest for

learning but maybe the one that

is going to be more attractive for our

audience

i may change my mind as i do every time

sorry anyone here in clinton faria sorry

i had excluded euphoria from the

conversation assuming that uh

wrongly assuming that you might not want

to um

say anything because you weren't before

but please please too because

that was a wrong assumption maybe

i don't know i i didn't experience this

before so i don't have any anything to

really base my opinions on

okay cool alex i think i interrupted you

go ahead

oh i just wanted to go back to the

format real quick is i do think that the

workshop style ones are

effective

um when like workshops are a great way

to learn a specific school skill in the

like if we had had space for a shiny

workshop that would have been

spectacular

uh

but

sessions like like

that take multiple consecutive hours

and so i think

we should still be holding workshops

when we want to introduce new

technologies to our organization

um but we're going to have to have it be

fairly focused on how do you do this

particular task that everyone has to do

so i think a really good candidate for

that is going to be

when we roll out the pack to docker

image

of holding a okay we're gonna have

two hours we're gonna run this session

like three times

the first two are gonna be the same make

it to one of them if you need whatever's

in the second half come to the third one

and it's going to be here is how to get

set up with docker introduction on like

how the whole system works but then we

really get into the what you have to do

what are the errors you're going to see

um

i think that

i i definitely want you to help lead

that because that that is going to be a

big thing and you do workshops well

thanks well this is uh you know the

transition between this series that is

ending now on a new series that we

haven't yet defined so usually i wait a

bit uh to the last minute to ask for

people to vote but i think this time

i'm gonna be better at that hopefully

i'm expecting by tomorrow to send a poll

with some proposed topics and asking

people to propose new topics so if you

have any topic in your head including

docker for example maybe a brief

introduction to using docker before we

get to like a more formal workshop might

be an option or whatever other idea that

you have that you think that um is it

could be useful to see a series about

then um yeah you know you will have the

opportunity to propose that topic very

soon and people will vote

um okay so this kind of wraps up the

first half of the meeting where i wanted

to reflect on what we have done um

but there is another way of not

reflecting but kind of showing off in a

way what we have done um i have one

product of my learnings which is

this app that jackson and alex were

involved

in developing which is called the

scenario selector tool

i'm proud of that because it's very

small and gave me the opportunity to

practice

a few things that i learned as i taught

taught the ds incubator

and i did some work in

in pointing

in the repo itself where

where i had gotten the information

where i learned something from and then

where you can see an example in code

and so i'm going to because i'm at that

topic i'm going to just show the page so

that people can serve themselves

a demo if they want so they can go there

and explore and then i'm going to pass

the baton to jackson to fill the rest of

the time with his awesome app uh so let

me jump

here so what i'm going what i'm doing

now is first showing you

a url that has the live app so the

result of that work

that involved alex jackson

me and a few other people contributing

um ideas

this is the app it's very simple just

a bunch of selectors here to the left

a plot and a table but it has a lot of

thought put into it the repository under

it is this one here so github.com to the

guest investing scenario selector and at

the very end of the readme file there is

this section called learning shiny so

that is the section i'm more most proud

about because

in the in the first part of the link

shows basically a chapter in the book or

a section in the book by hadley

mastering shiny where i learned

something and then

in parenthesis you will see the word

code highlighted too as a hyperlink so

if you click that link that will take

you to some part of the code that

illustrates an example

is an example that implements that

lesson that i learned from the book so

that was my way to capture what i've

learned in in a real life

app that i could revisit later and that

serve itself in developing itself was a

way for me to learn

so with that i invite you to visit this

app if you want and but i will pass the

ball to jackson so you can i'm going to

stop my screen so you can tell us about

your super awesome app that became

famous

that's a bit of a

stretch maybe but

i'll show you i'll show it off anyways

um i'm just gonna

share my screen

i expect you guys to see our studio

briefly

yes

awesome

um

yeah so maybe

uh

i guess i i thought i'd just go over the

structure of the app first but i'm

thinking now maybe it makes more sense

to to show what it looks like first and

then go over the structure so give me

one second

yeah let's do this

so

[Music]

this is the

final product of of the app that i was

working on so i was working on it with

my an old friend

adrian

and we were just doing this kind of side

project just for fun we found like a lot

of free data that was available

oil and gas data that was available

published by the uk government

and it was kind of presented heinously

and like it was really really vast

wealth of information just in like the

most unusable format possible

i'm really showing my opinion so i hope

the uk oil and gas authority doesn't end

watching this video

um

[Laughter]

so we decided that it would be cool to

make it more accessible especially to

the public since it's really interesting

information for for them to to look up

and so basically

it's uh you're greeted with this kind of

simple splash page uh there's a little

report explaining kind of the context of

the project that someone else sort of

worked on

um

and then you kind of exit the splash

page and it's really it's really simple

um app

you have this table on the side that

shows

equity holders and ultimate parents for

various uh gas licenses

and you can kind of query this for

different companies to see to see

you know which companies own licenses in

the north sea

and you can also

play around with this interactive map

here and sort of select different

sub-blocks

and see who owns that sub-block and also

select all the other sub-blocks that are

owned by that ultimate parent

um so it's just a way to play around and

kind of understand sort of you see

repsol owns quite a large portion of the

oil and gas licenses in the uk

and it's just kind of a way to explore

um

explore this ownership and for instance

when you select when you select bp you

see of course that they're quite present

in the uh

glass licenses in the in the uk

and there's all this kind of fun

interaction these little pop-ups you can

you can reset the table and kind of

start interacting with it from scratch

and

there's finally since this table is

relatively small to

kind of

for ux to be able to sort of

swap back and forth between the map and

the table

if you want to see more data points you

can click view folder full table

and this whole dataset will load with a

lot more fields and information around

each of the licenses

and so that's basically the whole

functionality app it's really it's

really not not

that crazy

um

and maybe to get to get into sort of

implementation details um it's actually

two

two different shiny apps

um

one they're both hosted on shinyapps.io

one is just the is just this um

uh this structure this this map and

table structure

and the other is literally just a data

table like no bells or whistles really

really straightforward uh surfing in the

data table

and um

252

pages of licenses

and what we did

was um

actually

on the commonwealth homepage actually um

captured this entire app in an iframe in

html

and then

there their

sort of front-end developer was able to

add this interactivity on top of the app

itself

so there's all of this all of this sort

of like pop-up menu

is really just is really just added uh

um

reactively on top of on top of the base

shiny app

and so that that's a way to kind of keep

the the shiny and our processing portion

of it um minimal and really you know

just the server-side

work really just handles data processing

and and spits out the results

and kind of allows the ui ux part to be

done in a maybe a more suitable language

or a more kind of um

uh

yeah and in a different way

um

so yeah that's that's basically the

app um

and i can show

uh

just briefly

this is the the source code for the main

um for the main uh dashboard so

if i have a look

at the structure of this why is it not

letting me scroll

um

let's just do it this way it's it's

really just the it's in the structure of

an r package um maybe unsurprisingly i

use the golem framework to generate all

the scaffolding and stuff like that

although i'm

probably soon going to switch to a

different framework because i think that

golem has way too much overhead

um

yeah so there's a lot of these usual

like like tests read these uh

news name space all the all these normal

kind of

files that are just populated for a

typical r package

and then all of the the app itself is is

exported as

functions within the package

so you have the

run app

function if you see if i if i load

package

um

anyways it's not showing the screen that

just popped up but the screen that just

popped up is the application um

maybe the

you can choose the

show in the viewer

pane but uh yeah that would have been

good

this should work too

so

i

hit run up

it's just an exported function from the

r package and it runs everything locally

so this is not served on any on any uh

server or anything like that it's just

running on my

variable running on my local server but

it's not it's not uh online

um

and

all so this this function is is exported

um

in the north sea dot dash namespace so

you can

all this app is is a is a you know golem

call to app ui an app server

so if we have a look at that

all these are is i mean the server is

really basic it's just a module call to

uh to

to this uh assets map module

and the ui is a little bit of kind of

overall webpage ui that i want to apply

to every potential module that i add and

then a call to this to this um assets

map module

and then this last of these the map here

this module

pair of functions is where the actual

sort of application is

functioning

one thing to note is that i

i extracted as much of the data

processing as i could outside of the

server um

so it's it really just it processes

mostly um

at the very beginning there's no

reactivity to processing it just kind of

on initialization we'll run this

and um

probably actually i could i could do

this data raw and have it run

outside of the context of the of the

application already be pre-processed but

i didn't do that yet

um

and then um

yeah there's there's some simple kind of

uh

let's just have a look

i have these two output um

uh um

these two output modules the the map and

the table and then there's several kind

of react reactive components that um

react to various uh

user input so if you click if you click

a marker on the map

it'll run some highlighting uh uh dragon

or kind of um

sorry just to acknowledge that alex

throws his hand and um

i wonder if he wants to make a comment

before you move to another part of the

code or if he wants to

jackson already covered it in the next

sentence i was going to ask about doing

data processing in-app versus

uh externally so

definitely i i kept it in the art in in

the app just because it was like for for

um interactive development it was nice

to just have it run every time i was

running the app but i think

how big is the data file

um it's not

huge

uh yeah the biggest one is is 1.8

megabytes

okay so it's not like we're actually

adding

significant

delays exactly like the efficiency of

the app it spins up like in a couple

seconds it's not it didn't it never uh

it never seemed to cause that much of an

issue

um that's another interesting point

maybe uh so i tried to be as

reproducible as possible in all of my

data sourcing and

pre-preparation and pre-processing

um

some of that was very difficult because

i had to manually pull data from some

random web page on the oil and gas

authority's website which was not which

was a huge hassle

um but all of the company ownership um i

was able to do

uh able to source using this this python

library

and so i've kept like again this is

probably not strictly best practices but

i've kept um explanations uh and the

source code for how i did all of my kind

of data like raw data pre-processing

in this data raw folder

and then in my when i source the system

data um i've given as much explanation

as i can as to where the data

came from

links to the to the different web pages

um and as much context as i could for

every

every data source here including which

python scripts were used uh to source

certain data sets

that that would have a couple of venus

objects here

okay sorry um

yeah i mean that's basically it i think

one

one interesting thing that caused me

some issues was um

i was trying to write some javascript to

do some styling

for one of the modules and i had to i

had to figure out basically because the

module is namespaced and i have to call

this

namespace map

i had to do some funky like

um

jumping between javascript and r and

pasting the output of the r namespace

function into a javascript

string and then calling that directly as

a text style but don't know if that's

the right way to do it but it works and

i was kind of banging my head against

the wall figuring that out

and got really um intimate with the uh

with the chrome debugging service

from a

javascript console or whatever you call

it exactly

um yeah so that's that's about it

thanks a lot jackson that's uh that's

great i'm so happy that um

you have that as a

quite sophisticated example of what you

can do with shiny uh that's that's out

there to the world has been

so can you make a little bit of a

comment about the publicity or what you

know the outreach component of this

yeah sure so we um we got the

uh

um

the project got picked up by the

guardian uh newspaper which was really

cool

and um the whole project including the

the research the the research component

of it

made the front page of the news which

was really sick

that's so great that's uh an excellent

story that shows how your work

as a researcher as an asset developer

combines in precisely the way that you

want to create change in the world by

making

uh information available to the public

in this opportunity you've reached

apparently a lot of public

so it's such a success story and i'm

happy that shinee is

is part of that

awesome

okay these are then our last words for

this series um i look forward to

learning which is the next series is

going to be about

see you next time thanks for joining

awesome

thank you

[Music]
