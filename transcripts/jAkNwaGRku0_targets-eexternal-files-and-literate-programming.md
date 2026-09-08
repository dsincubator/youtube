---
type: Video Transcript
title: "targets: Eexternal files and literate programming"
description: "Is going to be covering another section in the series of the targets package and we are going to be talking about external fice and literate programming but..."
resource: "https://www.youtube.com/watch?v=jAkNwaGRku0"
tags: ["ds-incubator", "targets", "pipelines", "r-packages", "workflow"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=jAkNwaGRku0"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2021-03-02T00:00:00Z"
    usage_count: 178
usage_window: { from: "2021-03-02T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

today the DS incubator is going to be

covering another section in the series

of the targets package and we are going

to be talking about external fice and

literate programming but before we do

that I want to say uh that we have a a a

a guest today so CJ can you introduce

your friend and Olga then go ahead and

talk a little bit about you sorry thanks

so um Olga is a former colleague of Me

Mine from the her school governance and

a dear friends for a long time um and I

was talking to her recently and um

recognizing that she works in

organization where she's basically the

only data scientist so she's a bit

isolated not only with the pandemic but

also from that aspect I thought it might

be interesting or fun to have her come

join us and she would have um some s

pseudo colleagues to talk about like

Tech cool stuff with and also like she's

really awesome so I'm glad to have her

here and yeah I leave the rest of the a

to so hi everyone and thank you so much

for uh having me and so I'm Olga I'm a

Russian citizen I'm living in Berlin uh

in moabit uh and uh I work parttime for

ton inand as a data scientist and

another part um I do also freelance work

for various organizations I've been

working with r since 2013 since BAS

basically I met CJ and I've learned

quite a bit from him and that's how we

wanted I think and um I'm very

interested in uh Vis various various

visualizations mapping um currently I'm

sitting on two dashboards and learning

how to do all this e charts and

JavaScript match it with r and that

drives me nut but it's also

exciting yeah so that's that's all about

me thank you well welcome so getting

into the topic of the day um because

these meetings are of very limited time

um basically the objectives of today is

to basically understand what uh what the

Drake jargon means when when we say that

a file is external or

internal right now it might not make a

lot of sense but you'll see that in a

moment um and then uh we're going to try

to understand how to actually use these

external files either as inputs or as

outputs of our

pipeline um but most importantly I mean

this Meetup is uh a response basically

to the the interest that I I noticed in

these meetings about this idea of well

how a pipeline a Target pipeline fits in

you know the different workflows that I

may um be doing in my analysis so we

have this idea okay in a repository I

have a bunch of code and I use that code

to do more than one thing so each of

those things you know we can call them a

workflow and we can in our heads we can

think well you know a workflow is

something I could explain in another

markdown file so I wanted to demonstrate

an example of an idea that I have been

kind of suggesting but never kind of

showed concretely which is this idea

where you know you can have a pipeline

as a super set of computations and from

that uh super set of computations you

cherry pick the few ones that uh compose

one workflow and you do you know this

one analysis with this subset of the

super Set uh and that say is you know

workflow one and then workflow two is

you know you pick other um um targets

other computations and you produce a

different say report so um and then

we're going to be also mentioning like a

topic that we'll be covering in another

um Meetup in a little bit more depth but

it's it is this idea that Target is not

just uh targets it's a Target belongs to

a family of packages that is very

quickly evolving and it's called a

Target Topia in the same way that we

have a tidy verse for a multiple

packages um by you know by the more or

less the same people um will also

thought of this idea of a Target

Opia and we're going to be using for the

first time one package of the target

Topia that is not targets itself but

instead is a package that builds on

targets to create um basically more

readable pipelines as you will see in a

moment so the motivational example uh of

today is this idea of building two uh

different

reports um I'm going to be using

the a data set that comes with r it's

called the air quality data set and

let's pretend that we are interested in

understanding I'm going to start

actually with this other one let's

pretend that we are trying to understand

the relationship between ozone and and

and time so we are interested pretend

that we're interested with this question

of whether or not a Zone levels change

through time for this particular data

set so there's many ways in which we

could approach this uh issue um so um we

can think of at least you know two

approaches in which we can explore the

relationship between ozone and day um

and one approach could be just to

produce a plot like the one that I'm

producing here uh so just this is kind

of a spoiler alert right so I'm showing

you already the results that we get from

the data set uh you know the

the the uncertainty is pretty wide our

line is almost horizontal it can move in

any direction to me just by looking at

the plot it suggest that there is no

evidence of that ozone in this

particular data set is changing uh

through time it seems a pretty sale so

you know that that would be kind of my

my very simple

conclusion uh so that's one workflow and

I'm going to show you in a moment what

data I used and how I massaged that data

and and all those steps in the process

are going to be targets very soon in a

pipeline um but let me show you another

report that I produced in this report

I'm using just about the same data

almost the same targets but um I changed

a few not exactly the same most of them

are the same but some of them are not so

in this particular case I'm studying the

data in a different way I'm just

applying directly a linear model I'm not

plotting the linear Model H and uh and

kind of again you know I also see that

the the R square is is very close to

zero um there is a p value that suggest

that there's no significant relationship

between ozone and day uh and a few other

parameters so this is a summary of a

linear model um and the conclusion that

I arve is is the same basically but you

know in our heads we have a repository

we have data I'm going to show you how I

you know created um the outputs in a

moment but basically with the same

repository the same uh targets I created

two different sub sets of reports right

of analysis and and I explaining them in

reports so I'm going to show you what a

full report looks like uh let's scroll

up is a very simple arar down file um in

this case this is the report where I

show you the plot um I'm uh setting this

up by using the target package and gplot

2 um and also I wanted to kind of

mention this quote that kind of inspires

the way in which I'm writing this AR

markdown document this quote comes from

the user manual of the targets package

and it says that the book of the

computation and this refer specifically

to when you write ourown reports the

bulk of the computation should have

already happened

upstream and U the most of the code

Changs in your report uh should be just

T calls to Tar read and tar load and it

makes sense if you think if you're

familiar with ar macdown um arcd down

itself has a great Cash System and you

can say cash equals true and that will

save you some computations but basically

you can get only so far with with um

with ar markdowns cash um targets is

precisely a tool to skip targets to skip

computations that don't need to be

recomputed so it is you know it gives

you the same benefits and a lot more

right so if we understand that framework

then we can leverage its power and and

work with it super comfortably so um

this is kind of the also touches on a on

a comment I think that CJ did a couple

of meetups ago and I was thinking about

this quote that I remember I had read

but I didn't you know I didn't have it

in my in my mind fresh at the time so

basically how it works again you know

targets allows you to create all the

computations in a pipeline in a in a way

that is quite readable but then you have

to explain why you know what you did

there and and the the place to do that

is an armd report for example H but

because you already have all those

computations done you don't need to

recompute them right you just pull them

from the target framework into the

report and show the

results so for example in this

particular case uh the pipeline that I'm

using and I'm going to show it to you in

a moment in our directly in our Studio H

but the pipeline looks like this you

might already be familiar with What's

Happening Here uh the file that defines

the pipeline is you know usually um and

this is like a review of the targets

framework you know we always start with

a file uh so Target needs a file at the

root that is called _ target. r that

defines a project as a Target

project and it has a very um consistent

structor you you start first by

attaching targets and in this particular

case I'm attaching another package of

the target Opia family which is called

Target Target types and I'm going to be

using this package here at the end then

remember that you can set options either

for the global environment or options

for the global targets for all Targets

so with the function tar options set you

know we we Define options that are going

to be passed to every Target in the

pipeline for example in this case I'm

using what we learned last time that we

could write function

or we could write the functions that

usually we use in the in the targets

pipeline we could just you know put them

anywhere or we could put them in a

package and then use that package in the

pipeline so that's the approach that I'm

using now just as an excuse to practice

what we learned last time so I'm using

the oh I'm unfortunately it looks like

my voice is breaking a lot shoot not

very

sure uh how to fix that

so bad let's see if this helps a

bit I'm going to try use my

earphones I'm going to hope for the best

now can you hear me any better

now no ah Sho switch the video off maybe

okay that's a good idea let's switch the

video

off let's try now if I'm also pulling

from the my internet is really bad um I

think I is is that now any better

without the

video ah

Sho

Sho well I think I I'll probably pretend

that it's all fine uh and recorded

unfortunately yeah pretty bad okay I'm

going to leave a little note here

explaining what I'm about to do

uh okay so I'm super sorry not sure

what's going on I'll move on and

record um you may prefer to

leave now and watch the video

later I know that's the only solution I

got come up with right now so I I

pretend that everything is okay I'll do

a recording and then you know if you

want you can catch up with the recording

later sorry I have any no no better idea

unless anyone suggest anything better

now so we were at the point where uh I'm

explaining here um the pipeline so the

the next step is to explain what's

happening here in the pipeline itself

and we touch on the idea of what um you

know of using files are external to the

piper to the targets um

framework uh when we need to redefine

that actually we have in our computer

what we do is um we um we we basically

create a Target that the only thing that

does is stores a path and that defines

the or that allows targets to know where

to look for that file so let me now jump

to our studio so to make this a little

bit more live hopefully this will

clarify things a little bit so what we

mean when we say that a part a file is

internal or external is what we get

is so if we do um

three if we see explore inside the

target folder you will see that uh you

might remember from previous meetups

that there is a s folder called objects

so uh that folder called objects has

every

Target that is internal that Target is

defined as internal leaves inside that

folder so as you can see the targets

that leaving there uh you know is data

LM figure LM fit LM plot and raw so if I

show you the pipeline now so let me show

you the pipeline you will

see that so row is here data is here

fit is here and plot is here so these

are all the internal files anything

outside that folder for Target is

considered an external Target or yeah an

external file and the way you use

external files is that you need

something that produces as output a path

so this function here if I run it you

can see that all it does it produces a

path and that will tell targets where to

look for that file as opposed to the

default place which is you know the

objects folder inside it under

underscore targets um

directory another thing that you need to

add there for that um to work is the

format uh argument and you need to say

format equals file so that is what

defines uh or what allows you to use in

a pipeline an external file everything

else here I'm not going to cover it in

much detail

um it's something that we already used

as things that we kind of covered in in

previous meetups so like a requirement

for today is if you want to understand

everything you know it could be great if

you watch other uh sessions and if

you're just fine kind of feeling a gist

of uh what it is um this idea of

external files and literary programming

then then you should be fine so just

know that each of these calls is you

know defines it Target here I'm defining

the the raw data is basically just

reading From the Path then we are

creating a clean version of the data

calling a function called clean H then

we are creating a linear model U by

applying a linear model right to the

data and also we are creating a

plot uh if you remember from previous

meetups H this you know here to the left

are all the names of the targets that we

are going to be using and here to the

right we have what's called a command it

is the expression that is going to be

run by targets to compute the particular

Target here to the left so we could have

a quick look for example at fit LM and

see what that uh function looks like so

as I said before it is a function that I

put I decided to put it in a package but

it doesn't have to be that way it is a

very simple uh function it just calls

the function LM from the stats package

and uh creates um a linear regression

between ozone and day using the data

that you fitted here right so these

these two things you can forget for for

now it's just simp a simple way to hack

our Command check uh to um to not get a

note that is is quite annoying uh but

basically this is the core of the

function fit LM that's what it does so

if you fit it with um you know air

quality you will just calculate the

linear model for that so that is um

basically a quick review of the targets

that I Define um

internally then you we already covered

this external um Target which we also

use this approach before to read from

external files and finally this is the

most interesting bit for today so this

this is kind of the core of today's

bitab and with this actually we are kind

of getting relatively close to the to

the end um so um in this particular

Target what I'm

doing is I'm using an external Target

but not as an input but instead as an

output so if I want to um save a file as

part of the

pipeline then what I need is a function

that saves that file and outputs a path

so that's the the the requirement for an

external output file to work with Target

so I'm going to show you what save plot

looks like it is a very simple call to

uh gplot to G save so the a particular

plot that you feed to this function will

be first Saved but then notice that

there is the function doesn't end here

it ends here what it is is at the end it

outputs a path for you know to comply

with best practices I use invisible but

you know you don't have to you could

have you know it would work just fine

like that that that would be good as

well but because the main goal of this

function is to produce a side effect it

is best practice to return the first

argument invisibly as opposed to just

visibly so okay this is um this function

what it will do uh or this target what

it will do uh with the target defined as

it is

here let me show you with this this

function will save the file in a

directory called output plot.

PNG right and the plot that will be

saved is the plot that comes from the

previous pipeline that comes from here

right so this is the

plot and this is the path so if I now go

to uh basically if I go

to Output here there is a folder here

output right you can see that the plot

lives in there right that's the plot

that um is is used also in the

report and finally it is also um a great

idea that you know although you can

render a plot using the botton knit so

say that I want to to uh create this

report I can hit knit as usual right and

um and here I would have my report right

but that's not as good as I can do

instead I can also do the same thing

programmatically and how you can use the

function tar render and tar render will

produce a Target H that is specifically

focused to producing armd down reports

and it comes from you know a package

from the target toia family it's called

Target

types and it's very simple it just takes

the name of the target so now the report

also is a target um and it takes the uh

path basically um where the the file

will be saved uh then there is a bunch

of optional arguments that you can pass

if you want to render because the engine

of this is AR down

render and you can pass it through the

dot dot dot argument you can pass it any

number of arguments that render will

take for example output format equals MD

document so that means that when I I

produce use this pipeline let's do it

you might you might remember how this

works so we are now going to actually

use Target so

Library targets right and now we're

going to do tar make right this will

compute all my pipeline so in this case

because the pipeline was already

computed it's kind of skipping every

every um process but uh I could do T

destroy and recompute

right so now every target has

run uh the plot has been saved actually

right H and the results will be uh

that everything including these two

files right will be an output of the

pipeline so now my reports are produced

programmatically so I could open this

report here for example right and U

preview it I think this is the botom to

preview

it right and this is what the report

looks like and it was generated

programmatically right uh scrolling down

just I'm going to show you

um here it is for example because the

the the target LM plot holds a plot I

can just read the target with tar read

right and simply show the result in the

um in the report again as as Target says

uh an armd down report inside uh a

Target project is simply a bunch of

calls very ter calls to Tar read or tar

load to just reuse the computations that

the pipeline has uh

created okay so with that I covered

everything that I was hoping for today

we still have five minutes not sure if

you will be able to um to um ask

questions let's let's hope for the best

so do we have if you could understand

anything could you have any comment

questions to to end the

meeting okay I'm going to typ here a

time uh I'm guessing you couldn't hear

I

think

right go ahead go ahead

yob so yeah know we we could hear you I

think I I could hear you at least um to

be honest I just need to digest us a

little bit more to to actually be able

to ask questions um but I think it

actually um points me into the direction

that I would need to look um to to cover

the the different workflows and the

stress testing rep at least so yeah I

think that that will be helpful but yeah

I will for sure need some more time that

perfect thanks yeah was really cool to

see that this covered thanks notice that

each Meetup um is you know belongs

exists here in the DS targets repo so

you can go to this repo when you want to

review and uh notice that each uh there

is

releases so each

um MEAP has a corresponding you know

this was last meet up this was the

previous previous one this is the other

one right so if you want to

review the a previous Meet app you can

just you know check out the different

taxs and travel back in time to see the

project exactly as it was the day that

the Meetup was

delivered today for example you have uh

here is like the LM for example targets

so you would you would have access to

this and can consume it at your own

time do any more comments or

questions no more okay then I will kind

of uh wrap up with a quick summary of

what we have uh covered today so today

we cover this idea of using targets as

basically the engine that will produce

computations and then using those

targets inside different

reports I I'm I'm arguing that a

target's pipeline can be cons can be

thought as a super set of computations

from which we can cherry Peck subsets of

computations and explain those subsets

of computations in different Armand down

reports the result would look like for

example like the file that I'm showing

here where I have you know one file um

called in this case lmmd that explains

you know my workflow for uh

understanding if a Zone levels change

through time using a linear model and

then I have another workflow where I do

something very similar but instead of

using a linear model I use a plot so

both reports have a lot of overlap right

and that also means that I can save

computations by leveraging the power of

targets cache so I create the the

targets Pipeline with tarake and then

all those targets are ready for me to

reuse in different reports and I produce

those reports simply as you know like

very T calls to um tar read or tar load

where I just I'm pulling the computed

targets from the targets framework and

just showing what they are in the report

and thus my my my report runs like very

quickly uh okay that's bringing us close

to the end I super super sorry for the

issues with my sound I think the problem

is by internet connection I put in from

my phone do we have any parting notes or

comments before we

leave yeah I have one question comment

but

um I I kind of understood that the

targets thing like the r markdown files

rendering themselves would be also a

Target so it's kind of like feels

unexpected in some way that then inside

of our markdown file it's then reading

in

archived targets files or something I

don't even really know the right the

right words to talk about this thing do

do you know what I'm saying um maybe I

not sure if I was clear explaining this

really um so the reports are normal

reports so we could if we wanted KN them

manually but depending on how uh but

depending on how many reports you do for

example you might want to instead render

them inside the pipeline so you don't

you don't even need to hit the need

button so um I I haven't covered it

today because it's a bit Advanced but we

could be using parameters for

example in in our markdown and map those

parameters to like a very large number

of reports so say that we wanted to

compute ozone layers for different

countries in the world and we have you

know a data set of 300 countries I mean

to to meet 300 times would be silly and

we can just tell targets to do it for us

we can you know write the pipeline that

creates all those 300 reports right away

right so once we figure out one we can

just map those to to like the different

countries that we have in the data set

or something like

that cool thanks I think after I said

that and I realized it is doing kind of

what I expected to do yeah because you

these are these T using this tar AR

archetype tar render is essentially

making a Target which is like the out

the rendered output of that AR exactly

the output of this target unfortunately

the the the target has to have a name

but it doesn't make a lot of sense

because then the output is going to be

uh basically an an an empd file in the

root of my directory in this case uh

this one in this case BL right so this

is the output of this of this particular

Target yeah in any case you know as as

we move through targets you know I

realized that um it's it's a very

complex tool very powerful very flexible

quite user friendly but it does does

need a lot of time I am now super

excited I'm learning so much but I also

realize how how much you have to get

into these things to understand you know

why you even would want to do use them

so I guess that my my very humble goal

would be for you to be exposed to all of

this not hoping for you to even remember

how to do it h but I'm hoping that if at

some point it feels okay actually this

is the kind of thing that I suspect

targets could be use ful for then you

know you can check in with me or you can

go back to the Target repository and and

kind of serve yourself to to

Solutions so with that I think we need

to kind of wrap up now and I would like

to say to end just saying U thank you

again Olga for joining us you join us in

a Meetup that is very advanced in a

series so I'm not hoping to maybe I lost

you in the first two words but yeah just

having you here is is a privilege thank

you very much

Chia

Chow thanks bye
