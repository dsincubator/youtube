---
type: Video Transcript
title: "Refactoring: How to prepare for dplyr 1.0.0"
description: "I think where we are going to be talking  about how to get ready for T player 1  the player 1 comes with a bunch of great  features but also comes with some  br"
resource: "https://www.youtube.com/watch?v=xxtpMXvVM3s"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=xxtpMXvVM3s"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

I think where we are going to be talking

about how to get ready for T player 1

the player 1 comes with a bunch of great

features but also comes with some

break-in code meaning that your code

with the player one might break so how

to get ready okay we want to talk about

this idea of refactoring which in

software development means changing the

internal representation of your code

without changing the external behavior

so there is a bunch to talk about that

today I'm going to hopefully give you

just an overview to motivate you

learning more so the idea is that you

can save a lot of time and pain if you

change your code in very specific ways

as opposed to just you know going for it

and wishing yourself good luck but

before we start a couple of

announcements as usually do first

that the coding sprint retrospective

that we've run last week is now captured

in the chapter 21 of the Data Sync

waiter meetup book or website there we

you know try to distill the discussion

that we had last week and try to come up

with actionable steps so that next time

we do and then the second announcement

is that because I would like to

encourage other people to be present at

that assigns Inc waiter meetups I'm

trying to kind of build a system to make

it easier to create the content and so

people will do it so the the

announcement is that if you now create a

new issue if you are at the data size

equator repo and go to issues and create

a new issue you will be presented with

this template you can choose to

basically get some prompts about how to

structure your Meetup and you will get

questions such as you know what is the

audience of these

Mina why the media is or the content is

important what should be covered and you

will also get a checklist that I usually

use for making sure I'm not forgetting

anything while we present media so

that's it we are now ready to talk about

the topic of today so we go to the

refractory issue in particular issue

number 31 and what you see exactly there

is the template that I showed you before

but now complete with the specific

content for this video so I think that

anyone in our organization that uses the

applier can benefit from this meetup and

also and even if you don't use the

player but are interested in having that

can overview of what is for factoring

what is important well the player

announced that the person one is coming

soon

one you know as soon as you change the

first number of first number that means

that there are changes so it includes as

I said before great things but also

close I can break your code so to save

you time and pain I would like to

discuss some basic principles that can

help you adapt to the upcoming deep

level so the con today would like the

core is first to show you where to find

those breaking changes that the player

is announcing so here this link you can

go to the new store MD file which is

standard file to communicate with your

users as a developer which changes are

in each conversion in particular this D

section breaking changes that explains

the things that change in a way that can

break your code and then there's also

new features and a few other things that

you might be also interested in but yeah

but for now I think that for you to have

that link there is good enough you know

whenever you need to read more about

what's coming and how to lab you you

know what

funny fortune also and it is recommended

by the player itself and in general that

you capture they are packaged

environment of the projects that you

want to protect from potential breaking

changes how do you do that well you can

do that with RM which is a package that

allows you to create a package library

so a collection of packages with their

specific versions that are specific for

each project meaning that in one project

that you rely on older versions of the

player you can use all the versions of

the player without needing that one

person across your entire system so one

version in one package one project you

could use you know the player one a new

project that you start from scratch and

another project you might want to keep

the code as East until you have time to

change it and so you may want to protect

that project using RM to keep just

version and say zero point eight point

five or something like that

so how does that work is very simple

here I have a project let me maximize

this look a little bit I have a project

I've been playing with RM I think

honestly let me just do a new file still

show you that information I have this

project that I've been playing with RM I

haven't used it a lot it's just you know

I have just used it to practice and see

how you know it feels the user RM and it

looks pretty good to me

basically you you tell our end that it

should look or create a project specific

package library and for the one progeny

are working right now with the function

elite so if I am at the project site

demo this is my project I could run RM :

: it

first you know HRM with lever erm and

then just run the function in it so what

that will do which I already did it will

create let me scroll here maybe I need

to kind of make this a little smaller I

went over the top with increasing the

font size so it will add this folder RM

that will store the package library so

library has for the version of either

you're using and the platform that

you're using in my case Ubuntu here I

have all the packages that this

particular project is using and there is

also metadata about those packages or

about that entire library of packages

another the data store in this very

important file called RM lock if for

example we try to find the prior in this

file what we notice is that it contains

for each package in this this project is

using it contains the specific version

that the project is using and where you

got it from for example it came from

cloud or our project or and so on and so

forth so a bunch of information that RM

needs to know to be able to provide this

project with a specific version of the

packages that you want as something is

really cool is that

inside the same project of course you

could have a branch that uses deep layer

zero point eight point five as I'm using

right now or you could have another

branch that for example uses deep layer

1 so even in the same project you could

create specific libraries for the code

that you haven't had so you know while

you prepare your code for deploy one you

may create a new branch and you may

experiment with it by a one in one

branch and not in another

so in this branch the player one if I

search for the package supplier

see the plier okay here you see that

this file describes as metadata that the

version of the player that this branch

is using is zero point eight point nine

nine which is as we speak today it is

what is going to become the player one

so the other branch was using an older

version this branch is using a newer

version so I could use this branch

experiment and receive my code breaks

how to fix the back so if you want to so

let's see what package version of the PI

I'm using right now package version of

the player so I'm using zero point eight

point five right but now it's switched

to this branch that describes that the

packaged version of the player that it

wants is a newer one so how do I use

them that specific library okay I do

RM restore so our M will look into that

file I will restore all the packages -

OH

as they as are described in this special

file called our m dot block so I run

this function it is telling me that from

the player for example is going to kind

of upgrade from zero point eight point

five to the tiny versity player which is

the development version of the player on

it happen still the one that is on front

so if I say yes I accept that change

let's see what's the magic that is going

to do is reminding me that I should

probably start my session so I will do

just that

with shift control and ten and now I can

rerun a package version of the player

and now I'm using the newer version so

let me scroll up to show you what we

just did I was using an older version of

our I switch to this branch

that contains that describes that I want

to use the buy one so I restored the

baggage or they are environment to read

from that RM vlog file with a function

RM restore so I restore the library to

the one described their RM asked me for

confirmation and as a consequence of all

of that and after restarting my station

and now I'm using what's gonna become

the player one so this is the way in

which you can one protect your current

projects and freeze them with the player

the release version of the player which

is us today zero point eight point five

so you can do that with RM so lock your

package environment where you have it

now and on the other hand you can use RM

to experiment with the player one in

another branch or in another project

okay so that's all I want to cover on

our end of course there is a lot more

you can do but for now that should

suffice to motivate you to go and learn

more on your own as you need time we

also covered where to find the breaking

changes so let's see what else we have

on schedule for today okay so now kind

of getting more into this idea of

refactoring so say that okay now your

code breaks with some of the changes in

the player or you want to start using

some of the functions that are

superseding all the functions so the

player also notice that some functions

now the your functions are a better

alternative to functions that older

versions of the player produced and

they're okay with keeping both of them

for now but they decide that is one the

new approach that is better so this the

older version the older functions are

superseded so you may slowly want to

move from the older code New Yorker so

in that in doing that transition

refactoring the idea of refactoring can

be very beautiful so what is refactoring

refactor factoring as you

read on screen is a disciplined

technique for restructuring an existing

body of code altering its internal

structure without changing its external

behavior which means if that if the

external behavior of your code is being

tested formally with some kind of test

like unit tests for example then you

should be able to do this

refactoring steps without those tests

failing so those tests should continue

to pass I'm gonna show you a little bit

a glimpse of that in a moment but I want

to point you to this link which sends

you to the refactoring dot-com website

by martin fowler who is the author of a

book called refactoring which is like an

icon of this approach it was written

first edition like 20 years ago and last

year it was released an update the

second edition it was this great book to

read and it also comes with a catalog so

if we click here the catalog what you

notice is that depending on what you

want to do for example say that you want

to rename something you can filter the

catalog of refactorings as they are

usually called you can filter just those

that prefer to remain in something so

for example you can click on rename a

variable and here you have like a

graphical representation of what the

technique means it is not described info

here because the description is in the

book and I guess that they want to sell

books but at least you know you know but

that the names at least the names of

reference are here and what I wanted to

show is that and you know developers go

about changing code in a very structured

way ok I just you know start changing

these and changing that and what happens

if you do that then everything breaks in

then free

ha - to know if you're improving

something or actually making it worse

so if you do follow these kind of

recipes these moves for factoring moves

then you really minimize the chances

that your idiot changes are going to

break existing okay so let's go back so

we discuss water I can ease and show you

the catalog and let me show you like it

tiny glimpse of what I mean because so

far I was I'm sure very abstract so say

that we want to do that refactoring

called rename variable so let's say that

you have a file one with a variable

called X and X contains in this case the

literal string something so this script

uses X calls the function print and

print X and then concatenate X to

something else so we run this we print X

something with something else and then

another file file to are also

congratulate X with something else okay

so how did you go about changing the

name of renaming the variable X

everywhere in your code bed okay

hopefully the first step could be to

ensure they have tests that good break

if X changes to something else

that way if you make a change the

expectation of your tests would work you

but even if you don't have tests let me

show you a very simple way to ensure

that you change your code as you go

without breaking any code whatsoever so

the first step would be to copy variable

X and assigned a new name for example Y

if I run this goal it should run fine

because ex continue where is still

define at the top and is used everywhere

so I could source this goal and it

should work just fine but what happens

if instead and I you know removed

variable X so if I remove via legs and

try to source this file if I ever start

my session if I want to source this file

it will break because the object X is

not defined anywhere so the safe way to

do it as I said before would be to first

create a copy and a little copy of X

into Y which you can do with something

like this right and then slowly one by

one you change X to Y so this code

should run right now this code again

should continue to run and it's called

finally the last step should continue to

run only now that I have replaced every

call to the viral X I can replace X with

Y and remove X completely so as you see

we have a Dandi stamp operation with

kind of live code all the time so the

analogy in surgery would be okay so you

want to do open heart surgery transplant

heart from one person and you know a

very bad idea I could be - okay let's

first you know remove the heart and then

it's go find a new heart or an

artificial heart and then you know by

the time you come back to that person to

black.they artificial heart the person

is already dead so what you do is you

would I know how it works in reality by

what I could imagine that it's real in

reality done I would think that every

vessel every artery that goes could be

you know one by one

kind of redirected into an artificial

heart one by one until you know the real

heart is disconnect is fully

disconnected and then the artificial one

is reconnect or or maybe the and then

you repeat the operation between their

the visual heart and a new car so not

sure if that's the case but you know I

would imagine that the goal is of course

to keep the patient light all the time

same thing with your car you want to

keep it all the time alive or at least

you know break as little code as

possible and so that if something breaks

that what you need to fix this just in

one place and you do that fixed and then

you continue to repair so refactoring is

very tightly linked to two things

testing and version control why testing

because of course your tests will

complain will tell you if you have

broken something

I'm where exactly you have broken that

state so you can change it very quickly

and pressure control allows you to

identify that you have messed up

you can go back recover the last commit

very easily and nothing so fracturing

very tightly linked to testing and

version control I've yet even if you

don't use those tools then you still

benefit from kind of knowing this the

general strategy that I have just

described something so easy as so simple

as to change in a variable name you know

the reason of silly ways to do it and so

by the way truly you know you may have

seen that our studio and many other text

editors include tools to change doctor

factor for example variable names all at

once so if I select for example Y here

and press ctrl alt K on my window then

every instance of Y in this particular

file is highlighted and I can press now

for example X to replace that from X to

Y so it the editors that you use all

so give you resources to help you in

your factory book but that doesn't mean

that you can forget about what it is

safe perfect reviewed compared to an

unsafe because the changes that you need

to actually do may be way more complex

and okay so let's go back to the issue

we discussed the white tests might be

useful and why get my so maybe the one

last thing that I would like to leave

you with is you know how this works in

reality so I'm gonna close ahead and

close these files so I'm in this project

right here and I actually have a bunch

of tests for this one function called a

mean of merit column so what is this

function so mean of numeric columns is a

function that takes a data frame and

mutate it if the variable is numeric if

it is it does the meaning on that

variable removing missing values so this

is how you good kind of write this code

in the player how you would implement

mean of numeric columns in the player if

you're using for example version 0.8.1

but now let me show you actually first

what tests I have for this okay so I

have a test that the output is it not a

friend so you know given a data frame

like this one and then I expect that I

use the phone can expect is to check

that mean of Mary columns on that data

set returns a data frame

also I have another one that in test for

expected names so if the NADA said that

I feed the function

has named a x and y then I expect that

those names are also the names in the

output of me of America so I expect I

can use the function expect named and

pass it the function mean of numeric

columns data I expect that this will be

named as the data itself so the output

should have the same super circulates

and finally I'm adding two more tests

one in which I test that the value that

the function returns is known so how do

we go about that okay you first

run your function store the result in an

object so here for example is this oops

let me load the package and let's do

this run this line so now out contains

the output right and out I can be fed to

the function expect no value and it will

if you give it here the name of a file

it will store in your package somewhere

between the tests folder here there's

that here it will store a reference for

that value so the object out will be

saved in a I think it's an RDS file to

compare with an X every time that you

run your test so every time you run your

test the output of mean of numeric

columns with this specific input I'll

compare against the reference that you

stored by a dysfunction so test that is

clever enough and stores this in all

ways in this one place so under the

folder tests test that and the name of

the file is the one that you choose so

the same thing you can do with a very

similar function or

similar thing you can do with a similar

function which is called expected known

output so expect no output what it does

is it prints the result of in this case

the function call to a text file that

you can expect so the previous function

says an RTS file that you can not gonna

look at but the function is speaking on

output thus so now I stored this into

ref mean of numeric columns output so if

we look for that file here it is this

one here so this is what the file is

storing so it is storing what you would

normally look at on the console right

but of course you don't want to check

all the objects that you are kind of

building are the same just by looking at

them on the console because that would

be painful that we have to change

anything no you do it

romantically you store that output into

the file it tests and you do that with a

function expect known output you print

that result through the file and then

test that every time you do a change

every time you run your tests will

compare your current output with the

store output known output and then if it

has changed then it will tell you okay

so that is how tests are useful for

example now I press shift ctrl T and

that runs every change every year and I

can make sure that they're all green is

we are good to go

so in the blog post that I linked here

and you can read that the function we

did if is now superseded by this new

approach the approach of using just a

function mutate with combined with a

function across so this is what it is

like the more on the new way of doing it

as of the player one so you would

eventually want

this code here right for this so how

would you go about that

okay they safe one safe way to do it

thinking in terms of pre factoring could

be to create a function that has a

similar name but maybe like something

like two so if the function original is

called me of my columns then you're

looking for me of numeric columns number

two and externally it looks almost

identical except for the name but

internally you see replace this by this

why do I not just do it directly like

here well because if I do this my every

call to mean of my columns if it breaks

it will all break at the same time and

that will create more cows than a

solution so instead what we want to do

is is this how things were before

instead we want to little by little in

our our code so we first start with a

function that has you know they change

that deeply I recommended right and it

is not the exact name the exact function

it is it is called doesn't have exact

same name it has a slightly different so

okay so now I can go up to every of my

tests and change one by one to use no

longer meaning of numeric columns but to

use meet of numeric columns to and every

time I do that I've run my test so let

me start again by writing the test then

Tuesdays with shift ctrl T I now I'm

going to press shift ctrl F to search in

my project for every instance of the

string mean of numeric columns to see

where in my code base that function has

been called so let me scroll down a

score in the name space

which is a file that you don't edit

manually it is also called in this

folder that is the rendered version of

your documentation which also you don't

it manually and now is where it gets

interesting

it is called here in our sorry in tests

and in our so in our these are the just

calls that we are seeing right away so

mean of numeric columns in the examples

which is this call here actually I can

click here and jump to where this now

this one is the definition of mean of

numeric columns and this also much

because it has number two but I could

exclude this with something like that is

not number two so what I just type here

means mean of Americanos not followed by

the number two and I can click play well

expression then find and what I get and

I could also search my filter my search

to say our scripts and then I don't get

annoying results that I didn't care

about so now I see these occurring in

our examples also here in the definition

so that's nothing that I need to change

for now but instead I do need to change

every instance here in the directory

test that so let's click here to jump to

this particular line of code and now

here I replace the original function

with the new one that implements the new

across function so I do now shift ctrl T

that tells me that the fight hasn't been

saved so I can click on save selected

file that runs my test and all tests

father pass good news so I have you know

with analogy of the heart every one

artery connected to the artificial heart

and the person is still alive okay

second iteration this one here let's go

to change the implementation of meaning

of numeric columns that you

mean of new economies number two we can

save this file run tests and still

passing great so let's go at least third

coal same thing number two we've run the

test and they pass correct and finally

this one here the this one is calling I

mean this instance is actually referring

to the object that we are saved for a

reference I don't want to change the

reference I don't want to create a new

reference called - I want to compare the

output of meaning of numeric columns -

with a store reference of meaning of

numeric code so this instance I'm not

going to change

finally this weather instance here I'm

going to replace it and run tests

one by one great still passing again

this reference and not going to change

because I want to compare mean of

numeric columns - with the known output

of me of Murray codes okay I'm done

actually all the way down here I don't

need to change nothing else so far now

that I know that the function mean of

Murray columns as is not used I can

replace it with these so I can now so

it's except for this instance which I

could actually rename nowhere else we

should be able to match this string

except for the references that we are

storing so I can now remove this

function doesn't exist anymore

and if I run my tests I would expect the

test to still pass because they would

all be calling this alternative which is

mean of numeric columns - let's see how

we go from the test save the file

and great yes the tests are passing I

get this warning to say that the

function mean of marine columns - is not

exported but we can document that with

shift control D we create a new

documentation will refresh the imports

in the namespace I did two times and now

I can run my tests and that warning

should be gone there you go all right

so now we are almost done what we need

to actually do is to find out all

instances of mean of numeric columns -

right and replace it with means of

numeric columns as this so now that you

know we safely change the internal

representation it is just a matter of

renaming one by one to use not one name

but the other so again I could what I

could do is I mean if we are very picky

we could one copy limit as is this one

here and the other one do the same thing

but actually could be more clever so we

could leave the function as is here so

every instance is now calling mean of

numeric columns - which is implemented

like this but we want to make it like an

alias of mean of numeric code and now we

can go to the test file and one by one

finds the instances of mean of many

columns - and change it to means of

numeric columns and this should pass

let's see okay this is passing I can do

it here now again and of course if

you're pretty sure that what you're

doing is a safe move of course you could

use you know tools like they renamed

everything in one go because you are

very confident that either mean of

numeric columns or

II mean Americans to both would produce

the same results so I'm now you know

confident that my so I gained confidence

I can take longer steps in prefecture so

you can only own the idea of

refactorings that you should be able to

know how to go tiny steps so that the

moves that you do are set but whenever

you feel confident that when you do any

safe thing you know you feel welcome to

feel free to like longer steps so there

you go I have changed almost all

representations of mean of Americans to

to just mean of many columns let's find

the ones I'm still missing to fix them

and those ones are here in our so the

examples that I can show you before that

I can now replace this instance here is

just a copy that is being used nowhere

else and here right so what I can do is

now just remove completely mean of

Americana stew and instead replaces I

mean of Mary cops so okay so that's the

end of the refactoring I now change and

I will run all my tests now again I get

a warning that there is no exported

function called me of numeric columns

before it was mean uh reconstitute so in

document and run my tests again I'm done

so that is my refactoring so along the

way actually something I haven't shown

is you know each step you should be

using version control and to kind of

create safety net for for yourself I

haven't done it this is a fairly feel

confident but in real life a few commits

along the way but now it's a good time

to commit possible test I could just

check here and commit maybe explore a

little bit the changes that we have done

so now as you can see that the diff

between what the situation we had before

now looks just like what we're asked to

remove the you take if I'm replacing

with deep I across so that's it and we

can do refactor Tate if to mutate across

something like that

could make every suitable commit message

maybe not the best right now but

something informative enough and I'm not

saying that's the end of the refractory

so it's also the end of the demo and the

end of what I wanted to cover it today

so one last thing that I would like to

kind of pre announce is that as you

change your code and if you get stuck

with something and I really encourage

you to kind of let me know

finally on slack and also and we are

discussing with Jackson and CJ and Klaus

this idea of formalizing some kind of

help hours for you to kind of bring your

broken code and and you know divide it

together so hopefully you know buy pair

programming and we could kind of

refactor your code together and both we

can learn so we can learn about more

about what changes in the player are

breaking our code base and you also can

learn you know how to safely make

changes yourself so hopefully from that

interaction we will all learn more so

that's it for today thank you very much

I'm going to say goodbye and see you

next time

you
