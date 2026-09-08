---
type: Video Transcript
title: "Shiny: Basic reactivity"
description: "so today the ds incubator continues on  the series  about building shiny applications and  publishing them  which we haven't covered so much yet we  are seeing "
resource: "https://www.youtube.com/watch?v=rirpOpTYVg4"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=rirpOpTYVg4"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

so today the ds incubator continues on

the series

about building shiny applications and

publishing them

which we haven't covered so much yet we

are seeing a bit of a theoretical

introduction and then hopefully we'll

spend more time you know actually doing

things i'm excited for about at least

two apps that i would like to

to show as examples um in this meetup

series but today we're going to continue

with a topic that is a little bit

difficult to digest and had also to

teach for me

uh which is the idea of reactivity and

the reason why it's so difficult

it's is because it's a completely

different paradigm of programming

than the one that we are more used to we

are used to something that is kind of

more linear so every

every line in a script runs in sequence

so line one

you know defines x line line two uses x

and you know it's kind of

straightforward we expect that

if we don't define x but we try to use

it to get an error

but if we define it first then it's fine

so that will change with reactive

programming uh

and uh it's a whole new idea that it

might take some time to digest

that's why you know you're kind of

moving slow and even for me

uh it's a very interesting kind of

learning experience

so let me show you my art studio here

um the media is basically copying and

pasting some

chunks of code that i found um the most

uh clear exclusive ways to

to show the contents of a chapter that

is called basic reactivity in the book

mastering

shiny so the first thing uh that i

wanted to do

is to kind of start by by having an

overview of what we already

overviewed before so if we run so by now

you should

see what's highlighted here on my screen

as something familiar it is a shiny app

it has the typical components a user

interface

that is defined here as a ui it has a

server uh

object that is built with a function the

server function

uh and then it calls the two components

with the function shiny app

so if we run this thing this application

runs what this app does is not super

exciting but we're gonna use this

example across the meetup

today so basically this app is asking

we don't see anything oh i'm sorry

you're right thank you same comment

excellent thanks uh let's share my

screen

that explains why

okay do you see your pretty faces now

i know my air studio

yeah thank you so i was

trying to show you the highlighted text

and hoping that you would find

this familiar these three components

or two components of a shiny application

the user interface here defined as ui

and the server object here defined

well like typically as you do it with

the function

with the server function um and

uh and then you called it two things so

you call the server function you created

and the ui with shiny app

and that will trigger the app that i

have already triggered somehow here yeah

so the app is kind of simple a little

boring but it will be helpful for the

rest of the meetup

uh it's asking me what's my name and as

i type my name

let's do capital m and wait a little bit

the m appears there

a you are oh

so i think this is intuitive this idea

of reactivity that i do something as a

user

on the web browser actually i could pop

up this on the web browser to make it

even more

so the experience of a user uh and as i

type something

right the application reacts and ex

exposes the result on the on the screen

of the user

um and this is quite different

to what we are used to when we program

in the traditional script paradigm why

because the things that you know a

script runs only once

right so you run the script you define x

x contains the letter

uppercase m and then the output is going

to be m

right if you want it to be m a or m a u

r o

you have to rerun the script every time

and that's

not what happens with reactive

programming and that's a little bit what

we're going to be kind of

showing a little bit but before we get

there

i did like the way in which hadley and

his book

broke down the server function so the

star of last meetup was the ui

component but today is going to be the

server function

so before you know to kind of unpack um

reactivity a little by little um

he starts explaining about the you know

what you can do what you cannot do

with the different arguments of the

server function

and he in this part focuses on the input

and output only and then the session is

going to be covered later on which is

fair enough because this chapter is

already kind of huge

just by talking about a part of the

server

function so um like a little overview

um i think you know hopefully you're

familiar with this you know we already

know that

in the ui we define some inputs

and we create some placeholders for

outputs

each of those have ids so in this case

the name

id is an input so we see it defined

here in the ui at the top and then

we use the value that the user passes to

that input

in the server function and then the

output

it also has a an id in this case it's

called greeting

and then what we do is we kind of

build the output object that is defined

by shiny

inside the server function using that

exact that exact

id so um at the top we created a

placeholder for greeting

and now here in the server function we

assign

the value that we get from pasting

the hello string to the input that the

user

gives and then wrapping it into this

this render function that we're gonna be

talking about in a moment

okay so uh first let's see

very common errors that um pop up

when you know we start with shiny and

that's that's something i did like from

hadley's approach to teaching this

so um what i'm gonna be first showing

here

is we're gonna be focusing on uh on here

on the server function

right but we do need a little bit of a

ui to make this

um useful to see if it works or if it

doesn't so what i'm going to do now is

i'm going to define this

i'm going to call library shiny i'm

going to define this ui

which is is a simple numeric uh

input uh that i'm calling there and then

here i'm i'm doing something

i'm attempting to do something which is

i'm trying to

change the so to begin with the ui

defined

this um use the id count

right so they the user could have a

place where they can pass a value

to count and by default it starts with

the value 100 right

so say that inside the server function i

wanted to change the value of

of count to 10. can i do that yes or no

okay so this is to show one of the

properties

of uh the you know the input argument to

the server function

so re um inputs are read only so you

cannot assign

anything to them and the reason is

because shiny considers that the

ultimate source

of truth is the browser so whatever the

user

gives uh whatever input the user gives

in the browser so if if you would

change would be able to change those

inputs inside

uh you know your application as a

programmer then it would be you could

get really messy

so let's try and run that you should

throw the error that you see here at the

bottom

so let's let's run this thing and

to two to two

maybe because i have a window open

somewhere

okay here we go the the error message

that i was

expecting so this is uh the reproducible

example that shiny

that had this show and effectively we do

get this

message message that says can't modify a

read-only reactive value

count so hopefully exposing you to this

error message

now will you know

remind you when you see this error okay

okay i'm familiar with this error i

think i saw it before what's going on

and hopefully you will understand that

you will be able to interpret the error

better it's quite clear but at the same

time if you haven't encountered this

ever before

and understood why it happens it might

be difficult to kind of really debug so

the point here is the one explained here

at the top

so basically the input objects to the

server function are only

able to be read and you cannot write

into them

so that's the first message to take

about the input

the second message is uh that not only

they are picky about they can only be

read but also they have to be read in a

specific

context which is called a reactive

context so uh let's experience that a

little bit

so um remember that uh

let's go back to the to the example that

did work

remember that i mean the key of the

thing is is this line here 11 right so

where we paste the hello string to the

input that the user gave me

but notice how we wrap that into this

render function

so that is the function that defines

that context that is special and shiny

and that allows its magic magic to kind

of flourish

so without that render function you get

an error right so it's not only that it

is

read only but also it has to be read

within a reactive context

so that means that if i try to run the

code here in line 42

where i and i have my server function

and

it is using the input that

uh the user you know gave me uh the

input

dollar sign count it is using it in in a

normal function

in the function messages it's not using

it in a reactive context

so then what i expect is to fail because

those inputs can only be read in a

reactive context

so let's see if that does happen the

error message that we expect

is the one here at the bottom and there

you go it says that

you can't access a reactive value count

outside of

a reactive consumer the idea that we're

consuming now is a little bit pretty

confusing because

um we haven't talked about this yet but

when we talk about the

what's called the reactive graph where

we we're going to give new names to

inputs outputs and

something that goes in the middle which

are the reactive expressions

so basically uh i mean the long story

made short is that an input

consumes um you know the input that the

user gives and that

that's why inputs are also called

consumers um

outputs are also called producers

because they produce the output

and then reactives are both things

something that goes in the middle a

little bit of

a consumer and a little bit of a

producer we'll probably explore that

if we have time later today okay so

second

then um error message with which um i am

i hope that you will be familiar is this

idea that uh if you see something about

you know that you are working inside

you need to to wrap something inside

reactive that's exactly what you need to

do you need to find a reactive function

that uh that's the action that you want

or just call the reactive

function itself there is this different

reactive function

not just not just one um

and then

you must use the render function okay so

uh is this the

okay so here uh we i got lost for a

moment because i i completely changed

um from talking about inputs

to now talking about outputs and i

didn't leave a note to myself

reminding me of that so and what we

showed you i showed you before the idea

that inputs are

read only and inputs must be read within

a reactive context

that was all referred to again inputs

and now let's move on to talk about

outputs so outputs are very similar they

also have

uh particular ways in which you have to

use them otherwise you get an error

and so same thing so for example if you

want to assign uh

so you can assign values to

outputs but only if you are using uh

you're doing that in within a render

function a render

does some things including this idea of

creating

um a reactive context for the action to

happen

so let's try to run this so the error

here is i'm not

uh wrapping the line 58

in any function in any reactive function

to refresh your your mind let's go up

so this is what i should do um

so that if i'm going to assign anything

to output dollar sign greeting

it has to be through a render function

right and if i try to do that so before

we are doing something similar but to

the input now we are doing it to the

output

so if you do that you will again

get this error that says well this works

i read it from here from the rep rex

that um

that basically is is prompting us to use

a render function

right because outputs must be

[Music]

used within a render within a render

function

and then uh the idea of uh reading

that we discussed with inputs also

applies to

outputs so let's stop this up here to

the right because

it's not doing what i want

fast enough uh output same thing

and with this uh we're gonna be

finishing about these error messages

so if you want to use an output directly

outside um sorry if you want to read

an output like here you know with the

function in this case message

you also get uh an error because the

outputs

cannot be um cannot be read

right so this is the error message that

you get

okay these are probably the most common

error messages

that uh you would experience so

hopefully

this will you know bring you back to the

meet up or back to the book

to try the back what's what's going on

and the bag is shiny i think constanza

said already

is difficult enough uh so having a big

idea what are the most common problems

yeah i i hope it will be helpful

so now we are gonna get into a little uh

bit of you know what are the properties

of

um reactive functions and why the

paradigm of reactions of reactive

programming

is is different to what we are used to

but before we do

that i acknowledge that we are 20 past

so it's also a good time to stop and ask

for

comments or questions now and then use

the rest of the time as much as we have

to cover the rest of the meetup

otherwise you know we'll move i will

move some content for next time

so questions and answers and comments

monica i see your hand well

yeah like to me what

like when i look at it i kind of related

to

[Music]

building websites and that

it's basically listening

to like that it's listening to the user

input or output only

if you build website you can actually

hard code some things and here it's kind

of like no

you have to use this kind of listening

objects

that will i don't know have some kind of

timer

and check uh every i don't know

second or two if something changed in

the

variable it's something like that i

guess right

i agree uh actually i'm not sure if

we're gonna have time to call it

today but certainly there are some

functions in shiny that allow you to

control the frequency how often you

um you tell shiny to check for inputs

and you can you can it can be as as

frequent as say you know

you can set a millisecond and and the

thing will change continuously

as if it was an animation or it could be

on demand you can give a button where

the

user clicks there and the action

actually happens so certainly i think

that's how i interpret it except that i

do not have experience in

in building websites outside of the

shiny

framework so maybe if like jackson i

think you also have experience or anyone

else who has experience in building

websites can

kind of extend the comment alex i see

you have

your hand up

um yeah one thing to

keep a note of especially when writing

reactive but more generally whenever

you're writing any of the ui

functions um reactive functions are

pretty much continuously in

like they're just always running over

and over and over again

so don't put like

make that function as small as possible

as simple as possible

just to like check if you actually need

to do data manipulation

so that you're not just always doing the

data manipulation and slowing everything

down

um i've made that mistake in the past

where like

i was doing i had a ui function that had

something as simple as d plier filter in

it

and when i switched it over to a static

list um and just pre-compiled the list

my whole site like sped up noticeably

so make the reactive stuff

especially as simple as you possibly can

and put as much as possible into the

server side stuff

thanks alex i think

yeah many of us kind of get learned the

thing you know the hard way

in shiny more than other practices

in our you know the frameworks in our

you know where you do things

matters a lot so as exactly as alex is

saying you know i'm learning that

you know one thing that is totally fine

to do in the server function

and it will only happen on demand when

it's needed because it's a lazy

framework that we're going to be talking

about in a second

uh if you do the same thing in in the ui

or outside

the app you get in trouble

so yeah and there is also good resources

for that you remind me i think there is

a talk

by um joe jang in the

2019 rstudio conf where he talks about

basically building performance and

production ready apps

and a lot of that is just being aware of

of how shiny works and where

you're supposed to do things and where

not to do things uh because the exact

same outcome

underperformed like terribly

any other comment in the in the room

okay then i'm gonna move back to the

content we still have five minutes i

think i can cover a few few more things

here

um i think this is kind of a little bit

too kind of to be in

all about just wow what's going on here

uh with reactivity um and and try to

start reflecting about how different

this paradigm

is compared to just running vanilla

scripts that we are used to so you saw

in the app

before that there was within the server

function there was

um there was uh

a little you know this these three lines

basically

where we assign greeting to output and

we wrap that

uh so what we assigned was wrapped into

the render function and we were pasting

a string to the user's input

so i kind of like how he explains it so

naturally

you know we could read this in our in

our mental model

that we bring from building scripts we

could read this as

okay i understand what's going on

basically we're taking the string hello

and then we're pasting it to the input

that the user gives me

and that's it uh so that's almost there

but not

quite because reactive programming i

mean it's because that statement if that

was what's going on here if it's you're

just

taking the string and pasting it to the

input in the same way that we're used to

in scripting

then that would run only once so as soon

as i type you know that

m of my my name that would run and then

the output would be m

and then the auro could never pop up on

the screen right so

there must be something else going on

and so what is going on is that we are

no longer giving or asking shiny to do

things

for us explicitly as we normally do in

scripts where we say

hey take the string hello take the input

paste them together and give me the

output no we now give

shiny a recipe we are not giving an

explicit extraction

that is imperative instead we are giving

a declarative instruction we are

saying hey whenever i need a sandwich

uh you know here's the recipe and here's

how you can do it but

i'm not asking you to make a sandwich

right now so you will figure out when

i'm hungry and let you know and then you

will be a sandwich right

so that's how the paradigm differs that

the execution time

is not the same as we are used to when

we run

um we run normal scripts

so that's that uh bit there and one um

interesting uh property actually of the

of the framework

is its laziness and i think that is

where um

the comment alex may relates to this

meetup is that

precisely if you leverage the power of

chinese laziness you can save a lot of

computation

because it's gonna the computation is

gonna happen only when you need it and

not

every time so the um

to trucks to express that uh we are

gonna

to want to see a very common mistake

actually

so let's let's start so this example has

a problem

and i'm gonna show uh how that problem

is a silent problem and that's not true

an error

which hopefully will do two things one

you know

illustrate this idea of laziness

and so that you can leverage that power

when

when you need it so that you don't

recompute things that don't need to be

recomputed

but also to illustrate this common

problem that shiny has that

the laziness kind of sometimes backfires

and and

makes your app behaving ways that you

don't

expect and it's difficult to debug

because you don't get errors so

to begin with let's actually run this

functional app

and so this app runs just fine we are

assigning

so we get the name we get and then we

assign

the input to an object called greeting

with double e like

greeting and and that just should work

if i execute that let's demonstrate

hopefully if that happens

in a timely manner

and there is the app so it has the space

to type my name

and it has the output right so it works

as i expect

but now see what happens if i overwrite

the good server function with a bad

server function where i

instead of assigning to greeting i

assign to

gir xx thing so

it's not going to be an error and the

reason so let's run that

and see what happens

and that will be the end of the meetup

so we have maybe one more minute

ahead and here is the app

now i still have this i mean the app is

running it's working

but if i type my name here i don't see

the output anywhere

and the reason is that that is not

an error i don't get another message

because shinee is not even running this

code

why because chinese chinese watching for

updates to the name uh input

right uh and then um

only when that is changed uh it's gonna

go

and look for an object that is called

greeting but there is no

output that has the sorry it's called

grx

exiting but there is no output that uh

that has that id so it just doesn't run

that it just

just doesn't throw an error because it's

not doing anything there

so we are not seeing the output right uh

so okay that so that is the kind of the

backfire of laziness

um that you know one must be aware so

that means like

long story short if you ever see your

app

not showing outputs that you expect uh

then

go and check the the ids what i do is i

press

ctrl alt k on r studio and that

highlights

everything that contains the exact same

string so in this case

this one here ctrl alt k as you can see

uh it doesn't highlight anything else so

obviously there is a

problem in that in how i typed that

okay so that is uh all i could cover

today

we're gonna show a little bit about

reactive graph and a few other things

and next time we meet for now that's the

end any departing comment or question

good i think i promise it's gonna be get

more exciting when

uh jackson or olga starts showing cool

apps and when we actually start building

useful apps but for now uh we are still

a little bit

behind the correct theory thanks a lot

everyone um

i'll be in touch with you to see if we

have any meetup next week

and if so what it's going to be about

thanks ciao

thanks
