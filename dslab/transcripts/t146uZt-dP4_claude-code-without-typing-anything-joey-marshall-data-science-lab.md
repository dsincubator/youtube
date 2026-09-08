---
type: Video Transcript
title: "Claude Code without typing anything 🤷🏻‍♂️ | Joey Marshall | Data Science Lab"
description: "This is a place where we get together every Tuesday to pair code as a community, and we have a different data lab manager every week."
resource: "https://www.youtube.com/watch?v=t146uZt-dP4"
tags: ["ds-lab", "terminal", "tmux", "github", "cli"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T21:59:18Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=t146uZt-dP4"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2026-04-30T00:00:00Z"
    usage_count: 1733
usage_window: { from: "2026-04-30T00:00:00Z", to: "2026-09-08T21:59:18Z" }
---

# Transcript

00:06: Welcome back to the Data Science Lab,

00:08: everybody. This is a place where we get

00:10: together every Tuesday to pair code as a

00:12: community, and we have a different data

00:14: lab manager every week. Today, I am

00:17: joined by my co-host Isabella Velasquez.

00:19: Isabella, would you like to say hello?

00:21: Hi, everyone. Thanks for joining. I'll

00:23: be posting the links.

00:25: Yes, Isabella is absolutely on top of

00:28: links in the chat. So, if you are

00:30: wondering what we are using or talking

00:33: about today,

00:34: and you think that there might be a

00:35: link, give it a second. Isabella will

00:37: probably put it in the chat. Um, she's

00:39: so fast and amazing. And I would love to

00:41: introduce our lab manager for today,

00:43: Joey Marshall. Joey, would you introduce

00:45: yourself?

00:47: Yes, thank you so much, Libby. It's nice

00:50: to see everyone. I'm Joey Marshall,

00:53: uh, and this is

00:55: Tofu.

00:57: You can't tell that he's a cat because

00:59: of the shape that he's in, but he's

01:01: typically a cat.

01:03: And collectively, we are VP of Data

01:07: Science at Verasight,

01:09: survey and public opinion research firm.

01:12: Um, I know a lot of you, though, through

01:14: the Posit Data Science Hangout

01:16: community, just because I lurk in the

01:18: Discord and, you know, uh, and so, for

01:21: the longest time, I was a data science

01:23: scientist at the Census Bureau. So, um,

01:26: Joey from Census is the same as

01:30: current Joey. I don't know. We change a

01:32: lot over the course of our lives. Am I

01:33: exactly the same? Kind of.

01:36: We're a million different people.

01:38: Well, I

01:39: bet a lot of people will remember you

01:41: because you ask a lot of great great

01:42: questions at the Data Science Hangout.

01:45: Um, and I have been told before, I have

01:46: been sent many a DM.

01:49: Who is that guy who just asked that

01:50: question? He has a pod- He has a podcast

01:52: voice.

01:53: >> [laughter]

01:54: >> I'm like, he sure does. Joey and I need

01:57: a podcast.

01:58: Well, I will say Tofu is adorable and

02:02: makes me want to ask Lauren to share her

02:04: cat nightmare in the chat somewhere.

02:07: Share share us a picture of nightmare,

02:08: Lauren, because Lauren has a very very

02:10: adorable black cat, too.

02:12: All right. Well, Joey, today our plan is

02:15: for you to walk us through how you use

02:17: Claude Code. Um we do not always talk

02:21: about AI and LLMs and stuff on the Data

02:23: Science Lab. We cover all kinds of

02:25: topics. Today we happen to be talking

02:27: about AI and um Joey, you have been

02:31: using LLMs regularly for your data and

02:36: other workflows for how long?

02:38: Oh, um

02:41: a long time. I mean, definitely I was

02:45: using, you know, the early LLMs before

02:47: they were transformer models to do work

02:49: before they were any good, really. Uh

02:52: but that was kind of in the in the

02:54: before times. Ever since um

02:57: you know, ChatGPT and Claude and Gemini

02:59: have gotten good, uh I've increasingly

03:03: used LLMs both to build things for

03:07: people, either employers I've worked for

03:09: full-time or I've done in the past some

03:13: uh side contract work for employers who

03:16: wanted things built with LLMs. So, that

03:19: would be like fine-tune an LLM or do a

03:21: wrapper around an LLM in order to create

03:23: something for our customers. So, that's

03:25: one use case. But then the other use

03:27: case, which is kind of more central

03:28: today, which is pair programming with

03:31: LLMs, like using Claude Code to help me

03:33: build stuff, which I increasingly

03:36: do, and that's probably more relevant to

03:38: today's chat.

03:40: Yes, absolutely. And I say we go ahead

03:44: and start screen sharing and start

03:46: working through what we're going to do

03:47: today, which

03:49: is working through a Tidy Tuesday data

03:51: set,

03:53: but giving Claude a lot more free rein

03:56: than I would in an analysis. This is

03:58: going to be fun. And while we are doing

04:00: that, Noor has our first question today

04:03: in the Discord, which is, "For someone

04:05: who's bearish on AI, what benefit does

04:07: using something like Claude Code bring?"

04:10: And second question, which I want you to

04:12: answer first, "What's your favorite

04:13: pie?"

04:15: Ooh. Hey, Noor. Um my favorite pie is

04:18: that pie that you posted in the Discord

04:20: last night because it's the most

04:22: beautiful pie I've ever seen.

04:24: And uh

04:27: I really like your question on being

04:30: bearish about AI. I'm even reluctant to

04:35: assume that identity myself. And that's

04:37: something I'll try to be sensitive to as

04:38: we go through the

04:40: um like today, we're going to

04:41: intentionally use Claude Code and and

04:44: really push it to the max and try really

04:46: hard not to do anything hands-on. That's

04:49: not a representation of the way that I

04:50: always work, um

04:52: but I think some reasons to be

04:54: skeptical, especially for us data

04:57: scientists, would be

04:59: uh statistical errors, you know,

05:01: whatever you build needs to be accurate.

05:04: Um

05:05: there are security risks like giving

05:07: secrets and like your API keys and

05:10: tokens to Claude Code and just exposing

05:12: your file system to Claude Code. It's a

05:14: CLI tool. I'll

05:17: Those are all reasons not to be

05:19: bearish about AI, but there are a lot of

05:21: good reasons actually to appreciate

05:23: working with it, too, and and to try and

05:25: strike a balance. And for me, that's

05:27: that I mean, obviously, I can work a lot

05:29: faster

05:31: um with Claude Code. That's not always a

05:32: virtue. Sometimes being slow is

05:35: preferable. Um

05:37: but if it's something that needs to just

05:39: work, let's say it's like a front-end

05:41: tool. I'm not a front-end developer. I

05:43: don't need a production-grade front-end

05:45: tool. I just need a clicky interactive

05:46: thing that will work as a proof of

05:48: concept and then I can hand it over to

05:50: real software engineers to build that

05:51: kind of thing. Then AI is great for

05:53: that. Uh first of all, I know I know

05:55: it's not making any statistical errors

05:56: cuz I'm not asking it to do any

05:58: statistics in that case. I just want it

06:00: to, you know, mock up like a simple

06:01: front end, which it's great at. Uh and

06:04: you can just fly through tasks like that

06:05: with Claude code. In more sensitive

06:07: stuff, you have to be a lot more

06:08: careful, build in a lot of unit testing,

06:10: look at a lot of stuff hands-on.

06:12: Uh so um But the But the other thing is

06:15: always learn a ton from Claude code. And

06:17: I think this is true of all the AI

06:19: agents. They're great teachers. Uh and

06:21: like jump Like what Wikipedia used to

06:23: be, you know, just I mean I still have

06:24: Wikipedia, but it's like a great

06:26: jumping-off point. But I just Don't get

06:28: me wrong, I still use Wikipedia all the

06:30: time. No, I mean me too.

06:33: Right? Yeah, I think that we we will

06:36: demonstrate some of this stuff as we go

06:38: through today. And Kieran just said in

06:40: the chat that Claude's loop where it can

06:43: be permitted to like use local resources

06:45: to write, to run, to test code in your

06:47: machine, to read output from it turns

06:49: out to be really a powerful way to

06:51: iterate on things. Um and I think we'll

06:53: do a little bit of iteration today and

06:54: demonstrate that. So, the first thing

06:57: that we will do is I I'm guessing

07:00: tell Claude what we want to do. And what

07:03: are we looking at here? We have your

07:05: terminal is up and we don't have a

07:07: Claude open yet.

07:10: That's right. This is just an empty

07:11: terminal. And for I'm not using the

07:14: Okay, I'm on a MacBook Pro. So, you know

07:16: what computing system I'm using. And uh

07:20: my terminal here is through tmux. I have

07:24: a list of stuff that I use and Isabella

07:26: and Libby can share that at the end.

07:28: I've shared it with them. I like tmux

07:31: because it has nice vertical tabs. Check

07:33: this out. I can spawn up all these

07:34: terminals and have them all doing

07:36: different things in these pretty little

07:37: vertical tabs. [clears throat]

07:38: Very cool.

07:38: >> tmux

07:39: Mhm.

07:40: tmux also hooks into Claude's uh hooks.

07:43: So, you can get like desktop

07:45: notifications whenever your Claude's

07:47: done doing stuff, whatever. I don't sell

07:49: this product. It's free. Cmux. Okay,

07:52: we're looking at a bare terminal and I

07:54: have some terminal aliases set up, which

07:56: are uh if you don't use the terminal a

07:58: lot,

07:59: you'll have some configuration file

08:01: depending on your operating system that

08:03: can you can enter some characters and

08:05: they'll translate to other kinds of

08:06: characters. So, for me the terminal

08:08: alias DV just puts me in my dev

08:12: directory. So, I'm on the directory like

08:14: Joey/dev.

08:15: Uh are the letters on my terminal big

08:18: enough to see?

08:19: That's a great question. Could you do

08:22: one additional

08:24: zoom in?

08:26: Which might be like a command plus sign

08:28: as well.

08:30: It looks like command equals.

08:32: >> Oh, command equals. Oh, it's the same

08:34: thing.

08:34: >> but plus is the same thing as equals.

08:36: >> Same button. [laughter]

08:37: All right.

08:38: >> Promise I'm a

08:39: computer man. This is good. We we had

08:41: some feedback on the YouTube that was

08:43: like, "Why is the screen so small?" So,

08:45: we really want to make sure that people

08:47: can see this later.

08:50: Also, if you want to watch somebody

08:51: bumble around and

08:52: not always know what they're doing, I'm

08:54: That's the point. That's why we're here.

08:56: Okay, so remind me what the alias DV

08:58: does one more time.

08:59: It just CDs into, you know, whatever my

09:02: directory is, you know.

09:03: >> Okay. Users, Joey,

09:06: dev. I'm about to use another terminal

09:09: alias, which is CCDP. Okay. So, normally

09:12: you would start Claude like this. You

09:14: got to spell it right. That was collude.

09:15: So, you would start Claude like this uh

09:19: and you can have some flags like if you

09:20: want it to be able to access Chrome and

09:22: if you want to dangerously skip

09:24: permissions. This is sometimes called

09:26: vibe coding mode. Uh you know, whatever.

09:28: So, I have a a terminal alias called

09:31: CCDP

09:33: that is going to boot up Claude code for

09:35: me. And you'll notice it just asked me

09:37: for my fingerprint password. That's

09:39: because I'm running Claude code inside

09:42: of a 1Password's

09:45: uh

09:45: command line tool. This is also in my

09:48: list of resources.

09:49: Uh 1Password, you know, it's just

09:51: password manager, but it has a a a

09:53: secrets manager that can interact with

09:55: your command line. You can run Claude

09:57: code inside of it, and that lets you do

09:59: really useful stuff like keep your

10:01: password secret. So, all Claude code

10:04: sees is a link to a password, not an

10:06: actual password. I'll say more about

10:07: that later. Now, we're in Claude code.

10:09: And

10:11: uh we're going to Let me just grab this

10:13: data

10:14: and pull it over. I've never worked with

10:16: this before. It's about frogs. That is

10:18: about the extent of what I know. So, we

10:20: are going to do this in real time. Can

10:22: you see my whole screen? Like, can you

10:23: I'm share sharing like a reading from a

10:25: GitHub right now. Okay, cool.

10:26: >> Yep, we're looking at the Australian

10:27: frogs data set from Tidy Tuesday, which

10:29: is I believe week 35 from

10:33: 2025.

10:35: I think it's last year.

10:38: That was an incredible display of

10:40: memory. Can you tell that I work with

10:42: Tidy Tuesday a lot?

10:44: >> [laughter]

10:44: >> So much.

10:46: Casually dropped a extremely exact date.

10:49: Um

10:51: Uh okay. So, we've got this frog ID

10:53: data.

10:55: This readme gives us instructions on how

10:58: to read it

10:59: using R.

11:01: And we're kind of going fast and having

11:03: fun, so I'm just going to copy this URL,

11:06: and then we're just going to drop this

11:07: into Claude code and ask it to explain

11:08: it. I'm using voice dictation to

11:10: communicate with Claude code, an app

11:12: called WhisperFlow. It's also in the

11:13: list of resources.

11:15: I'm doing a live demo of Claude code,

11:18: and we need to build some kind of data

11:21: product within about 45 minutes. So,

11:25: don't let me down.

11:27: That's the first thing I'm going to say

11:28: to Claude. I really need it to be on its

11:29: best behavior.

11:31: The first thing I want you to do is to

11:33: explore this data set. Tell me about it.

11:36: Make sure you can read it.

11:39: And just explain the data a little bit

11:40: to me.

11:41: And then we're going to drop this URL in

11:44: and let that cook.

11:46: Okay.

11:47: While this is cooking,

11:49: I want to quickly explain what I was

11:52: saying before about wrapping my Claude

11:54: code command

11:55: in the one password's password manager.

11:59: Okay, so

12:01: often when you Okay, it's doing stuff.

12:03: Downloading CSVs. Great.

12:05: Often when you work with an AI agent,

12:09: um

12:10: it's com- you if you want the agent to

12:12: be able to do things autonomously,

12:15: you need to be able to share

12:17: uh secrets, API tokens,

12:20: credentials for stuff,

12:22: uh

12:23: URLs to things that may not be public,

12:26: whatever.

12:27: And it's common, I think, in practice to

12:29: drop those in like a dot env file, dot

12:32: env, in your directory. And Python has

12:35: libraries to like called like dot env to

12:37: whatever.

12:38: And so, but the problem is you've

12:40: exposed a list of secrets in plain text

12:44: on your machine. Uh if it's a shared

12:46: computing environment, that's really

12:47: risky.

12:48: And

12:50: uh also if you accidentally commit that,

12:53: uh that's a real problem. So, I want to

12:55: talk about how I manage secrets. But I'm

12:57: going to take a breath

12:59: because Claude's done. And we're going

13:00: to look at Claude. So,

13:02: put an asterisk in what I was saying

13:04: about secrets, and let's see what frog

13:05: says.

13:07: Frog, let's see what Claude [laughter]

13:08: says.

13:09: This comes from FrogID, a citizen

13:11: science project where people across

13:12: Australia record frog calls via a mobile

13:15: app.

13:16: There are two files.

13:18: FrogID data.csv.

13:20: It's got about 140,000 records. Each row

13:23: is a frog call recording

13:26: with lat lon coordinates. We may can do

13:28: something geospatial.

13:30: Uh

13:32: state

13:34: and uh which I guess are top-level

13:36: geographies in Australia and recorder

13:37: ID. Okay, cool.

13:39: 186 unique species.

13:42: That seems like a lot to me.

13:44: How many is a lot?

13:45: >> a lot, but it's a di- it's a diverse

13:47: place. By the way, as a little bit of

13:49: background, GIS stuff, spatial stuff, is

13:53: what Joey does. It's like Joey's

13:54: specialty. It's what he did at uh

13:56: Census. So, this would be a fun thing to

13:58: do if Claude could help us.

14:01: Oh, well, now I've been overhyped.

14:02: Please manage your expectations.

14:04: [laughter]

14:05: I'm just kidding. New South Wales

14:06: dominates with uh

14:08: 43% of records followed by Victoria and

14:11: Queensland. Okay, and then we got frog

14:13: names, which uh just maps the scientific

14:15: names to common names. Okay, cool.

14:17: Uh what kind of data product are you

14:19: thinking? An interactive map dashboard

14:21: analysis or something else. So, here's

14:22: what I'm going to do.

14:24: Let's do some interactivity. I'm going

14:25: to

14:27: get Claude to give us a few ideas, and

14:29: then we can all decide as a group what

14:31: we want to do. It's a It's a safe It's a

14:33: safe place.

14:35: Right? We're among friends.

14:36: Um

14:37: >> friends. And while Claude is cooking, we

14:40: will talk a little bit more about

14:41: secrets, and then we'll get to David's

14:44: question that happened in the chat. Um

14:46: but I'll let you talk cuz I know that

14:47: you're going to dictate.

14:49: I'm too lazy to press buttons on my

14:51: keyboard. Actually, if you have carpal

14:53: tunnel,

14:54: uh which I do a little bit, the voice

14:56: dictation can really help. So, I voice

14:58: dictate almost everything to keep my

15:00: wrists from being messed up at work. So,

15:01: it's like an ergonomics thing, too.

15:03: Um I want to let the audience decide

15:06: what what project we will build exactly.

15:10: So, why don't you propose three

15:13: interesting projects?

15:15: It could be stuff like

15:17: overlapping the frog data with like

15:21: population demographic data from

15:22: Australia, that's just one example,

15:25: maybe something

15:27: geospatial and interesting. Basically,

15:30: just stuff that you think is feasible

15:32: that you Claude code can help me build

15:35: in just a few minutes. Uh and that is

15:39: interesting to look at. So, a web app is

15:41: a good idea. Um

15:43: I have access to Vercel if we want to

15:45: build app a web app and and deploy it uh

15:49: in in real time.

15:50: Maybe we'll

15:52: create a GitHub repo,

15:55: deploy whatever we build to Vercel,

15:58: and then I can share all that stuff with

15:59: the audience. But, give me three of your

16:02: best ideas and make sure that they are

16:04: interesting and feasible.

16:08: Just

16:08: >> [snorts]

16:09: >> gar- just stream of consciousness

16:10: garbage words to Claude.

16:12: >> all thought you were talking to us. We

16:14: all instantaneously forgot that you were

16:16: talking to the computer and we were like

16:18: racking our brains to figure out

16:20: suggestions to give you. People in the

16:21: chat were like, "What are we going to

16:22: ask Jared?" [laughter] Oh my god.

16:25: That was amazing. How instantly our

16:29: memories just blipped and we were like,

16:31: "No idea what he's doing. What What Is

16:33: he talking to us?" No, he was dictating

16:35: every- he was dictating to the computer.

16:37: That was amazing. And actually, the the

16:40: reading through the transcription of

16:43: what it gave you was amazing because

16:45: mine might have been filled with large

16:47: silence gaps and ums and like all kinds

16:50: of filler words.

16:51: You're doing great dictation.

16:54: I'm actually not. A lot of that is in

16:55: Whisper flow. It's again like an

16:57: Everything is AI. It's like AI all the

16:59: way down. It's like an AI voice

17:01: dictation app, so it cleans up the dumb

17:03: stuff that I say, but

17:05: >> all just cracking up in the chat

17:08: >> [laughter]

17:08: >> because we were so sure you were talking

17:10: to us.

17:11: Okay, so David's question that he had

17:13: asked, I think we're going to leave it

17:15: with the solution that we have in the

17:17: chat, which is actually one of Simon

17:19: Couch's blog posts on LLM evaluation.

17:22: Cuz Devin had asked, "Have you done any

17:24: analysis of how the different generative

17:26: AIs perform doing the kind of work

17:28: you're doing?" I think that the analysis

17:30: part Simon Couch just like goes way

17:32: above and beyond anything that any of

17:33: the rest of us have done, but what is

17:35: your general vibe sensing on the

17:39: different types of models, specifically

17:41: like Codex versus Claude, for what you

17:43: like to do?

17:44: That's a great question. I should have

17:46: said at the beginning I'm using Opus, I

17:47: think 4.6 is the latest Claude code

17:50: generation here.

17:52: Codex is getting better. I tend to use

17:55: it less

17:56: for vibe reasons because it feels less

18:00: Let me give a more intelligent answer.

18:02: Um

18:04: definitely read Simon's analysis. I do

18:07: most of my work in Claude code using um

18:12: uh using Opus.

18:14: You burn through tokens really fast that

18:17: way. Uh

18:19: Sonnet is fine for light engineering

18:21: stuff. I tend to only use Haiku,

18:24: Claude's smallest model, for like LLM

18:26: tasks, like

18:28: uh when I want an LLM to do something,

18:31: like read some words and extract

18:32: something or whatever.

18:34: Um

18:36: I did build an integration once and you

18:38: can find it on my LinkedIn and GitHub

18:40: and stuff where I could ask um

18:43: Claude code, I could give Claude code

18:45: the autonomous ability to get a code

18:47: review from Codex on the same machine,

18:49: and I liked that for a while until

18:52: Claude code's own code reviewer sub

18:54: agent was created, I think in the last

18:57: generation or two. So, you can ask

18:58: Claude code to deploy its own code

19:01: reviewer, it's a code {hyphen} reviewer

19:03: sub agent, which is a much better code

19:05: reviewer, in my opinion. So, I just

19:08: haven't used Codex all that much

19:09: recently.

19:10: Uh

19:12: sorry that I can't give you a better

19:13: answer. I'm using Opus right now.

19:15: That is totally okay. And Becca had also

19:18: asked a follow-on onto this whole

19:20: prompt, which we are about to look at

19:22: and go over the results of.

19:24: She asked with your Claude prompts, what

19:27: components are you intentionally saying

19:29: versus what did you feel free to be more

19:31: liberal about? Um and I'm guessing that

19:33: means like let Claude interpret on its

19:35: own instead of specifying. Um and are

19:38: there are there any aspects of your

19:40: prompts that are directly influenced by

19:42: your training as a data scientist?

19:45: Oh, that's a great question. I used to

19:46: be I used to try to be very precise in

19:49: my prompts.

19:50: And

19:51: just anecdotally, I've learned that the

19:53: more words, the more human language I

19:56: can give agents, the better they

19:58: perform. I mean, think about what it's

19:59: doing. It's taking your prompt, it's

20:00: getting an embedding, and then it's

20:02: moving all that context back and forth

20:04: and back and forth every time. And so,

20:06: like

20:07: in terms of it providing generating

20:10: relevant text after what I've said, the

20:13: more I can give it the better. As a

20:15: matter of fact, this is just like a

20:16: general, I think best practice, is I

20:19: tend to have Claude code write as much

20:24: documentation, maybe more, as it does

20:27: code. In a second, we'll use planning

20:28: mode, where it spins up a whole bunch of

20:30: agents, does a whole bunch of reading

20:32: and writing before it does anything.

20:33: I'll have it write a bunch of

20:34: documentation that we can reference. The

20:37: same principle applies to prompts that I

20:38: give it. I tend to just say a lot. And

20:41: if you're unsure, just say even more.

20:43: And that's why I voice voice dictation I

20:45: I really appreciate. So, Okay.

20:47: >> I'm less precise and much more verbose

20:49: with my prompts than I used to be.

20:51: I think we'll move on in just 2 seconds

20:54: after we stick in Zach's question here,

20:56: which is

20:57: um how does the computer know that

20:59: you're talking to the AI versus just

21:01: talking? Like is there a button you're

21:02: pressing or is a hotkey?

21:04: >> [laughter]

21:06: >> What a good question, Zach.

21:08: That's I bet there's an accessibility

21:10: feature that would let you like look at

21:11: a different screen and talk to it.

21:13: >> Right, or be like, "Hey Claude."

21:15: Yeah.

21:15: >> [laughter]

21:16: >> Um yeah, it's the it's like the

21:20: yeah, you can set a hot key. So, I have

21:21: a sign a hot key that I hold down

21:23: whatever you can choose a hot key.

21:25: >> Thanks, Zach. Well, um Ujjwal, I see

21:29: that you had a question as well and we

21:31: will get back to that in just a second.

21:33: Let's go ahead and review this code.

21:36: Um because we already have people voting

21:38: in the chat about what option they like.

21:41: So many people have said they like two

21:43: out loud, but if I look at the vote

21:46: Isabella put up with emojis.

21:49: Oh, wow, the votes just changed. Mm, we

21:52: have nine votes for one, seven votes for

21:54: two, and two votes for three. So, let's

21:56: review.

21:58: People like Frogs After Dark.

22:01: Nightlife

22:02: >> far? Oh, now they're tied. One one and

22:04: two are now tied.

22:07: Let's see what we've got. Sorry, the

22:09: poll

22:09: >> us

22:11: three proposals.

22:13: Um all feasible as a single-page web app

22:17: that we can ship to Vercel in under 30

22:19: minutes. What the heck is Vercel, Joey?

22:22: Oh, it's just like another back end as a

22:24: service app.

22:26: I have so many of these goofy things,

22:28: but Vercel

22:30: Okay, there are like a million services

22:33: that Vercel is

22:35: probably one of them. I actually don't

22:36: know what Vercel's back end is and sorry

22:38: if I say it

22:38: >> Ocean?

22:39: Okay, that's another example.

22:41: >> Okay. Okay.

22:42: >> Um

22:43: Uh it's for databasing, like I use

22:45: Supabase a lot, like Railway for workers

22:49: or GitHub Actions. All these like back

22:51: end as a service things, a lot of times

22:52: what they're doing is they're just like

22:54: reselling you AWS, but what you're

22:56: paying for is like a ton of convenience.

22:59: Uh so, they've they're really doing some

23:00: work to design away a lot of the

23:02: friction in like getting a working thing

23:05: online. So, Vercel is just another like

23:08: hosting and deployment environment, but

23:09: it's super tailor-made for Python, which

23:11: I work in a lot.

23:12: Um and so, you can just like

23:16: put together and deploy a Python app and

23:18: then layer on a little front end and it

23:20: kind of just works.

23:21: Um

23:22: so, I have a Vercel token anonymized in

23:25: my environment here and it's just like a

23:27: It's just like a quick way to get up and

23:28: running. For your own org's enterprise

23:31: solution,

23:32: your org probably has something better

23:35: with like software engineers on staff

23:37: who can help you do it. But, if you're

23:38: just like doing stuff as a person and

23:40: for proof of concept, all these services

23:42: are I think pretty great and they're all

23:44: pretty cheap. Usually, everything is

23:46: like 20 bucks. Like

23:48: But, then it's like streaming services.

23:49: You have $200 a month of $20 a month

23:52: stuff.

23:53: Whatever.

23:54: Um So, who's the winner here of the

23:57: options?

23:58: Isabella, who is our winner?

24:02: I think as it currently stands, it's

24:04: option two. And apparently, we get a

24:06: pie.

24:08: Yeah.

24:08: >> [laughter]

24:08: >> Well, no, I was hoping for I mean like

24:11: nightlife heat map like sounds really

24:13: cool, but I like that Claude is

24:14: proposing like a radius query. I think

24:16: that means we can make a little circle

24:18: and then learn stuff about it. That's

24:20: how I'm interpreting that. Um so, uh

24:23: Let's do it. Okay, let's do option two.

24:26: Here's what we're going to do.

24:27: Um I'm going to do this.

24:30: Okay. Option two is the winner.

24:33: Would you please go into planning mode

24:36: and do deep research on what we need to

24:38: do to build and implement option two.

24:42: At the end, I want this to be a GitHub

24:45: repo that you can deploy to my personal

24:49: GitHub.

24:51: By the way, look in your global claw.md

24:54: file for information on how we manage

24:57: secrets. You should be able to see my

25:00: personal GitHub PAT

25:03: in one password, and you should be able

25:06: to use that to deploy to GitHub.

25:09: Also, I would like for this to be an

25:11: interactive web app.

25:13: My Vercel token is also in one password.

25:15: You should be able to get it there.

25:17: Otherwise, I want to make sure that

25:19: whatever we can build is feasible.

25:22: You've thought through both the data

25:23: that we need and the tech stack.

25:26: Uh and also the aesthetics.

25:30: I would like for this to be

25:34: Well, it's about frogs. So, I would like

25:36: for this to have a cottagecore

25:37: aesthetic.

25:40: I'm going to ask the audience for

25:43: a color scheme.

25:46: And I'll provide you a color scheme

25:48: later.

25:51: Go into planning mode, think this

25:52: through,

25:54: and come back to me with an

25:55: implementation plan.

25:59: Oh my goodness.

26:01: Right?

26:01: >> You guys, we need uh color schemes stat.

26:06: Raja says, "Cottagecore versus just

26:08: green."

26:10: >> [laughter]

26:11: >> It's a good question.

26:13: She says, "I think Joey would be a

26:14: better interior designer than I would."

26:16: Okay, we have so many questions, so

26:18: let's get to them as fast as we can cuz

26:20: we only have 30 minutes left, and I

26:22: think that we can probably hit a few of

26:24: them pretty easily. So, let me see in my

26:27: little questions here.

26:30: We had one that was from Bruno that

26:32: said,

26:34: "Um can you please ask Joey, do these

26:35: voice-to-text things require a lot of

26:38: hardware to work fine?"

26:41: Um WhisperFlow is cloud-based, I think.

26:46: Uh it's it's a good question. Um I don't

26:48: know. The

26:50: I don't know how well WhisperFlow is

26:52: optimized and whether it uses any kind

26:54: of GPU acceleration, but you know what?

26:56: I bet it does. Um

26:59: let's

27:00: I don't know. Let's Google it. I can

27:02: Google it. Can someone Google that? Um

27:04: does WhisperFlow use GPU acceleration?

27:06: My MacBook Pro This is like a

27:07: >> can do this. Okay. I'm using like an M4

27:11: MacBook Pro

27:13: uh 48 GB of shared memory and like a

27:17: It has like a 12

27:20: core CPU and

27:22: the GPU is

27:24: I don't know. Pretty pretty beefy, you

27:27: know? So, it's like

27:30: But, you know what? I also run

27:33: WhisperFlow on my piece of trash

27:36: uh Windows machine and it works fine.

27:38: So, it must be pretty well optimized.

27:41: I love it. We Emily has put a

27:43: cottagecore picture with literal hex

27:46: code colors picked out of it, which is

27:48: amazing. We're going to go with that.

27:50: Lots of people are like raising their

27:51: hand and saying, "Yes, that."

27:53: Um I don't know if you have that up, but

27:55: I can stick it into

27:58: the

27:59: chat of uh Zoom as well, so that other

28:03: people can see it. Oh, that did not

28:05: format very well, Zoom.

28:08: Oh, I see it. No, I see it. But, that's

28:09: going to maybe It'll help Joey see it,

28:10: maybe. Um and then I wanted to ask

28:14: Also, Zach says, "Joey really does have

28:16: a podcast, boys. I think he could voice

28:18: a nature documentary." I agree. We're

28:20: going to collab on this.

28:21: Um so, GPS had asked, and I believe that

28:25: that's Jacob Patterson-Stein,

28:27: good buddy.

28:28: Um do you advise on setting up agents

28:30: that are working on the same folder? I

28:32: worry that if I have too much going on

28:34: in the same folder, it will create some

28:36: sort of recursive confusion.

28:39: It No, it can. Yeah, that's a real

28:41: thing. Um there's a slash command, by

28:43: the way, in Claude code, which is

28:45: {slash}btw. It's like just to let it

28:48: know while you're while you're working,

28:49: here's something. I'm going to say

28:50: here's a screenshot with the color

28:52: scheme

28:54: and

28:56: aesthetic vibe that I want. And then

28:59: yeah, it's just it's just control V to

29:01: drop that image in there.

29:04: Um

29:05: Okay, so

29:09: Oh, uh this is probably not in my I can

29:11: see the screenshot, but unfortunately

29:13: I'm not able to view image files

29:15: directly in this context. I can only see

29:16: text content. Oh, maybe that's cuz in

29:18: it's in planning mode.

29:19: >> Oh, well, that's good. We have the text.

29:21: Emily pulled out all those hex codes for

29:23: us, which is fantastic. Okay.

29:26: Um right above the image, if you want to

29:28: grab those. And Isabella also put them

29:30: in the Zoom chat in a very nice

29:31: formatted way.

29:33: Nice.

29:35: Okay, let's just drop those in.

29:41: Or just describe it. It's space, enter,

29:43: or escape to

29:44: Ah!

29:45: I pressed space and probably shouldn't

29:46: have. Now it's just kind of rolling.

29:49: It's Moseying.

29:53: These color names are amazing. Noir

29:55: Mystique, Avocado Stone.

29:58: Seriously?

30:00: This is no ASMR.

30:03: >> [laughter]

30:04: >> I'm sorry. I won't do that again. Okay,

30:06: um

30:06: so Noir had also asked while we're

30:08: cooking here.

30:10: She's like, I know one password it's is

30:12: a password manager, but like how does

30:14: Claude have access to it?

30:17: That's a great question. Okay.

30:19: Uh let's do both. Whoever asked about

30:21: conflicting sub agents JPS.

30:25: Um this is important. You can ask Claude

30:28: to spin up sub agents or you can use the

30:30: {slash} Oh look, love that love that

30:32: palette. Very cottagecore.

30:34: I've updated the plan with your colors,

30:36: okay. Great. Um

30:38: this is a real problem. So you can use

30:40: the {slash} agents uh command in Claude

30:43: Code to either define your own sub

30:45: agents or it has some like pre-baked sub

30:48: agents that you can use like the code

30:49: reviewer and there's some other ones.

30:51: Um, or you can just ask in natural

30:53: language, "Please spin up agents to

30:55: parallelize this task as much as

30:57: possible."

30:59: You know, whatever, and it will try to

31:00: do that. Um, those agents will um,

31:06: Claude Claude Code is pretty smart about

31:10: delegating its task to its sub agents.

31:12: However, if you have multiple Claude

31:14: Code sessions, so let's say I spun up a

31:16: bunch of Claude Code sessions here and I

31:19: had them all working and they were all

31:20: working on the same repository, they

31:22: will absolutely conflict with each

31:24: other. And if you're doing stuff like

31:26: that, you should use Git work trees.

31:28: It's a little out of scope for today.

31:33: That's like a whole that would be like a

31:34: whole data science lab using Git work

31:36: trees.

31:37: Um,

31:38: but it basically provides like an OS

31:40: level kind of barrier between the

31:42: various agents so they won't conflict

31:44: with each other. They kind of all get on

31:46: their own branch and then do their work

31:47: and then the

31:49: you know, conflicts merge conflicts are

31:50: sort of designed away like that. Um, so

31:53: Git work trees are a thing in Git, uh,

31:55: but Claude Code is designed to integrate

31:57: with Git work trees. So, that's a great

31:59: way to parallelize across multiple

32:01: Claude Code sessions. Otherwise, um, for

32:04: Claude just spinning up its own agents,

32:06: like in planning mode, which we just

32:08: did, Claude almost certainly spun up

32:11: bunch of sub agents to to do this. Just

32:13: to do specific tasks, like, "Oh, you go

32:15: off and research this part of the tech

32:17: stack and you go off and look at the

32:18: data and you get off of whatever." And

32:19: you can see their little commands. You

32:20: can see them as they work. Um,

32:23: but, uh, Git work trees, if you're if

32:26: this is a concern.

32:27: Um, Noor asked about secrets. Okay, so

32:30: 1Password has a command line interface

32:33: or CLI tool. And what that allows you to

32:36: do is to wrap your Claude command in a a

32:39: one password command called OP run. And

32:43: what that does is let me just show you.

32:45: Okay, so I'm in this I'm back on a

32:46: terminal. We're off of Claude code. I'm

32:48: back on a terminal. And I'm in my dev

32:50: directory. I have all of my keys are in

32:53: here. I'm not going to show them to you

32:56: because actually they're not printed in

32:57: plain text. I'm just going to show you

32:59: the file. There's a file called

33:00: n.env.1password.

33:03: And these are my keys. Um but they are

33:07: not raw keys. There's nothing this video

33:10: can go on YouTube and no one can get

33:12: anything from me here. They're just

33:14: paths to my one password vaults. So you

33:17: set up a vault in one password.

33:20: You put all of your tokens in there. You

33:22: call them things. And then instead of

33:24: just a .env file with raw secrets,

33:27: um

33:28: put in your um paths to your one

33:31: password vaults. And then the OP command

33:35: that you wrap Claude code in and I just

33:37: dump all that into a terminal alias.

33:39: More about this in the resources that

33:41: will get sent around. This will um

33:45: trigger something called password

33:46: injection. So Claude only ever sees

33:50: this, but when it runs a command, the

33:52: one password CLI tool will replace this

33:55: with the actual secret. That'll get

33:57: injected and then you don't have to work

33:59: with bare uh secrets in a text file.

34:01: Does that make sense?

34:02: >> Amazing. Yes, this is so helpful. Uh

34:05: Nora, thank you so much for asking that

34:06: question. Like asking what all of us

34:09: would would like to ask, but [laughter]

34:11: we're not.

34:12: Um there are a couple of questions that

34:14: I think can be answered in the chat if

34:16: anybody wants to hop in there and help

34:18: us out. Um

34:19: like Aaron had asked, is there an

34:22: equivalent to the CLI one password

34:24: functionality at Apple passwords on Mac?

34:26: I do not know.

34:29: Yeah, you can use keychain. It doesn't

34:30: have the same I don't think keychain has

34:32: the same password injection thing,

34:34: um but I do know that people use

34:36: keychain with um

34:38: AI agent. So, there's some way to do it.

34:40: I've just never done it.

34:41: Okay. And then, Isola asking amazing

34:44: questions still, but I want to hold them

34:45: a little bit to the end so we can get

34:47: through these cuz they're more

34:48: overarching questions

34:50: um that I think we might answer as we go

34:52: through a little bit as well.

34:55: Um also, Amelia put a resource in there

34:58: about Bitwarden.

34:59: Um Bitwarden also has a CLI.

35:02: Let's go ahead and review our

35:04: implementation plan from Claude.

35:06: Nice. So, after I've asked Claude code

35:09: to go into planning mode,

35:11: you can also, there are hot keys to turn

35:13: planning mode on, but you can just ask

35:14: it in natural language. And now it's put

35:16: together a plan. Okay, here are these

35:18: colors that we asked for. Uh now it's

35:21: going to tell ready to code. Ooh, I yes,

35:23: I feel ready. Um so, context, we're

35:26: doing a live demo, blah blah blah, just

35:29: moving through this. Here's our build

35:30: order, fine, uh what we're going to do

35:33: with the data. Uh okay, cool. Um key

35:37: technical decisions.

35:40: I don't we're moving fast, so I don't

35:42: care. Uh cut list if running over time.

35:46: Um

35:47: and then, okay, Claude code has written

35:49: up a plan and is ready to execute. Would

35:51: you like to proceed? And then you'll be

35:53: asked uh yes, or if we had more time, we

35:56: might manually approve edits, okay? If I

35:59: were working on this for real, or um

36:03: you know,

36:04: I might tell it to change some stuff,

36:05: change something about the tech stack.

36:07: I'm just going to say yes, and we're

36:09: just going to yolo, like yeet this into

36:12: the AI sphere and just like see what

36:14: happens. Um so, this is going to be

36:17: cooking for a bit.

36:19: And I'm happy to

36:22: What were we going to tell something I

36:23: think more people had questions that you

36:24: were going to ask. Well, Isola has one.

36:25: Isola, you want to ask?

36:27: Yeah, I I saw that it gave the option to

36:29: clear context

36:31: and it said 4%. What does that mean?

36:35: Oh, that's a great question.

36:38: Okay. So,

36:40: let's get out of this.

36:43: Actually, let's open up a new terminal.

36:46: It's so nice that you're just like,

36:47: "We'll just open up a fresh one." It's

36:50: so It's honestly so nice. I'm going to

36:52: open up just like a raw Claude session

36:55: and I'm going to

36:56: >> what I do in Positron, too. I'm like

36:57: constantly just opening another

36:58: instance, another session, another

37:00: console.

37:02: That Yeah, Positron is great about that.

37:05: By the way, I use Positron a lot as

37:07: sometime these days kind of my main IDE.

37:10: Yeah, me too. I was in RStudio for R

37:14: and Positron for Python for a good like

37:16: year. Now, I'm just in Positron. I

37:18: haven't opened up RStudio in a while,

37:19: but I still open it. It's still my

37:21: default for opening MD files. So, every

37:23: time I click an MD file, RStudio opens

37:25: up and I'm like, "Here, Studio."

37:27: >> [laughter]

37:28: >> Okay, so I talked over what you did. You

37:30: did {slash} context.

37:31: Yes. And okay, so

37:35: um I may be mansplaining a lot of stuff

37:38: that people already know, but

37:39: >> No, please explain it because it'll be

37:41: great

37:42: for I mean I mean it'll be great for me.

37:44: Selfishly, I want to know all of these

37:46: things. I'm a very baby Claude user.

37:48: Yeah, and I I got that message the other

37:51: day and I was like, "I don't know what

37:52: this means." Like, "Will delete

37:54: everything that we've talked about or

37:56: things like that?"

37:58: That No, it's such a good question and

37:59: it's a great thing to talk about while

38:01: Claude is doing stuff. Oh, wait a

38:03: minute. Claude is waiting for my input.

38:06: Uh-oh, let's review real quick. We can

38:08: let it cook again.

38:09: Oh, no.

38:10: >> that it tells you needs input.

38:12: Yeah, that's a nice thing about C mux

38:15: and it will also alert your Claude will

38:17: send it a little hook that will give you

38:19: a desktop alert.

38:20: Um okay, so

38:23: what's an LLM doing? It's not doing

38:25: anything magic. A lot of it you can

38:26: think back to your early like text

38:28: analysis and NLP principles.

38:30: An LL the a chatbot essentially is

38:33: taking your prompt, tokenizing it. You

38:35: probably remember from early days that a

38:37: token is just a fundamental unit of

38:39: language. Claude,

38:41: GPT, all the various LLMs tokenize in

38:44: different ways.

38:45: Um, they might be usually parts of words

38:47: or even really Claude tokenizes really

38:49: aggressively. So, even like a character

38:51: space is like a token.

38:53: Stop is a token, like stop generating

38:55: text. Those are all tokens. Anyway, it's

38:57: going to tokenize your thing. It's going

38:59: to get its your prompt. It's going to

39:01: get its sentence embedding, kind of its

39:03: uh, sort of semantic kind of like it's

39:05: like it's like it's coordinates in

39:07: highly dimensional semantic space. It's

39:09: not exactly accurate, but it's a nice

39:10: heuristic of how to think about sentence

39:12: embeddings.

39:13: Uh, and

39:16: it's working memory can only hold so

39:18: many tokens at once.

39:20: And before last week, Claude Opus 4.6

39:24: could hold a total of like 200,000

39:27: tokens. So, whenever you're having this

39:29: conversation thread, these tokens are

39:30: going back and forth between you and the

39:32: and the LLM and its context window's

39:34: filling up, filling up, filling up,

39:35: filling up uh, larger than it can

39:37: handle. And when that happens,

39:39: uh, it's a real problem.

39:41: Um, first of all, anecdotally, I see

39:43: performance issues whenever my context

39:45: window gets close to the end. Um, but

39:49: more

39:50: More importantly, when your context

39:51: window fills completely up, you can't

39:53: prompt Claude anymore. So, it will

39:55: automatically do something called

39:57: compact the conversation, which is it

39:59: will write its own summary of the

40:02: conversation thread, and then clear

40:04: everything else out of memory.

40:05: Now, you can trigger that compact

40:07: yourself, {slash} compact. And you can

40:09: even write your own summary of the

40:11: conversation thread. Um, now as of last

40:13: week or maybe over the weekend, uh, the

40:16: context window for

40:18: Opus is now a million tokens. It's 5x

40:21: the size. It expanded. Mhm. Saw a lot of

40:24: chatter on Reddit about that this

40:26: weekend.

40:27: People are hyped. I mean, I'm hyped.

40:29: It's nice. Um

40:31: and if you do {slash} context in a

40:33: Claude code session, you can see this

40:35: really helpful I just love little

40:38: visualizations in the terminal. Oh, what

40:40: creative way can we come up with to have

40:42: little characters that mean stuff and

40:44: make kind of a graph. It's just like a

40:46: fun database challenge. Uh so this is

40:49: basically telling us that three

40:52: units

40:54: of this are consumed with its system

40:56: prompt. Uh you know, that's like stuff

40:59: that Anthropic gives it. Don't

41:01: be evil. You are an AI agent, you know,

41:03: whatever. It has like a Don't actively

41:05: harm things, yeah.

41:08: Anthropic has a philosopher on staff. Uh

41:12: she

41:12: >> Wow. researches like morality and Well,

41:15: good.

41:15: >> [laughter]

41:16: >> Yeah, that seems fine.

41:19: >> Um and then there are a few skills. We

41:22: haven't talked about skills yet, but

41:24: Claude code skills are um like markdown

41:28: files that tell it how to do stuff that

41:30: is useful to you. Yeah, we could have a

41:32: whole data science lab about skills of

41:33: probably. Oh, time check, we have 15

41:35: minutes left.

41:37: All right, let's hurry up. Thank you.

41:39: Thank you.

41:40: Hey, frog finder is live at this URL.

41:43: What? Already? Like it deployed it?

41:46: I mean, I gave it my Vercel token.

41:49: Um okay, messages. This is stuff that

41:51: I've sent back and forth to it, you

41:53: know, whatever. Eventually this will get

41:55: almost full and then it has a little

41:56: auto compact buffer. So, it doesn't let

41:58: you go above this. So, when it's getting

41:59: around here, you want to compact your

42:01: conversation. Okay,

42:03: uh GitHub auto linking failed, needs a

42:06: Vercel login connection for that GitHub

42:08: org. Ah, that's right. I haven't

42:09: authorized Vercel and and GitHub to

42:11: communicate with each other. But, the

42:13: deployment works via direct upload.

42:15: Okay, I can connect the repo in Vercel

42:17: settings later.

42:18: Um okay, well, I mean, let's look at the

42:21: Let's see if

42:22: Let's see what it came up with.

42:24: People don't really say vibe coding

42:25: anymore, but if that word still existed,

42:28: this would be the most vibe coded

42:30: anything has ever been.

42:33: Okay, let me grab a browser.

42:37: I'm so anxious about this.

42:41: Okay.

42:43: To get started,

42:47: uh

42:49: Am I like not logged in or something?

42:50: >> This is actually the part where I

42:53: usually fail with Claude.

42:55: Is the deployment part where like I

42:57: don't have things hooked up in the

42:58: background for it with my PAT and stuff

43:00: like that.

43:01: Um

43:02: and things fall through the cracks. But,

43:04: I'm curious about how this will work.

43:07: Please feel free to log in on the side

43:08: if you need to.

43:09: >> [laughter]

43:10: >> We're going to give Claude a browser

43:15: and let it look at the browser itself.

43:18: So, I have a Chrome browser with the

43:19: Claude extension.

43:21: So, here we go.

43:25: When I visit that URL, I just see some

43:28: stuff from Vercel asking me to deploy

43:31: the project. I'm not sure that that

43:33: worked.

43:34: Can you tell me what could be wrong? Is

43:36: the URL wrong? Also, you are authorized

43:39: to use a Chrome browser. If you just

43:41: want to go to that URL directly, and

43:44: then you can tell me what the problem

43:44: is.

43:49: Okay, let's see what it's going to do.

43:55: Okay, it's going to do stuff in the

43:56: browser.

44:00: We can watch it.

44:07: I recently asked it to book some flights

44:09: for me using the browser and it did

44:11: better than you think.

44:14: Time check, 12 minutes left.

44:18: Uh we were I think we finished the

44:19: conversation about context, right?

44:22: Yes. Um and David had asked if that 1

44:25: million token change applied to all paid

44:27: levels. I don't know, but I think yes.

44:32: Uh I'm Googling and that's why I said I

44:34: think yes,

44:35: but not totally sure.

44:38: Happy St. Patrick's Day everybody, by

44:40: the way. I'm wearing green.

44:43: Are you wearing green?

44:44: I'm very Irish.

44:47: Okay.

44:49: Claude is still thinking.

44:52: Um and so I'm going to pop over to Joe's

44:55: question in the chat, which is

44:57: so you can switch back and forth between

44:59: the model during the same session

45:01: depending on what you need or do you

45:03: have to stick with a single model while

45:05: you're in that one session?

45:08: Cuz you can slash model, right Joey?

45:11: Yes.

45:12: Uh oh, was the question can you switch

45:13: models in the middle of a session? Mhm.

45:16: Oh, um

45:17: >> done that. That's a good question. I

45:19: tend not to do that either. I don't

45:21: know. I don't know if that would wipe

45:23: your context. Maybe. Does it Does

45:25: someone else know? I actually don't know

45:26: the answer to that. If you know the

45:28: answer, put it in the chat. Um my gut

45:31: tells me that

45:33: you would have to

45:36: re-

45:37: give it re-give it all the stuff, right?

45:40: You'd have to re-give it your context to

45:42: your Claude MD file, all that stuff.

45:44: I would think,

45:46: but I actively do not know.

45:48: David says it does for all paid API.

45:52: Oh, like you can't He's David is saying

45:53: you can switch back and forth?

45:55: >> Um that one was for the 1 million token

45:58: expansion for the context window. So

46:00: thank you, David, for checking up on

46:02: that.

46:07: Yeah, Joe says, "I guess we could ask

46:09: Claude itself." We could. I don't know.

46:11: This is something that we will have to

46:13: try.

46:14: Okay.

46:16: I think

46:16: >> interesting is often the models don't

46:18: know that much about themselves because

46:20: they were trained

46:21: on data in a world before that model

46:24: existed. Claude will try to reference

46:26: its own docs, but

46:28: Yeah. I have a question from Ishmael.

46:30: "Curious to know what resources you

46:32: would recommend to learn all of this

46:33: stuff. How did you learn all this stuff,

46:34: Joey?"

46:36: Oh.

46:36: >> Blogs? YouTube videos? Trying and

46:38: failing yourself?

46:41: Well, you could join the Data Science uh

46:43: Hangout Discord.

46:46: And the live

46:46: >> Uh yeah, so the Discord where you are

46:48: right now is a great place to hang out

46:52: with people. We have an AI and LLM

46:54: channel.

46:55: When I remember asking Hadley this

46:58: question not that long ago, and he was

46:59: like, "Blogs. I read a million blogs."

47:02: And I think that that's a great answer,

47:04: and I've watched a million YouTube

47:06: videos as well. Isbelle, how about you?

47:08: What have you learned from?

47:10: Yeah, I also find like Anthropic has

47:12: like a course marketplace, and you know,

47:16: they're fairly short and

47:18: um from like the foundational. So, I've

47:20: taken a few of those as well. Oh my

47:22: gosh. Oh my gosh.

47:24: >> Okay.

47:25: All right. Uh I'm going to drop this URL

47:28: in the chat so other people can go

47:29: there, too.

47:31: I guess if everyone goes there, you

47:32: might blow up my uh $20 a month

47:35: >> death, everybody. Yeah, exactly.

47:38: Uh okay.

47:40: What can we see?

47:44: Oh, there we go. Okay, I can click on a

47:46: circle.

47:48: Oh, it just makes an automatic circle. I

47:50: kind of wanted it to I kind of wanted to

47:52: draw a circle. Oh, I can increase the

47:53: radius. There we go.

47:55: >> There we go. And then this tells me the

47:57: species found. Oh, and it says at the

48:00: top it says 41 species found within 90

48:03: km of where we are centered, which is

48:05: kind of right around Brisbane.

48:09: Huh.

48:12: Look at all of those little

48:14: those little froggy dudes.

48:19: Oh, they're so cute. So this kind of

48:22: worked. Can I click on that? Does this

48:23: do anything? No.

48:25: It does tell you how many there are for

48:27: each one. So for red tree frog we have

48:29: 27 observations. Tells us it's

48:32: scientific name as well as it has its

48:34: common name as the the bolded heading.

48:37: Super cute.

48:39: And we do have our cottage core very

48:41: cute desert temple

48:44: vibe stuff going on.

48:47: Yeah.

48:48: Uh this is pretty good.

48:49: >> in like half an hour because we talked

48:52: for a lot of this, right? And in the

48:53: beginning and we're 52 minutes in and we

48:56: have 8 minutes left.

48:58: And we have a thing that is mostly

48:59: working as long as we can verify that it

49:01: is correct.

49:03: Right. Yeah, I mean maybe not like ready

49:06: to

49:07: you know,

49:08: um but I mean yeah, we did

49:11: >> proof of concept, this is great. I think

49:13: so. Yeah, I don't hate it.

49:16: Um

49:17: >> Yeah, Amelia asked can the next

49:18: iteration of this map use frog emojis

49:21: instead of dots for the location? Ooh.

49:26: Uh okay, clicking on the map does

49:28: anything for me.

49:29: >> 6 minutes we can ask Clive to do that.

49:32: It might take too long to cook.

49:33: >> Oh, to use frog emojis? Yeah, instead of

49:35: those dots.

49:37: Oh, oh I like that.

49:39: I like it.

49:40: >> frog emojis rather than dots and then

49:44: redeploy. Oh, also did you push this to

49:47: my GitHub? I want to share the GitHub

49:49: repo with people.

49:52: This is how much I don't know about

49:53: what's happening under the hood right

49:54: now. Like I don't even know that this

49:56: has been pushed my I normally don't work

49:58: in quite this

50:00: sloppy of a fashion.

50:03: Oh, yes, it is on GitHub. Okay, let's

50:05: see.

50:07: Oh, no, it pushed to my um work GitHub,

50:11: not my personal GitHub.

50:12: >> [laughter]

50:15: >> Uh I'll put it on my personal GitHub and

50:17: then I'll put it in the Discord. Yeah,

50:19: Anna says, "It's kind of weird that the

50:21: dots are equally spaced. Like put them

50:23: in a grid." I wonder It's weird.

50:25: >> I haven't looked at the lat long data,

50:27: but I'm wondering if that's a limitation

50:28: of the data or if it did that on its own

50:30: and it just like

50:32: uh aggregated within a grid. I don't

50:35: know.

50:37: That's a question we would want to ask

50:38: it, you know, like about the choices it

50:40: made and we'd fine-tune this as we went,

50:42: you know, for a real thing.

50:46: Um does anybody know if

50:50: the

50:51: images are in that data set for the

50:53: frogs. I don't believe that they are.

50:58: Oh, like where did it get these images?

51:00: >> Yeah. Do you want to ask it? Like, "Hey,

51:02: where did you get the images for these

51:04: frogs?" That's a good question.

51:09: Yeah.

51:10: So, where did it get the images for the

51:11: frogs?

51:14: Oops, we all talked at the same time.

51:16: So, Joey asked it um where did you get

51:19: the images for the frogs out loud and he

51:22: used the slash command BTW to insert

51:25: something while it's cooking.

51:28: Oh, it got them from Wikipedia.

51:30: And a few folks mentioned that it was

51:32: actually in the plan. I um

51:34: that's Oh, we just missed it cuz we were

51:35: we were trying to go fast.

51:36: >> Right. Sorry. Yeah. Thanks.

51:39: I had forgotten it.

51:40: >> [laughter]

51:42: >> Aaron let us know that it was

51:44: it was it told us in the project specs

51:46: it was going to pull them from

51:47: Wikipedia.

51:48: Okay.

51:50: Yeah, Amelia, same question. I'm really

51:51: curious about how accurately it did it

51:53: though. Um that's the kind of thing that

51:56: when I am working with Claude, I am

51:57: constantly cherry-picking to check

51:59: myself. I'll go like grab five of them

52:01: and then I'll go look them up myself. Um

52:04: and I'll try to make sure that I I I'm

52:06: verifying that things are coming through

52:07: correctly.

52:09: So we have a lot of

52:10: >> a whole bunch of unit tests to

52:12: double-check its work.

52:13: >> We are for clarity, we're going so fast

52:16: right now, right? Because we had an

52:18: hour, we more like 50 minutes to to do

52:20: this stuff. We wanted to see how much we

52:22: could get Claude to do

52:24: in sort of a one shot here.

52:27: Ah, frog emojis are live. Are they still

52:30: in a grid or if we zoom in, are these

52:35: randomly spaced froggies?

52:38: They're still in a grid. How curious.

52:40: But some of the frogs are larger and

52:42: that's why my question was like maybe

52:43: it's aggregating them into a grid and

52:45: it's basically emoji size on

52:48: the N value of how many frogs there are.

52:51: I don't know.

52:53: Tom says, "I don't like the frog emoji.

52:56: It's like his face alien."

52:58: >> [laughter]

52:59: [gasps]

53:02: >> I love it.

53:06: Plague of frogs says Newer.

53:08: This is very biblical. Okay.

53:11: Oh Darren, I'm so glad you're here.

53:15: Oh, they're just they're just put in um

53:18: uh grid cells.

53:20: So a tenth of a degree. Oh, we would

53:23: have to get into the details of like

53:26: uh what is that in this projection?

53:28: Um yeah, I don't even know how this map

53:30: is projected. It's a leaflet map, so

53:32: maybe it's Mercator by default. Um so a

53:35: tenth of a

53:35: >> is Mercator by default. I like the It's

53:38: a little explanation though, small,

53:39: medium, and large. Small, fewer species,

53:43: bigger, moderate diversity. Um

53:48: Yeah, this is something we would have to

53:49: dig into.

53:51: Oh, it's guessing 11 km squares. Uh

53:53: that's

53:55: Does that vary going away from the

53:57: equator? Probably. I don't think these

54:00: would be equal area grid square. Uh

54:02: that's getting into the weeds of like

54:03: geography stuff. Whatever, it doesn't

54:05: matter.

54:06: Um

54:06: >> Plus, Australia is a huge place. Right.

54:11: Amazing. Well, this was This got us so

54:13: far. We learned so much. There are a

54:16: million links in the chat. But also,

54:19: when this video ends up on YouTube, um

54:22: if you are looking at the YouTube

54:24: videos, all of the links you could

54:26: possibly want are in the description.

54:29: Um they're usually just like stacked

54:30: with with links. And if anything is ever

54:32: missing from those, send me a message on

54:35: Discord, and I will go fix them and just

54:37: add stuff to the the descriptions in

54:39: YouTube. Thank you so much for hanging

54:41: out with us.

54:42: Isabella, thank you for hanging out.

54:43: Joey, I hope you had a wonderful time.

54:45: Thank you so much for sharing your

54:46: knowledge with us. This was fun. Thanks,

54:48: everyone.

54:49: Yeah, everybody say thanks to Joey in

54:51: the chat. This was so much fun. I

54:53: learned so much.

54:55: Bye, everybody.
