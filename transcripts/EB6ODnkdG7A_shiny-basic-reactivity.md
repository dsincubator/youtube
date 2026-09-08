---
type: Video Transcript
title: "Shiny: Basic reactivity"
description: "today the ds inquirer continues on the  series about  billy's shiny apps and we're going to be  covering today  a couple of topics that we didn't have  time to "
resource: "https://www.youtube.com/watch?v=EB6ODnkdG7A"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=EB6ODnkdG7A"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

today the ds inquirer continues on the

series about

billy's shiny apps and we're going to be

covering today

a couple of topics that we didn't have

time to cover

last time it's still within the big

topic of

reactive expressions and reactivity but

we did not talk about the reactive graph

which is important because it helps us

understand

how the inputs and outputs connect in an

app

so the the focus

of uh today is precisely to understand

how

inputs and outputs are connected using a

reactive graph as a tool

to understand that also to learn how to

build that reactive that directive graph

with a package called rec react log

which does that for us and uh and

explore

uh briefly um a use an example that

hardly

presents in the book mastering shiny uh

explore that example um to understand

why reactive expressions are very

important

uh this is you know following up from

the series so if

you haven't been in these meetups before

you will feel very lost i think

and this is also kind of probably one of

the last meetups where we talk

about theoretical ideas and hopefully

we'll start soon showing more some fun

stuff

but let's start with this little uh

shiny app that you

um if you were here you should probably

be familiar with

it is a very small app that has two

um components like an input

where the user inputs the name and an

output

that the application gives a greeting so

basically we have these two

things a name as an input and the output

is a greeting

and we connect them here the server

function is the one that connects

inputs and outputs so basically what we

do is we paste the string hello

with the name that the user gave in the

input

and we assigned that to

the greeting output so that it's shown

on the

app so let's see what the app looks like

here it is so if i say mauro i give my

name

and there we go so the application

greets me as hello model so one input

one output and what we're going to be

talking about now with this app as an

example

is how we can think about the connection

between that input and that output

using this tool called the the

reactive graph

there is this little sketch here

where i have the input name that has an

arrow that points to the right and then

we have this greeting that represents

the output that has this other symbol

that kind of

the input fits in the output so that is

the basic

idea of of the you know of how to

represent

inputs and outputs and the connections

between them using

the reactive graph but that's not very

fancy let me show you something a bit

more exciting

for that we're going to be using the

package react log which

if you don't have it you'll need to

install and all you need to do is to

run the function red log react log

enable and that will allow you to

uh do we have the app running here in

the background yes so if you have

the app running you can press ctrl and

f3

and that will pop up this

new window uh that shows the elements

of your app and their connections and

so here on the right you see uh output

dollar sign greeting

so the output that we defined

and on the left we see input dollar sign

name so the connection between them

is represented by this arrow this is

trivial of course but you know

soon we're going to be seeing a more

complex app and

the react direct graph will

help us understand which parts of the

app

will recompute when some input changes

and with parts of the app will not

recompute so that we save computation

time so let me rewind because

one really nice feature of this tool is

that you can see

how the app progresses since

since the app is initialized so the app

you know starts

the server function creates this

instance for this the user that is using

the app

and what is the state well the state is

that the inputs are already defined this

is something that i'm not sure if it's

like a glitch or what but usually

i was expecting the inputs to be

colored in green because they already

they find the array ready

to go and that's how hardly represents

them in his book so i don't know exactly

why

they are coloring in white here but so

the first stage is you know the inputs

are defined but then nothing else

is you know being computed or nothing

else

is happening really in the app and then

the next step

is that shiny picks any output

you can think of it as picking it

randomly it looks like there is

something to it but

it hardly talks about the selection of

the first output

randomly and this super simple app with

only one output so

it is the only one that can be chosen

but if there were many

you know one output anything any one

would be selected

and then in the server function there is

a definition about which input

relates to that output right or which

we're going to see soon which reactive

expression is needed to compute

that output so the output is something

that we need to compute

but now it is being calculated and the

server function tells shiny that um

the output cannot be calculated unless

we get the input so if i click here

and advance the app what happens is that

that input and now that's color green

but that input now has a connection to

that output so let's go one step

below so this arrow did not exist until

um until the output needed to be

calculated and only then

is when the server function um you know

tells shiny okay

what you need is input name then you

know this

connection is created and it is also

cached

so uh that now shiny knows that that is

the thing

that um the only thing that needs to

change in the case of this application

oh sorry if that input changes

and then the output will change but if

that input

does not change then nothing needs to be

recomputed right and that's the

one of the beautiful things that the

reactive

paradigm has that laziness that um

saves computation time so let's advance

the application so now

the input is available but it hasn't

been

still used so if we advance the app now

that

output has used the input has made the

calculations that the application

defined

and now we have like a fully uh

fledged application so i'm going to

click

forward but i expect nothing else to

change

model okay so here it looks like uh what

is showing is that the stage where i

add my name so it's showing the whole

session of the application uh i think i

then corrected my name

with mauro and then you can see how this

is moving so basically it's repeating

the loop

from uh everything um

in the initial state to a fully fledged

application

and then when i uh change the input

then the output gets invalidated and is

again recomputed with a new input okay

so that was a little bit of a

overview of the reactive graph

and let's close this up for now and

move on to a little more complex

application

to see how the graph looks like now so

let's move on to

i already have defined a ui above i'm

gonna be using the same ui

but now the server has a little bit of a

difference let me show you

the both both servers so you can see so

notice how

the the line that calls paste

line 14 here is directly in the render

text

function and now here in line 26

the variation that i'm presenting now is

one

in which instead of coding paste

directly on the red and the render text

function

i extract it into a reactive in this

particular application this is

not necessary at all

but it is just for demonstrations

purposes so what i want to show

now is that between the input and the

output we now have

this new node that is created

by a reactive expression and when the

application is

trivial like this one it is an overkill

absolutely

but when the application is bigger

having those intermediate intermediate

nodes uh does help save computation time

and i'll show that in a in a more

complex example after this one

so let me then run a server here

and show that oh as an anticipation of

what you're gonna see

here is my manually developed um

direct graph so what we expect to see is

an

input to the left that connects to

no longer directly to the output but

instead to an intermediate reactive

expression

that has properties of both inputs and

outputs because notice how it can

fit the input on the left and also it

can

be fitted into the output to the right

i hear some noise do we have any

questions here or comments

oh no problems in any case in a few

minutes we're gonna

get to the comments uh section

so the way you read this uh relationship

between

inputs and outputs let's start here at

the top is

simpler what we what this

uh the direct graph that you saw first

is telling us is that greeting will need

to be recomputed whenever

the input name is changed uh and the way

to

express that in in shiny jargon could be

as follows could be greeting has a

reactive

dependency on name

so translating that to this new

reactive graph where there is an

intermediate string the way i think

i would phrase it then is that greeting

has a reactive dependency on string

and then string has a reactive

dependency on name

so let's see what that app looks like

and let's run the reactive

graph so i'm running now the new server

refining server

running the app and now i need to find

it here in the background

here it is and to use the react log

package again what i do is i press ctrl

f3

and here i have it on the back end

and and here it is so before we have

this only two nodes and now we have

three we have this one in the middle

i'm not sure what this theme here

actually means

and one thing that's that you might

notice

is that the names output greeting and

the name

input name are kind of nice names and

meaningful

but then that the reactive expression

does not have a name doesn't have a

beautiful label instead it has just the

code

so that is hard to read and we can

improve it and the way we can improve it

is by

let me stop the app the way we can

improve it is by

using an argument that the reactive

function has that is called label

label there you go

we can call it string

so now uh the

reactive log the reactive glove should

be

a little nicer and more closely

reflect the application that

we have here that more closely reflect

the names that we are using

in the server function so here is the

app uh

it behaves just as the other ones that

we saw before but

the underlying graph is different so

let's see what it looks like

and here it is so we have our output to

the right our input to the left and the

middle we have this

reactive expression right which is just

code that has been extracted

outside of the render text

call so now it is time to actually

demonstrate why this is important

because so far this is just an overkill

as we don't really need

this reactive this string

reactive here and but to show that

in a more meaningful way we need a

way more complex app so instead of

confusing you with code that i already

copied from the book what i'm going to

do is directly show you the app

from hadley's book here here here

there you go so the app we're going to

be working with now

is this one here

it's still refreshing there you go

so what you see here

are two distributions here on the left

distribution one

in the middle distribution two uh the

the two distribution have parameters

uh a thousand a thousand but we can

change that let's say 500

here to the left and we leave a thousand

to the other one

and then we can compare how the two

distributions

uh vary uh using two

um summaries one visual summary

that is this plot that you see here uh

from which you know of which we can also

tweak

a little bit with with some parameters

here like the bandwidth for example we

could do it

0.2 for example

and then we also see this summary in the

form of a p-value

basically comparing these two

distributions

um analytically right so the underlying

code is not

important what is important is the

underlying graph

so that is exactly what i want to show

you um

and before i show you that and let's

analyze a little bit

this snippet that does come from that

app

so for example to calculate that t-test

that i showed

in the app and the app what it does is

first it it computes a value

x1 based on a random um

you know pull of um of values

that you know depend on the inputs that

the user gives and the same thing for x2

and then it uses those values to compute

the t-test and to see if those two

distributions are

significantly different or not but

for you as a human you would know that

okay if i if i

change say n1 only

which was remembering one is you know

this

parameter here right you would expect

only to recompute x1

you would expect not to need to

recompute x2

however depending on how you craft your

app

that might not be the case so shiny is

not clever enough to know to

know which suit piece of an output

needs to be recomputed and instead if

any input changes

in an output the whole output will

change so let me show you the underlying

code of the app

and here it is so for the t-test for

example

notice how the output t-test the one

that will eventually um be shown

in the app in that little square to the

right so to be

in order to see these numbers here right

what we have is this underlying code we

are defining t

test there and notice how both

x1 and x2 are within

say again 20 minutes now ah thanks a lot

so we should be wrapping up now

so not how this both x1 and x2 both of

them are defined

uh inside the call that is assigned to

output so

shiny will detect that x1 changes

and will recompute both x1 and x2

because both of them are inside this

output

so shiny again and last time i say

recomputes everything within one output

so the solution to this problem if you

want to save computations

and ask shiny to only compute v um

or recompute only the outputs that uh

depend on the specific inputs that

change and not in others

then the solution is to extract this

code outside of the output

as a reactive so this is what hadley

does

here soon but before i show you

the result uh let me show you this

underlying graph so the application

as i showed it before produces this very

complex

this very complex graph where pretty

much

every input and one mean 1 and sd1

are connected to every output also if

look how you know

for example t-test will change

when n1 changes but it also will change

when n2 changes

and so on and so forth so if you follow

these lines you will see

that this application is very

inefficient in that it will be

recomputed

just about every time the user tweaks

any control

so the solution for that is reactive

expressions

so now look how this code changed

notice how the definition of x1 and x2

no longer is inside the calls

um that are assigned to the outputs

but instead are outside the outputs

inside the server function but outside

the outputs right and then

we can use x1 as you could normally do

with every reactive expression

where you call them as if they were a

function right

so x1 is used here and x1 is used here

but if only for example n1

changes then only x1 will recompute it

but not x2 so now if i show you the

graph

of this it looks

a lot cleaner now a t-test

has a dependency erected dependency of

x1 and

on x2 but in turn x1 has only a

dependency on everything that relates to

the

one inputs right and one mean one and

sd1 and not a dependency

on everything that is uh related to the

two inputs right so notice how this

small

change this small refactoring in

the server function has a huge impact

on what is computed when the users

play with the app and this is a point

that

alex did one or two meetups ago

and hopefully now we have a more visual

grasp of the meaning of that comment

i think now it's a pretty good place to

stop

for questions and comments

because the only thing i have on the

list here

is to show basically the steps

that the app does from being totally

fresh to being um fully fledged

but we already kind of walked through

that so i stopped here

and asked do we have questions or

comments

no okay maybe i'm gonna do a little bit

of um

the briefing like a summary of um

like yeah i would like to kind of to

phrase the takeaway of this

um so we've been covering reactive

um reactive expressions

uh and the server function in general uh

the reactive graph

allows us to understand how inputs and

outputs are connected

the connection is defined in the server

function

but the reactive graph allows us to

understand

that connect those connections and maybe

by visually exploring those connections

realize

how our app should be refactored so if

we do see

a very complex graph it might be a sign

that there might be a better way to

write that code to refactor that code to

minimize

the number of unnecessary computations

so you would like the app to compute

only things that need to be computed to

be as lazy as possible

so that you know the the time the user

spends

uh waiting for the application to react

is is the minimum

um i acknowledge that you know reactive

the reactive paradigm of programming is

is new to most of us uh

it's very different to um the imperative

programming paradigm that we are more

used

to when we write scripts and therefore

in the beginning it takes a while to

grasp

and with these meetups i'm not hoping

that you would

have you know fully understand

understood um

you know reactivity or reactive

expressions but at least know

um that they might be useful

if particularly if you find that your

app is is laggy is

slow you might need to think about

how to use cleverly reactive expressions

to avoid recomputing things that don't

necessarily need to be

recomputed

that is about the end do we have any

final

thoughts or comments

um i guess i have one um

which is having

stuff be reactive is very cool and

makes your dashboard look very neat

and slick but if your computations

are inherently slow and you know for

some reason it's like you're moving

around a lot of data and no amount of

optimizing your reactive graph is going

to help

the function run faster

consider using not reactive

components because uh

it's one of those things where if a

process is inherently slow

letting the user feel like they have

control

over when it runs is better than

if they it keeps trying to update as

they change things and then it just

feels slow um it's one of those

counter-intuitive user experience

outcomes

that even if the entire process takes

longer

it doesn't feel as slow for them

interesting here i take totally your

word because uh

my experience using shiny building shiny

apps is minimal

so this is more like a theoretical but

what i understand from

from reading is that uh so if i'm using

uh say that you know i need to compute

some kind of data

and i have a data set i need to do

computations and get like an analysis

an intermediate data set right that

results from computation

my understanding is that if i wrap that

in a reactive uh that

that will be recomputed only when it

needs to

and not not just randomly um

did i get anything kind of wrong there

what do you think is going on

so that your spot on there i guess my

point of caution here is like

say you had a function that takes

i don't know even 200 milliseconds

to compute right that that is

pretty commonly accepted as what humans

can perceive as instantaneous

so um if you have a function that takes

300 milliseconds to compute and it's

trying to recompute

on every keystroke then

the application is just going to feel

slow

right and sometimes there's no way to

get around

writing a function that's going to take

300 milliseconds

because it has to like process data

frames and stuff

yeah um so that that is

my point of caution here like there is a

lot of stuff that is

lightning fast and can easily come in

under

that time threshold but for anything

where you're

moving around a lot of data or doing any

heavy lifting consider

having that be a button not a reactive

yeah that's right i think you know that

reminds me of something i chose to

exclude because

um because of time constrain

but probably you know the motivated

reader could go to this section called

controlling timing of evaluation

and i think it totally taps on what you

guys are saying

and and offer some approaches

to uh yeah to that so basically

you know for example what you can do is

you know add a click

button that say okay now compute right

so instead of you know

the thing being computed as the user

changes something

they are free to change everything and

then when they're ready they click

a button one time and then all of the

settings that they have changed kind of

get applied and get computed

so there are a couple of strategies very

very clever and

that it looks they are very connected to

what you have just

said alex i'm sorry that that didn't

make it to this meet up

okay thanks a lot for joining today see

you next time
