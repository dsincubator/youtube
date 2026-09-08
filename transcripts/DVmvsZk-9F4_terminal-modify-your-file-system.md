---
type: Video Transcript
title: "terminal: Modify your file system"
description: "Start a terminal um how to set up lesson materials that we are actually not using so not a big deal and how to navigate your file system..."
resource: "https://www.youtube.com/watch?v=DVmvsZk-9F4"
tags: ["ds-incubator", "terminal", "git", "docker", "docker-compose"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=DVmvsZk-9F4"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2022-04-25T00:00:00Z"
    usage_count: 87
usage_window: { from: "2022-04-25T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

welcome to the ds incubator this time i

am recording and not running a live

session because there is an overlap in

another two degrees meeting so i'm gonna

share the recording on slack for two

degrees people and also as usual on

twitter for everyone else so here we are

in the ds terminal repo where we host

the materials for this lesson and this

comes also with a computing environment

that is available through docker if

that's something that you use otherwise

you can see how to start a terminal in a

different way watching the previous

meetup

previously we have uh talked about

about the shell basically what it is how

to you can start a terminal um how to

set up lesson materials that we are

actually not using so not a big deal and

how to navigate your file system and

today

i'm going to be talking about how to

modify your filesd system to do things

like creating files

copying files moving files removing

files and also directories i'm going to

be talking a bit about editing text

files in a number of ways and and then a

few things that are not the stars of the

show today but some things that i wanted

to touch on that

basically create a more complete

experience in the terminal

like redirecting output from the

standard output which is

the terminal to a file we're going to be

touching on dot files which are files

that start with a dot which name starts

with a dot like dot profile for example

that are responsible for configurations

of your terminal so that it's prettier

or easier to use

and i'm going to be showing a few other

things like how to compose multiple

commands and how to create your own

commands with alias

so next time i'm going to be covering

the same topics of today but in a use

case so hopefully that will paint

a picture of how all these tools can be

used for real so the let me

open the terminal here and i'm going to

do

i'm going to go to the repo that

hosts

locally this meetup and here i'm going

to do the logo compose app to run the

docker container that has the

environment that i want to use called

localhost

type r studio and the password123

which is you're going to use that

password to get here and then i'm going

to navigate to

the project of

that contains the materials of today's

meetup

and here in particular i'm going to go

to this rhythmic file that

i can now

open

in the viewer pane i'm gonna need this

file so it appears here and this is

gonna be the guide for what i want to

show today so this is the topic of today

but before that let me explain why some

things that i showed before one thing

that i showed last meet up didn't work

last time i wanted to show that if you

press ctrl r you enter this reverse

search

tool that allows you to start typing

commands and discover commands that you

typed before that way you can navigate

the history of your

commands in a very fluid way so for

example if you do print working

directory cd home

ls

minus a

ls minus f so now if i wanted to

search through the history

something that starts with cd for

example i can do ctrl r

into the reverse search node and when i

type cd immediately populate cd with

tilde

before i even type it i can do space and

tilde but i don't have to so if i want

to accept the proposition which was

found through the history of commands

that i just typed then i press enter and

and that's what just happens right so

same with say ls so if i do a reverse

search with ls and the first thing that

appears here is minus f so i'm going to

apply that by running enter so why did

that does this work now and didn't work

before well simply because there was a

conflict between

the

shortcut that does this thing

and a shortcut that stopped the video

in the program that i'm using to record

this meetup so now i removed that

key binding that shortcut from the video

recording program but that also explains

not only why

this feature did not work here because

instead of running you know this reverse

search tool i was actually

asking the program to stop and they

brought the recording brand to stop and

so that explains also why the media last

time stopped earlier so when i tried to

show this feature

i unintentionally stopped they were

going so now it's all solved so okay

that's how you use that feature which

once you have a lot of commands

especially if you have long paths it's

very cool to start typing a few key

strokes

and

search through the history of commands

that you type before

so now back to the topic of today let's

talk about how to modify our file system

let me make this a little bigger

so i already did a cd

to home

tilla is short form for home i'm going

to clear with the word clear or with

control l

and just to show you where we are i'm

going to use ls which we learned about

last time with minus f which shows

differences between files and

directories because only i have here

directories you don't see any difference

but if i do an ls for example minus f

and also capital a and capital a is

similar to a except

that this dot and dot dot directories do

not show up which are usually kind of

boring so usually ls minus fa could do

the trick so we are seeing here that we

have some hidden files files that start

with a dot and some hidden directories

directories that start with a dot and

the files are distinct from directories

by the way they

they show up so directories here end

with a slash forward slash

and files do not

and directly also have a little color

and that comes from

a configuration in the terminal that i'm

using so later i'm going to show how to

do

things like that you know where the

files that direct the terminal to behave

that way leave and how you can reuse

them so that your own terminal

experience is something similar to what

you see here

so the first thing i wanted to show is

how to make mk mk or make a directory

short steer so mk mk tier makes a

directory so i could do you know folder

one for example to make just that one

directory or i can start adding

more directories so folder two say and

folder three so that will create three

folders

right one two and three

and they are empty uh you can also

create folders that have um

nested um

super directories so for example abc

def will create the directory def inside

abc inside folder one but if i read that

it fails and if the reason is that you

need for that specific

type of nested directory you need a

minus b for parents which means create

all the parents all the way to the

directory that i want to create so that

will work so if i do any less minus f of

a for example well i don't need that so

my directory and ls recursively

on a folder

one

for filler

i mistyped folder

you can see now that we see

abc and then we see df

right so you see the nested structure of

that folder one

all right so inside folder one abc we

have def but then inside df we have

nothing

so that's why there is nothing under

under this line

so yes that's how you create nexted

directories with mine of p

and then let's talk about how to create

files instead of directories uh one way

which is not noted here in the notes is

to use the command touch

touch for for example a file called a

txt creates the file um

a txt so here it is it's it's empty so

let me show you the contents uh you use

cat to show the context of a file

because this is nothing right because i

just created it with nothing but i could

use echo echo is something that you know

whatever you give it so say abc it will

respond with what you give gave it a b c

d e f

here it is so now the output is printed

to the console which is the standard

thing to do but you can redirect that to

a dot

txt if you use greater than symbol it

will

write the file or overwrite it so let's

now type

hello so now the contents of atxt is no

longer a b c d f

instead if i do cut a t x t

the contents is hello so if i want to

extend the file

to

append it

i can do double

greater than symbol so here abc

now if i show you the context of atxt

you see that a new line has been added

so yes you can edit files with echo

or create them with echo if they don't

exist so for example echo

high

redirected to 5b txt b doesn't exist but

you have just created it so there it is

and it's empty you know it's something

else sorry it has the contents of

high right there it is

but uh it's it's very limited and

there's not a lot of power when you do

create files like that so more powerful

is film it's a command that exists in

many many many systems uh i mean

with couch and with uh greater than you

can

create files just about everywhere but

being

even when it's not everywhere it is

almost everywhere everywhere and if you

don't find vim then you may find v

vi which is pretty much the same thing

so that point is a little more

developed

so veeam txt if the file doesn't exist

we'll create it empty and if the file

does exist it will open it with whatever

contents it has but vim is very hard to

use

most

more than anything because it doesn't

give you any indication of what to do

and also because it behaves in two modes

so when you open the file you are

dropped into what's called command mode

which allows you to do things like the

leading line by pressing two times d for

example if i press two times d

and that line is gone

um or by entering a line above the line

where you're standing with shift and oak

for example but you know those things

are really hard to learn very hard to

memorize so i don't recommend beam until

you are really committed to learn it

so until then the thing that i recommend

you to learn is the main things that i

noted here so mainly how to go

for example how to quit

uh is so you have to first move from

this

um so let's talk first about the two

modes so i mentioned there is command

mode that allows you to do things like

you know the leader line with the double

d but then there is an insert mode which

you enter by pressing the key i when you

press i and then you can type abc and

that won't be a command like you can

also type double d and they will that

will enter twice the letter d you won't

delete a line right so because that's

the insert note you exit the insert mode

by pressing escape and now dd will not

enter dde will actually delete

lines right so the two modes you know

you enter the edits then the other a or

insert mode with i and you exit it with

escape

right and then when you want to exit you

have to type you know shift column

and then tell how you want to exit so if

you if you want to just save and

actually not exit

then w and enter will do the trick if

you want to quit and save you first say

with all you and then quit with queue

so that will

leave the file in touch so if i just

show you the contents of atxt should be

what was before let me see ah because i

saved

right so i did w and equip my first

saved so veeam atxt

a let's insert abc

def so let's save this i'm pressing

escape to go to command mode shift

column to

get here to the area where i can save or

quit i'm going to just save for now with

enter and the file has been written

but i haven't exited yet so if i do

shift and column and q it would exit and

because nothing changed since last time

i saved i am allowed to say to exit but

if i do for example any edition here

with

i know hello

and i want to exit without saving first

i will be asked to

um i will be reminded that there were

changes that had not been written

and if i want to really quit

i have to do bank so i'm going to press

as it suggests there press anything to

go back

and now press shift column q

bank to really exit without saving so

that way uh the contents of cut.txt will

show everything that i have saved and

not what i have not saved

long story short once you're dropped so

why i'm teaching this is because veeam

is sometimes a default text editor

and you may not want you say but you may

still be dropped into an editor of this

kind

actually to demonstrate this i can do a

cd into projects and

terminal

repo which is a git repo and here i can

do say a git status

with minus s to show anything there is

nothing everything is clean so i'm going

to touch a to show to create a file a so

now a git status should show that new

file a as has been added there uh git

add

a without defined to a station area

and now this is what i want to show so

like it commit if usually you know it

takes a argument that is m for message

some message

but if you forget the m uh you will be

dropped uh uh actually here i had to

first like kind of target who i am with

um

gmail.com and so now it will work if i

want to create a commit except that you

know i'm going to be dropped in this

editor beam editor

so by default it is possible that the

system that you're working with has been

as a default editor and at least at

least you may need to know a column q

bank to exit the file without doing

anything

um

so if that's uh the case uh hit status

minus s so that the stationary is still

as it was before so you did not

uh you aborted the commit because the

commit message was empty and then you

may want to you know er either commit

message in a more friendly way maybe

coming here to the git

panel and click commit and type here

stand message instead

so

yes that's uh

that's why mainly i teach vim because at

least you need to know how to exit it

with column q bank and and if you really

want to learn bim then there's a ton of

resources online maybe just type

theme basics or basic commands and

you'll see that there's a ton of things

to do there so let's go back to the

home page to the home sorry

directory where is that by the way well

that's a home rstudio for this specific

system

and before i you know move on to

something else i want to talk about this

other program called nano

nano is another program very similar in

the way it's invoked so a dot txt

if the file does not

exist we'll create it and if it does it

will edit it

and this system will fail because it

doesn't exist in this field this system

has to be installed and so in the linux

system you know you will install a

program doing something like this

um first updating the registry that

contains all the addresses from where

software might be installed and once you

know you do that then you do something

similar but then install so you use the

command install and the name of the

program in this case nano to tell

your new system which brand to install

so now the program is installed so nano

atxt will work and here it is you know

that file as we left it before

and v and nano is a little bit

friendlier in that at least at least we

have some indication of how on how to

exit you know this hot thing means

control so i can press ctrl

and

x to exit or if i edited the file

and also i can move uh in an intuitive

way with arrows if i edit there is no no

such a thing as

the

command mode and edit mode it's just

more normal as you would normally do in

any text editor and here if you type you

know hello then some changes have been

recorded but you haven't saved them yet

so if you exit

you're asked if you want to save the

modified file it says buffer but you

know pretend this means file type yes

like the

i

and you'll

be asked to confirm that the file name

is what you want i press enter

and indeed the file has been edited so i

cut for a

txt would show that the file has it

so it is um

quite more friendly than

film still not you know awesome

uh nothing that you would you know be

super excited to use uh but yeah so if

you have nano and beam if you don't know

any of the two um you're gonna get

uh things done more quickly with with

nano and later if you want to learn bim

then then you can but it's gonna be uh

it's gonna be hard

let's move to something else so how to

modify

um

files uh how to copy sorry files and

directories from one place to the other

so for that let's do

let's change directory to projects and

the

meetup repo

so here

one thing we could copy is one file from

one place to the other so let's do an ls

first

to see what we have we have a file a for

example so let's say that we want to

copy

a to b and so now we have two files a

and b

sorry for the background noise

okay background noise is gone sorry for

that so as you can see both a and b have

the same

contents in this case nothing but so

let's do

echo

high

on a

and then copy a to b and let's look at a

and b and now you see that this height

twice because one is for a a and the

other one is for b

and so the both the two files are a copy

so we succeeded on that but we are also

able to copy things from other places

including hidden files from our home

directory for example bash

rc is a file that is

involved in the configurations on of

your system of your terminal and your

experience as a user of the tutorial so

we can copy that file and another one

called profile both are involved in the

looks and fields of the terminal and if

you want to copy them to the current

directory you could type the whole path

like you know tilde projects yesterday

or you could use dot dot remember means

here so if i do an ls

here with an a just to show also to show

hidden files you can see that your bash

now exists here and profile two

it would be nice to make a directory to

host

those files and call them say config

the folder config and now we could copy

those files so for a file dot

rc and bash

and sorry and profile into

that directory the way you can do that

you know before we use the dot to say

here and now we're going to say just

config as the name of the folder that

will copy the files but if you want you

can move them instead of copying them

right so move mv stands for move will

let me clear this up so we see this more

clearly so move will

of course not keep the original version

you will just keep the copy it version

of the move the version so

let's confirm that if i would do an lf

unless um

sorry ls minus a here

you'll see that there is no dot bash or

not profile because those files have

been moved to config so there they are

right

and now what if you want to move

or copy an entire

directory so you can't move config to

say dot files uh if it doesn't

exist it should be created so the reason

why uh let's see if that works ls

minus f

we have dot files we have

we have config no we don't have config

anymore so and now

uh dot files

sorry an ls minus a in dot files shows

the contents of

dot files which are the same oh

actually no actually i did it wrong so

what i did is i copied

the

i move config inside dot file the whole

thing inside the directory dot files and

dot files exist oh that was confusing so

let me amend what i did before so forget

about dot files let's call it um so

let's use

the command

move

for

um

sorry before i do that i'm gonna

move

from dot files the folder config

to here let's see if that did the trick

yes so the folder is here so let's see

if it has the contents that i expect it

to have

yes it does so now what i want to show

is um we can create

we can

move

config to a new folder

let's see

what we have here

as ls minus a config should not exist

config

there you go it doesn't exist and if i

do the same with new folder new folder

it should exist and you should have the

files that i copied right so that's how

you move one folder together so what if

you want to copy it so if you want to a

copy

a new folder new folder to

view folder two

what we are asked to is so it fails and

we're asked to use if we want to do that

to use the minus r for recursive

flag so that will work so now and the ls

minus a for a new folder

uh and for new folder two both should

show the same the same thing right so

let's

let's now talk about

how to remove files because we are

making a mess here and how to remove

directories so let's clean things up a

little bit so say that we want to remove

something from

the

new folder

to

directory i can press tab to see what

files i have so let's say that i want to

remove bash rsc

yeah i don't type that fast that

happened fast because i press the tab

remember that's one option for

completing path very quickly

so that will work but i always recommend

you to use the minus i

flag because minus i will ask you for

confirmation and the problem with rm is

that it does not have an undo button so

whatever you remove it's gone forever

right so always recommended to use minus

i

so now we say yes

and the file is gone and you could also

remove the entire directory if you don't

specify a file uh so it could be given

the

four slash or not and i still recommend

you to keep the minus i so now

um remove

pc directory

you can now it will fade but you have to

say recursively

with the interactive

flag it will ask you to first confirm if

you want to send into the contents of

the directory and you say yes and then

we present you with a question for each

file it contains so here we only have

one file so after that we'll be asked to

configure we're going to remove the

entire directory because it's now empty

and we say yes again

so let's do something similar with new

folder too so let's remove interactively

and recursively new folder

so it's going to be yes i want to

descend into the folder yes i want to

remove profile and bash rc and when

you're done also remove the folder

itself right so that's how you clean

things up and let's do an ls here with

minus a to see what we have it'd be nice

to also clean up a and b so remove minus

i also you know takes many files av we

can give it all in one call and again

we're going to be asked to confirm yes

yes

so because it's so important to avoid

removing things

in such a dangerous way as removed i

will teach you how to

do it more safely and

by default so if you want to write a new

version of rm that always calls the flag

minus i what you can do is

say that that should be an alias

for rm so they command alias by itself

let me remove this and show you what it

does the command alias by itself oh

sorry and yes by itself it shows a few

aliases that you have

configured if nothing prints because you

have no others configured but you can

create your own

so if you give

a command of the or a flag of the form

rm equals quote rm is instead of ram is

rm minus i

then uh

that is your new program so every time

you type say that you how to find a to

create it and then you remove it without

the flag minus i minus i

you will still be asked for confirmation

because that's a new alias that's a new

ideas for rn you have created it

to confirm you can do alias

and now you will see that your alias is

here but note that that only works it's

kind of session specific because if you

if you start another batch terminal

inside this one the children process of

the parent process you will see that

typing alias does not show the audience

you just created it is only

when you exit the children process and

stand in the parent process that you see

the alias that you created and when you

end this terminal and start a new one

that's gonna be gone so you may wonder

how do i do then uh what i just did in a

permanent way

and the trick is dot files so remember i

told you that dot bash rc and dot's

profile when they are placed in the home

directory

they tell your system how to behave your

terminal

so the same thing

happens with a bunch of files and in

particular there is one called dot bash

sorry bash

aliases

which is responsible for storing aliases

just like the one that i showed so that

has to live in the home directory so

that file so that file may not exist in

your system unless for the name of the

file checks if the file exists or not

and the file does not exist but that's

no problem because we can do vim and the

file name to create it and now we can

type the alias that we want

rm should be

rm minus i note that i'm typing quotes

here and now to exit remember escape

column

wq save and quit right so if i type

alias now

it's available here as well as in

children processes

and no matter how deep you are you go

every time a new process starts uh

aliases will be

read from

that

you know top bash

aliases file that leaves your home

directory so i can now exit twice to go

back to the parent process

and again if i touch a if i touch a and

remove a i'm going to be asked for

confusion right

this looks pretty clean to me and that's

also the end of

now except that i wanted to show how to

compose um commands so say that

want to inspect the contents of

um

of pressure c and profile so a profile

from the home directory file let's go

so you can inspect the context of a text

file with cad

this is the file it's pretty short so it

kind of fits almost in my screen but

some files are longer than that so i

could do

bash

rc for an example so it's much longer so

i may want to see just the head of that

file so how can i get you know this

output and fit it into another command

which is hell a head that shows just the

head of something

so the way you do that

is with the pipe so once you have the

output of something you can pipe it you

can pass it as an input to a new command

in this case head and that let me clear

this up with ctrl l so that

will compose the uh these two commands

cut and head so that the output of cat

gets fed into a head

and that piping is

is a is uh not

limited to two commands you can pipe

either sort for example uh and it will

sort the lines by alphabetical order uh

kind of messing them up in this

particular case

or you can do

something that i do a lot is a cat with

a

minus n flag because that will show the

number of line so i see all these

lines and and then when i do head you

know that kind of shows me how many

lines are being displayed in this case

10.

so i combined

uh

a command a flag and

then i pipe the output of that into as

the input to another command

okay so now we're ready to wrap up by

kind of walking through the takeaways uh

so first remember

that

if you're wondering how i learned about

the flags of the different commands

remember you have

a command called or a flag called help

almost everywhere but not absolutely

everywhere so if you want to learn

about the command less you can try ls

minus minus help

and that might show you

the the manual for that

file but if that's not the case then you

can also try mine

first so the commandment with the name

of the command for which you want to

learn and that almost always works

except in this system because it has

been minimized to

keep it sweet basically

it's a docker container it has to be

small and that's what i did so try and

help or man to learn about how to use

commands

about vim remember it's a difficult to

use editor the most important thing to

know is how to get out of it with column

q

bank to leave the file totally untouched

also the rm is dangerous if you are not

using it with manus i because once

something is gone it's gone forever so

what i recommend is to write your own

version of rm

with aliases which is a very easy way to

create your own commands in this case we

are overwriting an existing command

but you can also use aliases in a very

creative way to do just about anything

so you could do alias

greet me and say

i know

echo

hello moto

oops i think i made a mistake in the

quoting it's a simple quote so now i can

say

greet me i have just created the command

greet me and says hello

right so that's one way to use addresses

but

the the point of today was to show how

you can override the rm command to

always be rn minus a minus i because

it's a lot safer all right with that we

reached the end of the materials for

today see you next time
