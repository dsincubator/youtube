---
type: Video Transcript
title: "ds databricks4r: Databricks for RStudio users"
description: "today we're going to be talking about  data brakes for our studio users the  goal of today's uh tutorial is to help  our users understand if and how they  could"
resource: "https://www.youtube.com/watch?v=-HTH2ylnT7Q"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=-HTH2ylnT7Q"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

today we're going to be talking about

data brakes for our studio users the

goal of today's uh tutorial is to help

our users understand if and how they

could do in data brakes the kinds of

things that you commonly do in our

studio I point to some frictions that I

see as an Studio user that is new to

datab brakes a few of the things that

you'll be seeing is to for example add

folders our files and notebooks to your

databas workspace also we're going to be

exploring how to work with and GitHub

how to create a spk a spark data frame

from a table that exists in the datab

break catalog how to run jobs how to

create a cluster with our studio

installing it and a few more things so

the audience is specifically analyst who

are already using our studio and are

considering if that R is a complete

replacement for a studio or something

that you know could complement what you

already do with it so why is this

important well I think that dat R is

like a racing car so it's great great

for racing but for an art studio user it

may not be the most comfortable kind of

everyday car right so understanding what

you can do and what you shouldn't do in

that R may may save you some time and

some frustration so um let's start

exploring uh what the datar r

environment looks like tab by tab so let

me click here on uh the datar r Tab and

show you uh we're going to be kind of

navigating through this these first few

tabs that you see here on my left so the

workspace um gives you access to doing

things like for example creating a

folder you can come here to the um to

sorry actually I think I'm not in my

workspace let's go back here uh so let's

go to home actually I think from here

it's it's going to be more natural there

you go so we have folder um as an option

so let's do a demo folder and crate

there from from my home uh but you will

see that uh it you know I created it uh

from the home but it appears here under

my my workspace too so now let's add a

file so we are our user so let's click

on file and add a file. r for example um

let's do that and and as actually as I

speak um now that we are here in this R

file I'm going to connect to a cluster

so and in our studio usually you know

when you create a file you already have

a running environment at the back right

so you always have your own system or

another server system running in the

background right so you can you know

compute things right away here um the

creation of the file and the attachment

of that file to a computer environment

are two different things so I'm going to

choose one of the options that I have

here I have two clusters I can connect

someone created them for me but I could

also create a new cluster if I wanted to

I'm going to click on on this first one

and I do it now because it takes a while

so this is one of the functions that I

experience as someone who is used to

kind of jumping right into like a

running environment and experimenting a

few things maybe I want to show

something that five seconds H so now

I'll have to wait for a few minutes so

as I speak um that I'm going to also

show a few features of uh the interface

that you see when you create an R file

so not know that this is a file. r so

the r extension um tells dat that this

is an our file and and the interface

will behave uh particularly so I can

click here on the bottom right where it

says open bottom panel and what you see

here is uh a tab that says terminal and

another tab that says output so output

will be the equivalent to the our

console in our studio and the terminal

the equivalent to the terminal in our

studio so we run R code here in an

output and we run um terminal code like

Shell Code in the terminal tab uh the

the um cluster hasn't started yet it's

still working so I'm going to start

typing something some R code that will

be able to run once the classer is

actually started so let's do uh typical

print uh hello world Hello

World um and I still unable to WR it so

if I click here I'll see that it doesn't

do you know what I want to do is it

cancel current execution let's just

click there in the meantime I'm going to

show you how to create other types of

files and then we can come back to this

a little later on once this is started

so let's go to workspace again and and

click now here on ADD I'm going to add a

notebook so notbook will be the closest

that you can think of to an armar down

file or a quter file so basically more

generally speaking this is a

computational document something very

very very similar to a Jupiter notebook

in Python uh so here I could just call

it um

notebook and I don't have to give it an

extension note that by default now it's

giving me r as a language but you could

choose others that you know you can set

for every single Chun and then you can

you know you also have a language at the

chunk by chunk level at the very top

what I'm going to start with is not with

r code I'm going to start with markdown

you know typically in in our studio for

example if you are open a quarter file

or armd down file you can do something

like you know pound and hello uh world

to give a title to your file so here it

be interpreted as an N file so I have to

click there and select

markdown now it's going to be

interpreted as markdown file so note

that this um kind a magic thing here

appear automatically when I click on

markdown so this tells database that it

should be interpreted as um as markdown

so if I click uh if I hit control and

enter in my keyboard and I you know

inserted that title also I if I hold

here around the middle um I can already

see that I have a plus icon that I can

click on and create a new chunk and this

time I'm going to type print uh as I did

before hello

world and I'm ready to run this as um as

an AR code as you can see here so again

note that um we don't have a running

cluster here where it says connect one

interesting thing here compared to our

studio is that each file can be attached

to the same or a different cluster uh so

here I'm going to choose the same one

that you know I selected before um let's

see if that started already um I don't

see it started here so I'm going to

leave this as is and maybe go back to my

workspace and select my other file the

file. r um um to continue there so now I

see it green so that means that it's

it's ready to be run I'm going to click

here again to show the output and the

teral so if I click here on the play

button um it Con current show let's say

yes let's see what

happens uh so I'm sending this code you

know to the uh output uh little panel

what you see is the output that you

would see normally in the art console

okay so now that I have a running

cluster behind this file I can also

click in terminal and I would see um

something useful before R was kind of

blank U so now I can do I don't know

like an LS to see what files are there

or a print WD to see where I'm standing

I'm standing in data driver um that's a

little um surprising um you know to see

that the terminal is pointing to a

directory but then kind of coming here

in the UI and seeing that if what looks

like an file structure is a little

different to what I see in the terminal

so that as an R Studio user could be

surprising so um yeah just take that one

other thing I would like to do is to uh

print um get working directory um

because it you know what it happens it

can also be a little surprising here you

know the our file is running on um you

know sltm SLR serve slon 9005 which is a

weird directory um and if I go to my

notebook uh what I I noticed you know

doing some experiment is that the let's

let's try that get WD if I run that our

code let's run that cell

um I

see okay so ah right so no the what it

was different was not by the file format

by by the language so notice that in r i

get this weird um this

weird

um directory but if I changed this

language to say python H or even the

shell that we were playing with before

if I L shell

um and then I do a print WD if I run

that um you know the

file uh it's surprising to me to see

what you're going to about to see in a

moment that the output of the of oh

actually yeah there you go it's uh it's

different right so the the output of um

the current working directory is

different by language so if it's in the

Shell it prints um I mean dat breakes

driver and if I was in R I show you

before uh I get something different so

that's something to be aware because if

you write code and then maybe in R and

you run you Source it you would be using

this as a working directory but if you

call it from R script which is is a

command uh terminal command that allows

you to run um arod but from the terminal

maybe the output is going to be uh you

know put to a different working

directory so something to keep in mind

uh okay for completion I'm going to also

print um Hello World by running that

chunk and what I experienc also is that

if I use Python also the working

directory is similar to the Shell but

unlike the one in R so let's let's try

that uh in Python I will do something

like import OS and

then and then

os. get current working

directory H let's change the language to

Python and then execute that r that cell

um and again so this is similar to uh

the shell but unlike R right so pretty

surprising something to keep in mind uh

all right so we already learned how to

create a file an our file a notebook uh

to you know start a cluster let me go

back to the notes to see what else I

wanted to cover here um I think I think

that's all for this section uh let's see

if the frictions I cover them all well

one one thing that you will very likely

notice is that if you're used to editing

text with our studio uh you know the

interface that you have here in that is

going to feel very limited the amount of

you know refactoring of the text that

you can do is uh is you know a lot less

powerful um also few file formats are

supported so if I wanted to create a

different type file so let's go back to

my workspace and create say uh let's you

know force it to say like a

shell

script and want to do the extension as

so if I did this in our studio this

would create a share file a file that

would send commands directly to the

terminal so I could do something like

pre WD right with that file but in here

uh I don't get what I expect what I get

is an error message saying that you know

your file has to have extension Pi SQL r

or Scala uh because those are the only

formats are support so maybe that's a

configuration thing you know when the

cluster are clusters are created you can

set a few things um maybe that's

something that I haven't learned yet how

to do but you know keep that in mind

that maybe by default and not all the

you know the large number of file

formats that allowed to work with in our

studio could be available in data Bas uh

all right so now I think I have covered

everything there um yeah mention the

fictions too okay repos repos is another

um let's copy the the URL that has the

repo I will demonstr right uh so repos

is another tab in in my workspace you

know behind under my my workspace I see

repos if I click there right now I have

my my user name there and there is no

repo but I click here on ADD and I again

click there on repo and just paste a URL

to any repo that I want so here is the

repo where I'm hosting the notes that

I'm sharing with you today h so that

works pretty let me see um enter a URL

start with this maybe

yeah maybe that little space in the

beginning was in the way which is

surprising it's pretty easy to to remove

trailing white space surprised that it

didn't work but now now that I did

remove that white space here we are

here's the repo that I clone from GitHub

what you see here actually now this this

repo here and um actually is pretty

smooth to work with um with get here um

but you know with with some caveats and

for example one thing we could do do is

okay let's um let's you

know um first go to the G interface so I

can click here on the dot dot dot and go

to G or I can hit on the name of the

branch and that will you know open this

interface that where I can do a bunch of

things like for example create a branch

and I can call it demo uh create Branch

uh that way ah because you know in the

previous one let's call it and I already

created a branch with that name um

there we are waiting for a little

bit I think we

are done except I don't see ah because

there is no changes there okay cool so I

think I see nothing because nothing

changed but if I click on a file and

then say you know I add you know white

space to the

end something like this um now I think

that I could you know do that you know

click on the name the branch and I would

see that that file has been modified

there you go you see the the white space

added here at the end of the file right

so um one interesting thing here is that

you know the um notice that when I

scroll down a little bit it says commit

and push so if I do a comit it will

automatically push that comit so you

don't have the chance to create a bunch

of comets maybe rework them uh before

you share them it's kind of come and

push all the way so add white space

commit and push so this is going to be

sent to IAB and then if I want on GitHub

I could create a request out of out of

that Branch right so um also you can

pull and that's pretty much all you can

you can do there's no more kind of

advanced features for for GID um if you

want to I know reset a ComEd or RAS a

buch you know a branch you know you

cannot do that like although you know

you saw before um I was working from the

terminal so you may wonder if I would be

able to work with G from the terminal so

let's try that in my experience uh I

think the answer is no so I'm going to

go to the workspace navigate to that R

file that we created before

users there's my username demo I think I

can also go to recent that's a nice

feature like just jump to the file from

there and so we have a terminal there so

we could uh try navigate using terminal

try and navigate to um to the G repo and

and try operate the repo from there you

would expect that to work as as an art

user that's what you you would

experience in the art studio terminal so

let's see if that works uh let's do um

um

uh maybe let's see you know first let's

show you uh unless on on the root of the

um find system here so here you see

workspace which is something that you

know we saw here at the top so let's

let's change directory there and go from

there so let me clear this up with

contrl L and then CD change working

directory to SL capital W

work work space and then unless it will

show that oh there is repos there so I

do see the repos and then I'm going to

start hitting the tab to autocomplete so

I'm going to jump inside my um user

account and then one more time will get

me inside the repo so there we are we l

and exact that we are confirming that we

are in the repo however if I do any kit

operation like git status for example

um you see an error so what's saying

here is um it's not recognized a Rebo

which is obviously um kind of wrong

because it comes from GitHub we know to

get Rebo and it says it's stopping at

file file system bound it looks like

it's a setup uh maybe that but you know

by default repos are not allowed to be

worked on from terminal so they're kind

of disabled by maybe removing the do git

directory which is what defines it as

the G rep so if I do an l

dogit I it says that there's no such um

FAL directory um so that explains that

it doesn't work but you know it's

surprising so as a as stud your user you

would expect that a repo would behave as

a repo all right so going back to my

notes

um I think that covers everything I

wanted to share uh on on the reos tab so

let's go now to the catalog um so the

catalog um is this other tab that you

see here

there you go and as you can see there is

a bunch of um tables really here so I'm

going to click here on the row one it's

one that um we're going to use for this

demo uh here on default you'll see a

bunch of tables you can search for them

say want I know one is called

country there you go go so I click there

country I already see some properties of

the table like the types of cols for

example and very nicely I a create so

I'm going to click there create a

notebook notebook from that table what

it's going to do it's going to start in

Notebook

with

um spoil alert with an SQL um chunk of

code that basically shows the table on

the notebook it's going taking a little

while in the meantime I'm going to jump

back to my notes to see if there's

anything uh I could start copying okay

after I show you what I'm about to show

you I'm going to run this code and

explain what that

is is taking a little longer than I

expect so let's

refresh there you go okay so we are a

new notebook it's called automatically

was you know the name was defined to

explore the you know raw default country

which is kind of the you can think of it

as a path to

uh the table um you can run that and we

will see the output that this is SQL

code um you have to work with SQL I'm

going to show you that you can do the

same thing in R for example let add this

this junk here uh and past the code that

I got from that from the not so now the

path is the same that you see here in

SQL you know I I put that into a varal

path and I'm using a package called here

it is the the output of that that table

super small table on five rows um there

you are but it took quite a while to to

print though okay so now uh that I show

how to do that in SQL then uh let me

show you how to do it in R so this is R

so I'm going to change that to R um and

you see I'm using this spark r package

and in particular a function called

table 2df that takes that path so that

path is not a path to the fire system as

you would normally do it in our studio

it's a path that um basically you know

works with the catalog so spark

understands that concept of catalog and

and in a moment I'm going to show you

where those tables are actually hosted

but let's let's run that it should print

something very similar you know you

would expect to um what you see thata

frame but uh you don't because you know

the spark um although you not I'm not

going to talking much about spark at all

but um basically spark allows you to

work with big big big data so you know

printing data to the console it might be

uh might print too much data uh so

conservatively it just shows you that

it's a spark data frame we could you

know do something like class of data and

that will uh tell us that it's a spark

data frame but then and that's you know

class is a function that you know you're

probably used to using it in in R but

then other functions that are common

like head for example um may not work so

that means that you know spark data

frames are not the same type of data

frame that you may be used to working

with so if you're used to working with

just normal R data frames you know

starting to work with a spark uh is

going to um means that you're going to

need to learn some some new tricks like

for example if you want to display data

you have to call the function display as

opposed to the you know just printing

the name of the of the table or or using

the function print that that would not

sure I think it's going to just print

what we saw before and yeah exactly just

the names of the columns right okay so

in summary and know working with uh the

catalog um you can use spark R to rate

stuff from the cattle in a very simple

way uh similar to what you would do it

in in SQL um I think with python is very

similar too but I'm not going to cover

that and then

one friction that I experien is that

well you know if you're going to be

using spark um data frames then you'll

need to learn um like a new way of of

working with other frames um let's go

back to the notes to see what else okay

so there is a couple other things I want

to cover so one is to read data from the

file system so I did show you that you

know spark is running um on on on a f

system of course and and and then we

could you know we could get things from

there so if you happen to have data in

in somewhere in the file system of lat

so remember that at some point I think I

show you I actually this directory I

didn't show you that but there is one

directory called Data R uh data set that

has a few examples including one CSV

file so you could you know if you have a

CSV file and exists in the file system

then your experience could behave as you

know your normal experience in our

studio where you just read things from

from your computer from your disk right

I'm going to change this chunk to R and

run it h and and by you know because

it's just a CSV F your fine system I can

just use the normal tools I usually use

like read Are For example read CSV H

with the path to that to that data set

it's going to do what you expect okay so

if you have normal data then you can use

the normal

tools uh back to the

notes uh let me show you where the data

that is accessible through the catalog

actually lives so D is nested in in a

bigger framework which is azour in this

in this particular case you know I think

you can also get ad from Amazon for

example but in this case you know I'm

accessing it from azour and in azour I

have um I know we have an account there

and we have what's called there

containers uh looks like I need to

refresh my

browser so what I was showing you before

was the portal so where you land uh and

oh I think I lost connection to the

internet very unfortunate let's see if I

can pause the video and recover in a

minute okay my internet is back is

talking about aour and here I have a

container um

that here my containers here um and and

and in here you can see that that row

container that I show you before so the

tables that you saw in the catalog are

um folders here I think they are um

paret tables and the one we work with

was country this table here so if I

click there you see it's a bunch of

files and thing that you know make up

the the structure of this this

particular type of file this five format

called park I think um but what I wanted

to show you is a simpler

um container that has simply CSV files

that we can use to actually I think I

removed them unfortunately ah darn well

I think that that part I'm going to skip

um basically I I have a um container

there with a couple of CSV files that I

wanted to show you how to read um but

instead I think I'll just need to set

with how you good do it so if

um so the package that allows you to

read data data from azour Storage is the

pack package azour store with a capital

A and capital S that's the package you

want to use um it needs a token so I

can't show you um I can't show you that

so it's best practice to push your your

tokens in in an our environment file so

not in the script that you share with

the world like I would here in the video

um instead you know the token is you you

can think of it as a password and and a

username Al together and it has to go in

a in a file that you don't you know

share with the world and that's the iron

environment so you can access your IR

environment file with use this edit r v

and then you paste um a token that you

get from here so for example if you

wanted

to uh if you wanted to read data from

say this container then you know you

generate an S token there and I see an

error maybe because I don't have

privileges to read that particular but

if I create one let's let's just do it

something is not working the way I want

to let's try one more time with let's

see this ah maybe was I

was I had that click now let's try one

more time with this other container well

basically here in generate SS

you have the interface to generate the

tokens that then you paste

in uh your IR file and then you have to

use the this URL thing which is um

basically the name of your container so

container it's the raw container be here

you would see raw in my case you know

the

demo that I want to show was with a

container called test mod so that's what

you go put there and then here what you

you put is um the only thing that

changes is is this bit that you'll get

from from here right so that's the like

the the storage where all the containers

leave um all right very unfortunately I

don't have the demo ready for you but

you know how you could do it is you know

you need that URL you need that token

put in your ironiron uh the name of uh

the viral that will point that token can

be anything I this is a name that I made

up just because it makes sense to me and

then you read the value giving it the

name of of the uh of the variable H to

the function C get and that will be you

know read that token privately without

showing it here in the you know here in

the demo or in the file that you share

with the world so now the variable SAS

contains that secret and you pass it to

the function BL container along with

with a URL so with that H you have um

created an object of that there a

container object and now you can pass

the path to whatever data exists inside

that container so the demo I wanted to

show had a folder called data and inside

it CSV file called irs. CSV and you read

it with a function that comes from the

azour package that is called you know

Storage R CSV so kind of in a similar

note to the one that I made about spark

data frames you know if you're used to

working with your own file system you

know how to access files from there you

know feels natural to you if the FES

live now in a aour storage for example

then you'll need to learn you know these

kinds of tricks to to access the data or

maybe you know write a little helper

that wraps all this um code and hide it

from you and then you can just call that

helper I know r azour or something like

that and then your life will will going

to be much simpler all right some of the

frictions that I experienced doing this

beyond the fact that I forgot to uh read

the the demo data that I wanted to show

is that spark uh the spark r package is

no longer on cran unfortunately it was

archived in 20121 for lack of

Maintenance so I wouldn't trust that

blindly um there is another package

called sparkly R um which seems to be

the best alternative and it has an API

that is similar to you know allows you

to work with deer to query data and but

I unfortunately didn't manage to set it

up set up seems to be pretty complicated

um and I didn't have time to figure it

out so unfortunately I cannot speak for

that firsthand about my experience about

it and then um finally you know what I

mentioned before that you know if you're

going to be working with spark data

frames for example you need to learn the

tricks to work with sparkl frames or if

you read data from azur Storage you need

to learn a little bit about that it's

not going to feel super super natural

all right let me um I still see that

there is some problem with the internet

here so I'm going to P here again and uh

and see if I can figure that

out

here okay still fighting against the

internet of an airport maybe not the

best place to record this video sorry um

all right so let's go back to the notes

uh we covered workflow we

covered oh no we did not cover workflows

yet we just you know finished covering

um the catalog all right so what's the

workflow so let's let's do that so let's

go back to that bricks uh so in you know

we were talking about catalog now we

talk about workflow so this um um tab

here allows you let me remove previous

workflow that you know was prepared for

a previous demo allow you to create what

you know a job so basically a file you

can run uh on demand or on a schedule so

giv a name say

um my job and then you navigate to a

notebook uh whichever it is so I'm going

to use the notebook that we created

before the one where we were exploring

the table country um just choose

whatever you know um notebook that has

all things that you want to do H and

then you need to choose a cluster you

typically do here that it's going to run

that code for you and there you go you

create the uh the

job and if you want you can add another

task we could be for example if you have

a sequence of files that you want to run

uh one after the other then you can add

a task and then you know add one after

the other so that's like a nice

graphical way to to do that but I don't

want to add a second kind of step to my

to my job I'm going to just run it

now and you can view the the Run uh by

clicking there you could see you know

what the output uh of that of that work

is I think this is Computing

still there you go the first CH

completed the second CH completed too

say

how long it took and then the third one

as well going down everything was was

done okay so that's um that's work close

there's not not a lot to it the one

thing that I think is a bit of a

friction is that uh I don't see an

obvious way to turn that job that we

created with the UI I don't have see a

way to turn that into text because why

would I want to do that well because I

would love to add any uh um

configuration to git to Source control

so we can review versions of it uh and

and see the project involve uh that's in

in for example if you're used to um

GitHub then in GitHub actions you do

something very similar with um to this

right so you create a workflow which is

simply a yamama file where you specify

different you know tasks or different

jobs that you want to do and the nice

thing about that way is that you know

you leave a programmatic record like

code record of of what you're doing and

then if you have to improve the the

workflow it's easy to you know use git

to see you know how how you improved it

and share with with your colleag so

that's one thing that I see here as a as

a downside but again I'm new to dat

bricks uh so maybe it's just me knowing

how to do that and finally I want to

talk about Compu so what's the last tab

there um so we've been using um things

that you know you create from here that

these clusters right and but now I'm

going to show you how to create a

completely new one and in particular I'm

going to show you how to create one that

has our studio installed in it uh so if

you want your cluster to give you access

to an our studio ID running on l r then

you need to make sure that um at least

from what I read in the docs it has you

know the ml runtime has our studio

install in it so you could choose

anything from here that says M ML and

I'm not sure if other things that do not

say ml could would have a studio install

but this one here should um I think with

what we have here we are good but one

trick I learned from the dogs is that

you cannot have this really nice feature

that is uh allows you to outo terminate

clusters if you're not using them so

basically another R you pay for running

containers for running um clusters and

so it's kind of nice to have the ability

to terminate them automatically if for

some time they have been you know have

been unused but unfortunately that's

incompatible with our studio so I'm I

have to uncheck that so I'm going to

click here in create compute and that

will uh we start the process so the the

cluster is still in creation and so I

don't see it right away but uh when this

is complete you will see this apps uh

tab um accessible so now it's it's kind

of not clickable but it will in a moment

so in the meantime I'm going to show you

um another

that this the one that is already know

running so if I click on the details for

that one you can see that there is an

apps button there and and there's two BS

one is the web terminal which is

something very similar to what you saw

or maybe the same thing that you saw

when we were working with our files

right and so not that these terminals

are Emeral so if you uh you know refresh

your browser you lose what you're

working with there but it's telling you

if you can if you want you can use teok

to persist Terminals and even if you

refresh your browser or if you close

your tab so that's that's one app not

the one that basically focus of um what

I wanted to say but just to show that

this one and then the r Studio server

appears here but the button is great so

the reason why is great is very likely

because this um cluster has outo

terminate Ena so that automatically

these abls are Studio server so uh let's

go back to compute and see my other

cluster

it's running no it's still not running

so what I'm going to do is pause the

video so I don't make you wait and when

it's ready I'm going to show you um this

so when I click here this apps um thingy

is going to be active so let's pause the

video for

now okay finally it's uh it's on it's up

now uh you can see that the app T is

enabled so I got actually before I do

that let me just change I think from

here can I change the or no it's too

late now um click here on the apps and

you'll see now the RCU server is is

available and and that's because

remember outo terminate um checkbox was

unchecked so unfortunately to set up our

studio the I cannot use out determinate

so I clicking in setup uh I have fairly

kind of straightforward instructions all

you need to do is to know your your

username here and uh and you know get a

password just C here and show get your

password copied and then you can click

here in open our studio so that will

open our studio on uh a You tab H the

password Here is the one from the

previous uh run of this demo I'm not

going to save

that and you will see here is your

normal um R Studio IDE now running on on

the cloud and a c caveat here is that

the the terminal lacks pseudo so if you

want to do say is zudo

app get update for example you know

before you install software typically we

run this to update the Registries and

but here I know I need to get a password

and it's not the password I can try

pasting the password I copy from from

before but it's not that one it's the

the password that gives you admin

privileges so by default at least I you

that's not give you that power and

that's very limiting because usually you

do need to change your system uh to

install for example new art packages

some packages require system level

dependencies and so it's very likely

that again it's some kind of setup that

you can um configure and in datab

breakes to allow our studio to have zudo

or something that you can change at the

level of doger container so I'm pretty

sure that has the ability to add your

customized you know clusters by adding

uh your own um doer images extend the on

a day maintain that maintain and and

maybe there you know we could enable

Pudo but by default at least no so be

aware that that will be a restriction

and also if you did anything here in a

studio be aware that if you stop the

container and then restart it then what

you did here is going to be gone

basically you're going to be connecting

to a completely different instance of

our studio so if you create files save

data whatever um it's going to be there

so far and you know if if you

uh if you keep that container running

but if you stop it then you'll lose it

okay so that's another friction to be

aware of and with that I think we have

covered everything I wanted to cover um

just going of refresh to refresh my

brain yeah we talked about okay RCU

lacko at least by default uh we you know

R requires no AO termination um starting

the Clusters T takes quite a long time

uh also I think do you want have direct

access to uh the database catalog in the

same way that you know we had it from

from here from the

workpace um let's see if we have what's

this one here yeah so from here for

example we read data from the catalog

like like this right so if what happens

if I copy this code and paste it to uh

our studio uh pretty sure it won't work

but let's let's try that so let's create

new script place it there and Source

it yeah so it's not not working right so

yeah you don't have the same uh direct

access to the catalog as you could from

uh from database okay so some other

limitation to think about all right so

that's all I wanted to cover thanks SN

which is from from two degrees he has

you know answer my many questions about

that the rigs and just to quickly recap

you know going from from the bottom to

the top we talked about compute the

compute tab basically every tab here

right we talk about the compute tab from

where you can modify or create um

clusters and we talked about workflows

like similar to jobs actually R Studio

has something called jobs if you don't

know that you know you may explore the

um IDE a little bit more you'll find

them here in background jobs uh it's

very similar to that um the catalog

which is basically like a front end to

data living somewhere else and you know

that gives you some shortcuts to access

those data sets and then workspace which

is you know very similar to your F

system but with some differences that

require you to learn the fruit trick

fruit tricks in particular there one

flavor of that which are Ros that allow

you to get reos from GitHub for example

or other um posts of um git repositories

and and and do some but not all um gate

actions all right thanks a

lot
