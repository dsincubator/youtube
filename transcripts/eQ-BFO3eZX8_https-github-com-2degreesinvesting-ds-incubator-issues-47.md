---
type: Video Transcript
title: "https://github.com/2DegreesInvesting/ds-incubator/issues/47"
description: "Place where I would like you to go is to our studio to the cloud and it could be any instance of our street or cloud but I..."
resource: "https://www.youtube.com/watch?v=eQ-BFO3eZX8"
tags: ["ds-incubator", "r-packages", "cloud", "github", "github-issues"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=eQ-BFO3eZX8"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2020-06-02T00:00:00Z"
    usage_count: 21
usage_window: { from: "2020-06-02T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

okay so today the data science in

greater meetup is to introduce you to a

new place where you can shape your

thoughts and share them across the

community and with the world and that is

a block so the goal of today is to kind

of empower you to create your own

personal blog and do maybe share your

thoughts your personal blog or if you

want to submit posts to our

organization-wide blog we are gonna be

working with these two things that are

becoming more regular this collaborative

document that you're looking at right

now I see already people working on it

today I didn't include the sign in

section and I think it's better to just

have a look at how many people I have on

one's own and the next place where I

would like you to go is to our studio to

the cloud and it could be any instance

of our street or cloud but I prefer you

to click this link again because if you

had it before from previous meetings

that browser will not include a package

that we're going to be using today so I

encourage you to click the link that I

see everyone clicking here

so that you land on this our studio

cloud project that you see here so what

I'm gonna do now is I'm gonna drag this

window out and move it to the right so

the idea is that here to the left you

have the document that is kind of the

map about what we are gonna be doing

today and to the right I'm going to be

showing something or you will be kind of

working on something so the introduction

for limit app is this idea that a great

deal of what we do as knowledge workers

involves thinking and a great way to

think well is to write and as Leslie

Lamport puts it if you think without

writing you only think that you're

thinking so writing is a way to kind of

lock these thoughts that we have at some

state and then build

on that and improve it right and we need

a place to do that you know it could be

a paper a piece of paper you know a word

document but today I introducing you to

a blog because not only you can you know

you need a place to write things down

but you also need a place to share them

and I've noticed through communications

with a lot of us including like George

uni Vincent Jackson Alex a lot of people

have great things to share and we are

sharing our thoughts on slack which is

great but I think that you know we could

some of the communications that we have

and some of the ideas that we have can

be kind of broadcast it to the world as

well and make them easier to find in the

future so for that I think that a blog

is ideal also for software development

you know sometimes we need to announce

features packages and a blog is a great

place to do that so the outline so in

this meeting you will create and extend

a block and you will publish your blog

in a quick platform and the idea is

outlined it here right so clearly blog

tweaked a little bit the shape of your

blog but very basically create a new

post publish your blog and then I'm

gonna show you how I could import a post

that you might write in your own

personal blog and then I can kind of

important into the two degrees one so

the set up is already I'm assuming that

everyone already did it so if you just

for practice as well click yes as I'm

doing now on the participants have if

you already have their studio Dragic

open on your browser as I do here and I

have 1 2 3 4 5 6 7 8 9 10 11 12 people I

already see half of the people already

have click YES on the participants tab

in zoom and a few others may may be a

little behind but that's fine we are

gonna move on so the the first thing I

would like you to try is this function

you know basically they blow

that that we now have is based on a

framework that is called distilled this

is just an hour package and it's very

well-suited for scientific reports and

things like that as if you type a steel

column column you will have access to

all the functions on top completion and

so the one that you want to use first is

create blog so just use that function to

create your own blog so the first note

that I need to do about this is that you

need to be sure that you are under this

directory cloud project and so that the

function that I mentioned will create a

new folder under project here so give it

a go so I'm gonna reset the the ESS I'm

gonna give you a few minutes to do the

Alice there's a couple of minutes is

just calling one function and kind of

having a look at what happens you may

see a lot of warnings that I don't know

why they appear but you should you can

be regardless so the time is running now

run that function this will create blog

just give it the name of your blog and

then when you're done click yes I'm

gonna click yes here because I did it

before great again a big hint is that

you need to be I mean you can do it on

our studio locally if you have it first

you will need to of course install the

package this deal with install the

packages quote this deal quote but today

we are doing it on our studio cloud and

also your club does not include a nice

feature that you will have available

locally which is you can create a blog

just by clicking things but today we are

going we are doing it directly with with

a function is to create blah

okay in the last a few seconds I'm gonna

do it myself

so if you are a little behind you can

just see how I do it it's pretty

straightforward this is not like an

evaluation you know I just want to make

sure that you know you have experienced

how to create a blog this still create

blog and here I'm gonna say I'm gonna

just use the example exactly like that

my blog that's kind of all I need I

don't know actually it's asking me for a

title for my blog so I'm gonna call you

the same my blog you may not see this

because it's I don't have space here let

me drive hmm there you go

I see you know a bunch of red colored

things which is generally not a good

thing but I try these several times

already and it just works so you will

see some text here that populates and in

an article that is called welcome one

thing I need to do probably is to

refresh with this little circular arrow

when i refresh there I see that my blog

appears here so the next thing I would

like you to do is to go into that folder

my blog so clicking there and now um you

know you will see an hour studio project

file so this final exercise you know my

blog thought our approach so notice the

following in the left hand side I'm

still on my working directory and being

that project but if I click on that file

that will change my project directory to

inside my blog right so I'm gonna do

exactly that

because I want my my project directory

to be the blog itself so as you can see

now in my files a panel I now inside if

the directory my blog and I see a bunch

of files that make up the infrastructure

of of the blog so let's see what our

next item in the agenda

okay so these

second item I had just kind of

demonstrated the idea is for you to kind

of follow along I'm gonna give him a few

seconds for you to kind of catch up if

you haven't maybe just maybe just you

know less than a minute maybe 30 seconds

and in the meantime I explained the next

thing that I would like you to do so the

next thing I would like you to do is to

actually build your blog and on how you

do that okay you don't see here because

they'd have is hidden but if you

navigate to the tab called build and

this time will only be available if you

are inside the working directory of your

blog right so you have to be seen

something like this and your working

directory here on the console should say

you know my blog or whatever name you

gave it if you do that then our studio

will know that that's a blog and I will

give you this tab called build so go to

that tab and hit directly on build

website and when you do that click yes

so that will kind of give me a hint that

kind of we are all seen on the viewer

how cool our new blog is so if you have

questions remember that on the document

we have a special place for questions

especially if something that you know I

may not have time to address now but

it's great for you to capture questions

there because I can come back to that

later so if you really build your blog

please hit YES on zoom so I know that we

are modeling the same page and otherwise

you know like speak up and say you know

where where you're stuck or write a

question there great I see almost almost

everyone who is responding is already

clicking so the next thing I would like

you to do is to basically create a

mental model of how the blog works so

what you see in the rendered way has of

course a source file in the back end

right so explore a little bit your blog

both from from the window here you know

by clicking ok what happens if I click

on the name I see a post what happens if

I click on the post I see actually

something there what happens if I click

on the menu or reason about let's go to

about you know you read something there

ok so you now have an idea of what the

blog looks like when it's friended so

that if the HTML files that display the

blog in a nice way but then there is

source files associated to them so you

know go to the two files and play a

little bit so for example gate we saw a

place I would call about and the reason

about RMD file and the index file is

pretty boring but it does give the name

to your blog so you may also one now to

kind of play by tweeting your blog so

just change something like my blog Mike

I could write my cool blog and then

rebuild it you just save the file meet

it here and then go to the tab build and

hit build website so let's take a minute

to play with with our blog again the

task is to explore your blog from the

viewer explore your blog from the files

find the source files of everything that

easy spray on your blog and maybe change

something and three and then meet and

build and see how

your tweaks are reflected in the render

output and when you're done with that

click yes you don't need to change

absolutely everything just kind of to

confirm to prove yourself that you can

change something and create a visual

effect in the output of your blog cool I

see some people racing yes Aspray

awesome we have already five people

answering so we are now at the stage

where we could so we modify something

you rebuild it and now let's create a

new post and so you already know more or

less that you know you tweak things and

they did and they render in your in your

blog so now let's create a new post so

what if you want to create something new

okay there is this function on on the on

the distant package call create post so

I'm gonna actually type post to see all

the options that I have for about things

about post it's a really small package

so that's kind of nice because it's very

obvious what you can you can do there is

other frameworks and actually the one

the reason why I really like this deal

is because it's extremely minimalist

other frameworks are too complicated I

had too many things and for my taste

they they make things harder than they

should so let's let's go ahead and do

create post and I think that you only

need to give it a name for the post so

I'm gonna say my post and hit enter so

again I see a bunch of messages here

that I don't yet understand because I'm

new to this framework but I see that

this has worked you know I see a file

here that I can meet and then rebuild

they Pat them then the blog again as I

did before so I would like you to do

just that so create a new post meet it

and then

build it and then you know the poster

you added should appear here on the

homepage of your of your blog and if you

want to expand it you can click this

thing here and it will open your blog on

a on a browser I'm gonna tweet a game

because that was fast

so this button here expands the viewer

into a whole window and I don't know why

it's not showing anything here but it

should so go ahead I'm gonna give you

another minute to try that we are here

at this stage that the idea is to create

a post when i refresh everything and I'm

please say yes when you're done created

a new post great I see a lot of people

so there is one thing I forgot to

mention maybe you read it here maybe not

and that is that there is one parameter

that I need for the next exercise and I

need to be set to true so in your post

you will see that at the very top there

is what's called a llamar header just

you know this all this information he is

kind of metadata for your post and I

need at least for one person I need this

value here to be true so please one of

you or all of you if you could do that

change the parameter self-contained to

the value true and then you know needs

that again I will automatically save the

file and and then build your what your

blog again that is something that should

not do anything visible in your blog but

it's something that I will need to be

able to import your post into into 2°

blog so the next step is pretty exciting

actually what I'm gonna ask you to do is

to export your site so honestly a a blog

is a very simple you know the back end

is a very simple structure now let me

show you what it looks like so if you go

to

files you will see you may have already

realized that the folder posts

underscore pose is very important why

because the one that contains the source

files for your post so for every post

like the one that you created for

example there is a folder and for that

folder there is a source file that you

were editing and also there is an HTML

file that kind of exists only after you

meet the thing and you build it but the

what's actually displayed and the thing

that you could publish actually comes

from this other folder it's called site

so your next task here is to click here

on so what we want to do is to publish

the post how you do that okay just by

putting that folder underscore site in a

server in some some place that can serve

your website and we're not do it in a

very simple way we're gonna first

download that folder and you can do it

by clicking here on the name of the

folder in the files tab and then go to

the more section here here more and you

can go to export so if you do that let

me see if I already have folder call

just like that right so here is my ID as

you can see here here is my downloads

folder it doesn't have yet that site

underscore site folder but if I do click

here on export you will you know propose

to be exported as a side dot zip file

and automatically at least in Linux it

it exports into my downloads folder so

go ahead and do that

and then click yes when you're done and

in the meantime I'm gonna show gonna see

some

exported it so basically these zip file

contains a bunch of HTML files that are

that contain our post our blog and then

the next thing I see every three people

as good the next thing is we're gonna

drag that folder that contains all those

HTML to a service that can serve a great

and CEO rate before people were able to

do the task so in the collaborative dog

in the Google Doc there is this link

that you can click there I'm gonna paste

it here on the same window here that is

a very cool service by Ned leaf I may be

fine

serves web sites and it has this very

neat feature that just by dragging a

bunch of HTML files it serves the block

for you so here is my my you know the

site that I exported it to my computer

and just gonna drag it into this white

space and wait a few seconds and here it

is I now Nathan if I see serving my put

my blog in this link so if I click here

in this link as you can see I'm already

online and my blog is already online and

so I can click here in my post and and

see what's in there so go ahead and do

that and when I reset the yes so find

your exported blog and drag it to Nate

Lee 5 the address is here I think

everyone is already in it so that one

person or persons who use the parameter

self-contained equals M true please go

to a post like the one I'm have here

copy that address that you see there and

send me the address to your post here

just face it

oops sorry place it here like that

because I'm gonna use that address to

republish your post so what I'm trying

to show you here is how you could

publish your own personal blog post for

your data Sciences

and then there is two ways in which you

could contribute to the two degrees

block one way is to write you know

directly inside two degrees blog but

another way is to just send me a link to

your own blog and then I can import it

Constanza i see that you said no would

you like to say what's what's going on

I'm just wanting to announce that

nullify has troubles connecting me to

notify and I guess I have to look deeper

into this so fax yeah

everyone same anyone because by an ad

blocker or something but then I have to

write so I'm sorry I have the same

problem but it works when you sign in

okay great thank you very much probably

that's why I didn't experience that

that's probably because I have an

account with nearly five ok so then I'm

gonna gonna go on with the last little

bit of this meetup which is kind of to

just show you how I import into two

degrees blog a post that you might have

written somewhere else actually see

someone okay I see let's see what this

this one here is about ok Twix something

nice I see I see let's let's click here

I'm gonna copy this post and see if if

this works on if I can import it so what

I'm doing now this looks similar to what

you saw before but I'm now at a

different interface I'm in our studio

locally and I am at the blog post at the

blog from two degrees it's called D s

data science at two degrees and I'm just

gonna use the function we still import

post and all I need to do here is to

paste a link to the post that I want to

import so let's in this

I think it was Jackson who wrote this

post and and say that you know he wants

to hosting his own personal blog but

then he sends me this link because he

thinks that it's also relevant into two

degrees so I'm going to import that post

into two degrees if he used that flag

self contains equals true Benny should

work and if it does any well face well

we'll see how it goes so I'm gonna press

ENTER now it's asking me a question here

let me reduce the size of this a little

bit it is asking me if this if I you

know have a license to publish this I'm

gonna say yes because I mean if you fit

by the information of course you

couldn't and it worked

actually so now what I see here is a

preview of of the of Jackson's post so

let's go back to our studio so now if I

if I build the blog again remember that

I'm in two degrees blog now but I want

to import

Jackson's blog or Justin's post so here

you see so what you see here at the

bottom is the post that existed before

and this one here now includes the one

at the top is Jackson's post so I

successfully imported his post just from

link so that is it we have one minute or

actually less than that for questions

and comments

but also go ahead and write them down on

the document so anyone there please

share your ideas comments questions

speaking them aloud

no comments no questions I have a

question just a speaker last idea I

wasn't to import post they have to be

and it made it just so framework

specifically I don't think so

honestly I'm very new to the frameworks

but I think that it should as long as a

self-contained document but I don't know

exactly what it means but we could learn

I think its aims to be flexible enough

so you should be able to import anything

in any case you can also send me the

HTML you know and I can even if like I

think so I have a blog already written

for your like like Jekyll and God

framework and it's like it's all

markdown files for the blog and stuff

anyways I'm sure there's a way to do a

self contained in version of violent

important to the stove and even if it

doesn't exist already it seems like

Jekyll is commonly used enough like

someone should start that maybe we can

even yeah also it is very tweakable i

the version i show is the vanilla one

but you know I saw that Venus and has

been you know creating excellent themed

CSS files so maybe you know if he wants

to tweak the blog so that it looks more

2° that it should be doable I don't know

how to do it but that was my first thing

I looked at as I looked at the backend

its JavaScript I've never worked with

but maybe they'll be a pet project but I

mean like our our theme is just we just

like flat-blade get some good stuff

pretty much so I'm sure we could even

the vanilla looks kinda a little bluish

so it's pretty well anyway I'm gonna now

spend time answering the questions of

line but I'll let you go to Taylor's

meeting so thank you very much for for

joining

cool good thank you

[Music]
