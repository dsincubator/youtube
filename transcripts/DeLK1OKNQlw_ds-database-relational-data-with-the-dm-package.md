---
type: Video Transcript
title: "ds.database: Relational data with the dm package"
description: "again to the ds incubator today we are  talking about relational data this is  chapter two on this topic  last time we talked  about how to work with relational"
resource: "https://www.youtube.com/watch?v=DeLK1OKNQlw"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=DeLK1OKNQlw"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

again to the ds incubator today we are

talking about relational data this is

chapter two on this topic

last time we talked

about how to work with relational data

using

dplyer in a what you know what today

could be perceived as a more manual way

of doing things

and today we're going to be talking

about a package that is dedicated to the

idea of working with relational data in

r

it is the dm package

so this is the repository that hosts

this meetup to the use invest in ds

database and let's go to the folder

number two that hosts

the notes for today

and

the dm package is a tool that

well it has a lot of functionality but

today i'm going to be focusing on the

idea that it is it makes it easy to

create data models visualize them

check some of the properties that you

want them to have

and to use data sets in general to use

complex datasets in general to make it

easy to work with you know many data

sets or others that are large and when

you want to do things with them or share

them

one key thing i believe is the how easy

it is to integrate with the player

either because you can use

the player functions directly or because

it has some functions itself that are

very similar to the player functions

making it easy to reduce your knowledge

if you already are used to working with

the player

so because we are going to be talking

about these two packages uh we need to

attach them first for the demo so i'm

going to do library dm

for data model and

library

multiplier

the data sets

that we're going to be using are

tiny we created them

we showed them

last time it is

a data set

composed of two tables

one table is called companies and it has

information about different companies

there is a total of two companies in

this

table

and company one and company two are the

ideas of those companies and and then

here in information we have a little bit

of information what they sell or what

they what services they provide

then the categories data set is related

to the first one but that by that column

called companies id

and

and this is the whole idea about

relational data sets where you know the

data is spread across multiple tables

but those tables hold relationships that

are um

that are linked through specific columns

and we talked a bit a little bit about

about that in the previous meet up and

and today we're going to touch on that a

bit more briefly

one thing i wanted to know here is that

is one

row this one here that i'm highlighting

that contains information about a

company that exists in only one of the

two data sets

and that is an issue that we're going to

be exploring

with the dm package and addressing it as

well

so to begin with something familiar

the data model is the object

that

defines the dm package and it is very

similar to a list so for example if

you create in the same way you create a

list with the function list you create a

data model with a function on the m so

let's create an object called dm

i can make this a little bit more

prominent here maybe a little bigger too

and i'm going to be using the equal sign

for assignments that i usually do

like this but for a keyboard thing

i'm going to be using the equal sign so

the dm

object here is just the variable name an

arbitrary name that i came up with but

you

you know i'm creating that data model

object with the function the m from the

dm package and here because i already

have the data sets in the form of data

frames i'm gonna just pass the names as

variable names directly to

to the dm function so one is

i think it's misspelled

let's do the whole thing again let's

start with companies first and then

categories

so this is my dm object

and

when you print the dm object it's kind

of boring in a very nice way it doesn't

you know produce a lot of output it

doesn't take any time to print

is simply metadata about the the data

that this data model contains so we have

here the names of the tables how many

columns there are

and and this information about what are

the keys or basically the columns that

link the two

data sets the primary key and the

foreign key so far are undefined that's

why it says primary key 0 foreign key 0.

so

you can use

in the most basic way a data model as

you would use a list with the

dollar sign syntax you can simply give

the name

of one of those elements of that you

know special list for example a

company's data set

and

wow sorry it looks like some

alarm here but i don't see an issue

let me take a moment oh stop so

apparently it's no drama here

so yes you can as a list you can just

call the dm object with the dot assign

syntax and the name of a

table and you would you know get the

output as you would expect in the list

or if you prefer you know you could also

use the square vertex syntax let's do

that for categories

and the same happens right so up to that

got the ories if i know how to spell

that

there you go

uh nothing surprising so far

the the interesting thing

starts when you define those um

keys when you say okay take the dm

object and

add

so the all pretty much all the functions

except for a few start with a dm

um prefix which is nice because then

it's easy to find functions like this

one for example add primary key pick a

and you say well to which table you want

to add a primary key and then you say

well for example for

companies

and which is the column that you want to

be the primary key okay in this case

it's going to be a

company's

id

and and if i print that object now you

already see how i'm adding that primary

key that before was

was unset

and you could do the same thing with the

foreign keys or add the foreign key

and now

what we want to do is so we got we add

the foreign key to another table so in

this case it is categories

and then

[Music]

the same column in that other

of the column with the same name in the

other um

data set

com

japanese id here is a foreign key

actually i'm going to make this a little

more to the left

because i'm using more of that space and

maybe a tiny little bit smaller

so that is

a foreign key that points from

categories to the

companies table right so it links these

two tables together so if i print that

data model again i get a little bit more

of the metadata so i already defined

these two things so because this is

useful in itself i'm going to now create

a

variable called dm2

and

and let's start doing something fun so

the very first thing you can do

super easy is to create a visualization

of that data model so we can see

[Music]

the relationship between the different

tables so the function that does that is

dm draw

so here is um

actually you have it here also in the

notes but in the notes actually for some

reason it kind of gets off of the

of the squares so you see the two tables

and you see an arrow pointing from the

table that contains the

foreign key pointing to the table that

has the primary key and the primary key

is highlighted in this case um

underlined sorry and and that's you know

how you interpret this this graph you

can imagine this being a lot more

complex you could have many many many

tables and there could be many columns

in each in each table but this graph

focuses specifically on on those that

relate details to each other so you

reduce the complexity to something that

you can you can understand more easily

so that's something pretty cool that you

can do with very little effort once you

define those

keys

just with the function dm draw you see

that

little visualization that adds a lot of

understanding but another thing that is

super easy to do here and i'm going to

show how it's not so easy to do by hand

is to check for the constraints that

databases usually

enforce

so you do that with the m

examine constraints

so that's a very simple

call to just one function that checks

for

at least three things that i'm going to

unpack in a moment the first thing i

want to show is that here there is a

node or a message that says unsatisfied

constraints and and the way you

interpret that is is as follows so as i

showed before

this

row here

that exists in the table

that has a foreign key

pointing to another table

it happens that one of the constraints

that database is enforced is that every

single

value in a foreign key should point to a

value that actually does exist in the

other table that holds the primary key

and this is not the case here so that

constraint is not satisfied i think one

of the examples later shows the result

of that unmet constraint which is

basically a missing value when you join

those two tables

so that was fairly inexpensive to

compute at least in terms of the cost of

typing the code uh i have done some

examples with more real data

and it does take quite a bit of time

so

it may not be inexpensive in terms of

computation time but uh you know it's

kind of easy to type

for comparison um if you want to do the

same thing on the player

uh the code that you will be typing is

something similar to what we covered in

the last meet up

so you know you would take the data

the table so in this case you know i'm

using the data model as a list

so i get the the company's data set and

what i'm doing here is just counting

the number of times that i get uh

different values of companies id because

one of the constraints of um you know a

proper database is that every primary

key value

should be unique

and and this output of zero rows shows

that it is indeed um

met so that that constraint is met so

the the table that contains um

a table where i define a primary key has

no duplicates that's great this other

thing is also great too this second

constraint is the idea that um every

value in a table

and where

where you define

every value of a primary key in a table

that you define

should not be missing so here i'm

checking if there is any

row

that has a missing value of that primary

key

in the table companies and and the

answer is no there's no meaning that you

know it meets the expectation but then

this third um

piece of code and what it does that the

function and the join is trying to find

um if

any of the values in categories is not

much

by valuing companies and indeed there is

one which is that that row that we

highlighted before so this is simply to

show that you know to test for

the constraints by hand is very

expensive very you know costly you have

to write a lot of code and this is a

very small data set so of course for

bigger things bigger data sets and need

to pay

so

you have to

so there is a lot of value in in this

approach

um another great thing of the

of the data model is that it allows you

to for example

flatten to create a spreadsheet type of

table and

out of multiple tables in a relatively

easy way as well so this is the idea so

here in this package is called flatten

and so because we have only two tables

in this

data set and

it's very simple so basically what we

are saying is okay start at the at the

table categories

and flatten every table

that that

table points to so

in this case let me go back to the

figure because we have only two tables

so we start at categories and we follow

the arrows so we get every column that

comes from categories and then every

column that comes from company so that

will be the entire data set in a

spreadsheet in this kind of flat

spreadsheet form if there were more data

sets so if categories was pointing to

not only companies but to some other

table or tables then all of those

could be flattened and you could get the

columns that come from all of them which

is which is very nice that um you know

you get that with just one one call as

opposed to having to explicitly say okay

merge this table and then another table

and another table and each time explain

with by by which column you want them to

join which is kind of the manual

approach you have to do with the pliers

sorry i'm scrolling down as i

as i speak so the two things i have to

define here for this to work is the

you know the table from which you start

flattening your data set and uh if you

want uh you say recursive true so that

you know every table

that you know you you continue with the

arrows as far in this in in the graph

that i show you know as far to the right

as you could go pretty much so joining

every single table that is pointed to

and if you say of course this request

defaults which is the default then only

the first one that is reached by one

arrow but not not one not one table then

points another table and then table and

so on and so forth

um

also um

one as i mentioned before as one feature

i believe is

is very important is that

the data models are

very well integrated with the d player

package in two ways either because you

can use the player itself

or

because

you can use functions that feel as if

they were the player function so let me

show you

that because that's that's a little bit

more tears let's unpack that a little

bit with with a demo so i'm going to

move here to

our studio and so i have this dm 2

object

let's refresh our minds where it was

and so one thing you can do if you want

to use the player directly

you need to first say because the player

works with just one table right and the

data the data model has as many tables

as it has so in this case has two so we

have to specify somehow

and which table we want to kind of zoom

in so that

we can then use the player function so

that the the feature that does that is

the m

zoom two so we zoom to in this case for

example the categories table

which was the one that had that

problematic row uh so let's let's try as

an example to use this idea to remove

that

row that was a problem so say that you

know we looked at the data we identified

that is the road where company's id is

number three so we want to exclude that

one

and because we know how to use the

player we know that filter

is the function that does that so we say

well filter companies

um

id company ids where uh where this is

not equal to three so that's that's the

same text

um and um

and that's that's the trick so if you

print that where you you know you see

that you're actually working with just

one table as you would normally do with

the player which makes sense right

because the player knows about one

single table

at the time

uh but then if you want to make that

part of the entire data model then you

um basically what you do is you update

uh the the zoomed

model right so by doing that and you are

you know if you first filter that one

table

where the values were not three and then

you updated the entire entire model so

if if we were about to do that then we

would probably store that in a dm number

three for example

and that would be that would be the

trick

so

um

the same thing or similar so this you

know piece of code with demonstrations

that you can use the player right away

so if you already know how to use the

player and you simply you know zoom into

a table then use the player and then you

may want to kind of update that data

model and

you are fully reducing your knowledge

about the player but then another

approach is to use functions that feel

like they are the player but they are

not they are functions from the dm

package so if i take that dm

object number two

there is this dm filter so instead of

filter it's just the m filter which

makes a lot of sense and and here you

have to say

so the syntax is a bit more compact and

but again you know we need to explain

in this in this new approach we need to

explain which table we want to work with

so before we use the m zoom 2 and now we

explicitly say as if it was the name

of a variable we say categories

which is the name of the table we want

to work to

and then

after the equal what we do is simply you

know we get everything that we could

have typed

into a filter call including the

parentheses which is kind of weird but

it is what it is and then you just paste

that there and and that's that's the

trick so that is a more compact way

uh to do the same

and so the same the m3

you know we could create in that in that

way

and once you have that um just to prove

to you that we have excluded that row

what i'm going to do is dm3

and check those constraints so the mx i

mean

the constraints

and and that

should say now that all constraints are

satisfied because the problematic row is

gone

this is only the very very very

s

tip of the iceberg here and the the

package has a lot of

really cool features that get a lot more

into

um

you know that give you functionality

that it will feel super familiar with

people for people that have been working

with sql or databases on a cloud service

uh or sqlite databases stored in in

memory

and i i'm planning to touch uh

in in some of those um

ideas uh next time

but for now i wanted to point to uh

the rebel or the repo sorry the website

of this package and in particular to

note where you can

learn yourself

if you want to take

a deep look at all of this because we

want so this this is all pretty much

what i wanted to talk about

the bigger features of the package and

then next time i'm thinking of talking a

little bit about remote databases and

just showing a little bit of tm there

but not much

so the first page has been

very much inspiration for this meetup

this second page that says get started

as well so in those two places you will

find more or less

what you have just seen

well then the references in every

package website you will have all the

functions but i highlight that the

tutorials and technical articles of the

website are very complete um maybe even

too much and and you might feel a little

bit overwhelmed but uh you know they are

there so see that you know know that

they are there and you can also learn

about data models in general in the

first tutorial is is mostly theoretical

this is one that i have found very

useful to refresh some contents and to

learn a few things that i didn't know

about

so if you're behind you know if you're

after some theory you may want to come

here if you're after implementation you

may want to read other articles but all

you know

you know know that there's a lot of

content here that you know could help

you and as it is helping me

um you know walk along that path of

learning to work with relational data

models in r

so that's all i have prepared for today

um

we have here miria

who has

worked

with

relational data maybe not with this

package but pressure data in general so

i'm going to ask if there is any

question or comment media that you'd

like to share

maybe just a quick specific question

so does the data models factor also

support specific check constraints for

example could i define that my column

may not have values outside 1 and 0 or

something like that

that's a good point i was thinking in

terms of you know conversation we have

had

if you can define

those constraints

beyond you know the basic constraints on

on primary keys the answer is i don't

know uh but i will find out because

that's kind of my homework

for for the next week or so it won't be

captured here but if i learn it i may

say next time i'm

i'm here on

on this meetup amazing and

by the same token maybe if it can check

for type and if it can handle unique and

composite unique constraints

perfect perfect all right thanks so i

use that then as a guide to

[Music]

my learnings um in in my first you know

pass to these functions i don't recall

having seen that but i'll

i find

out all right uh

so there is some checks here uh let's

let me go strange check he check city

quality

said

there is something promising here but uh

also maybe that could lead me to

learning and talking about the

point blank or some other packages that

may complement this it could be nice i

think to find some examples of this

package in the wild and see how

as you say miriah like the fuller checks

have been implemented how much of those

checks come from the dm package directly

and how many how much comes from from

elsewhere

all right thanks love me again for for

being here but also for inspiring this

series and everyone else who is around

thank you and see you next time

thank you bye bye ciao
