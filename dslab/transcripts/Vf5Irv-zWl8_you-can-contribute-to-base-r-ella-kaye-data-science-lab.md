---
type: Video Transcript
title: "YOU can contribute to base R! | Ella Kaye | Data Science Lab"
description: "I would love to introduce you today to not only my Posit co-host Isabella Velasquez."
resource: "https://www.youtube.com/watch?v=Vf5Irv-zWl8"
tags: ["ds-lab", "tidyverse", "r-packages", "containers", "github"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T21:59:18Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=Vf5Irv-zWl8"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2026-05-18T00:00:00Z"
    usage_count: 484
usage_window: { from: "2026-05-18T00:00:00Z", to: "2026-09-08T21:59:18Z" }
---

# Transcript

00:07: I would love to introduce you today to

00:11: not only my Posit co-host Isabella

00:14: Velasquez. Isabella, would you like to

00:16: say hello? Hi everyone.

00:18: Yes, and also special

00:20: Posit co-host guest today Rachel is

00:22: here. Rachel, you want to say hi? Hey,

00:25: I'm just hanging out. I just happened to

00:26: not have a meeting at this time, so I'm

00:28: like I'm going to jump in. So exciting.

00:30: If you don't know Rachel, Rachel is the

00:32: person who many years ago started the

00:34: data science hangout, and she's the

00:35: reason pretty much that the domino

00:38: effect of all of us being here happened.

00:40: And of course, our lab manager for

00:42: today, we have Ella K. Ella, would you

00:45: like to introduce yourself? Hello. Yes,

00:47: hi. I'm Ella. Um

00:49: professionally, I am a senior research

00:51: software engineer at the University of

00:54: Birmingham, which has taken me some

00:55: getting used to because I've only been

00:57: there for for less than a month. Very

00:59: excited to be there. I work on base R,

01:01: and in particular trying to get people

01:03: to contribute to base R. So, this is

01:05: very much in my in my wheelhouse today,

01:07: and delighted for the opportunity to to

01:09: speak on this subject, and delighted

01:12: that so many of you are here. Thank you

01:13: so much Libby and Isabella for inviting

01:15: me.

01:16: Well, we are super excited to talk about

01:18: this. Um I don't know about everybody

01:20: else, but I learned base R first. It's

01:23: all I learned.

01:24: I learned it in undergrad in university,

01:26: and I did did not learn the tidyverse

01:28: until like 2021.

01:31: I was mostly grad school graduated

01:34: working in my first data job. Um

01:37: so, I would love to hear from every from

01:38: everybody in the chat your path through

01:42: R. Are you a base R girly? Do you, like

01:45: me, think in base R and then have to

01:47: translate that actively into something

01:49: else before you type it? Because I often

01:52: find myself doing that even after years

01:54: of teaching tidyverse.

01:56: Um so, I think it would be great to get

01:59: started, Ella. Oh, go ahead. F So, I

02:02: have

02:03: for

02:04: um, icebreaker here today, some arcade

02:09: and

02:10: um

02:11: Yeah, Libby warned me when prepping for

02:13: this that that some folks might even not

02:15: even be quite familiar with the

02:17: distinction between base R and tidyverse

02:19: and might not think that they know base

02:20: R and maybe they do know more base R

02:22: than they think we did they do. So, we

02:24: decided to get started with a what's

02:26: base R, what's tidyverse. So, here is a

02:30: very short R script which mixes base R

02:32: and and tidyverse. So, let's get started

02:34: with like what's base R here and what's

02:36: tidyverse.

02:39: So, I would I would love to get some

02:41: some feedback from the

02:43: from the

02:44: from the from the chat and like

02:48: what do you recognize as as base R and

02:49: what do you recognize as tidyverse? Cuz

02:51: I have done this to look like tidyverse

02:52: code, but there is some sneaky

02:55: base R sneaking in.

02:57: All right, a lot of people are typing in

02:59: the chat right here. Lauren says,

03:01: "Master's program taught base R first

03:03: and then we moved into our studio in

03:06: tidyverse." Moving into our studio tells

03:08: me that maybe base R and console R is

03:11: what you were using first, Lauren.

03:13: All of my R files in undergrad were

03:15: definitely just text files. I didn't I

03:18: didn't use like dot R files

03:21: um, for a couple of years.

03:24: Oh, a little shout out here for the

03:26: owhale e package by Fonty Carl. I have a

03:28: little whale in my console because

03:30: on

03:31: randomly two times out of every seven

03:33: times I open my R console, I get a whale

03:36: telling me a pun.

03:38: I love it. Fonty, that's amazing. If you

03:41: don't know who Fonty Carl is, you can

03:42: look up Fonty on uh, Blue Sky. I think

03:45: you'll find Fonty there. Okay, so Lauren

03:48: says yes, R console and and R studio.

03:51: Josh says, "R library

03:55: mean

03:56: C all base R functions."

03:59: Aha, library function, mean function,

04:02: and the C function,

04:04: which stands for combine, I believe. It

04:07: does. Um

04:10: I will let you answer that, but I think

04:11: Josh has it.

04:13: Yeah, that's more, though.

04:15: There are more. What else are we

04:16: missing? What else in there is base R?

04:20: Uh Alex

04:22: >> [laughter]

04:23: >> Alex says, "Master's program only taught

04:25: SAS. Moved on to base and tidyverse so

04:27: fast after that."

04:29: >> [laughter]

04:32: >> Uh Nick same.

04:36: So, I snuck in a couple of couple more

04:38: bits of of of base R that might be hard

04:40: to spot, particularly if people aren't

04:41: familiar with these relatively recent

04:43: additions to this base R, and one of

04:45: them is penguins. If you're familiar

04:47: with the penguins data set from Palmer

04:48: Penguins, as of R 4.5,

04:52: the penguins data is now in base R.

04:54: There is no library Palmer Penguins

04:55: here. This penguins is coming to you

04:58: courtesy of base R.

05:00: And another thing that is um

05:04: might not recognize immediately as base

05:05: R, but these color names are built into

05:08: base R. So, the ability to name a color

05:11: and have that plotted, the ability to

05:13: have it as a hex, and again, another

05:15: relatively new addition is the ability

05:18: to

05:19: uh specify a three-digit hex. This was

05:22: new in R 4.3,

05:25: I believe. Um I've been a little bit

05:28: sneaky here in my choice of what base R

05:31: to to add to here because I am

05:34: highlighting here a couple of

05:35: contributions that I made. So, putting

05:38: penguins into base R was something that

05:39: I worked on, as was three-digit hexes.

05:42: So, yeah, folks contribute to base R,

05:44: and uh the the the language evolves and

05:47: changes, and it keeps doing so and these

05:49: are some some recent additions.

05:51: That's so exciting. Thank you, Ella.

05:53: Everybody say thank you, Ella, for

05:54: making penguins in Bee star a thing.

05:56: That excites me to no end, but we will

05:59: also point out that um Jeff said, "What

06:02: type of pipe is that?" Well, that is the

06:04: native pipe in R, but that's just the

06:06: font that Ella's using that turns it

06:09: into that triangle. Ella, you want to

06:10: talk about that? I I do because I really

06:13: love typography. So, yeah, so this I was

06:16: going to mention this, so thank you for

06:18: reminding me that I wanted to talk

06:19: about. This is a base R pipe and we type

06:22: it with a

06:24: uh

06:25: pipe like that and then a uh greater

06:27: than or equals to sign and then that. It

06:30: happened really quickly, but that put

06:31: them together into

06:33: >> it into the uh Discord chat in

06:37: its original form before it gets

06:39: transformed by the font. comes easier

06:41: for other people to see, I can change my

06:45: font settings here. So, I use a font

06:49: called MonoLisa.

06:52: Um and this I've got by preference a

06:54: version with ligatures, but I will

06:56: change that setting.

06:58: And I think Fira Code is also one that

07:01: turns that into

07:02: >> Fira Code will will do that for you.

07:04: That's a free font. Yeah, Fira and that

07:06: is spelled F I R A for MonoLisa. The

07:09: Fira Code

07:10: F I R A everybody. So, okay. base pipe

07:14: Well, we're 11 minutes in, so we better

07:16: start moving on. I am going to do a live

07:19: demo and the thing that I'm going to

07:21: live demo necessarily takes time because

07:25: we're going to talk about contributing

07:26: to base R and we're going to do that by

07:30: means of a live demo of me fixing

07:34: a bug in

07:36: base R.

07:37: Um I wasn't quite brave enough to do

07:41: uh

07:42: do a to to do a an outstanding bug. I'm

07:46: going to take off back to a bug that

07:48: existed in a previous version of R that

07:50: is now fixed and I'll talk to you when I

07:53: do it about why I'm doing that bug. But

07:55: I also wanted to talk a little bit while

07:58: I'm getting going with this. So I'm

07:59: going to start by going

08:02: to a GitHub link on the R-devel

08:06: organization. So this is the

08:08: organization that belongs to the R

08:10: contribute working group and I'll be

08:11: saying more about them later and I am

08:14: going to go to R-dev-ends.

08:17: And what I'm going to do here is I'm

08:19: going to scroll down from here and we're

08:21: going to spin up a code space by

08:24: clicking this open in GitHub code

08:25: spaces.

08:27: And that's going to happen and most of

08:29: these settings are good except I'm in

08:31: the UK. So I'm going to choose Europe

08:34: West here.

08:35: We're going to create a code space and

08:37: this is going to take about two and a

08:38: half to three minutes just to to

08:41: initialize that. So while they we're

08:45: doing that I'm just going to talk a

08:46: little bit about what do I even mean by

08:50: by base R and by contributing to base R.

08:53: So we we had a look at a few base R

08:55: functions but really when we're talking

08:56: about base R what what I mean by that is

08:59: what we get when we download R. Like if

09:03: we go to r-project.org

09:05: and click through to download R, what

09:07: are we getting?

09:08: Um

09:09: and it is a little

09:11: bit of a of a

09:13: of a fudge to call this base R because

09:16: the the R distribution that you

09:18: download, the the functions that you can

09:21: run without any other calls to library

09:25: is actually a collection of packages. We

09:27: don't always think of them as packages

09:29: because we don't have to load them as

09:30: library but they are a collection of

09:31: packages and base is one of those

09:34: packages but there are many others and

09:37: there is a link and hopefully Isabella

09:38: will share it which is all the packages

09:41: that come when you download base R. So,

09:43: there's base, but there's also utils and

09:46: data sets and stats and a and a whole

09:48: host of

09:49: of others.

09:51: So, that's that's what we mean by by

09:54: by base R. I'm using it to refer to that

09:56: whole distribution. And by contributing

10:00: to base R, there are lots of different

10:01: ways that people can do that. So, if I

10:04: look like I'm looking off slightly to my

10:06: right, it's because I've got some notes

10:07: on on another monitor just just to my

10:09: right here. So, um

10:12: by contributing to base R, a ton of

10:14: different ways to to do that

10:16: with varying different levels of of

10:19: [snorts] technical proficiency. So, one

10:22: thing that people can do is review bugs

10:25: and analyze them

10:27: and and and comment on them. There's the

10:29: Bugzilla platform for that that I'll be

10:31: showing later.

10:33: There is also

10:35: the the opportunity to to fix bugs and

10:37: to test proposed fixes

10:40: or even filing a bug report. If you come

10:42: across a bug in base R, it's really

10:45: great to know about that.

10:47: But, it's not all about about the code.

10:49: There's also documentation. So, there

10:51: are contributions around improving

10:53: documentation for for functions in base

10:55: R.

10:56: And then there's a whole other side of

10:58: contributing to base R which is around

11:00: translations. So, all of R's messages,

11:04: everything that appears in the console,

11:06: was written in English, but there has

11:07: been extraordinary work going on for a

11:09: number of years to translate those

11:11: messages so that those are picked up by

11:13: people's locales.

11:14: And there's a whole team working on that

11:15: as well. So, that is another way of

11:17: contributing to base R.

11:18: But, we are going to do

11:21: um

11:24: we are going to

11:25: do a

11:27: fix.

11:28: So, we are going to fix a bug

11:32: in the stem function. So, I'm going to

11:34: go back here to my Positron and I'm

11:37: going to show

11:40: a script that I've got here

11:42: um

11:44: which shows stem.

11:46: But, I'm also up here, I'm in the latest

11:49: release of R. I am in R 4.5.3.

11:53: But, R has the Positron makes it really

11:56: easy to switch between different

11:58: versions of R. So, I'm going to open up

12:00: a new interpreter session and I'm going

12:02: to go back to R 4.4.3,

12:05: which is where

12:07: this version of the bug last existed.

12:09: So, it's

12:10: >> Same journey.

12:11: We have

12:13: a vector

12:15: in

12:17: in R. Can people see my console down at

12:19: the bottom there? We good for seeing and

12:22: >> I can see it. Yes. Everybody okay? I

12:24: think we're okay. And we have a couple

12:25: of questions stacking up already. So,

12:27: whenever you want to take a break to

12:28: answer a couple, we can do that.

12:31: Yes, let's have some questions.

12:33: All right. So, Josh had asked, "I'm

12:35: wondering if the base R team has a help

12:38: wanted {slash} good first issue space

12:40: similar to what R Open Sci has?" And I

12:43: think we're going to get to resources in

12:45: just a little bit. So, that might be

12:46: part of it. But, do you have a quick

12:48: answer for this one now? Yes, so that

12:51: doesn't exist really in R's bug tracker,

12:54: which is on Bugzilla, which is the one

12:56: that the R core team uses. But, we have

12:59: um a repo under the R Devel organization

13:03: for R Dev Days and I'm definitely going

13:04: to be talking about R Dev Days later,

13:06: which feature some like hand-picked

13:09: issues that are

13:11: we hope people will work on on developer

13:12: days. It's not

13:14: quite a kind of get started because they

13:16: are ones that have been kind of

13:18: hand-picked for developer days, but

13:19: those would be like a good indication of

13:22: the kind of

13:23: bugs that you can get started with.

13:25: Yeah. And today, what Ella's is with the

13:27: stem function is also a great example of

13:29: like something that you could find and

13:32: you could submit yourself. This one's

13:33: already been fixed where you're going

13:34: back in time,

13:36: but it is a good example. The other

13:37: question was from Rory and it's a fun

13:39: one. It says, is there anything

13:40: especially interesting about the base R

13:43: code base? Like Easter eggs or fun

13:45: tidbits? I don't know.

13:49: Well,

13:50: one of the things that we're going to

13:50: get to today that's kind of fun about R,

13:53: well, depending on your definition of

13:55: fun, is that most a lot of R is not

13:59: written in R. It's written in C. So,

14:01: part of the reason that I picked this

14:04: bug to talk to today is when we find it,

14:06: the fix is really simple, but it does

14:08: take a little bit of digging and

14:10: detective work to get to it. And that's

14:12: why

14:14: that's that's part of the the fun of it

14:15: and that's what I want to show today. I

14:17: want to show you some C code, but I also

14:19: want to show you that you don't have to

14:20: be scared of the C code even if you

14:22: don't know any C. Yeah, let's get to it.

14:24: Let's show them the stem function. So,

14:26: this is the stem bug as it existed.

14:27: Well, first there was a problem with the

14:29: alignment. Okay, so that looks a bit out

14:31: of whack. So, that was a problem. Um

14:35: Here is stem

14:37: on a vector of two and here is stem

14:41: on a vector of one.

14:43: Um

14:44: No, nothing. We're not seeing anything,

14:47: right? There is nothing. If you do stem

14:48: on a vector of one, you don't get

14:50: anything. And admittedly, it's not a

14:52: great plot, but there is no reason in

14:55: principle why you couldn't at least have

14:57: that. And it feels weird to have um a

15:01: line of code where you could expect

15:03: something and just have nothing to

15:04: happen. So, not a life-changing um

15:08: uh change to the to the base R code.

15:10: Stem is a bit of a anachronistic

15:12: historical function anyway, but this is

15:15: this is a kind of nice one. So, what

15:16: we're going to talk about is how how we

15:19: get to how we get to this. How we get

15:21: how we dig down to this problem and how

15:23: we fix it. But to do that, we need a

15:25: copy of the R source code to play with.

15:29: So, we don't want to go Well, even if we

15:32: wanted to, we can't go right to the R

15:35: um

15:36: uh code uh itself. That's maintained and

15:39: managed only by the R core uh team uh

15:42: obviously for for good reason. So, we

15:43: need a copy. And the easiest place to

15:46: browse a copy of it is at github.com/

15:51: R-devel/R

15:54: -svn. And the reason it's R-svn is

15:58: because R is actually developed and

15:59: version controlled on subversion, not

16:02: with Git and not on GitHub. So, this is

16:05: only a mirror, but this is one place

16:07: where we can go to to browse the code.

16:09: And we can we can download it as well as

16:12: we can from any any Git repository.

16:15: And that gets us one thing. This gives

16:16: us a copy of the source files uh the

16:18: source code files to to play with and

16:20: edit. But we are still missing a couple

16:22: of other crucial ingredients. And one of

16:24: those is the ability to build R from

16:27: source. So, you've got this bunch of of

16:29: of of files. It's really just text. We

16:31: need to kind of build that into R.

16:33: And this has historically been a really

16:35: big barrier to people contributing to R

16:38: because uh you can build R from source

16:41: on your own computer, but it takes a lot

16:43: of setup and it's a it's a big it's a

16:45: big hurdle.

16:46: And there is a third thing we need,

16:47: which is the ability to create patch

16:49: files.

16:50: And so, uh sort of like a document

16:53: that's going to be you can think of

16:54: equivalently to a to a

16:56: pull request. So, it's it's a text file

16:59: which creates your changes uh which

17:02: which records the changes that the R

17:04: core team can patch into into their copy

17:07: of R.

17:09: So, we need three things. And there is a

17:10: place now where we can get all of those.

17:12: And that is in this R

17:15: uh dev container which I've just set up.

17:17: So, we have this dev container uh uh

17:20: and at the moment it's just a container.

17:22: There's nothing really in it. So, we're

17:23: going to walk through

17:26: a tutorial

17:28: to

17:30: um

17:32: to get through it. And that tutorial

17:34: I'm going to I'm going to interrupt and

17:36: make sure that we have two things. One,

17:38: if anybody is confused about what a stem

17:40: plot is,

17:42: please ask so we can explain.

17:44: Uh but also, how did you get to the

17:47: place where you could even spin up the

17:49: dev container? If you could just show

17:51: that part one more time.

17:52: >> back again cuz I'm actually on this page

17:53: now. So, we're in R develop develop R of

17:56: GitHub on the R dev env and I went

17:59: through to this open in GitHub code

18:02: spaces. Perfect. And I clicked that and

18:05: that got me now after like two or three

18:07: minutes of waiting for that to spin up.

18:09: That got me that. But the other thing I

18:10: want from this site is this link here

18:13: which are the docs.

18:15: Okay? So, I'm going to pull that out

18:17: separately.

18:19: Uh so, we're going to have that on one

18:21: side and we're going to have the dev

18:22: container on the other side. You know,

18:23: you're just going to see me

18:25: walk through all of this but now I don't

18:27: have quite enough screen real estate and

18:29: I also have this zoom bar here that I

18:30: want to move out of the way. Okay, so

18:32: I'm going to close down that sidebar

18:34: and that gets me a bit more space.

18:36: Right, so we're going to go in here and

18:37: we're going to go to the tutorials and

18:39: we're going to specifically go through

18:40: the one on building R. And this talks us

18:43: through it and it talks us through what

18:45: we've got. So, we the R dev container

18:48: comes with some handy things. So, it

18:50: comes with some environment variables,

18:52: the build directory, build there, the

18:54: top source directory, and the patch

18:56: directory. So, well you'll see how we're

18:58: going to use those as we go through. And

19:01: the first thing we're going to do is

19:02: we're going to check out the R source

19:04: code. So, instead of kind of downloading

19:06: it from a copy from Git, we're going to

19:07: get these from subversion and there's a

19:10: code to do that here, and typically when

19:13: we are working on

19:17: patches and developing base R, we do

19:20: that from R devel. We do that from the

19:22: very latest version of the source code,

19:25: and that's called the trunk, but that is

19:27: not what I want because I want to take

19:29: us back in time

19:31: to

19:32: the last version of R

19:34: that had this bug, and that was R

19:39: 4

19:41: 4

19:42: 3.

19:43: All right. And while we're doing this,

19:45: let's answer Rory's question, which is

19:47: 4.4.3. Is SVN scary to use?

19:51: Is SVN scary to use? Yes, is it very

19:54: different maybe from Git?

19:57: Um

19:58: what Not if you follow these steps.

20:02: Okay. And you work in the R dev

20:04: container because the R dev container

20:05: has everything you need in it. So, it's

20:07: got Subversion, it's got everything we

20:09: need to to build R, and the steps that

20:13: I'm going to talk you through by through

20:15: the building R and the developing a

20:17: patch

20:18: will just show you the commands that you

20:20: need to run, and those are the only ones

20:21: that you will you will need. Perfect.

20:24: Yeah, and if anybody if you're an R

20:25: Studio user and you've ever like opened

20:28: a new project and you've clicked the

20:30: thing that says like new project from

20:31: version control,

20:33: if you've ever noticed SVN is one of

20:35: your options like GitHub is one, but SVN

20:37: is another.

20:38: So, if you haven't seen that word in a

20:40: long time, but you recognize it, that's

20:41: probably where you see it from.

20:43: So, we now have in this Subversion SVN

20:46: directory these This is all the source

20:49: code. These are all the source code

20:51: files for R that we have now

20:54: copied and have available to us.

20:56: Um and then the next thing we're going

20:58: to do is we're going to download the

20:59: recommended packages.

21:01: So, I'm going to run this line of code.

21:02: The rest other than that one change to

21:05: 4.4.3, everything else is going to run.

21:08: So, I'm doing the downloading the

21:10: recommended packages.

21:12: Um so, we have things like foreign

21:14: lattice and This is just like best

21:17: practices. And now we're going to

21:18: change. So, that's the source code which

21:20: we've put in the SVN, and now we're

21:22: going to change to the build directory.

21:25: So, we've

21:27: we've we've got this flag

21:30: um to the path we want and now we're

21:31: going to make that directory, and then

21:34: we are going to the

21:36: move into it. So, I'm kind of slightly

21:39: rushing through these Linux commands,

21:40: but we're changing directory CD into the

21:43: build directory. Okay. And you see here,

21:46: this is where it is. There's nothing in

21:47: here yet in this build directory, but

21:50: we're we're making it and we're in it.

21:53: And now we're going to configure the

21:55: build. So, we're just going to

21:58: not worry too much about what any of

22:00: these lines of code are

22:02: um

22:02: doing other than knowing that we can

22:04: just kind of copy and paste them and

22:05: they're all going to work cuz we are in

22:07: the in the arm, you know. They're all

22:09: going to work and they're all supposed

22:11: to be working.

22:11: >> That's exactly what we want in a live

22:13: demo. It's everything just working. So,

22:16: this is going to run for about

22:18: a minute. And then

22:20: >> Oh, go ahead. I was like, "Whoa, we have

22:22: a break cuz something's running." Yes,

22:24: tell me everything. I was going to say,

22:26: Amelia asked a question, but it's for

22:27: Isabella and I. It says, "Can a future

22:29: DS Lab be on how to set up dev

22:31: containers for things like teaching R or

22:34: to make it easier for people to run a

22:35: shiny app, etc." Amelia, amazing

22:38: question. We have so many things coming

22:40: in the future. That was not on my radar,

22:42: but it is now. Isabella's going to put a

22:44: poll in the chat for you while we're at

22:46: our like halfway mark, right? 26 minutes

22:48: in. Um let's go ahead and do a little

22:51: poll because we have

22:53: a short list of future topics that we

22:55: would love to know your opinion on. And

22:57: there are so many more and they're all

22:58: amazing ideas.

23:00: Yay, there's a poll. Okay, everybody go

23:02: vote on your favorites.

23:05: So while you are voting, I am going to

23:07: run the command that is going to take

23:08: the longest. So we have all these source

23:10: to it. We've got all these the source

23:12: code and we've configured our build and

23:15: now we need to make it. I'm sorry, we

23:17: need to actually build R and to do that

23:19: we run this make command and this is

23:21: going to take 5 to 10 minutes. Don't

23:23: worry, we've got other things to talk

23:24: about for 5 to 10 minutes but we all get

23:26: that

23:28: set this going. We are going to make R

23:30: and while we are doing this, we are

23:31: going to dig down and find

23:35: the stem bug. So we know what to fix

23:38: when this is when this is all made. And

23:40: to do this, I'm going to take us back

23:42: into our Positron because there are some

23:43: really nice things that we can see here.

23:45: So this is a trick that folks may or may

23:48: not be familiar with but when we want to

23:49: debug something, we often need to look

23:51: at the source code for a function. And

23:54: if you in Positron or in R Studio write

23:57: the name of a function but no

23:59: parentheses

24:01: and click enter on that send that

24:05: to

24:06: the console. There it is. This is the

24:08: base R code

24:11: for the stem function. But there's

24:12: actually something even nicer. This is

24:14: nice in in in R Studio but it's even

24:17: nicer in Positron. It's if you view a

24:19: function

24:21: this will pick up in here. This is the

24:23: graphics.r with which is the file in the

24:27: base R source code that contains the

24:30: stem function and we've gone right to

24:31: the stem function and now we can see it.

24:33: We can see the definition and we can see

24:35: exactly where it is and we can see this

24:36: definition and we can see that we're

24:38: starting off by doing a bunch of checks

24:40: on the arguments

24:42: and then you get this line here.

24:46: .Call C_

24:49: stemleaf.

24:50: So We did it. We found the C. We found

24:54: Well, we found something that looks like

24:56: C. So let's

24:58: Let's go back and

25:00: and check this. C underscore

25:03: stem

25:04: leaf, cuz that worked really nicely for

25:06: our R function.

25:09: It doesn't for C functions.

25:11: Unfortunately, it's looking for an

25:12: object. It does not recognize it. So,

25:14: this is where we need to go back and

25:17: look in the in the source code. But,

25:19: we're in a dev container, which is

25:23: a

25:23: version of VS Code. So, we should

25:27: we should be able to do this. C

25:30: underscore

25:31: stem leaf, and find it here.

25:35: And this is you can click the little

25:36: search icon on your top left, but you

25:38: could also do control shift S.

25:40: >> a different find here, so I went control

25:42: shift F C underscore stem leaf.

25:44: Unfortunately, we know that there is a

25:46: bug in the current release version of

25:48: the dev container, where this search

25:50: isn't working on the first thing. This

25:52: is fixed in the dev version.

25:56: But, for this version, we are going to

25:59: open our settings, and we are going to

26:03: unclick

26:04: search ignore files.

26:06: So, that's just like something that will

26:08: be fixed in the in the new release. And

26:11: I was thinking about going off the dev

26:12: version for today, but there is a worse

26:14: bug than that in the current dev

26:15: version.

26:16: >> [laughter]

26:17: >> So, we're not

26:18: in the dev version. But, that's how you

26:19: fix it for now. And now, if you've done

26:21: that fix, we now see it. And here we go.

26:24: There are three different functions

26:25: here. The name space

26:28: um the

26:31: uh

26:32: the the stem.R, which is what we're

26:34: calling it, graphics.h.

26:37: If H is a header file, what we want is a

26:39: C file, and we have it here. Stem

26:43: stem.c. This here is our definition of C

26:47: underscore stem leaf.

26:49: And now, this might be looking a little

26:50: bit weirder, because this is C code and

26:53: it's not only any C code, this is R's C

26:56: API. So even if you know some C code,

26:58: some of this might look unfamiliar and

27:00: in particular this thing, the S exp

27:03: is how

27:05: all our objects are stored in C. So

27:10: C is a typed language, so the return we

27:12: need a type for return, type for all the

27:14: arguments and these are the S exps. But

27:17: let's let's not worry too much about

27:18: that and let's not

27:20: Uh and if we go through this, even if

27:22: we've never seen R's C API before, if we

27:26: look at this a little bit, we might

27:28: start seeing things that look familiar

27:29: or at least we think we can get our head

27:31: around. So we're looking at the type of

27:33: something, so that seems

27:36: kind of intuitive if you're familiar

27:37: with types of C objects.

27:39: And if it's not a real S exp, so we're

27:42: looking at is something that is real. So

27:45: that we can start to get our heads

27:47: around the kinds of things that these

27:48: must be doing and we're getting errors

27:49: if they're not and we're kind of keeping

27:51: on going down and we're doing lots more

27:53: checking. There's lots more if if if and

27:55: then we get to the meat of something

27:57: else, which is this function, stem_leaf.

28:02: So this is another function here, that

28:04: this seems to be where the meat of of of

28:07: the business is, in the stem_leaf

28:09: function. So now we can search for stem_

28:13: underscore

28:15: um

28:16: leaf.

28:20: Yes, and we I'm going to

28:22: break us right here and answer one

28:24: question.

28:25: Yes.

28:26: >> And it was from both Nathan and Brent

28:28: because we put a poll in the chat asking

28:30: about topics and they both went, "Wait,

28:32: what is unit testing?" What a good

28:33: question. Unit testing is testing

28:37: the as small as you can get them parts

28:40: of your code,

28:42: the little parts that make up the whole,

28:44: to make sure that your entire code base

28:47: is working as expected. So, you could

28:49: write a unit test that tests a function

28:51: or a function that is called by another

28:53: function or a whole little set of

28:56: functions that do a specific thing.

28:58: Um and all of that testing, you would

29:00: rerun once you had changed something

29:02: inside of your code to make sure that

29:03: all the bits and pieces of your code

29:05: were working again as expected. So,

29:07: that's what that is. Um and then let's

29:09: keep going. The only other thing I

29:11: wanted to mention was Isabella stuck

29:12: something to CS50's

29:14: course from Harvard. Um the CS50 course.

29:18: That's a great place to learn C. The

29:19: first 6 weeks at least are you're going

29:21: to

29:22: lead up to and learn C. Not exactly the

29:25: same as

29:26: uh the R dev version of C, but a really

29:29: great place to start.

29:31: All right, I'll let you take it back

29:32: away with stem_leaf in the C.

29:35: >> Okay.

29:36: So, we we've talked down. We've seen the

29:38: stem function. We've seen C_stem_leaf.

29:40: And now we're looking at stem_leaf.

29:43: And if we look here in line 60 and 61,

29:47: we have found our problem.

29:50: So, we might argue that this

29:52: at least for the case where you're not

29:54: seeing anything

29:56: for running a command like

30:00: stem of two,

30:02: it is because here it is baked in that

30:05: if we have fewer than one argument

30:08: or less than or equal to one argument,

30:10: it is just going to return false.

30:13: And we are done. So, we could

30:14: technically argue that this is not a bug

30:16: because

30:18: this was deliberate behavior that

30:19: somebody in our core wrote into into our

30:23: at at some point.

30:26: And this brings me to another point

30:28: about contributing to base R. If you

30:30: want to make a change to the C source

30:33: code, you need to have the buy-in from

30:36: an R core member who is willing to

30:38: accept that it is a bug or something

30:40: that they are willing to change. So,

30:44: um we one good place, while we're just

30:46: waiting for this to to finish building,

30:49: to look at is Bugzilla. So, I've

30:51: mentioned Bugzilla a couple of times

30:53: now. So, Bugzilla is bugs.r-project.org,

30:57: which is the bug tracking system for R.

30:59: So, this is the R's

31:03: version of Bugzilla and I've got an

31:05: account in here. Um

31:08: and

31:10: this this is where the bugs are. You can

31:12: think of this a bit like GitHub issues,

31:14: but not GitHub and not Git. Um you can

31:18: browse

31:20: here to browse for R

31:22: the latest bugs by various different

31:24: categories or if you know the number of

31:26: the bug, you can type it in here and we

31:29: know that well, you might not know. I

31:31: know that this is bug 8934.

31:33: We can see it's closed fixed, but what

31:35: you want to be looking at on Bugzilla is

31:39: is this a bug that has been reported? If

31:41: so, is there any discussion by any

31:43: member of R core about what kind of fix

31:47: they would be willing to consider. So,

31:49: this is where the the bug was

31:51: originally listed here. And so, it goes

31:55: on and there is some discussion here

31:57: about whether they're willing to fix

32:00: this or not. So, I am hoping now, yes,

32:04: we are built. We are we are good to go.

32:07: Woohoo!

32:08: The next thing that you would typically

32:10: do, if you are following through

32:13: this, is to check that the that the

32:17: build has worked. And sometimes on R

32:19: develop, like very occasionally, it

32:21: doesn't. It should

32:23: um always be a working version of R. I

32:25: am not going to run that now, because

32:28: this is a tagged release of R. We

32:29: definitely know that this works, but

32:32: this is an important command to know,

32:33: because if we, when we are making any

32:35: changes,

32:37: um we have to run make check to check

32:40: that we haven't broken R with our

32:42: changes.

32:43: So,

32:44: uh we've got make check, but the other

32:46: thing that we need to know is which

32:49: version of R to run. So, there is a

32:50: little script built into the dev

32:53: container. Actually, I'm going to make

32:54: this text a bit bigger as well, which is

32:57: which {underscore} R.

33:00: And this is going to tell us which

33:01: version of R we want to use when we do

33:03: this. The version that we're building

33:06: ourselves or the version that is built

33:08: into the dev container.

33:11: So,

33:12: in the in the current release of the dev

33:15: container, the built-in version is R

33:16: 4.4.1.

33:18: In the version on the developer branch

33:19: of the dev container, that's now up to R

33:21: 4.5. And here is number two is R devel.

33:25: So, as I said, we would typically be

33:27: checking out R devel, and it therefore

33:29: calls this R devel. Although, in our

33:31: case, what is R devel is really this

33:35: uh 4.4.3.

33:36: So, I'm going to do number two

33:39: here. So, that when we start an R

33:42: terminal, it's going to use the version

33:45: that we're building, which is in this

33:46: build directory that we now have.

33:50: So,

33:52: that's R.

33:53: We've got R built into our container

33:55: now, and our development version at

33:57: that. So, if I click down here at the

33:59: bottom, R not attached, this is going to

34:02: attach R, and it is going to give us a

34:05: familiar-looking R console. And let's

34:07: just check this. stem of two

34:11: on the version that we have is not

34:13: working. Nothing is happening.

34:15: stem with one argument stem with one

34:18: argument, which in this case I've

34:21: made it two. And the reason I've always

34:23: done this is because that was the

34:24: version

34:26: that they was in the original bug

34:27: report.

34:29: So, let's see what happens if we go and

34:31: play with the R source code. Let us

34:36: comment out these two lines of code.

34:39: Come on.

34:42: Why?

34:44: >> [laughter]

34:45: >> Of all the uh problems I anticipated

34:47: having today, it would not be able to

34:49: comment out something.

34:51: Keyboard not working.

34:53: Oh, you are kidding me.

34:56: Aw. Kidding me.

34:58: Um No control shift C, nothing.

35:01: >> [laughter]

35:03: >> I don't believe it. Okay, this is this

35:05: is not even that's not even my that's

35:07: not even running off of my

35:11: uh off of my laptop keyboard or my

35:13: external keyboard. Right. Uh

35:16: da da da. Let's just

35:19: try reloading that.

35:21: Um

35:22: >> [clears throat]

35:23: >> Ooh, is this going to rebuild our code

35:25: space? Did we not light enough candles,

35:27: everybody?

35:29: We We lit We lit at least one earlier.

35:31: Go and light a candle.

35:33: We did.

35:35: All right. So, I have deleted two lines

35:38: of the C source of the R source code,

35:40: only in my local copy, only in this dev

35:42: container. But, we are now going to go

35:44: back to our terminal. We're going to

35:45: quit out of R

35:48: because we now have to rebuild R.

35:51: And we do that by running make again.

35:53: And thankfully, this time it's not going

35:55: to take 5 to 10 minutes because it only

35:57: changes

35:59: the things

36:00: that were changed. So, that was That was

36:02: pretty quick.

36:04: So, now, let's us reattach R.

36:08: And this will be our dev version because

36:10: that's what we said we wanted, the one

36:11: based on our source code. And now, let's

36:13: do stem of two.

36:16: We have stem of two. Hooray! We fixed R.

36:20: We fixed R in the R source code, but

36:22: only

36:24: in the dev container. So, the next thing

36:26: that we would want to do if we are happy

36:29: with our fix, well, the next thing we

36:31: want to do is run

36:33: make check.

36:35: So, we're going to let that run for for

36:38: about 3 minutes. This always takes the

36:41: same amount of time, but while we are

36:43: running make check to check that taking

36:45: out those two lines of the source code

36:47: didn't break anything.

36:49: Um we are going to look at another part

36:52: of the tutorial.

36:54: Which is here. We're going to go back

36:56: down here and we're now creating a patch

36:58: file.

37:00: So,

37:01: we are going to do that in a second. Are

37:03: there any questions while we are waiting

37:05: for the check to happen? We've got about

37:06: a minute or two.

37:08: I think we're okay. We were all saying

37:10: that we forgot to light candles, but

37:11: also there's just like lots of like,

37:13: "Oh, I'm so glad I'm not the only one

37:15: who has strange things happen like

37:19: I'm able to use my keyboard when I'm

37:21: live coding or teaching." You're

37:22: absolutely not alone. It's scientific

37:25: proof that if something has never gone

37:27: wrong before, it will go go wrong when

37:29: you're live coding. [laughter]

37:30: But thankfully it was my keyboard and

37:32: not the dev container and not uh

37:35: or anything like that. So, what we're

37:37: we're running this make check and it's

37:38: checking and we're seeing lots of okays.

37:40: So, this is encouraging.

37:43: Um

37:44: so, it goes through and it tests all

37:45: these its examples.

37:47: Like I would be very surprised if taking

37:49: out those few lines of our code

37:52: broke anything.

37:53: >> [laughter]

37:54: >> But you still have to go through this

37:56: process and I have worked on bugs that I

37:57: did not expect to break things that have

37:59: broken things.

38:01: Um

38:02: so, we're going to we're going to let

38:03: this run and while we're doing that,

38:06: we are going to talk about this creating

38:09: a patch file. So, what we're going to do

38:11: is create something that's going to it's

38:13: it's a diff file. So, these kind of

38:15: things you might be familiar with the

38:17: appearance of them if you've ever used

38:19: get and and

38:21: seen seeing those differences. Um so

38:26: yes,

38:27: um

38:28: that we are we are close. We are very

38:29: close now to this bit

38:32: uh

38:33: being done, but

38:35: we

38:37: yeah when when we started this, I said

38:39: that we had these three different kind

38:40: of environment variables built in. So,

38:43: we have been working in the build

38:44: directory. That was where we were

38:46: running make and and make check and the

38:48: like. So, the first thing we are going

38:50: to do uh when we have our when we have

38:52: our console back, is we are going to go

38:54: back uh change directory back into the

38:57: into the source

38:58: source directory. And this kind of to

39:00: answer the earlier question about SVN,

39:02: this is the only other SVN command that

39:04: we are going to use.

39:05: So, this is the SVN

39:08: um is going to create a diff. So, we'll

39:11: look for anything that's different. And

39:13: it's going to send it into the patch dir

39:16: that we created and which we can see in

39:18: here is the one that we called

39:21: uh patches. So, patches is currently

39:23: empty, but we're going to put a patch in

39:24: there. Hey, hey, we've got it back.

39:26: Okay, so we're going to change back.

39:30: So, we're currently in the build

39:32: directory, but we're going to copy and

39:34: paste that and we're going to go back to

39:36: Now, we're in our source directory, the

39:38: source code files, and we're going to

39:39: run this SVN command to create a diff

39:41: and we're going to put that output into

39:43: a file in the patch directory.

39:46: Um

39:48: and we're not going to call it this

39:49: because

39:51: um as they advise, you want to name it

39:53: something that's related to the bug

39:55: number and give it a some kind of

39:56: descriptive name. So, this is the 8 934.

40:00: We're calling this n equals 1.

40:03: So,

40:04: and that's a dot diff file. So, that's

40:05: the extension and we're going to run

40:07: that.

40:09: And if we now look back here

40:12: into our

40:14: uh it's where all we've got in our

40:17: patches file. Here it is. This is our

40:19: diff file. So, it's not a big diff

40:22: because

40:23: we didn't change a lot, but we have uh,

40:27: a revision against our working copy.

40:29: Uh, working copy against the the version

40:32: that was checked out, and we have

40:33: deleted three lines of code. So, we see

40:35: that in red, you know, sort of dark red

40:37: that's hard to see, and we've got these

40:39: subtract signs cuz we we've taken that

40:40: away.

40:41: So, now we have a file, but that file is

40:44: still stuck in the R dev container. So,

40:46: we need to get it out of the R dev

40:47: container, and the way we do that we're

40:48: going to right click on it

40:51: or whatever you need to do on whatever

40:52: operating system you are to get up that

40:54: menu, and we're just going to

40:56: we're going to download it.

40:58: I have a question while we're doing

40:59: that. Yeah. Where did we get the bug

41:02: number from? So, you named it 8934. Was

41:05: that from Bugzilla? That is Bugzilla.

41:08: Yeah. Okay.

41:10: Fantastic. That was the name of the bug

41:12: that was that you had already looked up,

41:14: but if it didn't exist yet, it we

41:15: wouldn't have a bug number? Exactly. And

41:18: you would definitely want to be raising

41:19: a bug and getting some buy-in from our

41:21: core before you went about creating a

41:25: patch.

41:26: But,

41:27: also while we're on the subject of how

41:30: we find good first issues, the way that

41:32: I came about this and and went to work

41:35: on it was through I mentioned under the

41:38: R devel organization, the

41:41: um,

41:43: uh,

41:45: dev day.

41:46: So, these are issues that kind of get

41:48: handpicked as like good contributor

41:52: issues.

41:53: Um,

41:55: and this one is now

41:58: closed. Uh, but if I call look for stem

42:02: in the closed issues. So, this was an

42:05: issue that was pulled out for an R

42:06: developer day,

42:08: uh, which I'll be talking about very,

42:09: very soon. It says a little bit more

42:11: about it and some discussion about

42:14: about how that how that fix is going to

42:17: go.

42:18: Um but I've downloaded that and we

42:21: should now have

42:23: on my computer this

42:29: this fix.

42:31: So, now we've got this as just a a

42:33: regular

42:35: a regular file. Um obviously I have been

42:37: practicing this, so this is now

42:39: got this after dot

42:41: two because I've obviously got another

42:43: copy of it somewhere

42:45: in my in my downloads file. But if we

42:47: were now working on this and we went

42:50: back to our

42:53: Bugzilla

42:58: we would have an option to add an

43:00: attachment here, which would be

43:02: essentially like

43:04: a manual way of submitting a a pull

43:06: request. So, that is what the the R core

43:08: team could take and then patch into into

43:10: beta.

43:11: Um which is sort of what happened in

43:13: this case.

43:15: Although actually in this case the the

43:16: the the fix that we made during the R

43:18: dev day was to the vertical bar

43:21: alignment issue and this n equals one

43:24: issue was was such a small one that

43:27: somebody from R core mathematics went in

43:28: and and fixed it and and did change it.

43:31: No need to save it. Right. So, no need

43:33: to to do it. But like I picked that

43:36: today cuz I thought that was a bug that

43:37: we would be able to work through. I have

43:39: a a small question, which might be a big

43:41: question. How did you go about adding

43:44: penguins then? Cuz it's not a bug, but

43:46: it's an addition. Did you post something

43:49: on Bugzilla or was that a totally

43:50: different thing? This was a completely

43:53: and utterly different different process.

43:55: So, when I got in touch with the

43:59: the authors of Palmer Penguins, it's

44:01: like, "Hey, wouldn't it be great if this

44:03: was in in beta?" And they said,

44:06: "Yes, it would be."

44:08: Um so, we we had the R project sprint

44:11: coming up. So, I there were some R core

44:13: people there. So, I had a chat with some

44:15: people from R core about whether they

44:16: would like they would like that. Um and

44:19: they said that they were happy to. So, I

44:21: did some work on preparing that. And

44:23: actually, I do have a link for that and

44:25: I think I put that in the notes that I

44:27: shared with Isabella. So, maybe Isabella

44:29: can because I have put onto Zenodo

44:33: um as part of the prep for for that

44:36: patch, I had put onto the Zenodo all the

44:38: files that changed.

44:40: Perfect.

44:42: And that.

44:43: So, so that was fun. But, like the

44:45: hardest part of that part of that

44:47: project was convincing R core to do it.

44:49: Uh that they wanted it because the data

44:51: is available in part of the penguin. So,

44:52: they needed to be convinced that it was

44:54: worthwhile having it in in beta. And

44:58: they also wanted um

45:02: uh so that the data was originally

45:03: published in a plus one article. And

45:07: they wanted to know that the results

45:08: that were reproducible. So, actually a

45:10: big part of the that piece of the work

45:12: was going through Kerstin Dorman's

45:13: original paper and reproducing.

45:16: >> So, all of that is on that Zenodo link.

45:20: Thank you for indulging me.

45:22: Behind the scenes question. Oh, yeah. It

45:25: was It was a fun project to work on and

45:26: I'm so glad that that we were able to we

45:29: were able to do it. Um okay, well, this

45:32: has actually been absolutely perfect

45:33: timing because I wanted 10 minutes to

45:35: tell you more about the R contributor

45:37: group and um

45:40: and how you can get if this has whetted

45:41: your appetite for um

45:45: contributing to base R and you are keen

45:46: to learn uh how to do more or how to

45:49: find out more, I have very many links

45:52: for you for things you can get involved

45:54: with. But, I think one of the first

45:56: questions that I wanted to to address

45:58: was really like

46:00: have people considered

46:04: contributing to base R and if not, why

46:06: not? Cuz I'm really intrigued about the

46:08: kind of

46:09: barriers, barriers to doing that.

46:11: I will let everybody chime in in the

46:13: chat here.

46:15: Do you use base R? Do you think about

46:17: base R? Have you ever thought about

46:19: contributing? What are some of your

46:21: barriers to

46:23: either contributing to base R or maybe

46:26: learning more about base R,

46:28: understanding it better,

46:30: um understanding the understanding the

46:32: background. And I will also ask Ella

46:35: Brent's question, which is how many

46:36: people are currently developing base R?

46:40: So, I believe

46:41: if you if you mean like actually on the

46:44: R core team, I believe that's about 20.

46:48: I'm not 100% sure, but that would be my

46:51: my guess. But in terms of a

46:54: community of contributors,

46:56: uh

46:58: many dozens if not hundreds of of people

47:01: are are making these these kind of

47:03: contributions. And so, that's what I

47:05: want to talk about next is is getting

47:06: involved because um I'll I'll wait to

47:08: see what's kind of coming in on the

47:10: Discord, but I know I've spoken to

47:12: people about this and they just kind of

47:13: think it's it's not for people like me,

47:15: whoever

47:16: >> Yeah. Um but one of the things I want to

47:19: highlight is just how very diverse a

47:21: group of contributors to base R

47:24: it So, this is a photo from the R

47:26: project sprint, which was a three-day

47:27: event.

47:28: It that that You I'm not seeing a photo.

47:33: You're not seeing a photo? Is anybody

47:35: else seeing more than I'm seeing?

47:36: Isabella says no photo.

47:37: >> what I'm I'm sharing is paused for some

47:39: reason. How do I unpause it?

47:41: Oh, I don't know. Good question. I was

47:43: thinking earlier that you were talking

47:44: about Bugzilla or something and I was

47:46: like, I don't know what I see what Ella

47:47: is seeing. Maybe earlier we were seeing

47:50: the

47:52: >> How long has that been gone cuz I've

47:54: been sharing things this whole time.

47:56: I

47:56: hope a lot of that was was caught

47:58: because did people see what what I was

47:59: doing on Bugzilla? Was that I don't

48:01: think we saw the very end where you had

48:04: maybe submitted the very last step.

48:08: All right. So, let me just go back to to

48:10: But we do see the photo now. And

48:13: Renato

48:15: sort of echoed what you said. Renato

48:16: said like it feels outside my abilities.

48:18: I don't know anything about C and I've

48:20: never even made an R package. And I

48:22: think that's a very common sentiment.

48:24: Okay. So, I want to kind of debug this

48:26: in in two ways. So, first of all, I want

48:28: you to look at this picture of people

48:29: who contribute to base R and

48:32: a whole range of it. So, there's a whole

48:33: range of

48:35: experience levels. So, we're novice can

48:36: do everyone here from novice

48:37: contributors people who haven't

48:39: contributed to base R before this photo

48:40: was taken through to to many members of

48:42: R core. People are coming from all over

48:44: the world. We have a good all ladies

48:47: representation. We have good rainbow R

48:48: representation. We have a lot of people

48:50: particularly from the global south. This

48:52: was all funded. So, people's travel and

48:53: accommodation was funded. And if you

48:55: think, "Oh, no, I missed out. That was 3

48:56: years ago." We're doing it again in

48:58: September and applications are open and

49:00: I'm going to share a link in a sec.

49:02: But the other I think part of it is that

49:05: kind of feeling of not having enough

49:06: experience.

49:08: So,

49:09: just to kind of

49:11: clarify the the level. So, you don't

49:13: need to have obviously you don't need to

49:15: have contributed to base R before to

49:16: make your first contribution. That would

49:17: be kind of circular. But most

49:20: contributors would have like we would

49:22: expect people to have a good knowledge

49:23: of R programming, be be able to write

49:26: functions, be able to debug functions.

49:30: You might have some familiarity with

49:32: writing help files and being able to use

49:34: get or subversion or some kind of some

49:37: familiarity with the idea of version

49:39: control is useful. But it's

49:42: like it's not that high a bar on R

49:44: knowledge. Just like a reasonably good

49:46: knowledge and and being able to write

49:47: functions will do.

49:49: There are some some skills that are

49:50: useful like being able to program in C

49:53: can be helpful, having a knowledge of S3

49:55: or S4, knowing something about the stats

49:57: method that underpin the functions in in

50:00: in packages like stats and splines.

50:02: Um that's all helpful, but really the

50:04: the the most important thing is a

50:06: keenness and an an interest. So there is

50:09: a bit of an investment in in in getting

50:11: started with this. So

50:13: we'd like people in the contributor

50:14: community who once they've learned how

50:15: to do it want to be able to want to keep

50:18: contributing.

50:19: So that's that's what we're that's what

50:21: we're looking for. So what I want to do

50:22: in the last 5 minutes is share a whole

50:24: bunch of links for

50:26: for for how to get involved in the kind

50:28: of things that we do.

50:32: if you take away one website one link

50:36: from today, can it be

50:37: contributor.r-project.org.

50:41: So this is the website for the R

50:42: contributor working group and this has

50:45: like everything we we do on it. So

50:48: how you can join our Slack group, the

50:50: events that we have coming up.

50:54: There are tutorials and demos and then

50:56: there are a link to a whole bunch of

50:58: other resources. So here the R

51:00: development guide is a great one if you

51:01: want to get started contributing to R.

51:03: That goes through the whole process of

51:05: of of how to do it. Um there are tons

51:07: more here you can explore, but in

51:09: particular on events,

51:12: we have R contributor office hours. So

51:15: these happen a

51:18: once a month usually usually not always,

51:20: but usually on the second Tuesday of the

51:22: month and usually at two different times

51:24: on that day.

51:25: And we've just updated this website. So

51:27: if you look at this site, hopefully the

51:29: times you see here will be in your local

51:31: time zone. So these are the usual times

51:33: on the usual days where

51:36: where this happens. So this is a really

51:38: great place to come and is a is an

51:39: office hours. So you just kind of come

51:41: and chat and you can

51:43: just come and hang out and find out more

51:44: about it or you can come with specific

51:46: questions or or or things you're

51:47: interested in exploring. But the really

51:49: super exciting thing are these are dev

51:53: days. There are four of them coming up.

51:55: Um

51:56: and there are three of them are

51:58: satellites to other events. And they are

52:01: different because the R Conference R,

52:03: which is based off an event in France

52:06: and Cascadia R in Portland. If you click

52:08: through to these links, you can just

52:10: sign up to go. I either either in person

52:13: if you're at those events or hybrid and

52:16: anyone can can sign up to go to those.

52:18: Um there are two bigger events and

52:21: that's one that is a satellite to the

52:23: useR conference that's happening in

52:24: Warsaw.

52:26: And which is a one-day event in Warsaw

52:28: and then

52:29: a standalone event, a three-day R

52:31: Project Sprint, which is going to be

52:34: like a fabulous get-together of again,

52:37: like that photo I showed, everyone from

52:39: novice to to R core coming together for

52:41: three days to like really get stuck in

52:44: into this um

52:47: uh contributing to base R and the

52:48: opportunity to work on some pretty

52:50: pretty deep problems over a three-day

52:52: period. So both the useR one and the R

52:55: Project Sprint we're taking applications

52:57: for those because we want to ensure we

52:58: have a good balance of kind of from from

53:01: from novice to experienced. So both of

53:03: these have associated websites which

53:06: we're going to tell you more

53:08: about um By the way,

53:11: I haven't written these papers. I don't

53:13: keep on putting my photo up on these.

53:14: Somebody else

53:15: >> [clears throat]

53:15: >> There you are.

53:17: But this is actually our This is me and

53:18: Kelly Bodwin and Martin Mächler from R

53:20: core and this is actually us working on

53:22: the stem bug as it happens in in France.

53:24: >> Amazing. Well, we have some feedback

53:27: that you might be able to address now.

53:28: They're not exactly questions, but they

53:29: are feedback about some sort of barriers

53:32: to contributing.

53:34: Um and I think that attending one of

53:37: these R Dev Days

53:39: um

53:40: will will help answer some of these

53:42: questions for people. So, one says, "I

53:44: considered yes, but not always sure what

53:47: the first step is. I tried getting a

53:49: Bugzilla account, but got a reply back

53:52: that I should decide first, not just

53:54: consider, but then I don't know how to

53:56: decide before being able to poke

53:57: around." You know, kind of wanted to

53:58: poke around first. Um another is like,

54:02: "I saw a feature request for dplyr

54:04: turned down because it was outside the

54:05: scope of the package, and I kind of

54:07: assumed by extension that maybe base R

54:10: would similarly have a scope, and that

54:11: additions that I would make might be

54:13: outside of it." Valid question.

54:16: Um

54:17: >> valid, and all core are like very

54:18: conservative about what they Yeah, but

54:21: you don't know unless

54:23: >> don't know

54:24: unless you ask. So, I would say like the

54:25: the best places to get started are

54:29: through the R contributor

54:31: Anything that the R contributor group

54:33: does is like a really friendly, lovely

54:36: way to to get involved.

54:39: So, I would recommend

54:42: joining the Slack group.

54:44: Um instructions there. Coming along to

54:47: an office hour, and if you are going to

54:51: be in Warsaw, you don't have to go to

54:53: use R

54:54: to come to it, but

54:55: probably if you're going to be in Warsaw

54:57: around that time, you're going to want

54:58: to come to use R,

55:00: and applying for the R project sprint

55:02: because that is a standalone event, and

55:04: there's funding as well for for for

55:06: travel and accommodation for those three

55:08: days. So, Wonderful. Oh, the last one

55:11: since we have 1 minute left was

55:14: "I haven't thought about contributing to

55:16: base R because I thought of it as static

55:18: software, unlike R packages, which are

55:20: kind of always changing and are the

55:21: preferred way to contribute to R versus,

55:24: you know,

55:26: What What a It's a good assumption, I

55:27: mean.

55:29: Yeah, so there are there are major

55:31: release Well, the very major releases

55:34: like 4.5. They happen every several

55:37: years, But the point releases 4.4, 4.5,

55:41: 4.3. Those happen once a year around

55:43: April. So our point 4.6 is coming out

55:46: very soon. And then the patch releases

55:48: happen every 3 months. So yeah, R is is

55:52: a living breathing language and we need

55:54: contributors to

55:56: keep it living and breathing.

55:57: Absolutely. And the last question that

55:59: we have time for is from Brendan. Is

56:02: there a similar process for contributing

56:04: bug reports or fixes in R tools if you

56:06: happen to know? It looks like that

56:08: bugzilla is empty.

56:10: Oh, is it empty? I would have said go to

56:12: to to browse R tools, but if it's

56:18: Is it empty?

56:19: No. Well, maybe the R tools people are

56:21: just really on top of fixing all that.

56:23: Possibly. Maybe there are no problems in

56:25: R tools right now.

56:27: >> know.

56:28: Um I am also super happy to keep talking

56:30: about this and answer any questions. I

56:32: am going to have to like hop at at the

56:34: top of the hour, but I will come back

56:36: and I will at some point in the next few

56:38: days and and be around on the discord

56:40: and really happy to keep happening and

56:42: answering questions. Fantastic. Brent

56:45: says is useR in person only? I believe

56:47: that that is correct. It is in person.

56:51: >> yes, particularly for novice

56:53: contributors. I think we would want

56:55: those people there

56:57: in person.

56:58: Um but the other two are hybrid. All

57:01: right.

57:02: Thank you everybody. This was so fun. If

57:05: you are going to come to the hangout on

57:07: Thursday, I will see you there.

57:09: Otherwise, I will see you on Tuesday of

57:11: next week.

57:12: I will be in the discord. You won. Thank

57:15: you, Ella.

57:17: This was really fun.

57:18: We had fun, too. Thanks, everybody. Bye,

57:21: y'all.
