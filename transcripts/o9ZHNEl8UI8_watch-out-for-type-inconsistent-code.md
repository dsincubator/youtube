---
type: Video Transcript
title: "Watch out for type inconsistent code"
description: "Very typical how they has already done the same exact idea that I had and much better than I would have done so probably just watch the video..."
resource: "https://www.youtube.com/watch?v=o9ZHNEl8UI8"
tags: ["ds-incubator", "r-packages"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=o9ZHNEl8UI8"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2020-03-03T00:00:00Z"
    usage_count: 17
usage_window: { from: "2020-03-03T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

here you go your we are recording

alright so hello everyone I had

suggested tomorrow that we do a

discussion about or I would do a

discussion about coercion in our and he

pointed out to me this video that how

they created is very typical how they

has already done the same exact idea

that I had and much better than I would

have done so probably just watch the

video that he did which really clearly

explains some of these concepts and then

we can have a bit of discussion

afterwards and maybe also try to frame

it in a little more practical sense

because I feel like the video is fairly

conceptual but yeah there's definitely a

good starting point so we'll just go

ahead and start the video

[Music]

okay

classic yeah okay I guess you have to

hit first ability which basically means

that ideally it should be easy to

predict what type of thing you will

function returns but before we get into

that I'm going to talk a little bit

about the motivation in terms of some

wax how many of you heard of way before

okay wet is like watts or WTF but even

more surprising and there's a really

great talk at this URL they kind of make

they kind of created this term we're

talking about some of the really

surprising things about Ruby in

JavaScript so I'm going to show you some

really crazy stuff you know and this is

sort of motivation so make sure you

Hoover the cards that you've got two

factors and I combined them together and

what do I get all right

you might hope that I give an A and a B

and they're right and hopefully maybe

the output would be effect they probably

did not expect to get to what happens if

I take a date and a date time and

combine them together yeah it took me a

while in kind of like figure out what

was going on here but this is the this

is a day a date when the Year 4,200,000

1097 on the 24th of January or what

happens if you do the other thing what

happens if you combine a date time with

a date that again we get the date time

that I gave it and I get this weird date

and 1969 but what happens it even in

look

at a date-time the wrong way so what

happens if you take a take time just

concatenate it with nothing and you lose

that you move the x over well what I'm

going to be combined a little literal

nothing and now this random number so

you're gonna sleep on it I seriously

hope that no one would argue that this

behavior is correct I think there's some

kind of good reasons of this and is not

not great reason for there's some

accident of history that lead us to this

place where we can get some pretty

surprising results from like pretty

unsurprising data types and a pretty

unsurprising operation but so what's

kind of wind what's even going to worse

about this it's like to show you one

function but there's a bunch of other

places we are doing this you're going to

take too big there's of different types

and combine them together and a bunch of

other places and I'm going to just pick

on my side here but tiny bits is exactly

the same problem and some functions of

combining too big this you could do

something different to other functions

which is clearly a really really badly

we could have the motivation for this

big this package was to think about like

what should we do this is clearly crazy

what currently happens like what how can

we do together what should we do and I

think we get some into that by looking

at the rules for the sieve Academy for

it I'm gonna make this because the rules

here are like pretty simple and pretty

reasonable here I'm gonna display them

in like in painful detail and even

logical logical you get logical it's

even much fun then you get into the gym

and if you just list them all out like

this it seems pretty complicated but you

can kind of display this in a table form

too so if you've no logical and logical

you can logically you're gonna double on

a character you get a character and if

you if you stare at this table a little

bit you'll notice this is actually

submit

and that's a really nice principle right

because it means the misdeeds of means

it doesn't matter which order the

arguments are you get the same type of

alcohol in the means you've got my going

a lot mister you've got miss them half

of the table don't need from that that

also means we can actually express it

even more simply we can express it as a

well this is technically an extreme this

this is a very simple tree it's a tree

with no branches I'll show you a tree

with some branches a little bit later

but you can kind of do you can sort of

work this tree by if you've got like a

logical and a double say you can have

followed in arrows until they meet up at

a common place which in this case is it

done right so you can just put your

finger on the two types and then follow

the arrow for monthly other to know

which time you're right so now this is a

pretty simple summary of the rules that

they are pretty consistently applies to

atomic victims and I think even if

you've never being explicitly topless

you've probably like kind of picked it

up implicitly because this rule is

consistently applied the problem with

see however arises that when we start to

get to these more complicated it's three

makers we could build on top of these

atomic vectors that there aren't any

kind of simple rules anymore so when we

get the factors of dates of date times

in data frames things to add to get more

complicated and it has exceedingly

different than the gold elucidate that

please sort of promise so figuring out

what the rules should be at least in my

opinion is the gospel of this victors

package and I kind of fun though the

thing I like most about this packages

it's very strong inspire so the golden

think this is going to figure out these

principles have like once and for all to

apply them everywhere and the goal of

some seeds of because a little a little

bit weird because I think that make this

a successful and it becomes this

consistency of rules packages South

become invisible

so my

goal is that you should never ever have

to know that this package exists but I

want to talk but unless you're a package

developer I wish you started dying for

the details where you can start to

download this and the basic idea of Nick

does is decay ticket very simple tree we

had before that deadline it basically

kind of turn it into a forest so gain

the same principles apply if you want to

combine two types of Dig Dug

you put your finger on each one and then

you follow the arrows the rule notice

however that this is not like a tree

this is a forest some of the things are

not connected you cannot put your finger

on facta and double and find any way to

go to screen and I think this is really

really important there are some coercion

that simply do not exist it does not

there's no way it makes sense to combine

a bad day and a date-time together

instead of like trying to do something

trying against and what you mean it's

much they became error it forces you to

confront the fact that you've got to mix

a weird data Frank weird data types you

have to do so I'm going to do a little

demo of this real life dear ones are

always risky but this should be fairly

safe so the victors package loads and

basically I'm going to show you this

function convict underscore C which is

basically the same there's a C function

you're familiar with from base ah but

amazes consistency across so may get a

logical integer together or logical and

double to get back in time if I take a

double and an integer I get done right

these are the kind of the rules that

you're already familiar with you don't

even have to break it up there's a

little bit strengthe about poisoning the

character Victor's so if you've tried to

combine double and a character here you

go to arrow this is unlike base alright

where you can just combine these things

that are a little bit different together

and I will just kind of do it for you so

so make this is a little bit more strict

than getting

because it has this kind of escape edge

all of these makers functions allow you

to clear the desired prototype of the

output so here I can say actually I want

the output to be a prototype this

character type but I call this kind of a

prototype you don't give it a name of a

type you give it like an example of a

time so here I'm saying I would make

sure the output looks like a empty

character so I can do that and now

instead of implicitly coercing it goes

to a common type here we're going to

explicitly cast to the type that we have

provided so now we have this consistent

way then you can say I want to make sure

the output is a character Victor and it

will either be a character Victor or you

will get an error you will never get any

other title output when you call the

function so again we get the same kind

of similar property with vectors we can

combine them together we always get

effective now note the order in which we

combine the factor is important because

the levels are different right so if I

combine adding the first the liberals

are a and then B if I combine be denied

so it turns out I'm not hostile want to

be like completely symmetric because the

only option if I want to be completely

symmetric is I think so the thinking

behind big dude is kind of a combination

of life philosophy and magnetics there

are some things that we just be like

maybe kind of philosophic a more

beautiful or more pure pragmatically we

just cause you a functional pain trying

to uses your code into a gate those

tries to kind of balance those things

trying to steer you in the direction of

greater safety of greater strictness of

this idea of tech stability which we'll

come back to shortly in a way from just

always work in doing whatever so the

same thing with water favours you try

and combine a factor an important factor

you get an error I

factors eight characters or again your

boys got this escape edge we say if it

isn't an automatic coercion that exists

I can always say I want the output to be

off this time so again big this is going

to be more likely to give you errors

than base are is because it gives you

the standard way after solving those

areas I explicitly be clearing the title

doctor didn't want we be able day-to-day

times this is like basically the

exploring you might have it because it

just does what you what I think any

reasonable person would expect them to

do but the combined day-to-day times to

give you any crazy dates behind the

future from the past and if you just

became a single make themself the times

I've done changed and then we need try

and combine different things in base I

can show you a few of these before

but if you combine a big effect on a

daytime you can into judge by date time

the factor you get a date tying a date

with a weird date I mean because just

always gets you beginning this is always

as other kind of one last escape edge

like what happened if you really do want

to combine a date time and affect them

into a single picked up well you can

always fall back to a list because a

list of not they anything else so we can

always say make sure the output is a

list and we're just

so the kind of underlying idea behind

bigness is this idea of type stability

which I'm still trying to figure out how

to express tickling is possible but I

think this is this principle the way I

said think about it it's like we when

you're reading a card

what you are actually doing is running

that code in your turtle meat and

obviously your internal needle model

allows much much simpler than the real

thing

but I think in your internal mental

model of ah one thing that's very useful

two things accomplished type of each

variable and I noticed that when I read

all the peoples code I'm reviewing for

at least for example if I made the card

and look at a mirror a ball and I have

no idea what type of variable it is I

don't know but the list to a character

or data frame that color just feels very

dangerous to me like you not accurately

predict books research so the first

principle of flexibility is that the

output type should only depend on the

types of eating it's a one kind of

violation of this and besar is the

if-else function so here I've got three

calls to if-else the first argument is

always logical the second argument is

always integer character Viktor and

depending on the value of the logical

make would bake down the output if the

illogical victor could be a double baker

could be a cavity and I think this is an

undesirable property because when you

read code that involves it else it makes

it hard to know what type of output

tonight again I don't want to say like

the tiny this is perfect spot for

clipping deep line if-else actually is

equally annoying but the opposite

direction it's like two straight which

forces you if you want to insert a

missing value to know about all these

different types of missing values that

you should be posting in front the

second principle is that if you just

combining a bunch of vectors or your

argument has dot dot dot and your

function is dominant we all are the

inputs she's not

so I kind of show you an example of this

or were you lots of examples of this

let's see but ideally the order in which

you supply arguments to see should not

affect the output this is the idea that

gave us a symmetry in the table this

makes predicting me output much much

much simpler vision is just a much

smaller set of rules that you need to

remember and again the kind of the goal

here is not the usually of ethics listen

we memorize the rules but hopefully by

having the small set of like reasonable

and consistent rules you would just come

to learn them at the time and we use

predict when you like yes you're naive

yes without what a functional turn

should just be more accurate and so the

final principle is almost so obvious

that you shouldn't have to recognize you

can ever say and there's ideally this

should be one set of rules that is

applied so again just to illustrate this

if you can catenate to that goes

together you get integer victor but if

you put those factors together unless

and then you 'unless them you will get a

factor so the fact that we have these

inconsistencies just makes it hard to

build up an accurate medical model and

it gets and I think this sort of boat

was like first order of it that we knew

like look at some card you're like I

don't know what the spirit in but you

also get the signature okay that's even

worse that over time to pick this like

learned helplessness you're like I have

no idea I'd be good so many times before

but no idea what's in return then

there's not even either try Ignis

which i think is even more now bigness

does a bunch of other things we do want

to talk about briefly

max really really really wants to give

me the gun I talk too long we're gonna

get him to go

okay so can everyone hear me quiet down

so yeah that was happy to take on

vectors but largely driven by this

concept of coercion that I want to talk

about I think in his talk he what's

driving the vectors package of some of

these like maybe not quite edge cases or

particular cases of concatenation by

coercion with dates and factors those

were the the primary things that seemed

to try to him to make this package but I

also my interest in it was kind of about

this initial graph that he made that he

said a symmetric and very easy I learned

but I think that's something that you do

kind of learn implicitly but you don't

necessarily think about very consciously

very often and I think there's some

interesting maybe features of that in

the way that are does do some chords and

automatically in a lot of cases but then

also some potential gotchas and that's

even in the original part of it that how

they seem to be pretty comfortable with

I think there's also some interesting

things and that so I thought we would

just have a discussion and yeah ask a

question if anyone has any examples of

things that they run into using around

this kind of topic coercing data types

or does anyone have anything interesting

we just kind of ran into it with you the

logical mapping in that tree the output

it was ever putting na is would be a

type of DNA wasn't matching the type of

the rest yeah and pretty annoying for

you and

and he briefly mentioned this deep large

if-else function is very strict about

the datatype so you have to even if you

want to insert an na most are users just

used to typing capital A and capital A

and they expect it everywhere but there

are actually these internal and any

logical and a integer and a real etc

that yeah and I learned that day that

there is no na logical which I just

assumed there was but there's not so

yeah it's some the types is kind of

interesting in a lot of languages you

have to be very specific about what a

variable is when you when you create it

and you can't a lot of them you can't

even change it whereas our you can

create a factor variable and name it X

and then you can put in integer into it

or put a character into it and just

overwrite itself and becomes another

data type you can throw it into a an

expression like you can add it to a to a

number a character to a number and it it

usually doesn't error it just does

something which it can be really

surprising there a lot of cases it can

be kind of nice because in some cases it

means you don't like you don't get an

error and everything doesn't stop but

it's also dangerous because sometimes

that's something that you do want to

error because clearly you weren't trying

to add those things but yeah so I think

it's pretty interesting topic I just

today I was working on this because we

have these fixed codes which are all

numbers but technically at least from my

perspective conceptually they're not

numbers they are numbers but they're not

and numbers can be characters as well

they are part of the character encoding

so you can usually you know he's in his

talk here he seems to think that's very

wrong to coerce a number into a

character like that should only be some

very explicit case but that's exactly

what I was doing today because I was

reading in numbers I'm like you know

about numbers they should be characters

that's conceptually they're not really

numbers so I ain't come are so many

characters yeah so is anyone

a lot it's like but usually it's because

I'm missing some element and so it's a

good example is like with fun data some

files they don't have any XML I mean

they don't have any nice in there and so

for a while because I tried it first

inserting in na and then of course it

gives me though oh we have character and

logical T's work and then and then there

was also something that so I had some

ideas that things that are very similar

to this concept of automatic coercion

that are does and hadley I stopped him

there but he does like make mention of

this with the recycling of vectors so

you know that if you add a vector that's

you have a vector of integers that one

is three elements long and one is two

elements long if you add them together

you'll get a three element back there

and the two element vector will be

repeated until it's enough to fill up

the vector so this is another really

it's a really weird one and this is

another thing that's where it's super

useful in a lot of cases it's super

convenient because sometimes you really

that's really what you want to do like

if you want to add add one to every odd

number and two to every even number you

can very easily do that in R so there

are some useful cases but it's also

again what you see it can be super

dangerous because something that's

totally not what you're expecting what

really happened is there's some error

somewhere else but it's running through

you know how can this possibly work if

it's wrong so no I was another thing

that's similar to like ours form of

automatic coercion that you know oh

we've been upgraded does anyone have a

comment or no I just had like a very

interesting case where I pulled good

columns of my data frame and they were

all clearly names

they converted them into integers so I

into an arrow because yeah I was

expecting its characters but I'm not

sure like how can use this package now

to make sure would I if I do the pull

function would I know like how do I make

sure that how do I apply this package

basic to make sure it's characters or so

the motivation for showing this video

was not to specifically encourage anyone

to use this package per se my impression

is that this package is targeted at

package developers that want to have

like really robust management of their

vectors within their package and not

something that like an end user would

necessarily be using and probably not

something that an analyst would be using

it in their own code unless they also

just really wanted to be sure about

their what's happening with our vectors

but I don't know if it's really

necessary so I I generally I mean I I

think the topic is interesting his

motivation for making his package was

more while off while I wanted to

explanation of that if I wanted to share

this video as far as like implementing

ideas in a practical sense

I'm not saying specifically to use this

package but also to keep in mind use

these ideas about what happens when you

combine different data types and if

you're not using this package you can

just for instance if you use pool and

then you have a vector that comes out of

it you can add a steps where you could

coerce it to the thing that you you know

it should be just as a caution step yeah

I mean that's what I've been busy

calling as character

beginning now no I mean the topic is

super interesting and it's like I mean

it happened to me in the past five days

probably like twenty times that there

was some weird thing happening in terms

of what type of format it used like or

is using yeah and I think at least in my

experience

usually happens when you combine some

things and these automatic coercion

rules are occurring when you don't

necessarily realize they're happening

and that's when it really can catch you

so yeah my I mean my best advice in that

case is just to be really once you do

your entire chain of actions that you're

doing to get where you want and the last

thing is you make sure you course it's

your the thing that you actually expect

it to be and that's maybe the best way

to do them you know prevent this from

happening but it could it could also be

an indication that somewhere along the

line you're combining things that maybe

you need to think about make sure it's

what you actually really want

um yeah Marlon a couple of minutes away

from from the half past so thank you

very much for exposing these products

and at least you know by being aware of

it I guess that people will be more

careful sometimes you know we blame

ourselves on what I'm doing wrong but

actually our itself has a lot of things

that can't bite you

so I'll leave you these two minutes to

wrap up okay so yeah that's it for me as

far as the the tag I don't think this is

necessarily an absolute must-have but

it's an interesting topic yeah something

that probably all of you are going to

deal with now and then but you know it's

not a super I don't think this is a

must-have and with that I guess I'm done

so thanks tomorrow for recording and

we'll see you next week thank you thanks

very much
