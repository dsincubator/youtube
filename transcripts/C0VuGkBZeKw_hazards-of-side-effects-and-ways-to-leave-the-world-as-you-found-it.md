---
type: Video Transcript
title: "Hazards of side effects and ways to leave the world as you found it"
description: "Today dts inquiry continues on the series about testing our code and it might be the last meetup of this series i wanted to talk an idea that..."
resource: "https://www.youtube.com/watch?v=C0VuGkBZeKw"
tags: ["ds-incubator", "testing", "r-packages"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=C0VuGkBZeKw"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2021-05-11T00:00:00Z"
    usage_count: 19
usage_window: { from: "2021-05-11T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

today dts inquiry continues on the

series about testing our code and it

might be the last

meetup of this series i wanted to talk

about

an idea that was captured by the phrase

text fixtures

in two places one is a vignette in the

taste that package

and another one is a blog post by jenny

bryan

in the ty diverse blog it

originated from a conversation that was

internal in our studio and they realized

that it was

you know very useful beyond that

environment so they wrote those

resources

which i find very useful in our

context because i usually feel that

the particularly the code base we that

we know as pacta

is very difficult to test it's kind of

as hard as it gets to be honest i read a

whole book about

testing and that kind of refactoring

that kind of

challenging situations and yet it is it

kind of meets all the

checks all the boxes for super hard and

sometimes um the you know what what

makes the situation

difficult to test is that um the

code changes the state

of the ecosystem around the code like

for example set up

an environmental variable right or

change um

[Music]

you know the working directory those

kinds of things

are change the state in which

um the code you know

runs and that means that if you want to

test one piece of code and if that piece

of code changes the state

then the next head the next test will

already start in an awkward state right

so you have to clean up so basically the

process

that you know we should aim for is okay

we start with a state

we change the state however we need to

test that piece of code and then we

restore the state to what we found it

right so basically

this idea that most tests are written

assuming that the starting tate state

is a particular one and then

if you leave your environment changed

then the next step

the next test will not have this the

assumed state right so we have to be

very careful

about restoring the state to the you

know

default state and this is the idea that

i wanted to talk about i'm not gonna be

able to get too

deep into it so that uh maybe package

developers

have um something actionable you will

need if you are a motivated package

developer you will need to probably read

a little more in the blog post

in the time diverse blog or in the

vignette in test that

but yes i do want to at least mention

the hazards of

uh changing state and how we could

address those hazards and how to leave

the

world in the state that we found it that

is because

every test you know we want to start

from from scratch basically from a from

a blank slate

so the first thing i wanted to show with

a demo is

how for example we could write a little

function

that changes the number of digits

that print to the console when we you

know run for example

pi uh and how

a sloppy of such a function uh could

change

that permanently not just for the call

of that function but in general and

that's that's

that's bad because you know if we call

that function

once the next time uh everything will we

have we have changed so basically this

is what i want to demonstrate say that

we have this sloppy function here

maybe i'm gonna make this a little

bigger so that

is yes there you go

so we have defined sloppy i have not

called it yet and let's see what number

prints to my console when i call pi

so pi is just an object in r comes with

r

so when you print it it prints the

number pi with some significant digits

which are defined by default in the you

know however your

logo your options have been set in this

case it's printing

one two three four five six seven

significant digits

but now i'm going to call my sloppy

function

that takes a number and applies the

number of digits

that i give it to the second argument

right here

so my slope is function what it does is

takes the you know calls the function

options and changes

the option digits to whatever

significant digits i want

so in this case you know i call sloppy

with the number two so i would expect

that the number of significant digits

is two and here you can see on the

console to the top right

that instead of printing seven

significant digits it printed only two

okay so far so good but what happens if

i compi

again i would expect in in a normal

um you know our session you would expect

that a function that you called before

wouldn't change you know how uh you know

the number pi displays after you call

that function however if i print pi now

i still get two significant digits when

i was expecting seven

so this function sloppy change the

options not only

for the duration of that call but for

the entire session right so if i want to

recover the number of digits that i had

by default

i need to restart my session and only

now i could call

pi and i would expect the seven number

of digits that

i said by default so why is this a

problem how it relates to testing okay

if if for example we have a piece of

code that does something like this

creates a change that is general say you

set an environment

a global environment variable or

you know you change the options of some

particular

option in r and you write a test

for that piece of code then the starting

state of the next

test will have changed and the results

that you will get there

will probably be different from the ones

that you expect and not because the

piece of code is kind of wrong

but because the starting state is

different right so you would start

getting false

positives in the failures like basically

failures in your tests that

are not indicating that the code is

wrong but the state the study state is

wrong and that's very

difficult challenges to work with so how

do we

go about solving this problem okay

there is a function in r called on exit

that is the common function that we use

to solve this challenge basically if we

wanted to write now um

a neat version of the sloppy function so

it's basically the same thing you know

we set

the options uh to a number of

significant digits

but now we're gonna store that um

we already assigned that to an object

because options has

uh a very kind of unexpected or maybe

some some people

don't know much about this but options

that's two things

it sets the the the option to whatever

you give it but at the same time it

returns the

older options that means that if we have

in

op the options that were

at the start before we call options that

means that we could

use those options to restore them after

the action that we want to make

so we can then combine the function on

exit right

with a call to options op basically what

we are doing here is that

when this function needs exits

now we are going to set the options to

what they were before

and that solves the problem with two

caveats that on exit has and now we're

gonna be kind of basically

spending the rest of the meetup talking

about those caveats and how

we can solve them the first caveat and

probably the milder one

is that on exit needs these two

arguments

the defaults of add and the default of

after

are not usually what you want um

kind of explaining that is a little uh

takes a little while and maybe not

super interesting but it just for now

just accept that these two arguments are

generally most useful if they are not

set

as their default so the default of add

is false and usually we want it

true and the default of after is usually

true

and usually we want it false so that's

the first caveat

of of our function uh so

for now i'm going to just demonstrate

that neat does what we expect

i want to make sure that i restarted my

r session because this lobby function

before

kind of messed up my my environment

right my options so i'm gonna

define i'm going to now call pi

i get the seven significant digits that

i was expecting

now i'm going to call knit pi with two

significant digits so i expect

only two significant ditches and there

they go and now what i expect is when i

print pi

i again get the seven significant digits

that were said before

if that's the case then my neet function

is doing cleanup after itself

let's run that and there we go we do

have seven significant digits

meaning that need effectively change the

options

just for the duration of itself right so

it does the thing and then restores the

options to what they were before

so that strategy is the most important

point of this meet up so calling on exit

or

an alternative to an exit that i'm going

to demonstrate in a moment

is exactly what i want to preach for if

you are a package developer you may go

like a step beyond that and you may

write your own what's called

text test fixtures but you know we won't

have

maybe time to talk a lot about that but

i'm going to point you in the right

direction

um now the second caveat of on exit the

first one being this one here that it

has

two arguments that the default are not

usually

uh very helpful instead um

you know you need to set those arguments

as defined here but there's a second

caveat that is even more important

and that is that you cannot wrap on exit

on a helper so if you say okay cool this

action of

doing something and then restoring it to

its current state

is very helpful and i want to have you

know that

as a wrapped feature and apply it to my

test or apply to

whatever then you could write your local

digits function you could do you know

write your little helper that does

something and immediately destroys it

basically what you want to wrap is

those two lines of code that i showed

you before where you set the options

at the same time you store this first

line here at the same time you store the

other options and then on exit of

whatever you're doing

you restore the options to what they

were before that would be great the idea

is amazing but unfortunately you cannot

do it with on exit

so let me show you that i'm going to

start my session here to start fresh

so if i define local digits

and now i want to reuse that rubber in

inside that function neither that i

wrote before

so now instead of you know like

basically using this code

in line 30 i'm now using my rubber so

you would expect that it would just work

because you usually wrap code and it

just works but in this case

it doesn't because on exit does not have

a way

to go back one step up

to the to the level where it's running

so it's running

in the environment of local digits and

has no way to step

up to the environment where it's called

in inside the function neither

so let me demonstrate that so i already

defined neither

and now let's call neither and as you

can see

uh neither sorry in local um

inside neither i define um i call local

digis with the number one meaning that

i could expect that what i call knitter

the number of digits that i print to my

console is just one

and it's not the case it's giving me

again the seven digits that are set by

default and that is

once again it may sound a little weird

but if you're interested in digging more

in the blog post it's kind of explained

more gently on xc does not have a way

to go up to the to the environment where

neither calls it it just exits here

when you call local digits that's the

challenge so there is a solution to that

which is to use a different

function from a package that is

dedicated precisely to manage state

and that package is called with r

and the function that replaces on exit

is the function

called the third the fair already has

those arguments that i showed you before

set to what's usually

most helpful and it also has a second

argument that is the environment

where you define where that function

will do the cleanup

in which environment so usually what you

want is the parent frame

so that is a kind of an implementation

detail for most of us

the the takeaway is that um if you're

struggling with the function on exit

use the function deferred from the with

our package so let me show you what this

uh how this works and i'm approaching to

the

20 past and jackson is going to try to

kick me out i'm going to resist that for

a little bit

so i have just defined the function

local digits remember this one now

uh is not using on exit is using the

better more

um featured function from the with our

package called the fair

so i now call uh and i also noticed that

um okay and also remember

that the function meter was defined with

local digits

one so by by doing this here

by doing this here i'm overwriting local

digits so it's no longer

be using the local digits that use on

exit is now going to be using the local

digits that use

uses the fare so i would expect that

because the first solves the problem and

can

be wrapped now neither pi should bring

just

one significant digit that is you know

that comes from here this one logical

then

um significant digits right so let's try

that

let's run this line and see if that's

oops i think it looks like i haven't

defined

so let me run everything on top i'm

going to define knitter

i called it before and it didn't work

and now i redefine i overwrite local

digits with the function defer and i

call it again

and here we go now it does work it's

printing the one local digit that i

wanted

right before

i continue if i continue

i would like to make a pause here

because i acknowledge that it's 20 past

and this is the time where we stop and

ask questions

you have seen everything that is the

most important part so even if we stop

here it could be

it could be useful so let's see let's

check with you

to see if there are questions or

comments here

can i just quickly um verify that

when you use the parent frames

environment that's not a default setting

that's something that you have to

do explicitly great let's see

i think that let's see with our

defer let's see

i'm not sure if this is your question so

the fair

defaults to the parent frame

but that's i mean you can change that um

is that the question

yeah i guess that's the question because

then that seems a bit

dangerous because then that's like

you know quite different than what you

would expect if you're used to using

on exit so you have to be quite aware of

that

i guess uh i think parent frame

is also the default of on exit right i

mean it's not given as an argument but

the pattern frame is where you're

calling that function

so not the the environment of that

function but it's parents or what

basically what you're calling

it um right okay so when you pass an

environment which

is passed in from the parent frame of

the calling function then it's like

the parent of that i think so let's look

how here

i know i'm i'm passing the to my local

digits i'm passing

basically the default of the fare um

i think that even if if we remove it

yeah but at this point this parent that

frame is like evaluating

technically in the in the function that

it's calling local digits so it is

yes exactly yeah and that's why it's

that's why the fair

okay okay then you're right it's not the

default of on exit because if

it was these local digits with on exit

should have worked

uh so i think uh by passing time frame

this is i think it is the same it's just

because like the parent frame that

you're passing into the local digits

yeah is like the parent of the local

digits function

oh when you've got it into defer which

is now not the parent of the

defer function but it's the parent of

the function that contains the deferred

function so it is the height

exactly basically by default the same

you do have to pass in that environment

so that

makes sense a lot more sense yeah yeah

thanks yeah because it's a it's a

relative thing right right that's right

so pattern frame will always kind of

be whatever it's dependent yeah that's

cool okay thanks uh cj that was a very

cool question um

anything anything else to ask or comment

on

um i have a question that's not strictly

related to

to this but something that you that's

something that you did in this that's

always

sort of confused me a little bit and we

talked about it one time and i still

don't really get it

yeah um but just when you're calling the

original options i'm just i always get

confused because it seems like

if you're setting options if you say

like op

is options with this new option

and then you're recovering it again by

calling options on the op object

should the op object i mean i know it

doesn't work like this because i've seen

what you're talking about work as

as it should but shouldn't that op

object have the new options

in it yeah no actually because um

because

i mean you would expect that from your

experience with r because most functions

um return you know r being

such a functional oriented language

usually

you take an object you modify that

object and what you return is a modified

version

of that object kind of or if you return

invisible

usually what you return is you know for

side effect functions usually you return

invisible the first argument so

basically you return the

the the input and modified

so those are the two scenarios that are

most common in r and options is just

weird so that's that's all you need to

know

options i think if you look at the help

file of options it like explicitly says

we do this

precisely for this reason okay

yeah i just i i also wanted to flag that

for anyone else who was confused by that

because i remember

i remember even just reviewing code

sometimes being like why does why does

this work

yeah yeah that's very true i think it

does deserve

like a more gentle explanation uh it's

it's however very common because you

know options

um you know doing this cleanup is very

common so

but still not as common as to um as to

find it like in everyday life

right but if you do see some if you see

some

help files and you find options i think

it's helpful to understand how it works

so thanks to jackson for that

for that comment so basically if you

don't understand options after this

call or on status meetup read help file

because it is just a very weird function

which returns

invisibly the

older options not the newer options

any other comment or question here

okay let's see how far we can get then

i'm gonna move

a little more so now i'm gonna show

and i show the sloppy version the one

that used on

exit sorry the the sloppy version was

the one that you

did not use on exit at all

there was a meter version that used on

exit and then

uh you know we had to change those

parameters so that you know defaults

to to you know to change the defaults to

the values that we usually want

then i show how to do that with the

function the fair

and now i'm going to show you that the

with our package also includes some

wrappers already so we try to write our

own local

remember that we wrote our own local

digits which was a wrapper

around those two lines of code that we

were discussing just now with jackson

where

you know we we set the options to

something new we stored all their

options in an object called op

and then on exit we restore the op

options or the older options so we

wrapped that in a

in a function that was called local

digits but

you may want to do that pattern in many

other

scenarios so there are some scenarios

that

are very common in programming life

like for example this idea of changing

local options or changing

options and then restoring them is

pretty common

so with our already includes a wrapper

that says that that's just that you know

instead of writing those two lines of

code are

kind of confusing you just call the

function local options

and when the function that calls it

exits

it will restore the all options to what

they were before so that's an

alternative to

the function options in this case so

let's define

neatest and let's call pi

with uh let's let's ask to print pi with

three significant digits

and there we go and now we call pi we

would expect because this is a

you know neat function we could expect

pi to print the original seven digits

that i have set

by default in my r session and there you

go so that that works just as you

expected

and maybe to connect this back to

testing uh this is you know the use case

that i was

trying to explain uh or that aim to

explain

for those who are testing our code so

these functions

the local something functions work not

only

you know functions but also work in

tests so let's say that we

you know let's pretend that we are in a

test file so i'm going to

attach the test.package because i need

it if there was a test you know i need

it here

so the starting state of my

of my code is that where for example if

i print

um exponential one so that

the what you call the lower

the logarithm of base two i think of uh

you what you get is this number with

seven significant digits because

those seven significant digits are set

by default in my r

session so that means that say that i

want to mess up a little bit with my

local digits

with a number of digits and i want to

call it

you know i want to test that local

digits works um

when i ask for three uh

for one significant digit and it works

when you know i

call it with three significant digits so

basically i'm testing that local

digits function and that's fine but what

i want to happen

is first to check that it works so you

know if you read more carefully maybe

after this video the expectations here

you will see that okay so when i set it

to local digits 1

i do get

just you know the you know basically the

num the the seven significant digits are

rounded to the number three

and when i call three significant digits

they are rounded to the number two point

seven

two okay but the one thing that i want

you to take away is that if you do use

these local

functions then the state of this

environment

after the test should be the same that

it was in the beginning remember

in the beginning of this test before the

test i had seven significant digits

i messed up with my local with my number

of digits and now i print

again uh my x one

and what i get is again seven

significant digits conclusion you know

these functions

allow you to leave the world exact

exactly as you found it before each test

and with that i ran out of time maybe

the last

second for um a common question and

otherwise we say goodbye

okay thank you very much then i'll take

that as a as there is nothing

to add now i know that it might have

been confusing you know very keen

if you are very keen on on pushing this

to the next level and using these ideas

in packages

feel free to do a help desk with me and

i'm

i'm very happy to help there

thank you
