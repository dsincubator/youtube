---
type: Video Transcript
title: "What are AI agent skills? How do I use them? | Garrick Aden-Buie | Data Science Lab"
description: "I am so excited to introduce our lab manager for today, Garrick Aden Buie."
resource: "https://www.youtube.com/watch?v=ml3jZ4YFB_g"
tags: ["ds-lab", "shiny", "github", "apis", "r-packages"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T21:59:18Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=ml3jZ4YFB_g"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2026-06-24T00:00:00Z"
    usage_count: 1536
usage_window: { from: "2026-06-24T00:00:00Z", to: "2026-09-08T21:59:18Z" }
---

# Transcript

00:07: I am so excited to introduce our lab

00:09: manager for today, Garrick Aden Buie.

00:11: Garrick, would you introduce yourself

00:12: for us?

00:15: Yeah, hello. Hi. Um, my name is Garrick.

00:19: Uh, I work at Posit on the Shiny team.

00:22: I've been on the Shiny team for a little

00:24: while.

00:25: Um,

00:27: for

00:29: uh

00:30: probably three and a half years now.

00:33: I think.

00:33: >> Nice.

00:35: Raise your hand if you love and

00:37: appreciate Shiny. I do. I I wore the

00:40: wrong shirt today. I was wearing my

00:41: Shiny shirt just yesterday and I could

00:43: have shown everybody. Man, I have a

00:45: Shiny shirt, too. I know. [laughter] We

00:47: have bad timing.

00:48: >> All right, Garrick.

00:50: Well, today Garrick is going to be

00:53: talking to us about agent skills. Um,

00:56: and maybe their difference between

00:59: skills and tools, which is something

01:01: that I have not understood completely.

01:04: Um, so we will be going over things like

01:07: what is a skill? What does it look like?

01:10: Um, if other people have made skills

01:12: that are useful, where can I find them?

01:14: How do I know if it's a good one?

01:16: When do I need a skill? Um, and like

01:20: what does creating a skill from scratch

01:23: look like?

01:25: Okay. Garrick, I say it is time.

01:29: Go ahead and share your screen and let's

01:31: let's take it away.

01:35: We already have a question from Noor.

01:39: Noor says,

01:41: "Are skills solely for cloud code or are

01:43: they applicable in all contexts?"

01:47: I think we are going to get there, but

01:49: Garrick's going to be using cloud today.

01:52: Uh, yeah, I'll actually do a little bit

01:54: of a couple different things, I think,

01:56: uh, just set this up. Um,

02:00: but first, let me just make sure. So,

02:01: I'm going to be using Positron.

02:04: And I'm going to

02:07: tell it to

02:09: So, I'm going to use Positron and um and

02:12: yeah, first let's see if everyone can

02:14: see the screen okay. If you can

02:17: >> I I can. I think it could be like

02:19: >> Just slightly bigger, especially for um

02:22: the fact that we're recording this on

02:23: YouTube. And our YouTube viewers have

02:25: told us that the screen is

02:27: text is slightly too small. Um, but nor

02:31: to answer your question,

02:33: skills are not solely for Claude,

02:37: I believe, right?

02:39: That is right. In fact, um they're

02:42: actually kind of technically called

02:44: agent skills. Um,

02:46: so more more broadly like they can be

02:49: uh used in with basically

02:52: uh any coding assistant that supports

02:55: the idea of skills or the the spec for

02:58: skills. So,

03:00: um most at this point most coding

03:02: assistants will support skills in some

03:04: form or another, uh which includes

03:06: Claude code or Positron assistant or or

03:10: Codex or

03:12: yeah, or Copilot. They all um end up

03:15: supporting

03:16: supporting skills.

03:19: Um,

03:21: so I thought I would start

03:24: uh with a pretty basic example um to

03:27: kind of just explore where skills fit

03:30: into like the the general space of how

03:33: you talk with a model.

03:36: Um,

03:37: and so to do this I was going to I was

03:38: thinking I could use uh something pretty

03:40: low-level where we don't have any uh

03:44: any coding assistant in the way. We

03:46: don't have any um sometimes the coding

03:47: assistant we also call that like a an

03:49: agent harness, uh which is really just

03:51: like the software that or the the sort

03:54: of programming that we set up around

03:56: interacting with a large language model.

03:59: And so I thought maybe it would be

04:01: interesting just kind of like take all

04:02: of that away and just do like the most

04:05: basic things that you can do when you're

04:07: interacting with large language models

04:09: and then we'll build up until we kind of

04:11: see what a skill looks like, right?

04:13: So to do this I'm going to use Elmer

04:16: which is the R package for interacting

04:18: with the APIs for large language models

04:22: and um

04:24: if you've ever used Elmer before or

04:27: haven't seen it before it it basically

04:29: gives you these nice little functions

04:31: like chat Claude or chat Anthropic where

04:35: you can connect directly to an AI

04:38: provider, right? So I'm going to use

04:41: Anthropic's Claude Sonnet 46 model

04:45: and basically to start a chat I just run

04:48: this chat Claude function.

04:50: You can actually just like you don't

04:52: even need to give it a model. Elmer has

04:54: pretty decent defaults but here I wanted

04:56: the latest Claude Sonnet model.

04:59: Right? And then what is really neat

05:00: about this is that you can run this live

05:02: console function and you can actually

05:04: have like a little conversation in

05:07: in

05:09: in your in your chat and

05:11: maybe I can like ask

05:13: you know, what are agent skills?

05:16: So this message is going to go this is

05:17: me as a user sending a prompt to the

05:19: model and then we're going to see the

05:22: answer coming back from the model and it

05:24: writes out a bunch of text. I'll skim

05:27: really quickly. It is it tells me that

05:29: agent skills are capabilities or tools

05:32: that an AI agent can use to perform

05:35: tasks, right?

05:36: Okay, so this is like you know, a

05:38: question that I was asking. Sometimes

05:40: the things that you're going to give to

05:42: the model can be more like in the form

05:45: of instructions. Like this text that it

05:48: gave me, this is this is too many words

05:50: and it it doesn't fit in my screen. I

05:52: want something

05:54: uh a little bit more

05:56: uh concise. So, I'm going to tell it uh

05:59: respond terse like smart caveman, all

06:02: technical substance stay, no fluff.

06:05: Tell me what are agent skills?

06:10: And I'll send that.

06:13: And we're going to get a very different

06:15: answer this time. This This one fits on

06:17: the whole screen.

06:18: Uh you can see also there are no emojis

06:21: anymore. So, we just get agent skills

06:24: equals agent tools. Skills let agent do

06:27: things, not just talk.

06:29: So,

06:30: part of what I have said here is is

06:32: instructions to the model that the model

06:34: is going to follow um

06:36: in this conversation. And I said I know

06:39: I put these kind of magic words in here

06:41: and then I got, you know,

06:43: an answer that is a bit more, you know,

06:46: that follows my instructions. It's terse

06:48: and it doesn't it contains no filler.

06:50: And um

06:51: I could ask, you know, follow-up

06:52: questions.

06:54: Um

06:56: how do I how do I make a skill?

06:59: Um

07:00: Something like this. It can ask a

07:01: follow-up question. It's going to keep

07:03: kind of following my instructions,

07:06: right?

07:07: Um

07:08: Okay, so

07:10: >> [clears throat]

07:11: >> it it gets a little annoying to do to

07:14: like type these things out. Um

07:16: >> [clears throat]

07:16: >> um

07:18: Uh let me see how I want to I I'm

07:20: realizing I want to do this slightly

07:21: differently. So, it gets a little bit

07:23: annoying. I'm going to move this out of

07:24: the way.

07:25: So, it gets a little annoying to type

07:26: these things out, especially like

07:27: instructions like this uh where I I'm

07:30: like, "Just, you know, for this chat

07:32: um I don't want to like I want to be

07:34: able to like open up a chat and have it

07:36: just start with like it knows that in

07:39: this in these conversations it should

07:41: uh respond terse like a smart caveman,

07:44: right?

07:45: And this introduces the idea of a system

07:48: prompt. So,

07:50: you know, I can pick the model that I

07:52: want uh with Elmer, but I can also give

07:56: it the I can give it these instructions.

08:02: Then to respond like a caveman.

08:04: As Why didn't it jump?

08:07: Um

08:09: Oh, I need to exit my live demo. Okay,

08:12: so I can give it those instructions.

08:16: And

08:18: Mhm.

08:20: And if I look at this object, just see

08:21: now I have what's called a system

08:22: prompt. So, the system prompt is

08:25: basically like a user message. Or

08:27: actually, people tend to call it the

08:29: developer message, which makes a lot of

08:30: sense. Um it's a message from the

08:32: developer, the kind of person like

08:34: behind the chatbot. And it's uh it's

08:37: kind of like strong instructions about

08:41: um

08:42: about how the the model should behave

08:44: inside this conversation.

08:46: And uh it's sort of like baseline rules

08:49: for how the conversation should go. So,

08:51: if I've moved that instruction into the

08:53: system prompt, um you know, now I can I

08:55: can kind of do the same thing. I can

08:57: have my conversation. I can ask like Now

08:59: I don't need to like remind it to be a

09:01: caveman anymore. I can just say, "What

09:03: are agent skills?"

09:05: And it will now answer me in this this

09:08: short terse form.

09:10: Right? Um

09:14: So, this kind of works. Yeah, we're

09:15: getting like this nice agent reads task,

09:17: pick skill, passes params. Yeah, we get

09:20: this kind nice terse kind of thing. Um

09:24: Okay, so

09:25: the these kind of like you have as a

09:28: user uh you don't often have that much

09:30: access to the system prompt, but if

09:31: you're programming a chatbot, you you

09:33: have the chance to like introduce these

09:35: instructions uh in in your system

09:38: prompt.

09:39: And

09:40: for a while these are kind of like the

09:42: two

09:43: like main ways that you could that you

09:46: would like give instructions to a model.

09:48: Right? But there there're definitely

09:50: problems with putting something like

09:53: this these you know instructions like

09:55: this into the system prompt. In

09:56: particular, like maybe not every

09:59: conversation needs to be in caveman

10:02: voice, right? Maybe I want to you know

10:05: have moments where I have a normal

10:07: conversation and then at some point I we

10:10: you know want to like turn on caveman

10:12: mode and

10:15: and I I would kind of want that to

10:16: happen

10:17: sort of dynamically, right?

10:20: So

10:21: this is that's kind of the problem that

10:23: skills are trying to solve is how do we

10:26: get these sorts of instructions to the

10:29: model in a way that is that can be

10:31: dynamic, it doesn't have to be like

10:33: pre-programmed into the conversation,

10:36: but when you're ready for it, it's there

10:39: for you to use.

10:40: So

10:41: how it actually works it kind of builds

10:45: well actually let's go let's go look at

10:47: what a skill looks like and what this

10:50: caveman idea comes from a

10:52: actual skill.

10:54: Um

10:55: called the caveman skill.

10:58: And so this is repo I'll make this

11:00: bigger.

11:01: Make it really big and there's a repo um

11:05: Julius Bressy caveman, right? And in

11:08: there there's a skills folder

11:11: and

11:13: under the skills folder there's it turns

11:14: out there's actually like in this repo

11:16: there's a couple skills, but we'll look

11:18: at the caveman skill first. So this is

11:20: generally how people organize skills.

11:22: There's usually a folder called skills.

11:25: Then the name of the folder is the name

11:28: of the skill.

11:29: And And inside of the folder there's a

11:31: skill.md

11:33: file.

11:34: And it's basically just a markdown file

11:36: that contains

11:38: instructions for the model that can be

11:40: loaded dynamically when the model is

11:43: ready to bring in

11:45: the prompt.

11:47: Um

11:48: So in a couple key pieces of this skill

11:51: right here's here's this

11:53: you know sentence that I was using. You

11:55: can see that this is like part of now

11:56: part of the skill.

11:59: And

12:00: and then there's like a whole section.

12:01: Actually look at it as code so you can

12:03: see what the markdown itself looks like.

12:05: So this is what the file would look

12:07: like, right? Um note let me scroll back

12:10: up. Note skills caveman was the name of

12:12: the skill and then there's this YAML

12:14: block at the top of the markdown file.

12:17: Um

12:18: If you've used you know Quarto or R

12:20: Markdown it's similar to that where

12:22: there's a YAML block of metadata at the

12:24: top of the file. And um

12:27: one sort of quirk of skills is that this

12:31: name has to match the directory. So

12:33: that's one thing you have to set up to

12:35: begin with. But you give your skill a

12:37: name

12:38: and then you also give it a description.

12:43: And the description is it turns out is

12:46: pretty important part of the skill

12:49: because it is not here just to remind

12:52: you what your skill is about. It's

12:54: actually here as instructions. It's like

12:56: a short snippet of instructions

12:59: that the model will see that tell it

13:02: what is inside the skill. So the model

13:05: will

13:06: like the

13:08: the way that skills generally work is

13:09: like the coding assistant will let the

13:11: model know that it has some skills.

13:14: It'll let it know what the names of the

13:15: skills are and it'll show it like these

13:18: couple of lines of text to say

13:21: like give it a hint about whether when

13:24: or or how it should be using this skill.

13:28: And in the course of the conversation,

13:31: um

13:32: you know, you'll end up saying something

13:34: that sort of matches, you know, the user

13:35: will say something that matches uh what

13:37: is in this description, and then the

13:39: model will go, "Hey, actually, you know

13:40: what? I've got a skill for this." And

13:42: it'll load that skill directly. So, you

13:45: can see uh this description does a

13:47: really good job of explaining exactly

13:50: when the model should use this skill.

13:52: So, it says explicitly, "Use when the

13:54: user says caveman mode." Or, "Talk like

13:56: a caveman." Or, "Use caveman."

13:59: Um

14:00: Um in which case it should uh the model

14:03: is being told essentially you should

14:04: bring in this skill and

14:06: follow the rest of the instructions.

14:10: Um

14:14: Any questions at this point? Yes, I was

14:16: just going to say, "Can I interrupt

14:18: you?" Okay, we have um

14:20: we have two questions. One, I'm not sure

14:23: if we have the answer to. I don't know

14:25: the answer. Nathan Jeffrey had asked,

14:28: "If I have access to positron assistant

14:31: um using GitHub Copilot, does that mean

14:33: that I can use Elmer like without an API

14:36: key?"

14:37: I don't know the answer to this.

14:39: With without an API key? I don't know

14:42: either. You probably need an API key. Um

14:46: I think that that's the answer. Yeah,

14:48: when you're using Elmer, um there's an

14:50: API key behind all of these somewhere.

14:53: But, you can definitely like chat

14:57: uh GitHub. There is a chat GitHub.

15:00: And um

15:03: And I think that this works just because

15:05: it knows what

15:07: um

15:09: Like it it could it knows that I have a

15:10: GitHub token, you know, in my

15:12: environment that I use for uh

15:14: interacting with with GitHub's APIs or

15:17: installing packages. It's one point I

15:18: set up a GitHub token.

15:20: And it'll

15:22: it'll pick it and um

15:24: give you access to GitHub's models,

15:26: which may or may not overlap with GitHub

15:29: Copilot or the specific subscription

15:32: service that you have.

15:33: Um it's all very

15:35: difficult to figure out exactly.

15:38: Um but

15:39: there's a good chance that yes is the

15:41: answer.

15:42: Okay. Great. And then we had one from

15:44: Alexandra that says, "Can the

15:47: instructions be more than just strings?

15:49: Are there other types of sources like

15:51: JSON or CSV that can be used to learn

15:54: other skills?"

15:56: And if we're going to get there, then

15:59: we'll get there, but I think it's a good

16:00: question.

16:02: Yes-ish, right? So we'll we'll get into

16:04: like a little bit more of the structure

16:06: of the of the the

16:09: more sort of detail. Like you you can

16:10: have more than just

16:13: one skill markdown file. And there

16:16: um there's a concept in skills of

16:20: progressive disclosure,

16:22: which is actually something that we've

16:23: seen already in talking about this

16:25: description. So skills are designed to

16:28: be like

16:30: designed to be set up so that your

16:33: kind of you're not like throwing

16:35: everything at the model all at once.

16:38: Right? So the system prompt idea is like

16:41: we're going to fill the system prompt

16:42: with everything that the model is going

16:43: to need to know for this entire

16:44: conversation. And often what happens is

16:47: it turns out that the model like you'll

16:49: put instructions into the system prompt

16:51: that are completely irrelevant to actual

16:53: conversations that users are having.

16:56: And it creates problems because

16:57: sometimes those instructions may

16:59: distract the model from paying attention

17:01: to the what the user is saying or may

17:04: cause the model to go off and do

17:05: something that the user doesn't want

17:07: them to do, but you've you had

17:08: instructions in the system prompt that

17:10: kind of you know, were you know, telling

17:13: the model to to do something that

17:15: happens to be at odds with what the user

17:17: was actually wanting to do, right? And

17:20: um so skills are set up to have this

17:24: progressive disclosure property where,

17:27: you know, we start by showing the model

17:29: just this little bit. This is supposed

17:32: to be like 100 tokens. Like say like a

17:35: 100 words, two sentences, one paragraph,

17:38: roughly, right? And the model will see

17:39: just this, and if it decides that the

17:41: skill is relevant and loads the rest of

17:43: the skill, it will load just the rest of

17:46: the file. And the file usually has, you

17:49: know, basic instructions and some things

17:51: that are relevant to, you know, here

17:54: there's a

17:56: um you know, here there's like

17:59: really limited This is a pretty small

18:00: skill in the sense that, you know,

18:02: mostly just says like

18:04: stop using filler words and pleasantries

18:07: and and just yeah and and also articles,

18:09: you know, and it gives you a a quick

18:11: pattern for how to reply. Um but it also

18:13: includes, you know, some other

18:15: follow-ups like uh drop the caveman act

18:18: if you're uh about to do something

18:21: destructive, go ahead and explain it

18:23: clearly to the user instead of

18:24: pretending to be a caveman, that's a

18:25: good idea.

18:26: Right? And so um so there's some

18:28: instructions here. But also then this

18:31: skill file can then point to other files

18:35: um that are sort of adjacent to the

18:36: skill. And um

18:39: the model will, you know, be able to

18:41: load those as needed as you

18:44: um

18:46: yeah, load those as needed as uh as it

18:48: sort of

18:49: tries to tackle the task at hand.

18:52: All right. So, if we want our agent to

18:55: talk like a caveman, this is great. What

18:57: are the examples in which you use

19:00: skills?

19:02: Right.

19:04: Um

19:06: so I use skills in lots of different

19:09: ways. Um

19:15: Um

19:20: Hang on. I'm trying to connect where I

19:21: was going to go to where that is.

19:23: >> [laughter]

19:25: >> I just like retro record scratched

19:27: Garrick's brain, everybody. Right. Do we

19:30: want I mean, okay. Yeah, I mean, I use

19:32: skills in lots of ways. So, um

19:35: I guess we can show you this, which is a

19:38: collection of skills that are probably a

19:40: lot more useful to you than the caveman

19:42: skill.

19:43: Um but, this is a this is a little repo

19:46: that I um started putting together when

19:48: skills came out and have uh been

19:50: encouraging people to contribute to

19:52: inside of Posit. And um and it's a place

19:56: where I basically store skills that I've

19:59: created that I find useful

20:02: uh in um you know, more or less everyday

20:04: work. And I have uh organized we we've

20:08: organized it by like subfolders. So,

20:10: there's whole groups of things.

20:12: Um

20:13: And I'll go into the Let's go into the

20:15: shiny skill because I know that there

20:17: are some interesting skills in here. So,

20:20: there's a grouping of shiny skills,

20:22: right? And then there's this shiny BSlib

20:25: skill.

20:26: And if I open up

20:28: this skill, the idea with uh with this

20:31: skill, if I show you the code, right? Is

20:34: uh it's a shiny BSlib is the name of the

20:36: skill, and then the goal is to help you

20:38: build uh modern shiny dashboards and

20:41: applications using BSlib. So,

20:44: if I s-

20:45: go back to the preview, you can see

20:47: basically um when you're The idea is

20:50: that this skill should kick in whenever

20:52: you're building new shiny apps, or

20:54: you're trying to modernize a legacy

20:56: shiny app, or you're working with uh

20:58: some new features of BSlib, like page

21:00: layouts, or grid systems, or cards, or

21:03: yeah, those kinds of things. So, if

21:05: you're if you're having a conversation

21:07: if you have this skill available to your

21:09: coding assistant, and you're also having

21:11: a conversation about building shiny

21:13: dashboards and things, then um this

21:15: skill should kick in, and it would um

21:19: basically, you know,

21:20: help you help your coding agent uh

21:24: forget about some of the things that it

21:26: knows about writing shiny apps that only

21:29: use the shiny library, and will bring in

21:32: the the extra stuff that the model needs

21:34: to know, um or being reinforced about

21:38: acting on to uh write shiny apps with

21:41: BSlib instead.

21:43: And then, so inside of this shiny BSlib

21:47: folder,

21:49: uh you can see I have a references

21:52: section. I'm going to actually see if I

21:54: can just open that directly. So, I have

21:56: another subfolder next to that called

21:58: references, and inside of references,

22:01: there are uh a whole bunch of different

22:04: areas, right? So, there's things like

22:06: uh sec there's a section on accordions

22:09: and cards and grid layouts and So, you

22:11: could think of like if you're building a

22:13: shiny app with shiny and BSlib, um

22:17: maybe uh so the skill itself is like,

22:20: here's the most relevant information for

22:23: anybody who is doing this thing, who

22:25: anybody who is using shiny and BSlib

22:27: together. And then, the references

22:29: folder is full of smaller uh sort of

22:33: standalone pieces that are then relevant

22:37: that the model might go read if it needs

22:39: to, you know, like you're working with

22:41: filling layouts, right? Uh filling

22:44: layouts are are notoriously tricky, and

22:47: maybe you're working with a filling

22:49: layout in your in your uh shiny app, and

22:52: so then this file is basically going to

22:56: explain

22:57: uh how filling layouts work to to the

23:00: model. So, basically, it's going to just

23:02: like load uh you know, can load this

23:04: information

23:06: uh on the fly and all of a sudden just

23:08: know

23:10: uh everything that there is to know

23:11: about Shiny BSlib and filling layouts.

23:15: Um which reminds me of that.

23:18: >> So, this is in contrast to

23:20: just freewheeling an LLM and being like,

23:23: "Hey, I'm building a Shiny app. I want

23:25: to have this filling layout." And then

23:27: expecting it to go, read the

23:29: documentation, and hope that it reads

23:30: the right stuff, hope that it figures it

23:32: out, and do it right, right? And then

23:34: often that doesn't work, spoiler, right?

23:36: Like it'll come back and it'll do

23:38: something janky and you're really

23:39: frustrated and you're like, "How do I do

23:40: this again?" Using a skill is like

23:43: putting a skill pack into a robot,

23:44: right? Where you're like, "Hey, learn

23:46: how to make this for me real quick and

23:48: I'm not going to have to explain any of

23:50: it to you, and then go do it and have a

23:52: way higher likelihood of doing it

23:53: correctly, right?" Yes. Yes, exactly.

23:57: Yeah, and I think

23:59: and you reminded us of the I know kung

24:02: fu scene from

24:03: uh

24:05: What is the name of this movie? I

24:07: forgot. Just when I was thinking of

24:09: >> The Matrix, yeah. Right? So, it's a

24:11: little bit like that. Like you just plug

24:13: your model in and say like, "Hey, you

24:15: know kung fu now." Um or uh or it's also

24:20: like there's the general advice about

24:22: writing functions where people will say,

24:24: you know, if you've written the same

24:25: code three times or you know, you copy

24:29: and paste it the same code two times and

24:31: you go to do it a third time, you know,

24:32: maybe that is the time to uh make a

24:35: function. And I think a really similar

24:37: thing applies to skills where

24:40: um if you find yourself saying the same

24:42: thing

24:44: to a model repeatedly, like you're

24:45: having a conversation with Claude, for

24:47: example, and you are uh like you find

24:50: yourself like typing out the same phrase

24:52: repeatedly,

24:53: um

24:54: or like telling it like, "I want you to

24:56: do it this way." And then have to like

24:57: you know, maybe give like a whole

24:58: paragraph and you know,

25:00: if you notice yourself doing that, then

25:02: that is a great moment to stop and make

25:05: a skill.

25:08: Fantastic. Okay, we have some questions

25:09: if you're open for a little break. We're

25:11: at the 30-minute mark, so I think this

25:14: is a good stop cuz we've got about four

25:15: questions that we could get through.

25:17: One is from Russ that says, "Hey, GitHub

25:19: has the like top 10 repos and trending

25:23: repositories. Is there anything like

25:25: that with agents

25:26: skills so that we can look up the top

25:28: trending or used skills so that we know

25:31: what's already out there?" Isabella did

25:33: link some stuff.

25:34: Wondering what you use to keep up with

25:36: the latest.

25:37: Yeah, that's a great question and I'm

25:39: really excited to share this website

25:40: with you. It's uh skills.sh.

25:43: Uh this is

25:45: um by this is by the company Vercel.

25:48: Um they also have a little uh command

25:51: line utility.

25:52: Um

25:53: if you have npm uh installed, you can

25:56: use npx skills

25:58: to add uh

26:00: add any of these skills to your coding

26:02: agents.

26:03: Um I really like the utility, but then

26:05: also what happens is that they uh sort

26:07: of you know, keep track of who's using

26:09: which skills. And then you have a big

26:12: they have this big sort of I mean this

26:14: is this is actually like exactly what uh

26:17: that person was asking about where this

26:19: is like the these are the top skills

26:21: used of all time. I love how you can see

26:24: the

26:25: >> is just find skills. Finding skills,

26:27: yeah.

26:28: >> [laughter]

26:28: >> Yeah, I think some of the top ones end

26:30: up being because they're uh loaded and

26:34: common.

26:35: Um

26:36: what's the word? They're loaded in

26:38: common uh coding agents.

26:40: Okay.

26:41: >> but yeah, so you can from here you can

26:43: look through things and um like I can

26:46: probably find the caveman skill. There's

26:48: an actually a bunch of caveman things.

26:50: Um

26:51: for example, or uh we were just looking

26:54: at shiny. You can find our skills here.

26:58: Um

27:00: Yes, limb.

27:02: Let's see, tidy verse probably shows up.

27:04: So, if you're ever in the position where

27:06: you're like uh

27:08: you know, I wonder if a skill exists for

27:11: this thing already, uh you can come here

27:13: and search for it. Let me show you I'll

27:15: go to shiny

27:17: Yes, limb one.

27:18: Because once

27:22: Okay.

27:23: There we go.

27:24: So, once you open it, you can actually

27:27: um

27:27: you know, read through the skill here in

27:29: the website.

27:30: Uh at the very top, they'll give you the

27:32: command that you can uh paste into a

27:34: terminal to run to add the skill to your

27:37: coding agent.

27:39: Uh or um and then there's also like a

27:42: direct link to the the repo.

27:44: They added this recently to the security

27:46: audits, which I think are useful to look

27:48: at. Um

27:49: And it's worth mentioning that when you

27:52: are that it is worth auditing a skill

27:55: before you bring it in to your

27:57: >> Yeah. Tom in the Discord literally just

27:59: asked, "Should we really trust these

28:01: rando skills?"

28:03: Um somebody had also said like, "Hey, I

28:04: actually don't recommend installing that

28:06: find-skills one cuz it comes with a

28:07: bunch of telemetry." Um so, do your

28:12: research still, right? Like verify that

28:14: what you are adding to your computer is

28:16: good. Thank you, Russ, for that

28:17: question. And then we had one from

28:19: Santiago um asked in the Zoom Q&A.

28:22: Santiago, get on Discord. We miss you.

28:26: Um

28:26: what tool do you use to download /

28:30: manage or sync skills from various

28:32: sources? He says that he is using MPX

28:35: skills from Vercel, but curious to hear

28:37: what everybody else is using. Um is MPX

28:40: what you use, Garrick?

28:42: Yeah. So, I use MPX mostly. One of the

28:44: things I like about MPX is uh let's

28:48: actually like

28:50: let's try it. Um

28:51: Where did I

28:53: uh

28:55: we'll put it in this thing over here.

28:56: So, I'll make this bigger. We'll hide

28:58: the console.

28:59: I'm going to CD into demo.

29:02: And um

29:03: okay, so you do MPX skills

29:06: add

29:07: and then you give the repo.

29:09: And when you run this,

29:12: um

29:12: it will tell you which skills are in

29:15: that repo, and then you can pick them. I

29:17: could say like, you know, I want this

29:19: skill.

29:21: And maybe I want you know, yes, I want

29:23: it in Claude code. And you pick a couple

29:25: options, like I'm going to put it here

29:26: in this project.

29:28: And I just say yes to everything else.

29:30: Um also, like this will show you the

29:34: security risk assessment as well. So,

29:36: it's you'll actually see that in the um

29:38: in the output. And what it has done is

29:41: it has, if I can find this folder, it

29:45: has added the skills source to {dot}

29:48: agents {slash} skills.

29:51: Uh in it wasn't clear in here, but uh

29:55: in

29:56: when I for this question, which agents

29:58: do you want to install to,

30:00: um I have picked uh Claude and Pi

30:02: before. So, it remembered that and it

30:04: installed sim links to Claude skills and

30:08: to Pi skills.

30:10: And um

30:12: so that they would be available for

30:13: those coding agents. And then the last

30:15: thing it does is it adds this file.

30:18: Hide the console. Adds this file, which

30:20: keeps track of where I got this skill

30:22: from.

30:23: Which uh this is this is pretty useful

30:26: in general.

30:28: Um

30:29: the other way that I like to install

30:30: skills is using um a package that I work

30:33: on called BTW.

30:37: So, uh if you load BTW, there is also a

30:40: function BTW skill and you can install

30:44: skills from GitHub or you can install

30:46: skills from

30:48: packages. So if you are developing our

30:51: packages,

30:53: my recommendation is to

30:55: store Let's see if this is actually in

30:58: here. So to store the

31:01: to store skills in the inst skills

31:04: directory

31:05: and then

31:07: the BTW package will

31:09: like has

31:11: will basically like see that and you can

31:13: install the skill from the package

31:15: directly, which means then make it

31:16: available to other coding agents outside

31:19: of Elmer and BTW. Or there's also a way

31:22: that BTW can give you an Elmer client

31:25: that can see skills and use skills and

31:29: um

31:30: and it will automatically detect skills

31:33: in your attached R packages. So like if

31:36: you've loaded a package that also has a

31:38: skill, then the BTW client will will

31:41: automatically load that for you.

31:43: Awesome. Okay, let's see if we can slide

31:46: in a few more questions here.

31:48: Um James had said that caveman skill had

31:51: a boundary section in it. Is that

31:53: standard for the skills.md file and what

31:56: practical implications does that have?

31:59: It had a boundary.

32:02: It might have had like a boundaries.

32:06: There you go, at the very end.

32:08: Oh, right.

32:11: Uh okay, so fun the funnest part about

32:14: skills is that inside of the markdown

32:16: file anything goes. Like

32:18: write anything. Um this is just

32:22: a thing that they added here.

32:24: I think it makes sense. This is relevant

32:26: to um to like if you're using this

32:31: skill, that's pretty relevant. Like

32:32: don't That the idea here is like it's

32:35: telling the model like there's certain

32:37: cases where you don't want to be

32:41: extremely terse and it is better to

32:44: actually make sure everyone knows what

32:45: you're talking about.

32:47: Yes. I think caveman talk would get

32:49: pretty annoying in certain situations.

32:52: Yes.

32:53: Morgana asked, are skills almost a way

32:55: to give agents info about topics

32:58: in a lesser version of having a vector

33:01: store or a document repo for the model

33:04: to refer to? So it's like a masterclass

33:07: version of the info, maybe a more

33:10: succinct version.

33:12: Yeah, I think

33:15: Okay, so when when would you use rag or

33:19: which is what they're talking about? Rag

33:21: is retrieval augmented generation and

33:23: it's the idea that like that so this is

33:25: very similar in the sense that both in

33:27: both cases

33:29: retrieval augmented generation and

33:31: skills are both like

33:33: we're going to need to get some useful

33:34: information for the model. We're going

33:36: to load it dynamically because we don't

33:37: know when exactly it's supposed to be

33:39: used

33:40: but rag is more about having a giant

33:43: pile of documents that may or may not be

33:45: relevant and you don't at any given

33:47: point know which one is going to be

33:49: relevant to any conversation.

33:51: Skills are a lot better when you enter

33:55: an area where

33:57: there's [clears throat] a very clear

33:59: reason that you would want to have the

34:00: skill be loaded in the first place.

34:03: So

34:05: You know, as it if we go back to the

34:06: shiny example,

34:08: the

34:10: the skill here is like when you're

34:12: building shiny apps that use BS lib,

34:15: then then we know like once we know

34:17: that, we now know everything in here is

34:19: more or less relevant

34:22: and it this is like we'd we'd want this

34:24: to come in, right?

34:27: Or the other way that this is really

34:28: useful is when you have a specific

34:31: workflow that you want to go through.

34:33: When you want to guide the model through

34:35: doing something very specific. And

34:38: I have another example of that in

34:41: here. Where did I

34:45: Or do I have

34:47: I thought

34:52: No, I

34:53: it moved around. Okay, so yeah, there it

34:55: is. So PR create. So this is a skill

34:58: that I made one point for

35:01: that kind of like monitor follows how I

35:04: like

35:05: over cra- like how I like pull request.

35:08: So if I'm working with a coding

35:09: assistant and I've made some changes and

35:11: I'm at the point where I'm like, okay,

35:12: this is ready to be made into a pull

35:14: request. This then covers more or less

35:18: the the workflow that I would use. And

35:21: specifically with Claude Code. So this

35:24: you know, you can

35:26: skills can be used with lots of

35:27: different coding assistants, but in this

35:29: case I've mentioned specific tools that

35:32: I know Claude Code has that other coding

35:35: agents don't necessarily have. So I

35:37: designed this skill around guiding

35:39: Claude through a very specific workflow.

35:41: And you can see that inside of these

35:43: instructions,

35:44: um

35:45: it's very prescriptive. It's like here's

35:48: here's what you're going to do.

35:50: Here's the process. Step one, you're

35:52: going to look at the current state and

35:54: you're going to figure out

35:56: like

35:57: you know, where our base branch is. You

35:59: know, there's stuff in here like maybe

36:00: you're going to want to

36:01: like you're going to need to either

36:02: create a branch or you'll have to stage

36:05: and commit the changes or maybe you're

36:07: going to need to you know, get the

36:09: branch up to speed with the with the

36:11: latest version of main, things like

36:13: that. And then getting through specific

36:15: like this is how I want you to draft the

36:17: PR title and body, right? So this is

36:19: much more prescriptive. It's very like

36:21: you're entering an an area of like we're

36:23: going to do this task together and

36:27: um

36:27: and I, you know, by the time you've like

36:30: scanned this whole thing, you're like, I

36:32: would not want to guide the the model

36:34: through all of these pieces,

36:37: you know, step-by-step. I I really like

36:39: I know how I want this process to go

36:41: from the outside and I just want the

36:42: model to pick up the the the the pattern

36:45: that I have established and follow it

36:47: for me.

36:48: And um

36:50: so that's um that's how I ended up

36:52: that's how I ended up using this

36:54: um

36:55: the skill a lot is it just sort of you

36:58: know, now now Claude and I follow a

37:00: repeatable pattern when I'm submitting a

37:03: PR.

37:04: And um

37:05: >> Perfect. That's really nice. I liked

37:08: Nutty Tobacco in Discord saying, "It's

37:10: like making sentient functions."

37:13: >> [laughter]

37:14: >> It is exactly like that. That is such a

37:16: good analogy.

37:18: >> That's a perfect description. Um okay,

37:20: so there are more questions, but we have

37:22: 20 minutes left and you were going to

37:24: help us see what building a skill from

37:28: scratch looks like.

37:30: And so if we're going to fit that in, I

37:31: say we We would need to do that now.

37:33: Yeah. Let's do it. And we we will still

37:36: hold some space maybe like 5 minutes at

37:38: the end and we'll get in as many

37:39: questions as we can or we will answer

37:41: them in Discord.

37:44: Yeah. So I was working demo, where did I

37:47: put you? Report.

37:49: So I have this should be everything. So

37:52: I have this report that I was working on

37:54: using uh this week's Tidy Tuesday data.

37:57: And um

37:59: actually so I actually worked on this

38:01: together with Opus and Positive

38:04: Assistant. And we went through a bunch

38:06: of stuff. I made this whole report

38:08: looking at the data. I'm just going to

38:09: scroll down. You're going to see there's

38:10: some plots.

38:12: There's another plot, uh but my favorite

38:14: plot is the last one,

38:16: uh which this one, which explores

38:20: the tariffs that we apply that the US

38:23: government applies to

38:25: cheeses

38:27: and apparently

38:29: we apply higher tariffs to cheese that

38:31: we think is fancier.

38:33: So my favorite part was Swiss with

38:36: holes. Swiss cheese with holes gets a

38:38: higher tariff than Swiss cheese without

38:40: holes.

38:41: Which is higher than cheddar cheese for

38:43: example.

38:44: Um

38:46: Okay, so

38:47: So we made this whole thing. If I I can

38:49: find the code somewhere in here, it'll

38:51: be something like

38:53: Um here's our official cheese ranking.

38:56: Right?

38:57: If I open this up and looked at it in a

38:59: browser, I would realize that this

39:01: plot does not have alt text. So

39:05: alt text is basically description for

39:09: uh

39:10: for

39:11: for

39:12: people who like either can't see the the

39:15: plot because of their their system or a

39:18: visual disability. Um and it the idea is

39:21: that it describes you know what is

39:23: happening in this image. So it'd be nice

39:25: to have something. And the way that you

39:28: can do it is

39:30: here to do like fig So in Quarto you do

39:32: the fig alt and

39:35: you can see now that actually Copilot is

39:37: going to give me

39:39: um a pattern here. Bar chart showing US

39:42: tariff rates for different types of

39:43: cheese with annotations. This is

39:45: probably

39:47: This is like a very literal like What

39:50: happened is the completion model read

39:52: this code and was like, I think I get

39:54: what's going on here and just gave me

39:57: a basic answer. Right? But there are

40:00: some really good processes to follow.

40:04: Um

40:05: in particular

40:07: this

40:08: um

40:09: there's an article on Medium.

40:12: I

40:13: forgot the author's name at the moment,

40:14: but it's in this in the read me for this

40:16: repo.

40:17: Um who kind of went through like, here's

40:19: a really good pattern that you can

40:20: follow. So,

40:22: I you know, chart type of type data

40:24: where reason for including chart. And

40:26: then, you know, make sure you include a

40:27: link to the source data source somewhere

40:29: in the text. So, I have already kind of

40:32: gone through and picked out um

40:35: I need to see this in the regular. So,

40:36: I've picked out some good resources on

40:41: creating alt text.

40:44: Uh, in Amy Cesal is the author of that

40:47: medium article by the way.

40:49: And uh, what I'm going to do is I'm

40:50: basically going to

40:53: uh, open up a terminal.

40:55: And I'm going to actually move this over

40:57: so we have it

40:59: side by side. This is my favorite part

41:02: of Positron by the way, that you can

41:03: just like

41:05: grab things and move them around and put

41:07: them next to each other.

41:09: Um

41:10: and I'm going to launch Claude. We're

41:12: going to use Sonic 4.6.

41:15: And

41:17: I'm going to

41:18: invoke a skill. So, this is this is the

41:20: other way that you can invoke skills is

41:22: with the slash command. You can see

41:24: here's my PR create skill

41:26: uh, cuz Claude knows that I like this

41:27: skill and use it a lot. So, um in Claude

41:30: code skills show up as slash commands.

41:31: You can you just type uh, slash and then

41:34: you can type the name of the skill.

41:36: And um or the other way that skills kind

41:39: of get loaded is when you like when you

41:41: say words that sort of match what was in

41:43: the description and then it'll show up

41:45: in your it'll either one can work. Um

41:48: but I like I I like the slash command

41:51: cuz I then I I know when I'm getting the

41:53: the um

41:54: the skill that I want. So, I'm going to

41:56: actually use the skill creator skill to

41:59: create a skill. And you can invoke the

42:02: skill. The other cool part is you just

42:03: like you can say more words, too. So,

42:05: like let's create a

42:08: um

42:09: a a

42:10: for

42:14: uh, hang on. I'm going to just I'm going

42:15: to do it this way. See if this works.

42:17: Let's create a skill for writing alt

42:20: text for data visualizations.

42:24: That did not

42:25: >> Oh, what did you just do? Were you

42:27: dictating?

42:29: I was dictating cuz that's

42:32: Ah, nope. All right, okay. Hang on. All

42:34: right, I'm going to just type it out. It

42:35: It should have worked, but it didn't

42:36: because Zoom is probably in the way.

42:38: Because Zoom, I know. It ruins

42:40: everything.

42:44: I did a 2-week trial, everybody, of um

42:48: the Whisper Flow that Joey Marshall

42:51: showed us on his Data Science Lab. And I

42:54: really liked it. There were some

42:55: instances in which it would like take

42:56: over when I didn't want it to or I would

42:58: accidentally click it and I would end up

43:00: uh dictating

43:02: dead air for like 15 minutes.

43:05: Uh but it was pretty cool.

43:07: We're having a fight in the chat right

43:09: now about uh cheese. We got really

43:11: sidetracked by the cheese.

43:13: >> [laughter]

43:14: >> So, everybody pay attention. We're

43:15: making a skill cuz we only have We've 13

43:17: minutes to make this skill.

43:20: Yeah.

43:23: Yeah, okay. So, I said, "Yeah, make me a

43:25: skill." And I give it these websites and

43:27: ask it to distill the references into

43:29: concrete advice. And I

43:33: uh this is a pattern that I like to

43:35: follow when I'm making a skill is

43:37: basically like go open a bunch of tabs,

43:40: uh go browse around, find good

43:43: resources, um like either that could be,

43:46: you know, package documentation, things

43:48: that you have written already, um things

43:50: that other people have written, people

43:52: whose advice you, you know, admire and

43:54: appreciate, things like that. Like if

43:56: you do a little bit of work in advance

43:58: to say sort of bring in some like good

44:01: resources and materials for the skill,

44:04: uh it generally goes a whole lot better.

44:07: Right? So,

44:08: um so Claude went out and read those

44:11: websites and said, "Now I have

44:13: everything I need. Let's write this

44:14: skill." And I'm going to say, yeah,

44:16: wants to it wants to make the dot Claude

44:19: skill and it's going to call it alt text

44:21: database. And I'm going to say, yeah, go

44:24: ahead. You can have access to skills.

44:26: Feel free.

44:27: And um

44:29: so now it's probably going to do a bit

44:31: more reading. But basically the the

44:33: skill creator skill is just going to

44:34: walk you through all the things that it

44:36: needs to do from here. Um often if you

44:39: have done the hard work of putting

44:41: together some good context, you've

44:43: you're um

44:46: that's kind of the extent of what you

44:48: need to do for now at least. Like Okay.

44:51: So, while Claude is incubating, maybe we

44:53: can get another question in. Yeah. Um

44:55: cuz Connor asked a great one. I love

44:56: this. How do LLMs deal with conflicts

44:59: between skills? Like the DPlayer select

45:02: and mass select conflict. But with LLM

45:05: skills.

45:07: I mean, so that's the nice part about it

45:09: being like sentient functions is that

45:13: they, you know, the model

45:15: figures it out um to a certain extent.

45:18: Also, like you likely won't have

45:21: uh two skills loaded at the same time.

45:23: Uh so, usually with this with the skill

45:26: it'll be like like I said, the model has

45:28: a general sense of what each skill is,

45:30: but then it actually has to go in to

45:32: like actually like get the contents of

45:35: the skill and bring it in. Um then it

45:37: has to like it has to take an action to

45:39: do that. It has to go read the file. And

45:42: that doesn't happen automatically. So,

45:44: it's very rare that you end up in a

45:46: situation where like you have competing

45:48: skills active at the same time. In fact,

45:51: the hardest part about a skill is that

45:53: they don't always turn on when you want

45:55: them to turn on.

45:56: I was going to say, nor had asked a sort

45:58: of like question that goes along with

46:01: that, which was like, well, are you

46:02: stuck using all skills for each session

46:04: or can you like subset which skills

46:07: you're using for that session?

46:09: Um

46:09: part of the answer to that, I think, is

46:11: that that's why we give them

46:12: descriptions, right? So that

46:15: it's not initially just reading

46:17: every skill that you have,

46:19: it's only reading that description part.

46:22: Right. Yeah, exactly. So you um with

46:26: skills, there is no real way for you to

46:28: like go in and toggle usually there

46:30: isn't any way for you to like toggle

46:32: skills on or off. Um your only real

46:35: choice is whether or not you install it

46:37: for globally on your computer, so like

46:39: for any session with Claude, or if you

46:42: install it just for

46:44: uh the project that you're working on.

46:46: And um beyond that, you know, there's

46:49: there's not a lot of there aren't a lot

46:51: of levers to pull about when you know,

46:53: which skill is attached or not attached

46:55: or like

46:56: available. But

46:57: >> Okay. I think that answers Nathan's

46:59: question. Yes. Which was is the default

47:01: to download them on a per project level?

47:05: Yeah, I think it's a little bit of both.

47:08: Um I usually opt for

47:12: doing skills locally first, and then if

47:15: I realize that I use them so much that I

47:17: need them that they're like useful to be

47:20: global, then I uh move them and start

47:23: using them globally.

47:24: Okay. What is the difference between

47:26: that those two options? Like could you

47:28: demonstrate that for us really quickly?

47:31: Sure. So this

47:33: So Claude just made me a skill and it

47:34: put it in

47:36: .claudeskills, right? And so I'm in this

47:39: project. And if I go in here to dot

47:42: inside of my project, I have

47:43: .claudeskills,

47:45: and here's my alt text data viz skill,

47:48: right?

47:49: Which we can come back to, but it made

47:51: me a skill. We have a skill now. This is

47:52: awesome.

47:53: Um

47:55: Yeah, you get do

47:56: So the other option is to install it

47:59: into my home directory. There in my home

48:02: directory, there is also .Claude/skills.

48:06: And

48:08: and there, you know, that those

48:10: those skills are then available

48:13: everywhere, right? So, you know, I was

48:15: talking about the PR create skill, which

48:17: is not here in my project, but it is

48:20: available to me because um it's a skill

48:23: that I have installed globally. So, any

48:25: set coding session that I do will have

48:28: PR create. Any coding session with

48:30: Claude code will have PR create. And

48:32: meanwhile, like this alt text database

48:34: thing will only be here in this project.

48:38: Okay.

48:40: I I interrupted you in the middle of a

48:42: thought when I asked you that question.

48:44: Do you remember what you were going to

48:44: say?

48:46: Uh no, but that's all right. So, I have

48:49: I have my alt text database skill now.

48:52: And

48:53: um

48:54: you know, I From here, I would I mean,

48:56: okay, here's what's nice is it actually

48:57: did Yeah, see that it it found this from

49:01: the from the picture.

49:03: Right? That was the pattern that we were

49:04: wanting it to to have. Um I

49:09: we're not going to read this and like go

49:10: through it in in great detail or

49:12: anything like that, but I would

49:14: recommend if you are making your own

49:15: skill, don't just take the output from

49:17: Claude at this point. I mean, this I I

49:20: can say that this skill is definitely

49:22: better because I gave it three really

49:23: good articles than it would be if I just

49:26: asked Claude to make up a skill without

49:27: any references, right? So, we're already

49:30: starting off on a good foot, but

49:32: but if you're making your own skill,

49:33: this is the point where I would stop.

49:35: Read this. Uh like actually, I would

49:38: read it line by line. Ooh, do you want

49:40: to see something else that's cool that I

49:41: really like?

49:42: Um

49:44: I have

49:44: >> Absolutely we do.

49:46: Um

49:50: So, I have a

49:52: >> questions coming in. I'm just going to

49:53: let you guys know if we don't get to

49:54: them in the last 7 minutes, we will

49:55: answer them on Discord. Don't worry.

49:58: Yeah, so that's Cloud and skills alt

50:01: text database.

50:04: Skills and D

50:06: That's never mind.

50:08: What am I typing? It was enigmatic. Mhm,

50:12: Cloud like I did I spell something

50:14: wrong? Um

50:21: Maybe this one.

50:23: There's a I have this It's like a skills

50:26: plugin

50:27: that lets me

50:29: um

50:30: review

50:32: files.

50:34: So, I can like see uh it looks a little

50:36: like this. Let me hide some of this just

50:38: so So, it like gives you the file

50:40: from like you start from Cloud Code.

50:42: It's called Planetator. And then you can

50:46: um where's my skill? This is the one.

50:48: Right? The then you can highlight parts

50:50: and add comments and say like this looks

50:55: great. Thanks

50:57: for writing it.

50:59: You know, or you can you know, give it

51:01: instructions on specific lines to like

51:04: think like if I click here, yeah. I

51:06: could give it inline feedback.

51:08: And when I'm done, you then you can

51:10: click approve or close and you send that

51:12: inline feedback back to the model.

51:14: And um the model will respond to you

51:18: directly. So, like if you're interacting

51:19: with like a markdown file,

51:21: uh unlike doing it over here in the the

51:24: editor,

51:25: um that little interface is pretty nice

51:27: for letting you

51:29: uh give inline like very specific

51:31: feedback inline.

51:33: But Okay, so Super cool. Victor, thanks

51:35: for sharing that in the chat.

51:38: Okay, so now you'll notice I don't have

51:41: the skill yet because I need to like

51:43: exit this session

51:45: and start a new one.

51:47: And now I have the alt text database

51:49: skill and I can say um

51:52: add

51:53: appropriate alt text to the plots

51:57: in

51:58: and I'm going to use at so I get the

52:00: right so the at is going to say like

52:02: here's the file like here's a file that

52:04: I want you to use. I think I put it in

52:06: reports. I can pick the QMD from here.

52:11: Um

52:12: now we we must have moved directories

52:14: while we were doing that which is

52:16: probably why

52:18: that command wasn't working before. But

52:20: so that I'm

52:22: >> So I've invoked the skill. I invoked it

52:24: directly rather than I could have just

52:26: said um write some alt text for me and

52:29: it probably would have also turned on.

52:32: Um but

52:34: this also will work for me as well.

52:37: And uh it's you can see it's going

52:38: through and adding

52:40: these

52:42: uh the the appropriate

52:45: chunk options to include

52:48: uh useful uh alt text.

52:51: And again, I would not recommend just

52:54: taking this but it is a really good

52:56: starting point um for you to to make it

53:00: easier to you know to like write these

53:02: and um and have them be you know part of

53:04: your your reports. I agree. They're a

53:07: great a great starting place. Look at

53:08: them look at the plot verify but then

53:10: they often cut down on time and make it

53:12: way more likely that you actually add

53:14: alt text which is very important for

53:15: accessibility.

53:16: Okay, we have three more minutes. Can we

53:19: like rapid fire get in some some

53:21: questions and answers? Okay. Um we had

53:25: from Zoom

53:26: a question that said, I use the Posit

53:28: skills and I install it from Cloud Code

53:30: plugin marketplace and provide the Posit

53:33: skills get URL. Is this the same thing

53:36: with installing with NPX? Does it do the

53:38: same thing?

53:39: It's it's very similar. Cloud has its

53:41: own plugin system. What they're talking

53:43: about is and it it's mentioned in the in

53:46: the repo of the positive skills repo.

53:48: But you do like something like pod

53:49: plug-in install

53:51: or add or something and you So like I

53:53: have it set up so that

53:55: in in the skills repo, there are like

53:57: groups of skills and you can install

53:58: them as Claude code plugins, which makes

54:00: it easier to manage if you're just using

54:02: Claude code. Um I move around a little

54:04: bit between coding assistants, so I

54:07: prefer installing individual skills. And

54:10: I also really like having a lock file.

54:11: So I don't

54:13: uh I'm not a huge fan of Claude code's

54:15: plug-in system, but um

54:18: but they both work. Uh we we tried to

54:20: make it easy so that you could get like

54:22: some skills, but not all the skills at

54:23: once.

54:24: All right. I also wanted to point out

54:26: David Onder had said in the chat that he

54:29: actually keeps his skills in a in

54:31: folders that are named by group names

54:33: and tells the AI to use skills by group,

54:36: which I think is pretty useful if you're

54:38: thinking about organizing. Um we also

54:41: had Nathan Jeffrey ask a question along

54:43: these lines, which is what distinguishes

54:46: the dot Claude folder from a dot agents

54:48: folder?

54:50: It it's just convention. For different

54:52: agents will use different folders. Um

54:54: agent dot agents is the most sort of

54:57: coding assistant agnostic one.

54:59: And then um Claude uses uh

55:03: Claude code uses dot Claude and there

55:05: are a bunch of different one like some

55:07: some coding agents will follow the dot

55:08: agents

55:10: and some um will not or some use their

55:13: own conventions.

55:15: Um

55:15: >> Okay. Yeah, it's the wild west out here.

55:18: All right. And then I think our last one

55:20: is from Zoom and it says, is it the

55:22: community practice to let an LLM write

55:24: the skill with resources fed um as

55:27: opposed to writing it by hand?

55:30: Uh yes and no. I think it depends a bit

55:33: on what you want to do. Like and it

55:35: depends on uh you know, your task and

55:38: everything. I think that it is I think

55:41: that the vast majority of skills that

55:42: you will find online have been written

55:44: by uh cloud code or you know, by a

55:46: coding agent in the first place. I think

55:49: so, too. I see that a lot. Yeah. Uh and

55:52: on the other hand, like things that are

55:54: you know, you can still do it by hand

55:56: and have bespoke skills that are very

55:58: important to you and it's a useful

56:01: experience, but but overall, I do

56:03: recommend I think the the most important

56:05: part is to think about what sources

56:07: you're putting in front of the model.

56:08: And you

56:10: also like I I did not do this, but

56:13: usually I spend quite a bit of time

56:15: guiding the model in terms of how to

56:16: structure the information. So, I don't

56:19: usually just take what it gives me in

56:21: terms of what it thinks it should be,

56:22: you know, I work on structuring the the

56:25: information in a way that will likely be

56:28: uh better organized in the end as a

56:31: result of my participation. And then you

56:34: read it and then you make it you know,

56:36: fix it up until it's what you want it to

56:38: be.

56:39: All right, Garrick, this is so great.

56:41: We're at the top of the hour, but if

56:42: it's really quick, get it in there and

56:44: we'll get it in the YouTube recording.

56:45: >> is also if you see someone else's skill

56:47: that you think is like, this is great,

56:48: but it's not quite what I want, remix

56:50: the skill. Um bring it in, change it up,

56:53: remix it, make it your own.

56:56: Awesome. Thank you so much, Garrick. I

56:59: learned a ton. I see Oh, hey Donnie.

57:01: Donnie's here. Everybody's clapping in

57:04: Zoom. You're getting tons of thank yous

57:06: in the Discord. I will say thank you,

57:08: too. This was amazing. Um we will have

57:11: this up on YouTube. And I really hope

57:14: that you had a good time, too, Garrick.

57:16: I had a blast. Thank you so much.
