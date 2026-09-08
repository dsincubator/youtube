---
type: Video Transcript
title: "R packages: Testing"
description: "Court so the meeting today continues to  be about our packages and in particular  about testing so the issue associated to  this Meetup  links to a book chapter"
resource: "https://www.youtube.com/watch?v=co082qNN_Cs"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=co082qNN_Cs"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

Court so the meeting today continues to

be about our packages and in particular

about testing so the issue associated to

this Meetup

links to a book chapter in the artists

book a chapter dedicated to testing and

also what the data sizing later chapter

which I'm very following along this

media and also to certain that I forgot

to mention before this leak here points

to the demo package so a package that we

built together in it that science

incubator last week leaves here on to

the disorganization and you can you know

go back to it if you want or clone it

and work with it in case you won't come

to practice on your own here is that the

template for what we do it so here we

are in the data science in greater

chapter dedicated to this issue of

testing and sorry sorry sorry have you

have you showed your screen Oh obviously

not perfect okay so what I was before I

was talking about this issue in the dead

sizing equator repo you know includes

links to the book that is where I'm

getting the information from also to the

that sizing Twitter chapter that I'm

going to be kind of working through and

to the demo package which is the package

that contains the code that we we have

been kind of working last week and we

may do something there today as well so

now I click here you should be seeing

chapter 17 is that okay yep you can see

it good great so the first thing you

know you would need to do if you want to

set up testing in a package is to simply

run the function use this use this tab

so I'm gonna demonstrate that

in their studio cloud project that you

know we've been working last week so

last week we kind of left at at a

relatively good place so we have run

checks and we confirm that data said

that we included you know was correctly

added and now all I've done is basically

create a new branch with the function PA

I need max mid- min which is the name of

the function or what we kind of working

with today so this is kind of pretty

much kind of taking on from where we

left last week so I'm now going to clean

the console and I'm gonna run simply use

these useless that before I do that I

want to show you that you know my files

do not contain a folder called tests so

if all the tests does not exist here

but when I run the function use this

useless that among a bunch of things one

thing that that function does is to are

such a folder it adds the folder tests

and already includes a file that it

attaches the package tests are the

package that we're working with and also

as the suit folder called test that I

here is where every test every test that

we write is going to lis so I'm talking

about this because it's kind of

important to understand where or what is

you know what the structure of tests

looks like in a package because you know

one goal of this presentation is to make

you familiar with with what you would

see if you contribute to someone else's

code so if you go to you to someone

else's code or you lands in a project

like the one that you're seeing right

now on screen I'm one of the first

things you might want to do is you know

to check to click that pocket check that

you know we did before to make sure that

the package you know before you even do

anything is at a good State and because

if something breaks you want to know if

something was broken before you started

working or since and then the other

thing you would like to start to do is

to then run the this other menu here

test package

and so when there is no infrastructure

for tests when there is a few things I

need to exist there too for test us that

to work and one thing that it is like a

test so say that we want to write a new

function and one good way to write your

function is with a function use R and

then you write the name of the function

you what to write and we let's say that

you want to call it max - mean that's

gonna be the name of our function I here

we write it so max - mean is a function

that takes the vector and say that will

calculate the max of that vector and

then we do minus the mean so that that's

a this is a function coming up with one

easy way to create infrastructure of

this the testing first factor for this

function will be to go to the console

and type use test and if you are in the

active file for which you want to create

a test you don't need to do anything

else test that will be clever enough to

create the right test where it should I

think we did something like this in when

we're adding data last week so so far

you know if we click this the file that

has been created by test that what we

see is like a meaningless test it's just

like a template for us to understand

what we should be to it so let's let's

replace this with something more

meaningful so we should add a title here

for our test and some kind of

expectation but this is to begin with it

likes a gladly yeah just for what the

infrastructure of a test is so there is

a test folder as you know we discussed

before we think that there is a test

that folder and we think that photo

there is any number of files so you

would have at least one file for each

like export it function for its function

that users can use so you will you know

this now that the tests associated to

the function max - min start the file it

starts with the name test - and that is

that is compulsory and is that does that

automatically for you so the tests

prefix tells us that that is a test file

and it has to do special things with it

and then you know we think that file

which is what we are seeing now screen

there is what's called tests you can

have many tests like this is one test

and this is another test and within each

test you can have many expectations this

is one expectation is another

expectation but now they are all the

same but of course you could write

different expectations to test for

different things so that is all I need

is you can't discuss about the info the

basic structure of a test so you know

now how to set it up you know what the

structure looks like and the workflow

that this infrastructure allows is

pretty simple basically you modify your

test code you modify your code or your

tests for example by extending your

functional by creating a new function

then you just run all the tests and see

if they pass over the fact they fail

there is a convenient shortcut ctrl

command shift and T runs the function

dev tools test so that is what actually

is happening when you press this your

shortcut and I need the test don't pass

then you continue to change your test or

your code until they do so let me show

you some examples of you know for

example how we would go about testing

this function that we just wrote max -

me so I'm gonna remove this meaningless

test which were just for demonstration

I'm going to paste this test that is a

bit more so if I write you know

generally what we do is you know we

ready function and we test it on the

console right so yeah on the console we

good you know

first I'm gonna load every option

despite package with the function dev

tools though oh and I do that with shift

control L and now you know this function

that I run should be available to be so

I'm going to try this function max minus

min with the vector of a sequence of two

to one so the maximum of the sequence

two to one is to the minimum is 1 so if

you rest

two to one of course you get what so

this could be one meaningful expectation

and I'm tests look this silly like for

real because you first the first thing

that you want to test there to answer

the question like what should I test

well what the first thing you need to

test is that what you think is true is

actually true you have to confirm like

the serious of the expectations so you

could do that with a meaning piece of

data and for example this super tiny

sequence let's so you want to test that

this is equal to this that if you take

the maximum of this sequence which is 2

and you've rested to the minimum of this

sequence which is 1 2 minus 1 gives you

1 I mean you can also test that for

example if you do the reverse of that if

the sequence 2 to 1 HD from 1 to 2 gives

the same result so that would be a

meaningful expectation and the title of

this test should be something that if

you see fail it should give you a hint

for what the problem is

so max - me with simple good inputs for

a turn expected output this could be

like a meaningful test to buy so if you

run the tests now you should see

everything green because because if

expectations' are as you expected but

say that you know you expected that this

second expectation should return true

through the return - because this is

because 2 is not equal to the output of

max - main with a vector 2 to 1 then

this should return if I run this test

now this should return a failure

I run the test and as you can see I get

a lot of useful information I can

breathe now the title that I wrote to

myself so they're more meaningful the

title is the easier it's going to be for

you when you run the test to know what

was wrong so I can read that in the test

max - min in the row number three there

is a failures exactly here and the test

title describe what a failure is and I

can see that the resolve is not equal to

two and instead here is what the result

was

so tests are a really quick way to help

you you know find bugs in the in the

first place

now I if you can't get off a mute

yourselves and so I have just kind of

stated one of the benefits of writing

test is that you know you finally helps

you find bugs even bugs in your code or

bugs in your tests but if I would like

to ask you if you can think of any other

potential benefits of having some tests

apart from box you know can you imagine

any other way in which your test could

help they can make sure that when you

add a function that the other function

still retirement you expect so if the

package occurs larger everything still

works as you expect it to work not great

that's a good point

so as you continue to add a new feature

you saying that it's not only you

confirm that this new feature works but

also you haven't broken anything that as

a side effect of adding your new

features that we're saying yeah any

other idea I think it's super useful

when so

it's a bug report and you look at it and

you realize this is a bug maybe it's you

know not that your function was doing

something wrong all the time but it was

like some education you have got an

expected or something that caused us an

error and then when you submit the

change to fix that in a function it's

really cool to add a test they also test

for this like edge case because one it's

kind of a reminder to you that like that

is something else that is working sure

you're going to but you know that it

also prevents that at least that bug

from ever happening again and I feel

like once you breeze not the thought it

would be kind of embarrassing it

reintroduced us sometimes don't write in

the packages that I've worked with I

always try to do that about fixing a bug

like also had a test for that specific

test case that's a great use of test I

agree

every test every bug fix should come

with the test that exposes first the

back then you work towards you know

fixing the back and then you leave the

test there because a lot of times it

happens that if you don't do that you

end up you know that that back comes you

know back again and then you waste time

basically I could kind of summarize what

you're saying yeah by not spending time

fixing bugs that you had already fixed

before great so those are excellent

descriptions of you know why tests are

important and and then you know if what

to test you know that I kind of chord

the first most basic answer to what to

test which is you know to confirm that

what you think is true is true but you

know CJ said you know these other things

are you gonna test like for example edge

cases and when you're testing you really

change your mindset from you know make

you know making your best effort to to

write code that works you change that

mindset to making your best effort to

break your code so you had to be done

like some someone very mean with your

own code and try to break it so we

already cover the first thing which is

you know try to test something that

works so now we could try to test

something that is obviously wrong and

should fail so we should always also try

to kind of prove to ourselves that what

is expected to fail fails so let's see

how we might go about that so we can say

something like okay let's explicity this

function max - mean with bad input from

some errors so that would be the test

that I want to I'm you know the package

test that includes in addition to the

expectation expect equal includes also

the expectation for example expect error

and many many many other expectations -

but if I for example field so the object

letters is just a sequence of letters

from A to Z if I run in a computation of

you know the maximum of this object

my name is the minimum of this object I

expect an error so let's see if what you

know I would get if I ran that on the

console I would get this error that says

non non numeric argument - binary

operator

it is a horrible error message very much

not descriptive of what's going on but I

mean good enough for now you know in the

early stages of developing this function

that would be just happy to know that

you know with this scenario at least I

get an error and and you can use a piece

of the error message that you get and

paste it here to see if the error that

you get matches that piece so I just

added that test and I'm going to run it

my test video game I'm going to run test

package okay I expect everything to go

well so if what you wrote here doesn't

match because you know I write something

like that so now this string doesn't

match the actual error message so I

would expect the test to fail with

something that tells me that

they expected miss much was where road

but actual match was different so that's

why that's what you would see is that he

said right so the so did anyone say just

on our topic I think it's good to

mention that the match doesn't need to

be perfect for the error message it's

just a like a regular expression exactly

yeah DC's actually are you mean school

thank you so you could say something

like none and you guys do something like

these the the aesthetic there was much

anything actually let's see if that

works

ok yeah it works so basically I'm

matching none than anything any number

of times and then they were argued

that's good because it makes your test

he's better approaches to testing for

errors but this kind of beyond the scope

of today and then the last thing before

we end because it's time and also about

what is the edge cases that CJ mentioned

so this was like obviously right this is

obviously wrong but then you have this

very interesting edge cases where you

know your thought about what the

function should do is challenged so for

example if I feed this function with

let's say a missing value within a what

do I get

oh okay I get an A and that kind of

makes sense so I could expect that you

know the output of max minus min with a

name for turns a name which is what I

got so you know I could write that

expectation but then what if you know I

give the function the vector 1 to n a I

mean I would expect that ok the maximum

of this seems I seems to be 2 right I'm

the minimum one so I would expect that

the output of that should be the

difference between 2 and 1 and

love to you know DNA to be ignored but

instead really what I get is something

different so with what we get is in a

because the ene kind of propagates and

makes the whole thing to go away so if I

ran that test now what I expected here

is wrong and I get appropriate failure

here and this is you know what brings us

back to the beginning of the talk and to

the end of the talk at the same time

where well now we are working with this

testing workflow so we detected that you

know challenging age case tells us that

our function does not behave as we

thought or what we think it should

behave so then we go back to our

function and maybe what we want to do is

modify the function something like na

equals remove equals true right so maybe

this is what we really want so we

learned that we had to modify our

function and now with that modification

in place you can run the test again and

I see I still have bearer there so you

know I might be must be doing something

wrong here but this is the workflow

basically you learn that by challenging

your function by challenging your

thought you learn that your code isn't

doing exactly what you think it's do it

and then you modify your code or modify

your test until the tests pass and then

you're done so that one great thing that

this have is that when the test passes

you're done you know you finish you

don't waste time making your code

perfect and at the same time breaking

things that that used to work before

okay that's the D end sorry that I was

too long starting the talking do we have

some questions before before we finish

one company two questions that so they

come is like yeah and I totally agree

this is super important for packages

Cody because you're generally creating

functions to do something with a context

that you're you don't necessarily know

very easy to come across these folks

because it's hard to predict although

the context that might be used it so

yeah thumbs up for that then the

questions were like using testing in

other places so for 120 and if you have

an experience using testing regime like

a non package type project like a data

analysis project or something I don't so

it's not like a trick question or

anything yeah yeah I took agree that

most people are probably in our

organization I'm more interested in how

to test your code when you don't when

you don't want to kind of build the

infrastructure of a test package and you

guys I mean I at some point it was a

heavy user of them of an assertion test

of assertion packages like assert a

third are or assert that or assertive

there are several packages that come

with a lot of assertions so if you are

not testing after the fact one of the

best things you can do is add a bunch of

assertions you know sprinkle in your

script also tests that can be used in a

script so you can still use in in any

script you can always use country from

tested by calling just the library and

you can say you know if you build a

function you can you can always to like

you can say expect equal one to one and

if this is sprinkling you're in your

script and you know the assertion is

doesn't fail you will do nothing and if

the assertion does fail it will

you an error so yeah I think that one a

good way to comes get started with

testing is like forget about assisted

this package infrastructure and just

start using assertions like right away

you're in your script I think any other

one has any other experience that idea

about that no and so my second question

is like very much related to that I've

also wonder about using like user

assertions or the suspect package

expectations in functions to test

incoming arguments and that's something

I feel like is woefully under utilized

in the art community yeah and I think

it's also pretty useful and not in our

because the language of our the way it

like lazily blows arguments it I feel

like it really just rotates this case

where you get through all this stuff and

your function and then you realize one

of the arguments they passed this

something totally unnecessary or totally

wrong and it causes all kinds of

problems

yeah I wonder why that's not more common

place yeah yeah I would I would like to

see functions our functions or our

functions in general to asking these

arguments for certain assertions before

even runs and starts doing especially

well if you like a pretty heavy or

long-running process to do some

assertions beforehand and then give a

user like some reasonable feedback not

like X is not an object of yeah as you

speak you know I kind of tried to

capturing questions so these you know I

know if anyone is familiar with the

jargon a session by basically

realization of an input argument as CJ

was describing I think correct me if I'm

wrong if I'm interpreting your comment

correctly it's like well you know

instead of feeling a you know this part

of the code with a horrible input say

that a input

X was the letter A this is horrible

input you know this code here will will

fail because it's it's a horrible input

that you know this disco doesn't know he

doesn't know what to do with it so you

see you can catch that X earlier here

with an assertion here you get an

assertion that is okay moderately more

informative or you could you know do

something a bit more laborious and

untested if if X is not numeric so you

do it kind of manually right then you

can break the message that you like so

yeah this is totally under use and I

agree one thing that I like including my

test is like one test at least one test

for each of the arguments to the

functions to capture just to see what is

the message that you get from horrible

inputs so yeah thanks CJ absolutely I

also hear that's totally under use and I

suspect that it is because people like

having you know functions are clean like

not contaminate the solutions to that

you know you can't extract this in a

music X function and and then here you

just check X X can you move this

function outside Amaro I think we're

cutting into the data Harold time now

there you go but anyway thank you very

much goodbye everyone
