---
type: Video Transcript
title: "Strong-style pair-programming: Submitting an R package to CRAN"
description: "I didn't see I say the recording button  you see the red LED flashlight yeah  excellent so hi Jackson so in you know  we have this package Jackson and I have  b"
resource: "https://www.youtube.com/watch?v=BAS8yfLBnog"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=BAS8yfLBnog"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

I didn't see I say the recording button

you see the red LED flashlight yeah

excellent so hi Jackson so in you know

we have this package Jackson and I have

been working on is called art art to the

eye data Jackson is the main contributor

to that package and I am officially the

maintainer so you know we thought of

working together on the submission of

this package to cram and also to give it

a go is our first time in doing

officially strong style fair programming

which is this idea where you know one of

the the to navigate what's going to

happen and the other one actually drives

what's happening so today I'm gonna be

the navigator and Jackson is gonna be

the driver and the reason because we're

doing we're doing it that way is because

you know I have submitted

I just to crime before and Jackson

hasn't so you know I would like or we

would like him to learn the processes so

one way to do it is you know to learn by

doing so I'm gonna you know if in some

directions and he is actually going to

do it are you okay with that Jackson

yeah it's got started that's so nice so

Jackson is sharing his screen so we see

now is his computer that's that's great

Jackson I can see everything very

clearly and so where are you standing

right now okay so you are standing in

there to your data project

cool so you know the there is a a

checklist that I use is available

through a function you may use this

package do you have that package nice so

the function is called something about

release so maybe you want to do you know

use this column column release and see

what you get okay release issue so

that's the one we want

use release issue okay I would expect

that to open okay cool

so you know what we have now is

version the development version zero

point zero point one 9002 the 92 is the

official way of flying in that a package

is in development mode so I think that

we should go zero point zero two I'm

punished on Crown with that version nice

I can see a link there

not found oh it's not it's not looking

something in my origin okay

that's interesting that's cool B that's

a good thing to kind of reflect on so it

looks like the function that you have

just run it's getting the address from

your origin okay that's good to know I

think that your setup there is great I

mean upstream pointing to which has to

point an origin point into your honor so

what I could do is open the issue ok

let's try changing the the remote for

now and see what happens

great that's an interesting thing to

consider because maybe we need to

propose an issue in there use this

package to be a bit more flexible or

maybe the function has an argument I was

just going to say I have the moonsault

okay this is

I seem like working one while you speak

I'm gonna try to locally and see what I

get my computer um let's see if I can

share yeah don't stop sharing should I

show my screen and see if I got yeah

actually you know this idea of - there

you go you see my a studio session here

yeah you know the idea of pair

programming is originally develop where

two people see physically one next to

each other

which is not the case right now you know

we're working remotely and so you know

usually it's one screen and one key word

and then you know the from one person to

the other so the nice thing that now we

are working remotely is that we both

have our own setup but we can still

share the same screen just by sharing so

let's see what happens if I do it first

I'm going to inspect migrant modes I

only have origin and let's see what

happens so we were use these because

maybe I'm using the wrong function youth

release issue one folks so far is the

same I'm experiencing the same that you

experience and and we say we wanted

option three right which is yeah do you

see my screen with a good enough size or

is it yeah it's dark and said oh it's

fondant I'm gonna run these and see what

happens

okay

automatically opens the issue obviously

there is no magic nothing magic in doing

it from you know computer of mind

because this is just opening an issue

for us kind of walkthrough so I don't

think we should kind of waste time now

the bunny what the problem is

maybe we could explore if necessary

should be an issue to use this or learn

why work and are you okay with that we

continue through absolutely absolutely

so now what I suggest you go to actually

this issue so is the issue number 15 in

the RTI take a package and then you

start stop sharing my screen and and you

when you take it on okay sure yeah nice

can you make it a little bigger

nice so the first the first item you

know might be overlooked by someone who

hasn't submitted packages to chronic

because you say hey check that the

description is informative and I think

that to understand the significance of

that item you have to see the world

through the eyes of crime maintainer

because the only I mean they don't have

time to review everyone's come you know

they don't have time to see all the

information they actually read like

manually has mean like a human reading

is in the description file so if the

title that we have on the description

field in the description file is an

informative I'm convincing that is worth

damaging then they will reject it ask

you for more clarification and they say

that in a document

that is called crank police's so that's

why it's so important to raise so could

you please open the description file you

know walk through it and take a moment

to make sure that everything's okay then

the description file yeah maybe we'll

need a little bigger sense they also

checked the title for what's called

their you know the title case so every

letter there every verse should start

with a capital letter and it should not

end with a dot and they actually

explicit about that instruction in the

crack in the crime policies or basically

it's very important to I think having a

party's going back because this looks

good to me it seems like a nice so i

confess here on the screen that we have

gone through this before so the reading

of the description file and i'm really

like rewrite Jackson Alfred so just in

case I'm gonna take like a minute to

read it in silence

soon as concise and descriptive great

the only thing I go to comment something

that I tell you of the camera is worth

while recording is that every link that

appears in in description and also in

readme and it's automatically checked

for validity so it has to point to

somewhere family if you know the patient

returns 404 oh and if first kind of

failing codes

Cranham totally knows how we will reject

the package so it's you know actually

before I had written in a URL that

wasn't point wasn't valid so I

understand one of the checks that we're

going to go through so yeah that all

looks good to me so if you want you can

check that box there Jackson I can't

update your comment okay my end and

maybe if you want to comment on so what

I'm gonna do is I'm gonna make you I'm

gonna see if I can change the settings

to make you able to check boxes here so

maybe you want to explain you know the

discussion that we had about licenses

and if you're happy to check yeah so I

mean I guess the the discussion was just

to ensure that that this open-source

license was kind of the the add the

accurate license of license that we

wanted apply it to this package and the

new license seems like something that we

yeah it takes all the open source boxes

but still ensures that any downstream

work needs to remain open source which

is essentially what we wanted already

check there the box and if you refresh

your browser you should be able to see

check the license to then I think we

both already agree that

the license is good the third so in the

meantime I was trying to find quickly

the

they deem to make to give you access

here so let's see who has access manage

Poligrip oh wait let me click here I

would like to see if I can give you

right now access to shoes

it was here much access access ok we're

not finding exactly what I wanted so I

think that for now I'm gonna have either

one checking the boxes which actually

pretty it makes sense because you know

as a maintainer or validates you know

you're actually doing so because this is

a kind of boring will continue with you

know with your screen I was happy so can

you refresh you should see that the

second checkbox is also checked

let's check first I wanted to yeah there

we go

I'll just check great so well the third

one is pretty self-explanatory you have

to just run that thing except that you

will notice I already have that file so

I don't know what happens if you do it

so if you've run the function I mean in

any case it's all being tracked by Creek

by gate so you can overwrite the file

and then we can enjoy it I there you go

okay so yeah so just have a look at the

ID file and I can explain okay so there

is a three sections in general but in

this particular piece is only to the

first section and a cron wants you know

how do you test it your eye which it is

crucial for maintainer is to submit a

package that has been checked with the

command R CMD check so you can run that

command

in many ways and we're gonna do it in a

second and so all those I dot points in

the first lady say all the ways in which

we have tested the package so in my

computer I am now running Ubuntu and

with version are point six point three

and so maybe you want to run your own

checks right now and one cool way let me

see that if you check list well actually

now let me explain the file and then we

do it together so that's it it's

basically all the environments in which

we have tested the package locally I

only test it with the boon to but then

please some services like actions or

talk or we builder those are services

that allow maintainer to test their

packages in in different computer

environments and with different versions

of our so it's pretty cool so we've done

like a lot here so I think it's pretty

robust the second heading says you know

tells to crime you know what are the

results that we see in terms of RCMP

check so all the experiments show zero

errors here were means and one note in

DD it shows two notes but we're going to

get to that in a moment and then there

is a third heading that we don't see

here because this is the first time this

package is submitted if the package was

submitted before the function use this

you know use cron Commons good also

create a heading where you you say if

your package has reverse dependencies so

other packages that depend on your

package and if any of the changes that

you have done break the down straining

dependencies is that clear yep

make sense so like in reality check so

you and I know that we have dependencies

by are here on

our ceiling it hubs so for example if I

got to the end I match he sees a

tendency so I informally I have tested

that nothing breaks and I have it up to

the package to to use this new version

but this is something that we don't need

to tell crime because it's not yet

submitted or they want to know only

about dependencies that have base with

it oh crap right sometime axons so we

don't need to under here in here with

all we have is okay so that's that's

done then let's see what the checklist

size next the chakras yeah okay cool so

I'm gonna check that box and the next

one is to actually run our CMD check via

a package step tools with a function

check and those parameters are pretty

important because for example the remote

equals true will I think it will check

for links that are valid for example

that if you don't have that you know you

wouldn't know if your links in the

description don't work so if you want

start running that I'm gonna refresh the

check list

even if on my end the check this is

refreshing at the kind of slow pace so

why do you do that if you won't go to

the other to the cheeks again and check

the next step so the next step is to run

the same thing that you're right now

locally to run it on a platform ice cold

winter middle and that's a service that

crime provides where you submit your

package and grant checks it with Windows

ok which is a relatively rare

environment for software developers and

one that often causes problems so they

provide a service so you know people are

sure that he's working with so one thing

that you could do is you know to copy

that command okay good we finish that

crate so there is as I mentioned before

there is two notes instead of one but a

second know that you see there only says

that your person right now so the

version that is now described in the

description file who could you open the

description file to show exactly what

version we are using there you go so it

is illegal for a crime package to have

the ending like to have a fourth

component basically so the ending 9001

is a legal for crime but that's okay we

do it intentionally so that we don't so

that's an additional five so we are

going to continue to use that flag for

the next couple of checks and and before

we submit to crime we're gonna remove

that that's fine

so for now we don't worry we just

acknowledge that it exists there and

that's why I'm nodding we are not

including in the crank comments fire so

if you want to go back to current

comments now it will make more sense

when you see

in the last Harry so you see that the

text that you see last news submission

is exactly the text copy pasted from the

check that you have just run new

submission right that's what they said

oh no we don't have to inform cron

because it's not gonna happen

but know by the time we submit for

Murdoch's unless I'm going to check the

box that says that we have checked I

know the next one is to run them tools

check by the window well if you can't

run if you want to run that okay so this

this service is supposed to be used by

the maintainer or someone who the

maintainer authorizes so it is asking

you to say if that is your email and in

reality it is not it's my email but it's

fine so you can say yes because you have

my authorization and the report is going

to be sent to that email so I am going

to be the one who receives the results

so as you see it doesn't take any time

because there is no computation locally

it's just building so the last one you

see there it's just it means I just

built a tarball containing the source

course in a compiled form and it's going

it's submitting it uploading it and we

mean it also has like a website that you

can go and unsubmitted from from the

menus but we are doing it from just

complete make sense

so we cannot yet check the box but we

know that we have we are waiting in the

meantime you can also run our hub check

for crime so the next item in the list

nice so maybe go to your browser I would

like to show you they have

website so just type there on Google or

hub and see if you can follow links to

to the series good

so that interface could allow you to

submit your package from the web browser

okay if you click on advanced to the

right you see that this a bunch of

platforms and try to check say that you

want to test with Mac and Windows both

can't you do that no no so the good

thing of doing it from our is that you

know we can run at the same time so now

I will ask you to check the help file

for the function that we're going to run

to see what what is actually going to

happen yeah it's a package it's only

used for these situations so it's very

unlike so the interesting bit is a

little lower in the help file it says

even more more more thing in the details

section yeah so it tells you exactly

what what it does so he checks the

package on Windows and Linux it checks

the baggage on the arm release our

release is basically the latest version

of our which is right now 3.6 23 and we

are the veil which is you know the

version is getting ready so it's not

available directly you have to do a few

tricks to get it and you know on that

platform what they want to know if you

know it is your package going to break

as soon as we've released in our point

you know 4.0 or now and then the command

RC LED check is a command anyone can run

from the command line but the flag ask

run

is a particular flag that creates some

settings not very familiar with but it

is compulsory for a crime maintainer to

run RCMP check with that flag because

that's what they want you have to you

have to actually say you know you

declare that you have tested your bill

and then the last point is just saying

you know although suggested packages for

the user are not compulsory so I say you

sir you can use the package without the

packages or at least under suggests and

these function needs that those

functions are actually installing your

system so ok I think we're ready to go

I would run the function and see what

you get but before you run it give me a

second that I would like to give you a

trick okay okay so how uses very heavily

in the system are 60r which is an

object-oriented system and it gives you

the possibility to come check the

results online but from the one really

good way that you can refresh and get an

update is by assigning the result of

that function to an object so you can

choose whatever name that you want nice

so now what hit on run it and now again

it is asking you to confirm that you are

the maintainer so um first I would try

ma typing the email address there you

can copy/paste my email there and I

should get it token let's see if that

works nice talk okay so I'm going to go

to my own email and I'm gonna pass you

all I'm doing is going to my email

refreshing I see an email that says

subsidies I have check email validation

and has it talking it's not a very

secure talking I believe because because

this is only good for this session

really so I'm basting it here on the

Chad and you're okay with copying and

pasting and showing it on the screen no

I don't think it's an issue okay great

so those three links that are going to

advertise so if you go to any of those

things right now you can you will be

able to see like they are our CMD check

happening on the fly so it's working you

know the same that you experience in

your computer now he's happy in this

service and when I read whether the

person is finished they're gonna send me

an email

and I think I have some emails here from

a previous run I could show what they

look like okay this is something

interesting to show you right now in a

moment I'm gonna share a screen and but

first I'm trying to organize my emails

to show something useful

okay okay I'm gonna share my ice cream

in a moment so cool so because this

services take some time to run are hard

not so long but you know the wind

developing that we did does take some

time so maybe it's more than we are

willing to wait you know live on screen

so we you know we can finish the process

later we can move on as much as possible

but they are have service I can show

what it looks like so these three emails

show what it looks like so remember that

you saw you got three links so they each

link will produce the result and the

result will be sent to me by email and

what I'm sure is not exact same round

that you're right now by one I run on my

own before on the same source code so it

should be the same and when you've read

on screen

can you come female you see my email

here right now so you see the same notes

that you saw when you run locally which

is good that's what we want so these

second nose is gonna disappear in a

moment and and this is a new submission

and that's a client uses to know that

this patch

I guess has to be reviewed by human I'm

I'm not just you know goes through

automated tests so with this one run

that is what's wrong with Windows Server

2008 blah blah blah and it's okay you

know the one no that we expect so with

this other platform moon to Linux blah

blah blah same note so we are still good

to go

and with this other platform Fedora

Linux but

say no so the information that I get

from this is that we are good to go so

we are experienced you know locally the

same thing that means you know on the

service and know that weekend is the one

that we expect so there is no reason why

at least a crime from these checks while

crime

good will reject the package as far as I

can tell so I'm gonna stop sharing the

screen and actually here let's see if I

didn't check the box so I have checked

so I have you know I confess I have run

these checks right before starting this

meeting with you Jackson so I can check

that box right now okay and so update

crime comments I can also check because

there is no update that we need to do so

the file that I have right now there is

so the reason why I'm here is because if

from these checks you learn something

that needs to be reported to cran then

at this stage is where you would add

that information to the file for my sons

you see I mean I'm sending them emails

you just add the information there on

that and it's that there's a standard at

this standardization for how notes are

required to cran in the comments just

under just like it dot versus a markdown

yeah and also you know now that you know

exactly what is the name of the file you

can also go to you know very popular

packages like side apply or something

yeah learn from them and senior

inspector that file and see how they do

it for make sense so they were good here

the one thing we need to do now is to

review that they package down reference

index has no missing topics for police

two ways in which I used to check base

so I'm going to stop share the screen

and drive you and navigate that

so if you wanna share yours so one way

is locally building the website

reference so do you have package down

installed so if you so the package down

has a function called build reference

good which is the fastest way which you

can create the index and all the links

so go ahead and run that so as you can

see okay it has created the reference

section of the website so if you go to

another section it should be empty but

the reference section is empty because

you are now reading the website from a

local folder store in the source code

but so the first thing I do I used to do

is go back to the our session that you

just had before and scroll up a little

bit to see if we see any red color red

color means something broke and some

topic that comes from from the man

folder wasn't able to build if you see

everything in green there you're good to

go

at least at the automatic little right

sir then it is easier to see on the

website you are seeing right now and

that you know the items that you want to

publish are there so it's good to not

spend a moment to see hey the topics are

under the headings that we want are part

of the families that we want each item

for example that examples are actually

Ryan and we are not seen like an error

that is expected or something like that

so very quickly I mean we have worked

with in documentation very thoughtfully

you and I during the development of the

package but now I very quickly

just you know scheme every page there

I'm confirmed that there's nothing like

obviously broken yeah one thing that I'm

noticing Jackson there I we could have

is you see how my at the very end is

size develop I'm a liberated Jackson

offer and my name has a link and yours

doesn't yeah that's something that if

you do have a website where you want to

point to your it hub page or something

you could do it if you're interested in

you know once you finish reading this I

can show you how to do it yeah

ah this should be defined so exchange

that can you would you let me to do it

on my on my end would you like to do it

yourself actually drives can I write to

master directly like a drilling only

through here so one thing we could do is

to create a new branch call something

like release zero point zero point two

yeah and also when one caveat is that

you know when you've run the package

down reference function you should have

gotten a dog's folder that we are not

interested in keeping track in pressure

control so I'm very lightly I'm ignoring

it but so if you want to check your

status in deed to see if we are not

adding you know that fall that we want

we don't want to commit it to to version

control at once so one way you can

remove it very easily with the command

it yeah that's one also is you could

also do so remove you there you need a

flat - are to remove recursively

at the end or you can also do get clean

which will search for things are not

yeah so there is here I recommend the

following do get clean exactly as you

did and first do - any to run what's

called a dry drive run that will not

remove anything but it will kind of tell

you what it could remove so keep clean

okay I'm - - so - NF f is for force

because it's refusing to remove anything

okay and that's it the directory as well

so maybe - n DF let's see okay now it

tells you what it good remove so it's a

safer way than just doing it in case you

don't want that's not what you want to

do so now you run the same thing except

that you've removed the N and that would

actually remove

I've forgotten what the I'm a very heavy

user of the control dot command which

pops up you know this little window to

find files I find it extremely useful

you just start typing in the name and

you know I'm very happy of that that's

awesome all right so I've changed the

era file and now three documents and

while you're there adding things to

commit you could also open the file are

these called underscore package down

yeah mofo yeah and you see that there is

my name up there next the link so you do

something similar with your name it will

appear linked

nice so if you want to convince yourself

I would run again

the beam reference command and see if

your name has been added to a link nice

beautiful is it working it's great that

we are taking some time because you know

wind event in particular takes forever

if I'm actually going to free check my

email to see how things are going

okay I'm back here sorry for actually

whenever you are ready to push something

it would be nice because that way we

also trigger our checks on github

actions so it's a nice way to confirm

that you know that with the latest run

is working as expected

um I'm gonna make the PR from my forced

oh yeah yeah

while you're there if you if you can

relate that to the release issue and IV

nice or close a show where our

where any of the toys nice thanks so

before you leave the page you know I

will click here on the top actions which

is right next to pull requests just to

delight our eyes with the checks and

confirm that you know everything is if

you can you can actually click on the

name release and and see all the very

many tricks that we are running and they

do take a little bit in the beginning

because there is no Patrick Pichette for

this particular branch and but then any

subsequent runs really quickly so it's a

really nice confirmation or any change

has a risk of introducing a bug so you

know now that you have added even you

know we know it's fairly safe change Li

you have done but it's worthwhile you

know making sure that it's actually

working

that's so good let's go back to the

check list and see where we're standing

okay so you can finish the review or the

link so we obviously need to see some

there's a few more probably because you

know when you have a move the doctor

maybe to be in the safe side you can

also then ignore you can add a tox to

ignore and yet so we make sure no one by

accident commits that flat folder

these are worth German Tom ended up yeah

I mean it's obviously obviously I think

it is in our bill ignore if you want to

confirm but that is only so he passes

checks so he passes checks ignoring it

but it's still kind of is trying to add

it to version control so you can usually

you know I use the function you get

familiar with it from the useless packet

is use it ignore and then you can see

how that's the line and it's okay to add

it manually it's just it's particularly

for the building nor I recommend using

the function because you know all those

uncurse that you see on screen be you

know all those are kind of tricky to get

right sometimes the next step in the

doors and all that stuff will you learn

now it's just straightforward thing I

guess I sometimes I don't I the docs

folder to the exercise is more obvious I

mean I don't like the a folder leaving

in my lovely my repo and sometimes he

fight me Nora I forget that it's there

but I think it's wise for the chest

you're taking la tourette sorry yeah but

it's not promised every time every time

it makes me crave tea definitely we have

the we have the club motto in Berlin

okay so I'm back to here Montes pants on

scene I'm noticing that the first push

that you did all pass beautifully and

it's now on the second run of you just

see when you when you added dots to be

ignored

and this one should go quicker because

now he's across

exactly yeah you see how when they

appear right there when they're on next

once monster that's things to their hard

work of those maintaining the actions

for our krepo before there wasn't like a

share and it was like okay yeah this one

looks good to me I'm just talking about

the restaurant

one thing to notice is that you know

this was the first submission of any

package

is very tedious because human-rated but

then once you have submitted for the

first time you can do every submission

for updates and all the checks pass it

gets polished automatically so once you

know we are done with this very deep

process next time it's gonna be easy to

update so I'm just saying it's fine you

know if you later find a typo to change

in a recipe and they have a policy that

you know you shouldn't update your

package more than every say month I have

four to go because you know they're very

busy their computers are you know get

overloaded but you know react to your

lane changes over the next couple of

months

yangsun's okay so I'm gonna check that

box there then now you're showing me on

screen they only you can refresh and see

that only box that you know I haven't

been able to check is the wind avail it

takes I also have I would show you know

my screen the give me a second my screen

I'm gonna show all right really you can

do it yourself the links that you have

to the packages where being checked on

our how do you have there a hand over

there gone so the links the research

yeah when we run sorry there are hub

command he produced links is that

somewhere there or it's gone

prior to because they are they're cool

and also you can run you can also run

the coach had arrested at your session

you can also run the option that you say

the results to and if you give a summary

of what's the situation so far so when I

got understand is this one check has

already completed successfully it still

sees that no that way we're gonna get

rid of soon and then the other two

checks are still happening you know it

has been created but I still going for

some reason those platforms are slower

these are limits platforms yeah on Linux

you know how you know it has to so yeah

that's but then one thing that we did

check the one test that did pass was you

know as expected so all good to go

so okay and we have done everything in

the first block or the check list and I

suggest we move on to the second block

and we are not going to so this actual

solution will not be happy until we get

to the item that says approved email so

I record because I think this is all

going really well we only need to wait I

suggest we go through the first two

items under submit to cram and then we

don't actually submit until you know I

I'm sure that I got in the replies from

we'd builder and okay sounds good to run

this yes go ahead and run

that's all gotta commit this it's just

updated the description thanks good yeah

so it's gonna be doing a commit for us

so that's great and if the raper have a

final call in news and it would also

update that but it is not we're in the

rebel because news are usually a way

that you have to communicate with users

what have been the changes from the last

released version but it is is the first

submission there is no such a thing as

previous version that's wrong so we had

to add it like next so actually one

thing you could do to convince that that

node has disappeared the node about a

large version number is to run locally

the detects may be so yeah and there

should be no no note saying large

numbers and then in the meantime we can

go back to at least and see what's the

next item should we - cool yeah go ahead

and do that we move on your the name is

come scary but it won't actually happen

the submission until I approve it from

my from the link that I get on my email

okay so you see on the checks results

that there's no no knows there that the

it still should get the note for new

submission and the reason why you didn't

get it better is because the checks that

you run there a lot of basic grammar is

exactly if you've run the dudes check

and remote equals true and manual equals

true then you should be getting so okay

so here is also asking you to confirm

that the email is my email so you can

say absolutely

prove that and I would have to confirm

that on my email and now let's see what

it says meeting so it has filled least

the it has taken the source code created

a bundle named it under the name RTI of

data underscore 0.2 target she said

submitted that file to that link there

which is somewhere on Kranz computers I

guess the file says is something

important in have a look at because if

it's too big

Graham will reject it I think it has to

be under megabyte or something and now

you're being asked to confirm if you're

ready to submit to cram and again don't

worry because actually you won't be

submitting so go ahead and say for sure

okay so now it's saying it's actually

uploading the package the comments

confirming the submission this regions

for successful now I have to check my

email for a confirmation eat link I'm

going to show now on-screen and then

once it is accepted on crime you will

have to tag a party that commits these

particular commits you have to tag with

a version number okay

so you can see I'm gonna go ahead and

check the boxes for use this used

version and the box for tip tools to be

to cram the books for a proof email is

something I'm gonna show myself so yeah

these box here I should get an email

there you go so I have you know package

to do submission here in my emails fear

myself

someone has submitted this package to

crime I need to confirm by clicking this

link

so I'm going to go ahead because we

still the few boxes that need to be

approved and this is some very important

information and I scooped for people to

know so this document here from policies

is it's very important to be kind of

familiar with let's go ahead and click

that link basically is the police's but

cran imposes to punishment a nurse and

this is section called submission so

everyone dinner before they click that

box should be familiar with with this

section which I have read is for example

reminding people to use the survey that

we have used with the command check mean

develop that service called wheel

builder which I could click here to show

more or less what it looks like so we

use we you access this service from the

command line but you could also come

here on the website and I go to the

upload page and upload your package in a

sense similar way which you did or you

showed it and that's about it so let's

go back to this picture I will click

this here and then you see how you're

stating that you have checked the

package locally with a scram and you did

so with the current version of our which

I did you Jack some good and be within

these policies because you have I think

you're using PowerPoint 3.1 we are right

now in version 3 next time when you

submit a package to Quran you will need

to be updated so that you can check this

box and then they are the veil I've

recorded a video to show how you

document in you can access they are the

veil version but also we are doing that

on github actions right so for example

if I go now here to the package that

we're building I go to

we can see you know let's see the last

run which was a few minutes ago

you can see how for example on Mac we

are running not only with the latest

version which is 3.6 but also we are

running with our devel so we are doing

it this continuously through the

contingent duration service and we have

set up but also I particularly do it

locally with docker container so I'm

gonna show this screen here where you

know we file let's see I think it's the

first one this one here let me go up to

see this is a container ok so ok here

I'm exploring my containers let me make

a bit more space for this so this

terminal particularly as seen right now

is you know I triggered a docker

container that is running are as it was

on the day 4th of March 2020 and that's

like a very current version of our it is

you know this is the Michonne number

that they all did the develop person

that they are running and if I go down

so I started here are with the coin Rd

on the source of our package I studied

art avail and then I run here you know

I've run them to check with remote

equals true and magnetic was true so I

did the same thing that you did locally

but with our develop so if I go down

blue blue you know I see the same notes

that we have crap yeah sure so we can

you know I'm coffee I can check that box

yeah so we're good to go except that I

want to wait before I click this here

that our that wind developers sent me

the email to confirm that it's all good

to go

and also our hub should still be working

can we confirm that in your computer I'm

gonna stop sharing my screen initial my

screen I see that yes I see your screen

I see that it's still working on the

last two checks okay

so there's nothing magic other that

remains and I'm waiting confirming that

everything is as we expect and then I

will click that button to actually

submit the package to prod so with that

you know I have kind of navigated you

through the process on some moments to

reflect my field information gaps I mean

I think I think that all seems clear to

me honestly that most of our tracks were

already set up continuous integration

sorbonne excellence great for you know

walking through the entire workflow for

submitting your first package to cran

hopefully in a few minutes I will have

for the last results that we need before

I submit and I'm hopefully if everything

goes well and I expect to announce maybe

on Twitter and tag you aware that the

package has been published a few days

from now awesome

that's super exciting thanks Mario okay

okay thank you very much I'm gonna end

the video and then keep talking to you

privately good sounds good what
