---
type: Video Transcript
title: "wtf: Holistic workflow (part 2)"
description: "so this video is on the da's equator  about  a holistic workflow about the book uh  what they forgot to teach you about are  typically the section we are coveri"
resource: "https://www.youtube.com/watch?v=ek3b0m1iCdk"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=ek3b0m1iCdk"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

so this video is on the da's equator

about

a holistic workflow about the book uh

what they forgot to teach you about are

typically the section we are covering

now is holistic workflow and today we're

going to be covering um maybe the most

important meetup

of the series which is this idea of

project oriented workflows

but first

i'd like to

gonna quickly go you know at this

mention what we covered last time and

then we're gonna make a little house to

um

extend on uh the answer to a question

that monica posed last time and then

we're gonna start officially with the

meet up so last time we covered how to

set up our studio so that we always uh

start from a blank slate that will save

you a lot of trouble we also discuss the

idea of restarting r very often so that

we start

really with a blank slate and not you

know just by say you know removing

objects with um the function rm

uh but then not refreshing your ad like

or our packages for example

so in relation to rm

monica mentioned that um when she's

working with an art package sometimes

she

um realizes that um creates objects that

are also part of the package but she

creates them interactively and then when

she

reloads the package she gets a message

asking her to remove those objects and

and the suggestion is to use rm as

opposed to

what um you know the most general advice

could be which is to restart the session

so i wanted to i had like a feeling why

would that be last time uh i think i i

still have the same feeling uh so i'm

gonna uh but you know now i i'm

preparing that i explore the program a

little bit more pay attention to the

message and i think i'm convinced that

that was the the issue so let me show

you

what um you know basically

what the issue was and what i think is

happening here

so to demonstrate this issue uh you know

monica expressed that it was when

she was working in packages so we're

gonna create a package called

abc somewhere temporary so abc here we

go

and so that creates a package so in a

moment that package will be launched by

our studio

it's happening now

so she explained

the issue happened when

she's working with some art object that

she creates interactively but also

exists in the package so let's create

actually a function um

in the package let's call it f

so

here we have an r script uh let's create

a function f

as a function of x that does x

plus

1 for example right so that's the

function

so

the thing i want to highlight here is

the idea of a workflow which is an idea

that is not immediately clear what it

means

so for example here i have created

a function

and the function as you can see i

haven't even saved the file so i'm gonna

press ctrl s to save that file but

notice how my environment my global

environment does not contain any object

it does not have an f object micro

environment so r doesn't even know about

that function

the workflow that i use and you know

you're recommended to use if you are

building an r package is to load those

objects as if they were part of the

package so not by interactively creating

them on the console but instead by

pressing

shift ctrl l or calling dev tools load

all directly so that loads the entire

package so if i now you know use um you

know call the function f with the number

one i should get the number two because

it's using the function in the package

but notice how i still do not have

anything in my global environment so if

i wanted to change the function to um i

know x times x plus 10

if i want to manifest that func that

change into the function the workflow

that is recommended as a package

developer is again to press shift ctrl l

which you will know that it will also

save the file that i have here you know

note that f dot r is highlighted in red

so when i press shift ctrl l that um you

know tells me that that file will be

saved and loads the object so if i now

do f

uh of one it will be 11 right

so what happens uh the issue that monica

expresses that in some sometimes you

know you do something like okay um let's

do

100

and then she presses or sometimes you

know i also do that you know you want to

explore that function interactively so

you press you know ctrl enter

that runs that line but notice now how

that f function exists in the global

environment

so what's happening here is that there

is a problem because the f that comes

from the package abc

that function if i give it 1 gives me

11. but if i just call the function f

that leaves in my global environment if

i call it with the same number one i get

101. so that's the conflict that we need

to solve so if i press the

if i try to load the package we shift

ctrl l now dev tools

detects that there is a function f in

the space in the name space of the

package but also a function with exactly

the same name in the global environment

so it's reminding me of that and the way

it's asking me to solve or suggesting i

should solve the problem is by removing

the object f from the global environment

so i can do that with rm

list list

equals f

i have to quote this

so if i do that now i can load the

package with no problem so the question

is why the advice is to remove the the

object with remove list as opposed to

restarting the like the most general

advice that could be to restart the r

session which also solves the problem

well i think

that it is because restarting the the

session will wipe any other object as

well

and so if i have created something that

is difficult to create and is sitting

there in my global environment

just by blindly following the suggestion

of the tools i would be hurting myself i

would you know be removing not only f

but also any other potentially valuable

object so that's why i think that the

message here and

suggests to remove version with rm and

this is an excellent example i think so

i thank monica for that because it it um

i i did i do not want to create any hate

for the function rm so there are good

uses for ram like this one right

and in general you it's better to um

very generally it's better to restart

your session and that's what you would

be using most of the time but

occasionally you know knowing the rm

exists to remove something specifically

then that that might be a good fit for

your use case sometimes

do you have any question or comment

about this

specifically

mar i wanted to ask if you were

intending to record already so that was

one question and then quickly on the rm

thing i also

i don't know if you mentioned this last

time but it's super common for sort of

intermediary people to put it at the top

of their

rn

ls and then like list and then ls which

basically clears your thing and this is

like

to be a lazy way of doing this

restarting your art because it doesn't

do all of that stuff so

i

i say that to point out that if you're

the type person that's doing that i

would also strongly

suggest that you move on to like just

restarting r and not through this um rm

list ls to get rid of everything on top

of your scripts

share that sentiment i see jackson

approving your comment and alex asking

to make a comment a question

alex

yeah um

i will also second that like rm list

equals ls is not great

like it is a nice quick way that if

nothing is problematic

it can work

um

but

there is a lot of stuff

going on behind the scenes

uh in r that

rm doesn't always catch

um

the big one being like any libraries or

packages you have loaded those are still

going to stay loaded so if you're

getting something

a namespace conflict from a package

you've loaded uh that is still going to

be a problem

um

and i just want to quickly point out

that

um if you have altered your dot bar

profile files at all

um when you restart r that will also get

loaded so i know like personally i have

library tidy bursts as part of my r

profile because i just want that to get

loaded in every time i always use it

right

um

that can cause a problem for me if i'm

trying to do something and i'm getting a

namespace conflict with

something in tidyverse

thanks everyone so to answer

cj's prompt yes thank you very much for

reminding me about recording this one

time i am recording

and also showing my screen so i'm very

proud of myself but thank you for

reminding me because yeah that's a very

cool one that i forget

um

okay so let's move on here to try cover

some more new material

so but then we come to the point where

um

we need to talk about projects

so one other practice that is quite

common to see um

is um

to try

start your project in a specific

directory using the function set wd

which sets working directory wd stands

for that and and usually it is called

with some kind of path that i only work

that i only have so something that works

only in my machine so that is of course

not portable so if i need to share you

know my work with someone else you know

no one will have um

that path in their computer so it will

work only for me so the chances that it

will break someone else's code is 100 so

obviously there is something all there

so

what we see here as an example of that

issue is what is considered bad practice

so something that okay you know you

attach a package say ggplot2 you set the

working directory to

somewhere this is the computer of jenny

bryan so you know say that she has this

this path in her computer and she's

actually working this suggests that

she's working a project called

fufi and now she's setting the working

directory inside a soup directory of

that kind of foofy project

and that's a problem and

then you know she's calling a data set

inside that folder and then she's making

a plot and then she's saving the

output of that plot and

in

in a path that is kind of relative to

the data folder to a folder that is

called fix which is a sibling of

uh the folder data so it's a mess of

course this is not how she writes code

and this is for is a bad example for for

demonstration so a little less bad still

not great but a little less but it could

be something like this where okay if you

are if you really love set wd and if you

really need to you know hard code a path

that only you have at least make it easy

for other people to change that one line

in their script and and kind of move

forward and so ideally you would put

that line at the very very top of the

script and you would not set it to a

subdirectory of the project you set it

not to data inside fufi you would set it

to fufi and then any other

path could be relative to the root of

the project so fufi could be here what

we call the root of the project so that

means that the path

where we need to reach the data is you

know explicitly says inside data look

for the for the csv file that i'm saying

i'm showing here right and same thing

here so now when you need to save the

plot somewhere inside the the root of

the project you explicitly say okay

inside fix you know save this png file

so everything is relative and it's

relative to the root

but wait because there is something even

better than that so that's like a

convention of how you can make life of

someone else easier but the formal

definition of project is is coming soon

so it's this idea of like a folder that

contains absolutely everything that the

project needs including the data yes you

may need to duplicate data or figure out

some other way to make the project

self-contained

the project directory is set

uh to that project folder to the root of

that project folder and every path is

relative to it so this is pretty much

what this code here does except for this

um like very ugly path that only one

person has and no one else so it will

break someone's scope

but then uh there is a um is a notion

of a project

that our studio provides because they

define

another studio project as a specific

kind of project where

the folder has a specific

file

and that ends like which extension is

our approach and that thing defines a

project and you know gives you the

ability

to use some tools like for example a

here package which allows you to

completely remove the need to hard code

tasks to your own computer meaning that

the project now becomes portable so

that is something that also comes uh

with git git repositories so if you're

not using our studio projects but you

know your project is

a git repository because you are using

git then the here package is clever

enough

to know that what is the root of the

project because the git

program

drops a folder at the root and that

defines the root so the same code that

we saw above is is here now

except that there is nothing that a

person that you're sharing a code with

needs to do to make it run in their

computers it just works so the

combination of a project plus the here

package they hear package the only thing

it does is sets um you know the

it is aware of the root of the project

so basically you construct paths

embraced by the here function and also

like for extra nicety instead of using

you know data you know dash

on any directory inside data and you

just separate the different components

of a path by commas and the reason why

here proposes that is because the the

dashes are not always in not every

operative system

uh interpreted in the same way in some

operative systems you know you have a

backslash you know there's a forward

slash so to remove any confusion

coming from

um

os dependent idiosyncrasies then the

here package just proposes to separate

the different components by commas

um

the use of the here package is

specifically important when you are

working with our markdown documents and

and this is i believe um a horrible

feature of our markdown which defines

projects which defines sorry the working

directory uh not based on the root of

the project that contains that file but

instead unfortunately it defines by

default it's changeable but by default

it defines the working directory as the

place where the armageddon file leaves

and that is error prone because for

example the first line of code here

shows um you know the project that i

have uh i have here so the

and the project that hosts this meetup

and this is just for one example it

contains a folder so the root is called

ts dot what like yeah what they forgot

right wtf

um

and it contains a folder zero one

holistic workflow and inside that you

know there is these files including say

shortcuts so if i wanted to

um

to

reach that shortcuts.r file

in a in the same way uh i could create

you know something like this i would you

know create a path

from the root

if i wanted to follow the normal

conventions of a project i would

reconstruct paths from the root of the

project uh say you know first giving the

root uh the path to the folder

and then the path to the fight itself so

i would expect that to work

because i'm just following the

conventional definition of um of a

project and and just expecting that the

paths constructed following that

convention would work unfortunately it

doesn't as this error here suggests and

what is going on well what's going on is

that inside our background document

the

the working directory

is

uh

defined as the place where the

the file leaves and because the file

that i'm calling that um or creating

that path from

is already inside inside a subdirectory

of my root then it thinks that the

working directory has to be set to that

subdirectory and not to the directory

and then you end up with this weird

thing where the the path kind of do you

know it's um

anyway let's duplicate it it's a whole

mess it just doesn't work the reason is

because the default is is set to the

work to the document directory as

opposed to the project directory so this

solution again is the here package so if

instead of using the function path

here

i had used the function here

and zj i'm going to pause here in a

moment

then the path could have been

constructed as

um

[Music]

in a functional way and it would just

have worked so if i now do the same

thing if i source you know that file it

just works it produces output it does

not produce an error so long story short

the combination between projects and the

here package always works so if you want

to be safe

just embrace your paths in the here

function so you simply replace the

functions such as path or or file a path

and you replace that function with here

and it will work that's it

okay i'm about to talk about ide support

for projects and show you a few tricks

but specifically in our studio and but i

think that what we cover now uh up to

now is the most important probably topic

of the entire series so i'm gonna pause

here um and

and avoid cj to violent violently kick

me out of the meeting and see if we have

any comment any question

up to this point

please go ahead cj yeah

um

yeah i personally don't use the air

package very often but it is i do

understand that

in our markdown it can be useful because

it messes with your directories and

other cases that's that which also the

message to new directories to the goes

this gateway

constantly

but i

i'm sorry if i didn't hear you say it

but i think it's like important maybe to

explain the difference between an

absolute path and a

and a relative path and

where i always start with like with the

advice like please understand what a

relative path is and use that all the

time and then here can be like a you

know a supplement to that or

a replacement for that but i think it's

important to understand

what a relative path is and know that

that

ideally is what you're using especially

if you're conforming to this like

project style

repo or whatever

thanks ej yeah maybe to them because i

haven't covered that um

explicitly but hopefully a brief example

will demonstrate the point that you're

making here so this is an example of an

absolute path uh an absolute path is of

jenny here is working on the fufi

project

and the path that she constructed here

for example is fix slash foofy

so this is

a path that doesn't contain the entire

information of where the file leaves red

and you know related to the root of the

computer it contains the information

that you need to find the path relative

to the root of the project specifically

so this is relative so we call this

relative because it's relative to in

this case fufi

so this is one example of a relative

path something that you know you need to

know that you're in fulfills to be able

to find this this file so that that's

why it's relative

and

and this entire thing is an absolute

path it encodes every single path

and

every single folder inside the computer

to reach in this case the fulfill

process so this is one example of an

absolute path and this is one example of

a relative path and this is another

example of the relative path would you

like to add something here cj

no that's fine

thanks

also i mean here because this is

probably the most important thing of the

entire series the idea that projects

should be they project must be portable

so if you have something that works in

your computer it doesn't work on mine it

just doesn't work i mean like we cannot

work as a team so this is the most

important thing so this is also a good

place to

remind of the coding help desks so it is

very common that this

idea of changing your workflow from

whatever it is to a project oriented

workflow will cause some friction in the

beginning just because you are not used

to it right you're not used to thinking

about projects this way so and i mean

it's nothing to be ashamed of we all

went through that at some point sometime

you know it was the first day i used an

art studio project or i use the project

in general and that they did it didn't

feel very good and it would have been

nice to have some support so we do

provide support here

we support each other here two degrees

and in many ways so you can also ask you

know on slack but formally

uh on the coding help desks so if you

feel that you know you're struggling

with this more than you should you know

it's fine you know to feed some friction

for 15 minutes or half an hour maybe for

an hour but if you're struggling with

this idea for longer than that i

encourage you to save yourself

frustration and time by by just asking

someone

to block some time so they can work with

you one-on-one maybe for half an hour

maybe for one hour

and we nail this down so please do use

the coding help desks

and any other comment here or

shall i move so let's see a comments or

question now while i move to the other

topic

okay

so the the part that i would like to

cover now is okay we

we very commonly use our studio

it's not the only um

[Music]

you know program that people use to

interact with are and but it's very

common so i will just assume you know

when i say ide you can you know think r

studio um

so in general you know the word ide

means integrated development environment

is an environment where you can develop

code write analysis and stuff and

everything single aspect of of your work

is integrated so you have you know like

a little window to

access your files you have a little

window to you know write source code you

have another little window to run the

code so this is the idea of the whole

thing the whole development environment

integrates the different pieces so

that's why um you know we call an ide an

ide and r2 is just one of those but

let's assume just to make you know the

speech easier we just use our studio and

if you're using a different one you're

welcome to do so

so

uh

ides are clever because they were

designed precisely to work with code so

they do a lot of the things that you may

have done before manually and you should

you should really stop doing that

because you know why why would you not

use the automation that an ide provides

so one of the great things that happen

when you launch a project for example in

our studio is that you know it sets the

working directory to the root of that

project and it restarts r and it

restores open files so let me show you

what that looks like so here i am in a

project and i know that because here at

the top right i have a name as opposed

to having something like

this so i'm now closing that project

so you will see that now what appears

here on the top right says

project none so i'm not using a project

so i abandoned the project that i had

before but if i launch that project and

i can do that by going to the recent

projects

which are available in the file

menu but also here so from the top right

you control everything that relates to

projects i can go back to the project

that was recently used

our studio memorizes them and notice

what happens a lot of the things that

before you know you may have done you

know by you know typing something like

you know set wd and a path that only i

have in my computer so what things

happened okay the project is now

launched uh r has been restarted which

is great because if you follow the

advice from the previous meet up where

you ask our studio you set it up so that

it always start from from a planning

slate you have you should have nothing

here contaminating contaminating your

our environment your global environment

should be totally blank

and notice that there is a file here

open is the same file that i had before

so it you know restarted the

the

the project so if i ask what's my

working directory it says oops

i forgot just to do type one letter here

it sets the working directory to the

root of the project and recovers our

file requires files that were opened

before so it does a lot of work for you

right

so

the

other thing that you can do is to launch

more than one project so if before you

are using set wd to change your working

directory from one project to the other

now you don't need to do that you know

you can just launch

another project so let me show you here

in our studio how you would do that

here

here on this tab

as i show you before there is there is

different you know recent projects that

i have if i click on the name that would

open that project i would close the one

that i'm using right now but if i click

on the little uh arrow here to the right

arrow with you know that little

background then opens the project in a

newer session so i can have more than

one open our session

each in its own rstudio window as you

can see now being open right now and and

each process is written in its own

environment its own um

with in its own session meaning that an

object that i create in one place so if

i if here i say okay create you know x

with the number 10

my global environment here will have

that

object let's see here environment

x is here but it is not in in here here

is blank because these different

processes so everything is completely

insulated so that's great so i can uh

and the same benefits happen in the

other one right so the rstudio opened

the project started in the same session

and sorry um

set the working director where i should

and

open the files that were recently opened

the last one trick i would like to show

you before we call this a meet up is

that there is other tools that you may

install in your computer to launch

projects very comfortably for example i

install one program that's called albert

and

max and other systems have another

program that is called alfred and that's

the same thing so for me to launch an

rstudio project means

hitting shift and bar and then typing

the name of the project something like

pass that's data

immediately shows options and i click

there and then the project launches

so i'm going to space wait just one

second to show you how that project

launches

so the support that ides provide for

projects is great i encourage you to

benefit from those

and if you need to refresh what those

benefits are

they are listed here in the meetup of

today and what i cover now is the tricks

for opening projects and the last thing

that i say is that um

it's recommended that you would

uh that you could organize all your

projects in in the folder you can find

instead of having them spread across

your computer i for example keep them

all in a single phone folder that

contains all my git repositories because

usually my art projects are always in

being tracked by key okay that's the end

of today's meet up um we the next time

we're gonna talk quickly about naming

files and a few other things but i think

we did cover the most important topics

of the day before i go any last

departing comment or question

all right happy workflows then see you

next time
