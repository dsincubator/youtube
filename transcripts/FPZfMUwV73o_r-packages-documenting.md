---
type: Video Transcript
title: "R packages: Documenting"
description: "God I have okay so think clicking there mess things up right so that's something when I record you know the sharing apparently restarts about documenting our packages..."
resource: "https://www.youtube.com/watch?v=FPZfMUwV73o"
tags: ["ds-incubator", "r-packages"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=FPZfMUwV73o"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2020-02-25T00:00:00Z"
    usage_count: 10
usage_window: { from: "2020-02-25T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

okay cool so the another science equator

of today is the goal is to discuss the

last part of the last of the sections

that I wanted to cover about our

packages and today we are going to be

talking about oh my god I have okay so

let me share my screen again because I

think clicking there mess things up

right so that's something when I record

you know the sharing apparently restarts

so that that says innovator of today is

about documenting our packages and my

focus is on kind of high-level and

documentation and but before we with

this I mean you know things like you

know readme or website but before we get

to that we need to talk about the kind

of lower level documentation which you

said a little of a function because we

haven't core that yet the other

announcement that I have as a what

announcement that wasn't record is that

we have now a checklist that will go

over to avoid going beyond time also I

said alarms in my phone so you will hear

them ring at some point and the other

announcement is that the next size

Equator could be great if we have a

guest and it would be great to cover one

of those topics that are not essential

but something that is more fun

I've seen very cool propositions and one

I really like is the one about longer

weather but I'm open to other

suggestions to you know the next couple

of days and then make a decision on what

week whoever wants to deliver next week

anything any question about that before

we actually dive

No okay so the objectives of today is to

try to discuss together you know why

documenting well is a good thing not

only for users but for developers and

also you know the shortcut you know to

create a oxygen skeleton to never forget

important things about the documentation

of functions try to discuss why examples

are so important and how we can reuse

them in multiple places including for

example Rigby while Wrigley is important

and some coaches that are very common

and finally to kind of very quickly

explore a website to find a package

website to find what we are looking for

so um so this is open for discussion and

from the users perspective who would

like to share you know how do you think

users benefit from good documentation

how do we think if you don't benefit

from it yeah from the perspective of a

user you know why you can empty in a

package well is useful well just so you

know what the features are you can fix

problems I mean I think it definitely

depends on the on who this user is I'm

the type of user that actually reads all

the documentation before I could start

something and yeah most people like go

to Google Stack Overflow before they

even look that's a good boy someone else

he said like first of all if you need to

learn about a new function someone in

the meeting goes straight to the example

section before like reading like you

know CJ said he breached everything is

there anyone that just goes to the

technical section first

yeah very guilty of that

so what is your reaction when you go to

the example section and there is no

example yeah I guess that guy's the

documentation yeah

and when I don't see an example of a

knife I like to difficult to understand

five seconds

I just hey so it helps both also the

developers I think because especially

from my perspective as a developer when

I'm kind of building a feature with

someone else you know

understands the chromatic conceptual

level sometimes the examples is just the

means I have to communicate with a

person is trying you're gonna give me

con simple information so that I can see

well is this the implementation are you

looking for something different so it is

vehicle for communication

I believe so that's you know money might

be in from the perspective of a

developer has anyone kind of noticed

that you know documentation at least in

our you know is very consistent you know

if I always arguments in one section the

expected results are whereas example how

many one notice that already yes you

know and how do you think that would be

useful for like both the the idea of

kind of developing template and trying

to cover up eat the destructor of the

documentation how do you think it could

be useful both from the perspective of

the developer and from the perspective

of a user and it's someone it hasn't

spoken yet is brave enough to say

something helpful to know exactly where

to look at I mean like I also chopped

most of the times to the examples and if

I don't find all the information I go up

to me just because that's the second is

someone to understand and then the rest

really look at but I mean having at a

standard template it's making much

easier for everyone to look to know what

you know where to go

if you really expect a specific

structure at least even if the section

that you know if you're looking for it's

not mad at this you know that you're not

missing anything you know it just

doesn't exist so I think there's a lot

of value in trying to develop template

and to write pigmentation in a

structured way which is a little painful

sometimes because I know I am knowledge

that sometimes you know this if we

change this you know the hang of this

section if we call it this other thing

because it just looks better because I

want to try something different but then

but every of those changes comes at the

cost of breaking the consistency and and

you know makes the users of

documentation spend extra effort in

trying to understand what you're trying

to say so I think we covered this in

very good detail the one trick I would

like to kind of show is okay in building

those templates there are some shortcuts

that you guys we can use so basically

for example to remember to or to not

forget any important section in the help

file it is great to use what's called in

certain oxygen skeleton I know are the

interaction or whatever it is so let me

demonstrate what that looks like in case

you haven't used it before so I'm still

working with a demo package that we

started some time ago

and we'd be less time dysfunction and we

tested it but we haven't yet so if I go

to code and insert oxygen skeleton what

I get is this thing that you know it

basically prompts me to type a title

explain what X is explain what the

return value is something like vector

data frame and it has the very useful

example section so examples are super

important I believe I use it a lot and

it's very strongly advocate for making

effort in making a very good example and

it's painful to write a very good

example because it hurts your brain but

they're good uses are you going for uses

in many places for example if you wrote

a test you can just you know copy/paste

the test itself and we know you could

reduce it so this this could be the

example here but it also could be the

example in higher level documentation

for example reading so any ID any

comments there on on the importance of

read me

[Music]

why you know the file is useful okay

context of your so standard is beyond

the language is something I cannot see

everywhere every time you need to

understand what the project is about you

could read the readme file and you have

renders something a file that is called

readme dot MD have renders it in a

beautiful way it shows it as if it was

like and I use this package has this

function use readme and it has two

flavors so I recommend they usually are

MD to run in your package because that

creates a readme the RMD file which

allows you to run not only not only to

type text files with run code its

executable and it already comes with

like a template of what you should write

there and for example in the example

sections what I could do is I remove

everything there except attaching my

package and I go do something like you

know may sting the color I wrote like

copy from from

my example so if I now make this file

clicking here I should get the render

version of the readme that will be

displayed in an error that is we see

here is one of the coaches that I wanted

to talk about so readme is very picky

and that's one good reason for using it

for example readme gets the functions

not from the source code that is here in

my in my files right so I mean in the

project demo but rythme is not reading

the functions from here from my approach

is reeling it from the installation of

the package demo in my system which

means that the package needs to be

installed if I have just developed a new

feature say max - min is a new function

before readme can use it I need to first

install it so remember that we did

discuss this idea in the build tab it's

a bunch of actions that you can do

including installing the start session

so that should make the demo package

available in the readme file as well

because they you know that your your

source package has been now compiled it

lives somewhere else in your system

actually here where it is installing

this particular folder here and now if I

render readme I still have probably here

it is that the function max - min is not

it can be found and what's the problem

okay and that's why I like because it's

it's very picky so it looks like you

know I did add this time it's called

export export tag what does is makes of

fungus available to your users and I

think I might have forgotten to document

my package so the documentation creates

a bunch of actually my first alarm

saying I should soon great he's working

so I documented the package I created a

namespace

this process namespace should have now

the function here that's good

I know I hate installer restart I'm very

still in the package because the

previous version that I installed like

five minutes ago did not apparently have

that feature that I was looking for just

in case I'm going to restart my session

and I'm gonna click meet again okay now

it did render great so now you can see

that that the rendered version of readme

is something like what you could see in

and this is coming from the rib meat MD

file so the second go chat I wanted to

mention is that these files MD and our

MD need to be synchronized so you always

need to meet your hair MD before you

create a commit because otherwise your

committee might fail and it was because

there is meant to be those two files are

meant to be worked in combination so I'm

very close to the end I need to shut up

now

so the last thing I wanted to show you

is what a package could look like in if

you create a website for you which is

super easy I'm not going to go over that

because I'm mostly covering for people

that contribute to pirates packages not

so much for those would be purchased but

basically a package website changed okay

so I could use any other website by the

way let's see if this one works

let's mister p.m. March

so let's go to the website of the much

package
