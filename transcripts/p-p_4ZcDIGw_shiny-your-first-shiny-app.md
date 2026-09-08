---
type: Video Transcript
title: "Shiny: Your first shiny app"
description: "so today we start a new series about  building and polishing shiny apps  um we are gonna go  broad uh maybe not super super deep  um into building shiny apps be"
resource: "https://www.youtube.com/watch?v=p-p_4ZcDIGw"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=p-p_4ZcDIGw"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

so today we start a new series about

building and polishing shiny apps

um we are gonna go

broad uh maybe not super super deep

um into building shiny apps because

i want to cover also the aspect of

polishing i think that in at 2 degrees

we have we have some expertise

for building shiny apps

for production so my goal with this

series

is to give everyone the the tools that

you need to create basically minimum

viable

products that then uh could be you know

deployed to production with a little bit

more effort but uh

but i'd like to everyone um that is

interested to

be able to to get started using shiny

and get it published get your brother's

products published so you can start

communicating

with your stakeholders even if they

don't use

r or they're not interested in using r

so basically with shiny

uh you can you know do all the heavy

lifting of artwork yourself and then

share with your stakeholder something

that they can just you know put

a url in a web browser and there you

have they have access to

your analysis your results and they can

point and click

and regenerate some analysis on the fly

so they can answer their own questions

so that's the goal for this series

in particular today is you know getting

started we want

to build our first shiny app even if you

have already built

shiny app before and also i'm gonna be

showing how to deploy it

to a service that is pretty simple to

set up

which is shinyapps.io the resource that

we'll be following

is the mastering shiny book by hadley

wickham

which he's been working on this book for

a while but has been kind of

officially released and published in

print very recently

less than a month ago so it's a good

time to actually

um yeah advertise this book

so let's get started uh the book starts

with chapter one which is what we're

going to be covering now the goal of

this

particular session is to give you a an

understanding of the major

pieces of a shiny app which are

basically two

which is the user interface and the

server the user interface what it is

is all about how your application looks

and the server

is all about how your application works

so

the book does not cover a lot about

publishing services but we will record

publishing services because i think we

need them uh often

and it's good to have alternatives um

so i'd like to kind of sample a few so

getting started

is fairly simple all you need is to

create a directory and inside that

directory to put a file called

apps.r just heads up that

this particular mid tab is going to be

very

more like if that word exceed so

basically you know i'm gonna show you

things and the concepts may come a

little later so now it's more about okay

this is how you do it

and then we're gonna explain more in in

later meet ups which is an approach that

had uses a lot in his books

he gets the readers uh up and running

very quickly even

you know if our mental models are still

patchy

and then he kind of fills the gaps as he

continues throughout the

the book so that's the model that i'm

going to be following

so i'm going to show you where i am i'm

at a new repository called yes

shiny which will be hosting the

different meetups that we

run and for now it's pretty much empty

it just has a license

file and it has a readme that shows the

syllabus

so what i'm going to be doing now is i'm

going to create a directory

to show you how simple it is to set up a

shiny app

so let's call it say my app or my first

app

first up so here you have it

there is my new directory so now inside

that directory i would like to create

a new file uh let's call it let's save

it

uh us inside my first app and let's call

it

app.r the name is important

because that name is going to be

interpreted automatically by shiny

uh in in a number of ways

to create so this is the basic

infrastructure

now let's talk about the basic um

boilerplate

that you need to create a shiny app uh

if you go to the book

you will see that it looks a little bit

complex but

the complexity will be

will disappear once you understand how

it works and also how to get that

boilerplate

immediately with a keyboard shortcut so

this is

the boilerplate of a

minimal shiny app i'm going to show you

now with one keyboard shortcut how you

can create this thing

basically all it's doing is first using

the package lighter

the package shiny because shiny is on

our package

and then creating the two main

components of a shiny app of

every shiny app a user interface

here and a server which in this case

is empty so this is minimal uh it won't

do

anything it will show the word hello

world

in a web page but it won't do anything

and then it ends with a call to shiny up

calling passing as arguments the user

interface that we defined first

and the server that we defined second so

that's the the minimal

skeleton of a basic shiny app how do we

do that well you can memorize that

eventually but

you can also start typing shiny and you

will see

shiny okay so if you start typing shiny

app you will see that our studio will

um if you are working on our studio you

will see this

uh what's called snippet uh

this icon of a little paper and it says

snip it to the right you know in

in curly braces so if you

hit tab that will auto complete that

boilerplate that i showed you before

so basically to follow the example that

hadley published in his first app

all we need to do here is to add the

word the phrase

hello world and that's it so we have all

the components we are first using shiny

we are defining a user interface and we

are

defining um the function that

you know will contain that will describe

how our application works

which for now it's empty and then we put

all those pieces together

with a call to shinya now

to demystify this i'm going to show you

what these elements are so they call the

fluid page

so fluid page is just one what's called

layout function

all it does it creates html

so the the beauty in a way of shiny is

not that it's going to give you the

most beautiful

most interactive most perfect app

instead its beauty is that it

curates some of you know the diversity

of options that you have in the world of

html and gives you a bunch of tools

a few set of tools with which you can

create very quickly

uh very powerful

web pages without knowing too much about

html

css javascript and stuff like that so if

i run

fluid page uh the call to fluid page on

itself

and i run it to the console well i get

an error because i didn't load

i didn't attach shiny but if i did

what i would expect to see here is just

html

so if you know how to write html like

this

then you may not even need a lot of

shiny right but

shiny will do all that uh html

weird stuff under the hoods for you so

you need to know

about that so that's its beauty is the

ability to give you minimum viable

products

interactive for creating reports that

you can share with your stakeholders

even if they don't care much about r all

right so

how do we actually run the app well

there is this

button called run app and i'm not very

sure but i think this button becomes

available when

a call to shiny app exists

in a file maybe let's try removing

this from here and see what happens yeah

so if i remove that call to shiny app

see how the bottom run app disappeared

so i'm going to undo that

and save again and at the bottom up here

so what exists in the file

is telling our studio that this is a

shiny app and that's why you know we get

this button

so one way to run our app is to click

that button there

i will see is this window that

should pop up anytime soon

just click reload i'm surprised there it

is um

okay it perhaps a window that is kind of

an art studio window

but also we get an address so if we put

this address

on our web browser we will see the same

app

in our web browser we can also click

here on open in

a browser and that will do just that

basically we'll navigate

to the web browser to that particular

address

so as you can see it's a very boring app

all it says is hello world

and it proves what i discussed before it

proves that

the components that you put inside your

ui

so here determine how your app

looks this app does nothing right

because we didn't do

anything inside the server so there's no

button no interactivity no nothing no

computation

and that is because our server function

here

is empty so there is nothing that

describes how the app

works but we're gonna change that very

soon but before we actually get there

i would like to show the process from

end to end so first i'm gonna show how

to stop the app

you can click here on the stop button

only if you have

that window open well not this one the

web browser so if you have that window

open that now close automatically

you could also just you know close the

window and that will stop the app

but to complete the process uh and

integrate the whole application from end

to end i would

also would like to show how to publish

it in a in a

remote server right so what we saw

before

is that the app was being published in

our own computers but what if you want

to share your app

with someone else you want to probably

publish it online

so one way to do that is with this

little button

here right so let's run the app again

this time

i'm gonna do it differently i'm gonna

source this file

and there's a keyword shortcut in our

studio to sort of source a file which is

shift ctrl enter

so that will as you can see we'll run

the run

calling the the you know the directory

where the app lives

and we should have somewhere there again

i'm surprised i'm not getting that

window popped up but let's click

that again and again we got we get this

bottle so this button is available here

from the window when you launch

the app and also on the file itself

with slightly different options in one

or the other so if you click

publish you will get

access to um this pop-up window

which allows you to set up different

accounts where you may want to publish

your shiny applications

um if you don't have a shiny apps

dot io account you can set it up for

free

up to five applications you get for free

so i recommend you do that so that you

can practice you know the things that we

see

in this meetup and

yeah you know whenever you reach the

limit of five you may start deleting

other ones and adding new ones just to

play

and the signal process is pretty

straightforward

our studio does a very good job at

showing pop-ups with

instructions about how to do it so i'm

not going to cover it

now but remember there is a help desk

for

many of us mine is on wednesdays i think

that you're

something like maybe i think it's 3 p.m

or so

around that so if you are struggling

setting your account

uh let me know and we can work it work

with it together

so for now i'm going to assume that you

have successfully

is set up shiny app storage i'm gonna

click there

and say publish notice how the title

appears

by default using the name of the

directory where i put my

file up dot r if you want you can change

this

to anything but i think that the name

is is okay so i'm gonna hit publish and

this will take a little long

so we can probably it's okay it's

telling me that i already published this

because it might you know try run

i did publish it so it this application

is already online

um and while this

new version of the app runs or is being

deployed

to shiny apps.io i'm going to move on

with the book

and show you how to do some more

interesting things because for now

our app is super boring so let's go back

to

here let's go back to the book

if i find it there you go here

right so we have already deployed and

hopefully publish

in a moment publish our first app which

is empty

and we learn how to run it by sourcing

the file or by clicking the run button

and you will learn also how to stop it

by clicking

the you know the closing the window or

clicking the stop button

so we cover all of that and

it's time to add some ui controls so ui

stands again for user interface so

you want to um add

stuff in there so that the user can

click

point and click different you know

buttons

in the in the web page and that will

eventually translate to computations

uh on the back end so basically you know

the user will be clicking things

and then shiny will interpret those

clicks

as actions that then shiny under the

hood has to run

maybe create a computation show some

results

so in this case what we're going to be

using as an example

is uh first we're going to be listing

all the

data sets that live inside a package

that comes with r

the package is called datasets and it

comes with a bunch of datasets that you

can play with

then we are going to be creating a

summary of one specific data set that

the user chooses

and finally we we're going to be

creating a table

and similar to the tables that you get

with the view function

in r so uh first we're going to be

adding only the user interface

without connecting that user interface

to the kind of our back end so we're

going to just create

the the page but not um

add not give any instruction about how

to actually do

the work let me show you what i mean so

let's go back to the app

remember that if we want to change the

user interface the place to do that

is here you know under the ui function

so i'm going to just paste this for now

there you go and maybe

i'm going to stop the app because it's

taking a little while and i can show you

the result later

stop deployment so i would like to

unpack a little bit what's going on

here the the most important bit here

is probably this one so what's happening

here is that if you use the i mean if

you use the function ls

you're familiar very likely you're

familiar with the function less

so if you do just less it will try to

see if there is any object defined in

your global environment so it will

default to the global environment so if

x takes

one and i do ls i could expect it to

tell me okay there is an object called x

right in the global environment but the

global environment is not the only

environment

that ls uh can read from it can also

read from the environment of a package

so the way you tell ls to look into the

environment of a package is by saying

ls package column and then which package

so in this

case the package that we're interested

in exploring

is the package data set so if i run that

that code what i get

is a vector with all the names of the

data sets that live

in the package data sets right

so we are going to be using that but the

user

we want we don't want the user to type

anything we want the user to click

things

so what we are going to be doing is we

are going to be sticking

that call to ls inside this very

convenient function that is called

select

input with it we give the user

the ability to see this list

of in this case data sets but it could

be c it could be

a vector of anything and then they will

click the one that they want right so

that's exactly the thing that we want

and remember that anything that goes

inside the user interface is

just a convenient way to create html

so if i call if i you know if i print to

the console all this line

the entire call to select input what i

expect to see

is as you see now a bunch of html but

who

look how complicated that html becomes

right so writing all that by hand would

be a total nightmare

so uh things shiny for doing this easy

for me

and then there's these other two

functions that also

create html and maybe it's going to be

clear what they do

once we see them in action but basically

these two functions here

will be creating spaces for things

to exist the two things that we want to

add to this

app is one some code

which is the result of the function

summary on any of the data sets that the

user chooses

and then second a table to make that

data set um like beautiful and on the

screen

so let's run the app now and see what we

get

let's do run app now that we have

some more components in the user

interface

for some reason i'm finding that i need

to click

run up and then reload app which is

surprising

and also surprising that it's taking a

little while so what i'm going to do is

a stop

and i'm going to restart my r session

which sometimes helps a lot

so now again i'm going to do shift ctrl

enter to

source the file that we have here

these triggers the function run up

and it is listening first maybe i have

set up

something in

[Music]

let's see yeah maybe i set up something

so that the

instead of pop ah here is the window

apparently there you go

here is the window it looks like it was

opening the window

behind other windows so we couldn't see

it so as you can see what we have here

is um our little web page

created with shiny the

name data set so this word here data set

comes from the label that we gave to

this control

the control is not any control it's a

select

menu right like a drop down menu and

that comes from having called the

function select input

and then the choices that we get in here

come from

that call to ls uh package data sets

right

remember that that's exactly what we

were doing so that that's the way

the user will be interacting with uh

this code

and then we'll be you know like choosing

one data set from here

say i know air quality

and and that will be the submission

of the user to the app and then what

that will do is something that we still

are yet to define we do not see the

results of

table output and verbatim output because

we haven't done anything

so those functions just create a space

so

basically it would be a white space that

you can see or that you cannot see

here and here but you can imagine that

in a moment there we're going to be

putting

stuff and to do that we need to

modify the server function to start

doing something

useful so let's go to the book scroll

down a little bit more

and let's get to the part where we add

some behavior to our app

and that is bringing us to the end i

know that or close to the end i know

that we have

five more minutes and that this is

usually when people kick me out

uh but let's do this quickly um because

here i can actually make this a little

shorter so

um again remember that this meetup is

not about explaining how

everything works it's most like what

yeah you know

what it is and motivating you to learn

more and to stick with this series uh so

i'm not expecting that you will

immediately understand what's going on

here i will try to do

my best to explain in the little time we

have what's going on here but

first i just copy and paste the code

that comes from the book

and i explain the following the

interesting behavior is that of the

summary that we want to build and the

table that we want to build

as you can see the word summary appears

here at the top

we define an identifier for the object

that will contain

such a summary and then we need to

create such a summary

and we create that summary here what is

it okay so once the user

chooses a data set say

air quality let's let's print it here to

the console

say that the user chooses the package

the

data set air quality so i'm going to

remove

so notice that input dollar sign data

set is just

a placeholder but it will be internally

once the user chooses something it will

be replaced

by something like for example air

quality if the user chooses their

quality

so then we use what's what's happening

here the behavior that we're adding is

we're using the function

get to get the data set air quality from

the package data set

so that will produce a table basically

retrieves that data set and prints a

table right

so on the data set object here that we

define here then contains

such a data frame and then we use the

function summary

to create a summary of that data set so

basically what we will be expecting

the user to see is a call to summary

and the result of get oops

something like this okay this summary is

what should be printed to the

to the app same thing here the second

part of the app

uh that's pretty much the same thing but

instead of displaying it in the form of

a summary

it is displaying it vanilla as is in the

form of a table

that is why we need to tell shiny given

that we have the same

object being printed we need to tell it

what kind of print output it is and

we need to use a specific um rendering

function for the different outputs so if

what we are

creating what we are printing is just

code

then we use the we

render with a function render print and

if we um

what we want to print is a table then we

use the function render table

this is very difficult to remember but

luckily there is a cheat sheet which

i'm going to share later in the issue

associated to this meetup so the cheat

sheet contains all the

rendered tables and the print and render

whatever functions

same with the select inputs or whatever

input functions and all the output

functions so all that you need to know

at least to get started fits in that

cheat sheet which is a great companion

for this

meta so okay let's see how this works

now

so we learned that to

basically we are pairing the ids that we

created

in the user interface with objects that

we define

with exact name on the server function

so there is a summary summary there is a

table here and there is a table here

right

so now the ids now are connected

to an actual object that then displays

the behavior that we want

so let's run that up now

and let's see if where is my

window there it is

okay i'm going to open this in the web

browser because it looks prettier

and now we have a more interesting app

where we

allow the user to click here in that

drop-down menu

select something like air quality and

immediately they will get in those two

spaces

that we defined the two things that we

define

the the summary first and then the table

all right there's a little thing that i

wanted to talk about but we

may not have time to cover which is uh i

mean we're going to cover it in more

detail in another meet

up which is the um how to create a

reactive expression

uh but instead i'm going to stop here

and see if the one or two minutes that

we have

we have any questions or comments about

what we have just seen

yes go ahead cj i think yeah

so um my

understanding or knowledge of shiny may

be far outdated but

i thought or believed remembered

that

before it seemed like they were always

suggesting to you to make

separate file a ui file like ui.r and

then also server.r

and it seems quite confusing to me

because you have to make sure they were

in the same directory and name the same

thing

is that is there a reason those are

disconnected is this a new feature that

they're always promoting this

where it's all in one script now or like

what is the

what's the status of that situation if

you even know what i'm talking about

yes um as far as i know

um the

structure that you mentioned is still

valid and it still works

it's backward compatible but also as far

as i know

the the style that is presented

in the mastering shiny book is kind of

the

opinion the latest opinion about

current practices basically so some

things have simplified including modules

you know the way to create modules now

is a little simpler than before

and that's why this book requires shiny

uh

greater than 1.5.0 so if you have an

older version uh i recommend you update

so yeah that's the status i think that

what we're going to be showing is um you

know how we started working with joe

uh and so the developer of shiny and um

so i'm pretty sure that he endorses what

what

hadley wrote then he for some reason

removed his name from the author's list

but

i'm pretty sure that they work very

closely together so i would take

that as um as the

the latest opinion about how to use

shiny

at least that's my interpretation

all right any other question or comment

you know yes tomorrow sorry

yeah just just one small question do i

haven't been able to go through the

the book that we are following now but

i was wondering if you have uh some use

cases

for for shiny apps to like try to see

um how do they look at the end or how

complex

can they be just to have an overall

overview or or

what kind of projects we can design

by using shiny apps yeah and that's a

great one because

it's a consistent request what i suggest

is because i've seen uses internally

already so instead of me probably

trying to hunt for a cool project i

propose that anyone in this series is

actually going to probably send

something coding channel

and basically it would be great for one

session that is just people showing

demos of what they've done

and just to show the use case not so

much

maybe the use case and you know one

interesting implementation detail

but not like getting into like reading

code basically

uh so things they see i think that's a

cool that will make a cool session

in the future great thanks a lot

all right everyone uh thanks for being

here see you

when i see you
