---
type: Video Transcript
title: "WTF: Debugging R code"
description: "so welcome everyone again to the ds  incubator this is the last meetup of the  series that is covering the book what  they forgot to teach you about r  this is "
resource: "https://www.youtube.com/watch?v=tLvRWRWeQK4"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=tLvRWRWeQK4"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

so welcome everyone again to the ds

incubator this is the last meetup of the

series that is covering the book what

they forgot to teach you about r

this is a meetup about the third section

of the book which is called all is

failed

all is fail and i'm gonna be focusing on

debugging our code with

specific focus on on working with um

like long running processes and this is

motivated by some work that i'm doing

right now with the passtax team

when sometimes i need to debug some code

and before i even get to that code there

is very long process that i need to run

and i've learned a few things a few

tricks um

that i would like to

try capture

in this in this talk as well and this is

also motivated by a conversation with

linda who has similar um challenges in

in some work that she's doing

so it's a pretty ambitious

meet up and my my idea was uh

to

walk you through a real uh debugging

session that i mean i had yesterday and

kind of show you the gist of it

um what we're gonna be covering is you

know trying to how to locate where the

problem

in some code is with the function trace

back and try to reduce the problem um by

for example reducing the size of the

data through an idea that is called

binary search

to try to reproduce the the bug as

simply as possible and if we want to

share with someone else use the the

replex package i'm not going to be

showing how to do it because there is a

whole meetup dedicated to that a whole

series actually indicated that

but at least you know to mention the

package in case in case you you want to

be kind of curious and explore it by

yourself

then we are going to be covering some

fairly

cool tricks

um that allow you to enter the computing

environment of a function for example

or of a for loop

with functions such as browser

and

the back ones as well

trying to get feedback from

the inside of the function that is

having some problems with functions such

as message

and maybe navigate a little bit inside

the

debugger mode of our studio with either

the keyword the keyboard or the function

device once itself

which is particularly useful when we

work with pipes

and and

finally we're going to be talking about

the idea of debugging um

when in processes that go through loops

many many many times so how do you ask

the code to stop exactly at the place

where the

the iteration has a problem so you know

there will be thousands of iterations

that are just fine and one that

is problematic so you want to stop the

code right there

and and then more generally uh i would

love to have some time to discuss um

like the big picture of the strategies

that um i think are useful to iterate

fast even when you're working with long

processes of slow processes

um and some ideas such as how to reduce

computations uh how to not do twice

things that you know you could do only

once and and the idea of how to reduce

the size of the data and code which is

somehow captured by the idea of binary

search

and also getting some feedback from the

functions themselves to report the

progress of how far you got into kind of

solving the problem that the code is

meant to solve

so that's uh that's quite a bit to cover

so let's get into it as usual you know

this is uh the repository of this series

which again is the last meetup of the

series uh it has a dedicated folder

called zero three all is fail

and in that

there is um a document that you know

highlights uh what i'm going to be

trying to cover i'm not

hoping to cover everything but uh let's

let's see how far we get

so let's go to our studio uh and here i

have a real

package with which i'm working right now

and here i have a real script that

[Music]

i'm using

to

basically get a lot of web pages

and download them into my computer

that's that's the simple story

so um i'm gonna um

run

this script in a in a way that is quite

convenient like clicking here on source

or just pressing shift ctrl and enter so

that will run the whole thing

and so the first time i think you're

gonna see that the process goes more or

less fast and then i'm gonna um

make it um more vanilla to show you how

painful it can be when you not take care

of some things that can make processes

like super slow

so right now let me walk you through the

code while this works what is happening

now is that the code completed all the

way to the end of the script

and is running some processes but it's

moving fairly fast uh it's completely

right now you know 30 percent and moving

forward we'll see an error i think when

we get close to 90 or something

um

also

the so this code is being run right now

is the very last here

um

and it has

like gone really quickly through this

first chunk of code

although it is a very slow process and

i'm gonna make you experience the pain

in a moment when this finishes

but i wanted to show you one strategy

that i made

i'm using to try and make things a

little faster for me so the idea is to

create a cache so that the data set that

i'm creating here if it already exists

in a cache folder

then to reuse it from there so if i run

this line this you know this chunk of

code over and over again it runs very

quickly but only because it's reducing

that cache so let me show you what it

looks like if i don't use the cache so

if i remove

this for a moment and i rerun this you

will see that r is thinking right and it

takes a long time

so that's that's one of the you know big

picture considerations that does not

relate specifically to

debugging itself but when you debug you

need to iterate over your problem over

and over again many times sometimes

until you find the issue so if every

time you need to discover a new flavor

of the issue you have to wait like now

like for you know like a minute or two

minutes and then you never really get to

to solve the problem that you want to

solve so finding ways to reduce

computations is very important

also you notice that

uh i rerun the whole thing by you know i

mention it by compressing a keyboard

shortcut shift ctrl enter or by clicking

here source and that is the idea of

making that the problem as

self-contained and portable as possible

and by portable i mean that sometimes

you know you have paths in your script

that are encoded to your own computer

and you have your name in it and that's

a very bad idea because if you need to

share your code someone else they will

not be able to to rerun the code at

least not without changing those

hard-coded paths to use you know their

own computer names so for that you could

use packages such as the here package

which we mentioned in this same series

a few chapters ago a few meetups ago so

you can see that the process is still

going and it is it's really painful so

we can probably stop it here hopefully

that my session won't crash

but now i am using the cache so i'm

going to rerun it uh just you know

reducing the cache and boom there it is

then this line is not all that important

and this one here is the one that is you

know expressing the the issue

but again you know i can make the

problem smaller and and the process run

faster by

reducing the size of the data so you may

have noticed that the process completed

all the way to almost the 99

of of it so there is some there is a

loop here going on and there is these

urls that are being um you know

requested from

from web pages and i'm using a trick i'm

avoiding to to re request things that i

have already requested by using this

argument overwrite so i'm asking

this function to not overwrite things

that already exist in my computer so if

it detects that a file has been saved

from an html file that has been already

requested before i'm saving that request

i'm not actually doing that request and

because i'm not overwriting it so i

could change that to overwrite equals

true and then this process would take

actually literally probably days

so um

this

argument is something that i had to bake

i had to write but the f4 was worthwhile

because once i figured out a way to you

know reduce those um

to avoid

needless computations then i saved a lot

more of the time that i put into

developing in the future

and still we haven't talked about

debugging but you know i think that the

big general

strategies are more important to

communicate here than the actual um

details of how you enter the debugger

and stuff because those details exist in

documentation already you can go to for

example here in the back of our studio

and go to debugging help and that will

take you to a webpage that explains how

to use the debugger of our studio um and

and you know that those tricks are

published everywhere but i find that the

strategies that i'm trying to

communicate here today are the ones uh

harder to find and harder to score and

by the way also jackson recorded um a

session on on debugging so we may also

share

the link to that video which i couldn't

find

later

so one other thing that you may want to

do is to reduce the size of the the data

because even when this

is trying to save you know as much

computation as possible it's still

taking quite a while to go through you

know that progress bar that goes all the

way up to 99 percent but if i want if i

know that my process goes all the way to

99 percent i know i don't need to use

that unique

data set

in its entirety maybe i just need to

find you know the last one percent of

the data that is the one that has the

problem right so i could i could save

computation in a very very quick way by

doing something like okay let's get uniq

and let's just get the tail of it just

the last say i know a thousand rows and

let's see if that thousand rows already

get me the problem that i'm trying to

divide so i'm gonna try that and see if

this goes a little faster so now i'm i'm

reusing the cache to get that unique um

object from

from the cache

and then this line is not

meaningful here but then i'm reducing

the size of that unique to just a

thousand rows so now it has a thousand

rows before it had a lot more let me

show you how many it had unique has

44 000 rows more or less right so i

reduce it to just a thousand and then

see if that process runs faster indeed

it does right so now

it is in the you know i have covered um

you know 70

of of that thousand rows data set and

and the problem is is there so notice

how much faster now my debugging session

allows me to iterate over over each time

so now i think i'm in a much better

condition to try to find the problem

because in in a few seconds maybe two

seconds i can already try something new

i see if i found the problem

so now i think is when we are okay at a

point where we could start actually

using debugging tools from the debugger

from our studio uh or from our in

general to try find the problem so the

very first thing that you know i could

do here is to try look at what's called

the trace back so basically the sequence

of functions that have been called uh

before the error

happened and i also you know pay a lot

of attention to the error messages i say

i see here that it says cannot navigate

to invalid url so okay it makes kind of

sense i'm trying to request

a web page uh and i for that you know i

have to somehow pass urls and that's

exactly what i'm passing here so if i if

i show you a little bit what url

what one url looks like this is what

they look like they look just like

normal urls right

um but at some point there's one url

that is corrupt apparently and that's

the reason of of the box right so the

first thing i could do then is to read

that trace back

so there is a function called traceback

that you can you know call and it prints

all this uh information here

it can be overwhelming but

i think one nice thing

okay i'm gonna rerun this to get another

trace back that comes by default

um well depending on how you have set up

your r studio but um

you may have it set up in this way so

that you can click here on show trace

back and you get the same thing that i

printed before

except that it has a little you know

nicer format some colors

and the colors help me because i can

quickly see

from all the code i skim and look only

and the code has some line numbers in it

so this code comes from from code that

i've written so our studio knows where

the functions are and in which files and

in which lines the errors were exposed

so sometimes um you know this helps you

identify something like this okay that's

it even makes sense right so i'm talking

about

uh i you know i sense that it's a url

that is corrupt i had to navigate to

those urls and if not if the url is bad

maybe this specific line

in the file

write dom html

in line 30 that is the problem so i

could navigate there and and also i

could i could try see the problem from a

little before because sometimes there is

a sequence of calls that result in a

problem but the problem started earlier

but i think this is a really good um

beginning i could go to that file and

remember that you can press ctrl and the

period the point

uh symbol to pop up this go to file

thing and now start typing the name of

the file that you want to explore so

write

down

write

dom html i can click enter there and if

the file has opened for me so now i can

go directly to line number 30 and

confirm that exactly you know what what

i see here in line number 30 of that

file is is what's exposed here

so now i have a couple of options uh if

i want to see what this function is

doing

uh when it's run

i could i could um do a few things if

you're using scripts um you can also

click here on on the side and and set

what's called a break point

if you forget about this you can always

come to the bag and also i think there

is a

toggle break point that allows you to

set and unset

breakpoints

i when you are working with packages

like i'm doing now it's um it's a little

clunky you need to load all functions

and blah blah blah so i find it easier

to use

a you know coded approach where you type

browser here

browser is a function that will stop the

execution of that function

uh when it's called right so that's one

approach that you can take

so that let's see if that works and this

is one strategy that in many cases uh

you know gets you there and but not

always so let's see

um what browser actually does for us so

again i'm gonna press shift ctrl enter

and now because you know i ensure that

the script runs fast i can you know i

have no worry i'll run the whole thing

and see what browser and that's for me

uh tomorrow yes

just i want to interject a note real

quick

that the

r studio and the traceback

of

being able to jump to a specific

function definition in a pile

that really only works if you're working

with uh functions from scripts and you

are frequently saving that script uh

if you do like i do where sometimes

you're like

running a script interactively and you

load a function change it load it again

change it load it again uh those uh

definitions that our knows about can get

wildly out of date so save often

very very cool point um

thanks alex

going back here

so

what happened while we were talking is

um

you know the code run as we know at the

point where it exposes the bug and then

is stopped so now i'm inside you see how

you know a browser is highlighted in

yellow

and so i'm no longer in my global

environment i'm inside the environment

of the function

and that i i'm trying to debug

um and i have um in here you know this

is the kind of the debugger uh console

see how it's it's not just the you know

greater than symbol it's it's a browser

greater than so that indicates i'm

inside some weird environment and here i

have things that i can click on and like

for example to continue i click here and

and you will see

um tomorrow it's now 20 past

thanks very much

um

so

i'm going to run that once again

because again i've got lost there and i

think with continue

i jumped out of the function and that's

not what i wanted to do i wanted to kind

of start working with a function here

usually you press also next with uh you

know you can use next from here or type

n

and that will kind of move one line at

the time

and here is you know i landed on the

line that i suspect that the problem is

because the traceback showed me that so

one thing i could do

is like notice how now i have access to

what the

uh you know the environment or inside

the function so there is this url thing

object then and that's the one i'm

suspecting so i want to see what that

url looks like so here i would just type

you know url uh and see what i get and

and fair enough what i get is an empty

string so it looks like you know the

function is trying to navigate somehow

the data is corrupt and has an empty

string where it should have an actual

url and that's what it's going crazy

so one thing i could also do is

use the function stir for structure uh

to print

while the function execute executes um

information that might be relevant for

debugging right and i can leave the

function like that for for a moment and

rerun it or even more usefully you can

run use the function message because the

message function will

will

will

print in red

in this particular case let's use stir

uh url

and uh and that's you know one way in

which you could um you know rerun now

the function let's stop the

the browser

but we have learned something you know

we know now that there is a string so

that we can do something like here we

can do

fix me to leave a note this is

consensual i mean many teams do

use this flag fix me

when um

when url is

empty string

i get an error and then i can work from

this even if i go now for lunch and i

come back later i know that i can search

for fix me with shift ctrl f globally

and i will you know i will find all the

fixed minutes that i have in this

particular code base and i could i can i

can go one by one

and explore what problems they were

um

so what i wanted to show you now is you

know what will happen now when the

i rerun this this code and now i put

inside the function that i'm suspecting

has the problem

i put a um

a call to str and here is the result of

str character empty so this is a one way

to confirm that exactly where a url

should have been given instead you know

the function got an empty string

okay so let's

go back and remove that so the problem

is now

um is clear you know i need to somehow

handle

um that problem i could even say here

something like

if

url

is the empty string

then a stop

bad url you know something like that

but

right now they you know i'm not

interested in handling uh the cause so

much as i am in finding the bad data so

to find the bad data and

we can do use an approach that is very

general you can use it for everything to

reduce anything and find just about

anything that is called binary search

so we have this data unique uh data set

and so what we can start doing is

slicing the data uh two uh you know you

know half

of it and then see if the problem is in

the first half or in the second half so

i'm gonna go

and do that here so here i asked the

tail for that unique thing

um but let's use instead of the tail i

could do

um

a good slice

the you use slice

and

um

something like those so this this does

it was 44 000 so i could say 43

thousands

from the

the row number 43 000 to

the row number um

or today to the last

row so which is

uh last

is and rows of unique

right

well in this case because i have

i'm using the

already subset

of unique but now let's rerun that

so now the last row is 44 000

so that one there so

this will slice the data to just you

know the last few

um

to the last few

rows right and i can run this again and

see if the problem

persists or not oh here this is another

back actually it's not the one i'm

interested in solving here but

it's this one here and it's our

session here right and now um

so if the problem

persists um

[Music]

so let me load

this

so now let's rerun this

so in this case uh the brain did not

appear uh because uh it looks like the

the problem is um in a subset of data

that i have excluded so basically you

know let's do that you know more simply

somewhere else so if you have empty cars

and you can slice it slice you know from

row how many rows is it let's first find

out

so that is 32 rows so let's do

uh first let's slice it from one to half

of it so 1 to 15 and then you know we

use this data set to see if the product

is there if it is not there then we can

explore rows 16

to 32

and then we see if the problem is there

uh if well it should be there right so

now we can break this in half so we can

go from a half of 16 to 32 so let's say

here we go from 20 to 32 is the in that

half if if it is then you know you have

effectively narrowed down the problem

every time more and you will end up very

quickly actually

to just a few rows that you can just

expect you know by eye

so in this case

the unique

uh data set um

[Music]

let's see this one is no this is not the

one that i want to show you

well in this case you know the point is

that the unique data set does have one

row that contains an empty string where

it should have a url and uh you know

with a binary search you could you could

find it there so

it's time to to stop here let's um

see what comments or questions we have

and i know here we have had conversation

with some

people in the audience about these ideas

so it would be interesting to see what

you think

let me then do a recap while you know

you think if there's anything that you'd

like to comment

uh on

here let's go back to

okay so if you're interested in the

cache function uh that use ping function

that i showed uh here is the code it's

just like three lines like really simple

and i'm planning to show

um

the pins package again recently and i

say again because we have covered um

the pins package that creates cash and

it handles cash

in a meetup before but ps now has a new

interface so i would like to kind of

show the new interface and this this

personal function use ping that uses a

pin if it exists and if it doesn't then

it creates it

uh so that i will dedicate probably hang

out to that or something like that so

let's go back to my notes to see what uh

things i cover what things i couldn't

cover so we discussed trace trace back

to try locate errors uh we talked about

the function browser uh one function i

didn't mention i'm gonna show it like

quickly it is fairly advanced though but

um i think it's uh it's pretty cool um

unique let's do the tail here

as we detail the last stuff and bro so

this goes back

brings the this this script back to what

it was before so let me run this

um just to confirm that i'm good

and i'm gonna have to show you one

function that is is pretty useful uh

which is so once you find an error

especially if the error is one that can

appears in one iteration of in in a

in you know within many many many uh you

may use you may set the so when

basically when arder takes a a problem

an error

what happens next can be configured so

there is an option in r called options

error and here you can you can do

whatever you want there is a bunch of

things that you can pass to this

argument

in this case we can we can pass recover

and so that kind of sets

the handling of errors in such a way

that when the error occurs the function

the you know you will be dropped in a

debugger environment specifically where

the problem was found so let's go here

to the script i'm going to rerun the

script um all at once

and now with this new

kind of error handling let's see what

happens okay what happens here is that i

have been i'm now presented with a

traceback

and with a bunch of options like one two

three four blah blah blah of where i

want a browser to be inserted so before

i insert the browser manually

with options equals recover recovery is

the function i'm asked to choose after

the fact which is the the environment of

the function i want to enter so here i

could say something like um like this

one number six for example

type number six and be dropped uh

exactly where we were dropped before

with without having to type ourselves

the the

the function browser

okay once more back to your faces

if these questions or comments go ahead

in the meantime i'm going to put back

again

my notes

so

we talked about i'm just saying

so thank you thank you very much i'm

gonna quickly close but not before

walking through this so now we talked

about traceback we talked about browser

we talked about um

recover

we talk about

structure and message

um the back ones is something similar to

um

yeah basically allows you to debug

similar to introducing a browser

statement you find inside a function

without actually having to type it and

the ones part comes from you know it's

only one time that it happens uh and

then you know the second time that you

call that function it will behave as you

expect

um yeah pretty much we covered

everything and we talked more

importantly about general strategies

like okay try to make your problem

self-contained try to iterate as fast as

possible by reducing computation and

reducing the size of the data or code

that you have to go through and get

feedback in here is like the idea of for

example trying to implement a a progress

bar to know how far you're getting into

solving your problem

so that's about it

thanks very much for joining uh any

departing comment or question

very good

all right see you all next

week with

someone else hopefully i don't want to

announce it yet because it's still to be

confirmed but there's going to be a new

series next week and most likely i'm not

going to be the one leading it so it's

going to be something refreshing for

everyone

thank you see you soon

thank you
