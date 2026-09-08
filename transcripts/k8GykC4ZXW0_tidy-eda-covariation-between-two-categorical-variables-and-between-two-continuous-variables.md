---
type: Video Transcript
title: "Tidy EDA: Covariation between two categorical variables and between two continuous variables"
description: "and this is again the ds inquirer about  exploring data with a tidy verse we are  in the previous last session of this  series and of the year hopefully today  "
resource: "https://www.youtube.com/watch?v=k8GykC4ZXW0"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=k8GykC4ZXW0"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

and this is again the ds inquirer about

exploring data with a tidy verse we are

in the previous last session of this

series and of the year hopefully today

we'll cover all that i was planning to

cover and next time hopefully the same

so we thought we would end the year with

um this series and then next year we can

we're gonna start with something else

so the goal today is to cover the

co-variation between two categorical

variables

and then also between two continuous

variables

last time we did it between one

categorical variable and one continuous

variable

so this is the last section the last

part of of the section about covariation

so

the specific objectives are going to be

well exploring the covariation between

two categorical variables to begin with

but then there is some nuance to how you

can do things so we're going to be

learning how to

explore that variation through counting

observations but then mapping them in

two different ways one using arya as one

way to understand the amount of

observations of one variable versus the

other

and then also we're gonna be doing it

with color fill

uh then

in when it comes to

exploring the covariation between two

continuous variables there is also a few

little things that we're going to be um

doing uh one issue that we're going to

face quickly is the idea of overplotting

where a lot of points fall on top of

each other and then the patterns are not

so easy to see so we're going to try

solve that overplotting problem with two

approaches one is using transparency and

the other one using bs we're gonna be

using two kinds of beans by the way

um

and then we're gonna be using a strategy

by which we transform a

continuous variable into a categorical

variable which we did last time of

previous last time

uh but then using a box plot to to

explore the relationship between those

two continuous variables so the trick is

in this particular case if a box plot is

a good way to explore these two

continuous variables then is to make one

discrete one you know make it

categorical and then explore it

using the techniques that we learned

last time

and then we're going to be also learning

a trick to map the width of the box plot

to the number of observations that we

have for each category so let's jump to

our studio

today i'm going to be working with this

degraded code

to slow myself down a little bit and you

know make the session a little bit more

um give it a feel of a live session

of a live coding session so the first

thing we're going to be doing as usual

is you know attaching the tigers package

that comes with a bunch of packages

including the two that

are the star of this series which is the

deep player for

for example doing things like counting

or selecting variables or filtering rows

and also the package ggplot2 which is

the start of the show really because is

what is allowing us to visually explore

those relationships

so the very first section is the two

categorical variables uh and for that uh

we're going to be focusing on these two

uh

columns from the data set diamonds color

and cat color is self-explanatory it's

just a color but

it has an order and d color

is the best and the j color is the worst

and then we're going to be also using

the cut

variable which encodes the quality of

the diamonds and it is also an unordered

variable and that goes from fair all the

way to ideal

so uh just as a little refresher you

know if we want to select those two

variables only we would use the verb

select from the player so we do

you take the diamonds data set and then

we

select

the variables

that we just discussed so we select

color

in this case it's spelled like this and

cut

so we run that and here at the bottom we

can see that we have these two variables

and they have values like e i j or

ideal premium good which you know means

that they are categorical so there is an

order in them and we're going to be

exploring it in a bit

so the

first thing we can do

is

use genome

count which automatically maps

the

amount of the number of

observations to the area of

points so let's let's see how that works

so as a little refresher of ggplot2

remember we always call ggplot with the

dataset first

last time we started using this

abbreviated form where instead of saying

data equals

diamond we just say diamonds

and hopefully today we're gonna you know

see a bit more of the value of being so

succinct so that we highlight the

arguments that are more interesting so

we are going to take here the diamonds

data set uh and wrap it here in ggplot2

which is the way we always the hg plot

and we're going to be using this very

cool function gm count which you know

takes as usual an aesthetic

representation of the data

that needs to be mapped so we're going

to be using

the two

variables that we are working with today

color and cut so if we do that

what we get here is this

x

let me move this a little bit to the

left so we have this x

[Music]

axis where we have the color as we

specify so this is an implicit way of

saying x equals color but we omit that

because it's always

the first argument to the a e s function

and then on the y axis the cat so which

is the same thing the same y equals but

again because x and y are always first

and second argument to the call to aes

we just omit it so that if there is any

new argument is that one is going to be

kind of highlighted

so

in this case what we see is that the

number of observations for for example

the intersection between fair and d

is is not so great compared to for

example ideal and d so the covariation

here is observed as like a specific

pattern in in specific values of

the x and the y um

you know

axises axis so here we do see

some pattern here where uh you know we

have

more like you have bigger areas so

bigger points here towards the top left

so that suggests that you know this this

relationship between um you know the cut

as you go from fair to ideal and you

know it gets you know we have more

uh ideal diamonds on that they have a

color you know like

say you know j

f and d that we have from i and j

right so this this um

instead of all

bigger and smaller points being all

mixed we see some pattern there and that

is what it's telling us about that

covariation

so that's not the only way we can

uh represent that co-variation between

two categorical variables one really

nice way is to use instead of area and

use color fill

because our eyes as humans are not all

that good at comparing areas apparently

they're a little better at comparing

colors so

what we what i'm going to be doing here

is i'm going to count

first manually using d plier and the

number of

observations um

in the color and cut columns so let me

highlight just this code to see what it

prints uh so i'm doing a little bit what

ggblot does internally i'm doing it now

by hand so i'm taking the diamonds data

set

and then i'm counting the number of

observations

by color and cut so what we get is a new

column called n

right and that is the one that tells us

how many observations we have for

example fair diamonds of color d

uh and you know if you know if we go

back to the plot that we plotted before

we could see that for example fair

diamonds of color d is is a relatively

small number compared to say ideal of

color d so that that is confirmed here

too right so

ideal diamonds of color d are in you

know close to 3 000 observations that's

why the area here is bigger but now that

we have that end that's what we care

about we can use a different function

not gem count but instead john tile

that takes again color in the x-axis

we're going to map cut to the y-axis but

now we use a third dimension

before when we use geom count the third

dimension was automatically the area of

the point but now we are using geom tile

and we already have created that

variable n

that allows us to map it to the end uh

so to map it to the field

color of a plot of entire plot so i'm

going to say here n

right to map the third dimension to this

third variable that we created before so

um

note that

here i'm going from a pipe

right that is what we use for you know

just about any package in the tidy verse

but now i'm going to you know once we

have done that created that data set

then we feed that data set to ggplot but

then once we are in the ggplot

world then we combine things with a plus

symbol no longer with a pipe so i

clarified that because that's a very

common uh mistake

and the reason why there is two

different ways of composing things is

just historical for gg block 2 package

was created before the tigers existed

the pipe wasn't uh

conceived at the time

it became very popular later but by the

time the pipe appeared in the show

ggplot2 was already used by so many

people that was uh you know you know it

just is what it is so we just need to

remember to to move from the pipe to the

plus symbol to combine things here

so this is the kind of plot that we get

um

the you can see you know darker colors

you know in this area similar to what we

saw before you know that pattern of of

specific areas having more observations

the same thing we see here which is fair

enough because it's the same the same

plot

okay so now we are going to move to two

continuous variables but maybe before i

do that i we could intermingle a section

of questions or comments if you do have

some so i'm going to go back to your

faces here and ask you

prompt you to ask questions or make

comments if you have them

nothing now

okay this was fairly brief so what we

just achieved is

explore we achieve exploring two

categorical variables we use the very

magic function gm count for uh from

ggplot2 and that does everything itself

it counts the observations and

represents them as changes in the area

of points and then the second thing we

did is we counted things manually with

the player with you know function count

and then we passed that to a different

function of tg plot 2 which was geom

tile

and we used the the

mapping field

um to represent that third variable the

n so like the number of observations so

now we move on to two continuous

variables as opposed to two categorical

variables and now the var the columns

that we're going to be exploring is

carat which is the weight of the diamond

and price so it's quite

quite um intuitive right to think that

you know bigger diamonds weight more and

are more expensive so we do expect

a strong covariation between their

weight and the price so let's do a

little select

to just have a quick look at karat and

price

what we want to see is confirm that

these two columns here are numbers so

more specifically you know karat is a

double you know that means that it can

take

fractions of a number and price is an

integer meaning that it just takes round

numbers but it looks just because the

price was set that way and there is no

reason why the price has to be an

integer i could not be continuous so we

would take these two as just continuous

variables anyway

so the

first thing you would do generally when

you want to explore the covariation

between between two continuous variables

is is to use a scatter plot and remember

that in ggplot2 is class

scatter plot you achieve with the

function g on point so as we did before

you know a geo we do a gg plot diamonds

to pass that data set to the plot and

then you know we call the

geom point uh with the x and y's uh

columns mapped to carat and price so if

we run that i'm pressing ctrl alt and

c to run this specific chunk we see that

um scatter plot and we see that strong

relationship between you know higher

numbers of karat also have higher prices

right so that that covariation is very

clear it is what we expected but one

thing we know true is that the the

points here in this section uh overlap

with each other so any pattern that

might be in there is totally hidden

by the overlapping so we need to fix

that so when we have very very big data

sets scatter plots become

problematic so one way in which it's

common to start trying to solve the

problem with with a transparency so if

we made the points say a 10 percent

transparent as opposed to 100

transparent which is the default then we

would probably get a little more insight

into what's going on in here so let's do

that

the argument that does that is alpha so

know how alpha is outside the call to

aes so aes is something that we map to

data alpha is something that we fix in

the plot so we're gonna use for every

single point the exact same transparency

just one ten

one tenth of the opacity that the full

opacity that it could have so with that

we see now um you know the plan is kind

of a little clearer but still when you

have a lot a lot a lot of data

sometimes not even that you know cuts it

not even that no that you know gets you

what you want

so we're going to be exploring um a

couple of other strategies we're going

to be using instead of points instead of

a scatter plot we're going to be using

also the color

density and sorry the yeah the color

density in in beans we're gonna be using

um

beans in two dimensions before when we

use

box plots we were you know creating

uh transforming a continuous variable

into a categorical variable uh in beans

that had only one dimension so now we're

gonna be doing it in two dimensions and

also we're gonna be working with this a

little smaller data set that uh you know

takes only the rows where karat is

smaller than three i think that uh in

the book they did that not because the

the dataset becomes really smaller only

40 observations are actually lost with

that filter but i think it is because

remember last time we were working with

some um

outliers and missing values and stuff

like that so i think that with this

with this filter what we do is we get

rid of those problems that would

probably distract us

from from the patterns and things that

we want to explore today so i think from

now on we're going to be using this

smaller data set

okay i acknowledge that we are 20

fast

um i'm aware of that so maybe jacob

remind me in five minutes again because

we still have a bit of cover here and i

don't think we have accumulated enough

questions or comments thanks

so then

there is a very interesting function in

ggplot2 that is called

gm

bin

[Music]

bin 2d so these two are the same thing i

tried it uh compare them with identical

and they are identical so let's let's

use this one because it's the one that

is um

documented um in the in the health file

and uh

the other one is just um an alias um so

this is the the new geometric

representation apart from that nothing

really changed so if you see the plot

that we used before it was also you know

like a call to g on point with the

aesthetics uh mapped to karat and price

for x and y so we do the same thing now

and now we're not going to be using the

alpha argument because the

representation itself um

is different and allows us to see

the number of observations in a

different way so this kind of helps with

overloading a little bit so we don't

need a yes

as you can see now

what before was

um uh you know where we see a lot of

observations we see we see darker colors

right and where we see less observations

sorry where we see a lot of observations

we see lighter colors in this case like

lighter blue means 6 000 observations

around here and the darker ones are a

few fewer observations so that's one way

to solve the

overplotting

problem and it looks quite pretty by the

way there is another

flavor of it same thing but now the

function is called

geom hex

and what it does is the same thing but

now with hexagons as opposed to

two squares

which is really nice too uh same thing

now we can see we can even see holes in

the data set where there is no

observations and you know that that's

another way in which we can solve our

plotting so know that uh

for that function gm hex to work you

need to install the

hex bin

package you can do that with

install.packages

if if you don't have it you know the

plot will be you know kind of empty and

i'm pretty sure you will get some kind

of message

um

and now

the

the there is something else we could do

as well and now we move to that part

where we create

a

discrete variable so a categorical

variable out of a continuous variable so

i'm going to do this by hand first to

show you

pretty much what's going on and then i'm

going to show you a call to a very magic

function from the ggplot2 package but i

think that you know seeing how this

breaks down can help understand what we

are trying to achieve here so we start

with the smaller data set um it is just

you know a data set with a bunch of

columns and a bunch of rows uh what i'm

gonna do is i'm going to use the

function mutate from the plier to add a

new column i'm going to call it 2 which

is um you know it's based on karat but

now we're going to make a discrete

version of it so we're going to cut the

that continuous variables in bins that

are as wide as 0.1 uh you know in in the

scale of that variable so that's the

first thing we do so we mutate the data

set

and add that new column called cat2

but because you know here we print too

many columns it's kind of hard to see so

i wanted to show what we achieved by

zooming into the data set specifically

selecting um here in in line two to five

selecting the column's price cut and got

a two so the the interesting thing here

is to compare you know what carat was

before it was just you know a real

number 0.23 for example falls into a

specific beam

0.15 to 0 to 25 and the same thing

happens for these three

observations so what we are doing now is

grouping

continuous observations into bins that

are discrete right so that's what we are

achieving um also for clarity i added a

call here to arrange to see uh the data

set um

in a specific order in the sending order

of carat and also to show you know that

you know how different beans in this

case you know there is a bin here that

contains three observations and then

there is a bean here that contains a lot

more so that's that's what we achieved

we are converting this uh carrot

variable that was continuous into a

discrete variable that is correct too

so

now we do have that kind of two

variables

thank you five more minutes

hopefully we're gonna get there and now

we have that cut out two variable and uh

what we can do is instead of plotting

carat so actually let's let's do that

like this so if i do i know because yeah

yeah the data set is different but i

could plot karat just as s and get the

plot

that is not what we want but now if we

plot

that because there is there is no

grouping there so all the variables all

the values go in one bin but if we if we

use the card two that has different

beans because we just created it then

this is what we get so this is closer to

what ggbl2 would give you it could give

you actually something that is a little

nicer

so uh

the the way you do that with ggplot2

directly is um

directly with a new argument called

group

so

if you um

you know here we're using not only the x

and the y arguments to the aes function

but also we are telling you how to group

the data and we are going to be grouping

it in the same way that we created the

current two variable before so here we

are inside the chip plot2 the ggplot the

geom box plot call we are grouping um

the karat um

the carat variable so we are saying not

only you know what goes to the x axis

what goes to the y axis but also how to

group the values so this is uh now same

thing except that the the axis x is a

little nicer and just to refresh you

know what the work would look like if we

don't use any grouping whatsoever you

know what we saw before if we don't

group data what you get is just a single

box that's not what we want we want

something like this

right so now i'm very close to the end

so i'm gonna

go fast here uh we're gonna

try

uh recover information about okay how

many observations do we have in each of

these

bins we see you know we have a sense for

the spread in the in price but we don't

have a sense for how many observations

are represented in each of those boxes

so we can do that with a bar with

argument to ggplot so if you say so the

default is of course false which you

know intuitively you would you know so

that that gives us the same plot that we

had before but if we say true

then we have a different story so now we

have very thin

uh boxes for you know

beans that have very few observations

and and wider boxes for beings that have

more observations but that's still not

maybe kind of clear enough there is

another alternative we can use

and is to do the same that we did before

but instead of using the cut with we're

going to use the function cut

number

and now what we are doing is we are

forcing each box to have the exact same

number of observations but then that box

may spread over different values of

karat so the result of that is that you

you have been

like this so this box has about 20

observations same as this one same as

this one but the spread horizontally in

karat

here is a lot bigger than here so and

now we can see a relationship between

karat and price

that is a lot more clear that it was

before before we couldn't we couldn't

see that and now we see that as the

boxes go to the right and the top they

become bigger so that's the co-variation

that we wanted to explore

so with that we cover everything i

wanted to show today uh

with very little time for questions and

comments but hopefully

um

that will get us

somewhere useful so go ahead if you have

any question or comment

to add

i think for me thank you

thanks very much

with this we finished co-variation there

is only one more thing we're going to be

covering next week which is the idea of

models and how to extract patterns and

then we're going to take a break for the

holidays and then come back next year

with a new series that we're going to be

voting through slack thanks everyone see

you next time

thank you bye
