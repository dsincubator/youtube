---
type: Video Transcript
title: "terminal: Find things"
description: "welcome to the ds incubator this is the  series about working with a terminal  today we're going to be talking about  finding things with grep and with find  th"
resource: "https://www.youtube.com/watch?v=iYlKc0BTjBk"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=iYlKc0BTjBk"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

welcome to the ds incubator this is the

series about working with a terminal

today we're going to be talking about

finding things with grep and with find

the objectives are motivated by three

use cases one is to find interesting

arguments in a head file another one is

to move our rstudio projects from

whatever they are in our computer maybe

excluding trash

to

a folder where we can keep them all

organized and third we're gonna be

pruning our trash

today the lesson is in folder number

three

and i am gonna be using this computer

environment you don't have to but if you

do then you're gonna get the exact

um

environment and also some of the data

that i'm going to be using here

click here we are let me clear with ctrl

l and

let me do a cd change directory to my

home um

where is this pre-working directory this

is homepage studio what do we have here

we have a few folders um let me show you

that rs has nothing and and then the

other folders and we're gonna learn

about them in a moment so i'm being

guided by this lesson here so let's put

it here to the right maybe make this a

little smaller my computer environment i

don't need that anymore

as soon as it gets there we go

or not as small a little bigger here

should be fine

um okay so here um

the first thing i would like to do is to

talk a little bit about grep grip is

this amazing command that helps us find

things

so the hellfire is long right so let's

clear this up uh just you know to have a

gist of

what it does um we can have

have a look at the head of it

and this already shows at least the

usage which is um which is you know like

usually how how you

uh can get started so grep takes

some options like for example minus i is

an option that i'm gonna be talking

about today which makes the

matches for the pattern

um insensitive to k so you know if you

use the minus i flag then you get

upper cases and lower cases

indistinctively so then it takes a

pattern or many patterns so a pattern

could be something like

like i i comma as you can see that every

flag is you know has a letter and then a

comma so let's try to to you know learn

about that particular um

flag

and so that that's going to be my

pattern or it could be f if you will

actually f i think is going to be a bit

more

useful for this for this case

and so with that if i run that

well actually

i get nothing because you know it's

waiting for

the the file from which the text comes

but i'm not going to be passing any file

instead i'm going to be

actually passing the output of

grep

help i'm going to pipe that into

into grep itself

to then search through the health file

and and find um that pattern f comma

insensitive to k so if i run that here

you can see how it matched capital f and

lowercase f

so that's how the general use of it and

it has of course a lot of options that

you can you can play with and

one really cool one i think is that you

can create a file with the patterns that

you want

um to to match so for example if i want

to match um well as i said before right

maybe the pattern f comma but also an i

comma and also v comma and also uh n

comma so let's see those are my some of

my favorite arguments

what did i do here

let's try to escape

column

save and quit

press enter to continue

save

column save and quit yeah no invalid

command lines execute

enter to continue

patterns

okay column

save and quit finally good so if i do a

cut for patterns um you can see those

are the patterns that i have so i'm

going to use that um again you know and

remember them

grep

my call to grab looked something like

this

but now i'm going to modify it because

now i'm going to be using a file and

and the file is called patterns

and so that's what i'm gonna do so here

it is

the matches let me clear this up call

this again the matches uh show me that

grip not only matches one occurrence of

the thing like here for example there's

nowhere else in the help file of crap

that has

the

sequence you know lowercase v

a comma but um

but it matches all the occurrences like

in this case like n comma appears here

too right so it matched the two

occurrences of it it could be any number

of them

um

so that's how you use a graph and that's

how we learned for example that um the

minus f which is the flat that we use

here is the one that you need when you

have a file that contains the patterns

right it takes a pattern from file and

minus i is the one i already told you

about the one that ignores the case

and then v is is cool because it helps

to invert the pattern so you know you

can sometimes it's easy to express what

you do not want too much so you pass the

pattern with the minus v and you get

everything else and then n is really

cool because it allows you to show that

the line numbers uh not capital and just

lowercase and the line numbers where the

files occur in the file the matches

record in the file right so if you want

to then look for 912 in

in your help file of grep

and

[Music]

then i mean you can pass it to cut end

that to get the

the line numbers

and then in line uh 12 you know you have

you know that

you know that that much that you want

you were looking for okay that's about

grep you can use it in many many many

many many cases so it's useful to know

about it

next

use case is to learn how to move

our studio project so our two approaches

are calling that um

they are flagged by one specific file

that ends with dot our project and so

we're gonna find

those files so find is a command if you

type find and enter

what you will do is we're gonna match

every single file that exists under the

default directory which is the root this

one here

but um it's more interesting if you do

something more specific like for example

find all the files that are in my

home

and what you know by default it has an

action that is the action to print

things to the console like here but

there's other actions like for example

ls so once you've matched those files do

something other than printing them give

me information about those files and

here's what you get right and there's

many more actions some are very

useful and we're going to be talking

about them today so um

find here in my home and now we're going

to be using what's called tests so we

know that no we have an action

print

we have a path that is home

and then in between you may have

tests what are tests or something like

okay the name i want it to be whatever

that has

that ends with our approach for example

so

then

i'm going to remove the print because

it's implicit you know this is what we

get you know we discover here in my home

all the projects that we have and

interestingly i don't want to match this

one here because it's in my trash i'm

about to move

only useful as your projects to a

directory called rs

this one here um

rs right now has nothing but in a moment

it will have you know what i want to

move there so it will be interesting to

match not

something that in the path and this is

you know part of the path not just the

name

which is this but the path of the whole

thing and i want that the path not too

much uh you know anything then they were

trash and then anything so if i do that

then i only get these two directories

that are the one the ones that i want to

move so now we are going to get creative

so um to

move these

things i want to move the entire the

folder not just the file our brush i

want to move the parent of that or that

file the folder abc in this case or the

folder xyz in this case right so how do

we do that okay if the command name if

you give it a b

it will give you a so that is

you know or if you give it

a b c it will give you ib

so exclude the file name component of a

path basically that's what it is so

that's what we're going to be using here

so once that we have the files that we

want we want to pass it to their name

but this will uh so everything that goes

to the left would be passed here to the

right uh right and implicitly but this

will fail why because the name needs um

not the paths as we get them from here

that one in one line it wants them one

next to the other so if you if i do x

this is the other magic find util

utility to find things and i do an echo

you can see how those files are now in

the same line separated by space as

opposed to separated by by a new line

and so sars creates one command line for

each of the things

here basically um so

what we want is to pass

you know after we pipe it we call start

and and then we pretend that um

everything is fine dear name and here we

have the directories that we want to get

the dream for but we won't write them

because they're going to be piped from

the left anything that comes all the way

from the list goes all the way to the

right so here they are those are the

directories that we want to move and now

is where things get interesting again we

need to do x because we are about to

move files

but all these files no we don't have

just one we need to move all of them

at once and and and move takes um you

know files and a destination but you can

invert this you can do destination and

files if

we use the flag minus t so that's what

we're gonna do so the destination is

gonna be the directory rs and the files

are gonna be piped all the way from the

left so this one here we're gonna leave

it empty because it's gonna come from

the left so i run that

the name terminated by single three

what's going on here

this ah sarcs

um

made a mistake ex

ex this is what i wanted to type so and

now if i

do

this if i find my h2 project except for

trash i can see that they are all here

neatly organized in rs so i could do an

ls for uh

an ls recursive inside rs

and you can see how you know they're all

here

know xyz that contains the art project

and abc that contains their project

everything is is in there

so the directories are here and then

they spell them out

um

do i have the command tree here which

i doubt i could no

um

all right with that you know i've

learned we've learned how to

find uh things and how to move

directories uh how to use xrx and now it

would be nice to um remove

the the things that we have in trash so

we're going to be finding things not in

the home but specifically in trash

so

from all of these i want to exclude the

name of the folder itself so i don't

want the path to contain the word

trash and so with this i get just the

contents not the folder itself

and and now we know is when we can use

another action remember that we have the

action say ls and the action print

well we also have a very useful action

is what is called delete when you do

that you remove the content so if i do a

fine on trash i have now nothing you

know what had there is gone that is of

course dangerous so you have to be

careful because in this case you have no

confirmation

let's create some stuff

in there to show um how other things you

can do uh how what otherwise you can

delete um

files and directories so another way is

you know similar to what you already

so what i just done is to create uh some

content so if i do a find on trash i can

see that there is something there so i'm

about to do something similar to what we

did before so find um

so

find

five but we're not gonna use

delete remember that we now know how to

use size so we could pass sarcs

to

remove right so

remove takes you know here the fires

that will be coming from the left hand

side of the pipe

so this this should work except that

we'll need

we are deleting not only files but also

directories this is something that we

already talked about in previous meetups

and if we want um

you know even the directory names to be

removed with no messages you can say f4

force so that will you know make sure

that now your um trash is empty

but the folder itself is there right

um oh we could also remove um as usual

indirectly the file patterns because we

don't need the anymore yes remove it

and uh what else okay

what's the safe way then to remove

things and let's

copy this back again and paste it here

so what i'm doing here is to create some

content for trash so you know i can i

can remove it and so another way would

be to find in trash

something is not

the

path

not the

name

trash itself so that will give me um a

so the name of the directory a and its

content and now we can do another action

that is called

x

sec so we learn about ls we learn about

print we learn about uh what else we

learned about about the leads and now

we're going to learn about xxx exec is

more general than xrx for example and

it's very general so you can execute any

code including remove and and now

instead of you know relying on things

being passed to the right we can choose

where we pass

you know where we inject the arguments

that come from from fine so find you

know prints you know these things so

we're gonna insert them

in

here right so we can also say remove uh

in this case we can say remove

recursively and interactively

which is cool because

we can get a confirmation and that's

make this a little safer unfortunately

apart from that um

placeholder for kind of according to x

in a function name

you need to end the line with a

semicolon and oddly enough you have to

escape that thing that's unfortunate but

that's what it is so now we're writing

this we get a confirmation that would

you like to descend into the directory

yes i want to descend would you like to

remove the empty file abc

yes would you like to remove the

directory trash a yes um now it says no

such um file directory but i don't think

that's

uh a pro so if i do ls on trash or and

find on trash there's nothing in there

so that's achieve what we want all right

with that we finished the content of

today if you want to learn more about

what we covered you know you can use

always the help command for grep here

command for find and focus

or this is very cool find new deals

super long documentation actually you

need to find this one here online

version of documentation

this one i'm gonna copy there and that

will tell you a lot and more that you

want to know about

uh here is it

this one here

all right with that we end so see you

next time
