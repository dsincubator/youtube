---
type: Video Transcript
title: "ds.terminal: Use case - customize and reuse your home"
description: "today the ds equator continues on the  series  about  uh working with the terminal  and today i thought of presenting a use  case  showing off the skills that w"
resource: "https://www.youtube.com/watch?v=BYtt2cXW4qg"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=BYtt2cXW4qg"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

today the ds equator continues on the

series

about

uh working with the terminal

and today i thought of presenting a use

case

showing off the skills that we have

learned so far um which are not many but

still quite useful for example we can

use

what we learned to customize our

computer environment our terminal and

then reuse that environment for example

in our studio cloud project or any other

computer

and i unfortunately you know i have lost

uh my my

system many times and uh having

saved my configurations allowed me to

recover uh in

less than a day you know so that was um

it was very important for me to know how

to do the kind of thing that i'm gonna

be showing today basically you know once

you have your computer set up the way

you like

uh how can you save those configurations

and then how can you reuse them

elsewhere

so in this i have to also thank linda

because the idea comes from interactions

with her where we were setting up on our

studio cloud project which are usually

ephemeral

but um

we decided to try make that environment

as close as

the environment that you know we have in

our local computer so the inspirations

the expression comes from there

uh so the skills just to review very

quickly where skills to navigate our

file system and to edit our file system

to do things like uh like moving around

our file system and then copying files

from one place to the other removing

files and then we also touch on the idea

of dot files which is you know the files

that store

the configurations for your system and

we also touch on the idea of aliases

which is a simple way of writing your

own computer programs basically on the

terminal

so we're going to put all of that

together into this use case

so let's jump to

um

today's lesson so for that i'm gonna go

to my terminal uh

and i'm gonna spin a docker

container you don't have to do this if

you don't use docker but if you do i

want to reproduce my computer

environment exactly then this docker

container has everything you need so

that now you know this little computer

that docker created for me is waiting

for me to start it in

the web browser localhost

our studio is the username and the

password is just one two three

so now i should be entering an art

studio environment with a pretty basic

terminal so we're going to explore that

in a moment

so i'm going to also go to the project

folder ds terminal and click on the air

studio project there to make this here

on the top right

the project where i want to be

um the only thing i need from that

project really is um a guide for myself

to remember what i wanted to show you so

i'm gonna

go to the file that hosts today's lesson

and um

show it here on the

viewer so i'm going to need this file

with shift ctrl k

in a moment it's going to appear here

and that's going to be my guide so let's

make this pretty small

maximize this vertically and the same

thing here so now i'm going to go to the

terminal

and uh

i'm going to clear with ctrl l

or with the word clear that's the same

thing so the very first thing i want to

do is explore the

environment in which you i am so let's

pretend that this is my local computer

so i'm going to have a quick look at the

configuration files that i already have

in my local computer and then i'm going

to cherry pick the ones that

i need

and store them somewhere else

so the very first thing i could do is a

print wd print working directory to know

where i am in this particular case this

terminal is configured so that you know

the information where i am is already

kind of shown here

so this is not the home of the computer

so i'm going to move to the home with cd

change directory tilde which is short

for home so now a print working

directory will only print the home

component

of you know the path where i was before

so now i want to do a little exploration

of the files that i have there but

remember ls by default only prints the

file the files and folders that are not

hidden but configuration files generally

start with a dot and that hides the

files from ls but no problem you know we

remember that there was some option to

show hidden files so we can ask for help

to ls

as you know you know now the

help file is too long so i have to kind

of scroll it's kind of awkward and i

know that the option that i'm trying to

look for

refers to

all so all starts with a and that is the

top of the help file basically like the

head of the head file because the

different flags are sorted

alphabetically so what i'm going to do

is

i'm going to pipe that to compose the ls

help command

with head so once i get the output of

help then i'm going to just ask for the

first few rows the first few lines

and there it is so what i want is this

flag i wanted to remember that ls minus

a shows me almost all

which is all except for the dot and the

dot directories that are always um

you know a way to kind of query for like

a move around as well um in your file

system

so here is what we have so far from

everything that i see here the files

that i'm going to be interested in today

are this one bashrc and i'm going to

show you why in a moment profile because

it's kind of basic and calls any many

other files and then a few more that we

are going to create right now

so the first thing you know in a fresh

system that you would want to do is to

tell git who you are so for example if i

am in this computer and i do a git

config

let's say globally global

user name

if the computer was configured i would

get here an answer with my name but i

don't so instead then i'm gonna press

the up arrow to recover the last command

and actually add my username here so

it's mauro lepore

so what we're doing here is creating

some configurations that are going to be

stored somewhere so i wanted to

demonstrate how configurations that you

enter or you set through the terminal

get actually stored somewhere in your

computer and where that place is and how

can we reuse that later so now i also

have the tailgate my email

so okay now that we have entered that

information

let's first clear this mess so ctrl l

and let's do an ls minus a again so

notice that now we have this git config

file that didn't exist before so one way

to inspect the contents of a file is

with cat i covered that last time so git

and i can

avoid typing the whole thing if i use

tab completion if i hit tab you know

that auto completes so here

you can see now that git config stores

my name and my email

which i enter through the terminal but

the file itself is something that i may

want to reuse in a different computer so

i don't have to do this again and again

of course this is just one little thing

maybe you don't mind doing it again in a

new computer but imagine that this is

just an example right so this is just

the surface and you may have a ton of

configurations that customize your

environment and when you work in a

different computer you want to reuse

otherwise the new computer will feel

like really awkward

so okay so we already have a new file

that we would like to add so it's going

to be git config is one that we are

interested the dot profile also and then

bash rc and bachelor c i still haven't

explained why and so one thing that is

pretty

useful i find is the idea of alias so

alias is

little commands that little programs

that you create for yourself that are

kind of shortcuts for longer commands

and so i explained last time that one

very useful one is

uh

a safer way of removing files so i'm

gonna show that with analysis so the

idea is

with alias if you just print the the

word alias what you get is

a list of all the aliases that you have

configured but if you use alias and then

you define something like this rm for

example equals uh and then quotes rm

minus

i what you're saying is in the va in the

name rm

store

what you would do normally with rm but

in this case with the flag minus i the

flag minus i what it does is it forces

you to confirm that you really want to

remove something when you remove a file

so rm is a command that you we use to

remove files and directories

and it is unsafe in that if you remove

something it's gone it's gone forever

and the minus i flag makes it a little

safer because you can then

you can then um you know

check if if you remove what you wanted

or something else so i'm gonna you know

run that so if i now type alias

that rm minus i is there

but it is set in a very ephemeral way

only for this specific terminal if i

create a new terminal here i couldn't

expect that to be let's see and yes uh

there you go so you see how the last one

here is not rm so that's because what i

did before

was

specific for that terminal how can i

save that alias

for good for my entire system and reuse

it later okay i'm gonna exit this

terminal first and go back to the to the

one that we were before you can do that

with the word exit so you close the

terminal and then you can start another

one with bash because it's the the name

of the program that runs the terminal

so the

i'm gonna press up arrow to record the

command here the rm

alias that i created i'm going to go to

the to the

origin of the the first you know column

of this line with ctrl a jump in there

so one way i could create that alias or

i could save that ideas permanently

would be to save it in a file

that is called

dot bash underscore

aliases so the file is called like this

dot bash underscore aliases

and how can you

write it well there's a couple of ways

which i showed last time one way is to

redirect the output of echo so i'm gonna

show this probably

is

so

echo so let me first remove this so this

is the entire command but let me first

go step by step so if i type echo and in

between quotes i write something that

something is printed to the console if

instead to the console i want to send

that outputs to some file i can do

greater than greater than and then the

name of the file

and this file doesn't exist yet but i'm

creating it in the current working

directory which is the home right so

after i run i type enter i can do now a

cut for dot bash aliases and fair enough

that is my alias there

and also if i do an ls with minus a i

can see that the file bash addresses is

there which is also another file that i

may want to reuse analysis are pretty

cool one gets very used to using working

with aliases so

when you go to another computer you

really miss them if you don't have them

so let me clear this up with control l

again

and let's edit that file dot bash and

aliases

to add one more alias just for

demonstration uh so let's do veeam this

time so instead of the using the echo

and redirect

approach we're going to actually enter

an editor and i'm using vim because but

it is particularly hard to use so i want

to again refresh the few concepts that

you need to understand about this editor

so that it doesn't kind of bite you so

how it works you just name the program

first theme and then the file that you

want to edit if it doesn't exist it will

create it but if it does exist it will

just open it

so veeam has as i said last time two

modes uh you enter the program in what's

called the command mode uh it's not the

mode in which you type text to start

typing text you have to enter the insert

mode so you type the i

and that will you know

make you fall in this insert um insert

mode so here you can see that is the

word insert so that means that i can now

for example jump to the end with a with

a key end i can press enter

and go to the new line and i can start

typing something like alias and create a

new area so one new alias that i would

be interested in having is analysis to

make r

start with the options that i usually

use in my r studio so if i go to tools

global options i really like this to be

unchecked

and this to be

displayed as never so basically this

what it does is asks are to always start

from a blank slate and never carry any

objects that you may have created in one

r session on to the next session

so that's fine with our studio but how

do you do that in r okay in r you start

r with the flags no save

and no

restore data

so that way next if i run r on the

terminal as opposed to our studio

then are we behaving that way so sorry

this was a little fast i was here in

enter mode where i could type text

and then what i wanted to do is to save

this file and close it how do you do

that in vim and that's probably the most

important thing you need to know about

vim how to get out of it

is you press escape and you will see how

this insert word disappears so i'm going

to press escape now

and now i enter this command mode with

command mode if i type shift and column

it won't be entered here

where i was standing in my cursor

instead it's going to be

inserted at the end because i'm giving

him a command an instruction an

instruction i'm gonna give it is save

which weirdly enough means is you know

you command to save with w

and then you command just to quit with a

queue q makes a bit more sense but w

i think is for write

so with that if i do enter now the file

will be saved i will be closed so i'm

now ready to do for example a cat

uh dot bash aliases which show that now

that fight has the two lines that it has

so now we need to kind of prove that the

alice's exists there and i'm not very

sure if it will it will appear here i

think it won't uh uh yes

the remove is because

i entered that before but not the uh are

er safe and the reason is again because

this terminal was already running by the

time i added the alice's and the aliases

are read when the terminal starts so you

have to close i mean it will work in a

new terminal or you can you know close

all the terminals that you have

and when you start a new one new

terminal

that one i would expect now if i type

alias

i expect that alias to be to be here and

it is here it is right so new terminals

so basically you're restarting the

environment the the terminal environment

and only then um the alices are going to

be red

so now we are at the point where we want

to

save the

the files but before i do that i also

want to show let me do a cd again to the

home directory and i wanted to show you

the contents of bash because bash has

some of i mean the aliases

that we we have the ones that not the

ones that we wrote but the ones that

were already there come from in this

case from dot bash rc so that's kind of

to demonstrate why you know we want to

copy that file so we may need to inspect

that file so let me clear this up so one

way to inspect you know i told you

before is with cat

but the problem with cat is that you

know prints way too much and it's not

clever i can't search for words for

example so instead i'm gonna use not cut

i'm gonna use a less this is a program

that uh allows you to navigate the a

file with you know with pressing the

space bar you know you go down and up

and stuff but one good thing that it

does it also has the forward slash

command that allows you to type for a

pattern that you want to search inside

that file so alias for example if i

wanted to see if there is any alias

defined inside this file dot bash rc i

could search for the command alias now

with enter i see that yes i discover a

bunch of aliases that have been set in

this file so this proves that this is

the file that contains a bunch of the

aliases that i'm interested and thus i

need to save it in my in my dot files

folder that i can then later reuse

so let's exit this command with q

and and let's do another quick refresh

ls minus a shows now all the files that

i want and more so what we want to do is

to copy only the files that we are

interested in

inside a new folder so we can then uh

you know move them around so let's

create a new folder with make deer is a

command to create a new directory make

directory and let's call it dot files

so if i do an ls without the minus i a i

can see that to the two folders that i

had before desktop and project now i had

just added the dot files folder this one

so what i'm gonna do is i'm gonna copy

all the files that i'm interested in so

dot bash aliases is one

the other one was uh git config

the other one was

bash rc

and the final one was uh dot profile

the other ones i'm not interested and

what you know the way copy works you

know you can ask for help for that

command to see how it works but

basically you know you can give as many

files as you want to copy and then if

you give it at the end

a folder dot files all those files will

be copied inside that folder so if we

now do an ls minus a inside dot files

you can see that those files are there

so um

that is you know a folder that we could

if we wanted for example initialize as a

git command as a git repository with git

init and then maybe push to github so

that you know you have your dot files

saved

in a very good place right that you can

then access from anywhere and also you

can track the changes to your dot files

as you change your your preferences as

you go and then you take it from there

and reuse it in any computer environment

so the next thing i want to do is to

show you how you could reuse so

basically we have already achieved

something very useful just by navigating

and copying files and looking into them

which is this idea of storing your

preferred configurations of your system

and then

the next part of this session is going

to be to show you very quickly how you

can reuse them

in an rstudio cloud project

but before i do that let me go back to

your faces here and see if we have any

comment or question i think we still

have enough time for

for the complete decision

no comments yet

so then let me show you

the

rest of the lesson is okay so now we

have

those files how can we reuse them

so the first thing i would do is is

create a compact version of that folder

that folder um so why okay let me first

go to the place where i would like to

reuse that computer environment so i'm

going to go to rstudio cloud

our studio cloud if you don't know it is

a free service by our studio that gives

you free computers basically so you can

click a new project for example and

start a new rstudio project and and then

it comes with a no name and title

project and you can call it say home

demo i'm gonna call it whatever name you

want

and

this takes a little a little while not a

lot not a lot longer and

we will be dropped in another studio

environment that is kind of boring

because it doesn't have our preferred

configuration it has doesn't have

alice's he doesn't have he doesn't know

he doesn't know who we are so i'm going

to prove that first to you

although the first thing i would like to

do is to you know go to the terminal and

navigate to the home directory of this

computer we know how to do that cd

change directory tilde for home and we

are now in the home directory and to do

the same uh here i would like to show

the home directory too so i'm going to

go to the console and set

the working directory to

set the working directory oh sorry to

home to that so this is kind of our way

to set your computer to the working

directory and now here i want to do a

couple of things first i want to

navigate to the working directory which

is now

the home

so this this is the home of this

computer and the second thing i want to

do is to show the

hidden files and hidden directories so

as you can see there is a couple of

hidden directories config and rstudio

but there is nothing of the files that i

i'm interested in reusing there is no

git config and there is no

um dot profile there is no dot bash rc

or anything like that so let's let's

confirm that with an ls minus a so you

can see it's very boring

if i type alias

i don't get any alias because there is

nothing configured there so this

environment is really hard to use so

what we are going to do is we are going

to reuse our our

dot files we are going to just drop them

here

and that's all we need to do to get the

experience that we are used to in our

local environment how do you upload

files here well there is this upload

button here so let me expand that i

think yeah upload

the issue here is that it likes a file

not a directory and we have our files

stored in a folder we could do one by

one and that will work we could bring

you know each of the files one by one

but you know we have the powers of the

terminal so we may we may just use them

just by learning at least one new

command zip so zip uh is you know that's

what you expect you would sip a folder

into a single file that has everything

that you want so uh you have to see it

recursively in this case for all the

files that are inside the directory dot

files

and uh we are going to first

call

you first give the name of the file um

that you want to create it's going to be

called dot file zip and then you have to

tell it where

the files come from in this case

recursively inside the directory.files

so this is the command if i do an ls now

you see this red file here is the zip

version

of

um

of our dot file so this is what we want

to upload to our studio cloud and then

uncompress and voila we're going to have

the environment that we want so to do

that

i need to move um

to have access to that folder i need to

move it i'm going to use the command

move

i'm going to move dot files inside

projects and i'm going to press tab for

auto completion and i need to move it

there because that's the only place that

i can access in this

um

docker comp docker environment and i can

kind of get it out from there so where

is my zip file

should be

somewhere here i can't

see

maybe i need to refresh this little

window

i think you move the folder

right uh

maybe you're right yes thank you dot

files thank you monica

that's right and the folder is there so

the folder can be deleted now

and instead i'm gonna do the on the

terminal the zip

file let's see if that works let's

refresh

yes so this is the file that i want so

now from our studio.cloud i need to just

click on that upload button

find that file in my computer

in my case it's gonna be here this one

open

so our studio when uploads if something

that is a zip file is gonna be it's

gonna uncompress it automatically and

there are the files so you could just

you know click here and and and click on

move them right to the root of the home

directory here but again we have the

powers of the terminal so we could do

first and last to orient ourselves and

and then what we're going to do is we're

going to so we're going to see the

change directory into dot files

right and now let me clear this up with

ctrl l so with ls minus a as usual we

see that all the files that we want are

there so what we want to do simply is

copy cp

everything here

dot which is you know all the files in

this directory and we're going to move

them to

uh the

home directory so basically

the root of the home i think i may need

the recursive flag let's see yes i need

the recursive flag so minus r

here

and and voila so if i now do change

directory to the home

and remember that before it was very

boring there was nothing in there so if

i do an ls minus a now

i do see all the files that they are

there this terminal still won't behave

as i expect because again it started

before i move those files but if i close

all the terminals and then start a new

one

you will see how this terminal now is

cool so let's do cd tilde let's type

alias and our addresses are there so for

example if i touch a file say if i a and

then i want to remove a then i'm going

to be asked if i want to

remove it because i'm using the

interactive version of rm through the

alias that we wrote and that proves that

we are now in this now much nicer

computer environment which also in this

particular case also comes with

colors for

ls

okay so that kind of completes the

exercise of

customizing our environment saving the

dot files to a folder that we can keep

track of and then reusing that very

quickly in a new environment in this

case in our studio dot cloud

um all right

goodbye monica i see you're saying bye

any other um departing comments or

questions here before we go

okay thanks everyone with this we kind

of close the first section of the series

and later we're going to be talking

about like deeper stuff

more developer oriented but with this

even if you know you leave the series

now you will still have learned very

useful things which i hope this use case

proves all right see you next time

thanks for joining

thanks
