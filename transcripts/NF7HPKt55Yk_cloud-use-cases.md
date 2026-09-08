---
type: Video Transcript
title: "cloud: Use cases"
description: "Meetup of the series about cloud computing i'm gonna move fast here to the meetup of the day which is starting with a number of use cases the..."
resource: "https://www.youtube.com/watch?v=NF7HPKt55Yk"
tags: ["ds-incubator", "terminal", "cloud", "r-packages", "docker"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=NF7HPKt55Yk"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2022-06-07T00:00:00Z"
    usage_count: 25
usage_window: { from: "2022-06-07T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

hello

[Music]

welcome everyone to the ds incubator

this is the second meetup of the series

about cloud computing i'm gonna move

fast here to the meetup of the day which

is starting with a number of use cases

for cloud computing

the very one the very first one is going

to be relatively shorten the idea that

you might be using the cloud because you

want to basically scale up or down your

computing resources depending on your

demand

the second use case

it is the idea of accessing as quickly

as possible

and our environment has a bunch of

things that you may want to have

installing yourself in your system and

without kind of messing up with other

configurations other packages for

example that you have for other projects

and the third one if we have time

hopefully we will it's the idea of

running long running processes

unattended so that you can go on with

your life while your computer does the

heavy lifting for you

so let's go up here to the folder that

hosts the meetup of the day number two

use cases

there are more use cases in this

document but i'm gonna stop whenever we

can run out of time

so let's start talking first about you

know

the idea of why you might want to um

you know scale up or down your computing

resources the first use case so

every use case i try to kind of think in

terms of a user story so if i if i was

an analyst then i think i would like to

have a powerful computer as cheaply as

possible and whenever i need it but that

also means that not all the time i need

it meaning that i can only say rent a

computer for the very short time that i

need to actually run an analysis and

maybe i can have a cheaper computer by

the time i develop the analysis so i can

write code in a pretty cheap computer

and then run that code in a more

expensive one

so the ultimate source to maybe learn

how to resize

servers on digitalocean for example

which is one of the many cloud providers

it's probably this link that will give

you

also like some tips about

things that you should know before you

resize your droplets

to be honest for this demo i'm not i'm

probably going to violate some of their

recommendations so what i'm going to do

is very simply i'm going to go to that

digital ocean

login here because i already have an

account not sure if i told you that when

you log into digital ocean you get

hundred dollars credit that you can use

over

two months

and and you know i have signed up like a

month ago and i still used up only like

30 so you know it's you know it takes

you a long way

so i'm going to navigate here to the

demo project which is the one that i

dedicated to this meetup series and here

there is a little um droplet as it is

called in digital ocean which is no more

and no less that a little computer

that is called a server because it

provides a service to another computer

which is the one that i'm holding in my

hands so the one that i'm holding on my

hands we can refer to that as the host

computer and the one here on digital

ocean will be the server of my computer

things get a little bit more complicated

even when we talk about docker which is

what i mean i'm going to be using today

and most of the series but let's not get

too um too deep into like definitions of

things let's just try things out so the

idea is that here you know this url is

just a link to a computer that i can

manage in

multiple ways so if i click here on the

dot dot dot i see all the ways i can

manage this little computer including

resize the droplet

so this is you know what you would do

um

basic based on your demand and here i

mentioned this last time but i didn't

spend time resizing things so let's do

that now

you may choose computers based on what

is your intent so you may need you know

more ram or maybe more disk space so

different kind of presets come here i'm

right now using a pretty basic one but

you may want to kind of get a computer

that is optimized for memory for example

and you can see how they get a little

more expensive like for example a

computer with 16 gigs of ram

um

you know it's just going for like 80 a

month

so let's see what we have now i'm going

to go back to basic um

i'm here at the ten dollars

thingy and for example okay i don't need

right now a lot of resources so i'm

gonna scale down in this case i'm gonna

choose a computer that has half the

amount of ram memory i have now two

gigabytes and i'm gonna go down to one

gigabyte uh and i'm gonna be spending

about half as well from from ten dollars

a month i will be going down to five

dollars a month

and the fraction of the hour is 0.007

right that's that's how much you spend

by hour but if you scroll down you will

see that the resize button the one to

activate what i'm doing is great because

i need to first turn off the droplet i

here have a bunch of

you know warnings and things

so this turned off thing is also what we

mentioned last time and thankfully alex

reminded me of discussing turning off

your resources so if you're not using

your computer and you're not turning it

off you may be spending money that you

don't need to so you know it's good a

good idea to probably turn that off

because otherwise your credit card will

be charged

so now that it's off i can scroll down

and i see the resize button

in blue so i can click on it

if i scroll up again you will see there

is this progress bar going slowly to the

what i was saying going to the right

and so while that happens it's going to

take about a minute

i'm going to

maybe tidy things up close that here and

also go back to the

to the content of today's lessons

because you know that's all you need to

do so the droplet is now going to be

resized and then i just need to turn it

on again and i will be then using a more

a less actually powerful computer

because in this particular case i scaled

it down and the same process of course

applies for scaling up so that's it so

you know you can use the cloud to you

know access computers of different kinds

of different powers of different you

know properties and and it takes only a

few clicks to do so so let's talk about

the second

use case at least highlight it and maybe

see how things are going here

uh we're getting to the end so let's

complete that first use case by now

clicking uh okay droplet has been

resized thank you

and now click on

so i'm i'm ready to go i have i'm now

using this

the least pretty powerful computer that

i can use um on digital ocean

okay well these things we can start the

the second use case so the second use

case is the idea of like accessing very

quickly a complete and isolated our

environment so the user story that would

fit here would be something like this

as an analyst in a new project i would

like to have all the software that i

need particularly in that project

without messing up with software that i

have in other analysis so if you are

using your local computer for every

single analysis every time you start a

new project and you start new stuff

there is some risk that you will you

will be breaking some

projects of the past not because the

code changed but because they computed

an environment where that code runs

changed

so that's an idea that you need to kind

of keep in mind so that isolation there

is a number of ways to active you know

use that that property and the cloud is

one of them and what i'm going to be

doing now is something i showed the last

time the last meet up so you're if

you're a little lost you can go back to

one meetup ago to the introduction to

cloud computing so basically i am about

to connect to this this little computer

that you know i have now active here you

can connect to it in two ways at least

you can click the console button here

and that will give you

access to the terminal and again if you

need to know more about the terminal

there is also a ds equator

series that ended right before this one

started so you may want to review that

one

so what i'm going to do now is i'm going

to use a program in the terminal called

ssh which allows me to connect

with

a special key called ssh

to for example different services like

this digital ocean

[Music]

droplets that i have i have here

i i need to tell it who is the user that

is going to connect and the root user is

the most powerful computer the most

powerful user and so that's the one i'm

going to be using

and then i have to say at what address

i need to find the computing resource

because i'm going to be running this

command from my own terminal in my local

computer so this number where does it

come from comes from here so when you go

to your digital ocean

droplet you hover over the first

address here this weird number is

something you can copy

and that is exactly what you would paste

on your terminal so let me open the

terminal this is in my own computer so

i'm going to type ssh as i said before

it's the program that will help me

connect to that droplet then the name of

the user roots and then adds i'm going

to pay paste the address that i got from

there

so that will

uh

allow me to connect from my local

terminal to the server basically so that

now my computer is the hosts and the

remote computer is the server of my

computer so let me clear this up this

little window is actually on the way so

i'm not moving here so let me clear this

up with ctrl l

again if you need to learn more things

about the terminal i'm not going to stop

now to explain them you can review the

previous meetup

so yes this sounds this is already a

connection to this to the

to the service you can see that the name

of the computer here on the

on the terminal that you read on the

screen matches the name here so that's

that's kind of confirming that you know

we are on the right from the right place

so uh okay that that that's great

but that droplet that computer that is

serving as a service is kind of boring

so what we're gonna do is

i'm probably the point of the whole use

case here is to point you to this one

url so what we're gonna do is

skim through multiple options of what

kinds of computers we might want to use

for for example an imaginary analysis

and and the rocker project is is

probably the best place for our users so

because they build little computers

called logger images or templates for

computers called images that you can use

to run your uh your analysis and they

come in

with different

software installed

this is what's called a stack so all

these

links here are different kinds of

computers with incrementally more uh

software so are ver for example is the

more basic computer that you can use

then rstudio has everything that harvard

has plus our studio install and then the

thai diverse image has everything that

our studio has plus the titles and so on

and so forth so let's try for example

the image

this one our studio

and the way i'm gonna access it is just

simply going to the home page of rocker

of the rogue project and copying this um

this

basically the demo of how you can access

it so i'm gonna go back to my terminal

clear it up so you can see things a

little bit more clearly

there you go and now paste what i got

from there that's that's what i'm doing

here

and now the instructions also tell me

what i need to do um

with a little tweak though um what i

need to do is remember that weird

address that we got from from here that

one here so that's where you need to go

basically so you go to that address and

then column 8787 so that that comes from

um from the call here this one here

right i'm not going to explain much

about that there is a whole series

dedicated to docker that you can review

if you want uh so let's let's run that

and that puts me here on the

login page

so i the user is our studio and the

password is the one uh so everything

comes from here so the password is is

this one here right and the user

is explaining the instructions of the

rugged project so

here are the instructions i also

reproduce them in the document of the

meetup today so this particular password

is your

password

yeah that should lock me in

this is no different really from what we

did last time so it's a little bit of a

review and we're gonna move uh quickly

here this is just to show you that okay

we are there uh it looks like our studio

but saying that you know like a normal

analysis for us at two degrees for

example good very useful very commonly

used the tie divers right so if you do

library

uh time reverse

what i want to demonstrate now is that

this computer as i used it as becomes

the one that rocker project built and

that is called

our studio

it doesn't come with it universe so it's

kind of annoying also doesn't come with

our markdown show you that are marked

down which is a tool that we also use a

lot to create for example reports and

share it with other stakeholders so

although in this particular case

installing the televisions and markdown

would not be hard

this

use case demonstrates that sometimes

you don't have what you need and

sometimes it is really hard like the the

the actual case that motivated this one

use case was when i was you know working

with linda in a project that needed

geospatial packages and i tried it for a

couple of hours to install packages and

the dependencies were not only at the r

level but also at the system level and i

was struggling strongly struggling and i

thought no this this has to be easier

there has to be a way to do this quickly

and finally of course i landed here in

the rocker project and i just used this

geospatial image and like in no time i

was already into another environment i

had all the packages that i had been

struggling for hours to install

so i'm not going to use geospatial for

for this demo i would like to show a

more

commonly used uh image which is ferrous

this is the image i would recommend to

any analyst at two degrees for example

because it comes with armatown it comes

with the tidewaters it has everything

that all the other images at the top

have so that is probably the biggest

takeaway of this use case so i'm going

to turn off

this

like log out of that

instance of our studio

and then what i'm going to do here is

i'm going to press ctrl c

which

ends any process running on a terminal

i'm going to clear this out with ctrl l

i'm going to press the up arrow to

recover the last command and now instead

of rocker r studio i'm going to type our

roker verse so that's all the only

change i'm going to do and that would

behave in the same way the password is

still the same so now in this window i

need to log in as our studio again the

same password your password but

magically this is not the same computer

that i had before this is a completely

different computer provided by the

rocker project

using the image kroger verse and now if

i do library tiny verse it should work

because you know they report

they document that they this image does

come with the televerse and there it is

and the same thing for armada

so if for any like real use of um

of an analysis you know i would

recommend this image over the ones that

are more basic so that's it let's this

turn

this let's go out look out of this

instance of our studio and go back to

the notes

and now we are ready to jump to uh the

third use case

i'm very close to

uh to the end uh it is the idea of

running long running uh processes

unattended so you're gonna go on with

your life

so before i do that actually it is

usually the time when i stop for

questions so let's see how we're going

and decide if we have time to cover this

third use case or not so let's go back

to your faces here

any question or comment here too

to this point

no okay let's go back then to the third

use case we hope we have time to cover

it this is probably a bit more

interesting because what i showed just

now is something that i showed in the

previous meetup so not very novel and

but this one use case is so

let me present the user's story is if i

was an analyst i would like to have

a way to run a long analysis unattended

so that i can turn off my laptop and do

something else while the process runs

so we're gonna be using again docker as

you can see i really like the images

from vloggerverse

they come with most of what they need

including package development

packages like tech tools for example uh

you will recognize a lot of things in

this in this call but some things have

changed like for example the password i

just chose one two three and it's you

know

yeah it isn't safe i'm not gonna be

anything real here so i'm gonna just

show you this and then destroy that

container so nothing at risk here

also i'm gonna give a name to the

container so that i know what the name

is i can refer to it more quickly also

i'm going to use the minus d flag which

detaches the output that you saw on the

screen when i run the other two

containers it was kind of pretty long

and my terminal was unavailable to do

other things

so within detached mode minus t

i will have immediately the ability to

keep typing commands on that terminal if

you're interested in what's here and

curious then you can go back to the

series about docker and as usual

actually investing slash ds dot in that

case is dot docker

and you can see a whole series dedicated

to docker um so let's let's do that

let's create this um container here

so let's cancel this ctrl c

that will finish any process that was

running before and i'm gonna paste that

in the terminal sometimes you paste with

shift insert that's what i'm doing right

now as you can see there is only one

output here which is the basically the

unique identifier of the container that

is running i can do

a docker ps to show that there is

something running in there and it's

called

the name of it is called my job so

that's the name of the container and it

all makes sense you know it's using the

the image that i you know i wanted to

use and so on and so forth and there is

no output here i can still get that

output with um

with um docker logs if you want with the

name of the container that you want and

then you will get that output but still

the terminal is interactive so i can use

it for for something else let me clear

this up so now we log in as usual we go

just to the login page and slider studio

but this time the password is one two

three remember

um and

voila

so as as this logs in let me present the

the use case in more detail so what i'm

about to do is i'm going to create a

project in our studio project so that i

can inside that project then create a

file

and our script

inside the folder r and that will

contain some code that will run for

quite a long time

and so let's do just that um so what i'm

you know the the art studio project is

uh not created yet you can create an

article project with if you know from

the gui from the graphical user

interface that

that rstudio provides i'm do you going

to use

the package use this create underscore

project and the name of the project that

will actually create the project and

also open it that also demonstrates that

the image broker

first comes already with use this which

is part of the devtools

meta package

and here we are we have an our folder

but has no files in it so what i'm going

to do is i'm going to

uh oh sorry for making you dc

i'm going to create another file um you

can create another file as you would

normally do clicking here and then give

it a name but instead i'm going to use

use this and there is a function called

use underscore r that creates a file

inside r precisely and inside that um

that empty file i'm going to paste that

long running

script this is of course a demo it's not

gonna do

anything useful i'm gonna explain this

in a moment but uh but it still

demonstrates the the main thing the main

point is that something that runs for a

long time and you you want to go on with

your life while this runs so what does

this do let's let's clear this up i

don't need it so this saves a file every

five seconds basically and so we have

this vector of you know 100 numbers so

for a sequence along these hundred

numbers so basically the numbers from

one to a hundred uh the i elements let

me show you this so let's just you know

the first time you know it runs is going

to be one so let me make this bigger for

you and so that means that you know with

i equals one text will become the

literal string one and file will become

the um

the string1.txt

so with that i have everything i need to

write a file in in this

project

because i have a text

a string of text the data is using one

and i have a file so i can use now the

function write lines to actually write

that file so if i go to the root of my

project here in abc you can see the text

right there if i click on it you can see

its contents as you expected it is the

number one so let's you know close that

thank you faria

lovely thank you

linda thank you lina

i think i'm gonna actually finish by

then that's cool um

so okay so this presents the code that

will run for a long time of course you

can source it and just wait if you have

time

but you know process can be them really

long they can take many hours they can

take many days so this is happening and

every five seconds you will see a new

file there but um but it's pretty brutal

i mean my computer has to be on and you

know sometimes i want to you know do

something else and i don't want my you

know anyone to get into my computer and

mess up with it so that that doesn't cut

it really um even if you know if you

restart your session of course the

process will also end so we need to do

something better than that

and there is a very simple way uh so you

can click here in under the source menu

there is a couple of options and one is

to source as a logo job so that will do

is well you have this little interface

i'm not going to mess up with this a lot

there is some details in the link that

i'm going to share at the end and but

basically what i'm going to change now

is the working directory that it

automatically set to where the file was

found but that's that's wrong for what i

want i think you know in this case say

that i want the root directory of this

project to be the working directory so i

choose that

so that's all you know what i want i

don't need any object to be moved to my

global environment when the project when

the script ends and the output is

actually the files that are saved so i'm

going to just hit start

so now you see that the project the the

script is running you see this this

progress bar and you will see also some

files here being added to

um to the list in a moment and but also

the console is live right so i can keep

doing things here uh i can keep using

this

parent our session like one plus one

give me two and so on and so forth but

more interestingly because this is not

your local computer this is the cloud

you can also close this window or turn

off your computer or do whatever you

want and the process will be will be

there so how do we know okay let's have

a quick look um

so

here we are in the terminal that allows

us to inspect what's happening in the

cloud so um

one thing we may want to do first is to

see what docker containers are running

with docker ps you can do that and fair

enough you know here is our our

container my job and still running has

been up for six minutes now okay so

great so how can we now look inside the

container and see if those files are

still being added to the queue

or to the to the root of the project so

there is a command in docker to inspect

or to execute any command inside

a docker container so that that is

called docker exec so exec will execute

anything in

a container so you have to give the name

of the container my job and then

anything that you type here for example

ls will be executed not on the server

but inside the container that is running

on the server right um it's like one

level inside the inception of of this

collection of

of this mamushka of little computers

that we are running so let me make this

a little bigger so now we have

everything that we need so um i did an

ls

more interesting and then just looking

at the root of the container would be to

inspect the home directory so here we

are

we see that the output prints are studio

so our studio is remember is the user of

that computer so let's have a look

inside the home

of our studio and there you can find now

the project abc which is the one that we

created

so if we inspect into it we can see all

the files are being added there so this

output is okay but we can do better than

that so let me clear this up

and use the up arrow to recover the last

command i'm going to type minus t which

is a flag to a list that allows me to

sort these things by

time

so you can see that now the file is 31.

and if i'm kind of crazy about the

terminal i can pipe that into head to

only see the last top you know the head

of of that list so 533

534 so this confirms that the process is

indeed running and that we have learned

how to

run a long running process unattended

even if our computer is shut down we can

shut down our local computer but the

server will still be on

alright that's all i wanted to cover and

i heard i think

a hand i believe in any case let's go

back to your faces

and see if you have any questions or

comments

also i'm going to put here the notes

because at the end i have a few links

that

basically explain more about working

with our studio projects and what

properties

you can expect depending on what kind of

our studio you're running if you're

running our studio on the desktop if

you're running our studio server free or

studio server pro

and this explains all of that

any comment or question here

all right then we

will leave it at that next time i'm

gonna be talking about how to host shiny

apps on digitalocean and i will

if we have time present other use cases

so thanks very much for joining see you

next time
