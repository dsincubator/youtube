---
type: Video Transcript
title: "wtf: Name and organize files"
description: "welcome again to the ds equator today uh  is  the last session on the topic a holistic  workflow we are still covering the book  what they forgot to teach you a"
resource: "https://www.youtube.com/watch?v=xW05GsfhuiY"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=xW05GsfhuiY"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

welcome again to the ds equator today uh

is

the last session on the topic a holistic

workflow we are still covering the book

what they forgot to teach you about r

and

the very first section of the book talks

about this idea of working in a way that

is oriented towards projects

and from that series um

the only two topic of the only two

topics that i would like to really cover

are the last the previous last two here

uh how to name files so that they order

nicely

on your default you know kind of files

browser and also so that they are

readable for humans and also for

machines

and then secondly you know how to

organize the analysis itself like the

project you know what it could be there

a good internal structure of the project

so you can

find things easy and and some some other

person can also find things easy

and finally there is this this topic

that i may leave out and some tools

that are precisely designed to

kind of automate um some of these

workflows but that's that's a fairly

advanced topic and for now i want to

focus on the minimum things that we need

to all know to work effectively

so i want to i need to do some

you know to prioritize topics so that

might be out

so the

next

meetup

will make a pause very likely this is

still to be confirmed but we have a

guest and it's going to be

a topic that is not related to this uh

idea of the book

and then we will resume the series with

a few more topics uh that are a bit more

technical but you know

um

when when you walk away today you will

have um in this series you will have

heard about the most important things

about um about r that are not typically

taught

and that

can

improve our workflows considerably and

then the second part of the series after

the one

next time

uh is going to be about things that are

important but probably not the ones that

are the most important ones um at least

not when you start

so

the rest of the meetup is going to be

mostly

interactive but first i want to do a

little glimpse about about the things

that we're going to be talking

and then kind of demonstrate them so the

first

thing i would like to talk about is how

to name files and these ideas come from

jenny bryan she has its link here as you

can see

she has a really good presentation about

this topic i'm going to make this a

little bigger

so the first thing

i would like to do is here in a group

um kind of talk about you know

why

these files under the heading no

might be bad names for files

and then while the files

under the heading yes might be better

options

so how about

how about this one here like for example

the second one joe's file names use

spaces and punctuation.xlsx

well that's kind of trivial maybe but

anyway

everyone would like to break the ice and

tell me what you think about that fine

name and why it might be not a good one

just go ahead don't need to to raise

your hand

right concerns

there you go what

[Laughter]

so i heard spaces take up more memory or

something number one number two um

like depending on the language

there might be errors on how the name

the file name is read

i don't know

right the i didn't i i didn't i don't

know about this the the memory

but certainly the spaces um are not

uh interpreted the same way in different

platforms and i have and some programs

just don't like them like for example i

remember a program in our studio where

people couldn't see

couldn't see files or the the session

would crash it's like something like

really bad

because the path to the project their

studio approaches that they were working

with had had spaces

and like for example

a username in your computer that has a

space is a really idea or like a 2d a

two degrees symbol in a name is a really

bad idea like our you know horrible

dropbox folder name

unfortunately

about how about this one here like the

last one

contains

look how it contains the string they let

this

and your career is over

how easy it is to find that information

in that file at first glance

not very easy right and what's the

reason why would that be i mean why the

whole thing could be a bad about name

what's what's what's one of the problems

there

the punctuation specifically the parent

and the at symbol and the star are all

really problematic with trying to deal

with file names programmatically

that's a pain how about the semantics of

things there so

it looks like you know there is

information there that is trying to warn

someone you know using this file this

project that this file contains very

important information and if you delete

it you can raise over i mean you really

want to not delete it but you know you

scheme you schema like a project that

contains that file is it easy to

to kind of read one to see that

information like right away is it

obvious that that's a very important

file or is that

not

not so easy to see

go ahead whoever throws their hand

yeah i also see that there's some pretty

weird like characters in there and since

it's super contextual to our

organization i'd like to mention like

also putting the degree symbol and

others things like this

in a file name as often as that as we

all probably know all too well

exactly so spaces other symbols are

horrible and here what i wanted to

highlight with this file name is is the

readability like the file should be

readable for

machines of course and that was the

prime for example with the file name

that contains spaces because some

machines just cannot read properly and

then you know it just failed to

to read the file but then also humans

right so if the file contains very

important information if you delete it

you're gonna read it's over you want to

to just write that in a way that is more

readable like you know mushy smashing

all the the words together you know it's

not very readable uh

bring that information around a bunch of

you know other you know

characters and in particular symbols is

like again makes it even less readable

so readability for humans is crucial

readability for computers is crucial

uh and what else i think jenny here

wrote some some principles yeah machine

readable human readable and plays well

with the ordering of things

so notice how the yes section contains

names that are different

and in that for example the symbols they

contain are pretty

um

[Music]

pretty friendly for computers like this

these hyphens and these underscores

are very fine and computers can't read

that also jenny encourages people to

separate some the semantic components

also all the the them yeah the semantic

metadata components in the file name

by underscores so for example if you

separate something with a hyphen that

all belongs to the same

to the same metadata component so this

is all a date right but then there is an

underscore to separate the date from

other kind of information like to the

right of the underscore she writes you

know abstract for sla so after for sla

the whole thing is one thing is one

piece of metadata so that means that you

could also write a program that knows

that okay every time you see an

underscore separate the string and then

you can recover metadata from the file

name

uh

and then the sorting like for example

figure zero one and figure c would

figure i'm sorry figure zero two

those files will sort automatically one

on top of the other in a meaningful way

um

by just any default file browser so

that's also cool and then in terms of

the date here i like

what's going on like why

uh why are we putting here for example

not you know the not the the day first

or the month first

in the date so there is

when you sorted files in

exactly right so the the genie has a

really nice slide that says you know the

comprehensive map

of countries that in the world that use

a month

of the first component of the date and

that's u.s and i think it's american

and a piece of of canada

so i mean if you think the entire world

uses dates as you use them

you're likely wrong so

there is a convention that you know this

format for the day where you first put

the month the year sorry then the month

and then the the day

as cj says not only sorts nicely but

also it's like an international

convention that um that everyone can

agree on

it has a it has a number iso something

maybe someone knows it here

i don't know the number one

it's also like the order once i go so

not only the switching day and months

like americans like to do which is

terrible

but also like in this format i think

what is common at least in germany for

instance is day month year but that is

also like unfortunate for sorting

because then you get like everything

that's was on the first month of the

year sorted together and then everything

for the the second day of the

months of all months together so if you

put largest

thing first and then increasingly less

things

less large things then you get good

sorting

exciting yeah

okay i'm going to go back to the faces

someone raised their hand that is

who is that one you can't see them go

ahead

oh i just posted a link

in the chat oh cool awesome

this click here for a second so it's

recorded there you go

okay back to the slide um so this is the

topic of names i'm gonna demonstrate uh

in a moment um

how that applies to a project and then

the other topic i wanted to

first glance and then kind of um show a

live demo for is this idea of how to

organize projects for uh for a data

analysis so there is uh

there is a really nice figure that the

tigers team has been kind of pushing

forward

for for a while now

that shows the different steps here in

white of the data science kind of

workflow where you first kind of import

some kind of data you tidy it you

transform it in some way and then

usually you visualize it with figures

maybe you create a model maybe you need

to iterate that into that loop again and

transform the data a little bit more

visualize it again and you keep

understanding your data and then you

know you communicate your findings in

some kind of report

so that that is like a very generic

workflow and now you know you can design

your

your project

structure you can organize your project

in a way that you know maps to

that very generic workflow in the data

science world

so when it comes to code and this figure

is about code usually you know

when you import data sometimes you just

need to have a feel for what the data

contains so you know jenny um you know

writes this has this file called smell

test like a small file where you just

explore and the output of that is just

the wisdom that you gain from from

exploring the data

then uh you know

at the stage of tidying the data oh yeah

you need you need some code to that data

so that you know the tiding process is

also reproducible so she she has a file

called wrangle.r where she does all that

stuff from you know going from the raw

data to to the data that is actually

then going going to fit the rest of the

analysis

then

if you need some code to visualize

the data then okay you can have a file

that does just that and if you need to

create a model to you know for example

understand this relationship between two

or more variables then you can have

another file called model.r

and then when you're done with that

you need to kind of

glue all these pieces together uh so you

can write a report and a good platform

to do that is an art magnum file so she

has this file called report rmac now so

i'm gonna continue to the next slide to

show you know how that relates to data

sets

so

i mean before what we saw is code and

now what we're seeing is kind of inputs

and outputs so the the very first input

is always the raw data you know

sometimes it comes from you know from

excel spreadsheets so it might be an

excel file

uh then you know after we wrangle the

data after the stage of tidying the data

we the output of that would be as a

clean data set something like data dot

csv would be a good place to store that

that data set

then the output of of the figures that

you create you know if you're going to

store them somewhere you may save it in

a folder called fix like figures or

something where you have enough figures

inside figures you have a histogram

uh in png format and you have a you know

like a dot fi a lot um

um a points um

a scatter plot

scatter plot thank you

png file so that that would be a

meaningful place to put those figures

right

and then the models you know you can

save the entire object that contains the

model you know the fit to the data and

you can save it as an object in rds

format

and this ests maybe someone here some

analyst is more familiar with that i

don't know what that might mean

you can also save that apparently in csv

so

we saw the code we saw the inputs and

outputs and and jenny put together this

little table that gives a at a glance an

idea of

of uh

of all of that so a

input the very first input is raw data

you have a little

r code you may call it

smell test and the output of that is

just with some

the raw data in some other file you can

put it again and you actually wrangle it

and and the output of it is clean data

set you know like data.csv

and and then so on and so forth so here

this table summarizes the two figures

that i showed you before

so now what i would like to do is go to

our studio and and try following jenny

bryan's uh suggestions and then add a

little bit more structure through

folders so sub directories of the main

project directory

and also because you know i realized

that you know i haven't covered like

showing how you actually create on a

studio project i think so i'm gonna do

it uh i'm gonna do it now uh but before

jumping to the demo do we have any

any comment uh here on the

in the group

questions

okay this is now about the time when i

you know someone

reminds me that we are close to the end

um so the rest of the meetup is going to

be um you know a demo and pretty much

interactive so

let's

like open the floor for you to stop me

and ask questions at any time

unless there is more than one hand you

can just just speak up

okay uh so

as you can see and this is like a review

of the whole series so far and you know

the top right of my r studio ide

shows project none so that's not a good

indication

uh you know we want to work in projects

uh we want to work in a project oriented

how to display a project oriented

workflow so the first thing we do is we

create a project if you do like

um

pointing and clicking you can come here

and you can create a new project from

here or if you like uh to type things as

i do i know you can use the use this

package to create

a project and then you know you create

it wherever you want i uh but you know

generally it's a good idea to to

dedicate to have a dedicated folder for

all your

projects um in my case i i you know you

said inside the

i used a folder called git because all

my art projects are always tracked by

git

we haven't talked about it yet you don't

need to know it uh

um out of this series but uh

maybe we're gonna cover it um later on

the series and there is uh entire series

about that already in the ds incubator

so i'm gonna give the name so inside the

git folder that exists already in my

computer i'm going to give a name to

this project let's say a b c

d

so that's going to be my project

so our studio now is going to open the

project i have just created

and you will see already that there is a

tiny bit of structures that the the

default projects already come with a

folder called r suggesting that it's a

good idea to put there anything that is

our code

and so the other thing

or at least two things that i am i like

doing in every project is having a

readme file and again you can use the

use this package to you

to create a readme file you can use use

readme rmd

so that calling that function will open

uh create and open a new file as you

call it readme so that file will you

know

have some data already in its

information in it where it says it

prompts you to type you know what's the

goal of the project and then a bunch of

other things so i would just remove that

and explain the goal of abdc is to show

how to structure

a

project

nicely

so just a high level uh of what of what

the project does and here you could

insert code

so that readme

and the project structure is the minimum

things that i i would think every

project should have

and but now i'm going to

and then you know you could follow the

recommendations of jenny to create the

files that

and folders that she recommends but um

using the prompt that we got here from

creating the project from scratch where

there is an art folder there i'm going

to kind of show um

default the subfolder structure that you

know i recommend to organize your your

project even better

so let me close

this abcd project

and instead close open another one

remember that

using an ide is a good idea

when it comes to managing projects

because and it allows you you know to

close the project open another one and

do a bunch of things like for example

now i'm going to click on abc which is

another project that has a little bit

more structure so it's a bit advanced in

the

in the ideas that i want to transmit to

you so i'm going to

use the r studio ite to to go to a

recent project the one that you are

looking at here

where um basically i have a bunch of

problems in this project that i would

like to fix um to fix with you together

so this project follows the um

recommendations here from from jenny

except that has a few problems that

we're gonna fix together as as a way to

review you know what we're covering here

today so for example we have a smell

test file

and one thing that this file name has

that is not very good is that the

underscore

is separating two pieces that belong

together so smell test is you know

is a phrase but the two components the

two words smell and test you know

refer to the same thing so i think that

a better name for this could be smell

hyphen test i'm going i'm being very

picky here right but it's just an

opinion and this is an opinionated way

of creating your projects um so opinions

are fine you may have your own and

develop it

father another thing that i like is for

my files to always use lowercases so

that i don't need to remember if

something is lowercase or uppercase i

just know that i always use lowercase so

there's no confusion there

i also have the wrangle file but then

there is no ordering here um so if this

mail test comes first i think it's a

good idea to first call it zero one and

underscore to separate this part of the

metadata to this other part of the

metadata

and then wrangle could be called co2

because it's something that i do after i

smell test the data so something like

that would be a little better and now

you know already i can see how the

the ordering of things are are good so

the number f the your three make fix is

good so

let me sort the other way so i have

yes

uh just a real quick note to everyone um

as a group we need to come to a

collective decision on case

and

file names

i would strongly encourage everyone to

only ever use lowercase filenames

the reason for that is

some operating systems

uh

use case sensitive file names some

operators do not

and some operating systems are

inconsistent even with themselves so for

example

um

if i try to open up zero one spell test

dot r but with a capital s and a capital

t um

it would open

the file that's listed there on my mac

unless i had a different file with that

same file name with capital s and

capital t

and then it would open the other file

instead

um so just always using only ever

lowercase characters is a simple way to

not have to deal with that problem

thanks a lot you know i

um

yeah i love that

i love that so these three files are our

files so it's a good idea to create a

folder called r um and stick them all in

there

so once i have the folder right there i

can just in our studio i can just click

these three five names

and then more i can move them

to

r

so slowly this project is taking a

little better shape

when i do that i also notice that there

is a really ugly file name here it has a

space so let's rename it uh raw data

let's call it raw hyphen

data

um also in in our packages in particular

you will see that the raw data goes

inside a folder called data raw that's

that's kind of a convention it's not

compulsory but

it's nice

to follow conventions it makes life easy

because you don't have to think too much

so i would just move that file to to

there like data raw

and

what else do we have

we don't have data yet because we

haven't wrangled the data yet using

these scripts maybe another place that i

would like to

and i follow i already have and then i

would probably stop there is

um reports so

reports vignette articles to me they are

all

kind of different names for the same

thing

so basically a place where

you know you glue

the different parts of your analysis

and you derive some with them from it

and the reason why it might be a good

idea to have a folder is because you may

not have just one report for a single

project so in one project you know with

one data set you can you can create very

many different reports

so this is this is taking shape um so

now maybe in in my readme file

i'm going to run this file

and also show a little bit the structure

of

of readme but also in general this file

is also structured as any other report

good so when you have you know like a

meaningful title in our map now you can

create a first level title with uh you

know like a hash and a second level

title with two hashes and a third one

with three you get idea

and then uh you know the

high level goal of the project and then

it's very common that

you would see first the packages that

the project uses or that this particular

report uses so in this case just for

demonstration i'm using the fs

package and then any code generally

first you start with you know loading

functions if you need them and then you

know the actual analysis code so fs

has a function called dear underscore

tree that shows the tree of the

directory so this report all it does now

is to show you

you know what we have accomplished so

now a project that was a bit of a mess

to look at now is organized in a really

nice way so in our folder we have files

number one two three that you know

suggests which is the order in which you

should you know you you do those steps a

smell test first a wrangle uh stage

where you you know transform the raw

data to actual analysis data and then um

maybe a third script where you actually

you know create some plots

the rhythmic file is always at the root

and when you push that to github it

could look really nicely

it would be like the first page of

them

to here i haven't rendered it but you

will see a really nice

um report produced just like the one

you're reading here you know that will

appear as the first page on github

and and then well the the directory data

raw that contains any raw data from

there you read the data sets you wrangle

them and then you stick them into the

data folder which i don't have here yet

so let's create it

so in the data folder

uh there is where i could put any

processed data and where i would process

the data well i would process it in the

wrangle file so my wrangle file looks

like something like this i need to you

know create first you know use some

packages for example um the package read

excel and then i would use maybe that

also use the here package you know we

talked about that

i know it's very close to the end and

i'm going to create a path with here the

path if i do quotes and press tab i

already have the opportunity to navigate

inside my project so let's navigate to

that row and then hit it tab again and

how to complete the the path that exists

there so that would be my path

uh so i can now use that path so the

path looks like this so i can

just read it with a function read

excel

and that will produce the raw data

here we are sorry the raw data so the

raw data uh looks like this

let's make this a little bigger

so now say that you know wrangling the

data for me means

i don't know maybe i want to change the

names to something more descriptive and

call it you know the names

speed of speed

and this i want them speed and distance

for example so now my clean data is

uh

you know

now i change the names to that and that

i can call clean data basically right so

now i write the clean data and i'm going

to write it with

the radar package with write csv

so now i'm going to use the reader

package so i'm going to put it here

and i can remove now the namespace from

here and i'm going to again create a

path with

here uh it's gonna be inside the data

directory i'm gonna call it uh data.csv

so that will

or should

[Music]

ah because i forgot to tell which data

set is the one i want to save

so

this could be it

data

say the data here so now if i go to my

so this could be my wrangle

file so if i go to

readme

and this is going to be the end of the

meetup if i run this file again if i

need it by pressing here the report that

i produce with this rhythmic file

now shows that

inside the data folder there is a

data.csv file which you know more

closely follows than jenny ryan's

recommendations

and okay so that's the end of what i

wanted to show do we have any parting

notes comments questions

okay then thank you again for joining me

um

in this um the end of the first part of

the series next time again we're gonna

have i think a guest if the guest

confirms uh and then we're gonna resume

with uh some more technical aspects of

uh what they forgot to teach you about

thank you see you next time
