---
type: Video Transcript
title: "Using R package structure for data science projects | Kylie Ainslie | Data Science Lab"
description: "I would love to introduce our esteemed guest, our lab manager for today, Kylie Aninsley."
resource: "https://www.youtube.com/watch?v=w1YmNcW19oI"
tags: ["ds-lab", "r-packages", "github", "testing", "git"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T21:59:18Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=w1YmNcW19oI"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2026-02-19T00:00:00Z"
    usage_count: 1747
usage_window: { from: "2026-02-19T00:00:00Z", to: "2026-09-08T21:59:18Z" }
---

# Transcript

00:07: I would love to introduce our esteemed

00:11: guest, our lab manager for today, Kylie

00:14: Aninsley. Kylie, would you like to say

00:16: hello?

00:17: >> Sure. Hi everybody. Thanks for coming.

00:20: All right, Kylie, tell us a little bit

00:22: of background about what you do in data

00:26: science and what we are going to be

00:28: talking about today because it is sort

00:30: of a nice expansion of the comp talk

00:33: that you gave last year at Posit.

00:36: >> Yep. So, I am I don't necessarily

00:39: consider myself a data scientist. I am

00:42: an infectious disease modeler. Um so I

00:45: basically use math stats um and R to

00:48: study how diseases spread and how

00:50: interventions can uh mitigate that

00:53: spread. Um and I've just I'm currently

00:57: in the Netherlands which is why it's

00:59: might seem a bit dark behind me and I've

01:00: just moved to Australia to work for the

01:02: University of Melbourne. Um, but I do a

01:05: lot of coding stuff and so I was really

01:09: actually excited that I Libby asked me

01:11: to be here today because I

01:15: would like to talk about sort of a

01:17: workflow that I kind of happened upon

01:19: accidentally. So I was working in a

01:22: really messy way and I just got really

01:25: frustrated because all of my coding

01:29: projects had different organization. And

01:31: so today I sort of want to talk about

01:33: the way that I've found to make that

01:36: messiness go away and keep everything

01:37: consistent and more efficient. So I'll

01:40: leave it at that for now and then we can

01:42: dive in. Awesome. Yeah, I think that

01:45: this um this is something that I feel

01:48: might be common where you like give a

01:50: conf talk and there's a bunch of stuff

01:52: you wish you could have done live that

01:54: you can't because it's a conf talk

01:55: because you're like I have 15 minutes

01:56: and I can't live code and it's going to

01:58: be all messed up if something goes

01:59: wrong. This is a place where things can

02:00: go wrong and it's totally fine because

02:02: we are just going to be sharing screens

02:04: willy-nilly and um being like messy and

02:07: transparent and open. So with that in

02:09: mind everybody, this is the place to

02:12: stop and ask questions. Um this is not a

02:15: like wait till the end and raise your

02:17: hand type of deal. Um this is a place

02:19: where we put questions in Discord and um

02:23: I can like interrupt Kylie and we can

02:25: ask questions. So, if you have

02:26: clarifying questions, this is the place

02:28: to ask them and be completely open and

02:30: totally fine. Um, I wanted to let

02:34: everybody know that I cannot see very

02:35: well out of my left eye today and I am

02:37: just going to be like squinty and weird.

02:40: Um, don't worry about me. I'm fine. I

02:43: had an eye allergy thing last night. Um,

02:45: but if I'm a little slow today, that's

02:47: what's going on. So, Kylie, I will hand

02:50: it back to you if you would like to go

02:51: ahead and share your screen. Um, and

02:54: then if you ever want to throw it back

02:56: to me or Isabella to share something, I

03:00: am happy to share as well.

03:03: All righty. I have now lost my share

03:06: button because I moved my Zoom chat to a

03:09: different screen. There it is.

03:14: Okay, I'm going to be brave and just

03:16: share my desktop because I have a number

03:18: of different uh windows that I'd like to

03:20: share.

03:22: Oh, look, it's Posatron. Hooray.

03:24: >> Um we'll we'll get to Positron later. Um

03:28: but actually and that's my dog.

03:30: >> But um so what where I wanted to start

03:32: is kind of how I came up came across

03:35: this. So basically the the single line

03:37: of this data science lab is that I want

03:40: to show you how to use the R package

03:42: structure to work work better more

03:45: efficiently and to be better able to

03:47: share the work that you do. And I want

03:49: to preface that with when I say R

03:52: package, I don't mean to make an R

03:55: package that is production ready. I mean

03:58: simply using how an R package is

04:01: structured and some of the advantages

04:03: that come with that to work better. And

04:05: so I came across this when I was doing

04:10: my PhD. And this is an old project

04:13: folder from one of my projects in my

04:15: PhD. So, we're looking here and it's got

04:22: a million different files that all have

04:25: that are like different versions of the

04:27: same file. I had not discovered GitHub

04:28: yet. You've got random like files. I

04:33: don't know what these are. This is some

04:34: data file. This is an R file. Oh my god,

04:37: it's a SAS file. Um like and then and

04:43: then I have some kind of something

04:44: called fluim which has some code maybe

04:46: an R project and then I've got like

04:49: presentations but then more code with

04:53: the same folder as

04:56: >> as over here and then there's different

04:59: I mean just insanity going on and then

05:02: different simulations. It's like what

05:03: does ND5 mean? I have no idea. And so

05:07: when I was doing it, clearly I knew what

05:09: I was doing and I could I guess remember

05:11: what these meant. But then when I had to

05:13: go back a few months later to actually

05:15: write up the manuscript, I had no idea

05:17: where anything was. And so after I

05:20: finished my PhD, I was like, "Okay, I've

05:22: got to do something different." Um, and

05:25: so I discovered the R package uh,

05:29: structure and I worked in a in a group

05:31: that had some pretty sort of techsavvy

05:34: people and they kind of helped me

05:36: through it. Um, and I guess the way that

05:39: I wanted to start is rather than sort of

05:41: sit here and just talk at you about, oh,

05:43: this is what an R package is and this is

05:45: how it's structured, I thought we could

05:47: just kind of try to I can show you sort

05:49: of how to set up the the project, what

05:52: the different folders are, what things

05:53: go in them, and how easy it can be to

05:56: actually set it up. Cuz one of the

05:57: things I think that gets in in the way

05:59: of people using this is they think, "Oh,

06:02: I don't know how to make an R package."

06:05: and I with the sort of modern tools at

06:08: our disposal, it's really really easy.

06:10: So, I thought we'd just try to do it.

06:12: Um, so actually a friend of mine gave me

06:17: a little he gave me some code that he

06:19: thought would make a nice package and I

06:21: was like, great, we're just going to use

06:23: this. And this is what's in it. It's

06:25: just got some R files,

06:27: some what looks to be data files, CSV

06:30: files, um, and a little description of

06:35: what some of the functions do. Um, and

06:38: I've taken that. And so this is this

06:40: might look very similar to what you have

06:42: um, for your projects. Just kind of a

06:44: folder with some different files in it

06:46: of different types that do different

06:48: things. Some of these are functions,

06:49: some of these are scripts, some of this

06:51: is data. And so what I've gone and done

06:53: is I've tried to

06:57: um

06:58: make it a little bit easier for us to

07:00: see. So I've just created a a folder

07:04: that has some data in it. I've split out

07:07: the single R script that had a bunch of

07:10: different functions into individual

07:11: functions. And then I've just put the

07:13: scripts in a folder. Um so now we're

07:17: going to move over to Positron. And

07:19: please stop me if I'm moving too fast or

07:21: if

07:22: >> I think we're okay. But let's let me I'm

07:24: gonna go through Discord really quickly

07:26: and make sure there's lots of people

07:28: just saying like, "Oh my gosh, that

07:30: first messy one either is like cleaner

07:34: than my PhD was or is like, "Oh no, this

07:37: is giving me heart palpitations." Um

07:40: Kieran is being our comedy relief today

07:42: as always with the hilarious file names.

07:46: um like final final edit final. Um I

07:50: have shared my current project structure

07:52: that I have on my screen for everybody

07:54: to see. I have so many different um

07:57: working bays. I call my my files that

08:00: are not final working bay as if I'm in

08:03: Star Wars and I'm working on a

08:04: spaceship. Um I think that we're okay as

08:08: far as questions.

08:10: Yeah, I'll keep going.

08:12: >> All right, let's get started. So, um,

08:16: basically the two things that I

08:20: used the most or did use the most in

08:23: trying to create this was the use this

08:25: package, which is amazing and actually

08:28: makes setting up the actual R file

08:30: structure just really really simple and

08:32: has some really nifty um,

08:37: advantages to like and allows you to

08:39: connect with GitHub and and all sorts of

08:41: stuff. So, it's it's fun. So, um, we'll

08:44: first just

08:48: install some relevant packages here cuz

08:51: I don't actually know if they're

08:52: installed yet.

08:54: Um, definitely live coding.

08:56: >> Oh, I forgot to candle.

08:58: >> I always light a candle in anyone's live

08:59: coding. It's like a superstitious thing,

09:02: but I didn't light one. Something's

09:04: going to go wrong.

09:05: >> Well, it probably will. Um cuz I'm also

09:09: pushing myself to use positron and I

09:13: usually use our studio but I thought you

09:15: know what it's time to just

09:18: >> you know live live coding is the time to

09:21: do something brand new. You're right.

09:23: Yeah.

09:25: >> This is going to be me in about a week

09:26: when we have Edgar Ruiz on to talk about

09:29: the mall package as I um as I live work

09:33: with LLMs. I'm sure something's going to

09:35: go wrong. M fun lolins are so cool. Um

09:41: okay, it looked like that worked. So

09:43: basically

09:45: we've got that. We're just going to

09:46: create uh I'll just do this just so

09:50: people can see what package I'm using.

09:52: Um so actually in order to create the

09:54: package is really easy. It's just

09:59: you write use create package and I'm

10:01: going to call it isolator because this

10:04: is actually a project that was about

10:05: testing and quarantine during the co

10:07: pandemic um and the strategies to do

10:11: that so that people can get out of

10:13: quarantine faster.

10:18: Huzzah. Look at that. I've just got a

10:21: it's already made my package and

10:24: it has an R directory. It's got a couple

10:27: of folders. An R directory currently has

10:29: nothing in it. It's got git ignore build

10:33: ignore. These are things for um GitHub

10:35: and the R package build. It's got a

10:38: description file and if you've never

10:41: written an R package, the description

10:43: file um basically tells what the package

10:47: does. Um, so we can just say, um,

10:53: analyzes,

10:55: sorry guys, it's an Australian group, so

10:57: I have to use an S, not a Z, [laughter]

11:00: analyzes, uh, quarantine

11:04: testing

11:06: strategies or whatever. Okay. And then

11:09: we'll just put

11:12: my name, even though it's really my

11:13: colleagues, but I didn't actually ask if

11:15: he wants me to reveal himself. So

11:17: >> ah okay that's fine. [laughter]

11:19: >> I will

11:20: >> we'll pretend that this is we know we

11:23: know should I put my email if this is

11:26: being recorded. Okay great. So it's just

11:28: just my name. I don't have an email.

11:31: >> No API keys and no emails [laughter]

11:33: needed.

11:34: >> Great. Okay. Description. This package

11:38: does stuff. You know you write what it

11:41: does.

11:43: Um okay cool. That's great. We did that.

11:46: Um, and then the name state space, if

11:49: you also aren't familiar with it, is

11:51: just it's something that's automatically

11:53: generated. So, you don't need to mess

11:56: with it, but it essentially tells what

11:58: is exported and I believe imported for

12:01: the package to work. So, how it

12:02: interacts with other um packages and

12:05: functions. Um, I will come back to that.

12:07: >> Do not edit by hand. I need that warning

12:09: because that's something I would

12:10: absolutely do.

12:12: >> Yeah. Yeah. So, just don't touch it. I

12:14: will do stuff later and come back to it

12:17: and show you what pops up there.

12:19: >> Okay.

12:19: >> Um Okay. So, we don't currently have

12:23: anything in this. So, let's

12:28: go back to my console.

12:34: It's a new console. Great. Okay. Um Oh,

12:38: yeah. Different console now.

12:41: Yeah. Um Okay. What can we what should

12:45: we do next? So, one of the things I want

12:47: to do is just move some files, right?

12:49: >> Okay.

12:49: >> So, I now have this isolator thing and

12:53: it's got an R directory. So, what goes

12:55: in the R directory? What goes in the R

12:57: directory are the functions. So, all the

12:59: things that I have in this folder

13:04: except for that read me there

13:07: go into

13:09: isolator

13:12: R. And to be clear, we're moving from

13:15: >> Oh, sad.

13:16: >> Quarantine testing one. Uh oh.

13:18: [laughter] No.

13:19: >> Oh no. It's okay. We can do it. There we

13:22: go.

13:22: >> Yeah, we did it. Okay. So, we're going

13:24: from quarantine testing to isol.

13:28: >> Yes. So, the quarantine testing was just

13:30: a a

13:34: a name of a folder that I gave myself.

13:35: You can create a package in the same

13:37: directory that you're working in, but I

13:41: like to give packages fun names. So I

13:43: came up with isolator. So I thought, oh,

13:44: I'll just let it I'll just let it make a

13:46: new package. And that's actually a

13:48: really good point. So when I ran the

13:50: create package command, I just let it

13:53: put the folder in my current working

13:55: directory cuz I was already But you can

13:58: actually tell it where to put it if you

14:01: use the create

14:05: package

14:07: path.

14:10: David says

14:11: >> creating his first package, he wasted a

14:13: lot of time editing the namespace file

14:15: and then noticed it wasn't necessary

14:16: when running dev tools document. Yeah,

14:18: see that would be me too, David.

14:20: [laughter]

14:21: >> Yeah. And so that's actually one of the

14:23: really nice things about the sort of our

14:25: workflow that I'll show you is that it

14:26: can actually help you catch mistakes and

14:28: it'll point out some some issues for

14:31: you. But if your package isn't wrapped

14:33: into a or if your code isn't wrapped

14:35: into a package, there's no real way to

14:38: do that. Um, and so that's one of the

14:41: nice things is just sort of catching

14:42: little things like, oh, you've you've

14:44: written the wrong thing in the namespace

14:46: file or you forgot to annotate what uh

14:51: input you need here. Uh, so that's it's

14:54: really helpful. Um, okay.

14:57: >> So we've got our R.

15:00: I don't know why it didn't

15:04: um create the man directory,

15:08: but anyway, we'll continue.

15:12: So, I also one of the first things that

15:14: I do is

15:18: um I'll just do use is I like to connect

15:21: it to GitHub

15:23: so that

15:26: of course not.

15:28: Oh, you got to use use git getit first

15:30: and then use GitHub. Although it already

15:32: has a git ignore file in here.

15:34: >> I always just do it anyway.

15:36: >> There we go.

15:37: >> Just so it initializes with useless.

15:39: Yeah.

15:40: >> Uh

15:42: okay. So I just said use git. And so

15:44: what it did is it then created or it

15:49: added

15:52: uh

15:54: some things to my git ignore cuz that

15:56: was previously I think had just this R

15:58: project user line

15:59: >> I think so.

16:00: >> Yeah,

16:01: >> it added some stuff to my build ignore I

16:04: think. Yes. Um,

16:08: it

16:10: I don't think it did anything to my

16:13: didn't do anything else. Okay. Um, and

16:15: then use get up.

16:19: And Megan is saying you might need to

16:21: run document to generate the main

16:24: folder.

16:27: Oh, okay. Fair. Although we don't have

16:29: any we don't have any.

16:31: >> We might not be there quite yet.

16:33: >> Yeah, because I don't have any preamble.

16:34: So, I've got no RD files.

16:38: So, okay, cool. We'll we'll get there.

16:40: We'll get there, everybody. Uh, let's

16:43: see if this works. If it doesn't, I'll

16:45: just leave it.

16:47: H, I don't want to do it.

16:49: >> Oh, you don't have a PAT set up. That's

16:51: okay. We can skip this.

16:53: >> We'll skip this. Um, just know that if

16:56: you do have a personal access token set

16:57: up or any other form of security into

17:00: GitHub, then you can do use this, use

17:03: GitHub, and it's going to create your uh

17:05: remote repo for you on github.com. It

17:08: will open it in the browser. And that is

17:10: about all that happens. So, I think

17:13: we're good. We can skip it. Yeah, it's

17:16: all good. Um, the other thing that I

17:19: thought would be good is that so

17:21: remember we had some different kinds of

17:22: files. So, we had um I've of course now

17:26: closed my finder, but we had some

17:28: scripts and we had some data and those

17:30: aren't necessarily automatically added.

17:33: Um but it's quite easy to add them

17:35: yourself. So, uh in an R package, all of

17:38: that sort of other stuff that doesn't

17:40: have a specific place. So, like the help

17:43: files, which we'll generate later, the

17:45: code files, um and other types of things

17:49: go into the inst folder. And then within

17:53: the ins folder, you can you can have a

17:55: play. You can have whatever you want. I

17:57: typically have a folder called um X data

18:00: or external data. And then

18:03: oops, I don't want to do that. And then

18:06: one that's called like examples or

18:08: scripts. So we'll call this one

18:10: examples. And then we can go

18:14: into our Oh, here it is. So we had data

18:17: and we had scripts. And these are often

18:20: really useful. I mean, you it's very

18:22: useful to keep all of your files for a

18:24: given project together. Um, but an R

18:27: package wants them put in a very

18:29: specific place. So, for our scripts,

18:32: which have really fun names, don't blame

18:34: me. Um, we will

18:41: put them

18:46: in examples

18:50: and data.

18:53: We'll put

19:00: I'm really struggling with moving files

19:02: today.

19:03: >> It's okay. One thing that I have like I

19:05: remember I took a fundamentals of

19:08: package dev workshop in 2023 from Andy

19:11: Tusher which was amazing at at conf. Um

19:14: and one thing I I feel like he explained

19:16: but I forgot is what all of the

19:18: abbreviations mean and I don't remember

19:20: them anymore. I don't know if anybody

19:22: does but like man manifest manual

19:24: >> manual manual think

19:27: >> there's the the inst where I'm like is

19:30: inst always

19:33: instance instantiate like I don't even

19:35: know tell me all of the names and what

19:37: they mean discord [laughter]

19:41: because there sometimes there is a

19:42: manifest in a project but this is

19:44: manual.

19:48: Yeah exactly. Um, yeah, the the that's

19:52: why that's why I thought it'd be nice to

19:53: kind of go through the the structure

19:55: because it's for the first time you're

19:57: seeing it. It's not necessarily

19:59: intuitive, particularly the in

20:02: >> cuz there's there's a man folder and

20:03: then if you do certain if you use

20:05: certain kinds of documentation like

20:06: vignettes, then there's a docs folder.

20:09: like wait uh so if we jump in yet

20:12: that'll

20:13: >> an inst folder which has examples and

20:15: xed data and I'm guessing x data

20:19: external data

20:21: >> y okay

20:22: >> yeah and that's that's just an old

20:24: convention but you don't actually have

20:25: to call it that you can call it data um

20:28: you can you can call it whatever you

20:29: want so I kind of think of the inst

20:31: folder as sort of my special folder

20:34: where I can really do whatever I want

20:36: >> so basically the R package build kind of

20:40: now somebody correct me if I'm wrong but

20:42: the R package build kind of ignores it.

20:44: It's like okay this is other stuff and

20:48: doesn't put too many regulations on what

20:50: that stuff is.

20:52: >> So like data is not going to be

20:54: accessible through the package as data

20:57: that's built in.

20:59: >> No, not unless you assign it as such.

21:03: >> Okay. But if it's if this package is

21:04: wrapped in a GitHub repo, then it's

21:07: available via the GitHub repo.

21:10: >> Okay.

21:10: >> Yeah.

21:11: >> Yeah. So I I haven't I haven't found a I

21:14: know there's ways to make data

21:16: accessible. Um but that's a part of the

21:18: workflow that I'm I'm not I haven't

21:22: gotten to yet. So the other thing about

21:23: this is that I've been using this

21:25: approach for years and it's I've slowly

21:28: improved, but it's it's not like I have

21:30: all the answers or I do it perfectly.

21:32: So, if you look back here,

21:34: >> if you if you look back at my older

21:36: projects, they're

21:39: they're kind of they're they're

21:40: terrible. You know, the documentation is

21:43: kind of rubbish and there's stuff all

21:45: over the place. And then as I've tried

21:47: to just sort of iterate this with future

21:49: with with more projects, it's slowly

21:51: gotten better. I've learned different

21:53: things. I've learned best practice best

21:55: practices by copying other people, all

21:58: that.

21:59: >> Okay. Fantastic. And that question about

22:01: um X to data also came from Sam. Sam,

22:04: thank you for asking. Um I think that we

22:06: will get around to other stuff, but also

22:10: if anybody has details about writing a

22:13: package that is a data package and what

22:14: that looks like, please answer Sam in

22:17: the Discord. And I'm going to go grab an

22:19: example of a data package and how it's

22:21: structured right now.

22:22: >> All right. So take it take it away,

22:24: Kylie.

22:26: >> All right. Awesome. Yeah. So, one of

22:27: those things that's really great to sort

22:29: of best practices that I just mentioned

22:31: that I've gradually learned is having

22:33: things like a readme to tell you tell

22:36: anyone who's looking at your package

22:38: what it does and maybe how to use it or

22:40: how it's structured, any sort of data

22:42: sources. And so, you can also use

22:46: this use use this um [laughter]

22:51: to um add some of these features. So,

22:54: you can add a readme file. Oops.

22:58: used

23:01: and I like to use the RMD.

23:05: And so this creates a readme file.

23:09: And then the other thing that's also

23:11: really good to have, particularly if you

23:13: want to make your code public, is a

23:16: license file.

23:18: And that tells people how they can and

23:21: cannot use your code.

23:26: And there you see here we've got now a

23:28: license and I've just picked the MIT

23:30: which is a pretty standard gives people

23:32: a lot of uh freedom to use.

23:34: >> Yeah. Yeah. Um but you can see that

23:37: there and then now

23:39: um this line has been added to our

23:42: description folder that says this

23:45: package is covered by the MIT license.

23:49: >> So it's just as easy as that. there are

23:51: different licenses. You can pick which

23:53: one your um organization may have a

23:56: specific one that they want you to use.

23:58: Um so yeah, so those are all good

24:02: things. Um so I guess one thing that I

24:05: think is

24:07: really nice is

24:10: the read me. So, obviously there's

24:13: there's nothing in here um right now.

24:17: But

24:18: where is my

24:21: hold on

24:23: and while you are looking for that,

24:24: everybody in the chat, thank you so much

24:26: for sharing examples of data packages.

24:28: Um Sam had asked about like where does

24:29: the data go that you want your user for

24:32: your package to be able to see and a

24:33: bunch of us shared different data

24:35: packages. I shared the Richmond way

24:37: package by Deepsha Mangani. Um, which is

24:40: a count of all the times Roy Kint says

24:42: the f-word [laughter] in Taso. So, if

24:44: you want to go play with that, please go

24:45: do. Um, and there are lots of questions

24:48: and answers in the Discord. So, thank

24:50: you everybody for being amazing

24:51: answerers. And please tag me in a reply

24:54: to something if I have just missed it

24:56: and it's a question for Kylie.

25:01: All right. I'm just uh

25:03: filling out the read me a little bit.

25:05: So, um because basically I have I have

25:08: two different files here. One is an MD

25:10: and one is an RMD. Um and an RMD is is

25:14: an R markdown file. MD is a markdown

25:17: file. And an R markdown file just looks

25:19: a bit nicer or at least you can look at

25:22: it a bit easier. And so

25:26: now we have some very

25:28: basic stuff, almost nothing on our

25:31: readme, but we can actually

25:34: build it. Let's see if this works.

25:37: Oo, fingers crossed. I have no idea. But

25:41: notice what it's doing. It's installing

25:43: your package in a temporary library and

25:45: building out the readme file in the

25:48: isolator folder.

25:50: Now, did it work? Well, it looks like it

25:54: did, but

25:59: >> also it might things might look

26:00: different in Positron versus R Studio

26:02: for the RMD.

26:04: >> Yeah. So, it it should actually have a

26:10: it should sort of pop it up. Does anyone

26:12: know how to look at a

26:14: >> like it should have So, this is just the

26:16: raw version, but it should actually

26:19: source and visual as well. So you you

26:21: could check out the visual rendering of

26:23: it if you wanted to or you could render

26:26: it which is the top left button in your

26:28: pane

26:29: which is like at the right under the

26:31: description m there's like a little

26:33: button

26:35: >> so under description

26:37: >> yeah sorry the the meeting

26:40: uh

26:40: >> oh is it covering everything it's just

26:42: above

26:44: >> it's at the top left of your source pane

26:47: >> top left source pane

26:50: Yeah.

26:50: >> Help. This is my source pane.

26:53: >> Yes. So to the left.

26:54: >> Okay.

26:55: >> To the top left.

26:56: >> Visual render on save.

26:58: >> Yep. The button to the left of render on

27:00: save.

27:01: >> Sure. Use visual mode.

27:04: Hey. Ah, there it is.

27:06: >> Okay, that's close enough.

27:08: >> Yeah. I mean, it doesn't look great, but

27:09: it's it's it's close enough, but

27:12: basically it makes it look nice. And you

27:14: can have um

27:17: you can tell people how to install your

27:18: package. you can have um examples

27:22: uh all that kind of stuff and you can

27:24: have it with your project. And so it

27:26: just it's a really powerful tool because

27:29: you can actually tell people what your

27:32: project what your code does. You can

27:34: show them how it works and you can show

27:35: them what to expect from it. So to give

27:38: you a a better example of

27:42: a more like a a more finished version is

27:46: that in my I wrote my first crayon

27:49: package last year and so my readme has

27:53: things like what the package does. It's

27:56: called Mighty. Um it's based on a

27:59: Scabies project. So fun. how to install

28:02: it and then yeah it's a it's a

28:05: supermite. Um and some some features

28:09: about how long it should take the main

28:12: functions. So if people are just trying

28:13: to get oriented which functions they're

28:15: probably going to use it's not a very

28:16: big package and then how you use it. And

28:19: so all this is available when someone is

28:22: just looking at this package. It's not

28:24: hidden anywhere. It's right front and

28:26: center. Um, and so that's I found that

28:29: to be really helpful for myself, but

28:31: also for anyone else who I might want to

28:34: collaborate with. I can show them, hey,

28:36: this is what I'm working on. Um, or

28:39: anyone who may want to actually use the

28:40: package.

28:41: >> Yeah. And if you are just creating a

28:43: project that is not a package and you

28:46: are still using this project structure

28:48: to keep yourself straight, um, that

28:50: readme might not look the same. You

28:51: might not be like instructing people to

28:53: use things. Um, but you could have

28:55: descriptions of the main questions in

28:57: your data, the main findings in your

28:59: analyses, things like that. And there

29:01: was question,

29:02: >> although Oh, go ahead.

29:04: >> No, I was going to stop really quickly.

29:05: There was one from James that was, "What

29:06: are the advantages to packaging a

29:08: project compared to more generalized

29:10: templated folder structure like our

29:12: markdown, data, and R." Um, or like, you

29:16: know, some people will have like instead

29:17: of R, it'll be called source. Um and

29:20: then you might have a data with a data

29:22: raw and data final or just data. So what

29:25: are the advantages of doing it in the R

29:28: package style?

29:30: >> Yeah. So that's a great question. So I

29:32: would say the biggest advantage is how

29:36: you share it and how other people can

29:40: access it. So, if you have that file

29:43: structure that you mentioned where

29:45: you've just got everything nice and

29:46: organized and neat, if somebody wants to

29:48: use your code, they still have to

29:50: download all of those all of those

29:52: files. But if you have it wrapped in an

29:54: R package and you have it somewhere that

29:57: they can access it, whether that's a

29:58: shared network drive at work or GitHub

30:01: or GitLab, all they have to do to use

30:05: the code or to reproduce what you've

30:07: done is a single line of code that's,

30:09: you know, install from GitHub or um

30:13: install packages. And so it just makes

30:15: it so much easier to use. The other

30:20: really added benefit is that when it's

30:22: in a package structure, it sort of

30:24: forces you to do some documentation

30:26: things which I'll go through next. um

30:28: like documenting, you know, functions,

30:30: inputs, outputs, um expected behavior

30:34: and things like that that you don't have

30:37: to do if you're just work working

30:40: um sort of by yourself in your own

30:43: project, but that then make your package

30:46: way way easier to use.

30:49: >> Yeah.

30:50: >> And they're automatically generate.

30:52: >> Yeah. Yeah. Yeah, and they're

30:53: automatically generated when you build

30:55: the package, which doesn't happen if you

30:56: just use a a nice organized file

30:58: structure.

31:01: Um, so if you want, we can go through a

31:04: a quick example of sort of the benefits

31:07: of some of that documentation cuz I

31:10: think that's really one of the main

31:11: benefits of using this approach is that

31:14: there are different ways to document

31:15: what you're doing and they help you

31:19: because then you have to actually

31:21: explain what you've done. So if you come

31:22: back to it, you know what you did. You

31:24: know what decisions you made maybe

31:25: during an analysis.

31:26: >> I know what you did. [laughter]

31:30: >> Um but also anyone else. I mean what if

31:33: you have to hand over a project to

31:34: someone? Then you're like, "Oh, I've got

31:36: to write handover notes." But actually,

31:37: you can build all that into an R package

31:39: and say, "Here you go."

31:40: >> Yeah.

31:41: >> It explains it. It explains what to do.

31:44: >> And Tan made a great point, which is um

31:47: tooling for our packages is very robust,

31:50: right? So like you're not on your own.

31:52: You have Roxy too for commenting. You

31:55: have tests that um you have use this

31:58: especially which is already like

32:00: building you whole structures and

32:01: skeleton. So I agree. I think that's a

32:04: really big benefit.

32:06: >> Yeah. You also have a whole textbook.

32:08: >> You do have a whole textbook

32:10: >> and this book is excellent.

32:11: >> Link in the chat.

32:12: >> Yeah. And this book is excellent. It has

32:15: it's really helped me.

32:17: >> Um

32:18: and yeah. So, so you have you have help.

32:22: Um, so that's why I say actually using

32:25: this structure may seem like a bit of

32:27: work at first, but it really has some

32:30: benefits. Um, if you just get over that

32:32: hump and and the likes of Jenny and

32:36: Hadley have made that hump so much

32:38: smaller

32:40: >> in recent years. I remember back when I

32:42: first made an R package and I had to use

32:44: something called

32:45: >> R package skeleton or something.

32:49: And I I don't know what package it came

32:51: from. I think that was the function name

32:52: and it was very confusing. Also, dev

32:55: tools hadn't been broken apart yet, so

32:57: it was really big. Um,

33:00: yeah, it was it was much harder back

33:02: then.

33:03: >> Things always get better over time.

33:06: Okay,

33:06: >> do they go Libby? [laughter]

33:09: >> We have about 22 minutes left. Let's see

33:11: how much further we can get in our

33:14: example project here. I told you I could

33:17: fill 50 minutes, Libby. I told you. Um,

33:20: okay. So, I'm going to try to just write

33:22: some quick um our oxygen preamble. So,

33:25: the first thing I've done is I've just

33:28: added this um apostrophe rather than

33:32: just a t typical comment. So, this is

33:34: recognized by Roxygen. Is it Roxygen? R

33:37: oxygen. What?

33:38: >> How do you all say it? I say Roxyen.

33:40: >> I also say Roxyen. [clears throat]

33:42: >> Okay. I yeah I say r o o o o o o o o o o

33:44: o o o o o o o o o ox oxygen, but I think

33:45: the correct is Roxyen. It's just I've

33:47: been programming for like 15 years and

33:49: now I have to change how I say

33:50: something. It's really hard.

33:51: >> It does not matter. I you know what code

33:54: is a written language, not always a

33:56: spoken one. And I say say it however you

33:59: want.

34:01: >> So anyway, we'll we'll go through this.

34:03: So hopefully we can generate a man file.

34:05: Um, so basically with uh Roxygen

34:09: preamble, you you write it before any of

34:13: your functions and it should have a sort

34:16: of a titleish or a very brief statement

34:19: of what the function does and then more

34:21: details on the function. This is a

34:23: really simple one that just abbreviates

34:25: Australian state names. Um, but then you

34:28: can use you can specify what goes into

34:32: the function. So in this case the

34:34: parameter is any sort of input argument

34:36: and that is

34:38: state names

34:41: if I can spell and then name. Oh we can

34:45: say uh

34:48: also don't judge me on how these

34:52: functions are. I didn't write them.

34:54: >> Not that they're bad. Just

34:56: >> yeah. Um so I'll just do character

34:58: string.

35:00: Kylie will not be taking questions at

35:01: this time about the code. [laughter]

35:04: I actually got this tip from Jenny Brian

35:06: because I I I watched a talk of hers

35:08: about uh making packages and she put the

35:12: the type of argument and then what it

35:14: does name of and I thought oh actually

35:18: that's really helpful because just

35:20: saying the like maybe number of I don't

35:24: know scabies mites on your skin doesn't

35:29: necessarily tell you if it needs to be a

35:31: character string or a number or an

35:34: integer or something. Um, so I started

35:38: to use that name of Australian

35:43: state. Okay, luckily this one only has a

35:46: single um parameter. So then we also

35:50: want to put what we expect the function

35:52: to return which this function was

35:55: written poorly and there is no return.

35:57: So I guess it returns

35:58: >> there's an implicit return here, not an

36:00: explicit. So, I got into it. I got into

36:04: it one time with somebody over implicit

36:05: versus explicit returns. I would love to

36:07: see people in the chat tell me, do you

36:10: type return at the end of your functions

36:12: or do you leave it implicit?

36:14: >> I am an explicit girly every single

36:17: >> explicit person.

36:18: >> Yeah.

36:19: >> Every single thing I do, I want it to be

36:21: like clearly typed, clearly uh telling

36:23: you what you're going to get.

36:25: >> Everybody in the chat is saying

36:27: explicit. Thank you. Thank you, y'all. I

36:29: mean, I'm I'm kind of tempted to just

36:33: like change this. Or actually, why don't

36:35: we just do this? Let's just do

36:38: RTN

36:40: >> and then return RTN.

36:43: >> Yep. It's classic

36:46: there. I actually don't know what state

36:49: names is supposed to be. Like, is it a

36:53: vector?

36:55: I actually don't know. Um, good

36:57: question. Anyway, we'll we'll figure

36:59: this out later, but converted state

37:03: names. Cool. Okay. Do we need to use So,

37:06: the other thing is that you can specify

37:08: what um dependencies it has. So, in this

37:12: case, we need to import does anyone know

37:15: what uh package case when is from?

37:20: >> Is it deep player?

37:21: >> Mhm.

37:21: >> Okay. So, we can import from

37:25: deeply.

37:27: because I did a deep dive while I was

37:29: writing trivia for virtual day last

37:30: year.

37:31: >> This is a this is great. I I'm going to

37:33: start just taking over the data science

37:36: lab to do my own projects and ask live

37:37: questions.

37:38: >> This is the power of of um not vibe

37:41: coding but pair coding where you get a

37:43: you know extra brain or in this case

37:46: extra 60s something brains that are

37:48: helping you.

37:50: >> Yes. Okay. I think that's I think that's

37:53: good. And then you export it which

37:54: basically means you want the function to

37:57: be sort of visible. Um

38:01: yeah if anyone has a better explanation

38:04: please export it means like it's

38:06: accessible through a double colon with

38:10: your namespace. So um when you type out

38:14: isolator and then your double colon it's

38:16: like not hidden and accessible as a

38:19: function in your package. I think that

38:21: that's right to stop me if I'm wrong. I

38:23: see Megan nodding, so I'm like, "Yeah,

38:24: okay. I think I'm right."

38:26: >> Amazing.

38:27: >> Pass the [laughter] Megan check.

38:28: >> Okay, I'm gonna try to uh basically sort

38:33: of implement this preamble that I've

38:35: just written by doing dev tools

38:37: document.

38:38: Oh.

38:39: >> Oh, what?

38:40: >> Oh, no. [laughter]

38:42: God.

38:45: >> Oh, no. What is happening? install

38:49: [laughter]

38:50: >> live coding nor I thought you lit a

38:52: candle

38:54: >> and we weren't going to have any live

38:55: coding problems.

38:57: >> Okay. Did this work?

38:59: >> I think so. Let's try it again.

39:01: >> I mean

39:03: wait library [laughter]

39:05: d

39:06: >> Oh, sorry guys. Sorry. Sorry.

39:09: I'm

39:11: >> I'm losing it. Can't can't see out of

39:13: one eye. Having live coding problems.

39:16: >> It worked. It's fine. It's fine. I knew

39:18: I was taking a risk. All right, let's

39:20: try it. Things will probably break.

39:23: >> Oh, we're going. Nothing. Nothing broke.

39:26: Okay, let's go look. Okay, whoever said

39:28: the man folder would appear when we did

39:30: uh document. Absolutely. Right. Thank

39:33: you, Megan. So, now we have a man folder

39:37: and

39:39: >> I don't know why it has figures, but

39:41: sure. That's great. Oh, there must be

39:42: figures in my readme file.

39:44: >> And then we have this automatically

39:46: generated

39:47: uh RD file which has all the information

39:50: that we put in and because we hit export

39:53: let's go look at our namespace

39:55: it had export and import so that's

39:59: awesome and a cool thing is

40:02: >> I think isolator is already loaded so

40:05: the other great thing about an R package

40:07: that you don't get with a different file

40:09: structure is that if you're using your

40:11: own package or someone else's and you

40:13: think what does this function do or what

40:15: is what type type of argument do I need?

40:17: You should be able to use abbreviate

40:23: state.

40:24: >> Oops.

40:24: >> I think we misspelled abbreviate.

40:27: >> You know what?

40:27: >> And Ken, I see your question. I am going

40:30: to hop in in just a minute.

40:32: >> Booyah. Look at that.

40:35: automatically generated help file that

40:37: you can access by just using a question

40:41: mark and the name of the function rather

40:44: than having to go search through some

40:45: sort of file structure to find a read me

40:48: or go through comments in the code. It's

40:50: right thereing. So that's

40:52: >> Yeah.

40:52: >> Yep. I love it. And for anybody

40:54: wondering um this package that like

40:56: doesn't exist on Cray is being installed

41:00: on Kylie's machine locally by the dev

41:02: tools package. So um creating our

41:05: packages is its own whole thing and like

41:09: they exist in like temporary folders

41:12: while you are building them and stuff.

41:13: So that's a little bit more complicated

41:15: but just rest assured that's what's

41:16: happening

41:17: >> in the background. And oh, and the other

41:20: thing that I that now we need to deal

41:22: with is that because I've told

41:28: the package gods that I need to import

41:31: from dlier.

41:34: Now I need to make sure that in our

41:36: description file we have the

41:39: dependencies listed. So there should be

41:41: a section for the the packages that uh

41:45: the that your package depends on.

41:48: or if you have a vignette what packages

41:51: that needs and use this makes this

41:54: really easy. Sorry if I'm not explaining

41:55: it very well. Um so you just say use

41:59: package

42:02: depier

42:05: and type equals

42:09: imports. So that means that when your

42:12: package is in is installed, it will also

42:14: install dlier because in order for our

42:18: functions or this particular function to

42:20: run, we need dlier

42:22: and we do that. And now look at that.

42:25: Our description file has imports dlier.

42:28: >> Amazing.

42:29: >> Yeah. So it's really really easy. And so

42:32: oxygen rocks

42:35: and

42:37: but but the other piece about it that I

42:40: I talk about in my talk which I'm sure

42:42: is a more eloquent version of this lab

42:45: uh is that you can actually write that

42:47: preamble as your live coding. You know

42:49: you're writing a function to do stuff

42:51: and you can actually just quick do um

42:55: let's see if I can find it again. Yeah,

42:58: you can just quickly say, okay, what

42:59: what parameters, what kind, what do I

43:02: expect? Because I don't know about you,

43:03: but with me, I'll write a function and

43:06: then I'll change my mind and I'll say,

43:07: oh, I had this as a as a matrix. Oh, but

43:10: I think a data frame would be better. Or

43:13: >> I had a character, but this is getting

43:14: too confusing. It's a string. I need a

43:17: number. I'll just convert it. So, I

43:19: change my mind and I can kind of keep

43:20: track of all of that by just updating

43:23: the preamble.

43:25: And then, you know, if you use something

43:26: like GitHub or version control, you can

43:28: obviously keep track of the changes that

43:29: you've made, but it's always there. And

43:31: so, you can just do that as you're

43:33: writing. And so, it's something that

43:34: I've started to do. It's like I'm I'm

43:37: I'm making a function and rather than

43:38: writing all of my code and then going

43:40: back and documenting it, I'm starting to

43:42: do it as I code.

43:44: >> Yeah, that's another great benefit. All

43:46: right, I want to stop really quickly and

43:47: ask Ken's question, which was, can you

43:50: just use require D player at the top?

43:54: And that's a good question. I don't use

43:56: require a lot and I am the worst person

43:58: to answer this question.

44:00: >> I don't either, but at the top of what?

44:05: at the top of like the function page or

44:09: sorry the function script

44:11: >> that is I think what it is because we

44:13: were requiring case win for our function

44:15: and so I think that the question was

44:16: like could you just put require D player

44:18: at the top instead of that sort of like

44:21: um dependency of needing to have the

44:24: package use D player

44:28: I so I my intuition and I can't explain

44:32: why is that something would break

44:34: Because isn't require

44:38: like require just only works if you're

44:43: running that script, right? So if you

44:45: actually like source that script, then

44:48: it will run require. Whereas this

44:51: actually is embedded in the information

44:54: of the package. So when you download the

44:56: package, even if you never ever use this

44:59: function, you'll still be able to use it

45:03: because all of the necessary

45:05: dependencies have been installed.

45:07: >> Yeah, I think that that is correct. Um I

45:09: know that you cannot use library within

45:11: a package. That's not something that

45:14: that you're going to be doing. I do not

45:16: use require. I think I've only ever used

45:18: import. So if you Oh, yeah. Ken says in

45:22: the actual function itself, not in the

45:24: comments to it. Um, so yeah, if anybody

45:26: has extra information on when you use

45:29: require

45:30: and how you use import, pop it in the

45:32: chat.

45:32: >> So, um, I Tan says that library and

45:36: require actually modify the user's name

45:38: space, which is in capitals very

45:42: >> very. [laughter]

45:43: So again, we're I I'm not a software

45:47: developer. So when we get to some of

45:49: these technical things, I've just kind

45:51: of followed standard practice and tried

45:53: not to break things.

45:54: >> So explaining but explain. Yeah, it's a

45:57: great question. Um

45:58: >> I'm just not super able to

46:02: >> answer it.

46:03: >> Yeah. And Daniel also says like require

46:06: returns true false. So if the package

46:08: doesn't exist, it's just going to be

46:09: false and it's not going to error. So

46:11: then you'll have a really bad time when

46:12: you actually try to use the function. So

46:15: for packaging

46:17: um it's better to do your your

46:20: requirements and your imports and stuff.

46:22: Um and David Ander also says like

46:25: require and library are going to work

46:26: locally but when you install the package

46:28: it will not install those dependent

46:30: packages because they are not in that

46:31: sort of import dependency.

46:35: >> All right, perfect. Thank you everybody

46:37: for hopping in the chat and helping us

46:39: all learn together.

46:41: Okay, there's there's two things that I

46:45: want to try to do in the next 8 minutes.

46:48: >> Let's do it.

46:49: >> Um, okay. So, one, Libby, this one's for

46:52: you, is we can make a package on

46:54: website.

46:55: >> Yeah, this is my favorite part, y'all.

46:57: >> So, you can make if you if you if you

47:00: want to, you can make a package on

47:03: website. And I hope this works because,

47:05: you know, I haven't connected it to

47:07: anything. Fingers crossed. We don't have

47:08: a We don't have a GitHub of repo.

47:10: [laughter]

47:11: Oh no.

47:12: >> Package down is not an exported object

47:13: from namespace. Use this. Oh, because I

47:16: didn't

47:16: >> package down package.

47:18: >> Oh my god.

47:19: >> I just stuck package down as a package

47:21: in the chat. It's also one of my

47:22: favorite hack stickers. That little

47:25: brown box is so cute.

47:28: I just I've

47:32: Oh, that's okay. My gosh. I'm just not

47:36: firing on all cylinders here.

47:38: >> It's the cursor coding.

47:40: >> There we go. It just isn't working.

47:43: >> Okay. So, now we have we've done use

47:46: package down. It's added some stuff to

47:49: our

47:51: uh directory. So, now we have

47:56: um I don't see

48:01: Oh, adding docs. We don't have any docs.

48:03: Okay. Okay. Well, we don't have anything

48:04: to actually

48:06: show, but it's got this package down yl,

48:09: which is great. And it's just done some

48:11: setup for us. Um, and then let's all

48:15: fingers crossed that this works. We can

48:17: actually just in two lines of code. I

48:19: think we should be able to build a site.

48:25: >> Everybody cross your fingers.

48:28: [gasps]

48:29: >> Installing a temporary copying. Oh my

48:32: god, everybody. No

48:36: >> fancy.

48:38: >> What is fancy? Do we have a dependency

48:41: somewhere?

48:42: >> Probably.

48:45: >> That we have not explicitly imported.

48:48: Probably because there's a billion uh

48:52: that's

48:54: that stinks. I really wanted to.

48:56: >> That's okay.

48:57: >> Oh well. Anyway, it is that easy if you

49:00: don't have, you know, I'm just going to

49:02: install fancy. I don't know where it

49:03: came from.

49:05: But

49:07: let's see if that allows us to do it.

49:10: Who knows?

49:11: >> Daniel Chen says, "Install packages

49:13: until it works."

49:14: >> Isabella says, "That we know what fancy

49:18: is, but it needed it and we did it."

49:21: >> Yeah. So this is nonsensical because

49:23: this is basically just the the basic

49:25: readme with the title, my name, our

49:28: license, but it was that simple. So now

49:32: you can have uh this and you can Yeah,

49:36: this shows what functions. We've only

49:37: exported one function, you know, a bunch

49:40: of functions in there. That reference

49:41: then becomes like, hey, here's a web

49:43: page for each of your functions and like

49:45: all the information about it. And for

49:47: that to be automatic is amazing.

49:52: >> Yeah. And then when you want to the next

49:56: and one of my favorite aspects of the R

49:58: package is the vignette. So I was

50:00: talking about how the read me you can

50:01: combine um code and results and text and

50:06: everything. You can also do that. Well,

50:09: it's the same file struct uh same file

50:12: format. So with a vignette you can have

50:14: a our markdown file which shows which

50:16: has the analysis that you've done and

50:18: actually I can show an example if this

50:24: would go away.

50:26: So you have got the

50:28: >> the zoom bot up there. I'm sorry.

50:30: >> It's all right. I I can So this is the

50:32: package that I made. So this is the read

50:34: me that I showed you earlier which is

50:36: always the homepage of the package down

50:38: site. But then I have some vignettes and

50:42: um some of them is like a quick start

50:44: guide. So you know, welcome to my

50:46: package.

50:48: Let's load some required stuff. Let's

50:51: this is what it's going to do. Here's

50:53: some useful information. And then let's

50:56: start doing stuff with data. Let's

50:57: simulate some data. Let's look at it.

50:59: Let's visualize it. And then let's use

51:02: the package to do stuff. And that's

51:04: really awesome. So you could think of

51:06: actually this this could be your sort of

51:09: lab notebook. You could use this as like

51:10: I'm doing my analysis

51:12: >> and you can you can just kind of work

51:15: work through it. And to set up the

51:17: vignettes is again very very simple. It

51:21: is just use

51:23: vignette.

51:25: And you can use different engines inside

51:28: of use vignette. So like if you wanted

51:30: to use quarto as your engine you could

51:32: or or markdown as your engine. Um I am

51:35: not an expert in all of that but you can

51:37: go check out the vignette engines and

51:39: Google away and you will find lots of

51:41: info.

51:42: >> Yeah. So um Libbyy's talking about this

51:47: particular here.

51:49: Yeah.

51:49: >> Our engineer

51:52: for a long time wasn't um wasn't

51:54: supported and so

51:56: >> but now it is which is awesome because I

51:58: was looking to switch. Um, I've run into

52:01: some snags with the CTO engine, um, just

52:04: lately, specifically around using the

52:06: library function. So, there might be

52:09: some snags still or some rough edges,

52:11: but it's it's going in the right

52:12: direction.

52:15: Um, there was a question earlier. We

52:17: only have 3 minutes left.

52:19: >> It was, what is the role of the use this

52:23: of use package in everything that we

52:26: did? because I've always strayed away

52:28: from require/ library but wondering if

52:30: I'm off the use package. I think that's

52:33: what we talked about earlier where like

52:35: we want it to be sealed into our package

52:38: as a dependency and have our package be

52:41: able to access it so it can use it in

52:43: other functions.

52:45: Yeah. So the so the the use package um

52:48: all it does is just

52:51: tells it adds a line to your description

52:55: file and basically says that in order to

52:58: use the the functionality of the package

53:01: that you're making, you need to use

53:05: functions from other packages. So it's

53:08: just declare yeah it's just declaring

53:10: those dependencies. That's all it's

53:13: doing. So it's it's not And then it it

53:16: actually then when you when you load the

53:18: package or install the package, then if

53:22: those dependencies aren't already

53:23: installed in your machine, it will then

53:26: make sure that you

53:29: um that they are installed

53:31: >> and they're all wrapped up and packaged

53:33: with your actual package. Okay. Yeah.

53:35: And yeah, good. Well, we only have a

53:38: minute left, so if there's one more

53:39: thing we can button up, then we're good.

53:41: And then everything else that didn't get

53:42: answered, I we will try to answer in the

53:44: chat.

53:46: Um, yeah. So, I guess the other great

53:49: thing about this is now that we have

53:50: this package, um, while we're testing

53:53: it, you can actually install everything

53:55: in one line. So, if if it's on GitHub or

54:00: something, this changes. But while

54:01: you're while you're working, let's say,

54:03: you know, you go away, you close your

54:05: computer, you come back and you want to

54:07: start using this, rather than having to

54:10: source all those different files or

54:12: write a file that sources all of them,

54:14: you just go into your package directory

54:17: and type dev tools load all and it loads

54:20: everything. So it so then now you can

54:22: just use it as if you were using any

54:24: other package even though this is very

54:26: much being built. And I found that saves

54:29: a lot of time when just working on

54:32: something.

54:34: >> I love it.

54:36: >> Yeah. I hope everybody learned a lot.

54:38: We're at the top of the hour, so we will

54:40: let you go. We know that you have

54:41: meetings to go to. Kylie, thank you so

54:42: much for joining us today and walking us

54:44: through and being vulnerable and live

54:46: coding.

54:47: I hope that you learned a ton. Please

54:49: hop in the chat and thank Kylie for

54:52: being so so brave to live code in front

54:54: of the entire internet. Um, if you have

54:58: extra questions, pop them in the chat.

55:01: We will come through and attempt to

55:03: answer them. Thank you for spending time

55:05: with us. See you on Thursday at the Day

55:07: Science Hangout if you would like to

55:09: come to that. And then see you next week

55:11: where I think we have Edgar going

55:13: through the mall package and Elmer. Um,

55:16: thank you so much. We'll see you in a

55:18: couple of days or a week. Bye everybody.

55:21: Bye everybody. Thanks for joining.
