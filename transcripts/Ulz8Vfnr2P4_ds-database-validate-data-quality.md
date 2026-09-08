---
type: Video Transcript
title: "ds.database: Validate data quality"
description: "To the DS incubator we are on the series about relational data and last week miria asked a couple of questions about how to validate data and that..."
resource: "https://www.youtube.com/watch?v=Ulz8Vfnr2P4"
tags: ["ds-incubator", "r-packages", "workflow", "pipelines", "databases"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=Ulz8Vfnr2P4"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2022-09-20T00:00:00Z"
    usage_count: 107
usage_window: { from: "2022-09-20T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

to the DS incubator we are on the series

about relational data and last week

miria asked a couple of questions about

how to validate data and that was super

inspiring for me I spent some time

reading about the point blank package

because I think that for

at least for the workflows that are more

analyst oriented they are the the point

black blank package is kind of the right

the right tool you know for that job and

also today we have Faria who

um we you know Euro used this package

right

awesome so I remember a mention of this

a long time ago and since then by her

and since then I've been kind of

thinking about this package so I spent a

little bit of time really or quite a bit

of time reading the documentation which

is very extensive which is great because

um you know whenever you need to do

something there is gonna be a good piece

of documentation there but on the other

hand it's quite challenging to digest so

hopefully this Meetup will be

um a way to digest the things that at

least I believe are the main features

that add some value to at least might

work hopefully your work too and I'm

also going to comment like points where

I prefer maybe other tools so this image

here shows an overview of the of the

workflow that you can use with a point

blank package that I believe is the most

useful of all it involves this function

called create agent which is an object

special object that stores information

about what you want to validate on a

data set so that agent takes a data set

as an input and then here in the middle

you can see a bunch of like little

things that little validation functions

that you can apply to your data and the

Asian is going to be recording them and

doing nothing until you interrogate that

agent and you know only then the

computations start and and you will get

as an output a report that will tell you

if the things that you were expecting

about the data are you know met or not

right so that's the main workflow that I

believe is the most useful there is

other workflows that I'm gonna mention

then them later

uh so how that kind of translates to

code so that image was very useful to me

to gain a like a very high level

understanding of what um that workflow

is and can do but here is a little piece

of code very small and so the first

because we're going to be using the

appointment package of course we need to

attach it so we do library Point Blank

and here I'm going to be using also the

TiVo package to create some toy data

sets and these data I've been using them

in the last couple of meetups so there's

nothing special about them it's just a

demonstration with a very small example

so this data set has two tables one that

stores information about companies these

companies have an ID which is unique in

that table and some information about

them for example with company number one

with ID number one is called Alpha and

it sells solar panels and windmills and

so if you if you try to find the same

company in the second data set the

second other side is called categories

here in company ID number one you can

see that it belongs to the sector energy

and it makes sense because it sells

solar panels and windmills so that

that's the the structure of the data set

two tables two companies in the first

one three companies in the second one in

the categories and and that is a problem

now a problem that we're gonna be using

some of these validation functions today

to

um to kind of understand

um so let's get to uh the validation how

can we write some code that helps us to

validate that those tables and then

create a report that is very easy to

read I'm very easy to share also with

stakeholders and and that's what I think

is the most important value of the point

blank package that is not useful only

for someone like me who is you know

developing code but it's also useful for

other stakeholders analysts or

um you know managers that need to

understand the data at a higher level

and they are not so interested in

actually the code they're more

interesting reports that I can produce

with the code so here's how it works you

may remember just from the image above

let's scroll down maybe again so there

is like three main steps right like the

creating that agent then applying any

number of validation functions that you

want to apply to that data and then

integrating that agent so that you get

some kind of intelligent and information

about it so those three steps are now

represented in with this white space

separating these three code blocks so

the first one is what you use to create

an agent so just in this case I'm taking

that that's the category so I'm going to

be working with it and then I create the

agent by calling the function create

agent and here I'm doing something that

is beyond the default I'm already doing

a little bit of a tweak I'm using this

function action levels which allow you

to create a report that gives you a

warning or or something more severe than

a warning when

um as it you know a certain number of

conditions are not met so if um if you

know you create if you have you know

multiple rows each row is a test for a

specific condition that you want to

validate and you can say how many um you

know what's your threshold where you

know after which you want to get a

warning or you want to to get like a

more severe and stop message it when

some of those validation functions are

not met

so first first block you create agent

second block you start building your

validation pipeline right and here you

can use as many validation functions as

you want as you want and there is a ton

there are basically three types here I'm

using two types so one type is Those Who

start with

um call underscore Val so basically you

value you you are looking for something

about the values of specific columns so

such you have an argument called columns

which is the argument that takes the

name of the column in your data set in

this case for example company's ID on

which you want to apply that validation

this first one is fairly simple so we

are validating that the values of the

column

companies IDs is are not no right so

that's a very common validation that you

could do for example in your primary key

of a data set and this is the case

the second function that I'm using here

is is a function that actually motivated

the whole Meetup

when I I showed last time how to work

with the DM package with the data model

package and miria was asking okay how

can you check for example if a table in

the data model and has values only

within a specific set of of values okay

so the point blank package has a

specific function for that these called

valves in set so it verifies that the

values of the column in this case

companies ID and is included in a

limited subset of values and here I used

some code instead of hard coding the

values what I did is I wanted to check

if the values of the ID column in the

data set categories

are

included in the set of values that is

included in the um in the unique values

of the other table so that is a check

that you usually do on secondary keys on

foreign keys in databases as that you

know all the values of a foreign key

exist in the primary key that is the

parent of that foreign table so that is

you know what this call is doing here

and then this other type this this one

checks for the type in this case I'm

checking that the column companies ID is

of type numeric for example and this

third one

um this sorry this fourth one is

checking that the rows uh in all the

columns of the categories table

um are all distinct right so what you do

here totally depends on what you want to

validate this is you know just a few but

it's a very long um at least of a

function that you could use and that is

that is a very important value that this

package provides to give you a very easy

way to check quite complicated

conditions that would take quite a bit

more code if you want to to do that kind

of by hand

so we have an agent we now have a plan

and now we pass that plan to the

function interrogate and the output of

that is this interactive point-blank

validation table that shows you can see

here in the steps that we chose in this

case I used four steps each of the

functions that I use are are here the

columns that are being verified are are

there as well some values whenever

that's relevant like in this case for

example I want to check

um you know if the if the values of the

company ID were within one and two and

so on and so forth so here we have a

report that tells us

um how many of those validation tests

were

um you know we performed and how many

passed and how many failed

so here for example we have a failure uh

the in the common fail we see zero zero

zero except for here so this is the only

one that failed and we get an indication

of that also by the little color here on

the warning and that comes from my

having written these action levels uh

call here so I said that if there is one

failure then give me a warning and and

that is the warning right there with

that little dot

um then there was no like ever like not

no stop and that's why the column for

stop s is is not kind of filled with red

and then the n stands for notify which

is even softer type of message and and I

have not included it and then finally we

have a way to get a subset of the table

that for example in this case it it is

the subset of data that does not meet

this condition number two you can also

see that the one one that got the

warning is highlighting yellow and here

on the on the far left so it's a very

easy table to digest even for someone

who does not write code so if I want to

share this with my manager or with

analysts in my team and they may not

need to know what code I use to create

this but it's very easy to understand

and this this CSV allows you to you know

this CSV button allows you to click

there and automatically get to download

the CSV file that contains only the rows

that did not meet condition number two

which allows me to then inspect that

specifically to try understand what's

the root of of the problem

so at nice I believe the most important

part of the package and also the most

important part of this Meetup therefore

but there is more so just to give you an

idea of what else you can do and so the

word for that we cover here is the first

one here to the top left the data

quality workflow where you take it data

set also an agent you create agent

remember we call the function create

agent and then we we output a report but

then there is also another workflow that

is identical except for you're not using

the the agent and you are not using also

the function interrogate all that you do

is you pass the data directly through

your validation functions that acts in

that way as a filter so if any condition

is not met then the pipeline will

basically stop and the value of that is

that if if your data is meeting all the

conditions then the output of that is

the exact same data that you inputted

but now validated so is a great way for

someone like me who is writing um

production level tools to verify that

all the requirements that I have for

that data set are met and if they are

met then I I have a data at the end of

that pipeline that I can use and if the

if any of the requirements is not met

then I do not have data what I have is

instead a bunch of errors and warnings

that I need to then understand deeper

and fix right so that's workflow number

two and then the other two workflows for

the package are considered secondary

workflows are you know basically each

each function that I show you with which

you can validate something has two more

castings one that allows you to create

conditional code one that returns true

or false based on that condition as

opposed to

um to returning messages or errors you

just get it through all the false and

then another cut scene that is suitable

to put inside a unit tests when you're

building packages

so those two are kind of nice to have

but uh but you know honestly I would

maybe just use the lower level tools

that come from more dedicated packages

like you know test that directly or or

just write money that code so let me

show you what that looks like but you

you're opinion made it fair you may use

these functions and and surely in some

cases and they may be very useful so

here what I'm doing

is you know the functions that I used

before to validate the data I'm wrapping

them in in a function called validate

categories and that is for for

convenience in this sorry for if I don't

know for convenience in this demo but

also to kind of inspire you to collect

those validation functions in in a in a

function itself that wraps them so you

can reuse them very easily once you

understand what conditions must be met

and then instead of having the details

of what those conditions are you just

have a name like validate categories

that nicely hides all the implementation

details of that validation so now your

main workflow the data quality workflow

will become something like this you just

take the categories data set you create

the agent then you call your validate

categories whatever that is that you

decided with your team that you know has

to be validated and then you just call

interrogate the output should be very

similar it should be the same except

that in in that function I did something

a little different I think for right so

here in the integrate agent I'm not

passing the action levels and I'm not

setting any threshold for warnings or

stop messages and stuff so in that is

that the Ed first but everything else is

the same but you know now that the code

is a lot more Compact and the output is

very readable as it was before so that's

the workflow that you already know about

right but let's let's have a quick

overview of the other workflows

um that you can also do the ETL

workflows basically the the idea of

you know something that you would do

with um when you're wrangling data for

example or something that I would do

when I take a data set apply all the

validations that I want and if um if

everything is fine then I get a data set

at the end and if everything is not fine

then I get either you know a stop

um you know my brother stops somewhere

and have to fix the problem or if the

problem is not so severe I may get a

warning and then and then just know

about that so that's that's what I chose

to do here so I only got a warning and

that comes from

here so remember that I use the action

levels before inside the call to create

agent you can also use action levels

inside any of the validation functions

that that you can use and so in this

case I'm only validating only sorry only

creating an action for this one

validation function so for the other

ones I'm not so this is just like a

choice that I did for this you know

pretend that for this analysis that's

the only thing I want to get a warning

for and and therefore

um the warning

um here that you read you read here

right that one here

um again I'm reusing the validation

functions all hidden behind this this

nice name validate categories and I have

as an output you can see here the the

data set so

um given the the relatively low severity

of the problem and I decided that it

could be a warning only and that is a

good still be useful so I do get a data

set that I would you know

include in a release of package or

whatever you know that data set is going

to be used for

and then the secondary workflow so these

are the words for which I particularly

uh could use maybe some other tools for

example for unit testing

let's start with a very simple data set

here and just forget about the

categories and companies data sets that

I showed before let's now create a new

data set called Data with only one

column and that column is called X and

it has only one value of that value is

is the literal string one not the number

one

so with uh I told you that you know for

every validation function like call is

numeric you also have a cutscene that is

is a good fit for tests so you can you

can use the very common very popular

package test that

um to create tests and then

um I mean if you don't know how to

create test this might be a little maybe

confusing but you know if you aren't

familiar with tests then you will know

that inside the test at the end of each

test you have expectations so you have

to test if the expectation is made or

not so this is one expectation that is

that comes specifically from the point

blank package so as I said for every

validation function there is a cutscene

that starts with expect underscore and

it's a good fit for your tests so this

is what you would you would write and if

the test fails this is the type of

message that you you would get

which is similar to what uh you know I

showed here if I was using it in the

other workflow uh for the ATL pipeline

and that's fine except that

um you know I particularly prefer maybe

in this particular case because there's

already a very

um common and simple function called

East numeric I could do something like

this I would take the the column

directly and I would I would just call

is numeric and then I will pass that to

expect true which does not come from the

point blank package it comes from the

test that package in that sense it's

kind of lower level and you know has

less complexity before I get what I want

and and I tend to prefer that so the

message is also in my and in my opinion

is is cleaner maybe because I'm used to

working with tests that directly so I

understand the error messages or the

failures a lot easier so this is the

fail that I would get and then the

fourth type of workflow

um is that that is suitable for what

would be called conditional code or

assertions so basically

um again for every for every validation

function you have this casting in this

case that starts with test underscore

and it returns either true or false so

it's something that you could put inside

and if Plus for example if you know this

is true then do that if it's false then

do something else so the thesis could be

the use case of this function but again

uh there is in base R the function is

numeric so I would more likely use

directly is numeric and I get the same

result because it falls here

okay so that is

um the core of the workflows and I

showed my opinion about you know what

WordPress I believe are amazing what uh

workflows are really good but I could

probably do something simpler and now to

end the Meetup I wanted to mention uh

the idea of okay how do you gather

requirements when you are not the only

person that needs to decide what those

requirements are how do you communicate

with your colleagues with your managers

with your analysts if you are developing

software and the point line package

provides a really nice way to translate

that agent object that you use to create

a report

you can translate it to yaml and and

there is a function called Write

um sorry a yaml right so basically it's

the same workflow you create an agent

the only thing you need to be careful

about you need to do this tiller thing

because it's an expression it's like a

formula it's not the object itself

that's the only kind of catch otherwise

it's the same thing you create an agent

with a data set then you validate with

as many validation functions you want

and then at the end you instead of

interrogating that Asian what you do is

you do yellow right with the name of

path and that will that will write a

file and I'm going to show you what that

file looks like in our studio that is

basically captures all those steps in a

way that is is devoid of code so if you

if you want to communicate with your

managers or your analysts you may not

want to confuse them with code instead

you may want something that is more like

like text right like English for example

so this is the output that comes from

that um from that call

so we have here type agent the data set

the table is categories

um we have you know the day that's cool

so when we validated that

um and and here the steps are probably

the most important thing uh because the

functions that validate conditions are

very readable I believe they are pretty

good names I think it's also quite

understandable for people that do not

write code and if they don't then there

is also

um there is also a very good

um reference section for this package

where you know you can point them to to

it and they can learn what these

functions mean so in this case call

values are not new and for the column

company's ID in this other one called

values are in the Set uh and and here

you know the the con that you're testing

is companies ID and the set that is

allowed is number one and number two

right and so I believe that that's

pretty readable and hopefully you know

that will help you as an interface for

communication between developers and

entities or developers and managers and

so on other stakeholders to summarize

and then finally

um I think that it's also possible

something that I'm thinking about I'm I

may Implement with my team it's also

possible to use what we call a data

dictionary which is very common in

databases uh

one of this is here where it's basically

a spreadsheet right that you can share

with your team say with cool sheets for

example

where you have all the data sets in your

in your database in this case you know I

have the data sets companies and the

data set categories

and then each column in each of those

data sets so for example the categories

which is the one that we have been kind

of playing with has the company's ID

column and the sector column and then a

definition so that's the memo that you

need for it to be another dictionary

where you say okay for example companies

IDs is the identifier of each company

and then all these other columns here

are what I think could be used as an

interface for a communication of

requirements between developers analysts

and other stakeholders where you say for

example the character the type of a

column that you expect is is a character

as opposed to numeric or as opposed to a

factor

um you can also say okay do you need to

enforce unique values for some columns

you may you may need to do that for

example for the company's data set the

company's ID column is a primary key in

in the as it's defined in relational

databases and then here you can see that

you can type okay it has to be it has to

be true right so you have to enforce

unique values for primary keys and for

other

other columns he may not be the case for

example the information column may not

be unique and that's fine right so this

is one very succinct way and very

readable way with a tool that has

nothing to do with our tool that

everyone knows how to use just a

spreadsheet that you can use to again as

an interface for communication of

requirements between developers and the

rest of the team

okay with that I'm going I'm going to

um

end the demo and go back to the meeting

if Aria are you still around

okay I like to yeah to hear your

thoughts about this Media or about your

experience with the point Bank package

or in general about um you know

Gathering requirements and enforcing

them with code and you know basically

your workflow when you work with data

output return with the with this object

it's like these functions it's like

these functions but you know more

user-friendly way they can be run

so I like seeing that it was a cool demo

thank you nice nice nice thank you thank

you uh Faria for joining me today

um I I don't have first-hand experience

uh really it's mostly something that I

need to be working with soon and that's

why I'm learning about it by teaching it

so maybe if I am gonna I'm gonna reach

out to you uh later to share my

experiences why once I have them

firsthand

sounds good all right thanks a lot for

joining me see you next time

ciao
