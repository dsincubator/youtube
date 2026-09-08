---
type: Video Transcript
title: "git branch (part 1)"
description: "At the same time without interfering with each other and how to combine those changes of parallel tracks into this main line which by convention is a branch..."
resource: "https://www.youtube.com/watch?v=MU8E_gpylPE"
tags: ["ds-incubator", "git", "workflow", "github", "snapshot-testing"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=MU8E_gpylPE"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2020-10-27T00:00:00Z"
    usage_count: 25
usage_window: { from: "2020-10-27T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

okay so as i said on the background

before

recording today the ds incubator will

talk about

branching and merging we'll get as far

as we can

um in this series of meetups we are

going at whatever pace we need to

really get into the details of

um how to do things with git um

the ideas that we're going to be

covering today is you know how you know

as a team we can work in multiple

features at the same time without

interfering with each other

and how to combine those changes

of parallel tracks into this main line

of work

which by convention is a branch called

master but there is nothing

special about that name actually it is

changing that to the name main i believe

or trunk to remove the

the connotation with the connection with

slavery

um and

and then we're gonna also be talking

about the idea of how to reference a

particular

particular point in the history of a

project remember that commits are the

fundamental unit

of change in the framework that git

provides

and branches are no more and no less

than a pointer to a commit

and and there is another way to point to

a commit in a

very human-friendly way which is git

tags

so we are going to be talking about bit

branches as the main

star because they are also connected to

the pull requests that we work so much

with

uh but the difference between tags and

and branches that you will see soon

is that the branch kind of moves with

your changes as soon as you you know

make a new change

on a branch then the branch moves up uh

to the latest commit as opposed to

attack that stays where it is

therefore tags are great for

marking snapshots that are releases so

when you

you feel that your project has reached a

good state

then you create a tag and that is just a

pointer with a user-friendly name

that allows users to refer to that

specific

state to that specific commit

um this little image shows

more or less um or tries to capture

the let me actually increase this

because i'm i think you're seeing your

faces better here

ah right all right thank you very much

that explains

to true so i have to go here

present now my entire screen

let's do this sorry for that share

okay do you see cute octopuses here on

my screen

yes cool so before the octopuses

uh the more kind of boring image here so

you know we have imagine you know our

project started here on the

on the far left with uh you know m1 this

is just like one

commit and then the second commit and

then the third commit

so the branch in this case the munch the

branch but master

is pointing to the last commit m3

and you know master could stay there but

you could shift to another branch and

continue work

uh therefore we need a way to refer to

the current branch or the current commit

so the current commits or where you are

at at any single point in time that is

referred to as

head and this name head is actually a

keyword that it knows about and you can

refer to it

as a shortcut for the commit i'm

standing now and you will see how that

might be useful later

so the idea that we are i think about

more

everyone here is more or less familiar

with the

idea of branches so in the center here

we have a lane a main line of

development

as i said before there is a convention

there is nothing magic about this name

but there's a convention that the master

branch the

mass the branch name master is the main

line of development

here that represented in the center so

we start on the left with an

octopus that has no glasses and no hat

then someone creates a branch because

they want to add a feature which is

glasses right now so they you know

create that feature they put glasses on

our octopus on the hair glasses branch

and that does not interfere with the

master branch the master branch

continues to

not to not have glasses and at the same

time someone else

uh adds a new feature as well you know

they branch off master and that's key

so the idea of you know always going to

master

updating your changes if on master on

your local master branch with the

changes on your remote master branch

and i'm going a little ahead of myself

just to acknowledge the comment that

monica made sometimes we find ourselves

created a pull request that has a bunch

of commits that were already merged into

master and we don't know where they're

coming from

well they come from having branched off

um a branch that is not the master

branch generally branching off

another branch or by

i said yeah i think i stopped it there

so they we always want to kind of go to

master

branch off there so in this image

someone branched off

with a branch name heart glasses and

they added classes someone else or maybe

the same person

creating another branch that is called

how a hat

and the added hat as you can see each

branch has only the specific feature

that is intended to be added there but

then when you merge

those two branches into the master

branch the master branch has the

combination of the two

so let me pause for a second because i

need to invite someone else to the room

let me go hello

[Music]

i'm going back to our acute image so the

way

i see so i used to be a photographer so

the way i

worked a lot with um photoshop and a lot

of in the dark room

all days before the digital cameras so

the way i

think about branches and about

commits is as layers imagine a

transparent

paper and then you add you know one

thing in this case

you have the drawing of your octopus and

then you have a transparent film with

glasses and then you know you have

your film and you put on top of the

background image that is the the just

the octopus and now you have octopus

with glasses right and then

that's that's you know that layer is is

a branch and

what you can see there is that a very

efficient way of working because you're

not

copying the entire octopus you're just

creating the glasses and putting that on

top of that so that's the change so you

work only on the change that are not

working on the

entire thing so that's how i think in my

head about

about adding changes to a line of

development and then i can imagine if

someone else is you know creating a film

uh with um a transparent film with hat

then you know

when they put that on top of my uh

glasses layer

what you get is you know the octopus

with glasses and

so that's how i go about that

please do yes

yes

that's beautiful thanks yeah and that

also kind of touches on the idea of

you know when you merge changes uh

what what it means to be to have a

conflict right so as

alex said you know you touch the same

the same line in a

file and the same file and therefore it

doesn't know which of the two

uh you know you should kind of

prioritize right so a human needs to

to make a decision there are some

automatic ways to say prioritize

whatever is in master or prioritize

whatever is in my my branch

but still you know a human needs to make

that decision and add the flag if you

want to do that or you have to just you

know

open uh the file see where the changes

are

the conflicts are and fix them manually

so the way to minimize that

thanks alex is exactly as he said with

communication sometimes you don't know

and just

you know what other people is doing you

just need to face the conflicts but it's

not fun so

uh and it becomes less painful

and the smallest the pr is and

[Music]

and the more experience of course you

are any other questions here because you

know i feel that

i prefer to kind of move slow here and

address every gap

probably in in our understanding right

away

yeah that's a good point i mean the

whole thing that we are seeing here

is what github knows as github workflow

and there is other workflows

that that have so the github workflows

you see here what it means is that you

know you just create a tiny branch

that has one feature and then you merge

it back to the trunk to the master

branch

and does the github workflow there is

only one permanent or long-lived

branch and then tiny prs but then

there is other workflows that i don't

endorse because they are so complex that

need a lot of experience in the team

with kit where you know you have a dev

branch and then people merge

stuff into dev and then whatever is

ready for

production then from there goes back to

master so adds a lot more structure

so the idea that uh you know we have a

branch and then

we are we depend on what that branch

adds

to uh to start moving on other changes

that adds the complication

that i think um you know we have seen

more often

and it is it is kind of doable but you

need to synchronize you need to merge

first pier one and then pr two and

that's a pain in the butt

so maybe with uh with the talk by alex

and we can have a little bit more

insight about what's the best way to go

about that

i found myself sometimes kind of

creating the thing that has all the

features that i want you know the thing

the hat

and and the glasses uh or or as alex

said you know the mask and the glasses

because they touch the same thing and

then kind of break them

apart and i'm creating a sequence so

first i need to merge this and then i

need to match that

but i don't know maybe with that

discussion we'll learn that maybe it's

just better to buy the bullet and do a

bigger pr

i don't think it's so clear-cut and the

discussion will surely

help us a lot so

okay this is uh more or less showing the

same thing basically showing you know

a more complex structure so maybe we

won't spend

a lot of time on that uh

but let's see um the strings of sugar

choice that he permits the research to

isolate different

tracks at work yes we see branching

points in machine point

right so maybe one thing to take out of

this

image this is more realistic also more

ugly because

there's too much too much going on here

but clearly you know there is this main

line of development what we would call

now the master branch

and a couple of feature branches now one

in red b1 b2b3 and now in green

d1 m1 and d2 and

we also see how um so some

lines of development merge into the main

line of development

and create creates this kind of branched

um you know this complex structure but

um with git log the command git log

you can you can show

all the full structure of the branches

uh and you can also hide the emerges

using the flag is called no merge and

also with different approaches to

merging

uh one is called rebase that i think

we'll cover maybe later

you also completely avoid the the the

the parallel structures because every

branch actually kind of gets

cut from the trunk and then stuck in the

top

but that comes with a risk that rewrites

the history and if you are sharing a

branch already online

that's something that you should not do

so the most

comprehensive and safe approach is with

merge commits and

and then if we have kind of questions we

can talk about that

[Music]

okay the lesson will be using analysis

aliases are something that we'll be

covering in a different lesson

it is just a shortcut to type in a lot

of commands on git

uh the intent is to um

to be able to show these branches

uh on your kit log command

um but we'll leave for a probably i will

just type this for now

and when we cover aliases then we

um we can configure our aliases but the

long story made short is that in

in kids you can create shortcuts to

commands that you use very often

and alex has kindly shared his favorite

aliases that you can just copy and paste

into your own git configuration file

okay so i think we are now getting to

the hands-on

part we are going to inspect the history

of a project that we have been working

with

uh using this uh alias git um

graph or using the the full thing so

it's gonna take me a second to

go to our studio and get that ready

so in the meantime if there is any

comment question please go ahead

okay here is my art studio

i'm gonna do a little git status to see

what's going on

i see that there is a file there um

actually i like

this the other way i'm gonna move this

to my right

and then this other thing to the left

because that's what

happened to it before

i'm going to make this a little bigger

and there we should be more or less fine

okay

kind of almost a review as um of things

that we did before

i see i see a file a that has been

deleted that's

nothing that relates to what i'm going

to show now so i'm going to

unstage that i see that in the station

area so i'm going to do

um git

press set hit

status hit

the working tree with status

okay so now you can see that my git

status is clean what i did is i checked

out so the idea of checking out is you

know you go and get something out from

somewhere right so

um what i did is you know there is two

kind of copies of what i have

uh on my folder here one is inside the

git repository and the other one is

actually exposed this is what i want to

actually see when i go click a file

so what i just did is i kind of moved

the history of the project as it was in

the latest comment

with git checkout i did git checkout

dot which checks out everything and that

is kind of a bit of a dangerous command

but i know in this case what i'm doing i

just want a clean

um a clean staging area

to start using the commands that i see

on the lesson so what we see here is

basically is to do kit log but we know

that git log is a bit

too much information a kind of

instructor so we don't want that

instead i'm going to clean this with

ctrl l type the

up arrow to recover the last command and

i'm going to start adding the flags

all then graph so graph is what's going

to

make the git log to show the branches

and all

is going to show all branches that there

are so so far there is only one

line of development just the master

branch i don't think we have any other

branch

but if we are unsure we can type the

command git branch

so git branch now shows that there is a

branch called english

i don't even know how that match

appeared there but

uh but it's there and let's continue

with the

command so building the command

just type the arrow the app arrow to go

back to that command git log

or graph but then the

the flag decorate uh add

some colors uh which is great and then

the one line

makes the history a bit more clear

because all i'm showing

is the commit message the first line of

the commit measures that we

have learned two lessons ago that is

crucial to make it informative and sweet

short less than 50 characters or less

and so that you know we can get this

this kind of visual

uh snapshot i quickly know know exactly

what's going on in this project and here

you know because it's so compact you can

see how i can see

this branch called english there that i

may have added for some example i was

just trying things out who knows

um okay so that's the first

hands-on activity here you're welcome to

do that yourselves now or maybe

following the video later

or following the lesson and the idea of

you know using

an a um an informative git

log that allows you to see

which branches you have and how they

relate to the trunk master so in this

case what i'm seeing

is that there is no connection between

english and the master branch which is

the main line here

which means that this branch has not

been merged yet

so let's see what the lesson provides uh

okay it's talking about

you know three commits i think that

because you know we i may have kind of

done

a few other things for demonstration we

have a lot more commits

in the history of my rebel here and

we are the lesson reminds us that there

is

something called the sha which is an

identifier unique universally unique

identifier of each commit

that is uh it is crucial um

it is what we get when we do just git

log so git log

uh you can see that the shot here at the

very top is

f871d

but then if i do git log i do something

that is i get something that is it

starts the same but then it's much

longer why

okay because the git log

summary that i kind of create with all

these thingies

shows not the entire um

sha because it's very long so that it is

sure to be unique

but shows just the first few characters

which uniquely identify

that shot that means that we can use

that identifier

to refer to that commit to do whatever

to create a branch to

you know cherry pick a change that we

did in

one branch into another to revert that

commit a bunch of things

but shots are ugly you know it's very

difficult to communicate with someone

hey go to

co you know sha to commit f871d96

instead you prefer to say hey go to

master so master is now

a synonym because it's standing at that

point in the history and right now it is

the same

to tell you go to master it's the same

that's telling you go to commit

f8a f871d96

and same thing with hit but if i tell

you please go to english

branch then you would know that i'm

talking about the commit

fb2c5 d4 as it is now

but branches are movable so as i add

more changes those

those branches will point to a different

commit and if i want something that

points to a specific commit and stays

there

then what i want is this attack that

we'll cover later

any question up to here before i

continue here

okay so uh on which branch

are we the answer i think i gave it

before if

we want to know uh which branches we

have and which branch we are working on

right now

you use the command git branch and as

you can see here there is a little

asterisk

on the branch that we are standing

on you also see that my

working branch is in green and

i don't think you get that by default um

probably

i don't remember exactly which of the um

[Music]

configurations i have in my profile if

you would like to

um you know like a more informative

common prompt or more informative colors

for your branches and stuff and you

don't see what you want

feel free to book a help desk because we

have that information it's just it's not

something that is going to be the focus

of these lessons but

working with a cool command line is very

important for example this is mine

and if i jump to uh

analysis so this is how i jump to that

repo and i do a git status

like this or i can do gsa so there's a

bunch of things that you can do

in a customized terminal that are

worthwhile

investing a little bit of time so that

you get

um you know the the information in a

very clear way

colors help a lot and you know for

example informative logs

help a lot too uh actually

any question comment here so how you

know how to know where in which branch

we are

that's pretty straightforward maybe more

interesting is how to create

branches so if i'm in um

and and then we are going to stop there

because we have only four minutes to the

half hour

um i'm gonna talk about this um

this command here's uh probably the one

that i use the most which i don't see

here i see probably

under this is a shortcut okay so the

lesson is suggesting to create a new

branch called experiment

and and then we add

cilantro to the file ingredients.txt

so you know we are in master we did git

branch we know that we are master

because we see that asterisk there

so what we do now is git branch

and we just give the name of the branch

expert event

but as you will see if i now do git

branch

uh you will see that i'm still a master

i'm not on the master on the

branch experiment um but the branch

experiment has been created so then i

have to check out

the branch experiment and i do that with

git

checkout experiment experiment

there you go and your git tells me that

i have switched to that branch

but you can do a shortcut for kids

branch plus check out branch and that is

minus b

so you can do each checkout minus b and

the name

of the branch and that will you know not

only create the branch but also

move you to that branch so move the head

so

to that branch um if i run that i should

get an error because the branch already

exists

right but if you don't have that so

let's do

a branch that doesn't exist toy branch

you can see that i have created it and

moved to it at the same time so

to um

basically follow the list on a little

bit we're going to add the

ingredient to the file

the ingredient cilantro to the file

ingredients.txt so let's click on that

file to open it

and let's add that ingredient

cilantro right so i save that file

and now git already knows that it's

there right so i can stash it on r

studio just by clicking on it or i can

stage it here by doing

50 status let's see what files we have

okay i have the five ingredients

that has been modified what has changed

uh with kit diff i see okay i added

cilantro

so let me clear this with ctrl l and

then we'll get git add

ingredients.txt i use the tab that's why

you saw it

type so quickly and then i do enter

the git status now should show um

it should show that ingress has been

added to the staging area so and i can

do git commit

with a little message that says add

cilantro and

and now if i do um git log

let's do graph sorry let's do graph

all the great

uh one line

one line i think i mistyped something

now what i expect is to see that the

branch uh actually look at that i did a

mistake there that

um that wasn't supposed to happen so

when i created my toy branch

and started working on it and the change

was added to that branch right because

it was the last one that i checked

they checked out and it doesn't really

matter for the purposes of this

demonstration

that's fine all i wanted to show

basically is that now

the head has moved along with the

changes that i did in the new branch the

change has been added

on top of master and you don't see you

know that kind of branching into a

to a side you see just added to it

um okay so with that uh i would like to

stop because we have reached the half

hour and we have reached

uh at least a good a good point where we

know how to create a branch

we understand what a branch is that it

moves with the changes that you make

we understand that master is just a

convention nothing special about the

name but it is what

would the only long-lived branch in a

project that uses the github workflow

and we also know that head is

a synonym for current branch uh we know

how to create a branch and then check

out and we know how to create and check

out the branch all at the same time

and you also know how to mess things up

as i just did with uh

with my toy branch any comment question

before we leave

yeah no i don't alex or anyone else

makes sense yeah

makes sense from the perspective of who

actually has the authority to bring

something into their

report that's cool some other common

question

no okay again can i apologize for moving

a little slow but that's exactly what i

want to give the opportunity to

you know build that mental model with

all the elements that that we need and

to ask

questions hopefully next session will

either finish this

or um and then having the next one alex

talking about

um i think it's gonna be that the best

way so that the team focuses

so the pacter team focuses on um

on uh you know what what we are doing

right now and then we reflect on what we

did

based on the brown brown lunch

that constance is organizing plus

alex's experience thank you very much

then see you next time

ciao
