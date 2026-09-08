---
type: Video Transcript
title: "Setup: GitHub, R, RStudio, and Git"
description: "Continue doing so the first ppm issue is then the meet-up of today and where we are going to be talking about how to set up github our..."
resource: "https://www.youtube.com/watch?v=YDsoKUVsJls"
tags: ["ds-incubator", "github", "git", "github-issues", "terminal"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=YDsoKUVsJls"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2019-10-15T00:00:00Z"
    usage_count: 142
usage_window: { from: "2019-10-15T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

okay welcome to the first of the science

equator meter this is simply two things

one thing is a workshop that we plan for

the 9th and 10th of March next year 2020

and it is also a weekly series of

meetups like the one we are doing today

so to get access to the contents of this

and the following adapts you can go to

the DES equator repository this is in

github.com so degrees investing and then

the repository TS in Quail so here you

will have the issues tab will have the

different meetups that we as we continue

doing so the first ppm issue is then the

meet-up of today and where we are going

to be talking about how to set up github

our our studio and get this is a lot of

ground to cover so of course I'm not

going to be very detail and also because

most of you have already done it so the

goal is that is to just ensure that the

setup is correct so I am going to share

this resource here that points to a book

is called cabinets with art and it is

this chapter called workshops has a list

of resources for what they use as a

pretty workshop set up by day I mean the

authors of this of this book who apart

from me in the writers of this book they

are teachers of workshops and when you

go to one of these workshops then you

know this is the kind of thing that you

do before you go to the workshop so they

have this very nicely put list of

instructions about how to set up get get

how are under studio so this is the

expensive please but I'm going to be

only quarry a few things and skipping

palace and also making some of overview

comments about some of them so the first

one is how to register a free account

well in addition to the sorry today

today the links that I showed here there

is also in this comment a LinkedIn notes

and if you click there you will go to

the notes that I created for the

workshop today so the first section is

just for me only for my Oh is just

remember what I should do before I meet

here so I encourage you to start

actually here in register 3 didn't have

a count which is you pay attention then

that map's exactly to this first thing

here so if you do go to the link you

will have a lot of information that

would guide you to do these these friend

steps on your own but today I'm going to

just show the main that means the main

things so about how to register you'd

have account well that's that's a first

straight forward but there is a couple

of things that it is important to kind

of keep in mind first

your username ideally maybe it's not

like that right now but ideally would

contain your name your real name and

that's because we may want to kind of

find your username to add mention you or

you can have for example to give you

credit for something so thank you for

doing this or to assign you a task or I

mean have issue or pull request so

people want to find you or you can have

if your username is something that no

one has a clue about that's why we've

really had to communicate with you or to

remember especially as the organization

grows you know it's got to be really

difficult to remember people's usernames

so if you didn't do that you're also

sorry also this important that your

username is timeless ideal and why well

because you may change employers and you

would like to steal and family credit

for your work and the same in have

account if your username does not

contain your name and you're not willing

to change it then at least it is very

strongly recommended that you would add

your name

to your profile so simply go to

github.com settings profile and under

name your real name that way when people

go to the 2° organization and they start

typing your name and their members

people will remember your name and maybe

not your username but by typing your

name that will be immediately associated

with your username and then we can use

that to admission you so that covers the

first link here and now we are going to

move on to the second and third link

which are about updating our our studio

key and in general about why you would

want to keep software up today that's

the topic that I think everyone I have

met at anyways are already kind of

convinced that it is a good idea to keep

software up today but if you or you know

someone else needs like a nicely put

argument an explanation about why it

might be that might be a good idea then

these three things AB&C give you a very

good a very good backup for in

particular like this I this general idea

that there is a lot of things in life

including updating somewhere that aren't

painful we acknowledge that they are

painful but the pain increases

exponentially between if the time

between actions increases this is true

for updating software as it is for for

example trading Keep Calm it's the

longer you wait before you do you know

another commit or another work before

you upgrade your software they you can

disproportionately higher pain you will

experience so if you want to keep your

pain levels to a minimum the best thing

you can do is just to move to the left

on this course just do things often this

is not an idea of myself and it's an

idea of marking folder and this limit

pointed to an article that where he

explains this very eloquently third link

I would like to discuss our 3/4 in this

list is how to introduce yourself to it

this is the first time we I'm going to

be showing something live

basically the first thing the first time

you don't know what is say your username

how do we do that

we are going to pop up a shell so if you

stop if you stole kids on Windows and

I'm focusing on Windows because Windows

users are the ones I experience the most

pain unfortunately the Mac terminal is

little nicer to the users than it is in

Windows the different flavors so if you

stop eating Windows you will also have

what's called a git bash so if I type

read president windows key and type git

bash the first thing that appears there

is the one you want

so these cache if I type git config

global least so I'm asking the list of

global configurations that it has if if

this is a new configuration you may not

see anything but if you have already

signed configurations it might look

something like this so you have to give

it at least you use your email and

username and I also found that these

three additional configurations are very

useful this one what it does is it helps

you push commits to github from any

branch in a very easy way this one what

does is changes that default edit or

text editor that you would otherwise be

prompted to use when you create for

example you know a commit message or

something I personally use

and any door that is called nano and but

if this is the first time you are doing

this on the terminal I recommend you to

start simple to start with simply that

notepad and then this last one what it

does is simply really asks it to

remember your username and password

you'll get help username and password

the first time that you give it and then

from then onwards you will not have to

give it again so that really simplifies

your workflow so if you wanted to do

this yourself to create these

configurations yourself one easy way to

do it could be to come here to the file

that I share with you copy this text

right and simply change your email here

and your name here and then copy that

text and give into the terminal

unfortunately if you press control V

that won't taste in many cases that

won't paste the text that won't behave

as you want instead you will have the

breast shift inst that's painful but

that's what it is I'm sorry

so by doing so you know each line

becomes a command and you will have kind

of set key configurations at the minimum

key configurations I will make your life

easier so that's all I wanted core about

how to introduce yourself to kids and a

few other things and now let's move on

to do this utterly so the following

resource is how to prove that your local

git and I can talk to github and I'm

going to skip that one

because if things go well if the

convolution is going well then this

should be not necessary and although I

do expect that you will some of you will

experience trouble and that's funny

you know it's just there I would like to

kind of expose what those problems are

and open a discussion with you or github

issues from the ideas incubator

repository so let's skip this for now

and also

because we don't have a lot of time in

these meetups and we also going to skip

this other section the one on cash a

free leg a shame for your

username/password

because we already did it what is doing

is basically covering what's in this so

now this say let's actually do these

previous last the content of this

previous class together where we are

going to prove the same connection so

we're going to prove that our studio and

get together I can't talk to basically

you're gonna teach to each amplifier our

studio so this is what we are going to

do right now so the first thing we want

to do is to go to github.com let me

close little distracting make sure that

you are logged in as the person you

think you are in this case now remember

is my account that's correct

I'm going to keep the class here to

create a new repository and here is to

do something like ABC like a dummy repo

toy repo public is okay click here to

create a readme and now hit on create

repository jihad is going to take a

little while to do this I here we are

the name of a repository and the

description have been automatically

added by cleaning up to the readme file

so the first thing we need to do is to

go this green button here and copy this

link make sure that he says closed with

HTTPS this is what we want to use the

traditional helper that we set on git so

now we go to any session of our studio

I'm going to open a studio by pressing

the Windows key and type in our as can I

see already our studio so I hit enter

that will open our studio somewhere

probably in the last repo I was just in

the last version was you seen before or

in a no project which is what's

happening right now so now we go to that

icon here on the top right right

on your project now which is this one

here the last one where it says version

control and get now we paste the link

that we copied from github the one that

has the HTTP automatically you know you

can see how the name of the repository

has been populated and you choose a

location where you want this repository

to live I'm happy with that so I click

directly create project now the ripple

is being cloned from in half it's kind

of coming down to my computer I hear the

top right I can now see the name of the

repository so that's fine so what I want

to prove now is that I can push comments

from my local computer took it and for

that I'm going to click here on empty

what we see is a file that was

automatically created from github the

same information and a new lines of like

in line from local computer I now say

the file go to the game pane select all

the files we control a for example hit

only one box and all of them will be

automatically populated and now hit

commit now we have the opportunity but

also it is compulsory to write a commit

message something like first comment

studio he commits and now close this

window ambush by pushing this coming to

it have we are now challenged because

this is the first time that we do so we

are challenged to enter my username and

password so my username is

and my password

so when X you know you I provided my

username and password they are going to

be stored in my computer by program by a

manager so I will I expect not to be

challenged from

user name and password again so now I'm

ready to go to a medium to refresh this

page I'm going fear that the commit that

I did has actually been pushed so pay

attention to this line here remember

this is the fire before it was

incorporated my commit and now when i

refresh I expect a new line to appear

here at the bottom I hear is right so

that's fine so they the thing I want to

do that's working I want to go but it

came to our studio to another commit so

they start a new line on yet another one

another line from the local computer

save this file committed with another

commitment instead on he commit I'm poof

when I push I now expect not to be

challenged for my username and password

because I used that configuration

remember I was telling it to remember my

username and password they to use their

credential and helper manager so he'd

push and see what happens the bush has

succeeded

I was not challenged so that's working

fine that means that the HTTP protocol

is working as expected

and I can now go to begin hack refresh

game and I expect the third line to

appear here let's refresh I here it is

so that's almost the end the list of

resources that I shared includes this

one extra link which invites you to

reflect about the idea of using it

client again client is something like

for example in desktop would you mind

use but I don't use in clients but I

care not very good reviews about the

github desktop in particular and instead

I heard actually it's written here is a

very same book

I heard various avoiding it

can program so that's another thing that

you might want to consider you don't

have to use again client you can't if

you want none of the two approaches and

all using or not using this and nothing

will make anything down you won't make

you better or worse to do one or the

other thing is just kind of totally up

to you and whatever if you feel more

comfortable every day you see so with

that I thank you very much that's the

end of the materials and I'm going to

you know record to upload this recording

so that it is available linked to the

same issues well so you will see another

link here say record thank you very much
