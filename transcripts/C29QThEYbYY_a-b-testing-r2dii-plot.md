---
type: Video Transcript
title: "A/B testing r2dii.plot"
description: "Not about shiny it is instead about two versions of the package r2dii plot which is approaching release and we some feedback from from all of you time..."
resource: "https://www.youtube.com/watch?v=C29QThEYbYY"
tags: ["ds-incubator", "apis", "r2dii", "testing", "ab-testing"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=C29QThEYbYY"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2021-06-08T00:00:00Z"
    usage_count: 17
usage_window: { from: "2021-06-08T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

recording so today the ds incubator is

not about shiny it is instead about

two versions of the package r2dii

plot which is approaching release and we

would like

some feedback from from all of you

uh in in free form which will give some

time at the end

to ask questions give feedback and also

to discuss the process which is an idea

that monica

brought up before we started the meeting

and not just you know presenting what we

want to present but also discuss if

there is time

the process that we went through in the

in the whole

development of the package and so we'll

cover that

hopefully at the end so what's gonna

happen now is um

we're gonna be talking about two

versions of

uh a package uh the release

product will have only one version the

one that comes from

from the feedback that we gather from

you maybe it's one maybe it's the other

one or maybe it's a mix of the two

but um we would like to have a five

minutes

product basically to show to specific

people some of them are already in the

room

so it's going to be even more useful to

have you here but

that that five minutes demo is basically

uh the comparison between the two

options that we are offering

our beta testers um now

and then we're gonna cover um beyond

those five minutes we're gonna cover

um the the two versions in more depth

so the first five minute is gonna be

simply the comparison and then

the rest of the time is gonna be me and

monica talking about the

the two versions in at depth before we

start

do we have any comment or question just

now something that

i won't need to wait for the end

something general

now let's see if i can share my screen

i'm not showing my skin yet right now

entire window

so for a moment you should see your

beautiful faces

and what i'm going to do now is i'm

gonna jump to

uh well first i'm gonna ask you to give

me thumbs up if you see my screen

yes perfect and let's jump to

the website of the package so

if you go to this url

[Music]

you will land in the website

of the r2dii plot package

which is not yet on crime the readme

file is not

all that helpful right now it's a bit of

a big bug with a bunch of things

but instead we would like to drive your

attention to the section

so i'm going to be clicking the very

first link under the

articles menu which compares two

versions usually

people refer to two versions of

an application user interface an api as

a

and b we chose x and y for internal

reasons

uh so i'm gonna be talking in this next

five minutes about

the two versions that would like you to

offer to you so rtai plot

just now and in a temporary way comes in

the form x

and y uh you install it from github

as usual with um

install underscore github and 2 degrees

investing rti

dot plot and you can copy

f each chunk of code from here and

then you could paste it if you wanted in

your

r session uh you could do something like

this

you know just place it there uh which is

a convenient way

for you to try what you read on that uh

on that article so beyond reading it

if you can have the time

to actually try it yourself that would

be very helpful to us

so in this package

the goal is to create beautiful

plots of r2di data that are also

informative and also

easy to use so those are kind of this is

the mission

of the package so once you install it

then you will be able to

play with the code and one thing that is

embedded in the design of the package is

that

it is meant to be used fluidly with

packages

in the r2ai ecosystem so packages like

rti data

rti match and rti analysis and it also

plays well

with packages in the tidy verse

particularly

the deep layer package is useful for

preparing the data

and the ggplot2 package is useful for

extending the plots and customizing them

so for this demo the three most

important packages that you'll need are

these three

d player chichi plot2 and r2ai plot

which is the package that we are using

now

in terms of the data and the data is the

data that comes

out of the r2ai analysis there's two

data sets

that you know typically you could be

using

with this package one is the output of

the function

target sda from the rti analysis package

and this is a little demo that i said

it's called

sda a little demo data set that we

include with rti plot

so you don't have to run the workflow

all the way back

to the r2i analysis package so you

already have

something to play with so you can try it

right away

and then the second type of data that

you may you may typically

have is a the the one that comes from

the output of the

function target market share in the rti

package

and a rti analysis package and here

again we give

you an example data set that is called

market share so with those two data sets

you you should be ready to try

the entire um package right

the two different interfaces so as i

said before we are currently

supporting two different interfaces and

um each of those can create three

different kinds of plots

the timeline plot the techniques plot

and the trajectory plot

each of those comes in x and y versions

and

the the difference is

basically between these these two

interfaces in the way they meet

the requirements for the data

that they need for inputs so each of

those

versions of the package have you know

need to

input some data and how you structure

that data

is a little different in the version x

and in the version y

also in the number of arguments that

are included in the functions so with

the version x

mostly you meet the data requirements in

in two ways

one way through the filter function in d

player

in the d player fact package or any

other function that allows you to

subset a data set to specific rows and

that is usually because the

um data set may uh you typically come

with

more rows that you need for a specific

plot

and then the second way in which it

meets the data requirements is through

some

internal magic that we can do because we

know internally we know

the structure of the data that you will

be provided because this

is data that you know we massage in the

rti ecosystem before you input it

into the rti plot package in comparison

the interface

in the y api meets the data requirements

mostly with preparation functions that

are already

embedded in the api so those functions

are called

prep underscore something like prep

timeline prep techniques and

trajectory and also via explicit

arguments there is

a lot less magic a lot less assumptions

that we do about the structure of your

data

and instead you give explicit arguments

to the functions

so just to give you a feel for what

those two apis look like

as i said before you know we use here

example data sets that come with a

package so our data in this case

is going to be the market share data

in the x api which is the thinner one

the one that has less arguments in the

functions that we provide

the filtering the preparation step

happens with

for example in this case with the filter

function of the d player package

we are here focusing on a specific

sector we are focusing on a specific

technology

we are focusing on a specific region a

specific

scenario source and in particular we are

looking into

ears that are beyond

2025. sorry in low less than 2025.

so at the preparation step again

with the filter function in the player

and then the plot

underscore trajectory function in the

version x

right away that's um what it's meant

to do so this is what the plot looks

like

for the y

api this is the the difference so the

data is exactly the same there is no

difference there

it inputs the same data but notice that

there is a prep underscore trajectory y

function here that does the filtering

that

before we did in the

you know with the d player function so

now the filter is embedded in the

function

and also in this case we have a value um

argument that didn't exist before which

is a

an argument that allows you to tell

specifically which is the column that

holds

the in this case the production data

that will be plotted

also there is a bunch of other arguments

that need to be

passed to the plot trajectory function

before the plot trajectory function did

a lot of magic under the hoods

here it is explicit you need to provide

these arguments

what are they called scenario specs from

good to bad

the mainline metric and additional line

metrics which is actually optional

so as you can see uh the two you know

and summing up actually i think it's

beyond five minutes uh

summing up the two interfaces do the

same but in a different way

summarizing again with the x

version you do a lot of preparation with

deep player functions

and and a lot less

explicit arguments and with the y

interface you do

the preparation explicitly with a custom

function that we provide

and explicitly giving some arguments as

opposed to relying

uh on internal magic of the functions

so that is all for the comparison

um i realized that i need to go a little

faster

um if we want to make to you know fit

everything in

in this meet up so i may i'll make a

little pause here to ask monica

what's your feel for how to use the rest

of the time should we still go for

the x interface and why in depth or what

do you think monica

yeah yeah i think so maybe you can just

go or

like quickly through the x because it's

shorter

uh and or i can already elaborate

what's the like why the two

perfect what's the difference between

the two

we can also do that actually okay so

maybe maybe listen to that yeah

um yeah so let me maybe

share my screen now

can i i'll make in the end

the question uh no

you can you can ask questions

okay so um the package will include

also the technology mix and etc the

autographs right or

for now it's just a trajectory once no

no yeah so maybe

also confusing so let me show uh

the the or

like all the functions that are inside

maybe to make things clearer

um so the actually

so i'm going going to talk about the y

api because

it was actually the first api that we

developed or

mainly i developed and it's

very elaborate like it's like i'm not

gonna talk about all of these plots but

just

explain the idea

that it's much more

elaborate like what the user has to

provide to the functions

but at the same time there is a lot of

customization that you can do

and it like you basically don't need to

know

anything else except for this package to

make these plots like you re-label

everything inside of

the this package you don't need to know

how to

recode things with the player or reorder

data or things like that

so yeah like the trajectory plot uh was

already presented

by mauro uh

so there is also this tech mix

plot which in here it's still like the

minimal

interface because actually if you don't

provide any additional

um arguments the plot will still

oh do you see my screen

i do see it actually i do now

okay good uh so like

again this function is still quite

intelligent so we can still figure out a

lot of things

from the data

um although you do like you do have this

prep

techniques function uh that you have to

run

before you run the plotting function

which is not the case

in the x version because in the x

version you just run

one function and you get the plot like

on the output of r

to the i analysis um

you just run the plotting function uh

but

with the techniques you can also uh you

also have this additional

arguments that you can pass

uh like for example you can change the

order

of the like the bars or

you can make custom labels

um for the bars and also

you can change the colors you can rename

the colors

all these kind of things um

and in here you do it using

a date or like a table like a data

structure that has to be

uh structured specifically so this is

something that's of interest to us if

like you think this is

more um easy to use

having this kind of data structure that

you pass and then

as an argument to the plotting function

uh to customize the plot or

uh as a user are you comfortable enough

with

like recall kind of preparing

the data yourself using the plier and

then

passing it to the plotting function in

the right

um like looking the way you want them

to look um

yeah i don't know actually what can i

add here well i mean

in um i think people is curious to see

the probably the last

type of plot so in my demo i showed

a trajectory now you have just joan

techmix so maybe if you can scroll to

the

timeline one and that will cover

at least each kind of plot and then

people is

free to go and explore on themselves the

two different articles that we wrote to

see how

would you do it yourself with the two

different apis

yeah so the plot timeline is actually

the

simplest one and i think it's almost

the same in two versions uh

with the exception that again

it's more like you have this prep

function in the y version and in the x

version

you just prepare your the data yourself

uh and here also in the y version you

have

this opportunity to customize

your data using this

specs argument where you can change the

labels

or you can change the colors and again

maybe i can open the

eggs

yeah so basically in the x uh

version you would like

do it before you call the

plotting function you would make like

all the relabeling yourself and then you

call the plotting function

great thanks uh monica i think um it

would be nice to

maybe leave if now that you're there um

how about we click on the reference

menu just to show like an overview of

the two different

apis and then with that as a background

we leave the room open for questions or

maybe a discussion about the process

if if people is interested in that

yeah i wasn't following the order of

hands

yeah i am is that okay can we click on

the reference

menu you did okay it looks like it's not

refreshing on my end

um okay i advertise them to people

i cannot see it

but we can start with the question there

you go yeah yeah let's do that

um i think it was daisy wrote a hand

and she asked a question i see cj's

hands up

uh nope i didn't have my hand raised but

if i may um

yeah i know maybe i just give the floor

to the other people that were

raising their hands first and i will go

at the end

okay um yeah since my name was mentioned

um

so what one i can't see monica's

screening in this video

um i've been thinking in this

that to me it's not super clear like

what is the difference between the two

these two like different sets of things

it kind of

feels like one of them for instance

takes the strategy

okay the user needs to sort of prepare

their data beforehand

and then pass it into the function and

where the other kind of says

yeah just could be whatever data you

have and then i'll do all the things

and i think it might be helpful for me

and also for your users also for your

using for the people you're asking to do

this to do it like really quickly and

whatever to

try and tell us what that difference is

as in as short

and easy terms as possible and i think

it might also be interesting to hear

like what you think

the pros and cons of those two versions

are

and i i couldn't understand why you

might want like might

want to avoid that because you don't

want to introduce some sort of bias into

it but

i think that would like really solidify

like what you're

what you're trying to ask us here and

then i might be more willing to do this

in like five minutes rather than think i

need to spend

you know 45 minutes playing around and

figuring out how to use the package just

to understand

um what i'm supposed to what kind of

feedback i should get

okay do you see my screen no or not

i do not but um no

yes i can see it now

how about everyone see so basically the

difference

is um i would say

the x version is

kind of has much simpler interface in

the sense that

you don't have to specify

almost anything any input to the

plotting function

itself but you have to kind of

do the work beforehand if you want the

plot to look

good in the sense like if you want to

have nice labels you have to record the

data

you need to do the filtering using the

plier and not

a custom function so basically you kind

of need more

r knowledge like general

r knowledge to use this version

and then for the version

why it's like you kind of

need to do more

like custom setup before

but you don't need to know are

per se like deployer or um

i don't know ggplot functions or

something because it's

all kind of inside of the function and

the thinking so and basically these are

the

kind of the so the pro of the

x version is that it's very simple to

call

the function itself

but you need to know more r

and then the second version is like you

need to know this package

and my thinking behind the why version

was that maybe like the users from the

bank side

will be actually more comfortable with

this kind of setup than with using

deployer and recording etc

but of course like we don't know that i

think you know it

better than we do if i may i would add

one perspective as well which is that of

the maintainers

because this is an internal meeting um

so of course in the navy testing

exercise we are focused on the user

right so i i think it makes a lot of

sense what

monica is putting forward which is the

you know we're trying to imagine what is

our most common user and what needs they

may have

and what experiences they may bring with

themselves

on the other hand is maintainability so

for example

you know the more arguments that we

support of course the the bigger

the code base grows and the more more

code we have to maintain

as opposed to for example just throwing

an error and say hey your data doesn't

have the structure i respect

please fix that and then you know go

back to us right so in the in the x in

the thinner api

and we don't do a lot we we just throw

errors

that are as informative as possible and

leave the responsibility to the user to

basically reuse their knowledge

assuming that they already know

something about the player for example

or ggplot2

as opposed to the thicker api which

which we do the work ourselves and we

maintain the code

uh yeah that was my inside that's due to

the

really good point cj the pros and cons

we omit it and we are now saying them

aloud but

we should probably write them too um

hard to say

who is next so whoever feels comfortable

speaking go ahead

um just i want to throw in

a comment real quick on soliciting

feedback

um i think probably the most

straightforward path for feedback right

now

is i will throw up a poll in

the coding channel um

and we can have extended discussion

in the comments of that poll so

uh you know because we are running a bit

shy on time here

that is i think a place where we can

talk more about this

thanks is a great idea

but then i see jackson's hand

yeah i think um i guess we only have two

minutes but just just quickly i think

it's

also obviously important to have the use

case and the user in mind

of that we're actually targeting for and

i think there's a couple distinct ones

obviously

internal people that would use the

package

are one and then banks or another and i

think that either um

uh api uh could prove better or worse

for uh for each use case so just like

for instance if if half the people

polled have banks in mind and have

people cold

have like 2di analysts in mind it's

likely that they're just going to

choose one or the other based based on

that alone and i don't know if that's a

useful

um sample group early useful feedback um

so may be good to specify that like

who should we who should we pretend

we're being when we're making that

decision

um maybe does that make sense

yeah i would probably leave that also a

bit to alex's input

as uh you know he's um kind of closer to

the

to the stakeholders i guess as a manager

of the entire

pacta ecosystem wow

yeah i completely agree that we do have

to

consider different use cases

for different things i

think that we can

talk more about what are the different

use cases

in the thread but ultimately

having it be easy for the users who

don't know what they're doing

is important but also we do want to give

people power features

that's always going to be a tricky

balance

um so i think

that i i have a couple of ideas

that i'm going to throw into the thread

that might help us

balance that

i just think i think all i was trying to

get to at that point is that before we

make our like before we vote as people

who are being asked for feedback we

should try to

align on who we're pretending to be when

we're when we're making that decision

um so we'll try to do that i guess

yeah so maybe as part of the discussion

i think

it would be really useful if you could

make distinctions between um

you know obviously it's going to be one

person one boat

but it would be useful to in the

discussion be

if you have something like personally i

would would prefer

this version of it but the users i deal

with would almost certainly prefer

this other version

cool i really like the idea of following

up because yeah before short time

also because some important people are

not in this meeting like george for

example

so the plan we have with monica is to

record

again uh a very succinct version of what

we have just said

and and maybe add that to the threat and

then i

invite george and any other will invite

george and any other

um important beta tester to that thread

so they have everything there they have

the you know as jackson suggested they

have the ideal

a user that we're aiming for and they

have the video that we recorded and then

they also have the link to this the full

meetup and before i say bye i would like

to pass the ball back to monica

in case she wants to add something

um no not really thanks for coming and

looking

forward to your feedback yeah i

acknowledge that we haven't uh

given the chance to a lot of people to

uh to ask their questions

but hope i hope that you know alex's

idea of having a thread apart will will

give you that

that chance thank you

thank you thanks thanks so much
