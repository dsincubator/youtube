---
type: Video Transcript
title: "The flow of data and Get data directly form the database"
description: "A data science workflow yes pretty cool so this image is kind of borrowed from the book our for data science and explains how a data scientist goes..."
resource: "https://www.youtube.com/watch?v=DfVoYtCQlfU"
tags: ["ds-incubator", "databases", "dropbox", "r-packages", "pins"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=DfVoYtCQlfU"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2020-04-28T00:00:00Z"
    usage_count: 24
usage_window: { from: "2020-04-28T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

we are recording now and this is a data

science encoder again on data and the

first part is aimed to give an overview

of what's the big picture and how to

think about the way data flows in our

work and the second part is going to be

specifically about one section of that

workflow involving data so the second

section is gonna be CJ that's gonna take

up most of the meeting today and the

introduction should take about five

minutes so the this image so to confirm

you see here something that on the top

side is a data science workflow yes

pretty cool so this image is kind of

borrowed from the book our for data

science and explains how a data

scientist goes about doing the work it

usually involves you know importing data

from somewhere then doing some kind of

tiny stuff to take you to the shape that

you need and then you entered out this

loop where you usually transform your

data to for example adapt better to a

particular model that you want to run

maybe or maybe you don't but maybe maybe

not you do some visualization and maybe

you need to kind of enter this loop

again until you're ready to communicate

your results so in this workflow data is

implicit so at each step connecting this

multiple boxes there is data flowing

from one activity to the other so I

always stands for input and output so

even if you are not saving data anywhere

in your computer you're still doing

inputs and outputs because for example

you may be reading data that's an input

and then you know that data will be

stored at least temporarily in your

global environment for example so that

is one operation where data is stored in

memory and then you know you continue

working say you know you title your data

and then you save you assign the output

to a new object and that again

kind of written in the in the global

environment and in any case what I want

to convey now is that data is a central

part of our work and this figure here is

my attempt to to put data at the core of

what we do and a way to express more

succinctly what the previous field was

trying to convey at each step you may be

modifying the input data and producing

some kind of new output and where you

store that depends on how complex is

your work sometimes

again you're worried just you know cash

down in your memory in your art session

and it's gonna be gone when you're

assigned obsession and sometimes you

require to save save expensive

computations in your memory in your

computer or in a remote computer so this

data be here in the center it tries to

represent that you know you could be

inputted from anywhere even the original

source but then also you could be kind

of writing data again and to your

computer or to eat hub or whatever so

that is certainly not the core of what

we do the best systems to manage data

and you know managing data has been the

topic for the past two three

data science inquiry meetups and will

continue to be for at least two more and

so to manage data well there are

different systems and the best of those

will allow you to create like a local

copy of that data and also a remote copy

so that data could be accessed from

remote computers from continuous

integration services and so on and so

forth so this is a general level and we

are here not mentioning any tool in

particular which those have we will you

see well for example we have been using

Dropbox as one of the tools that we use

to store data locally the Dropbox

already has a predefined location to

store itself kind of under usually under

the home directory and has a name like

Dropbox and then parentheses and you of

course it also provides this remote copy

so as you put stuff in your local folder

then

cause I blows it so it seems from that

perspective it is a relatively good

system and but one problem that we have

had is not in Dropbox itself from

podcast you know great uses it is mostly

in how we have been using it because a

lot of our code is you know region so

that it you know it calls it reads data

directly from our computers as opposed

to using for example ap is that query

the data from you know the online

Dropbox version right so here at the

bottom I have a link to the package I'll

drop our drop to lock to drop our to

drop package which is a programmatic

interface to the robot API and primarily

has used this before and he presented

this package to me and I he knows a lot

so you may you know it book him in

helpdesk to learn how to use this API as

a way to modify your existing code and

make it you know pretty way a bit more

portal because throat box reading from

your local computer what it does is

times all your work flow to your local

computer

the color blue here is represented that

anything around a drop box is tied

together and cannot be ported to for

example a continuous integration service

or whatever else because it depends on

those paths but if you just change that

path and if you're calling a local file

you're calling a remote file you should

be good to go another activity that is

actually better suited is pins and I

presented this package last time again

serve the same purpose you know you can

declare with pins where that cash is

gonna be stored you know with Dropbox it

comes now by default to their home

Dropbox or whatever else with pins there

is also a cache there is also a default

also on the home but you can change it

for example to make it with to make the

cash in your project itself

so that you can port your project along

with the data that the project depends

on so you could use for example here

here to create a local cache in the

project and finally it also

this remote option where you can set up

a board for example he kept board which

is just not an organization and owner

and repo and penis will do that for you

I mean they were at the bottle again I

released the links link to pins package

so again distilling what we were

discussing and the essence of what we do

is described by this figure at the core

we have data and do Daisy J is going to

be talking about the very first stage of

getting data from its first source which

is the database so please see Jake go

ahead I'm gonna stop sharing my screen

unmute okay and thanks Maura for that

intro and yeah just to reiterate we've

been talking a lot about traffics and

what how we can move away from it or

move to a better alternative and i think

what's been come clear at least to me

recently is that we need to look at this

specific use cases and not like the full

package all at once so what I'm

presenting today is specifically geared

towards if you want to get data out of

data store how can you do that and I'm

going to present an alternative way of

rather than relying on these local paths

to your Dropbox copy so let me share my

screen okay and you can see my arms to

you all right good so I know some of you

have probably used this before but I

have a suspicion that some of you have

never used this before but what I'm

going to show you is how to connect

directly to the database to get data out

of the data store and this is using

primarily the package DBI

and so I brought an example script here

to run through some examples just gonna

load some libraries that I need later

and these are some functions that I

wrote to manage the connection to the

database and I'll come back to these

later but I'm not going to go over them

right

I want to just show kind of the usage of

it first so what we normally do or what

we're often doing when we want to get

this data from data store is we are

reading an RDS file or a CSV file and in

order to do that first of all we need to

determine what the path to our Dropbox

is our local folder then we need to

figure out this full subdirectory path

to to the file that we want and then we

need to read it and then of course it

requires that this Dropbox this 2di

Dropbox folder is on our local Drive so

this is what we would normally do set

the Dropbox path in the project path and

then we would read in the file and it

takes a little bit I'm using as an

example of this security financial data

specifically because it's one of the

larger files that we use it's about 200

megabytes and then we have our data and

then we would move on with our analysis

or code whatever we're doing like why

sometimes we're using CSV it's a very

similar story we need to determine this

Dropbox path is there determine the the

sub path to the file and then use read

CSV to read it in takes a little bit of

time get a bunch of warnings because I

didn't specify the type column types

which regression we saw that can be

problematic well we have our data and we

can move forward

this next few lines is how we might be

able to do this if you wanted to connect

directly to the database so first I have

this function that I created connect

data store that will connect us to the

data store and all the parameters are

built into the function that I created

so we do that we have our folk and now

it's going to ask me for a password so

that's okay

and now I use this command to access

specifically this table within datastore

and save it as an object and now I have

the data from there as well

so as far as comparing these three

possible ways of getting a data the

advantages of using you know going

straight to their database is well one

you don't have to depend on the name of

the Dropbox folder I've seen some cases

where if someone has a business account

plus a private account on their computer

then the Dropbox name might be different

or someone can actually change this to a

custom name and it might be different

you don't have to figure out this proper

file path that we were all used to

finding in Dropbox we don't have to

worry anything about cross-platform file

path formatting so in this case I use

the FS package to figure out what what

this means going to the users home

Direction directory but I had the base

functions don't do that properly across

Windows and Linux and UNIX types so I

have to do some special formatting there

and we don't have to worry about that

you don't have to be connected to your

true Dropbox at all so you don't have to

be connected to it you don't have to be

a user inside of A to D I like you could

be a separate user and and you don't

have to have Dropbox on your local

machine at all

and at least in the case of read CSV you

don't have to worry about the column

types at all because it gets this

metadata from the database and

automatically does those column types

automatically and these explicit paths

that we're so used to using this makes

it as Maura said very difficult and

packaging this code for other uses like

using it on github for continuous

integration or building it into our

packages so the one a disadvantage or a

possible dis manage to this is that it

does require you to have internet access

when you make this connection

but there's are some potential

workarounds for that by implementing

these caching systems whether it's the

pins function that Mauro talked about

are using a memorized package to cache

local copies of your data and that could

be able to work around some of the

problems you might have from not having

an internet access so because it does

use interred actually some ones some of

you might be concerned about what the

speed of this is so I did some testing

to see what this looks like

clear this so the first case I'm going

to read in the RDS file and then print

it and see how long that takes it's

about two and a half seconds I'll do

this with a CSV file more than five

seconds I'm gonna do this with my

database connection

there's 0.2 seconds but that's a little

bit of a cheat because and it brings me

to a point about what's happening here

so when you create this table when you

run this table function what it creates

is an object that's sexual like a recipe

for how to get this table it doesn't

actually get the data

so once I've made when I run this first

command no data has been downloaded yet

once I print this or I do something else

to this that requires the actual data to

be downloaded then the infrastructure

behind all of this will modify the query

that it's sending to the database to

minimize it to the absolute minimal

amount of data it needs and in this case

I printed the database but it knows that

it's only really going to show me the

first 10 lines and because of that it

only needs to know the first 10 lines it

doesn't know the rest of the data so

what happened when I printed this was it

made the query but it modified the

queries that I only asked for the first

10 lines of this and that's why it was

so fast so if I want to have a more fair

comparison this collect function this

will force this query to collect all of

the data in this database and then we'll

have a better idea of how fast that can

be so I tried this out

see it's taking a little bit longer so

that took me about six seconds now to be

fair I also have a pretty fast internet

connection at home but I think it's

pretty interesting that that time is

comparable to like for instance reading

in a CSV file that's local on my hard

drive and then where this also comes

into play or in more detail so as I said

this is just the recipe for the how to

connect to this table and if you do just

typical deep layer commands to this for

instance I'm just selecting here the

first four or five columns and then

collected you'll see we'll still get the

same speed benefit because again once

this collect happens it's actually only

going to request those columns and not

the rest of them so this should end up

being a lot faster yeah only one and a

half seconds and that's kind of similar

to what you're going to do and your

analysis we're going to read in this

data or for instance you read in the RDS

you read in all those data but then you

do some things to it you minimize it you

cut out columns you keep the things you

want you join to another table but you

rarely actually need all of the data so

in that always the case database

connection really shines because you

only ever import and request the data

that you actually need so again one of

the disadvantages of this is that it has

to download our Internet but as I've

shown and if you specify only part of

the data you need which is almost always

or it can still be pretty fast and in

some cases it's even faster than reading

the entire local file under certain

conditions so too may give a practical

example of this I took this function

from a packet analysis called get and

clean fin data and I made a new version

of it called simulate or it's called

clean fin data and it basically does all

this stuff reads in some other files

that processes through this really large

nasty deep layer chain but one critical

difference I made is rather than having

the importing of the data in

this function I've made the data a a

parameter to that function that way I

can read in RDS and then pass it to this

clean fin data function or read in from

the database or C suite and the point is

here that I want to show what would

happen if you read into the data given

one of these ways but then you did all

that processing that is very normal and

this is again this is at least based on

exactly what we are doing in the packet

analysis so I load that custom function

and this is what happened when we do

though party as well so it's reading in

that's gonna take three two to three

seconds as we seen but it's also going

to process that file so altogether that

took about seven seconds CSV I'll do the

same thing again this took about five

seconds to load the CSV file now it's

gonna process it I took a little more

than six seconds now I'm gonna do the

same thing with this database connection

and that only took four seconds so in

this case at least the using this

database connection was even faster than

using these local connections because

what was needed throughout this entire

process of cleaning of the financial

data it didn't really need all the data

so it didn't need to request all of it

well the download was actually rather

small well it was smaller than

downloading the entire file so again

this but again I've kind of cheated here

because I didn't collect so let's do

this again

we'll get a realistic view of how long

this takes

yeah 6.9 seconds so it's a little bit

slower but it's pretty much on par with

like loading in the full files from your

local file so I think that's pretty cool

demonstration there and I also have this

little section about some sort of

advanced usage of how you can use this

so say we were writing some code for our

analysis and we

made this we made our connection to

datastore and we made a connection to

this security financial data table and

say we know later on that we know that's

at some point we're gonna want to look

up the big subgroup based on Ison's and

some of the data that we have or the

company name or the company the coupon

value so what we can do is we could take

this fin data object which is the recipe

to connect to this table in the database

we could add to it a selection that says

well I'm only going to need these two

columns and we save that in two big sub

lookup or the other two and now these

things are new recipes the recipe now

includes not only how to connect to the

database and which table in the database

to connect to but it also contains this

selection as part of its recipe so if I

look at this now it just gives me those

two columns or company name or coupon

value again I can collect them to kind

of see how long it takes to actually

load these and it's pretty fast because

it's only those two columns that we're

getting at a time so now imagine we had

like a data frame I had a bunch of

Ison's and I'm just gonna create a bond

with some random I since pulled out of

the defend Attah so now I have this

table that has some Ison's if I wanted

to join the big subgroup for these

icings I could do this Ison's left join

this big sucker this copy true is

necessary which I can explain because it

would take too long but and then I'm

gonna ship it all 20 lines so we can do

this and it's pretty fast you can load

in the acceptor or if we wanted company

name or if we wanted to look up the

coupon value it's pretty fast and of

course you could also do this directly

from the fin data DB object that I made

by just adding in a select directly to

that and it basically would achieve the

same thing

and then just one point that I should

make clear once you when you do connect

to these database you should always

disconnect from it my assumption is that

the server eventually would drop your

connection but I don't know what the

timeout is on that so if we had a lot of

people doing this all the time it's

probably ideal that you disconnect from

it when you're using it so that's the

disconnect and now I want to come back

I'm here to briefly explain what's going

on with this connection so the primary

thing that's going on is this DB ID V

connect function and you have to specify

a driver in this case the server that we

use is in our Postgres server so we use

this package and functions to set the

driver you need a database name to dii

the host which is its URL the username

and a password this password we don't

want to leave this in code so what I did

here was I'm storing the password and

environment a very variable that is it

it's maintained throughout a session but

if it's not there I put this part in a

beginning so that if it doesn't find

that in your environment burials then it

runs this function which will ask you

for and that's what you saw in the

beginning this function asked me for the

password then set that as environment

variable then it came back here and ran

this with the password input and you

will also need this options well

technically you don't necessarily need

this options but because the way we're

set up the data is separated into these

Quarterly's schemas and this option

setting will add that add a specific

data corner to your search path and that

enables you to access them much easier

so when you do this command here rather

than having to specify this schema I can

just put in security financial data and

it's going to automatically take it from

the specified data corner that I put it

in that search path so that's it

we have about a few minutes to talk

about this so I want to leave some time

for that so I guess I'll leave my screen

up but we can go ahead and

ask any questions if you want to cool

thanks TJ that was really yeah that was

a nice summary of the things the one

thing to note of course is however that

a lot of our data doesn't come so the

other disadvantages a lot of our data

doesn't necessarily come directly from

data store so while it might originally

there is then a sort of fairly computing

intensive processing stage that happens

before we've got the data ready for

running through the portfolio analysis

which means that whatever we do will we

will still need a local data storage

location unless we shift this job to

Taylor which isn't really ideal for

anyone yet can we just host those those

handful of data sets the nightmare

scenario stuff on github or also on in a

a like Ezzor type platform if you want

to set it up but I can't do that yeah I

clarified in beginning like you know

this was not resolving all problems

everything related to Dropbox certainly

there's going to be other use cases

where Dropbox is necessary but this is

one case specifically getting this data

from the database that data stores based

on is this is one possibility and then

you know as Jackson said it could be

possible if this was something that we

wanted to use and it was useful and we

thought it was like better or I had a

patent issues that wanted to take

advantage of then possibly some of those

things that are that are not currently

in the database but are in the Dropbox

maybe they could be added to the

existing database or maybe you know

especially with this potential

divergence with a massive resolution

maybe 2d I would have its own

similar database I would contain all the

files that we need so those are

possibilities yeah it's true this

doesn't solve every problem before and

the other challenge is potentially when

you when you're rerunning at projects

from a later time stamp and you need to

refer to the data store from a specific

moment in time you know even if it's

2019 quarter for data if you need to go

back and refer to the data you know that

didn't have that that set of ten

companies or whatever it was in it then

that's also another challenge but so

that's a good point but I have a really

easy solution to that so for instance if

we wanted a connection to one of the

previous versions then at least the way

the database is set up we could do this

can you you can still see my good so

yeah that's why I put in this data

quarter thing because you can specify

which email you're under and the way

it's set up or that and maybe Taylor can

speak more to this if he wants to the

data from this 2019 q4 is in a specific

schema labeled that and yeah however

however we get these data for 2019

quarter four I mean I think we've had

sort of you know four or five drops of

this in the past month of which I've

been working off that specific you know

truth for one project you know even if

there is a later set of data referring

to the exact same time period I've been

made to the data that's in the database

that's a question means yeah basically

there'll be an update to like the

emissions model or something that

affects all quarters or potentially just

one quarter if they're the QA issue for

one and so that the update will just be

added to the database which then of

course means that if you had that older

data set you lose access to it I I see a

solution there being essentially good

about saving our project files or

something of that something in that

direction but I don't know enough about

the workflow

jumping to say that it's time to end but

I think that at least we are gonna be

exposing some of the perceptions

everyone has about how to go about so on

this program I posted the link to the

issue and I'm you know it would be great

if we can you know look your ideas in

that issue as comments and then you know

we could kind of follow up on them maybe

organized like a hackathon thing to just

work it out for one day or two days

precisely on say hey I would solve the

problem this way let's try to get you

know together but that's a conversation

to kind of follow up on sorry sorry for

that I'm thinking for from and also just

I will pass this on both of these are

files over to morrow and you can add it

to the yeah the repo and if any of you

wanted to try this try this at home

feel free I'd actually be interested to

see if anyone had any problems with it

or successes with it so yeah test it out

if you're interested conversation at

least for one more meetup that maybe we

will have the privilege of having the

checks on presenting an entire cycle

thank you thank you
