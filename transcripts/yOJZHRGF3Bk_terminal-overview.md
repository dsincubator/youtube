---
type: Video Transcript
title: "terminal overview"
description: "so today the dsm creator starts a new  series it is about working with a  terminal  and it is based on this lesson from the  carpentries it's called the unis th"
resource: "https://www.youtube.com/watch?v=yOJZHRGF3Bk"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=yOJZHRGF3Bk"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

so today the dsm creator starts a new

series it is about working with a

terminal

and it is based on this lesson from the

carpentries it's called the unis the

unix shell

it has a bunch of topics um nicely

summarized in in the lessons schedule

and i will be quite opinionated about

what we cover what we don't cover uh

because i would like to focus on the

things that i you know i believe that

will give

like the most value with you know the

the least content and and uh with that

intent today i'm gonna be walking uh

through

the entire sea levels giving an overview

of you know the whole picture that i see

as of today but also with intention of

sharing it openly and in case that

someone here in the room or someone else

finds that what we

what i'm planning um

to cover is too much or too little

something you know i'm missing and

things like that as usual um the ds

incubators have

a repository associated to them

this series is called ds

dot terminal like the repository that

hosts the material for this series and

and as you show uh each chapter has its

own little folder with a redmi file that

kind of walks through the content

but before i get there i would like to

kind of show you very briefly the

overview of

the series so the goal is is not to make

you an expert in the terminal is basic

basically to help you understand what

the terminal um is and you know what

powers it has and then you can decide if

it's if it's a good fit for you

overall you know i'm going to be aiming

to you know

cover how to navigate your file system

and modify it by you know moving files

copying files dating files and things

like that

then how to perform complex actions by

composing multiple simple commands

which we can do with a command called

the pipe with that operator called the

pipe in the same way or similar to what

you know the pipes that we have in our

for example

and also how to find things either you

know find files in your system or find

um text patterns inside files

and do one thing multiple times this

idea of iterating and how to create your

own little commands that help you do a

lot of things with just a few key

strokes

and the idea for using code

and also how to customize your terminal

to make it either nicer or safer

so

i'm hoping here to touch to kind of to

demonstrate that the terminal is kind of

for everyone at two degrees and also

beyond but i understand that there are a

lot of the things that you can do with

it with a terminal you can also do with

the more common graphical user

interfaces so the terminal is no more or

less than a tool to interact with other

tools and usually we do that by clicking

buttons and and you know opening windows

and closing windows and things like that

so i understand that there is not a lot

of motivation many times and it's only

until you hit like a wall that you say

well i have to do this thing like you

know five you know 500

times i'm doing this by clicking things

it's not gonna get me there very quickly

or efficiently and it's ever prone it's

only then that usually we think okay

maybe i need to you know program what i

want to do but then we also have r and

and then it's a higher level language

it's more expressive so if you know how

to do things in r you may wonder why

would i even worry about the terminal so

a big part of this series is to also

help you decide when to not use the

terminal so hopefully with what you see

here you will see opportunities for

using the terminal and opportunities for

replacing the terminal for another tool

that is a very suit a better fit for

that specific job

so let's jump right in right into the

today's um lesson which is the overview

and then you can also scheme at your own

time the

this readme file that you know suggests

what i i'm thinking of of showing next

time

and

um

and then the at least two more meetups

after that

but uh yeah let's jump into that so i'm

gonna go to the folder zero zero

overview um which basically touches over

the whole syllabus as i imagine it today

so um what i'm gonna do is i'm gonna

move my

um you know my list of things uh here to

the left i'm gonna make it small in the

sense of that it fits

um

takes up not a lot of space in my screen

but uh but big enough hopefully so that

you can read it i'm gonna open here

terminal and later we in the lessons we

will cover

how you can access the terminal if you

don't have one that you like already but

today i don't want to waste time with

that i just want to get into the

into the contents

so and one of the first things you're

going to be learning

to do with the terminal is to navigate

your file system in a very similar way

to what you already do when you have a

file explorer like this one here so

in the

in the terminal to the right

i have

something similar to what you see here

on the left which is more familiar so i

would like to move you from familiar to

not so familiar uh to help you know

create those bridges in in the knowledge

in your brain

so here on the left you see i'm here yes

yes

sorry i i'm not sure if i'm the only one

i only see i see like your

um

i don't see the terminal the full thing

okay cool let's

let's try and fix that

so i'm gonna unshare and share again

maybe i click the wrong

button

uh thank you for that it was frozen for

me also but then but then it got better

okay

okay suggesting that the screen was

sharing

but in an odd way

how about

now do you see to the left something

that looks like a file browser on to the

right terminal

boring black

yes

okay awesome

so this this part is basically to show

you that with the terminal you can do

the same things that you do already

with a file browser for example just

move around and look inside folders and

files and stuff

uh folders and files now um

which is not enough motivation to use

the terminal maybe right so for example

here

on the left i have um you know a folder

inside my home directory that is called

desktop so i can click on it to see its

contents the same thing i can do here

then

the issue here is that i'm not i'm not

seeing you know what is where i am or

what i condense this place has so to see

where i am i can i can print the working

directory pwd and so i'm in home so this

is the home for this specific system

and uh imagine this is my computer so i

can list the files and do an ls list

to see the content so now i see

something similar to what i saw before

when i was here in in home and i could

see the desktop there if i wanted to uh

list the contents in a different way

like more similar to what i see on the

left i can do a minus l which modifies

the command so in this case ls is a

command and minus l and modifies that

command

and makes the list different uh to make

it even more similar i could do just

minus one which will show one column of

of that so now they are very similar

so let's see what else um we

can't do

so that's the idea of

moving of listing things and knowing

where i am but also i may want to move

inside a directory as i do here clicking

the folder so what if i want to get into

desktop well then i change directory

into desktop and i don't have to type

the whole thing usually your terminal

could have autocomplete so i can press

the tab to let terminal complete the

word that i want to type and and if i if

i type just d it will it won't work you

know it will give me many options

because there is many things that start

with the d but then as soon as i i you

know disambiguate this terminal will

know that the hitting the tab is that

one thing that only matches what i typed

so let's change directory to desktop and

now i do another ls there let's say that

i want the minus one version of it so

that i guess just one column and that's

all there is it's just one folder

exactly as it's here so i could navigate

inside here and then say inside here

and the same thing i could do here so i

can recover all commands with the up

arrow and and then

when i if i want to move inside or or

look inside directories again i can do

also the autocomplete so i could start

typing sh and autocomplete and then i

can hit autocomplete again even without

knowing the contents of that directory i

hit twice and i get a list of things

that are option options to me and now i

start typing north and hit the tab again

and there there i am so i can see the

contents of that of that specific uh

directory

so up arrow

um to recover the command enter to run

it and if i want to clear i can type

clear

clear

oh clear or i can just press a ctrl and

l

so let's do another ls minus one to see

where i am standing now here it is

um okay so far is moving around that's

things and we're going to be covering uh

in kind of depth later on uh the idea of

customizing your shells okay so there is

a ton of customizations and we won't

cover um many of them but um what i

would like to demonstrate for example is

that here is very um bad to not have a

feedback of where i am and all the time

having to type print working directory

is kind of annoying so i would like to

have this information all the time in my

command prompt the prompt is this dollar

sign symbol next to the blinking thingy

to the blinking cursor so what i can do

is modify the terminal i'm going to do

this one thing

just to demonstrate how customizable it

is

i know that the commands i'm typing here

are not like intuitive at all but

what i can do with this is modify my

prompt so that when i clear it i always

know where i'm standing so i don't need

to type print wt i know it will print

the same thing except that in this case

you know it's showing the the is

expressing the

home

of this computer in an abbreviated way

with this tilde symbol which means the

whole thing here

okay so let's see what else

um well the idea is that uh you can

compose things uh very easily with with

a terminal um to do things like for

example um

not only using one fla you know before i

show you how i can do it for example ls

to see the contents of this i can change

directory inside this uh let's change

directory inside north pacific

for example so here

if i do an ls

here let me show you this

if i do an ls here i can list the files

but there is more that i can do to ls

more flags that i can do other than

simply say the minus one that i showed

you i could start combining flux like i

can do ls minus l that will show a lot

of details and then after that

let me open this bigger and clear this

and show it again so pay attention to

the order where i have for example the

dot sh files at the bottom and the text

files at the top so i could

i could combine flags with like not only

l to list things as you are seeing them

now but also uh to to for example sort

them uh in order of size so i could do

something like um s will you know i add

information about

about the size of the files

h will make it in a human readable way

and uppercase s will sort the files by

size so now uh actually this is the

output is the same but i could also do

another flag

here

r to reverse the sort and now you see

how the s h

sh files have been moved to the top

because the files those files are the

smaller ones and i sorted this by um

by size so this is similar to what you

would do for example here if you click

on a folder that shows a bunch of files

like this one and then you sort by by by

size clicking this uh these little drop

downs here

okay so moving on to what else we might

do

so the idea of modifying your system is

also

important you know beyond just listing

what you have you may want to create a

folder for example

so let's move back a little bit which i

can do with dot dot to go back and again

with dot dot to go back so i'm here at

the desktop let's see what i have here

and let's create a new directory with my

dear and i forgot to pass an argument

and the terminal tells me you know gives

errors as r does for example to tell me

that i'm doing something wrong so and

make dear a so the director is going to

be called a ls will show a

and now i can create a file with touch

for example inside a i'm going to create

a file called um

i know b dot txt so that's a file

so now ls shows

the contents of this directory but ls

with a gives me the contents of the

folder a inside desktop and there is the

file so you know we are going to learn

how to create files also how to remove

files which is very dangerous so i could

do a remove and to make it safer i can

type a flag that is an interactive

remove to get a confirmation that what i

want to do is the right thing

and then you know type the name of the

file that i want to remove and then i'm

going to be asked for a confirmation i

can say no or i can say yes in this case

i'm going to say yes

so

the idea of navigating is covered the

idea of

modifying your system by adding files

maybe you know moving them from one

place to the other and so on

and then the idea of composing commands

you know we saw how to compose flags of

one command but you can also compose

multiple commands

with this pipe operator that allows you

to feed the output of one command

as the input to another command and then

you might even you know

send the results to a file for example

something similar to what you might do

for example in r so let to show that

let's change directory to

let's see what we have here the shell

uh lesson data

let's see what we have the north

and

let me remind okay yeah so let's use the

north folder here let's list the files

um and

so i may want to count for example the

lines

of

each file in this directory so i can

first

do word count

um

counts not only words but also counts

lines if i say minus l

and and to make sure that i'm gonna get

the count for everything here i use the

asterisk here which stands for god of

all

and that alone will give me this this

kind of summary right with the number of

lines that each fight has note how the

first ones have 300 lines and the ones

at the bottom have 17 and 10.

and what if i wanted to sort that in a

different way well i could you know use

the

the

command sort but i would like to fit it

to the output of

doing the first command so for that

what i can do is use the pipe so the

result of

computing the the lines count for that

folder then i pass to sort so then you

can see how the output here is very

different to the output that is not

sorted because the the the sorted and

you know the sort is moving files up

right and then if i wanted to redirect

the output not just to the console but

to a file let's call it out.txt and i

can use this greater than symbol that

will send it the standard output that

you see on the console

into a file so now if i clear my console

with ctrl l do an ls i will see that

there is an out.txt file and no

surprisingly if i if i show the contents

with cat

of out.txt i should see the same thing

that i saw before on the terminal

okay

thanks very much cj

um the other two things that i will like

to core in part two and three are fairly

um advanced i think part two is not

super um

uncommon

um

and it's the idea of finding um things

inside files and finding files

themselves so let me actually have this

here to the right

and this to the left so before i touch

on on these ideas uh to inspire

uh your brain juices uh let's make a

pause acknowledging that we have 10

minutes which is enough to discuss

questions and comments so i'm gonna go

back to your faces

so so far do we have any

comments or questions

does it sound something

um

potentially useful

faria would you like to go ahead first

uh yeah can i just ask so you know how

you created the dot txt file right

um can you also like create any file

with any extension like a dot r file or

a dot dot py file like is that also

possible

yeah that's a very good question because

it is so basically you can create at

least in the linux system that i'm using

you can create a file with any extension

which is kind of powerful and dangerous

because you know i can i can create a

file that inside has r code and call it

txt or the other way around so the

extension is something that will be used

by some systems i understand to

interpret that file as what you promise

it contains but doesn't necessarily

force you to match the contents with the

extension i mean was that clear maybe

basically yes i could have you know

pasted tests inside a file that i called

dot r for example yeah that's clear yeah

so you have as a person you have to be

very disciplined because if you use the

misleading extensions then you will be

misled

alex yeah yeah thank you

um yeah just sort of a general note for

everyone um like maro was

moving around pretty quick today and i

know it can be overwhelming to see

someone who's like good at the terminal

doing terminally things um

keep in mind that like

maro did not learn this overnight

and

like knowing all of the different flags

and all of the different commands that

is something that

ultimately you're going to learn what

you

find useful like

i use grep and set a lot so i know those

commands i know those flags but like i

see that maro's gonna be talking about

find later on and like that's one that i

don't use that much i don't know about

it

um

stack overflow is your friend you don't

need to remember how to do the thing you

just need to remember that the thing can

be done and then like there is a

tutorial for whatever you want to do

uh specifically

um especially because uh it's worth

noting

uh maro is working on an ubuntu computer

a linux computer and

uh the commands for people on mac are

going to be slightly different in ways

that are annoying if you just try to

blindly follow the same directions

thanks alex yes actually it's a good

point now for those who also join later

the meetup that uh what i'm doing now is

not hoping to teach you anything he's

hoping you to give you an overview

because um even if you think actually

none of this is something that i'm

interested in then you will have saved

time by not joining next ideas and

greater meetups on this series but

but at least i want to kind of unleash

very quickly the powers that will be

available to you

if you stick with with this series and i

think a big part of my role in teaching

this is in curating what i in my head

believe might be that you know like 20

that will give you the 20 percent the 80

of what you want to do so i want to give

you the minimum amount of content that

the minimum amount of tools that will

allow you to do a lot so with this for

example i realized that if someone like

alex and actually i confess i also don't

use fine a lot

maybe i will leave find out because it

is a powerful tool but there's other

ways to do that and it is a fairly weird

command for example compared to many

other commands in the in the shell

um

so with that you know i'm also going to

give myself some permission to not fully

cover the

the lesson that comes from the

carpentries but to instead think what i

in my experience and people like me have

used or found most useful and give you

just that so that you know in maybe four

meet ups you get um you know a fairly

useful set of tools pretty much that's

that's the goal

cj i see your hand up

just a few quick comments so um well one

i was very glad that you very quickly

got to the point where you had to make

the comment that um terminal can be very

very powerful but also very dangerous

because that pretty much sums it up

um two i wanted to point out that most

windows users don't have like immediate

access to a shell similar to what you're

looking at as

mac users do i'll albeit that there are

some differences but there are some easy

advantages or ways to get that like

using git bash or something like this

you can get a shell similar to what mars

is

demonstrating if you're on a windows

machine

and

i already forgot the last one oh i

wouldn't say one thing that might be

interesting and maybe it's just me

uh alex already mentioned stack overflow

but i'm kind of a keep for reading the

actual help files so man is a function

that

you pull up the functions the help files

for these commands and in my opinion

like just so as i often tell people what

i'm teaching are it pays to get used to

reading the man files or the help files

or whatever's appropriate for the

language and environment that you're

using because

they're often

expressed in a very similar way they

follow summer style and

they're very daunting at first but once

you get used to them it's

it's worth them knowing how to kind of

use them and look for what you're

working on so i would maybe suggest you

more to maybe think about taking some

time

looking into map files and how to use

them and yeah

thanks yeah yeah yeah absolutely i think

that's the kind of thing that you learn

one thing and empowers you to do many

others so basically by learning how to

read you know one uh hell file then you

know

how to teach yourself a lot many other

but and it's true i mean these days with

internet you can access uh help files

online but you know they are there if

even if you don't have internet access

you still can interpret

the

help that you have locally installed

that's awesome okay thanks a lot um

maybe i will very briefly

say

what my plan might be maybe not show

examples here so the lesson um and how

it differs i think the great command

then um is something that we may spend

quite a bit of time uh talking about

because if alex finds it useful and i

find it useful very likely it's gonna be

like useful for you too

they find maybe i should i will be brief

on that it's terribly powerful

but very different to many other

commands it can be confusing so maybe

i'm going to touch it or maybe not we'll

see

then the lesson in the unique shell from

this

um software carpentry covers uh

iteration showing how to do loops in the

in in bash basically because the the you

know the shell this is you know what i'm

talking about uh now i'm using the word

terminal but you will find other people

refer to it as the shell and the shell

is not only the interface to the

programs that you know i'm describing

now but it is also a language so you can

use some um like code to do things like

iterating but i find that a lot of the

times i need to do iteration i find it

easier to do in a higher level language

like r so i don't think um i will spend

a lot of time in that instead i'm going

to show you

just one tool that helps you to iterate

over multiple things very quickly which

is xrx and and then maybe move on but

that's probably something that i would

also um you know like feedback from from

alex or cj to see what my what kind of

iteration challenges might be worthwhile

solving in the terminal compared to say

r

and then the the lesson also covers

shell scripting which is this idea of

okay now now that you know how to type a

few commands you know if you type those

commands very often then you might save

them in a file and then execute that

file as if it was a problem on a program

on its own so it's the whole idea of

reusing code and i think that again you

know it's it's useful to know how to

reuse some code you know like a section

a sequence of a few commands but that's

something you can do with for example

alias which is one way

to reuse

um

some code and in this case i'm showing

one example where i transform the rm

command which is famously dangerous into

one that is more safe because at least i

have to confirm that what i'm going to

do and

is what i really want to do you know i'm

changing one command to a flavor of that

command that acts asks me for

confirmation the minus i stands for

interactive so that kind of thing i

think it is very useful to know how to

do in the terminal i do it all the time

but

when i need to write more complex

operations i just go to r and do it

there right so maybe i would prefer to

spend time showing you how to then

basically call from the terminal

programs that you have written in r

something like that so that would be my

own version of the unix shell lesson

from the carpentries

and okay we are at the end of the meet

up but i acknowledge i mentioned a

couple of things and i would love to

hear feedback from

from people here is any the parting

comment or question before we go

okay then we are going to call it a day

if you do have some ideas after and you

know we end

this session in a few seconds then reach

out on slack or twitter and i'll think

about your ideas thank you

don't
