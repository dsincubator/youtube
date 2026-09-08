---
type: Video Transcript
title: "Shiny: Debugging"
description: "today the ds incubator continues  on the series about building and  palleting shiny apps  and today i wanted to talk about  debugging  sometimes of many times u"
resource: "https://www.youtube.com/watch?v=NgEocgBUH_A"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=NgEocgBUH_A"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

today the ds incubator continues

on the series about building and

palleting shiny apps

and today i wanted to talk about

debugging

sometimes of many times unfortunately

shiny apps don't work as you expect

and you may encounter basically three

kinds of problems

one is when you get an obvious error and

you will get a trace back um

that shiny print to the console a second

type of error when you don't get any

errors but the value is incorrect

and a third type of error is that

specific to shiny where all values are

correct

but when you interact with the

application the values are not updated

as you expect

so the first two kinds of problems you

use uh tools that are

already uh in your um

maybe in your toolkit because the they

are

general to any r to you know debugging

any art problem but the third kind of

in bug are is kind of specific to shiny

so we'll need to probably

uh you can't reuse the the tools that

you already have

so uh today we're gonna be uh trying to

first

learn how to read a trace back then uh

you know see

how um constraining the back to a

smaller section of code can help

us understand what the program is and

also that helps with

creating reproducible examples for

yourself and for others

to help uh fix the problem um also

you're going to be debugging with the

function browser or the checkpoints in

our studio

and that works for a single set of

inputs as we're gonna see

soon and then we're gonna be debugging

also with the

um basically by printing messages to the

console with the function

message which we can combine uh

conveniently with the glue

uh package and um finally we'll very

briefly touch

on this uh convenient function from

shiny cone reactive console

which when you set it to true when you

enable that

uh a reactive console you can use the

console as if it was a shiny app

that will allow you to experiment with

reactive code before you actually build

an application

all right so let's um jump into the

motivating example for today

so basically the goal of today is to

create a simple app with an input for

users to give

us a number and that number we will use

to subset the rows of

a data set called cars and we're going

to be printing a table and

plotting a plot so i have a little

function

in this file called utils.r

uh that i'm sourcing right now the

function is called times

two and it's very simple uh takes a

number and multiplies it by two

and this is a buggy um oh kind of

that that function um it will expose a

problem

in our app so for now uh then we'll see

how it actually does work intuitively

outside the app and then we're gonna use

it inside an app and see how

um you know it doesn't work as we expect

so first we're gonna calculate the times

two of six which should be twelve

right it is twelve and then we're gonna

use that

to ask for the head of cars so cars is a

data set

uh that is not a frame this car is

called the structure of cars

see data frame with 50 rows and two

columns because it has

um too many rows here i'm gonna be

subsetting it with the

um n value that we got uh

from times two so that is uh it should

give us

um 12 rows uh here you have the twelve

rows

so the app will show this data set and

then it will also show a plot

the function plot in base r knows what

to do with this data set because it has

only two columns so dist and speed

and plots them and showing a scatter

plot

that's what we get so basically we're

gonna build an app around this code so

that a user that is not necessarily an

our user

can interact with it from the web

browser so that's precisely the use case

uh where shiny shines so we're gonna

be using this up here uh let me walk you

through it quickly

and you may already spot some of the

problems but um

we're gonna pretend that we don't see

them and then later on we're gonna try

debug them

so first i'm going to be you know

attaching the shiny package then

the functions that live in that youtubes

that are

file i put them in a folder called

debugging and here is my udlr file

and then the ui is very simple it has

a select input call that will allow the

user

to input a number in this case

then it has some space for a table and

some space for a plot

uh the server is also quite simple the

plot

is here at the end the table is here in

the middle

and i you know the data comes from this

reactive value called dataset

which i chose to extract into its own

reactive because i'm using it in two

places right so here

in line 16 i'm here in h1 so

that is the app so let's see what

happens if i

run that up i'm going to press shift

ctrl enter and

and here we get an a traceback error so

on the app we see that the ui has

generated a selector so you know user

can select one

three or whatever but uh i do get

instead of a table

or a plot i get an error that says

non-numeric argument to binary operator

which is an error that we very often see

in r

unfortunate so we also see in the

console

a trace back so that is uh what defines

this problem as

a problem of the first type where we

here i want to show here

so remember we mentioned three kinds of

problems

the easiest one is the one where you you

get an obvious

uh error and uh and you get a traceback

and why is easy as well because

uh shiny will tell us where the problem

might be

so we see that in the call to render

plot so notice that the traceback has a

bunch of lines

but our studio is kind enough to

highlight the ones that are relevant to

debugging so basically the lines that

relate to code that we wrote as

opposed to some of the shiny magic that

happens under the hoods

so notice that the the problem kind of

starts here in line 20 of the app.r

file so let's go to that file

line 20 here uh because you know we are

calling

uh in the render plot reactive we are

calling

the data set uh that you know has

the problem but then that takes us to

line 11

which is here so it looks like the

problem

comes from times two and then

it jumps to the utis.r

file line two and six so we haven't yet

seen that file but we will in a moment

so uh the first thing i'm going to do is

i'm going to

um type i'm going to stop the app

although you don't have to um we could

actually

leave it running there i'm going to

gonna create a new line

here just on top of times two why there

well i think um

you know the problem sometimes arise um

early in the

in the stack of calls that the traceback

shows and then the the the problem

becomes

unavoidable and and triggers the error

message that you see

kind of deeper in the call but i like to

explore the programs

from you know starting from relatively

high up in the

call stack so let's start now we're here

in this file

so let's start from this file and then

we're going to be jumping into the

function on the other file

but to me it makes no sense to start

here or here

because i know that there is nothing

going on here

and there is very little going on here

here only calling plot on data set and

here

i'm actually using the data sets

reactive so most likely the problem is

in this other reactive which is a bit

more complex

and we already know from the stack is

that in line what was before line 11 now

it's

9 12 and the problem you know get

got you know we have to step into that

times two functions to

to see what the problem is so now i'm

gonna press again shift ctrl

enter notice that here it says reload

app so when i press shift ctrl enter

that is going to reload it's going to

stop the execution

when i where i typed browser and it's

going to give me a console which i can

use

now to do whatever in particular

i'm going to be using it to end the

shortcuts for these commands at the top

so next uh is you can

click here on next or type n and then

enter that will kind of move to the next

line

in the interactive debugger and if you

want to step

inside the function which is you can

either click here

or you can also press s and then enter

so that will you know step into the

um times two function i'm gonna press

next to go to this line

now i i see that times two cos g let's

step into g

and and now let's go next to get

to 9 6. now let's step into h

and now let's click click hit n

to get to line 10 and now

there is nowhere else to go so i better

run this

this code if i highlight this and hit

enter

uh what i get is the error that we were

seeing from the app so obviously the

ultimate

the last place where the problem is

exposed is here uh

so let's see what x is now and that is

what is interesting to me so

x here in the console right is this

literal value

one so if i say the type

type of x is a character as opposed to a

number so if i do

one plus one that will work but if i use

one literal one plus one that will give

me the arrow that we see

so obviously the problem is we

identified is that

the uh to stop execution you can um do

capital q uh or you can hit that you

know

red square that you had up there so the

problem is obviously that the

input that shinee

gives us you know one day the user

enters a number

through the ui shiny takes that as a

literal string

and not as a number right so if you want

a number you may

you may use a different function not

select input but numeric input for

example

but that's fine because we can still use

select input if we convert

that and then number here to

that string to a number which we can do

but

before we do that we we could also

attack the problem in a slightly

different way

so i'm gonna first

again trigger the interactive

debugger because i would like to you

know be able to kind of come here and

uh like highlight code press ctrl and

enter and print stuff to the console so

like work with this interactively so

and here we have that um that call

to times two that makes my app a lot

more complex

than it actually is to expose the

problem

um so um i would like to see for example

what would happen

if instead of a times two i

just say hey okay um let's

forget about everything that happens in

the file utils.r

and let's just you know print

let's just pass the value input.n

directly right to to the app

so let's explore that thing by

this is a simple strategy that is

very useful the idea okay if the problem

what happens if you shrink the problem

to

the the minimum amount of code that

exposes it and what do you get

right so and that is helpful in for

example building

reproducible examples that you may want

to share with other people and as

opposed to kind of sharing

a huge ad that they made to kind of

navigate to find the problem you just

send the tiniest bit of code that

exposes that that problem that you will

get a lot faster help

uh so in this case you know by removing

this line

at 12 i'm basically removing anything

that lives in this the

file utils.r because that's the only

um you know the only function that um

so yeah so this function is this all the

the code that lives in in that you

dislike our

file so but this is simply to say that

this is one strategy to solve problems

just to reduce the size of the code that

you're working with

so what would happen if uh if you know

the input n

is passed to here uh okay what you get

is um let's

define this let's go to the console and

uh the app is running too

this is unexpected let me see

let me see let's go step here

and okay i think you know that my

console is getting confused

with the n that comes from

the so we're getting confused between

the end

that is here and the code and the end

that you press

to um to move

basically the shortcut for next here so

instead what i'm going to do

is i'm going to move the um

input n inside head and see what this

prints

so um notice that

if we print input n and s1

we still get

here we still get

let's actually call it different a

different value and

an n input and

hopefully this will help

and and okay let's see if this helps

okay yes this does help

so um now

um what we have is a smaller app

and i'm gonna i'm going to show um

how changing the value um

how you know what approach that we can

use to change the values from

the um ui

and see how that you know changes code

in the server side of

of the app so so far you know with

browser we can only see

what happens with a single uh input in

this case you know we trigger

the interactive debugger with the input

one and now

you know input n is always going to be

one even if i change here to four for

example or six or whatever

still when i print input n

i still get the number one so i would

love

uh this to be different i would love to

see

you know what happens as you know i

change the inputs here

so for that i'm going to be using a

different tool

which is message uh and i'm gonna

combine it with the glue

package because it's very convenient

the input is

i'm gonna say in

i'm gonna say input

n the class

the type is

type of input x and okay so with this

this um with these messages here

and i can now remove the call to browser

what i hope to

to do is to try and understand what the

app

does on the server side when i change

the inputs from from here

so notice how okay so now by having

removed the

the line that goes times at 2 which was

kind of

buggy now i get you know this this plot

to display at least um

but notice what happens when i change

the values here so when i change to

three

and this calls to message that i wrote

in lines 12 and 13

uh produce this output here on the

console so i can now confirm

that the input is effectively 3

but the type is still right a character

also notice that okay the values are

kind of correct except that the type of

the input should be likely a numeric

but you know it doesn't seem to be a

problem because the plot

so far seems to be working just fine i

see

three dots there suggesting that this is

working fine

but what happens if i do six for example

i expected only six points there right

because

the number six could be subsetting the

car's data set to only six rows

and then i would expect that that to be

the data set that is plotted

so that i would expect only six points

but instead i see a lot more

so that is the second kind of problem

where you don't get an error

for some reason the head function is

able to work with a with a character uh

this one here so it's able to work with

the input number you know

the input six even if it is a character

as opposed to an in to a number but the

behavior is

different to what i expect so here is

the issue right so

you don't get any error but the value is

incorrect the value in this case

the incorrectness of the value is

exposed by

by the odd plot that we get so obviously

head is not doing what we think it is

doing so

uh let's confirm that so if i do head

of cars on the console if i do the

number six

it does subset to six but if i do the

literal string six

it doesn't right and it does not draw

any error

so this is the the case no error but the

value is incorrect

so second type of problem here and how

you

tackle that problem just by

interactively you know querying your

code

and noticing what's what's odd in this

case what we notice that is odd

is the type of uh the input

so um the solution to that is of course

that we want

uh the input to be a numeric so we can

do

as numeric right

and uh with that

so if i do this

so i convert it first to

um number and then i use it to print the

message and to create

the um you know to to

you know to use it in the to create the

reactive that's it okay

so let's let's run that up uh let's see

what that

is happening now so now uh the input

by default you know it starts with one

and it's now a double it's no longer a

character so that's good news let's see

what the

app looks like okay with number one it

works

we still don't see the plot and that's

another problem

that we're going to be tackling next uh

but then the problem

was exposed when we click six so let's

see what happens now

so uh let's see if the problem is solved

and it is so now we see

six points as opposed to

a lot more that we saw before so we have

solved that

problem of type two by which you know at

some point we were getting

no error but the value was incorrect so

now the value is correct

we're still left with this uh last um

problem here which is that

um the you know um

there is a value uh in this case a plot

sorry a table that is not being updated

so we created in the app

a space for a table and the table is not

showing up

as we change the inputs here so that's

the next point that we're gonna

going to tackle but before that i'm

going to now that we know how to fix

the problem uh which was with this you

know called to as numeric

what we're going to be doing is applying

that solution

to the entire app so now we're going to

reactivate

um basically we're going to get rid of

this code that we wrote

here and we're going to reactivate

this uh to use the entire app

and we're gonna solve the problem in the

way that we learned

uh we need to solve it just by calling

it as numeric

right so we're gonna do as numeric the

input and only then we are going to be

doing times two of that input and then

the head of it so uh now i can change

this to n and uh and let's see how this

goes so again

now i expect uh to that error to not

show up here anymore no more messages

spread to the console because we have

removed

that um those uh calls to message

uh so here is or is it

let's let's stop the app for a moment

let's restart

because that was an unexpected output

shift ctrl enter to trigger the app

to run the app

this is taking a second restart sorry

for the weight

you're not good looks like my art studio

is kind of getting stuck

i may restart the whole project

let's see

let's kill that process

and let's start again um

yes shiny

there you go sorry for the way

i still need a

to wait a few more seconds and it is the

freshest

okay so let's go with my app

dot r here in debugging

let's start this up with shift ctrl

enter

and what i wanted to show is that there

is no more trace back

so no more error of type 1 no more

error of type 2 which was the the arrow

by which

you get no error but the values are

incorrect so if i do 6 here

now i should see only 6 values

i know actually 12 now because i'm using

the x2 function so

12 and that's correct but we are still

left with the problem of type

3 which is this idea where um

everything seems to be correct but the

app does not update

as you you know expect and that is

what we are referring to here is that we

created

a space for a plot here right

and uh we created that plot here

oh sorry a table we created a table

space for a table in line six so between

the inputs

and the plot there should be a table

here that is not showing

and here is a table we created it but

it's not showing

so what is the problem well this is a

program again

specific to shiny so some of the you

know knowledge that you bring from

debugging

are in general may not apply and

and a lot of the times in my experience

the

if this kind of thing happens when you

just don't see an output

it's simply because um the connection

between the

the ui and the server is broken and the

only connection that there is between

these two functions is the id the input

id

in this case the input is stable and the

reason why it's

broken is because it is with a lowercase

t

on the ui and a capital t on the

server this is uh not an error from the

perspective of shiny

but it is from the perspective of the

intent

uh of building a functional app so if i

change that t

uh to a lowercase t and rerun the app

that should

fix that problem of type three

so let's see and here we are so we

choose a number the function times two

duplicates that number

and so we see with an input of one we

see

this table with two rows and we see a

plot with two

we did two dots and if we choose the

number six

we see 12 rows and we see a block with

12

points and that has effectively fixed

our app

the last tool i wanted to talk about is

let's stop this app

is the reactive console so a lot of the

times

you know to experiment with code that

you want on the you know

you would like to you know write to the

server something like this

right as numeric something like this so

what

how could you do this uh how could you

explore this code

if you don't have it already in an app

okay you can build

an app around it but it's like truly is

very annoying

so if you just want to explore

especially in the early stages of

building an app that you're kind of

trying to figure out what you want to do

so one useful uh so let me first show

how this won't work so say that i have

um i'm working with this

code and

let's say okay this is the number six

the literal six

if that was the input um and say

i want to explore this right so i run

this

first you know what i would do is uh

attach shiny

right because reactive is a function of

shiny so i need it

and and you know i can't run that code

and that's fine

but if i wanted to use it as i could

inside the server just by calling that

as set

what i get is that um error that tells

me

that that function or that the reactive

data set

has to be used only in a reactive

context and we don't have a reactive

context

so again you don't want to build a whole

app just to explore

something that you may throw away so and

the solution to that

is to call it's also a function from

shiny

it's called a reactive console

and you enable it by saying true so with

that

then you can uh run

let's see if if it ran that that set

you can run any reactive on the console

as if it was

as if it was a shiny app so we thought

actually building there

around it so that would allow us to

explore things like um

that what we're doing here uh that

with you know if this is um

if this literal string is converted to

numeric

and it works um

as you expect but if it's not converted

to numeric

then it won't work as you expect

and this exploration notice how we're

doing it outside the

outside the reactive context

of of an app but instead we're creating

a reactive context simply by using

that that function from shiny it's

called

shiny it's called reactive console

right so this is another tool that you

can

use to mostly to avoid bugs because if

you explore

interactively the server code

of sign up before you actually write the

server you have better chances to

write it correct the first time okay so

that is

what i wanted to show today

uh with that we have as a summary we

have covered

three kinds of uh problems

that you may encounter one by which you

get an

obvious error uh another one by which

you may not get an error but you don't

get an error but

the values are incorrect and the third

one by which the values are correct but

the

app is not updated as you expect so the

third one is the only that is specific

to shiny the other two

are problems that

you may have solved already in r with

other tools

from the tools the ones that we

discussed today are

you know debug sorry browser the

function browser which allows you to

fire an interactive debugger that's

terribly useful in any code and whether

it is the ui

or is this the server once you do that

you can only interact with the inputs

that were passed when you fired

the debugger meaning that you won't be

able to see

you know how the server you know changes

based on different inputs from the ui

instead if that's what you want if you

want to explore how the server changes

with different inputs one strategy is to

print messages to the console using the

function message

which you may couple with the glue

package to

you know write very easily the messages

that you want to be printed on the

console

as you interact with the app from from

the web browser um

and then you'll see how those values

update and then finally the other tool

that we explore is this

function called reactive console in

shiny that allows

you to transform basically your normal r

console into a reactive

console meaning that you don't need to

build a whole app

just to explore a few reactive values

that you're interested in

that's all for now thanks
