---
type: Video Transcript
title: "Data dictionaries, parquet, & Claude | Hadley Wickham | Data Science Lab"
description: "I am joined today by our lab manager Hedley."
resource: "https://www.youtube.com/watch?v=jVqArueBFqA"
tags: ["ds-lab", "r-packages", "quarto", "github", "python"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T21:59:18Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=jVqArueBFqA"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2026-06-23T00:00:00Z"
    usage_count: 5307
usage_window: { from: "2026-06-23T00:00:00Z", to: "2026-09-08T21:59:18Z" }
---

# Transcript

00:07: I am joined today by our lab manager

00:09: Hedley. Welcome. Hedley, would you

00:11: introduce yourself?

00:13: Hi everyone. I'm Hedley.

00:15: I make our packages and do our stuff.

00:19: Hedley makes our packages and does our

00:21: stuff. And today, Hedley is going to be

00:24: talking about the combination of data

00:27: dictionaries, Cloud,

00:30: Parquet files,

00:32: in order to help us make our data

00:34: sensible to not only human beings, but

00:37: also to machines. Hedley, will you give

00:39: us a a little rundown and then feel free

00:42: to share your screen and jump right in.

00:45: Okay, I'm going to share my screen.

00:48: And we will all help Hedley know whether

00:49: or not it's too small. So, hop in the

00:52: Discord and let us know if something is

00:56: too tiny to see.

00:59: Okay. And I made a couple of very short

01:01: notes before we get into it, just to

01:03: remind me what we're talking about.

01:06: And

01:08: basically, I since the

01:11: the last data lab that I came on,

01:15: I kind of realized if you're going to be

01:17: using

01:18: AI agents to help you do data analysis,

01:21: you need to write down what you know

01:24: about the data so that AI agents can be

01:28: as helpful as possible.

01:32: Uh

01:33: of course, in some sense, like you

01:34: should always have been doing this

01:36: because your human colleagues also

01:38: benefit from this information, but

01:42: for some reason, some unfortunate quirk

01:45: of human psychology, it seems to be much

01:47: more motivating to write this stuff down

01:50: for non-humans than for humans.

01:53: So, I've been thinking about this idea

01:55: of data dictionaries, certainly not a

01:58: new idea, but

02:01: uh I'm going to show you a little

02:03: spec, pretty lightweight spec for data

02:05: dictionaries that I've been working on,

02:07: and a workflow that I find like super

02:09: compelling, where you have three files,

02:12: a data cleaning script, a data

02:15: dictionary, and your final cleaned data,

02:18: and you

02:20: mostly edit them using Quarto code. And

02:23: I think this combination just feels

02:25: really, really cool to me. And I should

02:27: say

02:28: Posit,

02:29: cuz that is super important.

02:32: And I'm going to be showing you these

02:33: tools today in Positron

02:36: with Quarto code and with a Quarto code

02:40: tool called MCP repo,

02:43: uh which is the below. I'll hopefully

02:45: drop a link in the chat. Uh so, MCP repo

02:48: is an open-source tool developed by my

02:51: colleague Tomasz. It basically allows

02:54: any um

02:58: any AI tool to run a persistent R or

03:01: Python session, so it can run data

03:04: analysis code for you.

03:08: You can also do this using RStudio and

03:11: Posit AI, Posit Connect, or Positron and

03:14: Posit AI and Posit Connect and other

03:16: tools,

03:17: uh and get very similar results.

03:20: I am just playing around with this one

03:23: at the moment, so do not read anything

03:25: particular into my use of tools. This is

03:28: just one of my experiments, trying

03:30: different tools, and seeing how they

03:32: feel and how they should inform the

03:34: design of

03:36: uh future tools.

03:38: Okay, real really quickly, since you

03:39: mentioned MCP, can you talk a little bit

03:41: about what that is? Nora had asked in

03:42: the chat. Uh MCP,

03:46: I can't remember what it stands for.

03:48: Even if I did, it's uh useless acronym,

03:50: cuz it doesn't really explain what it

03:52: does. Yeah, it's model contact protocol.

03:55: Yeah, it's basically a way of giving AI

03:59: agents access to new tools to do things.

04:02: New

04:03: um

04:05: I don't know, like MCP service can kind

04:06: of do anything. So, in this case, we're

04:09: going to be using them to run our code.

04:12: So, this is just this is just kind of a

04:13: general like extension or plug-in system

04:16: for uh AI coding tools, and we're using

04:20: this MCP repo, which works for R and

04:22: Python.

04:24: I'll go over this in that shortly.

04:27: And what I'm going to be doing is I'm

04:30: going to be working with this data set

04:31: called elevators

04:33: that my colleague Emil gave to me cuz he

04:36: really likes it cuz it's a fun data set.

04:38: We're going to start with a CSV file

04:41: with basically no knowledge about what's

04:44: going on in this file, and kind of over

04:47: the course of the next hour or so, sort

04:49: of build up some knowledge and write all

04:51: that down and hopefully come up with a

04:53: cleaner data set at the end of it.

04:57: And so, I'm going to kick this off by

04:59: asking Claude write me a cleaner R

05:02: script to read elevators.csv

05:07: and save a parquet file.

05:12: So,

05:13: uh if you don't know what a parquet file

05:15: is, you should learn about them because

05:18: they are basically like a CSV file, but

05:21: basically better in every single

05:23: possible way. They're smaller, they're

05:25: faster.

05:27: Uh you don't have to worry about

05:28: different types and different missing

05:29: values. You can read them into every

05:32: single programming language you can

05:33: imagine.

05:36: So,

05:38: I've done that, and Claude is doing

05:40: something. Okay,

05:42: and it's come up with this clean.R

05:45: script.

05:47: Wow, that's really

05:52: Wow, okay. It's really gone all out

05:55: there

05:56: and done a bunch of stuff that I didn't

05:58: want and that didn't do

06:00: 30 minutes ago when I tried this out.

06:02: So, I'm going to tell it to hey hey ramp

06:05: it back or

06:07: just uh yeah, never mind.

06:12: So, I want us to start just as simply as

06:14: possible. Yeah, okay. That is what I'm

06:16: looking for.

06:18: Uh why has it chosen to skip that first

06:21: line?

06:22: I do not know. And I'm just going to

06:24: delete that. Okay.

06:27: So, I can run that code and now I get a

06:30: parquet file. Positron has a built-in

06:32: parquet file viewer, which makes it

06:34: easier to explore.

06:36: Okay. So,

06:38: you know, you probably could have

06:39: written this code faster by yourself

06:42: than with thought code, especially given

06:44: that it gave us a bunch of crap we

06:45: didn't want. But, uh that is life

06:48: working with AI. So, what we're going to

06:51: do next is we're going to describe this

06:53: data set in a data dictionary.

06:56: And

06:57: uh I think we're just going to dive into

06:59: that. I'm going to tell Claude

07:03: to go read

07:06: read this.

07:08: Oops.

07:09: Read that.

07:12: And while I show you what I just told

07:15: Claude to read,

07:18: which is this the spec. So, a data

07:20: dictionary

07:21: uh or the data dictionary format that

07:23: I've come up with is just a YAML file.

07:25: And it will will kind of see it very

07:27: shortly. It's easier to understand uh

07:29: with a concrete example, but it's

07:31: basically going to describe all your

07:33: tables, the fields inside those tables,

07:36: relationships between those tables, and

07:39: the any kind of domain-specific

07:41: terminology that you might want. So,

07:43: let's see. It's

07:45: read it.

07:47: Okay, and

07:50: Please make me a spec and

07:53: a data dictionary

07:56: using

07:58: what you know as NYC elevators.

08:02: And certainly, Claude knows a lot more

08:05: about elevators than I do. So,

08:08: hopefully, it'll

08:10: at least guess at what some of these

08:12: possibly cryptic

08:15: variable names actually do. Well, okay,

08:17: I think I can figure out what house

08:18: number is and what street name.

08:20: Uh but what was device type and last

08:22: parent's birth date, etc., etc.

08:26: So, it's going to do it's going to use

08:28: write a lot of our code. I guess I can

08:30: press control uh

08:32: O and see what's happening. This is the

08:34: one of the downsides of using this

08:35: approach rather than using positive

08:37: assistant is it's just going to slap it

08:40: all together.

08:42: Uh

08:44: and it's very hard for me to see what

08:46: it's doing. Okay, it's

08:48: Wow, it's really hard to read this

08:50: without new lines. But it's basically

08:51: looking at the variables and um just

08:54: tabulating them.

08:56: So, we'll give it a few seconds there

08:59: and if there's any questions, now would

09:02: be a great time to ask.

09:03: >> Yeah, well, it's cooking. Um Nitebecco

09:06: asked, are there any cases where the CSV

09:09: format is actually a better choice than

09:11: parquet or like are we just defaulting

09:13: to parquet is better all the time? I

09:14: think though the the kind of two related

09:17: downsides of parquet files is that they

09:20: are not text files. So, that means you

09:23: can't just open them in a text file and

09:25: easily look and see what's going on. You

09:27: can't easily And that means you can't

09:29: easily see them on GitHub and you can't

09:31: easily look at diffs. But by and large,

09:34: like looking at large files in this way

09:38: anyway is not so great. So, I think

09:41: that's a relatively minor downside.

09:44: The Positron has a parquet viewer which

09:46: makes it

09:47: a lot easier.

09:49: Exactly. We also had a question about

09:51: your

09:52: pipes being rendered as triangles. So, I

09:54: told them in the chat it's because

09:56: Hadley's using a a font with ligatures,

09:57: but I figured I'd ask you what font you

09:59: use.

10:00: Uh

10:03: Is it Fira?

10:04: I feel like everyone loves Fira, but

10:06: every time I assume that it's not. Mono

10:08: space neon.

10:11: This is the

10:14: um

10:15: a font that GitHub made.

10:17: Okay. And I guess I have selected a

10:19: bunch of ligatures. I have no

10:21: recollection of doing that, but uh

10:23: >> [laughter]

10:23: >> I must have clearly clearly

10:25: uh set that up.

10:27: Okay, so here's my data dictionary.

10:29: Uh okay, what's in it? Every elevator,

10:32: escalator, dumbwaiter, and related

10:33: conveyance device. One rope per device.

10:37: Uh

10:41: Okay, what fields? DV device number.

10:45: Uh DOB device identifier. I've got some

10:49: information. So, I should say yes, like

10:51: this. So,

10:54: this data set has one table called

10:56: elevators. That table has a bunch of

10:59: columns. Each column has a name

11:02: and a type. This is a string. We've got

11:05: some information about constraints.

11:07: Maybe it's a primary key or it can never

11:09: contain missing values, a description,

11:12: and then some examples. So, we include

11:15: the data dictionary includes examples

11:17: because that's super useful for humans

11:19: and it's super duper

11:20: super duper useful for LLMs as well.

11:25: Okay, and we've got device status. This

11:27: is an enum or like a factor.

11:30: It has these five possible values which

11:32: mean these five possible things. So, I'm

11:34: not going to go through all of the

11:36: variables in detail, but you can kind of

11:38: see like this is a great place

11:42: to record what you learn about the data

11:44: set.

11:45: And what I'm going to do now because I

11:49: want to see how this changes over time,

11:51: I'm going to just return get on and I'm

11:53: just going to say first select.

11:58: Because I lied earlier. And we do

12:01: actually have a little bit of context

12:03: about this data set. There's this readme

12:05: file that comes with the original data

12:07: set that points out a few things. So,

12:11: like

12:13: zip code is frequently listed as a

12:14: nine-digit zip plus four.

12:17: So, what I want to do now

12:19: is

12:22: take that help toward of uh

12:25: here's some extra context that I am

12:29: update

12:31: in the data dictionary.

12:35: And again, I'm going to try and use an

12:37: LLM like I do normally, which is I just

12:41: kind of press my fingers on the keys in

12:43: approximately the correct order and hope

12:47: that the LLM just figures it out. So, uh

12:51: I'm not going to I'm going to try not to

12:52: worry about spelling mistakes even

12:54: though I'm presenting to you cuz that's

12:55: not what I do when I'm working by

12:57: myself.

12:59: So, again, we'll collect that quick for

13:01: a little bit if you've got any more

13:02: questions. We did have one question

13:05: about parquet files. And just so

13:07: everybody knows, we are having a whole

13:09: episode on parquet files in June with

13:11: Nick Crane, so we can deep dive then. Um

13:14: but the question was, are there any

13:15: examples applications that output um

13:19: parquet files or scientific

13:21: instrumentation that outputs to parquet?

13:24: Not that I know of. It's been a little

13:26: at this parquet files are mostly used by

13:29: kind of big data engineering tools. They

13:32: power like snowflake and data bricks.

13:36: You can use them with DuckDB. Less

13:39: common in science, I think, and in open

13:42: source data science, but these these

13:44: files are like really really good.

13:48: They're super duper fast. They compress

13:51: really well.

13:53: So, I strongly advise you learning them

13:56: using them, particularly if you're doing

13:58: any data cleaning, I think it's a really

14:00: good idea to save the results as

14:02: parquet.

14:03: Okay, cool. And then Saptarishi had

14:05: asked, what is a good way to store data

14:08: dictionaries along with data sets? And I

14:10: think that the answer is probably what

14:11: we're doing right now. Exactly. So,

14:14: again, I think you should be putting

14:16: these in a plain text format. You can

14:19: use my data dictionary not YAML format.

14:22: I'm kind of I'm reasonably confident

14:26: this is a useful format. And I'm going

14:29: to keep working on it and make some more

14:30: tools so you can easily turn this into a

14:32: beautiful website, validate your data

14:34: based on the spec, all that sort of

14:36: stuff. But currently, just kind of

14:37: learning about it and trying it out and

14:39: seeing what's happening.

14:41: Okay, and we have

14:43: a question from Nathan also that says,

14:45: is this particular data dict.yaml format

14:48: specification useful for projects with

14:51: only one table of data? Yes, and this

14:54: indeed is one this project only has one

14:57: table of data, and I think we'll see,

14:59: hopefully as we go along, that it is

15:01: useful.

15:02: I think so.

15:04: So, now we're just going to take a look

15:05: at the diff of the data dict.yaml and

15:07: see what information it has. Okay, we've

15:10: got a point-in-time snapshot, not a live

15:12: feed. Well, that's kind of obvious.

15:15: Um

15:16: So, seven So, this is interesting. Seven

15:18: test rows carry the literal street name

15:21: dummy record and should be filtered out

15:23: for analysis. So that's going to be

15:24: something like like let's fix let's fix

15:27: that

15:28: shortly.

15:29: So now we've at least got all of this

15:31: information from that read me and now

15:34: we've encoded it in the same place.

15:37: And so I'm not going to go I'm just

15:38: going to skim this. We've got some

15:41: information like okay this variable is

15:43: really inconsistent, you know, be

15:46: careful when you're using this. All of

15:48: this is like super

15:50: super useful information if you're going

15:52: to be analyzing this data set.

15:54: What else have we got down the bottom?

15:57: Okay, approximate longitude and zero

15:59: zero. Okay, so I'm going to say update

16:03: everything in

16:05: our um

16:08: Um okay.

16:10: So now what I want to do next is start

16:13: like diving into this data dictionary

16:15: and fixing some of those issues. So I'm

16:18: going to say okay

16:20: remove the dummy records

16:26: updating clean data

16:28: everything in

16:29: clean data parquet file.

16:34: So we're just going to now iterate like

16:36: let's make this data cleaner. So I'm

16:39: going to ask law to update those three

16:41: things. It's going to update my data

16:43: cleaning script. It's going to put the

16:45: results in the data dictionary and then

16:48: it's going to run my R code to create an

16:50: updated parquet file and then we'll look

16:53: at that in

16:55: the source code

16:57: and see what it's done.

17:00: So it has added a line

17:02: to strip out all of the street names

17:05: and then

17:07: Okay, it's

17:10: updated there. I'm just going to delete

17:12: this.

17:17: And don't think that's not important.

17:21: It's removed the seven test rows.

17:24: It's removed that later in the

17:26: data dictionary as well.

17:29: Okay. So, now I can check that in.

17:32: Remove that new record. And so, I think

17:34: like one of the things that's really

17:35: nice about having these three files in

17:37: concert is it's pretty easy for me to

17:41: check that Claude's done the right

17:42: thing, right? Cuz I'm seeing it's

17:43: updated my cleaning script and it's

17:45: updated the data dictionary.

17:49: Becca had a question along that line,

17:51: which was, is Claude also going to

17:52: decide when it's a good time to make a

17:54: commit?

17:56: Uh actually, well, let's try that out

17:58: next time cuz we can you can do that. I

18:01: don't always do that, but yes, you can

18:03: also tell it to commit. So, let's go

18:06: back to that

18:08: uh address.

18:10: street

18:12: name cuz I just noticed this, white

18:14: space is not normalized and may contain

18:17: multiple internal spaces. So, okay,

18:19: let's say normalize

18:22: the white space and street

18:27: I like the typo in normalize because

18:29: it's very much what I would be doing.

18:32: Claude figures it out, man.

18:34: The other thing that's nice is like I

18:35: don't have to uh like I didn't hold down

18:37: the shift key to type street underscore

18:40: name. Right. Uh so,

18:43: Okay. So, again, what's it done?

18:47: It's updated my cleaning script.

18:50: It's using Gsub to remove multiple

18:53: sequences of spaces with a single space

18:55: and it's trimming the white space on

18:57: either end. It updates the dictionary.

19:00: I'm just going to not really care.

19:03: I'm just going to delete that comment

19:05: because I don't think you need to record

19:08: that sort of information in the data

19:09: dictionary when it's recorded in your

19:11: clean.R. Um

19:14: done that

19:16: and now I can say commit it.

19:20: And

19:22: we'll see what Claude does.

19:25: It's going to look at the current good

19:27: status. It's going to look at the get

19:30: log. I'm not sure why it's doing this.

19:33: I'm just going to say what did I what

19:36: did it do? Add normalized treatment what

19:38: to do. So, okay. Sounds good.

19:41: So much trust.

19:44: We have a couple of questions. Do you

19:45: want to fit some in right now while it's

19:46: while it's cooking? Yep.

19:48: Um okay. So, Brian had asked if we see

19:51: if somebody scrolls way up, they'll see.

19:53: Um Brian said, "Is there a way that the

19:54: YAML format data dictionary could be

19:57: used as an input? For example,

19:59: recode_values, which is the new dplyr

20:02: function."

20:03: Yes. Uh

20:05: probably not with recode values

20:07: literally, but I think there's various

20:10: things that you can't that parquet files

20:13: don't store very well. One of those

20:15: things in particular is labels.

20:18: Uh statisticians and data scientists

20:20: love labeled values. Uh parquet files

20:24: have no way to kind of add additional

20:26: nice long labels to short information.

20:29: So, I'm imagining at some point

20:31: uh there will be an R package to

20:33: accompany this file that will read that

20:35: read in your parquet file, read in the

20:37: data dictionary, and apply the labels.

20:40: Awesome.

20:42: So, what else should we do?

20:45: Uh

20:47: Do do do do do. Let's just kind of look

20:49: through.

20:51: Uh

20:54: And right now, just to

20:56: point out that we're working in a

20:57: working tree of our data.

21:00: data dict.yaml. It's hard for me to say.

21:03: Um we are hoping to have an episode on

21:06: working trees.

21:07: Hopefully in June, maybe. Isabelle and I

21:10: have not pinned down a date yet.

21:12: But we hope to be able to give you a

21:14: whole episode on working trees soon.

21:18: Especially because that's the way that

21:19: Claude works all the time, and I have

21:20: found myself lately being like, "Gosh, I

21:22: wish I knew more about working trees

21:24: since I am now working in them kind of

21:25: all the time."

21:28: Okay, now I'm going to make a slightly

21:30: dubious decision, and I'm going to say

21:33: like looking at the zip code, like

21:36: frequently stored, I'm just going to say

21:38: like let's just make this all five-digit

21:40: zip codes.

21:42: Oh, no, actually I don't like that. Like

21:44: let's let's get rid of

21:46: I mean this is treat non-five-digit

21:49: values as dirty.

21:50: And it's also says frequently stored as

21:53: a nine-digit zip. Okay, let's just tell

21:55: me tell me about the sizes of zip codes.

22:02: I mean sizes are a bit underspecified,

22:05: so we'll see. So it's going to like read

22:07: that parquet file into R, it's going to

22:09: like presumably do table on the number

22:12: of characters.

22:13: Uh and then it's going to tell me about

22:16: that, and that's going to kind of

22:19: Okay.

22:28: So they are most of 82% of them are nine

22:31: digits. So let's not let's

22:34: um

22:34: Is it storing it as a number?

22:38: Yeah, we're just

22:39: >> Anna and I agree, they should be

22:40: strings. You're not going to do any math

22:42: on a zip code. Yes. Okay, so let's let's

22:45: do that. Okay, so make that a string and

22:49: replace zero with

22:52: and

22:54: remove all missing values.

23:01: So again, you're going to imagine it's

23:02: to update that uh clean.R, it's going to

23:04: update my data dictionary, and it's

23:07: going to update the parquet file. And

23:09: again, I just love this process cuz it

23:11: makes it so clear like what's happening

23:13: in every step. And then you can go back

23:16: in your Git history and just see exactly

23:18: what you've done. Okay, so it's changed

23:20: it to a string.

23:22: Usually a nine-digit

23:27: 7% uh I'm not going to say clean.

23:31: I'm going to say

23:34: 80%

23:35: uh nine digits equals four.

23:40: And again, I don't care about that.

23:44: And we've got a few nice example values.

23:47: I'll look at my clean.R.

23:51: Okay, it converted it to character.

23:53: Okay, that looks good.

23:57: And now I'm going to talk to Kamina.

24:00: All right, do we have time for some

24:02: questions?

24:03: Sure. Go ahead. Andreas asked, "Does MCP

24:07: REPL work on a Windows machine and can

24:10: one use other AI LLM, for example,

24:13: ChatGPT with it?"

24:15: Yes, it does work on Windows and Linux.

24:19: And I should say one of the the things

24:22: that I didn't say about MCP REPL that is

24:25: really important is that it runs all of

24:27: your code in a sandbox. And so, inside

24:30: that sandbox, it can't uh

24:33: connect to anything over the network,

24:35: and it can't look at any files outside

24:37: of the current working directory. So,

24:39: that's one of the advantages of MCP REPL

24:42: is it allows you to run arbitrary R code

24:44: in a way that's like that's pretty safe.

24:47: And it's using this like operating

24:49: system level sandboxes, so there's no

24:51: way for bad R code to get out and do

24:54: naughty things. So, this gives you like,

24:57: you know, typically like an LLM is not

25:00: just going to generate like ran-

25:01: randomly generate really malicious code,

25:03: but this just gives you this nice layer

25:05: of protec- protection ensuring that it

25:08: can't do anything outside of the

25:10: directory you're actively working in.

25:13: Awesome.

25:16: Okay, so and this is just so another

25:18: thing I know that I've looked at in here

25:20: is

25:24: like stored and how we pass I don't

25:26: think we

25:28: I don't know.

25:29: Actually, let's look at the parquet

25:30: file.

25:35: Let's look at last

25:39: What's this?

25:41: Make this a little wider.

25:45: Well, like last inspect date

25:49: is currently stored as a number. That's

25:52: not good.

25:53: Yeah, DB

25:54: >> last per inspect date is a string.

25:59: That's also not good. And DB approval

26:02: date is

26:05: also a string. Okay, so let's fix that.

26:08: Uh

26:09: Make sure you parse all the date columns

26:13: as dates.

26:21: So, this is like a good example where

26:23: like the data dictionary is actually

26:24: wrong. Like it says it's a date, but

26:26: it's not actually recorded as a date in

26:28: the file. Like this is this is typical,

26:30: right? An LLM is not perfect. It's going

26:32: to make mistakes. The goal is to create

26:36: a process by which over time you

26:38: discover those mistakes and fix them and

26:41: the whole thing gets better and you can

26:42: see exactly what's going on.

26:46: So, now

26:49: again, we look at our get diff. Like get

26:52: and get is like such an important piece

26:54: of this because I can see exactly what

26:56: the LLM has done at each point.

27:00: Uh it's used the for loop certainly. We

27:02: can I don't know if this is the way I

27:04: would have written this code, but it's

27:05: taking a very low-level base R approach

27:08: here.

27:11: But I kind of don't really care because

27:14: I didn't have to write that code.

27:15: All right. Well, while we're

27:17: whatchamacalliting,

27:19: uh really quickly, Jenna Jordan had

27:21: asked, "Do you see a meaningful

27:22: distinction between data dicts and data

27:23: contracts?"

27:27: That is a very good question.

27:31: I had initially thought of like data

27:34: dictionaries and kind of data validation

27:38: or data contracts as being like very

27:40: distinct.

27:42: But as I have worked on this, I think

27:45: they are actually the

27:47: very closely related. And kind of one of

27:51: my next steps is to start building out a

27:53: tool so you can take a data dictionary

27:56: and compare it to

27:58: a

28:00: um

28:01: compare it to a data file and discover

28:02: if there are any inconsistencies.

28:05: So, I think that the data dictionary

28:06: does actually end up specifying a lot of

28:08: information that you want in a contract.

28:11: And so, while here I'm like focusing on

28:13: the cleaning, I think you could also

28:15: like have written down a data or come up

28:17: with a data dictionary some other way

28:19: and now you're using it to check that uh

28:22: the data the data that you get is is

28:24: good.

28:26: Perfect. Okay.

28:27: Let's uh just quickly look at this and

28:29: we'll come back to that idea because one

28:31: thing I think we should record, one

28:33: thing we want to record on this data is

28:35: for like dates and numbers, like we will

28:37: should have the range here so we can at

28:39: a see at a glance see what are the the

28:41: valid values.

28:43: So, let's just see what we have done.

28:46: Again looking at get. Okay, we saw that.

28:49: It's dropping that. No longer integers.

28:54: So,

28:57: Okay, getting easier to understand.

28:58: Okay, then we'll just say

29:01: uh

29:01: add row states to

29:03: the base.

29:05: Again here, I'm like it's I think it's

29:07: faster for me.

29:09: I don't know. Maybe not. And maybe my

29:11: commit commit messages aren't as good,

29:13: but it's certainly faster to

29:15: uh type that than to ask war to do it.

29:18: So, let's just go back to and just ask

29:20: it I'm going to ask it to add ranges to

29:23: on numeric and state columns.

29:30: And while that happens, we can uh

29:32: do another question if you've got one

29:34: queued up.

29:35: We have plenty. Darren had asked, "I'm

29:38: curious how Hadley views his approach to

29:40: data dictionaries and the development of

29:43: pointblank."

29:46: Yeah, that's an interesting question.

29:48: Um,

29:49: closely like yeah, like as data

29:52: dictionaries as I kind of realized they

29:55: do more validation, I'm like, "Oh yeah,

29:56: okay, I need to think about what this

29:58: means." With respect to pointblank, like

30:01: obviously there's a lot in this data

30:03: dictionary that like pointblank does not

30:06: concern itself with. Pointblank does not

30:08: help you describe what the variables

30:10: mean or give you examples to look at.

30:13: But if we start thinking about this as a

30:15: validation framework, obviously there's

30:17: going to be a lot of overlap.

30:20: And I need to like think about that and

30:23: think about how this is work going to

30:25: work. Because I also want to make sure

30:26: this data dictionary like as

30:29: you know, as you may have seen with like

30:31: various recent work at posit, we're

30:33: trying to trying to help like all data

30:35: scientists, not just data scientists who

30:37: who use I use R. How do we help data

30:39: scientists who use Python? How do we

30:41: help data scientists use SQL? And so

30:44: like if I turn this into a data

30:46: validation tool, I don't want it to just

30:48: work with R and Python. I want it to

30:51: work if you've got an up a parquet file

30:53: and a data dictionary, we should be able

30:55: to line them up and and check them.

30:57: Um so that

30:59: maybe means like redoing a bunch of the

31:02: work in point blank. Maybe it means

31:04: reusing point blank in some way. I don't

31:07: yet know the answer to that, but uh

31:09: That's really what I'm thinking like

31:10: maybe pointing point blank towards the

31:13: data dict.yaml

31:14: and saying like hey you use this as your

31:17: source of truth.

31:18: I don't know enough about point blank

31:20: for that to make sense, but that's all

31:22: right. All right, fantastic questions

31:23: from everybody and if we could

31:26: do one more while we're sort of in this

31:28: data dict area, Colin had asked data

31:31: dict.yaml looks a lot um

31:34: like a JSON schema. So can a data dict

31:37: be converted to a JSON schema for

31:39: validation and an ability to leverage

31:40: that tool suite? Very much in the same

31:42: zone.

31:43: Yeah, I I mean we that that would be one

31:46: way to approach validating it. Again, I

31:48: think I

31:50: I would rather do something custom that

31:52: works directly with this YAML. There are

31:54: there are various ways of doing YAML

31:56: specifications.

31:58: Uh and the reason I chose YAML here

32:00: rather than JSON is that I am this is

32:02: something that I imagine humans are

32:03: going to be editing as well and um this

32:08: is much easier. YAML is much easier to

32:11: edit uh compared to JSON files.

32:15: >> [laughter]

32:16: >> So much easier.

32:18: All right, let's keep going. We are 34

32:21: minutes in, so we have plenty of time.

32:24: Okay, so I've recorded a few ranges now.

32:26: I think this is kind of useful.

32:28: Uh

32:29: I recorded

32:31: ranges in the data dictionary.

32:33: And this brings up uh

32:37: you

32:37: committing and then my diff goes away.

32:40: Um place all the

32:43: Okay, we've got a bunch of different

32:45: placeholders in different columns. So,

32:49: let's eliminate all the placeholder

32:52: values

32:54: and and use proper missing values. As

32:58: you can see, it's a very very common

33:00: exercise when you uh converting data

33:03: collected by a non-data scientist who

33:07: don't really have those idea of a

33:08: missing value. They often use

33:09: placeholder or sentinel values. Like,

33:12: let's let's fix that and use proper

33:14: missing values. So, if we do counts or

33:16: means, we get the correct thing without

33:19: these without having to constant

33:20: remember, "Oh, in column seven,

33:23: uh a missing value is actually recorded

33:25: as a zero. So, make sure you remove all

33:27: the zeros before you compute a mean."

33:32: So, again, that data see that data

33:34: dictionary kind of updating.

33:37: Let's see

33:39: what it's done. Look, so listen this

33:40: this is beautiful. We've got at least

33:42: three different Oh, okay. We've got

33:44: zero, 10,000, star star, dash dash dash

33:48: dash, and zero all used to represent

33:51: missing values in various places.

33:54: Uh

33:57: I feel like that's a really

33:59: excellent use of of cloud is

34:03: tell me what all these

34:05: disparate missing values are in all

34:07: these different variables.

34:10: Yeah, and and fix it for me. Like, Yeah.

34:13: Like,

34:14: that's That's I remember that's one of

34:16: the hardest things when I first started

34:18: in data was like, I'd read my own data

34:20: file in and I couldn't get anywhere

34:22: because of all of the different

34:25: and completely unique missing values

34:27: that were used for all these different

34:28: things.

34:30: And cloud And this just makes it so

34:31: fast. Like, you don't need to have all

34:34: of the code to do this at the top of

34:36: your head. Like Claude can generate it

34:39: and then you can, you know, still super

34:41: super important that you're reading this

34:43: code. Because like you want to check

34:46: that it's doing the right thing, but

34:48: much much faster cuz you don't have to

34:49: type all of that up by hand.

34:51: >> Those ligature left assignment arrows

34:54: are so are so cute. Okay, we have time

34:57: for one more question

34:59: um from and it says so in this case the

35:02: parquet file is checked into get. Is

35:04: that more advisable when working with

35:06: LLMs? Like normally I've heard to avoid

35:08: checking data into get. Uh it's really

35:11: more about the size of the data I think.

35:14: Like if you can commit the data into

35:17: get, it just makes the rest of your life

35:19: like so much easier cuz that data is now

35:21: versioned along with all of your code.

35:24: Um

35:25: And this data happens to be public

35:27: non-private Exactly.

35:29: >> non-sensitive too. So that that's an

35:31: aspect of this. Right. So I I think like

35:33: that if you can like I think my advice

35:35: is if you can commit it to get, you

35:37: should commit to get cuz it's going to

35:39: make everything it's going to make it

35:41: easier to see the like how the data has

35:43: changed over time. You can roll back to

35:45: previous versions, all of those really

35:47: nice features of using get. Lots of

35:49: cases where you can't use get, you know,

35:51: you can't put the data into get, it's

35:52: too big, it's confidential, you know,

35:55: lots of reasons. You know, this workflow

35:57: still works there.

35:58: Uh you'll still have that clean.csv,

36:01: you'll still have that data dictionary,

36:02: you just don't won't have the parquet

36:03: file checked in.

36:06: Awesome.

36:11: Okay.

36:15: We have some comments in the chat too

36:17: from people talking about their

36:19: considerations for checking data into

36:21: get. So thank you everybody who's adding

36:22: their expertise here.

36:25: Um Connor had also asked a great which

36:28: is, can you show off a diff of a parquet

36:31: file and what that looks like?

36:34: Yes.

36:38: Uh-oh.

36:40: So, this is the down This is the one of

36:42: those downsides of parquet files I

36:44: mentioned how you can't easily diff

36:46: them.

36:47: Um, I guess

36:49: I've never clicked this before, but

36:51: let's

36:53: You hit the open anyway button. Yeah.

36:56: Uh

36:58: I don't know. Okay, yeah, I was Woah.

37:01: Yeah, so it's that's not going to be

37:03: useful. Definitely not visually.

37:07: Feels like something that like that is

37:09: something that, you know, we could fix

37:11: or the Positron team could fix. Um, like

37:14: maybe I should at least drop a message

37:17: in our Slack channel and be like, "Hey,

37:20: have we thought about this?" It would be

37:21: pretty slick.

37:25: Okay.

37:26: Do you want to do more questions or you

37:27: want to

37:29: No, I think that we are good on

37:31: questions. I think that that was the

37:33: last one

37:34: for right now.

37:36: Somebody can remind me in the chat if I

37:37: have somehow skipped over your question.

37:39: I'm so sorry.

37:41: Okay, so this is interesting.

37:45: Um, we've got a classic weird uh scroll

37:47: problem.

37:50: Uh,

37:51: okay.

37:54: I just asked like, "What else could I

37:55: do? Hmm, I don't really like this. Can

37:57: we make this numeric?"

38:04: We could

38:06: fix the obviously wrong geocodes. Some

38:09: of them are in Pennsylvania.

38:11: Uh

38:13: This is kind of interesting. Like this

38:15: is a thing where

38:17: I'd be like, "Okay, yeah, like yes, we

38:19: could use a latitude and longitude

38:21: bounding box to zoom in on New York

38:23: City. I would have zero clue what those

38:25: are. I would have relatively little I

38:29: don't know whether you should trust this

38:30: or not, but uh

38:33: Uh we could look at that.

38:36: Uh

38:37: Actually, let's do that one. Like like

38:39: let's let's look at the

38:44: Start by writing the map

38:49: uh

38:51: And I'm just going to do that. Like I

38:53: wanted to What I'm hoping it will do is

38:57: create a plot

38:58: of all of the

39:01: latitudes and longitudes just because

39:03: I've given it enough context to to say

39:06: that I want a map in the file name and

39:07: we'll see uh

39:10: see what that does.

39:20: Okay, it's doing some Oh, interesting.

39:22: So, it's decided to look at uh New York

39:26: City zip code prefixes.

39:29: That's interesting.

39:31: And then it's going to

39:34: So, it is it's actually sort of

39:36: interesting.

39:40: Like it has actually run that code and

39:42: looked at the plot, but we can't see the

39:43: plot. So, I'm just going to source this

39:46: in uh R Studio and then um Positron,

39:49: sorry,

39:50: and look at that.

39:52: And that is like pretty obvious that

39:55: something is wrong with those. Like

39:57: there's some ones that are way outside.

40:00: So,

40:02: yeah, drop

40:04: uh points that are

40:06: obviously

40:08: out of

40:08: range.

40:16: Again, if you're doing this for a real

40:17: analysis, you'd want to be thinking a

40:19: little bit more. Okay, it's updated my

40:21: map.

40:22: Uh, which is

40:23: fine. Let's just we can run that.

40:29: Okay, that looks more like New York

40:32: City.

40:34: I think at least for my not terribly

40:36: amazing knowledge of New York City.

40:40: It's

40:41: Now, I wanted to like

40:44: like last night.

40:47: And that uh

40:51: >> [laughter]

40:52: >> Just so you know, if you're not looking

40:53: at the chat, Hadley.

40:55: Uh, we currently have a

40:58: a vote going on on how much this vibe

41:00: session is going to cost, but we have no

41:02: idea if you're going to be able to tell

41:04: us at the end what the token cost is.

41:09: Ask. Let's see.

41:13: All right, {slash} cost for everybody

41:15: who is

41:16: paying attention to what Hadley is

41:18: typing into Claude here.

41:25: And it looks like while we are seasoning

41:28: on that {slash} cost, we do have a

41:29: question

41:31: um that I think I missed. Um Andreas

41:33: brought it to light for me. Let's see.

41:36: The question was Oh, I just scrolled

41:39: away from it. Andreas, thank you for

41:41: helping me get there. Um Jeff said, "I'm

41:44: curious to know how much this hour of

41:46: using Claude code will cost. Can we get

41:48: an update at the end?" Oh, the same

41:49: question that we were just on. Okay,

41:50: great.

41:51: >> [laughter]

41:52: >> Yeah, we'll get back.

41:54: Yes, we did it.

41:58: Well, that's dumb. I cannot tell you

41:59: that because I'm using my Claude card

42:01: subscription.

42:03: Aha. Well, David had also asked an

42:06: easier one, which model is Hadley using?

42:12: {slash} model

42:14: They are it's Opus 4.7.

42:18: With its 1 million context window.

42:22: And I will say like I

42:26: >> [sighs]

42:27: >> I'm trying to think how to put this like

42:30: I

42:31: I guess I don't care about money.

42:34: Like I get like like whatever like if it

42:37: saves me a minute or two and it costs me

42:40: like $5 like I don't care. I am not a

42:42: cost-conscious consumer

42:45: of LLMs and I 100% accept that it's

42:48: coming from a place of privilege. But I

42:52: do think for like what we're doing here

42:54: I suspect like that there are cheaper

42:56: models that would do almost as well and

42:59: bring substantially bring the cost down.

43:02: But

43:04: that

43:05: I don't care about that because

43:08: I have little money I have little time

43:11: and a lot of money so I optimize I

43:13: optimize for that.

43:16: We will forgive you.

43:18: So let's just let's oops

43:21: close that. Plot down just see what

43:22: we've done.

43:24: I think we all want Hadley to

43:26: use whatever he has to use to develop

43:28: all of the cool things that we get to

43:30: use. Slightly different use case.

43:33: Russ says thumbs up.

43:35: Um

43:36: and then Connor had asked a question in

43:37: the chat that I didn't understand. What

43:39: CRS is it using to determine what

43:41: coordinates are inside New York?

43:44: Connor what is

43:46: what is CRS?

43:47: >> system. Coordinate reference system.

43:49: >> I don't know I don't care but I trust

43:52: that plot. So again if you're doing a

43:54: real analysis you would want to figure

43:56: that out but

43:58: I'm guessing that Claude has enough

44:00: knowledge to know the location of New

44:02: York City and based on what I saw on

44:04: that map it looks looks pretty good to

44:06: me.

44:06: I will show you one other thing I saw

44:08: that this kind of related.

44:12: When you up there my brother asked to

44:14: add a map

44:16: of elevators around Central Park.

44:21: Cuz this was kind of interesting and I

44:23: spent a little bit of time looking at

44:25: this previously. And again, this is

44:28: something that like this would be so

44:30: tedious to do by hand and I will see how

44:34: well Claude actually she does here, but

44:37: like it probably knows the approximate

44:39: latitude and longitude of Central Park

44:41: and it can

44:43: figure that out and update this code and

44:51: Okay. I'm definitely showing my

44:54: lack of knowledge for spatial analysis

44:56: here. So thank you for everybody who's

44:57: adding context about CRS in the chat.

45:01: I have no idea why I decided to put a

45:03: dark green rectangle there. That seems

45:05: pretty pointless,

45:07: but

45:08: this yeah, I did this earlier and this

45:10: is kind of interesting.

45:12: Right? Like

45:15: So what's this elevator like right in

45:18: the middle of Central Park?

45:20: So let's ask what's

45:25: When you pull out the rows of the

45:29: elevators that are insulated

45:37: Let's see, you can park

45:39: Oh yeah, you

45:41: The bounding box is clearly totally

45:43: wrong because it's square. So Claude

45:46: just messed that up. Elevators

45:50: inside the buildings inside the park.

45:51: The Met, the Delacorte, the Boat House,

45:54: the Tavern on the Green. Like I'm

45:56: skeptical

45:58: about this. I'm pretty sure that's the

45:59: Met there. That's a Metropolitan Museum

46:02: of Art. That I'm sure that has

46:04: elevators, but this one like right in

46:05: the middle.

46:07: Oh, and now we're in now we've gone into

46:09: cool uh

46:11: Uh-oh, what is that? [laughter] cool

46:12: gibberish mode.

46:14: Um we are summoning the ancients now.

46:17: >> [laughter]

46:18: >> Um Connor, thank you in the chat for

46:20: giving us some more context. Sirius is

46:23: how we know how to plot coordinates on

46:24: the Earth adjusting for the fact that

46:26: the Earth is not flat.

46:29: Okay, uh we had a question

46:32: which I will scroll up to from Nelly

46:34: that says, "Is there a way to quantify

46:36: environmental and electrical costs? Like

46:39: not ones that affect one's personal

46:40: finances, but still have an effect on

46:43: the world?" That is a very hard

46:45: question, I think.

46:47: Yes.

46:49: Yes, uh

46:51: that is uh yeah, I think it is it is

46:54: important to be worried about the

46:57: environmental aspects of LLMs.

47:01: I

47:05: Yeah, like for me, like for my usage of

47:08: LLMs personally, I am reasonably certain

47:12: that they are uh pretty small

47:16: uh proportion of my overall impact on

47:20: the environment.

47:22: And so what that means is like if I want

47:25: to do good for the environment, then the

47:28: place to start is not to decrease my LLM

47:30: usage. It's to like

47:32: fly less um or you know, we have a solar

47:36: we have electric cars and solar powered

47:38: roof. So, those are the things like I

47:40: you know, I really believe in climate

47:43: change and we should all be doing things

47:45: to try and make the environment better

47:46: individually. Um and so if you want to

47:49: do that, I think the way to do that is

47:51: not to decrease your LLM usage, but to

47:53: look for other things.

47:55: But then at like obviously a societal

47:57: level, like individually uh it might not

48:00: be a um

48:02: a big use, but um

48:06: across some lands of people it adds up

48:08: to be a big impact. And now I'm like out

48:11: here like writing tools to make LLMs

48:13: easier to use. Like how do I

48:16: um kind of

48:18: square that with caring about the

48:20: environment?

48:21: Uh I

48:23: >> Nelly has a good point, which I I think

48:25: about a lot. Nelly says there's

48:26: certainly a difference between people

48:28: making AI slop videos on mass and people

48:32: making code to do research.

48:34: Um

48:35: and I I think about that a lot with like

48:37: the number of

48:39: extremely wealthy people who are flying

48:41: private jets places that they don't

48:43: really need to be flying private jets

48:44: places, kind of back and forth all over

48:46: the place. Um

48:48: And if it helps, I am offsetting all of

48:50: our carbon footprints by never leaving

48:51: my house.

48:52: Okay.

48:54: We have cooked and I think that I think

48:57: that Claude has

48:59: completed something, but I'm not sure.

49:04: Uh yeah, I think. Oh, it says no

49:07: elevators are genuinely located inside

49:09: Central Park.

49:11: That's what Nora was asking. Is this

49:12: supposed to be Central Park?

49:14: Yes, I think so.

49:16: And so it's by I think

49:19: Yeah, I mean this is now I'm like how

49:21: could I specify that that is that one

49:24: point I really care about? And I don't.

49:34: Because Central Park is definitely

49:37: a big rectangle on the map. Yes. Um we

49:41: know that. And skimming this, it is not

49:44: located this point.

49:46: Um

49:48: I mean

49:49: uh

49:51: Like this is the this is the type of

49:53: case where you just want to be like uh

49:55: let me select that point.

49:57: Um

49:59: and I don't know how to do that. So, we

50:02: will just

50:04: Uh okay, actually maybe what if I just

50:06: did um

50:09: give

50:12: Jared is saying we need GG plotly.

50:14: >> [laughter]

50:15: >> Uh yeah, what is this?

50:18: Five closest elevator and give it a

50:21: centroid.

50:26: Colin says, can we remake the map with

50:28: an interactive library?

50:30: We could. I'm not I'm not going to

50:32: listen to this a bit of a Well, we'll

50:34: see how far it goes.

50:35: >> diverging from our main topic?

50:37: >> a little bit from data dictionaries, but

50:40: uh

50:43: Okay, so

50:45: interesting. So, now we could pull out

50:47: this device, but that's

50:50: That's the mid, though.

50:54: I don't know. I don't know. That's a

50:55: mystery. That that is like a mystery

50:58: that uh

51:00: we should uh

51:02: It is also it's possible that this is

51:05: like again these are escalators and

51:06: tumble waiters, so maybe

51:09: there's a restaurant there with a I

51:11: don't

51:11: >> Oh, you know, Jared says if the

51:13: coordinates are 40.7 by -73.9,

51:18: it could be the NYPD Central Park

51:20: Precinct.

51:21: Interesting. And looking at on the

51:25: on the just eyeballing the coordinates,

51:27: that could be it.

51:29: Let's just try one more thing.

51:31: Let's see if I can get on a leaflet map.

51:34: I'm I'm I'm basically worried about

51:36: doing any of these interactive things

51:37: cuz it's like maybe thousands of points

51:39: there. Maybe they'll

51:44: We have a few people who are native

51:46: NYC folks in the chat that are helping

51:49: us out a little bit here.

51:52: Okay, this is where it's geocoded to and

51:54: it is a freight elevator and the address

51:57: is 1000 5th Avenue. So, I think

52:02: there is a geocoding mistake.

52:05: I do not believe there is an elevator

52:09: in the Great Lawn or somewhere near it.

52:12: I guess it could be the New York Central

52:14: Park Precinct, but given that the

52:16: address

52:18: Let's just pull this out.

52:20: And now we could now like now let's just

52:23: do

52:26: Yeah, Dan says that point is the middle

52:28: of the Great Lawn or a reservoir.

52:30: >> [laughter]

52:30: >> Uh, must have seen Now, this is the

52:32: downside of using an

52:35: an AI for everything. I didn't even know

52:37: what the name of that variable is. So,

52:39: let's go to my data dictionary.

52:44: Let's look at So many elevator

52:46: conspiracies in the chat now.

52:48: >> [laughter]

52:52: >> What?

53:01: Oh.

53:05: Okay. Here we go.

53:07: Uh, I don't know if you can

53:08: >> have to tell it which filter to use?

53:11: I should have learned it.

53:12: >> Okay.

53:13: So, we can see

53:15: Yeah, 1000 5th Avenue.

53:17: It's a freight elevator.

53:20: I don't know if there's anything else

53:21: there that really tells us anything, but

53:24: uh,

53:24: I'm just going to say that is a bad

53:26: geocoding.

53:30: Although, that does make me see this is

53:31: a weird

53:33: dot dot dot 27.

53:41: What? Okay, let's just say wrong.

53:52: So clearly there's a column that's

53:53: interesting there's a column in the data

53:55: frame that's not in the data dictionary.

53:58: Um

53:59: and again this is where you really want

54:01: like a tool to be double-checking them

54:03: so that they all in this list likely to

54:04: make mistakes because you've got that as

54:06: the data in the data dictionary all

54:08: aligned. Um

54:12: Like it was never like

54:14: It was never documented.

54:16: That one.

54:20: This is where we have to jump in with uh

54:23: our last question that is unanswered

54:25: which is Marcos asking, "How do you know

54:28: this is actually faster or more

54:29: productive than just writing the code?"

54:33: Like the the back and forth seems like

54:35: it's

54:36: a lot.

54:38: Yeah. Yeah, I think that's a good

54:40: question and like or like is it faster

54:43: or is it just is it does it take the

54:45: same amount of time but it's just

54:46: different work?

54:48: Uh

54:50: I don't know. I kind of feel like I

54:54: could have probably written this code

54:56: fairly quickly. Like like this is legit.

54:58: This is legitimate time saving. Like I

55:00: would have to go and do some research to

55:02: find that out.

55:03: Um

55:06: but

55:07: yeah, I don't know. Like I think if I

55:09: was less familiar with R code this would

55:11: have taken me longer to write but as

55:13: long as you can kind of read R code and

55:15: interpret it and you can be fairly

55:18: you know, I think you don't need a

55:19: particularly sophisticated understanding

55:21: of R code to be able to read this and

55:23: verify that it's doing what you wanted.

55:25: So I think like the on the on the whole

55:28: like this is much faster. It's also been

55:30: much

55:31: slower cuz I'm explaining everything I'm

55:34: doing to you all and answering

55:35: questions.

55:36: So why like do think it's faster. I

55:38: don't think it's like 10 times faster.

55:40: It's not faster for everything, but you

55:42: also don't

55:44: Like you don't have to use it when it's

55:46: slower. Like you can still do all of

55:47: this by hand. I think it's still a

55:49: useful workflow.

55:51: Um but that that that whole idea of

55:53: keeping these three files in sync, I

55:55: think is really powerful

55:57: and really useful. And I, you know, if

56:01: you have more feedback about this, I'd

56:04: like love to hear about it because this

56:06: is something that I am going to be

56:08: working on more and over the coming

56:11: weeks and and months. Yeah. Well, I I

56:13: will say Rachel and I have been talking

56:14: about having a data science hangout all

56:17: about these like existential

56:20: AI questions um

56:22: with some positive AI brains. And so

56:25: look forward to that, I think, in the

56:27: future. Be a great space to have these

56:29: kind of conversations and talk about

56:31: this stuff out loud. Um and then also as

56:33: an update,

56:34: Dan Chen put a link in the chat

56:38: to a Gizmodo article about an artificial

56:41: cave beneath Central Park and that maybe

56:44: that is a maintenance elevator.

56:47: The The The conspiracy continues.

56:56: Because during inside the article,

56:59: elevator is mentioned three times.

57:01: Like there is definitely somebody riding

57:04: an elevator beneath Central Park.

57:07: I guess the other thing we could do

57:09: actually is if we go back to that

57:11: code.

57:13: See, you thought you were coming to

57:16: learn about data dictionaries, but

57:17: actually we have 1 minute left till the

57:19: top of the hour and we are solving a

57:22: conspiracy theory about the elevator in

57:24: the middle of Central Park.

57:28: Yeah, this is the official elevator data

57:30: where this came from? Yeah, like no

57:35: real information. I'm going to assume

57:37: 1000 5th Avenue is yeah.

57:40: The Met. The Met.

57:43: All right. Well, I have to end us. I

57:45: have to stop us from what we're doing

57:47: and we have to to move on but I really

57:49: really hope that today was useful for

57:52: everybody that you learned a lot about

57:54: this sort of collaborative work process

57:57: that I think for Hardly is still like a

57:59: work in progress us a little bit.

58:01: of refining um and we would love to hear

58:04: the ways that you are doing all of this

58:06: stuff and the way that you're

58:06: implementing. That actually that is not

58:08: the Met. That's the Museum Museum of

58:10: Natural History. So there we go. Which

58:13: is probably where my cousin is right

58:14: now. She's a volunteer at the American

58:16: Museum of Natural History. Waving to my

58:18: cousin. All right, everybody. This was

58:20: fantastic. I had a great time. I hope

58:22: that you did too. We got every single

58:24: question answered.

58:26: All right, everybody. Say goodbye. Thank

58:29: you. Thanks.
