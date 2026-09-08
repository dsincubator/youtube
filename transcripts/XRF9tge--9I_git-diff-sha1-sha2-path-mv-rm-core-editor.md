---
type: Video Transcript
title: "git diff sha1 sha2 -- path, mv, rm, core.editor"
description: "today the data science inator continues  this series about git from the terminal  we are talking uh through this lesson of  cod Refinery that is entitled um  in"
resource: "https://www.youtube.com/watch?v=XRF9tge--9I"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=XRF9tge--9I"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

today the data science inator continues

this series about git from the terminal

we are talking uh through this lesson of

cod Refinery that is entitled um

introduction to Version Control with Git

in the issue Associated to this MEAP now

issue 62 you will find links to the

Google Doc that we are using and that

Google doc also summarizes everything

that we've been doing uh the first um

the first meet up we kind of understood

how G works and the different uh places

where get you know has stuff you know in

a staging area in an index or in your

working pre uh and then we started uh

you know first configuring git with Git

config uh we added our username we added

our

email uh then we started working

actually with Git we used uh git status

to understand you know what is the

status of our git repository if there is

any new file that needs to be added to

um git uh we learned um a few things how

to add files to the staging area and

then how to commit files to the actual

index which is you know the git

repository um we learned a little bit

about how to uh look at the history of

our git repository with Git one with Git

log one line and to have different views

of that

log um then we use G diff to understand

what has changed in our git repository

git div has different modes and we learn

about that in in a previous

Meetup we use git uh diff uh so far in

just one mode uh in the mode where it

just shows you the difference between

the index so that is the stuff that is

already recorded in your G repository

compared to your staging um area uh but

then G diff takes a few more arguments

if that are optional uh and can show you

different aspects of uh of um you know

the difference between your git

repository so uh let's go back to the

lesson uh to the point where uh we left

last time we are working with the

basics and I'm going to scroll down all

the way to where we left last time it is

here so get um here comparing and

showing commits so um here we are in our

repository if um uh if you remember we

had added a couple of files one called

instructions and another one called

ingredients and the whole idea is we are

creating a recipe to do guacamole um and

I believe that my working tree um and my

staging area and get rep kind of all in

sync so I expect that if I do get status

let's see what's going on here probably

I haven't uh refresh my browser for a

while so sorry for that let's wait a

little

bit so in the meantime from previous um

meetups do we have any question that you

would like to kind of bring up

today nothing okay so let's do G status

to see what my uh status is so as you

can see um it says uh actually I open

the branch new I was playing with this

before and I created a new Branch but

you you know we are not yet on the stage

where we do branches so let's do uh a

check out Master oops Master there you

go so if I do get status now I should

get that I am on the master br

uh we're going to be talking about

branches later but for now uh we just go

through the lesson as it proposes and as

you can see it says that my there's

nothing to commit everything is kind of

up to dat so before we used um you know

the command that we use and we want to

be using right now is git diff and I

show you with the help uh flag that g

diff has a number of um formats or

different forms so the form that we used

last time is this one by which you know

we use G div with kind of nothing else

and in that mode what you get is in the

case say that you you create a new file

so I'm going to create a new file with

command touch I'm going to create that

new file called say new file or dxt so

that created a new file you can see it

already here on my git pain um but I can

also get it with Git status so that file

if I do get div now I should get nothing

because uh that file isn't yet being

tracked by git but um if I added to it

to uh to the repository then G diff

could H give me the changes to that file

so maybe that's not a very good example

so let's remove that that file from here

actually I'm going to remove it with uh

remove new file from the terminal

because we are also getting familiar

with the terminal so maybe a better

example could be to touch instructions

txt which is a file that g is already

tracking so if I um say I do Echo I I

add a new line at the end of the file

say instructions. txt if I do get diff

now with no other argument what I get is

the difference between the state of that

file right now on my working tree as it

is in my folder and the state of that

file as it as uh git knows which is you

know the state in this place that git

has that's called the index so as you

can see you know I can see in green the

the new uh line that I added uh but

let's

um remove what I just did with K

checkout uh what I'm going to do is

retrieve the state of that file as it

was in the index so if I now do the

status it is not there is nothing that

has changed because the state that it is

showing is the same state as it is

recorded in the index so with what I did

right now I just wanted to show you that

g you know to do what I did before that

g diff with no flag gives you just the

difference between the index as and your

working tree but you can also use g g

diff with other forms so let's explore

that again on the H file and the form

that we're going to be exploring now is

this form here by which you use G diff

to compare two different points in the

history of your G repository so it can

take two uh commits so the Sha which is

that identifier of H commits uh of two

different comits and can give you the

difference between those two points in

the history so let's use GI in that mode

uh one nice thing to do would be to

First have a look at the

log uh maybe let's do one line for for

to see the log in a more compact way so

say that I want to see the log between

this state and this state right uh maybe

in order for me to know which states I

want to compare so let's let's say I

want to compare this state I'm going to

copy this and baste it

here and this other state

here right so in that case I can use

this form get if sha one and sha

two to uh compare those two points in

the history so let's do that g div

actually I can use it I didn't need to

actually have this record here because I

can uh do not save I can just look it

forther so get div say I want to compare

this commit

here right let's past it there I'm going

to past it with shift inst because in

terminal that's sometimes what you need

to do depending on what terminal you are

and this other commit so this is a new

form a new form that we haven't seen

before so in that case G is showing me

the difference between those two points

in the history and when we start looking

at uh so how do we read this so in this

case you know it is showing us um that

you know some lines have been removed

they are highlighted in red and they

have a minus symbol there um and that's

that's what happened in that uh in that

that change in particular what's more

readable and more useful is uh this

particular line of the five ingredients

and the other files are kind of a bit

more weird uh one thing I want to also

show is that g diff can take not only

that but can also take a specific path

so we could get just the diff to this

particular file only if we use the same

form that we used before but now we give

the name of the path that we want to

explore on

so let's say that we want to explore

ingredients. dxt only and let me clear

this up with contr L uh so if I wanted

to explore the diff between those two

points in the history but specifically

for that particular file I could just

give the path after this minus minus um

separator so with that I get a you know

cleaner diff and specifically for that

file and that is great because it allows

you to follow a particular file through

the history of your repository so with

that we cover this item here so now

let's move on to uh more to playing with

the file system in our

repository uh but not just you know as

we would normally do say if I wanted to

remove one file I would usually you know

just click the the file here in our

studio and maybe go here to delete and

remove it from there or you could remove

it directly from the terminal where the

command and remove but instead we are

going to do it in a wiser way we are

going to use the power of git to De to

remove files and to move them and to

rename them and do everything that we

could do directly with the tools that we

have to interact with our fin system but

now we're going to use it through git

that way every change that we do to our

file system is recorded by git and it's

uh going to display very um nicely on

the history of git and is going to be

totally reversible right so let me clear

this up with contrl l once again and

let's have a look at what the lesson

proposes so it is proposing us to create

a new

file um which we can do in many ways but

let's say that I'm going to use this

time our studio so I'm going to click

here on file let's say that it is a text

file and I'm going to call it um well

let's let's type something here hello

and let's save it I'm going to save it

as new

file.txt

save and here it is you can also see it

in the in the git Paine if I expand this

a little bit in the git Paine you see

that it is already um recorded as

something that has been added to the

working tree but G is still not um

tracking it so that's the next step so

the next step is to add that file and

then commit that file so let's do just

that so in our studio what you could do

do is to click here to add the file to

extension area but uh from the terminal

you could do or you now know how to do

it from the terminal with get add H in

this case we would say get ad and the

name of the file like new file.txt or

you could also use you know if if you

know if there's many files and you want

to add them all you could use something

like dot which will add everything

however it is best practice of course to

be specific and add the specific file

that you want so with Git ad now when I

run that uh you can see that now the git

status shows that that F has already

been adding added to the staging area

why is that not reflected here on the

git pane simply because I haven't

refreshed the git pain but there it is

it is the same effect of having checked

that box there and now we're going are

going to commit that file uh that's this

last part of the instruction in point

one so let's do that g commit and

remember we need a a flag minus M to

give a message and here is um you know

we write something like

add new file.txt

and uh that will add the message and the

commit H and there we go so if I do get

status now sorry G status now know there

is nothing else to commit let's do it

again to show you clearly what that is

and the g log let's do one

line should also show our last commit

here right um then what we're going to

do is we're going to rename that file

but using the terminal so what you could

do in our studio for example if you come

here and then you go to the rename and

you could change the name from there

that's one way right but if we want the

change to be uh kind of very neatly

tracked by git one good way to do that

would be with the command git MB which

is for a move right so with that you can

create a new

commit to move that file from say a new

file to uh um

renamed new file.txt so with that

command what I get here is a sign that

our studio is telling me that the file

that I had opened no longer exists and

it's true because it no longer is called

a new file now it's called renamed new

file if I do a g

status you will see that H git already

knows that what I did is an operation a

renaming operation and uh I should see

let's see here on the master Branch what

I get okay if I refresh H our studio

also um exposes that um operation as a

rename that's why we have the icon R

here showing that it has been renamed if

I uncheck the box look what happens it's

interesting so instead of having one

file being renamed I get it as it as if

it was an operation on two files H the

new file.txt as it been removed and then

a new file called rename new file has

been added so when I check or when I add

both to a staging area now our studio

understand that what it was it was a

renaming operation so that's just just

like to correlate or to relate the

experience that you had probably from

our studio to the experience that you

are now building from terminal but okay

we haven't yet committed the file in our

studio you would commit from here and

you're welcome to do that in your

everyday life but today we are going to

create the commit with the terminal so

get commit uh

commit minus M and here my message is

something like rename uh new rename to

renamed new file.txt

okay that is my

uh operation my renaming operation if I

do a get status it is now clean let me

actually clear the console and here uh

I'll show you again that I am on a clean

status and let's continue with uh the

instructions so we're now going to run

git log one line and G status to explore

a little bit what we've done so git log

one line what would you expect to see uh

G

log that is git log let's do it now git

log one line I think I I mistyped the

command before let's run again git log

one line uh it should show the renaming

operation over here and if I do a git

log just get log it should also show uh

something very similar except in an

expanded form which is something that we

have been seen in the previous um

meetups H now let's remove the file so

the operation that we just we have just

seen is the operation by which we move

the file basically we rename the file

with the command move which moves the

file from one name to the other now

we're going to completely remove it so

if we wanted to do that let me clear

this with contrl L we could do something

like a git Let me refresh this because

it kind of bothers me that is kind of

out of date so there we go uh so if we

wanted to remove this file what we could

do is

get remove RM for remove and the name of

the file remember I'm going to use the

tab completion to say typing

rename I type a few kick Strokes K

strokes and then I press Tab and I get

the full name of the file so I'm going

to remove that file uh and as you can

see now it appears on the G paint on our

studio as deleted but again think this

is on the Stag in area it hasn't yet

been committed so if I do a g status you

would expect it h to appear on the

staging area as a deleted file right so

we do now the G

commit with a message like delete uh

renamed new file.txt

and now my G status should be clean

again

um one uh interesting way one

interesting flag to the git log is the

flag stat because that flag shows us

changes in different files so if I do

the um just to review a little bit about

log remember a git

log gives you a long form but you can do

it shorter with Git log minus s oh

sorry G log

or maybe I'm forgetting something here

ah because let's see git log minus S no

that's the short form um sorry stat G

log

stat will give you this information that

wasn't available before

renamed new file. dxt has been uh you

know one line has been removed and the

file has has changed so I like the form

with uh also with the one line

line so if you combine the flag one line

and the flag stat you get for every

commit specifically the files that have

changed in each commit and if those uh

you know changes have been an addition

or it have been a a like a subtraction

right um so let me share with you what I

believe is the ultimate um git log um it

is uh saved also here in the Google Doc

that um you know we are we are you know

using it is this command here so if I do

the G

log one

line it looks it looks good looks pretty

good but I could do a little better with

decorate because that will give me the

name of the different branches that I

have and it will show me to which

commits those branches are pointing to

and not that there is always where we

are right now at the commit that we are

you know checked out right now you Al

always have this um this keyword called

head so in this case head and master are

pointing to the same place right but I

could move the the head to a different

point in the history of the commits and

we'll do that in in other uh meetups um

and uh the flag graph is also cool by

but it won't show any difference right

now it will start you know paying off

when we have merge um commits and you

know merge commits are you know when two

branches of the same history of the

repository are kind of merged at some

point and then when that starts

happening you you start kind of

benefiting from having a visual way of

understanding the history of the

repository so far the history is linear

so if I if I ask um if I if I use the

the flag graph I won't get anything

different but if you if I had here merge

commit you will see that uh you will see

those branches you know moving um you

know off the the left hand side of the

screen H but this is a bit abstract for

now so for now the the the ultimate git

log uh you know includes all these flags

and I I put it here for your reference

because you may want to start uh using

it in your own in your own work

um one uh aspect let's

see I have to decide if we continue with

the lesson or address a couple of

comments that um yeah maybe I think I'm

going to address a comment that comes

from Alex last time so last time I

showed you that if uh I want to create a

commit on our studio uh as I as I have

it here on our studio Cloud because our

studio Cloud only has one text editor

and that text editor is called Vim the

interface that we get to edit text is

very awkward and Alex pointed that maybe

I should mention that uh from your own

terminal you can configure a different

text editor so that's what I'm going to

show you now so I'm going to pop up a a

new terminal and before I do that I'm

going to show you what's what's the

problem that we are trying to solve so

say that I have you know a new file

couch the file a and I want to add that

file to the staging

area I show you the

status here it is and I want to create a

commit if I do get commit and I don't

use the flag minus M remember from last

time you know you are dropped in this

text editor that is called Vim that is

the only text editor that is available

in our studio cloud and if I wanted to

you know uh install a different editor H

I couldn't because on R Studio Cloud I

have no privileges to do that and but in

your own work you could you could use

any other um any other uh text editor

that you want so let me show you what

that would look like so let's jump to my

desktop here um here my desktop is empty

but let's create a new git repository

with Git in it um demo H and now let's

move into demo um G status shows that

there is nothing to commit there's no

commit yet H let's do something similar

to what I did before let's touch a file

called a let's

add that file to the staging area so if

I do now a get status you would see

there and let's now create a

commit uh before I do that I could

configure using G config a text editor

like for example in this case I'm going

to I'm going to configure that text

editor locally but you could also do it

globally with this flag Global so I'm

going to do it

local and I'm going to say core. editor

I'm going to say Nano Nano is just one

program that H is a text editor very

basic very simple but much um nicer

interface than V so if I now do let's

let's go back to um the

status so I have this file a and I want

to create a commit if I now do G commit

and I forget to use the flag minus M I'm

going to be dropped into this Nano

interface as you can see this this

program is nano it is not the Vim

program that you saw before and it's a

little more helpful in that it gives me

already some of the commands that I may

want to type uh for example I want to

create a commit message so I'm going to

say um add new

file a and now I want to close this file

how do I do it well I at least I have an

indication here if I want to exit I

press control so that little hat means

control and then X so I'm going to do

that control X and then I get a question

and asks me would you like to modify

this file basically it is asking me in a

weird way if I want to save this file

and by saying yes and I say yes with the

um why so I'm pressing shift y to do the

capital yet Y and then enter I actually

save that file and effectively save the

commit so if I do a g um sorry git log

now you can see that I have effectively

done that comment so H that was to

address uh the the very useful comment

by Alex because in your day-to-day life

most likely um well I I you know some

people use Vim but it's not the most

user friendly text editor so I do

recommend you to configure whatever text

editor that you are more familiar with

and if you don't have anyone um I

recommend maybe Nano because it's a it's

a simple one uh otherwise you can just

use the interface to create commits from

our studio right you just click commit

and you just type a message right here

like add new file so those things are

just to avoid the ugly interface that uh

you get with with with vim and Vim is a

very powerful program but it takes it

has a very steep learning cve so maybe

it's not maybe it's not now the time to

to learn about it okay so with that we

finish this meet up and we have a few

seconds to to see if we have any

questions uh so I open the floor for

questions or

comments uh maybe just one question well

is your um favorite text editor that you

were used like do you use Nano or is it

like too simplistic at some point and

you personally use something else um so

I use very heavily art studio and Vim

and the reason is personal so I prefer I

know Vim as as I demonstrated in our

studio Cloud sometimes it is the only

option so you know if you are you know

working with a server or you're working

with our studio Cloud H you are just

unable to install software on those

computers that you you don't have

administrative privileges on so I forced

myself to use Vim because you know I I I

want to be moderately fluent with it uh

but you know in most cases if you are

not an admin of computer of of um of

servers or anything like that most

likely you don't need VM uh it's just

kind of fun to play with and learn

something new but I mean it's certainly

not crucial and most people do configure

Nano or any other kind of nice a program

when I was using Windows I used to

configure the normal notepad H so

notepad is a program that you can also

set as your core

editor okay with that um we need to

finish now uh do we have any other

questions before we say by

okay it looks like it that's all for

today okay see you then next time thank

you very much for joining

me thank you bye C Chow
