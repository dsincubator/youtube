---
type: Video Transcript
title: "A demo of the package r2dii.plot (by Monika)"
description: "welcome everyone to the ds incubator  today we have monica as our privileged  guest so  awesome guest so go ahead monika  hi thanks mauro  hi everyone  thanks f"
resource: "https://www.youtube.com/watch?v=CRcK0SCxGBQ"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=CRcK0SCxGBQ"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

welcome everyone to the ds incubator

today we have monica as our privileged

guest so

awesome guest so go ahead monika

hi thanks mauro

hi everyone

thanks for joining um yes mauro said

today i'm going to

um

present a demo of the r2di plot package

that

we developed together with mauro

actually

some time ago

so let me

share

my screen with you

so my idea is to actually

basically go through the

documentation

of the package that you can also find

online

and that i shared a link to

with you

in the slack channel

so you can also see it like in the

website form

uh where you can actually copy each of

the

code snippets that i'm going to run and

you can run them yourself

and i'm going to do it in our studio

and

it should take about 20 minutes for me

to present and i think it's best if

we leave the questions to the end

because then if someone just

watches it later as a kind of

documentation then it will be less

interrupted so

let's do that

and mauro will tell me when it's 20 past

and

in case i'm still not finished

um

yeah so

the

i'm just going to run some

setup

steps

and

r2di plot package is built

to work together with

the other r2dii packages so the data

match and analysis

and it's also built using ggplot to

uh or ggplot objects so basically you

can use ggplot

functions on the objects that it returns

and i'm going to use

the demo

data from the r2dii

data package in this presentation and

yeah when you have real long data you

use of course your own data

so

here we

apply

functions from the match and the

analysis packages to get

a

data set that's

how do we call it

edited

whatever

um so the rtdi plot

in principle

supports or

has three kinds of plots it's emission

intensity plots technic plots and volume

trajectory plots

which are

the usual plots that you would use to

visualize factor results

but it also has some additional

functions that you can use on

any

plot so also ones that you create

by yourself and i will show it later

and for each of these

uh free plots we have two kinds of

functions

uh one is a quick plot

which is

very standardized and you just apply it

on

data straight away well after some

filtering you can just apply it on data

and get a plot

that looks pretty good already

and there is also

there are also plot functions which are

closer to

what ggplot would

return if you would apply it on your

data

but it's just a

specific factor related

plot will be returned in this case

and

yeah as i mentioned already in general

our

plots

assume that you did some filtering on

your data because usually they are done

either

for one technology or for one sector

um

so

before you apply the functions you

should filter your data accordingly and

if you want to know the requirements you

can run

like check the help file

for example if you run

question mark

blood

techniques

you will see

the

help file and then you can see

what are the requirements for

data set that

goes into this function and also

in case you didn't do it correctly we

also try to do error messages very

informative so they should also let you

know what's missing

so let's have a look at the quick plots

so as i said they

um

they are standardized to

what you would usually

want to see with factor results and they

have a lot of underlying assumptions and

some

customizations that we

applied kind of for you

and they are very good to have a quick

look

into your data but also

for users who are not very familiar with

are

because the only thing that they require

is when you have the matched data set

um

you

um or you calculate the targets

that's still analysis

part

and you just need to

filter your data so for example here

we will create an emission intensity

plot

and we filter

for cement sector because this is the

sector that we want to plot

and then we just run q plot emission

intensity on our data and we get a plot

which has a title that

is

assigned to this plot already and it has

nice labels for each color and

also nice labels for

x and

x and y axis also it's

assumes that you want to plot five years

of data which is usually the case with

vector data

and

the same we also have a quick plot for

volume trajectory which is used with

market share like data from the

analysis package

and again you need to do some filtering

so this plot works for

technology so you have to filter for one

technology

and also for a region and you get a plot

which

looks

pretty nice

we think

and you get a

title that's already set and subtitle

and nice labels and things like that

the same

for the technics chart you can create a

quick techniques

again with market share like data and

also here you have to do some

filtering for

metric column

because you need

for this plot you

can only have one scenario

row which is the target so you have to

pick your scenario

and

yeah you also

have to filter for a sector because this

is a

lot for a sector

and then again you get a plot

for five years

time span with title and

nice labels

but then we also have the

plot functions

which are

much more

bare bones so they plot the data as they

are

but they allow you for

a lot of customizations so you can make

the plots more

the way you want them to be and not

using our default settings

and

there are three strategies that you can

apply to customize your plots

you can use the plot

functions parameters there are some

parameters that

also allow you to basically replicate

the behavior of the

quick plot functions or almost replicate

the behavior of the quickbook functions

you can modify the input data

and you can also use ggplot2 functions

on top of

the created objects to

can add labels and things like that and

i will show you in a second

how it could work

um

so firstly let's look at how you would

use stretched strategies one and three

so

if you would want to use the

parameters of the

plot emission of of the plot functions

and

the ggplot functions

and we are going to do it based on the

emission intensity

plot example

um so again we need to filter our data

for a sector

and at first we are just going to look

at how the plot looks if we

don't do any customization so just how

it comes out of the plot emission

intensity function

and you can see that it

it just plots the data as they are and

it infers

the labels from the data just as g plot

does but without any modifications so

the labels are not title case and you

have the

dash in between

and also the

year

like the time span of the data is just

as you passed it to the function

um

and now what you can do is you can use

the

the other parameters that are in plot

emission intensity so like i actually

now here is the tech mix

so

if you

check

the help

for this function you can see that it

has also parameters called

span five years and convert label

and you can use these parameters to

um

yeah to modify the plot and convert

label will take a function to

apply on the

and overall labels of the plot

and then span five years it's again this

typical pacta

assumption that you want to plot five

year data so you can just use this

parameter to restrict your data set

and then we use the labs

function from ggplot to add

our custom labels so to add a title and

x and y

um

label

and if we run

this code you get

much nicer blocks so you get a plot

again for five years

data and with some nice labels

that you chose

another way to

customize your plot is to modify the

input data

so one of the way is to for example

filter the time

span

in the data another

uh thing that you could do is to add

columns label and label tech

which are then used by our plotting

functions

um

for the labels so normally

the plotting functions kind of create

this column for you but if you

add it yourself then it will use that

instead

and again you can modify the output

ggplot

objects that we already did

with the labs

ggplot function or

you can change the color using the color

scales

functions

we also have our

r2dii plot

scale functions that you can use to

change colors in your plots which i will

show

uh in a moment

but for now let's still look at the

plot functions

so for example for the emission

intensity

uh here we

add

the we use the labs

function to add title just as we did

before and we also use the scale color

manual which is also a ggplot function

and we pass some color values in forms

of hex codes and

labels that we assign to these colors

and

we get a plot

with our own colors

and here if you use this um

and also

with the time span that we chose

and here you have to pay attention to

the order of

your data that specifies the

color

and sometimes you might need to use the

factorization

to

get the right order of the colors or

well the order that you wanted

and the same for plug trajectory for

example we can add a label

column

to our input data

um

which is based on

which is basically modifying the metric

column

which is the output of the market share

so if we add this label column it will

use that to label your trajectory plot

and again you can

also add your title and things like that

and we get a plot

with

your own

labels for the

scenario lines and for portfolio and

benchmark lines

in this case

and finally for the techniques again you

can add this label column you can also

add

a label tag column which will change the

labels

for the colors

here we do it differently because we

also want to

customize the colors so we don't want to

use the pacta

technology colors but we want to use our

own colors

and then we

we use the labels

parameter from the scale fill manual

function to

um

to add our own

labels for

for the colors

and then you get a techniques plot

with the colors that you specified and

also with the names for the colors that

you specified

and finally we also

created some styling functions that you

can use for any

plot

so one of them is the theme to the ai

function

yeah theme to the i function that

works like a ggplot theme

and it gives you

our

plots with

our 2dii styling which is basically

um

well it's based on the classic theme

from ggplot

and it

creates

very clean

plots compared to

original ggplot

output

and

also we have

our custom

scale color and scale

fill functions which you can use to

modify colors in your plots

so for example here i will plot the

production over time

and

it's it's just a line plot it's not

any plot from the r2di package

and then i use the scale color r to the

ai

with labels that i specify also in the

order that i want

to

use two dii colors in my plot

10 minutes to go

okay i'm almost done

and

and basically you can do the same

but using uh

sec like to the eye sector colors which

are basically the

colors that are

assigned to

pacta sectors

and you can run that on your

gg plot in this case it's a bar chart

to get this

colors that we usually use for example

the blue for automotive and the orange

for power

and again you can do the same

but with like not using

technology back the colors so

uh

like here we will have

power

colors so

these are shades of orange

that you can apply on your

bar charts

uh

if it's showing

um

technologies from the power sector

and um just one more thing about the

colors i'm actually now working on

r2di colors package that

might

or that should make

these last functionalities even

easier to apply

uh so stay tuned but for now you can use

also these functions to modify your

blogs

and thanks a lot for the attention and i

welcome all the questions

thank you very much monica that's

awesome

question and comments please

no questions so i can also just say one

more thing that

uh someone has a question

and one

yeah

go ahead with your comment like that can

be a final question that's not really

related that's more

related to visualization than

what you present so go ahead with your

comments all right yeah well i just

wanted to say that of course i'm very

happy when people use this package and i

encourage everyone to do so

and also if you do and if you encounter

any

issues or maybe there are some features

that you would like to see there or

maybe some plots that you think would be

really useful you can always use our

github

page and

submit an

a new issue to let us know

about the new features that you would

like to see or bugs or anything like

that

so antoine

you can

yeah that was more related to the

emission intensity chart and

those type of chart where there is some

line

and

that's just something i don't remember

to do on gt plot and i already had the

look and can't really find

something satisfactory but if you want

to plot a dot line for example what

should you uh should you add something

in the scale line manual

uh input or

yes as far as i remember

um

but actually i would have to check

that

the same as you specify an aesthetic for

a color you also can specify an

aesthetic for

yeah line type or something like that

like i would have to check the name and

then indeed you have a scale function

that's then modifying it the same as you

modify a color

later in gigi plugs

yeah okay

thanks a lot

cj

yeah so congratulations on getting this

package to where it's at

in the long run but it looks really cool

um thanks

i wanted to ask or clarify i mean i

think i know the answer but so also like

these

the color

the things that apply the r2di colors

and then also like the rtdi theme those

can also be used in like a completely

customized chart as well

yeah indeed

maybe i didn't make it clear enough but

here in all the examples from the

styling functions section

i actually don't use uh r2di plot

functions

i just call ggplot so like

i just make a gg plot with uh

with column blood or

here

it's a line plot so i just use the geom

line

so yeah you can you can use it for any

ggplot

on any ggplot object

thanks monica

i i wanted to

um

kind of maybe make like a very general

comment that uh is motivated by the the

fact that i'm working with a new team uh

in a new project

and some people has have you know have

joined recently so they are not familiar

with you know the entire ecosystem of

packages that we have been building or

how they are born right so i maybe i

just wanted to highlight that you know

monica's packages is like a story of

um

of success in in in the feedback loop

that goes between

analysts and developers and

in this case her also as the specialist

in visualizations where you know all

these you know kinds of plots existed

somehow

in

very different different um

you know in the very different forms uh

and and done you know each analyst could

do something like this their own way

maybe using excel maybe using our but

you know basic gg plot two or maybe

using base r or whatever

so i i think it's really important to

highlight that um

you know if you're new to r2ei that the

developers here are there for you as a

resource to take your

patterns your workflows and take them to

the next level where you know the code

that you write becomes something

production ready and something that you

can then use like

very very easy and not only benefit you

independ independently but also kind of

help you work in a very consistent way

across the organization meaning that you

know three different analysts all using

monica's plots they all have you know

the same

um they all benefit from the input that

money has put into the sign in those

those plots

um so yeah just leave it leave it there

and and also that the the package and

website that monica showed is not only

for

um

for this package that every package that

you know we are building has more or

less a similar structure so you know as

monica show there is a website that

relates to this package so if you need

to read documentation you don't even

need to install the package you can just

go to the website

so

what this presentation is is yes

specific about rt rti plot

but a lot of the patterns that she

showed here apply to many many more

packages in our ecosystem

yeah indeed thanks and yeah that was the

idea with this package to just make the

work make the work of the analysis

of the analyst easier or that they don't

have to do

what's

like they can do the analysis instead of

figuring out how to plot something that

has been done before

and i see hands from cj and daisy but i

don't know who was first

so

maybe

daisy

cj i think you were first

uh okay

um

two like quick questions about like

preemptively imagining what what could

go wrong

um so one is are there any like hard

coded things in the functions that one

should know about like it's

it expects only

sectors that

like specifically the sector names that

we have used in the past or scenario

names or something like this so like

would if we added a new scenario or

change the name or change the name of

the scenario or the name of a sector

would this easily adapt to that

and then also in a somewhat similar vein

what happens when like the data

necessary to

show the chart

isn't in the data frame that you pass

does it

does it give you like kind of meaningful

warnings or

like you don't have the data you're

looking for or something like that or is

it

yeah so i'm just curious because i can

imagine that would be like what would

catch people

yeah so in general um

yeah it expects a certain shape of data

that is currently based heavily on the

output of the analysis

package so

banks

kind of data as we also call it

internally

um

and

yes so some things are inferred from it

and on top of my head i cannot tell you

everything i think

yes the sectors might be

um

assumed to be just the factor sectors

and the portfolio is assumed to be

called projected in the metric column

and things like that and

actually

yeah one of the things i

want to work on is to make it a bit more

flexible but then at the same time not

too flexible

and

with the other

uh question yeah we try to make the

error messages as informative as

possible so that if people don't have

the data

in the right shape

for the plotting function to work then

we try to inform them

not only that there is an error but also

why and what can they do to

um

to get the data in the right shape

daisy

thanks monica i i tried to be super

quick um

again like

really really thanks for this this is

great i think

i can speak for for all of us as

analysts it has been really really

helpful we were doing these plots in

excel i think antoine also knows this so

this is really really valuable for us

but one thing that i've noted and

um

so i would like just to search for your

advice on what should we do

when we want to save these plots because

i realized that okay maybe antoine and i

are working on the same project together

using the same data but when we

want to save the plot or save it as

image or save it as pdf

we get kind of different

versions maybe untranslation is bigger

than mine and if i want to replicate

then we need to do certain changes so

i'm just looking for some advice on how

we should handle this so if i want to

replicate something that are trending or

the opposite

we make sure that we get

kind of the same image the same size of

the image the same resolution um yeah

just just looking for advice on this

yeah um as far as i know this can be

quite complex because sometimes it's

dependent on

your settings like your r settings and

also your

computer settings

um

but

um i mean you could you would save this

plus the same way as you would save a

ggplot

object so

you can either save it in like if you

view it in

the

i think it would be

here maybe if i would run some code and

then you can

no probably not uploads then you can

export it you can also

save a digiplot object like there are

functions to save

an object and then you can also specify

the

size there

um

but i think even if you do that you

might still end up with different plots

to be honest if you have like different

computers

different operating systems

um

it can still be an issue

and one

yeah in the short term i was thinking

like what we use is the gg save function

and i was like

knowing that it was possible to

set the plot size

which i don't really do for now because

i

don't really use the

like when i save them i also copy paste

and directly

put them where i need but that i think

would be a short-term solution but

maybe also you might like maybe even if

we set the size on gt side

that will give different result time a

bit

not 100 sure but

i think that's something we should try

and see if it works

yeah

thanks everyone in terms of that uh that

makes me think that maybe monika

we can have a conversation about if we

need for example in the

vignettes

to show you know how people can do that

even when that's not a feature that we

ourselves develop and the features are

you know out there from g blood or from

whatever but it sounds that it is part

of you know the analysts workflow and we

may we may need to experiment a little

bit just to understand what would be a

good way

uh so that different analysts could

export the figures in the exact same

um in the exact same way uh like thanks

for the idea daisy something that

honestly i haven't thought about maybe

monika did but i didn't uh and maybe we

need to wrap up so i'll leave it to you

monica

um

yeah thanks uh thanks a lot everyone for

um

for all your questions also

and indeed also if there is any

like something about plotting that

you

do often and you often struggle with

then also please let me know because

then i could write

some article like what mauro mentioned

about how to do it if it's not even if

it's not like the code that i wrote

um

and yeah good luck with uh

with using the package

that's cool thanks everyone see you next

tuesday

bye

monica would you stay for a second oops
