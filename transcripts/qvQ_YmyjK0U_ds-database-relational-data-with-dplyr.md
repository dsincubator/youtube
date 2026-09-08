---
type: Video Transcript
title: "ds.database: Relational data with dplyr"
description: "again to the ds incubator  today we start a new series about  relational data  the goal is basically to help myself i  say here to help you understand but in  t"
resource: "https://www.youtube.com/watch?v=qvQ_YmyjK0U"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=qvQ_YmyjK0U"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

again to the ds incubator

today we start a new series about

relational data

the goal is basically to help myself i

say here to help you understand but in

this audience today we have people have

more experience than myself in

relational data so it's mostly to learn

about relational data

and

and and to be able to use it um whenever

you know we have a collection of tables

that are related in some ways so the the

series that i envision is not fixed but

i envisioned these three chapters the

first one today is about the basics of

relational data we're going to kind of

define it and use the player to

manipulate it

the second chapter would be about the

package dm which is an art package

designed to define the data models and

to work with relational data

and finally

to work with remote databases

of the kind of data of for example sql

databases that yeah even if you host

them in your computer when there's been

served um and it kind of works as if it

was remote so this is dedicated to just

about anyone at two degrees and beyond

who

need to work with real world data it's

very rare

that a data set one single data set has

all the information that you that you

need generally the

insights are spread

across a number of tables usually and

that is why this this is important and

it is to that collection of tables that

are related to each other that

we are calling relational data here and

the definition comes from

the book are for data science which is

the guide for at least this one chapter

then we're going to be looking into

different resources

so focusing specifically on the chapter

of today the objective is to understand

what relational data is

also how to use different types of

joints

understand what happens when a key has

duplicate values so we're gonna define

keys in a moment

and learned how to validate the keys to

avoid joint problems

so let's jump to

the chapter of the day so this is the

repo that hosts the series uh let's go

to the folder one

deep player

to see the notes of today

so we're going to be working with the

player so i'm going to um

first attach it to my session here

actually i did it already so that's done

and

then we're gonna be working with a toy

data set and then a few

graphs that hadley william wrote in his

book

and so this is the data that i'm going

to be working with today it is a

collection of tables that totals the

number of two only two tables very small

and

it is

intentionally designed to be similar to

some data that we are working with in

real life at two degrees

the table

called companies has only two companies

they have a company's id number one and

two so we have here information for only

two companies

and there is a column called information

so for example the company one is called

alpha so alpha sells solar panels and

wind mills

if we track the same id in the other

table

we can see that that number appears here

in the table categories

and in the table categories we have a

column called sector so the company

number one which we know that sells

solar panels and windmills

is categorized as belonging to the

sector energy which makes sense and oh

and that's it so um just energy and the

company two

who is called beta sells steel

and also installs solar panels they

dedicate to two very different

activities so company 2 as we can see

here in the table categories

it belongs to metallurgy because it

sells steel and to energy because it

installs solar panels

and then note that there is a third

company for which we do not have data in

the table companies

so this could be for example a problem

in a real life data set that needs to be

detected and then kind of addressed

so that's the tables the two tables

we're going gonna be working with

um

the

in a in a relational

database the relationships are always

defined between

pairs of tables so any more complex

relationship is always

you know can always be kind of

decomposed to to

pairs basically you know one table

relates to the other one and then the

other one might relate to another one

but every time you can decompose the

complexity to just two tables and they

are linked by you know one column as we

showed before the company's id for

example which um

these these columns have a special

definition and some properties that

we're going to cover later and we call

them keys and there's two types of keys

and so let me first you know load that

data i'm going to show you live code

just for a little bit and then because

there is quite a lot to cover i'm going

to just walk through the document so

here i'm defining the two

toy data sets that i'm going to be

introducing today

so if i type companies we should see

something very similar to what you saw

on the notes here is that that little

data set with a key

company's id

i'm going to explain more about keys in

a moment and then the the column

information and then the other table is

called categories so we should see it

here

and here is where we have

the sectors for each of those companies

and a company that we do not have right

so basically um the the first um

[Music]

the most common way of uh

joining two tables is with this deep

layer verb called left join

in a moment where i'll be talking about

multiple ways of joining data but this

is the most common one

the left basically points to the

table that we want to focus more on i'm

going to give more details later but in

this case uh just to kind of give you a

spoiler alert um we are going to be

focusing on on all the rows that

companies have and we want to add the

columns that come from the categories

table so

here we have the two tables and we just

call

we can do companies we take companies

first

and then

using this case the base pipe

and we do

a left join

with categories right and if you want to

be explicit which is the best practice

you should

explicitly say which is the key

variable

using the argument by so you say

categories

id

so as you can see

not yet but quite now

i may have

cut

okay so it's called

companies id i made a mistake there typo

so now you see that we have pretty much

the same table

um so we have the id one

and that matches now the sector energy

from the table categories and now i need

to

you know the rows of um appearance twice

because two times it matches the sector

um

table

right so we're gonna be talking about

this uh

now so that is how how it works

basically you take one table

find a proper and appropriate join uh

and you join it with another table uh

and then you have to be explicit about

which

is the key variable that joins the two

tables together

so from now on we're gonna spend time

here in this in this document

um so a more realistic example could be

something like this there is a data set

actually that you can install it's

called um

flight or new york flights i think um

13.

it's a collection of multiple tables

that illustrates a more real-life

example where you see there's a bunch of

tables and they're linked to each other

by some keys in this case for example

there is a table that contains

information about different flights

and that table has one column that is

called tail numb which is the number of

the tail of an airplane that identifies

specifically a plane the machine the

plane

but there's no no information there

other than the the idea of that plane so

if you want to learn more about that

plane you have to join the table planes

which then you know matches with that

key tail number and then it has more

information about planes so that's just

to show how complex that a model could

get

but that complexity should not be

overwhelming because every time as we

said before the

relationships are explained um

or the relationships you know come down

to relations between two tables so if

you understand the relationship between

two tables by one key uh you have kind

of moved forward in understanding the

the entire data model

so let's let's

first overview all the possible joins

that you can do and

which is kind of interesting to know

that the options that you have because

sometimes they do come handy

in my case you know i use so much that

left join

function that i kind of forget that

there is other ways of joining data and

sometimes i'm you know i find really

awkward ways to do things that i could

have done much quicker if i had this

overview here more present in my brain

so basically these two types of join

broadly speaking one joint that mutates

the

this is called a mutating join because

it adds columns apart from matching rows

it adds columns like the one that we saw

and a moment ago you know we added uh

two to the to one data so we added you

know another column that came from

another set

uh and again that is you know you can

split that in into the inner join uh

drops column drops rows that do not

match we're going to see that

graphically in a moment and then we have

outer joins that come with different

flavors outer join is uh similar to the

one that um you know it like includes

the one that i showed before that let's

join and if a couple of other flavors so

i'm gonna

discuss them

walking you through graphs before

before i explain more about them so one

big group mutating joints add columns

and then the second group filtering

joints which do not add columns all only

deal with observations um so one is used

to keep

the rows in one data set that match

observations in another data set and the

other one does the exact opposite it

drops all the rows in one data set that

match rows in another data set

so let's let's use the beautiful graphs

that come from that book

are for that science in the chapter

relational data

here we are

introducing

like looking into the graph that shows

how to do an inner join so if you use

the function inner

underscore join this is what happens so

you have a table here uh

basically every time the arguments sorry

to every function

uh every joining function are x and y so

we can think of this table here to the

left the one that has the values x1 x2

and x3 as being the table x and then

here to the right the the table y you

can see that the colors green

with id one and the color purple with

id2 they match in the two tables so an

inner join what would do is to keep this

these two things together so we glue

these two tables by these two rows only

that much and then everything else is

dropped the result is the keys that we

are using to match the tables all the

values that come from x

x1 and x2 and all the values that come

from y so this this new column val y has

been added that's why it is a mutating

join

there is an example here using the toy

data that i that i use but i'm gonna i

think the images are

better a better fit for this relatively

short demo so if you want to

uh

to come back to these materials yourself

then here you have some some code

examples but i'm going to be focusing on

the images

the left join is the one that i showed

the demo for uh it does also match

the rows in this case one and two in the

two table in the two tables but

because we are focusing on the left this

table we want all the rows including

those that do not match but do not match

i mean for example the id number three

you can see there is no number three in

table one why

so id number three will match just a

missing value right so the result will

be that you know we get

um we get a matching one so we get the

values of x one and a y one

oops i didn't mean to do that

that's interesting let me go

back to here

same for id2 so we get the x2 value and

the y2 value because

there is a value in both tables but for

the for the row with id 3 know that you

know we do have a value in x and and

because it's a left join we want that to

be there even when there is no match in

uh in the table y

and and that is the most common because

the inner join is kind of dangerous

imagine if you're doing a big data

analysis with a big table that you can't

overview the whole table it's very easy

to drop

rows that you you know you don't know

about and you may be missing the reasons

why um the data is not matching you may

think that you may expect all perfect

matches and then if the data does not

you don't have a proof of that mismatch

so generally what you want is to get

those nas those missing values to the

next to then notice them and then

explore why there was no match right so

if you were expecting a match maybe you

want to have an n a so you explore why

it wasn't you know and understand better

your data

the right join is the same thing except

that now the focus is on the right hand

side this is more like a convenience

because you can always flip the table so

one table that was in the left you can

always put it on the right but sometimes

you know if you're working specifically

on on a pipe

uh sometimes it's kind of nice to uh to

have the ability to call right join or

left join so basically it's the same

thing that we saw before in this case

for example notice how the key uh the

value of the key number four here on the

right which is the one we are focusing

on has no match on x but we still get it

right we do not get

number three because we are focusing on

on the right but the full joint does the

full join

gets you every single row

right and every single column so you get

the

that's why it's full you get all the

columns that come from x

all the columns that come from up from y

and all the rows that come from x and

from y even if there is no match okay so

it's a combination of the left and the

right join

again here is one example for

each of those joints and now the idea of

filtering joints featuring join is a

convenience to filter data based on

another data set so if you have a data

set like x here for example which you

know has keys one two and three

and and you you you know happen to have

another data set y that has um

values in the key one two and four and

you may you may want to use that you

know that y that set to to remove all

the rows in x that do not match

y

right it sometimes it is very convenient

sometimes you can do it even with with

itself you know you can create a smaller

version of the data set and then match

it back to itself

uh so in this case what we what we get

is um only one and two but notice how

there is no column value y right so the

filtering joints do not mess up with

columns they don't add any column they

only focus on uh the the table that you

give to the x argument here right and

and you in this case in the

uh

sorry actually i forgot to say this is a

semi join that's the function that does

this trick so the semi join and what it

does is keeps the rows that much

observations on the other table as

opposed to the

anti-join that that's the opposite

wherever you see a match type for

example one and two do match

from x and y and that's what you do not

get you what you get is the other row

that do not match the the other table

and that's going to be handy when you

want to validate

the properties that you expect from from

the keys i'm going to show that in in a

moment

so let's see what happens uh when a key

has a value that is duplicated that is

something that

does occur

um quite a bit especially if you are

working with a data

with a database that is not

formally

validated sql databases you know just

data from the wild

and so let's see just to understand what

what happens so you know what to expect

so here for example we have this table x

uh that has in the id2 it has two values

it has an x2 and x3 both have the id

number two

and so when when this is this number two

in the id will match the id number two

in table uh in table y

so you would expect that because this is

a match two times

that y two that comes from the table y

will be added

in in the two rows right so basically

you duplicate um

uh you get a combination between between

the

the different rows that come from x and

y

uh so this is the case where the

duplicates are only in one table right

so here you can see the result so uh x2

with id2 matched y2 and x3 with the d2

also matched y2 so this is a you know a

way to

inject

those values of y

in x

but now there is also the case where the

two tails actually have duplicated

values and and what you get is the is

the product so every single combination

actually i think with monica we use this

recently

in some code i remember i think last

time we we per program where we created

we wanted to get all the combinations

with between one thing and the other i

think and we did something like this

um so here you see

uh the the id2 uh has has a value in x2

and x3

and also on the table y has y2 and y3 so

you have all the combinations no notice

here so instead instead of getting

two

repetitions of two you get four because

you have the x2 y2 x2 y3 x3

y2 and x3 y3 kind of makes sense but

it's kind of nice to see it's in in a

small compact graphic way so that when

you get

data from the real from from the y in

real life

you understand what's going on usually

you know a table is much bigger and it's

a lot harder to see what's going on

so these are

this next section is motivated by

conversation with uh with miria it is a

step actually i need to do still in a

project i'm working with right now and

so we do have data and i need to

validate the keys so what does that mean

okay there is very few but important

properties that keys need to have

um for a data set like companies um we

define a company's id as

the primary key uh

and that primary key has to have the

property of being of having all values

are unique so all the values in the

primary key should be

unique and and one strategy to confirm

that is to count

the values of that primary key so

whatever is your primary key you know

you take the data set and count called

the function count uh with the name of

that

of that um

you know candidate for a primary key and

you you see if it meets the property

that it should meet and so one way to to

to notice if there is duplicates is then

in a very easy way is to then call

filter for values where n is greater

than one so

the count function will uh

create this a table that looks like this

one here underneath where you have only

two columns one that has the um

you know one column for the the key that

you are counting and then one column for

the number of times

that um basically that you know the

values the unique values of that

column were counted

so if you filter by you know n where the

value of n is greater than one what you

would expect from a properly behaved key

is that you get a table that has zero

rows so no

values should be duplicated that's what

you expect

so that means that in the dataset

companies the the column companies id is

a good candidate for a primary key and

so let's just for comparison uh the the

column companies id also appears in the

categories data set but note that if i

count if i do the same i count company

ids in that table and then filter for

ends greater than one

i don't get a zero row table right so

that that table um cannot have company

ids as a candidate for for a primary key

and another property that

is kind of an extension of that is that

no value of the primary key should be

missing um because then what what is it

going to too much right

and so one way to to check for that

would be to call you know the data that

you you're exploring

and you can filter for rows where the

candidate for a primary key is missing

so with the function is an a

you can do that so it's missing company

ids if i filter for that

i should get a zero row to right and

then the final third property that is

crucial to check is um

is from the other table so you what you

want to ensure is that um the the

remember that

company ids appear in that

column companies but also appeared in

the

table categories

and there it was not a candidate for

primary key because um you know that

table is it is valid because of the

meaning of the data it is valid that it

could have multiple rows right so what

it is that that is a column that all it

does is it holds a reference

to the other table to the primary key so

because what what you know the meaning

of the value of those of that column is

to refer to another table it is called a

foreign key right so the way you you

what you need to validate for a key to

see if it's a valid foreign key you want

to ensure that every single value that

appears in a foreign key also appears

actually is referencing an actual value

in the primary key so one good way to do

that very quickly is the anti-join

function so remember we introduced that

function before basically at wendy john

what it does is you know takes one data

set in this case to the left and and

and gets you

the rows in the other data set that do

not match

so what you would expect if it is a

valid key is to get a zero row t o

because in that case that you could be

confirming that

um every single

row in your potential

foreign key does match some value in the

primary key so in this case the toy

example is designed so that we do get

um

a match you know we do get it there is

one row in the potential primary key

that is not

in the primary key meaning that this

data

has a problem so when these things

happen and they do happen in real life

you have to make a decision you have to

think and decide if you even drop that

column that um sorry that row or

if there is any way that you can find

that missing

value in the primary key of the of the

main table in this case would be

including companies

all right so that is all i i had for

this

introduction to

relational databases and how to work

with them on the player so i'm going to

go back to your faces and

[Music]

hear from you

let's see if there is any comment or

question

to share

go ahead

this is more of a comment but uh this

was really nice tomorrow this is like

one of the

um

these incubators where i knew what you

were talking about

so this is really good to

review my knowledge uh thanks a lot

great great appreciate it

i've read this this chapter a long time

ago and i remember seeing those graphs

and and and thinking yes i now get it so

i wanted to share it with you because

you know the book is there but sometimes

um you know you need either reminder or

be introduced to that so that people

interested in learning more can can get

there so hopefully this ds inquiry would

point people to to that i found it super

useful it's great to hear that you like

it for you

yeah thanks a lot

okay if there is no more comments or

questions we are

on time so thank you all for joining me

today and see you next time

thanks all right thank you bye
