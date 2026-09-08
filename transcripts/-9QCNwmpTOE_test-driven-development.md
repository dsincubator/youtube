---
type: Video Transcript
title: "Test driven development"
description: "Will cover the idea of test driven which is one way of developing software and one and proposes one specific time when to write tests and that is..."
resource: "https://www.youtube.com/watch?v=-9QCNwmpTOE"
tags: ["ds-incubator", "r-packages", "refactoring", "tdd", "testing"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=-9QCNwmpTOE"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2020-12-29T00:00:00Z"
    usage_count: 17
usage_window: { from: "2020-12-29T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

okay so today the data science equator

will cover the idea of test driven

development

which is one way of developing software

and one and proposes one specific time

when to write tests and that is before

you write code

and this approach is not always suitable

i like how it is expressed in the

chapter philosophy

of master and shiny in the sorry in the

chapter testing

for mastering sharni because it shows

that there is like

summarizes the idea in in in this that

there is three times when

you might want to write tests one and

let's start from the

bottom to the top is when you have

discovered a bug and you know you

write a test to expose the back first

then you fix it and then

you leave that test there as a canary in

the mind in case that you know there is

a regression and the code

starts to behave again badly and then

the test will immediately tell you

well there is the problem here so it

kind of stops you from

fixing bugs twice basically then

maybe the time when more of us might be

used to writing tests is this idea of

writing tests after you have written the

code because

it's very common that sometimes we don't

really start with a very very specific

idea about what the code should do

so we kind of experiment and try things

out and clarify our thinking

in the same way that we craft the

paragraph in prose and as we write with

we think

better ideas that we publish it but when

you do

know what the behavior of the function

or the code that you're writing

should be let me see because i think i

have someone else

trying to join yeah that's uh hi taylor

when you do know what's the behavior of

the code

that you expect then you you can use

this idea of

writing the code for the test before

writing the code for production

and what i want to show is an example

very simple

using r and using a couple of packages

that we are already uh using many of us

already used

are many of us use our packages and many

of us

use test that so with all of that i

wanted to show you know how to actually

do it

and then hopefully spark some

conversation

so let's uh start from scratch because

this is also an opportunity to

revisit uh some of the um

ideas that we have been discussing in um

the data science equator and outside for

example the idea of refactoring is very

tightly connected to test driven

development

because basically there is three things

that test rune development proposes

one is you write the test second you

write the code that makes that test

pass the first test will fail because

you haven't written the code yet

and then third you refactor your code so

that you end up with no

technical div and then you move on so

let's let's see how that works

so first i'm going to use the package

use these to create a package

uh create a package and i'm gonna

stick that package here and get let's

call it

tdd uh so now test that is creating a

package for me and opening a new

rstudio session with it so basically

that has

uh the infrastructure that i need except

for um the

[Music]

uh you know except for the test

infrastructure so create package will

add

no test that folder but actually i

wonder if i

if i create let's let's say that i want

to create a function that greets

someone by name and if you

give no name to the function then it

will say

just hello world but let me see if i do

so use this includes a function called

use r

so there is where you would you know

tell the name of the file that will host

the function that you're about to write

so let's call this function grid and

therefore the file associated to it will

be called grid

but i'm a little bit experimental here

by doing this i'm expecting uh

use this to be clever enough to add the

testing infrastructure to this package

which is right now kind of bare bones

and actually

let's see so for now it looks like it

has only created the

uh our directory here let's see

if i refresh yeah so for now i

only added uh the file grid dot

r inside the folder r that is the job of

use this

but this file is empty as you see and if

you're standing on an r

file then test that knows how to create

or use this knows how to create

the equivalent file where you should put

your tests

and that's where we're going to be

working so you do use

test and immediately uh

this new file will be created called

test

minus grid dot r and is created inside

the folder tests

test that so that's all magic that

happens

for us so as you can see it it has

created the testing infrastructure that

we need

so it starts with a toy um

example like a template for what a test

looks like

and this is it basically you know many

of us already have written some tests so

we start with a title

and then you know some kind of code that

ends with an expectation about what a

code should do

but what we have here is just a toy

example and let's say that what we want

is to write a function as we said before

that is called grit

and the name of the function i won't

repeat it in the title because it's

already

that information already exists in the

name of the file here in test minus grid

so what i'm going to do is just say what

i expect this

test to to do so let's say that what i'm

gonna i'm thinking that okay

greet with no input

uh returns

hello world for example oops

so this is the basic uh the first test

that you know i

imagine is okay i imagine a function

that is called

grit that function doesn't yet exist so

if i run

this function on the console you see

that i get an error that says

i could not find the function grid and

that is part of the failing

test and i expect you know i imagine

this function that when it works

when if i call it with no argument with

nothing here in between parentheses

the output of this will be hello world

so this is the first step in um

test during development you just start

with with a failing test

so how uh do you run this okay you have

several time ways

to run tests you can just run the

expectation itself and you should get

the same error that you get if you

experiment on the console

you can run the whole thing from top to

bottom like from one to

three and then you will get a little

closer to what you would experience if

you run the tests

using test that sort sorry using test

that as part of our studio

and then the third way is clicking here

on more and clicking on test package or

as you saw in the proposed shortcut

doing ctrl shift t which is what i do

like almost by reflex

and there's also a way to run just one

test file so instead of running

all the tests you can run just this one

file

okay so we started uh with a failing

test so

the this is the first step in test

driven development

now the second step is to start writing

the code

but before we do that i want to kind of

reflect on why it is important to start

to start by writing the test and the

reason is because you could write

a test that is wrong so the very first

thing that we would like to do is to

verify

that the test fails if the code does not

what

we think it should do so some if the

code is

if the test is wrong maybe the test will

will pass even if if the code is wrong

right so the one really nice thing of

test driven development is that you are

sure

that the test with no

equivalent code actually does fail as

you would expect

so now i can jump to uh this other file

grid.r

which you know you can just click on

there or you can run the function

oops you can run the function use r if

you are very fancy

and that will automatically open that so

what do we need okay we need a function

called grid

right it's going to be a function that

you know the first the second thing that

you do is you write the minimum amount

of code and that is key

you you know that you are done when the

test

passes so you don't go crazy writing

like you know code for half an hour you

just do the tiny minimum work that you

need

to get that test specifically to pass

and then you

you you know extend your test to test

some other behavior and then you move on

and on and on

so just to get this particular test to

pass

all i need is this function to return

hello world

so with this if i press now shift ctrl t

i should see let's see what happens if i

didn't commit any mistake i see

here the test now pass so

that's the very first cycle of

test-driven

development and i you know if if this

goal was a little bit more complex

maybe i would now take the time to

refactor

it so that i don't end up with any

technical debt

it is also a good time to commit

um oops sorry

uh get in it it does it doesn't even

it's not a

okay i'm going to

say okay either the new function grid

um with very basic behavior right

and now we move on so a second test and

now

something maybe a bit uh closer to you

know the the

ultimate functionality that i imagine is

a case where great

given a name greets that person so let's

say that i'm gonna duplicate this code

and uh with a

name greets

by name or let's say more explicit

outputs

something like hello here

when i say name is just a placeholder

you don't think you know

what i mean so this is the new test that

i would like to write

how do i do that okay so in this case

say that you know i'm mauro so i would

expect to get

hello mario if i say grits parenthesis

of course this this test will fail

because

uh that functionality still does not

exist i should get something like there

is no argument

uh you know where to which to pass the

string malware

and let's see if i get that and there

you go so there is an

unused argument to which i have tried to

pass malware

so and i'm kind of close to to a good

stopping point once i make this

test pass and then refactor it a little

bit to show you

a complete second cycle of tdd so let's

go now to grid.r and let's make that

test pass so now let's say that the

first thing i need is an

argument let's call it name and

you know this could take as default

could take world

right which is what you know we expected

to

the function to output if i give no name

to

this grid function and then here i could

just pass this to paste

and say okay if i give you

no if i give you a name paste

name and if i give you no name the

default of name will be word so it will

be output

the output will be paste name

so i now run my test shift ctrl t

and i see all tests passed so

effectively have

kind of completed the second loop so now

it's another good time to

[Music]

uh oops to say let me make this a little

bigger

uh let's check the status

let's add everything and say uh new

grid gains argument

name

okay so with that now i'm also

able i have enough kind of backup

enough safety net to start being a bit

more aggressive in my refactoring for

example

if i wanted to um

i don't know to to change the style of

this to bring like that

i could do it you know after every

change i could just

click or hit shift ctrl t and

run every test to make sure i haven't

broken anything

or i could do something maybe a bit more

useful like to check for example the

type

of name so i could say something like

stop

if not say his character

name to say something like that so that

good so that would be actually against

sorry against tdd so if i wanted to

check the

input what i could do is go back to the

test

and now write that test first so let's

say that

what i want is with a number

throws an error let's write this

last test and we're done so now

what i expect is if i say grit number

one for example

i get something that is an error so here

what i would say is something that

matches the error that i expect

and let's see what i could get uh

in a moment and instead of using the

expectation expect

equal i can say expect error so i expect

the error

something like is not character

if i pass the number one to the function

grid so let's press shift ctrl t

see what i get i should get a failing

test because i haven't

yet added that behavior there you go did

not

throw the expected error and notice how

it tells me

exactly which line of the test is the

one that did not

show the expected behavior and finally

here i can add the line that i wanted so

now i'm going to first

stop if it's not a character and then

i'm going to do the action that i want

so let's press one more time shift ctrl

t

i still get a failing test suggesting

that maybe the

um the test

message is not exactly the one that i

typed

and so let's see if i can fix that

uh i see it says is correct is not true

okay so

this second argument to expect error is

a regular expression so i could

say something like not thoughts

star and to say something more kind of

too much just a little bit of the

message so enough

um sorry actually that won't match so

character

dot star uh

character not true so now that i know

what the message

should look like i'm gonna match this

this

and this and you know just to be safe

you know

if it has these strings it is very

likely the error

message that i am looking for so that

confirms that the function does throw an

error

and very likely is the one that i want

so

that is it so we have completed the

cycle

um of writing a test

writing the code and refactoring one

refactoring here could be to extract for

example this into

my custom function as top

if not character

for example and here could be a function

that takes an x

and then that's this so for now i've

just done the same thing so i press

shift ctrl t

uh it looks like it fails because the

function has been defined but not

called so if i now do call the function

with name i should expect the error

and it does and now you know i can be

even more aggressive and extract

the code outside shift ctrl t again

and i have effectively oh actually boom

stop if not character you see well

nice that it is telling me object name

no found ah there you go so this

is an x and this is you know the beauty

of you know being

backed up by ted so if i make a mistake

immediately the test will tell me

so that's why test trivia development

allows us

to move really fast because you know we

always have

the almost you know 100 core of tests

and any change that we do we will know

immediately what's what's going on

okay so i'm gonna stop here and

uh and look forward to comments

um i guess i'll start i

think that this

toy example is

like this is very much a toy example

um the like write a test write some code

run the test

cycle tends to be

uh much larger like i personally

could not imagine writing a single test

and then writing the code to pass it

versus

um like if i had that greek function

i already would have a plan of like what

are the major

pillars of functionality that i would

expect so i would put

the probably the

uh hello world and the hello morrow

as my first test the two things together

first

iteration of code to pass both of those

and then without getting too

far into the the

whole other conversation of how to write

good tests

um and make sure your tests are actually

testing

um whenever i write

uh any tests i also write

negative tests so that is

the um in

test that it's the expect not equal

i believe uh command

so i would write a test for

no argument hello world yes argument

uh hello morrow yes argument

expect that you don't get hello world

back

right um writing

tests for behavior that you don't want

is as important as writing tests for

behavior that you do want

that's cool that's cool anyone uh

has comments on that i mean it's crucial

that you know

things that by the book are always like

cool but they need practice you know

it's great to kind of

hear from people that actually do those

things and see how they adapt that

in real life anyone else has anything to

add there or questions

um i can well one briefly respond to

like

writing negative tests i mean i think

this is a great idea on the surface also

but that's obviously like a

infinite problem i mean you gotta

find some place where you stop writing

negative tests otherwise

you that's all you'll be doing oh

that could be problematic i think for

sure

but um like there are very common

i would call them classes of negative

quests that are like

very straightforward to life

when you think through what are the

behaviors

that you want and their behavior that

you should be thinking about

so like what if i am missing

arguments what do i want do not happen

right

um what if i have a string argument

someone passed with me in a character

right like writing those tests

yeah yeah i mean i totally agree it's

it's a good idea to do this also in

cases where it's clear

that's what needs to be happened i just

felt like you needed a bit of

qualification that

needs to be done in cases where it's

really obvious like what that

needs to be not just like randomly

writing like well it shouldn't say hello

somebody else because obviously it's not

going to

so yeah yeah that's not a good criticism

just thought that needed to be qualified

a little bit

and definitely like we're very

straightforward

many different ways

about the testing thing this is not like

a strong

something that i want to like

advocate or debate for just giving some

like experience

expect perspective honestly for one um

and notice that when i do write tests

like this where i write them

very at least very early in the

process and i sometimes feel like

well there's two things that i think

that are possibly negative in this case

i'm interested if anyone else has this

experience

one is that um

sometimes i feel like once i write those

tests then i continue developing i get

really happy about

running a test and seeing them all pass

and i almost

feel like it makes me not it kind of

discourages me a bit from like going

back and writing more tests because i

feel like it's already

covering so much i'm like oh yeah all

400 tests pass

i'm good and then i just keep writing um

so i feel like there's some slight

dis incentive to writing more tests

when you do that i don't know if anyone

else experiences but i've noticed that

in myself a little bit after reviving

myself

especially when i'm making substantial

changes to go back and test them

and then another thing i've noticed is

yeah of course in this toy case you have

such

a ridiculously small

thing that's happening that it's kind of

easy to wrap your head around

what the testing is but often like i'll

write a function

i want it to return a file path or

something but then

a week later or two weeks later i

actually wanted to return string under

certain conditions or something

and then yeah i can go back and write

another test or should write another

test but

um sometimes i make changes that where

the test

literally has to change and i'm

wondering about how people feel

about that experience where like you

it's not about like

just adding a new test that that tests a

new functionality but like

literally what you wanted to do

literally changes it and you have to

change a test

and i feel a bit of disintended there

also because i almost feel like changing

the test is like

the antithesis of the whole thing like

if you're changing an existing test

you're doing something really bad and i

know like

i have to get over that at some point

because it's necessary but i i noticed

like i have a very strong reaction to

like

getting to like where like i have to

change the test

or change existing tests i wonder if

people have experience without what they

have said about them

um i

have experienced that and

the realization that i've come to is

the reason that you're feeling

disincentivized

is because you should feel

disincentivized

um because when you like

very fundamentally change what a

function does

you are altering the contract

between you and your fellow programmers

that there will be an established

well-defined behavior for this

function so

it's not to say that it shouldn't happen

but that disincentive

is actually a good thing because that is

what allows

other people on your team to make use of

the code you have written

without fear of it changing out

underneath them

okay i'd like to also add my opinion

there um

i you know i think you know the more um

kind of as alex suggests you know the

more

a piece of code is uh used and

people is familiar with um

kind of the code has has proven it's

it's worth

and i think that naturally the least

that it's going to change

and maybe if you need to change it in a

way maybe you want to

leave that as a you know user exposed

function and then maybe

change its internals or something but i

also think that in the uh

at some in early stages of development

a lot of the times you know uh you're

just

figuring out what's the best way so

before you call something like released

and you announce it very broadly that's

why you know you have opportunities to

to play with a call yourself and to

share it with someone and to you know

ask for a review

and at that stage you know i i feel like

very comfortable changing tests because

i think it's just you know part of the

evolution

basically how i see them is just exactly

as alex said it's like ask the written

contract

between you know the code and uh

and and the people that use that code um

but then as

as the contract evolves because

sometimes the requirements change

and sometimes not even they change but

also they enter in conflict you know

sometimes today you know you need

something to be you know some you know

let's say you know the project owner

says oh this should be a data frame but

then you think oh no actually you know

this should be a file saved in a

computer and you know the requirement

requirement has

changed so if it's the same function

then you know of course the test will

have to change

and maybe what alex is suggesting i

suppose is okay maybe it shouldn't be

the same function maybe it should be a

different one with different name but

all in all and to summarize i

particularly feel

more or less happy about changing tests

depending on

the stage of development and in general

i think that is a good idea to just keep

keep you know the two things evolving in

parallel you know and particularly to

prune tests that are

also false positives too often

yeah yeah and like i really don't want

to to stymie uh creativity or

finding a solution that works right

um i just

i am very much of the mindset that

if the finding the solution that works

involves changing something that other

people might be relying on

um that that should

involve enough of a burden that it makes

you second guess

whether this is the correct solution

yeah and then

and that's fine um but that's part of

the value

of having an entire team do

test driven development because

it's entirely possible that

i will write some code set it aside for

three months and forget about it

um and in the when i come back and i

want to make these changes

change the return type right um

if what i want to do

um in those intervening three months

morrow used some of my code somewhere in

something he was working on um that will

show up in the tests

and it will be i'll look at it and be

like

cool what test is failing why is this

test failing oh i didn't write that

morrow is using my function without me

knowing which is totally fine

um but now i know that that is a thing

that i can't break

and i need to find some other solution

to work around that uh

i would like to address also the comment

maybe an

end uh close to now because we are a bit

beyond

um but to also address the comment that

cj made about

you know how much testing is necessary

and we had a conversation with him

here so i wanted to just kind of bring

that conversation to to everyone

and this is idea of you know regardless

of the number of tests

you know you're kind of more or less

confident when when you cover when you

know that all code is covered by tests

it doesn't mean that it's correct

you can't have wrong code that is fully

tested

but it's a great starting point so i was

kind of

here i wanted to show you know this this

feature of the cover package

that uh you know you can't find it as an

add-in it's called

report test coverage for a package and

it will run this report

that shows you in green lines that are

covered by tests

and you know if you uh say if i remove

say this at the second test

and i rerun it i should see some red

lines

because those lines are not tested so i

think that's you know to me gives me

well i don't know why

i think some let's let's be a bit more

aggressive and remove more

of this um i think to me that's a good

parameter you know to see

uh visually i know i'm doing something

wrong here i was expecting this line to

be

uh red they want to say stops if not

because that part isn't chord maybe i

need to restart

and anyway there is a tool that shows

you exactly which lines of code are

covered and which lines

of code are not covered by tests and

regardless the number of tests you know

if you

all your code is is covered then you

know i feel confident

and you can also try things out like you

know you comment a line out

and and then rerun your tests and and

you should see that you know the tests

fail

which gives you some confidence that

around that line that you're about to

change

uh you have very good safety network

safety safetynet

i'll throw in here since you talked

about coverage

that coverage sort of held up as this

golden standard like it's a very

measurable metric by which you can

assess your code

um but it's also a deeply

flawed one because it's very

easy to write many

uh useless tests or tests that aren't

actually

testing the code you think it is in ways

um so like writing good tests

requires more thought

than actually writing good code um

and test coverage doesn't reflect that

like for example um in the coverage

report

maro just showed us there was that line

that was said that it had full test

coverage or like multiple

test coverage um because it was getting

called

every time but we didn't actually write

any tests

for the stop if not character function

um and so

that is a thing that can be

dangerous because

right now we don't actually have a way

to know

if stop if not character works the way

that we intend it to

all we know is that it works in a

positive case which

permits other functions which call it to

work

um writing good tests is hard

and that's part of why

yeah if i could just bounce off of that

like actually all of that

and alex and i think it also applies to

tests as well i mean i've

been finding that both the coverage

tests and the tests in general

can give me at least a bit of a

false sense of security if they're not

like really adequately checked but the

one thing i do appreciate about

both of them is and honestly when the

test that i've been

building and writing recently added

coverage tests that i've been doing

recently

they often tell me things not like i

made some dramatic

problem where i'm returning a character

string instead of a data frame that

would totally break anything but it's

actually like pointing out little things

like

i do a commit and then i realized i made

a simple spelling mistake or something

that was stupid

and the test will show that up or um you

know i think i wrote a

really robust test for everything and i

didn't run the coverage test and i

realized

oh yeah i'm not testing that one like

check if it's a character or not

so for me they've been like super useful

in those little

kind of minor issues but yeah i also

feel like

sometimes they can give you a bit of a

false sense of security yeah

no reports are hugely useful

they just should not

i i have trouble with them being used as

a metric

right um like the idea of like

our code is 100 covered by tests

therefore it can go to production is

i would rather have code that is

70 tested um

but like we're really happy with the

quality of tests

that are being run on it

okay i guess that we need to wrap up

here

uh we went beyond the half past

with agreement by alex because he said

that uh

we weren't this time step in this

meeting and so thank you for

for that extra time and maybe any

departing

question or comment

um

um

yeah like kind of into this um

setting uh that will be uh yeah

that will be quite interesting to me

sorry so to clarify so you

you're saying to follow up with um a

strategies not for writing new code but

for injecting tests in existing code is

that what you were saying

yeah to some degree i mean of course

then it's not really tdd

i i get that but um

still like to some degree uh

like maybe there is sort of a threshold

where one could say

um if the code that you

sort of want to to have tested uh is

this or that um complex or

i don't know good or bad or whatever

then it makes more sense to actually

start over and like have

a proper tdd setup versus a situation

where you'd say okay yeah that's

like close enough to something that we

can just like

stick in some more tests and then that's

fine i don't know

something that there's some guidance

there if possible or maybe there is

like no such uh

yeah guidance or way to to solve that

yeah i think it's great you know they

have a an array of

strategies and yeah maybe depending on

the situation

apply one or the other it's not in my

head

and any i don't remember any kind of

clear cut

guideline but i will kind of be a tent i

have read some things that suggest

mixing strategies depending on things so

i

i may be able to find something um

taylor would be nice to at least hear

your voice and say hi

and

hello hello sorry yeah i didn't have a

lot of feedback on this i was only half

paying attention but i

very much uh appreciate the

walk through and i've never used test

that so that was

a new package for me great great great

okay um thank you very much

this is the last data science inquiry of

the year uh with this you know we have

um we have all that there is for this

year

i look forward to seeing you next year

then 2021.

keep safe and have a great great uh end

of the year

celebration so

join this um meeting later right

i don't think so
