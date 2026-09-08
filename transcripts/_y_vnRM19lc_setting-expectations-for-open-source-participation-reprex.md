---
type: Video Transcript
title: "Setting expectations for open source participation: reprex"
description: "oh okay we are recording okay I might be  okay I'm I think that was pause there  for a second so we're gonna be talking  about open source contribution and  bas"
resource: "https://www.youtube.com/watch?v=_y_vnRM19lc"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=_y_vnRM19lc"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

oh okay we are recording okay I might be

okay I'm I think that was pause there

for a second so we're gonna be talking

about open source contribution and

basically in particular just we're going

to be talking about how to write an

issue on github that makes sense to any

package maintainer with as little

context as as possible necessary to be

able to convey a bug or something some

day you're correct

you

it looks like we lost Jackson yeah yeah

he's gonna recover sometime soon

hopefully and in the meantime it would

be great if people can join the the

documents that we usually use I'm going

to show my screen so you can copy the

link

basically the before one is the date so

it's always that bitly sorry--but doubly

and always is the format is the the date

of today and then dsi I think I'm back

my internet connection is pretty

unstable which is not great so let's

just hope for the best of this and we'll

see how it goes I guess I stopped

sharing then and the you they

controlling it sure so yeah I'm gonna

paste the link to this to the shared

document in the group shop and please

piranha and have a look at just a word

doc so for those of you who are new to

Diaz incubator Jacob Ben and Daisy over

here we kind of are using this word

document to keep track of questions and

notes as you go through things keep

track of any information you learn as

you're going through these sessions

we're gonna skip sign-in because it's

already a bit late so this is just kind

of an outline of what we're going

through the the setup and basically I

just want you to focus on this questions

chunk at the end of the at the end of

the document so can everyone vote in in

flat or in zoom and just say when

they've opened the document and they see

this this shared Google Doc

okay so Berlin has terrible Wi-Fi right

now okay that's that's like s enough

people um so yeah please go ahead and

click on the second link in that list of

links to open up this art studio project

where we're going to be kind of going

through the workflow together and I'm

gonna share my screen as well so you can

see you are you have to make me a host

so I can share my screen right now okay

awesome

so never confirm that they see this the

same bitly document the same Google Docs

document and just vote in the in the

participants that I make a few if you

see it

I'm trusting that's the sharing okay so

if you guys just go ahead and click on

this second link right here you open up

an art studio cloud project and this is

where we're going to kind of be going

through the process together in

particular it should spin up a are

markdown file titled open source

expectations for open source

contribution so I'll give you guys a

couple seconds to open that up and also

brill in here if it's just not working

at all are you guys going offline as

well oh crap

well let's just hope I'm the best and I

guess just follow along here we can go

over it again after so basically what

we're going to be doing here is

downloading a kind of pretend

development our package directly from

github I'm finding out but a couple of

the functions in this package are broken

and have some pretty obvious bugs in

them and then kind of just figuring out

what the best way to communicate those

bugs to package managers might be so if

you guys go to the to the first chunk

here the the package that we're going to

be playing with is this to degrees

investing slash demo package on github

and if you go back in the in the Google

sheets there's actually there's a link

to it right here so you can go ahead and

open that up if you like and you don't

to worry about the code that's in here

that much but this is kind of the

package that we're going to be

pretending is some development package

that you're that you want to contribute

to or you want to you want to flag an

issue to or something like this so the

first step is going to be installing

this package in our studio directly from

github so I'm going to give you guys

just a minute and try to try to figure

out how to install the package that's at

this link directly into our studio using

this dev tools install option so I'm

going to just do a minute now on the

timer and just give me a ping when you

when you figured out how to how do I

solve this package

[Music]

[Music]

you

so that's a minute um if anyone is is

everyone able to figure out kind of how

to how to edit this code chunk to

install the package and if anyone has

questions just feel free to ask them

directly in the chat okay so I'm going

to keep going so you can you can pull up

the documentation for the function here

as well but basically all we have to

specify is two degrees investing so the

organization name or owner name and the

repo name and if this repo is interprete

Balazs in our package then we'll be able

and we have correct privileges to look

at this repo then we're able to install

it directly into our studio so they can

hit go and this should go ahead and

install the package right here

that's real I think might be a nightmare

cuz imagine

okay so now we have this kind of

development package installed and this

could be anything Tamar and I are

working on or could you know be it's the

bollock of a development version of a

tiny versed package or it could be a

bunch of different things um

the first thing we want to go kind of do

when we when we have this how this

package going is first of all loaded up

and then kind of have a look at the

functions that are there available in it

in particular I want you to pull up the

documentation for the function app

that's in this package and with that

documentation I want you to try a couple

of simple examples to see what that

function is meant to do and if it works

basically so I'm going to give you

another minute on the timer and just

kind of play around with this code chunk

and passed up a couple of different

arguments that function and just see

what happens

texts I've seen that there is a quite a

bit of cool material and representation

we are already 10 minutes into it just

come suggesting to move a little too

sure okay so let's I mean yeah so we can

just have a look here

I especially wanted to show you that the

odd function right here if we if we load

it up you can see the documentation it's

really just meant to sum the values of

its two arguments and if you give it you

know two and two and let it go you might

expect this should give you four and it

gives you zero so obviously there's a

bug it's returning some unexpected

behavior and it's something you might

want to report to the maintainer is to

have them fix or to fix yourself so

there's multiple different ways that you

can do this and I kind of just want you

to look at my screen for now because I'm

just gonna demo you know different

examples of how you might do this the

first thing you want to do who obviously

is is go to the github repo of this

package and go into issue this and I've

already I've already kind of posted a

couple different issues and there's

different ways that you can explain

what's what's going wrong or what's

happening that you're not expecting you

can do this don't do this this is

useless and not super helpful to the

people that are working on the package

the add function doesn't have values

properly please fix it why what doesn't

it do properly what's not happening how

can I see what you are seeing how can I

visualize the error that you found that

you want to communicate to me so this is

not the most useful issue that you might

see and in particular it's going to it's

going to beg for a bunch of questions

from us that say okay well explain

yourself or try to try to elaborate a

little bit more the easiest thing or the

better kind of thing that you could do

to describe that is to use a

reproducible example to show exactly

what the output is that you're not

expecting so that we can actually

reproduce that

directly and figure out kind of where

the bug might be coming from so what I

want you to do I've already installed

the the Rex package in this our CTO

cloud session what I want you to do is

select this code chunk right here just

in between the VRA chunks right there

click on atoms and click on Rex

selection and I want you to paste I want

you to just it'll probably something to

your clipboard I want you to just go

ahead into the github issues of this

repo add a new issue and just paste

whatever the output of that is in and

click start going to so I'll go over it

after a minute but just go ahead and try

how aligned 55 so you just caught a copy

that chunk right there and then on

add-ins at the top click rep Rex

selection

okay so I'm gonna I'm gonna stop the

time right now and you haven't finished

up that that's totally cool but

basically we're just I'm just gonna run

this code trunk first kind of show you

what it outputs on my console so if I

click go I see this this loads the

library demo it it tries to add two plus

two as you might expect you expect the

output to before and you can see in the

console that it or even in in line right

here that it opens zero if I select this

like RepRap X election I think you need

to choose yes or cloud - yeah gotcha

alright it obviously didn't try this one

cloud

all right I'm not sure though that the

rod in the rep Rex again okay this

shouldn't happen in our studio for real

but it's happening in the cloud session

so and we can take we take this kind of

direct output and not normally this

would just copy directly to your

clipboard but because we're gonna cloud

such then I gets a little bit different

but you can just copy this directly

that's this output here and open a new

issue in the in the a github repo say

it's a bug and in the body of the issue

you just paste that output directly in

and if I open the preview now I see kind

of like a like stylized our code of

exactly what the issue is happening and

what if she was going on and you know

this comment of a good expect and the

actual output in the console now the

power of this is that it kind of starts

a fresh like clean rerun of the Earth's

are on our constable to generate this

code meaning that it's not reliant on

anything you have in your global

environment it's not reliant on some on

some data set that you imported and did

a bunch of regulations on that no one

else could possibly reproduce it's

really just dependent on whatever code

you've highlighted so when I when I or

tomorrow or another maintainer goes to

kind of try to reproduce this example we

can just copy this code directly into

our console and we don't need any of the

CSV as used beforehand and we don't need

any of the other kind of data sets that

may have gone into making this error so

you can you can give them more of a

description at the top but honestly just

to say like I expect the output to feed

for that is more than enough for us to

write a failing test and to kind of try

to start addressing that

problem without understanding

necessarily where it comes from or

understanding any of any of the other

complex to that problem so that's more

helpful than saying anything else about

where that function might not work now

that's kind of like an abstract example

obviously this function is a pretty

simple sorry

it's a pretty simple ab function it's

not really anything that we're going to

be working on it to di but it's just to

kind of get your get your ideas out

there so let's let's go to a little bit

more of a more realistic example so I

want you to go back to the our markdown

file and go to line 65 here we're going

to look at a different function in the

demo package and I wanted to pull the

documentation for calculate average

production by groups so if you want to

type it quickly you can just type

question mark demo : : C and then top to

autocomplete it just have a look at the

documentation on your bit Amendment

there

actually I'm just gonna give it to us in

a minute so I'm gonna I'm just gonna

pause now but if we I'm gonna pull up

this this documentation right right now

and we see that this is kind of

something more more reflective before

2002tii

I want to calculate the average

production of a data frame and this

might this might you know copy the

production of the average production of

an asset level data set or the average

production in that portfolio or you know

something something that we may actually

see in practice it's I mean in the back

it's really just a simple wrapper group

by and a muted or a summarized so it's

nothing really not special but notice

that it has two of arguments it has a

ADA argument which is the the you know

Prime data set that's going to be adding

the mean production - and then this dog

argument which accepts additional

grouping variables so the sake of time

I'm just gonna go through it kind of

myself I've already downloaded our GDI

data in this in this art studio cloud

session so we can load up a fakey acid

level data set and have a look at it

something that we might see in practice

so here's the head of just I just loaded

in this this LD demo file and shown the

head of this data set we can have to

look here it's got power companies and

technology and production unit gear etc

things you might expect to see in the

actual Ald so we can use this we can use

the calculate average production by

groups function directly on this file

we're gonna get everybody just passing

an Ald here

[Music]

and so we see if we don't pass any of

the gripping arguments it just

calculates the average production of the

whole data set which is not really

something that makes a lot of sense if

we pass it you know a sector grouping

argument it will calculate the total

average production by sector which makes

a little bit more sense

we passed a technology grouping argument

it calculates the average production per

sector per technology total data set so

it's not the most useful function but at

least it's a little bit more

representative of working with day to

day and I want to show you what happens

if we take the this a LD file and set a

just one value in production to MA and

let's take let's try this and run that

and so you can see you can see now that

I just said some arbitrary value to na

and now the output of this average

production in in our sector is an na and

so this might be what you want you may

want the function to not handle any as

well and just to you know garbage that's

amazing but you may want it to

automatically omit na is or to do some

pre-processing to make sure that it

actually gives you some value that makes

sense so this is a little bit more

complicated to the rest of this is to me

a demo because it doesn't make sense to

kind of keep have you get the

interactive but this this is a little

bit more complicated to make it to make

a reference for to make an issue for

because you haven't you're now using

this quite large there's quite large

asset level data set it might it's going

to be some massive joined it instead of

a bunch of different things and you need

to figure out the easiest way to express

what the bug is without necessarily

needing to have some you know 3d

gigabyte file sent to someone

that's looking for what the issue is and

so I I just you know for this particular

problem it's a little bit easy to

isolate you can say alright I expect I

expect this to not have put n A's so

rather than use this you know this

modified Ald data data set I know that

all I really need is a data set that has

the : production at least one value and

at least one na and some some sector in

it so I can go on to excel nobody done

this kind of draft this really tiny tiny

Ald is that the only has like you know

nine Andrews in it copy it directly and

I'm gonna use this package that that CJ

pointed me how to called data pasta but

I can say hey LD demo I like it's fun

whatever you might call it does really

matter and use it up and under the

add-ins again under data pasta like

paste of scribble it still cause

this art studio okay well it's easier to

do in actual X to do and now I have very

quickly I have a you know are

interpretable representation of that

excel file without having to load it as

a CSV without having to do any reprocess

and just copy it directly into the our

console and you know just to show you I

can I can see what that looks like in

our studio you see a table and it has an

na value it has only three columns and

it's a really really really small

example data set and now I can load this

demo package and try to add yeah so I if

I run around this chunk I'm loading

loading the demo package defining this

set that has that's kind of illustrating

the bug that I'm finding and calling the

function where that where the bug kind

of shows itself and it like go on this

chunk you can see there's still an NA in

there power which is not what I want and

rather than have this massive data set

to show that a bug I have a really

really small kind of portable bit of

code that highlights that bug and I can

just copy that again as I did before

grep right oops record selection do this

fun I mean yeah click yes if you're in

here and then copy this directly into an

issue so now rather than having to kind

of you know explain oh you know this

this calculate function gives na for

certain sectors for this data set and

when I'm using this house a little data

stuff that I have to look beyond my

computer that's really big and I'm going

to email you the file and I'll send you

to Google sheets of this file and then

can you Skype me and MOOC owners can

call and spend all day trying to figure

out what's going on you can just post

this really really small portable chunk

that highlights exactly what the bug is

and say I expect this like I expect the

output for you know power to be 100

instead of na or something like this I

mean you don't have to even write that

even you can actually write that in code

even and now I can look at this and

directly write the test that makes sure

that the output does look like that and

then fix the code until that test passes

so yeah I think I guess those are just

kind of two tools there's an obvious

leave a bunch of different ways that you

can go about doing this but those are

just two tools that you can quickly use

to kind of drop things in Excel at least

them as small tables in art studio and

and paste them as reflects this directly

on github I'm gonna go for questions now

cuz I think that the meetings gonna end

soon and yeah I guess that's basically

it for now feel free to reach out with

questions

I know that was a bit rushed yeah yeah

it's impossible thank you for letting do

this thing and I really think like it is

it like one of the mr. practices that

should be like implemented but my opener

is like in order to make it work like

let's say on the github like if you want

to contribute to the repository then you

have like a contribution guide and

hikmah and if you are meeting like

so-and-so criteria then you attack

similar to that like whenever like

something like the raising the issue of

feature implementation we need to have

like a template on the each repository

that is like if you are means adding an

issue or heading for a feature request

needs to be in like this point so if

there is a template then even if there

is like a few users they do let's say

there are like other people who haven't

attended this session they might be able

idea based on the and also I would say

like if everybody uses it then it could

work page yeah that's a great point and

I probably agree there are issue

templates also that we have in place

tomorrow drafted but I absolutely agree

we need to say just that kind of the

standard of you know what kind of what

we expect but I think it's also a yeah

just wants it helpful to go through it

step by step and show people that it's

not necessarily that hard to generate

those things are there any questions

also from people who are less familiar

with reproducible examples and have no

idea what I just did or why do you

suppose over any questions like up

I'm sorry I could just you know it's

good thing to try and minimize the data

like your data pasta thing is really

cool it makes a small like reproducible

version of your data but yeah it pays

off to minimize that data frames with

something that just shows your problem

rather than a massive things yeah very

good point so and also like it kind of

is about because that means that the

person identifying that the bug needs to

think more about why the bugs happening

to make this really small data set to

isolate where the bug is happening so

it's kind of you know depends on who has

time and everything but definitely this

is a smaller the the smaller the data

set it is that can show where the bug is

happening the easier it's going to be

for everyone to figure out how to exit

and often that process itself like shows

you like exactly what's wrong and then

you can make a better issue and say like

all I realized like you're something but

not using that a not our M equals true

[Music]

that was at the 30 minutes mark now and

that I care less about to start thank

you everyone those two comments were

awesome and there is the file

contributing MD which is an official

kind of ish file for for contributing

guidelines so thanks for that reminder

program I think we should totally thank

you very much

turn around
