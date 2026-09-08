---
type: Video Transcript
title: "Working with Git and GitHub from RStudio (part 1)"
description: "Idea today the features from github that allow us with git and github and i i know that everyone here already uses in the interest of being on..."
resource: "https://www.youtube.com/watch?v=h6koYxwQFuE"
tags: ["ds-incubator", "git", "github", "workflow", "pull-requests"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=h6koYxwQFuE"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2020-08-18T00:00:00Z"
    usage_count: 55
usage_window: { from: "2020-08-18T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

starts okay so the idea today

is to refresh

the features from github that allow us

to work

with git and github and i

i know that everyone here already uses

git and gimham

so again it is just a bit of a refresher

mostly

in the interest of being on the same

page for the upcoming

workshop that is in about i think two

weeks or ten days from now

uh so the as usual and i'm

uh collecting the

the steps and thoughts that we're gonna

be presenting today in a google doc

that has the date of today and then dsi

so you're welcome to

go to that now or after

but mostly uh given that you know we see

few people here

i'm i'm going to

focus mostly on the value of this meetup

as

it will be in the in the record so

basically

i'm gonna go be moving uh with the

assumption that we all know this

material

just refreshing it and leaving a

video record for for the next people to

come

so uh the objectives for today is

basically to practice

pretty much as many features as we can

that we can access from our studio to

work with git and github

and the very first thing we're going to

do is also to

uh show how to set up your

um rstudio project to submit pull

requests

during the workshop because um you know

the idea is that some of the things that

we will be doing

uh will be great enough if we can push

them

as pull requests to the workshop

repository

so the idea is that you not only will be

learning concepts but also will be

practicing many many many times this

workflow you know how you work with

github in collaboration with others

so this is one of the objectives of

today set things up so that you're ready

to go

for the workshop uh also we are gonna be

you know using

github from our studio so we are going

to be doing things like ignoring files

removing files reverting files

adding new files that didn't exist in

that git repository modifying files that

did exist

creating commits amending commits and

finally submitted a polite way so

basically

all the most common tasks that you need

uh in your everyday life and to

collaborate with others

and it's totally okay and i do expect

that people develop different

preferences for different tools

so some people may be using a specific

client others will be using the terminal

but today i will focus just on

everything we can do from our studio as

a way to demonstrate you know the kind

of the minimum toolkit

that you need um to you know work

productively and then anything else you

can see it as an extension

so in terms of setup you know we have

discussed a setup that is

uh very well documented in the book

happy git with

r so i have here in this stock i put a

link to

the most common remote remote setups and

the one that i have been um

stressing is referred to in that book as

the

fork of theirs setup but there is many

more

the reason why i advocate for that is

mostly because

it is the most flexible and you can

contribute using that setup

either to the two degrees investing

organization or

to uh you know repositories that are

managed by completely external people so

if you know that setup then you you are

able to do

everything but that doesn't mean that it

may be the only setup

and as alex suggested recently uh maybe

for some

um the most for some people the most

useful setup might be a simpler one

in any case they are all documented at

that link so i encourage you to go there

but my only kind of warning is that when

you do not use

forks you have to be very careful about

how you manage

on github the permission levels of the

different people working in that project

and you have to take care of protecting

specific branches like the massive

branch so that you know people

cannot push by accident uh changes that

are not meant to be there so again

rubbing up you know the word recommend

is kind of the safest and then it's very

hard to make

harm to the project uh accidentally

as opposed to other workflows that you

know if you

you know don't pay attention of you

don't set some protections in place

you may be committing some accidents

that that then is kind of hard to enter

but you know jumping into the activity

itself

uh as use uh just to confirm can you can

anyone give me a thumbs up if you're

seeing correctly my screen you should be

seeing this uh

this you can cool

you can't oh okay so i forgot to

share present now your entire screen

sorry for that great that i checked good

so this is what i was referring to here

is the link as usual

here are the objectives that i listed

here is the link that i mentioned to the

setups

and the image that captures the kind of

setup that you know i have been

advocating for but certainly it's not

the only one and you are welcome to use

other setups

is this one where you we fork a

repository from an organization

and then we create connections to a

clone that go both ways so you can push

and pull

and also we carry this connection from

the main repository so we can pull

changes that have been

pushed to upstream how we implement that

well we

use this package with a function create

from github

we can do all of that automatically if

we use the setup that

i covered last week so last meetup

explains how to set up your project

to so that this function just works and

every setup in general

that i'm going to be talking about today

works if

if you haven't done that i encourage you

to revisit a video

that i've recorded after the meetup last

week it's 16 minutes and and leaves your

environment

in in good shape the video is about our

studio cloud but you can reproduce the

same setup on your desktop so

you should be good to go so what i'm

going to do now is

use i'm going to use our studio.cloud

just the same project that i set up last

week

so the very first step then is set up a

project

here i want to create a clone in this

rstudio cloud

project a clone of the fork

of this repository called two degrees

investing

tide eds so this repository the tie dds

repository is the repository that we

will be

working during the workshop so by doing

by running this function now

i create a permanent connection with

that repository meaning that

i will be able to for example submit

pull requests

to it as part of the exercises during

the workshop

so as you can see that function did a

lot of things for me and now

left me in uh inside that project

so once again can you confirm that you

do see here on the left the google doc

and here on the right our studio okay

cool

i'm uh intentionally leaving this as

uh screen split in half i acknowledge

that the

the writing might be a little small but

i do it

that way so that um you now or whenever

you

see this recording later you can use the

left hand side of this screen

to overlay your own rstudio and kind of

follow along so i don't have to now make

poses i would just keep going

assuming that you can follow along and

if you're interested in following up you

can use

this left side of the screen so

the very first thing that we do um is to

create

a new branch uh that's that's always

the case remember in the github

flow workflow branches are

the core at the core of that workflow so

a pr

init initializes a branch so i'm going

to call that branch

zero zero uh my name

or actually just my name should be fine

and

and that is one way of creating a branch

from

the console with use this and the reason

why i do it this way is because it

creates

a bunch of connections that i'm

interested in having

but you could also use the git pane here

you will you know this is one of the

features that i want to kind of

show off of uh you know git features

inside our studio

so by clicking this icon here you can

also create a new branch

it is just that you know like this

little thing like if you want to

synchronize the branch

with some remote and which pro you

choose those are

things that i use this will do for me

automatically

so i prefer to just leave it to use this

so i'm going to just run this line of

code and as you see it is not that it

just creates a branch it does a bunch of

other things

too and more importantly um

creates a connection between my branch

and the upstream branch and make sure

that you know my

now branch has everything that has been

pushed

last minute to the upstream and i also

get a reminder of what to do when i'm

ready to submit my

request which is to just run the

function pr push

so we are already done with this step

the next part of

this little tutorial is to actually

start doing

a bunch of things to this repository

to demonstrate as many features as

possible

of uh that are available within

our studio so the very first thing uh

i want to show you how you know explain

what we have here so this this

project that you see here this is the

files

pane as you can see has another studio

project has a readme file as usual and

then it has this folder called zero zero

setup

so this is the folder of kind of today's

exercise so i'm going to click in it

to get in it and as we can see inside

this folder

there is these two files one is an rmd

file and the other one is an html file

the very first thing i will do is i'm

going to open that

rmd file by just clicking on the file i

get it here on the

on the files on the source pane

and i'm going to make a change to this

file just to show you

um you know what the git pane shows

when you change a file and save it just

to begin with

so the first change i do i remove the

html part and i do github

document so i have changed the file

i'm going to save it and when i press

save one two three you will see that

here

i have now that file appear on the hit

pane so that's another feature

that our studio provides it gives you a

view of

you know the staging area what is called

imagine a stage on the theater

so what's happening on that stage so git

has that stage for you

and it's showing you on the stage now

this new file that has been

your new this fighter has been recently

modified

and the word modified here is key

because

as you can see the the name of the file

is prefixed with an

m which means modify so it refers to a

file

that existed already in the git

repository git knew about this file

and now we are modifying this file that

we already knew about

okay second feature that i want to show

off when when you have modified a file

no matter how many lines you have

changed you can always revert that

change those changes by clicking on the

file itself

with in with the you know the opposite

click right or left depending how you

set your mouse

and you can navigate to the revert icon

and when you click there

it's going to ask you to confirm because

you're going to lose those changes if

you say yes

you clear in this case that file

disappears from the staging area as

you can see the file the change that we

did has disappeared right

so that's another feature of our studio

or of git that is available from our

studio you can revert

changes on the stage in aria but i do

want to do that change so i'm going to

do it again

so actually i do really like the github

document file format

i prefer it over the html format

and the reason is because uh neither the

rmd

nor the html files render in a useful

way

on on github so let me show you that and

at the same time i'm going to

demonstrate

another feature of git that is available

from our studio

so uh but before doing that

let's well actually no i can i can do it

now actually i'm gonna change in the

document the order

of the things are expected to show

so it makes sense so i want to show you

that when we go to github

this file with extension rmd and html

none of them

is very useful really so

one feature that you have on our studio

to navigate to github very quickly is

this little icon here that is very hard

to notice and

it's very easy to miss so when you click

on that drop down

you have an icon that says view the

current file basically the file

is opened on on your source pane

you can click there and that will you

know take you to the browser

specifically to that file on on github

so as you can see this i am now standing

on you know the

main repository not on my fork it is

showing me that file

and as you can see what i see here is

just the source code of the file

but it is not showing me any output of

the file and the same thing happens if i

navigate it back

to the parent of this file and now into

the html version of this file

again what you could be seeing is the

source code of the html file with all

these tags

that are horrible to read and again

although the output is there i don't

i can't read it i mean it's horrible so

let's forget about those

uh those files let's instead work with

github document so that's why i changed

this to github document

and let me show you what it will look

like when we click the neat button

that's not a feature of git it's just a

feature of our markdown so we click

there

i'm going to produce that render version

that combines you know the source code

is run and then the output is presented

in this in this file i mean this might

not be surprising to you because you are

already familiar with with this

so here we have like an html preview of

it

but it is um this also generates

a file with extension md and md

is a file that github knows about and

can

interpret in a beautiful way so not now

because that file doesn't still exist on

github but by the

by the end of this little demo that i

will have pushed that

file to github and then i should be able

to see it

and show you how on github i can not

only see the source code but also the

rendered

version so that's a lot more useful

because when you are trying to

communicate your signs with others

the others should be able to see what

you did

without them needing to run any code you

know if the file

combines the input and the output then

they don't have to run it if they choose

to run it it's a different thing but

they don't they shouldn't need to run it

to understand what your code is doing

so the next step um

is to re to reflect on what we see on

the

staging area on the git pane remember

that when we changed

a file that git already knew about it

prefixed it with the m

icon right because it was a modification

to a file

but now also notice that uh the file

with the name untitled.html has a d

and it's gone from what's called the

working trees gone from

our our folder why well because the

github document

by default looks for a file much in the

same name and if there is an html file

it will remove it

so we have this new icon

now that means deletion

so the d comes from delete so this file

has also changed the html5 has changed

and it is not any change it is a

deletion so that's why

it is prefixed with the d and then there

is this other new

icon that is new for this tutorial that

is a question mark what does it mean

okay

the question mark means that git does

not know

about that file yet so the file is now

in our project but it's in our what's

called a working tree

and it's not on that stage git is asking

us with this question mark what do we

want to do

about that file do we want to include it

or do we want to

remove it what do we want to do it

doesn't it won't track it unless we tell

it to do so

so notice that when i do a click

the icon to add that file to the staging

area i'm asking it to put it in you know

in that theater station area

then the icon changes from the question

mark to a a means

addition so by clicking that box we are

explicitly telling it to

try to start tracking that file so there

is another icon there

a but even before i do that i want to

show you

another feature of kits that is

available through

our studio which is the ability to

ignore files

because the html output uh has been

it's not very useful to the point that

they

and the github documents by default

from moveset what i'm going to do is i'm

going to ignore that file

so that uh i will never kind of add any

change to it again

accidentally so how do i do that okay

there is a bunch of ways of doing this

but our studio provides a shortcut so if

you

right click or left click depending on

your mouse settings

you will see that there is an option to

ignore

so you can click there on ignore and you

will be presented with this little gui

with this little interface

that shows you that there is this file

that's going to be created

under this directory in the same

directory where we are standing now

the file is going to be called dot git

ignore and

it is going to contain this line

basically the name of the file that we

want to ignore

so if i click here in save you can see

that

now git has

noticed that there is this new file

under the zero zero setup folder

called dot git ignore that has you know

been added to my working tree but

again it's still not in the staging area

so i have to tell you what to do

another feature of kit available from

rstudio is the ability to quickly

inspect a file

from the staging area so if i wanted to

know more about that file i can go here

to open

file and that will now appear on my

source code page right so as expected

because that was the preview that we got

before

uh if the file is called get it don't

get ignored it is

stored under the zero zero setup folder

and the

all the contents that it has is the name

of the file that i want to ignore

if i wanted to ignore more files in that

directory i could continue

writing their names here manually if you

want but i recommend you to find

automatic ways to add files to git

ignore so that you don't commit

make typos for example so let's close

that

the next step uh is the following

so so far i you know i have you know

achieved

changing the the file um

untitled rmd to output

a github document which is what i want

but

um the name itself untitled

is not very meaningful so you know it

would be great

if you want to practice with this for

you to change that file

to something that has your name and then

submit a pull request so what i would be

asking you to do is

click here for example that's one way to

change the name of the file and click on

rename

and then here you say something like in

my case

right so with that change then

this other two kind of products

of having needed the file before i

change its name

these two products become kind of

obsolete because they have the name

and title which is the name that you

know the file had before so what i'm

going to do is i'm going to clean up

the working tree so by when i before i

do that i want to pause and reflect on

the staging area so again

i i recommend you to become friends with

the staging area because it can give you

very useful information about what's

happening in your project for example

i'm ready to delete these two files so

let's have a look

at how these files show on the staging

area and let's reflect on the icon that

they have

and what information that tells me about

what's going to happen with those files

so let's start with untitled.md which is

this file here as you can see this file

was never tracked by git

it only appeared after i changed

the file untitled to become a github

document

and only when i render it by clicking

the lit button

so that file has never been added to the

staging area and therefore has a

question mark

icon because git never knew about that

file

if i remove it now there what would you

expect it to have

well it will disappear from the staging

area because git

never knew of it and now i'm removing it

so as far as git can tell it never

really existed

in what it is the git repository so a

git repository is

something inside your your project

inside your folder that is keeping track

of specific files that you

you want to track so if this file has

never been added there

when i remove it for example by clicking

here on delete

that file will not have a d prefix it

would be just

gone it could only have a d if i have

ever

added it and committed it to git

but if you never committed it it will be

just gone okay

and the same thing with untitled files

which is a folder that you know

need they need process produced that

contain some you know figures inside

it's not important now so all i want to

do is to remove it and again because it

has never been tracked by git

when i click delete i expect this line

to just disappear

let's see if that happens let's remove

it and it's gone

okay so again the staging area gives you

information about the status of your

files

and how it relates to the last known

commit

okay that is what all that you know

kitties do

but now we do have some stuff that i

care about i have this file

um that now has my name

and i would like to produce the output

for this file so i'm going to

click neat to produce the md version

of this file now that it has my the name

that i wanted it to have

this is the preview i'm going to close

it

so here now you can see that the

knitting process has now produced

uh that md file so that md5 when i click

on it

opens up as an md file here in the kind

of

source code mode but as soon as i click

this preview

button it will transform into the thing

that you know we have just seen it has

it will transform into the render

beautiful version that we would like to

push

to to github so that it's available

there

by the way when you meet for the first

time on our studio cloud

it may ask you to install a package

called

tiny text if that's what you get go

ahead and say yes and eventually you

will be able to

to produce the app so my preview also

produced this file called

maurolepore.html

and that's not a file that i want to

save again you know the html

files i i don't want them and one way i

could kind of ignore

all htmls could be to change the

the git ignore file this one here

i could open that file and instead of

saying okay

forget about untitled html i could say i

could say something forget about

anything

html and i hope that that will work

let's see i save that file

and actually still have it there so

let me let me use a trick from

well i expected that to work maybe i'm

i'm gonna forgot how how that oh or

maybe i need to refresh let's see

there is this refresh um thingy here

so the staging area is not updated

immediately sometimes you have to kind

of refresh it

and here you go now the file mauro

lepore

dot html is gone so good to know right

that uh you know this file is here but

it doesn't appear on the staging area

right and the reason why it was

appearing before is because i hadn't

refreshed

so notice that i have changed the git

ignore to

take a pattern now not just the name of

the file but a pattern that will match

any html so

we have ignored files we have view

files um the last and we have renamed

files okay so now the next thing we need

to do

is to create the commits and push

so let's do that and we have probably

just about enough time

for for for that so

the what i'm going to be doing now is to

create it is to create

a i'm going to create two commits but

the first comment i'm going to create in

two steps to show off

one additional feature of um kit from

our studio which is the ability to amend

commits so i'm going to start by

adding the git ignore file so i i click

here on the stage

on the box here that creates the stages

that file and then on commit

that will open this interface and i'm

going to add

a message related to that commit

something like

ignore html and i click commit

okay i have just created one commit but

now suddenly i've realized that there

are other changes related to that

previous commit that i would like to be

included in the same commit but what do

i do because i already did the commit

okay let's let's fix that so if i

find that for example this file

untitled.html

that's a file that i've removed because

it's an html and it's a similar

problem i did that to solve a problem

that is similar to the one

by which i created the previous company

it relates to the idea of removing and

getting rid of html so probably

a good thing would be to add that to the

staging area to create commit

and instead of creating a new commit i

can amend the previous commit by

clicking here on amend previous commit

as you can see when i click that box i

get the

message that i i typed last time right

so what i'm going to do is to amend that

message by saying ignore

and remove html so now the previous

commit is completely amended and became

one commit so i did one commit but in

two steps right by first creating a

commit and then

amending the previous one and as we are

here

let's continue to work on the um

on the staging area so

there is other files that also relate so

all these other files relate to the

problem

of renaming the

untitled file to use my name so if i

click

on this file that you know is the old

name that if i had

and now the new name that the file has

noticed that first key things that are

two different changes but we know that

instead it was every name

so when i click the two of them remember

this was

so untitled was the older name and then

i renamed it to mauro le por

so when i staged the two then git

realizes

ah okay it was a rename action so now we

are presented with a new icon that so

far we haven't seen

which is the r the r stands for rename

so that has renamed

a file right and now git knows about

that so here i can create a new commit

that says rename

file to mauro

and create a commit and probably the

last commit

uh is something related to render

the github document

and with that i have you know created

three commits

each of them is independent from the

others they are each of them

meaningful on themselves and i can kind

of inspect now the history and i can see

you know my three commands one

two three these are the three commits

that i did since

i i pulled since i started this pull

request so i'm now

ready to finish this thing but remember

there is a hint here i just need to run

the function pr push

and that will send me to the web browser

uh

to the interface where i can actually

create the pull request on the

upstream repository so it takes me to

the main repo

it shows me this interface here where

you know my my branch

zero zero liquid from the repository on

my fork

and you know i want i have some commits

there that i want to propose to be

merged into the master branch of the

main repository so that all looks good

i create create pull request and

that is what we have accomplished so

with that

if you are able to walk through this

video and the previous one

where i show you how to set things up so

that you know i use this just works

you will be ready for the workshop and

you will be ready for working with

uh minimal friction in in every day

that's the end and i have gone three

minutes beyond the

the uh the the mark so do we have any

questions we hope before we say goodbye

good just quick question from me

did anyone learn at least one new thing

that our studio has that you thought oh

actually i didn't know that you could do

that on our studio

cool

excellent

mm-hmm there you go yeah

yeah yeah i said as any any other two

you know the two itself is is uh it's

not

uh exciting uh it's interesting i think

because it's a tool that we

we have there we have to use because i

mean we have to i mean

a lot of people use our studio so

sometimes it makes sense to use other

tools and sometimes you know it's

something

that you can do just from our studio so

my

goal was to give you the minimal toolkit

that you need to work effectively

and i do encourage you to to work with

whatever tool that you prefer

with that i thank you very much i also

apologize to the next uh

to tiger and alex for for bumping into

their meeting

bye bye

ciao
