---
type: Video Transcript
title: "Tidy EDA: The data-science workflow and toolkit: An overview"
description: "the decent guitar continues on the  series about exploratory data analysis  uh with the tidy verse  and expanded family because we're also  talking about our ma"
resource: "https://www.youtube.com/watch?v=0-zQ69P6VsY"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=0-zQ69P6VsY"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

the decent guitar continues on the

series about exploratory data analysis

uh with the tidy verse

and expanded family because we're also

talking about our markdown documents

today

and doesn't strictly belong to the

television organization but

but well last time actually we started

with a

preliminary meet up which

covered

some of those things that belong to more

like your setting uh your setup of uh

your toolkit um and uh you know that

makes your workflow

uh

you know more useful less error prone

and today actually i wanted to kick off

with the exploration of the data but you

know

we are still

in need to at least you know overview

some of the main tools that we're going

to be using in the series so i don't

think we're going gonna actually get to

exploring data yet

but uh so before i keep talking let me

share my screen because i forgot to do

that um

and also let's see

faria i think you were the first joining

today could you

help me

shut up at 20 past

if you remember just just mention the

time or something i usually remember

these days but the fact that i

assign someone to kick me out makes me

remember

that i have to actually stop talking

so great um so

can you see my screen

now

yes oh cool

so yeah the idea is today to talk about

the data science workflow in general

even without you know thinking about the

tools what is

that data scientist does

um

at work and then actually get you know

quickly into the toolkit and overview

very very very quickly um the main tools

that we are going to be talking about in

this series there is a lot more

uh tools that you might want to learn

about and probably the best way to learn

that is to read the data science the art

for data science book by hadley wickham

which is the book that is um

inspiring this series in particular

chapter seven the one about explorative

exploratory data analysis but yeah today

let's talk about basically what's the

workflow uh and then introduce our

markdown documents and introduce the two

main tools for exploring data uh

digiblot 2 which is going to be our tool

for visualization and deployer which is

going to be our tool for transforming

data

um so with that i'm going to now jump to

the document that is going to guide our

our meetup so first i want to introduce

like this image which is at the very

beginning i think of the art for data

science book

that very nicely captures

the distinct steps

in the work of a data scientist so

usually you import the data from

the world you may be scraping data from

the web you may be importing a csb file

that you have in your computer you may

be reading a database whatever

usually that data doesn't come

perfect as you wish

uh then

you may need to tidy that data in some

way

and we're gonna be actually talking

about a very formal definition of what

tidy data means

in the context of the tidy verse

there are many other definitions but

that is a good useful definition for us

and then you enter this gray area

where

it's kind of an iterative process you

know once you have teddy data you are

now able to deploy all the tools for

exploratory data analysis to like deep

pliers that allow you to transform your

data tools like ggplot2 that allow you

to visualize your data another tool is

to model your data and extract patterns

that might contain that your data might

contain and you might be interested in

understanding or even extracting to see

what remains after you remove some

pattern and then you know once you you

you know went into that loop a few times

you will kind of walk away with some new

understanding of your data

and you may need to

usually you need to communicate that to

others or even to yourself sometimes you

know just the idea of of making that

process

explicit and capturing it in writing

just helps you clarify your own thinking

and helps kind of move

in a very focused way towards answering

the the research questions that you may

have in your head or sometimes you start

blank you don't even know what to ask

your data because you don't know what

insights that data may contain so

exploratory data analysis does that

allows you uh to have you know it gives

you a system to you know start

generating questions and then uh you

know using the tools that we're going to

be talking about today you can start

answering those questions and that you

know as you move in answering one

question you may have many other new

questions that you might want to explore

and that's the idea

so uh the

tools that we are going to be

overviewing today are tools for

communication first i'm going to be

talking about this special flavor of our

file that is called our markdown file

then i'm going to be talking about the

tool to visualize that to visualize data

which is a tool called ggplot2 that

comes from you know a collection of

packages or a family of packages called

the tidiverse

and then uh we i'm also going to be

talking about deep player which is the

tool that allows you to transform data

we are going to be living you know

outside

some tools

today and in the series as well but even

with a few things that we're going to be

covering in this series you will be able

to explore your data quite deeply

so there is not a lot that you need in

terms of tooling to extract useful

insights from your data

so let me jump now to our studio and

show you uh what are

our markdown documents um

just by the way you know i'm sure that a

lot of

you may already be using these tools

today so uh even for those i think that

you know jackson and i recently you know

went through a workshop that you know

delivered this content in a more

expanded way

and uh even when you know we entered the

workshop thinking that we knew it all

then we realized that you know making it

kind of formal it taught us a number of

things

hopefully even if you have experience

with these tools and the way that we're

going to be thinking about those tools

today will give us like a new way or new

perspective about the same tools that we

already know and if you don't know the

tools then great you know uh you know

hopefully this will be your shortcut to

kind of learning the the minimum things

that you need to know for success

so let's go to our studio

um

i'm gonna

[Music]

start opening a new file so i'm gonna go

to file new file

and i'm gonna go to our markdown

this is something you can do yourself uh

if you just you know follow the defaults

you will

create a template

uh a new our markdown file that allows

you to actually learn about our markdown

files you know the template that you get

is kind of self-explanatory

so i'm going to overview it very quickly

but the very first thing you would you

will want to do is

just click this

blue button there

it's called nit

and

you will need to save it let's do a test

rmd

and save that file

so when you save it then

what you get is in the viewer panel the

output

of

running nit on that file so that file

has a few sections that are kind of

interesting the very first section is

called the yama header

that header will define for example the

type of document that you're using now

we asked for a type of document that is

called html

but i usually like a different flavor of

document i like the document is called

github document

then there is a section that and the

title is not compulsory so you could

remove it if you wanted

then there is a section for setup

usually you know the setup that you get

is kind of just fine echo equals true

means that um

that you will see

code that you write inside this code

chunks that are defined by these weird

syntax is bacterique you know curly

braces are blah blah blah it's kind of

weird but yeah it is what it is

uh and you can insert new chunks just by

going here click there and you say r and

that inserts a new r chunk

empty and then inside that you can write

code and then the beauty of this file is

that is you know the reason why i saw

power for communication is because it

allows you to mix

prose and code

and that's great because you can explain

something in words and then right next

to those words you have a code chunk and

then you have more words and then more

code and more words and more cover so

that generates this kind of um

a document right that

where the code and the pros is next to

each other and that is very

useful

to understand your thinking process and

accompany that with the actual code that

runs because not only you see the the

code which is here some are you know

shown in gray but also see the output so

basically anything that you it will be

printed to your console appears here in

the document itself so for example if

you if you typed this you know words

summary cards on the console

let's run that

you can see output right so exactly that

output i could go to your screen that is

the output that goes here in the uh you

know behind the chunks

so uh as i explain our markdown

documents i also kind of use this as an

opportunity to kind of show you how i

like them most you don't have to you

know use my ways but

but you can so if you say equal eco

equals false instead of the output

instead of seeing the code and the

output you only see the output as you

can see here but you don't see the code

that generated it so in general what you

want is equals true

um

and that's it for now i

don't want to confuse you more

it's great because also it allows you to

add you know links to places it allows

you to introduce figures for example

this code chunk will produce a figure

and if i scroll down here here you see

how the figure is there

okay why i like

um

the

this type of document the github

document i like it because when you

click neat it doesn't create an html

file instead it creates a file called

dot md markdown

and that file is

very cleverly displayed on github

as a web page so i'm going to show you

uh what i mean

by that uh so if i if i'm here like in

this file for example let me open the

file that hosts the

today's meetup so this is the file that

i created to you know for for the meetup

today if i need this file what i see

here on my viewer in a moment

is the file

that i showed you in the beginning of

this meet up i can go to this you know i

can open the md file now here which is

is an output of of hitting neat on the

rmd file and if i go and try to see that

file on github

what you see is is this

so

the md file

is something that github already knows

how to render and it shows it as if it

was an html but it's actually not

um i find html is like difficult to

to read as

compared to md files basically but

anyway that is the file type that

i'm gonna be using in this series um so

now enough about uh

our markdown the next thing i want to

mention is the toolkit so our markdown

was one of the tools

actually it's not formally part of the

tigers but the tigers is a collection of

packages that do have

tools for each of those steps in the

data science workflow so the very first

uh no so how you use the tidy verse

oops actually i didn't mean to do that i

clicked on the figure and it popped it

popped it up so if you want to learn

more about the tires you can go to this

url but basically the way you use it is

as you use any other package instead

the only difference is that instead of

attaching just one package it attaches a

bunch of packages so if i do library tie

divers you can see that i get a bunch of

packages i get the package you know

chichi plot2 which is the one that i'm

going to be talking about in a moment

and also i get the plier which is the

one i'm going to be talking next but

then you also get a few other packages

that are so common

in the live or in the day of the data

scientist that they are attached by

default so in our studio what it could

look like so if i'm here in my console

and if i type library titlers

what i get is what you saw on that

document again so i see a bunch of

packages and also i get a bunch of

warnings that you know some functions

may be in conflict between different

packages but that's something i don't

want to get

on just now

um

so um the tool for visualization which

is the one that we're going to be

using along this series

it's called ggplot2 it is one of the

many packages that come with the thai

diverse and it is based on

it is a grammar really it's the

implementation of a grammar in the same

way that in english it has specific

rules and ways to compose different

words and create meaning the same thing

happens with visuals someone back in the

day i think in the 70s wrote the grammar

of graphics a paper i believe it is or a

book and then hadley wickham who is the

developer of ggplot2 used that idea and

wrote code that implements that idea

so ggplot2 is no more and no less than

the implementation and one

implementation of the grammar of

graphics and it's based in

this very simple idea that you can take

data

in this case represented by a

spreadsheet you can take a coordinate

system in this case

just like an x and y type of plot and

it's not the only one there's also

radial systems as opposed to you know

this uh you know like two-dimensional

one

but you know the default one is you know

x and y's

and then you know when you map data to

the coordinate system with a specific

representation of the data then you get

the plot

and this representation in this case is

a point but it could be anything else it

could be a line it could be you know a

bunch of other things so those things

those visual representations of your

data is is in g plot 2 is called genomes

for geometric representation of your

data

so that is the idea and it is it is very

structured so this there is a template

is so structured that you know there is

this template that you can reduce all

the time so this is how it works so

basically you have to call this function

called ggplot

and tell it which data set you want to

use in this case you know the dataset

diamonds comes with ggplot2 so it's

already available when you attach ggplot

by calling library ggplot2

and then you add a new layer by adding

the plus

symbol here

and then

in the other layer you define the

geometric representation

that you want in this case i want to

represent my data with a bar so i use

the geom bar the geometric

representation bar

and then this idea of mappings which is

you know how you map your data to the

geometric representation okay there is

in the data set diamonds there is a

bunch of columns in this case we want to

just put the column called cut so the

data contains a column called cut

we want to put that on the x axis

and that is gonna be my columns so if i

do that you know i get a plot like the

one that you see here on screen tomorrow

thanks faria let's see how much i have

to cover she plot two deep player

okay i think i can i can push through

this in about five minutes and leave

five minutes for four questions

um

so yeah this is one example of the usage

but you will see that you know there is

a template embedded in that and this is

it so basically you always call ggplot

with some kind of data and then you add

layers as you want you can you can add

as many layers as you want you can you

may on top of these bars you know you

could represent your data in some other

way so you could in the same plot maybe

you can you know plot points and lines

one on top of the other so this is this

idea of the layered grammar of graphics

and uh

the structure is always some kind of

geom function

yeah that allows you to explain how you

want to map your data

to your

you know accesses to your coordinate

system

so

a little demo here

that i would like to do is if i do

ggplot

uh

data equals

diamonds

and if i don't add any representation to

my data the plot still works it's just

that the you know ggplot2 doesn't know

what to put in there but i still get as

you can see here this gray area i still

get a plot i get an empty

uh coordinate system

and this

type of coordinate system is telling me

that the kind of the default coordinate

system is you know the one that is like

you know an x and y so that is the

cartesian coordinate system that is why

you don't have to explain that in your

template but there is ways to change

that coordinate system to something

different than the

cartesian one

um okay so that's enough for ggplot2 so

you're gonna be seeing this template

over and over and over again then there

is other functions that you know you

will probably learn after this series uh

but they are not crucial for

uh what we need to do

in exploratory data analysis at least

not in this chapter

and then the second tool uh is the one

to transform let me go back to the

overview here remember so ggplot2 fits

here is one of the tools to visualize

your data and then the other tool that

i'm going to be mentioning now is the

tool to transform data

and the tool is called dplyer for data

frame data frame is this kind of

spreadsheet-like type of data structure

and that's the name of it in r is called

the data frame so that the frame player

for as if it was a player allows you is

a tool for multiple purposes so that's

the name that's where the name the

player comes from

and the player has a bunch of functions

but there are only very few

verbs very few functions in the form of

verbs that are extremely extremely

useful and allow you to do most of what

you will need to do in general as a data

scientist and in particular

all of what you need to do

in this chapter for exploratory data

analysis

so first before i show you the the verbs

uh that are super important here uh let

me show you what the data set diamonds

contain so if i just call

diamonds and print that to the console

what i get is this data set that has a

bunch of variables including for example

cats and including for example price so

what is the price of a diamond that has

ideal cat or has good cut or has you

know premium cut

so

one of the very important verbs that the

player contains is the verb select as it

suggests it allows you to select in this

case columns from your data set so

remember uh you know there were all

these columns so let's say that we want

to take the data set diamonds

and select

only two columns cut and price so this

is how you do that the very first

argument of select is the data set and

then any other argument after that

you know you can pass the different

names of the columns just as they are

you don't need to add any quote or

anything and the player will select them

so instead of you know printing the

whole diamonds data set here we only

print cut and price

so

this is one way of using the player but

you can also use it in this other way

where you take the data set and you

extract it out of the function put it to

the left

or to the top like here right and

within select you only use the names of

the columns so this is just another

syntax this weird thingy operator is

called the pipe so you can take diamonds

and then select the columns cut and

price so that's that is how you could

word this code you can explain that you

can read that code actually fairly

clearly so take the data set diamonds

and then this is how you read then is

how it reads the pipe select the columns

cut and price

for a more realistic and more complex

example let's try to read this other

code over here so we are doing here is

we take the data set diamonds

and then we select the columns cut and

price

then we count

the unique values of the column cut

and then we fill there only the rows

where the n

column which is generated by count is

greater than in this case ten thousand i

here is a typo right so notice how

readable this is and how much how well

it scales up there is no limit to how

many functions how many verbs you can

use one after the other it doesn't

impair readability and that is the the

beauty of the pipe you may or may not

like what it looks like but it is

really readable for comparison what do i

mean by readable okay the best way is to

probably compare how we were able to

phrase that in words in human words that

someone could understand and to see that

displayed one on top of the other

compared to this other way to do exactly

the same but good luck trying to read

this code so this is the traditional way

of composing functions of creating you

know a complex

pipeline of operations by nesting you

know one operation inside the other so

this could be a very normal code only

five years ago but now this is um at

least in the in the world not in so much

in the world of creating software but in

the world of actually using software to

communicate insights

i think this would be

pretty poor writing because it makes

free readability so so hard

so notice how the output before and

after so these two things are exactly

the same

just different syntax and which is a

tool again for communication so again if

that scientist needs to extract insights

and communicate it to the world or to

themselves so readability is is

paramount here

okay so that brings us to the end of

this document and close to the end of

the media but we still have some time

for questions comments

so please go ahead

i see yaku

and

not sure who was first i think i saw

jaguar first go ahead

okay i'll go first

um

so this is this is related to the pipe

i've been tracked

to

write code using the pipe to make it

more readable

um but what i don't get like when you

show that example of diamonds um

so you say

uh you always call the dataset first and

then you start applying the the pipe to

two different functions

um

say i wanna i wanna do all these

functions two diamonds i wanna reshape

diamonds data

oh is there like a better way to do that

say again because i know if i was the

only one but your voice came very choppy

very cut can you say again so say that

you want to reshape diamonds through a

pipeline yeah so go ahead yeah

yeah if i want to shape diamonds how how

would i do that like the example you

showed doesn't doesn't change the laser

frame right but like if i want to change

diamonds using those functions using the

pipe

what's the best approach

actually good um i'm going to first show

it on the console to show you how the

thing kind of keeps

changing along the way and then i'm

going to use i understand you code in

python right

sorry i understand that you come from

python is that right

yeah before i was in python yeah good so

i think i could also explain in a way

that makes a lot of sense for python

users hopefully so so this is that i

said diamonds let me show you here on my

right right so you see how there is a

bunch of columns

so after the after select

so i'm going to select only these few

these two first rows

you see that the dataset has already

changed

but it's still a data frame right it's

you know in the in the words of a python

is it's an object right so i i created

an object modified it and it's another

object but it's still you know a data

frame object it just it has a different

shape right so now i'm going to go to

the third line

so i so now the result of the second

line has only two columns and 53 930

rows and now i'm going to take that

object and apply count right so this is

what i get now so i only get a data

frame still also a data frame object it

has only two

two columns and has only five rows the

columns are cut and n so now with that i

know i i apply this new function filter

to that object so for you could be

something like

diamonds you know

dot

if this was python would look something

like dot select

dot

count sorry if you come from iron you

don't get what's happening here

so this is pretty much how you write

this in python i know if that makes a

little sense now

yeah

yeah okay i think i think the question

also may have just been so so if you if

you run the pipe on

pipeline on diamonds it's not assigning

it to a new object yet so it runs it

runs the functions but you would need to

then if once you're happy with that you

would then either need to assign that to

diamonds or assign it to a new object

called diamonds reshaped or diamonds

with a bunch of done to it okay

okay so that that's that answers my

question that's what i wasn't sure about

why

why when i apply the pipe why doesn't it

not change the object diamonds but

that's because i didn't assign it let me

just sign up again exactly yeah yeah

thanks a lot uh jackson yeah in r it's

very weird compared to other languages

that

um i mean it has only reference

semantics you know it doesn't change

the underlying object by default so

exactly as jackson said you know you

could you could rewrite this you know if

you will if you wanted something like

this i'll say this and i do this you

know a lot of the time so selected

and then you know this could be

selected

count or n

right something like this would be

what's

selected but then you know these

temporary objects that i'm writing here

and here

uh when when what it matters is the

whole pipeline those objects are kind of

hard to name it's kind of a bit of a

pain you know you have to come up with

names and it clutters your your kind of

pipeline so yeah that that's the pipe

but again i mean that's not the only way

to write code and uh you may use it or

not depending on you know what

you choose pretty much um but that was

great

sorry go ahead

obviously i was just gonna add to what

you were saying i think maybe like it

might be

a bit of an advanced tip but it's like

the the pipe is super useful when you're

just messing around and want to quickly

iterate between like what does it look

like if i select this what does it look

like if i check

these things kind of as a notebook like

not not necessarily that this is going

to be

code that you use but just for your own

understanding of the data it's really

easy to mess around with it

and then when you're happy with the

pipeline and also like when the pipeline

does something that you can name easily

like if the pipeline is calculating the

average cut or something when it does

something that makes sense and you can

name easily that's a really good time to

either save it to a new a new object or

even better extract it into a function

with the name of that function

explaining exactly what that does

and like this is kind of it's more

advanced like this is almost like

this is kind of like best practices but

once if you get into that headspace

then you realize like

oh this like okay diamond like select

diamonds whatever that's kind of you

don't really need a function to do that

the function is just select right you

don't need to extract that into into its

own module but if your pipeline is

trying to do some logic and trying to do

some piece of like

analysis then naming a function that can

explain what that analysis is really

helps the readability of your code

exactly so so exactly what mario's done

if once that pipeline does something

useful

name it whatever it does that's useful

extract it as a function and then call

it like that and that way when you go

back to look at your code you don't just

have to look at like hundreds of lines

of pipe yeah you can look at you just

can see exactly okay this is you know

calculating the adverb whatever uh

only

sorry i didn't i wasn't paying attention

to what this pipe does but

whatever this pipe does

we're going to techie though and uh

annie's waiting very patiently sorry

your turn

no thanks that's super interesting um

just two questions so the first one is

um

so now we selected the rows and now the

columns how do we select rows do we do

this with the filter function or how do

we do this and then the second one is um

but jackson kind of answer it like is it

better like is the best case if i'm

doing like pipe extensionally

long

um or is it better like is it better to

interrupt it with like assigning

different steps and having those steps

within the pipe again

yeah that's right so listen to the

second one first i think um

i think i mean for you actually coming

with such a strong background in

communication i think that could could

drive

your decisions about when

you you want to split the pipeline so

the pipeline is can be infinite to be

honest so it depends on you where you

cut it there's no like you know hard

rule i mean people say something like

okay you know if you can't fit if if

your pipeline is so long that you know

it goes over the page that means like no

one is going to be able to read that and

and you're holding so much context in

your head you know you know the pipeline

also allows you to kind of in a way run

that code on your head and you expect

some output right but if if if there is

so much content you know i also know

that you know from from kind of

cognitive science you know humans can't

hold more than what like seven items at

most or maybe some more some less so i

would say the pipeline is more like

maybe four

five verbs it's already getting very

close to just i i don't know what's

gonna happen at the end of this pipeline

so that would be my my very fuzzy rule

uh you know

four or five things something that you

know a human can call in the brain and

if by that time you haven't reached the

point that you're able to assign that

output to something to some name

then something is wrong there you know

say let me go back to

um

here so here is where i would say um

i know

a good

name that represents the meaning of this

pipeline right so if you are reading

this code quickly just this name would

more or less summarize everything else

in this pipeline and if the pipeline is

very long very easy you know it's very

common that you will find a really hard

time trying to come up with a name that

capture that summarizes all that has

happened in a very long pipeline

very fussy answer but that's more or

less

a touch on what you were kind of asking

yes that was it yeah perfect

and then the other one was

remind me please selecting the rows uh

yes exactly yeah the verve is is filter

so um

the yeah absolutely so you can read more

about how precisely you could do that

but you know with diamonds

let's do another example so the diamonds

data set say has

um i you know karate

or cat ideal premium good and i could i

could say something like okay

filter the

row

so filter diagonal so take diamonds then

filter rows where cut

equals

ideal right and that will just give me

the ideal ones and then on top of that i

can say comma

also where color

equals

j

and something broke there

let's do something

easier to me

yeah

why color was like a british english and

not so ah there you go color

okay there you go so and that's you know

that's the the basic rule this basic

pattern that you could use to you know

refine your

filter call

to get specifically the rows that you

want you could be anything okay

yes

cool

perfect

any other questions or comments

what does table mean

uh there was a column i think no yeah

okay i was just playing with what else i

could do yeah just an example

oh thanks marvel that was super useful

oh thank you all i

went all the time by a lot next time

promise we actually start exploring our

data

if you have data and

you can also you know bring it on and

maybe

we can reflect on the things that we

explore on this toy data set we can

probably try something with your data

maybe not i'm not sure if during the

meetup but maybe as a discussion

afterwards

thanks miles

bye bye

thank you thank you
