---
type: Video Transcript
title: "Avoid hidden arguments"
description: "okay thank you again then for joining me  in this edition of the data science  innovator I change the title of this  session to make it even kind of higher  lev"
resource: "https://www.youtube.com/watch?v=PHFOEKXPaxI"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=PHFOEKXPaxI"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

okay thank you again then for joining me

in this edition of the data science

innovator I change the title of this

session to make it even kind of higher

level because I learned of some very

good documentation about the topic I

wanted kind of address and better than

the one that I thought you knew so if

you saw some change in the title it's

expected and now this session is called

avoid hidden argument I think it's a

kind of more general principle than the

one that I wrote before it was about

basically writing pure functions I think

this is more an evocative and I hope

that examples will we've relate to our

work so the material I'm I'm showing or

the yeah mostly most of the text I'm

showing here comes from a book an open

source book that is called the tidy

verse principles it is the Tolliver's

design guide and it has a bunch of

really cool and nicely written pieces of

advice that I use myself and I'm still

discovering new things I've learned a

lot writing this presentation today so

I've seen a very common pattern in two

degrees code that usually is difficult

kind of to work with so I want to come

show the principle behind the changes in

that code that I would suggest so the

the principle basically is that the

hidden arguments may call really hard to

reason about because to predict the

output of a function we also need to

understand was the state of some

variable or some other state other than

the inputs of function so here in this

code snippet I'm showing I'm sure first

thing on I'm storing the value one in

the variable Y and then I

right in a little function that is

called ad and what it does it takes the

input X and then that's why so for

example if we pass the argument the

value want to add then what we get is 2

because now X has the value 1 but then

it adds Y and Y is also 1 so they'll

police too but notice what happens if

you know somewhere along the script the

variable Y changes from 1 to 10 some you

know this is kind of very clearly shown

here because there is not a lot of code

but imagine you're screwed buddy a

thousand lines or something and

somewhere along the script you know the

variable Y changes to 10 so now we call

the function add 1 so with the value 1

and so but because Y is 10 then we're

doing is effectively you know adding 1

to 10 so the value is 11 and this is

quite surprising because the same call

to the function I have with the input 1

now produces 2 different results before

before it was - and now it's 11 so this

is very surprising and it's generally

ill-advised so what we want is that all

the inputs of functions should be

explicitly shown in the you know should

be given all the input should be

explicitly given in the signature of the

function so functions are we're easier

to understand if the results depend only

on the values of the inputs but I'm

going to show later and after some

examples some cases of functions that do

need to get to access some global state

and when it's a good idea and when it's

not so let me show you you know we do

have code that is written that way so

what you know what can we do about that

and these comes explicitly from for

literally from from the guy that I

mentioned before the tiny virus design

guide so basically if you had a function

that has got each

it has hidden inputs then these two

steps that we can take so one is to make

sure the inputs are now become an

explicit option and and so if depending

on the kind of input you may be you may

want to print some message telling the

user what decision has been made and let

me show that with an example because so

far you must be very abstract and

difficult to understand so let's take

this function as an example prepare data

what it does is reads some file from

some path stores the value in data and

then only selects the first two rows and

the first two columns so let's call that

function prepared data so and now you

know at the global in the global

environment of my session I'm I'm

creating a path to that file because you

know I don't want to write into my file

system so for this example I'm just

using the temporary file I would have

disappear when the session ends so I'm

storing basically what I have here is

just a path to a file and into that path

thing I'm just writing a toy data set

the empty cars the famous empty cars

data set so I'm storing it into that

path so what I have here is just now

let's listen just think that you know

the path that I wrote here I have a file

that that's all I want you to do so this

is the little setup that I need to

demonstrate the example so now because

path has an actual path to a real data

set the data set empty cars when I call

the function prepare data so that path

will do is so the function prepare

available will do is kind of read that

empty cars file from that path storing

data and do the action that I wanted so

it kind of loose okay that is working so

prepared data that's what I wanted to do

it prints the first two rows and the

first two columns of the empty cars data

but remember let's go one step behind so

we have a hidden argument the heated

argument is these data

and the first thing we should do to

remedy this problem could be to make

sure that the input is an explicit

option so let me show you in a work that

would look like so what's the next step

so we have this function well what do we

do next

okay so data remember it was it was here

the first line so now data moves book to

the definition of the function and

that's about it to that all we need to

do it for step number one we still have

some work to do with this function but

you know at least data is explicitly an

argument in the signature of this

function so we see when you know how it

is defined we know that it needs data so

the user has at least know if it if the

user prints the signature of the

function you can see okay data is a

required argument but still because data

has a default read CSV pass and pass

exists in the global environment of the

user then just calling the date the

function with no arguments could still

produce output so well okay you might

think okay that's that's that's great

sorry user doesn't need to type anything

in here and they still get what they

want but we are still relying on that

path living in the global environment

and the global environment is something

very ephemeral something that you know

as soon as they press ctrl shift f10 I

restored my session and everything's

done so it's not very good idea so let's

see now step to remember so we did step

one which was to you know now prepare

data against the explicit argument data

so that was step one

not now step two would be to at least

mean form the usage the user very

explicitly the decision that we are kind

of making so that that would be one way

to improve this function a little bit so

we could do is say well okay if if the

argument data is missing because a user

hasn't explicitly even their data then

we can print a message

like using data with names and just you

know give the names of the dots so what

it would look like is something like

these so if the user calls the function

with no arguments then you know they

will see the this message using data

with names and in this case is the names

of the empty tires data set so it's a

little bit more informative even if the

user doesn't have to mean I

intentionally passed the what data needs

to be prepared they still get some

information about okay it makes sense

you know these cones are the ones I was

expecting for example but then if they

they do pass the argument data like in

this other in the second call to the

function paper data notice that instead

of not passing anything I am actually

passing the argument free dot CSV path

so I am passing their event data and in

this case because the user is giving

that argument then we don't need a

message and that's what the function

does because now the argument that is

not missing okay it kind of behaves as

we expect it but then even better could

be to kind of reflect on what kind of

argument each data so we do need data it

is the main argument of the function is

not a details argument is not something

that modifies some property of the

function it is the most important

argument and the telomers design guy

recommends that for data arguments

because they are court data we should

you know require those arguments we

should ask the user to do that extra

effort and eva's that data because it's

such an important argument that the user

have to be very intentional and that way

you know they're very sure very much in

control of what the output is gonna be

and it also recommends that those

arguments are usually called data as I

showed in the example or maybe usually

when if they are better friends or they

might call X or

like for example a function from the

player say let's join it uses x and y so

what would happen now if if we do that

change so if now data does not have a

default meaning that it is a required

argument and notice that the function

becomes way simpler so it's not only now

according to kind of best practices but

it's also super simple it doesn't have

an a default here and we don't need to

check for missing data because we are

forcing data to be given by the user so

now if the user calls prepare data with

no argument I'm using the function try

I'm writing I'm rubbing this co2 around

try and so that I can show the error but

I can still run this though

so notice that we get automatically an

error that says every pair data the

argument data is missing with no default

and we get that for free we didn't have

to do any if you know data is missing do

this or do that that comes comes from

free by not setting a default to take

them which is what very nice behavior

and we obtain that in a very clean way

so now that the way we would ask our

users to use our function would be so

they actually you know they create a

data frame outside the function

maybe yes by storing their object in

data and then passing that data to the

function or maybe just not writing this

just inside here so that's the end the

end of this what's over factoring this

you know they need the recommended way

of writing this function before we were

reading the data inside the function and

now we are forcing the user or asking

the user to really outside and then

passing the result in data frame into

the prepared data function but ok

sometimes some functions do need to

depend on some kind of external state

for example but we put my when that

happens we

or may not surprise the user with the

behavior of the function so and a

function has hidden arguments as we

showed before in an example but you know

if we articulate that when it returns

different results with the same input in

a surprising way let's let this show you

what it could be surprisingly here for

example let me demonstrate a call to the

function that about frame so we created

add a frame that contains a column X and

it has the just value a so if we now

extract the column X from this data

frame we just created what we get

depends on a global option the globe the

goal option strings as factors so with

the global option that comes by default

with that develops a is true so with

that goal option that about frame would

return a factor but now if we change

there all options to be strings as

factors equals false if we call the

exact same function that yeah we call

that about frame and we do exactly the

same thing so this is exactly yes now we

don't get a factor what we get is a

string so that is a poor design of data

frame but about frame function that's

why we always need to kind of type pray

often we need to type strings as factors

equals false when we created at a frame

or when we read a file with a function

free dot CSV so that's not not ideal and

it remains like that for mostly

historical reasons I mean changing that

would be a pain in brakes so much code

but generally your global options are

required but generally or sometimes I

worry about generally it's a good idea

to the to use them only for display like

for example how many rows of it not

afraid you want to print on your console

or something but they should generally

not affair

computation so in this case it does

effect something that is computed and

not very good idea and finally and

that's the last slide of this

presentation there are other functions

that do also depend on global stay but

the result is not surprising so there is

no problem with that so for example the

function Vreede underscore csv call with

a particular path of course depends on

the path which is the input but of

course it depends also on the contents

of the file to where this path is

pointing so but that's fine right

because because you expect so you want a

really particular file so you expect to

get what the file content so that is an

external effect something that is

outside the inputs but still it's not

surprising so that you know there's no

chronic will read CSV so if I show you

that example here let's write a file to

a path and then let's see what are the

names of that path so I call the

function area and there's called path

three underscore CSV with the argument

path and I get the names in this first

case of empty cars because I have just

written empty cars to this path but now

if I write I raised to the same path of

course I will get something different

but but that's not surprising that's

precisely the purpose of of this

function so that is what I wanted to

demonstrate I hope they have kind of

prompted some reflections about you know

the code that we already have and even

use some guidelines about kind of

demonstrating what problems you might

encounter with that code and give you

some guidelines about you know what to

do next if you want to kind of change

that code from the state is now to

something that is easier to work with in

the future with that I'm finishing my

presentation so I look forward to your

questions

13 doesn't seem to have questions so can

you go to your slide number 8

let's see yeah

and I am confused what happens when if

the data option is missing and this

missing data is true so that this

message begins and then you're taking

the names of data which hasn't been

passed so does that then depend on this

object data being available in your

global environment one of the arguments

of the function or like I would kind of

expect that the message function to

actually error out unless the data

object or an object named data existed

in either global environment somewhere

else that this would have access to

right mmm okay

yeah these could easily have it back

because it's an example that I type my

cell phone feeling quickly so the names

of Taeyang so here we are passing okay

so here we are passing data

okay so data here is available hearing

names data because so this data comes

from here and this comes from here and

passes in the global environment I

define this path like one or two slice

to go here so path is pointing to this

CSV file so yes certainly if path that's

good and exists then this could be an

error that's right yeah yeah but I guess

like it's also weird because the missing

data essentially would never happen in

this function right well like in this

case so in this case here so I'm not

know

explicitly passing so to see that this

is the same call except that here I pass

the argument data explicitly the user is

passing the argument data explicitly and

the only difference is that this one

doesn't print the message so these if

missing data doesn't we are not entering

this if statement here the missing data

will will give you a true if you didn't

explicitly class data but the data

object is still set by default there's

no yeah actually I maybe I don't

understand very well missing because I

was actually surprised myself of not

seeing the printed message here but I

did copy this example from from the book

I also had expected to something a

little different

showing that I probably don't understand

missing data very well

yeah but you know that's why I'm

learning alone because sometimes I think

I understand something fluid and I don't

it's kind of cool what I see actually

here I was surprised you know give me an

interesting way yeah sorry I think that

you know this conversation was a little

geeky maybe it's not super relevant to

there today I'm at the most important

point I guess is that you know those

functions you know we see very often our

code that depend on some data sets are

not even as inputs and are really

difficult to work with

I'm very difficult to test I'm very

difficult to predict what's going to

happen and so basically I'm just trying

to give you some tools to very slowly

and as you touch that code to start mean

you're moving those thatis those

arguments to the signature of those

functions outside whenever just quick

comment if you go to slide 9

yep mm-hmm maybe it's the this is it

yeah so that area you get Miami sin is

that you don't get that until like

something in your in discussion actually

attempts to access that object just as

the like you need to be aware L for it

since you're prepared a the function was

doing my lots of calculations

potentially some that are like super

expensive and then not ever accessing

the data object until later on all of

those expensive operations would happen

for as I understand this error gets

thrown it's the first time that object

is intent is trying you try to access

those something where like you do get

that error message for free as you said

it's to the point but there are

conditions in which you may want to more

explicitly check for that and not take

the free version I agree yeah right yeah

because of the lazy evaluation right we

start with scolding the in the our

jargon yeah

yeah it can be tricky in other languages

is not allowed as I understand I'm not

understand that that's that's just not

an option but you know it's so flexible

you can't do something like that you

know you can make every quite I remember

if you never tried to access that

argument the function will just work

okay the tiny vs. sign guy is working

progress you know the last time I read

it was probably six months ago and you

know a few things and now I revisit the

guide and I'm learning more things so I

may be motivated to read read it and I

don't know if you know I should advise

you to have a look or not because you

know there are some some sections are

still incomplete but it's something to

keep in mind because not not not so much

because I think it's is the best way to

go about things but mostly because it is

one way in which is documented so I

think that when when there is

documentation somewhere that we can

refer to it is easier to come to a

consensus than will just depend on you

know how people like doing things so

with this I'm trying to say you know

maybe some of the principles that I'm

demonstrating here in general may you

may not like them that much as sometimes

I don't like them much either but I

sometimes prefer to just join a club

dice already you know going on and do

things my way so yeah is there any other

question or a comment okay cool thank

you very much then I close the session

and I look forward to the next one

[Music]
