---
type: Video Transcript
title: "Testing: Basic structure and  basic workflow"
description: "By the by the book that i'm following for for this series it might sound odd but you know i'm following a book about testing about shiny and..."
resource: "https://www.youtube.com/watch?v=yMPV9TPH3GI"
tags: ["ds-incubator", "testing", "workflow", "r-packages", "shiny"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=yMPV9TPH3GI"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2021-04-06T00:00:00Z"
    usage_count: 37
usage_window: { from: "2021-04-06T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

so today the ds encoder is again about

testing our code the series so far has

had only one session

and um i expect it to have uh well two

days

and maybe three or four more at least

um you know we have core testing before

but we did it like very briefly

and in a very compact way this time

because we are on a series

i think it's worth to kind of adjust the

speed of the meetups to the interest

and the experiences that people have

with testing so you know there is

opportunities to ask questions

so in that on one hand i kind of

apologize if you know you feel like this

is moving a little slow

and but but then on the other hand i

know that i will be probably covering

some details that are not even captured

by the by the book

that i'm following for for this series

so as a reminder

it might sound odd but you know i'm

following a book about testing about

sorry about

shiny and there's one chapter about

testing

and that has generally focused on

testing shiny applications but

really um is a really good example

of destiny general so i'm kind of

following that because also it's the

latest

uh writings from hadley wickham about

testing so i think that

you know his experience is captured

there better than in any other resource

including the the book are packages that

includes chapter of intestine but i

think it's not so good as

the chapter on testing that lives in the

book mastering shine

so today we're going to be talking about

mostly the mechanics last time we

covered very theoretical ideas and today

we're going to be covering

um how to test files

know how to define how to work with test

files

and the basic workflow that maps

exactly with the name of the chapters on

the book

this chapter called testing files and a

chapter called workflow

sorry the sections in the chapter

testing i'm

very inelegant today sorry

and the objectives are to

basically do three things understand the

different levels in which tests

are structured from like the the

level of a file the level of a test and

the level of an expectation we're gonna

like recording that in a moment

also understand what is the basic

workflow by using an example we're gonna

build a function

or copy paste a function called load

load file

and then we're gonna be focusing uh on

on testing that function

in it probably in the next chapter we

are gonna be

actually focusing on the r uh side of

things and and working more on the r

fi on the on the code uh by doing some

testing development but today the focus

is not going to be

the function but it's going to be

testing the function

next time we are going to be focusing on

both the testing and the function

because we're going to be used using

this approach called test driven

development to actually develop the code

that today we're going to just copy

paste

and finally we if we have time we're

going to be talking about

the four ways in which you can run tests

line by line

running the whole test that is a call

simply to a function that lives in a

test

that package called test underscore that

to run then all tests in a file by using

the function test underscore file which

we usually do in keyboard shortcut and

then to run all the tests

suite in a package that we do with the

function

test so that's the overview of what

we're going to be covering

today

as a reminder of the requirements

there's not much we are covering

all the ground very slowly and i'm going

to even

be adding some i'm going to be using not

only test that but also

use this which is a package that helps

you develop

our packages and also has functions to

add infrastructure that you need to be

able to run

tests in a very fluid way

so i'm going to as of today there is no

real background that you need if you

watch the previous meetup then great if

you didn't

you should be able to kind of catch up

um

so let's uh explore a little bit uh by

the way there is a section so if you go

to the

repo that hosts these um

materials and and this specific

series about testing you will see that

now in the resources section there is a

url

to um to a google doc

so that is kind of what i'm reading on

my left screen that you're not seeing on

on you know on the shared screen with

you

so if you want to come back to what i've

i kind of explained

you can you can go there and you'll find

the material

so basically um let's start with

discussing a little bit the structure

the three level

structure of tests

the the one like kind of the bigger

level is the level of a file and

basically there is a

mapping between some code that lives in

the folder

are in a package and

code that lives in a different folder

that is called

that is in the folder tests

inside that is another folder called

test that and inside that there is each

this one file for each um

file in r so if we have a file that is

say

called load.r then

we we're gonna have a file in the test

that folder called test hyphen

load.r we're gonna see that in a moment

that is a convention you can actually

put any test

anywhere but if you do follow the

convention life is easier and also use

this has some helpers that help you

implement that without even remembering

that convention and i'm going to show

you that

in a moment and so then

so the higher level of testing is the

level of the file

then there is multiple files each with

multiple tests

but you know going kind of um in to a

kind of

to more detail inside a file you can

have one or more

what's called tests and a test is simply

a call to a function that is called

test underscore that and i'm going to

show you that in a moment too

what is a test and that's the tricky

part this i'm going to read like

directly from like a quote from the book

because um you know i think it's really

pretty eloquent

and succinctly conveys the the

challenge of testing a test

should generally check a single property

of a function

although it's hard to exactly describe

what that means what is a property of

function

but a general and good holistic is that

if you can easily describe

what that test is or what that property

is

very succinctly in one sentence then

probably you are getting it quite right

and we're gonna see that again

in action in a moment and finally within

each

test which again is equal to test

underscore that

there is what we call expectations and

that is what you exactly expect

uh the output that of your function

to be so you know some functions return

true

then you know you call your function and

the output should be exactly true

if it's false that test will fail if

it's true

that test will pass and the art of

testing is figuring out you know how to

write tests that clearly define

the expected behavior of your function

without depending on incidental details

that might change

in the future and that's quoted directly

from the book and why

because if you are in your test if you

are testing things that

um are gonna change for sure because

it's a it's a low level detail

that doesn't really expose is not

exposed to the user but it's mostly for

the convenience of the developer

then you're going to be changing you

know your taste will fade all the time

you're going to be having to up you know

to synchronize your code with your tests

all the time

you're going to kind of worry yourself

you're going to get tired and you're

going to start losing trust in your

tests and every time that you get a

fader in your test you're gonna ignore

it

so the the art is to get you know those

tests

uh to a point where they only fail when

the one property that you're interested

about

is the one that is changing if other

details are changing that

that are not relevant to those

properties then those tests should

should pass and that will

will give you a safety network

over which you can work

do changes and only notice the changes

that broke something that you care about

because your users are depending on that

and your users could be you yourself

right so if you build a package for

yourself

if you beat some code for yourself um i

mean you're interested in making sure

that

that code still does what you want it to

do

so when you wear the hat of the

developer you write that code but then

you're going to be wearing the hat of

the analyst and you're going to be

using that code and that at that point

you're a user

so you're the user of your own code and

you want it to behave in the way

that you expect it so let's get now

to looking at a little code um

so for this let me start showing you uh

so usually you know i

usually because i use packages a lot i

usually start

by creating a package with a function

from the use this package that is called

create package

but but today i'm gonna start you know

in a way that

maybe resembles more closely and

the experience that you might have if

you haven't used packages a lot so

basically you start with a project

which is not a package and oh you i

don't really care about a package you

just want to add some tests okay so what

how do you actually what's your next

step basically

so this is an example of that so this is

the

the project ds.testing which has a

repository i'm going to expand here the

console

and as you can see in the files tab

it's very simple it only has another

studio project file and a rhythmic file

and also a git ignore file but i mean

this doesn't look at it as

anything special right it's not an our

package or anything

so um but you know we want to add some

code

and we want later to test that code so

we're going to be using the package

use this

because it has a bunch of convenient

functions that

are going to make our life easier for

example they implement

the conventions that tests

that knows about for example if i want

to write a function

called say load underscore file

i could put it inside a file and i'm

going to use

exactly the example that i have used in

the book i could use

um i could stick that in a file called

load

i would probably do it in a file called

exactly load underscore file but for

some reason

how we decided to call it load so i'm

going to call it load

so there is a convenient function in the

use this package that is called use

r so if i say use r

and i give you the name load what this

will do

will create a file called

load inside the r folder

so notice that i still don't have any

our folder here so as soon as i run

that function use this actually creates

that our folder and inside

it it creates a file called load.r

right so it's empty here for now

but i'm going to copy paste the code

that comes from

from the book so i'm copying here from

my other screen

into here

so that is the code that hadley wrote

as an implementation of this function

called load

file basically takes two arguments the

name of a file

which usually includes an extension

something like

a test um dot csv

or test or whatever i mean this can be

called empty cars.csv

or emptycars.tsv

and then a path which is everything

before the name of the file so something

like

you know slash mauro slash

home slash mauro that would be a path to

a file store in that in that directory

so this function is extracting the

extension from the name so if the name

of the function is

say test.csv is going to get that csv

component so that extension that you

know that if

this is a tsv or a csv file it's going

to be

stored here in the extension and then

hadley is using the function switch

which is a

very nice alternative to if to instead

of you know doing if else all the time

you can use

switch particularly if what determines

the different paths

through the logic of if is a string of

text

so in this first line here i i

you know got a string of text

that is going to be either csv tsv or

something that this function doesn't

know about

and then if it is csv then

it's going to read the file using

a function from the vroom package which

is similar to the function in read r

called read underscore csv so vroom

is is just an alternative to read r

clever error in some ways and it's going

to be using the delimiter

comma and if it is a tsv

it is going to be using the delimiter

tab and if it is not a csv

or neither a tsv then is going to

basically throw an informative error

so i'm using exactly the a code that

hardly put in the book to reduce

confusion

but this could also be replaced by some

kind of call to stop

or something like that validate is a

function that comes from shiny

so this function base is similar to stop

but

you know clever in the context of shiny

applications

that's a detail that is not very

relevant for the purposes of testing

and i'm getting to very close

mark where i should stop so what i i'm

going to do now is i'm going to

create the test file that is the

the sibling right that is that that is

the the counterpart of this code so this

is

our code similar to any function that

you usually write

so now if we want to create the file

where we should be putting our tests

then what we do is we call

use lowercase actually use

test in this case i don't need to add

a string of text here of any kind

because i have opened

the file load.r so use this is aware of

the context

in our studio it knows that i have

the active file is called load r so it's

going to use

that information under the hoods to

create a new file

called test hyphen load dot r

inside the test directory so if i now

show you

the the folder tests you see that there

is this folder test that

and you see that there is this file

called test hyphen

load r so that is now not an empty file

because

by default it comes with a kind of toy

example

of um you know a test

but um but we are going to remove this

and change it to our convenience

um we are at the mark where i should

stop

talking um i don't know if there are

going to be a lot of questions so i am

actually going to

probably take one minute to begin by

copy pasting the code the test code and

show you how it works

um so i'm gonna steal you a couple of

minutes from

from the questions i wanted to do a live

demo actually of

writing that code but you know there's

not gonna be time

so um yeah i'm gonna just copy paste it

for now

uh let's see so we get a little

we get to move a little faster so i'm

gonna remove this completely and i'm

gonna replace it with a code that comes

from the book

basically the first argument to the

function you create a test with a

function test that

and it has two arguments the first

argument is this one here

and the second argument is this one here

the first argument is just a description

of you know that property that you want

to test

in this case the property that we want

to test is that load file handles all

input types and the valid input types

are csv and dsv

and anything else should fail and the

second argument which is this one here

is just a bunch of code

because it's a multi-line

argument we need to embrace it with the

curly braces

right if it was just one line we don't

need curly braces but this is a you know

a chunk of code that has multiple lines

so we need it

and notice that this first part where we

create data

all we are doing is creating something

or which we can test

that is what you know normally if you

wanted to test that you know csv file is

doing what you want

it to do you could probably you know

open

excel add a bunch of you know

information in there

and then you know save that file

somewhere and then read it

okay when you write tests you have to

learn how to transform all those

clickings

into code so what we are doing here

in between lines you know three and

seven

we are first starting with a data frame

on r

then creating empty files

one to host a csv file and another one

to host a tsv file

and then we are writing that data frame

as a csv or ssc as a tsv

inside that file so that replaces all

the clicking that you would do

if you wanted to do this through say

excel

and finally we have what we call those

expectations

right that we discussed before

let me see the comments so this is the

structure of the test

okay i'm gonna pause here for questions

and maybe the one thing i would like to

do actually is to run this so the four

things i could run these tests are as

follows i could run this line by line

right i could run this line and you see

that that manifests in the console

if the test has or failed

i actually don't i haven't loaded the

function

file actually i'm going to stop here for

questions because probably this

deserves more time in the next session

so let's see what we have now

i see a comment let me read it go ahead

if you have any question otherwise

let me know please any question or

comment right now

nothing yet okay and then i'm gonna use

until you interrupt me

cj you are my time keeper so if is that

okay if i keep going

trying to cover you know as much as what

i had planned for today

and if there is any question like

directly just interrupt me and ask is

that okay

yeah yeah okay cool yeah because we

didn't get to any useful

and useful part so the four ways of

running tests are um as i said before

line by line is one way but also notice

how i got this message saying

that load file doesn't exist

and and here is where i wanted to show

one more thing about testing

infrastructure that does

need a package so and

when you use a package or when you use

tests

inside the package there's a bunch of

convenient

shortcuts that you can use and this is

particularly a function from the devtool

devtools package that is called load all

that will make this the source code

of the files in r available

to the tests so the reason why i got

this error here when i was running

uh this this particular line is because

the tests don't know about the function

load file

what you could do or what you have to do

in a testing environment is to use that

function

load all which will source

every file in the r folder and make it

available to the test so the test will

then

know about load file but i don't even

know if lodo is going to

work here because my project is still

not on our package it looks like another

package but it is

missing the one component that makes it

that defines it as a package which is a

file called

description so let me first because i'm

curious let me run this function to see

if load all actually does work without a

description file

and it doesn't actually reminds me that

it is missing a description file

so let me add that piece of

infrastructure that we need

to convert this into on our package

for that we have a functioning to use

this package which is called

use description so that file that

function will create that one file

description right that defines this

as another package but there is one more

catch

and that's why i wanted to show you this

on the

meetup and because it's not kind of

explained

um or maybe you're gonna miss it in the

book i don't know if

it is there as you can see even although

this is now a package formally

our studio still thinks that this is

the old project before we converted it

to a package

there is some information in this file

called

ds testing dot approach that tells our

studio

if a project is a normal project or if a

project is on our package

we have changed that to make it like an

ad package

but this hasn't yet been manifested in

our studio

what we need to do now is to reopen the

project which i can do by going to the

icon here that has the name of the

package and click

on itself so i'm going to basically

close this project

and reopen it again and now you will see

something

interesting which is that the tabs

available to you are different

than the ones that were available to you

before now

we have a tab that is new to us it

didn't exist before

is this tab called build which includes

a bunch of things

including the function for example log

all that i showed you before which i can

click

to you know basically load all functions

and

also includes the function for example

test package

so now you realize that you know by

adding the description file by running

that function

use description not just

that description file was modified but

also the rstudio file the our proj

file was modified to tell our studio

that this is indeed another package

so with that i could now

now that i have loaded all functions as

you see right

i usually do it with a keyboard shortcut

ctrl shift l

that runs the function load all so now

all functions are available to me so for

example if i started typing

load underscore file that function

should exist

and as you can see it belongs to the

namespace of the package

ds.testing which is the project that we

are using now

so now let's talk about let's

demonstrate those four ways now that

this is a package

nowadays that will work and let's

demonstrate the four ways in which we

can run this test

so line by line once again i can run

line

you know three four five six seven with

that i created some test data

and i created it in a temporary

environment that will kind of

or a temporary directory will disappear

when the session ends

so it doesn't pollute my file system and

i'm going to run the expectations

first expectation second expectation and

third expectation

the first expectation is testing that

the that running

this code that running the function load

file with the name

test.csv and the path

to wherever that csv is stored is

equal to the data frame

jackson give your one

so the other expectation that is is

quite important is expect

error same thing some code goes in the

first argument and in the case of

respect error we match the error message

that we expect

and that error message comes from here

right this is the error message that

someone good

could get and that is the error message

that we want to match

this went a little fast and i only

showed you know

one way to run tests which is

interactively like my line

the second way is to run the whole test

and i can do that just by

running the entire chunk that's the

second way

as you can see i got a test passed

message

the third way is to call the function

test file which um

i linked to a keyword shortcut ctrl t

so that runs all the tests in this file

in this case it's just one test

and the fourth way is to run

the entire test suite which you can run

from here from test package

so if there's multiple test files they

will all run

with that function call so line by line

is one way

test by test is another way file by file

is another way

and all the tests in a package is the

final way

so with that i ran out of time is there

any

question now that we have now that i

have actually shown something useful

uh i have a quick question yes if it's

possible so like at first you said you

will do it without creating a package

but then in the end you did kind of

create the package

so can you use the test that

uh package without

actually like having this description

file did you need the description

for devtools or for testing as well

yeah that's a good question not very

sure what exactly i said but

i mean you can use functions in the test

that package

for example expect x x

packed equal you can say uh

one is equal to two and i'm gonna get an

error

it's not if i say one is equal to one it

will work

so you can use it in that context but

it's not all that useful

it's useful when you know what you wanna

do really is to run dev tools

test and you want all tests in a package

to run

so for devtools tests to work you do

need a package

because the package is a convention and

that convention is used by devtools test

to know where to look for those tests

and how to match them with the

corresponding code in r

so the infrastructure of the package is

crucial for the workflow

that that you know

that for the natural workflow of testing

although you can

use them in isolation test that also has

functions that you can run

like this test load that r

file individually or like a directory of

them so

yeah it can work outside of the

package i've used that before like

outside of the package context

yeah in a way it's much more convenient

to

follow with everything because then they

all work together and everything's

magical

i do the idea i think that you know

working we test that outside the context

of a package feels like trying to force

a square peg in a round hole basically

you know and you can use it but you have

to do all these gymnastics

that are just you know it's just just

buying a lot of friction for yourself

okay thanks all right thank you very

much sorry for

um yeah i'm just moving slow

because by design you know i want to

make sure that we are not skipping

important steps thank you and see you

next time
