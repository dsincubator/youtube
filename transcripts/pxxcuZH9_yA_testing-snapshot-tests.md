---
type: Video Transcript
title: "Testing: Snapshot tests"
description: "To the idea of snapshot tests what it is and then monica is going to be talking a little bit about our experience using snapshot tests with images..."
resource: "https://www.youtube.com/watch?v=pxxcuZH9_yA"
tags: ["ds-incubator", "snapshot-testing", "testing", "r-packages", "github"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=pxxcuZH9_yA"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2021-04-27T00:00:00Z"
    usage_count: 175
usage_window: { from: "2021-04-27T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

today the dsm creator continues

with the series about testing our code

and today we're going to be covering

snapshot tests

along with cj and monica i'm going to be

doing a little introduction

to the idea of snapshot tests what it is

and

um and how to actually implement it with

test that

and then monica is going to be talking a

little bit about our experience

using snapshot tests with images

with plot images and then cj is going to

be sharing his experience

with one approach that that makes uh

working with images

in snapshot tests a bit more robust and

rest and less brutal

but that will make sense in a moment

so to begin with what is a snapshot test

usually and if you wear in the previous

meetups

you uh you saw that

one of the main functions that we use

from the test that package

to test or to yeah to test our

expectations

is to compare the output of a function

with some code that you you write

actually there on the test

that should match the output of the code

so basically

in a normal test what you do is you

compare

with code the output that you expect

with some output that you're right there

on the test but sometimes it is not

convenient

to do that i'm going to mention three uh

three

times when that that's not convenient um

and when that's not convenient sometimes

it is convenient to

store the expected output not in code

but

in a file in a separate file and that is

all that there is to snapshot tests

so once again and that's the text that

is highlighted here on my screen

snapshot test is the idea of saving the

output

that you expect not encode on the test

file but instead on a separate file so

it's not you know in front of your

eyeballs

and test that has implemented the idea

of snapshot testing in different ways

through the different versions but

lately it has improved quite a lot

so the three times that

it is it is convenient to use snapshot

tests are

for example one when the output

is a string of text that is kind of

awkward and that

to reproduce that in code you would have

to escape

a lot of characters and for example you

have to escape

um end of line characters

that's one case the other case is when

the output

that you expect is very large like for

example ggplot2 for example returns an

object that can be plotted to the screen

but is an object on itself so you could

query its

structure and you will see that it's a

very complex

object that has a lot of elements

so if you wanted to to write that output

in code

it would be very long very difficult to

look at very difficult to read and to

understand so instead you can you know

probably save that

output on a snapshot outside the test

file and into a separate file

and third when the format is

is binary when you're working for

example with images

or plots or that produce images and you

want

to store for example a png file and

that's what monica is going to be

talking about today

and then cj is going to be talking about

an alternative to

storing data in pixels as opposed which

is

png and he's going to be talking about

another approach that is kind of more

robust

so that's kind of a theory of snapshot

testing

it's just storing the output in a

separate file

and what i'm going to be showing is very

briefly

one motivating example of uh snapshot

tests

uh to see how it actually works on test

that

so here i have this um

here on the on the screen what i have is

a

small rmd file as you can see here

another markdown file so if i need

this file what i get is

a little bit of text blah blah blah

and then the session information so that

is a common use case where you want to

share along with

you know that you know along with your

document you want to share

information about your session

but that is uh kind of awkward because

you know the output of

session information is is very long and

uh

and the kind of it really barries the

the text

of my document my document you know is

blah blah blah and it's just one line

and the output of session information is

super long so

i would like to kind of hide that a

little bit so i'm going to show you

um how i could do it i could use a

little bit of html

and use this tag to wrap around

the the chunk of code that output

session information

and now my rmac down file will output

this this nice kind of drop down

menu that hides the details right so i

can expand

or contract it and now my document is a

lot more readable

so okay this is the the use case that i

would like to say okay

i like this idea i want to create a

little function that does that

for me uh so

how how would i go about that you know

what what would that function look like

and how would i test it and that is the

point of of showing you today

so let's let's call that little function

si for session information

and and this is said this is the the

code

and it is the details are not super

important here what i want to show you

is what happens when i print

si to the console as you can see i you

know my implementation of this this

little function

is uh you know i run the little function

and immediately on the console i get

some

text that i can copy right and i could

paste

sorry i can copy

and then i can paste it in in any

say that i have this right so i can just

paste it i copied from here i paste it

in in a new file

and i already have that drop down menu

for

uh for the session information right so

let's pretend that that's

a very useful function and i want to

keep it in my personal package

and i added also a little test as a

reminder sorry a little message as a

reminder that you know

this code is not automatically copied to

the clipboard

instead i have to copy it manually from

from the from the console

so let's test this function if i wanted

to test this function

the output is quite complex is is

something that you know it's like

it's very difficult it has multiple

lines and also

if i try to put that into a into a

vector

when i print x it's new actually the

output is is

concatenated to the to this to the

screen

but it cannot be stored anywhere right

so it's very difficult to text

to test in the traditional way with a

function like

expect equal so instead all you do is

you call the function

expect snapshot

and it takes the function that you want

to test or the expression that you want

to test

in this case is s i that's all that

there is

and now i just run my tests i'm going to

run them with ctrl shift t

that gives me this drop now this is a

pop-up menu that i can

confirm to to save the file that will

run my tests

and here underneath you will see that my

test passed

and you will also see

that well actually because i i did run

this test before but the first time that

you

you run a spec snapshot it will

save a file that looks exactly like what

i printed here on the console and if you

run it interactively

you get the output that will be stored

in the file

so the file where is that file well that

file is saved here

under the folder tests

here tests test that

right and snaps there you can see

that simd actually the html i think

i did it that's that's a mistake for me

so that's

the the output that was saved i test

that

and the beauty of it is that you know as

being an

md file i could look at this file on a

pull request directly without having to

run the code

or i mean on github directly you can go

to that file on github

and that's what it looks like so you

already see the output that that

function produces to the console but

instead

instead you see it on the on the on a

file

right so that's that's the the magic of

snapshot testing

and uh also notice that the little

message that is printed

is also appears here as precisely marked

as a message

so expect nutshot captures the output

printed to the console also captures

messages

and also captures errors so let me show

you before i pass the baton to

monica so if i wanted to show an error

for example i could do

you know this function does not take an

argument it has no arguments

so if i did pass an argument this should

fail so i can i can capture that in my

snapshot test

saying error equals true i can tell

snapshot testing that i would like to

see

on that file that is stored as output i

would like to see

what error message i get so now that i

run the the tests again

you can see that i get a little warning

here

um

it's telling me that the output has been

saved

right and if i run it again

i don't get anything at all

right if i changed the and the last

thing i'm going to show if i change the

implementation say that i remove

the message the output of the function

is going to be different

and therefore the snapshot test will

tell me

that something has changed and i will

get an error

an error that is quite informative

because immediately i can see

in what way the fire has changed and i

can see that before the output had

this message here and now the message is

no longer there

so if i want to say okay that was an

intentional

um change all you need to do is to

follow the instructions here you just

run this code

here because the test will continue to

fail if i keep running tests

the test will continue to fail so if you

want to

update your snapshot to say hey this i

know that this is failing

because it's an intentional change all

you need to do is to just run the

function

snapshot accept with the name of the

file that contains that snapshot so by

running that

you update the snapshot and now if you

run your tests

again then the test will pass because it

will have

acknowledged that your change is

intentional

okay so that's the gist of what

structure testing is

um it's kind of a little bit

intermediate i would say not maybe

advanced but intermediate um

skill so maybe if there's more questions

we can discuss that later or cover

it in more depth in a in a kind of

testing in the while in another meetup

but for now i would like you to hear a

little bit uh from monica

and go ahead monica

can i share my screen yes

i know i stopped my screen now

let's see if we can see your screen

yes right so um

so we use snapshot testing together with

mauro in the

plotting package that we are developing

now uh but more for data sets and then

we thought that maybe it would be also

cool to

test the output visuals so basically

like really

see if the

how the plot looked like in the past

does it still look

the same and one of the ways to

do it is using this expect

snapshot file so basically what you do

is you

instead of having this snapshot in this

snapshot format you actually save

a png file and

then during the test

a new png file is created

with like your current function

implementation

and it's compared to the one that you

have stored

as a snapshot um

and it seems it seemed like a perfect

idea

because then we could check when

um if the output changed and you also

get like a

user interface where you can actually

see what change like it will show you

the differences between the snapshot and

your current version

however in practice it didn't

really work for us or we didn't we

decide not to implement it because

actually this safe to png

is very um

what do you think it's sensitive to the

machine that you do it on so basically

mauro created this png snapshot

and then i run the test on my machine

and then i got

differences which were just

related to the fact that it was created

using

a linux and i have a mac and

somehow the png was rendered straight

slightly differently

so i guess it's

useful sometimes

but it wasn't useful in our

um case because of this

fact that it would basically give errors

all the time and also

since most of the time when we are

developing this package i am actually

changing something in the code

so the output will be different so then

also i would have

the errors all the time just because i

changed the output

um so yeah in the end we didn't use it

and i think cj has some better

idea for this kind of testing that he's

going to present to us

um yeah i'm not sure if it's better but

it addresses some of those issues

um and i don't have any like thing

prepared to show you which might have

been a mistake but

i tried to explain this so yeah like

just as malika

explains when you test the images for

png

the snapshot testing is testing like a

binary comparison so it's

exact one-to-one replication of that

image

and what happens is when you generate

the png

in r and save it to a file

there's a lot of things that can go

can make things just slightly different

and sometimes it's so small that you

can't even see it like a human can't

even

see the difference so it could be just

one pixel is different

and that will change the thing and this

can happen because for instance

um a lot of things are outside of like

the domain or the normal domain of r so

it can be

operating system versions it can be the

version of the font

you have yeah there's

a lot of it can be whether or not you

have anti-aliasing or what degree of

anti-aliasing

the thing is doing to create the png so

there's lots of

very my new differences that can be

caused by

many many differences between operating

systems thought system anti-aliasing

system the png

exporting system um so yeah you end up

with this situation which

monica and marvel experienced so one

alternative to that that i've

used before is by testing

the fsvg output of

a plotting object which is convenient

because

really any object in r that's ready to

be plotted

primarily a base r plot or a gg plot

plot

when you tell it to save as a png what

it's doing is taking

a vector representation of that graphic

and

converting it into a png if you

instead convert that object into an svg

it has a more let's call it a more

stable output

because it's not affected by like the

fonts

so i don't know if you've ever looked at

an svg but it's kind of like html which

probably all of you know a little bit

about each little

part is separated by specify what it

should be

so it may say give me a red

triangle that's you know 70

whatever pixels tall and 80 pixels

whatever and then i can say write this

text this is my title in

a certain font with a certain color but

it doesn't actually render

that font so the advantage of this is

it's a little bit

less sensitive to those really minute

changes

um which means that you can test that

for the most part the image is the same

but you're not testing like the actual

precise implementation of your specific

machine

and that means that you can test it more

broadly so a lot of people that are

using snapchat tests on pngs they end up

testing this

just locally on their own machine but it

never gets added to

continuous integration it's not

something that someone else would run

on their machine if they're like hacking

on it as well it's maybe

only the maintainer of a package or

something that's like this would run it

but

if you're doing the svg thing it's

probably practical to have this

in ci testing or having another

developer use it

because yeah it's not as sensitive to

those mining changes between the

machines the other advantage is when you

see the change it's not just two images

next to each other

or even a more fancy like slider where

you can see the difference but it's

actually

in text so an svg is

a description of a vector graphic in

text so

when you see when there is a difference

when it does notice the difference

it will tell you just like in a normal

like github diff

or merge conflict or something it will

show you precisely the lines that change

and precisely the values that change

which can make it a lot easier to

determine

you know what went wrong because if you

see that um

the font is now set to gray instead of

black that's like really obvious

where to go to fix that but if you look

at the output and you're like

i don't know if that looks maybe the

font's a little bit lighter but i'm not

really sure then it might be much more

difficult to figure out

why that is the case because maybe it's

anti-aliasing maybe it's color

so um yeah i think that's a good enough

explanation but

i know it's a bit confusing it took me a

long time to figure out what the

difference was so

happy to answer questions about that as

well thanks a lot

both of you um i may be able to show

um a little bit of you know like

snapshotting the object underlying

ggblots but

but best to break very check first what

questions and comments there are

or experiences or frustrations in this

group go ahead

yes that was i should also say really

quickly um

there's a package called v differ v d i

f

f r i think that um manages

this svg style testing and it's

integrated with test that and blah blah

so it's

a lot easier you could hypothetically do

this yourself like instead of exporting

a png exported svg

but if you different package makes it a

lot easier

any other comments or questions over

there

i have a question about the snapshotting

testing specifically the one

the type that you were showing tomorrow

so it's not super clear to me

that's taking a snapshot of just

whatever is

returned to the council or is it

you know like if i had a function that

created a file like created a directory

drop some files in it then like

sent me a warning and then also um x

then returned an object with

like the function could do a lot of

things so it wasn't clear

because of the way it was written it

kind of gives the impression that

everything that function does

it captures which i guess is

hypothetically possible if it was using

like

with r or something like that to have

this completely

uh contained environment but but then it

kind of seemed like it was only looking

at the council

yeah alex i see a hands up would you

like to respond to cj or do you have a

question for the queue

uh i think related to cj's thing is

um it wouldn't necessarily

show be able to operate on a whole

directory

but um if you wanted

to have the whatever you're doing like

throw stuff into a directory and then

zip it up

it could do a literal comparison on the

zips

i'll say what point yeah basically as

far as i understand

i'm relatively new to the implementation

in test.3

but i have been using previous versions

of test that with

something similar as far as i understand

it

snapshot testing in test.3

the expect snapshot interface is like a

broad interface that captures everything

standard output which is

whatever it brings to the console errors

messages and warnings

and errors with the caveat like i mean

you have to explicitly say that you want

that you expect an error with everywhere

equals true so whatever your function

if you figure out a way for your

function to

to look into that directory and you know

output something like you know a list of

files in that directory

the list of paths then i guess

that you know they you could use

snapshot testing in that way because it

could be output to the console right

uh and then the the idea that alex

mentioned is also a good one because

there are other other flavors of

snaps expect snapshot like for example

expect snapshot

f file is is a one case and it has

different

i mean there is an argument that you can

say what kind of serialization you want

and it could be it could attempt to

capture anything from a json

file to an rda file

depending on basically how much

readability you expect

or how much reproducibility you expect

on the on the json side of the spectrum

you know the file is very readable

because you can you can't just look at

the text

uh but then you know there has to be a

conversion between that called object

and that json representation and then on

the other side of the serialization

spectrum you have this

fully binary files that are stored as

whatever object it is and that's

probably the suggestion that you know

kind of

not exactly that i think but close to

the suggestion of alex made

and then you know you won't be able to

kind of read it but if there is a

difference

it will tell you well there is a

difference here then it's kind of up to

you to figure it out

alex go ahead yeah

um i just want to put in one more

use case for this kind of testing

and that is this can be useful

if you don't know how to

test your stuff yet but

you have like uh i have some inputs

and then there is this giant monolithic

function that spits out something at the

end and there's

a whole lot of stuff that happens in

between that i haven't tested yet

but i want to make sure that at all

points

the overall process still works you just

test to make sure that the thing that it

spits out at the end is still the same

i totally agree and that's the use case

that i use the most

especially when you're doing refactoring

i also wanted to correct myself when i

said

expect expect snapshot file

with serialization options i was wrong i

it is expect

snapshot value i think from the top of

my head

um so yeah i think um yeah let's see if

you know that i was thinking of running

one session of testing in the while

and i was thinking of using showing

precisely the use case

that alex is mentioning because it's the

most prominent in our code where we

start with something that is already

implemented

and we want to refactor it so the very

first i mean it's easy to implement just

one test

that captures just about everything

and then kind of go from there and if

something you know if you change

something that

you know changes the the

observable behavior of that function

that

test should kind of capture it and

so that's how i use it a lot and but

that would probably

spark a bunch of questions so i wanted

to dedicate maybe a full a full meet up

to that

maybe with alex we could work together

on that one that'd be great

do we have any other questions or

comments or follow up from what we

discussed

so

yeah i was just far say um yeah you

mentioned already that

expect snapshot file which that's what i

originally tried to use doing this svg

testing until i started

using the v different microgas is easier

i don't have to do this myself um

but the expect shop not snapshot if it

captures like the entire environment

of that thing running that's actually

pretty cool for you know some of the

reasons that's already been said

i had this impression that it only

captured some

kind like the capsule output or

something but if it captures the entire

environment it's actually pretty useful

um i don't think it captures the

environment itself unless you

save it somehow as uh i mean if you

capture the environment and you save it

as a

as a an environment um

maybe you could store it but uh

yeah i mean you got i mean it's output

messages warnings and errors as far as i

as i know um but we could we could

explore that a little bit actually in my

experience

capturing the environment was brittle

you know i i did it maybe i'm gonna show

in

in the use case that i was mentioning

you can capture you know if you do

str and a ggplot2 object

you get the list right of the underlying

ggplot2 object

and one of the elements of that list

is plot underscore env which is

which is run specific every time that

the plot is generated

it creates a new environment where the

plot is kind of created

so to make a snapshot test

that was useful um of a gg plot 2 i had

to know i had to

nullify that one element so i got rid of

the

of the kind of random environment that

is created every time that this runs

everything else i could use in the

snapshot but that one thing

i had to assign new to to kind of kill

it right

but i'm hoping to show that um in a full

meetup

later so if it wasn't clear

so for now i think we ran out of time um

i'm sure a lot of people was like what

is this but those who have been using

tests i hope that will find this useful

or someone that hasn't yet

in the future maybe reviewing this this

meetup thanks everyone for joining see

you next time
