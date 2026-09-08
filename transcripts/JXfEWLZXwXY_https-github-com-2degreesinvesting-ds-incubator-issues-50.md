---
type: Video Transcript
title: "https://github.com/2DegreesInvesting/ds-incubator/issues/50"
description: "so today the DA's equator is the first  in a series of two the idea is to  discuss tools that we can use to create  plots and I'm a goal should be to give  an o"
resource: "https://www.youtube.com/watch?v=JXfEWLZXwXY"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=JXfEWLZXwXY"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

so today the DA's equator is the first

in a series of two the idea is to

discuss tools that we can use to create

plots and I'm a goal should be to give

an overview of the ones that some of us

are more familiar with so that you can

decide which two might be useful for one

or another situation the focus of today

will be DQ plot two and then next week

panel will extend this meet up with some

tools that he is familiar with but

overall showing some of the tools we

would like to come to discuss as well so

I would like to start actually this

meeting today with a preliminary

discussion and maybe I would encourage

Claire to to be the first kind of

explaining what's the motivation behind

this series of two meetups and then

opening also the room for everyone else

to to kind of comment on which tools you

use right now it could be anything from

say Excel to you know JavaScript or

whatever and also what challenges you

face when it comes to plotting data so

Claire could you give us a little

introduction about how we came to these

meetups it Thanks thanks Mauro and

thanks for pushing pushing us forward to

organize this yes I think this is an

important discussion to have and fairly

critical as as CJ CJ and Pranab both

both move on from the organization and

we're sort of left with a bit of a gap

you know we've tried to take our

technical progress on this a little bit

further forward but but yeah this has

been led by sort of experts rather than

then everyone working on this I mean

everyone does work on this but yeah

without without a cohesive message there

so the primary thing

that's motivating me to talk about this

is that

is that I think I think it would be a

great time to have a bit more clarity on

what everyone's opinions are on on

creating a more standardized solution

for plotting in the future so I think I

think there's a few elements to this

here of course these sort of library or

technology that we're using is it's a

very big part of this but you know I

think this could lead into further

discussions about whether we should be

creating a library of common plots that

we want to use you know a standard best

practice for for sort of making charts

interactive which is obviously something

that we want to do and I think you know

maybe this even even sort of helped

cement the idea that we we do want

someone to hire someone that's

specifically specifically hired for

transforming the messages of the work

that we're doing into graphics which

I've said there's a couple of times

already in the past past week or so this

is what we're doing this is what it's

all about you know it's it's fantastic

that we've got you know this smart group

of people here but if we're not

communicating clearly what we're doing

to to the public then well we may as

well not do what we're doing so yeah I

don't know where to begin on this

conversation unfortunately Morrow has

been able to pull these guys ideas

together yeah I think I think the

biggest challenge is trying to try to

get everyone on the same page and really

really making the process of generating

new graphics more efficient or if not

more efficient then we get someone

that's an expert and that wants to help

us make our messages clearer through

graphical displays thanks Claire I

really like that how you connected the

putting tools to communicating because

that is you know visualizations are

probably the most powerful tool to

communicating and to understanding data

first so understanding what what we have

what we want to communicate and then and

then communicated do we have any

questions and

comments here anyone would like to say

you know which to you you have been

using and or what challenges you have

been facing in terms of plotting maybe I

can comment like very quickly like I

just so I have been using like a booth

over the chip naught and the JavaScript

based on library cell phone but most of

my work is like a transforming from one

to new interactive one when it comes to

like it's like which library to use in

my opinion let's see if we have printed

reports or a PDF then gzip note would be

the base level to go with because of its

like a flexibility to like I have like

different aspects like you can modify

the ggplot like ICU like almost any plot

and it would be like literary but with

that one there are still some limitation

when we go from like a printed or PDF

wasn't to let's get a book downwards and

or like you want to send it like as a

link on the website then it's like a

just aesthetic chart so most of the work

I have been doing it's in the high

charter library which I would cover in

the next session in the detail but just

to give like a brief idea like let's say

if we take like a ggplot then it's like

a just a first layer but when we use

like JavaScript based libraries then we

have an X so first layer is like the

plot and important it is on that

specific area the second layer would be

on the hoard we can add more information

and the third layer would be like a

let's say we have a limited space in the

report and we are showing the chart but

we still want the user to explore more

about like entities but like how or why

of that specific chart and the third

layer is like a click event so user can

click on like any space of peak point on

the chart and with that point we can

generate like a completely new chart so

with the JavaScript that would be

possible but with our ggplot it's it

will still stay in the posture layer so

because this one is like

no seasoning thank you

anyone else would like to make comments

or address sounds those two questions I

suggested it also use our challenges you

face yeah I think I think run up that

that was a great point as to really

defining what we want to be creating and

as you've rightly mentioned that we are

going from what was previously something

simple in a static chart to - yeah -

this level 2 and level 3 and if we're

going to do that

yeah we need to make some decisions or

get some more expertise in the team well

if there is also the Google document

that we are now used to to record

thoughts even after this meeting so feel

free to use that if you know us we

continue with this Meetup

something pops up that you would like to

share and then I can go back to the

document and and work on that and so the

rest of the meeting and it's gonna be

particularly focus on one of the many

tools that we're gonna address over

there to see meetups today I would like

to talk about ggplot and maybe try to

explain why it's a good way to start but

before we do that can I have a click on

the yes participants bottom if you have

used super - already ever

good thank you must more or less to have

an idea of how a deep you know we should

cover this story in any case you know we

don't have a lot of time so I'm gonna do

is give the basic recipe for a teacher

plot and also acknowledging that most

people in this meet up today already

used it and maybe we don't need to get

very deeply but then it is interesting

to consider that you know even in a such

a small sample of people like we are now

in this meeting most of us have used to

people too and that is probably one good

argument in favor of ggplot2 as a place

to start which means that you know if we

already have that background knowledge

it is probably like a very good

beginning and in most cases probably and

may be the only tool that you need

because then anything beyond that could

be added on top of a ggplot by someone

who is you know dedicated to to

visualization so that's something to

probably reveal an idea to probably

revisit at the end of the second meter

so the very big picture of ggplot so i

also would like to make a comment on the

following so ggplot2 is the thesis

actually you know came up from from the

PhD thesis of very popular and our

package developer from hardly we come it

has a lot of theory behind that he

leverages to create how to implement

that theory in this package but a lot of

us you know use the two without even

knowing much about the theory and so i

would like to make a couple of comments

about on the underlying grammar behind

ggplot2 because understanding what are

the building blocks of the of this

mental model will also under help you

understand how you can combine them in

creative new ways and also it's a I

think it is important to consider that

g42 is one of the many packages in the

Tolliver's which means that you know

membership to a tyler's means that this

package shares

the most common data structure in the

titles which is the data frame so the

data frame flows from one package to the

other in the titles and you can massage

the data and do different things to it

including creating visualizations and

that is in contrast to other tools that

may use you know vectors may use lists

or whatever but ggplot is part of the

Tigers the Tigers is center around this

idea of the data frame which is you can

think of it as a spreadsheet and

therefore it plays really well with

other packages so this is one additional

argument in favor to deploy to so not

only it is a good useful thing on itself

but it's also a great player in an

ecosystem of tools that we are already

using in our work so the visualization

is in the in this graph that I'm showing

here that explains more or less how the

data flows and from importing it from

somewhere to communicating it to our

users our readers and that shows you

know what's the data science workflow

and visualizing the data is the core is

it's the part where we understand what

we have and we understand the message

that we want to communicate so key

message there the ggplot2 is one element

of the tie Devers and plays well with

the rest of the packages we are already

familiar with so the grammar is is very

basic the grammar was built before she

brought to existed so how do we can

build on top of that grammar but that

grammar didn't did not have an

implementation what I think was written

in 1976 by by someone else I don't

remember his last name now and but you

know it was kind of this theory about

how you can express visually some

concepts but no one had implemented that

in a tool so this as far as I know so

hardly what he did is you know took

those ideas create a package for them

it's very simple basically you take it

data set which here is represented as a

spreadsheet you know with columns and

rows then you express what are the

mappings to that data frame which is

well what

am I going to map to the x-axis and

which column are going to map to the

y-axis and then there is other methods

that you can use you can also map apart

one column to a third dimension other

than x and y you can map it to a color

or you can map it to a size so you can

might be to a shape right so those are

mappings so you have the data and then

you have a geometric representation of

that data that could be a point it could

be a line it could be a box plot so

those are geometric representations of

the data so you have the data you have

the geometric representation you have

the mappings and you put all that

together into a coordinate system the

one that we are more familiar with is

two dimensional X&Y but there is also

say a kori polaron system if you need to

plot things in values so when you put

those things together you already have a

plot one of the beauties of ggplot2 is

that a lot of the things that it needs

to create a plot it happened just by

default so really all you need to do to

start with the plot is this very basic

template and you're surely you know if

you use ggplot2 you will recognize this

element basically you need to pass the

data which more commonly you pass it to

this to this function that creates the

the basic ggplot and the function is

called you plot and then you pass it

data set to it then you have to tell

which geometric representation you want

for that data so this is a gem function

has different names could be a genome

point if you want the plot point it

could be a gem or a line if you want to

plot line and so on and so forth and

then these mappings that I was telling

you about which is you know how you know

one column is going to end up on the x

axis or the y axis or on the color or on

the shape or on the sides or whatever

other mappings there are so for a more

concrete example we can have a look at

this particular plot for example what is

the data that we are using well here I'm

using the data set Gapminder I pass it

here to the function GG plot and I use

explicitly the argument data although I

could remove it the gem that I'm using

so I want to represent the data with a

box

plot so I'm using the German box plot

that is available in ggplot2 and the

mappings are passed to the function is

AES is short for aesthetics so basically

you have to say you know how those

mappings are going to end up in some

aesthetic component of your plot so here

it's a very simple set of mappings I'm

only using X which I map in to ear and

the axis Y I'm up into life expectancy

so life expectancy and here are two

columns in the data frame Gapminder and

I'm representing those with a box and

this is what you get so for in this case

for each of the ears in the data set I

get a box plot which is what you expect

so once again going back so this is the

building block of a ggplot2 if you

understand these all you need to know is

to basically look up what's the gem that

most closely and looks like what you

want and stick the name of that function

there and the pot will change for you

there's a lot more you can do and a lot

more customization that you can do but

with this you get a long way down the

road so next I would like to go to our

studio toad cloud project and while you

click there and you create a copy of

your plot I am going to quickly go to

two links I think is a very important

one is the digital to website and I

encourage you to visit the reference

section the reference section has all

the functions listed there but something

I feel is very useful is a little plot

of what the different genomes do so you

don't need to memorize anything really

you just need to come to this website

and see okay the plot the plot that I

want to do looks more or less like this

like a box so okay it's gonna be the

genome box and then you can click there

and learn more about that function so

that's the one place I want to mention

and then there is a couple of other

places that are really useful also in

the home page of ggplot2

if you scroll down very quickly you will

see the cheat sheet which in the

beginning is really handy to have I mean

may be printed or in a PDF or you can

visit quickly because it explains

basically you know we're discussing

right now and in a very clear way so I

think that until you develop an Evo cab

you Larry 40g plot - honey listen having

this at hand can help you work very

quickly as opposed to spending time

looking things up and finally as I said

before teach applaud - is built on top

of grammar so it has a very strong

theoretical foundation and the best

place to learn about that if you're

interested is the book the book is it

was not free but in version 1 and 2 are

not free but now I discover that version

3 which is in progress is already online

so I link to the book here and you can

learn I read this book I think in

addition one a long time ago it was

really insightful and this is really the

something for not just getting getting a

plot done but also for understanding the

grammar if you're interested it's pretty

cool so if you really want to dig deep

and if you think you're gonna be

spending time making plots you know

maybe you would like one you know one

day or to dedicate to scheme in this

book okay so finally let's go to our

steel rod cloud and I'm not aiming to

achieve a real lot in in this studio

project I just want to give you a little

feel for I mean I know you know know

that most of you already use did you put

two so hopefully we're gonna go through

these quickly but the first thing I

would like you to do is to collapse all

chunks so that we can use so we can hide

the solutions and you can do that with

the pressing the key alt and then oh the

later oh that will collapse everything

so if I press then alt shift oh you will

expand them so alt Oh collapses then so

now I'm gonna click on

it says run me packages I expand that so

all I do is attach the Gapminder data

set on the timers which includes T to

plot - let's make sure it's running then

I expand the data just to give you a

little overview of what the data looks

like here I selected the columns year

life expectancy and GDP per capita and

then everything else just to give you a

list for what this data set contains as

you can see there is the year you know

how many years a person can expect to

live in that year and in which country

and content that that people is and a

few other variables that are not

relevant to this particular

demonstration so we could you know like

simulating an experiment or an

exploration that we could do ourselves

we can produce start a you know

addressing the data with a couple of

questions in mind that will direct our

exploration so we could think of for

example gay so what is the life

expectancy through time has it increases

the time yes or no so my hypothesis is

that yes you know as science progresses

life expectancy it gets higher so that's

my my first hypothesis that life

expectancy increased with time and my

second hypothesis is also that life

expectancy very significantly

significantly across continents so let's

explore those two questions so I expand

the headline for life expectancy through

time and this is a chunk that I would

like to run as well share with you and

start kind of moving on from here so

here you will recognize the template

that I mentioned before where you have

we have a GG plot and the data set and

then J M and a bunch of mappings also

know that you can produce the same plot

with the mappings passed to the GG plot

function and this might be useful when

you want to do many layers of a plot so

maybe here you want to have something

else write some other gel and but both

terms

the exact same mapping so it's you have

to placate in happiness you can pass

them to the to the plot function so what

do you think think for yourself

that's this plot for example answer my

first question and my second question

can I can I say that life expectancy has

increased through time yes no or watch

what else should I should I explore here

go ahead and make a little comment if

you want to that into the group so I'm

gonna share my thought here it looks

like the recent upward trend but I don't

have a lot of information about how

viable and that is so I'm not very sure

if the Train is significant or not

because I didn't have a very good idea

of the dispersion of these data so I

should explore bit more and how about

the second question do I have any

insight about what are the different

trends by continent here so here is a

full data set and it's not split by

continent so it's not a very useful

visualization so next we can you know

refine this plot using ggplot tools to

understand better this dimension

continent that is not capturing yet in

my map so I have to map one new variable

to that plot to understand what's

happening with with the different

continents so let's let's do that so in

this section your challenge is to modify

the last plot which you can copy and

paste and then modify it to show the

patterns by continent so the solution is

here I'm gonna give you like a minute

here to see where we get from there

so copy pasted the code that you saw

before and try to adapt it to have an

understanding of how the data varies

across continents

I'm gonna start working slowly as a way

to break hints so I paste the code so if

I run this I should get the same code

that I got before but now I want to add

a new mapping that let me see the

different patterns across continents so

there is the continent variable and I

want to map that to the color of the

points so I can do that here for example

and say color equals continent so

continent has to be a variable in the

data set otherwise it won't work right

so if I say something that doesn't exist

and I try to plot it I will get an error

so if I add this new dimension now I'm

plotting three dimensions I have a three

dimensional data in plot X Y and color

that color is now reference here on the

right and I can see that for example

Africa is getting red also increasing

life expectancy through time but lower

than say Europe which seems to also be

increasing but kind of higher than than

Africa for example so there is more that

I can do here

I can now answer to but in a in a but

again I don't have a lot of

understanding of the variability of the

data I don't know how many that had data

points there are and if that trend is

significant or not so I could continue

to refine my plot a little bit one thing

I could we could use is to change the

genome that change the geometric

representation of that data to instead

of using the individual points to use a

linear model that represents and

captures all the variation within a

country and shows it through time how we

can you does do that we can you do that

by using a different genome like the GM

smooth which

creates progressions with different

methods and the method also comes

there's a default that comes with it so

you can try it now so go ahead and take

another minute to see if you can now

plot and you know modify the last plot

and instead of plotting points if you

can plot a model with giome smooth so

I'm gonna give a minute and half way

through the minute I'm gonna start

answering the solution myself as a way

to give you a hint

okay if I start with a plot that I had

before the cheetah plot as we learned

from the template all we need to do is

modify that template to use a different

GM so now the genome I wanted to use is

Jian smooth so let's see if I just

change that what I get okay so here I

have an entire line that captures the

variability so that the gray area

captures the variability right and the

blue line captures the general trend so

this general trend is strongly upward

the variability is narrow enough that

I'm quite confident that that line you

know if that line could fit within the

uncertainty horizontally then I will

think that I need to explore more to

know if that trend is significant or not

but here it's clear that the trend is

upward I could not move the line inside

to get horizontal within the gray area

so overall the trend is it looks like

strongly significant overall the world

has increased in the life expectancy and

I could also add the color actually so

interestingly if I plot by continent now

that line splits by continent and now

each line captures the trend by

continent so I now can kind of

confidently see that there is

variability even across continents and

because there is no overlap in the

certainty in most cases I can also see

that the life expectancy for different

countries have been different across

continents and through time but all of

them have increased through time which

is super interesting so that is you know

those two things hopefully show what you

can do with

you plot - there is a little bit more

here that I don't have time to address

because we have now we need to end to

start the tailor's meeting but but yeah

with that you know I hope you now

understand how the template that ggplot2

provides can help you create different

kinds of words to communicate your data

to understand your data first and

communicate it to your users I encourage

you to leave your questions or comments

in the document and that's all we have

time just to say but before we end do we

have anything like burning that's good

you would like to share here

okay well the takeaway is again that

little template that I told you about

and the few links I sure that should let

you learn more about GG platoon so thank

you very much and I look forward to the

next using Twitter where pranaam is

going to talk about more sophisticated

tools thanks Mary

bye-bye

[Music]
