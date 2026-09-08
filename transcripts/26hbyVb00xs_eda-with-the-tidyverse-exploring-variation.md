---
type: Video Transcript
title: "EDA with the tidyverse: Exploring Variation"
description: "Explore the variation contained in two kinds of variables categorical and continuous how can we do that with two tools the ggplot2 package and the deep player package..."
resource: "https://www.youtube.com/watch?v=26hbyVb00xs"
tags: ["ds-incubator", "r-packages", "ggplot2", "eda", "tidyverse"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=26hbyVb00xs"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2021-11-09T00:00:00Z"
    usage_count: 362
usage_window: { from: "2021-11-09T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

so this is the vs equator and again we

are in the series about exploring data

with the tidy verse

and today we're going to be talking

about variation and how we can explore

the variation contained in two kinds of

variables categorical and continuous how

can we do that with two tools the

ggplot2 package and the deep player

package both had of the tidyvirus

so what you see here is the

typical syllabus

we are trying to first understand the

role of questions

um in

in an exploratory data analysis we're

going to be also reviewing very quickly

definitions that we're going to be

carrying throughout the rest of the

series

in terms of definitions of the main

components of your data

and then we're going to be exploring

categorical variables continuous

variables both with visual tools and

with analytical tools

and we're going to be also exploring the

distribution of multiple groups

of a variable

containing a data set all in a single

plot

so um

the

[Applause]

um what you

are going to be seeing today is here in

this rmd document in this markdown file

that we talked last time another

markdown file is one tool to communicate

with yourself first and this with with

the world what are your findings about

your data

and so the first thing i like to do in

my

um scripts or in my our markdown

documents is to start with the packages

that i will need for that particular

analysis and that is a way to very

quickly

you know advertise what what things this

uh analysis depends on uh so one really

cool trick that um or feature that the

television

that our studio has is that if you

mention a package that you don't have

installed then

our studio will let you know so for

example i don't have the package vegan

vegan is is the name of the package

and it's a real package but i don't have

it inside my system so as i as soon as i

save the file notice how here on top i

get the sign

package vegan required but it's not

installed and i can click you know here

in install and it will automatically be

installed so

it's really cool to

do that so that's one reason to

advertise very quickly packages that you

need so anyone running that analysis

trying to reproduce it even if it's

yourself in the future

very quickly know what they need what

they need to install

so the first

component here of this meetup is to try

and understand the role of questions in

an exploitative analysis so the

questions are

basically the tools that you have at

your disposal to focus your attention in

specific part of your data and the idea

of actually doing an exploratory data

analysis is all about trying to

understand your data so those questions

then are the tools that will

best help you

get that understanding that you want to

gather from your data

and although for each data set there are

specific questions that you may need to

ask

just about any data set is

you know will benefit from asking two

types of questions so one is the

question of what is the variation

contained within a particular variable

and you can ask that question for each

of the variables in your data set and

the second kind of question is what kind

of covariation occurs between two

variables so i have variable x variable

y is there a pattern in you know in the

is there a pattern that is contained

every time something happens with

variable x is there anything that

happens consistently or systematically

with variable y or are the two variables

completely independent so that kind of

question

so that is uh

just about everything that is covered in

the chapter that we occur in this series

but today we are going to be focusing on

on point one on variation

so basically focusing in one variable at

the time and trying to understand

how that variable changes

with different values

so let me jump to very quick definitions

the very quick definition of the main

components

sorry for the background noise

there you go so the very simple

definition of

the main components of the dataset

are these so basically because i assume

that most of us here have experience

with spreadsheet like data sets then we

can think of a variable as a column a

value as a cell and an observation as a

row

then what you actually how you actually

define the column the row and the cell

has to do a lot with you know your

uh particular problem uh so what is it

variable for you

um is something quite specific um but

the

it's there's something interesting that

someone wrote a paper about what it is

uh what they call tidy data

and

it's a very simple way of thinking about

data and a very useful one as one that

is used

in the tidy verse the idea that it a

data set

is tidy when each variable so each thing

that varies

whatever you define it is is saved in

just one its own column as you see here

so each column is one variable and also

when each observation and an observation

is is basically a set of measurements

under the same condition so if each

observation is in one row

right and each variable is in one column

then your data set is what they call

tidy and the tidy verse which is this

set of tools use that idea um

to develop tools that expect that type

of data so if your data does not meet

that simple requirement

then it's going to be very hard to use

the televerse to you know for example

visualize data or analyze data and then

the television does have other tools to

actually

reshape the format of your data to

comply with those with those conditions

for a more formal definition than the

one that i have given about um

let me see here

about the phoenicians definitions

question here

about variables

observations and values i recommend you

go to the book that we are using chapter

7 exploratory data analysis in the

subsection questions you will find a

more complete definition

of what i have just said you know i just

summarized that as you know okay a

variable is a column

an observation is a row and a value is a

cell but for more formal definition go

to the book

okay so let's

i think oh and intentionally i'm

installing the vegan package

which wasn't my intention i just wanted

to demonstrate that

okay next expand this a little bit more

so and one example of a dataset and how

it looks in r

is for example the dataset diamonds that

comes with the highly verse more

specifically it comes with the package

ggplot2

and here you can see already that there

is a bunch of of you know columns or we

can talk about them as variables which

we just learned

we are defining as the same thing and

and in particular notice that there is a

column for example called cut

and it has the values a small set of

values like ideal premium good premium

good very good very good fair very good

it's not a continuous variable it's a

categorical variable because it can only

take a very limited set of values

then notice that there is another column

here for example carat which takes

values that like 0.23 0.21 so that is a

continuous variable so one that takes

an infinite number of

values along

an order kind of sequence

so those two

types of variables are going to be the

star of the show today and we're going

to be using gg plot 2 to try and

understand how the variation is what is

the variation contained in each of those

types of variables so to start we're

going to be starting with

with the column

cut which is a categorical variable and

we are going to be exploring the

distribution of that variable

why is that important well because every

variable

has its own pattern of variation so the

idea of okay i take i take one

particular

variable in this case you know cut the

cut of the diamond and i measure it

twice do the you know how you know from

one measurement to the other what is the

change in the value that i get of that

variable so that is the idea of

variation within a variable and you know

there may or may not be some specific

pattern so maybe the distribution of the

values in that variable are at random

and maybe not maybe there is some

pattern that we can extract and think

about and that is the insight that we

are actually after when we do

exploratory data analysis so the best

tool actually to understand that pattern

and that's to understand your data is

the simple plot the visualization right

and that's why you know we use

the tie device

so before i you know we do the first

plot uh let's first think a little bit

about the column that we're going to be

looking at

so i'm using here the function relocate

which basically takes the name of a

column and puts it in the first position

so that it's very easy to see it

relative to the rest of the data set in

that in that data set

so here what i'm showing is you know

that it is just to remind you that this

is a categorical variable that takes

just a very limited number of values

it's not a continuous variable it's a

categorical one

so um and we're going to be using now

ggplot2

remember using the template that we used

before

in the last um meta basically it's

always called the function ggplot2

in the data argument we are going to say

this time we want to plot the diamonds

data set

and then there is some kind of geom that

gives you the geometric representation

of the data on a coordinate system so

in particular we are going to be

choosing the gm bar because we want to

represent

the

instances so the count of

the different values like ideal premium

good premium goods so how many premiums

do we get how many goods do we get in

this data set so this is then how you do

it so

again you know the template always takes

you know these tg plot two functions

that takes the data set

and then we give some kind of geometric

representation in this case a bar and

then the mappings is you know this idea

of mapping a particular

column to the x-axis or the y-axis in

this particular um plot we need only one

variable only x so let's run that so i

here i get an error because i forgot to

run all the chunks

above the chunk that i'm staying that

i'm standing right now

so i've done that before and now if i

click here on the little arrow i do get

the plot so the plot is just the one

that you will see also here on the on

the document that i'm sharing with you

so here you can see that the plot

automatically counts the number of fares

that it sees in the data set it counts

the number of goods that it sees in the

data set very goods premiums and ideals

so

this is a bar plot and

and this is uh you know how you actually

do it with with the g plot too

so if you wanted to do this by hand you

can basically uh you can use

deep plier which is another tool in the

tidy verse to do just about the same

thing so what you do here is you take

remember how we read this this pipeline

before take the data set diamond and

then

count the number of intense instances of

the

variable cut

so what you get here is a new column

name named n

that gives the number of instances of

each of those values of the variable cut

so this

n column is the one that is plotted here

so internally the two digit plot 2 does

the same thing that you could do here by

hand

okay so if you wonder how you can do

reproduce that plot you know um

analytically this is what you could do

so these two things are showing the same

thing one in the form of a graph and the

other one in the form of a table so

depending on what is

the use of

you know depending on what you want to

communicate maybe a table or maybe a

plot might be more useful for you to use

so now let's move on to talking about

the other kind of variables that we're

going to be covering today which is the

continuous variable which as we said

before it's a variable is continuous if

it can take any infinite set of of order

values right so let's do the same that

we did before let's use the function

locate so let's take the diamonds data

set and then

let's relocate the column karat to the

first position so karat is

just to remember is a continuous

variable that takes values such as 0.23

0.21 and so on

so now we can also use visualization

tools to explore the distribution of the

values of that variable

so how we're going to do that okay again

remember we use the template we take the

function ggplot2 we give it the name of

the data that we want to use in this

case take the dataset diamonds and then

the the next thing we do is you know we

use some kind of geometric

representation of the data for

continuous variables before we used um

we used a

geom bar because that is the tool for

categorical variables but here we are

using historum histogram will first

create

a categorical version of the continuous

variable so that it can create columns

that then can show you on a plot so the

mappings again

we we map the variable carrots to the

x-axis right here is the the mapping

and then we're going to choose how wide

we want those columns to be so we could

omit that argument there and run that

code as it is and you know ggplot2 will

just guess some kind of width for the

columns but it is a very important um

argument and in in histogram you will

almost always see it used because it is

very insightful to try different with

bandwidth to see if you know you may be

missing some you know fine grade detail

that might be contained

in a column that is too wide or maybe

quite the opposite maybe you know if you

get a lot of columns that are too too

thin and they all represent the same

thing you may summarize them better in a

in a wider bandwidth

being with sorry so if i run the same

plot now with being with 0.5 you can see

how the the plot changed a little bit

and now it's equal to the one that i

have here on my right let me scroll down

yeah

and it may or may not be

the most informative one so the best

thing you can do is when you do a

histogram always try different

bandwidths here you know you can try

75 or whatever you find

it might be useful for your use case

good

and

the same thing you can do by hand so

remember that cannot is a continuous

variable so the trick here as the g

block 2 does internally the trick here

is to use a function that creates a

categorical variable

from a continuous variable and that

function is cut with unfriend so if i if

i ask for the help file of that file i'm

going to press

f1 on my rs on my keyboard you can

thank you very much thanks very much

i can see the help file of the function

cut with and friends i can see that it

has

the the the gang here are three

functions cut interval cut interval cut

number and cut width the three of them

help us do similar things here we're

using cut width in particular so we want

to cut a continuous variable in chunks

of or in bars that we're going to

represent in bars but in little chunks

of 0.5 um you know width so if we do

that

you know first so that's how we first

cut

the

value then column carats in that width

and then we can we count the instances

that we have for each of the

different bars right so this would be

the analytical version of the histogram

that we have here on our

viewer

what could be

down

here there we go so this is to the right

the histogram version of this analytical

table type version

okay so we are getting close to the end

and there's only this one other

thing that i wanted to mention that is

this idea of okay what if you have

um groups of data within your data set

all corresponding to in this case for

example karat

and you want to overlay them and well

actually

the point here the very first point was

here is to demonstrate the value sorry

of trying different bandwidths uh just

to see if there's any pattern hidden in

the bandwidth that you chose but the

overlay thing is this one here

and so the the idea is the following

sometimes your data set has

different um groups in a variable for

example

you can explore the value karat

by different colors and so by different

cuts so you know what is the karat for

diamonds of ideal cat or what is the

karat for diamonds of premium cat okay

so the way you applaud that idea is this

way remember you take the

column the function ggplot you give it

the data set in this case the dataset is

the one that we created in the chunk

above here

is simply taking the the diamonds set

and then filtering for carats that are

smaller than three so that's how we

created that data set smaller

so let's uh make sure that we have all

that information here by clicking the

the down arrow

and and then in the mappings uh what we

do is we map the

column carrat to the x axis right and

then the cut we tell

ggplot to map the cut the different cuts

to different colors in the lines so

before everything you've seen so far has

been black and white all your bars of

everything has been black and now you

will see different colors so now the

tool that we want is not um geom

histogram but instead

geomoly so the polygon of frequencies so

this is another type of function in g

plot2 that allows another geometric

representation of your data another geom

that allows you to plot

very

clearly

different

groups of data in the same data set in a

way that you can see what's underneath

so if we were using a histogram instead

let's try that i'm not sure if it's

going to work i think it will he's the

gram

what you would you would get is like

this overlap that makes it really hard

to understand the data so that's why

when you have overlying

um data sets of underlying groups

of data within your data set a much

useful tool is frequent freak poly

um all right so

you might be wondering by now like what

uh you know how do you even know what

are the different geoms for example that

you can use

and

for the different you know visualization

problems that you may have so here i

collected a bunch of resources that i

find really useful um

first of all you know the first link

will take you to the ggplot2 package

website and here you have a link to the

template that we were talking about the

last time the very first one i'm going

to be clicking on is the reference i

find the reference

of this package basically a reference is

a list of all the functions that it

contains and i find the reference in

this particular package extremely good

extremely useful and why because uh here

to the left you have a little icon of

the different kinds of plots that you

might want to do so you don't need to

know too much about ggplot2 to kind of

get your way around you just come here

to the reference kind of scroll down see

what type of geometric representation of

your data you are looking for and then

see which is the function that does that

that's the trick

uh finally oh no before ending you know

this this is a cheat sheet as well that

is extremely good uh it takes you to the

website again you can click here and

download that cheat sheet and it

contains a lot of information packed in

a very compact way and finally the

reference for the player because we we

have been doing not only plots but also

some analytical things

and although the player is a huge

package and has a ton of tools and

the reference is also very good it's

very well organized and you can see just

for example in this first heading

one table verbs you can see a few

functions that they are all very useful

and i recommend you know clicking each

of those urls in each of those

hyperlinks and reading the help file at

least of this very few set of functions

just with these few tools you can get a

lot done in the player

okay and that brings us to the end of

what i wanted to show so i'm going to

bring your pretty faces again and ask

you

to

bring your questions or comments to the

room

[Music]

is it the same thing as what it said

well can i have like a longer liquid set

where one problem is the names of

variables and use the same tools

can you repeat your voice came out a

little a little low here on my computer

so i want to know like how does this

idea of tidy data relate to like white

versus long data set and can i use this

on a longer data set yeah okay excellent

um

you can have tidy data in in both in

wide and long format but it's true that

sometimes depending on

on

um

how you have defined

the variables in your in your data set

that might be a sign that it needs time

like for example a column a column may

contain something like

ear and the score

um

what else that could be year underscore

and some kind of number i know

because there is a value for a variable

that happened in a particular year so

that column is untidy in the sense that

one single column

encodes for two types of information one

information belongs to the variable year

and the other information belongs to the

variable value so in that case you need

to first separate those two variables

from the the column that is an

artificial variable

and then

you will be able to do your united

analysis more comfortably then what you

say which is not exactly what i i

responded to

is this idea that you know once you have

those ears on in like one in a row

depending on the use of the data

sometimes you want those ears to be each

one a column

more use more usual than not is the

opposite where you start with a

spreadsheet that for example if you

collect data

um in different years it is very common

to have one column that says year 2020

and then you know you do everything that

you want in that data set then next year

you come and do another measurement and

then you you don't add rows you add

another column that says yeah 2021 and

then year 2022 and then year 2023 so

throughout the time your data set

accumulates observations as rows but

then that is a wide data set that is

very good for

you know looking at it in the form of a

table for example for publishing in a

paper but it's very uncomfortable to

work with in ggplot2 for example because

digiplot2 you know wants to know okay

what is the variable the single column

that contains all ears and then in that

case that is a y type of data set that

has the the variable here spread across

multiple columns so what you want to do

is to devote all those ear columns into

a single one so that the columns become

rows and now you have a single column

called ear where the different rows

belong to different observations for for

ear so that's that's you know how the

the idea of tidy data relates to long

and why it's not you know once you have

it in a in a long format moving it to

white won't make it untidy it's just

it's just a different form and depending

on the tool that you want to use it

might be better or worse

yeah thanks

no more questions or comments

all right thanks a lot then for once we

end sharp at 9 30 on my

um

or my time

whatever time in the world you are

we are in the shop thanks a lot see you

next time

[Music]
