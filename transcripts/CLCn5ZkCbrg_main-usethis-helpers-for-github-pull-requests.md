---
type: Video Transcript
title: "Main usethis helpers for GitHub pull requests"
description: "okay then thank you very much for coming  today  the science plan is to talk about the  pull request helpers very briefly I'm  only going to focus on the main p"
resource: "https://www.youtube.com/watch?v=CLCn5ZkCbrg"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=CLCn5ZkCbrg"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

okay then thank you very much for coming

today

the science plan is to talk about the

pull request helpers very briefly I'm

only going to focus on the main pillars

and the reason why we might want to do

that is because a lot of people

including ourselves are using github as

a platform for sharing code and actually

the workflow is pretty well polished but

it has so many mobile movement and

moveable parts that it's very difficult

to kind of learn and I just so these

helpers from the Eustace package can

help those who use our and help them

contribute code in a very fluent way and

those who maintain code as well so

that's the plan for today so here in the

repository associated to this meetup you

will find that there is a new issue that

contains the links to basically the help

file of this function so you see now on

screen which these help files really

nicely written so I'm basically going to

walk through this help file and point so

before we continue just to check you see

my screen okay yes exit it may ask you

to mute yourself for a sec

and do you have questions or comments

cool thank you so these list of

functions is kind of a comprehensive

list but I'm going to cover basically

how to initiate a new pull request from

the perspective of contributor then how

to fetch a pull request that is already

opened from the perspective of a

maintainer and then how to kind of push

changes either if you are a maintainer

or a contributor have the push changes

from you know your local copy of a fork

up to eat hub and that's about it really

the rest are kind of for more advanced

used and if you gotta hit hook today to

what I'm trying to kind of show today

then I'm sure you will learn more

fine-grained details on your own and I'm

here to help

so basically going down in this help

file the first thing you need to be

aware of is how to set things up the

hill file it does include advice about

that and the only kind of theme that you

need to do that you may not have done so

far is that you need github token so we

use the usage package of course needs to

be installed first so that you can run

you know something like maybe use this

and and the useless package itself

includes a function called browse github

token so this function if you don't have

a token already you can use this

function to create one and the

information about how to do that is is

well-documented particularly well in

this stuff here called set up in the

website of a useless package if you

click there you will see you can scroll

down to the menu here on the right you

will see that there is a link that

describes how to get installed to github

personal target so that's the sixth are

here I'm not going to cover them today

because I would really focus on it or

maybe and helpers themselves but feel

free to kind of try set they set up

yourself and if you have any issues just

discuss them with me so once you have

things set up then well imagine

that you are a contributor and that you

want to contribute to a repository as

someone else contains so let's pretend

for a moment that the repository you

want to contribute to is for example

this very repository called es so you

know we have discussed in other sessions

in other meetings is as follows

basically you know you go to the main

repository where you want to contribute

and then you create a fork by clicking

here in the fork button at the top right

then you choose basically you would be

normally you would be using choosing

your user account so this is the one I'm

going to choose what this is doing is

creating a fork basically an identical

clone of that main repository but under

your username so now the person who owns

that that repo or that copy of the repo

in this case is Mallory Libre is no

longer the main repository which was 2

degrees so that was a main owner so with

this form in place you can as usual

click here this cloning button and copy

the URL when you get there unless you

have already set up SSH

you know the N HTTP protocol should be

fine

I'm moving kind of fast through this

because we covered it many times but

again feel free to ask me questions if

you're kind of struggling with this this

is so far the kind of usual workflow and

then the next step could be to open just

any open session of our studio and I

like it you see here this icon at the

top right and go to the new project and

then you go to version control gate and

then you paste the URL once again you

know we've covered this many times

before and this is like you choose a

location in your computer you would like

to store this basically this local copy

of your fork of the main repository

and I'm going to choose this package and

I hit create project what these habits I

would like to show you that the useless

package has actually a function that can

help you do all of what we have just

done in one step for that let me show

you here so if you were a contributor

you could do what we have we have just

done basically don't do it the fork and

creating a level clone with a function

created from github and then you will

give the name of the owner the owner

will be - the best best team yes - so

this is normally do as I showed before

right so I did the kind of a long

process and you could you know you're

welcome to use this shortcut so let's go

back to our studio so now what we have

here is a local copy of our fork and all

the data science in Quetta most so as a

contributor remember that we're not

pretending to be a contributor let's say

that we want to add a new file to this

red book actually now I notice that you

may in my practice of this talk I

already in your files I'm going to add

another file by clicking here on script

I'm going to type something whatever it

doesn't really matter it's just a demo

but just to show you what you know the

world would look like for a configure so

I'm going to type align contributor so

this is going to be the change that I

want to stab it I'm going to save this

file I'm going to say new file let's go

guys

you file - it's just a random name if I

now go to they get time you will see

that first you know then what we have

here is the name of the master branch

but it is the strong a simply and I need

to kind of refresh no sorry there we go

actually I did something wrong I didn't

intend so I'm going to go revert back to

what we were doing before

I'm going to remove this rebel from my

local computer because I want to show I

can skip one step so I'm going to remove

this rebel completely and then leaving

it from my computer and I'm going to

repeat the process where I go to my fork

right I click the URL then I go to any

our studio session

our students open now

I was you know going ahead of myself I

remember we go today to this button here

you

creating your project perfect control

kids we paste the URL we choose a

location which is fine with me

and we create a project so now let me

follow the script because otherwise I

help myself so if we go to the help file

this is what I contributed good too if

you want to initiate the whole request

you use the pr init function so that's

what we are gonna do i as a contributor

let's pretend that i want to contribute

with the new pull request and i'm going

to use the first i'm going to lower the

package attach the package use this

right and we use the function PR in it

this function takes the name of the

branch so something like my feature

would work and as you can see use these

instead of talking to gate and to github

i'm doing a lot of work for me a lot of

work that otherwise i need to do

manually and it's like easy to kind of

get wrong and that's the magic of this

TR helpers so now what i want to show

you before is if I go to the get Tao

what we learned when we create a new

function however this is an updated if i

refresh here you will see that the

actual branch that it knows about now is

the ranch my feature which is so now is

when I start doing changes I don't you

never start doing changes on master you

start doing changes in the feature

branch of your pull request so now I

create a second contributor I create a

file I add a line a line by contributor

and then I say the file let's save it

with the name new file to

just a random file it's randomly finally

chose and now yes I do and you know what

I want to do is to commit the changes so

basically once you have initiated with a

function P R in it you have initiated

your people request you just not work as

normally right you just do changes and

add those changes to version control by

committing so now I'm going to do a

commit by contributor I do the committee

I close this window and I can continue

to do as many comments as I wanted I

could do a second commit if I wanted by

adding another wine for example and then

if I changed I create a second commit

right I commit that file so if I see the

history of the world for this BR started

here last month at must ask man at

master and then since then I create a

new feature branch which is right here

and now it has two commits the first

commit message is this one and the

second is an all the change is this file

called new fine too but now has two new

lines but all these changes so far live

in my computer so let's go back to the

help file of the deal helpers to know

what's next so what we have just done is

this one where we know we work locally

making changes to the files and checking

them in to you and then when you're

ready to submit your request all you

need to do is to run the function P R so

let's do that let's pretend that these

two comments are all the commits that I

will be shared with me in my own request

so I simply follow the instructions that

agree here so I just do PR push and

again they use this

package is going to be working Allen

along with deeds and didn't have to make

this happen it's doing a lot of work for

me and now automatically it is opening

this new window and on the main

repository onto the grease Diaz equator

for me to kind of review what's going on

and then click here create new request

so basically what's happening is crunch

my feature in a repository of my user

account those comments are going to

travel or are uncomfortable seeing them

to is included in the master branch of

the deep data sizing way of repository

of the owner to the business so this is

simply just a shortcut to how can create

a bonus as a contributor you could then

are the message if you want I don't need

one so I'm just going to click create

pull request and that's done the pull

request has been submitted you see that

in the travel request race number one so

now what good life look like for the

maintainer if you are maintaining for

example the data science in Quetta

package in the two division vessel

repository and someone has made it all

request what what do you do how these

helpers can help you okay so let's go

now

at here and let's see what life looks

for maintenance so Amanda is what they

will do is simply to fetch that good

request using the function P R fetch so

now let me kind of many pounds in this

talk I list now we kind of changed our

mindset to pretend that we are no longer

the contributors they stop the world

issues of them on tape right ok so what

what do we do now okay so let me open a

new in you and let me open a project I

have however a store in my computer he

lives somewhere else

in this different folder the person

would look very similar but let's now

pretend that this is the computer

confusing but in the real world the

maintainer has seen that there is a new

pull request right here in the tab and

the maintainer wants to fetch that pull

request and review it and see kind of

what's going on and maybe add some

changes so the first thing that the

maintainer will notice is the number is

the number 8 that's the number

associated to the pull request a little

break here as well so the maintainer

when it has the person has to do is to

run the one first is going to load the

baggage use this and then it's going to

run the function PR fetch and it has you

have to give it the name the number of

the pull requests that you want to fetch

so in this case it's number 8 so PR

fetch should do the trick as you can see

once again the use this package is

working with kids and it have to make

only much happen and if you go here the

top right you will see when i refresh

the eat paint that the branch master

will change to something different which

is the name of the branch that the

contributor created with the suffix of

the username actually that's that's kind

of a convention that it gives this

package so he creates a local copy of

the pull request that was submitted by

the contributor

now the condiment ainur can see the

history of this pull request and noticed

for example that since the history

master there have been two new commands

associated to this pull request may be

the maintainer also add a new commit for

example maybe they want to go to the

file that was submitted which was this

one here and

a new line by de Montaigne so let's

pretend now that the maintainer is happy

with the changes but wants to have a new

change and maybe you know other little

details to the previous changes

submitted by the contributor something

like this fulfilled

so these are the changes that the

maintainer is adding to the pub request

changes are made and now we are going to

commit those changes as the maintainer

they commit by the maintainer we now

let's see what the health file says that

we should do let's go back to the health

file so a cement diner you know you will

need this B you will fetch the pull

request we made some changes and then

when we are ready we run the function P

and push and that will push them back so

let's do just that

let's go here I do PR push

remember we are the maintainer now use

this again is working with git and

github making everything happen under

booth without us worrying too much about

that and it's also telling us that we

could run if we wanted the function P of

view as a shortcut to just navigate to

that PR on github that will

automatically open this window on the

web browser and do we have any question

there good showing what the PR looks

like they make enough debrief what we

see we see these first two commits that

were done by the person who pretended to

be the maintainer sorry a contributor

which was me and then this third coming

is the committee added by the maintainer

which in this case is also in the real

world this could be two different person

convinced by the contributor will come

from someone and they commit from the

maintainer or maintain errs who come

from someone else so let's pretend that

this is so here is something what's

going to happen they commit came from

this branch of this owner and they are

going to trial into the master branch of

the mangrove of one common thing that I

do personally is to squash these commits

if they don't relate to the same problem

which they should because they so I can

just click squash and merge and you can

also wear rights becoming history if you

want saying the commit message saying

something like you file to and confirm

and squash so that will do is that

although the beer has three commits the

history in the master branch we have

only one

three commissioners question to a single

one and incorporated in the master

branch so we're kind of getting to the

end of this let's see what else we can

do so for the maintainer after they have

a copy of of this repo in the

maintenance computer and this one being

our fridge so that will do is basically

it will get rid of the branch that was

created for this request and do a little

a little more cleanup and that's a the

commentary I'll continue working on the

main repo or managing other core

requests so for now I'm going to close

the arts to your session of the

maintainer and I'm going to direct your

attention to a few other things that the

contributor could so they contribute

also finish with the same function so if

we go to you now let's pretend again

that we are the contributor so the

contributor has already so he saw her

pull request has already been accepted

and included into the main stream

package or repo so they last so there is

nothing else that needs to be done in

that particular request so the

contributor can after attaching the

package once again use this can do as

well we are finished and I will also do

some cleanup in hair keys computer so

that's about it there are a few other

scenarios are more complex where for

example the mainstream repo has new

changes that are independent from the TR

and the contributor needs can

synchronize those changes before the PR

can be and submit so that is that magic

is done by the PR sync and we are not

going to cover it because it's a little

bit more advanced

but we'll see we just don't have time I

mean the PR view we already covered

basically shotgun for browsing the PR on

github ampere powers which allows you to

kind of stop or you're doing on the PR

go back to you know the master branch

and do other things and then you can

resume your PR whenever you're right so

these things I'm not covering

intentionally simply because we don't

have time and also because I'm pretty

new to this approach to be honest and

I'm trying it as I go and honestly I'm

really liking how five much faster and

simpler my workflow becomes so with that

I end what I planned

if you today so I would really like to

to hear your comments or questions

before we say

thanks Mary I've got one quick question

maybe it's quick with regard to a pull

request so initialize my branch made my

changes I push it I push it towards the

master branch let's just say classes the

or yourself with the maintainer in your

on a holiday so you don't get to this

and I want to keep working on that Douai

and pull the pull request all the way

can I create a new pull request of that

work that I've already been doing or can

you maybe add one or two comments to

when that happens yeah yeah absolutely

you can in your fork which is like a

clone from the main repo you can do

whatever you want independently from the

maintainer but if you want to continue

working off the main repo you will need

to do two things either kind of wait

until I mean if you need to build on top

of the PRA you ready yeah there that

here has to be merged eventually before

you before you continue so that's the

ideal undeceive the scenario but you can

if you want go you know back to the so

say that you know you started with with

the state of master then you created a

PR which added three commits if your new

work is independent from those three

commits that your other so you can add

as many peers as you want of the state

of the master branch of the main rebel

and there is no promise they are

independent but if one PR depends on the

completion of the other one then again

so you either wait until one is merge

reaches

it was first and you continue working

off the talk of the PR so beyond you do

PR one you are free commit incorporates

your first PR then everything will be

ready to go for you to kind of merge the

second that is where things get a little

tricky and it's way beyond what we can

do in 15 minutes actually but I'm it is

nothing that I want gonna drop you alone

on so I would really like to and work on

you with you I have a question do we

have a like organizational standard and

under what conditions you would do glory

class rather than making commits

directly to the repository but that's

not something I've experienced here yet

but maybe the other repositories have

this kind of management structure like

that under which cases with it we we

want to use it for us rather than just

like how I can convince a few one of you

maintain errs and as many computers as

as you wish others making the

permissions to push into the mainstream

preto more restrictive but that's

something that it seems that is still

kind of an open discussion in my master

branch of mainstream is freedom but

actually it is a pain in the butt

because you have to

at least until all the contributors that

want to be privileged to push into

master have gained experience so that

they know how to kind of at least you

know fix merge problems and you know

maybe Rebecca means and clean up the

history so that's basically my opinion I

will I do and actually hear the opinion

of others in the room to see if they're

go decide it with me so related to that

is there what is the you see the

advantage of sending home request from a

severed for verses like for instance

having because you're kind of following

this workflow where you know you branch

if for fork and then you create a band a

branch from your for which is the

benefit that we see is that the

maintainer can push changes into the

fork and not into mainstream and then

when everything is clean you can support

the branch into a single commit meaning

that the end I mean the final hist

commit history of the main wrapper

becomes really clean and the maintainer

can add comments such as you know key

words such as no closes you know PR such

and such or cross this issue such and

such and things to add mentioned user

name and so forth

so I have a bunch of examples of that

I'm working a lot with Jackson kind of

polishing that workflow but basically

the idea of working on a pull request

allows you to classically change the

commit history of that pull request

I'm cleaning very neatly before you

included into the mainstream then and I

asked you how that relay

- how is that a fight - having many

wrenches on a rep oh I don't know very

very much and I would like to kind of

hear how that work for work work for you

before all right well we can talk about

that separately because it's maybe a

large number but yeah I have worked on

like an individual repo with multiple

people and that we all we all had our

own separate branch not a separate fort

but a separate branch within the visual

repo net we could work on that

separately at merge thank you master

changes that we gave which is pretty

similar but it means you don't have a

result separate private forms from

people right so then I think that you're

basically not having everyone having

different branches in the main repo as

opposed to from a fork the main

difference I see is instead of basically

you know hold on on a fork and feel that

it is easier to clean the history of a

pull request and force it into you know

one nice commit that represents what has

happened but we should try it you know

so far I'm liking the approach proposed

by this work some might suggest that the

contributors may need to have a

relatively high level of its kind of

build so that even if you don't really

know what is before it just happens kind

of individuals which is not very good

for learning in the long run but it is

very good for

[Music]

you
