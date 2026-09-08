---
type: Video Transcript
title: "ds.database: Using a Relational Database Management System (RDBMS)"
description: "welcome again into the DS incubator this  is the series about relational data and  today is the last chapter we're gonna be  talking about uh the case when the "
resource: "https://www.youtube.com/watch?v=H9lARi3re9I"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=H9lARi3re9I"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

welcome again into the DS incubator this

is the series about relational data and

today is the last chapter we're gonna be

talking about uh the case when the data

does not necessarily live in your

computer as data sets say saved in CSV

files or in some other form but instead

when they leave in what is called a

relational database management system

you may hear me say rdbms for short

so that is the case for example of the

MySQL databases or Pro postgres

databases something that generally is

hosted in someone else's computer in a

remote server and you access that server

uh in some way and then you get data

sometimes the computations also happen

on the on the server so that means that

you can work with data that wouldn't

otherwise fit necessarily in your memory

in the memory of your computer

um so that's a pretty common case so I

didn't want to finish the series Without

acknowledging that what we have seen so

far is a relatively simple version of

what happens in the wild and more

commonly when we talk about databases we

talk about this thing when the the

relational data lives in a management

system uh I'm gonna be cheating a little

bit today I'm going to be working with a

flavor of an SQL database that fits

actually in a file and fits in my in the

computer in my computer in the memory of

my computer so I'm going to be storing

this database management system in a

file an SQL Lite file so the objectives

of today are going to be to connect to

such a file to such a you know

relational database management system

and also to copy data that we have in a

database in a data model that we create

with DM package how to reuse the note

the knowledge that we capture in that

data model and and kind of how to pass

it how to copy it to that relational

database management system then we're

going to be using that rdbms with in two

ways in a simpler way with d player and

in a more complex way with dm with the

DM package basically doing just a tiny

bit of what we have already done in

Meetup number one and two of this series

just to show you that these two packages

work as well with data that lives in

your computer as opposed as well as

um with data that lives in in such a

relational database management system

so let's jump to that I'm going to be

working with so the series he's hosted

here the chapters what's this here in in

the folder number four so that would

take you to today's notes that look like

this although I'm gonna be working here

in our studio directly to show you the

the source code that leaves behind so

we're going to be using with these two

packages that are the ones that allow us

to connect to a relational database

management system the DVI package is

always necessary to connect to you know

these kinds of databases and and the

rsql light package in particular I'm

using because the flavor of a database

management system that I'm using is that

is SQL light and that is called a driver

so depending on the kind of database

that you use you will need a different

type of driver so today is just our SQL

light

then I'm also be I'm gonna be showing

how to

um copy data that we create a data model

that we created with a DM package to an

rdbms so we need the DM package of

course and then I'm going to be showing

how to uh use it also with DM and with

the player so we need D player as well

and finally I'm going to be using the

here package simply because it's

convenient to me

all right

um so let's let's get to the point of

you know once we have uh our an rdbms

how can we copy to it some data that we

have a structured locally so the

connection is goes something like this

in particular for the driver that I'm

using actually sorry I didn't I didn't

run this chunk where I attached all the

packages that I need so I'm going to go

back to that

um and now here so the database I'm

going to be storing in this file with an

extension SQL Lite that is the driver

that where we're going to be storing the

the database is that is going to be our

relational database management system

now I want to connect to it I still have

no data but I still want to create a

connection to it so what I do is this

call is pretty complex at least

um

to my eyes and the reason is because if

you do

um DBI

connect

if you ask for help for the DB

something went wrong here

the

DVI DB connect

connect oh there you go so the hip file

I find it instrumentation function is

amazing let's see if I have it here

already

um

all right well the point I wanted to

make is that the arguments that you need

to pass to the function DB connect

at not necessarily documented in that

function itself they depend on the

driver which in this case is rql Lite so

you have to read the documentation of

rsql light and sorry of SQL light

function to learn which argument you

pass here so the rsql light package has

these function as SQL light function and

it needs this database name DB name

argument so that is simply the path to

the file that is going to store the

rdbms okay so with that we have a

connection and a connection looks

something like this is simply a little

bit of metadata and in for this

particular driver for the SQL light

version it points you know it shows you

the path and and that's about all that

we need to know so say that we already

have

um an rdbms and say that we already have

a database model that we created with

the DM package so these the tables that

I'm creating here are the ones that you

already know from earlier in this series

the companies

table which has a little bit of

information for two companies you know

the idea of the companies and some

information about them and then the

categories

table just two tables which have

um basically for each ID for each

company has information on which

business sector they they work on right

so those are the tables that we have and

we learned last time or you know a few

meetups ago how to create what's called

a database model or data model so a DM

with a DM package

these object stores the tables and it

can store more more information for

example which are the primary keys of

those tables which are the foreign keys

of those tables so the DM package it was

it was you know pretty cool to learn you

know how we could structure our data

model uh very formally and it would be

nice to reuse that knowledge and to be

able to you know if we want to start

using later down the path we wanted to

start using

um a remote database okay how can we

copy the data model that we have locally

in our computer to

there and to the remote database and the

DM package makes it very easy with the

function called ptm2 and so it default

to create it to creating temporary

tables which means that you have to use

temporary equals false if you want to

create a permanent table

a permanent

data model and it takes two arguments

the connection that we already created

above you know we already tell DM where

and which kind of remote rdbms we want

to store the data model and then of

course it takes data model itself right

so that's how you simply copy in one

call and the data model from you know

your computer to the database management

system

and if that's all you need to do uh at

some point you know you want to populate

the remote database with the data that

you have locally so that's say that

that's all I needed to do then I just

closed the connection it is best

practice to to do that every time you

work with a connection then and when

you're done you call the function DBI

disconnect and and that connection will

no longer be available so that's that's

how you do it so now we already have an

RD VMS and say that you know someone

else or you at some other time want to

use the data that lives inside that

rdbms okay in this case uh I'm gonna be

using as I said before at the SQL Lite

version so I I need a file and to point

to the file that stores it so the

database is is living here in that this

database file and now we connect to it

so in the same way that we did before

you know we create this connection

object that's that points to that

database file so that's how we're doing

here

and now let's use that connection in in

two ways with deep layer and with the DM

package so with deep layer of first the

one thing you might want to do is to see

which tables exist in that connection so

this is a function that comes from the

um most um you know lower level package

that deals with connections the DVI

package so this function DB list tables

tells you that okay we have the table

categories and the table companies right

which makes sense

so now usually if you work with deep

player

um you you can get a table say companies

from this connection with the TBL

function so typically you would copy

that table to an object if that fits in

memory and and there it is and the same

we're going to be doing with the

categories table and so now what we have

simply is you know two data frames uh

one is called companies the other one is

called categories and then you could use

the player as you would normally do so

for example I could be using the player

package here to join companies with

categories by the column companies ID

which is a shared column between the two

databases the two data sets and that

works fine and and we have the data that

we expected is simply a spreadsheet with

um you know which which has all the data

that say that we need for an analysis

the one thing that deep layer doesn't

tell you is what is that column

uh that you know joins the two um the

two tables together in this case it's

very simple we have only two tables and

the name of the the column is the same

in the two tables so you can quickly

realize that that is the relationship

between the two tables but in in the

while usually it's not so easy and that

is why having a data model like the one

that we create with the DM package is

useful so you don't need to know this

relatively low level detail of which is

the columns that relate different tables

together so that's why I want to show

how you would use

um the remote database or the rdbms with

the DM package as well so typically I'm

gonna you know get inside the body of

this function this function is a helper

that you know I'm gonna argue that um

for if you're gonna be using data in a

data model many times yourself or

because you're developing software for

someone else is going to be using that

particular database it's kind of nice to

create a helper that allows you so that

knows about the connection that you're

gonna give it in this case is you know

the database for companies so I created

the helper companies DM which already

knows

um which tables that connection has the

companies and categories tables and also

you know here is where I I add the more

formal definitions of of the

relationships between tables so I add

the primary key for the table companies

which is companies ID and I add also the

foreign key for the categories table

which is also Company ID pointing to

companies right so this is kind of my my

you know the smallest version I could

come up with 26 simple I could come up

with to kind of show you know how in if

if you maintain

um

a database that people is going to

access multiple times it would be nice

to create just a tiny helper that has

all that schema that defines the

relationship between between the tables

so that helper could live in an internal

package or you could live in some R5

somewhere in this case and I just

created it here on top and now

um creating that DM object so the data

model for the company's database is

simply is simply this right so we just

you know take that connection that we

opened before and you know that's the

metadata pointing to the file that has

that sqlite database and then you know

we pass that connection to the companies

DM

a function which is our helper so with

that you know if I print the the DM

object what I get is the metadata for it

as you can see it's already relatively

nicely structured it already has

information about the primary key has

information about the foreign keys and

with DDM package you know you may go

back to

um to meet up number two I believe but

one nice thing is that you know once you

have to find data model in such a formal

way then you can use some convenient

functions of the DM package itself to do

things that would otherwise require

knowledge of the internals of details of

here for example I can just use the the

function flattened table to create the

same spreadsheet that before I created

with with deep layer but before I had to

know that relationship between

um between the tables was by the column

company's ID in this particular case I

don't need that because that

relationship is already defined in the

data model so the data model calls that

metadata

and then well if that's all we need to

do we just disconnect from the

um

from The Collection with DBI DB

disconnect and that's it

so here is this is an internal chunk of

code for for myself but I wanted to show

you uh that the the files actually leave

here so this this file that I'm

highlighting here the database dot

sqlite is the database itself is

database file right and that's bring us

to the end of what I wanted to show with

plenty of time for for comments or

questions if if we want so I'm going to

go back to the meeting here

um and we have

miria here how amiria any any comment or

question about this

great thanks very much Mia for joining

me in this series uh today is the last

one and next time we're gonna come up

with something else see you next time
