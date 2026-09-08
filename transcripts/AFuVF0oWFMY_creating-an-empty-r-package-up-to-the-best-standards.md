---
type: Video Transcript
title: "Creating an empty R package up to the best standards"
description: "[Music]  I am about to create a very small art  package and I would like to show how to  set it up uh you may have your own ways  but here I'm going to be um yo"
resource: "https://www.youtube.com/watch?v=AFuVF0oWFMY"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=AFuVF0oWFMY"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

[Music]

I am about to create a very small art

package and I would like to show how to

set it up uh you may have your own ways

but here I'm going to be um you know

just uh doing what I usually do here so

I have my you know G um folder in my

system where I keep all my repos there

and um so it is from there that it's it

might be convenient to you can pop up an

our session uh and create repo so I'm

then I do uh I mean I'm going to you can

see me using use

this use this column column for to call

to call functions but because I have

used this already in my uh R profile

um uh I can show you edit R

profile uh you can see that I already

have uh used this use here right in line

three so I don't really need to call uh

library because it's going to be um

available in every session that's that's

the point so I'm going to be using

direct directly create package and I'm

going to be calling it

tilt uh

polish um so now if if you see uh we

have you know a til

polish folder host just created so what

do we have here not much but you know

what defines in our package basically a

description file and then we have a

couple of other other things so one

thing I like using as a studio uh our

studio is use our studio uh we'll simply

add um you know this little um dot uh

Aro file so now I can navigate to that

uh so that's the uh you know way more

convenience so now now people is uh

using and loving uh other ideas um

but uh I'm going to stick with what I

use the most and uh so we were looking

for uh til polish where are you here H

so now with this little bottom we go

there so then I'm GNA be adding the very

minimum infrastructure but yet I want to

kind of start uh on the right footing

here so if I start uh you know running

rcmd check we can check it from here or

many many other ways uh we'll see that

what we're missing to begin with is a

license so I'm going to uh do use the uh

well usually use the MIT but in this um

family of repos of packages we are using

a gpl3 license this one gpl3 yes that's

right and

um uh so now if I rerun rcmd check that

warning should go away um so um I think

with this uh well know this is not a

repo okay good so we need to do a a git

uh in it or we could use use this also

it has a function called use git so as

you can see now my rcmd check is clean

so I'm kind of ready to add everything

to my station area and create a commit

something like

initialize

empty package and if you're using fledge

which I love a lot so uh you can do a

little asies got a little minus here uh

to indicate that you want to add this

commit message to the um change log so

we're going to be exploring that in a

minute so uh I I did one meaningful

change so let's do

FL uh bump version uh let's see um

if um I think probably we need to add a

little bit more infrastructure here so

let's do to uh let's start with setting

up the the repo on GitHub so again you

know you may have your own ways but I

really like the

GH the GH

CLI so actually let me show this a

little bigger uh so GH repo create let's

do the source that we have here and

let's push this on a

public repo and what I did forget here

though I'm going to canel that is to

indicate that um the repo that we want

to create is uh in is not in my user

account which could be the

default is in my work account polish so

we need to specify in this that case you

know I want to specify the repository

because and I want to push it to my uh

organization's or

um um yeah to my work organization so if

I do a GH B here now it's going to be

very boring because it doesn't have a r

me file so the very thing I would like

to love is to add such a Ry file so

let's do a Ry rmd and uh that should you

know pop up that

um that uh rify here now it's a bit too

big for you um so basically i' like to

say you know what's the goal of the p is

to

um uh is to polish till

data the installation is going to come

is already prepopulated because you know

use this is super smart to do that um I

don't typically use that um um kind of

introduction to the section example and

here uh we need to you know add

something later but we still don't have

any function so uh the rest is something

just here for an example we're going to

render this it's telling us uh that

there is a problem here and that's

because the package itself is not in

installed and R me nit set so what we

need to do then is to you know basically

install the package we can do it from

here or in other ways maybe with pack

which I love so with pack you could do

uh local install to install that package

and if he has any dependencies you will

also try to install the the dependencies

as well so okay yeah we're going to say

here going to say yes um and and now

we're ready to render this rymy this

should you know pass uh show you that

you know the the Ry has been rendered

and now we I think we are ready

to Let's see we have all the infrastruct

there

um add so by the way I'm using oh

actually I made aake there let's amend

this so

uh me yeah there we go um I'm using lots

of little aliases which I think speed up

the word for a lot it's a lot less

typing a lot more um work done for for

you know how tie my my fingers get so I

think it's it's worth investing in

learning and using some of the at least

the most common itas out there um so I

think we're ready to push so this

generally it's a bad idea to push to

main but because we have no feature here

I'm also not dog dogmatic at all um so

um for more than I do create tiny little

CD pool for myself H I still you know I

don't think that I could need a whole

cycle of Po request for just to push a r

file to an empty an empty repo so okay

we have the repo there we have a little

um a little r me file so what else you

know could we do to set up you know this

package for Success H one good help

comes from use this use upkeep issue uh

so just that you know we give us a

little bit of a road map to know what we

could do um to kind of set this this

right for Success so there's a bunch of

things so one thing we could do is to

add the um GitHub links so we're going

to be simply copy and pasting that into

our console to everything I'm going to

say yes you know trust this package so

um

um

use uh DH links so uh here uh the r is

ahead let's see okay I need to probably

push something here pull something

here that's weird no I don't have

anything on GitHub so let's see how we

are

here um get

push oh okay because the commit was

already created I think uh second thing

we can do is so I'm going to check that

box is to use package down of course you

know the website is super useful

actually I do expect a website every

time I go to a package and when I don't

see it I get frustrated uh so I'm going

to do that favor for

myself and uh so you see that all the

infrastructure has been added there we

don't need to change anything really uh

webite the defaults are a very good

start H so we're going to push that to

the to GitHub and in a moment we should

see here somewhere a URL you know when

the when the website kind of builds um

we want to probably tidy description

it's funny that you know it's not tidy

if um if the repo just started I wonder

what changes that would introduce if any

it did change something so it looks like

the those URLs it's funny that you know

they added by by default in not tidy way

but anyway so we

tidy we

tidy

description let's push that let's push

that too H so we're going to be know I'm

going to be more um Dent with my Pro

request once I actually did have do have

the right infrastructure but for now I'm

just pushing to main uh actually it's

good a good idea to block pushes to main

uh so you can do that on the settings on

GitHub but I'm not going to do it for

now because I want to I want to get gain

that speed so what am I doing here I'm

adding this kind of package little piece

of documentation where you know you can

say something about the package but you

don't have to it's a good place to add

what kinds of functions you're going to

be importing from different packages so

now we have nothing so add package level

doc um and we can check that box too uh

then well we're going to be testing our

package of course so we need to use test

that for that uh let's add that

infrastructure here you see that you

know if I add that you see that there is

description file was modified and

the set up file in the test directory so

um in the description file um you know

we are suggesting test that and and

using uh test that edition three so

that's what has been added automatically

uh for us so use this use this okay so

let's push that and now

uh align the names okay so this is a

recommendation right we don't have yet

any function um actually I do have one

that I want to add so kind of to

demonstrate how that works so B

basically whenever you want to create a

new function this one is going to be C

called

um summarize range we can rename this

later uh summarize range

summarize till range for now um so you

can see that he created this R file

which lives in my R directory if I hover

over this you can see where where it's

living but then also when I do use use

test which is probably the first file

I'm going to be working on you know when

I you know when I I kind of design the

first test um works the first test for

my

function uh here I'm going to say uh for

now I'm going to do a

skip a skip with f uh too uh so that

should remind me or um actually stop I

think that's a nice thing to do if I say

oh actually skip just going to show you

what it looks like so if I now run my uh

tests for this package uh then uh the

test will pass because uh there is

nothing there but also you will see this

to do right so I think it's a good way

to REM remind myself that I need to do

something there so

uh add infractor

for

new okay so now the next thing we're

going to do we also pretty close to the

end which is pretty amazing how quickly

uh you know these days one can do a

package that is you know already in

pretty good shape really better than

most packages out there so code of

conduct requires details

in the first argument so here we can say

gmail. let's see if that works it looks

like it did so that's the code of

conduct uh code of

conduct I'm Miss D there and what else

we're almost

there uh if we have pictures you know we

need to remember to probably add um to

add an alternative text so that me know

people with uh uh you know can read

those with screen readers that's awesome

uh you have

with this this uh workflow I think

that's the last thing we we're going to

be

doing um okay

so that means that now our package is

going to be checked uh so actually for

this uh kind of to show how that that

works uh maybe I'm going to create a

branch

ad uh

CI so

here uh

R sorry R

CMD

check on GH

actions H so now uh read me apparently

out of dat so let's go to read

me and uh rerun it render it I mean it's

kind of funny that I don't want to add R

me in the same C right so we're going to

do uh commit for R uh uh

update

update and why it was it changed because

um everything so because uh you know

when you are the workflow you know a new

label is added added to the Ry file so

you can see what's the status of rcmd

check on G actions but um um but yeah

like the focus of our of this PO request

though is the GH is the the workflow

itself so we're going to put it in a

different commit and what we say is uh

add um check

standard Yo which you know I know that

that means uh adding this this workflow

so I think we are now ready for

the uh to create a

PR um and uh so this actually happily

will close this issue which is the

number one uh so because it's the last

last thingy that we need we need there

so we can say that uh we can say

um if we add this pound then the issue

is going to be expanded so I'm going to

show you that like the title of the

issue is going to be expanded so I'm

going to say um

close number one so on GitHub when we

you know submit

this

um GPR view on have on the

website we see you where it says close

because I did add that atic there

instead of seeing number one here we see

the entire link to the to the issue

which is really nice um and now because

the let's see so the here did we

actually do that specifically yes we did

that so I think it's it's accurate to

leave those bullets in in here too and

now you know just because I'm a little

picky I want to make a proper uh title

here because that's going to become my

commit message so I want to start with

in the right footing so we can see uh

what the checks are looking oh sorry the

GHP checks to see what the checks are

looking like uh of course they are now

in progress but I'm going to pause the

video and come back in a moment to show

you that when when that's all green and

then mer the proof request and and I

think I'm going to be done for now

I'm back here but I'm probably the

checks didn't uh complete but uh in the

meantime let's see oh almost there well

the did complete so let's um what I

wanted to show you is is this so by the

way I'm I'm using our studio on uh

inside a Docker container and that's

running locally on my system um why

would you do that I mean typically you

know you do that maybe because we using

our studio from a remote server maybe

somewhere where other colleagues have

access to and so you can collaborate

more or less on the same things having

access to some files or data but the

reason I'm doing this is because I like

to keep my my own local system as as

kind of um unpolluted as as possible and

you know all my my software to be as

lightweight and replaceable as as

possible so um so here what are what do

we have here let's let's pop up a

terminal um and going to need if I do

Docker um PS and if I show you my

running

containers and I you can see that there

is this container called R um

4.4.0 which actually is a little behind

because now we are on R

441 so that is what's what's running

actually my uh was you know the engine

of my R Studio here um and the fact that

I'm bit little behind doesn't really

bother me much because now we have rig

uh andry is an amazing package in the r

leave um ecosystem let's do a little new

terminal here so re

um available so I recommend you look at

it maybe I'm going to do ourly uh R to

see where that takes me yeah the

installation manager so I recommend you

have a quick look at this it's super

amazing you can very quickly switch um

between different versions of R uh um so

now you know I could try devel with you

know would be R 4.5 the one that is

going to come whenever it comes um or

4.4.1 which is the the current one um so

for example that would be

rig

run um

R next I think and there you go so this

could be version 4 4.1 right whereas on

my um normal R session I think I was

using 444 zero but although I see that

there is a one here so let's see I don't

want to cheat let's see if I can do if I

can switch to a different version uh so

re um which versions do we say we have

available the

four um maybe the Val I'm going to show

you if I can reach the B so re run no I

mean the fact that they are available

doesn't mean that I have in my system

you have to add them to have them in

your system but let's see R runel yeah

there you go so this this is

our uh it say unstable so that's what's

going to be coming for our um 4.5 right

so pretty amazing isn't it that you can

very quickly switch between versions uh

so where were we so let's let's check

GHP checks and what was the stat of

things okay all checks pass so we can do

a GH PR merge so I I like to squash my

PRS and also delete the branch on GitHub

so everything kind of stays

clean H and now I would like to see

what's happening with you know what

happened with my

Fletch uh let's so you can see how you

know my my my Branch changed

automatically to main because I asked

the GH to close the the branch that was

holding the pr so now if I do

flet bump version let's see what

happens oh now works I know exactly what

you happened before so by the way this

is by by gentra they have amazing

packages one other package that I like a

lot is DM but there's a ton that you can

get from there so uh now um basically

the whole thing here is um to

initialize the package right uh I think

that that would do it let's leave this

clean and now uh we're ready

to to call so with Fletch that's how it

works so first you call BM version you

get all the infrastructure for that you

need like a new fight if you don't have

one you know prepopulated some of the

messages that you can type you have this

beautiful you know description of of the

version that you are now standing on and

the date where you added the changes and

then you know you get also prepopulated

on the console the next command that you

need to run which is you know fledge um

finalized version so if you do push

through which is the you know what what

comes with that prepopulated command

that's going to be gone to to kab so

that's amazing nothing else that you

need to need to do uh so by now it's

it's possible that our little website is

already up and running so let's see uh

let's go to my my polish here yeah I

have that URL there so if I click there

you can see that my website is there uh

there is a reference and the change log

will appear that here once the the you

know the last commit that I pushed to

GitHub actually you deploys the website

so it's it's here it's working you know

that that fled created that bu version

commit but it's still working on it so

this is the workflow that is going to be

responsible for creating that website

which is still not not there so that's

the only reason why you still don't see

the the change do but you will see all

right I hope you enjoy this you know

super a quick demo of you know what it

means to create a quick package today
