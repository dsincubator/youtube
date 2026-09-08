---
type: Video Transcript
title: "reprex: overview"
description: "today the dsn greater starts a new  series and it is about the rebricks  package which is a word smash between  rep producible examples  so  the motivation for "
resource: "https://www.youtube.com/watch?v=erv1yJaNID8"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=erv1yJaNID8"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

today the dsn greater starts a new

series and it is about the rebricks

package which is a word smash between

rep producible examples

so

the motivation for using replex is that

you know when you're reporting a bug or

requesting a new feature or uh or

whatever you're doing

that involves conversing with code you

are going to be a lot more likely to

have success if you write or you include

a very good red rex

so today we are going to be

overviewing the package

very quickly because um i don't know if

you notice but in the last couple of

series

i have structured the series so that

there is a

a quick exit point so the idea is that

you can join for one two whatever

meetups until until we round something

that is the minimum stuff that i think

is useful and then you can move on with

your life if you want you can stick

around to see a little bit of more

detail about the topic so this is a

short series and hopefully by the end of

today we will have covered all you need

to know to at least know what repress

can do for you and you know why you

might want to use it and then if you're

interested in more details you can hang

out for maybe one or two more meetups

and then it's going to be the end but

even if you don't join future meetups

today's

materials should be enough and it's

going to be recorded of course

so that's all i wanted to say about the

motivation and the rest that i want to

talk about is an overview of the package

starting by just explicitly saying that

it is a package and if you want to use

it as usual you have to do library

replicas but because it is a package

designed for interactive use only then

it is also safe to add these couple of

lines to your our profile so you can

open your ad

our profile with the function from the

use this package edit underscore r

underscore profile

that will pop up a file and you can just

copy paste this code and that means that

every time you start a new our session

uh rubrics will be available to you so

you don't need to do library replicas

it's already there

so the

motivated example that i'm going to be

showing today comes from an issue that i

found in the fs package a while ago it's

an issue that is already fixed

and it happened on

or i discovered it

in the version 1.3.1 of the fs package

so this is a snippet that is a little

smaller than the one that i reported

when i reported that bug

but

i'm gonna be using this throughout this

meetup and maybe in another meetup

because the point is not so much about

the content of the replex but mostly

about how to use it

so uh

what i want to

know what i notice is that this behavior

that this code shows is uh odd is not

expected so let me break this down for

you so here i'm you know using the fs

package which is the one where i

detected the bug

i i you know wanted to be explicit about

which version i was using so i use the

function package version fs

that return 1.3.1

and so this function is the start of the

show the one where i notice the the bug

so say that you have

two files so a and b here are you know

the simplest way i could imagine

representing the names of two different

files if i go a and a file called b

without an extension so the function

path extension set in the fs package is

supposed to whatever extension you say

here to the right to each of the paths

that um you know are given in the first

argument so the output that i was

expecting is a dot csv and b dot csv but

instead i got b dot n a so that is the

bug that i wanted to report so i needed

to start a conversation with the

developer which is jim hester and and

repressed helped me do that so i'm going

to show you now then what

ways in which in which many ways you can

use replex to report backs or even to

start a conversation or slack with

someone and we do that a lot of the time

on our organization at 2 degrees and i

think that this

series in particular is relevant because

a lot of us

are already in the organization but many

of us are new so

basically

creating a standard for how we prefer to

talk about code could be i think useful

so how we create repraxes so let me go

to

my rstudio here

uh here we are and i'm gonna have this

here on the side

so there are a number of ways that you

can use red bricks the code that i

showed you before is the one that i have

here so the one that i use the most is i

usually just highlight the code that i

want to create a replex for and i press

shift ctrl p to pop in r studio in a

modern version of r studio to pop the

command

navigation bar and then i start typing

rep rex and usually you know that

filters for these two

um

add-ins uh that come with the package

and the one i like the most is replic

selection so you know if i have selected

the code and it's just if i just hit

enter that will already create a rubrics

for me as you can see here now on the

top right of my screen the rubrics has

been created let me move this to the

left so you can see it so basically you

see now not just the code that is here

in the top left but you also see the

output

right so that is one way in which you

can create the replicas of course the

common navigation bar the one that i

accessed by pressing shift ctrl p is is

no more than a shortcut to clicking here

in the addings

menu and start typing something like

replex

so you access the same thing here so

that's another way that you can use

revlicks so

then let me show you other ways

to use rubrics i'm going to make this a

little smaller so that should fit

on here

so the function replex itself called by

itself will

will look for stuff that is in your

clipboard meaning that

if not only i select the code but if i

also press ctrl c if i copy that code

now i can go to

the console and just type replex

and that should

just work so that should create replace

here so let me clean it up because maybe

it's it's not not so what actually

happened so if i have something in my

clipboard you know i go to the to the

code select it

and uh with

ctrl a and copy it with ctrl c then i

can do control two to move to the

console and and just type repress

right and that will look into the

clipboard find the code and create the

right bricks for me

importantly the replica the output of

red press is not only shown in the

viewer but it's also now again back in

your clipboard meaning that if you need

to share that somewhere say that you

know this suppose that this is a github

issue or something you can just paste

with ctrl v because it's in your

clipboard right and and what you will

get let me show you here

is

the code that you type plus the output

right commented and that's important

because

as we will see in a moment the person

who actually runs that code

if that was uncommented that would break

the code from running i'm going to show

you that in a moment so let's close this

file

and navigate a few other ways in which

you can use replics

so

my little note here okay so replex comes

with a bunch of arguments

so if you do

you know the typical question mark

repress

or if you step on the name of the

function and press con f1 you access of

course the help file and here you will

see that even though replace you know

feels very natural and you can just call

it and it will work

there is a bunch of options that you can

use and some of them are pretty cool so

i wanted to show you in this very brief

overview some of the one some of the

options that i think are the coolest

so to begin with session information

sometimes uh you know it's important to

know which

environment you are using when you run

the code in this particular case i chose

to add the package version explicitly as

part of the replex but i could have

omitted that and then

instead i could have done oops

let me select the code again copy it

again with ctrl c go to the console i'm

going to clear this up with ctrl l and

type rep rex but now this time oops i

didn't want to do that red bricks

but this time i'm going to use an

argument i'm going to say

session

session

session

info equals true

and only now run red bricks so notice

that

the output now if i scroll down

not only has the code that i uh the code

and the output as you expect but also

has this drop down menu that if you

click there you have information about

all the

environment that was running by the time

you run the rubrics so for example i'm

running an operative system ubuntu

20.04.3 blah blah blah and it includes

the version of for example fs which in

this particular example is particularly

useful because it is the version that

exposes the bot right sometimes

including that argument is crucial

i see uh i hear a

being for

comments go ahead

is the drop down menu something that's

supported in markdown like is that does

that just show up in uh

yes yes yes absolutely actually let me

show you now if i create a new file here

and because you are familiar with uh

markdown art markdown and maybe a little

html you will probably identify what's

happening here so if i paste the replex

that is now stored in my clipboard you

will see that it has this

html tag details which surrounds the

thing that is going to be included in

the drop down menu so basically the the

details tag is what adds the drop down

menu magic

very cool

let me go back to the mic

um

[Music]

good

so let's

refresh what other ways i wanted to show

you uh to use flipbricks okay venue so

what happens is that sometimes so what

happens is that the output of replics is

optimized as um as jackson just kind of

suggested for github

and in general you can post them usually

in github issues but you can post them

in you know pull requests you can post

them in gists which are very useful as

well i don't know if you're familiar

with them but i'm going to show you just

in a moment let's do if i go to

gist.github.com

everyone who has an account on github

has access to this gis.github.com

which is a place where you can just

create a file and paste whatever you

want including a replics so let's do

reprix example dot md an md file and

create a public gist

uh here pilot gist if i click click the

green button

just as jackson was asking so now i get

this expandable menu because it's this

you know the feature comes from html has

nothing to do with with replex so now

reproductive is reusing the option of

collapsible html

text

um so yeah that's that's just um so the

other thing that i think is super cool

is that um

the output can be optimized for

different venues so as i said before

github is the default but for example if

you want to post that on slack it will

look pretty ugly oh

let's see if i have slack here

slag dot com up

that's like well maybe i'm not going to

do that in case some kind of private

conversation pops up but basically you

know how in in slack if you do backtick

back tick back tick it creates a code

chunk and then whatever goes there you

know is shown as code so i use that

quite a bit to share small references

so the way you do that is

you

again you know you can select the code

that you did before and now if you want

to optimize for slack you can do repress

replace

underscore

slack and that will create the output

slightly tweaked optimized for slack or

there is one that i use a lot too which

is replex dot underscore r which just

creates the vanilla code without the

backticks included so

let's see

yeah this is the output now so this this

usually what i do is i use replex

underscore r and i go to slack press

back pick by click by tick to generate a

code chunk and then i just space what

replex gave me when i run rubrics

underscore r so that's the way i used it

a lot just to share small red practices

on on on slack but if the replace gets

long i prefer to create a gist and

instead share not the the snippet itself

but instead link to the gist instead

let's go back to my

memory refresher okay so another cool

feature is the input argument which

allows you to basically write the

rubrics in a file and then call it from

your replex so if for example in this

case you can see how i have here in my

files menu my files

tab

i have this file called issue 205

so that that file actually contains the

same replicas that we're working with

right now so because i am now let's see

where i'm you know get wd where i'm in

my in my system so i at the root of

replex but then uh in this in this

folder zero one overview i have this

file so what i could do now to run that

replex

let me uh

do it here i could do replace

i could do input

and say uh

zero one underscore

overview

and then search for the file issue

at 205. so if i run that i'm gonna get

the exact same thing um which is

sometimes convenient because you know

you explore and develop your rubrics

usually in a maybe an untitled file then

when you reach a good a good point of

that replex then you you know create a

file and maybe maybe you save it

and then you can you can just leave it

there and call it with replics and the

argument input

um

finally

for the call directly to replex they

only also the the other way i wanted to

show you how you can run replex is with

directly passing an expression so say

that i have this code i do not want to

bother actually saving the file one

thing i can do is is to wrap all this in

in red bricks so let's do this

reprix

uh so here

i could paste just the expression

but because this is a multi-line

expression i need braces so if you're

not familiar with the braces they allow

you basically to inject multiple lines

as if they were one you know i will know

how to how to read that so you can now

paste expression usually it messes up my

formatting so i do

ctrl a to select all then shift ctrl a

to run the formatter automatic formatted

formatter of our studio the one that uh

the cj likes a lot

and that will give me a beautiful format

that i can use to just you know now

press ctrl enter and run the red bricks

but the beauty of this is that because

you are calling the function directly

you cannot now add arguments so i could

say now you know session information

and you can start kind of building the

rubrics that you like the most and you

can say something else you know maybe

when you

are

so you know you are polishing your

wordpress here like you need some

arguments the expression is there and

now you know you are you know tweaking

you know the output by by using the

arguments right so in this case if i

scroll down i would expect to see the

the session information thingy yeah

there it is as you can see uh let me see

where we are at okay so the last adding

the last way to show to create replaces

that i want to show is another add-in

that comes from with replex

i did show you uh let's close this file

without saving because i don't want to

well in any case i have git so i can

check it out um

so here is it so the other way i wanted

to show you is the other adding remember

when i did uh when i popped up the

commands navigation bar with shift ctrl

p and started typing prepregs i get two

options so the one that is more feature

is render replicas if you click there

you will get a gui that allows you to

basically pass a bunch of the arguments

that you can use uh

if you call

repress if you call the the function

itself but you can select them from here

for example you can say you know current

selection is is where you know you

should be looking for the source code

the target venue should be a slack

message and and then you just go to

render i hear the bingy for comments or

questions please go ahead

perfect thanks jackson i have

very little to cover um

ready to cover so i'm gonna push for two

more minutes

so the first thing i want to show is is

the other side of the question right so

you are so far i've been showing you how

you create a replica to share with

someone else but the conversations is

between at least two parties or maybe

yourself in the future whatever but uh

so basically you know if you if the

other person gets the output of a

replace the replica could look something

like this right so it has the code like

this is the vanilla code but then line

five here has output right so what is

beautiful about replex is that it just

works so the other person reading the

replicas may not even need to run

anything because the output is already

included so that's the first thing that

is part of the philosophy of the package

so if the other person doesn't want to

and they get what's going on they not

they do not need to run anything but

then if they choose to it should be easy

and why well because the the output is

there but it's commented and you can

compare it right away with what you get

so on the other side of the question

someone you know gets your replics they

select it

from say

you know github whatever right and they

have in their clipboard and then they go

to their console they just paste it

there

and they run the code and it runs it

doesn't break because the output is

commented right so as you can see this

line here

is you know shows that because the

output is commented this line does not

break the execution of that code and i

can now compare what i get in my

specific environment which is a dot csv

and b dot n a and i can confirm that

it's the same thing that the person who

created the red bricks gets you know in

their own environment right so that

that's one beauty of red bricks but

that's not all so if this is what i have

in my in my clipboard you know remember

it has the output you can also clean it

up to extend it so you can use the the

function replex underscore clean

and that will you know go to your

clipboard remove all those lines that

belong to output and make it clean so

that you can paste it and get just the

output and why that might be useful well

because maybe you want to continue the

conversation and maybe edit the replica

say i'm going to remove the assignment

to file here and replace it by the

inlining its contents so this is the

same red bricks now reformatted

differently so i can you know i'm on the

other side of the world

i read that red bricks i copied it i

cleaned it with redpress underscore

clean i edit it a little bit and now i

can create it again with render replace

or render selection which the one i

actually like the most is render

selection so i'm going to click that one

and there it is my new replica that i'm

going to share with the world it's going

to i'm going to paste it like this

and i'm going to share it again

and the very last thing i wanted to show

is that sometimes

sometimes

life is not so easy and you can't just

create data on the fly so this thing

here that i called files before

right it's a piece of data it could be a

data set it could be whatever

but it's just a piece of data and now

i'm creating it with code

on the same file where i create a

replica so that's the ideal world that's

what makes the whole thing reproducible

but the world the real world in which i

live is not so good it's not so nice so

sometimes i need to rely on files that

exist in my system so if i wanted to

read a file say the file paths this one

here actually maybe i think this file

doesn't really work that well um

[Music]

but let's see uh so if i wanted to read

that file

i could do something like

read

rds and i would give the path to that

file

0 1

overview

paths

so i can do that here right in my own

system

i can create you know that files object

that i showed you before and now i can

you know run it it kind of seems to work

but what happens when i call replex so

i'm going to copy this code go to the

console clean with ctrl l and call

repress

what i get is an error and why because

replics to ensure that the code is

reproducible

runs on the background in a completely

fresh environment in a completely

temporary um

context so it has no access to the file

that i have in my own environment in my

own working directory so how do you hack

that and actually share replaces that

might not be reproducible but do show

the point and you know what happens when

you actually use a specific file and

then you eat maybe you email that file

to the other person and then kind of the

the picture completes well the trick to

that is the argument wd so how i use it

usually first i create the red bricks

locally then i cut that code

called red bricks red bricks

i do the curly braces thing paste that

there format it with ctrl

shift a

and now other arguments

we can do it you know here wd equals

here

that means working directory is where

i'm standing right now my current

working directory and now when you run

that red bricks

fingers crossed that should work and and

here it is so of course the other person

in the other side of the world may if

they don't have the same project that i

have they won't be able to reproduce

this in their own environment they will

need me to email them or select them or

whatever the file that i'm reading here

but if they do get access to that file

then they will be able to reproduce

these red bricks

okay i think that covers everything let

me just confirm

uh rap

yeah so that's what i call the not self

replex not so reproducible example on

your working directory

all right a few minutes to the end so

please shoot with your questions and

comments

yeah so today i hope that you know

anyone who does not join the future will

have

at least the mechanics of the package

but yeah i'm hoping to have one or two

more sessions no sorry two or maybe

three sessions more including some

aspects of the design of the package

okay

so that answered my question for what i

was trying to get it so i wanted to make

a point or say something about like

i think that the rep rex package is

super cool

and i'm also super happy that i

work primarily in a

field or with a language that is so into

making

many more reproducible examples that

there is a package specifically for this

but at the end of the day the package is

simply a tool that makes

creating a rep rex easier which is great

it's fantastic

but i think the idea of

why

and how one

conceptually creates

a reproducible example is super

important and relevant not only for our

but for all languages and even for

things that go outside of a language for

instance a website so we have

adolescents saying like i keep seeing

this problem on the website

the concept of what a

reference reproduce for example is valid

also in that context so it i think would

be interesting one to talk about or

reference what it means why

how it works and how it helps someone

yeah i mean i think you get the point

and then also an additional point

similar to this is

thanks cj yeah i totally agree to the

point i mean if you're interested in

what cj has just said then do join next

meet up which is going to cover the

vignette

represents which

basically goes into detail about each of

the topics that cj commented and at a

very general level beyond the actual

implementation in the rubrics package so

why you would want to do you know

a minimal example as opposed to any

example and things like that and then at

the end of that article includes a very

small section about the design of the

package about the philosophy of the

package which i think you know for those

who are more tech oriented it could be

such a joy just to talk about how the

philosophy was first explicitly set

with just three bullet points and then

how that decision drove the entire

design of the package so

whether whether the function should do

this or that was clear once they design

what once they determine what's the

philosophy of the package so that's

that's super super cool too but that

might be another session maybe the third

one and only for those who are

interested in building tools

monica see your hand up

the unpleasant answer is that you can't

ensure that the other person has the

same environment all you you can do with

replex is to share the session

information so they know which packages

you have

and then the way to ensure is beyond the

scope of replicas and will be something

more related to the previous series that

we run which is docker so you know if

you if for some reason you want to

ensure that the code that you run is

going to run in a specific environment

the tool the best

today you know the tool that today is

best fit for that is docker so basically

you ship the entire computer that

contains not just the code but also

the operative system there are packages

the specific version and so on but

usually that's an overkill for most

scenarios it's not a problem but if that

is your particular situation

absolutely you know get in contact with

any anyone who has um yeah but basically

anyone who can help you debug the issue

uh maybe you want to help this or

however you like and i it's a bit of a

tricky thing if it's an environment

issue so maybe i would suggest anyone

with a strong background in uh yeah like

in yeah the banging

it's not an easy problem to solve that's

the that's unfortunate but it's that's

the case

thanks a lot

i would just jump in and say like this

is where like the minimal part of it

comes into play because if you've

minimized your example and hopefully you

have you're using the least amount of

packages as possible

and then like this

[Music]

yeah a good point i usually in the

process of minimizing your reproducible

example

you actually

clarify your thinking or your yeah about

your assumptions right i assume that you

know

the problem is related to these 10

problems but then you narrow it down to

a point well you know it has to be this

or that and then by the time you get

there usually you don't even need

someone's help because you kind of

answer your own question but it's it's

it's a tool to do it in a systematic way

as opposed to kind of you know like

you know like waving your hands and

running around you know you you have

there a tool to prove that something is

or is not related to your problem

okay that brings us to bring us us to

the end so this half hour was a super

fast overview of the package hopefully

this will be a record for those in the

future who

want to learn about redbricks and if

you're interested in more details you

can join the rest of the meetups but

we're going to be talking about things

that are kind of beyond the usage of the

package and mostly about you know what

it means for a replex to be good or why

the package is so good and it feels so

good when you use it and that is because

it has a philosophy and implementation

of the baggage responds directly to that

philosophy

and because it's made by my idol jenny

bryan who is amazing thank you see you

next time

thanks

bye
