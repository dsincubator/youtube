---
type: Video Transcript
title: "Tidy EDA: Covariation between one categorical variable and one continuous variable"
description: "this is again the ds equator on the  series about exploring data with the  tidy verse  and today we're going to be talking  about covariation that is the idea o"
resource: "https://www.youtube.com/watch?v=WBmLuUV5BEE"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=WBmLuUV5BEE"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

this is again the ds equator on the

series about exploring data with the

tidy verse

and today we're going to be talking

about covariation that is the idea of

two variables

that vary in a related way

or the values of two variables that

change in a related way

today we're going to focus on one

categorical variable and one continuous

variable

because

depending on the type of variables that

you have

you will need different tools

to explore that relationship

in addition to the main focus of the

meetup which is at the conceptual level

exploring that co-variation we also be

exploring a couple of tricks to make the

code a little bit more readable

it is maybe it's very subjective and and

maybe you will

you know

not agree with the approaches i'm

showing here but um it's just one way to

to show some tricks about ggplot2 and so

beyond the conceptual level you know to

open a conversation at the technical

level and the coding

style that you might want to consider

so the objectives are then to explore

the visual

uh relationship uh or spread the

relationship between one categorical

variable and one continuous variable uh

visually and and then because we have

been using gt plot

2 already quite a bit uh there are a

couple of arguments that are repeated

time and again

and after some time they become kind of

noise so we can remove those

explicit calls to the arguments and

still not degrade

the understanding of the code and by

removing that noise maybe uh now you're

left with code that is clear and that

highlights more obviously the the pieces

that you are interested in highlighting

as someone who writes the code so that's

one of the techniques i'm going to be

discussing today

some people prefer to you always use

explicit arguments but

i don't sometimes

i prefer to not do that precisely so

that what remains written in code is

more obvious

and the noise is away

and then i'm going to be also showing

how you can save ggplot to elements in

variables and maybe in another meetup

we're going to explore the idea of doing

the same in functions but pretty much

anything integer 2 can be stored in in

some kind of r object and reused as you

want

um so let's go to the materials of today

we are as usual we are going to be using

the tidy verse i already mentioned a

little bit of an overview of what that

is is that tendency of two or more

variables to vary together in a related

way

and visualizing the relationship is one

very powerful tool to explore that

relationship

and as i said before how you do that

depends on the type of variables that

you have and today we're going to be

talking about one categorical and one

continuous bio

so the data set we've been working with

is again

the start of the show today we're gonna

we're gonna be using another dataset too

for a comparison but uh mostly the

diamonds data set that comes from the

ggplot2 package and here are two um

variables one is cut which is a

categorical variable you can see that it

can take only a few

limited number of values for example

ideal premium good so there is no clear

continuous way to represent the values

um of that of that variable

uh however there is an order uh implicit

in in those values and we're going to be

talking about that a bit later

then the other variable is is continuous

here is an integer so it's not like

truthfully continuous it could also be

converted into a

like a real number something that can

take

decimal digits but because the price in

this particular data set does not have

um

decimals then you know an integer

integer is just fine and we're gonna

just take it as a continuous variable so

this is the relationship we're gonna be

exploring mostly cut versus price so how

the price

varies with the quality of the diamond

because cut that is what that variable

holds

so um let me go back to the um to my r

studio here because uh sometimes i speak

a bit too fast and the idea of degrading

the code that i'm showing helps me slow

down a little bit so we start as usual

loading the tibers because

that is the the set of packages that we

are going to be

using to explore data today

so um here we are running tideverse

library television on the console

and then the very first

thing that you saw on

my my notes was the this analytical way

to have a quick glimpse to the data in

particular selecting the cut and price

columns

using deep flyer the select function

comes from d player

you might remember

then there is

this is the explicit way in which we

have let me show you here on the right

actually maybe that is something better

to be shown here

so we have been so far using explicit

arguments like data equals diamonds or

mapping

equals blah blah blah so that data and

that mapping are arguments that are

repeated time and again in every single

ggplot2 plot and thus after a while you

you know your eyes learn to kind of

remove them so you just focus on

diamonds but then if you if you are able

to do that then why why do you even have

data and mapping you know it becomes so

common that becomes noise and you can

write the same thing a bit more

compactly like this

removing the data equal explicit call to

the argument and uh and here you know we

are removing the mapping equal

the code does exactly the same just that

you know there is a bit less noise and

it is more clear what's important here

what's important is that we are using

the diamonds data set and the columns

price and cut

so note that

the

this time

we are not using

um the variable y because the frequency

plot

what does you know

it automatically creates a y variable

that comes from counting the number of

observations of the values in the

variable x in this case price so what we

get here is

that frequency plot showing

for

every different kind of cuts for every

different value of cut

a different color so that's why we get a

reference here to the right

and that's a very common feature of

ggplot2

and that is very very very nice that you

can map

different um

unique values of one variable and to

different colors or two different

you know densities for example you know

different opacities

or or a number of options that you have

to represent the data very compactly in

the single uh coordinate system x and y

you can see

many um many

relationships so this is uh the count of

uh the different um

um

the count of different prices that we

see

for uh different and qualities of

diamonds right

um

but not that this is not very

informative why because

there is a huge difference in the amount

of observations that we have for

diamonds of different qualities for

example at the very top here we have in

yellow the

um

diamonds of ideal cat

and we have you know observations of the

ordinance of you know six thousands for

example that's the you know around the

maximum value in the count that we get

from there but then for fair diamonds we

have a lot fewer observations so it is

kind of hard to spot the relationship

between these curves remember that the

whole goal today is to explore how these

two variables

relate to each other uh cut and price so

we can't see that in this plot very well

because the for example the

the fair diamonds are so compressed in

the lower part of the curve so instead

we should probably do

was cj suggested in the last meet up

which is this idea of standardizing

every curve so that the area behind the

curve is always one so if we do that um

then we get a plot that looks a lot

different and that makes the

relationship makes the comparison a lot

easier so uh how you do that well the

the trick here is to not use just the

count but instead

use as y so the the y variable of the

frequency

polygon

uh by default it was count right so when

we did not use an explicit call to the y

argument in the plot above let me show

you one here right here we didn't use fi

so automatically what we got is the

count of observations for the different

prices by cut

but now that we are calling

why we can choose

what we what kind of statistical

representation of statistical summary of

data we want to create so there is this

weird syntax dot dot density uh it's

where it is what it is that's how

ggplot2

understands what kind of statistics you

want for the y variable so dot dot

density you know it's something that you

know you learn just from from real

documentation and will

plot not the default count but instead

the density so that that is a lot more

useful here and we can see how the trend

is is very similar for just about every

single uh diamond of every different for

different cuts but note there is a weird

pattern here so this is the kind of

thing that we would be looking for right

so this is why i felt like this is

useful because you know now we see okay

there is a very general trend that all

all um diamonds have a similar trend but

then there is something odd going on

here that we are going to try understand

in a moment but let me go back to your

pretty faces i hear a hand

or something anyone has a comment

lovely thank you ant

so um

the surprising fact that we can learn

from thinking about

about this uh hump here in the curve so

know that these are fair um diamonds

which are the ones that are

of lower quality it's kind of odd that

the the scale here the the reference is

going kind of in there

um i don't know it's going like from

fair to ideal as opposed to ideal to

fair now i know if that makes sense or

not but

the point is that fair is is worse than

good good is worse than uh very good

very good is worse than opinion and

premiums is worse than ideal and and

here

we see that um

there are you know at this level of

price we have

um diamonds of fair quality that are

more expensive than um

than other diamonds of better quality so

that's the surprising fact that we have

um fair uh the lowest quality diamonds

seem to have the highest average

price so that is another fact something

that deserves exploring i haven't gave

it a lot of thought but i know that in

the book

uh that inspires this series and there

is a section for questions and the

questions not you not you to explore the

relationship between every single

variable

against cut

and that will

lead you to identify there is some other

variable that explains the price better

than quality

so

if you are interested in trying to

understand why this is the case you know

i do not have the answer but i think you

could go to the book and read the

questions for for this chapter and and

do what the question suggests and maybe

you will find out what's going on uh

here

so this was one way of representing the

relationship between a continuous

variable and a categorical variable but

there is other ways a very good way is a

box plot and i really like this

explanation this visual explanation of a

box plot

because

look how you know we see you know what

the

actual values in the distribution could

be how they would be mapped on um you

know on a on a line but then how

those values would be

represented if instead of just plotting

them on a single line in one dimension

we plotted them in two dimensions as a

histogram so we see like a lot more

values here so the count is is higher so

a histogram would show you know this

this taller bars so this is a histogram

but now flipped 90 degrees right

and then uh a

more summarized way to represent the

same thing would be a box plot right so

i really like this explanation so

basically a box plot is is just a little

box that goes from

the 75

fifth

percentile

mark of the distribution to the 25th

percentile it shows very prominently the

5th 50th percentile this basically the

medium values are very promptly

very prominently displayed

right so this is the median

and then the box gives us an idea of the

bulk of the distribution where it is in

the interquartile range

and then we have these these long

whiskers going up

and down

all the way to the last point that is

not considered an outlier so this gives

us an idea of the spread of the

distribution and that is not an outlier

and then we have because our liars are

so odd you know we want them and and

because they are few that's kind of the

definition of an outlier too

it's the few values that go beyond the

most common pattern then it's easy to

plot them independently so here we see

two outliers that go beyond the 1.5

times the interquant quartile range

which is the definition of an outlier as

per the definition of box plot

so beautiful represent such a summer

statistical summary in a visual way

that's what a blogspot box plot is if we

if we know how to interpret it and if

you ever forget then you can go come

back to this figure

because i find it like super sustained

and clear

so how you plot a box plot um

well there is the function geom box plot

remember that geoms were geometric

representations of the data so usually

every single time you have a function

called geo underscore something

and in this case what we want is a box

plot so that's what we get so the same

two variables diamonds and

is the data set and the same two

variables cut on price but this time not

using a frequency

plot

but instead a box plot

notice something that is different from

the plots before before the call to rs

or the mappings and

many times we called it inside the gm

function and it's

both functions

any geom or the ggplot function they

both have that argument called mappings

so meaning that you know you can do this

call to is

whatever you want at the

digiplot function or inside the geo what

is the difference well the difference is

that by defining the

aesthetic representation

of the data in the call to ggplot

then that applies to every single layer

so every single geom that you might use

so in this case you are using just one

but you know you could

uh overlay one

layer on top of the other you could call

geom

something multiple multiple times

and in each one you could create a

different mapping for x and y variables

so in this case because you are calling

it at the very top level in the in the

level of the g plot function that

representation will apply by default in

all other layers unless you overwrite it

at the level of a specific layer and

maybe that was a bit of a mouthful don't

worry too much for now for now maybe

it's enough to know that you can call it

whatever you want at the level of gigi

plot 2 or

the name of gg plot or at the level of

the geo

and i know that we are 20 past i think

we don't have too much more to cover um

three minutes perfect so

let's uh let's push through because i'm

pretty sure i can finish this in five

minutes and leave five minutes for

comments and questions so note that uh

something very interesting is happening

in this box plot um

so first the the

this box plot seems to confirm the all

observation that we made before that

fair diamond seemed to have a mean price

that is higher than the price of any

other um

diamond of diamonds of better quality so

that's that's weird um

that's why you know very quickly a

visual representation can point us in an

interesting direction asking for you

know clarification

to the data

so that's one thing that we can get from

here and then one other observation i'd

like you to do is that

how the plot

automatically ordered the diamonds in in

the sensible way from fair to ideal in

another manner right fair good very good

premium idea and that is

because

cat is

in the data set already represented as a

specific type of variable which is

called a factor and it is ordered so it

is a very special flavor of

a variable

so if we if we call

the variable

the function distinct coming from d

player

and then we pull the var the values of

cat we can see that um

cat

has these levels it can be ideal premium

good very good and fair and the levels

are ordered here you see that no fair

good very good premium ideal and have

another no being ideal the one that is

greater than anything else right

but now what would be the world

look like if we work with a not order

variable so for that we don't have a

good example in the diamonds data set so

we're gonna resource to the mpg data set

that also comes from ggplot2

so here if we do the same thing so say

there is a variable called class

so if we pull the variable the values of

class uh you will see that

it's it's not order it's just a bunch of

strings right that don't have any

implicit order

and and now i'm gonna show you uh one

other trick

thank you

so i'm gonna show you this this one

other trick that is the idea that you

can store in a variable just about

almost every object

of ggplot2 you can store it in

environment so remember that um

either inside ggplot or inside the gm

functions you can you know you have to

call the mappings so you have to say you

know to call the function a e s with you

know values such as um you know x and y

and what variables you want in x and y

so here i'm doing it outside the gg.2

function to show you that you can do

that if you want it and i do it just for

clarity because i want to show

this as a very

obvious element that is going to change

between this plot and i'm going to show

you now on the one that i'm going to

show you later so i'm storing the class

and

highway

variables

or the aesthetic representation of those

variables in an object that i call class

underscore highway

and then if i just print that object

here you can see

what it looks like

nice nice thanks a lot and

thanks a lot i think uh i think we're

good we're gonna go for a couple more

minutes and then uh open the room for

questions and comments

so if i print the class underscore

highway object and

see that it is um

you know it prints in a in a relatively

clear way so that it's just a

representation of what that those

variables how those values are related

but it's not doing anything it's not

throwing an error and it's not plotting

anything it just holds information then

it's kind of metadata right so then we

can pass that variable inside the geom

function and it will work just as if we

had called the aes function inside the

gm box plot function anyway

so um

this is to show you that if we plot the

class and highway

so highways is by the way so the mpg

data set contains information about cars

as the names here in the x-axis suggests

and what hwy holds is the miles per

gallon that you get when you use that

car on a highway

so note that if we do a box plot with

those two variables there is no clear

order here everything you know there is

no kind of clear pattern and you know

some boxes are below other side at the

top blah blah blah blah blah right so we

might want to order this uh a little bit

so that it is easier to see what's the

pattern and one way to do that is to use

the function reorder of the d player

package that's that's beautiful so that

function takes the

variable that you want to order so in

this case it's class so this these are

the classes of cars that are kind of all

messed up so we would like to order them

and how would you like to order them

well we can order them by the values of

a highway using the mean the median

of the value of a highway so the median

miles per gallon that you get for each

class so this is what this this call to

reorder is doing

so

so now my aesthetic does not just pass

the class variable to the x-axis instead

passes the reorder class

reordered by the

highway variable or by the median values

of the highway variable so that's why i

call this class reorder by median

highway so if we now pass that to ggplot

um

to the gm box plot then you can see that

the plot

you know post the same thing but in a

northern way so it's kind of clear to

see for example that you know like a

pickup car gives you less miles per

gallon when you drive that car on a

highway than a mid-sized car or a

compact car so it's very very very clear

and you can see just by reading the

x-axis x-axis you know which car you you

might want to you know

want to buy if you want to save fuel for

example you could go here to the right

right it's easier to spot

um

and then when the names are long this is

not the case because these all these

names fit in the x

axis but when the names are long you

know they start to overlap so they were

for example you know super compact may

overlap with compat but and then what

you can do is just flip the plot with

core flip remember last meter we use the

chord cartesian function

i think to change the limits of the y or

the x axis

and this time we are using a friend of

that function that is called chord flit

to flip the coordinate system so that

now what was

you know the y is not no longer vertical

but it's horizontal and the x is no

longer horizontal but it's vertical

so yeah that's all i wanted to show you

today that leaves us a few minutes for

comments and questions discussions so if

you have some

go ahead

i hope you like the background music

today

so we have cj now i'm not sure if he was

in the section where we showed cj we

covered the

density plot

i think

ah

yeah that was um

was

i guess the comment was offset by one

meetup i didn't know we would cover this

today but you know comes at a great a

great time because it's almost like an

um a compliment to your question or to

your comments

suggestion last time really nice because

i didn't have in my head

kind of the formal definition of what a

density plot is and now i have it so the

idea of

it is the count but standardized so that

the area under the core is always one

and i think that that's

very

very clear

b

like a b

ah b and then swarm

nice

i say

yeah absolutely

thanks i see

i hear a bingy

need to go okay cool

i guess that's all we have for today

thanks for joining and see you next time
