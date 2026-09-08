---
type: Video Transcript
title: "Remote setup: Fork (of ours)"
description: "today we continue and we are getting  close to the end  of uh this series about working with kit  from the terminal  and what i'm saying we're getting close  to"
resource: "https://www.youtube.com/watch?v=Q9S7CvXu3KY"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=Q9S7CvXu3KY"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

today we continue and we are getting

close to the end

of uh this series about working with kit

from the terminal

and what i'm saying we're getting close

to the end i mean to some of the lessons

that or some of the yes some of the

chapters that we're following from a

lesson from

a co-refinery um we've seen everything

all the way to

sharing repositories online and i would

like to

talk one more time about sharing

repositories online

before we go to the last meet up about

inspecting the history and the reason

why

i wanted to cover one more at a time is

because it's kind of the

most important aspect of what we do

when we collaborate with git

and um it's all under that this umbrella

of you know working with a particular

pattern or a particular workflow and

that is called the github workflow when

we are familiar with it it is

the idea of having just a single

long-lived

branch called main or called master or

something like that

and then having tiny branches

that are short-lived where we add you

know some specific change and then we

merge it

via something that we call pull request

so that's

that's it i'm going to close that and

last time we talked about

one particular setup for

the remotes that the book

happy git with r calls ours so they gave

this name

to this specific git remote setup

where everyone in the team has access

to the main repository and by access i

mean that they have

the privileges to push directly to the

master branch of that repository

so that is the case for all the

repositories that we work

and it is the simplest remote setup

that we can have that gets the job done

uh you know i used to be a bit resistant

because i didn't understand much about

you know how we could um keep

uh the main repository clean by setting

one option that automatically deletes

contributed branches but now that i've

learned that i think i endorse every

every time more

the idea that alex has been kind of

pushing for a long time which is the

idea of

just keeping you know one main

repository and instead of creating forks

pushing pull requests directly to it

always

you know in the github workflow you

never push to master you push two

branches

those branches travel to the main

repository via pull request

but there is two options the option that

we discussed last time and i showed an

example

where you have this setup called hours

and the setup that i would like to talk

about today

to expose its complexity and i still

think it is it is great for some

circumstances but i'm

every time more convinced that for what

we do maybe the simplest approach

works perfectly fine today i want to

talk about this more complex setup that

is called fork of hours

and many of us you know use it and you

have to use it when you work with

collaborators

that are external from two degrees

that is because with this specific uh

workflow even if someone does not have

privileges to push

to the master branch of the main line of

development

they can still contribute code

that is because they create a clone of

the main repository into their own user

account

and to that thing we call a fork

and then so that that would be this this

line moving to the right

and then they create a clone of their

fork

locally into their computers they do the

changes that they want to submit

they push those changes to their fork

here and then they submit the pull

request

back to the main repository

so again that is a must when people that

want to contribute

have no the privileges to push to the

master branch of the main repository

but it is optional in our case for

example where we all

have uh or generally we have access to

push to the master branch

so what we we do is we create branches

we submit pull requests

but directly through to the main

repository so they become simpler

but i wanted to talk about this workflow

because it is important it is useful in

some days

in some cases as i said it is the only

way you have um

to get your your job done and also

because i continue to learn

things about the complexity of this um

setup and and today i was kind of stuck

in something i can

actually learn something new uh and in

that complexity i have been pushing for

for many sessions now the idea of

abstracting those low level details that

creates so much friction

by finding a tool that works for you and

automates some of the processes that

otherwise you have to kind of keep on

your brain

so those tools are things like for

example if you use r

maybe they use this package that's a lot

of these configurations automatically

for you

or if you use the command line

application called gh

gh stands for github it is a common line

application that you have is developing

and it's working

great and every time every day is kind

of getting better and better

uh same thing you know it does a lot of

these things that you know it's really

complex

but if you use a tool they just you know

alternate all those processes for you

so um the idea

that um that you can so the

the most important idea that um

creates some friction in this complex

setup is when you know you are the

maintainer of

uh you know the mainstream repository or

you are the reviewer

or that repository and someone

contributes a pull request from a fork

so when or even you know when it still

opened the discussion and if you shoot

or not

add changes to a pull request that you

didn't create

when you do and i often do and you have

to have that connection you have to have

access to push changes to

a pull request that is hosted in a in a

fork

and that is not trivial that requires

some um some specific setup

that doesn't come by default and you

have to do

a few a few things to make that happen

so that's why

um you know when you go to the the book

for example happy

with r uh eventually you see in in the

asp

in the part where there is patterns for

everyday kind of git life

there there's a section that points to

this one have documentation

that says how you could uh actually do

that how as a maintainer you could push

it as a reviewer you could you know push

commits

to the fork of someone who has

contributed code

and the idea is very very simple it's

just that you go to their fork

you get the clone link and then you

create a new you you clone that directly

from their fork

into your computer and and because you

have access to the main repository too

automatically you gain

access to push directly to their pull

request

on their fork but that creates um

basically generally you have your own

um clone as a maintainer as a reviewer

and then you're working on that one but

then you know if you have to do what

these instructions say you end up with

another clone

somewhere else in your computer where

the remote origin

is pointing to the fork of that

contributor

so that is possible it is very simple

and it just

works but um it's kind of like

i don't know hockey or something so

you're welcome to come to this

documentation to convince yourself that

what i'm saying it's actually you can

try

but what i recommend instead is just to

use

the tools that do that um all those

connections in in a way that it feels

very very fluid

so i'm going to demonstrate that because

so far has been a lot of

talking and very abstract so i i would

like to you know

do a little example with this repository

called demo

we have it there in the two degrees

investing and it is not important to

know what this

repository has it's just you know one

way to show you

the tools and to show you the workflows

so i'm going to move

this um this browser to the left

and here to the right you will see uh

that i'm pointing to exact same

address except that you know the browser

looks a little different because here

i'm logged in as

someone else uh so in this

account um i uh so the

on the right actually it is a uh i'm

logged in as

someone else and uh here i'm gonna have

um

a fork i have a fork of this

organization so let me expand this so

what i'm showing

you here again is that um you know i'm

accessing

this repository to which this user

called mauro aleppo

happens to be me wants to make changes

but this user has no privileges to push

commits to the main line of development

of this repository so we are kind of

pretending that it is an external

collaborator or someone that is not

in the traditional organization or it is

but

has for some reason no access to push to

master

so this person

has has a fork i believe

yeah there you go so this is the fork of

this person so we can go there

right and that's this is the page as you

can see i'm now

on the repository that has the same name

of the repository but

it is on the user account it's not on

the two degrees investing and you can

see also here let me make this a little

bigger

you can see that we have a reference

here that says fork from

today's investing demo right so this

user

right goes to a file and changes it so

let's say that you know it goes to the

readme file

and they want to edit that file because

they are under fork

they can do it they click here you know

the edit uh

button there and

they can you know add changes to it and

the same thing could happen i think if

they go to their main

repository here github will also allow

them to edit files from there i mean

usually this is the kind of thing that

one could do from the terminal and then

push

but for this example the aspects that i

want to demonstrate on the terminal come

after

this so the first submission of the pull

request is not something i'm interested

in showing too much

because it's something that we've been

doing quite a lot already

so i'm showing that you know this user

they go to the

to this organization uh and to the

repository demo and they look for a file

that they want to change

uh in this case the readme file and they

actually have access to edit it and and

you will see why in a moment so you know

they

add a few lines and say you know buy

whatever

so the reason why is because when they

propose the changes

that change was not gonna immediately

get

to the master branch instead it's gonna

create a pull request or it's gonna give

the user the option to create a pull

request

and as you can see automatically github

has chosen

a name for a branch it has created a

branch

in this case uh automatically but if you

were doing this from the terminal you

know you would have to create you know

the branch yourself

and then add the change that you want

again here i'm just doing the pull

request in the simplest way possible

as you can see we confirm here the

change has been done in this

branch called patched 2 in the

repository demo

of the user account mauro lepore

and you know this request proposes

for this change that you know exists in

this brand

branch to be merged into the master

branch of the repository demo

in the two degrees organization this

should nothing

should be nothing new to you right by

now we create a book request

i'm not going to add any check any you

know message there just to have the pull

request

done okay so i'm gonna move this to the

right

and here to the left i'm gonna refresh

the browser

and logged into an account that has

privileges to do it

just about anything to this repository

so as you can see there is a pull

request there

the pull request is called update readme

right and as you can see this is the

change this is the commit that they did

right so what we're gonna do now is

we're gonna try create um basically

check in

or check out these pull requests but

locally on the terminal

and see if we can push a commit to this

pull request

not a commit directly to um our own

repository to the to the use investing

organization repository but a commit

actually gets inside this pull request

and that is something that

um i believe you know some of us might

have

wanted to do and struggle at some point

so

let's pop up a terminal and the probably

find what i'm going to do is i'm going

to navigate

to that repository that i have here

locally

i'm gonna do a git pull

just to make sure that i am you know i

have all the latest

and greatest um

let me see where i am yes i'm in the

right place

git remote let's see if i have my

remotes configured correctly yes

what i'm going to do now is to make sure

that i have actually let me

show you the branches so all these

commands are something that we have

already visited before so this lesson

should be kind of like a review

hopefully

let's run the command git branch with

the flag minus vv

that should show not only the branch but

also if

there is a connection to an app to a

remote

it should appear here in kind of

brackets and there isn't something like

that so i'm going to add

that with the command hit branch

minus ooh which is a short for apps set

setup at stream or setup stream and i'm

going to say that

i want to create a permanent connection

between this branch

in which i'm standing and the origin

branch

sorry and the branch master on the

origin remote

so with this i could rerun the command

git branch

minus vv and now you do see this

additional information here that

all it means is that when i do git push

git will automatically know that where i

want to push if i am standing on the

master branch

is to the master branch

on the remote origin what does the

remote look like

let's have a quick look again this is

another

review with the command git remote minus

v you can see that in this case the

remote origin here

origin is just a nickname is pointing to

the two degrees investing

organization right so this is the

account has privileges to push there

so when i do git pull actually what i'm

doing is remember is

git fetch to get all the metadata from

that remote

and then a git merge so i'm gonna do git

pull because it's kind of a shortcut

with that i will make sure that i have

you know all the

all the changes that come from the

master branch on the remote

origin but now we want to work with

the pull request right so we uh what i

do

usually you know if i'm working with any

of you on a particular repository

i check uh what's the number of that

pull request in this case the number 21

and there could be no we could do a lot

of things manually but instead what i

usually do

is i use the command line gh which is a

program that you can

install in your computer and i do check

out and the number of the pr right so we

set this number 21

i think i forget forget something here

but did i run gh i forgot to say pr

for pull request checkout 21.

so this gh command line application so

remember this is a series about working

with git from the terminal so i want to

stay in the terminal i also use the use

this package for these actions that

automate a lot of the processes

but in this case i work i want to work

from the terminal so i use the gh

program so i say gh instead of git

i say gh and pr is a subcommand

of the ph of the gh command line

application

and then i say what is the you know pull

request that i want to check out

in this case is number 21. and as you

can see

it has done a lot of work for me and in

particular this

is the one line thing that makes

everything happen

so it has created a reference um

for short it's gonna call it you know

patch two which is the name

of the branch that the user created to

make this

uh commit or to host this

request including in this case one

comment and

but internally it knows that this is a

specific connection to a pull request

right and this is the trick so now

um this uh in this case maintainer

uh could inspect the pull request with

something like for example let's review

some commands that we saw before

we could do hit show to see what is the

last commit

so the last commit um here is you know

the message

and here in green is the changes right

they could do something like git log

one line to see how that one change

at the top relates to the history of

uh the repository right

and let's say that uh they want to add

some change

they want to create i don't know let's

say just to make something very easy

uh let's see um actually i could

actually

edit the same file let's do git view

readme

md with this i'm going to say

i'm going to change the the dot with

say an exclamation mark so that's the

change that the contributor did

i could do git status minus s

to verify that the file has changed i

could do git diff

uh and there you will see you know that

this change

from you know the red dot to the

exclamation mark

so now the next step would be to add

this change to the staging area with git

add in this case readme dot md

and now if i do a git status what i

could see is that that file has been

added

this is that's why it's in green and

finally i could do a commit but let me

first clear this console with ctrl l

git commit minus m

and the message um

[Music]

at bank

bank there you go so now

if i push what's gonna happen let's try

git

push

and this is a bit of the mystery that i

wanted to reveal for you

and the beauty of using a dedicated tool

to do the job because think of the

following if i do git remote

i have only one remote and it's called

origin if i do git remote minus v

i see more details okay the the

configure remote is

the one that is pointing to the reason

investing i have here like no

information whatsoever

that says that i am pointing to a fork

that someone created on their own user

account

and yet when i do git push without any

further specification git

knows where to send that commit which is

to the branch

in the account of that user of that

contributor

that submitted a pull request so let's

confirm that so let's go back to

the web browser here

so i'm going to refresh this uh browser

and

if i'm lucky if things work the way

they should i should see that there is

now a new commit

and there you go so you can see now the

first commit here was made by this user

right in their own fork in their own

branch

and now i as a maintainer in this case i

have been able to extend that pull

request

very fluidly right with the commands

they give commands i

always have been using a familiar except

this one thing called gh

that allowed me to create a lot of

connections that automatically

work and work fine i just added my

commit i pushed and that commit

went to the right place it went to that

particular branch of that

user so as you can see in this

particular pull request

even if you're still kind of opening in

the in the discussion we should we

should not

what i wanted to demonstrate is that

there are there are tools that if we

want to go this way

they make the job fairly easy um

so i think that's about

it i could also demonstrate how things

do not work

if you know we want to do the

configurations manually

uh one trap in which we often fall is

like when we scroll down

to the uh next to the merge button of

the pull request you will see that it

says command line instructions

so when you follow this these

instructions are only

um no they only work when you know you

want to check out that pull request

locally

and you're kind of fine with it or

extend it but

do not push again to the contributor's

fork

but instead you just merge the pull

request locally

and push directly to master branch on

the

ram on the mainstream rep which is

something we avoid we instead prefer to

use

always the github interface to merge

pull requests

because sometimes we also gain the

benefits of a lot of checks

that happen in uh remote computers like

github actions that we know we check

that things work as we expected before

we actually accept that poor request so

with this i'm a few minutes early and

i'm hoping to

i have sparked a lot of questions a lot

of doubts so please go ahead and let me

know

what needs to be discussed here

okay i'll say something sure yeah

maybe in a very short concise way

like review everything because i'm not

sure

that sound seemed like a lot to digest

to me

um so like i'm mostly interested in

so you're using like gh because this

automatically does some stuff

can you describe maybe without getting

too crazy like what is that stuff

yeah that's doing with the understanding

that okay maybe i don't want to do this

manually but i would like

to at least understand what it is doing

yeah absolutely i think

i think it is uh worthwhile so actually

you know i

thought that i understood

how things worked until like two hours

before this meetup that uh

um i realized that i didn't as much as i

as i did and then i kind of value the

more the these tools that kind of

automate

processes so let me show you a little

bit so let's go back to demo

what i'm going to do here is uh git so

let's do i'm gonna use

some shortcuts to work a little faster

i'm now in the master branch

i'm gonna delete the patch branch

and i'm gonna basically

basically and now i have no more

branches uh kind of um

and i have just this one remote

so you know what i thought i could do

is okay fine i kind of follow these

instructions a little bit right so what

i do is like

i basically created by a branch here git

check out minus v

to create the branch and crea and and

check it out

and i can call it in this case it says

moderate patch two i could just call it

patch two if i wanted

and here explicitly were saying master

because it's like well

we want this branch to be to start at

master but it would be the same to not

use it in this case because i am

actually standing in the master branch

so okay fine

i created that branch now what i would

like to do

is to for example set up a remote that

connects

my local uh repository

to the fork of this person so that you

know say okay i know how to do that so

i'll go ahead and just do it so i would

do

git add give sorry git remote hit remote

add and then i would say something like

mauro lepore which is the name of this

user

and start giving the remote url so in

this case it's git

at github.com

demo that's the url so the first thing i

would i would do now is okay now i want

to

fetch all the metadata now that i have

this connection to the fork of this

person i want to fetch all the metadata

so what i could do is

get fetch

and the name of the remote that i have

just connected so mauro

and so far you think it should kind of

look like it's working

so as you see you know i'm bringing all

the metadata that this person has in

their fork

so now i go oh great i know i'm going to

create a permanent connection between

the master brand sorry between the patch

branch locally and the remote

branch patch too so i'm gonna do

git branch minus o to set the upstream

uh between the branch that i'm standing

right now so i don't have to kind of

explicitly say it

and the one on the remote which is in

this case mauro

le pure patch two

so again that seems to be working right

so branch patch two has been set up to

track the branch patch two from

remote macro report so that's all works

fine and now it's going to say well now

i'm going to create a new change

and i'm going to push it and it will

just work

and i can go even confirm that it looks

like it's going to work with for example

let's do git

remote minus v okay i do have

a remote origin i do have a remote

mirrorless let's see if there is

connections between the local and remote

branches so let's do git

branch minus v

oh it looks like it's working so my

master branch is linked to mauro le to

origin master

and the patch 2 branch is linked to

mauro libre patch 2.

so what i could expect right now if i

create a new change so let's say that i

edit

actually i'm going to do an easier

change let's touch a new file called

a let's see the status

as you see the file 8 is there git add a

git commit new a

did status is now clean so now i say

well

let's push now that i have it this

change so let's do a git

log now just to confirm okay so branch

patch 2 has moved one commit on top of

master

right a little ahead so i'm just going

to push it and because i have a

permanent connection between my local

branch and the remote branch on the on

the contributor's fork

i expect this to just work and what i

had what i got

is that it didn't so let me uh there you

go

so here you can see that is

uh you know rejections uh at some point

i got one that says permission denied

um so let's do that one one of the

reasons why it might

fail is because i don't have updated

the metadata so you know i immediately

did git

pool to see if i could get stuff from

that um okay saying that apparently

there is some changes there

that i need to incorporate and fast

forward is not possible so i could do

git fetch to get the metadata

and then immerse git

merge in this case moto

library uh

patch two now patch

two i accept the merge

and now let's see if i can do git pull

and with this i'm gonna continue to fail

um git push so

i tried this couple of times before as i

was trying to learn

and i expect this oh actually it looks

like

let's see maybe it did work

okay he pushed something right but i

expected it to go

to the uh fork of the contributor

and i think that it didn't i have just

pushed accidentally to the uh

not to the pull request i think but

instead i

pushed to let's see oh actually yes it

is here

anyway well long story short

it is very complex and as you can see i

i do not even myself that i work with

this all the time

fully grasp what's going on and even if

i learn a little more i find that you

know

doing all these connections manually is

a lot of work

and it's very easy to get something

wrong and then not even understand what

what what's happening now i don't even

understand what was what's really going

on and why i failed before why i don't

fail now

so with that i hope to it kind of

motivate people to choose a tool

like they use this package or the gh

command line application

that automates all these connections uh

for you

too long of an explanation but anyway

maybe it actually makes the point that

it's so painful

yeah so essentially you're using the

gh command which comes from github which

like kind of

automatically transparently

transparently

does all that stuff than you were doing

yeah like i think it happened part of

what you're the problem with what you

did was like you were

creating a new branch but it was based

on the master not on the like the forked

version and then you had to fetch that

data and

merge it to get it up to date well

before you can even think about

merging it but acceptance is like all

kind of transparent slightly so you

don't have to add the game like upstream

um like these alternate um remotes

which is what like i know you and

jackson

and i've asked jackson to help me too

more than once um but so you don't have

to do any of that because gh is kind of

transparently transparent exactly yeah

so then all the

you know setting up the the you know

fetching

connecting pushing it's all just happens

you know it's great to know it and i'm

excited to kind of

force to learn all these things to kind

of teach them and also to expose these

things i still don't fully understand

but in the day-to-day work it's like

i just don't want to think about i just

want to think about the change that i

want to make and get past you know all

the configuration

i think it's a bit disappointing that

like when you create a fork

and then you submit a pull request from

that fork to

the origin that the origin doesn't just

like

automatically make a branch in the

origin

that you know maybe has like heavy

restrictions maybe you know

it's unfortunately nothing to be merged

to master without

i mean i don't know it seems i can kind

of understand that you don't want like a

random user to be able to create a new

branch in your repo

but also it just seems like in a lot of

cases that would make a lot more sense

yeah i mean like with bigger projects

you end up with like 2000 branches

sometimes or more if you look at the art

studio project

already downloaded so i have my

investment undergraduates

and i think that if you're allowing

any pull requests from everyone to

create a brand on your actual project

and to get that

information you're going to be touching

like potentially thousands of branches

all the time

sorry i think we need to move the

discussion parallel because it's uh we

are over the time

i guess sorry yeah i'm sorry for that i

guess the takeaway is

these two workflows both are fine

one is very complex but you can abstract

the details through tools

and if it's too complex we can still use

the simpler workflow that alex and zj

have been kind of pushing from the very

beginning and i think it's just fine

okay yeah i mean i like almost

all right you guys okay
