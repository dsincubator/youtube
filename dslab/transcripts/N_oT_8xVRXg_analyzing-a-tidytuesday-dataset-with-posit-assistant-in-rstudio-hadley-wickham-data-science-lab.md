---
type: Video Transcript
title: "Analyzing a TidyTuesday dataset with Posit Assistant in RStudio | Hadley Wickham | Data Science Lab"
description: "I am so excited to announce our lab leader today is Hadley Wickham."
resource: "https://www.youtube.com/watch?v=N_oT_8xVRXg"
tags: ["ds-lab", "permissions", "r-packages"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T21:59:18Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=N_oT_8xVRXg"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2026-03-20T00:00:00Z"
    usage_count: 3700
usage_window: { from: "2026-03-20T00:00:00Z", to: "2026-09-08T21:59:18Z" }
---

# Transcript

00:07: All right, let's go ahead and get

00:08: started. I am so excited to announce our

00:10: lab leader today is Hadley Wickham.

00:12: Hadley, would you like to introduce

00:13: yourself really quick?

00:15: Hi, I'm Hadley.

00:17: I'm chief scientist at Posit and I make

00:19: R packages.

00:22: Hadley makes R packages. Big deal. Okay,

00:24: so Hadley, what are you going to be

00:25: doing with us today and would you like

00:27: to go ahead and share your screen?

00:29: So, I'm going to do

00:32: a live analysis

00:35: of this week's Tidy Tuesday data, which

00:40: I suspect was influenced by this

00:43: event.

00:45: Slight suspicion. Can everybody tell

00:47: Hadley if his R Studio screen is big

00:50: enough cuz it's pretty small to me?

00:54: Help me out, y'all.

00:58: Tim says he has zero ideas for conf

00:59: talks these days. Are you conf talked

01:01: out, Tim?

01:04: Yeah, a little bigger won't hurt. So,

01:06: let's go just slightly larger and we'll

01:07: be good.

01:09: Okay, I did make it one bigger, so Yeah,

01:10: we're good. We're good.

01:13: Cool. So, and I'm going to be using,

01:15: unusually for me, R Studio to do this

01:18: because

01:19: I'm going to be

01:21: sort of demoing slash trying out Posit

01:24: Assistant because uh this is something

01:26: that a bunch of folks at Posit have been

01:28: working on recently and I want uh to

01:32: kick the tires and see how it goes.

01:34: But

01:35: uh

01:36: I think what I want to show you a lot of

01:38: this this many of these ideas are going

01:40: to apply like regardless of what AI

01:43: Assistant you use, but uh we're going to

01:46: give it a go and uh see how it goes.

01:49: And so, you'll notice uh the way I'm

01:50: going to start is I have this agents.md

01:53: file. So, this is

01:56: uh uh

01:57: file that's going to be used by most

01:59: coding agent. It's going to be loaded

02:01: automatically. So, this is a good place

02:03: to put things

02:05: uh that you want to apply in your

02:06: analysis. And so, I'm going to put one

02:08: thing that I know is going to come up um

02:11: which is used uh

02:13: Manoa okay

02:16: package for reading parquet files. So,

02:19: it looks like

02:20: parquet

02:21: files.

02:25: Uh I'll talk about what a parquet file

02:27: is in a little bit if you haven't heard

02:28: of them. And then

02:30: uh I also promised Gen Z, so please do

02:34: hear that Gen Z.

02:37: And emoji, so we'll see how that goes.

02:42: Okay, now I'm just going to quickly jump

02:45: over to the Tidy Tuesday. And to get

02:48: started, I mean there's lots of

02:49: automated ways to get this data, but I'm

02:52: just going to say, "Hey Posit AI, can

02:55: you please download the data from here

02:59: and save it as parquet

03:02: and create a data dictionary

03:07: and

03:08: save it in

03:09: agents.md?"

03:14: Let's see how it goes.

03:16: Okay, so I'm going to give it

03:18: permission.

03:19: Uh so, Posit AI has a pretty uh

03:22: conservative permission model. It's not

03:24: going to read anything from the web the

03:25: web without your um

03:28: explicit permission.

03:30: But, it's tried something that didn't

03:32: work. It's going to try something else.

03:35: Now, it's got it. And again, it's going

03:36: to ask me to run uh code to if it's okay

03:40: to run R code. That's kind of why we're

03:42: here today, so I'm just going to say,

03:44: "Go for it."

03:46: So, you can see it's running a bunch of

03:47: code. What's it doing? It's in the

03:50: tidyverse. It read that CSV file. It's

03:52: just going to take a quick look at it

03:54: and make sure.

03:57: And then, it's going to save it as a

03:59: parquet file. So, you can now see I've

04:01: got NZ agriculture parquet.

04:05: And then, it's going to create a data

04:07: dictionary. Again, asking if I can edit

04:10: this file and I'm going to say, "Go for

04:12: it."

04:18: Uh it's not doing that great. Let's not

04:21: doing a great job of giving me Gen Z.

04:24: Okay, the data set is low key

04:25: interesting. Okay.

04:27: Got agriculture production stats from

04:29: New Zealand going to turn 25 with NZ

04:31: farm areas.

04:33: Okay.

04:35: So

04:37: oops.

04:38: You might wonder why I used a parquet

04:40: file. Do we have any way to do a quick

04:42: show of hands, Libby?

04:44: Yeah, everybody can everybody can raise

04:47: their hand in their

04:49: Well, actually maybe not in Zoom. People

04:52: should have reactions.

04:53: >> Yeah, maybe a reaction?

04:55: Yeah, there are quick Let's do a quick

04:57: uh thumbs up or raise your hand if uh

05:00: you you've you've heard of parquet files

05:02: before or used them before.

05:05: I'm seeing lots of raised hands. Okay,

05:08: quite a few.

05:09: So, I will say I've never used one. I've

05:12: heard of them, obviously, but nope.

05:14: So, I'd say like I think parquet files

05:16: are superior to CSV files in just about

05:19: every possible way except for one and

05:21: that's you can't open it in a text

05:23: editor and look. And that's because it's

05:25: a binary file format, which makes it

05:27: much smaller and generally much faster.

05:30: And the other big advantage of CSV files

05:32: is that CSV files don't really have

05:35: types of columns. Like you can kind of

05:37: figure out if it's a number or a string,

05:40: but there's no real way to record like

05:41: it's a date or a date time or a factor.

05:44: And parquet files have all of that. So,

05:46: that So, what I do now whenever I'm

05:48: doing a data analysis, the first thing I

05:50: do is create a parquet file because I

05:52: know in every subsequent step of the

05:54: analysis, I'm going to read that in and

05:56: I know as a parquet file, it's going to

05:58: read it in really quickly and it's going

06:01: to have all of the correct column types.

06:03: So, my factors are going to stay as

06:04: factors, my dates are going to stay as

06:06: dates, my date times are going to stay

06:07: as date times. So, really recommend

06:09: doing this. Also great if you're

06:11: collaborating with anyone using any

06:13: other language. Uh every language has

06:16: tools for reading parquet files. Python,

06:18: you can easily stick them into DuckDB

06:21: database.

06:23: Okay, so I've got my parquet file. I

06:26: have got a little data dictionary and

06:28: again, this agents.md file, this is

06:31: going to be given as additional context

06:33: every time every single time I um

06:39: uh use the assistant. So, if I start a

06:40: new session, I can say uh what variables

06:45: are in the NZ

06:48: agricultural

06:50: uh data

06:52: data set.

06:55: And it shouldn't have to do anything to

06:56: answer this because it's just going to

06:58: look at that uh that agents file, that

07:00: memory file and it can kind of tell me

07:02: like what's going on.

07:06: Okay, really quick. I'm going to pause

07:08: for 2 seconds.

07:09: Um

07:11: do you happen to be using like AirPods

07:13: as your sound?

07:14: I am. Can you switch to your computer

07:17: microphone or something in or an

07:19: external mic and let's see if we can

07:20: hear you better. You're very gravelly

07:22: and usually that's AirPod mic sound.

07:24: Yeah, I'll make Give me 2 seconds and

07:26: I'll

07:27: pull out my uh

07:31: Brief intermission. Do do do do

07:40: Dan says Hadley can zoom in one more

07:42: time since we're relying on the text in

07:44: the assistant and it's a little bit

07:47: smaller.

07:48: Yes, James, that was the girl from

07:50: Ipanema.

07:51: >> [laughter]

07:52: >> Hey.

07:54: Yes, I am a part-time sound engineer,

07:57: Annica. I have to be.

07:59: I'm doing lots of lots of uh

08:01: editing videos all the time and I'm

08:03: like, "Dang it, we should have addressed

08:05: sound issues like

08:06: while we were while we were doing

08:08: things."

08:10: Megan thought I was going to start

08:11: humming the Doug theme song. It's always

08:13: in my brain, y'all. And now that we're

08:16: older, nobody recognizes the Doug theme

08:18: anymore.

08:21: Okay, new microphone. Oh my gosh.

08:24: So much better. Thank you. Okay.

08:28: Okay.

08:31: Okay, so where were we? So, now we've

08:33: got the data loaded into R. We've got it

08:35: as a parquet file.

08:38: 32 kilobytes, so I'm not dealing with a

08:40: big data set. Uh so

08:45: it's got five variables, low key, no

08:47: cap.

08:49: What have we got? We've got the year

08:50: ended June. Oh, this is the real uh

08:53: really forget this this is one of the

08:55: most irritating things about New

08:56: Zealand, the fiscal year ends in June,

09:01: uh which is kind of confusing.

09:04: We've got some agricultural categories.

09:07: We've got the value, we've got the unit,

09:09: and then we've got the label.

09:11: So, one of the motivating

09:14: uh one of the motivating kind of things

09:16: about this was like

09:19: used to be when I was growing up, for

09:21: every human in New Zealand, there were

09:23: approximately 22 sheep.

09:26: And now that is like radically dropped

09:29: to about 4.5 sheep. So, let's see if we

09:31: can do a time series of that.

09:33: And so

09:35: one of the suggestions from Posit AI is

09:37: create a visualization of sheep

09:39: populations. So, let's click on that

09:42: and see what happens.

09:46: Okay, so it's going to run some code

09:48: to [snorts] look at various different

09:50: types of sheep.

09:52: We've got a lot of uh very sheep

09:54: specific

09:55: uh terminology, which now I'm like

09:59: do people know what a hogget is? That's

10:02: a very

10:03: sheep specific. Anyway, I think a hogget

10:05: is a sheep that is 2 years or older.

10:08: Uh, a lamb is less than one. That's

10:11: that's just uh fake. A wether is a uh

10:15: male sheep that's been neutered. So,

10:17: you're getting a lot of um

10:19: sheep terminology today.

10:22: >> [laughter]

10:23: >> Okay, but

10:24: >> from Derek in the chat real quick.

10:26: Derek says, I see you're using Claude on

10:28: it 4.5. When would you switch to Opus?

10:32: Uh

10:35: You're not really doing anything heavy

10:36: duty, right?

10:37: Yeah, I

10:40: that's a good question.

10:42: Uh, probably for stuff like this even

10:43: Haiku is fine.

10:45: I'm

10:47: not sure. Like I know

10:51: for me when I'm like programming, I'm

10:53: just like Opus 4.5 all the time. It's

10:56: not worth

10:57: like for me

10:59: I don't really care about the cost, so

11:02: I'd rather just

11:04: um spend whatever it takes, but uh maybe

11:06: if we get if we see anything squirrelly

11:10: or um looking about weird,

11:13: we will

11:15: um try switching to Opus and see if that

11:17: does any better.

11:18: Okay.

11:20: We've got this plot now. Uh, kind of

11:22: interestingly, I can say well, I add

11:24: a line.

11:26: And

11:27: my line is 41.

11:30: 1969

11:38: So, this is one of these places where I

11:39: like yes, I do kind of know how to do

11:42: this.

11:43: Uh,

11:44: and ggplot2 while at least I did at some

11:46: point, but um

11:49: kind of interestingly,

11:51: it's like how

11:53: old was I when

12:12: And it does I see.

12:15: I do we don't have yearly data here. So,

12:18: I've just asked it's doing a bunch of

12:19: calculations. Okay, so

12:22: Where's the tea? Oh my goodness.

12:25: >> [gasps]

12:25: >> This is here's the Gen Z slang that uh

12:28: that was promised.

12:29: Yeah, so basically my entire life, the

12:31: number of sheep in the sheep population

12:33: in New Zealand

12:35: has been dropping.

12:37: But

12:39: what I kind of what I really want to do

12:40: is also like it's really it's not just

12:42: the absolute number of sheep that I

12:43: think is interesting. It's the total

12:47: is the ratio of sheep to people. So,

12:49: let's

12:51: uh

12:51: let's see what we can do there. Um

12:54: okay.

12:55: And try and

12:58: do a share of

12:59: And I'm going to try and do what I would

13:01: do when I'm not doing this live, which

13:03: is I'm just going to type.

13:04: And I'm not going to fix any of my typos

13:07: cuz I kind of assume that the LLM will

13:09: like figure it out. So, it might be

13:11: confusing for you as a human, but

13:14: hopefully the LA

13:16: the LLM will figure it out.

13:20: Hopefully. All right, let's pause for

13:22: two two seconds for questions. Also,

13:24: Nick says, do we have a Gen Z human in

13:27: the loop to verify the syntax? Logan

13:29: says, can confirm. Thanks for being our

13:31: resident Gen Z Logan. Okay, so Jared

13:34: asks, is that just correlation or is

13:37: Hadley responsible for depleting the New

13:39: Zealand sheep population?

13:42: Is this a causal relationship here?

13:45: Probably not. Okay. As far as I know.

13:50: Okay, well legitimate question. Rob

13:52: asked, how many bow ties does Hadley

13:54: own?

13:55: Uh, not that many. Well, I don't know.

13:57: Like six bow ties, but I sort of just

13:59: kind of stopped wearing them. So, cuz I

14:00: stopped wearing uh

14:02: shirts with collars. I thought you were

14:05: going to say you stopped wearing shirts.

14:06: I was like uh

14:07: questionable. Shirts with collars.

14:10: Rob says he owns

14:12: over 50.

14:13: Ooh, my goodness.

14:17: Okay.

14:18: So, this is interesting. Yeah, the ratio

14:19: is almost more interesting. But I think

14:21: let's like do let's uh

14:23: How do we figure out what the population

14:25: of New Zealand was?

14:30: So, this is interesting. So, the current

14:33: says, get New Zealand population data

14:35: from a reliable source

14:37: using World Bank UN data or

14:40: similar, but for now just approximated

14:42: it. Okay, so it just made up the New

14:45: Zealand population numbers.

14:48: And

14:50: Oh, and it just did it just made up

14:51: numbers for like some randomly picked

14:54: sequence of years and then linearly

14:58: interpolated them.

15:00: So, this is like one of the reasons

15:03: you know, like like AI is super useful

15:05: for helping you with your data analysis,

15:08: but

15:10: uh it can make some questionable

15:11: decisions. So, let's say let's let's get

15:17: some real New Zealand population data.

15:20: While we are asking Sonnet to do that,

15:24: Russ asked, can the Posit AI assistant

15:26: use voice to text so people don't have

15:28: to type and you can just dictate and the

15:30: computer will convert it to text?

15:33: Uh, you cannot yet. I mean, you can use

15:35: a dictation general dictation

15:38: tool.

15:40: Um

15:42: So, I'm just what the

15:44: Oh, okay, that's fine. It's like okay,

15:46: well, I'm going to try and look for New

15:47: Zealand population data in the current

15:48: work in the current directory. Well,

15:50: it's not going to find anything. So,

15:52: good luck with that.

15:55: Um

15:57: And now I forgot what was the question

15:59: again?

16:00: Uh, voice dictation. No, you see you can

16:02: use something like built into your

16:04: computer or like some other add-on

16:05: package. I This is something where I

16:07: think pretty interested in. Uh, Joe

16:10: Cheng in particular has done some

16:11: experiments and it is interestingly it

16:14: is interesting how using voice changes

16:17: the way you interact with with data. Uh,

16:20: you might have seen my ggplot demo that

16:22: I did at Posit Conf last year. Uh,

16:25: definitely interested in in doing more

16:28: of that. So, it seems uh it's doing a

16:30: bunch of work. So, uh

16:33: let's just check in.

16:36: Okay, it looked to see if it could use a

16:38: WB stats package.

16:41: Uh, okay, then it just

16:46: Okay, called the World Bank API just

16:50: directly,

16:51: which is pretty cool.

16:55: Whoa, whoa. It just like

16:57: wow.

16:59: So, it clearly knew to do that. And just

17:02: that's what is interesting. And then

17:05: >> World Bank data and parsed it. Made

17:07: [clears throat] some question like it

17:09: just copied and pasted that into the

17:11: code though. So, let's just let's let's

17:14: like do this a little bit more

17:15: systematic. How about you write

17:20: to save the New Zealand file

17:23: and parse it.

17:25: And create

17:30: Sweet. Isabella just put the link to

17:32: that talk in the chat by the way. And if

17:33: you're watching this later, the link is

17:35: in the description.

17:36: Just go check the resources.

17:43: So, I'm going to I you know, I think one

17:45: of the most of the what I've been doing

17:46: here in this

17:49: is just kind of ephemeral in this chat,

17:51: but of course, you know, as a data

17:52: scientist, you want to end up with some

17:54: reproducible artifacts. So, I'm telling

17:55: it to create this

17:57: uh New Zealand

17:59: population file.

18:02: Uh

18:04: Uh

18:06: And I'm just going to run it cuz I just

18:08: want to kind of check what it's doing.

18:10: It really loves to put Okay,

18:12: let's

18:16: And

18:17: I want to

18:18: explore

18:19: things.

18:20: Anna did put the Wikimedia New Zealand

18:25: data total population in the chat for us

18:27: so we can go look at it.

18:30: So, we're going to work through this.

18:34: We have a a few questions in a row here

18:36: while you're working through things.

18:38: What's the purpose of the agents.md file

18:41: and what goes in there?

18:43: So, this is kind of the memory for the

18:46: agent. So, this is where you put

18:47: anything that you want the agent to

18:49: always know every time you start with a

18:51: clean sheet clean chat. So, I think

18:53: there's kind of two

18:55: um

18:58: two kind of big things here. It's like

19:00: code style

19:02: uh and I would say data

19:05: dictionary.

19:09: So, it's like a really involved

19:11: um

19:12: system prompt?

19:14: Yes, it's it's it's exactly a system

19:15: prompt. Okay. Um

19:19: Yes, it's it's exactly a system prompt

19:21: that's added automatically. It's

19:24: It's combined like that. Obviously, um

19:26: Posit AI has a system prompt of its own.

19:28: This gets combined automatically. So,

19:31: this is just something that you should

19:32: be building up as you work with a data

19:35: set.

19:37: Um I think this is a good place to kind

19:38: of put your basic data dictionary. You

19:40: might actually want to put that in the

19:41: read me.

19:43: Um

19:46: Now that I think about that.

19:49: Isn't that somewhere something for

19:50: humans to read as well.

19:53: Um

19:54: Oops, I always forget how you do this in

19:56: uh

20:00: But then you could say

20:02: say me

20:04: always

20:06: read

20:08: read me

20:17: Cuz you can you can also sort of think

20:19: about There's a sort of balance you want

20:21: to strike between like what information

20:24: are you giving specifically to the LLM

20:26: and what information do you want to

20:28: share with your colleagues as well? And

20:31: anything that you want to share with

20:32: another human, you probably want to put

20:33: that in the read me. Um

20:38: So I'm just going to keep this stuff

20:40: more for agents. When I So when I notice

20:43: a behavior that annoys me, I'm going to

20:45: add something to this agents to try and

20:48: stop it from doing that thing. So that's

20:50: why I said it only use comments here.

20:52: So that I can

20:53: >> Well, we have

20:54: Okay, good.

20:54: >> a delete another couple of questions

20:56: that are along the same line. Daniel

20:59: asked, how does Posit AI in RStudio

21:01: compare with the current Positron AI

21:03: assistant? And I think that the answer

21:05: is that it's like a amalgamation of Data

21:08: Bot and Posit

21:10: Positron assistant.

21:11: >> It's complicated. Like they they are

21:13: going to align. They're going to become

21:14: the same thing eventually. The big

21:17: challenge is like Posit AI is basically

21:21: like a consumer product. And the what

21:24: that means is like we going to pick the

21:26: LLM for you and we believe that like

21:29: Claude is the best uh right now the best

21:33: LLM for doing writing R code and doing

21:36: data science. And we're going to pick

21:37: that for you and we're going to write

21:39: all of our tooling to work specifically

21:41: with Claude.

21:43: Now Positron

21:45: assistant works inside Positron which

21:48: has to get installed inside lots of

21:50: enterprise customers. And enterprises,

21:53: big companies for obvious reasons, don't

21:55: want to be sending their data out to

21:57: some like random LLM on the internet.

21:59: They want to be using their own internal

22:01: LLM. And companies have done

22:05: standardized on all sorts of different

22:08: LLM providers, sometimes the big ones

22:10: like Claude and Anthropic or they

22:13: or they're going through Azure or

22:15: Databricks

22:17: or Snowflake or something. Sometimes

22:19: they'll pick some like total wackadoo

22:21: thing and they've chosen to inflict that

22:23: on their employees. And Posit Positron

22:27: assistant has to work with all of those.

22:29: So in the long run they're going to come

22:30: together and just be one tool, but it's

22:32: taking a little while to figure out how

22:34: to how to do all of that.

22:36: Okay, well let's get back to the code

22:37: with our last question which is, will

22:39: all the code generated by Posit

22:41: assistant be stored in the session

22:43: somehow to let somebody review what the

22:45: agent generated? This is a great

22:47: question that

22:48: I get every time we talk about this is

22:51: like

22:52: where is all of this code that it's

22:53: creating in the side panel going? How do

22:56: you keep track of it?

22:59: Yeah, it does it does not. All of the

23:00: code you should This is purely ephemeral

23:03: code. You should treat this as the same

23:06: way as the code that you type in

23:07: directly.

23:09: So what like for example what I've done

23:11: here is explicitly asked it to save it

23:14: in the R file. This is the file that I

23:16: would then check into Git. This is the

23:18: thing that I can stop by the clean

23:21: session, run this

23:25: and now I've recreated that parquet file

23:28: again. So not nothing has changed in the

23:31: sense of like how are you going to

23:32: record what you discovered in your

23:34: analysis? You should still be creating R

23:36: files and QMDs or R markdown files.

23:41: That's still your responsibility. And I

23:44: think it still makes sense to be like

23:46: starting like clean sessions again to

23:49: ensure that you do have all that

23:50: information tracked correctly.

23:53: >> So instead of you putting the code in an

23:55: R file, it's an agent putting it in the

23:57: R file. And for anybody who wasn't here

23:58: in the very beginning, it did ask

24:00: Hadley's permission to do that. It was

24:02: like, "Hey,

24:03: can I write R code?" And Hadley was

24:05: like, "Yes, you can write R code."

24:10: Okay. And so I've I've added this

24:11: question.

24:13: >> Yeah, and so since I've started

24:14: restarted this session, it's going to

24:19: do this again do this again.

24:24: It's going to ask me for permission

24:25: again. I I think currently it's a bit

24:27: too it's always asking you for

24:28: permission and you're just like, "Go

24:30: ahead and do it. I trust you."

24:32: Um we will That's something we still

24:34: need to I think do better at. But again,

24:36: like everything I do in this, like

24:38: everything I learn, I want to record

24:40: this somewhere. So now I've said like

24:43: now my data dictionary's been updated.

24:44: I've got this parquet file. I've got the

24:47: source. I've got the description. I've

24:49: got the column types.

24:51: Um I've got this key context which uh

24:54: I'm just going to put that cuz

24:56: I don't think that's important. And then

24:59: I've got this New Zealand population

25:00: data set.

25:06: So now again like I think you know good

25:08: practice I'm always restarting my R

25:10: session.

25:12: Um restarting my chat session. And now I

25:14: can say like, "Create

25:17: a plot that shows

25:20: uh all the ratio of sheep to people over

25:24: time."

25:30: So you can see because I said in the

25:32: agents.md

25:33: like there's a data dictionary in the

25:35: readme.md

25:37: like it it knows to do that. It's going

25:39: to go, "Okay, I'm going to start by

25:40: reading the readme."

25:42: Like always uh

25:45: a good sign.

25:47: Then it's going to look for sheep data

25:48: again.

25:50: Um

25:51: It picks total sheep.

25:53: It's done.

25:56: It's run a bunch of code and it's

25:57: created this plot. Now again like this

26:00: plot is ephemeral. Like you should think

26:02: of this chat pane like you're typing

26:04: something in the console. If I want to

26:06: keep this, I should say like, "Okay,

26:08: okay, make

26:10: me a photo report

26:13: about this."

26:24: Okay, it's going to give me a report.

26:28: It going to offers

26:29: uh

26:30: the sections and I'm just going to say

26:33: go for it.

26:38: It's going to sleep. That's good.

26:42: Are you open to a pause to ask more

26:44: questions? Yeah.

26:46: Let's do it. Okay. So we have some

26:47: questions that have come in um mostly

26:51: about Posit assistant. One is from

26:53: David, does Posit assistant also support

26:55: skills files?

26:58: Uh I can't remember off the top of my

27:00: head. I think either it does or it will

27:03: do in the near future because it is

27:05: skills files. So skills files, basically

27:07: the idea is instead of like dumping

27:09: absolutely everything into one giant

27:11: agents file, you can kind of say, "Well,

27:15: you could basically say the skills work

27:17: something like that." Like if you need

27:19: to know how to

27:22: linear regression, read linear

27:25: regression.md.

27:28: And then

27:30: Posit AI will only read that if you need

27:32: to do a linear regression. That's That's

27:34: basically in a nutshell how skills

27:36: That's all skills is. It's kind of like

27:37: a reference to a markdown file that will

27:40: get read on demand only when it's

27:41: needed.

27:43: Okay, perfect. Um Megan asked, were we

27:46: always able to add agents.md in

27:49: Positron, too?

27:52: Uh I mean always like yes, always in the

27:57: scheme of AI that's like a month. Yes,

28:01: this has always been true.

28:03: So much is changing so quickly in the

28:05: world of like AI assistants that

28:09: always is maybe like a few weeks ago

28:11: when things started. Um so another one

28:15: is from Becca, did Hadley choose the

28:18: name agents like agents.md or does each

28:20: session have an agents file similar to

28:22: having a readme?

28:25: Uh so the agents.md this is kind of uh

28:30: Oh my god, I'm blanking on the

28:31: convention. This is a convention that

28:34: lots of different

28:37: different AI agents will look in this.

28:40: So Posit

28:41: Posit assistant definitely will. I think

28:44: if you use like Claude code in the

28:45: terminal, it will also look there. If

28:47: you use like Codex or Gemini, a lot of

28:50: these other ones are standardizing on

28:52: this agents.md file because for a while

28:56: like yeah, you know, AI for a long long

28:59: time ago in AI times, we were ending up

29:02: it looked like you'd have a Claude.md, a

29:04: Gemini.md, a Codex.md. Like And then the

29:07: people decided that that was ridiculous

29:09: and we should just have the one kind of

29:10: MD.

29:12: But I do think this idea of like telling

29:14: it to read your readme is a good

29:16: principle because if the readme is aimed

29:18: for humans, like most of that context um

29:22: you want the agent to have as well. And

29:24: I think one of the things that like LLMs

29:27: like make us do more of that is good for

29:30: us and we always should have been doing

29:31: more is like writing down more of these

29:33: assumptions, being very clear. So when

29:36: we're both working with you know, our AI

29:38: collaborators and our human

29:40: collaborators, like everyone knows what

29:42: we're talking about. We're all on the

29:44: we're on the same page.

29:46: Yeah. Okay, great. Um we have so many

29:49: more questions, but let's go forward in

29:51: our code just a little bit and then

29:53: we'll stop and do some more questions.

29:55: So let's fix one thing that drives me

29:57: bonkers about AI-generated code, which

29:59: is

30:01: not using the same

30:04: minimal.

30:08: And so yeah.

30:09: Oh, what is wrong?

30:13: It equals this. Look. And don't

30:18: And all our things.

30:20: Okay, so this is the type of thing you

30:22: can put in your agent's file, like your

30:23: pet peeves.

30:25: Um and now I can say fix the thing.

30:29: And then hopefully this [laughter] will

30:31: be like

30:32: Yep, okay.

30:38: So it's going to propose a change and

30:40: it's going to delete that.

30:45: Sneaky.

30:49: Yeah.

30:52: Yeah.

30:56: That's that's also nice like now it it's

30:57: always going to apologize for screwing

30:59: up even if it didn't do anything like

31:01: that.

31:03: Okay, so I've got this QMD. Now again

31:05: like this is the thing that I this is

31:07: the thing that's going to persist over

31:09: time.

31:10: Um

31:15: >> [sighs]

31:16: >> I don't love the fact that it's like

31:18: added all of this text.

31:20: Um but I do like the fact that it's

31:23: talked about the data sources.

31:25: The data prep was pretty simple. It

31:27: extracted the sheep data, aligned it

31:29: with population data.

31:33: Which is interesting. It made this

31:35: decision to add one, which is probably

31:40: Ah,

31:41: I don't That's

31:43: Yeah,

31:44: maybe you should be really like taking

31:46: the kind of middle like do some kind of

31:48: linear interpolation. I I like I don't

31:50: think that's going to change the message

31:51: overall, so I'm not going to I'm not

31:53: going to care about that.

31:55: Is any of the stuff that it put in this

31:58: uh report in Gen Z speak or is it only

32:02: what it's returning to you in the chat?

32:04: Oh, interesting.

32:06: I don't think it is. I'm just curious.

32:09: There I don't see any no caps. I don't

32:10: see any fires. Okay.

32:13: That's disappointing.

32:15: Uh I think what happened however as

32:17: you'll see that if we scroll up here.

32:20: Oh, okay. It used a skill. So it must

32:22: support skills cuz there are some

32:24: baked-in skills and one of those skills

32:26: is the Quarto report skill.

32:29: And I suspect all of the the skill

32:33: probably says something about the

32:34: language. Let's see

32:36: if I can

32:40: So this is the skill used for creating

32:42: reports.

32:44: And I bet

32:47: Now.

32:48: Oh, that's a bug. It doesn't show the

32:50: whole thing. So it just does the dot dot

32:51: dot. Anyway, so I just I I bet there's

32:54: um something in there, but we can kind

32:56: of override that by being more explicit.

32:59: I would

33:01: Yeah.

33:02: It's using the same

33:05: Okay, while we are pausing for a

33:07: ridiculous unhinged reason, let's answer

33:10: let's ask some more questions. And also

33:12: hey Garrick. Garrick's in the chat.

33:14: Garrick eating busy. Okay.

33:16: Uh let's hop over and check out what

33:18: we've got. Um Nor had asked can Posit

33:22: Assistant create

33:24: a rem as well? So like

33:26: would you use an R environment R env

33:29: with Posit Assistant?

33:32: That's is a good question.

33:36: Uh I would imagine

33:38: it could. I'm just going to tell it to

33:40: use Gen Z plier too. So we've got a

33:43: fully uh

33:44: Gen Z

33:47: compliant report.

33:52: And that's something I'm kind of

33:53: thinking.

33:54: Uh so I I

33:58: don't know. Let it finish creating this

34:00: report, but I bet if you say

34:07: Oops.

34:15: Oh my good girl. Okay, I'm just going to

34:17: re I'm just going to finish this screen

34:18: and redo the report. It didn't work.

34:22: It didn't like something.

34:26: You need to install

34:27: >> [laughter]

34:29: >> Gen Z plier is not uh

34:31: part of my day-to-day

34:34: workflow and is uh

34:35: >> It's not? It's not. It's not part of the

34:38: tidyverse.

34:40: Ah, Isabella's cat

34:42: entered the chat. Oh my gosh.

34:44: Um no. Okay, well it's failed. AI has

34:47: failed.

34:49: Aw, it's okay. It's still in beta.

34:52: >> [laughter]

34:54: >> Well, this is I mean that and this is a

34:55: good reason

34:57: as to why like using Git with these AI

35:02: assistants is so important because I've

35:03: got like no way to roll back to a

35:05: version that worked.

35:07: Um but let's actually uh oops.

35:11: Let's roll back to redo the

35:15: So maybe it can

35:17: It's going to have a go at converting it

35:18: back, but it's not like rolling it back

35:21: in time. It's translated dplyr to Gen Z

35:24: plier and now it's translating Gen Z

35:26: plier back to dplyr. So you can imagine

35:29: how like errors are going to potentially

35:31: like propagate. Propagate, yeah, for

35:34: sure. Okay. Well, Brent Brent had asked

35:37: is Claude also the best for Python code?

35:41: What a good question. I think Isabella

35:42: tried to answer this one in the chat,

35:44: but I would love to hear from everybody

35:45: what they think.

35:47: Um

35:49: is the best for each of the languages

35:50: that they use? Hadley, do you have any

35:52: opinion?

35:53: >> I don't know if it's best, but like I

35:55: don't know. I have strong opinions about

35:56: R code. I do not have strong opinions

35:58: about Python code. Yeah. It's and I'm

36:01: sure it's good enough. I'm sure it's

36:02: really good. I'm sure it's like fine.

36:05: I find it's fine. I find both Claude and

36:07: GPT are pretty good at writing Python

36:10: code. I find that Claude is probably

36:12: better writing R code than GPT though.

36:15: Um okay, Tony had asked if you add a

36:18: behavior or a requirement to agents.md,

36:21: does it take on the fly as you continue

36:23: prompting or do you need to restart or

36:26: refresh something at some point in order

36:28: for it to like reabsorb the stuff that

36:30: you've added to agents.md? And I love

36:32: this question cuz I have the same one.

36:35: So we we actually kind of saw an example

36:37: of that cuz remember I changed the

36:38: agent's file to say do not use this. And

36:41: then in the same chat session I said fix

36:44: the theme.

36:46: And you can see

36:48: like I literally saw the memory file.

36:50: Like

36:51: like I'm gaslighting

36:54: Posit AI here, right? Because at the

36:56: time it wrote this code it didn't know I

36:58: didn't want it to use the minimal. But

37:01: because the agent's file kind of gets

37:03: reinjected at the very top of the chat

37:05: history as part of the system prompt

37:07: every single time, like it feels bad for

37:10: um

37:11: for messing up. So yeah, you you do not

37:13: need to restart the uh you do not need

37:17: to restart the chat. But obviously like

37:19: it's only this agent's file, like it

37:22: isn't going to reread the my read me

37:25: every time. So you'd probably you'd have

37:27: to ask it to to do that or it might

37:28: figure that out if there's a data set.

37:31: Okay, great. We have one more question

37:32: from Anna, but I think that it will move

37:34: us forward in our code because she had

37:36: asked like

37:37: what if you asked the agent why

37:39: something happened? Like why did that

37:41: ratio fall off?

37:43: Um because she was saying my guess is

37:45: that like would it look on the internet?

37:48: Would it go try to Google why did the

37:51: ratio fall off?

37:52: I'm going to give you my prediction and

37:54: then we'll see what it is. And I think

37:55: it's just going to it's just going to

37:57: guess.

37:58: Uh it's going to use like its kind of

38:00: background knowledge slash it's going to

38:02: hallucinate an answer and we're not

38:04: really going to know which is which, but

38:06: let's ask it why.

38:07: >> But it's not going to like write

38:10: Bayesian code to figure out do a whole

38:13: causal analysis for us probably. Yeah.

38:15: And and we don't have the data for that,

38:16: so

38:18: Let's see.

38:23: Okay, well I mean this is a good place

38:24: to start. Like is it because the

38:27: sheep population increased or because

38:30: the human Sorry, the sheep Did the sheep

38:32: population decrease or the human

38:34: population increase?

38:37: So it's sticking to the data we think at

38:39: this point.

38:39: >> So it is yeah, it's sticking to the

38:41: Well, okay. So it's sticking to the data

38:43: here, so it

38:46: It uh picked some random

38:51: Okay, let's digging into the data.

38:54: And then it says look at key years and

38:56: it just picked

38:57: 1982, 1985, 19, 2000, and 2025. I've got

39:01: no idea why it picked those years. Not

39:04: evenly spaced. No, not at all.

39:07: >> they're not evenly spaced.

39:10: Uh and then it tells me that 1980s were

39:13: a turning point.

39:15: Okay.

39:17: It's doing some peak. Okay, now it's

39:21: giving me some speculation.

39:23: Economic reforms.

39:25: Uh

39:28: Okay, now this is like this my New

39:30: Zealand historical knowledge of sheep

39:33: agriculture New Zealand up to this.

39:35: Uh I I think that's correct. Like I do

39:37: like I know that yeah, like New Zealand

39:39: agriculture used to be heavily

39:40: subsidized by the government and then

39:43: they dropped those subsidies in favor of

39:45: like more free market economics.

39:47: I have no information about the global

39:49: wool market.

39:53: Okay, well, this is a this is a question

39:56: dairy confusion and land use changes.

39:59: This is

40:01: this seems a little implausible to me

40:04: because sheep

40:07: basically sheep are fine on steep hills.

40:10: The most of the sheep country in New

40:11: Zealand are like pretty steep hills and

40:13: you can't put cows on steep hills. So

40:15: I'm like skeptical about this. But again

40:19: you know, no export. But I could say,

40:22: yeah, okay. So that let's see let's see

40:24: if we've got some data here. Look at the

40:26: dairy cattle numbers to see if they rose

40:29: as sheep fell.

40:31: I think it's important to point out as

40:33: we're

40:34: going through this that like if you did

40:37: not know

40:38: how to code in R, you would not be able

40:40: to filter through and quickly look back

40:42: at the code that posit assistant is

40:44: writing and tell whether or not it's BS.

40:47: And so whenever somebody asks me like do

40:48: I still need to know how to code? I

40:50: always say yes because even if you are

40:52: using an LLM

40:54: you have to be like you're training a an

40:57: intern right now. You're training like a

40:59: wildly

41:00: talented intern who is just like super

41:03: unhinged and chaotic and like you still

41:05: have to look at everything that they do.

41:07: I figured I would ask your opinion on

41:09: that Hadley. Do you still need to know

41:10: how to code in 2026?

41:13: Uh

41:17: just on the unhinged intern like yes,

41:19: this is an unhinged intern. But this is

41:22: not literally the smoking gun. This is

41:24: showing that

41:26: there are lots more like I've got like

41:30: you know, double Y axis

41:33: but

41:34: double Y axis

41:38: you can also see

41:42: Does using caps lock increase the

41:45: likelihood that the LLM is going to

41:47: listen to your agent MD file? Does it

41:50: know you're yelling?

41:51: >> No, there's like a lot of um

41:53: mythology around this. Like you can also

41:56: people have said like if you use a

42:00: double Y axis, I will find you

42:05: to $200. Like there's all this mythology

42:08: around you. There's like you can like

42:09: threaten it. It's like Oh my gosh, like

42:11: do LLMs have loss aversion? Yeah, well,

42:13: good luck trying to use a double axis in

42:15: GGplot anyway. Well, I did it. It did

42:18: it.

42:19: >> I know. It's it's built to stop you and

42:21: it still did it. Anika was saying I'm

42:24: enjoying Hadley's sheep knowledge. Me

42:26: too. Who knew?

42:28: Who knew I had so much sheep knowledge?

42:31: I have secret cattle knowledge too

42:32: because my family owns things.

42:36: Another

42:37: doesn't want to be fined $200. The

42:39: people have done it like uh

42:41: You can also do the opposite like if you

42:43: do the uh

42:44: you use a double

42:47: axis,

42:48: I will find

42:50: David says caps lock does not make a

42:53: difference to the AI but it sure feels

42:54: better to use them sometimes. Yep.

42:57: >> [laughter]

42:57: >> Yeah, I'm not I'm not convinced it

42:59: doesn't make a difference because it is

43:01: like the shouting and you know, LLMs are

43:03: trained on like human knowledge.

43:05: Um there was a I don't know if I can

43:07: remember

43:09: Uh what's his

43:11: it's like Max

43:13: um

43:15: Oh, we're going to find Russ at least

43:17: $200 for his sheep pun.

43:21: I can't remember. I'm blanking on his uh

43:23: his name is Max and he has a

43:26: uh a a blog. Oops.

43:30: Oh my gosh, Isabella just pointed out

43:32: that the

43:33: the subtext on the graph says sheep

43:36: really said it's giving dairy air and

43:38: dipped.

43:39: Oh my goodness. You got Gen Z in your

43:42: chart.

43:43: And I put an emoji in the chart label.

43:46: >> I love it. Skull emoji.

43:47: >> That and that's actually like that's a

43:48: this the fact that the emoji works like

43:50: that that was like Thomas Peterson like

43:52: spent like

43:54: literally a year of his life on the

43:56: entire font stack to make that possible.

43:59: >> Really? Thank you Thomas Lin Pedersen.

44:01: You're the best.

44:03: But it's also yeah, like the now that

44:05: we've got rid of the double Y axis

44:07: that that that imaginary crossing point

44:10: no longer exists.

44:11: Um and you can kind of see

44:14: like yeah, I mean yes, there was a rise

44:17: in the number of dairy cattle but

44:20: nowhere near

44:22: um enough to for that to be explanatory.

44:25: In the context of millions of animals.

44:29: So I I wanted to do a quick shout out

44:31: real quick real quick because John in

44:33: the chat had

44:34: given a shout out to Jenny Richmond who

44:36: submitted this data set.

44:38: Um if you do not know John Harmon, John

44:40: Harmon is the one who is like doing all

44:42: the stuff behind the scenes making the

44:44: tidy Tuesday repo work and what it is.

44:47: He does a massive amount of work. Huge

44:49: like round of applause in the chat and

44:52: the internet in general for John and all

44:53: the work that he does. Jenny Richmond

44:56: has submitted so many data sets to tidy

44:57: Tuesday. She might have the record for

45:00: like number of times I've seen it at the

45:02: same name come up as a curator. So thank

45:04: you so much to Jenny. Also Jenny's just

45:06: a delight. If you get to talk to her and

45:07: meet her, do that cuz she's amazing and

45:09: fun.

45:10: Um

45:11: and she is also in New Zealand. So

45:14: super super like close to home data for

45:17: her. And then I wanted to also let you

45:20: guys know that

45:22: we're actually going to have John Harmon

45:24: here with us

45:25: at the data science lab. He's going to

45:28: be here on March 10th talking about how

45:31: to submit a tidy Tuesday data set. He

45:32: put together some like curation

45:34: functions for tidy Tuesday. So it's so

45:36: much easier to submit now.

45:38: We're all going to get together and

45:39: submit data sets after that, y'all,

45:41: right? Okay.

45:43: Back to you Hadley and I had a question

45:46: in the chat from Russ that was like

45:47: could Hadley have done this faster

45:48: without an AI?

45:50: What do you think?

45:52: Uh

45:54: This so this is the blog Max will

45:56: I can't let's just find a prompt.

45:59: We can also see

46:06: Oops.

46:10: This is just an interesting. I'll just

46:12: uh

46:13: slack that to Isabella so you can share

46:15: it. But this is like a interesting AI

46:17: experimented with all these ways of like

46:18: offering a tip. Like I think there's a

46:20: bunch of like threats further down.

46:23: Yeah, like

46:24: like threatening to kill it, give it

46:26: COVID-19, make it gain weight, fire it.

46:29: Um it it turns out these mostly

46:33: don't do anything but it's a fun

46:35: analysis.

46:37: I love it. Oh, and also um

46:40: John wanted to point out like

46:42: there are people obviously who have

46:44: submitted way more. Tom Mock started

46:45: tidy Tuesday. John does a billion of

46:48: them and then also Tracy Teal. So

46:50: obviously, you know,

46:52: we have we have there's in internal

46:53: contributors and outside contributors.

46:56: We're so thankful for all the work that

46:57: all of you do.

46:59: So I yeah, in this case could I have

47:01: done this faster with an LLM? Like

47:04: probably. I just wanted to show you one

47:06: case I did another tidy Tuesday.

47:10: Your screen dimmed a little bit. Oh

47:12: wait, it's coming back. There we go. Oh,

47:14: it's just it's weird.

47:17: Um oops. Move that.

47:20: Uh like I looked at this

47:23: uh the previous tidy Tuesday

47:26: uh which is the astronomy picture of the

47:28: day.

47:29: And one of the things I did with it

47:32: is like a clustering a text clustering

47:35: on the image descriptions.

47:38: And like I you know, I could have

47:40: figured this out eventually

47:42: uh but just getting something that

47:44: really really quickly

47:47: um

47:49: really really quickly giving me the

47:51: results without me having to remember

47:53: all the details of like how do I use

47:55: tidy text to do text clustering. That

47:57: was like super super um appealing. And

48:01: the other thing I did, I think

48:09: So I just want to show like it does it

48:12: chooses the number of clusters.

48:18: And as a reminder, this is last week's

48:20: analysis, right? Uh this is a couple of

48:23: weeks ago now.

48:23: >> Couple weeks ago. But like it's so like

48:25: so when you do cluster analysis, right?

48:27: You have to choose the number of

48:28: clusters and there's a bunch of

48:29: heuristics. But I think whenever you do

48:31: cluster analysis, you want to do a

48:32: little bit of experiment experiment like

48:35: is my is are my results like robust to

48:38: different numbers of clusters? And so

48:40: what I did, I was like, okay, well

48:44: uh

48:45: well, like make me a shiny app that lets

48:46: me explore that.

48:52: This is one of my favorite uses for

48:54: shiny apps, y'all. I make apps all the

48:55: time that let me step through something

48:58: and look at it. Like one time I was

49:00: doing a little project where I was

49:01: classifying blue sky posts. And so I was

49:04: like

49:05: I'm going to pre-classify these with an

49:07: LLM and then I want to build a shiny app

49:09: and have the shiny app feed me each one

49:12: and tell me like what it had assigned it

49:13: and then I can decide whether or not it

49:15: was something. I was trying to classify

49:18: replies versus posts basically. Just

49:19: really basic stuff just to see if I

49:21: could do it.

49:22: It was amazing.

49:23: And and like the ability to write like a

49:25: shiny app like this and like you know,

49:28: two or three minutes. This is really

49:30: cool. Like yes, I could have I've you

49:32: know, I could have written a shiny app.

49:34: I probably never would have before

49:35: because I would have felt like the cost

49:38: benefit and trade-off like wasn't there.

49:40: But now like just give it a go and

49:44: with an LLM like it's not a super

49:45: complicated shiny app and and that's

49:48: fine. And it's a throwaway so it doesn't

49:50: have to be pretty. Just James Wade's

49:52: talk at Posit Con last year was about

49:53: this like throwaway shiny apps why you

49:55: should build them and throw them away.

49:58: Yeah and because the cost of like

49:59: writing a bunch of R code is now much

50:01: cheaper than it ever was before.

50:03: Um yeah do it.

50:05: I And that And that reminds me of a

50:07: question we got to earlier.

50:09: We were asked earlier that I didn't

50:10: think I answered which is like it

50:11: doesn't still make sense to learn how to

50:13: code in 2026. Yeah Ben had asked that

50:15: again in the chat like I want to hear

50:16: Hadley answer that.

50:18: And I want to say like I think the

50:23: Like yes I think understanding code is

50:26: still really important.

50:28: I do think the trade-off between the

50:30: ability to read code and ability to

50:32: write code has changed because now we

50:34: can like generate so much

50:37: code quickly with an LLM like your

50:39: ability to read that code quickly figure

50:42: out you know understand what it's doing

50:43: and if it's the right thing and then

50:45: either like make small tweaks by hand or

50:47: tell the LLM to fix it. But if you don't

50:50: know

50:51: what it's doing that just seems like

50:52: such a dangerous place to be in.

50:56: Like if you don't

50:58: have some sense of like you know that

51:01: that that you know you still to to do a

51:02: good cluster analysis you still need to

51:04: understand like oh actually the number

51:06: of clusters is really important and

51:11: you know we there's no magic way to

51:12: figure out the correct number of

51:14: clusters. So you have to know like the

51:16: LLM will just give you some decent

51:18: answer. You need to go to and

51:20: like interrogate that further. So still

51:22: that like subject matter knowledge that

51:24: ability to read code that ability to

51:27: like go and

51:29: let's see if I can quickly switch back.

51:31: Um

51:38: You know like I think you still want to

51:40: create

51:41: create these data sets and the ability

51:44: to like go in there and actually modify

51:46: them directly

51:48: um is super important because

51:51: you know it's

51:53: being able to type a one instead of a

51:54: two there like that's much lower effort

51:57: than saying the LLM hey can you please

51:59: go to this specific plot and do make

52:02: this change for me. Like if you know

52:04: exactly like but one of the advantages

52:06: of code is that it's like or

52:08: you know it's this precise language

52:10: and LLMs are great at going from your

52:13: vague human language to this precise

52:15: code language but if you already know if

52:17: you already have that precision in mind

52:19: trying to tell an LLM what to do in

52:21: human language to make a precise change

52:24: that's just like that's inefficient. So

52:27: I I think like code is still important

52:29: but your ability to write code I think

52:31: is less important than it used to be.

52:33: Your ability to read code is still more

52:35: important and your ability to like ask

52:38: good questions like even even more

52:41: important.

52:42: I will say we have two minutes left and

52:43: I would love to end with just like a

52:45: little one more philosophical question

52:47: from Ben cuz I've been thinking about

52:48: this a lot. Um which is if one of the

52:51: best ways to learn how to read code is

52:53: to write code what's what's going to

52:56: happen if we're writing it less?

52:58: Yeah I I don't know. Like one of the

53:01: things

53:02: like we're going to have to we're going

53:03: to have to learn new ways to make new

53:05: tools to you know new ways of of doing

53:08: this. I think one of the things that's

53:10: always sort of intrigued me I read this

53:13: article

53:14: I don't know like maybe 10 years ago

53:16: about masters of fine arts

53:19: in programming.

53:21: And like I don't know I can't remember

53:23: if it was like a real program or just

53:24: kind of a speculation but this idea like

53:27: you know when you go and become an

53:28: artist you spend a bunch of time

53:30: obviously you do spend a bunch of time

53:32: like making art but also like looking at

53:34: the work of like old masters and

53:36: attempting to copy that by hand. And of

53:38: course you could take a photograph of a

53:40: famous painting that's going to give you

53:41: like an exact reproduction but that that

53:43: that create recreating it by hand

53:46: you know the things you do in like art

53:49: and design programs where you like

53:50: collectively talk through things. I

53:53: think all of these skills like we're

53:54: going to have to figure out how to apply

53:55: them to to data science and and

53:57: programming today like super duper

53:59: important.

54:01: All right wonderful. Well we have

54:03: literally one minute left so I will say

54:05: let's wrap up and everybody say thank

54:07: you to Hadley for joining us. This was

54:09: so much fun. If you want to sign up for

54:11: the waitlist for Posit AI stuff

54:14: Nick has put that in the chat actually

54:16: posit.co/products/ai.

54:20: Um you can sign up for the waitlist for

54:23: this private beta for the tool that

54:25: Hadley is using.

54:27: And then of course if you would like to

54:28: go explore all of the AI tools in

54:30: Positron those are all open for you to

54:32: explore. You can go check those out

54:34: right now.

54:35: Um thank you so much for joining us.

54:36: This was a lot of fun. I hope that you

54:38: will join join us on March 10th with

54:40: John Harmon who is going to help us

54:42: learn how to submit Tidy Tuesday data

54:44: sets. Don't forget that on March 3rd we

54:46: are not meeting but there is going to be

54:49: a webinar with Satish from Johnson and

54:51: Johnson who's going to be talking about

54:52: the sort of IT perspective of scaling

54:57: Positron into Johnson and Johnson as a

54:59: sort of all-in-one IDE where everybody

55:02: can be happy using the tools they want

55:04: to use. All right Hadley thank you.

55:05: >> Can I add just one quick more one extra

55:08: plug for Posit AI right now. That is

55:10: it's like a it's a currently a free beta

55:12: beta cuz we try we're trying to

55:14: understand like what's helpful for

55:15: people

55:16: and so it is like free so if you do want

55:19: to like learn a little bit of like AI

55:21: powered data analysis with like no money

55:24: down at least for a little while like we

55:26: can't do this forever cuz we we are a

55:28: business but at least if you if you want

55:30: to get your toes wet in AI supported

55:34: empowered data science like Posit AI is

55:37: a great way to do that right now.

55:39: All right fantastic and I will see

55:41: everybody on Thursday at the Data

55:43: Science Hangout. I will also see you

55:45: next week at Rainbow R Conf for I am

55:47: going to be with Dami Pak doing a trivia

55:50: thing. If you are attending Rainbow R

55:51: Conf I'll see you there. Bye everybody.

55:54: See you on Thursday and see you next

55:57: week. Bye.
