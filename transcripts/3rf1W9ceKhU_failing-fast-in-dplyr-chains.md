---
type: Video Transcript
title: "Failing fast in dplyr chains"
description: "Time doing a Deus incubator so I thought it'd be fun to do one last one and I wanted to share with you a package that I recently..."
resource: "https://www.youtube.com/watch?v=3rf1W9ceKhU"
tags: ["ds-incubator", "r-packages", "dplyr", "testing"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=3rf1W9ceKhU"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2020-06-30T00:00:00Z"
    usage_count: 5
usage_window: { from: "2020-06-30T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

okay so can everyone can hear me yeah

cool so yeah sorry for being late and

also sorry I'm also somewhat unprepared

for this because yeah I got mixed up in

a number of things not just trap box

problems but the idea was well and also

I guess most of you know that this is

very likely my last time doing a Deus

incubator so I thought it'd be fun to do

one last one and I wanted to share with

you a package that I recently looked at

and I haven't to be honestly it's

started using it much I don't know much

about it I thought it was interesting

and that's why I wanted to do this

because I thought like preparing the do

you think there would be like a good

experiment for me in terms of learning

how to use this package but unfortunate

didn't really have as much time as I

thought I would but I'd still think it's

an interesting topic so I want to like

present to you like why I'm interested

in this package and how we might be able

to use it and I'll show you at least

some of the examples that the package

itself provided and maybe this will be

something that we can also talk about

and then also be interested to maybe

have a discussion about if any of you

are doing this in another way or any way

at all or if you think it would be

useful so with that yeah so they I

wouldn't start off with talking about

this fell fast philosophy which is

something is used in a lot of assistant

designs not only in software development

but in software development specifically

for us what it means is that you take

you want to when you're designing

something you wanted to like error out

really early on so and you wanted to do

this because well you usually want to do

this because often it's expensive to let

a long process run either in like time

or resources or computing power or

whatever so a lot of times people design

their programs or functions or whatever

to check in the beginning for error

or problems that might occur later on

and then calls the error to happen

really early on in the process and then

you save save that time or save those

resources and you can go back and fix

the problem instead of letting a long

process go through and yeah waste out of

your time so some of you might already

be used to this particularly in using

functions I think it's one of the most

common places I see this happen when you

have a function one of the things or

some good advice I do here and a lot of

places that you should check first the

parameters make sure that the parameters

are that should have been and then fail

before the function tries to do anything

and let the user know that something

happened or that the parameters that

they sent or not correct so that's one

use of fail pass one that I'm MSM I

familiar with but something I'm not so

familiar with is like integrating this

into an analysis process so a lot of us

have code where we're not writing a

function but we have these huge data

processing kind of chains or processes

that we go through so we read in some

data that we're changing it we're

filtering some of it we're adding new

columns etc and ultimately we're

preparing that to do something later on

whether it's like passing it to a ggplot

or in my case for the past few months of

passing it on to JavaScript but when

we're doing that we have some

expectations and we can potentially know

that there's going to be something wrong

and we could check for that beforehand

but that's not something that I commonly

do but I realized maybe I should be

doing and maybe some of us should be

doing that more commonly in the process

we're doing so that's the basis behind

this I did start writing a little bit of

an example which I can kind of talk to

you on my screen so here I'm just

loading with some data this is like

actually real stuff that I've been

working on the past few days or a few

days and if for those of you there

if any of you remember life before like

tidy verse this is how we were often

like loading in so imagine I loaded in

this emissions data and then I wanted to

I wanted to filter by a specific

investor so I would do that and then I'd

save it as DF or something and then the

next step I want to filter by to

portfolio name so and I do that and then

save it over top of itself and this like

at least for me years ago was like

fairly typical process and I think

probably all of us agreed is now today

it seems extremely archaic and that's so

nice but one of the things that is kind

of nice about this process is that any

point in this process I kind of have the

the full data set as it is from that

after I've done all those possible and

it could be very easy for me at this

point to add a new line and say I want

to make sure that that none of the f

antastic type is o so I could say like

make sure that all of these things are

not and then I could also put this in a

stop if not or something like that if I

wanted to cause an error but I in my my

pressure like this is like easier a bit

easier to do outside of a deep ire chain

because you always you always kind of

have a nice breaking point so you could

do this with it so here's this same

process and it applies chain it does the

same thing and you could maybe for

instance start breaking things up like

if you realize halfway through this you

want it to do that and we could like

break this chain up and then save it as

something else and then start the chain

over and then put our put our test in

here so it's you could do this but I

think that's a bit tedious and also then

you just start creating all these new

intermediate objects which is one of the

kind of benefits of using the deep layer

chain so this is all leading to I've

found more

came aware this package which is in my

browser somewhere and so you can see my

browser now everyone yeah okay so

there's this package that are events I

made called assert are and what it does

is it creates these like assert commands

which you can insert directly into a

deep flier chain and this allows you to

do some of those testings like within a

deep tire chain without leaving it but

doing it in the middle and standstill

then even continuing on later on with

the rest of your analysis I think this

is a pretty interesting idea and I think

I was particularly interesting because

it fits into like our sort of deep I art

world so this is something that I've

want to start trying to integrate it

into my own code and I thought it's

something worth discussing with you guys

about maybe how do you feel about that

so we can test this out a little bit

with our example here and show you what

it does so they're just using the empty

cars built in data set and all of these

things in the beginning of our

assertions that they're making and we

could say that like in this case they

all pass so it just moves through but if

we let's say if we told it well we want

to make sure that has another name

something for short it's gonna fail and

if you do this chain now it stops very

early on so this is this concept of

failing early I start with this data set

I know I want to like do some grouping

and some summarizing at the at the end I

like it before I do that and before like

I get four

down in this process and something goes

wrong I want to test and make sure so if

I know that like this column name is

that's obviously a ridiculous but like

if I know that I'm gonna need this

column xxx and I put this in my in an

assertion in the beginning then when I

run this command I it fails right there

it doesn't it doesn't go through the

rest of this process and it also gives

you is like some fairly nice error

message so it's easy to figure out

what's going on and each one of these

are different types of assertions they

have a few of them you know again like

honest I didn't really have enough time

to go over them enough for me to tell

you everything about them so if we're if

you are interested I would suggest like

looking at this package and reading

through its documentation it gives some

on this main page it gives you some

pretty good information about what each

one of these are what they can do and

yeah so I I don't have a whole lot to

say I think that maybe we could just

have a discussion about it I'd be

interested if anyone else has used this

package or use an alternate path to

doing this or if people think this is a

total waste of time or if they think

this is something that could use or have

seen purposes for so yeah I open it up

for questions comments so I guess I'll

throw a question in here is this

something that you'd think is useful as

we are developing our code and then we

take it out of it you know sort of as we

move towards production or is this

something that should be like once

things are in production there are these

still B's assertions baked in there that

define what our data should look like

yeah

so my response wouldn't so that would be

in some ways like I see the production

side is much more kind of critical

because if you really want things to

work well and you want lots of like all

of us on the team or multiple people on

the team to be able to use it and things

not go wrong then like the production

side is like that more obvious place for

this but that being said at least for me

and my sort of development process

that's usually where the most stuff goes

wrong because you're still figuring

things out you're still working through

stuff and like some of the the stuff

that I've been working on for the past

few months sometimes it takes you know

more than a minute minute and a half to

run through an entire process and if I

had some things checking doing some like

real obvious testing and beginning maybe

that I wouldn't have wasted that time so

many times waiting for it to run and be

like oh the whole thing fouled it didn't

work and also I can definitely see some

value for this early on in the process

too because for me that seems to be the

time where I'm wasting the most time in

terms of running running a long process

that ultimately fails Vincent had a

comment just easy and in the workflow

like I have state and surrounding you

know if it meets its condition

right there like I think this is much

like I just like how seamless it is yeah

and it's the same result yeah that's a

good point like a lot of code ends up

having these like nasty long just really

ugly it's all statements that go on

forever and that's many yeah and then

you know if else statements are they

depend on these curly braces which makes

them rather more sensitive than you know

other sort of lines of code because they

sometimes span multiple lines which

means they're easy to create end up

causing bugs and stuff like this so yeah

I that's an I hadn't even really thought

of that but yeah that's one way people

end up doing this and yeah maybe this is

[Music]

would you please show a case where the

package throws an error and then you

follow that with a call to trace back I

think that could be useful because the

by design the package seems to not show

where the problem is coming from and

which is a design principle used a lot

in the Tolliver's because you know then

it assumes that the user will call trace

back but it trace back the function that

is not so well known so I would like to

show you know how with trace back you

can have insight about where in a long

change specifically the error comes from

yeah I don't so this particular package

doesn't provide a trace back so you can

see my art studio now like this is the

result of what happens when assert our

captures

a failure or an error and what it does

is it gives you this result and it's

actually kind of cool but it's very

targeted towards being inside of a chain

so it tells you like exactly what failed

it will tell you the column and index

value where it failed and if it fails in

multiple places like it will give you

like multiple lines that it will tell

you exactly which yeah you can basically

work back and figure out which column

and watch row like what are the actual

locations of the data points that failed

that test which I think it's pretty nice

but I like what you're saying I could

maybe force this sure that's okay

actually I didn't

it was my mistake I didn't notice

actually that it was some output text

output there I just focus on the error

message and didn't see anything below

but there is stuff on top so I think

that the package does well what I was

trying to achieve with trace back so I

don't think this is I mean would you

like to try to run the function trace

back already on the console because the

last error message should already be

kind of on there on the list I think if

you run trace back you should get some

output there so hate is there it's

coming from eight so that's in green

eight is where I could normally

understand what's going wrong but I was

wrong myself in asking the question

because I didn't notice that the package

itself gives you even more informative

output that where I really line eight of

the trace back yeah yeah so it's walkie

because in some ways some ways it's it's

kind of not an error because it's doing

what it's intended to do it's it's

giving it's stopping the function at

that point so that's why I like this is

not showing a normal trace back deployed

maybe if I I just

made a crazy mutate command and this is

kind of what would happen if you had a

problem in your deep liar chain and then

I mean they're they're tied never

actually use this our line last error

but this is what they're telling me to

do so I can see what that does yeah it

sounds kind of a specially formatted

back trace but yeah I think what what

this package is doing like the kind of

results that gives you for the error is

a bit more informative than like the

standard trace back or even this this

our lines error message I think this is

a bit more yeah it's a very it's you

know kind of along the same lines of

test that and the assertions in that and

so if you're familiar with that I think

this would be I pasted a link to the

same principle the tires that could help

people like Vincent who are already

right in their own assertions to explain

how you can create custom assertions

that are pipeable basically all you need

to do is you know if you if you are

building an assertion or a stop well

know stuff but a warning or a message or

whatever that is what is called a side

effect so you call that function because

of the side effect of for example

throwing a warning as opposed to a

computation that you want to do on your

data so the same principle goes as

follows so if your function is called

mainly for its side effects it should

return the the first argument invisible

so if you do that what you end up with

is if with a function that is pipeable

meaning that your function will return

the warning but also on the console but

will read sorry will print the warning

on the console or the error on the

console but but will also try to return

invisible the data which means that the

data can flow through the pipeline from

the beginning to the end no matter how

many times you have you know

or messages or any side effect like

writing a file to a disk in the middle

yeah yeah I've done muses before also

one thing that I liked about this

package is the assertions are a bit more

complicated this is what I would have

liked to be able to give you more

specific examples of this and explain

this more in detail but like for

instance they verify is a sort of

assertion of like some characteristics

of the data frame then they also have

these like road row base assertions and

these are kind of like doing a

combination of doing a row lies inside

of it and then like you know a test

program so yeah when I was reading

through the examples and reading through

the documentation it seems pretty

flexible and some of the some of the

ideas that they have what kind of

assertions you can make get like rather

complicated and I feel like would I'd

rather use this then make this

pre-rolled or make my own my own

Burgie ìwhy version of these like side

change things I mean guys it is totally

possible look at some of what they offer

here seems that could be rather

complicated to do on my own thank CJ we

have a couple of minutes and maybe there

is people with questions but I would

like to spend at least one minute

acknowledging your enormous contribution

to that science incubator and you know a

lot of the of the times you may have

heard me speaking but CJ was always in

on a background the very first time he

joined the organization and we met and

we had a conversation about things that

we know we have noticed in organization

that we could know to our little

contribution to to kind of help people

come up to the best practices that we

know about so this is just you know my

personal acknowledgment to the huge

impact that sometimes was not visible

but it was always there and also CJ was

has also always been a person who had

the confidence because he knows his shed

but also because he's

he's very good at kind of talking to

people he had the confidence to tell me

that I was saying sometimes but

always in a very polite way and that's

something that I need because otherwise

you know if people just say yeah and I'm

too polite then you sometimes don't have

like a good reference to pre-clear eight

your path so from I end like a big

applause to CJ thank you very much CJ

for your contribution here so if anyone

else wants to say thank you before we

work before we finish today thank you

thanks Maura yeah this has been fun

yeah first I guess a lot of you know

like I wonder the reason I've been kind

of unhappiness because I've been doing

so much JavaScript and I don't really

like it and I do like R so this specific

ideas incubator has been like oh I

relief for me because I get to dive into

R again that's fun I'll miss you CJ

thank you very much thanks CJ a CD

oh now when I'm dead missiles stop

[Music]
