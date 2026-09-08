---
type: Video Transcript
title: "Using drake to develop smart, reproducible workflows"
description: "We just watched a video describing how the very basics of Drake and I will might be used kind of Hope with reproducible data analysis workflow yeah and..."
resource: "https://www.youtube.com/watch?v=_Cl4odbiG78"
tags: ["ds-incubator", "drake", "workflow", "r-packages", "reproducibility"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=_Cl4odbiG78"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2020-05-05T00:00:00Z"
    usage_count: 13
usage_window: { from: "2020-05-05T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

tomorrow is just starting the recording

now so I'm just gonna do a brief outline

that we just watched a video describing

how the very basics of Drake and I will

might be used kind of Hope with

reproducible data analysis workflow yeah

and going back and if you need to make

changes to the code rather than manually

read running every step through the code

and hoping that we don't miss anything

I'm standardizing the whole workflow and

automating the process of checking

what's missing essentially and so I

recognize that that video is a little

bit quick for a topic that's pretty

large and in-depth and obviously I don't

expect in one Deus incubator to all

fully understand how Drake works I sort

of just wanted to rent your guys

whistles and you know let you know that

this exists and I think it's really

really interesting and could be really

helpful to a lot of the work we do and

in particular my my views as I see

obvious implications of being able to

use Drake in impact ax and and just for

checking if you know let's say one Ison

gets added in one file in one corner of

the code rather than manually going

through executing every line of script

or or trying to guess which lines of the

script need to be rerun because we think

we know being able to automate that for

them with drink and so I kind of run to

open it up to the floor to have a bit of

an open discussion and see if it's

something to just kind of like which we

want to pursue a little more and look

into more death also as you guys may

have noticed how it's not a direct hand

this package so kudos that works and

also he should be presenting this so

yeah I'm gonna open this before you can

have a discussion right now look what do

you guys think I mean obviously I'm sure

there's plenty of questions but did we

see use use for this in our own work day

today

I personally do however obviously when

you don't know it anything about

something the idea of how much work it

will be required to implement it it's

the biggest biggest question and I think

that was a fairly simple looking example

you know what they've shown obviously

and when I think of of implementing sort

of a hundred steps and you know if we

add a step at some stage later then is

that a simple process to update it or as

a you know absolutely so there's there's

a page that actually Alex sent to me

kind of discussing Drake in a little bit

more detail and in particular its

scalability and how easy or difficult it

would be to scale to very very large

projects but I think that's a very valid

points and a very valid question and I

think it would take some work so it's

sort of a question of whether we think

the payoff is worth is worth the work I

guess how much do you have anything less

or took just need about fun too yeah so

Drake works really well for projects

where there are many many different

components in your analysis and you can

treat those components mostly modular or

maybe you combine a couple of them

together to get to the next step and

then you combine those steps to get to

the next step and so on and so forth and

it really really shines when you're

changing one or two of those base

components at a time because then you

don't need and especially if running the

entire process takes a while right

because then you don't need to run the

entire process every time you change one

or two of your base components and one

of the advantages of Drake over other

workflow managers like you know

or airflow or any of those other ones is

that it is native to our as you could

saw it in the example they're like what

is in that Drake plan looks exactly like

our code because it is our code right so

you don't need to go and rewrite

everything you've already got you just

need to sort of adjust it a bit so that

it fits into this framework

I would have a question is it something

that you would think is only useful if

it's really like a pipeline way that you

use quite often in a way I guess or is

it also for one time project because I'm

thinking about for Anka ADA yeah those

hundred towards that take quite long to

render but I don't know if it's really

of use for something like that that

doesn't change so often I have had

success with it or one time projects in

the development phase of it right so it

means that like I go I make an attempt

at my project cool

it's mostly good except for all of these

things that I got wrong so then I need

to go and change all the things that I

got wrong okay now I don't need you know

now that like the running the code takes

half as long instead of the length again

I have one question maybe Alex oh you

can answer Oh

so I still haven't used the drink much

but this one it sounds like interesting

and I wanted to know like how different

it is from like a unit tasting like

where we set the rules and if something

breaks then we immediately identify is

it like a compliment to the unit testing

or let's say if I'm using a drink then I

truly try to you

you

um so unit tests are great for assessing

functions

Drake is good when you're working with

data

it is sort so it definitely is like a

complement to each other you know the

the unit tests are good when you are

describing the operations that you're

going to do but Drake is designed to

sort of organize the pipeline of them

calling those functions in the correct

sequence

you

what are some of the things that it that

Drake then alerts you to or or how does

that my look like right so I I guess

maybe sort of a description of what is

going on in the backend of Drake might

be useful so the way that it works at

its core is it has that data frame which

is like here's all of our targets here's

the code that I need to build those

targets you can add more columns that

specify exactly when you want to rebuild

those targets but the simplest way that

it works is it builds a target and then

it stores the results of that to a cache

on your disk as a our data object and

then if the code to create that ever

changes or any of the dependencies that

it depends on ever change it marks those

is outdated and it'll recreate it the

next time it runs so say for example I

have a target called raw data right

which reads in this enormous CSV file

that we've got right if I ever changed

that CSV file then it'll mark raw data

as outdated and along with everything

else downstream of that I have an

example that I can run through very

quickly if we have we have five more

minutes which mails so it's the same

example that he was going to in the

video but you can just see it directly

encode on you to kind of see exactly how

that would look and then I think we

should also maybe have another

conversation on this I have another

point because I think it's a bigger

topic than just just went yes you did it

it has been good question now it's about

that what is the last response so like

if you change this cs5 scuse me file it

recognizes and marks that but does that

mean like how does it do that does it

is it testing the file like what if the

csv files in Dropbox and Dropbox changes

the file of the strake know about that

so a dozen md5 against the contents it

mostly ignores metadata unless you tell

it to specifically look at the metadata

ok so just in the last couple of minutes

can you guys see just the screen law so

I'm just going to restart this okay so

in practice it could look something like

this this is a very obviously simple

example we're going to load in kind of

the packages that we need as usual

create some very very simple clapping

function and then just within this this

I mean this has a lot of data that we

don't need to think about but it has

this raw data on excel file in the main

directory right here

so we make this Drake plan it's a

relatively simple plan where we're

reading in the raw data we're doing a

simple mutates

on this data set to create the output

data I'm naming it this target here

we've a histogram o'clock which we're

creating a naming to the target hist

then we're doing a simple fit to that

data and aiming at the target fit and

then we have this knitted report that

we're calling the nuclear recalling

report and so these one two three four

five targets or these five objects are

the five targets of the Drake plan so we

set this plan and you can actually

visualize the Drake plan itself

and of note structure so you see right

here you can you can look objects

functions and files which are imported

outdated or up-to-date and you can kind

of see their relative like how they

interact with each other to generate the

output report now you can make that plan

and show like for the spy reads D kind

of reads the cached grade data for the

odds for the target data out so you can

see what that data looks like it's just

the head of virus or it's just I risk

I called head but it's just it's just

the iris dataset after we have made the

plan we can call this visualization

again and you'll see that the updated

plans should have updated and now

everything is up to date every every

object in the pipeline is up to date and

all the objects that need to be imported

now let's say we want to change this

histogram plot which is exactly what

they did and in the discussion so we

change this function here we can even

like we can change it back up here where

we initiative to find route to add this

extra line called a create plot and then

we run this visualization this this kind

of node visualization ring and you can

see that the histogram is no no longer

up to date it's now outdated as well as

the report on file and the report HTML

so everything downstream that's

dependent oh sorry dogs oh I was just

gonna say the reason that it is marking

it as outdated is because if you can

scroll up to your plan again you can see

that it is saying that the hist is just

calling this create plot function yeah

so when it analyzes the create plot

function it also creates a cache of that

function and looks to see has has any of

the functions that I am calling anywhere

in the plan changed so it's not

code that you've wrote but also code

that you are calling or depend upon

right yeah exactly yeah and you can also

envision a structure where this this is

saved in some package or is for sourced

from some other file and it would still

recognizes that package has been updated

and something broke along the long way I

think we're at the end of the discussion

but at least you can see so it you can

see that it can tell that these things

need to be to update you can make the

plan again and then it'll update only

the only the objects that need to that

it thinks are outdated so this pissed

and report oxides which are the two

objects that have found or David and

then if we visualize the polygon you can

see if you something

bring down now I'm gonna stop that or

not but that's just the super super

brief yeah alright I have a last

question that I have been thinking about

since yesterday I think I know the

answer but I'm gonna do phrase this

question and see if if Alex and Jackson

can help answer and from the idea I

would like to kind of see the people's

heads so I would be kind of presented

because the issues that Drake

presentations over syncytial about Drake

most of the time focused a lot on the

cash feature and focused too little in

my perception about the the flexibility

that it gives you in how you structure

your project so the question is case

studying Alex and Jackson so you have a

project let's call it pact analysis and

you have a bunch of scripts that need to

run in a specific order and the current

workflow is that a human needs to know

in which order you have to run them you

want to get to a better place where you

somehow automate the process for now

forget about the cache feature forget

about saving time let's just think about

making your work some more reproducible

simply by a computer

good you go forth option a forcing your

code into the struck

on our package which is mostly feature

and suitable for functions or good you

go Drake which allows you to leave your

browser exactly as is and just indicate

with this plan what things should be

called and in with or learn so which of

the two approaches package versus tray

could give you the value of making your

workflow more reproducible with a

minimal effort that's a question it

really depends on the specifics of the

project so for something like ACTA Drake

might be a very good call it really

depends on what the the projects sort of

natural workflow looks like if it is

something where there is a lot of

iteration during the design process

right there's that import tidy visualize

go through the loop a whole bunch of

times and then out to report Drake helps

reduce the time you spend on each one of

those loops my question also monetize

sorry quite a fuss I mean make if you

still want to respond to the post today

just it just out of interest I mean

what's what like I wouldn't get a vision

world we could just do coke freight we

leverage the package ecosystem for its

testing and development to the you know

key parts of the analysis that we know

aren't going to change and that we know

we want to still have tested and then

you'd leverage straight for the actual

like running of the analysis stage but I

had one see I think I'm seems to make

sense for large-scale projects I don't

know if that's justified also they

aren't exclusive you can use Drake as a

you can call Drake from within

package and use it as sort of a back-end

for organizing work should we give it a

close the last question and I'm ecology

session what I like is that is has

sparked interest and I think we should

follow up your idea bisques so my

question is is there a nice way an easy

way so for example I have a script that

has like 50 lines and it's calling like

30 functions it's an easy way to create

the plan because I saw the planners

always the comma at the end and I think

if I would I mean I could copy/paste

basic in my script right and just like

at commenters at the end is that is

there like maybe you functioning yeah so

if you're there there's not like a nice

clean here's a script pop out a plan

thing but if your script is fairly

linear in that it's one of those scripts

where it's like create object a call

function on object a that's B call

function on B that's C and you just go

down the line that's like the most dead

simple plan you can come up with and

that's like very suitable to being copy

pasted okay great any phase phone so

something like this would then also be

next to work those those can still work

if you want to a pair program with me

and we can like set it up as an example

of what you're doing I can definitely

walk you through all that yeah I think

that would be great

what to see if I can use it for the data

prep road because that's like a hell it

takes like an hour to load all the data

files again and it's like it's for

annoying awesome yeah thanks it's nice

okay I guess we'll end it there

so happy it's for interest and looking

forward to keep talking about it and

thanks Alex very thank you so much
