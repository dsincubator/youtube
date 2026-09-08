---
type: Video Transcript
title: "Continuously build and deploy a shiny app on Google Cloud Run"
description: "R which you know as we saw before is going to uh so remember the the P 880 is"
resource: "https://www.youtube.com/watch?v=PRKOMCCOlI0"
tags: ["ds-incubator", "shiny", "cloud", "google-cloud", "cloud-run"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=PRKOMCCOlI0"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2024-07-05T00:00:00Z"
    usage_count: 688
usage_window: { from: "2024-07-05T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

[Music]

was in casaria Aron the version 2024 and

one of the last presentations was by

Jacqueline noes uh she showed a really

cool service that I would like to talk

about that is Google Cloud run uh it was

the first time I heard about it and she

mentioned that it was um pretty cool how

it it scales on demand and shuts down if

you're not using it and uh even when

it's running is it's very cheap to run

so overall it looked like a very

promising uh tool for the kinds of

things that sometimes I do like right

now I need to host the shiny out that

might have um you know some some load to

handle and it's great these service that

you know can scale up and down as

necessary and try to kind of save it as

much money as possible so uh um jacan

shared a repo that hosts a super basic

shiny app that you know is containerized

and if your app lives in a GitHub

repository and is contain

then it's super easy to deploy on on uh

on that service on Google Cloud run um I

have another app uh that I would like to

deploy there just to um to try things

out uh the focus now is going to be

mostly to show how to set up Google

Google Cloud round so that um as a as a

continuous integration system where

whenever you push something to your repo

to your app then this service builds it

and serves it um and and can handle

demand so

um I prefer to well for for apps that on

um on in production and pretty much any

app that I build I I like to um

structure them as art packages so um

what I'm going to be showing in a minute

it comes from from this this book by hle

Wickam the mastering shiny book there

are other books also that cover you know

how to structure shiny apps for

production but I believe this this is a

good way um one that I'm very used to

just from building packages for other

purposes so you know I can reuse the the

tools that I know U for just building

our packages now I can apply them to

give me a shiny app so uh I'm going to

jump here to the terminal here is my app

it's just a little a little project that

me show you what it looks like uh so I

have my app to R file and uh typically

an R an app. R file if it's not hosted

in a in an r package it could contain

the app itself but because it is in an

our package the app is going to be

hosted here in run app and so I can show

you what that looks

like uh in our uh run app uh so this is

a very simple app that uh does nothing

nothing but print hello world to the

screen uh there is no kind of server and

you know at the end it calls shiny app

um so there is this little function that

wraps the shiny app the function name is

runor app and that is the recommendation

of um in the book so just pretty much

following what I read

there um because we need the shiny

package I'm going to import it this is

not generally a good practice but for

building shiny apps as our packages is

not a bad one and instead of you know

reporting from shiny specific functions

here we're importing the whole thing uh

for a shiny app typically use many many

many functions from the shiny package so

it becomes kind of tedious to import one

by one um and also this is not going to

function as a package the package is

just the structure for you the developer

to build it to test it to check it and

then to deploy it

so next I'm going to focus on the

deployment part so what is that app. R

file then uh for

um app. R is simply going to um do a few

things I'm going to talk about this in a

moment first I'm going to do this so if

you develop packages um typically you do

Dev Tools load all so Dev Tools load all

actually is re-exporting uh the function

load all from package load so here I'm

calling package load itself H and

loading everything in this directory and

then calling the function run app uh so

once the package is loaded then that

that function that we Define in the r

directory then becomes available and and

then you know it works so that's what

this app to R looks like these are the

contents and what is here at the top is

uh just to set which is the port and the

hosts of this app so this is not

generally necessary for building an app

in a package but it is important for

deploying it to Google CL around and

that has been what you know cost me the

the most nightmares in trying to set

this up so pretty much the whole video

is is for that you know for my future

self or for anyone of you out there that

might want to save yourself some time uh

trying to figure this out so um this is

already you know shown in the in the app

by by jeline but uh you know I was maybe

you know we can use 30 3838 which is the

board that um is typically the default

of uh of the rockger shin image um but

you know I tried a few things tried to

set the port to 3838 and didn't get it

to work out so 88 8080 will be so the

other thing that know we need to um to

deploy this as a package is um so in the

description file we need to make sure

that you know package load is uh

suggested right and shiny is important

right because it's important because

it's used in the art directory and

package is not used in the art directory

itself but uh we need it when the app

deploys we need it to be installed in

the in the environment so the the trick

is going to be to just you know use it

here in

suggests and then um when we you know

I'm going to show you in my Docker file

you know what things look like so the

docker file here what what it's doing is

creating the environment that will

deploy this app so we start from the

image rocker shiny the latest version of

it in this case which is good for me so

it comes with the our shiny package

install and also comes with uh shiny

server so not only we can deploy it uh

this this app to um go um Cloud run but

also we can kind of play with it on on

Docker on doer itself here locally so

I'm going to show that in a moment um

then what we're doing is copying

everything in this directory to this

other directory so the server shiny

server app directory and then you know

we say we want to work from from that

directory so that when we do something

like this well actually no this is

setting up the environment so what we're

doing here is you know just installing

uh the package pack which then allows us

to in a very simple way just call pack

pack it allows us to install the package

that you know this app is um you know is

contained in and all its dependencies

all of that you do it with pack pack but

for that you need first to install right

so and then we expose the port 8080

which is um at least as far as I can

tell almost a requirement uh for a

Google Cloud run I did try to change it

in in the settings but it didn't seem to

to work and then finally you know once

that environment has been um has been um

created we're going to Simply call the

the the the the script app. R which you

know as we saw before is going to uh so

remember the the P 880 is going exposed

and uh if we show you again the content

of R then of app R then we're going to

be loading all the contents of the

package which will include that run app

function and then call that function

with the options for 8080 and host 0000

well so uh we now can do a doer

build we can tag this as um my app

and let's build with the doer file that

is contained here here I need to enter

my password and it's not take much

because it's super

small app it doesn't install a lot of

stuff just shiny and package load um so

you fair with me few more

seconds so what we are doing here is

simply to demonstrate that um the app um

is working fine that we can run it on in

a Docker container and if it is truly

and successfully containerized then

Google Cloud run should be able to host

it in its Port

88 just a little

more okay that is good so now what we're

going to do is uh we're going to do go

run uh so this is going to be

interactive we let's just remove it

after after we finish and we need to say

the port is going to be uh 8080 to 8080

and the image is going to be my app

right so the one that I I just created

so this as as we expected is is

listening into the host 00000000 at the

port 8080 so if I click there uh here's

my Hello World very excited

so now the goal is to get the same thing

but running on Google Cloud run so we

need to um have a GitHub repo for this

let me see so this is G browse so if I

browse to GitHub you can see that yes I

do have a repo it's in my user account

it's called my app so this is what I

need to pass uh to Google

R so that every commit to main three

years in you and you build all the app

and it's served so um this is where you

want to be Google Cloud there is a bunch

of services in particular goog C run is

the one that will be useful for these

purposes and you need to create a

service so click here create a

service and what I want to do here is to

set up a to continuously deploy from a

GitHub repository so let's do that and

set up with Google Cloud build so this

little interface here

that allows me to select a repository uh

so I'm going to start typing my app and

there it is so Mar my app so that's the

repo that I just show you simply hit

here on

next and say okay what I want is the

docker file o this one here right so the

docker file is going to be the one that

will create environment for for this app

and and I mean I'm intended to click

create but I'm pretty sure yes I need

this one here authentication is required

so we have to say which of the two

options um everything else I believe

it's fine so I'm going to click here on

create it's going to take a little

while and uh and then you know all these

things are going to start moving tick

tick tick tick tick here right and when

it gets to the end I would expect the

app to be um to be available in a URL so

which URL so this is already kind of

pretty

there it is so that's the URL that I

will need to kind of be looking for so

let's add it here in a new tab so right

now it's there's nothing there right

because the app is still not deployed

but uh if we um you're patient and this

will you know complete in a little bit

and then it should be served in that uh

in that URL so if that's the case then

uh you already have all the structure

that you need to to do what I I just did

it's just a matter of kind of changing

the contents of that package so that it

serves a useful app not a Hello World

app but uh the infrastructure is you

know should be exactly the same and

again the takeaway the most important

takeaway here I think is the the port

part because that's the one that you

know gave me the most headaches here I'm

speaking mostly to my sh self so the

idea was to just kind of recap that um

uh to in my doer file

uh to know expose 880 and in my

app R uh to use this these options right

the option to uh set the port and the

host of the shiny app um so with that

I'm going to pause the video so I don't

make you wait while this completes and

then show you when this is done in a

little in a little

while okay I'm back here so when I I

pause the video took another maybe one

or two more minutes uh for this fairly

small app and uh so the the thing

completed and now uh the URL should work

let's click there and see what

happens there is so there's my my halo

world that that's pretty exciting isn't

it so um that is it and you can close uh

you know this video here but what I'm

going to do now is make a little change

in my app so let's change my R run up to

say I know hello world in in caps

logs uh so we see you know how the

um the continuous integration works so

you know I'm going to commit update

up and push so when I push to eth house

uh if I go to my service here uh that

should let's see here my

service that should trigger I believe a

new build let's see where are my builds

I think I need to click

there

triers well my app is thinking here

right so I think that's a build history

maybe that's where I need to

click still getting familiar with this

and there you go so this this last one

here was the previous commit and now

this one here is the commit that I just

pushed this confirm exactly so the

commit that moves the the message from

title case from sentence case to upper

case um oh and there it is uh see no not

yet here is where was so the app is

still

deploying and but you get the idea right

so the idea is that now everything is

connected whenever you do a change on

your app you don't need to worry about

Google Cloud run anymore you just push

your commit and as long as you know it's

in the in the main in the branch that

you configured then um it's going to be

deployed like this you know that that's

is going to be the trigger for this this

deployment um all right I'm going to

pause it again and come back when when

it's done to show you and then say

goodbye all right so this completed so

now if so they took another minute maybe

so if I refresh I'm hoping this yes

there you go so hello warning capital

letters all right so with that um you

know I I kind of very quickly summarize

what I've we have achieved here so in in

cascar com and I he a talk by Ja no that

talked about um Google Cloud run which

is an amazing service for multiple

things but you know one is to build

shiny apps which you can uh set up to

deploy continuously and the most

important trick uh is uh that you know

you need uh to containerize your

application you can build a very simple

do file that looks more like like this

and the most important trick is that you

need to work on port 8080 um so if

you're building your app as

um as uh another another package then

the trick is to pass the options port

and host uh so that the port is is 8080

and and host is0

all right I hope that helps uh at least

I'm pretty sure that my fut self will be

glad to not spend a whole day trying to

figure this out
