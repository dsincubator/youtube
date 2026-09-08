---
type: Video Transcript
title: "cloud: move data between a server and GitHub with the gh CLI"
description: "Of of moving big data depending what you call it but you know relatively large data um command line application between your servers and on github and because..."
resource: "https://www.youtube.com/watch?v=mamqEBZpbtw"
tags: ["ds-incubator", "github", "containers", "git", "cloud"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=mamqEBZpbtw"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2022-06-28T00:00:00Z"
    usage_count: 41
usage_window: { from: "2022-06-28T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

and thanks

jackson and alex for joining the ds

incubator uh today i wanted to talk a

bit more about the cloud that's going to

be the last no the previous last meetup

and i'm trying to

address the topic of moving data around

which

is not so trivial it's not rocket

science but it's not so trivial and

today i wanted to show

one particular way of of moving big data

in particular with

depending what you call it but you know

relatively large data um

with the gh

command line application between your

servers and on github and because like

with the traditional use of git where

you put your stuff in git commits you

can do only so much and when it comes to

sharing like big files so that's what i

wanted to kind of cover today so it's a

little geeky

maybe not for everyone but

and i'm kind of excited about

how i'm using that tool and i wanted to

share it with this audience

today so i'm gonna expand this here

and

i gotta

get into it so i'm i already have a

little droplet and a server on

digitalocean

if you don't have an account you can

sign

in for one and then you get a hundred

dollars credit that is more than enough

to practice what we are doing here in

this series

and so this demo droplet um has this

address that i'm going to be using to

connect to it this this number ipv4

and

so basically what we are going to do to

connect to it is i'm going to pop up my

own terminal

and uh and use the command

program command line program

and i'm going to say i'm going to be the

user fruits ads i'm going to paste the

address of that droplet

and and that will connect me to the

droplet itself

but you know i've been trying to

advertise the the use not of the droplet

straight but instead of using containers

inside your droplets and you don't have

to but i'm gonna be using that

so what i'm gonna be doing now uh i'm

not gonna explain much because i have

covered the use of docker containers in

a different series so you're going to

you know watch that one but

basically like very briefly i'm running

a container from the rockerverse project

i need

an address where to connect to it i need

a password i'm going to be

the root user there and i'm just calling

it gh so that i you know i know the name

of that container i'm going to remove

the container once i don't use it

anymore and i'm going to detach it from

the terminal so i have an interactive

terminal right after i run this command

so for now i'm just gonna copy that and

paste it on the

on here so let's let's wrap this up so

i'm gonna clean this up with ctrl l and

where i am here is not no longer my

local computer i'm here using the

terminal to connect to that um droplet i

am actually in that um digit ocean

droplet and i'm about to create a

container inside that by pasting the

code that i

showed you a moment ago

so that's that and so if i do now docker

ps i should see that gh container

running

so that's it it's working

and i want to

now

access that container through my web

browser i'm going to create actually a

let me first go to

some browser and now here open a

a new window

that browser

how can i ah here i wanted to get an

incognito window there

and let's go back to my notes which are

gonna be useful for

i find them for the rest of them so

here are my notes

and here is the web browser the next

thing i want to do is to connect to that

container that is running

using the address that we copied from

the server

for digitalocean and then the address

that we gave here that 8787

that one there

so i'm going to use that to connect to

that that should give me an access

to um log into our studio rstudio is the

username for this

container and the password is the one i

i chose i just want to three

so i'm gonna connect to that now

so let's move this here to the right

well this guy just there

just one more step for setup because i'm

going to be using a git at some point so

i'm going to configure

basically who i am i'm going to tell you

who i am

my my email and

username this is something that you

always do every time you kind of scream

you start a new fresh computer

oh our studio is disconnected

why

let's see

that that was me i just wanted to see if

i could access the ah port nice

good job good that's fun

lovely

[Laughter]

so you have my password my super secret

password so you can uh

uh so actually i'm now using my

earphones so i'm not recording that so

jackson has just connected to the

to the droplet um

uh which kind of kicked me out of my on

my own

uh ds equator

by the things jackson would prove that

it works

just i was curious

here i was gonna ask and i realized

yeah i mean that's a public address and

you can connect from anywhere actually

you know

that's also why i'm using an incognito

browser so right now

um

like

digitalocean doesn't know who i am

really uh or no and i'm just incognito

right so yeah if i could connect through

this browser anywhere in the world could

and by the time i'm gonna share this

video though and the droplet will have

been

gone so no one will be able to connect

but uh but yeah you can do it now check

some for sure

so now if i say

git config

the user name

i should get my own name so this is

nothing related to moving data it's just

set up so sorry it's a little boring but

we have to do that um

let me expand this

a little bit

and get my notes back in here

so this i'm gonna move here to the left

and expand

so and now it's the interesting part so

the in this meta basically what i'm

doing is advertising the gh command line

uh interface which i find super useful

it was jackson actually the one who

first introduced it

to me and since then i've been using it

quite a lot and so if you click on on

that url it will take you to

the website of it and then if you follow

this the links to you know get

installation instructions for whatever

is your system um you'll be you know

installing it fairly easily these days

it's very advanced compared to like a

couple of years ago when jackson and i

started using it and so everything runs

super smoothly including the

installation and this is the code i need

to copy to run or to install that tool

in

linux which is the system that is

running inside this

container right so i'm gonna paste that

code

uh that all just works

and in a moment i need to press enter

again because there is one more line

which actually

runs the install and and that's that's

all i need to do

to begin with

let's move my notes here again

um

where we

notes here

so now

we are going to

first just prove that we can use um just

git as usual

um but

in this case talking to git and github

using the

gh2 and we're going to be using it to

basically share some data between the

droplet and the container that i'm

running here inside this droplet and

github so let's do just that so first i

need to actually um

get some

data so if you want to get data from the

world what you could do is as usual like

a git clone with the url

that points to the repository that you

want to clone so that's not rocket

science that's if you use git that's the

usual thing but today i'm going to be

using the gh2 just because i want to

advertise it so it's a little simpler

you just say gh and the subcommand repo

clone

and here instead of you know having to

pass the url which is a little

wacky as a little complex i mean it's

not hard to memorize eventually you

learn it but still a lot of typing

so simply you just give the name of the

repo

with the owner before so

organization or owner slash prep name as

it makes sense and there you go uh get

started so

the reason this fails is actually

because i was kind of probably running

ahead of myself yeah there it is so we

need to first authenticate um and this

is actually a really nice way to set up

any fresh environment that you have

through the gh command line application

usually you know we need to create an

ssh key to start talking to github as an

auditing the authenticated user right so

that's what we're going to be doing

right now so one thing that i really

like from the gh tool is that it's very

intuitive so if you know if you know

nothing about it the first thing you

would do probably is to type gh and then

enter

and what you get is already some help uh

for example the very first thing that

you see is how to authenticate with

gh and then the command

and auth so let's do just that gh

out

and that again won't uh

authenticate

that again won't just do it we still

need to say login but you know it's nice

that instead of getting errors we get

pointers to what we actually should do

so i'm going to do up arrow here and

login

and now

we're going to be doing in a pretty

fluid way something that is sometimes

very awkward which is the idea of

creating an ssh key and passing it to

github so that basically basically knows

who you are so there's two flavors of

github github.com is the one we always

use here two degrees there is also an

enterprise version which is not the one

i want right now and

there is a couple of protocols you can

use to connect i'm going to be using the

ssh which is the one we have been using

at two degrees

and now i'm going to say yes to actually

create an ssh because in this little

container which is totally fresh there

is no ssh key yet

so i'm going to choose not to give a

passphrase just to make the demo simpler

you may choose to do it

and i'm not going to change the title

for the ssh key the ssh has a name the

github cli is ok for me

and now i have to say how i want to

authenticate

the login with

a web browser sounds good with me

so i'm going to copy this this thing um

that's what the prompt says so copy this

number

and you're gonna make this a little

bigger for your eyes

and then press enter as the prompts say

and now and

i'm i'm told to go to this url right so

i'm going to click there

this window opens and now is the normal

login to github so basically what we are

doing just to kind of reflect uh we have

to tell you how who we are and and and

um

from that

new uh little computer that is flowing

inside that container so once we do that

that container will be authenticated so

we will be acting as someone that he had

knows about so here i have to just say

my username

which is

this one or email any of the two is fine

my password here

and now because we are very safe here we

want to use as many ways to authenticate

as possible so i have an app in my phone

and i have to type the number 57 on my

app and approve i'm doing that right now

off the screen and here's where i have

to paste the number that i copied from

um

from the

from the terminal i'm going to show you

that one more time in case you forgot so

just the sensible things to do um

where is my

terminal it has to be here right yeah

here so

this number here is the one that i

pasted so that's it so now um the ssh

key has been created uh

we get the name of it

and and i'm logged in as as myself so

that's that's really good

so that

in itself is fairly useful many times

when you create a new say that you want

to clean up your computer

and you have to start from scratch you

know how to create a ssh key you can do

it now with h with gh

so now um we're gonna get actually

finally now we have everything set up to

the two things that i wanted to show so

you know how to use gh to actually get

data from github you know as normally

you can do it as i said before with git

clone and now we are going to do it with

a gh repo clone the first time you use a

ssh key you have to say that it's that

basically just say yes to that

and here i have just cloned a repo so if

i do an ls here you see that there is

this repo called ds.cloud which is the

one that i'm using to host the lessons

of this meetup so i'm gonna cd into that

ds cloud uh just to show you the

contents it's just a wrap-up there it is

and in here i'm going to create some

data that is what i want to pretend here

that that's what i want to share so i'm

going to create the data

the directory first make their

data

and then i'm gonna create some files

there data a csv and maybe data b csv

so that that will do so if i do

analysing data you see that the data is

there so the first thing you could do uh

one you know

if this is small data there is no

problem you just do a git add

data

hit commit

say new data

and then you just push

so that data will boom go to github and

you can you can prove that we can go to

that

url we can do github

dot com

two degrees

investing

ds.cloud

and look at it and admire it on github

there is our data with this it's two

files

but

the interesting bit here and probably

the core of this meetup is that that

data could be really large and uh and

there's only so much

data you can push inside a commit so for

that uh we're going to be using

um what's called github releases and

which is

a way supported by github so here are

some notes that it says the github

github itself says that if you need to

distribute large files

you can create releases and then um

attach

the files as as binaries to those

releases and it can be as big as two

gigabytes each and there is no limit as

for how many files you attach so you can

have any number of files uh two

gigabytes each so that's great so the

first thing we're going to do now here

is actually create a release and and gh

allows us to do that and let's call that

release

v1 just for simplicity so gh release

create of course that is associated to a

github repo so i have to have here some

repo i have one repo for example in my

own account that is called assets

and i use it exclusively for that um it

looks like i committed

okay so here is a bad cree

a typo create that i need to fix

so if i create that uh release uh i'm

gonna accept the everything here the

the name of the release i'm gonna leave

blank the notes i'm going to say this is

not a pretty list this is an actual

release and i'm going to click here on

on publish release

and that's it so that's the very first

step so if you go to the to the repo now

you should see that in the releases

section so you can click here on the

name of the repo go back to the main

page and now in releases there is one

release

it should be um

pretty much empty there is two assets

that belong to the code basically

defines that the repo contains itself

but the interesting thing is that in a

moment we're going to attach here

a file that contains that data folder

that we just created a moment ago

so the first thing i would like to do

though is to compress that folder

because you know we cannot attach the

folder as it is we need to kind of

compress it into a single file so for

that we're going to be using tar there's

a couple of ways in which you can create

compressed files but i'm going to be

using tar so basically star is a command

line application and you say c4 create

the z for uh compressed as like a gcp

and f is to tell you know which file is

is the one that i want to host the

archive and then you just say which is

the folder that contains all the files

that you want to compress so let's paste

that here so if i do analysis now you

see in red that there is

this

file is the compressed version of this

other folder here

so now the call the code is is pretty

straightforward oops sorry

so many windows so what we're going to

do is we're going to use gh and say

release upload

we have to say which release which is in

this case v1 and which file

is going to be the file data.js

so i'm going to

run that

oops sorry the the bar at the end

was unintentional so i'm gonna remove it

and run again

it's thinking a little bit and then it

just sent it to github so i can look

here on on the

on github itself refresh

and and there it is the file right so

pretty

straightforward and this file is tiny

but it could be again it could be up to

two gigabytes

per file so jackson if you're still

there i acknowledge that it's five

minutes to go and i have enough time to

show how to actually do the the reverse

thing so now how do we get

a file from a release um that is

attached on a set to edit to release so

i'm gonna push through that and then

and maybe we can have a little chat

about what we have just done

so let's go back to the notes awesome

um so now the reverse right so we are

now in the in the other situation where

we are in inside a droplet or actually

that could this also could be your

local computer but i found it useful and

when i was working with uh

in the on the cloud so that's why i'm

sharing it here

um

so what we're gonna be doing now is okay

let's pretend that we are

at the

home directory of this computer

uh i can do an ls and see you know that

that repo is there it's the ripple that

contains the release but i don't really

need it so i could even remove it um

[Music]

i could completely remove it so an ls

now shows nothing

and from here i can now basically get

that file that is attached as an asset

to the release that we created before

how we do that it kind of makes sense

it's a little

complex if you are not standing in the

repo like now for example i'm just

standing outside the repo that has data

set but it's still not so hard anyway so

basically you say

let's expand this to kind of walk you

through the through the call

we're here so you say gh which is the

the tool that we're using now and now

it's release download again we have to

say which is the version that oh yeah

then the release um to which um the

asset is attached to

and then we have to say the file in this

case the file unfortunately is is

matched by pattern so we say minus p for

the pattern

and you could give you know something

that matches this file exclusively so

nothing better than the whole file name

to me and because we are not in the repo

that has the set we have to explicitly

say which is the repo which is in this

case truth is investing ds.cloud so

let's do that so let's copy that that

command

go back to the terminal

and it did its trick so if i do any less

you should see that file there and then

the rest thing that we need to do now is

probably just uncompress it if that's

what we want so with tar you know what

you do is you

x for extract and and the file that you

want to extract

actually i noticed that in notes i

forgot to say the file name and and

that's it so with ls you would see now

that the data folder is uncompressed and

if you list into it you see the files

that you wanted to bring from from the

from github into the terminal so that's

it the two ways so we got data from

github in two ways first with normal git

and assuming that the files were small

enough and second we did it with gh

attaching

um basically you know using the gh tool

that allows you to upload and download

um

assets to github releases

let's go back here to jackson's faces

and alex face and see if there is

anything here have you ever used this

jackson before releases and assets

uh i have i mean i've used releases and

announcements but i've never used it in

this way i've definitely never attached

data or like i stated like that's pretty

cool it's cool i know you know i became

more aware of it um

through the

piggyback

package in r which uses

um

extensively that idea

to

so basically you create a little yeah if

you want to you know move data around

and host it on github um but the files

are big you can just use that idea so

you attach and detach and

upload and download assets to github

releases and then i noticed that the gh

command line application was using it so

i find it really useful now because on

the cloud i'm unscraping a bunch of data

so i end up with these servers that are

like super like overloaded with data and

i need to get it out of there

so i could you know bring it to my

computer but then it's not kind of

backed up and then the thing i would

like to do once inside my computer is to

move it to github so i found that this

way it's kind of more direct from the

server once it gets overloaded i just

compress the like create a compressed

folder with all the data move it to

github in one single repo that i call

assets and then delete the archive from

from that from the server and so i don't

have to kind of grow the server that

much which is kind of what i showed last

time you know we can expand the size of

the of the server

but then you have to pay so

okay so this way this is free you can

attach as many assets as you want

there's no limit in the size and 2

gigabytes per set is pretty good for me

yeah

so you can have you can have as many

assets as you want and this is the 2gig

limit per asset yeah

yeah which is pretty surprising now that

you could do you could go crazy

but yeah apparently

so far i haven't reached the limit and i

have

more than 10 gigabytes associated to one

single github release

yeah that's super cool it's cool because

you can also do release notes and

whatnot with it so you can kind of

like

if you're using that as like a data not

a database but like as a data solution

you can have like any

any changes that may have to be made um

exactly yeah yeah actually the the way

i'm now distributing data in this

project is

um

so i have code of course that scrapes

some data

and then i create a compressed file with

data that i scrape and that's inside the

same repo so it's kind of nice because

he has to say you know basically you

have the code and the

asset

linked together but you know i'm kind of

using the system a little bit in that uh

i have another repo exclusively for for

a set so they are not associated to the

code that generated as i said

uh alex

yeah um

like a word of caution that is

anytime you're using anything related to

get poor managing data

the like

double-edged sword there is

the prominence chain

right

because it

would get it's saying you say like i

released my data then i released my next

set of data then i released my next set

of data with all of the updates

right

and if you ever have to go back and

edit

[Applause]

that is a situation where

that providence chain will absolutely

come back to bite you

um so it's a definite

in that it is good it shows

uh like

you you do have this sense of

showing progress over time and

in that sense you do show that you are

building upon the old data sets

um

but

if anything goes wrong with that it

becomes

massively more difficult to actually

resolve the problem because then you're

going around chasing down all of the

issues that are not the actual problem

they're

administrative data management issues

yeah

yeah good cool things alex um yeah i

mean like funny enough i don't have a

lot of experience with large data sets

that

are not a good fit for just kid commits

so this is like one exploration of that

but i'm pretty sure this project will

push my limits and and teach me other

tools that are more

suitable for that are you aware of any i

mean i know of some tools are the kind

of the git

analog for for data and like are you you

know what would be your tool to go alex

you have any particular recommendation

for managing like data through time in

the most efficient way

honestly the best thing

that i would do

in something like that if you have

discrete time checks is

i would manage them separately on a file

server

and use file pads to distinguish between

them

um

because then

i would use file pads and like take an

md5 of a directory or something

to show data every day

um

because if you can do that like the

one of the things that is valuable about

using git is showing

yes this is actually the data that i

intended to be

right

the

git is useful because it packages

everything up and the sha-1 hash is the

sha-1 hash

and if it dashes then i have everything

but

that does make it very difficult

for

managing large data sets or if any

individual file goes wrong or needs to

be changed then the entirety of the data

set is compromised

so

um that is a problem we are

actively dealing with as we're doing the

pacta migration so i don't have

final thoughts on that yet um how we're

going to manage all of this but it is

something that is worth considering sure

yeah yeah

all right thanks a lot i think it's

going to we well so next meet up

next week i'm on vacation so no meet up

and then the last one of the series is

the one following that

and so that's it and then after that

i'll be in berlin so maybe we can have a

decent waiter in person for those who

are around

thanks everyone thanks for joining see

you next time

toe
