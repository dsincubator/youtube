---
type: Video Transcript
title: "Docker: Getting started with the Rocker project"
description: "today the ds incubator starts a new  series and it is about working with  docker mostly for reproducible research  and  basically to to develop  software and to"
resource: "https://www.youtube.com/watch?v=qY5ForDjgGY"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=qY5ForDjgGY"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

today the ds incubator starts a new

series and it is about working with

docker mostly for reproducible research

and

basically to to develop

software and to

use software analyze

data

with software but not so much the focus

is not going to be on how you can build

docker images yourself

that is a whole thing on itself

it is going to be the focus on using

images that some other people have used

have a build already

and

basically the big wins so how we can use

that tool

to enhance what we do

every day so my um

[Music]

idea was mostly to cover

some of the very useful images that a

project called rocker provides which is

a word smashed between docker and r so

docker images for r

and

and also i understand that i'm

relatively new to docker i read a couple

of books and i've been trying it for a

few times but it's not i'm not as

experienced with docker as i am with

other tools

so luckily we have alex here in the

series who is gonna be my support it's

gonna be you know um

prompting discussions he's gonna be

correcting me when i say something wrong

or extending my my teachings when they

are insufficient

and

might also be leading some meetups

so that is a very very

rough general introduction

today i wanted to introduce you to the

rocker project in particular so i'm

going to do just that and also to do a

little brief uh explanation of you know

how the series is work

so let's start there so every series has

a repository on the two degrees

investing organization if you are new to

this series then you know this comment

might be relevant to you so they all

start with ds for da's incubator which

stands for data science

but then they have a dot and the you

know

topic name so we are now covering docker

so is ds.docker the repository that you

want to look for

and there you have the most useful

information there is basically the

readme file that gives you a little bit

of a an explanation what the

series is going to be about an syllabus

this time i added um a bunch of things

that i think you should be able to do

after we finish this series um so i'm

going to be checking boxes as we

we move on we cover um you know the

things that i think you can you can do

with this years for example you should

be able to

er to use a unix terminal even if you're

in windows and you know windows is not a

unix system and still you could access a

unix terminal

with docker uh you could also also use

docker for a bunch of other things

including for example using rstudio from

the web browser even if you don't have

our studio installed in your computer or

even our installing your computer so

there's a bunch of things that really

relate to what we do day to day and

docker can make that work easier and

more reproducible

so

today i'm going to be talking about uh

how to get started with the rocker

project so let's go to the website of

the rocket project and see what it is

that we can do with it the focus of

today is going to be to rack to run

just r in a docker container

so this should work only if you have

installed docker already and i should

clarify that this meetup is not going to

be teaching you about how to install it

uh

because you know it is sometimes you

know you

you can lose a lot of waste a lot of

time just trying to figure out things

are very specific to one person's

computer and the reasons why you know

that computer might or might not you

know be able to install something so i'm

sorry to kind of leave you alone there

but if you do need to uh some support

for installing docker then the space

could be most likely uh almost

appropriately would be a help desk so

i'm very happy to uh me and maybe others

in this in this room uh to help each

other install docker um and if you

haven't done it yet i encourage you to

do it so you try the things that i'm

showing here uh but if you haven't it

it's not a problem i'm not expecting you

to kind of follow you know my live demo

so by the way i think as always i should

i forgot to share my screen right yes

thank you

so it's recorded in the

in the video so

yeah what i was showing is not much so

i'm showing now you see my screen right

yes great right so yeah i was looking i

was showing the

the repository uh that is going

going is hosting now the syllabus and if

you know we write some code it's to

leave there that's where you can find it

and you know scrolling down in that repo

you will find the readme with an

explanation of what the series is about

and the syllabus which is a draft is

very flexible and we're going to adapt

it as we go

based on the interest that i see you

have in specific topics so here is why i

was what i was explaining that you know

you should be able to do including for

example using our studio from the web

browser and

getting started is the topic of today

so we're going to be focusing on the

rocker project which is this page here

rocker project or

and and the very first page has two

the two lines that i want to show today

so for this you have to have docker

install and here is a link to install it

so if you click there you will have the

instructions that you need to get dogger

for your system

if it's a mac if it's a window of

windows or if it's a linux system so

that is something you do on your own and

if you need help please do use the help

desks

these two lines are the ones i want to

cover let's start for the first one so

the first line uh if you have already in

docker installed what we'll do we'll

start r

but in docker so let's do just that i'm

gonna jump to a terminal so in your um

computer

you know find a way to launch a terminal

r studio actually provides a terminal as

well but i'm using just the vanilla

terminal that comes with the system that

i have which is an ubuntu system so i'm

going to just paste that line there that

comes from the rocker project

and run it that's

i'm not gonna explain it just now i'm

gonna explain it a bit later

so

that line as you can see

um

started r in my computer um and you can

see that it is for example 4.1.1

[Music]

uh that's the version of r that it is

running and uh again i can do whatever i

can do with our like some you know one

[Music]

and two and get three

so this is our uh it is very exciting

but it doesn't seem very exciting

because it is the experience that you

have all the time so how is this

different from your experience with r

well this is not running in your

computer so this should work even if you

do not have r in your computer so you

are new to 3 degrees you need to run r

you didn't even have time to install r

okay you can do

this you can install just docker and

then use

this mini computer that

is triggered by these commands here that

i'm gonna show in a moment but before i

explain those uh let me show you

something that is even closer to our

experience which is the idea of using r

but not from a terminal but instead from

um

our studio so how uh docker can

uh

how can i use docker to run our studio

well uh here is uh what all that you

need to do and i'm going to explain this

in a moment for now i'm going to just

copy those lines and paste them in the

tutorial so if you have

docker installed this should work for

you

if it doesn't again you know we can talk

about that in the help desk or maybe in

discussions at the end

so i'm going to run those lines

um and

let's see i already have

an error here error response and demo

drive february string connectivity and

point blah blah blah blah blah blah blah

blah blah blah blah

okay it looks like i have i'm already

using um

the

basically when i run this command

a a specific address in my web browser

is going to be available for me to use

rstudio so it looks like i it looks like

i already run that command already so

what i'm going to do is going to point

my browser to that address which is this

one here localhost8787

and where does that information come

from well it is explained here in the

rocker project

so with a little bit of patience um you

know you should be able to figure it out

but my role here is going to be exactly

to kind of break down all the things

that the rocker project is saying in

this documentation

and you're gonna understand it for now

it's not my goal to explain them but

but you will understand them soon

um

so i pointed the browser to that address

that i saw there localhost 8787 it was

auto completed or expanded to this

longer url and here is where i'm going

to log into our studio but before i do

that i hear that there is a hand raise

so let's see if there is something

burning that

you want to ask alex go ahead

oh uh nothing that can't hold on for

later

okay so then let me at least start the

session so that you know people get

super excited about

staring at r studio which they do all

the time

and be a little sarcastic here so let's

do uh so okay so how do i log in here in

the rocker project there is instructions

it is telling me that i should um use

the user and password

the user is going to be our studio

and the password is going to be your

password the password was set in this

command here as you might suspect if you

are looking at the command

strongly enough so let's try that let's

try

you know here i open our studio

different to your daily experience here

i'm logging in

to our studio i suppose with just our

studio opening it

there's a there's a way to kind of avoid

this but uh let's do not talk about that

just now uh and then your password is

what i'm supposed to uh add there so i'm

gonna paste that and sign in

and there it is so that is our studio

again it might not look very exciting

because you are used to this experience

in your computer but the difference here

is that this is not your computer the

idea is that you can use our studio

completely from the web browser so you

are new to two degrees you only have

installed say chrome in your computer

and nothing else

well the next thing you could do is

install docker and then you can get this

um

you know run that command that i show

you on the terminal and get access to

our studio

without even installing our or studio in

your computer so here is that that is

kind of the magic right

so that was only a motivating example

without explaining what those commands

are and just to show you how relatively

quickly you can get a whole

data science computing environment ready

to go

without the usual pain that entails

installing all those tools yourself so

if instead of running this on docker i

was i was running this on my computer i

have to install r i have to install uh

rstudio myself

and that takes generally you know

minutes or hours uh sometimes

so well with that i hope i have

demonstrated the

you know how

um

basically what the kind of thing that

we're gonna be talking about here and

the kinds of things that we're going to

be learning about basically we're going

to be trying to break down these

commands to to learn what they are so

that you can combine them differently to

create new things and to use docker in

new ways

so with that i'm going to pause here

and alex please go ahead

um yeah i guess

my big thought is

it's very easy

for people to not really understand

[Music]

why or when to use docker versus like

well i've already got r and r studio

installed on my computer they were the

first things that i put on there right

um so what what is the purpose of

bundling up something into a doctor

image rather than just doing it the way

i've always done it

right

and ultimately it's a i i think maro hit

the nail on the head with this of think

of this as

a new computer right

um except it is a computer that you can

send to someone right so

imagine i set up my analysis and i've

got my doctor image all set up to run

some analysis let's call it packed up

right

um cool

so then instead of sending instructions

on how to

uh set up your computer to run facta and

trusting you to

uh make sure that you set that up

correctly and then supporting you if

like you miscopy a

instruction or you know only copy the

the first line of like something that

should be three lines we've all done

that i do that way too often

um instead

imagine

morrow just like taking that computer

that he has set up

putting it into a fedex envelope and

sending it to you

except he can send it to

all of you and you all get that computer

that is specially set up to run pacta

and you know that it works right so it

becomes very valuable when you want to

start sharing your analysis with other

people

um

which leads to the

when do we use docker um like where in

the workflow should we start worrying

about

does this need to be doctorized

does it not right uh yeah korea like

treating this as the

ultimate form of a reproducible example

because it's not just i am sending you

the data for the reproducible example

it's i am sending you

the data and like a good

rep rex will have both a data file that

works and all of the system info

the docker image contains not just the

system info in r but like also all of

the different things that live outside

of r that get called by our behind the

scenes

um

so

when to use docker i find it really

useful of

once i am starting to move from the

exploratory to the building phase

right

um

so

a

much

keeping in mind with that like an empty

docker image is a brand new computer

um it doesn't have all of your packages

installed by default it doesn't have a

lot of useful things that you are going

to need

um so if you're just wanting to like run

around quickly try a whole bunch of

different things in rapid succession and

see what works what doesn't

doing that in a docker container

probably going to be uh you're going to

run into a lot of walls there

but once you start to get into that next

phase of

okay i think i've got an idea of how

this is supposed to work i've got things

sketched out i have a rough idea of like

where i want to go with this

that is when i

my next step is always okay i'm going to

put this into a doctor container and get

it all set up in there

so that as i move forward i keep a

uh the record of

what is actually necessary to run this

analysis

uh and so that i can start sharing it

with collaborators and know that like

they don't have to worry about

installing all the packages they just

pull down the docker image and it works

for them or

they at least get the consistent same

not working that i do so they can help

me debug it

um

so again it's

once you have an idea of where you need

to go what the analysis should look like

you've got all of the steps in place and

can start running it as a script rather

than poking individual commands on the

command line that's where docker really

starts to shine

thanks a lot antoine i see you

well not sure if you were raising your

hand it is a good time to you know ask

questions and make comments right now

the only thing i would like to cover for

the rest of the meet up that is more

like lecture type is uh breaking down

from the two commands i showed today

breaking down the first one and giving

you pointers about okay so if you have

something like that if you have an

example you find in the wild

where do you go

to learn what those commands mean so

that you can teach yourself at the pace

at which you need it so based on you

know real life examples okay i have this

thing

i can run it but i don't even know what

it is where i learn what it is so i'm

going to show that but but before i jump

to that um

i think you know alex said really nicely

the the context the why uh

you know you might want to use docker so

this is a good opportunity to

clarify or to ask questions so please go

ahead if you have them

daisy please go ahead

yes just one quick question so

i'm guessing that if i'm sharing

a docker image with someone to try to

reproduce an error for example that i'm

getting the other person also needs to

have

docker

or not

it should alright

and and

and the other person will need to

use it as like just in the same way that

i'm doing it so not in

his or her our

computer is like our

yeah install in their computer but in

their website as as we did exactly as we

did

right so

extending that whole like fedexing a

laptop to someone

it's the

analog is like you and that other person

sit down at the same computer

right and you're both looking at the

same screen almost

or

more accurately it would be like you sit

down at the computer type in your

commands find some weird behavior

and then you like scribble some notes on

a post-it and stick it to the screen and

wait for that other person to use it

right

there they're going to get the same

behavior

but it um it doesn't necessarily have to

be at the same time but you know that

the same computer is going to give you

the same behavior both times

but anyway this is strictly necessary

that the other person has docker

installs

yeah so installing docker is a one-time

thing once it's installed you're good to

go there's occasional updates that

mostly you don't need to worry about do

they work do they not it's a very stable

product

um

the only real issue i run into with

having docker installed versus not

installed

is it really likes to take up a lot of

space on my hard drive so

for me my computer here has 128 gig hard

drive

and docker takes up half of that

okay um but if you have a computer where

you've got 60 or 70 gigs available on

the hard drive you probably won't even

notice it

all right

go thanks

perfect

okay um any other question or comment

right now

i'm gonna start showing my screen again

um

what i wanted to share now is

um a little page to break down

what we've

the first command that i showed uh and

hopefully

give you an heuristic about how you can

go about teaching yourself docker when

you see

a command

[Music]

so the command i run first is this one

here

i'm gonna run it

in a new terminal to show you what it

was so

this command here is the one that came

from the rocker project so all i did is

i just opened the terminal and pasted it

and that you know

started another session so what does

that do

uh and what it all means

so first let me clean this console with

ctrl l um i'm gonna put my console here

on the right and this other page here on

the left

so

uh

everything that we do with docker will

start with docker and later alex is

going to be covering another tool that

is a custom of docker it's called docker

compose but still starts with docker

so the word docker is gonna be in the

beginning of all these commands and and

the one thing that you do generally when

you want to learn about a specific tool

in this case docker is to ask for help

so one way you can help yourself is just

type

um docker dash help

and can you see my terminal here on the

on your on your screens

yes yeah cool so here is you know a

bunch of things that you can do with

docker including for example run so what

does the command run do it runs a

command in a new container

so that is the first line of help that

you can use

go

to your terminal type docker and then

minus minus help or you can focus on a

specific sub command in this case run so

if i want to help run uh you can i can

do something like this docker run help

and then it should be giving me

a filtered manual specifically for a

docker run so here is the usage

and we are going to be trying to

understand what that means

but

the very

best place i suggest to learn is

the what's called the reference so for

every command in docker there is a

reference page that explains

in a way that is a bit nicer than your

terminal what that command is with

examples and with pros

it's not very easy to digest the first

time you read it so it may take some

time to

to understand so that's why i wanted to

kind of break it all down so for example

if i see

the command docker run and i want to

learn about it i can go as i show you

before to the terminal but better i

could go to the

page

of docker run so as you can see there is

a page

uh

for docker run

uh reference right so for every command

there is a reference page uh if you

google it you will eventually land there

and it has this this general form that i

show you on the page let's see what that

uh

means

so

as you can see here there are some um

words here in the general form that do

not have are not you know embraced by

brackets and others that are the ones

that are embraced by brackets are

optional and the ones that are not are

obligatory so that if i want to do

anything with docker run it is

obligatory to use the words docker and

run

right

and also the word image is outside

bracket so it's also

something that i have to to put there

but that image is it's not going to be

typed directly it's going to be typed so

you're going to replace that by the

image that you want to use so we're

going to be talking about what an image

is uh in a moment so uh docker run

that's uh

what maps to here in the general form

and the image part of it is this one

here right so we are using an image a

mini computer that is was built by these

people that developed the rocker project

that's why it started with roger slash

and they didn't build just one image

they build a bunch of images so

specifically we are using an image that

just creates you know this you know a

starts r for me

and it has you know it could do a few

other things but by default that image

will do what i just showed you which is

start another session

so

so far we understand these

three commands docker run and this kind

of placeholder for image which in this

case is rocker slash rbase and then the

minus minus remove and minus ti

those are commands that again you can

find in the documentation so again you

go to the

documentation of

run so docker run the reference page and

you can see for example that the minus

minus remove so it's something that you

can even filter for you can do ctrl f

and do minus minus rm and see where that

shows up so it shows up here in the

cleaning up section and for example what

it does is it creates this mini computer

and when you're done it will delete that

computer so you are creating ephemeral

computers

of course you wouldn't do that with your

laptop it's not that you run run r1 time

and then you throw it away that could be

very expensive but with docker it's not

it's free so you create these computers

and you destroy them afterwards if you

want so how you tell docker i want to

get rid of the computers

thank you thank you she's wrapping up

very soon

how you tell locker to throw away that

computer when you're done so that it

doesn't take up space as alex suggested

well with the minus minus rm flag

and finally uh the other command that i

want to mention is this ti

uh but only for um just another example

of how you can you know look things up

in the documentation so in in short that

command what it does is gives you uh an

um a terminal that is interactive so i

can interact with r from the console you

might wonder well what's the other

option well the other option is

non-interactive non-interactive because

there are some commands that run on a

background and they don't give the user

the ability to to do something from the

terminal for example the image that i

showed you that was running our studio

in the terminal that terminal was kind

of useless uh it was just showing locks

but as a user i didn't interact with

that terminal i was interacting with

the web browser

um

okay so that is

all i wanted to cover today and all that

we have time for

so i will go back to your prefaces over

here see if there is any burning

question or comment before i say goodbye

okay this might have been

a lot for the first day again i invite

you to the help desks if you need to

install docker or if you want just to

play with docker a little bit more and

otherwise i say thank you and i see you

next week with more content about docker

thanks mario toto
