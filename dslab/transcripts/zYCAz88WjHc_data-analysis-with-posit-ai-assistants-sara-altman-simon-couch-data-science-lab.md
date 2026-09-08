---
type: Video Transcript
title: "Data analysis with Posit AI-assistants | Sara Altman & Simon Couch | Data Science Lab"
description: "I run community here at Posit, and I'm joined by Isabel Velasquez."
resource: "https://www.youtube.com/watch?v=zYCAz88WjHc"
tags: ["ds-lab", "eda", "apis", "github", "r-packages"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T21:59:18Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=zYCAz88WjHc"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2026-03-12T00:00:00Z"
    usage_count: 2335
usage_window: { from: "2026-03-12T00:00:00Z", to: "2026-09-08T21:59:18Z" }
---

# Transcript

00:07: Welcome to the Data Science Lab,

00:08: everybody. I'm Libby.

00:10: I run community here at Posit, and I'm

00:11: joined by Isabel Velasquez. Isabel,

00:14: would you like to say hello?

00:15: >> Hi everyone. Thank you for joining us.

00:18: >> So, what I will do now is introduce our

00:21: featured

00:23: lab

00:24: manager for today, Sarah Altman.

00:27: Um Sarah, would you like to introduce

00:29: yourself and talk a little bit about

00:31: what you will be talking about today?

00:33: >> Yeah, sounds good. Um yeah, hi everyone.

00:36: I'm Sarah. So, I'm a senior developer

00:39: advocate on the AI team here at Posit.

00:41: Um

00:43: thanks Libby and Isabel for hosting

00:46: this.

00:47: So,

00:48: today we're going to walk through data

00:51: analysis with AI assistance. So, if

00:54: you've seen like the AI stuff that Posit

00:57: makes before, you might know like we

00:59: have packages that let you build stuff

01:03: with that like uses LLMs, and then we

01:05: have tools that

01:08: are built with LLMs that help you like

01:10: do data analysis or data science tasks.

01:12: So, I'm going to focus on the second.

01:13: So, it's less like the packages like

01:15: Elmer

01:17: or Chatlist or whatever you might have

01:18: used and more on tools where there is an

01:21: LLM embedded in the tool, and then we're

01:23: using that to do data analysis.

01:25: So, I'm going to show you a couple

01:28: tools or like three to four. We'll see

01:30: how much we get through.

01:33: But, I also would like to talk about

01:35: like why you might want to use AI for

01:37: data analysis or data science, but also

01:39: why you might not want to, what kind of

01:41: tasks it might be useful to use it for,

01:44: and what kind of tasks it's more risky

01:46: or you might not want to use AI for.

01:49: So, please yeah, ask questions.

01:53: It'll be great to talk about that. And

01:55: I'll explicitly talk about a couple

01:56: pitfalls and how you might avoid them.

01:59: Um Um

02:01: but yeah.

02:02: >> Perfect. Yeah, so this is definitely

02:04: definitely a good place to be a um

02:07: an observer an observer of like a

02:09: informed skeptic, right? And like

02:13: ask all the good questions because Sarah

02:15: and Simon are asking them and they're

02:17: like actively writing blog posts,

02:19: putting them in the AI newsletter

02:21: and that is a fantastic resource for

02:24: anybody who is curious about use cases

02:26: of AI and pitfalls and do's and don'ts.

02:29: I'd also love to just let Simon

02:31: introduce himself really quickly because

02:33: he is here. I wasn't sure if he was

02:34: going to be here. Simon's also on the AI

02:36: team with Sarah. Um he's our little

02:39: special guest today.

02:40: >> Yeah. Yeah, happy to be here.

02:43: Um I work on the the AI team with Sarah.

02:45: Sarah and I work together quite a bit

02:47: especially um on the AI newsletter which

02:51: we send out every 2 weeks

02:53: um as well as various deep dives into uh

02:56: problems that we see while we

02:58: uh

02:59: work on data science uh agents that we

03:02: are building on the AI team.

03:04: >> Wonderful. Glad you're here, Simon. All

03:06: right, Sarah, I will let you take it

03:08: away and share your screen

03:11: um and maybe

03:13: get us started with a little bit of an

03:15: intro on the first tool we're going to

03:16: talk about today or the first method.

03:18: >> Great. Okay. Um Let me see.

03:26: Okay. Can you all see that? This is just

03:28: the Positron website um because we're

03:31: going to start by talking about how to

03:33: install these things. Um so the the

03:36: first couple tools I'm going to talk

03:38: about are the two AI assistants that are

03:40: within Positron. So if you haven't used

03:43: Positron, it's um Posit's like next

03:45: generation

03:47: data science IDE. You can use Yeah, you

03:49: can do both R and Python in it. Um and

03:51: these are both assistants that are

03:53: available in Positron. I'll also show

03:55: you

03:57: uh a tool that you can use in RStudio.

04:00: Uh and then like a more general thing at

04:02: the end. Uh but we're going to start

04:03: with Positron. Um, before we talk about

04:07: how to get started, just want to say

04:09: like the

04:10: a couple things, couple central ideas

04:13: that I want to get across. The first is

04:15: like if you haven't used these tools and

04:17: don't know how to get started, I'm

04:19: hopeful that

04:20: this can help you just get started

04:22: playing around with them. Um, and the

04:25: second is that uh I want to emphasize

04:28: that like AI usage for data analysis or

04:31: data science really isn't an all or

04:33: nothing thing. Um,

04:35: you don't have to suddenly convert to

04:37: doing absolutely everything with AI

04:39: assistant and never looking at your code

04:41: again and like never knowing what's

04:43: going on with the data again. Um,

04:45: you could do that. You probably don't

04:47: want to. But like there's a wide variety

04:49: of things that you can do and you can

04:51: pick and choose what kind of tasks you

04:53: want to use, but also pick and choose

04:55: what kind of tools are most useful for

04:57: you. Um,

04:59: and so like if you

05:01: are sort of approaching this skeptically

05:03: because you don't want to lose control

05:04: over your work or you're really wary of

05:07: the risks, just want to emphasize that

05:08: like you can do a little bit of AI

05:10: assistance or use it for only some

05:12: tasks, something like that. It's really

05:13: not an all or nothing thing. Um,

05:17: okay. So,

05:18: the two tools that are in Positron are

05:22: Positron Assistant,

05:24: so this one, and then Databot. Um,

05:26: and

05:28: so

05:29: both of them you have to enable.

05:32: So, I'm just going to go over the

05:33: instructions here and then I'll show you

05:35: in Positron really quickly, but

05:37: um

05:38: the first thing is that you have to

05:39: enable Okay, so let me back up.

05:42: You want to set up Positron Assistant

05:44: first and then Databot. Um,

05:46: so

05:48: to enable Positron Assistant, there's a

05:49: setting that you enable.

05:53: And then you will add a language model

05:56: provider.

05:58: I know people often have questions about

05:59: like which models you can use. So, I can

06:03: go over this or feel free to ask

06:05: specific questions in a second.

06:07: Um

06:08: And then you're basically ready to go.

06:10: So,

06:12: let's

06:14: Let me see.

06:16: Let me talk about DataBot again or first

06:19: before we go over to Positron so I don't

06:20: have to keep switching the windows.

06:23: Um

06:24: The same kind of thing for DataBot, it

06:26: is a thing that you need to enable. You

06:28: also do need to install the DataBot

06:30: extension.

06:31: And hopefully like we can provide this

06:34: link somewhere so you can follow along,

06:36: but I just wanted to show you where this

06:37: documentation is. So, for DataBot, you

06:39: will need to install the extension and

06:41: then the same thing like with Positron

06:43: Assistant, there's a setting that you

06:44: need to enable.

06:46: And then you're basically ready to go.

06:49: So, importantly like you do need some

06:51: kind of access to some LLM. And if

06:55: you're going to use DataBot, you

06:57: specifically need access to Claude

06:59: model.

07:01: And this could either be through an API

07:04: key that you have or your organization

07:06: has provided you with or because you

07:09: have like some kind of enterprise

07:11: or you have AWS Bedrock access which is

07:14: how Posit does it. And so that's what

07:16: you're going to see on my screen.

07:18: But you can also use a key if you have a

07:20: key available.

07:22: Okay.

07:23: >> Sarah, would you mind real quick just

07:26: briefly explaining the differences

07:28: between Positron Assistant and DataBot?

07:31: >> Yeah. Yeah.

07:33: So, Positron Assistant is a

07:36: general coding agent. And I'm going to

07:39: show you both these tools and we can

07:41: talk a lot more about this, but at a

07:42: high level, Positron Assistant is like a

07:44: general-purpose coding assistant.

07:47: You might use it for debugging. You

07:49: might use it to write a bit of code for

07:51: you.

07:52: Um

07:52: >> [clears throat]

07:53: >> like you would use it in a sort of a

07:55: general way that if you want help with

07:56: code. Data Bot is much more specific.

07:59: It's specifically for exploratory data

08:02: analysis.

08:03: Uh so, you'll see this in a bit, but

08:05: like that is the main thing that Data

08:06: Bot in Positron

08:09: does.

08:10: Uh it is geared entire almost entirely

08:12: towards exploratory data analysis.

08:15: >> Thank you.

08:17: I wanted to also hop in and say whenever

08:19: you see Sarah hovering over the links

08:22: that have a little gear icon next to

08:24: them, for example, in the step one

08:25: enable Positron Assistant, that's

08:27: actually a link directly to the settings

08:29: in Positron. So, when you click that,

08:31: your browser is going to say, "Do you

08:33: want to open Positron?" And you're going

08:34: to say, "Yes." And then it's going to

08:35: take you directly to the correct setting

08:38: that you need to enable inside of

08:40: Positron. So,

08:42: having Positron open first is a good

08:44: idea, and using those links is going to

08:46: be really, really helpful. Um especially

08:48: if you've never, say, modified

08:51: settings.json in Positron before.

08:54: >> Yeah, that's a good point. Yeah, I was

08:56: just about to click on that. So, I did

08:57: click on it, and you didn't see Positron

09:00: open just because I don't have it in the

09:02: share

09:03: window, but um it now opens this

09:05: settings file.

09:08: And then

09:10: I already have it enabled, but you would

09:11: then check this enable option to enable

09:15: Positron Assistant. Okay.

09:17: And then we said that the next step is

09:20: to set up your model provider. So, this

09:23: is how you get access to the LLM. Um in

09:26: Positron,

09:28: everything that you can pretty much do

09:30: like with

09:32: for like settings for the IDE or like

09:34: things that you're setting up, um you

09:36: can access from the command palette. So,

09:38: it's command shift Yes, I think that was

09:40: me.

09:42: >> It's okay, we fixed it.

09:44: >> Maybe command shift P stops the

09:46: recording.

09:47: >> It might be.

09:48: >> Okay.

09:48: >> [laughter]

09:49: >> Sorry about that. Um, it also opens the

09:51: command palette in Positron. Um,

09:55: so

09:57: and then we're going to

09:58: you can I have this open cuz I did this

10:00: recently, but if you

10:04: search for Positron Assistant or

10:06: configure language map model providers,

10:08: this will come up. Um, and then you're

10:10: going to choose your option, which

10:15: usually another option, but um,

10:19: for right now, like it's giving me the

10:21: option to either add an Anthropic API

10:23: key or sign in with Amazon Bedrock. So,

10:25: this is Posit

10:28: hosts all his models through through

10:29: Bedrock, which is why I've signed in

10:30: here, but you can also provide it with a

10:32: key.

10:35: Um,

10:37: Simon, shouldn't also the

10:39: uh

10:40: uh OpenAI

10:41: compatible

10:43: endpoint icon be over here? It was over

10:45: here the other like yesterday when I did

10:48: this.

10:48: >> if it depends on some sort of

10:50: experimental setting. Um, I can poke

10:52: around and send a note.

10:54: >> that I had to change my Positron

10:57: Assistant enabled providers setting to

11:00: openai-api

11:03: and if it was anything else, that

11:05: didn't pop up.

11:08: And I can put that in the chat, too.

11:09: Like this is what my

11:11: This is what my setting looks like.

11:13: >> when I looked at this. I am on a daily

11:15: build of Positron, I think, so it may be

11:18: something updated

11:20: between today, but um, we're going to

11:22: use Anthropic models anyway, so it

11:24: doesn't, but if you

11:27: have access to another model that you

11:30: could provide a key in that way. You can

11:32: use Positron Assistant. DataBot right

11:35: now we're saying only use Claude models.

11:39: Um

11:40: Okay.

11:41: So, we enabled this.

11:44: Showed you how to configure the language

11:46: provider.

11:47: Um

11:48: and now we're basically ready to use

11:50: these tools.

11:52: I don't want to spend too much time on

11:53: the setup just because there's a lot to

11:55: cover, but please ask questions um if

11:57: this seems confusing.

11:59: >> Okay, and you can come back to the

12:00: Design Lab channel and ask that question

12:02: as well um and we will help you or the

12:05: Positron channel.

12:05: >> Yeah.

12:06: >> Um

12:07: but also don't forget that you do need

12:09: to install an extension.

12:11: >> Yes, for DataBot.

12:13: >> For DataBot.

12:13: >> So, yeah. And if you have never

12:16: installed extensions in Positron,

12:18: there's this little extensions uh tab

12:21: over here and then you can search

12:24: for extensions and install.

12:28: Okay.

12:30: So,

12:31: now I'm going to show you how to

12:32: actually use these tools.

12:35: Um

12:36: and for this part

12:40: um we're going to use

12:42: this data set which in here is called

12:45: Charlton hallucination cases.csv.

12:48: So, I guess this is

12:51: somewhat like meta I guess. We're going

12:53: to look at uh

12:55: hallucination data um like LLM

12:57: hallucinated hallucination data in legal

13:00: cases. So, this is um the uh I think

13:03: it's called the

13:05: uh AI hallucination What is this called?

13:08: I don't remember what it's it's called

13:09: exactly, but I'll give you the link in a

13:11: second, but it's a uh database of

13:14: um legal decisions in cases where there

13:17: was a

13:19: AI produced hallucination. So, it's not

13:21: like decisions on

13:24: hallucination. It's like there was a

13:25: some kind of you know, lawsuit and a

13:27: lawyer produced some document that had a

13:31: hallucination in it like a wrong

13:33: citation like a made up legal case and

13:35: then something happened in the case like

13:37: the lawyer was uh fined um or given a

13:40: warning. So, there's actually a lot of

13:42: these.

13:43: Um

13:44: and we're going to use DataBot to take a

13:47: look at this. So, again, you can access

13:50: most things from the command palette if

13:52: you're not

13:53: clicked into zoom with command shift P

13:55: um and then

13:57: search for DataBot and it will open.

14:00: I already had something that was going

14:03: on here earlier. Um you can always start

14:06: a new conversation with this plus

14:08: button.

14:10: Okay.

14:11: So, this is DataBot and again, this is

14:15: s- specifically really for exploratory

14:18: data analysis. So, there's a lot of

14:19: decisions that we made in building this

14:21: that make it uh geared towards

14:24: exploratory data analysis and one is

14:26: these like underlined blue suggestions.

14:30: Um and these give you like ways to

14:32: explore your data and you'll see that

14:34: after each turn when DataBot gives me

14:37: some answers, it's going to typically

14:39: provide more suggestions afterwards and

14:42: this can help you explore the data.

14:45: Okay. Couple other things I just want to

14:47: point out here and can you

14:50: is this big enough? Like is the text big

14:52: enough? Can you all see this well?

14:54: >> I think so, but everybody can chime in

14:57: in the chat and Discord.

14:59: Um and we also had a question which was

15:01: is there any way to configure reasoning

15:04: efforts

15:05: when signing in with GitHub Copilot?

15:10: I'm not 100% sure what that means. Aaron

15:13: says she can see it. The the size is

15:15: okay.

15:16: >> Okay, cool. So, um Copi- GitHub Copilot

15:19: is just for um the like code completions

15:23: in in Positron

15:25: um and

15:27: we're not going to use it for Data Bot

15:29: or Positron Assistant. Um

15:32: I don't I don't think there's I don't

15:34: know. Do you know, Simon, if there's any

15:36: reasoning configuration?

15:38: >> I'm not aware. No.

15:40: >> Yeah.

15:41: >> I am not aware, either. If anybody in

15:42: the chat is, please go and answer that

15:45: question or add some context. Um and

15:48: then David Diaz said, "Does Data Bot

15:50: already support providers beyond

15:52: Claude?"

15:53: Yes, I think so. Wait, wait.

15:56: >> Data Bot does not. Positron Assistant

15:58: does.

15:59: >> Yes, Positron Assistant does.

16:01: >> It's a little

16:02: confusing. Right. One reason for this is

16:05: that

16:06: um like all the models are different and

16:08: we want people to have a good experience

16:10: when they're using these kind of tools.

16:13: Um and

16:15: so if we like make something like Data

16:17: Bot and have tested it a lot with

16:19: certain models or like gear the props to

16:22: work with certain models, you can't just

16:24: like slot in some a new model without

16:27: testing um and iterating. And so like

16:30: we're only really confident that Data

16:31: Bot is going to do a good job with the

16:34: Claude models. So I do want to point out

16:35: that you can

16:37: at this time. So I do want to point out

16:39: that if you click on the model name, you

16:40: can select a model. So

16:42: um

16:43: if you want to change to Haiku, which is

16:45: a cheaper model, um or go up to Opus,

16:48: which is a more expensive um more

16:50: powerful generally model, you can do

16:52: that there.

16:54: Um

16:56: Great.

16:57: Okay. So

17:00: let's now explore the data. So I said

17:03: we're going to look at the hallucination

17:05: cases data. Um

17:08: so there are a variety of ways we might

17:11: open this conversation. I could just ask

17:13: it to like

17:15: Sorry, it keeps thinking I'm clicked

17:16: into

17:18: Uh

17:18: take a look at the

17:21: pollination data and it'll look through

17:23: the files and probably find it, but I

17:25: did want to point out that you can also

17:27: do

17:28: um this you can just ask it to load the

17:32: and then if you do at you get a file

17:34: picker and then I can select the exact

17:36: file.

17:38: Okay.

17:39: And then

17:40: hit enter and it's going to

17:43: do some things.

17:46: Um

17:47: So now we're getting a

17:49: uh

17:50: this little pop-up that is showing us

17:53: what code it wants to run and asking us

17:54: if we can allow it.

17:57: I'm going to say allow for session

17:58: >> [clears throat]

17:59: >> so that I don't have to keep clicking

18:00: this.

18:02: Okay. Um

18:04: and so this is like the core of what

18:05: DataBot does.

18:06: You ask it a question

18:09: and it runs some code.

18:12: And then it gives you a little summary

18:15: and then it gives you some suggestions.

18:17: So that it didn't do much this time

18:19: because all I asked it to do was load

18:20: the data, but now it has some

18:22: suggestions of things we might want to

18:24: look at. Um so let's just like get a

18:26: summary of the data set. You can ask

18:28: questions that are not in the

18:30: suggestions, but you can also click on

18:32: them.

18:38: >> Kieran mentioned how interesting it is

18:40: that it defaulted to read.csv and not

18:42: tidyverse as read_csv.

18:45: I see. Interesting.

18:46: >> [laughter]

18:48: >> If I was doing a code review, I would

18:49: have been like maybe maybe use read_csv.

18:54: >> Um okay. So it has run some code to

18:58: explore the data.

19:03: We're getting some output. It's giving

19:05: us a summary of the data

19:07: that now we can take a look at.

19:09: Um and then it's giving us some sug-

19:11: suggestions at the end. So, a couple

19:13: things just want to point out is that by

19:15: default you can see all of this code.

19:18: There is a way to hide the code, but we

19:20: generally want you to be able to easily

19:22: see this. So, it is possible to review

19:25: it if you want to. And then the other

19:27: thing is that we want Data Bot to not

19:29: give you too much output at any one

19:31: time. As soon as it starts doing just

19:33: like tons and tons of code, it becomes

19:36: very hard for you as the human to keep

19:38: track of what's going on. And for this

19:41: kind of tool,

19:43: like we we want the person to keep pace

19:45: with Data Bot essentially. So, you can

19:47: keep track of what's happening in your

19:48: data. Um and

19:52: like one primary reason for this is that

19:54: if you're doing exploratory data

19:55: analysis, the point is for like you as

19:58: the person to have an understanding of

20:00: the data. If the

20:02: LLM just has the the understanding of

20:05: the data, that doesn't really help you

20:06: that much if you're doing EDA. You want

20:09: to know what is going on in it. And so,

20:11: if it's just doing a bunch of code and

20:13: then giving you tons and tons of output

20:14: that you're not going to sift through,

20:16: you're not going to actually do the like

20:18: sense making process of looking through

20:21: and understanding

20:23: you know, what the patterns are in the

20:25: data, if there's any problems, all of

20:27: that.

20:29: >> Okay. Okay, I'm going to take a quick

20:31: pause and let Isabella ask some

20:32: questions from the Discord.

20:34: >> Yeah, thanks. Hey Sarah. Just wondered

20:37: what is the case as with monetary

20:39: penalty in the console output? Do you

20:42: know?

20:43: >> Oh, this is the So,

20:46: this is the code that it

20:49: ran.

20:50: It It used cat to like write out a bunch

20:53: of text, which

20:56: is one thing that it can do,

20:58: I guess. [laughter]

20:59: Um

21:00: so, this is this is just like text that

21:02: was the output technically of code that

21:04: it ran. So, all the code, if you scroll

21:07: you hit if we scroll up, we see more

21:08: like eventually we'll see more like

21:10: code-looking stuff and not just the

21:12: output of cat. Um so, all this code is

21:14: being run here.

21:16: And so,

21:18: one other thing to point out is that

21:20: DataBot and Positron Assistant have

21:23: access to your variables. Um I didn't

21:26: really have anything loaded when I

21:28: started up DataBot, but if I did, I

21:30: could just ask it to, you know, like if

21:32: I started a new session, I could say,

21:33: "Look at hallucination cases." It won't

21:35: need to do anything. It already has

21:36: access to this data. But, this also

21:38: means that when it runs code, I now have

21:41: access to this. So, if I wanted to shift

21:43: out of DataBot and just look at

21:46: hallucination cases, this hallucination

21:48: data. Um

21:50: >> [clears throat]

21:52: >> I guess I don't have

21:54: It didn't Did it not load tidyverse?

21:57: Um oh, cuz it Did it run it It ran it

21:59: with read.csv. So, that's one

22:02: disadvantage of that.

22:03: Um

22:04: We can use the data and I can do things

22:06: with it myself.

22:09: Um yeah.

22:11: I think we had one more.

22:12: >> Yeah. I think it kind of related it it

22:15: seems like it produces an output that it

22:17: thinks like work best for you. Do you

22:20: happen to know like if the column names

22:22: of the data set are very very messy,

22:25: does it kind of suggest that or do you

22:26: kind of have to prompt it if you want

22:29: those kind of edits?

22:31: >> Yeah, if like would it suggest janitor

22:33: if they were messy or

22:35: Yeah, it

22:38: It might unprompted, but it definitely

22:40: would if you asked it to clean it up. Um

22:43: so, I think some of these

22:45: we can like look at it in the data

22:46: explorer. [clears throat]

22:47: These column names aren't great, so it

22:49: didn't say anything about them, but if I

22:51: ask it, we can do that.

22:54: I move the zoom

22:56: window. Um

22:59: we could ask it that. Um

23:03: column names aren't

23:06: very good. Can you clean them up?

23:08: See what it does.

23:14: >> And then while it is working, Isabella

23:16: asked asked in the the chat like, "Can

23:19: you add skills to DataBot?"

23:21: Like cloud skills.

23:23: >> Yes. Um and hopefully we will get there.

23:27: >> Or we could do this now, I guess, but I

23:29: >> No, no, um a planned skill.

23:31: >> Yeah.

23:32: Great. We'll We'll get We'll get there.

23:33: >> Yeah. And if skills are new to DataBot,

23:35: please correct me if I'm wrong, but my

23:37: understanding is like um markdown file

23:39: with kind of instructions of how you

23:41: like things. So, um

23:42: Kieran mentioned that it used the base

23:45: uh read CSV.

23:47: >> Yeah.

23:47: >> Uh but say like you wanted to use read

23:49: {underscore} CSV from readr, you could

23:52: like put in the skill use tidyverse

23:54: functions and it would do that instead.

23:56: >> Yeah. So, that would that would be a

23:58: good thing for We can just talk about

24:00: this now. Um that would be a good thing

24:02: for the databot.md

24:06: file. So,

24:07: um

24:10: And

24:11: one way to like create this file is by

24:15: clicking the little elephant where it

24:16: says memory.

24:18: And so, I don't think I have one

24:19: already.

24:21: There's nothing really in here

24:24: that I want to save to the memory, but

24:25: we could say like

24:28: Yeah, always use readr

24:30: readr

24:31: read CSV to read in

24:34: CSVs.

24:35: >> That's so cool.

24:36: >> Um

24:40: And this is going to create a databot.md

24:41: file. And this is kind of like a set of

24:44: instructions for DataBot within this

24:47: particular directory.

24:50: Um this is sort of a specific

24:52: instantiation of an agents.md file,

24:56: uh which you might have seen or used for

24:58: other

25:00: uh

25:01: other agents. Um

25:03: you could put things, yeah, like please

25:05: always use read CSV, always use, you

25:07: know, the native pipe, um but also

25:10: specifics about your data. So,

25:13: if there were things specific to this

25:15: hallucination cases data that every time

25:18: I looked at it, I definitely wanted

25:20: DataBot to know about, I could put that

25:23: in the DataBot.md file. Like the example

25:26: I was going to go into later with this

25:28: data set, um

25:30: is that like there's a couple issues in

25:32: the data that it is impossible to know

25:34: unless you tell the model that there are

25:36: those problems in the data.

25:39: And this is something that if you are if

25:41: you're analyzing the data with any kind

25:43: of agent, you want it to always know,

25:45: and so you can put it in the DataBot.md

25:48: file or the agents.md file, uh and it'll

25:51: load that at the start of every

25:52: conversation.

25:53: So, here like

25:56: I don't know, if there were some issue

25:57: in the data, we could put or we might

25:59: even just put general documentation for

26:01: this data set. This one is relatively

26:03: straightforward in like my playing

26:05: around with DataBot with this. It does a

26:08: pretty good job of understanding what's

26:09: going on, um but if it were more

26:11: complicated or like these column names

26:15: were inscrutable or something like that,

26:18: you could put,

26:19: you know,

26:20: data dictionary, more information on

26:22: what's going on, or like your goals for

26:25: your analysis, other things like that in

26:27: the file.

26:27: >> dictionary is a great idea. Um and

26:29: there's also a question from Marlene,

26:31: which is a fantastic question. I'm

26:33: surprised that we haven't hit it by this

26:35: like halfway mark already, which is like

26:37: this code isn't being saved anywhere.

26:39: So, like where does it go? What are you

26:41: What are you going to do with it? I know

26:42: that you can, and you're going to get

26:44: there.

26:45: But it's a fantastic question.

26:47: >> Um so,

26:50: the first thing is that

26:52: um

26:53: Oh.

26:54: It's not what I wanted to do. Uh

26:57: you can

26:58: look back at previous conversations.

27:01: So,

27:03: if you made a new conversation, I have a

27:04: bunch open here. Um but you can go back

27:07: um and look at previous conversations

27:09: that way. But you

27:13: um

27:14: can also write the code to a report. We

27:18: didn't do that much in this

27:19: conversation, but it'll still put

27:20: something in a report. Um

27:23: and I'll show you what happens when I

27:24: run this. Uh just like let's just say

27:28: summarize findings. You can also just

27:30: run this command by itself. Um and this

27:32: is a slash command, so you just do slash

27:34: report summarize findings.

27:38: >> Is there a way to know what all the

27:40: slash commands are?

27:41: >> Yes.

27:42: If you type

27:44: slash, they will come up. Um so, report

27:47: makes Quarto document. Notebook is going

27:49: to put it into a Jupyter notebook. Uh

27:51: instead of clicking the elephant, we

27:53: could have also done save memory. Uh and

27:54: then compact will compact the

27:56: conversation.

27:58: Okay.

28:00: So,

28:02: it made a Quarto report with our

28:03: findings. Um so, this is one way to save

28:06: the code. It probably put like more

28:07: information than we wanted in here. It

28:09: also wrote a bunch of prose, but it did

28:11: include at least some of the code that

28:13: we wrote. If we had done more

28:16: manipulations or exploration, um we

28:19: [clears throat] could have said like

28:20: specifically, you know, I want to

28:21: include these pieces of the analysis.

28:23: Please put them in the

28:25: in the QMD file. It did remember that um

28:28: because I asked it to fix the name, so

28:30: it did remember what it did there. Uh

28:33: and it it put that in the setup chunk,

28:35: which is nice. Um

28:39: Yeah.

28:40: Cool. And now we can edit this how we

28:43: wanted to.

28:46: Any questions about that? I think that

28:49: the only other question was from Anna

28:51: that said, "I would love for DataBot to

28:53: use the namespace operator, the double

28:55: colon, to specify which packages or

28:57: methods or functions

28:59: um things are coming from." And

29:02: in the chat we said, "That's something

29:03: we'll probably put in the DataBot.md

29:05: file." Does that sound right?

29:06: >> Yeah, that would be a good thing to put

29:08: in there. Yeah, I forgot to We didn't

29:10: open it after we created this. So, this

29:11: is what it looks like. Um it actually

29:14: put more in here than I thought it was

29:16: going to. Um

29:18: and let's see if it put

29:21: Okay, it did it did put up at the top,

29:23: "Always use read_csv." So, you could put

29:25: Yeah, please namespace functions um in

29:28: there. And

29:30: um this might be something that like you

29:32: generally have. Like it might not be

29:33: specific to your data. You might always

29:35: have, you know, a little bit of

29:37: instructions that you always put into

29:39: these kind of agent instruction files,

29:41: like always use these kind of functions,

29:43: always namespace, always use some

29:45: internal package that it wouldn't

29:47: necessarily know to use, that kind of

29:48: thing.

29:49: >> Yeah.

29:51: I mean, it would be always use skimmer

29:53: because that's what I do every single

29:55: time.

29:56: >> Cool. Yeah. Um

29:59: Okay. And yeah, I feel like I'm rushing

30:02: a little bit. So,

30:04: sorry, but I I there's other things that

30:06: I want to show you.

30:07: >> Yeah, let's go.

30:08: >> So,

30:09: uh

30:11: we can talk more about DataBot

30:13: in a bit, but I do want to just show you

30:15: Positron Assistant really quickly. So,

30:18: to open Positron Assistant, it's this

30:20: little robot icon in this

30:22: uh

30:23: in the taskbar over here.

30:25: And

30:27: let's make this bigger. Um

30:32: again, we have a model selection.

30:35: Um

30:36: it shows us that what kind of session we

30:38: have. Uh and it's the same kind of

30:41: thing, But it's it's a chat inside of

30:44: Positron.

30:45: One thing that Positron Assistant is

30:47: really useful for is debugging. So,

30:50: say

30:52: like

30:54: Let's say there was

30:57: uh

30:59: an error here.

31:03: Or like we need to name to this.

31:06: Like we must type the CSV name or

31:08: something.

31:09: Yeah.

31:14: So, this should fail.

31:16: Yeah. So, it fails and we could say like

31:20: like

31:23: the QMD didn't render.

31:26: Please fix.

31:27: Or something.

31:29: Um

31:30: I like the brevity. Please fix.

31:32: >> [laughter]

31:35: >> Uh and

31:37: Oh, it thinks.

31:40: Okay. So, and it correctly identified

31:42: the issue. So, like Data Bot, it has

31:44: access to kind of like all of the pieces

31:46: of information that it's going to need

31:48: to be helpful. It can see your

31:50: variables. It can see the console. It

31:53: can see your files. Um

31:56: And yeah, I have so many things open

31:58: right here. It's kind of hard to see.

32:00: Let's close some of these. Um

32:03: And it fixed the problem.

32:06: And for Positron Assistant, it has this

32:08: sort of interface where it shows you the

32:10: suggested change and you can keep or

32:12: undo it. So, I'm going to keep this.

32:15: Um and then

32:17: I guess yeah, it found some other things

32:19: it wanted to fix.

32:21: Um

32:21: and so, we can say that we want to keep

32:23: those.

32:26: Okay. And so, then

32:27: it invites us to try rendering again.

32:35: It still failed.

32:37: Okay.

32:40: There's some general issues in the code

32:42: that we could continue to ask it to fix

32:45: if we wanted to. Usually Data Bot does a

32:48: good better job of like just making a

32:50: QMD file with code that works, but we

32:52: didn't chat with it for very long.

32:55: So it might not have known like what to

32:56: put in here. But another thing that you

32:58: can do with Positron Assistant Which one

33:03: was the issue? This name doesn't exist.

33:06: Um

33:08: So you can do command I did command I

33:11: and it'll open this little inline

33:13: assistant thing and

33:16: let's see actually if we

33:18: like

33:22: did something like this.

33:24: Command I

33:25: um

33:26: Can you

33:28: fix the problem?

33:29: Uh

33:30: And it might have some suggestions for

33:32: you.

33:34: It

33:35: Yeah, it needs an it needs a equal sign.

33:38: Um so this is another way that you could

33:40: use Positron Assistant inside of

33:42: Positron.

33:44: >> And that was command I?

33:45: >> Command I, yeah, and it'll open

33:47: >> control I. Okay, cool.

33:49: >> in file editor.

33:51: Okay. Just want to make sure I didn't

33:55: >> The only other [clears throat] thing

33:56: that would be great to stick in here is

33:59: Louise's question, which was is there a

34:01: way to search within that Data Bot pane?

34:05: Um

34:07: >> Is there a way to search? I don't think

34:09: so.

34:10: >> Like a control F search? Right?

34:13: >> What happens if you do that?

34:16: >> Yeah, control F.

34:17: >> Oh, okay, it's just control F. Okay,

34:19: that works.

34:20: >> Good to know. Thank you for asking,

34:22: Louise.

34:23: >> [laughter]

34:23: >> Um okay. [clears throat]

34:25: Let's

34:27: see.

34:28: Uh okay.

34:31: Yeah, again one thing I want to point

34:33: out is that

34:35: like

34:36: DataBot specifically is geared towards

34:39: you still having quite a bit of control.

34:42: So, it

34:44: it could have just like done a bunch of

34:45: analysis behind the scenes and then

34:48: plopped it all in that quarto report,

34:50: but instead how DataBot works is you

34:52: sort of build up an understanding of the

34:54: of the data alongside of it. You're

34:57: keeping track of what's happening.

34:59: You're seeing the code. You're like

35:00: looking at these little summaries it

35:02: gives you and you're exploring the data

35:04: together and then you might put the

35:06: results in the QMD file. So, this was a

35:09: conscious choice. Like we want the human

35:11: to be

35:12: um keeping up with DataBot and for you

35:14: to be like iterating together.

35:17: Um

35:18: and

35:20: part of the reason is just so that like

35:23: you can, you know, assess whether or not

35:25: the analysis is correct, but it's also

35:28: because part of like again, like I said,

35:31: if you do EDA and at the end of it you

35:33: as the person have no idea what's going

35:35: on in the data, like you didn't really

35:37: do EDA and that probably wasn't that

35:39: helpful for you. There are uses where

35:40: you just need a, you know, report

35:43: output, but if your goal is to

35:44: understand the data, you need a tool

35:46: that is going to like, you know, allow

35:50: you to do that. Um

35:52: and part of the way that DataBot does

35:54: this is by showing you,

35:56: you know, less output at each turn and

35:58: then involving you with these

36:00: suggestions and showing you the code.

36:04: Okay.

36:06: Cool.

36:07: Um

36:09: let's see.

36:16: We I just want to

36:18: try to keep track of the time. Um

36:22: Okay, let's quickly go to Posit

36:25: Assistant, which is in our studio.

36:28: So, I'm going to

36:30: share this.

36:30: >> And this is like brand new. I've never

36:32: seen this before.

36:34: >> Where is the share?

36:38: >> [sighs]

36:38: >> One second.

36:40: >> Oh, it's okay. Zoom does strange things.

36:42: [laughter]

36:43: >> Um

36:47: Okay.

36:48: >> Also, I think it was Nick had asked in

36:50: the chat like how to turn off the inline

36:54: commands.

36:55: Um and I shared

36:57: editor.inlineSuggest.enabled

36:59: equals false

37:01: as a setting for settings.json.

37:03: That will turn off your inline

37:05: suggestions. I learned this from Jenny

37:07: Bryan. Uh because I like really get

37:09: disoriented by any inline suggestions at

37:12: all.

37:13: Um and then Isabel also shared a gist.

37:18: Hopefully those help everybody. And I

37:19: will put them if you're watching this

37:20: later, I'll put them in the description.

37:28: >> Okay.

37:30: I don't know where our QMD file went. Um

37:34: but I just want to really quickly show

37:36: this. So, this is Posit Assistant and

37:38: this is in our studio. Um and

37:42: you Currently it's under like it's in a

37:45: private beta. So, you can sign up for

37:47: this. Um but if you just download our

37:49: studio without access, you won't have

37:51: access to this. So, this is a bit of a

37:53: preview. Um but I just want to show

37:55: this. This is essentially like Positron

37:58: Assistant and Data Bot in one tool. So,

38:01: instead of having to switch back and

38:02: forth depending on the kind of task that

38:04: you're doing, it's all in this

38:07: in this chat here. So, you can do both

38:09: exploratory analysis and more like

38:12: coding focused tasks all in the same

38:14: thing. Um

38:16: So, just want to quick I'll quickly show

38:19: this. So, we can do the same thing where

38:22: we say like load the

38:24: um hallucination data.

38:28: Uh

38:30: and it is

38:33: using it

38:34: positive positive assistant will also

38:36: obey the data bot.md file. Um but you

38:38: can also just call this agents.md.

38:41: So

38:43: notice that it used read_csv like we

38:45: asked. Um and this looks very similar to

38:48: data bot um where we can use these

38:51: suggestions to explore the data. But you

38:53: can also do more like software

38:55: engineering type tasks within positive

38:57: assistant. So we might ask it we haven't

39:00: really done much with the data so this

39:02: might not work that well but we can ask

39:04: it to um make a shiny app

39:08: that

39:09: displays the data.

39:12: Um and instead of giving us this output

39:14: that looks like it's looking at the data

39:16: giving us the output giving us

39:17: suggestions

39:18: it's going to do something much more or

39:21: at least it should do something much

39:22: more autonomous where it is writing the

39:24: code um and just sort of going until it

39:26: completes the task which is what it's

39:28: supposed to do.

39:31: >> Have you noticed any like um

39:34: time differences with like how things

39:36: how quickly things run in R Studio

39:38: versus in Positron?

39:41: >> Um

39:42: >> I feel like they're about the same.

39:44: >> I it should be about it should be

39:46: it should be about the same um because

39:49: the models are the same. Now I'm using

39:50: Sonnet 4.5 when I was in Positron I was

39:52: using

39:53: >> Oh you were using Opus.

39:54: >> Um it wrote us an app.

40:00: I don't know where it is.

40:01: >> that app.

40:02: >> [laughter]

40:04: [gasps]

40:04: >> Um I think I might be on like

40:09: a weird branch or something. Um we could

40:12: ask it

40:13: can you just run that app?

40:16: I don't think this is a positive

40:18: assistant thing. I think

40:20: >> I like that you type out, can you just

40:22: the app, but it was smart enough to be

40:24: like, I'm going to run that app for you.

40:26: I need this in my life because I

40:27: frequently am going to type the wrong

40:29: thing.

40:33: >> Sarah, what happens if you open that URL

40:36: that it it mentions at the bottom in

40:38: your browser?

40:39: >> [clears throat]

40:42: >> Okay, it Here, I'll share this.

40:49: And Anna, you had asked

40:51: making sure you understand Posit

40:52: Assistant and Positron Assistant are

40:55: different.

40:56: >> Yes.

40:57: >> Yeah.

40:58: I know this Those names being similar

41:00: are confusing. The former is a

41:02: combination of Positron Assistant and

41:04: Databot. Databot, yes. So, Posit

41:06: Assistant

41:08: is a combination of Positron Assistant

41:10: and Databot in our studio.

41:12: >> Yes.

41:12: >> Yeah.

41:13: >> Yeah, and it is you have to sign up for

41:15: the private beta at this point to get

41:17: access to it. Um, which is I think

41:19: Libby, you shared the link at the start.

41:21: >> Isabella did, yeah.

41:22: >> For Isabella. Yeah. Um, okay. So, it did

41:25: it did make I'm not like going to claim

41:27: this is, you know, the best app of all

41:29: time and if I'd given it more

41:30: instructions, it probably would have

41:31: done a better job, but it did just go

41:34: off and successfully make a shiny app

41:37: that we can now continue to iterate on,

41:39: um, which is pretty cool.

41:41: >> Yeah, it

41:42: >> Just Just display the data.

41:44: >> Yep. Yeah. And I think like doing this

41:48: kind of task is a good example of a like

41:53: uh, a task that you generally are okay

41:56: with an AI assistant doing more

41:58: autonomously, um,

42:01: versus something like exploratory data

42:03: analysis where you need to sort of be

42:05: involved frequently so that you can

42:08: understand your data. I'm okay with like

42:10: if I know what I want to go into the

42:11: shiny app, I'm generally okay with posit

42:13: assistant or something similar to just

42:15: go and take what I know about the data

42:18: and put it into a shiny app relatively

42:20: autonomously.

42:22: Um

42:22: one reason is that like

42:24: it is easy to verify for both computers

42:27: and humans if the shiny app is working.

42:30: Um

42:31: so I can just look at this and

42:33: see immediately if this is what I want

42:35: and then go back to the assistant if I

42:37: want adjustments and the LLM or like the

42:41: assistant itself can also tell if the

42:43: code is broken um and then fix it like

42:46: while it's running the app for the first

42:48: time

42:50: uh or like if it produces an error and

42:52: then I ask it to fix something. So it's

42:54: easy to generally easy to verify if it's

42:57: working. Whereas something like a data

42:59: analysis where it it's often harder to

43:02: tell

43:04: for the LLM or for you as the person

43:06: quickly if it is done correctly. So you

43:08: often need more human involvement.

43:11: Okay.

43:12: >> There is it is okay. Um

43:15: maybe we can show it in data bot. There

43:17: is a question about like what is the

43:18: typical token burn rate? Uh is there a

43:21: way to check how much how many tokens

43:24: you've used in this particular session?

43:28: >> And Renato had shared in the chat as

43:30: well that a quick test yesterday with

43:33: just basic output um was

43:36: you know, a certain number of tokens and

43:38: it was about 6 cents which I think is a

43:40: good little interesting data point.

43:42: Thank you for sharing Renato.

43:44: >> Yeah. Um

43:47: I know there's a how do you see do you

43:48: remember how to see the token usage in

43:51: data bot?

43:52: I know how to do it in posit assistant,

43:54: Simon.

43:56: There is a way.

43:57: >> if it's like only shown inside of posit

44:00: assistant or something. I'm surprised

44:02: not to see it.

44:02: >> Yeah, I think there's a way but I

44:05: have

44:05: >> I remember it being in like the bottom

44:07: right.

44:08: >> Got it.

44:11: Not a slash command.

44:13: No.

44:17: You can in positive assistant. I I don't

44:19: want to like reshare because it takes a

44:21: couple minutes, but there's a little bar

44:24: there's a little like token counter bar

44:26: in the bottom right hand corner of

44:27: positive assistant that shows you how

44:29: many tokens you've used and then you can

44:31: click on it for more information.

44:33: >> Okay.

44:33: >> I'm pretty sure there's a there what is

44:34: it or was a way to see it in data bot,

44:36: but I'm

44:37: >> [clears throat]

44:38: >> I will I will I can get back to you all.

44:41: Um

44:42: Okay.

44:43: Um let me see. I know we're kind of

44:45: short on time.

44:47: >> We have 10 more minutes.

44:48: >> Yes. Let me

44:50: Let me try to

44:51: >> And don't worry about time.

44:52: >> We have hands down.

44:54: >> We're all about asking questions and

44:56: figuring stuff out, so it's wonderful

44:57: that we've been able to do that. Okay.

45:00: Well, the three things

45:02: that I wanted to cover is first I just

45:04: want to talk a little bit more about

45:05: like what kinds of

45:07: tasks that

45:09: you might want to do with AI and what

45:11: kind of things you might not want to.

45:13: And then someone had asked about a

45:14: skill, so we can show that. And then um

45:18: Simon or or I will show the reviewer

45:22: tool.

45:23: So, I think we can probably do that in

45:24: 10 minutes.

45:25: >> Let's [laughter] do it.

45:26: >> Um so, okay. Let's

45:30: >> It's okay to share the file.

45:30: >> I just quickly I just want to say like

45:34: we talked a little bit about

45:36: verification [clears throat]

45:37: of ta- of like um

45:40: task completion or task correctness. So,

45:43: I'd say like generally if you are

45:45: working on some kind of analysis

45:48: one thing that you might want to ask

45:49: yourself is like can you verify it or

45:51: like how will you know if it is correct?

45:53: If you're doing something

45:55: with AI and you have no clear answer for

45:58: how you would tell if it's correct or

46:00: not, you might want to be wary of using

46:02: it. So, an example is like uh

46:06: like uh

46:08: analysis where you don't understand if

46:11: the code is or if the data is correct or

46:14: not. Um

46:16: and you're asking the LLM to like tell

46:18: you if the data is correct. It's not

46:20: going to know that because it does

46:21: unless it has access to tons and tons of

46:23: context. Um

46:26: and so you might want to be wary or just

46:28: like use something with more human

46:30: involvement.

46:32: Um and then

46:34: the other thing couple other things you

46:36: might want to ask yourself is also like

46:37: how much does this thing matter? If it

46:38: is very important and hard to verify,

46:41: you might not want to use AI or be wary

46:43: or cautious um or you know, go over the

46:47: the results carefully.

46:50: And then the other final thing is like

46:52: our current LLMs good at this type of

46:54: task? Generally, they are very good at

46:56: you know, pure coding

46:59: tasks for most purposes um

47:02: but they are worse at something. So,

47:04: like if you are doing some kind of task,

47:06: you should have a general sense of if

47:08: LLMs are good at that or not. And they

47:10: are really good at some things and less

47:11: good at others um and so it's not sort

47:14: of a blanket like they are bad at all of

47:15: data science or they are good at all of

47:17: data science. They are good at, you

47:18: know, sort of

47:20: different types of tasks um or different

47:22: areas.

47:24: Okay.

47:28: Cool. And so

47:29: because of that, one thing that is

47:31: important are either providing

47:34: guardrails for the assistant or for um

47:39: adding additional information

47:41: through customization. So, we already

47:42: saw one way that you can do that by

47:45: creating this MD file for the agent with

47:49: more information. So, you can use this

47:50: to

47:51: give the give data bot give positive

47:54: assistant way more information about

47:56: your data than it would otherwise have,

47:58: which can help prevent it from like

48:01: uh you know

48:03: hallucinating column names that don't

48:05: exist or um using a column that you

48:09: don't want it to use. You know, you

48:10: might have data where there's two

48:11: columns that kind of do the same thing.

48:13: You only want it to use one. This kind

48:15: of information could go in the

48:17: databot.md file

48:19: and could save you from creating an

48:22: analysis that is incorrect. The other

48:24: thing is that um

48:26: if it's possible to add like determinism

48:29: in this sort of largely

48:31: non-deterministic process, that can be

48:33: really helpful and one way to do that is

48:35: through a skill. So, we only have 5

48:37: minutes, um but you can add skills for

48:41: databot and for positive assistant.

48:44: And

48:46: hopefully there is a skill creator

48:49: skill.

48:50: So, this is a skill that helps you

48:51: create other skills. So, um

48:56: the the example I was going to I was

48:58: going to use the other data for, but

48:59: let's see if it'll work here. So, um

49:04: see like

49:05: use the

49:08: And you just need to kind of mention the

49:10: skill name or like allude to it for it

49:12: to know that it should do that.

49:16: Create a skill that creates so meta a

49:20: specific

49:22: type of table. Um

49:24: so, I

49:26: we were going to make a table and then

49:28: like create a skill for that, but this

49:30: should work. So, notice that it has this

49:32: little output thing that says skill

49:35: create skill. So, this is it is using

49:36: the create skill skill to make a skill.

49:39: Um and it has some questions for me.

49:43: Uh

49:47: >> [laughter]

49:48: >> Um we'll see if it does. Okay, now it

49:51: needs more information. I just wanted to

49:52: make it.

49:53: Um

49:55: we didn't give it enough information.

50:00: Okay, so now it is it thinks it has

50:02: enough information. If you were really

50:04: doing this, you would probably want to

50:05: be much clearer with it about what you

50:07: wanted it to do, but I just wanted it to

50:09: start the process so I can show you

50:10: where they go. It's going to put this in

50:12: dot positive AI {slash} skills.

50:15: Um and after it works for a little bit,

50:17: it's going to come up with a markdown

50:18: file that specifies the skill. It's

50:20: going to be like a bit of code um and

50:23: some information about it. And then in

50:24: the future when I want to create this

50:26: type of table, I just reference it by

50:29: name and it will always use that

50:31: information to make the table. So this

50:33: is really helpful if you want like if

50:35: you always make a certain type of

50:36: formatted table or you have to for some

50:38: reason,

50:39: put that in a skill so you don't have to

50:41: provide it with that context every time

50:44: that you you talk to it.

50:46: Did that make sense? I know that was

50:47: very

50:49: brief. The important thing to remember

50:50: is that there is a skill creator skill

50:52: that can help you.

50:55: I love it. Very meta.

50:57: >> Okay.

50:57: >> Okay, um

50:59: so now

51:01: did you want to did you want to share

51:04: your screen for a viewer or you want me

51:05: to just

51:06: keep going since I'm

51:08: here?

51:09: Simon.

51:10: >> Yeah, I'd say keep at it.

51:12: >> Okay. Um

51:14: so

51:16: this last example that I want to show

51:18: you, this is a package

51:20: Let's close with these. This is a

51:21: package called reviewer and what this

51:23: does is help you review code from like a

51:27: tidy perspective

51:30: um or like a good R code perspective. Um

51:33: and so

51:34: Simon made this package um

51:36: one reason I wanted to show it is that

51:38: it's cool and useful, but also it's a

51:40: good example of something where the you

51:43: as the human have more control over

51:46: how you are using the LLM suggestions um

51:49: then if you are using an agent that just

51:51: goes and works very autonomously. So,

51:53: let's see how this works. This is a

51:56: sample script that has some issues in

51:57: it.

51:59: And if we do

52:02: um

52:03: reviewer review and then we pass it the

52:06: file path

52:09: to the script

52:12: it should open but you can't see it.

52:21: One second.

52:24: It's okay. Switch.

52:26: Elevator music.

52:27: >> Yeah.

52:28: >> Here we go. We gave it some time to

52:30: think anyway. Um and it gives you

52:33: suggestions in the side for um

52:37: things that would be like bad for

52:39: reproducibility, just bad code style, um

52:42: you know, sort of tidy conventions. And

52:45: then you can either accept or reject

52:47: them.

52:48: So, like this script had used set WD, it

52:52: didn't like that. Um it mixed different

52:54: types of pipes. And then it's only going

52:57: to look at sort of chunks of the script

52:59: at a time and

53:01: and then it will give you more

53:02: suggestions that you can accept or

53:04: reject.

53:05: Um so, this is nice

53:07: like

53:09: if you want to sort of learn various

53:12: conventions, you might use this um cuz

53:15: you kind of have to read the suggestion

53:16: before accepting it versus like the LLM

53:19: just going off and making a bunch of

53:20: edits for you um and that like you never

53:23: saw the process.

53:25: >> This is very cool. So, reviewer, the

53:27: reviewer package. And is this um

53:29: on CRAN and working in both Posit Ron

53:32: and RStudio?

53:35: >> So, do you want to talk about it?

53:37: >> Sure. We have 1 minute left.

53:38: >> Yeah, yeah. So, the current status on

53:40: this project um I just put like a few

53:43: hours into it and ended up feeling

53:44: pretty unsure about how useful this idea

53:48: was. And, um, and so since then I

53:51: haven't put much more time into the

53:53: idea, but if people feel like this is an

53:55: interface that they would

53:57: find useful, I would definitely be, um,

54:00: be into the idea of trying to

54:02: fix a bunch of bugs and, um, push this

54:05: further and, uh,

54:06: send a PR in as well. So, do let me know

54:09: if you think this is, uh, an idea that

54:11: you're interested in.

54:13: >> Fantastic. I think that this is really

54:15: interesting if you want to go look at

54:17: Reviewer and test it. I think this would

54:20: be a really interesting thing if

54:21: teachers could put their preferences

54:23: inside of it to like replicate so

54:25: students could get like a pseudo review

54:26: from their professor.

54:28: Uh, I think that'd be super cool. All

54:30: right, well, we have reached the top of

54:31: the hour. We have lots of interest about

54:33: Reviewer in the chat, though. Thank you

54:35: so much, Sarah and Simon, for coming and

54:38: hanging out with us.

54:40: All right, everybody. Goodbye. We'll see

54:42: you next week.

54:43: >> Thanks.
