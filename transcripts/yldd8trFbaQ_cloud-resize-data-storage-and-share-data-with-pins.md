---
type: Video Transcript
title: "cloud: Resize data storage and share data with pins"
description: "and welcome again to the series about  cloud computing  this is um  today a meet up about managing data it  is motivated by a couple of uh real  world um  use c"
resource: "https://www.youtube.com/watch?v=yldd8trFbaQ"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=yldd8trFbaQ"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

and welcome again to the series about

cloud computing

this is um

today a meet up about managing data it

is motivated by a couple of uh real

world um

use cases so with linda we're working on

the cloud and we are collecting data and

there was a point where the droplet that

we were using and sharing

did not have enough space to continue

our work so we learned how to increase

the disk

space to store more data

and

and that turned into this meet up

and also i'm going to be showing

how we can use

once we learn how to increase data

we're going to show how we can share

data across

different members of a team and we

mentioned the pins package before and

this time i'm gonna um

not explain a lot about the package but

i'm gonna explain how you know you can

use it

in the context of sharing data in in a

cloud service uh so pretty much what we

do now at this with with dropbox you

know how you can do it in a better way

also we i plan to talk about how to move

data around

but that's probably not going to happen

today because we won't have time so

likely next week

so the as usual the meetup has a

dedicated folder so i'm going to

navigate to number three data and that's

the notes

and so the user story that motivates

this first use case which is the idea of

being able to increase the disk space to

store some more data

the user story would go something like

this as an analyst i could like to

increase my disk space as my data grows

which is exactly what we had to do with

linna

so there's a couple of approaches to

that um

let me sign into

the cloud service that i'm using which

is digitalocean uh if you

digital version if you don't have an

account and want to try it

it's free to sign in and you get 100

screen that you can use over two months

and it's going to be more than enough to

try the things that we're showing in

this series

in this is kind of my dashboard i'm

going to log in

well i'm already logged in i'm going to

go to this

demo project that i have here on the on

the left and there is a droplet which is

no more no less than a computer on the

cloud sitting there

i created it from here

a couple of meetups ago if you need to

refresh that feel free to go back to

youtube and see those videos the first

thing you could do to resize the data is

click on the resize

tab here

that is

something that we have used before but

we used it to resize

for example the memory of

the droplet and now i would like to use

it to resize the the disk space

so that would be something similar to

basically buying a computer that comes

with a bigger hard drive

and so you won't see options

in the first page here that come with

more than 25 gigabytes of

disk space and for that you have to

choose um either

here in storage optimized

tab and so that seems to be something

new and that you you know if you click

there let's see

two actually that's that doesn't give me

uh what i want uh well forget about that

we click here on disk cpu and run

but also know the

message here that this is a permanent

change so once you increase the size of

the droplet

you cannot go back because that could

cause some

data to be lost so you can expand you

cannot shrink uh so clicking on that

gives you some options with a lot more

space here and so with that option

clicked here then then you can also see

for like more basic things here i think

let's see uh

yes so you know i could do

within uh you know the resizing that uh

touches disk

space you still have a bunch of options

here on the tabs and so now you can see

how some options have more disk space

160 320 and so on and so forth and if

you really want a lot of space you could

do this but this is very expensive as

you can see um you know like 300

gigabytes cost 125 dollars a month there

is um

another way

which could be equivalent not to buy a

new bigger computer but instead to

basically bind a hard drive

a

an external hard drive and attach it to

your computer say through your usb port

right so that's the option that

could be

applied here if you go to volumes what

you can do is you add a volume which is

simply you know attach an external drive

to your droplet your droplet stays as

big as it was

but now you are connected to a storage

device that can can have a lot more

space

so that is what we're going to do you

just click add volume

and then you you can choose among a

bunch of options the you know 100

gigabytes for example is good for me

and it's pretty cheap

so i'm going to also name it in a way

that is a bit more friendly just volume

is enough i'm going to give a name to

that

and this you know you can see it's going

to be attached to the droplet that we

were seeing before the droplet comes

already with 25 gigabytes but i'm going

to add this 100 gigabytes on top and

the other options are fine you know just

allow

this automatic format and mount whatever

that that means

click here and create volume and and

you're good to go

the next thing i'm going to do and so

you see now that under the name of the

droplet and we see the volume already

included also would like to note that

you can change your mind later and make

it even bigger so you can go to increase

size and choose you know bigger space

and i'm not going to do that i don't

need it for this demo but something you

could do and then of course you can

delete it or you can add more volumes

right so for the one droplets you can

have multiple drives connected to it

right

similar to your normal computer you can

connect multiple external drives so

basically there is no limit to

how much data you could associate to

your droplet

um so now let's have a quick look at um

you know how you actually interact with

that volume and i'm going to do a little

peek into that volume

at least to find it in our system

and then

it's going to be the end of this use

case and then we move on to actually

using that volume for for example

sharing data across team members

something that is a bit more pro than

doing it with dropbox so i'm going to

copy this address here that i mentioned

many times before it's called ipv4 the

name is not important the idea is that

you know this address allows us to pop

up for example a normal terminal in my

computer and use the program ssh

and say hey i'm going to be the root

user at this specific address at this

specific droplet so by running that and

you connect directly to that droplet and

you can use the command df which allows

you to inspect information about the

file system of

any computer including your local

computer i'm going to use the flag minus

h which is means i think it means human

freedom and or something like that and

so that this is going to inform um the

information with um units of signs that

are more readable that i would get

otherwise so for all this information i

want to highlight two lines so this one

here

shows that the droplet comes with those

25 gigabytes already

in it and like if you're curious it's 65

66

usage so i have

not too much to go before it's totally

full and then the second line i want to

show you is this one here so another

device attached this time to the droplet

that gives me a hundred gigabytes right

so this is where i can store most of my

data similar to dropbox i also know

where it is it's mounted on a slash

mount

volume so volume is the name that i gave

to the volume if i set my name my name

will appear here but mound is

is a directory this one here that is by

default uh chosen by

um digitalocean you can change it but

why would you it's a very sensible place

to mount a volume so that's it then you

could do you know the normal stools like

you know ls for slash mount uh to see

what there is in there and fair enough

there is a volume right in there

so that is the end of the first use case

the idea of how to increase the

disk space so that you can store more

data so now we're going to move to

how to use that

volume um to share data across

team members before we do that maybe

it's a good time to make a little pause

and

see if there is any comment here any

question

okay good um

so far it has been more like

learning about how to do something on

digital ocean which is not all that

interesting uh probably the biggest

takeaway is that in most cloud services

i would expect you to be able to find a

way to make the

space for storing data

bigger so that you know as your demands

increase you can also adjust your

infrastructure on the cloud

and now i think it's something that i

find more useful or at least interesting

from the perspective of

an analyst the idea that okay as an

analyst working in a team i would like

to have a way to share data that is

better than dropbox dropper has caused

some problems for because of the paths

that um we need to kind of type on our

computers also because

um to you know to use it fluidly you

need to have kind of dropbox desktop

installing your computer so it's sync

with the cloud also it's used to store

pretty too much data so if you sync

everything then your your local computer

kind of blows up in space there's a

bunch of issues and there are tools that

do that job a lot better so if you use r

or if you use

python then the pins package can help

you basically it's similar to dropbox

you just say where

you know data will be

kind of stored and and you can put it

there but one bit that i'm going to be

showing now is also kind of the behind

the hoods of of creating a folder

similar to dropbox so that it is

possible to share it with team members

i think

if you were in the previous

series about the terminal you will

you could you might remember that you

know when you create a directory

somewhere in a multi-user system that

directory is not accessible to everyone

you may you need specific permissions so

the first thing i'm going to show is how

you can pretty much create a folder that

is shared and everyone has permissions

to read write and execute anything in it

so it's very simple so we're going to be

let me move this to the right and so i

have my terminal here to the left um so

the first thing i want to do is you know

you know we already know that our um

volume is here in slash

m and t so that's our volume so what we

want to do is create a directory inside

it that we're going to dedicate to a

shared data so inside volume

and we want to create a folder called

shared

so it makes sense and we are going to

create it with the command make there

and

so now if i so if i do an ls on a mount

we are going to do it with ll which will

give not only

the you know it will show the contents

of something but also the permissions so

here you can see that um

the folder shared

and

can be written

by and executed and read by the owner in

this case fruit but then

what this means and you might need to

refresh

what this means in the previous

series about the terminal what this

means is that no one other than root can

write things to here for example they

can read things um but the you know it's

pretty limited the permissions of this

folder so we need to change that to make

it similar to dropbox in that anyone can

read things write things and execute

things in it so we're going to do that

with the command change mode this this

is it so this is very technical it's not

something that you could do uh if you're

working for example for 2 degrees it's

something that i could do but i create

that folder and then you use that folder

you can just simply read write and

execute things in it so the command that

i just

run what it does is change

those permissions so that everyone all

that's the a stands for all

gets

read write and execute permission so

let's confirm that

with the ll that we did before

and now you know the name shared prints

in green

and we see that every um every you know

group of three letters here have r w and

x and that means that everyone can read

write and execute things in it so that's

what we want

so that's all that you would you know

someone like me would do behind the

hoods to make that uh folder inside the

volume uh accessible to everyone

why i do that only in a folder and not

to all the volume well because the

volume is a big thing you know we may

want to use it to store a lot of other

things

including data that is private for each

specific user and and you know that you

know one user can write something there

that another user does not see or you

know can't change or remove

so i create this specific folder for

share data

all right so the next thing is also

something that is more kind of developer

oriented is the idea that okay so now we

have

data we have no sorry we have a volume

where we can store data and so now let's

give different

team members a different little computer

so like for example linda and me we

would be now playing the role of

analysts and we both have each one

container each or one little computer

each where we can do whatever we want

you know we have a password we do our

thing

but both of us can write to that share

folder so that for example linda can

write a file that then i can read

so that would be the experience that you

have with something like dropbox for

example right so what i'm gonna

run now is um again pretty technical um

it could it would make sense if you

see

um the series about working with docker

basically what i'm doing is i'm i'm

running a little computer on that cloud

for linda i'm gonna name that computer

linda and i i'm allowing her to connect

to that computer on a specific address

with the number 8787 she has a password

for it and

and she can

see from inside that little computer the

shared folder i have just created so she

has full power to do whatever she wants

in that little

container and she's running uh basically

a computer that already comes with r and

without studio installed and so i'm

going to do the same for this other

user and the user is going to be mauro

me in this case so for a second analyst

so these two analysts have yes by the

way

thank you very much

awesome i think we are on time right

um

i'm gonna push i think another five

minutes should be enough to kind of

demonstrate what i want to show um so

now i have created those computers so

i'm going to show you that docker yes

again you know this if you're scared

about what you're seeing here don't

worry this is something that you could

not likely need to do and but i need

this for the demo i need to show okay

linda gets a computer modulo gets a

computer how you know they can share

data

so this

command docker ps shows running little

computers

inside that droplet that we have on the

cloud and so we each have one with a

password so now we are going to connect

to that i'm going to connect maura i'm

going to linda both to

their own containers and they're going

to basically share some data so what i

do now i need to go to digitalocean and

get that address again that is always

super useful

that address allows me uh in this case

i'm doing the role of linda so linda

connects to the port 8787 on that

address with the username rstudio and

the password her password is one two

three so here is she and she can go here

to the left and now i'm gonna open a

private window so i can get another user

signed in

and and here i'm gonna connect again to

the same address but now to the port

8788 modulo.port and i'm going to run

that and connect him with again our

studio as a user and his password is

three to one

so signing in him here

all right so both of them

are going to be working with bins so

they need to install um

install the pins package

yeah we do that for

linda and we do that here for model 2.

and now

let me just copy paste from

my notes if i find them

where are you notes

here

so what we are going to do now so now um

the experience is that of

an analyst right so we have um

linda in here to my left right and what

she's gonna do is um she already locked

into

her

container she's gonna do library pins to

start using it she already installed it

so she has access to that package and

now she's going to create what's called

a board

or

a board is simply a pointer to a folder

and so she's going to use a function

that comes from

pins it's called board folder

and she's going to give the address uh

where the you know she's going to store

data so that everyone else can see and

do whatever they want with it so it's

going to be amount volume

inside that share and she's going to

write a specific for in a specific order

folder called pins inside that shared

volume

and

all right so that's the board and the

board itself is an object that you know

is not very interesting it just does

things but if you print it you don't get

a data frame or anything like that

but now she will actually work with a

data frame she's going to be using

say that she wants to work with data set

empty cars this is what it looks like

right so she wants to make that um

data set available to mario so what

she's going to do is she's going to use

that board to store it there and she's

going to write that pins

the object that she's gonna write is is

the object

empty cars so that's why it does not

have quotes because it's the the symbol

for the object and then she's gonna name

it md cars or you know it could be

something different it could be my data

my data

okay so the pin has been written you

could confirm that also by you know if

if you were the cloud administrator and

you did an ls on mount

volumes

then you would see that there is a share

directory and inside it there is a pins

directory and now my data appears there

but

if you are manual then you know you

could be in this in this other place

you would also need to attach

the pins package

and then you also need to say well which

is the board that

you know we're going to be connecting to

so we're going to do the function board

folder and he's also going to point to a

mount

mnt

volume

shared pins so he's going to connect to

the same the same board

sorry there you go pins right and now

instead of um of writing data he's going

to use it to read it so board

which i'm going to use the

the pipe that comes from base so the

board

and he's gonna use

bin

breed

with the name uh

my data so that was the name of the data

set and and there he is so as you can

see uh you know we have used the

pins package

to read and write data to a shared

directory and that shared directory is

now inside a volume that is pretty big

has 100 gigabytes of space and that has

internally a shared folder for different

team members to work with

all right and that gets us to the end of

the material so let's go back to your

faces and see what questions or comments

we have

okay nothing here maybe i'm going to

take a moment to like wrap it up and it

could be a lot you know i think uh it is

generally confusing when when i play the

role of the developer and the analyst

and it might be overwhelming to see

actually you know what an uh a developer

has to do and i i feel that you know you

might have the impression oh shooting i

don't wanna all of that that's that's so

much work but so what i'm gonna do now

is kind of distill what we've learned

today but only from the perspective of

the animals so for an analyst basically

they get

a link to a little computer on the cloud

so they put that link on their web

browser

and they can log in to something like

rstudio they just use you know a

username for example our studio at the

password for example one two three and

there they go they are dropped into a

system that has everything they need if

they need something else they might be

able to install it themselves or they

can also ask the

cloud administrator so that for example

that that rstudio

environment has specific packages for

example right

so that's all they need to do basically

point the browser to a specific address

log in with the username and password

and then dropped into this environment

and now

when they need more data and when they

have a lot of data and need more space

they can ask the system administrator

and the system administrator would

add for example a volume so that

suddenly you know their little computers

have a ton of space and they may also

want to share data with other team

members so they need to know exactly

which is the folder

that um is dedicated for that it makes a

lot of sense to put in a specific place

like for example slash mount slash share

sorry slash mount slash volume slash

share

and then if you want a very good way to

share data in r and in python will be

with a pins package which you know has a

dedicated serious

that you can find also on youtube if you

want to learn more about that okay so

that wraps it up from the perspective of

the analyst and it's the end of the

meetup so before i go i'm going to ask

one more time if there is any any

question

or comment

and if not we'll leave it at that thank

you very much everyone and see you next

time

thank you bye

ciao
