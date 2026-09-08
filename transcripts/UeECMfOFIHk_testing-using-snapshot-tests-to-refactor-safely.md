---
type: Video Transcript
title: "Testing: Using snapshot tests to refactor safely"
description: "There's anything that we are missing of the one that we had last time we are continue talking about snapshot testing last time we saw the workflow very..."
resource: "https://www.youtube.com/watch?v=UeECMfOFIHk"
tags: ["ds-incubator", "snapshot-testing", "refactoring", "r-packages", "testing"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=UeECMfOFIHk"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2021-05-04T00:00:00Z"
    usage_count: 24
usage_window: { from: "2021-05-04T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

the dsinquater continues

on the series about testing our code and

we're actually getting close

to the end i think we'll have probably

one or two

more meetups and i ask you on slack

you know what's your sentiment and and

you know if we can wrap up here if

there's anything that we are missing

uh but today the the the meetup is an

extension

of the one that we had last time we are

going to

continue talking about snapshot testing

last time we saw the workflow very

briefly

and we spent most of the time also

discussing some ideas about how to go

about testing plots

and today i wanted to spend more time in

practice

like showing you a little bit of live

code

and how snapshot tests can help us

very quickly capture

or increase the coverage of a piece of

code that we want to refactor so that

that's

one use case that alex mentioned last

time

and i got kind of excited about that

idea because i noticed that it is a very

common use case

so i want to use that use case as

as a way to revisit snapshot testing and

to

show you that it is actually pretty

useful

there is a bunch of issues as well that

samsung tests

have like they can be very brittle if

you don't do

specific things like skipping tests in

you know different platforms or skipping

tests on cran so there are some

resources that you can use some tools

that you can use to skip those tests in

environments that you are not interested

in

in being so specific so let's get into

it so the motivation is

to create

basically the motivation is the

following so i'm here in

working in a package that already has a

feature that is untested

so the feature is called scatter plot

penguins

there is a beautiful data set called

penguins in the

package palmer penguins and

we're going to be using that as

um as an excuse to show you how to use

natural tests to

first start covering the the feature

with tests

and then start refactoring it so just to

give you a visual idea of what we are

talking about the feature that

um i you know we have here is called

scatter plot

penguins and it produces a scatter plot

like the one shown here on the screen

where we see for three different species

of penguins

the relationship between the depth of

the bill and the

length of the bill it is very similar to

the iris

data set and it is actually designed uh

precisely to try and replace the iris

dataset

so this feature is not covered by

any tests i'm going to show you that by

running

i'm pressing shift ctrl r remember that

you can link

specific add-ins to your

shortcuts um so let's see

if this is working so addings here

or you can press shift ctrl p as well

and you can run

you can start typing something like

report

test coverage for a file or a package so

let's do it for entire package

so this is the same package that i've

been working with throughout the series

so here we have a report for the

features that are tested

but notice that scatter plot penguins if

i click here

it all appears in red because no line of

this feature is covered by tests

so that means that for example if i you

know say that i

remove this code here and if i rerun

my test with shift ctrl t you know i'm

you know discussing also the the

keyboard shortcuts because

by now um you may be already using some

tests and the workflow is

um is like a key part of our work

so notice that all tests pass even when

i change dramatically the feature so

that's kind of

an indication that this feature is

unsafe to refactor we first need to i'm

going to do

and do what i just did we first need to

add some tests to this feature before we

can actually

um you know safely refactor it

so there's a bunch of things that i

would like to refactor in this function

for example

the style is one thing the line is is

beyond the mark of 80 characters that

you see here vertically

and so i would like you know those those

lines to be styled differently

also this part here is dealing with labs

with labels and there is no way for the

user to change those

labels uh so the the interface is quite

rigid

so i would like to kind of allow the

user to do kind of the same thing but in

a slightly different way

in a more flexible way and before i can

do that

i need to add some tests so there's a

bunch of tests you could think about you

could you know test if this

um if this feature uploads a due plot

you could

you could check you know a bunch of

things but

a very quick way if all you need to do

is to capture the current state

of a feature very quickly so you can

you're not interested in changing the

behavior you're just interested in in

making sure the behavior remains the

same

and and the changes that you make as you

refactor your code

does not change the output does not

change the behavior that the user

experiences

and if it does change you want to be

notified so that you

confirm that if it was an intentional

change or not

so one quick way to do that is to use

snapshot tests so

um i'm gonna create a file

for tests uh remember this is the

function use

test in the use this package that

function

if you have a file open you will be

aware of it

and it will use the same name uh to

create a test file and it already adds a

little bit of

a toy expectation here so um the title

of this test is gonna be

uh something like you know it starts you

know in your head you first read the

name of the file so scatter plot

penguins

and then you start adding the the string

here in the title of the test

um hasn't

changed so that is what i want to test

now that you know whatever i do

the feature remains the same so what i

want to do

is i'm going to remove the toy example

and actually i'm going to reuse the

examples here

in the package so the package already

includes some

examples so i'm going to reuse them

let's comment out that thing and study

it a little better

so here we first create a data and then

we just produce

the scatter plot and we save it in an

object called p

when you print p because it's a g plot

and there is a print method designed for

that

type of object for ggplot objects that

will print to the screen here to the

viewer

but you can also do other things with it

like you can ask for example the

structure of p

right and what you will get is this

object

right so you can see the list that

underlies the g block object or you can

also see it in the viewer

right and this is what it is so this is

you know this information about the data

about the layers the scales

you know labels a bunch of things this

one

argument this one element of the list

plot m

is going to change every time you run

the plot and therefore it would make any

snapshot test very brittle very easy to

break

notice how for example this ends in you

know two

three five eight so let's free plot that

to see if that changed actually i didn't

try this but

let's see i'm just taking the risk

plot m yeah there you go so now you can

see how plot m

the number here the environment has

changed because every time that you run

it

it runs in a fresh environment in a

random

environment or created at random or the

name isn't random

so that means that that's not something

that i want in my snapshot test

so i'm going to remove that parameter

easy to do

you just you know apply new to

p dollar sign and the element that you

want to remove

in this case it was plot f so i'm going

to assign nu

so my snapshot so so that you know i

kind of i'm mulling out i'm removing the

element

and plot m from that object

so now if i if i do again view p

i should not see a plot m here you see

so now this this object is uh more

stable and it shouldn't change at least

not in my environment from run to run

which means that it's a good thing i

could create a snapshot for

so basically the output that i can see

here on the screen i would like to just

create a snapshot on a file

right and that's exactly what snapshot

tests do expect

snapshot allows me to in this case pass

the structure of p

not just p extractor of p and save that

in a file how do i save it well simply

by running the test shift ctrl t

allows me to do that so i'm going to run

all the tests with shift ctrl t

and as you can see here down i get a

warning telling me

that i'm you know i'm creating a new

snapshot

and it prints the output of that

snapshot for the first time

that you run it here is a warning uh

it shows me you know the code that i run

and it shows me output

but if i run the test again that warning

won't be produced because the snapshot

is already created

so now my tests pass cleanly

and that's all i need right so if i now

run run i'm going to press shift ctrl p

because i want to produce coverage

to produce another test coverage in this

case i'm going to do it for the file for

the active file

let's see if that works

here there you go so as you can see i

just produced the

the test report for

this file specifically and how you see

how with just one test

i covered completely the feature i see

all in green before it was in red now

it's all in green

so every line of of the

feature is covered by tests uh is it's

done in a very coarse way but it also

means that if i

removed you know the same code that i

removed before say that i remove this

right and if i run my tests again

now my snapshot test should fail should

tell me something

that okay something has changed and

there you go you see there is a failure

here

let me expand this a little bit uh and

what's showing

is that uh because the the element

labels

of the ggplot2 object that i saved as a

snapshot

that changed completely because i you

know i i completely removed the labels

there

so as you can see that it's pretty

difficult

a little bit difficult to interpret but

you understand there's something all the

labels

right that that is wrong so that's all i

need you know i don't need

at this stage just to refactor something

um

and preserve the behavior maybe i don't

need to spend too much time adding tests

just with one snapshot test should be

enough

so now i it's pretty safe because i i

know

that um i could be warned if something

you know very course

changes so it should be safe to do

something like maybe to style

this file style active file for example

so i can do that uh um i don't think it

changed it at all but i'm gonna press

shift ctrl a

here that's a different style as well

and i kind of like it more because it's

not overflowing 80 characters mark

so let's run my test again because i

have just changed the code

it shouldn't change the behavior and

effectively it hasn't

i confirmed that by finding my test and

i see that all my tests pass

which is good and there's a few other

things that i could i could do here as

well

uh so for now i'm gonna

i'm gonna say well this is uh enough

for for styling but i would also like to

for example extract the labels

let's say that okay i would like the

user to be able to inject

uh their own labels to change the title

for example if they want

and right now there is no way for users

to do that so if they just plop

that plot they can't interact with it so

i would like to you know

give them an interface to inject the

you know title x y and whatever else

they want so one good way i think would

be to just

create another function

that is let's call it penguins

penguins labs

and here what i'm gonna do is i will

just

uh output the labs so i will give the

user the opportunity

to uh to call this function

just you know to scott to first create a

scatter plot

and then use penguin labs separately so

the results should be the same in the

end but

you know they have to do penguins

wins as a separate feature and here is

where i want

to uh i know i want them to be able to

pass

something here so for example the title

could be no and then i could handle

title with

for example arlang

i can say title well actually it could i

could say title

is whatever the user passes

as title or if there is nothing then

they can

there it will be this title that i

choose

uh for x and y the same so let's do that

x let's do nu y

let's do new and this is the same here

so

it's going to be x if there is

user input or is going to be what i

choose b

length in millimeters and y the same

thing

so that's my feature but i want to make

it even more flexible so i'm going to

allow the user to pass dot dot dot

so that if there is more arguments in

the labs

function they should be able to pass you

know to pass them there

so that's my my implementation of uh you

know how i want

this feature to look like i think this

should be fine in one line because it

fits

there you go so this is what it looks

like but notice that i changed the

function dramatically so now i expect

the tests to fail so i expect the the

snapshot to change

but it was an intentional change so

let's see what happens

so i'm going to run my tests i should

see a failure i

do see it there right and uh

now what changed is that label part that

i i expected it to change

so what i can do is to run snapshot

accept

right i basically copy paste this code

to the console

here right and just paste that so i

refresh the snapshot if i now rerun my

tests

they should pass because the snapshot is

a new snapshot

right so um i have just updated them

so and now i can just confirm visually

that

the user can do what i wanted them

to do so they they they can create

uh basically with with p right so p

is just this the scatter plot but with

no

um special custom labels and i'm very

close to the end

as you can see it's the the default

labels the boring labels no title that

the

gg plot 2 kind of creates and now i can

add

the all the custom labels that's about

no custom

all the the opinionated labels that i

created for them

just by passing okay so there is no

function

um default here so what i need to do is

i need to use

the package arlang we use package

parlang lang

there you go and i also need to import

the uh import

from arlang i need to import this

function

and i need to document

document so with this i think

let me restart my session and let's see

if it works now

there is no function import from

import from import from

import from around

this document

refresh i'm striving with this

okay it looks like now it worked uh okay

so

now the user should be able to

separate the task of creating a plot

with custom with the plot two labels

uh from uh you know the act of

adding nicer labels now you know if they

run penguins labs they change that and

if they want to change the title

they could say title

custom title i see a question or maybe

someone trying to kick me out i think as

you can see that did change

the output thank you very much so yes

let's wrap it up here

so basically what i have done is first

i added a snapshot test as a very quick

way

to to have some coverage in a feature

that i want to refactor

second step i actually started

refactoring the function and i started

with things that wouldn't

change the snapshot for example the

style of the code

and then my third step was actually to

be more aggressive and actually i did

changes that did

change the underlying snapshot and

therefore the

the tests started to fail but there were

intentional changes so i used the

functions

accept snap or stop shot accept with the

name of the feature

and that updated the snapshot so with

that um

and what i did you know in my

refactoring what i did uh

my aggressive refactoring what i did is

i gave the user

a lot more flexibility about how they

could create

uh their plots by doing it in two steps

as opposed to one by first

creating a basic plot with all the

defaults that ggplot2 provides

and then by giving them another um

feature

that by default it could give some

opinionated labels

but if they want they can choose to

change that to create their own

so that's the end of my presentation now

so um

i would be interested in hearing what

questions or comments

you have

yes monica

yeah i can just comment that we are

using

a snapshot of a plot

in one of our tests in the bloating

package

and actually

it's not working that great because

uh if i produce a snapshot on my

uh in my environment which is mac um

it's different from what

maura produces um

even though it's just like a gg plot

object but apparently there are some

differences so it's like uh

i mean it's like an easy

task to create but it's also

quite sensitive to the environment

in which you're testing

thanks monica this was planned uh

yes so the the big challenge i think of

testing is that it's full of trade-offs

uh it's uh you know when we learn

something for the first time

we love to just be given a set of rules

that we can apply

compliantly and they always work and

testing is is very much

not like that you know you can all you

do is you collect a bunch of patterns in

your brain

and then you try apply them in different

circumstances and all the time you're

doing trade-offs

so the trade-off here is the following

you know snapshot test

immediately allowed me to start

refactoring

gave me a safety network that worked

very well in my local environment

but then as monica said you know we

discovered today

that the snapshot test that were running

just fine in my ubuntu system

were failing on her mac system

and also on windows that we saw on the

continuous integration

so what we did is well we acknowledged

that this snapshot test is not

um the only test that we are going to

have we're going to have more specific

tests

and this is just a quick way to make

sure that if something changes we know

what that is

so we for now at least we agreed to skip

this test on continuous integration

uh in general or we could just skip it

on mac and windows

and just rely on my own system and mauro

system and ubuntu system

to give me to be like the canary on the

mine and give me

you know red flags if something changes

um again the trade-off is

speed for you know very quickly being

able to refactor something that

still has a way to go a long way to go

and

against maintainability and how we game

and

i mean why is poor maintainability

because if every time

you get false positives that is very

costly in terms of maintenance because

you have to kind of stop what you're

doing and check

what's going wrong so you wasted of time

that is poor maintainability

so the way we then regain

maintainability is by limiting

the environment in which this snapshot

test runs just to my ubuntu

or to any ubuntu system again trace

trade-offs you know that you will have

to do and in some cases they may be just

fine and in other cases

uh you know the approach that we're

doing right now might be the wrong way

to go

any other um

from here or any other comment that we

have

no i don't have any other comments

although the function that's in my

version of test that

is skip on os not

keep on is keep on os

okay thanks skip on os

thank you oh yes let's see if that

actually

works also snapshot tests i understand

from the documentation

that by default they do not run on cran

uh and that's precisely because it's

acknowledged that

you know snapshot tests are kind of

brittle they break quickly

and it's kind of a developer facing

a tool to yeah just to

you know to know um what you might be

uh breaking if something changes but it

shouldn't change

you know it shouldn't make cran servers

fail uh because you know it happens way

too often

and crime gives you like a week or two

to fix a problem if it starts failing on

their servers

so that's a lot of pressure to put on

yourself so it's better to just keep

them on grant and that's the behavior by

default

one thing i didn't not cover is uh how

to use snapshot tests

well we mentioned it last time and i

think i showed an example but that's a

very good use case as well

that we just didn't have time snapshot

test

can capture i mean by default capture at

least the function that i show

expect snapshot captures everything

including

output and also conditions conditions

are messages

uh warnings and if you say error equals

true it will they will also capture

error messages which is a great uh

tool to see on uh

or to store on a file the exact error

messages

warning messages or just messages that

the users get on their console

and format it exactly as they will print

to the console

so traditionally you could kind of test

an error message

just by trying to match the string but

that doesn't give you information about

you know what's

you know what's the output that the the

users

look at on the screen and with snapshot

tests you do because basically the

length of the

of the console as it is when the the

snapshot test is created i guess

is also used to produce the error to

produce the message or to produce the

warning

and to wrap it based on that length of

that console

so it's a great way to make sure that

the the

messages or the conditions in general

that you print to the screen to your

user are readable

so they are quite useful and slowly i

think they are kind of at least in the

titles i understand they're kind of

replacing

the what you know used to be

specific tests for specific messages

because you have to type you know to

hand you know to type

the error message or the condition in

general

and try to match it but now you just

you just create a snapshot read at the

snapshot you can see

it's an md file a magnum file easy to

see

on github when someone submits a pull

request easy to see

that the snapshot actually looks like

something readable

we have one more minute uh any other

comment question

critique concern

no all right then thank you very much

for joining today

uh i think we have one or more meetups

i'll reach out on slack to see

um yeah to see exactly what we'll do

thanks a lot
