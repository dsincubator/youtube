---
type: Video Transcript
title: "Testing: Test driven development (TDD)"
description: "Today the ds incubator is going to be covering test driven development which in the subsection philosophy of the in the book mastering shiny it is this writing..."
resource: "https://www.youtube.com/watch?v=4AOKCiAh3NM"
tags: ["ds-incubator", "tdd", "testing", "refactoring", "r-packages"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=4AOKCiAh3NM"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2021-04-13T00:00:00Z"
    usage_count: 48
usage_window: { from: "2021-04-13T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

today the ds incubator is going to be

covering test driven development which

is mentioned

in the subsection philosophy of the

testing chapter

in the book mastering shiny it is this

kind of

writing code where you actually first

write a failing test

that checks for the property that you

would like your feature to include

and only then you write the code and the

code that you write is the minimum

amount of code that makes that test to

pass

and then the next stage is to use

basically the safety

that you build for yourself with tests

to then aggressively refactor your code

to make it

cleaner to make it easier to read so i'm

gonna be moving super fast today

it's just gonna demonstrate how uh the

workflow goes

um it is like going to watch a tennis

match

uh i'm not expecting you to learn a lot

and become a professional

professional tennis player by watching

other people play

and this is the kind of thing that you

only really learn once you practice

a lot but also i wanted to show test

dream development early in the series of

meetups because

there's nothing special about it other

than changing the order in which you

test and build

code so i don't you know you know the

speed might be a little bit intimidating

but the

approach itself should be quite um

accessible to everyone

in terms of requirements last meet up

and we cover basically the basics

of workflow of testing and you're going

to be seeing this today in action

so while you may not um

hear today why we do what we do what

what i do but

and at least you will see everything

that you know we have covered before

just that implemented as opposed to

discussing it

so the very first thing you do when you

start um

wait in this case i'm going to be talk

working a lot with devtools and and

function that comes in the tools with

with the package

use this and also test that right so all

those things you could you know normally

attach them

uh with library like something like let

me test that

but usually i don't need to do that

because i have configured my our profile

to do that for me every time i restart

my session

so that's what i could do right now

restart my session and the first thing

you know in test review

development that you do is you use the

function

use test to create a test file

with the name the name of the function

that you want to

develop so this is the name of the

function i want to develop load file

this opens a test file actually i

include

some demo um code which i'm gonna delete

instead i'm gonna you know write my oops

write my own the three things i would

like this feature to

do is one i would like load find to be

able to read a csv file i would like

it to read a tsv file and three

i would like it to error gracefully

if the file given has

an extension that is unknown that is not

a csv

and not dsv so

okay that's the formulation of my test

uh so i'm going to be using one of the

two most important expectations

in tesla which is expect

error in the

actual meetup cj asked about you know

which test you would write first if you

know the test that checks for the

property

about um the error or if you write first

the test

that checks for the property about tsv's

or csvs

it is probably more natural to start

writing the test for

the you know the main thing that the

function should do something like okay

it reads a tsv file or csv file but i'm

going to start with the error because

it's super easy to implement and that

will give me

some momentum basically i want to to

show

very quickly the first iteration of this

dream and development

and this will allow me to do that so

expect error text to arguments argument

one and argument two so in argument one

you

um basically um is called object so um

you call the the function that you want

to test

um and here i'm gonna be using

uh let's call it file dot oh actually

it's gonna bla

so blah is something that should draw an

error an error i would like to see

you should read something like um let's

say invalid file

i think for example um so let's do that

so that's my test but if i run that test

i'm pressing shift ctrl t

that's part of the workflow um that test

you know should fail of course

but the reason why i should face because

the function load file is not yet

implemented

which is fair enough so let's go ahead

and implement it so i'm going to use use

r which is another function to use this

package and i'm not going to use any

argument because i have open

already the test file that corresponds

to that

code file and use this use r and knows

about

the active document so automatically can

generate

a file in r that will contain the code

implementation of load file

so let's write that implementation is a

function let's give it an argument

called

file and because load file is files

and let's start by doing nothing let's

see what happens so if i

run my test again we shift ctrl t and

save

the the file it it's i still get an

error but it's not

the error that i um i wanted because it

shows nothing right so if you implement

the function with nothing

you return that function returns no so

it does not draw an error so what we

need to do is to actually implement

that error let's do stop uh

in valid file so that is

the first thing that my function does so

i implemented the error there is

graceful

it says invalid file and i have just

effectively finished the first iteration

of uh test driven development you know i

wrote the test

then that fails then i wrote an

implementation and the test passes

and then the third bit of it is to

refactor

the code now that i have the safety of

the test but there's nothing i could

refactor here

i think it's it's pretty okay as it is

so let's go through

uh you know let's move on to test

another property of the function maybe

the most interesting one that can

read a csv file for example

this is uh it's gonna be a little bit of

work because we need you know a csv file

so

to create a csv file i'm gonna first

create a data frame

i'm going to do it with the function

tivo um

small data frame would be you know x

equals 1

y equals 2 for example so i can show you

what that data frame looks like there it

is

and now we need uh you know we need to

store it in a file so

the file is called file and we we i'm

gonna use a

temporary file with the file extension

file extension dot csv because that's

how

you know i would like it to be because

temporary file is nice in that

i don't need to clean up our will you

know knows that this is temporary

directory and when the session ends it

will destroy it automatically

and now i need to save that there's many

functions that you can use to save

csv files including the function room

right which takes you know a data frame

a file

path where you want to save it and also

has a delimiter that in this case is

going to be a comma

so that's how i would like to save the

file if i would like to inspect

the file i can use three lines to

with the argument file and this is what

the file would look like as you can see

x and y and then one and two are

separated by commas which is

what you would expect from a csv file

right so now let's actually

do something that is act on on this

function so

the thing the output that i would like

to get is from load

file and oops low file

with the um file argument

with with the file um argument right so

this argument is a path

right and the load file function has

an argument that can take it and then

once i you know i

achieved basically really so what i

would like this line to do is to read

that csv file that i wrote

in the line before and then the last

thing i want to do is to use the second

of the two most important expectations

in the tesla's package which is expect

equal so expect equal takes the um

sorry the output uh or basically

an object that i want to two options i

want to compare in this case out

and so the the if the result of reading

in that re read me that csv file should

be the same

as the original data frame right that i

got

so that's the expectation what happens

if i write if i run the test well you

should fail

because that's the very first step in

test driven development you write a

failing test

uh that once it passes it will confirm

that the feature exists

but not yet right so i get uh an error

that says invalid file while

why because that's the only thing that

this function knows how to do so i need

to implement

the behavior and to implement that

behavior and

well there may be more than one way but

one way is to first extract the

extension

and um um for this i'm going to use

tools tools file

extension so once you know you pass a

path to this function to the function

file xd

it will extract that extension and now i

can use that extension

say if that extension is identical to a

csv then what i would like this function

to do

is to return uh

you know the result of reading in this

case i'm going to be reading with vroom

that file that was given and the limit

there that you know i'm gonna be using

here is

a comma because this is a csv file so

let's see if this cuts it

if this passes my tests if it does i'm

done with iteration

i it does right it passes that um

that test i also see that there is a

kind of annoying message here that um

i could deal with later uh well annoying

i mean it's an informative message but

if i wanted to suppress it there is uh

there's things i could i could do

but again test driven development one

premise

is that when you write code you write

just enough

code to pass those tests you know write

more code than that

so you know it's kind of easy to know

when you're done that is when you finish

passing your tests so that's the

implementation of csv so now let's do

the same with tsb

quick and dirty it's fine here because

the refactoring comes at the third stage

um not now so now let's do

you know let's transform this test to

check that this is a

you know can read the tsv file i think

that's all i need to do right so reads

the tsp file

takes a table uh it stores it in a file

that

it has extension tsv and then saves it

there

so if i now read uh if i now do cut with

red lines lines

lines um file yeah this is a file

separated by tabs makes sense

um and then you know i can read the file

and then i can

compare that the output is equal to the

data frame that was originally given

and i'm intentionally separating these

in three blocks

these are commonly called um aaa

so the first a is um

arranged that's the concept that comes

from

testing the second one is act and the

third one is

assert right so

typically you don't include those

comments if you are you know they're

common

and you know structure your taste that

way um is common so you don't really

need those

comments there but i'll leave them there

just to mention that

yeah just to mention that that structure

of tests um

this one the test this should fail

because tsv's haven't been implemented

yet

and now we move to tests

oops and let's implement it so the way

i can implement that is to extend this

if uh

is a tsv as opposed to a csv

then the delimiter has to be tab

so this should pass my my test let's see

if that worked

there you go test passed so now that i

have the safety of

of the tests i can be very aggressive in

how

i restructure the the code i can

refactor it with for example switch um

because

the ifs switch this is a like a

an example that is relevant for for

switch because switch tests

um that value in this case a variable in

this case

extension holds

a particular string with that string

matches

csv then what i want to do

is what i did here right

and if it matches tsv i want

to do i want to do

this other thing and if

so with that i can remove this and then

if

it is none of the two then i want by

default through an error

right so that is my new

refactored implementation and as you can

see i was very aggressive in the

refactoring because they have the safety

of those tests

let this pass that's great and maybe i

could now work on

removing that uh that message this is a

message so let's see

how i could do that um let's

do one more thing uh maybe let's extend

this one here

let's move it here to the end uh so what

i'm gonna do

is throws no message throws

no message um

so what i want is that this

call uh i mean as is now

um as you can see if i call this

function load file i get this spec

message here that i could suppress it

right so

what i can do is expect message so i

want to test that there is no message

to say that there is no message you say

that the message that you expect

in the in the place where you would

normally write

a regular expression to match the

message you say n a

and that would give uh that would do the

trick that that we want

so now i'm in testing that the trusted

message but because we haven't

implemented the suppression

of the message we see have it and

therefore this test fails so we have

ended our first iteration

again our first um component

of this iteration of test driven

development so let's go ahead and

implement

that so that was uh what did we read

there

uh csv yeah csv file

so we could suppress

messages i guess to press messages

and that would be very aggressive

because it will remove every message so

instead what i'm going to do is another

way of suppressing the message which is

uh call types so if you do call types

list

that will uh that will remove the

message

so um i will run the test to confirm

that they pass now and they do

i could implement it here but that's

illegal in the test driven development

approach

first you have to implement it here

right so um i can now use you know the

two things

uh here in the in the same test for uh

convenience or in a different test

um let's do it in the same one so here

in this one

in this one test we can do file

underscore csv and we can use that

here and here

and then we can do a tsv

and the we write that dsv

with a tab as a delimiter and then we

test

that okay so we should get now one

failing expectation

so we implement that now by copying this

little text here

based in there so that should do the

trick

and test now pass so now it's kind of

nice that we have suppressed that

message

and now if i you know if i can load this

if i read you know a file csv

file it just reads it there is no more

message there same for a tsv file okay

so with that i've shown

the implementation the of test stream

development

the implementation of the function

itself looks a little different

than the one that you see in the book

actually my implementation is a little

simpler i can't be sure but i suspect

that it was

a mistake in the book unless i'm missing

something

and the implementation in the book has

this argument name that is

not used other than for the extension

so i suspect that um that's a mistake

and that's also one

gives me the opportunity to discuss one

benefit of

test driven development which is this

idea of um

because you only write code that

is required exclusively to pass the

tests that you have

set up for yourself you never end up

with an extra argument for example

because the if there is no you know if

you haven't tested for

for the argument that argument would

never be there right so

um it's a side effect it's not the main

purpose why you work with test durian

development but it's a very nice side

effect now you end up with functions

that are testable

more or less error prone and

better more maintainable because there's

a huge connection between

maintainability and test stability

so with that i am yeah i want to

acknowledge that there's

cj's comment about you know that it kind

of

it might feel more natural to start from

somewhere else other than where i

started

test driven this development but it's

totally up to you this treatment

development is just one tool

for thinking really about you know what

to implement and

and then how you implement it kind of

follows from there from you know the

goal that you set for yourself when you

first

write that failing test uh how you go

about that

it's totally up to you maybe through

practice

you will notice that the way you um you

write your tests and your code

changes through time it kind of strongly

has an impact on

on how you you write code in a very

positive way so when it's applicable

that is when

you know exactly what the function

should do i strongly recommend it i look

forward to

the next meet up
