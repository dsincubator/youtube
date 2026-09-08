---
type: Video Transcript
title: "`usethis::pr_sync()` (live ds-incubator meetup)"
description: "I'll start recording and thank you very  much for coming  I'll try to be on time because following  this meeting so just to let you know we  are talking here at"
resource: "https://www.youtube.com/watch?v=g1PRMaTFYdk"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=g1PRMaTFYdk"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

I'll start recording and thank you very

much for coming

I'll try to be on time because following

this meeting so just to let you know we

are talking here at that science in

equator about this topic of full

requests we covered the kind of basic

situation where things just go well in

the previous meeting and that issue poor

request helpers has now a few additional

comments to answer basically here I

answer the question that CJ asked and I

left kind of open a question that Claire

asked CJ asks basically to compare the

workflows using poor requests pursues a

workflow where the contributors push to

the mainstream rebel but I'm not going

to discuss that now because I want to

kind of focus on the topic of today and

the topic of today actually answers the

question of what is gonna along the

lines of the question that Claire asked

third question was basically you know

how do you go about working with two

consecutive PRS when they are

interdependent I'm not going to cover

that topic today I'm going to cover it

next week but it is you know broadly

speaking in the topic of kind of you

know PR health so we're how to kind of

get out of situations that are not the

ideal one so more realistic scenarios so

today particularly I'm going to talk

about this situation where you need to

synchronize your pool request with the

source repository so imagine we're you

know we are a contributor and we you

know we have submitted a pull request

and that pull request has some conflicts

that need to be solved before the pull

requests can be merged so that is the

job of the PR helper PR sync and that's

what I'm going to be talking about today

so first of all you know because I'm

going to be showing how to do this work

with Eustace package the first thing you

would need to do is to color code

cranly function library use this and the

second thing you need to do is that you

have to create all the wiring basically

all the plumbing that you need to

connect your your repository your local

repository with the source repository so

how do you do that

okay so basically you could you know

create a fort first from the source

repository into your user account and

then create a clone locally you can do

all of that with the function create

from github which is a function from use

this as well

that takes us first argument the name of

the organization and then the name of

the repo with the syntax so owner slash

rebel and here I'm using specifically

the argument for equals true to force

the creation of that fork that should

kind of happen automatically for most of

you for me doesn't because I have

actually privileges to push to the to

the demonstration report I'm working on

so I have to be kind of explicit about

that so along the presentation you will

see kind of the us helpers as I'm

showing here and you will also see kind

of the same commands what they would

look like directly on beat so if you

were running them on the terminal and

they do this for the two reasons one if

you want to kind of if you prefer to use

terminal then you know this is kind of

the best practices way of you know

creating all this so in this problem

you're synchronizing your local branch

PA ranch with the upstream River and and

also because I would kind of show how

much work it is to do this on the

terminal as opposed to using the helpers

so that's totally up to you it's very

valid to do it on the terminal as valid

as it is to do it with the helpers and

it's totally up to you

you know if I in my personal opinion is

if you can use your brain for something

more useful than you know doing

repetitive repetitive tasks that are

error-prone then fine so for example

this function create from github what it

does is well first you have to create a

fork

we have if you are going to go for the

terminal approach and then it then you

can open the terminal and do keep clone

and then pass the URL to the git

repository on github

so here I'm you know forking from an

organization so it's an org is the owner

and my fork is going to leave under the

user account multiple so I'm the fork of

this source is this one here

and then once you are locally you know

this function also that's this other

thing so it does for example it adds a

remote which is basically a nickname for

a URL pointing to somewhere else other

than your computer so if you were to do

this on the terminal you have to run git

remote and upstream which is the

nickname for the remote repository of

the source repo and they give the URL of

that paper which of course in this

example is unmoor then you would like to

kind of bring any potential change that

that river might have included in the

last seconds so you can do like pull so

you pull what it does is first fetches

like the metadata of that repo and then

does an automatic merge so if you we are

now standing on master then git pull up

stream master what we'll do is it is

going to synchronize your local master

with the upstream master so the branch

master of the source record and then if

you want to kind of save some time in

the future you can kind of say what is

the default branch that your local

branch master should track so you can do

this with this command so you say git

branch set upstream to upstream master

so if you're standing on master the

upstream of this local branch is going

to be the one you pass here on the

right-hand side of the equal sign so in

this this command we're doing is asking

get to track this local master branch

with this other one here that is the

remote work so with this I demonstrate

that you know this single command does

of work that you need to type a lot if

you want to do it on the terminal and

all of these is very error-prone so if

you mean something here you might end up

in a situation is not ideal so from now

on I'm going to move a little bit faster

employee not our stop to discuss the

gift terminal approach but it's going to

be there for you to use it in your own

time if you prefer to see how they PR

helpers approach compares to the just

plain terminal approach so get sitrep

secret stands for situation report it's

a function that kind of shows you a

bunch of useful information and today

I'm going to basically focus on these

two end lines this is a situation report

for what our status when we want to

create two to trade pull requests

basically this is showing that we have a

remote address with a nickname origin

that is pointing to more elaborate ABC

which is our fork and it also shows that

is a second connection to a remote

address with a nickname upstream that is

pointing to the repository ABC but in

the unborn organization which is the

source repository so now we're all not

wearing done a copy configure which is

I'm going to kind of play the role of a

contributor a contributor would initiate

a pull request with as you saw last time

with a function PR in it and the name of

the PRS a purely need PR and that will

create a lot of wiring for us and then

we're ready to work so imagine that the

contributor writes a line here in line 3

that says a Red Bull for demo that is to

edit the readme file and add some

information about what's the purpose of

this demo repository so that's the

change that the contributor want to

submit in the form of a pull request so

the contributor locally would write that

line they save the file and then run PR

push that will do a bunch of things

again that you can do it if you want and

that committee will travel to github and

will pop up automatically that function

will pop up a URL here so you will see

any

her face seen the kind of a pull request

interface so you can submit it and in

that state everything should look green

because there should be no conflict

between your base between your pull

request and the base branch where you

want to submit your pull request so

basically with we saw this before that's

why I'm really fast

I basically you know our commit lives in

this branch PR of the rep of ABC in my

user account my fork and I'm kind of

proposing those changes to be merged

into the master branch of a repo ABC in

the organisation so I go ahead and click

pull request so so far that's nothing

new that's what we saw last time and

that's kind of a review but now I would

like to discuss the case where the VR

and before the PR is merged the

maintainer adds a conflicting commit

that kind of crazy conflict right so if

that happens I'm going to show how that

looks like in a moment we would say that

you know this kind of green color happy

situation of the PR will change to this

kind of gray color and hatch situation

so the same URL that before had no

conflicts now would be looking like this

and you could really message saying this

branch has conflicts and that must be

resolved before you can merge basically

and it's kind of all already showing us

what's the file has the problem in this

case is the readme file so locally the

contributor can then run the find the

function be our sink and that is the

star of this presentation today so be

our sync we'll do a lot of stuff which

is kind of described here and also here

basically what it does is synchronizes

or it tries to synchronize our local

branch which is for a clone of our fork

of the source repository it tries to

synchronize that local branch with the

source repository so here it failed and

shows an error that says merge conflict

please resolve before continuing

so these parties very handy is Attucks

giving us an alert about what's the

problem and we also automatically pops

up one of the files

the conflict so here we can see that the

syntax is as follows so here it means

you know the branch we are standing

right now so it is the branch associated

to the PR and remember we wrote the line

every before demo and then it looks like

the contributor on the master branch of

the source repository wrote in the exact

same line something a little different

for example if they wrote a repository

for table so I see the freeboard

repository that is a conflict that it

does not know how to solve automatically

and asks us humans to solve that problem

so for example this is one possible way

of fixing that conflict so you know this

is line three of the contributor this is

like three of the maintainer and this is

line 3 of the contributor after solving

the merge conflict so this red section

is what the conflict was looking like

before and now in green is what this

commit

looks like so basically what we did is

you know we edited the file to just keep

this line a repository for demonstration

we save the file and then we create a

comment so this is what I will eat

history would look like at this point we

are still locally we haven't yet pushed

and we're gonna do that in a moment so I

just gonna break down what we're seeing

here the repository started before this

demonstration the repository already had

a readme file and this community here

and then the contributor edited the

readme file that reflects is reflected

here and is commit then the maintainer

added also an addition of the readme

file exact same line that was a conflict

and we have just solved that conflict

here so we moved great it was called

emerged coming ok problem so we are

ready to push we can run the function

peer push and I will send that you know

solving commit back to github again you

could do this if you want on the toilet

so the pull request remember it was the

last time we saw this URL it was grey

and he was saying hey you have a

conflict here now we are back to green

he says this branch has no conflicts

with the base branch so we are good to

go

so the maintainer could then come here

and click the green button to merge this

PR into the upstream master

so in particular I like doing squash

emerge because that kind of cleans the

messy history of conflicting clicks and

instead of having a bunch of comments

representing one PR we have just a

single nice comment so when when that's

done then you know as contributors

locally have nothing else to do with

these PR so we can just run the function

PR underscore finish and that will

switch us back to master then it will

pull the changes that were merged into

the source repo from upstream master so

we are going to become synchronizing our

master branch with the upstream master

with a source repo and then it's going

to delete the PR branch because we no

longer need it so all that kind of

cleaning leaves us ready for for

examples for making an expedia

so that's all I have time for and all I

named for today so we gotta finish my my

presentation I'll leave it open for

questions

do we have any question nothing it's all

clear our spirits are using the terminal

approach but this one oh now looks like

much better way so I would try like this

way but yeah thank you this one to me

like it's all right thank you very much

again I mean the peer helpers are an

alternative like you're welcome to use

or not use totally up to you it's

working very well for me I'm gonna

trying them to learn them and then to

teach them but I'm now convinced

actually that I'm very helpful so let me

see the chart to see what we have here

okay good it looks like we are good to

go then I'll say goodbye and the mix is

gonna be the final PR hell yeah at the

science equator and then we gotta move

to other topics okay

bye thank you thanks thanks Maya thank

you
