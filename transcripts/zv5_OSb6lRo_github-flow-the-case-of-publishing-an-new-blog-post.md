---
type: Video Transcript
title: "GitHub flow: The case of publishing an new blog post"
description: "Github flow um and i have um more than one reason for that one is the main one is that you know we are to a workshop about..."
resource: "https://www.youtube.com/watch?v=zv5_OSb6lRo"
tags: ["ds-incubator", "github", "pull-requests", "git", "workflow"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=zv5_OSb6lRo"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2020-07-28T00:00:00Z"
    usage_count: 24
usage_window: { from: "2020-07-28T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

so today uh i wanted to revisit the idea

of the git

github flow um and i have um

more than one reason for that one is

probably

the main one is that you know we are

close uh

to a workshop about the thai diverse and

um i want to take it kind of flow to be

you know

fresh in your brains because we are

gonna use it

um to support the workshop and my idea

is that you know if we

um instead of focusing on learning the

github flow we actually use it

my hope is that um you know by repetiti

many times you will we will just kind of

um you know

find it easier to to implement

and another thing that um it's kind of

hidden behind

this meetup is also the idea of um

facilitating

contributions to the to the data science

uh blog that we are running

uh and that also comes from from the

super exciting news that we already have

a couple of uh

new submissions one by jakko one by

vincent

also everyone else is welcome

to to post there and we didn't really

know

much um you know what use people would

give to this post but to this blog but

now i think

uh in conversation with with jackson we

kind of discussed that you know

it could it could be a platform for

teams to communicate within each other

because you just created a category that

for example has the name of your project

you work on

and there you can kind of distill

conversations that otherwise could be

hidden

on slack so you know once you're gonna

come up with you know a standard way of

doing something you can just write a

blog

and post it there just as jacob did so i

think that the use cases of

yacob and vincent both demonstrate great

uses for that

that post so for many of you

this meetup maybe just a repetition of

what we did before

and you're welcome to to use the time

for something else

but for those who wouldn't mind

revisiting it

um stay around so um

it is important because of uh you know

we we use it a lot here in two degrees

and uh not only here but it also

probably the most common workflow that i

see out there

it's very simple and quite effective

so the resources link

should take you to a google doc that i'm

going to use as a roadmap

the idea is to to start by doing

and then try to understand or break down

what we did so the very first thing that

i would um ask you to do is to go to the

dock

here at the date of today and then

ending with dsi so 2020 07

28 dsi so that you have access to the

links

so if you're there uh what we want to

do actually is to um actually i'm going

to give

some time here because i see only a few

people

um so just to confirm you can you see my

google doc here

thumbs up yep okay cool so what we want

to do is to

uh you know once you land there you will

have access to a bunch of links

that i wanted to share with you and

under the heading

do uh we're gonna do the the only kind

of activity of today really

um which is to go to the blog post

um or to the blog actually um

and once you're there you will see that

at the top

right there is an icon for github so

what are we about to do well

what we are about to do is to create

a draft for a new post uh so in

each of those who want to practice this

github flow

uh with me today and i encourage you to

do this i mean it's going to be like a

toy

example but it will you know by the end

of this exercise that will last like

only five minutes

you will have an open pull request on

uh the blog repo uh that you can

in any any time any point in time later

you can you know actually extend it to

to add like a real post so for now we

just need like any change

on the repo uh to be submitted as a pull

request

as a proposition for a new post so the

exercise then to kind of reset what i

just said

is to um pretend that you want to submit

a new

uh post to this blog and

by doing so we will be practicing the

github flow

and we're going to be doing it in a very

simple way

which involves only github as a tool the

more complex

workflow involves for example cloning

the repository locally

maybe with our studio or something and

and doing

work locally but we are not going to

cover that uh today

it is something that you will be

expected to do during the tide diverse

workshop soon

but but let's go one step at a time so

if you landed here at the um at the page

that

shows the blog the next thing i would

like you to do is to get

to the repository that contains the

source code

that is where you have to submit um your

proposed

post so how you get there well by

clicking here on this

github icon on the top right i'm gonna

make this my screen a little bigger

uh you could navigate quickly

to the github repository that hosts

the source code as a detail that is not

important

that much uh you know all the posts are

inside this folder called posts

but for you to submit your your uh pull

request

the you you can change absolutely

anything just to open a conversation you

know with me or with

with jackson or whoever maintains the

blog and whoever is gonna help you

publish it so all we need to do uh is to

click here on add file

and just create a new file and that will

eventually contain your blog post but

for now it could be just an

empty file so all you need to do to

actually

initiate the process for submitting a

blog post is just to create

a new file so i'm going to do that here

and i'm

doing it slowly to invite you to do the

same thing with me

so i create here a new file and as you

can see

we are actually this link you could save

if you wanted um

in your um in your bookmarks because

that that is the link sorry the link

that you need to

um you know that you need to create any

new file on this repository

so here i'm going to type something

silly like uh

my new post you don't even need to type

an extension but let's say that i do

want to say okay this is going to be

an rmd file because i just know that

eventually

that's the format but you don't have to

it could be just a

like just a name of a file so let's do

that

and it could be empty but here i'm gonna

say

uh i'm you know i have a space to start

editing this file i'm gonna say

um the cool stuff

is about to come

so here you could probably describe a

little bit what's the idea

that you have for a blog post and then

just scroll down

and i have we have clouds here let's

admit him then you just scroll down and

you will see

the familiar interface for creating a

commit

on github because i

am an owner of uh of the github

organization

i have the possibility to commit

directly to the master branch but i

don't think you will have that option

and if you do then instead of leaving

this

option set here you just click here on

create

a new branch for this commit and start

a pull request so if you are already a

little familiar with the github flow

you will have heard these words you know

branch

pull requests and and the interface that

i'm using right here to create this

proposed blog post

uh that's all of that for me with very

little effort i you know i'm using

the git hub flow so

by clicking this option here

hi uni welcome by clicking this option

here

instead of proposing this a new file to

be

um you know into directly the the main

branch of my repo

i'm creating a new branch and i can i

can call it whatever really i'm gonna

call it

uh mauro's boss

so i invite you to do the same this

particular interface may look again a

little different for you

if you do not have right access to this

particular

repo and if you do again remember to

click here on the create a new branch

by clearing by by clicking here creating

a new branch is this is where we are

embracing

uh this special flavor uh or this

special way in which we work which is

called the git flow

so i just click on create new file and

you know by clicking that

i i land on this new interface

to create a pull request if you want you

can extend

here um with a little comment something

like

hey i have an idea

of course that i want to discuss

you continue to scroll down you create a

pull request

and kind of your job there has finished

it's done

by doing that um whoever is monitoring

and maintaining this

this repo like me or jackson will get an

email that will know that there is a new

pull request

and then we're gonna come here to pull

requests

and we are gonna see uh the

the request being submitted so right now

i see only one

uh pool request by jakob so i

encourage you if you were able to follow

up to follow along

i encourage you to submit a pull request

so that we see a few more

um and as i do that

as you do that i'm gonna show what is

next so what what

do you enable by doing what i just

demonstrated

okay so now i'm going to play the role

not of the person who submits

the post but the role of the person who

actually

reviews the post i'm gonna you know i

land here on the i i'm notified that

there is a pull request

in this blog so someone like in this

case jacob wants to submit a new post

and i i'm gonna help him uh by reviewing

it you know maybe just by brainstorming

some ideas fixing typos

moving the file to where it belongs so i

click on

the pull request that he submitted

and i can see already some

comments that he wrote actually

blah blah blah it looks like this

belongs to an older um

post yeah that's from yesterday he's

saying so maybe this is

uh i know actually maybe this is a good

example so this is a

real request that he submitted yesterday

and as

you know what would i do from the

perspective of a reviewer well i go to

the

um files change tab

so that as you can see the pull request

the big pull request tab has a number of

subtabs

the conversation tab is the one that you

may be more familiar where you can you

know have

a conversation with people but then

there is another ones that are really

useful

uh like for example the one here to the

right files change that shows me

what files have changed since last time

so i'm going to do exactly that but with

a simpler pull request that i have just

submitted so i'm going to

go in back to pull request oh i see like

many posts now so great

let's see daisy's pull request for

example here

uh great so i see that there is one

commit

i navigate to the files changed i see

that there is a new file here

it's called this new post and he she

wrote

i have also a good idea so now i could

you know

use this interface to review um

her pull request and say something like

sounds

great could you

please do blah and then you know we are

already engaged in the conversation

about

her submission from then onwards

we will start a conversation that will

result in the publication so

exactly what i just demonstrated is all

you need to do

to initiate a submission uh

the process from end from beginning to

end

is now documented actually as a blog

post

in

here i have just published today a

little post

that explains um

the process uh you know how you submit a

new post

which is basically what we are covering

today and

because i acknowledge that the very

first post of this blog

did encourage people to submit posts but

didn't explain how

or what content you should submit

basically if you read this post

you have all the information that you

need all you need is just

a title and some content really

and then it is also nice to have a few

other things like a description for your

post maybe a photo

and and what else

and a link to a personal website if you

have one and maybe a category if you

want to

um kind of group that post to other

posts that are alike

so with that uh like categories for

example you can filter

like in this case we have a packed

analysis category for example

the scenarios category so if you click

on packed analysis and then you filter

from

from all the posts that there are just

the ones are specific to that particular

project so that's that's one way in

which we envision the posts

uh becoming like one way of formalizing

communication

uh between the the teams so

with that um

i encourage you to kind of read the the

post

about um how to

submit posts because you know there is a

bit more than what i have just

demonstrated

but with that i'm going to go back to

the document

open a little bit of a discussion and

then after we kind of um

consider your questions like openly and

you know by you speaking

then i would like to use the rest of the

time to kind of break down what we have

just done

in a very kind of formal way and in a

very visual way

by walking through this kind of little

tutorial

where github explains what it is the

github flow and maybe if we have time by

watching a video

but before we do that please um just

kind of speak up with

kind of your comments your questions

maybe about the

flow or maybe about posts so go ahead

that's correct that's correct you you

could do that i mean

what i i the intention of what i

demonstrate is to kind of put the

barrier

of a kind of is making a submission very

low

on the technical side and because what

we value most is the content so if you

have a good idea

what you have just demons kind of

explain is of course the ideal workflow

where you kind of

serve yourself to the entire process you

know

you create a fork of the main repo and

you create a branch

you ask commits and then you submit

requests and and we can extend on that

in a moment but kind of the the take

home message

of this meet up is that what we value

more in the blog

is the content so if you have a good

idea all you need to do

is you know to do what i just

demonstrated or even less than that you

can just open a new

issue on the blog repo

and start discussing saying hey i have

this good idea and i started this idea

at this other repo and you can just

share a link to it so we can you know

see what you have been working on

and then we walk you through that

process so what i'm saying is that i

think that with jackson we

you know hopefully i'm you can say if

it's not what we discussed but

i interpret that you know we are happy

to invest a little bit of our technical

effort

in in allowing people to share

uh their work because we value what we

are doing

and and we care a little less about how

you do it so if you do want to practice

a github flow

feel free to do vincent what you did

actually when you submitted your post

and we just said

uh the long loop where you know you

create a fork you add

your um submission as a new commit in

the new branch and then you submit your

pull request

but you don't have to we we value more

your ideas

than your workflow it's totally up to

you if you do want to practice the

github flow

do we have a some other another question

because i have also a four minutes video

that daisy and jacob

saw and that i think is pretty cool

because

it kind of explains what vincent you

know vincent used because he's already

familiar with it

we have flow he already used some jargon

that i would like to kind of clarify

through a four minutes video but before

that do we have any other question that

may help

actually interpret that video

okay cool so um what you're gonna see in

the video basically is is how github

sells itself and you will notice that

the git have

flow so this process by which people

submit um

changes to projects uh is so

so much the core of you know what what

github

uh proposes people to do that you know

it sounds like it's a good idea right so

it is also kind of capturing the image

that you see now on screen

so can you confirm that you see you read

here understanding the github flow

thumbs up anyone yes cool thanks

so um basically this this boss which i

also link on the google doc

kind of captures the essence of what we

did

and what i did you know when i added

that file and what vincent said

so the and the video is gonna extend on

this but let me kind of show you how it

works

so basically everything starts by you

know this this

y icon here is you know the idea of

creating a new branch

so a project has a main branch that is

the one that is exposed to the public

in in the case of the blog post the main

branch is the one that actually

publishes the content

but there are maybe many other branches

where we are discussing potential posts

that are not exposed so a user could not

go to the website and see

like an idea that is still kind of

half-baked you know we could be kind of

discussing something with daisy with the

with yacco with vincent uh something

that is not yet ready

and no one will see that uh on the

website no they might see the discussion

the public discussion on on the

repo but not on the website so

everything starts from creating that

branch right

once you create that branch then the

next step is to kind of

start adding commits start changing the

project in any meaningful way so in the

case

of the example that i showed when i

created a file i remember remember that

i clicked this this

button that said that said do not do it

on the master branch do it in a new

branch and i call that branch something

like

mauro's branch or mauro's new post and

so that was the first step and the

second step was actually adding the file

so i did the file

you know belongs to this little part

here where i'm actually adding commits

remember commits on git

are just this is very special flavor of

um

of this very special way of creating

snapshots of the history of your project

or leaving flags

along the way as you work in your

project so that's the second step which

i did by

actually creating a new file and adding

some text into it

and then the third step is actually

creating a pull request so remember that

when i save that file on github i think

i clicked the green button that said

something like proposed

change or proposed new file then i

didn't just finish there i was sent to

an

interface to actually create a pull

request

so there is where i officially open the

door

to a discussion with the maintainers of

the repository and

it is what it makes github so powerful

because it allows in a very fluid way in

a way that is very close to the way we

work

allows a communication and conversations

among collaborators

so then the next step is act to actually

have that discussion you know

you know i wrote a little comment on the

review for example of the

pull request that daisy submitted she

may have different opinions you know we

may have you know work together on ideas

and only once we're finished uh well the

deploy stage is when

you know we actually accept the changes

and then those changes become

uh integrated into the website so the

user can see that and this is here

at the end uh where you know basically

the changes that we have been discussing

we actually include them in the main

branch

by what's called merging the pull

request into

the master branch of the main repository

and that is what will expose the

finished version of in this case a blog

post

to the website and to the world so that

is it

so that is kind of a like revisiting and

kind of breaking down what i did very

quickly

from the github interface and uh and i'm

gonna pause here

once again to see if there is any

questions here and then we are going to

revisit the same thing

again in an even more visual way which

is this four minute video that should

take us

to almost the end of the of the meeting

so second pause here do we have

questions or comments

um

mm-hmm

um

that's a very very fair point the the

little kind of explanation that i gave

here

uh didn't explain much about this idea

of forks

uh but it's true that forks have kind of

a fundamental part of the workflow

um and most of the problem comes from

the fact that we have too much access

generally

to i mean i don't know too much maybe

it's not a war but basically

so if you have no access to

write to repository then you have no

other choice than creating a fork

and then the fork idea becomes more

natural because that's kind of that's

for you as a as a contributor that's how

it goes so you have no choice so you

don't even need to think about it it

just happens

but because you know as members of the

two degrees organizations we can

choose to give people right access to

the repositories we maintain

then is when um the problem comes and

sometimes it is the good decision

because you know if if you are you know

the main contributor to a repository of

course you do need

right access and you may be in the role

of actually maintaining someone else's

contributions right

so it makes sense for you to have write

access but that it's true

at a layer of complication so you may

not realize that you are not working on

your own fork

of the repo but you are working on the

main repository

or you realize and for some reason you

want to actually push something

directly to the what's called the app

stream uh

i'm not going to have time today to get

into that too much

but i do uh have a little

post here it's called github flow

and that say submit pull request from

any branch except master

so that post explains uh mostly what is

the problem

and how that probably would manifest for

you when you actually have

uh created a commit in a master branch

uh so basically the the rule of the

thumb is like never use the master

branch

um even if you do have

access to the main repository even when

i work with myself

i create a branch work on that branch

then push it to my own repo

and then merge it or even squash many

commits that i have on that branch

so if you do that you will stay away of

problems most of the time

and and the distinction between fork and

not fork

is not gonna come bite you uh so much

but i will take your comment that's very

important and that's something that i

will probably spend

uh like maybe a whole meetup talking

about

so any other question

okay we only have two minutes um do we

have that again

after ourselves

wisconsin okay

take over

okay that this is to to borrow two

minutes and a half from the

to get over okay so

okay so the idea is do you see the

big icon the big uh github icon here

right so if you are in the dock you may

want to play this video

yourself for for better sound and mute

uh what i'm what i'm doing but i'm gonna

play hoping that

uh you will hear it well basically it's

gonna show you

a little story of some developers and

one contributor

or one user actually and and how they

use the git flow

uh to to improve the project and

hopefully

we will discuss today you will be able

to map what we did the different

components of what we did

to different parts of of this video uh

we will check

on that when we finish so let's see i'm

gonna play two seconds to see if you can

hear it well

well github is a platform that helps

people solve problems

by building software together does it

work

this is sam sam could you hear that

yes okay so let's continue there

but not in the way you might be thinking

she builds the software that helps make

tractors more efficient

and she does this on github with the

help of her team fiji

melinda and mike now

even though they all work on the same

project sam and her team don't all work

in the same part of the world

this is eddie eddie also works on

tractors all day

except he actually works on the tractors

all day

and this is the harvester l700 it's the

latest flagship in the company's suite

of tractors

it's full of sensors and processors that

produce a ton of diagnostic data

eddie has a great idea for how farmers

might share their data and improve their

harvests

so eddie opens an issue on github issues

are discussion threads where people can

report bugs

request features or even just ask

questions

sam is the first one on her team to see

eddie's issue and she thinks that vijay

would be the best person to start the

job

and here's where we get into the nuts

and bolts eddie isn't the only person

using the harvester l700

all over the world other tractors are

collecting moisture data

and they need to keep running smoothly

even while vj's working on the new

features

he needs a dedicated place to experiment

so none of his changes end up on the

farm before they're ready

so he creates a branch of the code an

alternate timeline where he can safely

make changes to the software

now he's ready to start writing the new

features

github tracks bj's changes and save

snapshots of his progress

when he's ready to collaborate on the

changes with his team he opens a pull

request on github

pull requests let you show others the

changes you're proposing so they can

review and discuss them this means bj's

teammates can help with roadblocks and

even make improvements

on github everyone has a copy of the

project

so if melinda has an idea for something

that will help make vijay's work even

better

she can add it to the branch herself

github is a record of everyone's

contributions and feedback in the pull

request

alongside relevant messages from the

team's other systems once the team has

signed off on the changes

vijay can incorporate the new code into

the project

the new feature will be available to

everyone as soon as he merges it in

now farmers everywhere can all benefit

from eddie's great idea

[Music]

but this is really only the beginning of

the story

because github is the largest community

of developers in the world

with millions of people sharing their

projects eddie's idea could end up

helping people in

unimaginable ways what kinds of problems

are you trying to solve

whether you're an engineer a code

enthusiast or even a farmer trying to

harvest grain

okay we're here on the same page

good i'm gonna do a very quick uh

debrief

of the video trying to relate that to

what it could mean

if we thought that the story instead of

being tractors and

and those people it was us you know

contributing to the vlog

so someone like some uh could be someone

like jackson or me

that uh you know work uh on the uh

code side of things so as someone like

um i think it was eddie the one who

submitted the

you know who had an idea and wanted to

study the conversation

um you know maybe that is in this case

uh someone like uh you know vincent who

wanted to submit

a new post and had a new idea but he

still didn't you know

um actually do any change in the in the

in the repo then as someone

like vijay who was actually the person

doing the change

in this case could also be vincent you

know that's different from the video in

the video

vijay worked on the code side of things

and the person who had the idea

was someone that didn't work on the team

but but

in this case he is both he's you know

someone who wants to see

the product who wants to see the the

blog polish but at the same time he's

the contributor right so he's both

vj and eddie and then you know when

when you see those the tractor itself

is the website for us so the tractor

with all the devices that it has

that is the public manifestation of the

product that they built

so in our case the public phase of our

product is the website in this case the

the blog

right the each of those posts and so the

reason why you know the tractor split in

two and and created a branch

is because you know at the same time

that you know and you know you want to

be working and experimenting with things

that might break

at the same time you need to have a

stable branch that continues delivering

the product to the to the world right

the tractors need to continue

to work even if in the process of making

it better you are messing up so in our

case

you know while we play with you know a

new a new submission a new post

we still need you know the website to be

serving the posts to the readers right

and then finally you know the

conversations that with melinda

sam i think it was mike as well and

all that conversation is the pull

request you know everyone has ideas

proposes changes some of them actually

make

make some contributions and then when we

all agree that you know the product is

ready to go maybe

we passed for example a spell check and

and you know we read

you know what what or or style guide

to the post that you publish or you

submit then we manage that pull request

and that merging process what it does is

that your

your um your blog or your post that was

not exposed now suddenly becomes exposed

and everyone else around the world

sees that public manifestation of the

change which in the case of the video

was you know those part those

tractors became purple purple and have

better devices so that is kind of the

change that is now

an improved version of the of the older

product

so that's the end and i'm you know six

minutes above

the the threshold so um

i hope that clarified if we if we have

any parting a comment go ahead actually

and if you don't have it very polished i

encourage you to put it here on the

questions section in the doc

and i will be sure to answer it so

any any question or comment before we go

okay cool also as i say goodbye i know

that some people here you know

know this i very well so i know that

it's not useful for everyone

but also just to sense what's you know

you know how much um

youthful uh more of these things could

be before the

television tutorial and i would like you

to write a little note here

if you you know say yeah i'm i'm already

super familiar with this you know this

it was like a little bit like

i didn't i didn't need it or if you if

you found

something of this was was useful with

that i thank you very much for your time

and

and then you know we catch up there on

slack and see you next time

bye bye ciao
