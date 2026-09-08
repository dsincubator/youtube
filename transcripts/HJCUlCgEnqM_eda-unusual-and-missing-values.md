---
type: Video Transcript
title: "EDA: Unusual and missing values"
description: "Typical values the most common values in the and we didn't have time to cover what i would like to cover today unusual values and missing values so..."
resource: "https://www.youtube.com/watch?v=HJCUlCgEnqM"
tags: ["ds-incubator", "ggplot2", "r-packages", "eda"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T04:02:00Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=HJCUlCgEnqM"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2021-11-30T00:00:00Z"
    usage_count: 13
usage_window: { from: "2021-11-30T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Transcript

this is again the dsync waiter on the

series about exploring data with the

tidy verse

and this session is going to continue

what we started last

meet up not last week because i was on a

vacation

we started with the idea of typical very

typical values how to explore typical

values the most common values in the

data set

and we didn't have time to cover what i

would like to cover today unusual values

outliers

and missing values so the objectives

today um are this

to explore outliers analytically and

also

through a plot in which we're gonna zoom

in to notice those outliers

also we're gonna

think about when it's correct or not to

uh transform missing values sorry to

transform um

outliers into missing values and having

reflected and considered for example

that the reason was a data entry error

then we are going i'm going to convert

them

into missing values so we're going to

transform errors into missing values

and then we're going to convert those

missing values into a logical variable

so that we can do something like sum the

number of errors that we have the number

of missing values that we have in the

data set so those are the three

main objectives of the day

uh from the consent well conceptual

point of view as usual

the

meetup notes are

in the associated repository at ds dot

tidy eda for

exploratory data analysis

and the folder number five unusual and

missing values is the one that contains

the notes that i'm going to be kind of

covering today

so i'm going to move this to my right

and uh

today um because i'm like

an additional goal is to also so beyond

the concepts that we're sharing on the

side as a side effect we're also kind of

learning how to use the tight verse so

uh to slow myself down a little bit when

i speak

today the examples are degraded so i'm

going to be typing some things as i

speak

so we're going to be using the

television of course so

uh

i'm going to run library titles

so that i have all the packages attached

the ones we're going to be using today

uh as we did last time are digiplot2 and

the player but the tigers come with a

bunch of other packages

and in particular the ggplot2 package

comes with a data set called diamonds

which contains a bunch of

rows

and i would like to kind of focus on the

variables that we're going to be

exploring today so before i

complete this blank space here um i

hear on the background a hand up

go ahead who was that one

did i hear your hand up

maybe not cj just off the court uh okay

maybe that was it

thank you

so you know if we have a data set and we

want to focus on a bunch of columns in

the sky in this case the columns price

carrack

x y and z we can use the function select

as we

learned a few meetups ago and now you

know we have the same data set except

that we are focusing just on those

columns and so one thing that might be

worth refreshing is what those colors

columns are so i'm going to do question

mark diamonds to get the health file of

that data set and the developers have

been kind enough to define

the different columns weirdly enough

it's not compulsory to define

the

column names and and tell the user what

they are but in this particular case we

have that information

so

just as a refresher the cutout is the

weight of a diamond

the price is

self-explanatory and then x y and z are

different dimensions so basic basically

the length

in millimeters of different dimensions

of the diamond so those are the

variables that will be more relevant for

this particular meetup so this

this

call here to select those columns gives

us a little bit of an overview of the

kind of data we'll be working with today

so okay let's get started by exploring

outliers and before that we're going to

define them as they are defined in the

book

basically the idea of an outlier is

something that is unusual in the data

before we explore usual data now we are

focusing on the unusual data on the

complement of that

so the idea is that you know there is a

bunch of data that creates a pattern

somehow and then there is this few

observations that are not fitting into

that pattern that is the outlier

and it is possible that

they are data entry errors not always of

course and that's something that we have

to think about

but in the case of today actually we are

going to

explore them and realize that they are

indeed data entry errors so how how do

we

do

that

so first of all um i wanted to show you

uh one plot that gives us a hint about

the presence of outliers although that

hint is kind of suitable and even

surprising in a way so we are going to

be using that diamonds data set

remember that

the ggplot function has a first argument

called data so we can call that

explicitly

like this or because we are so used to

it we may just remove it

and call it implicitly so we're going to

be exploring the

diamonds data set with this plot in

particular we want to do the geometric

representation of the data that we want

in this particular case is a histogram

that will be useful to explore um data

on on the sides of the distribution so

let me show you what that is

in a moment um the geom histogram and

all geom functions have a mapping

argument which also you can you can not

call explicitly if you want

and it takes a function called aes for

aesthetic

and that function will um kind of take

arguments so that we can tell ggplot2 um

what mappings we want between the data

and the plot so in this case the x-axis

and this is a little bit confusing sorry

but it is what it is so the x-axis of

the plot is going to take values from

the y variable of the data set so x

equals y in this case

and in histograms we learned that there

is a very important argument that is

optional but usually

important to explore which is the

bandwidth the being with so being

with

uh

usually you know you come to so if you

don't use bing with ggplot2 will give

you something but then by exploring the

data uh you will probably realize that

there is one particular being width that

is the most useful in helping you answer

the specific question that you have in

your head at that time

so here is the plot and the one

observation that we can make is that you

know we see a bunch of uh

data here

towards the left of the plot and

it's surprising that there is so much

white space here to the right

actually it's not white space there are

some data there but that is exactly what

i was saying before that that's a

suitable hint that

the fact that the the

x-axis

is so uh

you know empty in a way like so much

white space on the right is giving us a

hint that maybe there there are some

data that we don't see just because the

plot is not at a good scale to see those

data uh think that you know we're

counting in the order of 30 000 units of

of this variable right and

observations of this variable

and

here to the right we may have you know

one or two

um values that are not very common and

thus they don't show up at the scale so

the one thing we you know that's the

first hint for an outlier in this

particular

um

plot

there is of course other ways to explore

um outliers this is one

so one thing we could do is try zoom in

so that we hopefully see what's going on

in there

and this is surprising because digiplot2

in general adjusts the axis

automatically kind of to fit the data uh

in in a useful way so that's why what's

going on there so let's zoom in

so there is a couple of ways to zoom in

uh the the one

that preserves the data

is this one is calling basically we are

going to be using the same function that

we used before g plot then jumped

histogram but now we are going to adjust

the plot by adding a new layer where we

explicitly set

the coordinates

of the x axis so the function in gg plot

2 is called chord cartesian

and and it takes a couple of arguments

one to regul to control and the the

values of the limit on the y

axis and another one to control the

limits on the x axis so in this

particular case we want the ones on the

y limit so the argument is called y limb

and it takes a vector actually of of two

values one is going to be the minimum

value that we want to see in the plot in

this case we choose

zero

and the second one is uh the maximum

value that you want to see in the plot

so for the y

axis the limits that i want to set are

the minimum 0 and the maximum 50. so

note that the default here

is plotting 30 000 so we're gonna zoom

in into only the you know the y-axis up

to 50. so let's do just that

so let's run this code

and now you can see that

the the top of the plot is kind of

cropped right but because we have zoomed

in into the lower part of the plot now

we can see

that uh you know around 60 around like

30 something and around like close to

zero we have some observation it's just

that there are so few less than 10 that

when we scale the floor to show us 30

000 observations um then

30 you know the count up to 30 000 then

those values

disappear pretty much right to our eyes

so that's the first then uh way to

observe uh outliers uh via this um

histogram

so that's what we did

but note that the plot looks cropped at

the top because

and that's a good thing because it's

suggesting that the data continues on

top of the plot this is uh

different to this other way in which i'm

going to show you now

to

zooming into a plot and it's important

to know the difference because the

second way

is lossy basically loses data

because it zooms in by by cropping the

data set itself before it creates the

plot in the previous case and the one

that i showed you before the one that we

are looking at on the screen we first

plot without cropping any data

so data remains the same that doesn't

remain the same it's just the plot that

changes but in this second case we are

going to be using another function that

is called while limb

and it's i think it's an important thing

to kind of know because sometimes

for two reasons one because sometimes it

is what you want you just drop

everything that is outside those

boundaries but also sometimes because

it's it's kind of misleading uh argument

you know more intuitively so i think

that while lim is a more intuitive name

for what we want to do

and you if you know if you

scroll through the reference section of

the ggplot2 package on its website you

might find this functionality okay

that's what i need and then think that

that's the only option you have but then

be frustrated because you are losing

data

and how do you know that you're losing

data well all and not only because you

know the

you would probably expect more data here

at the top that you don't see but also

because you get a warning so ggplot2

will not drop something without giving

you

an informative warning so it's telling

us that

some missing values have been removed

that will you know probably

be sound a little puzzling but then with

a little thinking and exploration you

will probably realize what's going on

so okay so while in

uh is one way a lossy way and then core

cartesian is another more conservative

way okay

so

now let's explore those outliers

analytically maybe i think one thing

that could be useful is to record the

previous plot here on the screen

because

basically what i want to focus is now on

this big chunk of data in the center and

compare it with the data

lower than this and greater than this so

basically values are less than around

three

and greater than around 20.

so that's what we're going to be

exploring in a moment

okay so

let's go

here so the data set we are working with

is what i'm going to be completing here

is still the full

diamonds data set

uh but this time i'm going to be

filtering

only

the rows where the variable y has

values is either smaller than 3 or

greater than 20. so that is what this

line 64 is is expressing right so let's

filter let's pick only rows where y

is less than 3 or

more than 20.

and then to get a better view of what we

have just accomplished we're gonna focus

just on price x y and z columns and then

we are going to arrange the data set by

the values of

y in increasing order so i am going to

assign that all of that to a new object

called unusual so then if we call the

object unusual we can have a quick look

at what the data looks like

and there is the first hint

of the hint that we need to realize that

the values

are data entry errors why well because

notice how for example the price of

these diamonds

is significant right so this diamond is

cost

costing you know for 5139

dollars but its dimensions are zero like

zero x coy zero z so the three

dimensions of the diamond are all zero

and so it's an inexisting diamond that

is costing us a lot of money so

obviously that's that's a mistake

and the same thing for all other values

here so

and then the other hint here we have

values

in the last two rows but notice how

these are huge i see how this diamond

for example this last one has one

dimension that is

58.9 almost 59 almost 60 inches

in one dimension that is like a gigantic

diamond and although it is expensive

it's probably not as expensive as we

would think for such a huge diamond i

mean it's in the order of the tens of

thousands of dollars and not in the

other of you know hundreds or of

thousands of dollars so

this little analytical

summary that we've done of our data or

subset of data tells us that

this is just data entry errors and we

would probably want to just remove those

specific

observations of

variable y i'm making because that's

what we're exploring right now the

variable y and but obviously there is

errors in other variables too but just

focusing on the variable y we can tell

now that that was a data entry error and

we could replace those zeros and that

say you know 31.8 and 58.9 we could

replace them with an a's just missing

values but then the row remains so the

rest of the observations that we measure

on the properties of that diamond are

still there it's just that specific

column that is now kind of nullified by

by transforming it into missing values

so that's what we're going to be doing

next

so let's

move there

um so the way in which you would

approach this issue then is you know you

repeat your analysis with and without

outliers uh to notice if there is an

effect so if removing the layers that

has no effect in your results whatever

your question your research question is

then it's kind of okay

the

uh to remove them by you know

transforming them into missing values

and you don't have to give it too much

explanation

but if removing the misses missing

values do does have an effect then i

mean if you're gonna remove them then

you have to have very good reason you

have to justify it somehow like in your

paper or you know or any analytical

report

so okay so now that we know the

heuristics you know when to remove them

and when not to let's see how to go

about that

jackson i see that i'm approaching the

20 past um

maybe i'm going to make a pose

uh now before we transform

the incorrect values into missing values

and

hopefully we have some more time to push

through

this rest of the content so let's go

back to your pretty faces is there any

question so far

or comments

apart from the

noises on the background

can you actually hear with that

background noise i know it's very

annoying but

is that okay you can still hear my voice

okay cool

all right let's push

a little more maybe jackson remind me

when we are five minutes from the half

hour

so now what we want to do is uh okay

create a data set that um

filters

the values in this range in the middle

so the values that are

common and excluding all the variables

the the values are not common the ones

that are unusual uh so the way we can do

that is many ways but one way is to use

the function between which the player

knows about it belongs to that package

so we say okay take the variable y and

pick the variables between in this case

3 and 20 which you know just by eye

bubbling the the plot are more or less

the the values that

the the useful data so we just keep we

just pick

those uh rows the rows that where the

variable y take the var the values

between three and twenty and all the

rest we just remove so with that we're

going to be creating this uh diamonds

true data set

and we're going to be working uh for the

rest i think of the lesson with diamonds

two or other flavors of it

so that is

how you would probably remove the entire

rose but that is not a very good idea

often because

uh you know because one variable has

you know incorrect data it doesn't mean

that other variables have incorrect data

so in this case when i show you the

variables x y and z we noticed that you

know some mistakes were in some cases in

the three of them but there are many

other variables which hold

information that may be valid so like

removing the entire row like in this way

may not be useful also because if you do

that with all the missing data sometimes

you will end up with no data at all or

with very

little data for the analysis that you

need to do so instead we are going to

not just drop the rows we are going to

just transform those specific values

into an ace so this is how we could do

it so we take the diamonds data set and

then we mutate the variable y

and we're going to be using

um

if fails

if

else so it fails is this function

that

takes a condition in this case the

condition that we noticed before

if the variable y is less than 3 or more

than 20

then transform those specific values in

missing values and if it's not true so

basically the var the values are outside

that range the ones that are in the

middle of this distribution then just

keep y so i'm going to say that one one

more time because it didn't come out

very eloquently so if

the various the values of y are less

than 3 or more than 20 then replace

those values with an a

if not then just leave y as it is as y

that's what this this call is doing and

so we are re we are overwriting the

variable y with this new

um

you know basically this new variable

that is overwriting it it so we're going

to run that code and now our data set

diamonds 2

that has not dropped dropped the column

the

entire rows it just has transformed the

incorrect data into missing data

okay so now

we're gonna plot

that

uh in a different way we're gonna be uh

using that diamonds two data set that we

have just created that contains those

missing values that we injected where

the data was incorrect and we are gonna

be using in this case x scatter plot as

opposed to a histogram that we did used

before we're going to just plot the two

different dimensions of

diamonds x and y

and so the way we do a scatter plot is

with a function g on point because the

scatter plot is just a bunch of little

points so let's run that

and see what this looks like

and notice how we get a warning that

says remove nine rows containing missing

values i don't know if you pay attention

but before that unusual data set

contained nine rows so those are the the

nine rows that we have now transformed

into missing values in the variable

specifically in the variable y

so that's why

you know we get this warning from

ggplot2 when we create that scatter plot

that those nine values that contain

missing data have been dropped so now

the plot does not show those missing

values

okay we have five more minutes to go and

i think i could probably push through

these last two chunks of code that i

want to show

but before i do that i'm going to make

another pause here and ask if we have

questions

or comments

maybe i have a more general question to

you using mutate in combination with it

else

i was just reading today that there is

also a case when function that does a

similar thing what are like the

differences between which one is

great question yes yeah there is a

couple of ways in which you can do

something like that and

if else is so the two things the two

functions do the same thing but the

syntax is different

if else um is useful when usually you

want to create

um when you want to consider just one

condition so in this case you know there

is only one condition the condition or

or two combined so the you know values

of y are less than three or greater than

20 then do this or that and that's kind

of simple but then if you want to say

okay if the values are you know less

than this or greater than that do this

and if they are in between this and that

then do that and if they are that and

that other thing then do this other

thing so when there is too too many

conditions if else doesn't scale up

because you kind of end up nesting

conditions inside other conditions and

your head kind of just gets gets totally

lost it's super hard to read that code

and case when the the magic of it is

nothing else than syntactic sugar so the

way you express the conditions scales up

really well because you express them not

in a kind of nested way but in a kind of

stacked way so

i'm not going to cover it now because i

wouldn't have time but if you go to the

health file of case 1 you will see how

you know the conditions are always

expressed on the right hand side of a

tilde symbol and then on the right hand

side you say what you want and then you

can add as many conditions as you want

infinite and and and you can still read

it because each time you focus on one

line

and each time you understand that line

and that line alone outside its context

and then you move to the next one so

just from the readability perspective

case 1 is a lot more helpful so then why

would you not use it always well because

if else is more compact so when the

condition is simple then case 1 feels

like an overkill

all right so the last little bit

welcome that's that was a really cool

question the last little bit is this

idea okay now we have a data set that

contains missing values

and and now we want to convert them into

a logical variable because we might want

to do something like count them so it's

not easy to manipulate missing data as

you saw before you know when you want to

plot for example the data set those

missing values were automatically

dropped by ggplot2 so how could you then

you know use ggplot2 to plot something

that contains the missing values okay

the trick is to transform

the missing values into a logical

logical variable basically you you ask a

question right to the data like is the

data missing yes or no right so now you

convert the missing data into a yes or

no basically

so to be more correct it could be the

missing data will be um

true because the question i'm asking

here is if it is missing

and the way i rephrase that if with the

name is error so because we identify

that the missing data has a meaning here

i think it's more informative

to say okay it's not just missing it is

an error we already thought about that

and we captured that thought into the

name of of the column a new column that

is called is error so now i'm going to

take the data set diamonds 2 and i'm

going to mutate it to add a new column

that i'm going to call is error and it's

just going to have

a true where the values of y are an a so

this this function is an a which allows

us to do just that if the value is an a

then returns true if it's not returns

false so that way now we have this

diamonds three data set

that

has truth or falses in the as values of

the variable is error so with that we

can now create a

bar plot similar to

a histogram except that we now um

um you know

don't want the function to create the

count inside the count you know we just

want to see the absolute numbers that

the variable contains so

here what we're to do is we're going to

pass to the x-axis the values of this

error

right and this is going to be our um

histogram our histo our um

bar plot it has a problem here though a

visual

visualization problem which is the same

that we had before now the number of

observations that are not errors is so

large so basically the column that

belongs to false is so large in the

order of you know like 50 000 or close

that the the few nine observations that

are errors are so small that they don't

show up in the plot so we now know the

trick we are going to reuse it here

so first you know let's let's remember

how many observations we have that have

errors or not we can use the function

count from the player that will will you

know we'll count you know truths as ones

and falses as zeros so it's gonna sum

you know the numbers of truth and gives

us 9 and it's going to sum the numbers

of falses and it's going to give us

53 000 or so so we need to zoom in

into that plot maybe with a trick that

we learned before with chords

cartesian

and we're going to just focus on the

first hundred um

um you know

yeah we're gonna look we focus on the on

the 100 units on the

y-axis but with x-limb arguments so

doing that and now uh let's see you know

because now nine missing values or nine

error data entry errors are

more comparable to you know these 100

observations now we can actually see

them they were all the time there it's

just that we couldn't see them before

because of a scale problem

okay so that covers the lesson today i'm

a little over time but maybe if people

want to stick around and have some

questions please go ahead and make your

questions or comments now

maybe to wrap up what i'm gonna do is

i'm gonna go back to the

objectives so what we have covered today

is unusual values and missing values we

first explored outliers the idea of

unusual variables values both uniquely

analytically and

by zooming into a plot then we transform

we decided you know by by thinking

uh we decided that those um values were

data entry errors so we transform that

into missing values just in those values

without dropping the entire row because

that could lead us to having no data at

all or too too little data to do

something meaningful and then we also

wanted to manipulate plot to count

whatever

those missing values so we couldn't do

it as they were we transformed them into

a logical a logical variable where uh

true was the value uh of the the

variable is error and false when there

are uh whether the data was valid and we

used that to create our plot

that would be the way to wrap up the

session any last departing comment or

note

or question

okay then

i thank you very much and see you next

time

thank you bye
