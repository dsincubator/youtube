---
type: Video Transcript
title: "tidy EDA: Defensive workflow"
description: "so  today we start a new series of the ds  equator and it is going to be about how  to explore your data with the tidy verse  um  as usual there is now a reposi"
resource: "https://www.youtube.com/watch?v=YlBnarQNRR8"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=YlBnarQNRR8"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

so

today we start a new series of the ds

equator and it is going to be about how

to explore your data with the tidy verse

um

as usual there is now a repository

associated with the series it is called

ds.tidy

eda for exploratory data analysis

and

well the goal is as i just said to know

how to explore your data the focus will

be on the more analytical side of things

not so much on the tooling but to tools

you know we need them to actually get

where you know to get the answers from

the data that we need to we want to

answer

um and the idea is that at the end of

this series we will have um

you know knowledge about how to explore

the variation for example within one

variable in your data set

and we're going to be doing that with

ggplot 2 in a visual way and with deep

player in an analytical way

also

how to

for example explore unusual values and

missing values

and then you know beyond one single

variable you may have questions about

well how two different variables relate

to each other so we're going to be

exploring also co-variation between two

variables and then you know that you

know variables come in different flavors

so some variables are maybe continuous

some variables are categorical so how do

we you know explore co-variation between

say two categories we call variables or

one categorical and one continuous

variable so those are all very

analytical and very general questions

that have very little to do with the

tooling so hopefully

after this meet this series you will

have kind of an expanded

an expanded view

and more general view of you know what

it means to do an exploration of your

data

and um and also we're going to be

talking about patterns so some variables

you know have a pattern and we might be

able to extract that pattern with the

model and then see what what remains

to see if you know the pattern can be

explained by a model or not

so what's important about explority data

analysis is that if you are in the world

of research so if you are not

researching yourself

then you know the explorative data

analysis will spark questions in your

head that you didn't have before you

entered that process so it's a very

iterative process um and something is

you know the process itself is like a

tool for thinking for refining your

thinking

uh but also even if you are not doing um

if you are not the one creating the

research questions and those questions

are kind of delivered to you still

exploratory data analysis is useful for

example if you manage data because you

will always need to understand what's

the quality of your data so explorative

data analysis will give you a systematic

approach to exploring the the the

quality of your data to see if

what you have there makes sense or not

the

the syllabus that i'm going to be

working with basically is walking

through the chapter 7 of the book

are for data science and that book

that book chapter has some prerequisites

so that as i said you know it's chapter

seven it's not chapter one so by the

time you hit chapter seven in that book

you already

should have some basic understanding of

like a workflow you should you know

already have you know your r studio set

up correctly

and you should know at least the minimum

of d player and g plot so that then you

know you can use those tools

to understand exploration of your data

and not so much you know your focus

shouldn't be on the tools themselves

that should be on the analysis side

but uh but this meetup

series does not assume any of those

prerequisites

so my goal today

is to start talking about those

prerequisites so that you know by the

time we actually hit chapter 7

in that book

we are all kind of on the same page

does anyone want to make any comment

here uh us up to this point

okay good so what i thought then

we're not supposed to be seeing your

screen right now oh shoot okay uh thank

you oh yeah you know one of the many

things i for usually forget

uh entire screen

yeah i wasn't intending to give you the

show on my face so um

maybe what i

have to highlight here is that this is

the name of the repo ds dot title eda

for tidy verse or exploited analysis

with the tidy verse tidy exploration

data analysis

and we are going to be here today

talking about the prerequisites and as i

was

basically developing the syllabus for

today

i realized that a lot of what i would

love

all of us to be on the same page of has

to do with what i would call a defensive

workflow so you know what do you you

know all the things that are around your

analysis and not so much your analysis

so i think it's good to get all the

things out of the way you know as early

as possible so that then we can actually

talk about exploring your data but

all those things around your analysis

can create so much friction

that if you are not on the same page

there

very likely you will have a very

frustrating experience

and this is the kinds of things that are

very rarely taught

when you talk about you know data

science or when you're taught about r

and all these things are related to

workflow that sometimes don't even make

it to your script itself you know it's

things about setup and you know

philosophies about how you should write

files and paths and things like that

so

um

with this uh i also envisioned this the

following structure for the series so

today um i think that you know what

we're gonna be covering today is so

important that uh even if you you know

never join any other meet up in the

series um you know the contents of today

and maybe if we overflow a little bit of

next meetup

will be useful for themselves because at

least you will know what a good you know

defensive workflow looks like

and

so that means that you would have a good

stopping point when we finish covering

the prerequisites for the for the series

then uh we're gonna kind of jump in into

the actual exploration analysis and then

you know if you want to really learn

about that you should stick to the end

of the series um but yeah so first exit

point for this series is you know

whenever we finish covering the

prerequisites

i i don't think it's going to happen

today because it's it's it's quite a bit

and it's quite important

so i want to make sure we have time

um for questions and comments about that

okay so the idea is to overview

the the elements of

a defensive workflow

and also i'm not going to be expanding a

lot in each of them because it would

take a long time but i do have very good

resources to learn more about that to

recommend you so if any of that doesn't

quite make sense and sounds like

arbitrary okay why mario is telling me

to do this or that

i won't be able to explain now i don't

have that space but i will give you

links for you to kind of educate

yourself more

and then see if you know if you agree

with the practices that i'm going to be

recommending here

hopefully i'm going to be also

introducing our mcdonald documents which

is a great way to intermingle code and

pros um also i'm gonna be talking about

what is the data science workflow in

general the the different parts of doing

what that science and what tools

i'm gonna be talking or we are going to

be using in this series to basically

tackle each of those steps in the data

science workflow

and then the two main tools we need to

zoom in into them a little bit uh which

are a tool to you know create graphs

which is tg plot and there's a little

template that you can reuse in all your

plots

we're going to be talking about that and

finally a couple of verbs in deep pliers

of the players is in our package

basically a collection of functions that

are available to you um through that

package and and

there is a ton of function in that

package but at least if there are a few

very few that are used in this series

and so you know hopefully i will give

you a little bit of of a flavor for you

know

you know what they are and how you can

use them and basically how you can

compose many simple verbs to create a

more complex

data analysis pipeline

okay let's jump now

so that was the sea levels let's jump

now to the contents of today's meetup

itself

so for you to know

as i said before there is a repository

uh two degrees investing uh called

ds.tidyada

that contains all the materials and each

meet up has a folder so folder of today

is zero one underscore prerequisites

so in that folder you'll see a readme md

file which automatically shows here on

on your web browser

so this is what i'm going to be talking

studying now

before we actually get there anyone

wants to make any comment or question

right now

okay

the

idea of the fancy workflow is what we're

going to be talking right now the first

thing i want to

mention

is that we're going to be using

our studio uh that's you know what i

assume you are welcome to use any other

ide any other uh

um

interactive graphical user interface uh

but i'm gonna be using our studio so i'm

gonna pop up our studio

and let me close

this project

just to strike see more or less what you

might see you might see something

like this so r has started and

let's make this a little bigger there is

a bunch of panels one for r

and here i could create a new file this

is where the source code will go so

first thing we're going to be using an

id using an id is very important because

it helps you

uh work very efficiently in other in in

to do things that if you work in just

plain text in a text file and not use an

ade you will experience a lot of

friction now our studio by default

doesn't come with the greatest

defaults because it inherits defaults

that come from r so there's only so much

that our studio can do

to

provide you with a workflow that is

ready for success without being in

conflict with r so r has some defaults

that we need to kind of overwrite to

create a defensive workflow basically

and the very first idea is the one

written here that you should start from

a blank slate every time that you

restart r unfortunately our by default

will tend to

save your working environment your

working space and we'll try to reload it

when you restart your r session and that

is a pretty bad idea it causes a lot of

a lot of trouble it makes your research

and not so reproducible in many times

so the very first thing that we need to

do and is

make sure that you start from a slab

from a blank slate every time you start

r and there's um

a couple of ways to do that

uh so i'm gonna go to our studio and

show you the one way

the few ways that i like doing it so

this is the kind of thing that you do

only once and then it's set forever so

in our studio a recent version of our

studio includes what's called the

commands

navigation bar or the commands panel

which you can access with shift ctrl and

p

and this

allows you to start typing keywords

and access commands that would otherwise

require a lot of clicking so this is how

i like doing that so now for example

here i type the words that you know you

will you will find

in that navigation bar so if you start

typing save workspace there say

yeah

i was going to point out that we

couldn't see your r studio but now we do

you can now oh that's weird

uh okay so now probably because i

switched windows okay cool thanks uh so

if you start typing

say workspace you see already

that the second one here is say

workspace on quick which exactly matches

this you know the the phrase that i

wrote here so you have to make sure that

it says never

another way to access this thing would

be to go to tools

global options and in the basic section

the one that you get right away

here you need to say to ensure that when

when where it says say workspace say

never the default i think is always or

ask but you have to change that to never

the other thing is that this box should

be unchecked so if you go to the

to what i wrote here load workscape

workspace onstart uh that

you know you again you can use the

the navigation panel with shift ctrl p

if you want and paste that um that will

give you this it should be to off

um

right and another way yet another way if

there is a package called use this so

they use this has a function called use

blank slate

and you can decide if you want

to set that

type of defensive workflow for your

entire project

or

sorry for a single project or for your

entire user so for every single project

that you use i think that if you say

nothing the function will somehow prompt

you to

you know will tell you what you should

do it didn't do it here now because i

think that i'm already using a blank

slate so once you do that you have to

get into the habit of restarting your

art session a lot there is a keyword

shortcut for that but also you can find

it here in session and also here you go

you know session restart r

one good way to get there is also with

the panel again shift ctrl p is the only

keyword shortcut that you really need to

know you can start now restart

r and there you will have

uh you know if you just hit enter there

it will restart your rc session so the

combination of that setup that i have

just explained plus restarting your your

r session

sets your project in a way that every

single time that you run your script

nothing around your script is going to

contaminate your results meaning that

anyone else could reproduce what you are

you know delivering in exactly the same

way so if you have some object that is

saving your computer only and that

influences the result then someone else

trying to reproduce that result that

does not have that object set in their

computers then they will have a

different result or they may just not

even be able to run it so that's why it

is so important

so that's the very first thing um

we covered this part

here the other idea is the idea of

project oriented workflow so notice that

each of those headings here are or

are highlighted

as hyperlinks so you can click there and

read more about them there is a whole

book chapter talking about that idea

uh so i'm not gonna

explain it in detail you can read on

your own but i'm gonna tell you how you

can actually do it so the idea is you

know before i show you that i am here in

our studio but i'm not using any

particular project how do you know that

because what it says project it says

there is none right i'm not here using

any particular project so if i wanted to

create another studio project to follow

this idea of using project oriented

workflows

then i need to either create a new

project or open an existing project

or maybe navigate to a to a recent

project

so that is fairly straightforward you

know in file you can always go and

create a new project

uh maybe an existing directory if you

have one that is that the folder exists

but it's not yet a project or you can

create a new directory

i'm gonna create a new project and i

always use so this is a very important

concept as well to know where your

projects go so i always

save my art studio projects in a

specific file in a specific folder that

i call git because usually every project

that i

work with r also is being tracked by a

version control system called git so

that's where i could do you know demo is

the name of my project it's going to go

inside the git

directory

and when i have this check this box

checked but this is not the goal of this

meetup so you may ignore it for now so

that what we'll do is we'll create that

project close the project that you know

or the no project that i was before and

restart a new one and now notice that

there is a new i mean a new folder

inside the directorygit that i defined

that was you know the parent of the

project and then there's a bunch of

files here that basically just tell our

studio what to do you don't need to

worry about them for now you might also

not see some of them because you can

hide them if you want some of them could

disappear from your eyeballs if you

click that hide hidden files

checking thing

okay i'm gonna go back

and i i acknowledge that cj is about to

kick me out

so

um

let me see

okay to cover the tip of having a

dedicated folder for your approaches in

my case i use a folder called git which

is the parent to all of my art studio

and at the same time git projects

also

recommend lodging recent projects if you

do have recent projects already then

there is you know one quick way to get

to them you know i press

alt alt f

to pop up this menu and then if i press

j that would go to recent projects so

for example a project that i have been

working recently is the one that hosts

this the code for this meetup so i can

click there

so that's a very quick way to navigate

to recent projects and then a final very

good way is to use a dedicated

application like alfred or albert in my

case so that application is looks

something like this i press shift and

tab and here i can start typing ds

whatever and then i will get all the

projects that you know you know match

that string you know it's a very easy

way to launch an existing project

okay this is uh a potential stopping

point um i would probably like to cover

a little bit more but right now i want

to acknowledge that uh this what we've

seen is a lot of content and i think

it's very important more than to pack a

lot of content today i think it's

important to understand what we cover um

and to be sure that you can do it

yourself and if you have questions

please bring them up now so yeah i'm

gonna shut up and ask you if you have

questions or comments

okay um

then i will okay if i move on a little

bit to at least cover all the contents

of uh defensive workflow i think we're

pretty close to

to the end and said yes okay cool

probably by the end if we have a few

minutes and maybe one

discussion that would be interesting to

have is for those who have worked with r

for some time already and i have and

then remember what was life before and

after adopting a defensive workflow if

they can bring some anecdote about how

much

more efficiently they started working

once they started embracing some of

these ideas so i keep that you know for

you to think what anecdote you would

like to share

so go back to the

contents of today's meetup uh another um

idea that is very important and also

covering the same kind of book that i'm

using for to talk about defensive

workflow you can see more of that here

in this chapter is the idea of using

safe paths

so i know that this might look a little

weird but you know once you redefine

another studio project

then there are some tools that

help you create paths

that are relative to that project

particularly important is that the the

paths that you include in your script

are paths that are nested inside that

project it doesn't matter how deep

inside but they have to be inside for

these tools to work as they are intended

to work that way when you deliver a

project to someone for example via

github then that someone will get

everything that your scripts need for

them to run right so one tool that does

that is the package here the package

here has a function called here so if

you haven't seen this syntax before

saying here column column is basically

calling the package here and then using

the function here from that package so

this i know it's a very weird way to

create in a path

but it just works it really works really

well in anything that is inside your

project folder once you created your

project so remember a precondition for

this to work is that you have to follow

this idea of project oriented workflows

so in this case you know i'm doing

something very simple i'm i'm

you know notice how the path that i

created only knows about

anything that is inside

the

my project data is a folder and

greeting.txt is a file so this bit only

everything before that it is very

important that does not make it to my

hard coded script why because this path

contains my name for example and you

know if you want to run this script in

your computer your computer won't have a

valid path that has my name in it so

every

everything that i highlighted here in

this text should not be

hard coded in any script that you want

to share with the world and even if it's

with yourself you shouldn't do that

because maybe you change your computer

and then you move this script from one

computer to the other and then that

computer may have a different structure

of the file system and that means that

this script will will break will not

work

so here here abstracts that prefix so

you don't have to hard code it in your

script

what would be a bad idea could be to do

something like this that may sound like

more familiar okay i'm gonna just you

know type something that goes like c

users model blah blah blah blah all the

way to data greeting you know

txt but that's very bad because someone

else won't be able to reproduce that i

mean the chances that they will are zero

percent right so and if they need to

change that they need to change the code

to reproduce your analysis so it's not

reproducible as is

another really bad thing that is

happening in this path here is that it

has a name that is very difficult to

work with across computers of different

platforms so windows may be okay with

something like this

fragile space path

but you know my ubuntu system doesn't

like anything like that and a good break

probably this path i won't be able to

rate it so in terms of how to write five

names jenny ryan wrote a really nice

presentation that you're welcome to see

this link points specifically to the

slide that i'm showing you here if you

know there's two links away

but you can the whole thing is really

really good so i recommend you to have a

quick look but basically is i don't do

you know things like the ones are here

the nose nose nose and these are the yes

so start for example

the

the file with you know your date

starting first with the year then with

the month then with the day underscore

and then you know something like

abstract hyphen for hyphen s l a dot

d o c x uh that has no spaces it will

work in every system

this type of format of the date will be

uh sorted very nicely uh by time

and the month in the middle you know

helps doing that as opposed to putting

the month anywhere else in the structure

of this um of this um way of writing

dates and here is a bunch of other

examples i think it's pretty clear why

things here might not be

so good and why these ones are better

options but if you need to learn more

then

do go ahead and read jenny ryan's

presentation

okay

so the next thing would be to talk about

the data science workflow itself but

because this is kind of changing gears

um maybe right now it's a good point to

stop and maybe talk for a couple of

minutes

about uh

just purely workflow related things um

let's see if i can go back to your faces

here

yeah any question before like prompting

for

anecdotes and comments

go ahead

and i think cj was before me

teacher if you have a question go ahead

and i have a uh okay five minutes look

very very basic so

could you just one more time explain

what is uh project orientated work so

like what does that mean

yes so a project oriented workflow means

that you have created another studio

project to make you know to simplify

things that instead of working basically

means that if you are working in our

studio what you see here in the top

right has a name as opposed to have

something like this let me show you so

you may be working in our studio but if

you are work if what you see in the top

right says project none you are not

using a project oriented workflow what

you need to do is to decide which folder

you want your analysis to live in and

then create an art studio project go

into file

uh new project

if you have the folder already navigate

using you know existing directory and

then you know find that directory in

your computer and that will create a

project that will you know will close

this

and restart your brochure

where you have just created it

to give a little bit more like a hint

for more nuances there are other ways to

define a project specifically if you

find if you use the here package

here will be aware of what a git project

is for example or you can if there is

nothing like a dot git directory

then the here package will drop a file

called dot here and that will define a

project but that those are kind of weird

edge cases so i don't want to distract

your attention to them instead you know

i would simplify the world for now you

know approaching or in the workflow

is that that you have if you have a name

project in the top right corner of our

studio

and i'm doing this because it's better

to replicate and stuff here

exactly yes you know once you have a

project

you can share the whole thing the whole

folder folder with all the files inside

with someone else you can you know email

the pho the whole folder if you zip it

or you can push it to github for example

so that someone else you know downloads

that thing

and then everything that you need to

search inside that directory for example

if you need a data set you will write

somehow a path to that data set as i

showed before in the example you would

say something like you know read

underscore csv

you know data slash mydata.csv

right so that path is relative to the

root of the project that you created

and that path that i just kind of

you know spelled out does not include

anything like z column mauro whatever

that is great because that means that if

i create a project i can send it to you

and because it doesn't contain my name

so nowhere in the script there is any

reference whatsoever of who is the

person writing the script meaning that

is fully reproducible in anyone's

computer

nice okay cool got it

cj i think you're next

yeah so i was gonna reflect on this but

now it kind of feels like i'm

beating the dead horse but yeah for me

like this

magic oriented workflow

a major exchange and now

how i did work with our i started using

our

more than 10 years ago before our studio

existed

and

well even the first versions of our

studio still did not have this thing

this concept of project marketing

project so in that world that we lived

in back then and we we still of course

kept sort of projects in the

subdirectory or something like this but

you always everyone had their own ways

of trying to figure out how to refer to

files that were in that directory

some people what they always do is they

start off by using the set working

directory to what that project folder is

some people wrote fancy kind of things

that would try to determine what was the

directory that the script that you're

running is in or was opened from

and that's a lot like what this package

here is doing

and then um our studio came with this

concept of our studio project

which um

technically the magic the total magic

that's happening is when you open an

rstudio project file

it sets the working directory to that to

the directory that lives in

it's really that simple and i was a

little like skeptical of this when it

when it began because i'm like oh it's

doing some magic you know if you open

this not in our studio in the rgui or

some other thing then you don't get that

or if you open up the server so i was a

bit hesitant to go with that first but

once you get into that it just solves

all these problems in one fell swoop and

it's so much better

and then like honestly you don't even

really need this here package because

our studio does this one simple thing

sets your working directory to the root

of your project and once you do that you

can set give yourself the rule never

never never set the working directory

unless you really really know a specific

reason why you're doing that just don't

ever do it

don't ever set the working directory

and you're fine and everything is just

relative to them to where your project

begins and it's so much easier and one

other comment on this on building paths

because maura mentioned like the past

with spaces in it and there's also like

different delimiters between directories

i highly suggest using the file.path

function to build

paths

programmatically rather than

using paste zero or writing out strings

and including path delimiters in them

because honestly it's a lot safer to

just use

okay

thanks cj the

maybe the the last comment i want to

make is that

all of this meetup today is a super

compact version of what i envisioned as

a whole series

that is walking through the the book by

jenny bryan and jim hester that is

called what they forgot to teach you

about are so you will notice that every

chapter chapter 1 2

3 and 4 are the things that we've been

talking today so i compacted all of that

in 25 minutes

and

there is a lot there including the whole

history that cj just explained very

eloquently as jenny ryan explains how

she used to work before our studio

before our projects and how she came up

with her own way of setting working

directories and doing all of that so if

you're interested in in understanding

more the context other than just you

know embracing this as a okay this is

what i need to do i just do it you need

to understand why jenny ryan will

explain like very eloquently there too

okay it's it's five minutes past the

hour where we should have stopped so i'm

gonna go back to your faces and ask one

more time if there's any kind of burning

question here

or comment

okay then i thank you all i hope that

this uh recording will be

material that we can use for onboarding

new colleagues as well uh so i think

that in that in a way it's kind of good

that we didn't get to coordinate the

exploration that data science part of

thing

we'll leave that for the next meetup but

if that at this point uh the material

that we have core now you know is the

minimum that you should know if you join

two degrees and need to work effectively

with everyone else because this is going

to be our expectation

thank you very much see you next time
