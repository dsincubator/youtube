---
type: Video Transcript
title: "terminal: Create a custom command as a user in a multi-user system"
description: "welcome again to the ds equator we are  still in the series about working with a  terminal and if this is the previous  last session today we're going to be  ta"
resource: "https://www.youtube.com/watch?v=jyBv5ITO718"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=jyBv5ITO718"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

welcome again to the ds equator we are

still in the series about working with a

terminal and if this is the previous

last session today we're going to be

talking about

a multi-user system from the perspective

of a regular user and next time and last

meetup of the series we're gonna be

talking about the multi-user system but

from the perspective of

an administrator of the system

which if we are talking about for

example my laptop or your laptop the

administrator and the user of that

system is the same person

and the total number of users is

probably one

but that's not necessarily

the case always so a system could have

only one but we have many users

and that's the idea that i would like to

kind of convey today that

most systems even your laptops

can be

a multi-user system and what

challenges it brings like for example

you may see this this error the

permission denied in some occasions and

not understand what's happening like how

i created a file and i don't have

permission to

to use it um i was going on like uh

the the mental model that i'm gonna be

building today hopefully will help debug

that kind of problem

the meetup is presented in the form of a

use case we are going to be creating a

command called hi which is going to

greet us by our username

the objectives is to log in

into a system that is that has

potentially multiple users using our

username and password

then

we are going to

extract or evaluate the value of

environment variables that will be

useful

in our use case

we're going to also write our

high command first as a script that we

can run with the with the program bash

with command bash and then we're gonna

transform that script into a more

like common

command something that we can just type

the name of the thing of the command and

the thing happens

um so for that we're gonna make that

script executable as a command so that's

the

what we have for the menu today and next

time we're going to be learning

i think the the use case is going to be

you know installing software but the

idea of in general the idea of using a

system from the perspective of an

administrator

so the session today is in the folder

for here somewhere here in my view code

permission denied

and

i'm gonna

leave this here on the side uh i'm gonna

be working

with a computer environment that is

reproducible if you want you can use

docker to reproduce it you don't have to

but you can if you want to see exactly

the same things that i see here so this

docker container that i'm running in my

computer is actually creating a server

that

in this particular case leaves inside my

computer but it doesn't have to it could

live

externally so the experience that you

get when you log into this url

is the same experience that you would

get if you are a user of for example

remote server that

i may maintain for 2d for 2 degrees and

you are an analyst that wants to use

rstudio on this remote

server so you just you know paste the

link in your browser and you're

presented with this interface where you

log in you log in as your user so in

this case the user of this

server is called rstudio so i'm not

going to log in with my name my real

name mauro i'm gonna log in with my

username for this system which is our

studio

and i'm giving a password by the

administrator of the system so i'm going

to use that password here

usually you can also change the password

uh that you're given

uh you have that right as a user to

choose your own password and uh but

that's not something that we're gonna be

using today also we're not gonna be

using our studio itself you know i think

it's a nice thing to demonstrate because

in our experience um more commonly

analysts could you know log into

something like anarch studio server

but the thing that i want to show today

is all in the terminal so i don't need

to do more than just uh you know show

you the the terminal here so i'm gonna

move this a little bit here to the left

clear this up with ctrl l

and here to the right i'm going to put

the notes of today's session so i'm

going to detach here this move it to the

right and use it as a guide so we

already covered the login

and now we're going to be first

inspecting some of the environment

variables that we're going to be using

in the rest of the use case so and like

bear with me uh the use case is coming

soon but we first need to explore a few

things so you know that i logged in as

um

as the

user

our studio so you could find

as unsurprising that if i do echo so

echo is this command that if you say

echo high it will respond high

but if you say something more

interesting like okay echo

and evaluate the value of of a variable

that exists in the system that the

administrators or someone other than you

um

set for you so the the environment

variable called user with capital

letters user um

holds the name of the of the user that

locked into that system so in this case

you know we would expect an echo high r

studio and that's what we get

so we can also use echo to say get the

value of the home directory of this user

so copy the letters home give me

slash home slash rstudio that's simply a

directory a path in the system

where the user our studio has privileges

to do anything

and then finally a more interestingly

and more complex tool so i'm going to

clear this up ctrl l

is the value of

the environment variable path which is

going to take a little bit to explain

but it's it's important

so what you get here might look a little

confusing i'm going to expand this a bit

uh make it bigger

so this

is a bunch of paths

like places inside the system that are

separated by columns like

this column surprise the first path from

the second path oh sorry

i just highlighted too many things here

and there are some

paths that will

show up in their use case

later on for example the path

slash usr slash bin

is one path that you're gonna

see in the rest of the

demo

for a little bit

so what are these paths well these paths

are

locations in your system

that your system is kind of continuously

watching

for commands so if

for example a command like a bash

sorry

or like ls

they live somewhere in your computer so

you can know where they live with the

command which so which ls will tell you

okay ls lives in user slash bin

and there is where it lives right so

same thing for like which

which uh bash you know i can i can find

out where it is okay it lives in the

same location

uh slash user slash bin slash bash so

this this path here right so because

these commands ls and bash are located

in in a directory that is

um known by this environment variable

path

then they do behave as commands so you

type the name and they do what they are

supposed to do but if i if you type the

name of something that doesn't exist

like nothing

whatever then the console will respond

okay nothing is a command that has not

been found and the reasons maybe two may

be that the command does not exist as in

this case but the command may exist but

it may be in a location

that the path environment variable

doesn't know about so it doesn't get

discord

so this idea is probably like the core

of um

you know the solving the use case that

we're going to be working with today so

that's all kind of the background it was

quite a bit actually that we need to

know so let's move on

and uh and explore okay so what is a a

place

in the system that the user studio could

put commands so that they they get

automatically discord

and the answer to that question is going

to be well okay if you can evaluate echo

if you can evaluate path and you already

see somewhere in this

very long string of things somewhere

that says home user homer studio then

you're done

but we aren't um because we don't see

that right so we need to make

a modification to this path so that

somewhere inside

the home directory of our studio of the

user studio

there is you know like a directory that

you know where we can put commands and

they get you know discovered so they

work as commands

so the answer to that is going to be

inspecting a

file that i already talked about in

previous bit apps

it's called profile and it lives in your

home directory so cat

home slash

dot profile

gives you the contents of that file

and at the close to the end you will see

that there is a couple of references to

path

i'm not interested in showing you the

details of the code itself but this

comment instead so the

[Music]

the comment here says that the code

below

what it does is includes the user's

private bin and bin is no more and no

less than just a folder

so if you are the user say our studio

then under our studio you can have a

folder called bin

and if you do have that folder if it

exists

then that path data folder will act

um as a place where you can put commands

because it will be automatically

included in the path environment

variable

so let's experiment with that so that

means that uh let's do an ls inside my

home

and i see that there's a couple of

folders but with

one two three four five folders but none

of them is called bean so i have to make

one with make deer bean

so now unless of home place of home

which is the same place where i'm

standing right now shows that okay now i

do have a bin folder let's clearly sub

ctrl l so because you do have that

folder you would hope

that if you do echo dollar sign path

you would now get

that path the path to home our studio

being listed here somewhere but

unfortunately that hope is not met by

reality because reality is slightly a

little bit more complex and the

complexity comes simply from the fact

that

are you know the file.profile gets read

only once when you create a new terminal

when you start a new terminal so because

we started the terminal that we are

using

before we modified the the file um you

know basically before we created the bin

directory in a place that could be

discovered by the file

then that directory isn't included the

variable was defined before we actually

added the bin folder so the solution is

simple we just create a new terminal

uh and now the file dot profile could

have been read again and right now the

bin folder inside the user's private

directory could have been discovered and

thus if i do an echo

dollar sign caps path

now

the directory home our user bin

exists in the path so that means that we

can change our

change directory with cd inside bin now

so here's where we are now and any

command that we write inside here should

be automatically discovered and we can

use it from anywhere in

in the

user's

environment in user's

home

and whatever the the user is you know

that command eventually will will just

work

but we still don't have any commands so

let's just create one i'm gonna create

one

a very simple

um

very simple um command

but first we're gonna not create it as a

command we're gonna create as a script

in the same way that in in our for

example you can create a script and our

script a file that ends in dot r and you

can put whatever code you need you have

there and you can source it with a

function source and that code will will

be executed the same thing you can do

here so you can create i'm gonna use the

program theme to create a file

uh that is called hi

and in here i'm gonna type echo

dollar sign

sorry echo hi

but that's boring as we said before so

we are gonna add um

we're gonna evaluate user so that way

the you know when we invoke the program

or when we we source if you want the

program high

we would get a high our studio in this

case because the user that is running it

is our studio so i'm using veeam you

know if you need to learn more about vim

there is a

mention of it in two meetups before of

this same series

i'm going to move to the

commands mode with escape and then type

shift column

you can't see that because it's covered

by this but you know w saves the file

and

q quits so i effectively have modify the

file high you can inspect it with cats

and here it is what what the contents

are are so now we need to use the comma

the program bash to uh run that

that file that script file

that we just wrote so we when we do bash

high we get the answer that we want hi

our studio so this is again like in our

running

source with the name of a file that you

you have created and that's cool but you

know we want hi to just work by typing

high without saying you know bash right

so there's two things that we need to do

for that uh so if i run that i'm going

to get this message that inspired the

name or the title of this meet up which

is permission deny so

the file kind of exists there but we

can't execute it um we are going to

tackle that in a moment but before

i do that um there is one thing that

is best practice to specify so we're

going to enter the file again we want to

modify

the

the file

to say

that there to incorporate inside the

file itself which program

needs to run this script

so in r with the r and here it would be

bash uh so we're going to be a bit more

you know

again our life is not so easy and we

don't just say bash

we wish but we have to say something

more than that so the way you specify

that this is the declaration of the

program that runs the script

it's just a convention it starts with a

pound and a bang so it's called shebang

and now you know you would say bash you

wish but remember that bash is actually

a command

somewhere in the in the system so it's

better to specify the full path to that

command and if you remember from what we

did before it was us r

slash being slash bash so that's the

full path to the bash command in this

system which we find found out before

with the with a which which command

so i think that's all we need to do in

terms of editing this file so i'm going

to save and quit

but there is one more thing to still

solve the permission deny problem

and i'm not going to get super deep in

that i'm just going to say that the

reason is because this file is not

executable

how you because you don't have

permission yet

to execute the file that you yourself

created how do you inspect

permissions okay you do it with the

command ls but you have to add the minus

l flag and now we're going to say okay

let's inspect the permissions of of high

right so the place you would be looking

for is this first bit of the string that

you get

i'm not going to be super specific other

than saying okay r stands for read

w stands for right and there should be

an x somewhere for execute that there is

not

so permissions is a huge

topic and it could cover more than one

meet up so i'm not going to get there

all i need to tell you is that as a user

all you need to know in terms of

permissions is that if you want to

create a command and you want it to be

executable it has to have access

in a few places here so how do you do

that okay it's not so hard you know it

somehow makes some sense so you have to

change ch

the mode um i mean it would nice it

would be nicer to say that the command

was named change

permissions but it's not life is hard

it's called chmod change mode

and now you said you want to add

something the permission that you want

to add is this permission to x

secure

and what you want to execute the command

hi

so this thing does the trick so if i now

rerun ls minus l high you will see some

changes you see now that there is xs in

a few places

again permissions is a big topic so i'm

not going to explain why it appears in

more than one place

and also you see that there is a nice

little color here compared to um to the

one here so this now behaves differently

if i type hi it just gets the answer and

this is not only because i'm inside the

directory bin i can also change the

directory to say home and from here i

can i can say hi and it will respond the

same thing

there's a few takeaways i hear a hand up

but i'm gonna push through the takeaways

and then dedicate all the rest of the

time to

discussing your your questions or

comments

so takeaways

every system including your own laptop

can be a multi-user system if you define

it to be solved

users can act mostly under their home

directory and they are generally quite

restricted for example they can't

they can't execute programs that they

create unless they change the mode

as as the the next bullet point says so

to make a script a bash script

executable as a command you have to use

the the command chmod which change the

mode or change the permissions of the

file and then you add with plus and x

which means executable so you add

executable permissions and then you have

to name the you know which is the script

that you want to make executable and

finally and you know

for your commands to behave as as such

and be discovered by your system

they can't live just anywhere they have

to be located in some of the directories

that are listed by the environment viral

path so as a user the most sensible

place to place your commands could be

under your home okay in this case

actually i made a mistake here you

should have said home in this case are

studio then slash b

so you know the home of our studio is

homeward studio and then the you know

the user creates a new folder called bin

and there is where you put your commands

if you do that in most systems your

commands will be automatically

discovered and work as you expect

okay let's go to your faces here

and

uh

did i hear a hand maybe not maybe it was

my dream

anyway that gets us to the end of the

contents that i wanted to cover do we

have any comments here or questions

nope just yeah that's a lot to cover

one session like this exactly yeah but i

mean since we have the time and there's

only two of us i mean i think it makes

sense

at least contextually do the thing to to

mention why there are

three sets of

um rwx things

perfect yeah then given that we have the

time uh let's do that so at least we

know know

uh kind of what keywords you you know

you need to type if you want to learn

more about these things so we're talking

about permissions you're talking about

ch mode so i think i think if you start

you know googling those things uh you

will you know eventually get to the

information that you need the long story

made sure is the following so there is

three sets of um

permissions so if i do an ls so let's do

first we have to change directory to

beam and here if i do unless you know

there is this high command so let's do

an ls minus l

for high and and we see this string so

the way to understand this is divide

this bit the permissions bit in three

blocks each containing three characters

so the first block

has

rwx

that is the

the block that belongs to the owner of

the file in this case the person or the

user that created uh the file that owns

the file

is our studio and actually it is listed

here so and our studio can read can

write and can execute this file

but in a multi-user system you have more

than just our studio you potentially

have other users

and those users might also belong to

different groups and it is very

convenient to say okay you know if there

is 10 users maybe five of them belong to

the group of you know think of them as

teams right people that you know are in

one particular group or one particular

team may have privileges to do things

that other people in other teams and

other groups do not so that's why a

multi-user system has the notion of

group

which is the one that is described uh

which you know whose permissions i

described in the second block

of from in the provisions string so the

group in this case uh is also the group

r studio which is a default group so

every new user that is added to a system

automatically belongs to their to a

group that has their own name

so

this particular file that was created

here

we already discussed the permissions for

the the owner for our studio as an owner

and our studio as uh as a member of the

group our studio has permissions to read

this file

has permissions to execute this file but

not to write so cannot no like another

user not a studio because i mean the

privileges of it owner will overwrite

the permissions of the of the group but

another

user added to the group rstudio would

not be able to write this file meaning

that they couldn't for example

be able to change the command

right but they can read it they can see

the contents of the file or the file hi

and they can run it they can use the

command high

if the command height is in their path

and then finally the third component of

the permission string is basically

anywhere else so if say you know i am

logging into this system as mauro and as

a studio and say that i do not belong to

the art studio group

then i will be just another one

so called others so other users and then

the permissions that would apply to me

logged in as mauro could be in the ones

in the third component of the string

meaning that i would have you know the

right to read this file to see now what

it contains i'm going to have permission

to execute it and make it work but again

i wouldn't have permissions to

um to write this file i couldn't change

it right

and there is ways to change all of this

you know to make a file you know not

readable not executable not

writable

but that's beyond the meetup of today

some of that might touch we might touch

on some of that next time because we're

going to be talking about

working a multi-user system from the

perspective of a super user of a

privileged user of an administrator of

the system but for now um

you know we are looking at the movie

level system from the perspective of

a regular user so a regular user and to

wrap up today's meetup can for example

do a bunch of things

all of them within the scope of their

own home

and one of the things that they can do

is create commands

and to make them work as commands you

know they need to put them in a

directory such as you know home bin that

is discovered by the environment

variable path

um and one extra step that they need to

do is to change uh because by in by

default most files won't have execution

privileges

so you have to add them with the command

ch mode plus x and the name of the

command that you want to make executable

okay that was

basically a wrap up so let's go back to

your faces

cj do you have any other like thought of

you know what i might be missing from

the perspective of the users that we

need to communicate

um i think

eventually it gets interesting to

understand that a user can potentially

knowingly or unknowingly run a command

as a different user

this is like

ultimately a very important concept

because

yeah it comes into play if you're a user

with limited privileges and then you

want to install some software

that you want to be available and

you may install that but parts of it may

not be available because they need to

run with permissions of a super

administrator and there's also the

opportunity to install it as a super

administrator using the pseudo command

and so this is

i think

where things get really like

complicated

for someone that hasn't really

like used the

environment with that kind of um

mentality complexity yeah more mental

more yeah the next time i plan to work

with zulu

we're going to be using with the same

user studio but with the sudo

command

as a prefix so that you know basically

the r studio user

can act

for specific actions on behalf of

another user that has superpower that is

called root so our studio when you say

instead of saying our studio if you say

sudo r studio next time you will see

that

that

normal user becomes a super user

acts on behalf of the so-called root

user and they can do just about anything

and

so that's something i think of you know

getting into more detail and next time

is that what you're talking about or is

there any other way to act as another

user

well i mean there are also ways to like

log in

like

create like a subshell i guess as a

different user

um but yeah i think it's

yeah this is something that we unlike

our normal laptops like our if we're

using like windows or mac or like a

windows linux

windowed version we often like abstract

this

process when you're working in the

terminal you need to be more conscious

of it you need to be pay attention to

the prompts in the terminal so you see

which user you're using

and you have to have some awareness of

like when

when you might want to use

sudo because you know you often you can

install software but then it's only

located underneath of your home

directory and then

another user may not be able to use it

so

there's a lot of like it ends up causing

a lot of

questions about

what's the most appropriate way to um

install software or change permissions

of software or you you we're pointing

out in this there's user bin

um folder that's usually accessible to

everyone but then often users have a bin

folder underneath their own home

directory that's only accessible to them

so yeah yeah it creates quite a lot of

complications yeah so one that i would

like to keep that

recorded here um one big motivation for

me to talk about these things that might

seem like too complex is the following

even well into my work as a professional

software developer

i didn't know these things and i was

working for the smithsonian

in a system in the smithsonian

institution you know has a lot of i.t

control

and i was given a computer and i thought

okay you know it's gonna work just as

any other computer i had before but it

wasn't so basically a lot of programs

failed installed like docker for example

and i didn't know about the complexity

of multi-user systems i didn't know that

i was an unprivileged user so i as an

owner of my computer i did not have

permission to install for example docker

and many other programs because

the super users were the it department

so i had to request permission to them

so not knowing that caused me so many

struggles because i was trying to follow

tutorials about how to work with docker

and installing it and everyone's like

it's working for everyone it's not

working for me and i never saw thought

that the reason was that a computer that

i owned and that was the only user did

not have the privileges to for me to

install that software

so

this is not for you

in that type of environment can become

even more complicated

super administrator can also restrict

which

ports your

network cards can communicate on and

which you can proxy your internet

through uh through a

corporate server that you know redirects

certain ul's certain things so yeah it

can get really dicey when you're using a

system that's um

managed by an i.t department

this is relevant for for like at least

in the in the pocket team especially

with the banks who are working you know

they have to

either help a user use the software

inside of that type of environment or

even worse like program software that's

intended to be used in that situation

but not really knowing all the

the complexities of that that can really

cause a lot of confusion we've had lots

of problems with installing software

accessing

certain urls actually seeing

ip addresses and stuff like that going

through proxies and it can all be really

complicated yeah i mean i think that you

know it is really complicated to be able

to administer all those things and to

manage them

but

my motivation here is to at least make

you aware of that complexity so they're

not like me like bumping your head

against the wall not even knowing what's

going on had i known that it was beyond

my control i couldn't have wasted my

time i would just call it you know

so this is all i would like people to

take away is okay the system you know

this is as much as i can do within the

scope of my user environment my user

directories

um

and then this is these are things that

are beyond my scope i'm not i'm not

intending here to teach you how to

manage a multi-level system a multi-user

system but to know that the complexity

is there and then when you you need that

level of permissions then you just need

to talk to the right one person at two

degrees for example i'm staying at two

degrees and and that person might be me

might be like hey mauro i need i need to

install this software

in this remote server that you gave me

access to but i can't install it okay

then i can install it for you that's

that's not all i need to get away from

it also comes up i think even in in our

like windows and mac machines for

instance i have two users like a

personal account and a work account on

my

my laptop and

if i install so like arm is managing its

packages by default i think you know

like in a user level package

uh location

it can be told to put it in a in a

system-wide location if you have

appropriate permissions to do that but

so then i have had the case where like i

install a package i need in my personal

account and then i'm trying to like

update it or

change it or in my

in my work account then i'm getting all

these permission errors just installing

the package so sometimes even in the

most like yeah ordinary rudimentary kind

of tasks you need to do

on a multi-user system there there can

be

conflicts or

difficulties with that

well i think we need to wrap up because

we went beyond

the time by quite a lot thanks everyone

see you next time

oh good job
