---
type: Video Transcript
title: "Good commit messages, .gitignore, GUIs"
description: "Before i do know my art studio thingy and hear the the first actually up here the first um subsection um is this about writing useful commit messages..."
resource: "https://www.youtube.com/watch?v=xyNydg5IUok"
tags: ["ds-incubator", "git", "terminal", "github", "r-packages"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=xyNydg5IUok"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2020-10-13T00:00:00Z"
    usage_count: 19
usage_window: { from: "2020-10-13T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

okay today the ds incubator is the last

of the first lesson in this series about

using it from the terminal

uh there is a few this

is more kind of theoretical from what i

can see in the listen um but before i do

that

let me check that you can see uh you

know my art studio thingy and hear the

lesson

can you see that yeah great so

the first actually up here the first um

subsection um is this about writing

useful commit messages and it kind of

all boils down to

to having something that looks like this

uh the first line is very important

because it's the first

it is the line that will appear on the

git log so we were you know discussing

before

the um the different ways of getting a

useful

git log and if you know the command

git log itself gives a comprehensive uh

log uh including the full commit message

but most people you know use uh

like the shorter version that shows just

one line so that's why you know the

subject

line of the commit message is super

important and the way you create that

subject line is by breaking the first

line

with an empty line and then adding

whatever information you want to add

below that

so first that's the very kind of first

um

useful uh rule let's call it you know

start with a commit message that has you

know one line then break it with an

empty line and then start typing

whatever under that usefully

our studio the interface of our studio

uh when you create

a commit message uh has a counter of

characters so if i start

typing uh something like here is my

message you can see that i have already

typed

26 characters and if i keep going

i will reach the point where i should

stop which is here

so 50 characters is the recommended

limit

because beyond that when you when you go

to github

uh you will get um like dot dot right so

basically

on when you see the list of commits uh

as displayed on github github won't show

more than 50 characters

and then it will start rubbing so you

know it is

when you see you know like instructions

about how to write useful commit

messages

uh many guys recommend that the first

line has only 50 characters

then it's an empty line and then

whatever

else and here you can go beyond that's

fine

in any case my recommendation would be

to keep more or less to the normal

80 characters length because you know

that's kind of

when you write software in general

that's how you have your screens set up

usually you use any extra space for

other things

so if you write any text that goes

beyond

80 characters you will annoy a lot of

people that have their screens already

set that way and they need to kind of

go and you know drag windows and things

like it's kind of annoying

um so that's it really um one line

first line um with 80 characters

then an empty line and then like any

number of paragraphs

that explain uh like the lower level of

what we are doing

on the very first line is just a very

high level and mostly focusing on you

know why you did what you did

um and that's it i i won't cover that in

much greater detail but i'm sure you

know in your experience you may have

um i don't know develop your own

things or any anything in this room that

um

that you would like to share about you

know writing

useful or really useful commit messages

before we move on to the to discussion

about git ignore

nothing okay so yeah the

the rules are very simple so for those

who just joined you know we're talking

about how to write useful commit

messages and it all boils down to

a very just one line 50 characters or

less

that describes the high level of what

you've done then one empty line and then

any number of paragraphs ideally uh you

know wrapping at around 80 characters

but not not so

picky about that the second part is

something that it is called this lesson

but something that um

alex you know highlighted as important

to cover and

i totally agree which is this idea of

um managing your um

folders in your computer in a way that

everything that you have

there is either you know checked in

git or ignore basically so you don't

have kind of

files bordering you right so say that if

i have a file

i'm going to create a file called b and

let me clean this with ctrl l and do the

status

you can see that there is a b file there

so if i

if i don't want that file to leave

in the git repository then instead of

just you know

trying to every time remember to not

commit it the best thing i can do is to

just ignore it

so you know you have this git ignore

file that if you don't have it you can

create it's just

a text file right it's called git ignore

so that is the only convention that it

needs to know that that file contains

files that you don't want to include in

the

index so if i say now v i add the file b

to the git ignore file when i save that

file

if i do it status again

it should say that b is no longer there

the only change that has been registered

is my change to get ignored

so i could do like git commit with a

message

um

b to b ignore

and let's commit the file get ignored

bit ignore so now if i look at status

you can see that my is stationary is

clean so let's clear this up ctrl

l git status again is clean

and if i if i modify the file b so let's

open the file b

if i modify this file with anything

these changes shouldn't be recorded by

git if i do get

the status yep

git still says there's nothing to commit

because i explicitly said that that file

should be

ignored because i use r a lot i use uh

they use these helpers for adding files

you can ignore so i could also have done

something like this

and so let's open git ignore again let's

remove

that file from big ignore and let's add

it

via the use this package so this comes

from the use this package

so this function should have added

the file b to get ignored maybe

i don't know why i don't see it here

let's see if i close here

okay here it is it looks like you know

it wasn't refreshed

so why you would you want to do that

well maybe you are

you know you need to ignore a lot of

files in one go and you may be you may

be using a function like l apply

to you know pass you know a list of

files that you want to ignore and then

the function

would be use this use

git ignore

right so in this case you know if my

list contains just define you know if i

want to ignore

if i a b

and c uh this will

you know should update my git ignore

file with all those files there so

that's a quick way

and by the way what i just showed is

something that applies

to the idea of iterating or vectors is

something that nothing to do with git

but you know some people have shown

interest in that

and so yeah there it is one application

of how to iterate over a list

in this case a vector and apply a

function to all of those

items in the list so for git ignore

and the the

the syntax to ignore files uses the

globe

syntax so you there is a very useful

link here to

learn how to use that feature so

basically it says that you know you

could use something like

um i know you could ignore something

like

everything that is a txt file with

something like this

right txt and that will not every txt

file

so it is it is very succinct and you can

you can

do a lot of things in in a very compact

way and to learn more just click that

link and inform you know how to do that

and and then there is one thing that you

know has been bited as a lot impact

analysis repo

i don't know if that is what fixes the

problem but it's this idea that

sometimes

you add a file already to a git

repository and then

later you start ignoring it

so let me demonstrate that example here

so let me clean my git ignore file

and

let me commit it

so you know now um

actually the file b i don't want it here

let's let's just

delete it um remove it

so uh b

let's say that no b is a file that i i

added recently

um and i added it to to

the git ignore before i um

created the first commit with that file

so git status

should now show uh what did i do with b

ah because i deleted it maybe that's a

kind of bad example

[Music]

um

okay and i also had this file a in my

git repository uh

so if i touch a now git should

record a change right so i save this

file

and let's do a git status

so as you can see the file a has been

modified and it records that but what if

uh i now decide to add a to git ignore

so i add it there i save the file and i

hope that when i do git status it will

have disappear right

but it won't happen that way

so i have modified git ignore right

and but a continues to be there in the

staging area

and the reason is because i added i i

created

a commit that included if i a before i

added to git ignore

so how do you work around that okay so

let me first commit

a to it ignore

let me just for now uh work on it

ignore right so let me commit the change

to hit ignore

so the change to a is still there right

so what if i want it to disappear from

there well what you do is you need to

update the index so remember the index

is the place where git stores

information about everything

right so if you do a git update index

and you can tell it and assume

that you know the file a you're gonna

say now is unchanged

and now you have to say the name of the

file that you want git to assume that it

is unchanged right

so with this let's look at status

and now a disappear let me clean this up

and then do it again

did status status

in general oh sorry

right so now i git knows that

although i had added that file in the

beginning

now i decided i no longer want it to

track it

if i want to undo that it is as easy as

say no assume unchanged

right so with this if i do bit status

now a

appears back again in my staging area so

that is generally more than you want to

know about ignoring files

this idea of assuming and change is kind

of not so common but sometimes

sometimes you need it um alex what am i

missing about git ignore in files or

anything that you would like to add

yeah a couple of uh big things

one is if you have

added a file to the repository already

and later added to the get ignore

it will still track changes on that file

um so let's say i

um add a data file

and commit it and then later i'm like oh

no i can't

add data files to my repository put it

in git ignore

um it'll still be tracking that data

file

and more importantly that data file will

still be

in the history uh available to

whoever uh downloads that repository in

the future

so um be

very generous when creating your git

ignores

and include things that basically

from the beginning include anything that

you know you're not going to want it in

there

um second is

uh before you move on alex

how do you then go about uh ignoring

something that you've already committed

it'd be time so it really depends

on is it bad that it's in there

um like if you accidentally commit

your dot r proj.user file

um that's not the end of the world it's

just like

a minor inconvenience you can delete it

out of there

and it just it won't be there again in

the future

um but let's say you commit

something important like the file that

contains all the passwords to our

database

right um not that anyone would ever do

that

certainly i've never done it um

if that happens um it's not the end of

the world

it's just kind of a pain to clean up

um how to clean it up is

well beyond the scope of this um

but awesome to

talk to me talk tomorrow um like

we can handle it but there there's just

like a very complicated flowchart of

have you already pushed have you

committed like

many different ways that that can get

fixed

so um yeah i i'm willing to help anyone

the the important thing is like if you

commit something you really

shouldn't let us know we're not gonna

judge you we've all made that mistake

before

um but it is

cleaning it up is just something that

needs to happen

thanks does that answer your question

claire yeah

basically um yeah it's tricky

yeah um but but so

that's the thing is like just putting

something in the git ignore file

that that protects against the future

but it does not fix the current

situation

um so a another thing

that i want to talk about real quick and

i don't know if tomorrow was going to

touch on this or not

but it's the global get ignored

which i find to be super useful

um and basically that

is a file that lives on

your computer not as part of the git

repository but

in like your user settings and it's

a git ignore that applies to every

repository on your computer it's the

global thing

um so if you

use a text editor like vim or sublime

or if you're on a mac

the a lot of the time you'll see ds

store files show up in your gift

statuses

um if you add those files to

your global get ignore um

then it's it just ignores that i'm

everywhere

so i i'll put some instructions in

the coding channel of how to set that up

on each of your computers

and i already put in a link to um

github has a repository where they just

have

a bunch of template get ignore files

um so it's like if you're if you're

working on an r project

here are the common get ignore files for

every r

project if you're working on python

here's all of the python files

so um that's just a good place to get

started

that's my bed that's great thanks a lot

yeah no i wasn't going to cover the

global um i'm actually i'm familiar with

it so great that you did

and also because it wasn't in this

lesson so i totally forgot so awesome

for for you complimenting that so that

is uh

sorry yeah go ahead um clarification by

this

assume unchanged option so this leaves

the file in the repo

but just basically ignores any further

changes to it so like

if you someone else closes repo then

that file would still exist there

it's not like getting rid of it it's

just preventing any further changes from

happening to it

that's right as far as i understand it

um

it is um it is so that the changes that

you do locally

do not change the state of the file in

the git rebel go ahead alex please

yeah um one other thing about uh

assume unchanged and no assume unchanged

is

it um it's a very

finicky thing and uh

a little bit on the dangerous side to

use i

i would not encourage us to use it in

any way

um because if i run

get assume unchanged on my machine

that only applies to my computer it

doesn't propagate to anyone else's so if

i have

notes dot text in my uh repo and i'm

like i don't want to commit this

i'm going to just assume it's unchanged

well

if uh mauro checks it out on his

computer and makes some

changes then uh

those would commit and then when i

pull it back down it's going to be a

mess because

i will have my changes i will have

morrow's changes and git won't know how

to resolve that

so um if you are planning on using

assume unchanged or no assume unchanged

rather than just using

the get ignore defaults um ask yourself

really why are you doing that and

communicate

a lot with the rest of the team when you

do it because that's saying

everyone else also has to do that

yeah yeah one uh okay i mean i i totally

endorse what you're saying there but of

course you know every

if the tool is there is because there's

some very edge cases that maybe it's

useful and you know i wanted to say

to mention that one case that um just to

kind of

see an example but that's and i totally

agree that generally it is exposing like

a very weird case and mary

maybe shouldn't have made it to this

lesson maybe i mean it's not that it

wasn't the lesson you know just

i'm just extending the lesson with

things that don't come from from our

experience

so for example in the case you know when

you render an aramaic down

file what you get there is

an md output that sometimes has some

differences with the version that is

checked in

and those differences sometimes are not

useful

um because i know it's just you know the

change of

the date or something like that um so in

in my case you know we have been kind of

working with this file where everyone

has to put you know their own

their own uh um path to their computers

and things like that

in a in a configuration file and

i you know because of how i was working

locally

and those that fight you know kept

changing all the time everyone everyone

touched it so i decided that

at least from my end i didn't add any

changes to that file so i had to assume

and changed

but then i also learned you know

probably what what

alex is suggesting i'm pretty new to

used to using that command and project

stop

using it after hearing alex because it

was unclear

some merged conflicts and things that

you know seem to be kind of happening in

the background but we're not obvious

so yeah i think that in in some uh

probably

i should say yeah forget about about

that command

so thanks alex for highly highlighting

the the dangers of it

so we are kind of close to the end of

the meetup and of the lesson

and the you know what we have there is a

section on graphical user interfaces the

only thing i would like to say about

that

is that if uh that they are totally okay

to use

i encourage them and you know i hear

good things about

um deep kraken and then there is a

couple of

ones listed here also very good things

about sourcetree

honestly what i use personally is our

studios interface uh

and a lot of the terminal and that's why

you know we're having this meetup

but i would like to open kind of the the

room to discuss for a few seconds that

you know

graphical user interfaces if you have

any questions or if you want to share

something that you know maybe you saw

your user interface haven't improved a

lot and you wouldn't recommend it or

something

definitely a recommendation i've been

struggling a lot with

using git from a combination of the

terminal

and um what up

up on the right um in that sometimes i

think i've

you know push something through the

terminal but won't see a change

happening

in in the sort of top right um

and that confuses me to say the least

if if i can comment on that

um one tool you

or one trick that i have learned is

that the get client in

our studio doesn't refresh its data

all like constantly

so if you um like

navigate away to a different pane and

then

you go to like the environment or the

history pain and then come back

um that that may make your life a little

easier in that regard because it just

sort of refreshes it

um or there is a little refresh button

on the top right there next to the

branch name

second is i

strongly encourage people to use

a gui like rstudio

or sourcetree i know is free and i've

used in the past

they make it hard to make mistakes

so that that is like a good thing

in software um that when you're making

your commit they show very clearly these

are the files that you're committing

um when you make a push

going on they're very um clear

about what's going on the only downside

is if you are doing anything outside of

like

a very standard workflow um

they're going to make your life a bit

harder in that regard

so if you are sticking to just doing

normal

everyday things they are spectacular and

will make your life easier

but if you're going above and beyond

that um

knowing how to use the terminal

definitely helps

that's cool and then in that case maybe

as

alex said before maybe that's the time

where

we should be kind of communicating with

each other anyway so you know if you

find that where you can

what you want to do is beyond the scope

of your uh graphical user interface

maybe it's time to just have a quick

conversation with someone else that um

even even if you can still do it on the

terminal maybe it's just

a way to to have a second pair of eyes

on the same problem so with that we

finished this meet up what

we have there is a summary but i

encourage you to do that on

your own time because it's late and also

uh if you go to the lesson page let me

expand this

you will see that the lesson after this

one is called using

it from using this heat staging area

that lesson is one that i plan to skip

uh because it has quite a bit of an

overlap with the one that we record

so if you feel like uh that you did the

exercises on the basics

and you feel confident and if you want

to try something new but it's more or

less related to what we did as

to refresh i encourage you to do on your

own time the

um this lesson here but the next time we

we come back to this series we are going

to be working with one of the most

useful lessons and doing things

in git and and

uh yeah so that's that's the end of uh

of of today's meetup and i would like to

announce

that i'm looking for volunteers to leave

the meet up next week because i'm going

to be on a vacation

so it's an opportunity for anyone who is

interested

to talk about you know like a topic that

is outside the

you know what we've been covering or if

you're interested in it you know you are

welcome to start with a lesson

um and doing things

okay so with that i thank you all for

being here

we'll be in touch on slack

thank you
