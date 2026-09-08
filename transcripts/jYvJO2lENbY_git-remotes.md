---
type: Video Transcript
title: "Git remotes"
description: "Working with Git terminal today is an exciting lesson because we are going to be talking about sharing repositories online and uh using this idea of remotes which..."
resource: "https://www.youtube.com/watch?v=jYvJO2lENbY"
tags: ["ds-incubator", "git", "github", "terminal", "workflow"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=jYvJO2lENbY"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2020-12-01T00:00:00Z"
    usage_count: 6
usage_window: { from: "2020-12-01T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

so today the DS incubator continues with

the series about uh working with Git

from the

terminal today is an exciting lesson

because we are going to be talking about

sharing repositories online and uh using

this idea of remotes which are

repositories that live in a computer

outside our own computer uh or sometimes

actually could be a remote inside our

own computer too so basically the idea

of remote is relative to one repository

that is conceived as

local so um I've been skimming through

the lessons um about you know remotes

and there the information is kind of

scattered um so I'm going to going to

give you first an overview about you

know where you could find information on

your own uh and I'm going to really kind

of cherry Peck um the few things that I

think are key and and Show an

example so H the lesson that you're

looking here on screen is uh a very

quick introduction to setting up a

remote repository which we are going to

cover uh but it doesn't have a lot of

wisdom really um instead you know when

you go down that lesson you will see

that there is a section that uh talks

about cloning a repository and it has a

link to a whole new lesson about

collaboration with distributed Version

Control which is good so when you click

there then you will you will find a

bunch of other lessons that you're

welcome to explore uh I don't think

we're going to cover uh all these

lessons because we will be moving like

really too slow and I think that at this

stage a lot of us have a lot of a lot of

um experience with kid and I think we

just need to spend some time um kind of

clarifying the few things that don't

seem to work quite well all the time so

I would prefer to spend more time in

just polishing the the few things that

might be unclear as opposed to just go

going through a huge overview of things

that a little maybe already kind of

understood so um instead then so this

this time kind of departing from the

lesson quite a bit uh so instead the

motivation um is going to be working

with one particular repository like a

real life case um I'm here in a

repository that lives in the two degrees

investing organization the repository is

called R2 R2 a I match it is an art

package but it is just in this context

is just a GitHub a git repository that

is hosted remotely on

GitHub so um in covering more or less

the the topics of the first lesson the

the very first thing I wanted to talk is

about how you set up a remote so I'm

today I'm going to be working from my

own terminal because I feel more

comfortable there and uh it kind of more

closely um ex you know shows how I

actually do things and with this I'm

hoping to kind of inspire you to find

your own tools that work well for you

and doing so is important because it can

save you a lot of time and headaches and

I'm going to be trying to advocate for

the idea of using um tools that automate

processes that otherwise could be um

very easy to make mistakes

so um how we configure a a clone uh and

again I'm going to be talking about this

example uh working with these particular

repositories okay so I have this

repository online and one of the many

ways in which you create a connection

between a remote repository a repository

that lives in this case on GitHub and a

local repository is by cloning it so

that that's a quite um common workflow H

other ways could be when you create a

repository from scratch but that is not

so common so the lesson actually was

showing uh quite a bit on that and I'm

going to basically skip it because um it

doesn't have a lot of uh new things uh

to us here so what I'm going to do is

I'm going to open a terminal here and

I'm going to make this a little

bigger there we go um Let Me Close

something else that is boring me here so

I am here on a on my local computer on a

repository called TMP For Temp and um

here I'm I'm going to execute the

command git clone which basically gets a

reposter that is somewhere else into the

location where I'm standing right now so

in this case inside this folder called

called TMP and uh you have to give it

you know in the same way when you visit

a web page you need to visit you know a

URL like something that starts with like

https whatever um this is very similar

this is also a URL but it might look a

little different to what we are used to

and the reason is because git has um

more than one kind of URL so um when you

click here on the main page of a

repository just by clicking the name on

it for example if you go to code you

will see that uh there is this address

here that is the URL that I used to

connect basically my GitHub repository

with my logo

repository if I click on uh the https

tab this URL will transform in something

that is more common uh for those who use

https if you don't know the differences

between https and SSH it's fine for the

purposes of this lesson but every

everyone in this um meeting is

very involved in G and G have so I

recommend investigating on your own time

what it is an SSH um connection

basically add some security to the way

you communicate to inhub so you could

copy that address in however you like uh

and then type it on your

terminal and that should just do the

trick so I'm going to execute that

command and see what happens as you can

see git is already cloning that

repository we can think of it as an

action of downloading the repository

remember that a g repository is just

that one dogit folder that contains not

only the state of of of the project as

it is now but also the entire history of

changes of that

repository so I had just cloned this

repository from this address how to

interpret this address uh in the in the

https protocol might be a little easier

uh so I'm going to explain this one here

because it's a bit less natural

basically um as you can see here you

recognized the owner account in this

case the organization two degrees

investing if you are pling something

from your own uh account you could have

your user name there and then here is

the name of the repository ends in git

and uh basically this is a connection

between a remote oops sorry a remote uh

computer here and uh and you so the

first thing I need to do now because I

clone the repository and if I do an LS

you know I should see that listed in the

um inside this directory I should see

somewhere this repository here so the

folder has been cloned inside my working

directory so I'm going to CD change

directory inside

r2d

match and uh the command to ask git

about remotes is git remote so you do

git remote

and if I do just that I will get a name

which is a nickname for the remote but

that is not very informative instead you

would usually want give remote minus

VV v stands for veros so let's see what

happens if I do just minus v u

maybe I think I get the same information

so basically git remote minus V will

tell me what is the connection that I

have available between my local

repository and the repository I have

just cloned and as you can see this is

the address that I typed and origin is

just a nickname a way that I can use to

refer to that address without spelling

it out because it's awkward it's long

it's easy to forget what it is so I can

refer to uh that remote just by using

the word origin there's nothing special

about that name it's just a default name

for um yeah you know between git and

GitHub uh that's the the default that

you get so my connection is there I

could do something like

fetching the latest changes so I have

clone this repository a few moments ago

maybe two minutes ago while I was

talking so what if someone included a

new change into this repository on the

remote well this is one of the very

first things that I really want to kind

of emphasize and make sure that we are

on the same page this idea of keeping in

sync your local repository with your

Upstream repository in this case the

repository in the two degrees

organization it is crucial because if

you want to start working now on a p

request on a branch locally that then

you intend submit to the remote

repository then you want your local

branch to be as updated as possible

compared to the remote one right so the

very first things you could uh you could

do is to fetch to bring all the metadata

Associated to this uh repository from

the uh remote so I could do something

like G

Fetch and you could be explicit and say

what do you want to fetch I want to

fetch from the address origin and this

is not important here because I only

have one connection but I could have

many connections I could have many

remotes in many different places for

example one remote could be pointing to

two degrees investing organization

another mode could be pointing to my own

user account to that one sometimes we

call it a fork um and then you you could

keep many remotes many addresses and

each of them would have a nickname it is

quite common that if you have only one

then that one would be your origin and

when you Fork something generally your

origin becomes your own fork and the one

that is this main source of Truth the

one of the organization is generally

called Upstream I'm just throwing a lot

of jargon here I'm you know assuming

that a lot of us heard that jargon

before it's not going to be something

new but uh but please do ask me if uh if

it's unclear so for now I'm going to

just use a very simple examp example

where I'm going to use this remote to do

something so I have just fetched the

changes from origin but I haven't

actually merged anything so if there was

a change which there wasn't because K

didn't he didn't give me any information

about changes but if there was anything

I couldn't have included those changes

into my master Branch to do that I could

have um needed to do something like G

merge uh origin Master what does this

mean well you already know what a g

merge is because we have been talking

about branches how to merge branches and

you know that you know if you are

standing on One Branch in this case

master and you say get merged some other

Branch then those two branches get

merged in this case the syntax may look

a little weird but it is this is just a

branch so you can refer to a branch uh

by giving it the name of the um the of

the of the remote slash the name of the

uh Branch right so if I do that command

I'm saying hey G please merge my master

Branch

here with the master Branch but on

origin and I could do weird things like

you know merging the master Branch

locally with you know an a branch that

is not called Master it could be called

whatever right so you have a freedom to

merch whatever you want but that's the

Sy kit merch remote

uh Branch name basically so that is

pretty um common to fetch something and

then merge those changes merge uh is an

actual way of changing your logo

repository but fch does not change your

local reposit just gets the metadata so

that you can then execute merge but

because those two actions are so

commonly follow one you know merge

follows fetch uh there is a shortcut

which is get

so if you do G

pool

uh if you do nothing else H git will try

to use any uh setup configuration that

it already has so I am I'm going to just

run git pool and see what happens H it

looks like H what what that g already

knew where to get things from and the

reason is because there is automat

automatic um things that it does for us

when we clone a repository from GitHub

I'm going to show you that in a moment

to just know exactly which branch from

my local computer is tracking which

other branch on the remote but for now

what I wanted to express is that gitp is

a shortcut for git Fetch and git merch

it is exact same thing if I do fet git

fetch origin and then git merge origin

master I achieve the same that I achieve

if I do just gpol origin Master right so

let's try that in a more explicit way

way actually I think I don't think the

pool may have it uh orig origin I don't

think this will work let's see

Master

yeah yeah origin Master that's not

that's not the way you execute the

command so just get pool

origin that will be the way you express

it so one way how do you know that um

you know which branch git will will

associate on the remote to your local

branch well the remember the command git

Branch if you say nothing else than G

git Branch you get a very boring um

description of your of your branch but

if you do G Branch minus VV you get a

more informative one so what what how

you read this sorry for the colors my

screen is uh probably a bit too light H

what this means is that the local Master

branch is automatically tracking changes

on the origin Master Branch so that

means that when I do git pull the branch

that git will pull from the remote is

the one that is configured

here right and let me show you what the

world looks like when that automatic uh

Upstream is not connected so let's let's

say that we want to create a p request

uh so the first thing that we do is we

create a new

branch and actually the way I generally

do do it is get check out sorry I didn't

mean to do

that get

checkout minus B which creates a new

branch and then checks it out and let's

call it

PR so I have effectively created a

branch and have moved to that Branch but

if I do a a git log say one line

graph one line uh

decorate as you can see both my master

branch and my PR Branch are still

pointed to exact same commit because I

haven't done any change so let's let's

start doing some something here let's

say that I create a new file let's touch

the file a to say something if I do get

status now you see that there is a new

file a that did g doesn't know about so

let's say that I want to add that file a

and then get

commit i a

now my status should be clean but my git

log should sh should show me that now my

PR has an extra commit compared to

master so I'm ready to push it to my

remote but before I do that let me show

you the output of Kit

Branch git Branch shows the following

remember git is H created an automatic

connection

between my local Master branch and the

origin Master Branch so that if I do get

pull standing on the master Branch G

will know that what I really want to do

is to fetch from the remote origin the

master Branch sorry to fetch every

information in the origin and then merge

the master Branch so those are automatic

actions that came U Were set up when I

when I clone the repository but notice

that I don't have something like this as

assciated to my PR Branch my PR branch

has nothing here right there's no square

brackets saying you're tracking a remote

Branch anywhere so how do I do that okay

usually a common way to do it is when

you

push something to uh GitHub so the the

command is of course get push you can

say minus U which is a way to express U

stands for upstream and Upstream means

this automatic connection between your

logo repository and your remote

repository so you can when you push

something you can already tell git to

keep track of the branch are going to

explain right now so you could do you

could do get push and at the same time

while you push set this up and then you

say h origin in this case because I want

to set up my remote origin H and the

branch in this case PR so this will

create a branch PR

called PR on the remote origin that will

be tracking automatically my PR Branch

locally that way next time I want to for

example push or pull I just do get push

or get pull without having to explain

origin PR right so by doing this minus U

I create that automatic connection so

that's one way and let me show you

another way uh actually this is probably

the way yeah let's do it this way

first so by doing this what I should

expect is that if I now go to the

repository online on GitHub I should see

that there is this new branch that has

been pushed to to the gra uh investing

right so that branch is

already uh ready for me to create a

request so let's update this page

here uh as you can see now the G have

detected that there is a new Branch I

could immediately click here um to

create the P request I'm going to do

that or I could go come here to P

requests and the same thing happens I

already see that there is a p request

here I'm going to click here compare and

P request I'm going to uh confirm that

it's looking good so yeah from the

branch PR now all all of this is

happening in my remote copy of my local

repository so I now here on GitHub have

a branch that is called PR and I'm

proposing these changes in this case the

addition of the file a to be merged into

the master branch on that remote too the

reason why I can do this is because I

have um now my remote connection set up

you know I was able to push that branch

and at the same time H I set that

Upstream that connection automatically

and I'm going to to show you that in a

moment so for now let me just create

that P

request so this is a workflow that you

are already familiar with here is my

commit you know what I did and now

locally let me show you what my uh what

the output of Kit Branch looks like now

so let me clear this up git Branch minus

V now shows that the branch PR now also

has this bracket thing section that says

that this Branch PR is associated with

this PR branch on the remote origin and

you remember now that me my

remote origin is the one that is

pointing to to the investing right so

that also means that if I do G pool I

don't need to specify origin PR so G

already knows that what I want to pull

is from origin and the branch

PR okay so we have our connection here

and

um say that someone uh is you know I I

propose that PR and say Jackson on the

other end of the world is um you know

investigating that PR maybe adding some

changes and so on and so forth say that

I want to continue working on that PR

what should I do well the first thing

you need to do is to update your

PR with changes that might have happened

in two branches one is my own Branch my

own branch on uh the remote is now

exposed po to the maintainers and the

maintainers can push changes there so

how do I make sure that if they did add

any change how do I make sure that I

incorporate them into my local

repository before I continue working

well with the command gpol which is what

I had just done so what that does is as

remember is a git

fetch right git fetch will bring all the

metadata from that remote in this case I

could be more explicit get fetch origin

right so that will Ming all the metadata

from the remote origin into my local

repo but hasn't merged anything then I

would be doing something like git

merge origin

PR right so this is the explicit way to

do all that I achieved just by doing

gpol so G pool now that things are set

up that's all of that for me is

equivalent to fetching origin and

merging origin PR in this case so with

that I made sure that if there was any

change pushed to the master to the

branch PR On the Origin uh remote now I

have it locally here but what happens if

some change was included in the master

Branch because this is you know this is

uh the it is maybe not the only P

request so maybe someone else is you

know submitted another Pro request and

that Pro request got merged into master

and then that Master Branch H got um you

know has one more change different to

the one that I have here so well what I

need to do to keep really in sync is to

now also merge the master Branch from

the origin right so what you do is same

thing you know you could do a g fetch

origin if you want it to be explicit and

then you do a g merch origin Master

right if there was any change in master

branch on your remote origin then that

change could have been included in your

PR so the takeaway for today is as we

work keep in mind that if we are working

with uh a remote generally there is two

places that you have to keep

synchronized one is your own branch on

your remote and two is the master branch

on the remote again as maintainers

Continue to update the master Branch you

need to make sure that those changes get

included in your PR because you don't

want it to fall too far out of sync

because what happens then you increase

the chances of having merge conflicts if

your PR is never updated against Master

on the remote what will happen very

likely is that by the time you actually

want to merge your PR is going to be too

far behind the actual Master on the

remote and then you have to deal with

merch conflict it's easier to fix the

merch conflix conflict as early as

possible if there is any and this is the

way to keep out of sync so you get pull

to update your branch and you get fetch

and merch origin Master to get the

changes uh Upstream so in this case uh

I'm not going to merge this Branch

because it is just a toy branch and I

don't want it to be merged accidentally

so I'm just going to come here I'm going

to close that PO

request um and locally what I could do

is just destroy that Branch so I could

do actually before I do that let me see

okay so this branch is hanging there so

I'm going to delete it from the remote

right H but that didn't delete it from

my local repository so now let me do a g

fetch to see if there is any change and

there was a change that change is the

change that I just costed when I click

delete Branch so notice the effect of

get fetch here actually did show some

output what was the change well now on

on the remote repository one branch was

deleted and now that I did get fetch now

G knows about that deletion and now

locally what I'm going to do is I'm

going to get check out master and now

that I'm standing on master I can

destroy the branch

uh minus d uh PR so with that I deleted

the branch PR and and I'm done so okay I

have one more minute here um I'm sure

that this idea prob of keeping two

branches in sync might be a little

difficult to digest so I would like to

spend that last minute uh answer any

question that we might have or or hear

any comment or extensions of what I've

said

seems to be pretty clear what you

describe or maybe totally

unclear so um once again it is very very

very common that the problems associated

with Git comes from not keeping your

local branches synchronized with these

two places the branch Associated to your

logo one but on your remote the pr and

the master branch on the remote remember

to sync both of them all the

time doing this manually is tedious and

I just don't do it instead I do it

through tools like they use this package

or the GH common Line application I

encourage you to search for whatever

tool that you like like and that

abstracts all these you know connections

that you need to kind of remember to

keep track of H in my case generally

what I do is a running command is called

R sync and that will pull you know

depending on the branch that I am it

will check you know the associated

branch on the remote and the master

Branch too so every time I need to do

any change I just run R sync which is a

a wrapper around the the function from

use this PR sync think and that does all

that magic for me so if all of this

sounded like too much work it is I agree

and I just don't do it I use tools that

abstract all of that and do it for

me okay so with that uh I hope to have

you inspired to find the workf flow that

uh does things for you and you don't

spend time thinking things that use your

brain in a useless

way but here we are so thanks a lot for

for hanging in here and uh and that was

it for today look forward to working

with you uh on

git thanks bye Chia Chow thank you
