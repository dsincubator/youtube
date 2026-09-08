---
type: Video Transcript
title: "Gitflow workflow"
description: "It in pretty much every use case that i put it in um let's talk about what is like a fairly common starting get workflow can we uh..."
resource: "https://www.youtube.com/watch?v=OofNbCXEVgU"
tags: ["ds-incubator", "github", "testing", "workflow", "cran"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=OofNbCXEVgU"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2021-05-25T00:00:00Z"
    usage_count: 162
usage_window: { from: "2021-05-25T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

okay hey everyone um

i am going to be talking about get flow

today which is just um

it's sort of a

accepted best practice for working with

git

amongst developers um it's

nothing special doesn't require any

special tools

um i've been using it for

the better part of a decade and it

served me well

in pretty much every use case that

i put it in um

so i'll start with um

let's talk about what is like

a fairly common starting

get workflow can we uh see

if my fancy fancy google slide here

yes yes cool so

this probably looks fairly

familiar to most of you you have your

main

or master branch and then you'll

take a branch off of that make some

commits to it

and merge it back in or make a pr

to merge it back in and one of the great

things about git

is that you can have multiple branches

simultaneously

and you can merge them back in basically

whenever

it's convenient for you um

which is great this is a

functional workflow um

right up until it isn't um

so let's take a look at one of the

situations that's really actually quite

fairly common

especially uh for us here at two degrees

where that might be the case um

what happens if these two branches

are interacting with each other in some

way so

this branch implements a function

um and this branch uses it or

vice versa so really one branch doesn't

make a whole lot of sense without the

other

right so what you get there is

in between here that there's that period

of time where

one of the branches has been merged in

but the other one hasn't yet

uh where the thing doesn't

work anymore um and that

that i feel should be a fairly

uh a fairly standard thing that we

should

hold ourselves to is that uh our system

should not be broken at any point right

like that shouldn't be the default state

at any point in time

so the useful way to get around that

is to instead

call this thing

development or dev or develop something

along those lines

and you have another branch

up here

i'm going real high-tech here

and that is your main branch

um and so

then you can uh

once these two things are together

you can make a merge

back from the development branch

into the main branch and so the main

branch only has

a few commits on it but

at each commit you know that the system

works

and that is a really important thing

is because uh it means that this main

branch

isn't going to have all of the latest

coolest

newest things at any given point in time

but it

works um and that is a really

once you have um that change in mindset

that you can make more changes and maybe

they'll work

maybe they won't but i don't have to

worry about breaking

the thing that uh everyone else is using

that really frees you up to be a bit

more ambitious

in the types of changes that you can

make

um questions so far on

the the motivation for why this

system exists cj

um i mean so

i think it's interesting hypothetically

and totally happy to do this for us but

i also

isn't like the ci testing that stuff

that

hopefully you have does not like avoid

these problems

i mean if you if the main reasoning or

justification for this is

we don't want to break maine or mass or

whatever you want to call it

isn't that the whole purpose of having

the ci testing i mean i would think that

you should have ci tests that will

that's whatever change you're making in

your branch it doesn't work on that main

branch without

messing anything up and if it does then

like you're okay to merge so

like what additional benefit beyond that

are you getting

um that assumes you have perfect 100

ci testing

which is not a realistic uh

thing for anyone to assume

right um

second it also assumes

that none of the branches have

interdependencies or ordered

dependencies

right how many times have you been in a

situation

where um

it's oh the this branch

can't be merged in until pr 228 has been

merged

right something along those lines

when you're using this sort of system

you can merge whatever branch you need

to

when it's done and

then the other branch can get merged in

when that one's done

you don't have to worry about those

ordering dependencies

so much so

does that imply that you're

totally willing probably even likely

that you will break the develop

branch frequently

develop is a branch that

should work most of the time but is not

guaranteed to

maine must work

the way you can mediate that to make

sure that

even if develop isn't perfect that main

does work is

by um

let me add one more branch here

so let's add in this branch

here i'll color it a little different

it's going to be red and this one is

called

release

um and this one is another one of these

short-lived branches

that um so maine will always exist

develop will always exist but every

other branch

can be deleted when it's done

and so on the release branch

you can build your uh

your code make sure that it actually

works

um if you need to make any changes to it

so

a really common uh thing to see on the

release branches like

uh updating the readme or updating the

notes files

or bumping version numbers those kinds

of things

and then once you're happy that the

release branch is done

then uh

that gets merged in

like that

um and that gets merged in

and then it would also uh

get merged back into develop so that any

of the changes you made on the release

branch

also are uh

included in what everyone else is

working on

so you don't have to have that perfect

ci testing because you can do your

testing on this

that assumes that you're testing that

you do do on your release branches

100 effective no you're testing on your

ci but

you know okay so i mean but so the

the reason to do this is because

it is a lot more practical to do if you

have

i don't know let's say a four hour build

process and then several hours of manual

testing

prior to a release right that

sounds fairly familiar um it is a lot

easier to have that happen

once in a while off of a release branch

and then you can say if something is

failed you can be like okay is this

something that is a quick fix

and we can put it on the release branch

or do we kick it

back to develop and then start over

again

can i keep asking questions yeah yeah go

for it

i'm just you know i can't really see

people here so

people just have to speak up so the um

like the names that you give branches

like fubar

etc these are basically arbitrary they

can be basically

yeah so then i wonder why

in this case why does maine have to be

this like untouchable branch why not

make like

release this untouchable branch only

blah blah

and then maine could be your developed

branch where you

like push stuff and part of the reason i

ask this is because at least in

our package development world the

expectation is that whatever is your

main or master

on your default is called your default

branch on

um github that's what like would get

installed if you use

install github and you don't do anything

special um

so that's always considered the sort of

like the developer

like ready for release for testing but

not what's going on type version

a bad assumption there if i'm installing

the package from github i want it to

work

not i expect that i'm going to be doing

developments on it

oh yeah but i'm saying this the standard

in our package world is that what is on

github on your default branch so what

you would get by default if you use

install github

is a development version which is

expected to work

but also understood there might be bugs

in it because it hasn't been like

fully packaged and released on cran

so if we were doing this type of

workflow

what would be ideal is if we left the

main branches sort of the develop branch

and then you had this

additional release branch that was a

sort of untouchable like the only

put stuff there when it's ready to be

released on crown branch is that

possible as well

i mean you you can see here i renamed

the branches and

the the workflow is the same yeah

so that the the name of the brand so it

is

customary to have it be developed

maine and then all of these

other branches get prefixed with like a

feature

prefix

there i would like to um yeah sorry to

extend the comment by gabor actually in

a conversation

we have i asked about release models and

how untouchable

is the master branch on

github repo and and

his answer was that for them they

released

is the product on cran and so just like

alex is describing here except that the

names of the branches

could kind of change right so if there

is no cran because you know the software

that you maintain

uh is not put on cran then what would be

on cran

good in my interpretation right alex is

for you to kind of check that i'm

understanding correctly

but cram would be uh what what in the

original

uh graph show you showed as main right

is that correct and then the the main

branch of a github repository

you know based on gabor's interpretation

of this workflow

could be what we are calling here um

development i think originally yeah

i'm just going to for right now

i'll use the standard convention

with this model for our implementation

we can change the names but

um i think our default assumption

should be if someone is going to

be installing something from github

that they're going to expect the thing

that they are installing to work

and not be in it it's not supposed to

does it work or does it not should not

be a matter of which day did i

install it on right

um i i think if someone really wants

the hottest latest features they

they can step out and add that one extra

argument to install from

the whatever the development branch is

cool and i guess that the um

i mean what's in place here um in and

in the um uh well i'm gonna think

simply i mean the importance here is

that as you said alex you know he frees

the developers to work

super conservatively right so you can be

more experimental and i think that's why

i contacted at that point i made that

question before that um governor

responded because he said that

he doesn't sometimes ask for reviews on

things that he merges on

on his github thing because

in their team the release is described

so you know they can

sometimes you know do quick things

without huge

um reviews and then they do a bigger

review when they submit to crime so for

us if we just move everything back to

ourselves so if

if the release is something that we

maintain on the github

main branch then then yeah so that

work for them makes total sense so now

we have a develop

branch where we are you know working

fast without being

too conservative still aiming right for

i guess um for you know checks to pass

and everything but it's not the end of

the world if something doesn't

and then whenever we do the release um

we have more checks and then it's merged

to main is that my interpretation

correct alex

yeah so i think that really

touches on um a

institutional benefit of

this sort of model is you know

if i if i'm writing a feature

and i'm writing some code and i merge it

into develop

i you know it's not a problem for me to

tag

one of you and be like hey can you take

a look at this

you know it should work you take a look

at it it looks reasonable to you

cool we throw it in to develop things

are perfectly content

right but it's also entirely reasonable

that before

we change our main

or our production whatever we end up

calling it um but before we change

this branch that

we want more people to look at it and be

like

okay we are making some changes to

uh the interactive reports right those

are

included in this release branches some

changes there

persons x y and z can you all

three of you sign off make sure that

these changes look good to you

right it it

this is a this model adds that

little bit of formality that allows us

to say

okay any time we try to

uh merge into the main branch

you know one of the project managers

or one of the grant managers or someone

who actually has skin in the game to

make sure that

uh this actually works

uh they have to also look at it

but it also abstracts away you know

they don't have to see

all of this stuff they just see

this one thing and they look at it and

they're like okay

here are the results here is the

compiled reports

yeah this looks good to me let's approve

it

so it does allow us to

start to

formalize our release process right

because right now the release process

uh especially for like the packed uh

docker image is one of the

biggest things in my head that could

benefit um

all of the packed revo's collectively

could benefit from this

so that we could look at this and say

okay

here is uh you know

these this thing we know this thing on

its own

works awesome uh

before we make another change to it we

need to get

other people beyond just the technical

team involved to make sure that the

results are correct

so if you

i mean hypothetically i like this idea

that you have like some restricted

branch that has like higher

you know requirements for something to

get merged into there so for like a

release crash

and that makes a lot of sense like that

people most

you know in charge or like responsible

for

like what goes on the web or what goes

in the docker image

would have to review that but

that also presents a problem

i think for me at least i often like to

review really small pull requests and

the bigger it gets the more

panicked i get about it and the more

like context you add to it the more

crazy it gets so

i would actually much prefer to review

very small individual features that are

added rather than wait till like a

release occurs and then be like oh we've

added these 14 features

and here's this bam this like gif file

that's like

massive with all these different changes

totally different context of something

so

do we get am i not using squash and

merge on this or do we like what's the

how does how do you manage the div file

so that when you get to this release

review it's not like

a massive thing that you can't possibly

wrap your head around

okay these two

are code reviews

this is not a code review

it's not reasonable to inspect

the code that is about to be

merged from develop to me

because as you said it probably touches

200 different files and it's 4 000 lines

or whatever

um that is okay you shouldn't be

inspecting the code here because the

code has already been

inspected here

what this one is is looking at the

outputs

making sure that the system as a whole

is doing what you're expecting

does that that like it's a subtle

frame shift but does that make sense of

why

that makes this whole process possible

uh

i mean it makes total sense to me

because obviously i asked questions so i

understand why that's

critical it yeah so you'd be reviewing

like

should these features be included in

this release or not

i still think that maybe a little bit

might be a little bit difficult to do

and

might be at least in our case like a

huge hail mary to say like oh yeah this

has been reviewed already

but yeah so

i'll say like i'm a little skeptical

because i haven't seen this in practice

yet but

i definitely hear that

um that

i mean this is a

this is not a cure-all to all of our

problems

this is a slightly better step

right um like there's going to be

difficulties

all the difficulties that we still have

will still exist

hopefully some of them will exist less

right bugs still make it in

uh we still get merged conflicts those

things

still happen um but

when you use this system it becomes

less of an issue and more importantly

uh even

even if you ignore all of those things

that are less of an issue

you still have a working product

um so what happens if you you

add some new features you go through the

feature branch they get

reviewed run through ci and make it into

the develop branch and then

then it gets put into the release branch

and somebody reviews and said yes it

should be in blah blah blah and it's

merged and made then you're like

you celebrate because you just had your

new release and then you get back to

work you start opening up new feature

branches

and some of them like really quickly get

merged

back into develop some of them still

being working

et cetera but you're starting changing

things on the developer branch

and then a user emails you and says yeah

well

there's a bug in this blah blah how do

you start

developing a book

i mean i understand that in many cases

it wouldn't matter but i can imagine a

case where

it might matter that the new features

you've started adding after that release

has been done

is already yeah okay yeah i've already

answered business

we're at like

this point in time here right something

has already been merged back into

develop

right but we have a buck so there's

two paths that we go down here

one uh it's a normal bug

and we're just gonna deal with it as

part of the normal release process

it gets picked up in two weeks or a

month

whenever the next release cycle is going

to be

right that's the easy one

um right this could be

feature slash thanks bud

and that's totally fine

the fun one is

when it's someone emails us about a bug

and no this really does need to get

fixed

today so what you do then

is you make

a branch off of maine it's one of the

very few times that you make a branch

off of maine

let's make this one orange

and you

basically you

don't worry about develop at all

and you're just saying i am only

worrying about

fixing things today

and so you've made your your fixes

whatever

whatever right this thing

is gonna be orange sorry heads up that

is

about time to join okay i'll just finish

this thought

this is like your emergency bug fix

branch awesome

cool bug is fixed it's back into

production production works

and then at that point

you can merge this thing

back into develop and do

deal with the consequences of whatever

it is you had to do in order to make

that work

cool that makes sense

so yes there there is a plan to deal

with that

i was um that that is hopefully an

uncommon

situation hopefully most of the bugs can

just get resolved

through normal release process

and also when you have this you can

start to have

a normal release process where you can

tell people

oh yeah we're gonna pick up these things

you know it'll get picked up in the

next release that's happening at the

beginning of july

or something like that so

yeah so much more that was great i'm

super excited about

seeing this implemented of course i'm

someone who has learned to teach the git

tool i would be very happy to be

supporting the implementation of this

with questions about okay how do i

actually do it you know i got stuck with

this

merge conflict or whatever um so yeah

that's that's what i have to say i'll

leave it to you alex to finish the

meetup because it's about time

yep uh that's pretty much all i had to

say

um i'm sure that this will have more

discussions especially as

people start to watch the recordings so

um

i will talk to you all later have a nice

day everyone

thank you
