---
type: Video Transcript
title: "Git Worktree-First Workflow + Conductor | Barret Schloerke | Data Science Lab"
description: "I am a data community manager here at Posit."
resource: "https://www.youtube.com/watch?v=6WaRXXxl6g4"
tags: ["ds-lab", "workflow", "git", "github", "shiny"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T21:59:18Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=6WaRXXxl6g4"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2026-08-27T00:00:00Z"
    usage_count: 1480
usage_window: { from: "2026-08-27T00:00:00Z", to: "2026-09-08T21:59:18Z" }
---

# Transcript

00:08: Hello everybody. Welcome to the data

00:10: science lab. My name is Libby Herren. I

00:12: am a data community manager here at

00:13: Posit. I'm joined by Isabella Velasquez,

00:16: my co-host today and your um maven on

00:20: Discord. Isabella, would you like to say

00:21: hello?

00:22: >> Hi everyone. Thanks so much for joining

00:24: us. We're so glad you're here. and we

00:28: are joined by our lab manager for today

00:31: um Barrett Schlurk. Barrett, would you

00:33: like to introduce yourself?

00:35: >> Hello, my name is Barrett Schlurky. I am

00:38: on the shiny team at Posit and uh yeah,

00:44: just discovered work trees, you know, uh

00:46: few months ago and haven't looked back.

00:49: So, I want to share with everyone all of

00:51: that I know.

00:53: >> Yay. That's what we're all about. Okay.

00:55: If you've never been to the data science

00:56: lab, we get together every Tuesday, same

00:58: time, same place most Tuesdays.

01:00: Sometimes we take breaks and sometimes

01:01: there's holidays. Um, but we are here to

01:04: do exactly what Barrett just sh just

01:06: said to share knowledge, to talk about

01:09: technical content. And this is a place

01:12: where we do not have a bunch of slides

01:15: and and just talking and lecturing and

01:17: presentations. This is more about screen

01:19: sharing and hopefully doing a little bit

01:22: of like expo exploring and paracoding

01:25: with your friends on the internet, your

01:27: data friends on the internet. Today we

01:29: are going to be talking about git work

01:31: trees which is a concept that I that did

01:35: not come into my brain until same as

01:38: Barrett a few months ago. Isabella and I

01:41: were working on um the data science lab

01:44: episode that we did for um Git and

01:47: GitHub integrations in Positron which

01:50: was very very fun and super super great.

01:52: I think a lot of people had fun with

01:54: that one. So check look for that one on

01:55: YouTube. Um but inside of our

01:59: exploration in positron I remember I

02:01: kept seeing work trees over and over

02:03: again and I'm like what the heck is a

02:04: work tree? And then I noticed more

02:05: people talking about it. You know when

02:07: you hear a word or you see a word, you

02:08: learn a word and then you see it

02:09: everywhere. That started happening with

02:12: work trees. Um and then a lot of people

02:14: in the lab started asking about them.

02:15: What is a work tree? So Barrett is here

02:17: to talk about them. Barrett, I am going

02:19: to give a brief explanation and I'm

02:21: going to let you take it away with some

02:23: demonstrations of what I am talking

02:25: about. If you have never um explored

02:29: work trees before, and some of us have

02:31: like I know James here um has used work

02:34: trees before. We've talked about that

02:36: work trees allow you to basically check

02:39: out two different git branches at the

02:41: same time locally. So usually with git

02:44: you get you check out a branch and you

02:47: have a view of your project, right? You

02:50: you have a view of all of your folders

02:51: inside of your project

02:54: and you can make changes, commit them.

02:59: But if you haven't really like finished

03:01: what you're doing, you sort of have to

03:02: like stash your changes or commit it

03:04: temporarily and then you can go check

03:07: out a different branch and and do other

03:09: things. This allows you to check out two

03:11: different branches at the same time

03:13: locally which you can switch between,

03:15: but they are visible to you in a folder

03:17: structure. So each version of your

03:19: project basically is in a different

03:21: folder. Have I blown anybody's mind yet?

03:26: A little bit.

03:28: Okay, I would like to reiterate that

03:30: that is the main [sighs]

03:34: explanation. It allows you to check out

03:36: more than one branch at the same time.

03:38: They have to be different branches. They

03:40: of course cannot be two versions of the

03:42: same branch. That would create a local

03:43: conflict that would not work and then

03:45: the universe would implode. So, that

03:47: doesn't work. They have to be different

03:48: branches. Um, I'm going to let Barrett

03:51: take it away. What did I miss from

03:53: there? because that's a simplified

03:54: explanation, but I don't want anybody to

03:56: be like afraid of the topic.

04:01: >> Uh, no, that's that's uh good job,

04:04: Libby.

04:04: >> The gist.

04:05: >> That's the gist. Yeah.

04:07: >> Okay.

04:07: >> Uh, exactly that. Um, so yeah, I will

04:11: reiterate uh work trees are essent it's

04:16: it's as close to a full clone to a new

04:19: repo. So that uh um except the only

04:24: thing uh with work trees is that they

04:26: try to make it a uh it's not done ad

04:30: hoc. You're not just willy-nilly

04:32: checking out cloning your repo into

04:34: different folders. It's a uh organized

04:38: way to do so. And uh there's ways to do

04:41: it on command and also to clean it up.

04:43: And cleaning it up is important because

04:44: you don't want just clones existing

04:47: forever and ever and ever

04:49: >> because it's your whole project, right?

04:51: Like it's like this is

04:52: >> a whole repo

04:53: >> clone of your repo. So if you have a

04:55: very very large repo, imagine the memory

04:59: the local memory that would be taken up

05:00: by just like cloning your project over

05:02: and over again. So just like when you

05:05: want to delete your local branches, it's

05:07: important to delete your local work

05:09: trees right when you're done.

05:11: Even more important, I think branches

05:13: feel more like diffs. So, it's just

05:15: little alterations, right? Where work

05:18: trees on your hard drive, it's

05:19: physically two full copies.

05:22: >> Yes. So, instead of uh in the mental

05:24: model of branches where a branch is only

05:28: storing what has changed, right? Because

05:30: it's like I'm only going to look at

05:32: what's changed. Everything else is the

05:34: same. We're going to leave it. we're

05:35: only going to we're only going to store

05:37: the diffs, which is what you are seeing

05:40: when you were looking you're looking at

05:41: the differences. Um, but with work

05:44: trees, it is like we're going to bake

05:47: you a whole another cake. You have a

05:49: whole extra thing that you are storing.

05:53: I think that's a really really important

05:54: thing to remember. Um, and I saw on I

05:58: want to say blue sky this morning or

05:59: last night

06:01: Carlos who is also uh at posit talking

06:05: about how he had filled up an entire two

06:07: terabyte hard drive or something with

06:09: work trees. I think they can add up very

06:11: quickly if you're doing a lot of things

06:12: at one time. Um, so Barrett, when is

06:18: understanding and using work trees

06:20: important and valuable? Because I've

06:22: never used it before, needed it before.

06:24: Obviously, I haven't hit that use case,

06:26: but the way that a lot of people are

06:28: working every day, especially using AI

06:30: agents, is changing what people need.

06:34: >> Yes. Uh so short answer is whenever you

06:39: would say, you know, get checkout make

06:42: new branch you whatever incantation you

06:45: wanted to do, I've replaced that

06:48: completely with make new work tree.

06:53: Okay.

06:54: >> And this has removed my need to know

06:56: about stashing or like committing

07:00: temporarily. I don't need to do all of

07:02: these little workarounds to get my my

07:05: job done. And I think it's really

07:06: beneficial because like you could be 2

07:09: days into a feature and then your boss

07:11: or you know CI comes back and says you

07:14: need to fix this now. And like it's so

07:18: disrupting to try to figure out like how

07:20: do I pause this to go over here and

07:23: instead with work trees it's like all

07:26: right from main branch make new work

07:29: tree

07:30: and it's in a different folder so you

07:32: can have you know kind of how when you

07:34: have your uh R studio IDE or positron

07:38: you have like your unsaved files and

07:40: they just magically reopen when you open

07:42: up your project again. it it's like

07:45: having that with work trees. You could

07:47: have your unsaved changes and it's

07:49: separate. It's different and it works

07:52: out well that way. And um so anytime

07:55: that I would say get you would have a

07:57: get checkout to start a new feature

07:59: instead we should create a new work tree

08:02: and then we can do our work in parallel

08:04: that way.

08:05: >> Okay. And I think it's important to say

08:07: that this type of working will not be

08:10: for everybody. There will be a lot of

08:11: teams who are just like we're going to

08:12: keep doing exactly what we're doing. We

08:14: don't have a need for work trees. This

08:16: is a place where we can just be in

08:17: receive mode and learn about this stuff

08:19: even if we don't need to directly apply

08:20: it right now and learn about new

08:24: possibilities and new ways of working

08:26: that we could maybe adopt and adapt to

08:29: what we need to do. So Barrett, I would

08:32: love it if you would be able to share

08:34: your screen and let's talk a little bit

08:35: about what this actually looks like in

08:37: practice. Um, so we're talking about

08:39: work trees on a basic level right now.

08:41: But Barrett is also going to show us

08:45: the sort of next Pokemon evolution of

08:47: that, which is orchestrated work trees,

08:50: which is a work tree first way of

08:53: working. Um, he uses a tool called

08:55: Conductor, and I will let him explain a

08:58: little bit more about what conductor is

09:00: because I think that, um, it's going to

09:02: be a little bit of another level of

09:05: brain expansion. Um, before we get

09:08: there, let's ask one of our questions

09:11: that I saw James ask that says, "Can you

09:13: have a sparse work tree?" And I'm not

09:16: 100% sure what James means by this, but

09:19: I'm guessing it's a uh memory saving

09:23: sort of uh concept here.

09:25: Uh unfortunately James I believe

09:28: branches are going to be your model for

09:31: sparse sparsity uh and that they only

09:34: have the diff where in work trees it's

09:37: physically f full file copies. They're

09:39: not soft softlin or sim linked. It's

09:42: it's full copies. So

09:44: >> okay

09:45: >> uh no sparseness.

09:48: >> All right let's do it. I love Daniel put

09:53: um the Spider-Verse of GIF of the

09:55: Spiderverse in the in the Discord, which

09:57: I think is a really great sort of

09:59: hilarious analogy here where we have a

10:01: billion Spider-Man. Um okay, what are we

10:04: looking at here? Because I see Oh, yeah.

10:08: Uh so I had I of course I'm going to ask

10:10: Claude because I'm doing agent workflows

10:12: for everything. Um, in that the way that

10:15: they kind of explained how work trees uh

10:17: kind of shows up is that if you have all

10:19: of your work being done on a single

10:22: stove

10:23: with normal stashing, you need to come

10:26: in, you need to scrape the pan, clean

10:28: with get stash, you need to add new

10:30: ingredients by checking out another

10:32: branch, and then, you know, hopefully

10:34: you can keep everything straight in your

10:35: head. Um

10:38: whereas with uh with work trees, you

10:42: don't need to like clean up your stove.

10:44: Instead, you can just make a new stove

10:46: and start your new feature or your new

10:48: fix. And then when you're done with that

10:50: stove, you can just delete it.

10:52: [laughter]

10:53: So the steak can keep cooking while you

10:56: make, you know, the rice real quick. And

10:58: then, you know, when you're done with

10:59: the rice, you can just delete the stove.

11:01: Um and uh they all will share the same

11:05: pantry or the same git uh checkout.

11:09: Um okay so let's look at a fun um so

11:17: context this is conductor um conductor

11:20: is a

11:24: um

11:26: conductor.build build here. It is a Mac

11:30: only application. There is a I am going

11:34: to not uh there's another application

11:36: called Superset. Um it achieves the same

11:40: goals as conductor. I just have enjoyed

11:43: conductor cuz it's a little more UI uh

11:46: heavy instead of where superset just

11:49: kind of feels like terminal coordinator.

11:52: Um I like a little bit more UI in my

11:55: applications. Um, but Conductor, it

11:58: allows you to run a team of coding

12:00: agents for your Mac. And that sounds

12:02: very intimidating. Um, but the way I

12:05: interpret it is that, uh, with the click

12:08: of a single plus button, I can make a

12:10: brand new work tree with a full file

12:14: copy and a full everything. And I can

12:16: say, "Hello,

12:19: um, add my name to the read me.

12:24: I'm in a demo

12:27: [laughter] and this will hopefully

12:30: update the read me with my name.

12:34: >> This sounds like a nice way to teach

12:36: actually from a real world project

12:38: because you can be like, well, I don't

12:39: want to mess my project up by showing

12:41: all of my learners this stuff. Let me

12:43: make a demo work tree real quick and

12:44: then I can destroy everything and it

12:46: won't touch my actual project. Then I

12:48: just delete the work tree. Uh, yes.

12:50: because oh one thing that we did not

12:52: mention gosh I wish we had mentioned it

12:53: before 16 minutes in was that you uh you

12:58: um merge just the same way as you would

13:00: a branch with a PR

13:01: >> so that's how you can sort of resolve

13:04: your changes that you've made in a work

13:06: tree into your main project

13:10: >> yes exactly uh and because it's using

13:13: the familiar merging this is why I've

13:16: switched all of my create branch

13:19: workflow with now create work tree. So

13:22: now I just hit my plus button and then

13:24: I'll create a PR in the top right corner

13:26: for me.

13:27: >> And what also might help us understand

13:29: is Lauren's question in the discord

13:32: which [clears throat] is where does it

13:33: make this copy? Where does it live? Is

13:35: it in the same working directory? Is

13:37: this the right type of like question to

13:39: even be asking?

13:40: >> Absolutely. It's it's very important.

13:43: Um,

13:44: in general,

13:46: I I went through my settings earlier

13:48: just to make sure I wouldn't show you my

13:49: API keys just by accident.

13:51: >> Oh, you're uh uh that would be that

13:55: would be bad. Um, they have it in

14:00: I thought I saw it. It was all right.

14:04: Well, if anything what we can do there

14:08: we go. So the root path ends up being

14:10: this is the repo and then the workspaces

14:13: go inside my uh like a conductor parent

14:17: folder workspaces and then every single

14:20: of my local projects on the left will

14:22: have their own folder here and then

14:24: inside that will be like kind of like

14:26: the branch name but it'll be the work

14:28: branch or the work tree name. So if I

14:31: just

14:32: >> you can name your work trees after your

14:33: branches but you can call them different

14:35: things. I've seen people call them the

14:36: name of the agent that's working on it.

14:38: I have seen them call them just like fun

14:40: things.

14:42: >> Um yes. So in shiny react

14:46: uh what conductor actually does is by

14:49: default they actually open the uh whole

14:53: work tree. You have to give it a name

14:54: just like a git branch but they don't

14:56: know what you're going to work on. And

14:59: so what they do is they actually make a

15:01: fake name first. And in this case, um,

15:06: oh, away zoom.

15:08: In this case,

15:09: >> zoom is the worst. [laughter]

15:12: >> I thought I had it.

15:15: Uh, the name has gone away. Oh, it's

15:16: Geneva here. So, in Geneva, this is

15:19: actually the one that it opened, but

15:22: when we I gave it a task right at the

15:25: beginning. Go.

15:28: uh when we gave a task right at the

15:30: beginning it changed the workree name to

15:33: uh add to read me. Yeah, add name to

15:35: read me. So what ends up happening is

15:38: they make a soft link of a folder of add

15:41: named readme which points to the Geneva

15:43: folder because Geneva doesn't mean

15:45: anything to me but this is now useful to

15:47: me if I were to open this folder inside

15:49: positron or inside Z code wherever now I

15:53: can do my normal work there if I want to

15:58: [snorts]

15:58: >> okay

16:02: >> absolutely

16:03: okay so I've done some

16:06: Great. Um, and then with conductor it is

16:10: as easy just to say make me a PR

16:14: and it'll tell the agent to write up

16:17: instructions. It has a default

16:19: instructions that it gives. Um,

16:23: and then

16:29: just thinking about it very quick

16:32: hopefully. Uh,

16:35: Uh speaking of hopefully um why work

16:39: working trees are useful for me as well

16:43: is there will be times well where I may

16:46: send an agent on a task and it may work

16:50: or it it's not it may work. I routinely

16:53: have um

16:56: 15 to um 15 to 45 minute

17:02: run times. uh that my agent is working

17:05: and I don't know when it's going to

17:06: finish. I don't know, you know, when

17:09: it's going to be ready for me to help

17:11: it. And so it's implementing a long

17:13: time. Um I have some co-workers where

17:17: they let it kind of run for like four or

17:19: five hours and then they check on in on

17:21: it in the morning and they check on it

17:22: at the end of the day and as a

17:24: background task.

17:26: >> Wow. So the work tree it's working on in

17:28: parallel just the background and you can

17:30: do other stuff on other work trees in

17:32: the meantime.

17:34: >> Yes. Yeah. So since I'm

17:36: >> twiddling my thumbs for 15, you know, 30

17:39: minutes like

17:40: >> why not start the same process and now I

17:42: can, you know, I feel like I'm spinning

17:45: plates uh all at the same time. Uh

17:48: >> plates that um won't crash into each

17:51: other. This is another thing that

17:52: somebody brought up on or a few people

17:54: brought up on Blue Sky when we were

17:55: talking about it was that it creates

17:58: this sandboxed environment where your

18:01: agents cannot step on each other's toes.

18:04: They cannot like bump into each other by

18:08: and cause cause conflicts because

18:10: they're in totally different spaces and

18:12: likewise they can't bump into you or

18:14: step on your toes. Um is that something

18:17: that you could explain better for me?

18:20: Uh, yes. Just a second. I don't know why

18:24: >> you just switched off your screen and

18:25: you're probably working on something

18:26: that you need your brain for.

18:30: >> I don't know why my GitHub has decided

18:33: to log out.

18:35: >> Oh, no.

18:36: >> It's It's all good. I'm I'm logging

18:39: >> to me every single time I need to do

18:41: something.

18:42: >> It's like

18:43: >> while you're logging in, there are a few

18:45: questions on the Discord. We can

18:47: >> we totally can if you have the the brain

18:50: power to open a new work tree in your

18:51: brain so we can ask you a question while

18:53: you're working [laughter] on that.

18:56: Um I saw that Matan had asked is Robo

18:59: Rev um which is by Wes McKini an example

19:03: for an alternative to conductor or does

19:05: it serve a different purpose? I have no

19:07: idea what Robo Rev is. Do you happen to

19:09: know Barrett?

19:11: >> Uh yes. So, robo rev is

19:15: did

19:20: uh sorry um so funny that it's failed.

19:24: Uh so Robo Rev is a as the name kind of

19:27: hints at it's a uh ro robotic code

19:32: reviewer and what its job is it's trying

19:35: to do is that um

19:39: uh

19:41: whenever you make a commit you can do

19:44: this locally or on GitHub. Uh but

19:47: whenever you make a commit, Robo Rev

19:49: will insert itself into the process and

19:53: say, "Let me code review this right

19:54: now." Not after you've made 10 commits.

19:58: Because if I'm, for instance, today I'm

20:00: using Claude. Um Claude will perform 10

20:04: tasks and so it will commit along the

20:06: way as it's executing its its work. And

20:09: then when it's like along the way, Robo

20:12: Weeb will inject itself saying, "Hey,

20:14: I'm a code reviewer. let me work in here

20:16: please and it'll be like yes I agree

20:18: with the decisions you've made so far

20:20: you you know continue or it will say oh

20:22: linting errors please fix this or I

20:25: found a security flaw fix it now not at

20:27: stage 10 but at stage two um so it tries

20:31: to catch things and steer things early

20:34: um I like it uh

20:38: some colleagues have said that um they

20:40: want to do it more on demand uh where I

20:43: am as well and I will say like, "Ah, I

20:46: like the amount of work that I've done.

20:48: Uh, please wait till step 10 and then I

20:51: may invoke it manually." Um,

20:53: >> awesome. All right, cool. Well, we've

20:55: got a couple more that maybe we can do

20:57: really quickly before we keep going.

20:59: >> Um,

21:00: Daniel had asked, "I'm trying to tinker

21:03: with this concept, but can work trees

21:05: open an orphan branch that is only a

21:08: subdirectory of the main repo?"

21:13: a subdirectory like for monor repo

21:15: usage. Um

21:17: there is in

21:20: the FAQ

21:23: um work in monor repos. I will defer you

21:28: to the FAQ there Danielle.

21:31: >> Cool. Can you can you stick that um link

21:33: somewhere that Isabella can get it so

21:35: she can disseminate that? You also have

21:38: the ability to post it in the Zoom or

21:40: anywhere. Ah awesome. Great. Discord.

21:42: Okay. So, if anyone doesn't know what a

21:43: monorre repo is, um a monor repo is a

21:48: repo with multiple projects in it

21:50: basically like whereas a lot of people

21:53: would be like no no no one project per

21:54: repo. There are some organizations or

21:56: some teams that for different reasons

21:58: work in a monolithic repo. Um and you

22:02: have to have a different way of sort of

22:05: working inside of it and doing things.

22:06: And so that might be the question that

22:08: Danielle was asking. Um, and then we

22:11: have one more from Anna that says, "Hey,

22:13: so work trees are specifically useful

22:15: for when you're using an agent workflow

22:17: or can they be useful without agents?"

22:19: They can be useful without agents. I

22:22: think they are more useful by far if you

22:25: are working in an agentic workflow.

22:26: Barrett, does that seem right?

22:28: >> Absolutely. Yeah. Okay. When there's

22:30: this waiting time that you can control,

22:33: it's much more useful with agentic

22:34: workflows. But I would personally just

22:37: switch all my branch workflows to be

22:40: work tree workflows instead.

22:42: >> I think it also benefits you more when

22:44: you have a robust and large code base.

22:47: If you have a very very tiny codebase

22:49: and a very very tiny project with very

22:51: very few possibilities of this like

22:53: multiverse situation, it's probably a

22:56: little bit less useful and it might be

22:58: overkill, right? So use your critical

23:01: thinking to determine whether or not it

23:03: would really be useful for you. Um, I

23:05: have also seen people use it for

23:07: testing. They might um, sort of AB test

23:11: something where they're like, I have two

23:12: implementations of something on my repo.

23:15: They're in two different work trees and

23:17: I'm going to test each of them for

23:19: efficiency and for all kinds of

23:20: different things to see which version I

23:23: like better and which version works

23:24: better and then keep the one that that

23:26: works better. And running tests can take

23:28: a long time. So, you could run them at

23:30: the same time on different branches.

23:33: Okay.

23:34: Let's get back to uh conductor and a

23:39: little bit of a practical explanation of

23:42: what we are seeing on the screen.

23:45: >> Uh so my git login is is off. I don't

23:48: know why it is working in the terminal.

23:50: Uh so I can just make a new PR like

23:54: normal um rather than having claude try

23:58: to do it for me and it would be there.

24:01: So, I didn't have the agent make it make

24:04: it for me. Uh, but in in the past, I've

24:07: I think I've made like under five commit

24:11: messages and or PRs manually in the past

24:13: 6 months. I've switched over so hard to

24:17: having agentic workflows

24:19: uh just cuz it works for my use case.

24:22: But I can make a PR and I could get it

24:25: merged in. uh conductor will tell you

24:29: that a a draft PR has been open. Here's

24:32: the PR number. It's ready for review and

24:34: we can get that merged. Um

24:39: uh let's

24:41: um one thing that we Oh, yeah. Go ahead,

24:44: Libby. [laughter]

24:46: >> No, no. I'm trying to tie in some stuff

24:48: I'm seeing happen in the Discord because

24:51: um there's a little BS code symbol

24:54: that's at the top right of your screen

24:57: >> and you have a little ability to open in

24:59: different things. So I wanted to just

25:01: highlight to people that conductor

25:03: really is a conductor. It's not an IDE.

25:07: >> It is not an IDE. I agree that when

25:12: I view the file edits or there's a

25:14: preview of the markdown, I mean I I

25:17: appreciate the markdown preview like

25:18: right there. Um

25:21: it go away. Uh but it is not a good

25:25: editor. Uh when I use the edit mode,

25:27: it's it's not the nicest syntax

25:30: highlighting. And so uh to open it into

25:35: Posetron, you'll need to copy the path.

25:37: But for VS Code and I believe cursor and

25:40: zed, they have native um support. So I

25:43: can just say open. And now I'm back to

25:46: VS Code just like you know most people

25:48: will be uh familiar with. But I'm inside

25:51: my work tree and that is the best part.

25:56: >> Perfect.

26:00: Um there are um so let's say I got my PR

26:06: and I am ready for it to be merged.

26:10: There is actually a setting that you can

26:12: do in

26:15: get that

26:17: uh let me

26:20: where is it say rename when it's done

26:22: delete branch on archive and archive on

26:25: merge. So, one of the things that I

26:27: really like is that let's say I liked my

26:30: PR putting my name at the bottom. And uh

26:34: it's it's ready for review. So, let me

26:37: open it and actually mark it as ready

26:39: for review.

26:41: And now back in conductor, I can say

26:44: merge. So, I'm going to do that. And it

26:48: will actually come through. Merge it. I

26:52: hope unless

26:55: Yeah. And now it archived my workspace.

26:59: The PR was merged and my workspace was

27:02: archived. So it auto cleaned up

27:04: everything for me given that PR was

27:07: merged. And now

27:10: I just can come back and hit plus and

27:12: move on. And we'll actually see that in

27:16: the read me at the bottom.

27:19: Uh authors Barrett

27:22: it is there. Uh because it bases

27:24: everything off of origin main to begin

27:27: with.

27:29: Uh so yeah, it's it's just feels very

27:33: similar to like if I didn't tell you

27:34: this was work trees under the hood, it

27:36: was just branches,

27:38: you would feel like it's you're none the

27:40: wiser about what's actually happening,

27:42: >> right? because

27:45: instead of you actually looking at the

27:47: folder structure separately when you're

27:50: using conductor it is just like you're

27:51: in a you're just checking out different

27:53: branches. Okay, we have a couple of

27:55: questions that I think will help us

27:58: understand a little bit better. One is a

28:00: followup from Matan that says is this

28:02: workflow do you think mostly for

28:04: software development or could you think

28:06: of use cases for data science or

28:08: analysis or something similar?

28:11: What do you think Barrett?

28:13: Uh so my wife is a data scientist. Um

28:17: she's at uh Sleeper uh kind of like

28:21: FanDuel. Um and they've been doing uh

28:26: some database migrations and that's been

28:28: taking 3 weeks. You know, they're doing

28:31: multiple PRs of files to be migrated and

28:35: um definitely should have listened to

28:38: Michael Chow's DBT talk recently. um

28:42: that would have been very useful. Uh and

28:46: um so this is you know a very long

28:49: process that's happening. You could do

28:51: this in serial branches or serial you

28:53: know PRs. Um but also she needs to do uh

28:58: some analysis at the same time and those

29:00: are going to be three or 4 day projects

29:02: that are needing to be happen at the

29:04: same time. So she can come over here and

29:08: say okay uh let's you know migrate these

29:14: uh files blah blah blah and then come

29:17: here and say uh uh do analysis on this

29:23: data and now they're separated into

29:25: different areas and she doesn't need to

29:27: stash she doesn't need to do anything

29:30: and when one of the migrations need a

29:31: hot fix right now she can go do that

29:34: immediately.

29:36: without having to temporary commit her

29:38: changes or stash her stage changes or

29:41: any of the things which is how I

29:43: generally work. Um, she can just move

29:46: her focus and then move it back. Move to

29:49: the stove on the right while the steak

29:52: is cooking, work on the risoto, and then

29:54: come back.

29:56: >> Absolutely.

29:57: >> Okay. What I really want is this left

29:59: sidebar to be an extra sidebar in all of

30:02: the idees.

30:05: >> There's another one on the left.

30:07: >> It this is it's a hard one because

30:10: Posatron and and Zed and VS Code they

30:14: they look at this folder and this folder

30:18: is narrowly scoped to only this folder.

30:22: It doesn't work for the case of working

30:24: trees where I'm saying I want to belong

30:27: to in this case the shiny react repo and

30:30: within the shiny react repo I want 10

30:32: different parallel work trees and I want

30:35: to switch between them like

30:36: conversations

30:38: and within that conversation I want a

30:40: whole VS code I want a wholeron I want a

30:43: whole zed

30:45: um

30:46: that's what I want but that it it as

30:51: Daniel said in an early message uh VS

30:54: Code and and friends are uh not work

30:58: tree first. They are uh followup to

31:02: making a work tree.

31:04: >> Yes, exactly. I think it's a different

31:07: sort of

31:09: way of working, way of thinking, way of

31:12: approaching everything. Um, okay. We had

31:15: a question from Nathan that said, "I'm

31:16: wondering if work trees are a way to get

31:18: around rendering multiple corto reports.

31:22: I tried rendering them in parallel last

31:24: week and they all crashed because they

31:25: tried to write temp files to the same

31:27: folder."

31:29: >> Oh,

31:31: >> what an interesting conundrum. Yeah, cuz

31:33: the way that Cortto is sort of uh

31:37: what is the word I'm looking for here?

31:38: not read but um parsed

31:42: especially inside of something like

31:44: positron it does create temp folders for

31:46: each of your little cells that you're

31:48: processing right I think hopefully I'm

31:51: not lying about that Jonathan

31:53: McFersonson is somewhere getting angry

31:56: that I got that wrong um

31:58: >> in his grave

32:00: >> uh it depends on your cordo documents if

32:03: you're checking if you're able to

32:06: check in the rendered results

32:08: then sure you can you can do that. Um,

32:13: but because if that's the case, I would

32:16: argue that your documentation is a

32:18: one-way trip and instead you should have

32:20: CI

32:22: render your documentation for you and so

32:24: your machine is free from having to do

32:27: that ever. Um, and have CI

32:32: uh commit it back to the repo when when

32:35: it's when it's done. What is CI? Can you

32:38: define it for us?

32:40: >> CI uh oh man, I've forgotten the

32:43: definition. Uh

32:45: >> CI like continuous integration.

32:48: >> There we go. C

32:50: pipeline.

32:51: >> I always try to define acronyms for

32:53: people because in often in data science

32:55: and in uh software engineering, we just

32:57: use acronyms like they're the word, but

32:58: we don't explain what they are.

33:00: [laughter]

33:01: >> Yes. I No, I forgot the I forgot the

33:03: definition. um

33:05: >> continuous integration continuous

33:07: deployment I think

33:08: >> yes exactly so as um let's say it was

33:13: this one and inside the commits uh there

33:16: would be a workflow in GitHub that would

33:20: come in and say setup job check out the

33:22: repo run corto document commit results

33:26: and then it would be done uh and then it

33:29: would commit back to your PR or back to

33:31: the main branch

33:34: Perfect.

33:35: >> Um, another question from Anna. Anna,

33:37: you're asking great questions today.

33:39: Thank you. It says, "Do you need

33:40: something like conductor to work with

33:42: work trees or can you just use it in

33:44: your terminal, especially for

33:45: non-agentic workflows?" You do not need

33:48: conductor. In fact, you can do it in the

33:50: UI and Positron, which I think somebody

33:52: probably replied and answered in the

33:53: Discord. Thank you. Thank you, whoever

33:55: you were. Um yeah, if if you are in

33:58: Positron,

34:00: you can go to your little three dots

34:03: next to your branch and you can click

34:05: that and go down to work trees to create

34:06: a work tree um from the branch that you

34:09: are on and you can name it. You can also

34:11: just do command shiftp, open up your

34:14: command pallet, type in work trees and

34:16: you will get your little three options

34:18: there whether that's create work tree,

34:20: delete work tree or migrate. There you

34:22: go. You can open one. Um, so you can do

34:26: everything that you need to do in a work

34:27: tree without a conductor. But I get the

34:29: feeling that if you have more than one

34:32: work tree on the go, right? Like you've

34:34: you have the need to create many

34:37: different stoves in your kitchen, it's

34:38: probably easier to have somebody that

34:40: you can put in charge of those stoves,

34:43: right?

34:44: >> Yes.

34:44: >> And that would be conductor.

34:47: >> I feel like

34:49: multiple stoves in our Sims kitchen.

34:52: >> Yeah. If if you are terminal uh friendly

34:55: and you want to use the commands, there

34:56: are full commands uh within the terminal

35:02: um for setting up work trees

35:06: >> should feel fairly native.

35:08: >> Would you be willing to pop that link

35:10: into the Discord or somewhere? Amazing.

35:13: Amazing. Thank you.

35:15: Okay, Discord, if I have missed your

35:18: question,

35:20: um, please put it back in the chat or

35:22: just like forward it to the same chat

35:24: something so that we see it. Okay.

35:30: All right. And thank you to everybody

35:32: who's answering questions. Not all of

35:34: the questions that get asked even need

35:35: to be asked to bear it because sometimes

35:37: they are just answered by the

35:38: wonderfully useful and helpful people in

35:41: the chat. Thank you so much. You're the

35:42: best.

35:46: All right, perfect. Barrett has shared

35:49: that link to the docs in the chat.

35:57: All right, you have just asked it to

35:59: revert your most recent changes.

36:03: >> Oh, yeah. I was putting my name in the

36:04: read me.

36:07: >> How does that work? How does how do

36:09: reversions work? Um, in this case,

36:12: because it is checked into main, it uh

36:15: will just be a new commit. Um, but it's

36:19: it yeah, it's removed the author section

36:21: that added my name.

36:24: Okay. I'm trying to figure out I'm

36:26: trying to wrap my brain around this cuz

36:27: you're in Memphis.

36:30: What is Memphis? Like, I'm having such a

36:32: hard time, I guess, conceptualizing

36:33: these names, the names of the different

36:35: things on the left. Um

36:38: >> because some of them are names, some of

36:40: them are pointers to names.

36:42: >> They have uh where is it? It's projects

36:48: history. No, let me do this one quick.

36:52: Let me quit and conductor.

36:56: There's something with conductor where

36:58: they have a a miniame of if you open up

37:01: enough work trees. Oh, they didn't have

37:04: it right away. But if you open up a

37:06: enough work trees that it will um

37:11: yeah, 74 of 307 cities visited. And not

37:15: all cities have the same proportion, but

37:18: it's like, oh, I was just in Memphis.

37:20: Okay. Well, somewhere over here, uh, you

37:23: know, I visited Memphis and like, tada.

37:26: >> So, it's taking city names to name your

37:29: work trees.

37:29: >> Work trees. Yeah.

37:30: >> Okay. just to be have fun. Um

37:35: >> I needed a little bit of like context

37:37: around why that was happening or what

37:38: that was.

37:40: >> It needs it needs that temp name to make

37:42: the work tree and then once work has

37:44: been started, it makes a new name that

37:46: points back to that temporary folder so

37:49: that it doesn't have two checkouts. Um

37:52: [clears throat]

37:53: yeah, it that yeah, so that's that's

37:56: what it does. um

38:00: because like a a git branch checkout,

38:02: you need a name to check out into first.

38:05: >> And so since doesn't know what you want

38:07: to do, it just kind of makes a fun city

38:09: name.

38:11: >> Okay. James has also asked a question

38:14: that I want to know the answer to, which

38:16: is, is conductor measuring current RAM

38:18: usage up in the upper left?

38:20: >> Uh yeah, that's experimental. [laughter]

38:23: Um let me move zoom.

38:27: Um,

38:29: yes.

38:33: >> Is there a good way to keep track of how

38:35: much memory you are filling up with all

38:37: of these things you're creating and like

38:39: when do you know it's time to delete

38:41: them? Do you do they you have that set

38:44: so that they archive upon merge, right?

38:46: So like you do a PR, you do a pull

38:48: request, you merge into your main branch

38:52: >> and then it archives them. Does that

38:54: mean that it is no longer taking up

38:56: space that it's minimizing them in some

38:58: way or do you still need to go manually

39:00: delete them?

39:02: >> It I think will delete it after 30 or 90

39:05: days if it's just archived kind of like

39:08: okay

39:08: >> Gmail does with your trash. It doesn't

39:11: >> get rid of it right away. But you can in

39:14: the settings set that um

39:19: uh delete branch on archive.

39:23: And if you delete branch on archive and

39:25: you enable this one it will make it so

39:28: that when you archive it is gone gone.

39:31: It is it's not archive it's delete.

39:33: >> Um [clears throat]

39:35: >> basically archive equals equals delete

39:37: at that point.

39:37: >> At that point. Yeah. Do you ever go back

39:40: to ones that you've archived and reopen

39:42: them?

39:43: >> I have and that's why I do not have that

39:46: one checked anymore. [laughter] Um

39:50: there there was uh where was it?

39:55: Oh, history. There we go. So, I think we

39:58: added this one. And if I move zoom,

40:03: uh this was the one that I added my name

40:05: in the readme. And we can see that the

40:07: PR is merged. But if I come back, we

40:11: have the full chat

40:13: for telling me that I couldn't do my

40:15: login anymore. And it's all there just

40:18: as if it we never left. And so that's

40:20: why I like that archive. And then, you

40:22: know, my my attention spans if I'm not

40:25: back to it in 30 days, it I don't need

40:27: it. So, um,

40:29: >> Right. Yeah. It's kind of like if you

40:30: haven't worn something in your closet in

40:32: a year, do you really need to own it?

40:35: >> No.

40:36: >> [laughter]

40:38: >> Um, okay.

40:39: >> So, I'll go back to archive.

40:44: >> I'm checking the chat everybody to see

40:46: if I've missed anything. Bear with me

40:48: for two seconds here. Isabella, also

40:51: feel free to bust in like the Kool-Aid

40:53: Man and tell me if I've missed

40:54: something.

40:58: I did want to go up and highlight

41:00: because Garrick showed up in the chat.

41:03: Hey, Garrick.

41:04: um and kind of gave a deeper explanation

41:07: to Daniel's question about orphan

41:10: branches or orphan subfolders or maybe

41:15: oh I feel like I'm missing it here it is

41:17: okay so he said work trees are a great

41:19: way to interact with orphan branches for

41:21: example GitHub pages branches branches

41:25: that are part of the repo but don't have

41:27: all of the commit history or any of the

41:29: files that are in other branches like

41:31: your main branch they're a great way to

41:34: store rendered docs or other static

41:36: assets in the repo without cluttering

41:39: your main branches.

41:41: Thank you, Garrick, for the extra

41:42: explanation. We appreciate you.

41:48: Okay, what other questions do you have?

41:51: There was another question that was from

41:54: James about what is the little uh

41:57: little red, yellow, green in the upper

42:00: left. That is just a Mac thing that is

42:04: like close the window as red, minimize

42:06: it as yellow, um, and then maximize it

42:09: as green. But that also changes if you

42:10: hit the option key. So like if Barrett

42:12: hit the option key, those would all

42:13: change their like options, their

42:15: symbols. Did you not know that?

42:17: >> No.

42:18: >> Heck yeah. So the green actually

42:20: defaults to full screen, which drives me

42:22: bonkers. So if I hit the option button,

42:24: the green turns into just make bigger.

42:27: Just maximize into the space you have

42:29: without becoming full screen. And I

42:30: really like that.

42:33: >> I So some tricks that are work tree

42:36: independent. I have uh grid. It's one of

42:40: the few things as an open source

42:42: developer that I've actually paid money

42:43: for. Um it's a application to

42:48: just I can then use my mouse to you know

42:51: swipe left, swipe right, swipe up and it

42:55: goes full screen. Uh that's all I use it

42:58: for.

42:59: Um other other applications that I have

43:02: that are independent work trees that

43:03: make my life better with agents. Um I

43:05: use

43:07: >> uh spokenly

43:09: um

43:12: uh spokenly appation.

43:15: >> Uh yep that's all it is. Uh but it's

43:18: free. They have free models. Um so I

43:22: actually use a local uh Nvidia model.

43:26: And so I can come in here and be like,

43:29: uh, option key, turn this, uh, uh,

43:32: speech into text. And then I hit my

43:35: option key again. And, uh, yeah, there

43:40: we go.

43:40: >> This is like a free version of Whisper

43:43: Flow, which on another data science lab,

43:45: we saw Joey Marshall use, which I liked,

43:47: but I also I think it also used the

43:48: option key or something, and I was like,

43:50: wait, I use that key way too much. I

43:51: have to remap it. So I remapped it to

43:53: some other key combo. [laughter]

43:55: Yeah, I I have my right option key cuz I

43:58: don't ever use the right one. I use my

43:59: left one. Um

44:00: >> Oh, man. I don't use the right one

44:02: either. Yep, definitely. I use the left

44:04: one for everything.

44:06: >> Um

44:06: >> um we did also have a question from No,

44:09: which was like way back when, I think,

44:10: which was like, "What do we do if we're

44:12: on Windows? Is there anything comparable

44:14: that you know of that's on Windows?"

44:20: >> Let me see if Superet has it. Um,

44:25: everybody go vote because Isabella just

44:28: asked a poll that is like right in line

44:30: with what I just said, which is, are you

44:31: a Mac user or a PC user?

44:43: >> Christa says, "I want a full session on

44:46: free tools that people use to make their

44:47: life with agents better." Christa, the

44:50: episode with Andrew Heis, not specific

44:53: to agents, but specific to to Positron

44:56: workflows, he uses all kinds of tools

44:58: that just make his life better. Um, and

45:02: I think it's one of the most fun labs

45:05: I've ever been a part of. I was just

45:06: like mind-b blown the whole time

45:08: learning about tool after tool after

45:09: tool.

45:12: >> Um, sorry, it looks like it's only for

45:14: cost as well. I thought it was

45:16: >> more

45:17: >> for super.

45:18: >> Yeah, at least has Linux though.

45:22: Um Oh, no, it's sorry. Mac OS only. Um

45:24: but there there should be something

45:27: coming

45:29: somewhere. I don't know. I'm sorry.

45:32: Um

45:34: >> it's also reminding us that Linu Linux

45:36: exists. [laughter]

45:37: >> Yes. Uh other useful tools that I have,

45:41: um I really enjoy super powers as a

45:45: clawed skill. Um it is a little bit

45:48: overkill. Um but that is it just gives

45:51: me a a a routine cadence. So after

45:55: installing it, um read it read the

45:59: directions here. Um, basic workflow is I

46:03: just say slashbrainstorming

46:05: and I type out two paragraphs worth of

46:08: stuff and uh then it walks me through

46:12: everything else after that. Um, and

46:15: that's where eventually it will uh do

46:19: sub agent driven development on its own.

46:21: like it executes this for me and that's

46:23: where it could be 45 minutes an hour

46:26: like a long time of implementation doing

46:28: exactly what we'd written out in our

46:30: plans. Um and it it doing this workflow

46:34: makes it so that it tries to um get

46:38: steered in the correct direction early

46:40: in planning before implementing it and

46:43: going is this where you wanted to fast

46:44: travel to and it's like no

46:47: >> no you went the totally wrong direction.

46:50: Also, Amelia had posted and she just

46:52: bumped it for us um that a Reddit user

46:55: suggested Paco as a conductor

46:58: alternative if you are a non-Mac user.

47:01: So, you can check out po.sh

47:04: if you would like to take a look at

47:06: that. Looks like another orchestrator.

47:08: Um,

47:08: >> amazing.

47:10: >> There you go.

47:11: I cannot confirm whether or not it is

47:13: the same sort of like work tree first

47:16: situation, but it looks pretty similar

47:18: as we're looking at. We

47:19: >> got that sidebar on the left and

47:23: agents in the middle. I'm happy.

47:26: >> Yeah, that's great. Perfect. Thank you

47:28: so much, Amelia. That's amazing.

47:31: Garrick. No, not Garrick. Barrett, your

47:34: name is almost rhyme. It's killing my

47:35: brain with the two Rs. Barrett shared

47:39: the superpowers

47:41: um skill in the chat as well. So if you

47:44: are looking for that, it is there. If

47:45: you are watching this later on YouTube,

47:47: everything's in the in the description.

47:48: I have gone and I have grabbed all the

47:50: links. Future Libby has grabbed all the

47:51: links that Isabella is putting in the

47:54: chat right now and that Barrett's

47:55: putting in the chat and you should be

47:56: able to find them. And if you are

47:57: watching this later and you're like, I

48:00: heard someone mention something and I

48:01: don't see it. Please comment on the

48:03: video. I will fix it.

48:06: Okay. What I [laughter]

48:09: So Isabella is saying, "I'm realizing

48:12: this is a terrible poll." [laughter]

48:15: Why? Because there are so many other

48:16: options between um between Mac and PC.

48:20: Split 50/50 right now, which is very

48:21: surprising to me. I feel like I mostly

48:23: talk to people who are Mac users, but I

48:25: was a PC user for like a decade. I

48:26: really needed to be.

48:29: Okay, I think that we have gotten most

48:31: questions from the chat, but I see one

48:33: from Dan that is unresolved and it says,

48:35: "If each city is a work tree, where is

48:40: the one true city?" I.e., where is the

48:42: one tree? One true work tree. Is that

48:46: Dan? Are you asking like

48:49: who is the original clone?

48:53: Is that something you have to worry

48:54: about

48:56: to Barrett? I'm saying this to me. I I

48:58: don't know.

48:59: >> I think the the the true clone is up on

49:02: GitHub. That's everything else is local

49:05: checkouts.

49:06: >> Okay. So, that that is part of my

49:07: question. Um and I don't know if it's

49:09: the same question that Dan had, but you

49:11: have all of these named things, right?

49:13: Like we're looking at Casablanca,

49:15: Jerusalem, Wellington, we had Memphis

49:18: earlier.

49:19: >> None of those are Maine, right? Or are

49:21: any of your work trees basically checked

49:24: out to Maine? Uh, correct. It main

49:29: doesn't make sense anymore because main

49:31: is a local branch,

49:34: but all of these work trees are based

49:37: upon origin main.

49:40: >> So, they're based on the remote up like

49:43: the external remote.

49:45: >> Um, so having a work tree that points to

49:49: main doesn't make sense. I would

49:52: actually just have feature branches

49:54: non-stop that point to that are based

49:56: upon origin main to merge into the main

49:59: branch. But you won't really ever have

50:02: the main branch locally. Instead, if you

50:04: want, you just make a new work tree and

50:06: be like, "Oh, I'm in Wellington. It's

50:08: basically main at this point. It's

50:10: technically not, but it's the same spot

50:13: in the like uh git log."

50:17: Um,

50:18: >> do you ever get into situations where

50:20: you're like,

50:22: I need to go fix something, but I

50:25: actually need to

50:27: merge what I'm doing right now because

50:29: the change that I need to make is going

50:30: to depend upon upon the changes that I'm

50:32: making right now. That's the situation I

50:35: get in where I'm like, oh, I need to fix

50:37: this, but I'm not done with what I'm

50:39: doing, but the thing I need to fix is

50:40: going to depend on what I'm doing right

50:42: now.

50:43: So yes, there is um a trick here of fork

50:49: new uh to new uh new workspace. So I

50:53: have my work tree fun analogies task

50:56: here and I can fork to workspace. it

50:59: makes a new one and now I'm technically

51:02: in wet San Juan and this one is just

51:05: actually work tree fun analogies and it

51:07: says please continue from this one

51:11: um with a summary of where we were and

51:13: so it essentially has forked my work

51:16: tree and claude session over

51:19: >> and now now we can continue here but you

51:23: get in this weird spot of like

51:25: >> this is work tree inception Yeah, it's

51:29: in this weird spot of like uh if if it

51:32: had files changed and things, it would

51:34: bring those over as well.

51:36: >> Okay.

51:36: >> Um so

51:40: manage accordingly. Um [laughter]

51:43: it's a little hard. Um

51:47: I would actually

51:48: >> This is hard actually. Several of us in

51:50: the Discord are having a hard time with

51:52: this. There is no main concept. Christa

51:56: says, "I was okay with work trees as

51:58: stoves, but now no Maine is breaking my

52:00: brain." Um, and

52:02: >> there's origin, but don't worry about

52:04: local Maine.

52:05: >> I think that there there needs to be a

52:06: description of that. I know we only have

52:07: 5 minutes left, but when you are working

52:11: on your computer, you are working on

52:14: local versions of what exists remotely,

52:20: for example, on GitHub. It doesn't have

52:21: to be GitHub. It could be gitlab, could

52:22: be something else that you were working

52:24: on something that is a local version of

52:28: that. That's why if you like let's say

52:31: you've made a commit or you let's say

52:34: you've merged something, you've merged a

52:36: branch into main on the GitHub UI, you

52:40: still don't have a version of that main

52:43: on your local computer. you have to pull

52:45: that down and sync your changes so that

52:48: your version of main now looks like what

52:51: the one at the origin looks like, right?

52:54: Um, and your origin might live on a

52:56: server too. It might not even live on on

52:59: GitHub's server. Um,

53:02: so really main is just another work

53:05: tree. It's just like a version of your

53:07: your origin. So what Barrett is saying

53:09: is we don't ever go check out Maine.

53:13: It's just a view of your origin. And so

53:17: all of these are just views of the

53:18: origin, but they're actual copies

53:20: because they're clones.

53:23: Before Work Trees, I actually uh saw Joe

53:27: Chang have six or eight different copies

53:31: of our shiny on his computer.

53:34: >> How big is that?

53:35: >> Because he he would just check out. He's

53:37: like, "Oh, I don't want to like deal

53:39: with this right now." So he would just

53:40: do a get clone into a new folder and

53:43: like he would just manage it manually

53:45: every once in a while. I don't know how

53:47: he kept it straight in his head. Um

53:50: but yeah uh before work trees it was

53:53: just the wild west.

53:56: >> So Tom asks so Maine is only relevant

53:59: when you merge and it's a moving target

54:01: otherwise.

54:03: >> Yes.

54:03: >> I think yeah I think that's a good

54:04: description.

54:08: Brent says, "My brain broke in the first

54:10: five minutes." I hope it didn't. I hope

54:13: everybody is a little bit closer to

54:15: understanding um what a work tree is,

54:17: the utility of work trees, the use cases

54:20: for work trees, and maybe a little bit

54:22: of how you might need them or utilize

54:26: them. And I I really recommend, and I

54:29: was talking with Jenny Bryant about

54:30: this, too. The best way to play with

54:32: these is just to go open something that

54:35: doesn't matter and play with it. Create

54:37: a work tree. Do something with it. Merge

54:39: it. Nonsensical changes. Just open up

54:41: text files. It doesn't matter. See how

54:44: they work. Look at the folder structure.

54:47: When you open one on Positron, where

54:48: does it put it? Right? Like go look at

54:50: that. Go look at your folder structure.

54:53: Um cuz you might not have the same sort

54:55: of like uh control panel that Barrett

54:58: has here in in Conductor if you don't

55:00: use conductor. Um let's see. I wanted to

55:03: add something because Garrick had just

55:05: added in the chat and I know we have two

55:06: minutes left. Garrick says, "Typically,

55:08: your work trees are checked out to

55:09: folders that are adjacent to your one

55:11: true repo." So, for example, I keep my

55:14: local copy of Shiny Chat in one repo

55:17: that is like on the posit posit um path

55:22: to shiny chat. And when you create a new

55:24: work tree, you add a new folder with a

55:26: whole copy of the repo somewhere else on

55:28: your computer. I usually put these in

55:30: folders with like main-reo.work

55:34: trees so that my shiny chat work trees

55:36: end up in you know like shiny chat.work

55:40: trees. I think that that makes a lot of

55:42: sense. Um

55:44: he says I think conductor kind of hides

55:46: that one true repo view because it's

55:48: managing all the work trees for you.

55:49: It's doing all of the conductor work

55:52: >> which we like.

55:53: So my my origin one here is inside my

55:58: you know our studio shiny react shiny

56:00: react no sync like that's my original

56:02: and then all of my work trees are inside

56:04: bare conductor workspaces shiny react so

56:07: they're all over here full copies

56:11: >> yes and then um Nathan had asked are we

56:14: operating in a world where you don't

56:16: push directly to main you just make a

56:19: new branch you still do PR to Maine

56:23: you are P pring to Main Origin which is

56:26: up remotely.

56:29: >> So that's a that's a fair one. If you

56:31: were to do work in Maine and then boss

56:34: comes in and says you need to fix this

56:36: right now. You have to clean up that

56:39: working area, that stove, that kitchen

56:41: stove, you have to clean it up before

56:44: getting uh to before making your fix. If

56:47: you were on a working branch or work

56:49: tree, uh you could you could do that uh

56:53: just freely. You would just make a new

56:54: one, make the fix, and merge back to

56:56: main. So, personally, make small PRs,

56:58: make many many many many PRs, and uh

57:02: merge often and quickly and uh work

57:06: trees uh allow for that.

57:08: >> Amazing, Barrett. My brain's exploding

57:10: in the best possible way. I hope all of

57:12: you have learned so much and are

57:13: thinking about ways that you can take

57:15: this forward. Everybody, big round of

57:17: applause for Barrett.

57:27: >> [music]
