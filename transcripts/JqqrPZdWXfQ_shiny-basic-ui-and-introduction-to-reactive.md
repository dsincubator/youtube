---
type: Video Transcript
title: "Shiny: Basic ui and introduction to reactive()"
description: "today the ds in guido continues with a  series  about um creating and publishing  interactive applications with r in  particular with shiny  and today i wanted "
resource: "https://www.youtube.com/watch?v=JqqrPZdWXfQ"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=JqqrPZdWXfQ"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

today the ds in guido continues with a

series

about um creating and publishing

interactive applications with r in

particular with shiny

and today i wanted to talk about the

basic

ui and a little bit of reactivity just a

tiny bit

uh to introduce what we're going to be

talking about next meet up

and we have already played a little bit

with

a basic shiny application

but we haven't gonna really um

explore the structure of a shiny app and

you know the patterns that we can see in

the code

so the focus of today is to try you know

now move a little bit

uh like go more to them to the code and

see what's going on and try to identify

some patterns that we can use

to um to build on those and to be able

to predict

what should i write if i want to do this

or want to do that so

to begin with um it's pretty interesting

to

refresh this idea that shiny encourages

of the separation between the user

interface

code and the server code basically what

the you know the code that generates the

html that the user will be kind of

looking at i will be interacting with

which is the front end from the backend

which is

the every code that relates to the

behavior of your application

so one you know quick way to be to see

the

uh the bare bones of a shiny application

is to

start typing shiny and then you will see

this snippet

if you're using our studio that is

called shiny up

so i'm gonna do a tab now and that will

populate my empty file with the skeleton

of a shiny app

and this is also in a way a refresher so

we you know usually start by

attaching the shiny package and then

notice how

there is these two sections here the ui

which stands for user interface

and that's you know what i just said is

that you know that

that will host the code that produces

the html

that the user will be interacting with

so this one is

the front end and then the server

function which is not the focus of

today's

meetup is you know the one that uh

host hosts the code for the back-end so

whatever

relates to the um behavior of your

application

and then this shiny app function glues

the two together

and shiny will know how to connect the

user interface with the backend

based on some ids that you as a

programmer need to kind of provide

so let's um dig a little bit into the

user interface code

so to begin with uh remember that um

the user interface is just html so if

if we uh print uh say that

you know this this function here fluid

page

um fluid

page itself is

just a little bit of html text so

there's not a lot of magic in it

and then what we're going to be talking

a lot today is about

all the different

htmls the html code that you can

generate

with shiny for inputs

that the user will kind of provide and

also some

html for placeholders so for spaces

where the

outputs will be kind of displayed on the

screen of the user

and again uh this uh every every

single of these input functions that i'm

showing now here on the screen let me

kind of walk you through this a little

in a little more gentle way let's

make this a little bigger so what we're

going to be talking now is

about the input functions first and then

i'm going to be talking about the output

functions so i'm now searching for the

string input

hopefully you will start seeing some

patterns here

and that is you know what you know i

would like to kind of communicate today

so this idea once you understand how

shiny

kind of works and then you are able to

you know once you learn one or two

functions then you can predict what the

third function will do

but then kind of because there is a

caveat here and i will show you that in

a moment

so input functions have a common

structure

depending on what kind of input you want

there will be a prefix so if you want an

input that is a text

then there's going to be a function that

is called text

input with the a comma case

name if you want a slider then there's

going to be a slider

input function if you want a date it's

going to be a date

input and so on and so forth so that is

the first bit of

structure that i wanted to kind of

communicate the every function that is

an input function

has the word input in it except some

weirdness

like the action bottom one action button

is one other

function that allows users to provide

inputs but unfortunately there is an

inconsistency in the name there so it

doesn't have the suffix

input but you know except for those rare

functions most of them have kind of

input

and then input in the name so that's the

first bit of structure that you wanna

you wanna play and notice because why

you wanna notice that is because you

want you can use

a shiny column column to start

and then tab to uh to you know pop up

the the type completion menu that our

studio provides and then you can start

typing something like input

and then you can learn all the input

functions that

that you have there right so by knowing

what's the structure of the names then

you can basically

learn as you go another piece of very

important

um information about the structure of

the shiny inputs is the very first

argument the first argument for all of

the input functions let's actually pop

up the help file of one of them

say the text input one

and that will be the same for every

other function they all have this

id input id as the first argument

so that is just a string of text in this

case i use the

the string name and that string of text

text has to be unique because it will

allow

shiny to connect the inputs with the

outputs

through that unique identifier and we

will see how

in a moment so for now uh

that's just about it then there is

another argument a second argument that

most

input functions have which is the label

which is you know any

text that will appear describing what

kind of input

or what kind of input you want the user

to provide and that's free text

so and to make this concrete i'm gonna

run this app and this app all it does

is let me kind of walk you through it so

that you kind of start

in your brain predicting what's gonna

happen happen this app

will only show the html that

each of these components produces so if

i run this one in the

independently here on the console you

can see how it produced some html

say that i run this other one here this

one also produces some html

and then all of these together wrapped

in fluid page

will produce you know again the whole

page that the user will be looking at

and to make this live i need to kind of

run that

uh with a call to server

and then wrapped in shiny app so the

server function is empty so what for now

and the focus of this meetup and we're

going to be using only uh we're gonna be

playing only with the

um or mostly with the ui so

there is no behavior in this app but

once i run it let's click this button

here run

up you will see at least what the

the shiny app could look like on the

user's page

so i'll continue up here

okay so i think that

what i'll do here i screw up with the

names

of the app there you go

thank you

right uh now let's pop up

the window thanks jackson so what

happened here let me explain the error

is that shiny also has some um

patterns for kind of this yeah

identifies the name

of the file that you from which you are

running the app

and the button run app is looking for a

file that is called app.r

or something like that and so i was

using that button and it was failing but

you know jackson pointed that if i just

highlight the whole code and and run it

and source it then it should work and it

did

so the app that you saw before um

is the one that we have here on the

screen so i'm going to move this to the

right and walk you through it

so as you can see the first input here

that says free text

right uh simply generated this field

here where the user can input anything

right just text

the slider is what you expect is for

numeric inputs

there is more kinds of numeric inputs

that you might want

to allow the user to provide and if you

want to see them all you can go to the

to the shiny um to the master in shiny

book

and see all the options that you have

but here i want to give you just

one one example of each of the different

kind of kinds of inputs that you want

the user uh to provide so free text the

first one you can use the function text

input

a slider is for numeric inputs

a date input as you you can expect you

know gives you a little calendar which

is pretty cute

then the select input function gives you

uh

one of the multiple ways in which you

can provide and

allow the user to provide multiple and

unlimited choices

so this is the drop down menu is one

option but then there's also like radio

buttons as well that people that can

click

on little boxes and and that's another

kind of limited choices

input that you can ask the users to

provide then there's this button for

file

uploads which you know gives you an

interface for

choosing files in your system

and then there is this action button

which is the one that i told you that

unfortunately doesn't have the name

the word input in its name so that's

about

it for inputs you

are welcome to explore the documentation

of shiny to identify more

and i mean the the more kinds of um

input functions that shiny provides but

the basic

types are the ones that are described

here text inputs

numeric inputs date inputs multiple or

limited choices and

action buttons so moving on to

the output so that is uh so far you know

which has we just created

um a page for the users to provide

inputs

but then the users eventually will you

know make a selection

as you know the ones i was giving uh in

this app here so say you know they will

choose

you know numeric input 50 they may type

something here let me choose

it whatever and those inputs you know

you will be doing something with them

and then the computations that you

create in

r then you want to output them in a

placeholder on that page so the user can

see

what the output is right so that is

going to be the focus of the second half

of the meetup the idea of outputs

so um let's uh it's very similar

they also have a structure that

hopefully will

will understand um the

uh the word output is there in the names

so if i highlight output

you can see similarly to the input

functions

there is a suffix in this case output so

for text outputs

for plot outputs for table outputs and

so these are the three kinds of outputs

that i'm going to be showing

today and that's almost everything there

is also

the download option as an output

but it requires a different kind of

program it's a bit more complex so we're

going to cover that in the future

so for now we're going to be focusing on

these three kinds of outputs

text output plots

and tables right um and

here is um again the

id identifier so the first argument of

each of these functions

again is one of those ids that you

already

know about in this case let's look at

the documentation

for text output so in this case you know

before it was called

input id now it's called output id but

it's kind of the same

the same idea and then that id and this

is where the

like the style of programming in shiny

may be a little bit not familiar and

and it's kind of it's something kind of

uh so

the idea that you uh give

to each output function on the server

side

has to be assigned to so

the structure is the one that i'm

showing here for every

output function that you give an id

there will be

an assignment on the server side to

that id on the object output

so this style of programming where you

know you build objects

is is not kind of i mean it's totally

supported in

r but it's not probably the one that we

are more used to uh programming with

uh so this in the beginning may take a

little while to digest but then

you know it's you know once you get used

to it it should be fun

so let's have a quick look to the app

that i have here

and see um what kinds of

output functions we can use and what

they look

like so let's start by running this app

i'm going to select the code and

and run it all to show you a little bit

what we have here

and then we go back to the to the code

and kind of break it down

here we have the app

right so this is a page

that we could be kind of showing the

user as output

this text string here at the top

comes from

here right so for every uh

so if you want to create a placeholder

for some text so this this line of code

i'm highlighting here all it's doing is

creating a placeholder

on the page for some text to leave on

the user interface

side so on the ui side of the

application

i'm not giving the text i'm just

creating a space for that text to be so

if i go back to the app

and the space every all this space here

the white space here is exactly what

this

line of code is generating but the

string that you read here the literal

string text is not coming from here it

is coming from down here

so this is the text that appears there

if i do

some other text

and run this up

you should see the new text

this is my rc is a little slow today

you should see the new text there and

let's try

identify the structure of this thing so

because we have this

render function on the server side that

is new to us

and again this meetup is about the

user interface not so much about the

server

but we have to do some uh something on

the server side so that you can at least

look at the results of the ui so i kind

of

and this this part here will take a bit

longer

later to understand what's going on here

but uh

but we need that code there at least to

be able to stare at an app that you know

has something useful

so as you see now you know the string

some other text

appears on the app and that is because i

added it here

so how does it work well okay so you

already know that if

the kind of output that i want to create

is text

i will be looking at some functions that

have the text

word in them or similar and

the id that i created here so the

identifier is called in this case some

text that's the id that i chose for it

and notice how that id is assigned

to right we assign into that

um id and on the object

output so every for every

output you know we have to build this

object called output and it has to have

as many elements as

ids we have a given in the

um in the user interface

so this and then what is this render

thing well the render

is basically we have to um actually

tell shiny to identify those identifiers

and you know do the action of uh so

this this render text would be the

equivalent to in the console called the

function print

so we can think for now as uh as being

an equivalent for

for print in the shiny world so for

different kinds of outputs you have to

call these different kinds of rendering

functions

and for example for plot right you need

the

render plot function

yeah so when i created this second line

here which is a plot output then i need

if i want to show

that uh in the user

and in this on the uh on the on the page

that you the user will be looking at

i need to assign that id in this case

i call this id sumplot right i have to

assign

into some some plot and on the object

output and finally uh the

one last one here is for a table so same

thing here

sorry i'm moving in a very an easy way

the table output so i'm creating a

placeholder for the table

here and then i am actually

printing a plot sorry the table is

at the back here this one and then i'm

printing a table

with the render table function and in a

moment i'm going to be explaining

what this data thing is but before that

i want to acknowledge that we have

reached the

20 past time cj is about to kick me out

so i'm going to make a little pause here

and

um and ask for you know

for your questions and then whatever

time we are left with

i'm gonna explain uh this reactive

function here

um all right so your questions are

comments

um i don't know if this is so worthwhile

saying but

my experience is this thing that you're

showing today is where

things get really confusing usually

people ask a lot of questions about it i

get super confused about it so

if you're trying to do this just hang in

there and keep trying

um that's also my experience it's really

easy

to grasp if you do it yourself how

things are connected

and that the inputs are not necessarily

connected to the outputs

but that you have to prepare one and

render and render functions

and then output it at once i mean once

you're

doing it it becomes so much clearer yeah

totally agree the

because the paradigm of programming that

the shiny uses this kind of idea of

reactive programming is so different to

the normal

experience of our user and in the

beginning there's a lot of overhead we

need to think very hard like how things

are connected but then

then you know once you become familiar

all that complexity kind of

fades away disappears and you can't

really focus on what really matters

but in the beginning you know it does

seem very weird one way in which i like

understanding things is by breaking them

so for example here i have on the right

i have the outputs so

the app running uh let me put this here

to the right

and then on the left i have um

i have the the code so see

for example that the the one thing i

would like to do now is for example to

break

the say let's let's break the plot so

i you know i was trying to teach you

that the the id

in this case the word sum plot

is key in connecting the what you know

the inputs and outputs so if i

uh change for example here

the id instead of saying some plot i say

plot i am breaking uh the app

what will happen is that shiny will be

looking for an object

for an id called plot and we will find

nothing so what i would expect

is here on the app to appear just a

white space so

let's run that up again and see if that

really happens

just taking a little while compute

okay i'm gonna do is close this and run

this again

okay so what i expected is to break

the plot

and what happened it looks like i didn't

plot server some table

interesting some plot plot

huh okay i think i'll need to

to restart oh thanks

maybe not yeah well but that's a good uh

a good way to solve products

anyway my my point is that you know you

can you can learn by building things one

by one and also once you have something

useful you can learn by

distracting things one by one and and

moving things

until you um you understand how things

connect

while i play with this i'm you know

listening for more questions or comments

over there

and then i'm going to explain the

reactive function here

uh i think i have a comment question

very much related to what constance that

you said about

like i i still don't see the um

like the how to say it how the input

file relates to the output files because

we didn't have

like this blocked for example in the

input file

so i know i uh we will get to this but

for until now like what what would you

say about like how

these two files are related to each

other okay good

no the file inputs you mean this file

here

and this file here yes okay

no sorry this might be confusing but no

it is the names of the files there

are artificial names that i created just

to for to remember

you know to show first everything that

relates to

inputs and then second everything that

relates to outputs so the names of the

files are not important

except except that i mean if you want

the app to be clever

clever what you really want to do is to

call the file app.r so that's the only

convention

and maybe i think there is also another

older convention

by which you can separate the ui in a

file called ui.r

and the server function in a

server.r i think that's probably the

older convention

but these days you can put everything in

one single

file called app.r is that right jackson

may you you're watching there and you

remember what was the convention or

anyone else

yeah i believe that's correct um and i

have also been confused by that and

yeah just i will restate that you often

see this in

examples or or like tutorials or

something that maybe are a bit old so

it's good to be aware of that

thanks it depends on where you use app

uh

some some apps uh shiny apps and stuff

require you to have net.r

that just comes running out with ui

answer but it's not

uh so you can serve it just with ui and

super

build um and then so you can extract the

more

like separate module yeah their own

server files

probably one comment that i would have

as a developer is

that um you know in this room we have

people with a more focus and interest in

technical stuff and other people are

more interested in the concepts

so i think shiny meets us all in the

middle

and because you know for those who are

more interested in the analysis side of

things and understanding the concepts

and communicating the context

the context all you need to know really

is that shiny is a great tool

that we can build for you so that

you know the people that you interact

with your stakeholders

do not need to know any r to use the

tools that we build so that's

just about everything that you need to

know as shiny and and then

the implementation details all these

weird things that i'm trying to explain

today you know

the names of the functions how the

inputs and outputs connect and all that

stuff

i consider that a super low level detail

that is exciting for me as a programmer

but it shouldn't be exciting for someone

who is

more on the concept side of things more

on the research side of things

and i don't think you should learn it to

be honest so let's be clear about that i

think that this

is you know it's a great tool but we do

have people are interested in

in those lower level details and if you

are not then then

fine it's not that this meetup is a

statement for you having to learn these

things

uh so how far you get into shiny

uh is is totally up to you i mean we do

have resources and the resources are

expanding

of skills in shiny and i'm including

myself in there there's jackson there's

cj there's a bunch of people

and it's olga you know i have built uh

applications as well

but if you are not seeing yourself as

someone who might be writing this code

that's totally fine and that's

that's kind of expected but still the

interest in china has been so great that

we have to have this meet up here

um i'd like to say once in one minute

maybe daisy wanted to clarify your

question

no yes it is is what what constance just

say

on the chat like my my question was only

related to the to the names of the files

but yeah i guess

cool and in the last few seconds i would

like to describe

this reactive function here and that's

kind of an introduction to

the next meetup so shiny um

uses what's called a particular paradigm

of programming is called reactive

programming

and the idea is that um

shiny does a lot of things under the

hood you know you just need to tell them

what you want and then shiny will do a

bunch of things for you

and this idea of reactive expressions uh

is very heavily used by shiny uh to

save computation so basically when the

user changes

something in the input some

um values change so the if the

application started with

you know the value one in the object x

but then the

the user interacted with the app and

change that uh

number one to ten then somehow shiny

needs to know

that that x is no longer one but now it

is ten

so and there is some computations that

are run in there

so in for the purposes of the app that

i'm showing now here on screen

reactive um the reactive function

what is doing is saving the kind of

computation that you want to perform

and doing it only whenever

you need the computation to happen and

not multiple times so basically reactive

is is a great strategy

in shiny to save computation time

because the applications can get pretty

slow if you don't program

them cleverly and so in this particular

case for example you know all that it is

doing is

wrapping the code have empty cars

uh for to show only 15 rows so it's

doing a little bit of computation it's

not an expensive

computation but you know pretend that it

is

so if if we are going to be using that

computation in multiple places what you

want to do

is to compute it only once and then

let shiny reduce the value every time

that it needs it

so in this particular case for example

i'm using

empty cars so this this value here

i'm using it in this plot to build the

plot and i'm using it also to create a

table here

so i could replace this with that uh

so and recompute you know the object

empty cars for 15 rows twice but that

would be

expensive in terms of computation right

not in this particular case but pretend

that it is an expensive computation so

the one way in which you can extract

that computation and make your shiny

apps

run faster is by using very heavily this

reactive

um function and extract the computations

in in another place

and then you know the code that you have

here could be um simply become

something like this so instead of um

you know using the data you have

assigned here you just

call the um the name that you created

here

but you call it as a function right it's

a little weird i know

shiny has a lot of these kind of weird

things but uh

it's not that hard once you get used to

it that's that's the way it works

uh okay we'll be talking about sorry

it's a nightmare to debug and to find

actually where those brackets are

and it's a nightmare to the box yeah

yeah so we also will get to

debugging shiny hopefully at some point

in

another meet up um okay uh thanks a lot

also with what we said today if if you

realize that shinee is uh you know right

in shiny it's not very exciting to you

you're very

feel free to not join other meetups in

the series

it is going to be very low level and

very kind of

detail technical oriented so um if you

want to

hang out to learn about those things do

it but if you want to drop then

you're also very welcome to do it too

all right that's all for today

thank you very much everyone unless we

have any last comment or question before

we leave

i smile thank you all right thank you
