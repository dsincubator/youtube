---
type: Video Transcript
title: "Docker: Managing images"
description: "On the series about working with docker and uh today we're gonna be talking about managing images and maybe a little bit of using and managing volumes as..."
resource: "https://www.youtube.com/watch?v=3_0gUMqKikw"
tags: ["ds-incubator", "docker", "containers", "workflow", "github-issues"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=3_0gUMqKikw"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2021-09-21T00:00:00Z"
    usage_count: 38
usage_window: { from: "2021-09-21T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

that is inquiry continues on the series

about working with docker and uh today

we're gonna be talking about managing

images and maybe a little bit of using

and managing volumes as end users and

with those two topics

you know i'm gonna be closing this

series and again this is kind of part

two of the series where we are getting

quite technical um in part one uh we

covered the most superficial uses of uh

images

and containers but we didn't go over for

example how do you actually get rid of

containers or you get rid of images so

today we're going to be talking about

how to manage images how to find images

how to find these annoying dangling

images

and

also how to remove one and multiple

images at once sometimes you

need to free space in your system and

you want to do a batch remove

also we're going to be exploring some of

the images that the rocker project

provides and identify a particular stack

of images that are quite useful in

reproducible research

and just as a demo to see how you could

use

one of those images and to get the

latest version of r the development

version of r and a specific version of r

which sometimes it is useful either to

kind of lock your analysis in a

particular state with particular

software or because you want to for

example explore if your analysis is

going to break with the upcoming version

of r

so let's jump

to

this other

page

this is also in the ds.docker

repository in the folder of the day

which starts with the number five and

says the name managing images

so what i want to show is

as usual a lot of stuff in the terminal

first i'm gonna um show the the basic

command that we're gonna be working a

lot in this

section um which is docker images so in

the same way that before we use docker

ps to list containers now we do docker

images to list all the images that i

have so let me do this a little bigger

so as you can see i have a bunch of

images and i already identify a couple

of weird things like those images at the

top that say known as a repository and

known as tag so that's usually

useless so i want to get rid of that

because it's taking up space also

knocker notice how for example some

images take quite a bit of space like

this one for example is taking 3.8

gigabytes

and and i may even have duplicates with

different tags so knowing how to clean

up is is very important

so i already show you with docker images

you can list all of the images that you

have

as usual if you need help you could type

help and learn a little bit of what

things you can do with the docker images

command

you can filter for images explicitly

and that's what i'm going to be using

in a moment to show you how to filter

dangling images but there is also an

implicit filtering which is

pretty cool so if you do docker images

and you identify that there is a a

repository like for example ubuntu that

you want to filter for you can just type

docker images ubuntu just the name of

the you know what appears in that column

repository and you already filter for

that let me clear this up and do that

again so it's kind of clear

what we do

so just having a look at this i already

see there is you know ubuntu 14.04

points uh 16 18 and latest so say that

uh i decide that 1404 is too old of an

image it's an old version and i want to

remove that then the command that we're

going to be using is the docker remove

image before we use the rm command when

we were deleting

containers but now we're working with

images so we add the eye docker remove

images if you want to get some help of

course you type minus minus help and and

there is

so uh

once again let's do adobe images ubuntu

to remember the one that i want to

remove so to specifically remove the one

which tag is 1404 then i do docker

remove image ubuntu

and let's do

1404

so that should get rid of that specific

image

as you can see there is a bunch of

layers that kind of got removed so if i

repeat the command ubuntu

docker images ubuntu i should you know

not see that image it's gone forever

now if i wanted to get rid of all of

this

remember that before we learned about

this

minus q

[Music]

minus q

parameter flag that you can use to get

not not the entire table that you see it

stands for quiet so what you see is only

the sha so basically this column here

that says image id and that is useful

because once you have the sha then you

can you can pass that as an argument to

iterations of the command docker remove

image and the way i like to do that is

just by piping that so i press the up

arrow and then i type

you know xrx is the command in in the

shell that allows you to

basically pass each of those um

strings of text that we have to the left

all those ids it automatically passes

them all the way to the right to the

right of this command so i'm doing now a

docker remove image for each of those

ids one by one

so i i run that and it gets rid of a lot

of stuff i see that something was not

removed

it says that because some

child images are um are using it so

let's go

[Music]

back to the ubuntu to see what did we

succeed to remove so we succeeded to

remove uh everything except this one

here i'm not very sure

which image depends on it so i'm going

to try a docker remove image ubuntu

latest to see

if i success i successfully remove it

if i remove it individually so this also

kind of shows that the process might be

a little bit interactive and not always

um

you know

i'm now guessing that the image that

this one was depending on is one of the

ones that i were also removed but before

they were actually removed so once they

were removed then i could remove this

one that's my guess

maybe alex has some thoughts about that

um

so i'm gonna make a little pause here um

we learned how to list images how to

filter them

actually no let me show you also the

dangling image issue um and then and

then we do a little pause for um on the

fly questions

so again docker images will give me now

the list of images except the wounded

ones that are gone because we just

removed them but there is this non-thing

that we see there those are images that

are taking up space and they're not

useful

i learned that they are

created in many ways the one way that i

can articulate here the one i know maybe

other people here know more ways is when

you create an image and you tag it in a

particular way say ubuntu 1404

and then you change

the the source file that creates that

image and then you reveal the image with

exact same tag

apparently when that happens the second

one kind of wins and gets the tag and

the other ones get untacked but they're

still kind of hanging in there

i guess that you could re-tag them and

rename them but i never did that i just

remove them how you remove them well you

remove them using the remember that i

mentioned that the docker images

help file

oops

help it has that a filter command that

you already use when you when we were

filtering for

um

four containers right so we're going to

be using that um and okay the issue is

that you need to know which

things you can filter for

for that

you would go to

uh

here

of course to the docker documentation

i put a link there and in particular

addresses the problem of dangling issues

but you can see

you know in the filtering section all

the valid filters that you can you can

use the one we are going to be using now

is you know specifically the dangling

images

because that is a pretty common problem

at least for us at two degrees it has

been and quite annoying

so let me just leave that here on record

so docker images

with the filter command

you know for sure you can also use just

one hyphen and f and then you can say

dangling equals true so that is

not super intuitive you just need to

read the documentation to learn that one

so when you

when you run that you get just you know

those two images

and then uh you know i could do what we

did before first i want to get just the

id so i can remove them uh so with the

minus q again or quiet i think it is

right quiet let's try that yeah i get

just the ids and now i like to press it

the up arrow and pipe that intoxarix

that will you know do what i'm about to

type for each of those

strings of text so what i want to do is

docker remove image

so with that those images seem to have

been deleted so if i now re-run dockland

docker

images and search and filter for

dangling images as you have known and

the docker images in general is now

looking a little bit cleaner

um

okay this is a good time to make a

little

house

before we

touch the last two topics that i'm

aiming for today

let's see your faces and see if there is

any comment

any question or comment from what we've

seen today

you know

uh i think cj had had was the one that

you know had the most experience with

dangling images uh right cj he was

pretty annoying

questions um so

in my experience

when you turn off an image like if you

start an image so something that

happened to me recently is i wanted to

make a new image that was based on an

image that i

had existing in my in my docker

environment

but i wanted to make a minor change to

it and then actually save that as an

additional one like a test a new test

docker image that i could then run

with just making a few minor

modifications to file and so

it was pretty interesting that i could

like spin up a new instance of that

image go in there change some files

specifically was not using this rm

option so that the changes would stay

there

and then when i came out

then i was able to like merge those

changes into the existing docker image

and name it something else so i had a

new um image that had just the changes

but what was weird about that for me was

once i extended the instance i kind of i

thought that the instrument was kind of

automatically turning itself off but it

kind of sticks around for a bit of time

and i guess that's why you can end up

with these like dangling images or

something so what's not super clear to

me is

what does it mean when you exit instance

and you think it's gone away but it's

still kind of there and you couldn't

even merge it with another instance you

could maybe even turn it back on and

start off where you were last and what

is the proper way to like just turn it

off completely and say i don't want this

thing anymore i'm done with it

and how is that interrelated with these

like dangling things that you're talking

about

yeah in terms of best practices i'm

hoping that alex would have some

comments the

my feeling is that uh i mean containers

not sure if it really answers your

question but i think it's a good

opportunity to

almost kind of wrap up what we've been

learning like the

the containers are usually

like considered like throw away

you may you know run them to experiment

things you can create images out of

running containers but that's not the

best idea generally you want to

re

create

uh

them through images that you actually

type the source code in in an image

docker file

and that's

that's just about as much as i i could

add here alex do you have any any

thoughts

yeah i'll second that thought that

the entire

design philosophy behind docker is

one to make

uh execution environments that are

disposable

uh and two

reproducible

uh so this idea of

creating an image out of

a container that you have manually gone

in and done stuff to

is sort of antithetical to that second

uh part of the design philosophy

uh so

in general finding support for that

uh in stack overflow or any of the other

documentation sources

is going to be pretty sparse at best and

discouraged

it is possible but it is tricky

um

that

said

uh if you

do

somehow do that and you get this

dangling image that is just

there

um

the

thing that you will often find is docker

really doesn't like it

in fact it won't permit it at all

uh if you have to

get rid of an image if there is still a

container associated with it

and if you create the image from the

container then that image is still

associated with the container

that you created it from it's the

you have set up that

linkage but in the opposite direction of

normal because normally what you have is

you have your docker file you build the

docker file you get the image you take

the image you start it that becomes a

container

um and then in order to get rid of all

of those things you get rid of the

containers first then you get rid of the

image then that should be it

um

does that answer your question cj

um

i mean i don't i don't think i was

really expecting a

to fully wrap my head around it but i

was just prompting like what i thought

would be an interesting conversation

around that topic

yeah so yeah i mean it adds it adds some

flavor to it for sure

i think uh

cj or

maro if you can go back to the terminal

uh i want to introduce a

different set of commands for managing

images

uh that sort of comes at the problem in

the opposite direction of what maro was

showing us earlier

so

uh maro can you run

uh

docker images

so what we

saw from mauro earlier was

i see my list of images and then i want

to get rid of specific ones and i can do

that either using the

uh x args or i can do it use the filter

and those are i'm effectively taking a

specific image id and then getting rid

of it

um

the opposite direction of that is what

if i just really want to just clear off

as much as possible

um

so

the command for that is uh prune

so

the two related commands uh would be

docker image prune and docker container

prune

and so

uh

i think it's image singular if i recall

correctly

um

but what this does is basically

docker image groom will go through and

get rid of any image that does not have

a container associated with it

and docker container prune

uh will go through and

get rid of any container that is

not running

so if you have

no running containers and then you run

those two commands in sequence you will

get rid of

everything

uh yeah definitely hit no on that one

for right now

um

so

tomorrow if yeah uh can you just run

docker containers

to just like see the list

or docker container ls that's the one

oh you don't have any open containers so

if morrow were to run docker

image prune right now

all of the images would be gone

because none of them have any containers

associated with them

the the container versus image dichotomy

is one of the trickier things to wrap

your heads around in docker

uh but it is something that is pretty

essential when

managing

how much resources you're throwing at

the different things

that's cool and one thought i have is

that uh you know i experienced that in

programming in general that sometimes

and i do remember the early days of

programming it was so frustrating

because everything was

full of friction and and i just embraced

it and said well i mean i guess

programming is hard

and i didn't know better but but then

when i did know better i realized that

it was a workflow issue but sometimes

you know it takes some

experience with the problem and you

polish your workflow to to a point where

you do

you know you still may face some

friction but is occasional

and i see that a lot of the time you

know a lot of people with uh that has

spent a lot less time um in one

particular technology

going around problems in a way that um

that just exposes that they still need

to work in the workflow and hopefully

this conversation opens uh another

conversation about okay let what our

workflows

do we even need to uh to to change them

as opposed to kind of

brute force approach to fight every time

the same problem i think i heard a hands

up somewhere or a comment yeah jackson

we see your face we don't hear you

what yes

i know good now yes we hear you oh okay

hey

um

just just wanted to quickly comment on

what you were talking about with

workflows it's also it can be super

frustrating sometimes for myself i

notice a lot of the time where i know

that i'm not using the right workflow

and i can't find documentation online

that teaches me what the right workflow

is

that it drives me nuts where i'm like i

know i'm not doing this right i know

there's a better way to deal with this

and i don't know what it is and like i

don't know how to figure it out

so i just wanted to in case other people

have been down to that rabbit hole it's

really frustrating yeah i mean i'm

getting very excited about you know for

example this kind of um

of little project right like teaching

this thing because i learn it but also

because i expose my gaps of knowledge to

alex for example who has more experience

so you know sometimes the best way to

learn the the workflow that works

is to work with someone who has tried

them all and and they figure it out you

know because they are also easier they

find it easier to curate

the overwhelming amount of information

that you find out there about how should

i do this and then

it's very hard to judge you know which

is the best way uh right and someone who

has tried it well as far as we know

today the best way is this one and once

you try it actually it does work

i remember when i first started

programming and was just dealing with

with package management in python and it

was driving me nuts and there were like

just so many different

different approaches to doing it and i

was a total novice i wasn't even

understanding like what the different

approaches meant or why one would be

better than the other or that they were

even different approaches like i didn't

even recognize that they were actually

different ways of doing

of doing the same thing basically and it

was like yeah the point that i didn't

realize that i was like holy crap i

wasted so much time

i'm trying to understand this

hi thanks go ahead

um

yeah maro i am hoping that we can take a

a quick detour uh

to also

put one more little

uh

nuance into cj's question yeah

absolutely can you

do docker run alpine latest

so alpine is just a minimal linux

distribution i'm having them run this

because it is small and quick to run

so docker images

alpine it's there docker container ls

uh

unable to find pulling yeah let's

do that

cool so we have uh and maro can you open

up a new terminal

and do

uh yeah docker container ls

we can see alpine is running

and uh

it's been up for 15 seconds now so the

when i was describing the docker design

philosophy the two components were

reproducible and disposable

disposable sometimes means uh the best

way to get rid of something is just nuke

it from orbit it's the only way to be

sure

um so let's get rid of this in the most

forceful way possible

which would be

uh docker container or docker

rmi alpine

and this is going to fail for us

uh because it's saying

this container is using its referenced

image okay then we can do docker uh

container remove for docker container rm

uh and then the hash is

2ee9

okay well or i can do

practical

remove right away look at remove

practical

interesting the fact that can you hear

my voice

yeah

the fact that um

[Music]

that what i do docker remove

with a little bit of the name it doesn't

pre-populate suggests that it's not

gonna work but let's try that so

talker container remove and the hash

three one

three zero

you cannot remove ryan conte okay

and this one failed because it's not

uh

you can't remove a running container

so

what we can do now is

let's try

docker rmi alpine latest

uh

force

uh dash dash force

and now let's take a look at our

containers

okay that is still running a docker

image

and we can see that the alpine image is

gone but we still have that container

floating around

[Music]

so now we can do docker

[Music]

by the way alex is the the containerless

is the same as ps or is like suitably

different

uh

docker

so docker ps shows you

actively running containers

uh docker container ls shows you all

containers that have not been removed

so if you do

a

docker container stop practical gates

so as we can see even

people who are

practiced in the use of docker still get

error messages

uh cannot stop

unknown error after kill runs you did

not terminate i've seen that uh before

uh

yeah that's weird

sorry i had to type passwords uh

i don't know what i'm doing but it

worked before so i'm hoping that it's

gonna work now um some

weird problem with armor something there

you go now it's

it's working as you expect

so sometimes you do run into stuff that

just does not want to stop and you just

have to like

the the ultimate expression of what i

have had to do in order to kill a

container was to literally

stop docker entirely or completely

reboot my computer

and then

docker doesn't automatically start all

the containers again after you reboot

your computer

and so then you can kill it

all right if um

if that you know wraps what the approach

you wanted to show to removing images

kind of

the other in the other direction uh then

probably let's open the floor for you

know one last round of questions and

comments and call it a session because

we are at a half hour

we're good okay what we did not cover is

uh a quick overview of the

images

page of the rocker project to just show

many options that you may want to use at

some point in your in your work with

this with a like trying to advertise the

stack that is called version stack which

you might want to use to freeze a system

including the you know the system

dependencies are and our packages so

when you have something working and you

want to share it as is

and lock it there you know that's

probably the stack you want to use so i

may show that quickly next meet up

and then the other thing i want to show

is that basically with that stack you

can also use the tag

devel which gives you are in development

or are as it is being produced today so

maybe last night for example

and sometimes that's useful particularly

if you develop packages and you get

emails from a crowd and saying hey your

package is going to break with

the version of r that is upcoming so

please change this or that so you want

to reproduce the problem and the way is

precisely to get that

r version which hasn't been even

released

alex

uh yeah i know we're over time just real

quickly um

i think we've

reached a critical mass of people that

want to do like a half day

workshop on how to actually create your

own images and include your own code

as part of docker so

uh

you know not just using the images and

managing the images that other people

are creating but to make your own

uh so for a half day

afternoonish european time workshop uh

do we prefer wednesdays or fridays

because those seem to both be days with

relatively few meetings

can we vote

on slack because also my computer is

about to die i thought it was black and

it is but it's not

charged so i made it may drop

cool

is that okay i may do a poll with you

alex great

i will

set up a poll in the coding channel

thank you very much
