---
type: Video Transcript
title: "Merge conflicts"
description: "The terminal and in particular a topic that is very close to a lot of us heart which is the idea of conflicts and specifically in the context..."
resource: "https://www.youtube.com/watch?v=5gmTK8Cb-WE"
tags: ["ds-incubator", "merge-conflicts", "rebasing", "pull-requests", "workflow"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=5gmTK8Cb-WE"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2020-11-24T00:00:00Z"
    usage_count: 16
usage_window: { from: "2020-11-24T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

so today it is the DS incubator again

covering uh kit from the terminal and in

particular a topic that is very close to

a lot of us heart which is the idea of

solving and avoiding

conflicts and specifically in the

context of vate we talk about merged

conflicts so uh this is a topic that I

think Alex already shareed very good

ideas and hopefully this will formalize

those ideas a little bit it's meant to

be a pretty sweet short session so I'm

hoping to kind of get through all of it

by just skipping a few things um and

focusing on what's I think more

useful so the very first thing I wanted

to cover is this idea what is emerg

conflict and Mer conflict and how it

happens I think that this figure puts it

well so let's think that in this uh left

hand side of the figure we have

file H and it has like three lines the

first line you know is has the text that

says two avocados the second line two

tablespoons of candra and so on so now

now let's uh imagine that you know we

already discussed branches so let's

think okay we create a branch this one

here at the top is one branch and the

exact same file you know the file has

the same name but you know now we add a

new line the first line now is you know

one line you know has that text and the

second line line in the second Branch

the first line is not touched at all so

if we focus on that specific file on

that specific line uh if we merge those

two branches in line one there should be

no conflict because it is a change that

was added in one branch and you know

nothing happened on the other so G knows

okay what we want is to Simply add the

line there so that's clear it can do it

for us same thing happens on the last

line of this Branch here at the bottom

so in this Branch you know we added one

line that says half onion and that line

has not been touched at all in that file

on the H Branch represented here at the

top of the figure and therefore it knows

what to do we just want to add that line

so there is no conflicts between the two

lines but here in red very um suggestive

we have a conflict what we have is that

the branch at the top uh wrote one

tablespoon of cantro and the um the

exact same line in the exact in the

exact same file but on a different

branch added a different text three

tablespoons of cilantro so merch does

not know by default what we actually

want so which of the two branches should

kind of win if we ask it to merge and

therefore ask as humans to make a

decision there is uh automated ways to

resolve this conflict um and I'm going

to cover that briefly as well but the

more common scenario is where we are

confronted with the need to solve this

conflict as as humans and uh maybe to

have a conversation between colleagues

to see which of the two versions We need

to uh accept or maybe even a combination

of the two sometimes it's a third

version it's not the line that was

introduced in Branch one or the line

that was introducing Branch two but

instead a combination of the two so um

this is kind of the mental model of what

is a merged conflict and how it is

introduced uh this is an important thing

that um I would like to kind of make a

little pause and see if there is

anything to extend this notion or if

anyone has know a question or

comment I have a quick question so one

thing that's always been caus me to like

question what I what is going on or what

I think is going on is so the first

example with one line like this is clear

to me line one is changed or not changed

but in this second version where it's

below so whether or not you first add

this line at the top and then the line

at the bottom this can change like the

line that it's on so I guess in this

case you're starting off with kind of a

blank first line but in the cases where

like say there was not a blank line in

the beginning and you added a blank

added this new line then in the other

version where you're adding a line line

at the bottom then to me I'm never

really 100% sure whether kid knows

that's like a new line that's not

affecting the others or is it just is it

based on line numbers only or is it more

hereis if I can jump in

here um GS differencing engine is

actually pretty

smart um and it actually looks at the

contents of the line rather than

anything to do with line numbers or

anything so if you were to take this and

then add 50 new lines at the beginning

it it would still be like oh the two t

two avocados two tablespoons cilantro

two teaspoon salt even if that jumped

all the way down to line 70 or whatever

it would recognize that there have been

a whole bunch of new insertions at the

beginning um a different symptom of this

is when you interject multiple new lines

sort of next to each

other um sometimes it can so like let's

say we added a line in between the

avocados and cilantro and then another

new line in between Cilantros and

salt um sometimes it can get confused as

to whether you have added two new lines

or uh changed one line and move changed

it into three different

ones um so it the exact nature of the

diff algorithm is not um it is smart and

it is capable of actually recognizing

content but

um the exact nature of how it does that

is is not necessarily going to affect

whether or not you get a conflict one

way or the

other thanks I Le to me that comment did

help a lot because you know the the

simplify mental model that I shared in

the beginning is is you know too simple

obviously does not explain our

experience as as uh CJ highlighted um so

thanks thanks for that do do we have any

kind of comment following or question

following that up and know I feel

satisfied with with that but go ahead if

you

have a good that's that's great I guess

that you know my

takeaway is that um for example if I

need to add a new line I shouldn't kind

of worry about well I'm should I add it

at the top of the fight or at the bottom

of the file because in terms of merge

conflict it's not going to I guess make

any difference is that right

Alex yeah cool uh okay so now I'm going

to just skip all the way to the end of

this

lesson uh to avoid um to discuss how to

avoid mer conflicts and this should be

kind of a summary I think of uh

conversations that were led by Alex

before

um some of these points here maybe don't

resonate too much with me but uh I guess

that they take away um I'm going to kind

of mention some things if you want to

you know as I speak read through this

and highlight something that kind of

resonates with you go ahead

um I think that it is useful to kind of

plan a little bit your strategy like in

general um and it is not the same to

merge uh you know two Branch any two

branches you know if if one branch for

example recently I I kind of noticed

that in one particular repository we

have some branches that are kind of out

of sync with the master Branch so I

recommended that um you know you know we

try to update those branches to have the

latest changes and thus you know the the

new version of those branches wouldn't

wouldn't have too many differences um

accumulated uh which increases of course

the chances of of marage conflict so how

you plan your strategy how how you

develop um you know your workflow around

branches I think it is uh important

avoiding mer conflict um which also

relates to this so if the if the two

branches are going to be merged um have

too many unrelated changes then the

chances of course increase of merge

conflicts uh the idea I think that was

discussing in different um forms the

idea that you know one we we kind of use

a lot the the phrase you know H be

request should be small what we um and

in othera in other cases we refer to I

think that's that's what Alex said that

okay the the size of the pr is more not

so much about how many lines but you

know that is ready to do one thing uh

and if that one thing is a unit that

does not clash with any other one thing

that someone else is to and then we

should avoid that that should kind of

avoid Mar conflicts um although maybe

you know two different tasks do touch

the same files it can happen but I guess

that you know trying to uh work around

the idea of just one thing one task

should help in terms of collaboration

you know having conversation between

colleagues you know if we know that

we're working on the same uh repository

um maybe we can organize so that way one

person is working on one file the other

person is working on a different file

that shouldn't cause any merage conflict

at all so the idea of breaking breaking

down files in in a reasonable units that

makes sense for that project uh helps a

lot too terms of semantic confid that's

an interesting one that I hadn't

considered but it's an interesting thing

uh maybe to to reflect about I won't

spend too much time on this but maybe

the idea that sometimes there are

conflicts in the project I think we

discussed this with CJ recently some

some sometimes you know there are

requirements in the project that are

conflict and those conflicts are not

exposed sometimes by the tools tests are

pretty good at that sometimes if you

express every requirement in the form of

a test sometimes you do guess get tests

to fail because of a conflicting

requirement and then you can have a

conversation saying hey look you know

one week ago we discussed that this

object should be a data frame and th I

wrote a test that says that checks that

it is a data frame but you know today

you're asking me to make it a list and

therefore it is a conflict here you know

you know the two test canot pass it

cannot be a data frame well maybe at

least yes because data frame is a

particular case of at least but I think

you get the idea that you know sometimes

there are conflicts that may not be

catched by the tool are more like about

the meaning and that's that's an

interesting thing to kind of reflect

about um other things that I I noticed

maybe I don't have very good examples

about how this good happen but the idea

of modifying global data uh can cause

conflicts I guess that the idea of you

know like with any change that we do if

it has a scope that is entire project um

like anywhere else there could be a a

conflict not very sure how that would

reflect to merge conflicts but there

could be conflicts basically you're

changing something that you know you

don't know what's going to be the impact

because the the scope is too large to to

see in just one screen of your of your

computer the idea that uh um you know

breaking down files that I mentioned

that before if you have just a one

monolitic um project that has you know

one gigantic file everyone is going to

be working in the same file so of course

you know that increases the chances of

conflict H and that's the opposite of

that could be to break up you know the

the project into any modu that makes

kind of sense sometimes those modules

are independent enough that can have a

life of of their own and they can live

in different

repositories um technical measures I

think this one is is one that we have

discuss the idea of okay once you're

done with something if if your thing is

small if that's one thing you should be

done fairly quickly I think Alex

suggested less than a week or less than

a few days if that's the case you could

be pushing your finished po request

early and often and that should minimize

mer conflicts um remember to keep your

even if if you're not doing that

remember to you know keep updating the

your your local branches with the

changes from your app

repositories um and just confront the

fact that if there is marriage conflicts

just you know face them as early as you

can because they're just going to get

worse with time um right so the one

thing maybe some some time here to to

extend what we see here or uh yeah ask

questions I have a question

that's not totally related to what

you're talking about

um what does rebase do exactly or is it

covered in some other uh incubator that

you can lead me to yes I know well last

last um incubator we talked about the

second half of branching um and so when

you uh branching merging uh and Rubes is

a different flavor of Mer in histories

except that it changes the history of

the repository so basically um I don't

think you are here so I'm going to be

brief in this then you can review last

incubator basically imer is you know has

two parents and ERS commit sometimes the

me commit doesn't exist if if G

identifies that it can do a fast forward

which is okay I'm going to move these

changes to the top of the latest commit

uh but you can also force that with a

rebase sometimes even if if kid is not

able to do a fast forward you can tell G

every commit that I have in this branch

do not attempt to merge it instead just

cut it from the trunk and stick it at

the top and that will change all the

identifiers of every commit so all the

Sha of each commit will change meaning

that the history of your repository will

be different and that's totally okay if

you're working locally it is not okay if

you have already pushed that branch and

started sharing with the world um it's

too much and I know this is that if if

this doesn't make sense we can talk

about rasing later but in my head the

way I think of it is you know you have a

car you are behind a car when you rease

you just go you know you pass them and

go to the top that's that's how it looks

the three of a g repository once you

have rased instead of having like

something that stems out of a trunk what

you have is just you know a common line

going going up it's just one kind of uh

of way to incorporate you know what's

happening in one branch into the main

the main trunk or into any other Branch

yeah um so basically like if I would

work locally and um I have some local

comits and then I also pull from the

Upstream

master and if I for example don't want

this merge from Upstream to be visible

in my pull request would I then do

rebase so that I'm kind of like the at

the most recent

master and then only my personal

comments are visible would it

yeah it will certainly change the

Topography of your G repository and when

you say when you what you say when you

when you I think what you mean when you

say I wouldn't see the merage com is

true I mean a rease will not produce the

merage commit and there's not going to

be a commit has two parents so marage

commit is very special in that it has

two parents as opposed to just one H and

you know aesthetically it may not be

very pleasant to see you know that kind

of beercation and then that merge commit

but it is actually the one that

preserves the most the history of the

repository so you know some teams decide

to actually always use merage commits

other teams decide to you know accept

rases and in any case you know you can

have a workflow where on PO requests you

can have merch commit or aasis whatever

you want but then you know you when you

mer merge a pull request into your

Source repository you squash every com

and thus even if you have a merch commit

in the P request that will kind of

disappear there will be no evidence on

that on the final mer squash

commit um maybe someone else here with

more knowledge of G could complement if

I kind of had a little bit of a gap in

my mental

model yeah it it is a bit of a hard

thing to just in two minutes so I

hopefully with that you know you more or

less understand what's going on but I'm

very happy to point you to other um

incubators so you know we can chat about

that okay uh so the one thing that you

can do when you uh you are still not

ready to merge conflicts because you

want talk to your colleagues or whatever

is just to get merge aboard and that is

H kind of the obvious thing to do if the

command that you are running is get

merge but the one thing that I wanted to

say that is not written in this lesson

is that some commands like pool do a g

fetch first and then emerge so it might

be not very intuitive to to know that if

the last command that you run on G was

get pool and if you have merge conflicts

maybe it's not very intuitive to to know

that oh what I need to do if I want to

abort is get mer aort so why merch if I

was actually pulling well if you read

the documentation of kid pull it is a

exactly G fetch follow but G merge so

that's the one thing that may be a

little tricky but in general when you

are on a you know merge conflict just

merge abort will kind of go back to

where you were and then you can you can

think what you want to do but the idea

of what follows in this uh lesson is um

that of explaining how it looks to solve

a very simple mer conflict so that you

don't fear them I mean merch conflicts

are a natural part of working with kit

and uh at least in this kind of toy

example I'm hoping to illustrate you

know how we introduce them how we can

fix them H in two ways one that is

manual and one that is automated if you

know which of the two lines of

development should win over the

other so we're going to get into a

little bit of uh coding here um do we

have any question or comment before I

get into that um I wanted to make one

comment the like possible ways to avoid

merage complect because I felt like that

list was not very precise or definitive

or specific um so like one thing is if

you're working on different files then

it's very easy to avoid ver conflict um

and this is something that can be

achieved one by like you know planning

not to do that but also like if you do a

kind of good thing in terms of like

separating the large s code files into

smaller chunks then it becomes a lot

easier for someone to work on like one

file while someone else is working on

other file and that's I mean maybe

that's a very simplistic thing but I

think it's maybe you know relevant in a

lot of cases for us if we break the

files into more precisely what they're

actually working on they're only like

you know Max 200 lines of code and it's

very easy for like Jacob to work on

something that's you know working on

that one file and me working on

something completely different so I

think that's maybe one simple way that

we could easily try to avoid some of

these

um I I think I'd like to follow up there

that um merge conflicts are

not like they are not the problem in and

of itself they are a very technical

symptom of a bigger problem that is um

not communicating in a project about who

is doing what

and where things connect to each

other um so I I think it's a if you find

yourself getting some merge conflicts

that is fine those can be resolved but

if you find yourself getting a lot of

merge

conflicts um the question then becomes

why are we getting

them um and I I think another big thing

that is in involved in merge conflicts

is what is the group's strategy to

resolve

them um and more importantly who

resolves a merge

conflict um I have always worked at a

place that um whoever is making the poll

request they have to solve the merge

conflict it it is not and if they don't

resolve the merge conflict then nobody

else will do it for

them thanks Alex I think it makes sense

um that encourages the idea of um kind

of keep all the time as as much as you

can up to you know in sync with what's

happening in the master Branch or in the

main branch whatever is the main line of

development U you know just all the time

you know keep keeping in sync so have

about 7 minutes I'll see if I can cover

all that but the idea now is to create a

merge conflict as what I'm showing you

here is that I'm standing on uh the

master branch of this project H and I'm

going to be working on this file called

ingredients um uh what I'm going to do

is I'm going to edit this first line uh

in two different ways oops I think

probably because I waited too much

before opening this session I'm going to

refresh this so continue with

explanations of basically I'm going to

be working on two different branches H

I'm going to do conflicting changes to

that Branch let's go back to home and

then I'm going to try merge one at a

time on Master basically simulating the

scenario by which two collaborators are

working on a on a project and they they

they do something that you know kind of

conflicts with each other so uh let's

review get um

Branch yes I am a master H so that's the

only branch that I have so let's create

one branch that is called uh like

cilantro and in this Branch I'm going to

um edit this as more cilantro going to

save this file and do G status just to

show you that in fact I have edited that

file I could do a g diff as well you see

that what the change that I did is I

added more cilantro so let's do get add

uh ingredients. txt get commit with the

message

more and done so now let's go back to

master ah actually sorry I think I was

wrong I think I did the change in

master in fact I am in master so what

I'm going to

do uh like cilantro so you see me kind

of debugging my own problem what I'm

going to do is a pattern that you know

we cover before um I'm very used to

doing git check out minus B which is a

command that creates the branch and

checks it out at the same time H so now

I'm in the branch like cilantro I'm

going to

do I don't know if we cover this command

I'm going to just ch pick one particular

commit from the master

Branch from the m

right so if I now show you the log just

one line maybe graph and

decorate H what we should should see is

I'm now here on Cad and the reason why

we don't see Master is because I didn't

add the flag all uh here you are so what

I want to do actually is is revert M I'm

just you know fixing the problem that I

did before I didn't want Master to move

I want to move Master to this commit

here so what I'm going to do

is uh get Branch master I'm going to put

it on this commit and I'm going to force

it so if I do now the log one time again

H this is we know what the scenario I

wanted to show so now my Branch like

cilantro is one commit ahead of Master

right and it added more cilantro so what

I'm going to do is I'm going to get

check out

Master H and from here I'm going to

check out a new

branch that is called this like

cand and this time I'm going to use the

the flag minus B so that I um create the

branch and check it out at the same time

so I don't commit the same mistake that

I did before so this

like

cantro and here

I'm going to this time confirm that I'm

on that Branch so one thing that I

totally recommend is to always change

your command line prompt to include the

branch in which you are standing which

is something that I do in my local um

environment but not he I didn't do that

here in this Art Studio project that I'm

showing you so in this new Branch dis

likee cilantro I'm going to add a a

change in the different direction I'm

going to say half cilantro and I'm going

to commit that so this time I'm going to

just be commit minus M if you

remember uh the command commit if you

give it the a name of the

file it does the equivalent to commit

and add as well it adds and commits that

specific file so with this I'm going to

show you again the log how what it looks

like so here you see how you know my

master Ranch is one commit Behind These

two branches each of these two branches

are you know you know branching off

Master each of them has a change but

those changes are in conflict that

conflict will not show up if I check

out Master first if I merge one of them

say G merge uh like

cilantro that's fine I mean there is no

conflict between master and that Branch

so the change should just happen that's

the situation I'm now so now in this H

commit I have two branches pointing to

it master has moved

to the same position where like Sandro

is because those two branches are now

kind of merged right but what happens if

I now merge the other one from here if I

do G merge

this like

candra now I see a merged conflict how

do I explore the merged conflict well

this file will update in a moment maybe

I think it's there you go updated to

show what the conflict is but sometimes

it's not so obvious so what you can do

is just edit

div and that will show you know among

the changes that that merch introduced

you should see very explicitly which is

the file with the conflict and you know

basically what is the problem so the

manual solution of that I think most of

us sometime face something like this the

solution is okay decide talk to your

team if you want this line if you want

this line or a combination of the two so

say that I prefer more cilantro with

decide that this is the way to go so all

I need to do is just to remove the the

markers and leave the line that I want

but I also have the opportunity to say

something completely different to what I

said before I save the file and the way

you mark the merge conflict is solve is

with G

ad G ad

ingredients now you can do a g status to

see uh that there is no more merge

conflict if I do G div

I could confirm that my diff let me

clear this up the G diff now shows no no

difference if I do get diff Cas to see

what I have already in the staging area

what you see is that the change between

what was the file in master Branch right

before the merge and now that I have

fixed the merge conflict so let's

confirm this you know actually complete

the commit so get

commit with the message fix merge

conflict manual nor

Al and let's do this in file

ingredients cannot

commit let's

see

Comm what am I missing here can anyone

see fix

conflict there you go I think

okay it work for some reason it didn't

like during the merge conflict to for me

to add the specific file um that's

something I I don't have a lot to say um

about so that's the solution for the mer

conflict manually hopefully that isn't

strange for many of you and very quickly

uh I know I'm a bit beyond so I'm going

to do this very quickly so what I'm

going to do is uh this you shouldn't uh

it's not something that we cover in the

lesson I'm going to go back

[Music]

to to the point in the history of this

commit where I had merged just one

branch um

so let's see the log

oh there you go okay so I'm in this

situation that I was before where you

know what I did with the refed log is

something you don't need to know in this

lesson but basically I went back to the

you know to the G repo as I had it

before the last merge and now I'm going

to merge with a different strategy I'm

going to say G merge using the flag

minus X hours tells that the the branch

hours means the branch I'm standing

right now that should win over the

changes of the other branch that I'm

going to mention now which is this

like

cilantro this means that if there is any

conflict the uh changes in the branch

that I'm standing right now is going to

override the changes in the other Branch

so if I run that command I am just

exposed to the interface to accept the

merge um solution I mean to the the

merge commit which I

accept and uh as you can see the the

merge has been made and the file has

been saved uh with the the change that

was in the branch that I I accepted to

overwrite the other one um maybe just

for a final uh demonstration let me show

you the the log as you can see there is

a merg commit here and I was wasn't

exposed to the interface to merge the to

fix the merge conflict manually because

I explicitly said which branch should wi

that was really fast and the information

is there on the lesson so if you want to

read it slowly go ahead and do that in

any case it's very rare that we could do

this kind of um automatic solution more

commonly we could do it manually I've

seen a lot of uh comments in the chat

could anyone summarize them because I

didn't have the time to kind of present

and read them at the same

time was just asking about uh different

ways of using G diff basically and if it

only works with the differences between

master or if you can specify other stuff

perfect did you I think you learned a

lot about that recently Jackson did you

share your

thoughts I did I have I have way more

thoughts to share as well but get is

super powerful yeah okay any parting

comment before or will leave because I'm

late I'm sorry for

that okay don't be afraid of merge

conflicts um it's part of um some of

them I really like the way Alex put it

some of them are just the part of G life

if you have if you find yourself fixing

merge conflict every time you want to

merge something that means probably that

we need to kind of revise how how we

work together thank you very

much thank you marow

byebye thanks bye byebye
