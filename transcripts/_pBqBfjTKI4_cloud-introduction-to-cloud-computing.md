---
type: Video Transcript
title: "cloud: Introduction to cloud computing"
description: "so welcome everyone again to the ds  incubator today we start a new series  about cloud computing  can you hear a motorbike in the  background  um so the goal o"
resource: "https://www.youtube.com/watch?v=_pBqBfjTKI4"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=_pBqBfjTKI4"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

so welcome everyone again to the ds

incubator today we start a new series

about cloud computing

can you hear a motorbike in the

background

um so the goal of this series is to help

you get started with cloud computing

at the end of the series we'll be able

to do things like this understand what

it is and what the benefit benefits

might bring to an organization

researchers to developers to interns

also to create

a server i'm going to explain what that

is with the tools that you need to run

our studio a version of video scholars

to your server on the cloud

to scale up and down your computing

resources as you need them

to access shared data on the cloud and

to run long processes unattended we may

do a few more things but you know these

are the few things that i could come up

with at this stage

so this uh ds equator is dedicated to

pretty much anyone who might benefit

from cloud computing maybe you don't

still know if that's you

but that certainly includes an

organization like two degrees

researchers like ourselves developers

like some of us and inters

students for example too

so this is important because cloud

computing is gaining popularity but not

many of us use it um including myself

only recently i you know started using

it and i think that the reason is

because we don't know it well enough we

don't understand what it is and what we

can do with it

so focusing on today's meetup

today we're going to be

trying to cover quite a bit of ground

it's an introduction to cloud computing

and if you are here

at 2 degrees you may already have heard

a lot of what i i'm going to be talking

today basically this is like a version

of a hangout that we had before uh just

a little bit more complete but you know

sorry if you find this a little

repetitive

so the objectives of today is to you

know the most generally to understand

what it is and what benefits it might

bring we're gonna create a server so a

server basically is a computer we call

it a server because it is a computer

that

we connect to from our computer so in

that case we are there there's two

computers involved the computer that we

hold in our hands that we call the

client

and the other computer that we call the

server so the server the other computer

provides a service or serve something to

our local computer that's why you know

the name is kind of confusing maybe but

think of a server just like a computer

and to make things even more confusing

um different platforms different cloud

providers

name their servers a different way so

i'm going to be showing digital ocean as

one of the options that you have for

cloud computing

and in digital ocean they call servers

a droplet that's the name that they gave

to it

we are going to also explore the

internals of the server that we create

from the console and the last meetup

series was about working from the

terminal so i hope that that will get

you ready to understand the very few

commands i'm going to be using today to

explore the server

and then we are going to do something a

little bit more close to our daily

experience which is to spin to run an r

studio an instance of r

on that server computer so that's all

that i'm trying to cover today

as usual the

the series is hosted at one repository

so the repository is two degrees

investing slash ds.cloud and each meetup

usually

is

um

has a folder with a file in it that

guides the meetup itself so i'm going to

move this to the right and cover your

faces and i'm gonna do

uh

what do we want to do here actually

first let's start here again so

the

first

let's let's talk a check i can still

have your faces here because i have room

for that so first let's let's describe

what cloud computing is so cloud

computing is the delivery of computing

resources as a service

that means that

the resources that we're going to be

using we do not own them we just rent

them they're owned and managed by the

cloud provider

that is kind of cool because sometimes

it's boring to manage a computing

resource it's better someone else to

manage it like manage it we mean maybe

they need to install some software maybe

you know the thing is not working well

and they need to fix it so that's

something that we do not need to do

we rent the service and they figure it

out so that it's always you know what we

expect as

clients of the service

there is a bunch of different resources

that you might rent from a cloud

provider

it could be a bunch of things like

including

a web-based application like for example

a shiny app

it could be data storage and dropbox for

example is something like that so

dropbox uses

um the cloud right to store data and we

we you know get access to it so we are

using the cloud if you if you are using

dropbox

also a more vanilla type of of services

like we can rent just a computer just a

server a server that comes with very few

things that we can then customize and

that's gonna be mostly the focus of this

meet up and and the series in general

and we're going to be working with

digital ocean which is one server

provider and you know digital ocean as i

said before calls their servers a

droplet so we are going to use a droplet

that's going to be running our studio

server today

what are the benefits well that kind of

depends on which perspective you take um

a bunch of players can benefit from

cloud computing including an

organization as a whole you know as an

organization we can save money by not

buying super expensive computers but

instead just buying the computers that

we need for day-to-day tasks and instead

renting powerful computers only when we

need them

so if we do that then we do not need to

worry about for example computers

getting old or breaking or losing value

as you know time passes

as researchers we can access the

computing resources that we need when we

need them we don't have to wait

for you know hr processes to you know to

approve the computers that we want to

buy we don't have to wait for shipping

you know the computers to arrive

and all those things and for some

organizations even installing software

is a pain uh but you know with cloud

computing it's very easy to easy and

safe to install software in the servers

that we rent

as developers

it's very easy to get you know the

specific tools that you need for the job

at hand

and we love developers love to have

special tools for some tasks and uh it's

great to be able to rent

um

a computer that already comes with the

tools that we want as opposed to us

having to set them up because some of

them are not so easy to set up so i like

a word that alex used recently to

describe this this type of computers so

the cloud providers usually have

different templates that fit different

general purposes

and you can get a lot closer to what you

need by getting access to this you know

to this

pseudo customized templates and then you

tweak them the way you want

and this final player that i could think

of is a student or an intern and they

can benefit by basically getting very

quick access to a functional computing

environment that has everything that

they need already installed and

including the data for example that we

use privately within an organization so

you can think of private data for two

degrees we may put it in a server that

all our members all the you know two

degrees

people have access to so the data is

already there you don't have to download

it you don't have to install anything

so now let's get to something a little

bit more entertaining let's do a demo

and if you are not watching this live

hopefully you will land on this link and

if you click that link that will give

you a tour an interactive tour

through digitalocean that shows most of

what i'm going to be showing

today so

the demo now starts now so let's click

on a new um

web browser tab here and let's type

digital ocean

so if you don't have an account you can

sign up for one i do have one so i'm

going to just click login

uh the pro the cloud provider that you

choose is totally up to you there is

google there is

azure there is

amazon uh so i chose this one i tried a

few and i kind of liked this one and i

think when you

create an account for the first time

you're asked to create at least one

project and

so i

prepared this project called demo for

today

um usually the projects are uh basically

a page where you can see all the

resources that you have

this one is empty you know for this demo

you know we start from scratch and the

very first thing you would do so let me

make this a little bigger for you to see

better

that you could do is pay attention to

that big green button in the middle that

says create so what we are about to do

is to create a little computer that

lives on the cloud we are going to call

that computer a server

but

digitalocean calls it more specifically

a droplet so it's the very first item

here because it is also the most popular

product that they offer most people use

that all the time so that's what we're

gonna click

uh

respond respond

there you go

so now we're gonna have a bunch of

options uh if you're trying digitalocean

for the first time and you want to just

play

i say you could you know scroll down all

the way and just click create

but i'm gonna tweak things just a little

bit to show you some of the flexibility

that this has and also as an opportunity

to explain

all the different things that you could

do with your droplet

so the very first thing we do is to this

to to say okay which operative system we

want you know in your case you may have

a computer with mac installed with

windows installed or linux install

um

some of the linux distributions are this

are listed here and linux comes in

different flavors ubuntu is a very

popular one that's why it's first listed

here so if you click that it's you're

very good to go

also if you joined the last meetup

series the one with the terminal you

even if you didn't know you were using

ubuntu a lot and you may be already a

little familiar with what it looks like

and what the terminal looks like for an

ubuntu computer it is also here where

you can choose even more customized

things so this is very vanilla that you

know if we click on ubuntu

that would give us a very kind of boring

computer with nothing in it but

i say i would like to have docker

because docker is a tool that then

allows me

to try different kinds of software

without altering the host computer so

this ubuntu system could have

docker which is a program that allows me

to create mini computers inside this

server computer so i know that you know

the levels of inception of which i'm

talking about here are you know can blow

your mind but basically we are now

creating a computer that is not our

computer it's a computer on the cloud

and in that one i would like to run a

software that creates little computers

inside that one right so it's many

layers of abstraction and many layers of

inception so that's what i want i'm

going to kind of explain why later on

when i show what we can do with it so

i'm going to click here on marketplace

marketplace is a place where

you can find

different flavors of

templates as alex put it very nicely

so these are for example options that i

have and i want this one here basically

it is the same ubuntu system that i

could have clicked before but on top of

that already i have installed docker yes

i could create the droplet empty and

then install docker myself but this

particular droplet if you look into the

details is maintained by digital ocean

itself meaning that they know what

they're doing you know they are you know

sure that they installed it following

the guidelines that docker provides so

i'm going to click that just to make

sure that

the the docker that lives in there is

very well installed and that's all i

need to do i'm going to scroll down and

show you the options that you have for

how powerful now your computer you know

will be

you uh so far you just decided with

operative system it has and one

program that will be running in it which

is docker but we haven't yet chosen you

know how powerful our computer will be

and depending on what choices we make we

will be paying more or less for the

resources that we rent

so i think that for the purposes of this

demo and also for many real uses

the very basic one just does the job uh

so i'm gonna just keep it basic and the

cheapest computer i can rent five

dollars a month is very fair

keep drawing keep you know scrolling

down i'm not gonna change anything here

basically you can choose to add more

storage if you want

the computer that you're renting already

has some storage in this case 25

gigabytes it's not a lot you know it's

very easy to fill and you may need more

space um but not for now this is just a

demo

also you choose a region that is close

to where you you know you actually are

physically located um and then you keep

scrolling down to decide

how you want to

um

tell

the system who you are

you can choose to authenticate with a

password or you can choose to

authenticate with a more secure

system that is called sh keys

i am going to choose that one i already

have one ssh key if you don't have one

you can click here on new ssh key

you can follow instructions here to

create one

also our studio has a really easy way to

create one and the book happy git with r

if you type ssh keys

will have instructions for you to do it

on our studio basically you generate a

string of text that you paste here and

then you are good to go

i'm going to close this because i

already did this i'm going to keep

scrolling down down down down

[Music]

you could you know name your droplet

something meaningful to you like docker

demo whatever i'm gonna just leave it as

is the ugliness of the name will remind

me that i need to delete it at the end

and then you just create the droplet

when i click here and this is gonna take

a little while maybe a couple of minutes

um you see this bar going to the right

so i'm going to go back to your faces

make a clarification and ask for

questions so the clarification i want to

make is this

um this series is going

to show you

processes

like the one that i'm doing like setting

up for example the server that is very

much not everyone's fit you know that's

the kind of thing that i enjoy doing as

a developer as someone that wants to

provide tools to someone else

so that they can do their job but that

may not be you and still you may be a

great user of the cloud you know you may

want me to create a server for you with

the tools that you want and i'm very

happy to do it and then you just use it

so at this stage this could seem like

too intimidating in terms of all the

setup that you need and all the things

that you need to know to understand

what's going on but i would say just

breathe and take it easy because later

you will see that as a vanilla user of

the system is very easy all you need to

know is a username and a password and

you will be accessing

a running instance of our studio on the

cloud you are going to be a user of the

cloud but you don't need to know all the

things that you know i'm showing here

but intentionally i'm including this in

this meetup because i i know that some

of us

are interested in these technical

details so that you are empowered to

basically run a cloud system yourself if

you want to manage it

let's see how the process is doing

actually it is completed but still it's

a good time to ask if there is any

questions so far

yes alex

um yeah i just want to quickly note like

earlier you went over some of the

advantages of doing stuff on the cloud

um i just want to note some of the

concerns oh great

and the two big ones are um

the old adage is like the cloud is just

someone else's computer

right which is one of the big advantages

you have all of these nice properties

like

you don't have to worry about doesn't

have good connectivity or like doesn't

have the right specifications because

you're literally just renting someone

else's computer

um

but keep in mind that it is

someone else's computer so like

if you have any like particularly

sensitive data that you're working with

like

ask yourself like

do i trust this system

and most cloud providers like

doing security is their bread and butter

but like

ultimately it is you that is on the hook

if there is a data leak not them right

um

so that that is just a thing to keep in

mind is

don't do stuff on the cloud that you

wouldn't do on someone else's computer

um the other one is like maro is showing

us how to start up a computer

on the cloud and how to create cloud

resources

um i'm hoping that there is time yet

today so i'm going to be quiet here um

to show us how to turn off cloud

resources

um almost every cloud provider bills by

the hour

um

but i also remember years ago when i did

my first experiments in the cloud

and i forgot to turn off this little

like something similar a little five

dollar a month machine

um

but i forgot to turn it off for two

years

and i had 120 dollar bill because of it

so

like

especially if you're working with

higher power machines like it is

easy to rack up a bill if you forget to

turn it off after you're done so

those are my concerns things to keep in

mind

thank you yeah that's a really cool

comments to keep to keep in mind

yes let's see if i can show actually the

little turn on and off button right away

um

so so far what we achieved is remember

that when i showed this project in under

resources it was at empty space and now

we don't have an empty space we have the

name of the little computer that we

created at least in you know the

characteristics if we hover over it and

so we are you know good to go with that

thing i can click on it to get some more

details

and as you can see at the top it says on

so the computer is on so if you click

here you know you would turn it off

basically

yeah shut it down and then stop the

the

the charges

the next thing we want to do so the

computer for now is doing nothing really

so we want to explore it so let's have a

quick look at that computer by clicking

here on the console

and yes you you know if you are at this

end of

working with a cloud like someone like

me managing the service

yes you will need some um skills with

the terminal so i'm going to click here

in the console thing

and and basically

navigate this computer very quickly

using some of the most basic commands to

explore a computer on from the terminal

and then i'm going to show you how you

can access the same console from your

own console not not the one that we so

basically we access this console first

going to digitalocean and logging in in

that service and then clicking that link

but you can also connect to your droplet

or to your server

from your local terminal without

actually going

to digitaloceans

website

so we have we are already here running

our um

server

before i start typing anything i want to

highlight one piece of this welcome

message that is pretty useful

it is the one that tells us how we can

actually connect without going to the

website it says that you can ssh to this

droplet in a terminal as root

doing the following ssh root which is

the name of the user that we would be

using to connect at and this weird

number this is a lot of jargon it's

packed of jargon basically ssh is one

program that will allow us to

connect securely

to that droplet um

using that key that we generated when we

were creating the droplet so the key is

something that we have and only we have

it's private or you shouldn't share with

other people

but because we have it in our computer

then that ssh command

uses it to access the service on the

cloud and this weird number where does

it come from okay let's go back to the

website

so

every computer on the cloud has an

address

like a virtual

space in the internet where you can find

that resource and that address comes

from here so the very first thing to the

left is that thing called ipv4 that

number that is the address that is

stable is the address that your resource

will always have as long as it leaves so

i'm going to copy that thing

and i'm going to use it to follow the

instructions that i saw on the message

so i'm going to open a terminal this is

a normal terminal in my computer

i'm going to type what i've read in that

description which is ssh

root which is the name of the user

with which i'm going to log in into that

service and then add the address that i

got from digitalocean so i'm going to

paste that there and hit enter

and now because it's the first time that

my ssh key is being used to connect to

this droplet i have to say yes here to

save that ssh key um as a known key

and now you can see that the message

that i get is the same message that i

got when i connected to my droplet from

the

website right so the rest of the

information is not important but it's

not for now so i'm gonna do a ctrl l to

clear things up and i'm just going to

play a little bit with this server to

explore what we have here so the first

thing i want to do is to see who

um i and i expect to get roots because i

logged in as a user root that makes

sense i could do a print working

directory pwd i'm going to make this a

little bigger and i expect to be at the

home directory because this tilde here

suggests that

i could do an ls to see what i have in

the home directory it's just a folder i

could do an ls minus a to explore the

hidden files and directories i could do

an ls at the root of the system to see

what other folders there are and if you

have been using ubuntu you know what you

see now on the screen is basically what

any other ubuntu system looks like so

you know so far um so good but that's

not all remember that we

created this computer with docker so the

first thing i'm gonna do now is to

confirm that i do have docker installed

so i'm gonna do docker

and i'm going to type run

and i'm going to run an image that is

well

used i commonly use to test that docker

is working well and it is an image

called hello

world

so that is an image that docker will

search for

in my system and if it doesn't find it

it will go to a place called docker hub

i will pull it from there and then run

that

image that little an image is like a

template for a little computer it run

that computer and it printed this

message hello from docker uh this you

know basically this confirms that my

installation of docker is working you

know correctly which i expected because

um

i used a droplet that was configured by

digitalocean and i'm hoping that they

did a good job there

more interestingly and you know about

finish we would run something more

useful

that allows us to use for example our

studio so where that

let me show you instructions to do that

so i'm going to be using

one

provider of docker images that is a

rocker the rocker project they are

very awesome and they have a bunch of

very useful

little computers

that allow you to do you know things

like you know run in our studio so in

their home page they already have this

uh

string of text which is the instructions

to run

uh

basically rstudio on the server

and that's exactly what we're gonna copy

and paste here just to prove that

you know our system is working fine

and it can run our studio so the goal is

that in a few moments when this is

complete

we are going to be able to

work with our studio in a very very

similar way in which we work with our

studio locally

there are a few things that we will kind

of learn in other meetups because we

don't have time today that we may need

to you know learn to

to use that different type of our studio

like for example getting in and out data

from that instance of our studio is not

probably as straightforward as

it is in your computer but it's not also

hard to to learn

so in the meantime let me go back to

this screen so how we connect to that r

studio well we don't need to have our

studio installed in our computer so you

can have a computer that has no r and

nor studio and still use rstudio

through this cloud server that we

created um

and the way you do it is going to an

address on your web browser

so if this was your local machine you

would be using uh

a nickname for that address that i

showed you before it's called localhost

in this case but this is not the case so

we are not working from our local

machine so instead we need the address

that we get from here

so we copy that address

and we go to that address

and then we type column and always 8787

so that is basically following the

instructions that we see in the rocker

project but tweaking this very first bit

to change localhost for the actual

address of the server on the cloud so

let me confirm if the computer is

already running it is so the process

that i asked that docker container to do

is already

running so that means that i hope that

if i go to that address that i type here

i should be able to log in to our studio

and here we are so this is starting now

this could be your experience if you are

not interested in managing a cloud

service but only in using a cloud

service so you would ask someone like me

to create that service for you and then

you would come here and type a username

in this case our studio and a password

in this in this case the one that

our project set up which is

your password very not safe

so we could give you a better password

for for a real use case so we click sign

in i'm not going to save this password

because obviously

i'm not interested in this

beyond the demo

and what is about to happen

is that we see our studio almost

identical to the one that you experience

in your local machine

all right that's all we

have time for today but we may have

over time but we still have

it's important to have some time for

questions or comments if you have them

all right thanks alex for your comments

before uh yes some uh downsides have to

be considered um here uh today to wrap

up we learned what the cloud is what

benefits it might bring alex helped me

remind of some downsides of it and we

quickly created a server on the cloud a

server is just a computer that connects

to our computer so we get some kind of

service

and one of the services that um i was

interested in in getting was access to

our studio from the web browser so what

i did is instead of choosing a vanilla

server i chose one that already comes

pre-installed with a tool called docker

that allows me to create little

computers inside that server and by

doing so then i use a docker image a

little computer that is pre-made by a

project called rocker

that gives me our studio from the web

browser yes i could have used a vanilla

and droplet a vanilla server on the

digital ocean and install

a docker server myself but i didn't want

to spend that time and effort and

instead i just used docker image to do

that

all right that's all for now so thanks

very much for hanging in next time we're

going to be talking more about computing

on the cloud

ciao
