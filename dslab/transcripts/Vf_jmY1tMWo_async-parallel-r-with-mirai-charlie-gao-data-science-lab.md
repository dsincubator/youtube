---
type: Video Transcript
title: "Async & Parallel R with {mirai} | Charlie Gao | Data Science Lab"
description: "I'm a member of the open source team at Posit and you know, sort of icebreaker um I have on this um comp t-shirt from Seattle in 2024 and as you can see this is actually a participant's t-shirt."
resource: "https://www.youtube.com/watch?v=Vf_jmY1tMWo"
tags: ["ds-lab", "shiny", "quarto", "r-packages", "terminal"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T21:59:18Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=Vf_jmY1tMWo"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2026-05-29T00:00:00Z"
    usage_count: 1375
usage_window: { from: "2026-05-29T00:00:00Z", to: "2026-09-08T21:59:18Z" }
---

# Transcript

00:07: All right, it's time to announce our lab

00:09: manager for today. We are joined by

00:12: Charlie Charlie Gao. Would you like to

00:14: introduce yourself?

00:17: Sure. Hi everyone.

00:19: Nice to see you all.

00:22: Um, I'm Charlie Gao. I'm a member of the

00:24: open source team at Posit and you know,

00:27: sort of icebreaker um

00:29: I have on this um

00:30: comp t-shirt from Seattle in 2024 and as

00:34: you can see this is actually a

00:36: participant's t-shirt. So Isabella has a

00:38: green one.

00:39: Um, one of the uh staff t-shirts and and

00:42: so

00:43: at this uh the conference uh two

00:45: conferences ago um I was a member of the

00:48: R community and um it was really after

00:50: that conference um that I joined Posit.

00:54: First as a contractor and and and then

00:56: full-time.

00:58: So what do I work on? Well, um

01:02: work on um

01:05: uh sort of a number of things across

01:07: open source.

01:08: Um, so um

01:11: what I've been working on most recently

01:13: is actually um been Quarto. So I've been

01:17: actively involved in uh Quarto two which

01:20: is the new Rust rewrite. Um, that has

01:23: been announced so I'm free to sort of

01:25: say that but as part of that you will

01:29: all be getting a collaborative

01:32: editor. Yes.

01:34: So

01:36: that's been um an incred- incredibly

01:39: exciting project to be working on but

01:41: apart from um that I'm also the creator

01:44: and maintainer of um a few R packages,

01:47: mirai, nanonext, secretbase, etc. And

01:50: these are all packages that were um that

01:54: are mostly written in C actually um for

01:56: high performance computing and

01:59: networking.

02:00: So, myself, I'm very deep into sort of

02:03: async.

02:04: Apart from working on Mirai, which is

02:07: the package I'm probably most well known

02:09: for, I've also implemented

02:12: modern async into packages

02:15: that you all use. Um

02:17: Often,

02:18: like Heda to and Elna.

02:21: I also maintain

02:24: the Yeah. I also maintain the later

02:26: package on behalf of Joe and Winston.

02:28: Those are packages that they created

02:30: very early on.

02:31: And I've sort of taken over the

02:33: maintainership

02:34: as they've

02:35: focused more on AI-related applications.

02:40: Later, hours the core event loop in

02:44: shiny and other sort of

02:46: key R packages like plumber.

02:49: And that It is basically a way for

02:53: different packages to cooperate with

02:56: each other, even though they're running

02:58: at the same time.

03:00: So, as you can see, I'm very much into

03:03: sort of

03:04: async, into sort of working on R

03:07: internals,

03:09: T code, and also communications. So,

03:12: this is like

03:13: HTTP, web sockets,

03:16: and hence my work with shiny and now

03:19: on Quarto and the collaborative editor.

03:23: So, today, I'm mostly going to be

03:26: focusing on

03:28: Mirai and how to use that for parallel

03:31: and async programming.

03:33: Yes, I would love to start with what the

03:35: heck is async programming and how is it

03:37: different from parallel?

03:41: Sure. Um

03:44: So,

03:45: let me just hit that on the head very

03:47: like straight away, so we get rid you

03:49: know, we cover all the sort of

03:52: technical jargon.

03:54: Ace parallel is basically when you're

03:56: running

03:57: two things at the same time.

03:59: And async

04:01: is just you're not waiting around while

04:04: that happens. That is as simple as I can

04:06: put it. So, let me share my screen and I

04:11: give you a concrete example of what I

04:14: mean by that.

04:16: Yes, please.

04:18: Um okay. I'm going to be sharing my

04:21: whole desktop and you see my Zoom

04:23: screen, obviously.

04:25: Okay.

04:26: >> Can everybody see okay with the size or

04:28: does anything need to be zoomed? This is

04:31: now is the time to let us know.

04:33: Brian says he's okay.

04:35: >> I'm if I'm typing stuff like this, is

04:38: everyone going to be okay?

04:41: Let's see. Russ says size is okay.

04:46: I zoomed this in already, so this is

04:48: >> some thumbs up. All right. If anybody

04:50: needs us to stop, let us know. We'll

04:52: make it bigger.

04:54: Excellent.

04:55: Um so,

04:57: this is um

04:59: actually, before I even start with any

05:01: code, um if I just wish to

05:04: the

05:06: um the package downside for Mirai

05:07: itself, this might be if I just try and

05:10: zoom this in. Yeah, okay.

05:14: So,

05:15: Mirai is sort of

05:17: um

05:18: the main package I'm going to be talking

05:20: about today. This is a package that I

05:22: developed about

05:24: three three to four years ago is when I

05:26: started work on this. So,

05:28: this is much more recent than um

05:31: any other sort of parallel code that

05:33: you'll see in base R. That code has been

05:35: around for 20 to

05:38: I'm not sure if it's 30, but it's at

05:40: least 20 years and that hasn't changed.

05:42: So, this is sort of a much more modern

05:44: take on um

05:46: how to run our code in parallel and and

05:49: and async.

05:52: Mirai um is Japanese for future for

05:55: anyone who's wondering. So, this is an

05:57: implementation of future. So, it's

05:59: basically

06:01: a computation that's going to be ready

06:02: sometime in the future.

06:04: And Mirai just um is uh future in

06:07: Japanese. So, that's why it's called

06:09: Mirai.

06:11: Um

06:12: and

06:15: maybe uh while I'm here on the website,

06:17: just a digression before I get onto

06:20: code. Um

06:22: and this is mirai.alib.org. So, Mirai um

06:27: Sorry, I was just getting my notes. So,

06:28: this is just mirai.alib

06:31: .org.

06:35: Um

06:37: you'll see there's this Ask Deep Wiki

06:39: button. And this is on a few

06:44: uh positive packages. We use this on um

06:48: the Corda site itself because Corda is,

06:50: you know, is very complicated. It has a

06:52: lot of components. And it's This is just

06:55: an easy way um for uh users to ask

06:58: questions. So, you can click in

07:02: and this is sort of AI LLM powered.

07:06: There's ways to uh that you can use this

07:08: programmatically, but essentially you

07:11: can click in and it's sort of

07:13: um it gives you like in-depth overview

07:17: of like

07:19: everything that's within Mirai, like

07:21: it's documentation and its functions.

07:25: But, the great thing is you you you drop

07:27: straight into this sort of chat box that

07:29: you see here,

07:30: right? And you can ask any question

07:33: um that you have about Mirai. So, even

07:36: after this lab is complete, you can just

07:38: go in and you can ask any question. And

07:40: And great thing about this is you can

07:42: put in

07:43: your question in any language um and it

07:46: will give you the answer in your own

07:50: language of preference. So,

07:52: if I say uh something like

07:54: um

07:57: Comment utiliser ?

08:00: Yeah, I avec euh SSH.

08:05: Wait a minute. Do you I speak French.

08:06: Speak French, Charlie. [laughter]

08:09: Un petit peu.

08:11: Sudden

08:12: >> so, Charlie speaks French.

08:15: Uh

08:16: No, I haven't really used it since like

08:18: school. It's just when I learned it.

08:20: But, um

08:21: But, you can see, you know, this gives

08:23: you like a nice nice answer. Gives you

08:25: examples, runnable code, etc.

08:28: in the language of your choosing. And

08:29: this is like

08:31: it can be more helpful if you're, you

08:32: know, in like working Japanese or

08:35: Chinese or something like that. It's

08:37: like it's it's really sort of you know,

08:40: powerful um this sort of

08:42: AI LLM power tools that we get nowadays.

08:46: Um

08:48: But, that's sort of like a nice

08:49: affordance that's just there um

08:51: on the

08:53: on the uh home page for Mirai.

08:56: So, I'm going to switch back now to uh

08:59: my Positron window and

09:02: if I just spend like a couple of minutes

09:04: again, I'm like delaying the point where

09:07: I actually like write code. You're

09:08: killing me, Charlie. You're killing me.

09:10: >> [laughter]

09:12: >> Just building out the suspense. Um so,

09:15: you can see like

09:16: what I have here is basically like the

09:18: two-pane like view for Positron.

09:21: And

09:23: I think this basically gives you a clue

09:25: that I'm more of a software engineer

09:27: than a data scientist. Yes, I don't have

09:29: the default data science view.

09:31: And

09:33: like if you're curious about how to get

09:35: there, it's really simple.

09:37: If you click on this

09:39: layout button, it's the side-by-side.

09:42: And you just enable the sidebar,

09:45: whatever it's called. Yeah, the sidebar.

09:48: And the sidebar gives you all the usual

09:49: tools, say files, search, Git

09:52: integration, etc.

09:54: And you can see I have these buttons on

09:56: along the top. This is also key to sort

09:58: of the whole the whole ergonomics of

10:00: using Positron. And this

10:03: you've probably seen this before, but

10:05: this is you know, I'm sure Libby and

10:06: Isabella has gone through this, but

10:08: the default is is this activity bar is

10:11: the default is sort of down this side,

10:13: and that's sort of like for me it takes

10:15: up a lot of sort of screen real estate.

10:17: So, the first thing I do, and this is

10:20: great because this is sort of

10:22: remembered, you only have to do this

10:23: once, is to um

10:26: set this to top. So, activity bar

10:28: position top, and you're good to go. And

10:31: this is sort of my default setting for

10:33: all the work I'm um

10:35: sort of usually work on. So, I have um

10:39: my source files here on the left, and

10:41: then I will have um

10:43: the uh console, or I have a terminal um

10:47: so, we have a terminal session with um

10:49: something I was working on with um cloud

10:51: code um

10:53: earlier. It's not disappearing.

10:55: Um

10:56: okay.

10:57: So,

10:58: very simply, and I have some notes here

11:00: just like this is like this session is

11:03: totally unscripted, but this is just

11:04: some notes of like what I definitely

11:07: want to cover, so I don't go completely

11:09: off topic. Um so, okay, act one. What is

11:12: Mirai? So,

11:14: um first things first is um

11:17: launch the package.

11:19: If you um haven't got it installed, then

11:21: just install it um either from CRAN

11:26: or um I would actually encourage you to

11:29: try and install the uh development

11:32: version,

11:33: because there's some nice new features

11:35: in there that if we have time I will

11:37: share with you. And it will be a first

11:39: time I reveal these um significant new

11:42: features that will be released hopefully

11:44: later this month.

11:45: Um and to install the um

11:49: install the dev version of Mirai, then

11:52: you you can just do pack pack and

11:56: oops.

11:58: Um

12:01: Sorry. Um

12:04: And you can install it from the uh

12:07: GitHub repo RLib/

12:10: Mirai.

12:15: So, will you be using

12:17: dev version today?

12:19: I will be. Um And and there's no

12:22: difference from from what I'm showing

12:24: you um

12:25: unless we go into what specifically I've

12:27: implemented um later on if we have time.

12:31: Um so, if you haven't got it installed,

12:33: feel free to sort of install it. It will

12:35: pull in um the development version of

12:38: NanoNets as well, which is what

12:40: underlies Mirai and powers all the sort

12:42: of high-performance um networking.

12:49: So,

12:51: very quickly. So, now I've installed it,

12:54: then I load the package.

12:57: And the main

12:59: function in Mirai is just Mirai. So,

13:01: there's nothing for you to sort of

13:03: learn.

13:04: Then, there aren't sort of there are no

13:07: options. There are no options or

13:09: environment variables that you can set

13:11: with Mirai. Everything is very explicit.

13:14: The main function is Mirai. So,

13:17: it's really designed so you don't have

13:18: to sort of remember anything.

13:21: So, um

13:23: to use Mirai, you can just say uh sorry.

13:27: Let me just start a new session because

13:29: I just installed it. Sometimes doesn't

13:31: like me running things.

13:34: Um so,

13:36: if I just if I just

13:39: put something in Mirai and

13:41: Mirai basically just runs whatever

13:43: expression

13:45: in another process.

13:47: Okay.

13:49: So, you can put anything here. So, for

13:50: example, um and

13:53: any any expression. So, anything you can

13:55: put in um these uh brackets. Um so, we

13:59: can say like sleep.

14:02: This is not sleep two and then say um

14:06: you know,

14:07: have it return done or something like

14:08: that, right?

14:10: So,

14:12: when you create a Mirai, this object is

14:14: a Mirai. And you can see like it's um

14:18: this is the the the result of this is

14:21: basically available at data.

14:25: Which is

14:26: done here. Okay.

14:27: This This is too simple. But um if we

14:31: Sorry, this is too This is over too

14:32: quickly. So, if we have this sort of

14:35: last 10 seconds,

14:36: then if we look at this object, this

14:39: isn't actually done yet. You can see

14:41: this um

14:42: this sort of brackets here. This is just

14:44: a print method, right? And then um

14:49: what we can do is we can say is it

14:51: resolved or not. And um I'm resolved.

14:54: So, this is now actually resolved. So,

14:56: this is now finished, right? This task

14:58: is now finished and then it will be

15:00: available at data.

15:02: Okay.

15:04: So, this sort of shows you that um

15:07: basically

15:09: when you have this on

15:11: this is happening in another process,

15:14: then we're free in our own session to do

15:17: um

15:18: other tasks. And that is essentially

15:20: what I think is. So,

15:22: um

15:26: This is where I would love to hop in and

15:28: ask Lauren's question, which is

15:31: what was the motivation or the need for

15:33: developing Mirai? What problem is this

15:36: built to solve? So,

15:38: I'm imagining as a

15:41: person who in undergrad and grad school

15:43: had to leave her computer running

15:45: overnight to run projects,

15:48: um that this would mean if you have

15:49: something that's a very very long that's

15:51: going to take a very long time,

15:53: you can

15:55: do something else while you're waiting

15:56: for that to finish. Am I right?

16:00: Yes.

16:01: So, there are many ways you can use it.

16:03: Um one is as you described, so if you

16:05: have something like

16:08: And sort of my background, um I say I'm

16:11: not a

16:12: data scientist sort of now. I did do

16:14: sort of data science-y type things um

16:17: previously um

16:19: I was actually sort of um

16:21: building these um

16:23: deep neural nets actually. So, I was

16:24: actually training these neural nets and

16:27: then I was actually running influence on

16:29: them. Um influence on them, sorry.

16:32: And so, I was using Mirai um for both of

16:34: those purposes, right? So,

16:37: first of all, um if you have something

16:38: that's

16:39: um sort of ongoing for a long time, you

16:42: can run them in parallel in background

16:44: processes and that each of them is

16:46: self-contained. So, if something sort of

16:49: errors and goes wrong in one of them,

16:51: all your others will um

16:53: still uh progress um to completion

16:56: hopefully because they don't um interact

16:59: with each other. That's one thing.

17:01: And the second part is really what led

17:04: me to develop Mirai, which is I was

17:07: actually running inference

17:10: um with one of these um

17:12: neural nets, one of these models, right?

17:15: And

17:16: I was actually also ingesting real-time

17:19: data. And so this is actually financial

17:21: market data that I was ingesting through

17:24: an API in real time.

17:26: And trying to run this through this

17:28: model.

17:29: And then save the inference results in

17:34: basically a kind of database, right? So

17:37: because this all had to happen in real

17:41: time

17:42: then

17:44: I couldn't afford to just

17:46: run things in a sort of a normal loop

17:49: because if something falls over, then

17:51: that basically

17:53: stops the whole thing.

17:54: So

17:55: what

17:57: Mirai can allow you to do is it can

17:59: allow you to offload

18:01: different tasks into different processes

18:04: so that your main loop can stay

18:07: reactive. So essentially, your main

18:10: loop, you're not doing very much at all

18:12: in it. You're just checking to see if

18:14: other parts of that you need are all

18:17: done. So whether that's ingesting data

18:19: or that's writing data, those can be

18:21: done in separate processes and you can

18:24: have basically

18:26: redundancy and sort of fail failover in

18:29: your main loop. That is a very sort of

18:32: high-level overview.

18:35: But hopefully that makes sense

18:37: to everyone.

18:38: Well,

18:40: we got like seven more questions based

18:42: off of that

18:42: >> [laughter]

18:43: >> answer.

18:44: So I would say that it makes a little

18:47: bit of sense, but we need more context.

18:49: So

18:50: do you want to give another give another

18:52: code example and then we can hop in with

18:54: more questions?

18:56: Excellent. Let me go through some more

18:58: of what I want to show you. So

19:02: This So I was on here, right? So

19:07: We here if So

19:10: one way we can sort of work with sync is

19:13: we have this thing that's running in

19:15: another process and then

19:17: in Mirai that if you do these brackets,

19:20: right? This is um the collect method.

19:22: So, this is actually equivalent this is

19:25: basically collect Mirai, right? This

19:26: This basically says uh it's already

19:28: done, but this will actually wait for

19:31: the Mirai to complete and then return

19:33: the result. So, if I do this again,

19:36: then this will actually

19:38: wait. So,

19:40: this is basically

19:42: parallel. This is not really a sync uh

19:46: um while you're waiting. But, this is

19:48: one way that um you can sort of get the

19:51: results.

19:53: But,

19:54: this is um where you can pair Mirai with

19:57: promises to actually have actions happen

20:01: as soon as

20:03: um a result is complete without you

20:05: having to wait for it. So,

20:07: this works something like this and this

20:09: is basically how

20:11: Mirai with Shiny works. So, Shiny, you

20:14: know, everything is a sync. Your um

20:18: a Shiny service serves many different

20:20: users.

20:22: You can't have that service sort of like

20:24: stop and wait for um

20:26: one particular user to finish.

20:29: So, if I

20:32: if I load up the promises,

20:35: um

20:39: package up. So, um

20:42: what I can do here is so um again, if I

20:44: say something

20:48: uh

20:50: if I say uh

20:52: sleep and then um that basically if I

20:56: just return a value,

21:00: and then how promises work is you can

21:03: say, you know, once that's done, then do

21:05: something else with the return value.

21:09: And um here like an example I like using

21:13: is just to use the beep uh function and

21:15: it will like play a sound.

21:18: So here's, you know, this mirai is going

21:20: to run uh for two 2 seconds, then it's

21:23: going to return two, and then it's going

21:25: to call beep beep two, which is the

21:27: second beep sound.

21:30: Um

21:33: And I realized like you don't hear this,

21:35: right? No, no, no, you'd have to share

21:37: your system sound.

21:38: We'll trust you that your computer just

21:40: beeped though.

21:40: >> Okay. So like okay, I you're going to

21:43: have to trust me, but this this

21:44: basically goes

21:47: Bling. So this is like um it's like sort

21:51: of Mario sound um like yeah.

21:54: Like you're getting a coin in Mario.

21:56: Like like yeah, exactly. It's it's the

21:58: coin sound.

21:59: Um

22:01: And so this is sort of like how um

22:04: this works. And you know, that sound

22:06: plays without me having to sort of

22:08: interact.

22:10: And to give you a more sort of concrete

22:12: example of how this sort of works, if I

22:14: do a um mirai map, this So this is a

22:17: this is basically the equivalent of

22:19: Lapply or or per map, but this basically

22:22: maps each individual element in a

22:25: different background process, right? So

22:28: if I uh map sort of, you know,

22:32: this thing to a function,

22:37: um

22:38: and then this just sleeps for the

22:43: specified number, so from 1 to 5

22:46: seconds, and returns that number.

22:49: And this mirai map has an argument which

22:53: is called dot promise and basically

22:54: works exactly the same as promises then.

22:58: So um we can pass a function

23:01: to to this. Um and again if we use

23:05: uh

23:05: b par

23:08: and b then this will uh

23:11: sort of play all the first five beeps in

23:13: in 5 seconds. And let me try and um

23:18: switch the microphone so that you can

23:21: actually

23:22: If you just hit the share button again,

23:24: then you can click uh share system sound

23:27: and it will it should let you do it.

23:30: Um

23:32: I think I just did it anyway. Um sure,

23:35: if I just play this. Oh, um

23:37: Okay, so

23:39: I hit an error. So um

23:41: this is basically telling me that I need

23:43: to set demons. So um I can just click

23:46: through here and set demons. So demons

23:48: again is another piece of jargons. They

23:50: are demons are basically just workers.

23:53: They are background processes, right?

23:57: And the reason it asked me to set demons

23:59: for this map is

24:01: um for a map, here I'm mapping only five

24:04: elements, but that map could be over

24:06: like a hundred or a thousand elements,

24:08: right? And if demons weren't set, then

24:12: you'd basically be launching a thousand

24:15: different sessions on your own machine

24:17: and that will probably crash your

24:18: machine. So

24:19: for a map, it will ask you um

24:22: to set the demons beforehand because

24:25: it's usually sort of an oversight or

24:27: mistake as it was in this case. So I've

24:30: just gone ahead and set six demons,

24:32: which are basically background

24:34: processes.

24:36: At any time in my eye, there's a

24:37: function um which is just info and you

24:40: can see like exactly the status of

24:43: what's happened. So we have six

24:45: connections here. Okay.

24:48: Um we'll go through what the rest means

24:49: in a bit.

24:51: Um so if I just um

24:53: attempt that function again,

24:56: then

25:03: Have you heard that right? Okay. Nope.

25:06: That's okay.

25:07: >> Oh. Oh, you didn't Oh, sorry. Um what

25:09: what do I need to

25:12: You would need to um

25:16: you need to hit the share button and

25:17: then you might have to hit advanced and

25:19: then share system sound or there's a

25:22: little checkbox on the right that says

25:23: share system sound.

25:27: But it's okay if if if it doesn't work

25:28: out. It's all right. We have about 50

25:31: questions, so I say

25:33: >> [laughter]

25:34: >> Sure. Sure.

25:35: >> we get some questions in here because

25:38: there's a lot of confusion, right? Like

25:40: there's a lot of things that you have

25:41: talked about like future promises,

25:44: things that um we don't have any context

25:46: for. So let's dig into some of these

25:48: really quickly here.

25:50: Go for it. Um one of them is

25:54: uh from Nathan, do the contents of Morai

25:57: inherit definitions from the global

26:00: environment?

26:01: No, and this is um this is um

26:06: a conscious sort of design decision and

26:09: it helps you sort of avoid mistakes.

26:13: Um

26:13: >> Okay.

26:15: And

26:17: like

26:18: this is sort of

26:21: like to my mind this is how sort of

26:23: things are meant to be

26:25: and um I know like um that future like

26:30: does it differently

26:31: um and that package has been around for

26:34: a while, so

26:35: people sort of know that behavior,

26:39: but um there are various sort of um

26:43: edge cases there

26:45: and

26:46: um

26:48: the sort of the the danger in trying to

26:51: sort of

26:52: automatically sort of infer what's sort

26:55: of in your Mirai

26:57: um can lead to sort of um

27:01: well, in the best case it can lead to

27:02: errors, but like the worst case like

27:05: it's subtly wrong and you get a

27:07: plausible answer and um you don't

27:11: even know you're wrong. So, that

27:13: arguably is sort of worse.

27:15: Mirai is sort of um very explicit in

27:18: that sense and I show you exactly what I

27:20: mean. So, if I

27:22: um

27:23: if I uh define something like um if I

27:26: define something like um slow func,

27:28: right?

27:30: Um so, uh let's say just function um

27:35: and this just um

27:38: just can just sleeps

27:42: and then it returns something like done,

27:44: okay?

27:46: So, if I attempt to sort of run Mirai

27:50: slow func, right?

27:53: Um you might think that would work.

27:56: Um

27:58: but what you would actually see is

28:00: there's um an error

28:02: and it just says error could not find

28:04: function slow func because

28:09: Mirai runs your expression in another

28:13: process and this is a clean process. So,

28:15: every time you call Mirai, that is like

28:17: uh a clean invocation. There's nothing

28:20: in that evaluation environment. So,

28:23: what you would do here is uh you can

28:26: call it, but then you would pass in um

28:28: slow func um to

28:31: the Mirai.

28:33: Um so, something something like this,

28:35: right?

28:37: So, uh the expression is the same slow

28:39: func, but then you would define slow

28:41: func inside the Mirai is the slow func,

28:45: which is this function that's living in

28:47: my current environment.

28:49: Okay?

28:50: And then um

28:53: we get the result we set.

28:55: Okay, so you have mentioned future and

28:58: promises again, and you're like,

29:00: everyone knows what that is. Uh Charlie,

29:02: we do not.

29:03: >> [laughter]

29:04: >> So, if you could give us a little primer

29:06: on the difference between mirai and

29:10: promises and future, um one of the

29:12: questions was like, wait, I'm confused.

29:15: Why would I choose mirai versus promises

29:17: or future?

29:21: Um

29:24: So, promises is a way basically, as I

29:28: showed to um have actions occur

29:31: when

29:33: your mirai or your

29:35: or your future

29:36: um completes.

29:38: So,

29:39: they're they're designed to be used

29:41: together,

29:42: um and they do different things.

29:44: A mirai or future is just a way to run

29:48: um

29:49: an expression

29:51: in another process, right? Um

29:55: um either in parallel or or async.

30:01: Okay.

30:03: So, the things like future and promises

30:06: keep things

30:09: running during these like long-running

30:12: tasks, where if you have a chain of

30:14: tasks that need to happen, for example,

30:15: in a shiny app, right, that need to

30:17: happen one after another or reactive to

30:18: each other,

30:20: some of those future tasks

30:22: need to be set aside and stored so that

30:25: they can happen once something has

30:27: finished running, and they can all

30:29: happen all at one time. Does that sound

30:31: right?

30:33: Or like they can all happen happen in

30:35: order.

30:38: Yes, so a promise will be basically it's

30:41: uh promise uses these verbs like then,

30:44: right? So, this is the key

30:46: um

30:46: this is the key function from

30:48: Sorry, promises.

30:51: Uh sorry, that's not really helpful.

30:53: Um so, it's basically

30:56: >> [gasps]

30:56: >> It's basically

30:58: you know, when when you have a mirai and

31:01: that's finished, then like then take

31:05: the return value from that and pipe it

31:08: into another function.

31:10: Okay.

31:12: So, Renato in the chat says, "Wait, I'm

31:14: lost. Aren't our functions run

31:17: sequentially anyway?"

31:22: Um okay, so let me maybe just go through

31:25: like the second part of um

31:27: my Will that answer it for

31:28: >> what I had

31:30: what I had in sort of what I wanted to

31:32: demonstrate.

31:34: Um so,

31:36: like sequential is basically

31:39: So, you're right. Um

31:41: R is single-threaded, so without um

31:45: package like mirai, everything will run

31:48: sequentially. And mirai is basically

31:50: designed to overcome that. And

31:54: why this is important, well, I mean, R

31:56: has been around for, you know, 30 years

31:58: or so. I mean, um

32:01: back then, um

32:02: you were lucky if you had sort of, you

32:04: know,

32:05: two or four cores. That was sort of the

32:07: the sort of the the the norm.

32:10: But, you know, modern laptop has at

32:12: least eight cores. Um

32:15: my mean,

32:16: uh MacBook I have 14 cores.

32:19: And

32:20: all your computations in R by default

32:22: only uses one single core.

32:27: So, um

32:29: easiest way to sort of um demonstrate

32:31: that is if I define um a function again,

32:34: um Um, long task, um

32:37: if I just define that as, um um,

32:41: And again, I'm sort of

32:43: using these generic functions because

32:45: this is easier for me to control sort of

32:47: how long they take rather than, um, like

32:49: an actual, um, function that takes a

32:51: long time. So, this will just sleep for

32:53: 2 seconds and then return the the

32:56: number. Okay?

32:58: So, if I actually sort of time how long

33:01: this takes,

33:03: then if I slide this to, say,

33:08: uh, five, uh, a long task, right?

33:15: Then,

33:16: you know, five times two, you expect

33:18: this to last 10 seconds. Um,

33:27: um, as as you can see. And,

33:31: you know, you're sort of this is just

33:33: sleeping for 2 seconds, but, you know,

33:35: you can imagine that that could be

33:36: doing,

33:38: um,

33:40: some kind of, you know, either complex

33:43: sort of matrix multiplications,

33:45: um, you could be doing, sort of, um,

33:48: or you or you or you could be like

33:50: hitting, um, some kind of API and and

33:53: and waiting for sort of data to come in,

33:55: right?

33:56: So, that, um,

34:00: what you, um, what you would want is for

34:03: those to run in parallel. So, um,

34:06: or if you

34:08: we set six demons, which are six

34:10: workers,

34:11: then if we do the same thing,

34:14: and

34:18: and time, sort of, um,

34:21: a mirror I map, which is the the

34:22: parallel equivalent of L apply,

34:25: um,

34:28: long task, um,

34:30: and here we actually, um,

34:33: we actually wait for these to complete

34:34: because otherwise they will return

34:36: immediately.

34:41: Then we can see that because they're

34:43: done in parallel, this whole thing only

34:45: takes

34:46: 2 seconds.

34:50: All right, that made a lot more sense to

34:51: my brain.

34:54: We have each of these elements assigned

34:56: to a different process and they can all

34:59: happen at the same time.

35:01: So if I can say I can be like, all

35:03: right, I have these

35:05: um let's say five modeling tasks, I

35:08: think in statistical modeling. So I have

35:09: these five modeling tasks and they're

35:11: going to take a while because they are

35:13: each going to iterate over a bunch of

35:14: things themselves and I can run all of

35:17: them at the same time on different cores

35:19: of my computer and I don't have to keep

35:22: my laptop awake overnight in order to

35:25: run them all and get all of those and

35:27: wait for all of them sequentially to run

35:29: on the same core.

35:31: That's right. And you know, these I mean

35:35: they don't have to be sort of, you know,

35:37: even sort of simple functions. They can

35:39: be really they can be full scripts and

35:41: you can literally do Mirai and you can

35:44: say, you know, you can literally say

35:46: source whatever, you know, whatever file

35:49: you have and it can run your entire

35:52: script which, you know, may take hours,

35:56: it may take days even, right? And you

35:59: can have them running in different um

36:02: in different processes. And the key

36:05: about Mirai is

36:06: with Mirai you don't need to care like

36:09: whether that's just running in another

36:11: process on your own machine, so you're

36:13: sort of utilizing all the cores that

36:15: your laptop has

36:17: or if they're running in processes on

36:19: another machine. So if you have like a

36:21: network server, right? If you have a

36:23: workstation where you can send jobs.

36:26: Um or if you're you know, if you're

36:28: Yeah, distributed, exactly. If you're at

36:30: a university and you have access to

36:33: like an HPC cluster, Mirai allows you to

36:35: do all of that. And um,

36:38: hopefully we'll have time where I can

36:39: just show you something very simple.

36:42: I'm glad that you said that cuz I've

36:43: been holding onto Hubert's question cuz

36:44: I knew I knew we were going to get

36:45: there. Hubert had asked, "Wait, can you

36:47: use Mirai with a HPC?" Yes, absolutely.

36:50: So we're distributing the work between

36:52: cores right now on our laptop on

36:54: Charlie's laptop.

36:56: Yeah.

36:56: >> But we can assign distributed machines

37:00: as our workers with Mirai as well. And

37:01: we can scale up and down depending on

37:04: um, our needs. Right, Charlie?

37:07: Right. And um, hopefully um, I uh

37:11: before we run out of time, I want to

37:13: just go through this code base. Again,

37:15: you've

37:16: hit the nail on the head. The there two

37:18: sort of core reasons why you would want

37:20: to use Mirai. And the first is

37:22: you can scale up and down um,

37:25: the resources you need um,

37:27: dynamically. So if you decide you need

37:30: more workers to sort of crunch the task

37:32: that you have on hand, you can simply

37:34: add more workers. The so these things

37:36: aren't fixed. And um, what I want to

37:39: show you is basically

37:41: how this happens, right?

37:43: So

37:44: Mirai basically works um, as um,

37:48: if you think about it as a kind of uh

37:51: a hub model, right? So

37:53: when you set up demons,

37:55: this basically um,

37:57: s-

37:58: you uh set up

38:00: like something that listens for incoming

38:02: connections, right?

38:05: So

38:07: what the what you can do is um,

38:09: you can set up um, demons

38:13: with a URL. So this um, and you can and

38:16: we have this helper function called

38:17: local URL. So if you do that, then

38:21: um, what happens is

38:23: that set up um,

38:27: what you what you can think of as a base

38:29: station. This listens to incoming

38:30: connections from your demons, from

38:33: demons that are started, right? Um, as

38:36: long as they have access to this URL,

38:39: then they can connect in and you have

38:41: um,

38:42: um,

38:43: then you have a worker that's connected.

38:47: So, if I set this up, then um, this info

38:50: is um,

38:52: function's going to come in handy. You

38:53: can see that there are no connections

38:56: at the moment.

38:57: Um, and what you can do is you can

39:00: launch local

39:02: um, demons with this function, launch

39:05: like uh, sorry, not like local, local,

39:07: launch local.

39:08: >> [laughter]

39:09: >> Um,

39:10: >> [sighs]

39:10: >> okay, so

39:12: launch local.

39:13: >> Charlie's brain, y'all.

39:15: Yeah, um, and you can say something

39:17: like, you know, launch four local

39:18: processes. And that basically goes ahead

39:21: and does that. So, if we look again, we

39:23: have

39:25: four

39:25: uh, processes. So,

39:28: we can do things like, you know, if I

39:30: just evaluate to me, right? Like,

39:32: nothing. Um,

39:34: then we can see that, you know, oh well,

39:37: we have one task that's completed here,

39:40: right? Just to check that something's

39:41: happening.

39:42: And, you know,

39:45: assuming we set this up and, you know,

39:46: we can be running lots of things. So,

39:49: I'm just going to copy this thing here.

39:52: Um,

39:54: so, this just runs a bunch of long

39:57: tasks, um, and um, okay, so, that's two

40:00: that's executing, five that's completed,

40:03: and now all seven tasks have completed.

40:06: But, if you have a bunch of things and

40:07: you you sort of you realize you have a

40:09: large backlog,

40:12: then you can basically simply just

40:14: launch more demons. So, you can

40:17: say, "Oh, one launch um, at another four

40:20: demons."

40:21: And now we basically have eight workers

40:24: online. So, any tasks that are

40:28: have been queued will just automatically

40:30: use the

40:32: number of available workers.

40:34: Okay, wait, wait. Pause for 2 2 seconds.

40:38: We have

40:39: produced demons, we have created demons

40:42: automatically. Do we need to manually

40:45: close them?

40:46: Same with these processes that we're

40:48: launching or these connections that

40:50: we're launching. Do we need to

40:51: explicitly close both demons and

40:53: connections?

40:55: Yes, so I mean demons are connections. I

40:57: mean they're the same thing.

41:00: And

41:01: these

41:02: it's always good

41:04: practice to to close them, and the way

41:06: to do that is to set demons to zero. And

41:09: that will close them straight away.

41:13: But

41:14: if you forget to close them and you just

41:16: end your R session, they will all

41:18: disappear as well. There's no

41:21: danger of sort of leaving hanging

41:23: processes at all. They're all As soon as

41:25: the connection drops, they're all

41:27: designed to

41:28: terminate themselves.

41:32: Perfect.

41:32: >> Um

41:33: yes, but

41:35: you know, if you're if you have a script

41:36: or if you have

41:39: markdown document, it's always good to

41:41: pair a demons with a demon zero at the

41:44: end.

41:49: Okay, great. I interrupted you.

41:51: >> [laughter]

41:51: >> We have 15 minutes left. We still have

41:53: so many questions.

41:55: Um but I would love for you to be able

41:57: to finish your sign.

41:59: >> [laughter]

42:01: >> I thought I was going to have too much

42:03: time, which is why I sort of like

42:05: overdid the introduction and

42:09: Okay, so

42:10: the second part apart from so

42:14: um um

42:15: apart from sort of the scaling and sort

42:17: of ability to add and subtract demons at

42:19: any time is you can run them anywhere.

42:22: So,

42:23: uh

42:24: um if you just do demons and the number,

42:26: this will just launch processes on

42:30: your own machine, okay?

42:32: But, those processes can also be another

42:35: machine. And there are different

42:38: um

42:39: ways you can launch them.

42:41: Um one is over SSH, one is via cluster

42:45: manager, that's if you have access to a

42:47: cluster. The other is um via Posit

42:50: Workbench. So, if you're lucky enough to

42:53: be in an enterprise sort of environment

42:55: that actually has Workbench, you can

42:58: easily launch workers as Workbench jobs.

43:01: Um

43:03: But, I won't cover that. I will try and

43:05: cover um SSH as an example.

43:09: Okay.

43:10: So,

43:12: the way

43:13: um

43:14: you um do that is um you call demons and

43:19: you create a URL, which is

43:22: using this helper, which is host URL,

43:24: okay?

43:25: So, this creates

43:27: um

43:28: a uh

43:30: network socket, which is

43:32: available um to other computers on your

43:36: network. So, other computers will be

43:38: able to connect to this address, this

43:40: URL, right?

43:43: And if I do that again, like

43:46: nothing's connected yet.

43:48: And what I can do is I can I can create

43:52: a remote

43:53: configuration.

43:57: And in this case, this will be a an SSH

44:00: configuration. And again, we have these

44:02: helpers um

44:04: that um

44:06: >> [clears throat]

44:06: >> really sort of like minimize what needs

44:08: to be done. So, here I create an SSH

44:11: configuration and

44:13: the only Sorry, the the there are

44:16: arguments, but the only the only

44:19: required argument is this remote

44:21: argument. And that is the simply the URL

44:25: of the computer that you have SSH access

44:28: to.

44:29: So, to give you an example, um

44:33: um, I switch to my terminal here.

44:37: If I have Sorry, this is just um So, I I

44:41: actually I'm actually connected to a

44:43: VPN. So, this is I have access So, if I

44:46: can have SSH, right?

44:49: Um, over the So, {slash} P, this is the

44:52: port that um

44:54: you connect to and this is

44:57: this is the address of the machine that

45:00: you can connect to. Sorry, here.

45:03: And if I have access to this machine

45:05: over SSH, and so this is like I'm

45:08: actually running um, on this machine.

45:10: So, I have a MacBook, but this is um

45:13: connected to a Linux machine now.

45:17: I'm going to just exit out of that.

45:19: But, essentially that URL there, which

45:23: um was 192.168.0.101.

45:30: That's the only information I need to

45:32: set up um

45:34: this configuration in Mirai.

45:36: Okay?

45:38: So, once I have that, then I can

45:39: actually launch um

45:42: use launch remote, so not launch local,

45:44: launch remote. So,

45:46: again, I can uh launch maybe two demons

45:49: and I can pass that configuration in.

45:51: Okay?

46:01: And

46:04: see what happened. Oh.

46:08: Ah, so we have a time. So, again, this

46:11: is

46:12: this is

46:14: this is useful

46:15: because

46:16: again, as I was explaining how Mirai

46:20: works is you spin up this basically like

46:23: this base station, right?

46:25: Which listens for incoming connections.

46:27: That means

46:29: the computer that you have access SSH

46:31: access to has to be able to dial in to

46:34: your

46:35: to the machine that you're running Mirai

46:38: on.

46:39: And in this case

46:42: that's not possible because I don't have

46:44: these ports over opened

46:47: on my local laptop.

46:50: Fortunately

46:52: Mirai allows you to connect

46:55: using SSH tunneling.

46:58: So, SSH tunneling

47:00: again, like

47:02: people tend to get confused, so I will

47:04: try to explain it in the simplest terms

47:06: as possible.

47:09: SSH tunneling is basically when you

47:12: connect to a computer using SSH.

47:16: That creates a tunnel

47:18: immediately. So, imagine there's a

47:20: tunnel between the two sides.

47:23: Now, instead of

47:27: a connection being made between the two

47:28: sides

47:29: each side connects to a local port. So,

47:35: if I'm

47:36: as Mirai sort of if I set demons, I'm

47:41: listening to a local port and then

47:44: on the demon side

47:46: that computer is dialing to a local port

47:50: and then the tunnel basically bridges

47:52: the two sides. So, there's no longer any

47:55: connection from that computer to my

47:57: computer.

48:00: And

48:00: >> it to an intermediary.

48:02: Yes. And like very concretely, if you

48:05: follow this, you will get it. So,

48:08: if I just

48:10: if I um if I just shut down the previous

48:13: demons,

48:15: and in this case,

48:18: what I'm going to do is I'm going to

48:19: create a local URL,

48:22: right? So, this is not um

48:26: this is not the URL that's open to other

48:28: computers on the network. This is a

48:30: local URL. I'm going to set TCP equals

48:33: true, because this is um this is a TCP

48:35: connection.

48:41: If I use status, this just gives me a

48:43: little bit more information than um

48:46: info, but you can see

48:49: we're actually listening to this 127

48:52: this address, which is the local host

48:54: address. So,

48:55: I'm now listening to a port on my own

48:57: computer, and this is the port that the

48:59: tunnel is going to be um opened um

49:03: on.

49:06: I can then create this um

49:09: SSH configuration.

49:13: And again, I can connect to um

49:19: this address is 192.168.0.101,

49:23: and uh actually need to use this port,

49:26: because that's how I configured that.

49:29: And

49:31: I just need to specify this this

49:33: argument, which is tunnel equals true.

49:36: Okay?

49:38: I think I know what you're talking about

49:40: now.

49:41: >> if I if I try and

49:43: if I try and launch now using this um

49:47: this configuration,

49:49: um

49:50: this should now hopefully work.

49:54: So, yay! Now I have two

49:56: >> I have two workers and they are

50:00: on another machine that I have that's in

50:02: London. It's actually a very old sort of

50:04: converted

50:07: Mac Mini actually. Um but it's running

50:09: Linux now. Um and to prove to you that

50:12: it's running Linux, I'm going to run

50:14: like Mirai and I'm just going to

50:17: ask for the sys.info, okay?

50:20: Um from the worker.

50:23: And you can see that

50:25: Hey, this is running Linux. And just to

50:27: prove I'm not running Linux.

50:30: Um

50:32: This is my

50:34: machine. It's definitely some form of

50:37: Mac.

50:39: Okay. Um that was a whirlwind, but if

50:41: you got that, um you understand how sort

50:44: of SSH tunneling

50:46: but as you can see, all you all you had

50:49: to do was create this configuration,

50:51: which is just this URL, which is if you

50:53: can access

50:55: that machine over SSH, you have all the

50:58: information you need to to run um

51:01: to run um Mirai over SSH.

51:04: Okay.

51:06: Charlie, this was so much information

51:08: all at one time. We have so many

51:10: questions that we will not be able to

51:11: get to all of them, but I want in our

51:13: last five four five minutes here

51:16: um to see if we can get to some of them.

51:19: Um so, one of them from Brent was, I

51:21: believe NumPy distributes calculations

51:23: over multiple cores. So, does Mirai

51:25: allow R to perform the same thing as

51:27: well?

51:29: Yes, it does. And the um

51:33: NumPy is very specific. So, it'll run um

51:36: only numerical um

51:39: work that NumPy handles.

51:41: Mirai allows you to run arbitrary um

51:45: R expressions. So, it's anything you can

51:47: do in R, you can you can put in Mirai.

51:49: That's that's the difference.

51:51: Great. Any R processors. Okay. Dan had

51:53: also asked, does Mirai ship with some

51:55: kind of task viewing dashboard, like

51:58: Python's dash visualization, so that you

52:01: don't have to type info over and over?

52:05: Uh, not built in.

52:08: Not built in. Okay.

52:09: Great.

52:10: Um, let's see.

52:13: We had another question that was, can we

52:15: use parallel detect cores to see how

52:19: many demons we can use? I really like

52:21: this question because I don't know how

52:22: many demons I would have access to.

52:24: And that's a great question. And like,

52:28: Mirai by design forces you to actually

52:30: specify the number you want. So, that

52:32: can be, you know, that can be 14, which

52:35: is sort of number of cores I have on my

52:37: laptop. Um, so you can use something

52:40: like parallel,

52:42: uh, sorry, parallel detect cores or

52:44: whatever.

52:46: Bam.

52:46: >> But, you know, you can easily be on a

52:48: server with, you know, 256 cores or

52:50: something. And like, sometimes you don't

52:53: want to use all your cores because you

52:54: might be running something else, right?

52:56: So, like, it never has that context

52:58: you're running, um, a,

53:00: um, a, automatic, um,

53:02: function.

53:04: The other reason is

53:06: this, like, you might want to be using

53:09: all your cores if, um,

53:12: what you're doing is compute intensive,

53:15: right? You want to sort of utilize all

53:17: your cores.

53:18: Fine.

53:19: But, instead, if what you're doing is

53:22: actually waiting on, um,

53:24: IO, so this is like,

53:27: if you're requesting, um, like a

53:29: download, right? That is actually not

53:31: taking all your computation power. So,

53:33: for those kind of tasks, you might

53:35: actually want to use more than the

53:36: number of cores you have. So, you might

53:38: want to use like 28. Like, if all you're

53:41: doing is like querying some remote API.

53:44: So that's also another reason why like

53:47: I don't sort of try and assume like the

53:50: number that people want. Um and yeah.

53:54: Okay, so with our last 2 minutes, Zach

53:57: said he had to leave but he had a great

53:59: question. He said in typical data

54:01: science work, would parallel processing

54:03: be more useful than async processing, do

54:06: you think?

54:08: Um yes. Um

54:10: if um and and Mirai actually powers a

54:13: lot of things sort of under the hood,

54:15: right? So if you're using parallel per

54:19: that uses Mirai. So you set demons but

54:22: you use the normal per syntax and that

54:26: is just parallel. It's not async.

54:28: Where async really sort of comes into

54:31: its own is if you're um using Mirai with

54:34: shiny

54:36: or using Mirai with something like

54:38: plumber two. So again, Mirai powers

54:41: plumber two under the hood. So if you

54:43: use an async function in plumber two,

54:45: that implicitly uses Mirai.

54:49: Awesome. Okay, I bet we can get in one

54:51: more question.

54:54: One more, one more.

54:58: So Rob had asked, can you print progress

55:01: {slash} percentages that only get shown

55:03: on call?

55:05: Like while things are running.

55:07: I think that's what that's asking. Yes.

55:09: Um right. So um

55:11: So very quickly, if you do like uh Mirai

55:13: map um um one of the collection options,

55:16: so instead of just collecting is you can

55:18: do like progress and um and that gives

55:21: you a progress indicator.

55:25: Aha. Okay, cool.

55:27: Please carry on while I do something.

55:30: >> [laughter]

55:31: >> I'm going through and just looking at

55:33: all these questions.

55:34: Um I think that I will get with Charlie

55:36: since we are out of time, and we'll see

55:38: if we can answer some of these.

55:41: Um there is one from No Tobacco. There's

55:43: one from David Diaz.

55:45: And they look like they could be

55:47: answered pretty quickly, so we'll answer

55:48: them in the chat after the session.

55:51: Charlie will help.

55:53: Excellent.

55:56: All right.

55:56: >> The last thing I want to mention, oh no,

55:58: I'm out of time. There is a

56:00: >> out of time.

56:01: >> [laughter]

56:03: >> There is a Mirai skill. So, if you

56:06: folks all have access to cloud code or

56:09: open code or some great AI agent

56:14: installed Olive skill, Mirai, and you

56:17: can just invoke that. And you can trans-

56:20: like you can transform all your sort of

56:22: normal scripts into parallel um and

56:26: async code.

56:29: Amazing.

56:30: Oh, I just spelled sorcery wrong in the

56:32: chat. Don't at me. Hold on. Let's fix

56:35: it.

56:36: >> [laughter]

56:37: [gasps]

56:38: >> All right. Thank you so much, Charlie.

56:39: That was amazing. You're getting thank

56:41: yous in the chat. Thank you for being

56:43: patient with us while we all try to

56:45: muddle through what async is, what

56:47: parallel is, what Mirai does, what

56:49: future and promises are. I think we all

56:51: learned a lot and have a lot to like go

56:53: Google and think about.

56:55: I wish that I knew about this in

56:56: undergrad and grad school. Um

56:59: I definitely didn't, and it would have

57:00: helped my

57:02: my life quality of life with coding so

57:05: much. So, thank you so much. We will get

57:07: with Charlie to answer some of the more

57:10: simple questions afterwards in the chat.

57:12: We will see you all on Thursday at the

57:14: Data Science Hangout, if you would like.

57:17: Thank you, everybody. Have a fantastic

57:19: week.

57:20: I'll see you when you see you. Thanks,

57:22: Pauline.

57:24: Thanks, everybody.

57:26: Bye. Thank you, Charlie.
