---
type: Video Transcript
title: "git branch (part 2): merge, delete"
description: "Science incubator about working with kit from the terminal we are more or less in the middle of lesson about branches and git and so far we have..."
resource: "https://www.youtube.com/watch?v=zC31jaKp1jQ"
tags: ["ds-incubator", "git", "github", "cloud", "workflow"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=zC31jaKp1jQ"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2020-11-03T00:00:00Z"
    usage_count: 20
usage_window: { from: "2020-11-03T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

so this

is uh another data science incubator

about working with kit from the terminal

we are more or less in the middle of

this

lesson about branches and git and so far

we have kind of been talking about

branches in a

row in a local setting there is a whole

lesson dedicated to remotes which we

will cover in the future

and come up to reset what i said last

time you know git branches

plus remotes combined

are a fundamental keystone for

understanding

requests which is the way we collaborate

and we build software together

so although this kind of is moving a

little slow for many

and maybe it is also moving at a good

pace for

some even like me who have some kind of

broken models about how things work and

we were just discussing offline

uh or of video with with um

katarina about you know how i have just

learned something new

from from interactions with her so thank

you for that

uh so feel free to

interrupt me you know my goal is not to

kind of fit a lesson

in a meetup is just to actually use the

lesson as an excuse to have these kinds

of conversations uh so

i have no rash really and if we don't

finish today with this lesson that's

fine we make a parenthesis

next week because alex is going to be

talking about

it workflows when you work in a team as

opposed to when you work solo

and so then you know if we make that

parenthesis and we're not done today

with this then we'll continue

after after him um

so any comment about that right now

before i actually

start following the lesson

can you see my screen thumbs up someone

good

great so i'm gonna shift to my r studio

cloud thingy here uh

first you know i wanted to kind of

mention that um

that the reason why i'm in our studio

club and you see a

prompt that is way shorter than

uh you might see is because i use the

the variable ps um

oops yes and i defined it in

my configuration file so if i go to

my dot profile file

which is you know has to live in the

home directory of your computer in this

case i'm using not my local computer i'm

using

an rstudio computer through the our

studio cloud

platform so you will see that i have

this line here so this line is what

makes my prompt

show just my working directory only the

base name

of that as opposed to showing

a very long prompt and the reason why i

like that is because

um as you start typing things

uh if the problem is too long then what

you type kind of wraps under that and

it's pretty awkward so if

if you would like to have a shorter

prompt

i recommend you use that variable so

type just this line in a file called dot

profile

and put that file in your home directory

and that will do the trick

so what we covered last time was um

did branch basically how to create a

branch how to check out into a new

branch

and this idea that a branch is you know

parallel reality where you can

experiment

two things and then if you're happy with

what you see you can merge those changes

into the main line of development

um because we use mostly um a

workflow that is called the github

workflow that involves

only one long-lived branch and then

short-lived

kind of feature branches then we know we

do find ourselves doing this

branch work merge very often

so we got to a point last time where we

created a branch called experiment um

actually let me show you with the branch

uh where i am and notice that you know i

was kind of showing

an example on the fly and i created a

different branch

called a toy branch and by accident

i committed what i intended to commit

into the branch experiment i committed

it into toy branch

so this first part of the lesson is

going to be actually you know

fixing my own mistake and and that will

hopefully be

um insightful for for some of us

so it is of course not only possible to

merge something

a branch into the branch master

but it is also possible to merge you

know a branch into another branch

any other branch because master is no

more and no less than just another

branch

it is only a convention that master is

the

main line of development and indeed it

is changing actually github is you know

suggesting the

use of the actually not just just

imposing that new repositories

uh are called no master but main but you

know you can change that default i have

just

done recently so the first thing i want

to do you know i would like to just

follow the lesson

i would like my experiment branch to

have

what my toy branch has so let me show

you i'm using

our studio.cloud which is our studio

that means i can also

get the really nice

interface to git that rstudio provides

so i can you know see the history

of my git repo and let's see

so here i am in my toy branch i could

say hey i want to see all branches here

and so as you can see i've been working

for a bit uh

on the background before i started

recording so i added a bunch of commits

i did a bunch of changes just to kind of

conform with the lesson

but again you know these changes are not

in my

branch experiment in my branch toy

branch

and i noticed that my branch experiment

is still pointing to the same commit

where master is pointing so what i would

like to do now is to

merge all the changes that i have in my

branch toy branch

into experiments so experiment moves one

two three four commits ahead of master

so let's do that

so um one

thing that i didn't do in my prom that

is really useful and i do recommend

is to add the must the sorry to add the

current branch in which you are at

so right now the only way i have to know

in which branch i am

is to type the command git branch so i'm

in toy branch

and i would like to check out

the branch experiment um ex

git checkout experiment

and i switched to the branch experiment

so now i will let you know once i'm in

that branch

i want to merge into this branch the one

that i'm standing i want to merge the

changes that i have

in the branch toy branch so i'm gonna do

a git merge

toy branch

and as you can see um you know what the

messages that i get

here say um that you know

things have kind of worked so let's go

to the history again because it's easier

to see this visually

let me refresh this and as you can see

you know the toy branch which was

before pointing to master has moved one

two three four comments ahead of master

now

and it's pointing to where experiment is

right so that the two things are in

the same at the same place sorry what

was here before was

experiment branch and has moved to where

uh toy branch uh

is and the reason is because i have

merged these two branches

and uh the reason why i don't see

actually something that looks like a

branch

and the mesh com emerge commit in

between

is because i um git has done a special

kind

of merge which is called fast forward as

you can see here

so fast forward is basically how i

identify that

the changes do not conflict or anything

so you know the commits could be you

know the branch would just

uh you know the commits could be put on

top of the branch as opposed to creating

a new merge commit

with two lines of development you know

that come from from

uh from two different lines and they

merge together

so it first fast forward commit this

fast forward emerge is kind of pretty

because it

makes up for a linear history

and now one thing i would do is to

remove my branch

so not big kit branch

so i'm gonna remove my branch toy branch

because i don't want it there it was

something ephemeral that i did last week

and it beat me

so i'm gonna get rid of it so i don't

commit the same mistake

um so let's do git branch

i think it's deletes and toy

branch let's see if that works it did so

because the branch is uh that the toy

branch is merged into another branch

the commits that it contains are you

know safely stored in this new branch

so i can do just a git git branch delete

and it will get rid

of that of that branch if the wrench

wasn't merged

then you have to force the delete and

and that you may or may not want to do

that depending on the context

so but we're going to be talking about

you know which branches have emerged in

a moment

so for now i would like to kind of stop

here and reflect a little bit or ask

you know for comments or questions if we

have some uh what i have just done is

not directly related to the lesson

but it's a side effect of being within a

mistake

so but you know i think that the fix is

useful to kind of explain

you know how to merge branches how to

delete branches

and how they can fix um basically the

yeah where your branching structure so

any question or comment here

no okay um

then i guess that's a chest

yes go ahead

um

great great question yeah

um let me then say something that you

haven't said but it might be useful to

just

keep it recorded in the video and the

that is you know why

you we might want to delete branches so

i have

found in my in my own practice that

sometimes i have

you know a branch i experiment is very

vague

and um and it is very possible that you

know in a month from now i will want to

experiment again i will create another

branch

called experiment or think that i'm

creating a new branch and i'm actually

working with the old branch

and weird things can happen because you

know for example in particular when you

want to bring

stuff that is in not in your local

repository but in another repository

which is you know this

remote repositories that we're talking

about we are going to cover in detail

later

it can happen that your local branch

that you think you are creating instead

you are not creating you are just

the branch that is state that is leaving

your local report so that is why

uh and then what happens is that the

commits that you end up pushing to get

how another committees that you think

you're pushing

are the commits that you know have been

stayed for a month or so

so that's why you know we want to keep

you know our branches as clean as

possible

so i i'm now kind of actually going

specifically to your question where it's

best to remove to delete them

um github has

a setting that i do set

in the repos that i generally maintain

but i may have missed it somewhere and

that setting is

to tell github and

[Music]

to delete every branch after it has been

merged

and that way you know once you know we

are sure that what we have in that

branch is no longer

needed then we just get rid of that

branch but that only affects the remote

so if you are working in your local

repository

you know whatever branches that have

been removed

deleted from the remote won't

automatically disappear from your local

repo

and that's a good thing because

sometimes you know you know you

someone like me maybe deleting branches

for you know hygiene

on the remote end of the

repositories but luckily you you still

want those changes to be there so you

have

you want to have control right so yes i

do agree i think it's best to

uh on github to agree that in the main

uh line in the source repository in our

case in the one that lives in the 2d

organization i think it's best to

delete them automatically and then

when you uh locally you can what's

called prune there is a command called

git

prune and then you say which remote not

git remote proof

which tells um git to look

to basically to fetch the metadata from

a remote repository to notice which

branches are

never have been deleted and then also

delete them

locally so again kit prune

git bra get remote proof um so you have

to say specifically

which remote you want to prove for

example the comma the full command will

be something like

git remote prune origin or git remote

prune

my fork or whatever um

this idea of the leading branches

automatically

is like an opinionated framework github

recommends that actually you know

jackson and i were in a github

conference recently and that's what they

recommend

but i opened the room especially for

alex

to disagree with my opinions or anyone

else that has any comment or opinion

about that

so

cool thanks for that uh so the commands

that

you need to know about to clean your

local

branches are you know git branch minus

minus delete

and you can always ask for help with the

let's actually do that

let's ask for help with git

branch

here let's expand this a little bit um

i would like to see the part where um we

delete branches

okay so as you can see there is a minus

d which is shortcut for delete

which will remove branches that have

emerged like what the example i have

just

shown but sometimes you know you try

something out

it didn't work out won't work out you

just want to get rid of that branch even

if you haven't merged it to anything

else

and then you do a minus d which is a

shortcut for

delete which you know is the soft

version

the safest one and then adding the force

flag

so with that you get rid of the branch

whatever right

and if you do remove a you know this is

of course dangerous you know you remove

a branch um and uh it looks like you're

never going to see it again

but there is something called get

dressed log that

you know when happens then you know

you go to the gitla

revlog there is a command called git

revlog which you can

again ask for help about and that will

help you recover even branches that you

have

forced deleted but try to not need that

you know

use it eventually but it's not it's not

fun

any other comment here

okay i suspect that the lesson will get

a little bit more

um on on these things on

you know kids on the leading branches

but i don't exactly remember that

so well to continue with the lesson

um it is asking us

to switch to the branch bringer

okay you know it's just kind of

discussing the checkout command right so

the checkout command

you know you use it for a bunch of

things

for example to change the branch

from one branch to the other but then

you use it also for example to

um check out the

history of your of your repository in a

specific commit

or you use it to you know remove some

changes that you have in your staging

area and you don't want to use them at

all

so why is the git checkout command

um so um kind of versatile

and maybe confusing and the reason is

because

you know what explains that and

clarifies that is when you have a strong

mental model of what a git coming a git

repository is

so git check out all it does is it goes

into that dot git folder

looks for the history of uh the

repository as it has been stored

indexed and then brings something from

there

and transform you know what you

experience in your folder what's called

the working tree

into what is already stored there so

that's why

um you know you can do um you can check

out a different branch because

what you are doing when you check out a

different branch you know you're

actually going to that dot git

folder looking for the version of your

repository as it is

in that specific branch which and a

branch remember is no more and no less

than just a pointer to a commit

so it looks for the commit that to which

that branch is pointing

and then brings the working tree

you know that puts that in your working

tree so that your folder now ex you know

what you experience

is um you know the history as it was

recorded in that particular

particular economy and then you know why

for example uh it works too when you

know you have something in your staging

area and then you do keep check out

um you know a particular branch you know

how that's

why that's that uh change that you have

your stationary disappear well again

because what you're doing is you're

going back to your

git repo storing the repository and

bringing those

changes from the history as it was

in the in the branch that you are

checking out and it's gonna

overwrite what you experience in your

working tree so that's what that's how

actually what actually checkout

means and that's why you can use it for

a range of things

the lesson mentions a git switch command

that

um apparently is available since kits

2.23 i i updated

git today and it says 2.17 so i don't

get

this switch i never got this switch

command

ever um so i will just stick with the

git checkout

um but i would like to ask anyone who

has been using git intensively if you

actually do have a git switch

command

no okay so

i don't know honestly um here you know

they

their opinion is that it's much nicer

because probably

it's kind of closer to your intention

when you want to switch a branch then

you know git switch could make more

sense

um but i will just stick for now with

git check out because

again if we do understand um you know

what

checkout actually does then it i think

it's it's pretty

useful and i guess that even if this

version that uses git switch

becomes eventually popular it's not

going to happen until

some time from now so

in the meantime probably it's better to

just you know you're gonna see in

documentation everything get checked out

way more than give switch i guess

um

let's see this exercise

uh as us to

okay i think it's asking us to kind of

you know create

a new branch add changes and merge it

into

master just to um

into master experiment just to

experience the thing of merging but we

have done it you know in the beginning

of

this video uh

you know what i was kind of when i was

uh

fixing my the mistake that i made last

time so we may be able to skip that part

let's see what else

right okay so the image that we're gonna

do now then is

uh we let's let's check out master and

let's merge the changes that we did in

the branch experiment so that's gonna be

like a little bit of a review

of uh what we did uh before so uh

again git branch will tell me where i'm

standing i'm standing on experiments so

if i want to

to get all those commits that i did in

experiment and put them in master

what i want to do is then to check out

master and then merge

experiment but before i do that i'm

going to show you

the history how it looks like when i

refresh

that refresh removed the toy branch

because remember i deleted it recently

and so what we want now is we want to

merge all these commits

into master and that should make our

branch

master to point no longer to this commit

it should make it kind of point to this

commit here if the merge is a fast

forward

so let's do just that so first thing i'm

going to do then

is to do git

checkout master right

and now gitmesh

experiment right

i made a typo so with my typo

he doesn't know what i'm talking about

ex

i need to type the whole thing

and now i can see that my git performed

a fast forward

merge so what i expect to see is what i

suggested before so this is the state

before

and if i refresh what i see is that

master moves to this

point here let's refresh and here you

are so basically the the

master branch now points to the same

commit where

the branch experiment is

and that will get us to this point in

the lesson

um i mean in the lesson we are using the

git graph command which is

not it doesn't exist it's just like an

alias that they created

basically it's a git log with

the graph flag here

and we're going to eat a little nicer

with a few more flags

um

however because we have a fast forward

commit

we don't see this split here um

maybe i could have done that with if

with a flag

when when you do merge you can use the

flag no fast forward

and that would probably have created

this branch uh

you know this kind of line separated

like here

i guess so one thing we can

that is interesting actually i didn't

know this is if we're gonna ask

git branch

merged and that would tell us which

branches

have um been merged as opposed to those

who haven't been merged

and the reason why you may want to know

this is because then you can use git

delete

the soft and safe version to remove

branches that have been merged

and if the branches have not emerged

then you have to either

not touch it because you may need it but

if you're sure you don't want it then

you have to delete force or the shortcut

minus capital t

and i think with that

we are going to wrap up here um

did it in branches okay so let's do

let's remove that branch delete that

branch experiment

it's a repetition of what we did before

git branch

because experiment was useful but we

already merged it and we can see that

because we use git branch minus minus

merged and we see it listed there then

it's safe to do

git branch minus d or the long form

minus minus delete

and branch

i forgot to say experiment

and then the range is gone so if i do

git branch now

i only get master and english that who

knows where that comes from

but that branch you know again didn't

show up in the git branch

merged command meaning that that branch

called english

didn't uh wasn't merged right so if i

wanted to remove it i would do

it branch minus capital d

english right and then it's gone so if i

now clear this up with ctrl l and do git

branch

the only branch that i see now is master

and i can also confirm that

with uh here so i can do

i can refresh in the git interface

from our studio look for you know all

branches

here um actually

yeah all branches and then if i scroll

down

i should see no more branches than the

one that

i know of which is master so

with that i'm gonna end a

lesson here uh i think we got pretty far

we merged the leading branches

safely

in country and fast forward mirrors

which we already did

and moving up to now

okay maybe moving commits to another

branch uh that's something that we might

might cover um after alex next week so

with that

um we have you know reached the end of

the lesson before we say goodbye do we

have any comments or questions

now okay thank you very much for um

showing up today is a busy day for

a lot of people here um where are your

faces

here is it yeah here you are

so thank you very much uh see you next

time

ciao
