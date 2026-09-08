---
type: Video Transcript
title: "Inspecting the history"
description: "today the DS incubator uh is the last  one of the series about uh working with  kit from the  terminal um I'm going to be talking  today about inspecting the hi"
resource: "https://www.youtube.com/watch?v=7igKU5JVmxM"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=7igKU5JVmxM"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

today the DS incubator uh is the last

one of the series about uh working with

kit from the

terminal um I'm going to be talking

today about inspecting the history of

our G commits which is something that is

extremely useful and is a great reason

for uh using Git along with maybe the

ability to undo things and stuff like

that it is super important to be able to

retrieve things from the past to explore

the past um to find things uh to see who

contributed to a repository and so on

and so

forth so I'm going to be talking a lot

mostly about git log which is one

command and showing also a few other

commands that also relate to this idea

of exploring a git

repository um but with a big focus on on

log and some of the flags that g log has

that are pretty use

uh I'm not going to be covering G bisect

or bisect uh that is close to Jackson's

heart and because he was he's super busy

this week uh unfortunately he couldn't

um lead this Meetup but uh I'm hoping to

after this um session ends after this

series ends and maybe he can one day

talk a little bit about specifically G

byx so that one command that is is

pretty powerful but also I'm not super

worried because it is a fairly Advanced

feature and one that um when it's very

useful when you need it but it is not

something that you use every day so the

things I'm going to be covering today

are actually more like everyday things

so with that I'm going to expand my

screen um can you thumbs up if you see

my

screen yes you do cool just to confirm

what Google is telling me

so we're done with this and uh the

lesson uh I'm going to be covering it um

to my discreption really I'm going to be

covering some of the commands here that

are more useful but uh instead I'm going

to be just you know popping up a

terminal and uh let me see if I have

another one here no this one here I'm

going to be popping up a terminal and

using one repository uh as an example so

you may be familiar with the package use

this um let's see if there is anything

late

there no I think I'm up to dat there so

use this um is a package from the AR

leave organization it's maintained by

Jenny Bryan and because I use it very

often sometimes I find little things

that I would like to change and then I

submit a request and sometimes I make it

there so I'm going to be using uh this

repository to explore uh what what have

I done in uh use this just as an example

so um the first thing that you might

want to know is that git

has a GP command that allows you to

basically um explore any piece of text

that exists in the current uh working

tree so whatever you know your file

structure looks like right now uh not in

the past just in the present with g grip

you can you can find stuff so you know

you could use g grip to do something

like okay is there any code tag as to do

and and there you see you know which

files those are so uh g grip uh is is

very powerful to explore the snapshot

where you're going to right right now

standing of that repository but um it

doesn't kind of go into the the history

of the repo so you may want to know

about other other tools to do that but

then there is also a

g there is also a g uh so for example

let's do if I do g grip and I I try to

find say my

name let's do Mao like

that um it looks like my name appears in

the working tree so the current the

latest version of this package has my

name somewhere and where is that okay in

the news file and that is because in

this um PR number

990 I apparently did something there so

that's why you know this the current

snapshot of use this includes my name

somewhere there but let's see what else

we can do so if I do um Get Grip but now

as a flag of the command git log what do

I get that command what does is digs uh

into the commits uh into the commit

messages so as you can see my name

appears in one uh message so this is

what's being matched by this command and

now I know in which commit that is I

know when that happened which year which

time and so on and so forth so we

discussed first g grip now we discuss

git log and the flag grip of git log so

again if you want to search for whatever

you have in a current snapshot of your

repo you can go right away with g grip

but if you want to dig into the entire

history and see if any commit message

contains a string then you do uh a g log

minus minus

grap and what I'm passing here actually

is a is um Regular expression so if I if

I did something like this I would still

match the commit message because it

understands um Regular Expressions so

what else can we do okay what happens if

I do git log if I wanted to search for

you know something similar to git grap

that finds text not just the the commit

message but like a piece of text say

that you know I wrote a function and

then I removed the function I don't know

when I removed it I just know that you

know the name of function more or less I

remember it so I could you know use a

regular expression to try and match it

across entire history of that repository

so for that you use minus capital S it's

not lower case it's capital S and that

will match strings in the entire uh

history of that uh repository so let's

see if I do that so I'm now trying to

match text that contains the word Mao in

the entire um repository so let's see

what we get remember that when we when

we were matching just the commit message

I you know I matched only one commit but

now you can see there is more than one

let's make the screen a little smaller

uh so at least two that I can see and

let's move down okay that's it that so

my H the the it looks like there's two

commits that somewhere in those commits

there is the uh War Maro in them but I

may not be seeing them right now because

all I I get as an output is the G log is

the output of G log log and the output

of git log doesn't give me by default

any uh you know um any view into the

files that change but I can do that very

easily right so if I do the flag minus P

P is for patch so then I get not just

the you know the commit uh information

but also I actually do get the changes

so let's see in the first commit

something changed that had my name in it

so there is a file somewhere there

called uh in tests in manual tests for

the function BR find uh this text was

removed in that commit and that text had

my name so it's interesting to think

that not only you can match text that

was added or modified but also you can

match text that was deleted so if I was

if this was um you know an action trying

to search for a function that I deleted

this command will allow me to find the

commit that remove that function and

just bring it back to the present if

that's what I want so that's why you

know I insist that we can uh Delete code

that is dead that is no longer needed as

opposed to comment it out because with

Version Control you can do always a git

log minus S capital S to match whatever

you want to find and then just check

that out so you can commit check out use

kit commit check out and the sh of this

commit and the name of the file to get

that specific file back into to the

present or even with a flag minus P you

can you can bring to the present that

specific chunk of text not entire file

so let's scroll down a little bit more

to see what else we have so if uh well

this is the commit message but remember

we are trying to see what was the actual

text that contain the string Maro in

those commits so if I go down uh here

you see that in this commit is when my

name was added um on the um news file

right and here under here okay it looks

like my name was here because actually

that this is little repx that I wrote at

the time and I use my own name my

username uh for because you know this

function was working on a on my GitHub

account and my GitHub account contains

my name so uh summary so git grip again

digs into the current working tree into

the snapshot you're standing right now G

log GP uh actually digs into commit

messages across entire history but just

matches strings on the commit message

and git log minus capital S looks for

text not uh in the message of a commit

but it actual in the changes of that

com so we are going to be now doing um

working with another flag uh to filter

uh the log so before I do that I would

like to kind of p a little bit because I

I'm hoping that this could have uh

inspired some Wows somewhere because I

feel that this is at least I find it

like very powerful being able to go back

uh Delete whatever I want commit that

version control and then retrieve it

whenever I want H do we have any any wow

here to share or any comment or

question

wow oh wow amazing I not going to let

Jackson speak because when he does he he

curses so he was he's not going to say

why he's going to say something that uh

in unprofessional and

inappropriate okay should I move on and

and show you a few more things

here okay so now um I wanted to show you

um how to filter commits by by Time by

author so you know that you know if you

use for example git log uh one line and

the flag uh say there corate we get

pretty cool output um we see you know

branches um

actually there is something here one

line the create graph one

line

graph

crate yeah it's not what I want actually

I I'm going to use my own git log I'm

going to show you in a moment what that

is so basically you can see in this

version of git log um it is just an alas

that I'm going to discuss in a moment H

you can see that

the the um log output contains a lot of

metadata H it shows the branches it

shows the commit message it shows also

when the changes uh were made two days

ago for example and it shows who did

those changes

so this um actually let's see alas let's

see what that alas

is

um

alas grap for

log

yes yes okay

so YES Prep

blow it's this one here okay so this is

a pretty involved uh output um this alas

here a little complex but um never mind

we're going to retrieve that information

later probably the one thing I want to

say about alas is that you can create

your own aliases by doing something like

git config because you're going to add

that alas to a file that git knows about

and it's called config H and you can say

that if you want to add that at the

global level you would say Global in

this case I don't want to mess up my

Global config so I'm going to say

local and then you do um you say what

alas you want to create remember that we

have used something like get config

Global to say you know what is my

username remember that so if I ask kit

config Global username I get my name so

now instead of doing that um I'm going

to set one so the the the way you set

things is you know you did you do the um

the the key and then you do the value in

this case go be right

so same thing we're going to do Alas and

we're going to call the alas in this

case for example G uh sorry log with a G

for graph or whatever um and then I'm

going to do uh the values so I could do

um I could probably paste all this but

I'm going to do it like more simple I

could say uh log on

line

graph decorate so that is the um

ultimate git log as some people describe

it uh so with that I could now or I

should now do uh git log G and I would

get the output that uh I would get

otherwise if I type all those flags so

when you find yourself you know working

with Git and using too many flags then

you can create yourself an obvs so that

on steroids um it could be something

like what I have here if I Type glol L

git log whatever that is uh and I get

this kind of really fancy git log and

the reason I wanted to show you this is

first because we haven't covered aliases

in depth that's how you set them up and

second because I really like this output

because it has so much metadata that is

useful for me so with this let's do

something useful now so let's say I want

to filter the git log to find commits

that much my name so H now um I'm going

to you know call that command go g lol l

and now I can use the flag althor if you

don't remember the flags remember you

can do outo completion in some terminals

so uh and then author will just match

strings uh and I think it's going to

match them

in a noncase sensitive way so if I do

that I can basically see across the

entire history of the use this package

any commit that has been made by me so

by by the author that matches the name

Mau so that's that's pretty cool because

you can find uh commits um very quickly

and you can then also add flag like SC

and uh and the date specifications for

git are extremely clever so you can say

since um like I don't know

one since last week did I do anything

last week maybe not since last last

year okay since last year I have done a

few things I have you know committed one

change 12 days ago and then another

change 11 months ago um so it is very

flexible I recommend you to of course as

usual do uh you know git log

help to find all the many ways in which

you can use this super powerful command

in particular you know the flags uh that

you can use um for for things like this

you know you can say since uh you know

20 days ago uh since yesterday or

whatever like that's those you know

combining those flags who when uh is

extremely powerful so I'm going to puse

that one more time again for more Wows

or for more questions or

comments Wows

wow thank you mon yes yes I find that

very useful H but there is a short

version of that that you can use when

you are about to release something and

you need to find the git log between say

the last tag and the head of the repo so

let's first clean this uh terminal a

little bit and and let's let's see what

I mean by tag so remember um I'm going

to use my own git log and you can see

that you know um there is a tag called

V2 so use this two has been released a

few days

ago H but there's more tags so let's see

get tag what do do we get so we have you

know two

1.63 so let's see that we want to

explore the history between these two

points in time or between this point in

time in the and the present so let's do

V2 and the present so I I could do kit

log uh and I could say um

V

two

and if I say just B2 I think that's

going to you know do all commits up to

that point uh let's see I don't remember

exactly the syntax but I think it's

something like this head okay there you

go so I I can specify the starting point

and the end point of um a range in the

log H so with this you know you could

you could see um just the history

between that tag and the present you

could also you know remember that you

can use for example hat to say not the

head but you know one commit before or

same thing with the flag because notice

that if I do this command I don't see

the tag because the tag is one commit

behind so let's do this then let's add

one hat here to say well they commit

prior to V2

with that you know I already see the tag

which is you know Pleasant for me

because I can't confirm that I'm doing

exactly what I wanted to do and so I can

now you know narrow down the history to

that and again you know now now that you

know our flags you could also add them

here you could say by by Jenny Alor

Jenny

um and now you could narrow down just

hair comets and you get rid of any other

comit so with that um what else I want

to show

you R okay the short log so there is you

know usually you know usually sometimes

you want um you know to find who

committed between

one um release and the other so let's

say that we're interested in V uh

1.6.3 and

V2

um right so let's say that we want this

there you go so I I'm you know Finding

commits between these two uh tags and

and sometimes you just want to know well

between those two tags who uh has

created commits so there is a short log

and it has a flag minus s that makes it

very succinct and in this particular

case I'm specifying the range between

the last two versions to see who has

committed in that in that range so it

looks like I messed up Good short love

ah okay because I'm doing there you go

what's happening is that you know I

don't want to use my um

my my alas instead I want to

do where is

it where is the short log here it is

okay so short L minus s uh so not my

alas just G short log is a is a command

in itself and let's see that I I say

that I want the from the version

1.6.3 to the version uh

v2.

0.0 so here you see who committed and

how many commits they did uh this output

we can now that we are very fluent with

the terminal we can start doing

something more interesting say that we

can pipe that to sort um that um that

list we're going to sort it in reverse

order H but first we're going to tell it

that usually sort works with um ABC with

letters so we're going to tell it

explicitly that we want to sort numbers

with n and R for reverse because I want

the highest committer at the top H and

and that's it so let's see who they were

okay so between these two taxs Jenny

committed

231 times uh plus 13 because she led

with a different name here same with

Hatley he committed

23 um yeah nowhere else and I committed

just once U but this is a useful command

when you want to thank the contributors

uh for a new release so you have to find

who committed between the Le the last

release and this one release and how

many comits you may be interested to see

you know who are your your your

strongest contributors to the to the

project so uh with that I want I covered

everything I want to tell you about uh

log and there's two more um commands

that uh I would like to cover um so

before we leave know get log it short

log it grap uh do we have any questions

or comment

here okay one reflection is that these

things that I'm doing on the terminal

there are a lot of those features that

are available to you in a very fluid way

through guis so if you do use a client a

g g client which I recommend maybe git

Kraken maybe our studio maybe um GitHub

desktop or something um generally the

ability to dig into the history of the

of the repo uh is is very very good um

so probably probably everything that

I've shown today you could do it with a

guy uh so at least um I hope to have

kind of inspire you to dig into those

features and know how to do them with

the tool that that you prefer this is a

ser serious about the terminal so I'm

showing you how to do it with the

terminal but of course you're are not

tied uh to it this just demonstrates

what you can do um

so some things that relate to the to the

log is like get show for example you

know it show just shows one commit and

uh and it shows also the changes um

generally I mean by default it will show

you the last commit uh but it is simply

a shortcut for git log um with the minus

P patch um flag because you want to see

the the changes and um and what else and

the minus N1 which tells uh G to give

you n is for the count of um items that

you want to see in the log so if I say

just one if I say three I would see just

three commits let's let me let me show

you that right but if I say the same

with the p as well with minus p and then

uh one sorry that's what I wanted to say

to show minus one then what I get is the

same output that I would get if I use g

g show so G show is just a special case

of git log with the minus P flag and the

minus um n count to to one right uh so

you can do the same for specific commits

uh so for example you can do G

show uh G show oh

had had had had you know to see the the

three commits ago and see what changed

and that's that's what changed actually

was precisely on the on the tag um which

you can also you could also refer to

that tag specifically uh then r g blame

um which I think is is um an unfortunate

name but uh what it does I think is is

being called now annotate as well um

what it does is allows you to

uh say if you want to get blame a file

news for example MD uh you will know who

edited each line of the file um and when

so that's that's cool when especially

when you need to find who might be the

best person to ask about a change in the

codebase something that you're not

familiar with and you need to find a

collaborator that that might be familiar

with that part because of a bug or

because of whatever and uh and finally

and and to end um I wanted to uh remind

you that if you want to travel back

because this is all good to explore the

history but what if you want to actually

go back in time okay you remember that

uh get uh check out allows you to go to

different points in the history and this

particularly H fluid when you have the

ability to check out a tag or when you

have the ability to check out a branch

because those are just shortcuts for the

very awkward name of of a shop H so if I

wanted to check out the tag V2

um this is easy I can do like get check

out as as I go with a with a branch V2 Z

and uh and here it is so if I show you

the log notice that this sha here is

precisely where the tag is but uh but

that's kind of um convenient when you do

have let me change to my master Branch

here we are but that's convenient when

you have a branch but remember you can

check out a branch at any sha in the

history of your commit so if you want to

explore the say the history of this

repository at this point in time what I

do is I just copy that sha and I do get

checkout check out minus V for branch

and I'm going to create one called

explore commit and I'm going to paste

the Sha right so now I'm standing as you

can see in my new branch called G uh

called explore commit so if I show you

the log there you can see that I'm at

that point in the history and now I

could do something like you know grap

you know what if I do um G

grap uh to do now for example right so

I'm exploring now in the current working

tree at that point in the history right

so with the tools that you learned you

can uh today you can um um explore the

repo and then you just check out the

branch wherever you found that there is

something interesting and you um you you

just travel to to that point in the

history

or uh one other thing that you know is

very common to do is to check out um a

file from that point in time so I could

do get check

out um from the branch explore so say

that you know that branch called explore

commit I found that uh I know the news

file is particularly interesting there

so I can check it out to bring it now to

the current working tree so you and see

that the file is there as added but I

could reset

it to show you um more conveniently the

changes so this is the file as it was uh

in the past and what you see in green

and red is the difference between um

what it is now and what it was before

right so I could I could commit now this

change to basically take this file news

back to what it was in that point in

time but I'm not going to do that I'm

going to to give get check out just

Master right so I'm going to uh get

check

out everything here so my work inry is

clean

now okay so that was a lot I hope to

have inspired you to read more about uh

specific commands that may have

interested you uh I hope they have given

you like a range of options for things

that you might want to do and you didn't

maybe you didn't know how to do them but

now you know know they are possible and

if of course you're not going to

remember because a lot of commands but

you know there is this video and there

is the the amazing documentation very

ter but amazing documentation of of Kit

and lots of resources online so we are

about uh to leave but before doing that

I'll just open the room to see if there

is any

question no

questions okay and with that I thank you

for your patience for being for hanging

out here in in this very very long

series about working with Git from the

terminal we have come finally to the end

uh but I think that even when at times

might have been a little slow for some

maybe a little too deep for others um I

I think uh we did a a a good record we

left a good record of all the tools that

can Empower you to work effectively as

contributors to to our um you know

organization and at two degrees so these

tools um are very powerful then how you

interact with them is up to you you may

um you may have already your guy your

favorite G client or you may like just

to play with the terminal as I as I do

okay thank you very much see you next

week with uh something else we'll have

to figure something

out chia chiao
