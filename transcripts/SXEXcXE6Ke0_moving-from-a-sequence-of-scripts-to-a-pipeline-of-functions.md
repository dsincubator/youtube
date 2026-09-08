---
type: Video Transcript
title: "Moving from a sequence of scripts to a pipeline of functions"
description: "This is the ds and today we're gonna be talking in one chapter of the book that dedicates how functions as opposed to a sequence of scripts can..."
resource: "https://www.youtube.com/watch?v=SXEXcXE6Ke0"
tags: ["ds-incubator", "targets", "pipelines", "r-packages", "github"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=SXEXcXE6Ke0"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2021-02-09T00:00:00Z"
    usage_count: 617
usage_window: { from: "2021-02-09T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

i'm recording now so this is the ds

incubator

um on the targets package

and today we're gonna be talking in

particular about

one chapter of the book that dedicates

uh that is dedicated to understanding

how functions as opposed to

a sequence of scripts can help create

a sustained and clear

pipeline so

in terms of the sea levels the first

time we met

a wheel then we walked through the

walkthrough

chapter of his manual in a very adapted

way

and today it is also quite adapted but

the examples the basic examples that the

book shows are pretty much the same

my focus today uh is mostly not so much

in like the

kind of all the tricks that targets can

do for us

but mostly on on how we as analysts in

two degrees can

you know basically shift from the

structures that

uh sometimes we have in our projects

which are kind of based on this kind of

sequence of

of files to a structure that is

basically a bunch of functions that we

call

uh and is easier to express

so you will see that in the chapter you

know he does refer to sequences of

scripts

in you know in this way that uh my

might you know be very familiar to many

of us

and how uh you know you can move to

a better place basically at least better

in terms of how

targets uh has an opinion about how

targets

are our structure so let's

jump to our studio the first thing i

would like to show you

is this art folder of the

targets repo so remember we are working

on a repository called es targets in our

two degrees investing organization

and uh in it uh

now i have pushed like a few minutes ago

um

this this version that has um the

materials of today

so in the art folder

i have you know a demo of the structure

um that corresponds to uh

to run an analysis as a sequence of

scripts so let's click on each of those

just to have a quick look

to see what they look like it is very

simple this is

pretty much the example that comes from

the book um

we are not solving any interesting

problem here is just to understand

what we mean by by this kind of

structure

so here for example where the file is

called zero one data

it is supposed to be the first file to

be sourced

um just to be self-contained uh it is

also calling packages in here

so it's you know attaching the tidy

verse and then

it's reading a data set from the folder

data and first you know creating this

little path

and then using that path to read the

data and

and then with that raw data basically we

do a little bit of a

transformation replacing an ace with the

mean

of basically an ace with one algorithm

if you will and finally saving the

processed

output in a new data set a new object

and so i arbitrarily chose a folder

for storing such objects basically you

can think of this as a cache

where you know the expensive

computations um

you know we can avoid expensive

competition by reusing that cache

so that's kind of very manual and we are

not leveraging any

the power of any system in this case

it's like doing it like very manual

so i could source this um file

and that should as an output it should

create

a file here in the objects folder so

just to show you again if you got lost

if i lost you here so

this is the root of the project i have

an empty folder called objects

so if i source this file i would expect

something to appear there basically the

the output

will be a clean version of that raw data

so here you are so i just clicked source

and here is the

data set so just basically to kick off

with the familiar ground we know uh what

this looks like so i'm gonna

move a little faster now i click in r

and i'm gonna just

you know show you a few other uh files

so this analysis

is made up of three scripts number one

number two and number three number two

all it does

is now it takes the input

from the object basically uses that

manual cache that we created

and this that's something on top of that

so in this case what it's doing i mean

the only meaningful line in this script

is this one here

where it is taking the data set that

we cleaned in the previous step and then

applying

a linear model and then again it's kind

of saving

as an output and that's fine so i can

source this

now and i should see my objects

folder populate with a fit rds file

which

is this one here that i'm defining and

finally step three

which what it does is create a plot

for the data set as well for the clean

data

so basically in all this script what

matters is this

so these things that i'm highlighting

here eventually

we are going to convert them into

functions to follow the opinions of the

targets package and see how that kind of

fits in a target's pipeline

but before we do that i would like to

show okay what

you know we could what we would do if we

wanted to report an analysis that

depends on those scripts

we would usually do something like this

you know we create a new file

maybe another file on the root of the

project and we source

each of those files one at a time

here i'm using the function here from

the here package which

is kind of clever about where to find

things and i'm not going to comment too

much on that because that's not the

focus of today but i'm just going to use

it

and i'm not just sourcing the files but

at the same time i want to kind of

create

a report so i want to report on what

those files do

so i'm also kind of calling the objects

that those files create for example the

the

number one uh script creates an object

called dataset so in my report i'm

actually printing dataset because i want

to see what it looks like

so same thing this is kind of a glue a

report is basically a glue

for a bunch of objects that we have

created

in in other files so again i could also

source this file and it should work

basically it's just calling each of

those scripts

and also interesting i know if if you

knew but you can also click here

to knit an r file similar to what it

would

give you if you were needing an arm

markdown file so let's just do that for

fun

basically what that produces is an html

version well you can choose

among other formats pdf and so on but

here i'm just basically creating a

report

from this analysis or this glue

analysis type of our file

so here it is the day of today my name

somehow it appeared i don't know where

it comes from

i guess that's from my root maybe from

here um

so here's my report you know this is the

the result of

um rendering that um

that report looks good to me

you know it's useful i can communicate

my my science but basically i want to

show how

how separate are those steps of

basically creating the

objects that which were created in this

file

in this file and in this file those are

steps that we could do ahead and we

could create you know all those objects

we could save them in the

manual cache that we created and then we

can use those

cached objects and

in a report like we are doing here right

so we are getting

data set feeds and hist so if i have all

those computed i could even

skip the calls to source and directly

do calls to kind of read from

the folder where i have all the objects

created

so that is a little bit uh what happens

in a more formal way with the target's

package so let's move on

to a bit more of a sophisticated way

of of reporting uh you know these

objects that we created manually

so one little app in complexity and in

coolness in my view at least

is using an armageddon file which again

you know you're familiar with this so

i'm gonna just

show you the the bonus of this file

it has exact same steps uh

let's see if i'm using and actually it

looks like i kind of messed up with the

names

i think the one i want to show you has

the opposite

yeah funny enough

i i miss i chose the wrong names for

the different files so the report is

called report targets actually it's not

using targets

and the report that does not have suffix

targets

does use target anyway i'll fix that so

for for the morning forget about the

name

at the top of the obvious file so

basically this is an armageddon

file most of us are familiar with it i

choose the

github document output format just

because i like it that

gives me a beautiful website on github i

set up some options here

just because i like them i'm using

the packages that this analysis needs

uh may you know i think this is an

advantage to using the packages in each

of the script that needs them because

it's more transparent

also instead of you know calling say the

title verse three times one per script

we call it just once in this report and

it's very obvious you know which

which packages we are depending on in

this analysis

so that's it then i'm sourcing

a file called functions uh that file um

just for for an example but also to show

this file called functions has this

helper

function here which i created

to simplify the process of sourcing

every file that lives in the r folder

and

so here we are so i'm sourcing those

functions so i

they are available to me that you know

this call here

gives me access to this custom function

function here

source all so when i run this line

number 33

every file every r file in

in the r folder will be sourced and that

means that you know the objects that

those

files created are now available to these

are markdown to display right so here

i'm

you know i'm using i'm printing the

output of datasets printing the output

of fits and printing the output of

hist so let's ignite this report

so this could be then like to summarize

what i'm doing this is like the second

way

to report um an analysis but it is still

based

on a sequence of scripts as opposed to

to a target's

uh function pipeline so that's you know

our next step

we'll get there in a moment so here's

our report

this is what it looks like it's very

similar to what we saw before

just maybe a little uh a little clearer

and in different format before we did it

in html now we are doing it in

md markdown which then github transforms

into a html

website for us web page for us so now

the third step

um is going to be to take each of those

scripts and transform them into

a function that we can call in uh a

pipeline

so how do we go about that well easy so

basically you know the whole script

let's let's start from here

from the whole script we could go to a

file called functions where we define

all functions and the first one that

we're gonna

uh do is this one here it's called read

and click

but i'm gonna i mean i have it there um

as a cheat sheet in a way but

let me just paste the source code here

so this is where

where we started right and this is

let me clear this up a little bit and

this is with what we are gonna end

why is this shorter well because there

are some things that we need and some

things that we don't need

in a function so here um you know this

path that we have hard coded in our

function is just

an argument to the function right so we

won't

need this this call to read csv

um is there right so it's this line here

so this line

basically what it did it just just moved

there right

and and then the core of the function so

when we have that data set there

then we have this right which is

essentially

this that you see here except that you

know we are not

assigning the result to an object

because you know

r by default will return from inside the

function the last thing

that it's kind of computed inside so

this is

uh you know what kind of moves in here

right so that's the body of our function

and then we don't need to

save it to anything so that's great as

well because we save a lot of code like

each piece

each line of code or each character that

you type in code is a liability

something you have to maintain something

that can have bugs

so you know in this case we we can rely

on

targets to know where to store

that object that will be the output of

this function so we don't need to

say it explicitly and then we don't need

also the the call to library and because

you know targets will know uh you know

there is a specific place in the targets

options where we say which packages my

targets need

so this is how you know we end up with

the function

that reads and cleans the data

and same thing with the other two uh

scripts so

you know this was a script when it was

just a script

but from this the only thing that we

really care about

is this line here when we create a model

then you know inputs and outputs io

are not interesting and they take up

actually most of the code

so our uh where is our functions file

here

our function file just you know takes a

data set

that you know is the result of the

previous

function and creates the model with it

and finally our

third script here um which

you know the interesting bit was the

plot creating the plot

same thing here so that's the only thing

that survives

the rest was just dealing with inputs

and outputs we don't need it

so now with that we have functions that

do the heavy lifting of our analysis so

all we need to do is to

glue them together in a report right so

let's first look at uh but remember you

know i mentioned that

one thing is to create the objects right

so to create that cache

from which then we can pull things out

and report them

in as many workflows as we want so here

for example we have a model and we could

create a report just to explain the

model

and we also create a plot so we could

create another workflow just to report

on that you know plot and discuss it or

we could do one that integrates the two

that's totally up to us

but the creation of the targets the

creation of that you know

those computations that create those

objects that we can then use in multiple

reports

are kind of two different steps so now

let's go to our

you know next step you know getting

closer to targets to the

target's opinion about doing that

analysis

and let's see um you know what we have

here

uh this is also like a refresher from

previous

the previous session which actually i

forgot to discuss what other

requirements for today

uh really none if uh if you

find this informative so i'm kind of

walking through everything

anyway but uh but last time we went into

slower

so if you're feeling lost maybe you

wanna watch the video

of last media how did i create this file

uh when i use the function from the so i

did first library targets

because now this file is a very formal

file

that targets requires so once you know

we are using the targets package then we

have access to all its functions

and is this function called target start

script

that will create a script with a toy

basically example and that is exactly

what we walked through

last time um then you know you could

also use the function tar edit

that will open the file that you're

looking at right on the screen

so i started from there but then i you

know

tweaked it a little bit to be the actual

pipeline that i want to i want to you

know analyze or want to

communicate my data science with so

let's let's

briefly review the anatomy of entire

file so it is

a call specifically underscore

it must leave in the root of the project

and

basically you start with a call to

library target so all its functions are

available to this script

then you there is a section where you

refer to anything that is global

so for example the functions that live

in the folder are in the file functions

so we want them here so this this file

has to have access to them

they are global so they should be

available in the global environment

of the pipeline so that's why you know

we we put it here in this first section

also um i want to um

so in this particular case the file

functions has um

also the the pipelines there but if they

were

in in separate files as they were before

and remember that the our folder has in

a zero one zero two three three

you could also do something like this

you know

i used that function i created that

function source all

that you know on one go so just every

function in

every every r script in r so that's that

would be a global that

would also go there thank you jackson

and then also global is

in this particular case you know i

decided to make

uh then the when we attach the tigers

it's very verbose so i'm saying hey

be a little quiet and that ends with

this

section of globals and then we have some

options

that are global but within target so

basically everything that we pass

inside the function entire options set

will be passed to every single target in

the pipeline

which are these ones here at the bottom

right

uh we could also set specific options

inside

each target so you will see that you

know the function tire underscore

targets

this is a review again it also has for

example an argument you can pass

packages specifically to this target but

in this particular case we are passing

all the packages to all the targets and

then

finally we have actually this you know

the the the targets themselves so every

target's file should end with a list of

targets

and this is how we are using now the

functions that we

uh we define uh so what we're doing is

uh first we i think this is

new we didn't see this the last time and

when you are using

a file that is stored in your system in

this case you know we want to read a

file that is in the data

folder this one here so

the very first target in this pipeline

what it does

is it looks into that specific

path right data raw underscore data.csv

and basically creates a target that only

contains a path

so this this is what this particular

target is doing

and we have to say this argument that i

don't think we saw last time you have to

say

formal equals file and there's gonna be

a meet up

pretty much dedicated to this idea of

reading files and also to create

a markdown reports so for now i just

want to give a glimpse to it but i'm not

gonna

dive very deep into it and then

the other targets basically you have one

target per step

remember that we had before the first

step was to

read and clean the data and

so this is the name of the target you

may remember from last meet up that

every

call to time score target starts with

the name of a target

and then an expression so in this case

the expression what it does

is uses our function the function that

we defined as

read unclean and which data set it takes

well it takes

sorry which path it takes it takes the

path that is defined in the previous

target so this name

comes here right is used there

and now the final two targets now we

want to fit a model

so we are going to store the object into

a

new target called target fit so this is

the name

and the expression is a call to the

function that we define

and the data set that we pass it is the

dataset that comes from

the target defined before and once again

we it

we repeat the process now now we create

a histogram

we call that object target hist

and we use the function create plot that

we created

and the target that is the input of that

function

is the one that we defined you know two

steps

above so with this i'm ready to do

something like

tar make right

it's probably going to say that all the

targets are going to be pretty skipped i

guess if i did run this before yeah

so it's saying that the targets are

going to be skipped because i already

ran

the pipeline before and but if you

changed

anything that each of the targets that

you change

will be out of date and will be

recomputed

so for now i wanted to also review some

of the

coolest functions like target

this network and i will show us

a visualization to understand how the

targets are connected to each other

it looks like messed up with something

here

no idea what's going on

interesting

oh doesn't look good at all and also it

looks like he doesn't wanna

restart maybe i'm gonna just kill this

and it's also a moment i mean it's

likely we're kind of close to the end

not quite what i wanted but uh

we can do the round of voices

now probably while

we bs started while we

restart that so the only thing

let's see if i can record from this

quickly i'll push it for

actually now we have to be finishing

anyway so the last thing i'm going to

show

is the report that uses the target so

the targets are

have already been uh computed so if i

wanted to use the targets in another

magnum file

uh it is fairly straightforward

in this case i'm calling the function

tar make but if they are if you know

they are already done you don't need

that

and i'm attaching the targets package

in this case i'm calling tar make and

then i'm just using the targets

with just by calling for example a

function type read

we discussed it last time to read each

of the targets

and report on them so if i create if i

need

this file

it's rendering now i'm gonna show you

the output and um

we start with a round of voices here

there you go

so this could be a report crea that uses

the power

of of targets there is a better way to

render reports actually using targets so

you

basically rendering the arm down reports

inside the pipeline

but that's something that's going to be

the topic of another meet up

so just a quick look to see what this

looks like

you know the reading the targets data

and just printing it there

um exploring the structure of the

fitted model and creating the plot

okay that was all that i

have for you today uh so i would like to

ask

a quick round of voices um to see if

there is any question

or comment so i see jackson first in my

list

so i i kind of see like

um obviously this is useful if you have

a large

project and need uh the

or don't want to rerun the entire

pipeline in every instance

um but i'm wondering like at what scale

a project like this starts to become

starts to make sense

and also in particular like what size uh

of data sets or you know you know what i

mean like

i feel like or or if there are still

benefits to structuring a project

like to going through the headache of

stretching a project uh like this

um if uh

you know if the pipeline doesn't

necessarily take that long to run and

the data sets are relatively small

and uh especially tdi like if we have

different

kind of use cases uh when it makes sense

to maybe try to implement this 1.1 maybe

it doesn't

yeah i agree um yeah i think that will

has in the beginning i think when he

started with uh drake uh he was kind of

selling it

in a different way but i think that he

settled to to say hey

if you're not doing long computations it

makes no sense kind of

that's my my impression probably we're

gonna discuss it right now with him too

um but yeah i think it's a very

interesting uh pointer to bring up and

probably one

that makes these meetups useful in that

even if you decide not to use it it's

uh i guess that is something useful too

um

alex

um not too much to add i think that

in addition to anyone who's doing long

computations

targets is still useful for anyone who

is doing

repeated computations doing the same

thing over and over and

over again um because it does change

your mindset

to think about the workflow rather than

oh i i just have this script so

good point i think that it something

that i'm still

very uh beginner there is

the power of something that he's calling

dynamic branches and static branches

that allow you to express

extremely large number of processes

in a very extreme way so something that

i could probably explore a bit more

cj i mean just on this

last bit these tar read functions

um so my impression is that like if you

made an

rmd of report like this that

ideally that would also be part of your

target's uh workflow

um so that i wonder if like

this this is really like the the uh

recommended

use of these like tar read functions i

thought that they were more for the use

of like sort of debugging in the process

if it stops in the middle rather than

like i'm creating reports i thought that

reports were intended to be

part of the actual um target script

itself

yeah um maybe i misunderstood it i am

i will focus on on the chapter about

producing um reports um

i'll dig deeper but my understanding is

that uh

the you know the recommendation is to

knit the report inside the pipeline

using actually a function that comes

from another package that is called

archetypes it's called tar render

but i think that within the armada file

my understanding was that it is it is um

the way to actually you know pull those

targets is to just call

that read or tell but i will i'll come

back to that um

when when i cover that so thanks for

kind of maybe exposing my

oh my god there in understanding claire

uh yeah cool thanks mara um yeah i like

how similar this

this example is to the real uh pacter

case that we've got in front of us um

yeah i guess a question maybe this is

back to what cj mentioned last week

about this idea of when when does the

sort of case reset

on parameters you know just to make

absolute sure that if it realizes when

you've changed your parameter but um

maybe that's just a bit of a rookie

looking question here

otherwise yeah cool thank you

learn more about that and share the

insights yeah i'll show probably some

examples

i don't really have anything to add um

was quite interesting

uh but yeah i think like

many good questions were asked and i'm

looking forward to

hearing some some answers uh yeah thanks

antoine uh yeah

thank you for all this and

me i'm not sure to understand about the

alex question about the

repeated i

can't see how it helps to

for for people who will use it

repeatedly

to use package for now that's something

a bit unclear for me

for now maybe if you can

we explain how it could help

yeah yeah i think bro yeah alex go ahead

i think alex was uh

yeah yeah um

so really it's moving from a mindset of

i have this one big script that does

everything and maybe i jump around in

different

part of the script from here to there to

try and get

different things to work um

instead you're moving to a mindset of

i make one thing i know that thing is

correct

and then from there i move to the next

thing so it's

the the step-by-step process

with with the check at each step

okay okay thank you i understand you

know because it is a new framework it

may take some time to

digest but it's great you know to have

this conversation so

i can also plan for spending more time

in one or other aspects of the

silos and last person monica

yeah i don't really have anything to add

i think it's a nice way to

think like to think in this way and i

agree with alex

that um it's useful because then you

have like this contained

parts of your projects which is cool

all right thank you very much sorry went

over

four minutes see you next time

thank you
