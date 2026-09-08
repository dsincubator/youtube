---
type: Video Transcript
title: "Testing: Code coverage"
description: "Need to ensure that the code that we are about to touch is already covered by tests so code coverage is this idea that you can the code..."
resource: "https://www.youtube.com/watch?v=bKRFCOkmpiw"
tags: ["ds-incubator", "refactoring", "r-packages", "code-coverage", "testing"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=bKRFCOkmpiw"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2021-04-20T00:00:00Z"
    usage_count: 32
usage_window: { from: "2021-04-20T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

the ds incubator continues on the series

about

testing our code and today we are going

to be talking about a different workflow

from the one that we saw last time

last time it was a test driven

development workflow today

we're going to be working with code

coverage as a way to guide our

work in particular this demo will be

about working

with code that has already been written

and we want to refactor it preserving

its current behavior and before we can

safely do that

we need to ensure that the code that we

are about to touch

is already covered by tests so

code coverage is this idea that you can

analyze

the code to see which lines are covered

and which lines are not

so the package that supports that is the

cover

package and you could call

cover report

cover call

package coverage so you could do that um

and i'm going to show you in a moment

how to do that in

in an easier way but with that you you

get this report where you see which

lines of code are

tested in this case it's 100 core so um

that's not what i was expecting so let's

do

uh let's open they are the test file so

use test there you go

so this is the

test file associated to this um to the

to this function called

um load file which is the one that we're

going to be working with

the first thing i'm going to do is i'm

going to degrade the tests to show you

how i can um

let's say that i wanna let's say that

this

um package only has one test

let's run them there they are and now

let's run the report

again um this time instead of doing

this call i'm gonna use

the command prompt shift ctrl p and

start typing

um report test

and there you go report test code for a

package or four file

let's do it for the package

um so that's a the common prompt the

command prompt is pretty

convenient i encourage you to use it you

have to have

a quite recent version of our studio

though

so now we re-executed the

report and now you can see that the

cover the coverage dropped to 50

so we have degraded the test because

the test covered coverage because i

wanted to show

you know what you know that where the

world looks like when some lines are

covered and sometimes aren't

uh actually to make it even more

exciting um i'm gonna switch these

things a little bit

so that you can see uh like more clearly

um where things are so let's let's do

this report again

this time uh you know you saw it running

very quickly and what i did is i

used the keyboard shortcut that i

associated to basically into the

function to this something just similar

to this

function not that one um so

how you do that well one once you can

again use the the commands

palette okay that's the name of this

thing and you can start typing

shortcuts for example and there you will

have the modifying keyword shortcuts

so there is where you can associate um

report you can associate um a particular

action to a particular keyword shortcut

you just stand here on this

shortcut column uh or cell intersecting

the shortcut and the

one adding that you want to actuate to a

shortcut and then just press the keys

you know pretend that you're actually

running the shortcut and those keys are

going to be typed there automatically

for you

so i did that already but i encourage

you to do it because it is a pretty

convenient tool

and if you're integrating your workflow

you're going to be doing it repeatedly

so having a keyboard shortcut it's quite

confusing however the command palette is

also quite

you know report um report

file you know that that's also quite

convenient too

so in this case i'm not running the the

coverage tool for the entire package to

adjust for the active file

in this case it shows the same thing

because this

package uh package has just that one

function

so what i want to show is that okay the

lines in red are not override tests

meaning that i could if i refactor those

lines

in a silly way for example you know the

line

that reads a csv file so if i broke that

thing

with say stop

oh no you know that that function won't

work with csv files of course

and yet my tests pass why because there

is no test actually touching that line

right

here so um instead if

um let's do the same thing

here so if i break the tsv feature

right so oh no

oh no and if i run my tests now my tests

do complain because that one line

here and a line this one is covered by

test right so

that all means that you know before i

start touching any line to do

refactoring

and it's really important no if it's

covered or not by test and this

test coverage tool is extremely useful

so let's go back to

that so the one thing i would do then if

i need to refactor this function

is to just you know start covering the

lines that are missing here so let's

let's work with this one line

first line five so i need a test to uh

test this tsv functionality easy i have

one that does

sorry the csv functionality easy i have

one that does

that for the tsv so let's just copy

paste that

and do it with the csv for which we need

to change a few things

here here and here it's gonna be a coma

um and that's it i think so let's run

the tests there's done the report again

i expect the report to increase the

coverage so that one line needs to be

core now

it is right so if i now do something

silly i could confirm right the csv by

doing

a stop oh

no if i run test i should get an error

right yes there it is

good so it's safe now right so if i if i

refactor this bit

we should be good to go how i could

refactor it well there's many ways

um let's say that i want to replace that

if thing there

eventually with um a switch

statement um so i could do if uh

switch if extension is

csv then what i want

to happen is this thing

of course it is redundant to do you know

this if

and this um

this switch statement here um but

let's see what happens if i uh

switch and let's

do that okay so let's see if this is

doing what i think it is

so i refactor that little first bit i

have been very aggressive there

and no the reason is that you know this

switch thing doesn't

do anything and then this keeps going

all the way to the

to the bottom so it's not working i

needed that if

statement still and before i can

continue

my refactoring and see if this does work

yes

okay so as you can see i can be very

aggressive in manufacturing once the

tests

are core are covering the the chunk

that i need to work with so now i want

to inject this bit

into the switch statement and i can do

it quite safely because that line that i

want to touch

was this one here it was you know it

used to be nine now it's now like 14 but

nevertheless

is the same thing right so what i need

to do now is to move

these bits here right

i was gonna move it in here

if this is a tsv

right and now the condition here is not

just if this is identical to tsv

but you know i want to focus on this

section if this is a tsv or

if it's identical to a tsv as well

so i can remove now this chunk

right and let's keep going test pass

so that was um good so this this

bit here the stop statement notice that

it's not covered by test so if i do

something cd there if i say hi

that's you know that's very silly you

know what function won't draw an error

when when the extension is not what i

want and the tests are not warning me

about that so i can let's let me

undo that so the first thing i need to

do is to cover that little bit with a

test

easy to do is pretty straightforward we

add a test that says

error says gracefully and what we do is

we just expect

an error right so we do expect error

and when we call load file with

something silly

blah what we expect is that

an error basically so the expectation

goes here invalid

file i expect that message that we saw

here invalid file

right so if i now write my tests

it's all good if i now run my report

shift ctrl r

i'm pressing here you see that my my

function is over 100

and that line is now covered so that's

that's safe because i could if i do not

something cd

now like for example say hi

now my tests should fail right knowing

that no

and then i will know that something

silly

um so let's confirm that it's all good

so now i'm you know

it's safe to refactor this line um

i'm gonna move it in here i need for a

comma here

this function uh will fail

because this condition uh

enters basically only when the extension

is known so if i can say

true so so that i always enter this

condition now my function works but then

that's not what i want so now that i

have the switch statement written

correctly i can remove this thing

and uh just restructure this right so

this is my

final refactoring so now um

notice how my speed you know of

refactoring and my aggressiveness of

refactoring has increased

um accordingly with the test score so

when

this report it tells me that the lines

are covered then it can be very

aggressive just

knowing that the safety net that the

tests have

will protect me from doing something

stupid

all right that was all i wanted to show

you today
