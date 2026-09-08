---
type: Video Transcript
title: "What even is dbt? An Analytics engineer explains | Laurie Merrell & Michael Chow | Data Science Lab"
description: "I'm a data community manager here at Posit."
resource: "https://www.youtube.com/watch?v=f7_WwFmlslo"
tags: ["ds-lab", "dbt", "python", "databases", "workflow"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T21:59:18Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=f7_WwFmlslo"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2026-01-30T00:00:00Z"
    usage_count: 1772
usage_window: { from: "2026-01-30T00:00:00Z", to: "2026-09-08T21:59:18Z" }
---

# Transcript

00:07: Welcome to the data science lab, y'all.

00:09: I'm Libby. I'm a data community manager

00:11: here at Posit. Uh my co-host is

00:13: Isabella. Isabella, you want to say hi?

00:16: Yes. Hi, everyone. Thank you so much for

00:19: joining us. Happy New Year. Yeah. Happy

00:22: New Year everybody. Usually Dan is with

00:24: us. Dan Chen, I think he's teaching

00:26: right now. We'll say hi to Dan in

00:28: spirit. And if you are new around here,

00:30: hello, welcome. Um, the data science lab

00:32: is new. It's like weekly. We get

00:34: together, we talk about more technical

00:36: stuff and it's very unscripted and fun.

00:39: It's like pair coding with your friends,

00:41: right? We're all going to learn

00:42: something new today. Today we are

00:45: talking about DBT, a tool that I have

00:49: feared for a long time because I don't

00:51: know anything about it. I'm like, I'm a

00:52: data scientist. I'm a stats person. and

00:54: I am not an engineering person or a

00:57: computer science person. So, it's been

00:59: really intimidating, but thankfully we

01:01: have Michael Chow and Lorie Merrill here

01:03: to help us learn about it and navigate.

01:06: Um, so I will have you two introduce

01:08: yourselves. Michael, would you like to

01:11: tell us a little bit about who you are?

01:13: >> Sure. Hey, I'm Michael Chow. I work as a

01:16: software engineer at Posit. Uh, and I'm

01:18: so excited to talk about DBT, I think,

01:20: because I prior to this, Lori will

01:23: introduce herself, but um worked helping

01:27: build out a data team to work on some

01:30: transit um pipelines and I have to say

01:33: um I did a really bad job with a lot of

01:37: the orchestration things and then Lori

01:39: came in and really like sponged to gold.

01:42: So, I'm I'm so excited for Lori to be

01:44: here. I'm the like barbarian side of DBT

01:47: where I feel like I have the

01:49: appreciation I have an a healthy

01:51: appreciation of DBT, but Lori actually

01:53: has substantive expertise. So, um, Lori,

01:57: do you want to introduce yourself?

01:59: >> Yeah. Um, hi everybody. I'm Lori

02:01: Merrill. I'm lead analytics engineer at

02:04: Jarvis Innovations and I have been

02:07: working with DBT

02:09: uh since about 2022. And I actually

02:12: learned DBT

02:14: uh to refactor the codebase that Michael

02:16: [laughter] kind of handed off to me. Um

02:20: and uh so uh I definitely think DBT is

02:25: something that it's um it's I think it's

02:28: hard to learn in the abstract. It's it's

02:30: very much like a kind of practical tool

02:31: that you I think sort of have to learn

02:33: by doing. Um and I primarily work on uh

02:36: public transit data as Michael

02:38: mentioned. So, um, we do modern data

02:41: infrastructure, uh, for public transit

02:44: organizations. Um, so that's kind of my

02:47: background. Yeah.

02:48: >> Well, it's so good to to um have you

02:51: both here. And Lori, you have some fans

02:53: in the chat. They're like, I wasn't

02:55: going to miss hearing Lori talk about

02:56: GBT. I'm here for Lori. So, we're so

02:59: excited to have you. Um, let's go ahead

03:02: and get started. But first, I would love

03:05: for everybody to like we've done this a

03:07: couple of times in other places and it

03:09: makes me smile so much. If you happen to

03:11: have a rubber duck, like a debugging

03:12: duck with you on your desk, please feel

03:16: free at some point to share a picture of

03:17: it in the Discord or hold it up and say

03:19: hi. Yeah, James has Figment with him.

03:22: His his debugging duck. This is Rocket.

03:25: I also have Desus Goose with me here um

03:27: from Untitled Goose Game who has a hair

03:31: clip in his mouth. Wait.

03:33: >> All right, everybody.

03:35: >> Michael, do you have any debugging ducks

03:36: or uh Lori has one?

03:39: >> I have

03:40: >> I mean I have this baguette. Could it be

03:42: a debugging?

03:44: >> A debag getting? Yes,

03:47: >> debaguetting. You know,

03:48: >> we will allow it. Lori, your duck has a

03:50: little space helmet.

03:53: >> Uh yeah, I believe that this is Jarvis

03:56: um swag from some point. I don't know,

03:59: Michael, if you ever got one, but we got

04:00: space at some point

04:02: >> that I think they saved the swag only

04:04: for people who were

04:06: >> DBT users, not DBT appreciators. You

04:08: know, that wasn't enough to

04:11: >> a get the All right. Well, let's go

04:13: ahead and get started. Michael and Lori,

04:16: can you please let us know what we are

04:18: doing today, what we're learning?

04:20: [clears throat]

04:21: >> Yeah, why don't maybe I'll I'll crack

04:23: open. So Jenna shared a link to the talk

04:25: which was literally like after I joined

04:28: Posit um and Lori came into Jarvis which

04:33: is where I went. So I went from Jarvis

04:35: to Posit. Lori came in fixed all my

04:37: mistakes. The talk Jenna shared was

04:39: about sort of like how I realized how

04:42: important DBT was. Um so that's a good

04:45: one. I'm just going to share maybe I

04:47: could just share like one slide that I

04:49: think is really important and was aimed

04:51: at our users from that talk. Um, and

04:54: Lori, I think has some stuff to add to

04:57: it. And then I'll go into running like a

05:01: really simple DBT project and just

05:03: looking around and and just seeing cuz

05:06: if you've tried to run DVT, you may have

05:07: seen like there's a lot of parts and

05:09: sometimes it's hard even to just fire up

05:12: the the basics.

05:14: >> Yeah, I told I told Michael I just

05:16: shared a beginner project that Michael's

05:18: going to be using, a GitHub repo in the

05:19: chat. I told him I opened it and I

05:21: cloned it to my machine and opened it in

05:23: positron and then I was like crap I

05:25: don't know where [clears throat] to go

05:26: from here. I don't know what I'm

05:27: supposed to be doing.

05:28: >> Totally. Yeah. So this is just to

05:31: foreshadow this is the project will

05:33: open. Let me share it in Discord. I'll

05:36: also share it out in the Zoom just in

05:37: case. Um so we'll we'll go into this

05:41: Joffrey shop duck DB. Um just just a

05:45: basic look at dbt and how you can see it

05:48: running and and what the different parts

05:49: are. Um what I'm going to do is I'm

05:53: going to run it in a code space. So I I

05:56: clicked code and then I clicked um

05:59: create a code space. So that that might

06:01: be good to do if you want to follow

06:03: along. Um you could fire that code space

06:06: up right now. It takes like a minute or

06:08: two to start. Um, and in the in the

06:13: >> not have the button for the code space

06:15: >> you might have to log in or they they

06:18: may have made it so you have to like

06:19: click to activate.

06:21: >> One more time.

06:22: >> Yeah. So if I click code and go to code

06:26: spaces. So click from local to code

06:28: spaces.

06:30: >> Oh, that's what I was missing. Local.

06:32: >> Oh no. Okay.

06:33: >> No. So there's a little tab.

06:35: >> I just wasn't seeing. I did have to log

06:36: in. Okay. I mean, if you if you couldn't

06:38: find it, I'm sure other people had

06:40: trouble. So, I'm glad you

06:42: >> I'm not alone.

06:43: >> Lagged. Yeah. So, the the one thing I

06:46: just want to explain about why DBT

06:48: really fast uh comes from this talk, the

06:52: accidental analytics engineer. And what

06:56: I'll just say is like if you're coming

06:57: from R or even doing data analysis in

07:00: Python, you may think of data analysis

07:02: from this perspective. So this is the um

07:06: this is the uh data science sort of

07:09: workflow that had intro hadly wickham

07:12: introduced in R for data science. Um,

07:16: and so you might think of data analysis

07:17: like this where you sort of start from

07:19: some raw data and you tidy it up and

07:23: transform it a bit and then go into this

07:25: cycle of understanding and once you've

07:28: sort of visualized and modeled the data

07:30: done this sort of exploratory data

07:31: analysis and found something interesting

07:34: maybe you you go on to communicate it

07:37: through say like a cordto document or a

07:41: dashboard um you know ship the results

07:44: out. This is a very endto-end workflow.

07:47: Um, and I think a lot of people on

07:49: smaller teams get a lot out of this

07:51: workflow, sort of going from raw data to

07:53: insights. What I'll say is that in a lot

07:57: of the context I think where DBT is

07:59: helpful and to try to make sense of why

08:01: orgs use DBT, I think that um big orgs

08:05: tend to be more like this. So you chop

08:08: it up.

08:10: So you might have a data engineer for

08:13: most what you think of as importing. So

08:15: like extracting and loading data into

08:18: say like a database or like a a bucket.

08:22: Um you have an analytics engineer who

08:25: then is doing a lot of the tidying and

08:26: transforming. They call this sometimes

08:28: like data modeling. I should have put it

08:30: in air quotes, but um that's like

08:35: uh uh structuring the data in a way

08:37: that's that's really friendly for

08:39: analysis.

08:41: And then you have the analysts here that

08:43: might be in like a BI tool or in

08:45: notebooks somewhere pulling that tidy

08:48: and transform data and analyzing it say

08:52: pulling it from a a database. So I think

08:56: enterprises and bigger teams tend to see

08:59: the process like this. There's more sort

09:01: of like handoff between each of these

09:03: stages. Um and this is the um this is a

09:09: a figure from um a DBT article about the

09:12: modern data stack which sort of shows

09:14: how they view it in this way. So they

09:17: have like data loaders then they have

09:19: dbt here and then analysts in in BI

09:22: tools. I'll also say I think they also

09:25: see it like this like there's a lot of

09:28: these analyses floating around. There's

09:30: a lot of data being extracted, a lot of

09:33: data being transformed and a lot of data

09:35: being analyzed. So once you go to that

09:38: workflow, you tend to get like a lot

09:41: more need to really like engineer and

09:44: test and work out processes around um

09:49: data transformation. Uh Lori, do you

09:52: have anything you want to add?

09:53: >> Yeah, I think the way that I think about

09:55: it is one, I think it's important to

09:57: have this context in mind because DBT

10:00: isn't necessarily a tool that is super

10:03: intuitive if you're kind of tinkering

10:05: with it on your own because it's really

10:07: designed to facilitate kind of like

10:10: organizational collaboration and sort of

10:14: production use and orchestration of like

10:17: production data pipelines. And so it's

10:20: not a tool like you can learn how to use

10:23: dbt on your own but like it may not

10:26: really a lot of its features are really

10:28: geared towards like kind of running and

10:31: being deployed in a in a kind of

10:32: production environment and a

10:34: specifically collaboration on a project.

10:36: And so I think that's one of the um

10:40: things that can be confusing for people

10:42: trying to like learn DBT is that it's

10:44: really designed to be used together to

10:47: to maintain a data warehouse in an

10:50: organizational context and it's not

10:52: necessarily something that like a lot of

10:54: the tools may not like a lot of its

10:56: features may not make a lot of sense if

10:57: you're just like working on it locally.

10:59: Um, and the other way I frame it

11:00: sometimes is thinking about from an

11:02: analyst perspective, DBT is sort of the

11:04: tool that is like preparing. It's kind

11:06: of moving up the floor of the analyst

11:09: workflow. So instead of like me as an

11:10: analyst having to go like grab, you

11:13: know, super raw messy data from some

11:15: kind of source, it's like raising the

11:18: floor of that data. So instead of going

11:20: to that source and doing all of the kind

11:22: of like um really nitty-gritty cleaning

11:25: like the the analytics engineer and the

11:27: data engineer are trying to give you as

11:28: the analyst cleaner more prepared data

11:31: so that you're focusing more on the like

11:34: analysis and insights and less on the

11:36: data cleaning and transformation. Um

11:40: so

11:40: >> yeah. Yeah, totally

11:42: >> perfect. Um, so maybe with that in mind,

11:45: I I'm going to crack open um

11:49: this project so we can just see DBT in

11:51: action because I think to Lor's point,

11:53: like it's a big machine. There's a lot

11:55: of if you're just coming at it from the

11:57: perspective of like doing a single data

11:59: analysis, it feels like a lot of

12:00: boilerplate. So it can be pretty

12:02: overwhelming to like run. Um, but uh I I

12:08: honestly I think once you have someone

12:09: crack it open and kind of like point out

12:11: the different pieces, I feel like

12:13: >> it's way easier to just understand what

12:16: you're getting into. So

12:18: >> hopefully we'll see. I'm going to be

12:20: asking so many questions. I'm going to

12:21: have like a notes dog open in the side.

12:24: Um,

12:25: >> um, I mean, I'm going to be asking

12:26: questions, too. And Lori, I feel like,

12:28: >> and this is also like everybody in

12:30: Discord, this is the time to stop

12:32: Michael and Lori and ask questions to be

12:35: like, "What did you just click? What was

12:37: that? What does that file folder mean?"

12:39: Like, this is the time. So, don't feel

12:41: shy about asking.

12:42: >> Yeah. I would I'd be really curious,

12:44: too, to hear in like Discord like what

12:46: people are interested in dbt. Like, what

12:48: are people curious about? Like, are you

12:50: curious about using DBT?

12:53: Are there people in your org using it?

12:55: Yeah.

12:55: >> Well, so like Marcos was saying, okay,

12:58: so my assumption was somewhat correct.

12:59: It's not really a tool for data

13:01: scientists to fiddle with on their own.

13:02: Its purpose is to be in these big flows.

13:05: And I think that one of the questions we

13:07: get a lot is like, okay,

13:10: um, I want to learn this tool that I

13:14: would need to use inside of an

13:15: organization. I need to be able to talk

13:16: about an interview or get experience

13:18: with it, but it's not something that a

13:20: solo data scientist really needs. then

13:21: how do I build up that like core skill

13:24: set if I don't have organizational

13:26: problems to apply it to? Right? So

13:29: that's a that's one question and then

13:31: Aarin was like could we back up for one

13:33: second and explain what DBT is? DBT

13:35: stands for data build tool and it's all

13:38: lowercase always.

13:39: >> I don't know why. Um but

13:42: >> yeah Martine is also like what is DBT?

13:45: It's a framework for ETL. Yeah, I I have

13:49: um I have some [clears throat] slides

13:52: when I talk about this where it's like

13:53: DBT is like literally what is it is I

13:58: think for this we're going to be talking

13:59: about DBT core which is just a Python

14:02: like what it literally is is a Python

14:04: package um that can execute like SQL it

14:09: it basically provides a framework for or

14:12: like executing a bunch of SQL scripts in

14:15: a specific order against like a data

14:18: warehouse environment. Um, and so it

14:20: it's a Python package that provides like

14:23: a wrapper around SQL code that you're

14:27: running in an in an environment. Um, DBT

14:31: the company DBT Labs also there's like a

14:34: SAS product which is DBT cloud which is

14:36: like a hosted version. They just last

14:38: year released DBT Fusion which is sort

14:40: of like a new in between um

14:45: like layer um which you know folks can

14:48: go look at the product information for

14:50: that but um DBT core kind of like the

14:52: basic is is a Python package. Um

14:55: >> yeah,

14:55: >> perfect. I think to

14:58: I I I find one tricky thing with when

15:00: people start talking about data tools is

15:02: sometimes when they answer what

15:04: something is they get very abstract

15:07: like in in my mind like dbt is what it

15:10: does and this I think joffleshop this

15:14: example joffles db is useful because it

15:16: just shows what dbt does so you can just

15:20: see like what goes in what comes out.

15:22: >> Yeah. Michael walked through like a

15:23: little bit of this for me and I just

15:24: like just see what it did. I'm like,

15:26: "Oh, now I know what DBT is."

15:28: >> Isabelle questions in the chat for us,

15:30: too.

15:31: >> Yeah, there are a couple follow-up

15:32: questions. So, since it's a Python

15:35: package, is it interesting for our

15:37: users?

15:39: >> Yeah, I mean, let's let's run the demo

15:41: and I think that'll contextualize a lot.

15:43: Like, you'll see once it runs like kind

15:46: of where Python comes in, which is not

15:49: really at all. Uh,

15:50: >> yeah, I was gonna say this is not

15:51: >> I think once we get through

15:53: >> I'm a Python power user and I'm using

15:54: this. No, no, no. [laughter]

15:56: >> And honestly, all these questions make

15:57: so much sense. Yeah,

15:59: >> they do. I I I mostly say that because I

16:01: think often people are wondering whether

16:04: DBT is like a language of some kind or

16:08: also if it's some kind of data storage

16:10: like DBT does not store data itself.

16:14: It's not any kind of like database

16:16: itself. It's like it's a framework for

16:20: storing your code basically. It's like a

16:22: way to organize your data transformation

16:24: code. Um

16:25: >> I've been calling it a framework, not a

16:27: language.

16:28: >> Yeah.

16:28: >> Yeah. All right. Let's let's run this.

16:30: >> Let's do it before we talk anymore cuz

16:32: we're 18 minutes in a lot of these

16:34: questions.

16:34: >> I think we'll just get more questions.

16:36: >> Yeah. I I had all these questions too.

16:38: So So I'm glad people are asking. But

16:41: okay, so I just went into the code

16:43: space. I created one. This is one that's

16:46: already run a little bit and installed

16:49: and so it's really fast. Like this

16:52: tutorial I think where does it have that

16:55: little drop down that's like

16:57: how okay so if you go down here running

17:00: this project this is the fastest

17:03: possible explanation they have. So

17:06: they're like in these bits of code you

17:08: can run this project.

17:10: um in our code space we're already we've

17:13: already done these two things and I

17:16: think we maybe even did the virtual M um

17:21: so if I do

17:22: >> it has done it for you

17:25: >> uh let me see

17:26: >> or are you saying that you did it before

17:27: you spun this before you shared your

17:29: screen with us?

17:30: >> Uh I I think that it did it for us but

17:33: why don't I just run it again this step.

17:35: So I'm going to run this part.

17:38: >> Okay. Why don't I just run this? I'll do

17:41: this step by step so you can see it.

17:44: >> And as a reminder for everybody, he's in

17:46: the terminal. This is CLI. He's not in a

17:49: Python console or Python ripple.

17:52: >> Yeah. Yep. Okay. So, that ran and now we

17:55: have our virtual environment.

17:57: And then I'm going to install these

17:59: requirements. This might take a sec.

18:02: See?

18:03: Very cool.

18:05: I get a million popups. I'll allow I'll

18:08: allow you to do anything VS Code. Let's

18:10: do this. Okay. So, while that installs,

18:12: I'm going to grab the next command.

18:15: Uh it's weird because we already

18:19: did that.

18:19: >> We already activated.

18:21: >> That's not necessary, but I'm just going

18:23: to do it anyways cuz I'm a good

18:24: direction follower. So,

18:26: >> sometimes there's a reason and they're

18:27: just not telling you what it is.

18:29: >> Yeah. All right. And then this is where

18:31: I think this will hopefully make sense.

18:33: So just to show you like right now we

18:37: have um this folder which is models and

18:42: notice why don't I just open on on

18:43: GitHub so you can see it there. So in

18:46: models

18:48: notice there are these SQL files

18:51: um and basically we're going to get

18:54: tables for every SQL file. So if we look

18:57: in there's a bunch of SQL and there's

19:00: there's a final sort of query down here.

19:03: So every SQL file we want to basically

19:06: produce a table from for this JavaScript

19:09: data. So when I run dbt

19:13: uh what's the command Lori?

19:15: >> DBT

19:15: >> dbt run build dbt build

19:17: >> dbt build.

19:18: >> This is where my

19:21: >> idiosac is going to show. So dbt build.

19:24: All right, let's see.

19:29: Okay, so it ran and then the key is it

19:34: has created a database called joffleshop

19:38: duct db. Um, and that has tables for

19:42: each SQL file basically in this project.

19:46: So if you go into models, you'll notice

19:49: there's like customers, there's orders.

19:52: Let's just look at that. So, what I'm

19:55: going to do is I'm going to install this

19:57: um

19:58: duct DB uh CLI

20:02: so I can see it a little more closely.

20:04: So, I already ran this, but um why don't

20:07: I just run it again?

20:08: >> In the chat. Oh, wait. Michael did.

20:10: >> Yeah, I dropped into Discord. Let me

20:11: drop it.

20:12: >> Good job.

20:13: >> Zoom, too.

20:15: >> This is so we can kind of

20:16: >> can't get to Discord.

20:18: >> Yeah, this is so we can poke around a

20:20: little bit. Notice that one problem is

20:22: they say you need to run this command to

20:24: do duct db. So I'm going to click I'm

20:26: gonna paste this in um and run it. I

20:30: already did. So all right. And now when

20:33: I type duck db

20:37: I have this little command line where I

20:38: can see the um stuff. So now I'm going

20:43: to do show tables.

20:46: Uhoh. Oh, I need to connect.

20:49: >> Yep. Yep. Yeah. Wait, wait, wait, wait.

20:51: Sorry. Duck DB. And then do I just I put

20:54: the name of the database in, right?

20:59: >> Yeah. I think that's why it's suggesting

21:00: you can auto comp. Yeah.

21:04: >> Oh, very cool. Okay. All right. This is

21:07: why we pair. All right. So, notice now

21:11: we have a customers table, we have an

21:14: orders table, and that matches these SQL

21:17: files and models.

21:19: Um, so that that shows us like DBT did

21:23: something to create these tables from

21:26: these SQL files. Um, you might notice we

21:29: have all these other tables and um, so

21:33: there's a way to find these.

21:36: The staging tables are in here. So

21:39: notice there's a SQL file for stage

21:41: customers, stage orders, stage payments,

21:45: and then raw is a little bit tricky.

21:49: it corresponds to this data in this

21:52: seeds folder. So my whole point is like

21:55: there's there's already kind of like a

21:57: lot going on. But I just want to point

22:00: out like we have a table for everything

22:04: in seeds. These raw customers say maps

22:07: to here we have a table for every SQL

22:11: file inside models/staging.

22:15: So stage customers is here and we have a

22:18: SQL file. We have a table for all the

22:21: other SQL files. So like orders.sql

22:24: and customers.sql.

22:27: So let's just like

22:30: stop and appreciate like already so much

22:33: has happened but the key is like these

22:37: things in seeds and the SQL files and

22:39: models now each have a table.

22:44: So just I would just think about that

22:45: like dbt build produced a table in the

22:49: database for these different files. Some

22:52: of them were CSVs those were raw data

22:55: some were SQL with SQL queries.

23:00: Um and

23:01: >> yeah, Lori, do you have

23:02: >> I Yeah, I think this is where

23:05: the some of the sort of

23:09: challenge like the the challenge with

23:11: like using a sandbox environment like

23:13: this is that the reason that we have

23:16: those CSV files and the duct DB file

23:22: locally are so that this is like a

23:24: self-contained local example like in a

23:28: kind of organizational

23:30: context your raw data would probably be

23:33: coming from some upstream you know your

23:35: APIs or your buckets or what like your

23:37: that's your raw data um so those CSV

23:40: files here are taking the the place of

23:42: that so that this is a self-contained

23:44: example and then that duck DB file that

23:46: is local that we're looking at this CLI

23:48: you know in reality that might be your

23:50: snowflake or your data bricks or your

23:52: big query or such um so like I I think

23:56: this is one of the challenges is

23:57: sometimes to make it work locally, you

24:00: kind of have to add these things that

24:01: also make it more confusing. Um because

24:04: like it's not that dbt itself you have

24:06: to have duct DB locally or you have to

24:08: have like your raw data in CSVs locally.

24:10: Like that's part of making this a

24:12: sandbox, but um it it I think it

24:16: sometimes makes it harder to understand

24:17: the concepts because um you have to do

24:20: some stuff to make it work. I I

24:22: personally find it easier because before

24:24: the duct DB stuff existed, you had to

24:27: connect to snow. You had to connect to

24:29: BigQuery. Like all their docs and their

24:31: tutorials were like

24:32: >> sign up for BigQuery.

24:34: >> So you have to like connect to a

24:36: warehouse.

24:37: >> So I'd almost flip it and I'd say like

24:40: >> if you have these CSVs

24:42: >> and duct DB, you can just run everything

24:44: >> locally. It's true. You won't get quite

24:47: the same production environment because

24:49: you won't be like hitting Snowflake or

24:51: Big Query. Um, but you can kind of like

24:54: open it up and tinker it at least.

24:57: >> No, it it definitely makes it more

24:59: accessible to learn to be able to have

25:01: the sandbox, but I think it can be

25:03: confusing about how the sandbox concepts

25:06: translate to like real life examples of

25:09: using DBT. That's more what I mean is

25:11: that like the way that you would use a

25:14: seed in a kind of real DBT project is

25:17: not all your raw data is CSVs in the

25:20: repo, you know, like um and so I think

25:21: it's it's more like the the conceptual

25:23: mapping is like a little unclear, but

25:25: yes, it is now very nice that you can

25:28: have DuckDB and actually do this without

25:30: having to figure out connecting to a

25:31: cloud.

25:32: >> Yeah.

25:32: >> Um why don't we pause really quickly and

25:35: answer some questions in the Discord

25:36: that are popping up that might give us

25:38: some clarity. Yeah.

25:39: >> Um,

25:40: >> if I can just if you if you don't mind

25:42: just reiterating what Lori said, like I

25:44: feel like one really important thing she

25:45: just said is that seeds like Lori

25:48: pointed out like seeds is really useful

25:50: here for a tutorial like a local

25:52: tutorial, but you're not going to at

25:54: work you're probably not going to find a

25:56: seeds folder because your data will say

25:59: like already be in a warehouse or

26:02: somewhere else. It's pretty they're not

26:04: going to check all your data in to your

26:06: like dbt git repository

26:10: which I think is important to flag.

26:12: Yeah, sorry. Okay, go ahead.

26:14: >> Totally makes sense.

26:16: Okay, Hubert had asked I assume there's

26:19: some sort of cocurrency or dependency

26:23: capability. Thinking of like Oracle job

26:25: chains that have dependencies maybe

26:28: tackle that.

26:29: >> Yeah. So that's kind of like that's one

26:31: of the kind of superpowers of dbt. So

26:33: Michael, can you scroll up to where you

26:35: did the dbt build and show like what it

26:37: actually printed. Um so what dbt did is

26:42: it's not just that it created all those

26:43: tables, but it created them in order

26:46: based on dependencies that it is kind of

26:50: um like inferring from like how those

26:53: those SQL files are specified. So you

26:55: can see it runs like each one like it

26:57: has this ordered list of run this then

26:59: run this then run this. Um and that is

27:03: happening because I don't know Michael

27:05: can we pull up the um

27:07: >> like maybe staging c well no those are

27:10: going to be weird because they're going

27:11: to pull from source or I guess if

27:14: they're seeds it might be okay.

27:15: >> Um

27:16: >> right here maybe we can bail out if it

27:18: gets funky but

27:21: >> um

27:21: >> Oh you're right. There's even a note

27:23: here.

27:24: Yeah. So the way that it's inferring

27:27: like okay I need to run like raw

27:30: customers before I run staging customers

27:33: is because of that line on line seven

27:36: where it says select star from ref raw

27:38: customers. That like ref macro is saying

27:41: like I this staging customers model

27:44: depends on that raw customers model. So

27:47: I need raw customers to exist before I

27:49: can run staging customers. And so the

27:51: the ref macro here is like one of the

27:56: really important parts of dbt because it

27:58: allows you to like it it will infer your

28:03: dependency tree from the use of this

28:06: macro. And um the other thing that's

28:09: important about this is you can see it's

28:11: just saying ref raw customers. It's not

28:13: specifying like a full table name in the

28:17: in the database. It's not saying from

28:19: you know sche duct db.ske schema.table

28:22: name. It's just giving the name of the

28:25: model like within the dbt project. And

28:28: so this is doing two things. It's like

28:30: making the dependency tree but it also

28:32: means that dbt can run sort of against

28:35: different environments like you're not

28:37: fully specifying storage locations

28:40: within a specific warehouse. So this

28:42: helps you have things like maybe a test

28:44: warehouse environment and a production

28:47: warehouse environment and your DBT

28:49: project. You can write the code in a way

28:50: that's like environment agnostic and

28:52: then dbt resolves those references for

28:55: you. Um, so the ref macro is like one of

28:59: the like really really important um like

29:03: features of dbt that helps with both of

29:06: those things of the dependency tree and

29:08: then also making it sort of environment

29:10: agnostic and letting you can run the

29:12: same DBT project against different

29:14: warehouse instances and it will resolve

29:16: those. It will make raw customers into

29:19: that like schema.t table name according

29:22: to like the settings of the connection

29:25: between the DBT project and the

29:26: environment if that makes sense.

29:28: >> All right.

29:29: >> I'm sure our users have had that

29:31: experience of like you're quering tables

29:34: and yeah like a table name changes and

29:37: and a but everything downstream

29:39: basically breaks. Uh

29:43: >> all right cool let's hop to another

29:45: question. See if we can get a couple

29:47: more in here. Adrienne had said, "I've

29:50: written some Python files. It's more

29:52: getting an orchestrator, I think that's

29:54: the term, to run code hopefully in the

29:57: cloud and not on my laptop in a somewhat

29:59: automated fashion. And I'm wondering if

30:01: DBT has any of that execution."

30:04: Um, so kind of um DBT is not a generic

30:10: orchestrator in that sense like your

30:12: Airflow Dagter prefect. DBT is sort of

30:16: like half of an orchestrator and more

30:20: specifically for SQL. Um, and so DBT can

30:26: have some Python um, code in it, but

30:30: it's not DBT is not going to like run an

30:33: arbitrary Python script on a schedule.

30:35: So normally with dbt project if you're

30:38: using dbt core you would have a separate

30:41: orchestrator like an airflow dagger

30:43: prefect that's running that's like

30:45: kicking off your dbt project like dbt

30:48: core you can't like schedule it itself.

30:51: It it does the dependency and the

30:53: ordering stuff but it doesn't have like

30:55: the scheduling and it doesn't have like

30:57: an execution environment on its own. So

30:59: you would have like an airflow that

31:02: kicks off your DVT project run if that

31:05: makes sense. Um so it has some of the

31:07: features but it yeah not all.

31:09: >> Okay good to know. Um Aaron asked if

31:12: we're starting this project from scratch

31:14: it would just start with the SQL code

31:16: pulling into tables.

31:19: Yes. That very first thing that he ran

31:21: that DBT build it looked at a couple of

31:24: different places in order to make

31:26: tables. So, it looked for the models,

31:29: the like SQL files, but it also looked

31:32: for our CSV files that we had in our

31:33: seed folder. Um, and as Michael and

31:36: Lorie said, those CSV files are sort of

31:40: conceptually taking the place of

31:42: database connections where we would call

31:44: database connections. We wouldn't have

31:45: these like flat files locally, but we're

31:48: trying to use DBT locally when it's

31:49: really built to be like a system that's

31:52: plugged into a larger system. Um, and we

31:55: did have a question, a couple of

31:58: questions from Siraj and Marcos that are

32:00: kind of connected. So, I'd love to

32:01: tackle those. Um, both Siraj and Marcos

32:03: had asked like, "How is this better than

32:05: writing Python functions or a Python

32:08: script to do this automation? What are

32:10: the benefits of using DBT versus just a

32:12: Python script?" So, DBT has a ton of

32:17: features baked in

32:19: for things that you want if what you're

32:21: trying to do is specifically I on a

32:24: regular cadence want to pull in data and

32:27: then run a bunch of uh transformations

32:31: on it using SQL like that's kind

32:34: >> like volume size of the data is part of

32:36: the difference. Um it's that it gives

32:38: you a lot of additional fe so it has

32:41: things like the ref macro like I've I've

32:44: looked at a project that I think where

32:47: people kind of homegrrew a lot of the

32:49: features of dbt and like manually

32:53: orchestrating your SQL ordering and like

32:56: or your execution of like run this then

32:58: run this like dbt kind of gives you that

32:59: out of the box. DBT also gives you um

33:03: again a kind of a framework for how you

33:05: connect to the different database

33:06: environments like out of the box that

33:08: you might not want to write yourself of

33:10: like okay here's how I manage different

33:12: connections. DBT also or uh can we look

33:15: at the YAML file Michael schema.yaml Y

33:18: >> yeah.

33:18: >> Um so dbt also gives you out of the box

33:21: these things like the a framework for

33:23: testing. So um you can just specify in

33:27: YAML files like different tests that you

33:30: want to run as you're executing your uh

33:33: transformations. Um, and so it it gives

33:36: you like it it kind of just gives you a

33:39: a lot of things that you would likely

33:41: want to do that you don't then don't

33:43: have to like manually um implement

33:47: yourself basically. Um,

33:50: >> and DBT is also definitely kind of I

33:53: think it comes from the idea that you

33:55: have a cloud warehouse where you're

33:56: running this. And so there is also the

33:58: the question of it's it's like assuming

34:00: that you're running in kind of like a

34:01: sort of bigger data cloud warehouse

34:03: instance. Um

34:05: >> yeah. Okay. Perfect. And that kind of

34:07: leads into Siraj's next question. Did

34:10: you have something to add Michael?

34:11: >> I will say

34:13: uh there are like

34:17: there is this interesting space in DBT

34:19: which is like anything that can generate

34:22: SQL can be made into a DBT adapter. So

34:26: there are like for example ibis is

34:29: similar to dbplier but for python and it

34:32: can generate SQL and um

34:36: ibis dbt adapter.

34:40: Where are you here? Like there is this

34:43: funny space of like people who have

34:45: integrated like cool that can generate

34:48: SQL into dbt.

34:50: Um, but it's this space isn't like super

34:55: common. So, you're kind of like a bit

34:58: off the like [snorts] beaten path is the

35:00: problem. I think to Jenna's point, like

35:04: yeah, this this quote like if you choose

35:06: not to use dbt, you'll probably waste

35:07: time building a less fully featured

35:09: buggy implementation of it yourself.

35:11: That's real. Um, and and the reality is

35:14: just like R and Python are way less

35:16: integrated into DBT. So if you're used

35:19: to like generating SQL and DB plier,

35:22: there's just not like really common well

35:25: trodd paths to move that in. And I think

35:28: I think part of it also that analytics

35:30: engineers don't want to worry about all

35:33: these like bespoke tools when a lot of

35:35: them are very like SQL savvy.

35:39: >> All right, cool.

35:42: Let's hop over to question from Siraj

35:45: which said does it make sense to say

35:48: that the data source detection is

35:50: dynamic with DBT unlike snowflake big

35:53: query etc where we have to manually set

35:55: sources and the sources can be different

35:58: formats

36:00: um you uh I'm not I'm not 100% sure how

36:06: to answer that you you do have to

36:08: specify in dbt what your sources are um

36:14: like you on two levels. So one you

36:18: connect DBT to the warehouse environment

36:20: where it's going to execute. So like it

36:22: only has a DBT project can only execute

36:25: against a warehouse that has been

36:27: configured to connect to like there's

36:29: you know there's an aspect of like

36:30: credential like you have to be running

36:31: it through a connection in a warehouse.

36:34: Um and then the other thing is you do

36:36: specify where your sources live. Um, so

36:40: this is where the sandbox is a little

36:41: odd. I don't think they actually have a

36:43: sources like they don't have anything

36:45: configured as sources

36:46: >> because they're using all the seeds, I

36:48: guess.

36:48: >> Yeah. But normally the way it would work

36:50: is that you would have in in a YAML file

36:52: like this, you would specify like say

36:54: that my upstream source is um like a an

36:58: external table

37:00: um that like data is landing in a bucket

37:02: and I've got an external table. I would

37:05: tell dbt about that external table and

37:07: like it needs to know where to find.

37:10: Yeah, you can see external location. So

37:12: like DBT needs to know where your source

37:14: uh lives and like they they have to be

37:16: named so that DBT can like resolve the

37:19: references. I the dynamic aspect is more

37:23: in the reference resolution like within

37:25: the DBT project um in terms of like that

37:29: the reference macro that the ref macro

37:31: that we looked at. Um, [clears throat]

37:33: but you you do have to kind of give it

37:35: defined sources. Yeah,

37:37: >> I will say this is a this tool dbt duct

37:40: db is a fun way to

37:43: kind of beef up these tutorials which is

37:45: like rather than so here we generated a

37:51: ductb database basically. But what dbt

37:56: duct db adapter lets you do is your

37:59: database could be a f a folder of

38:01: parquet files. So essentially like your

38:05: whole database could just be reading and

38:06: writing from a folder of parquet. Um and

38:11: that's that's what's shown here in this

38:12: source is like my external location is

38:15: this S3 paret bucket.

38:18: >> Um so duct DB is good with that kind of

38:20: stuff. Uh

38:21: >> I like that. That definitely fills in

38:23: that gap.

38:25: >> Okay, cool. Um, there was a nonquest

38:29: sort of a question. It was a pseudo

38:30: question. Let me go find it.

38:32: >> Yeah, I know. I saw Jenna also mentioned

38:34: running the docs. DBT.

38:36: >> Yes,

38:36: >> doc. Should we do that?

38:39: >> Doc uh or dbt docs generate and then dbt

38:42: docs serve. And if we could talk a

38:43: little bit about the importance of those

38:46: and Jenna, if you would like to hop in,

38:48: feel free. we can send you a little like

38:50: thing that lets you unmute.

38:55: >> Uh okay.

38:56: >> Yeah.

38:56: >> So,

38:57: >> so um DBT docs, so part of again this

39:01: idea of dbt as a framework. So when dbt

39:06: runs

39:08: there are slightly different run modes

39:11: but basically dbt is compiling like we

39:14: you know is compiling all of the

39:17: references and it's like inferring that

39:19: dependency tree and it outputs um some

39:24: like

39:26: special JSON files that basically kind

39:28: of have all that compiled information

39:30: and then that allows you to do different

39:32: things kind of like to parse your

39:35: project. And one of the things that DBT

39:37: gives out of the box is the docs. Um,

39:42: >> and

39:43: >> is it target is target that has all

39:45: >> Yeah, it's it's in target and it um for

39:50: for docs it's catalog.json.

39:54: Um

39:54: >> Oh, yeah. Here. So, this is kind of like

39:56: the internal

39:58: >> Yeah.

39:59: >> how the sausage gets made.

40:01: >> Yeah. So these are huge really gnarly

40:03: JSON files that contain like a lot like

40:05: all the metadata and like all of the

40:07: resolved information that DBT does. Um

40:11: but then DBT provides kind of like a

40:13: user interface on top of that through

40:15: the doc site. Um where you can see

40:22: uh information about each of the models

40:24: um

40:25: >> and so [clears throat]

40:26: it'll give you

40:29: >> Wait, where's the graph? if I can't

40:31: remember. Oh, okay.

40:32: >> And bottom right, the little Yeah. So,

40:34: it'll show you your um your dependency

40:38: lineage as a and you can if you want to

40:41: Well, I guess this one's really basic,

40:42: but if you click the

40:44: >> to get here.

40:46: >> Um so, yeah, go back to the homepage,

40:48: Michael, of the doc site. Maybe

40:50: >> the DBC doc.

40:52: >> Let me restart the whole cuz it's

40:54: >> that's what we should share. It's kind

40:56: of like an if you know you know like

40:57: these things are clickable and this

41:00: actually expands

41:02: >> but also how you do we want to reiterate

41:04: how you generated it. So on in the

41:06: terminal dbt docs generate and dbt docs

41:10: serve.

41:11: >> Yeah. So I did

41:13: >> uh dbt docs generate.

41:16: >> Okay.

41:17: >> It's like oh I found a bunch of models

41:18: and seeds.

41:20: >> Okay.

41:20: >> And it tells me where the catalog is and

41:23: then dbt

41:25: doc surf. This is a bit tricky in code

41:27: spaces because it'll ask permission to

41:29: like open

41:31: >> um like notice it's on

41:34: >> right it's open like a special link.

41:36: >> It's not like a link that you can share.

41:37: It's going to open locally on your

41:39: machine if you're running it locally.

41:41: >> Yeah. So you can click here to if you

41:44: commandclick

41:46: >> it kind of knows to

41:48: open it in a special way.

41:50: >> Um so that's one kind of code space tip.

41:52: >> Great. Thank you. We didn't mean to

41:53: interrupt, but that's fantastic.

41:55: >> No, I'm glad you asked.

41:56: >> And just confirm.

41:58: >> Oh, sorry. That that command was run in

42:00: Python or somewhere.

42:03: >> Well, this is all this isn't terminal.

42:06: >> Okay, got it. It's a terminal command

42:08: through the dbt

42:10: >> command line interface like so dbt has

42:13: its own command line interface.

42:14: >> Cool.

42:15: >> Um,

42:17: and

42:18: >> yeah, and I

42:19: >> go ahead Michael.

42:20: >> Sorry, go ahead. Oh, I wouldn't worry

42:21: too much. Like dbt is implemented in

42:23: Python for now, but it's true like

42:25: they're porting a lot of things to Rust.

42:27: So yeah,

42:28: >> it being in Python's more like a

42:30: implementation detail than anything

42:32: else.

42:34: >> Yeah. Um, and then on the DBT docs

42:36: homepage, um, so the way you like the

42:41: way you'd interact with it on the left

42:42: is you can navigate it through either

42:44: the project, which is like the folder

42:47: view, and that will show things as

42:49: they're organized in the DBT project,

42:52: like the the directory structure within

42:54: your repo. Basically, if you go to the

42:56: database view, it will show how things

42:57: are organized within the database. So,

43:00: it'll show by like um by like schema

43:03: basically. Um, and so those are the two

43:06: ways to kind of navigate. And then each

43:09: uh model has its own page in the doc

43:12: site. So we can click on any of those

43:14: and see um and it'll have at the top it

43:18: has like kind of the summary

43:19: information. It has the columns um

43:23: and like each of those descriptions that

43:26: you see there, you can specify those in

43:29: the YAML file like within your DBT

43:32: project. you can write docs kind of

43:35: inline and then they'll render here

43:38: depending on your settings. they can

43:39: also be persisted into your warehouse um

43:42: so that you have kind of the same like

43:45: the same column descriptions can appear

43:47: in multiple places um and that

43:50: >> yeah that's and that's really um

43:52: >> so

43:54: benefits of dbt this is a huge one

43:56: because otherwise all of this would be

43:58: either manual or through another docs

44:00: framework maybe you're you're plugging

44:01: in because there are docs frameworks but

44:03: like

44:03: >> yeah so

44:04: >> this is really cool

44:05: >> just to map it back to so like this is

44:08: we're looking the customers table

44:11: >> and we can see like yeah these are

44:12: descriptions on the columns and where

44:15: that comes from is so notice in the

44:18: customers folder this is a bit tricky

44:20: but there's a schema.yaml YAML file.

44:23: >> I don't Lori, maybe in a sec you can

44:24: talk about how people like to write the

44:27: files because I know there's like some

44:29: conventions around that. But um here

44:32: notice it's like these are our models.

44:34: So in dbt a model is a

44:37: I I'm afraid to say it's a table or the

44:40: the output is a table. So each SQL file

44:42: produces a table and this models is a

44:45: list of tables. Um, so well it's not

44:51: just and tests and things like that but

44:54: so this is the customers table. This is

44:56: the description that DBT will put in the

44:58: docs and these are the column

45:01: descriptions [clears throat] as well.

45:03: And so

45:05: >> yeah, I think the reason that the reason

45:08: that it's model rather than just table

45:10: is because part of I think part of what

45:13: the sort of DBT philosophy is the idea

45:15: that your data transformations and a lot

45:18: of this metadata should live in version

45:20: controlled code, right? And that the

45:22: materialization like whether something

45:24: is a table or a view is like an

45:27: implementation detail and the important

45:28: part is the business logic that's

45:30: encapsulated in that model. So it's like

45:33: I mean for folks who've worked you know

45:35: sometimes you have like underscorev like

45:37: each each thing in the the database is

45:39: like oh is it a table or is it a view

45:40: and that's kind of often like how things

45:43: have been organized and dbt is like

45:45: whether it's a table or a view is just

45:46: an implementation detail related to like

45:48: performance and storage and from your

45:50: perspective you should care that it's

45:51: the customer's thing and like when I

45:53: need to get customers I go there and I

45:55: as a downstream consumer shouldn't care

45:56: if it's a table or view maybe I need to

45:58: change it later based on performance

46:01: considerations that arise over time. But

46:04: that's why model is used as like a

46:06: generic like it's it's you're building

46:08: your your uh data model like

46:10: conceptually more than

46:12: >> right and this it's a good call out for

46:14: a bunch of data scientists data

46:17: model

46:18: >> is data model not statistical model or

46:21: machine learning model um we're talking

46:23: about a data model and another good call

46:26: out is like the um

46:29: >> oh man I just lost my train of thought

46:30: what was I thinking two seconds before

46:32: this. Oh well, it'll come back to me.

46:35: But I wanted to hop over really quickly

46:37: to two things.

46:39: Jenna saying, "Michael, click the

46:41: lineage button."

46:42: >> And also Hadley Hadley saying, um,

46:48: >> is DBT just like kind of like our

46:50: studio, right? Like

46:52: >> the it gives you an environment for

46:55: developing SQL that lets you write

46:57: functions which are macros, tests,

46:59: documentation, all that stuff and share

47:00: it with your colleagues. Um, and then

47:03: Jenna mentioned DBT Studio, which I

47:04: didn't even know was a thing.

47:06: >> DBT?

47:07: >> Yeah. I don't Yeah,

47:08: >> I've I've basically only ever used DBT

47:12: core, which

47:15: so I've which means that I've used it in

47:18: like an IDE like a VS code IDE like

47:22: context. the DBT Studio

47:26: like DBT has other like products and

47:31: offerings that make it more like move it

47:33: more towards its own standalone kind of

47:34: IDE. Um, but

47:38: I think

47:40: DBT core kind of the just the bare bones

47:44: version is is sort of it's like in

47:46: between. It's it's a it's more of just a

47:48: framework for how you organize your code

47:51: more than inherently like a um

47:55: environment if that makes sense. Um

48:00: it's kind of hard. It I think DBT isn't

48:03: it's not a noun like it's it's not a

48:06: type of thing that I'm aware of a lot of

48:08: other types of things like it if that

48:10: makes sense. So it's kind of hard to

48:12: compare. Um

48:14: >> yeah, it doesn't help that it's like a

48:15: bit overloaded because there's a few

48:17: >> products. I I would almost just say

48:19: think about like data comes in whether

48:22: it's like seeds or it's like parquet

48:25: files in a folder or like some some

48:29: tables in a warehouse like raw tables in

48:31: a warehouse that a pipeline is put up.

48:33: DVT runs and it creates all the

48:36: downstream tables and runs the tests you

48:39: ask it to do and creates the like column

48:43: descriptions

48:45: um that you need.

48:47: >> Yeah. I like I think basically really

48:49: what it comes down to is it's really

48:51: focused on organizing your SQL code and

48:54: giving you some convenient ways to add

48:57: like related operations and metadata

49:00: through these YAML files. like that's

49:03: that's like the value ad. Um, and that

49:07: is a

49:09: I think the Michael mentioned like I

49:12: kind of refactored his codebase and

49:15: that's how I learned dbt and what the

49:16: original codebase was doing is we had

49:18: like an airflow instance that was

49:20: orchestrating a bunch of SQL

49:21: transformations one by one. So we had

49:23: like we were using just a generic

49:25: orchestrator and we were kind of

49:28: manually specifying all these

49:30: dependencies um and it was not scaling

49:33: well like there were some very bad choke

49:35: points and um there's also the question

49:38: of kind of boilerplate code. One of the

49:41: other things that DBT is doing is you

49:42: don't have to write your own um DDL or

49:45: DML statements. Like DBT you can focus

49:48: on writing the business logic in just

49:50: SQL and then DBT kind of generates some

49:53: of the boilerplate like create table as

49:54: aspects. Um and you you're like it takes

49:58: that off of your plate. Um, so

50:02: >> yeah, I do I do think to Hadley's point

50:04: like what made sense to me was like I've

50:06: seen a lot of people build dbt like

50:08: things to Jenna's point too. Like

50:10: actually there are so many ways to make

50:11: it work and if you're used to tools in

50:13: R, you've actually probably built really

50:15: reasonable you could have built like

50:16: really reasonable systems that

50:18: automatically detect dependencies.

50:21: Honestly, it's not a really hard tooling

50:23: problem. But I think that um I I think

50:27: the problem DVT solved is it created a

50:29: job like the analytics engineer role

50:32: like you know what an analytics engineer

50:34: should learn and it's mostly SQL

50:37: uh and these and orchestration with

50:40: things like DBT and the fact that this

50:43: group of people have converged on like

50:45: practices and language means you don't

50:49: have this like tower of babel where

50:51: everybody's bringing their own

50:53: >> Yeah.

50:54: orchestration tool with it. Like

50:56: >> I think it's why we love Tidyverse.

50:57: We're like, we have a syntax and

50:59: everyone's going to use that same syntax

51:01: and we're all going to speak the same

51:02: language and we're all going to

51:03: understand each other and that means we

51:04: can work together even better.

51:06: >> Yeah.

51:07: >> Yeah. Like I think DBT basically took a

51:10: lot of things that again that you would

51:12: want to do if what you're doing is I

51:15: have this I have this amount of data

51:16: that needs to flow through like every

51:18: day or every hour and I'm always needing

51:20: to do the same steps. Um, and I'm doing

51:22: that in the context of like a data

51:24: warehouse. DBT just bundles together a

51:27: lot of features that make your life

51:29: easier if that's what you're doing. Um,

51:32: and so it's the like taking away a lot

51:34: of boilerplate code. It's adding data

51:37: testing. It's giving you this kind of

51:39: docs site for free. Um, and the so the

51:43: dependency management is really

51:44: important, but it's like it's part of

51:46: this kind of coherent hole. And it's the

51:48: idea that like managing my data

51:50: warehouse is a it's like a collective

51:53: thing. I think it's also shifting to the

51:55: idea that the data warehouse is like is

51:58: kind of like a product and like that you

52:00: need that people should be kind of

52:01: curating and building it collectively. I

52:03: think often um at organizations that

52:06: have big data warehouses, sometimes

52:07: there's kind of like a free-for-all and

52:09: like different teams are managing

52:11: different schemas and like people are

52:12: kind of like using data um like whatever

52:15: they can scrge up, what they can find,

52:17: who they know, and it's trying to kind

52:19: of like make a more coherent hole and

52:22: kind of help you talk precisely and

52:25: collaboratively about your data

52:27: warehouse. Um

52:28: >> great. [clears throat] I do think

52:30: >> what maybe the one last one of the most

52:32: interesting features of DBT which is

52:34: hard to show off because you kind of

52:36: need like a big environment to really

52:39: appreciate this pain is like branching

52:41: that like if you're developing if you

52:44: have like six developers working on a

52:46: warehouse and they're you're working on

52:49: like some set of tables and you're like

52:52: okay I know I know what I'm doing starts

52:54: here at these tables and I just want to

52:57: like test without changing these tables

52:59: down here. Like how do you have like a

53:02: development environment

53:05: for your work? Like how do you just test

53:07: putting up a few tables in a warehouse?

53:10: That used to be really hard. Like it

53:11: used to be like you either had a

53:14: development or a staging warehouse and

53:16: and you still might, but like DBT is

53:19: really good at helping you like fork out

53:22: kind of like your development tables

53:26: without having to rename everything or

53:28: use like funny kind of like environment

53:30: variable

53:32: magic. it can just handle like your like

53:36: Lor's development tables for this PR

53:39: um which used to be a kind of a crazy

53:42: problem uh to solve.

53:46: >> All right, cool. Well, let's move on to

53:49: I think one of our last questions and I

53:52: will go find it cuz Becca had said,

53:54: "Thank you for showing us the sandbox.

53:57: Before we end, can you pretend you are

53:58: at step one of a brand new project

54:01: getting data from an imaginary or real

54:03: bucket like a warehouse or something?

54:04: And where would you begin?

54:07: >> Um,

54:07: >> you might have different Yeah.

54:09: >> Yeah. So, dbt does give you like a like

54:13: I can't remember what the command is,

54:14: but there's like a dbt project init kind

54:17: of command like a a starter template

54:19: project. Not like this is a a sandbox

54:23: project. They separately have like a

54:24: kind of start here. So, I would clone

54:28: that. I can't remember if it's dbt and

54:29: knit or if you clone that um starter

54:31: project. And then um and then I would

54:36: configure

54:37: you you'll have to configure your

54:39: connection to whatever warehouse you're

54:40: using. Um so if you have like if this is

54:43: a real like you're actually getting

54:45: started on a a thing like connect to

54:47: your snowflake or your data bricks or

54:49: whatever. Um or if you're doing it

54:52: locally, connect your ductb, configure

54:54: that in um dbt. There's profiles.yaml

54:59: and um that is where you configure that

55:03: connection. So connect to your warehouse

55:06: and then um I would make my first

55:09: source. So I would in a YAML file

55:12: specify like okay, what's my incoming

55:14: data? your external whatever your

55:16: external data is that you're starting

55:17: with configure that as a source um and

55:20: then I could write my first model a

55:22: staging model on top of that source that

55:24: maybe

55:26: cast data types renames column like

55:28: minimal um and dbt has uh really the

55:32: other thing dbt also has this very large

55:34: community they have a lot of uh

55:35: documentation blog posts best practices

55:38: materials out there um and so they have

55:40: kind of a dbt how we structure our

55:43: projects guide um and and which talks

55:46: through like the components of the DBT

55:48: project and so I'd kind of walk through

55:50: the steps basically uh following that.

55:52: >> Okay, great. I love that question by the

55:54: way because um this project is like all

55:57: fully fleshed out and all local and it's

55:58: a fantastic question because like where

56:00: where do you start when it's completely

56:02: empty? Okay, so we have two minutes

56:04: left. I want to do a quick shout out.

56:07: Hadley said, "So DPT gives SQL the tools

56:10: that most programming languages have

56:12: like testing and documentation." Yes.

56:15: Also, MVP of the chat goes to Jenna

56:18: Jordan. Thank you so much for hopping

56:19: in, answering questions, providing

56:21: resources. It's been amazing. Um, and it

56:24: also puts all of these steps into

56:27: version control. You can have them in

56:29: GitHub. That's super important. That's

56:31: another thing that like your stuff might

56:32: be all over the place if you don't do

56:34: that. Uh, and then Darren said, "When

56:37: I've thought about DBT, the issues it

56:39: solves is in part due to the dependency

56:41: management for traditional SQL focused

56:43: data teams. When you make changes to SQL

56:46: scripts, it's hard to know if these

56:47: changes can have downstream impacts.

56:49: With DBT, those dependencies can be

56:51: tested against. Is that somewhat

56:53: correct?" That is 100% correct. Yes,

56:56: that's the part of the value of exposing

56:58: that lineage and and having tests like

57:00: in line. So if you downstream you need

57:02: something to be unique, you can specify

57:04: that. Um and if you make a change

57:06: upstream, you can run you can list out

57:08: what are the downstream things that are

57:09: going to be affected by this. So yes.

57:11: >> Perfect. All right. Well, thank you

57:14: Michael. Thank you Lori.

57:15: >> Thanks for having us.

57:17: >> Yeah, it was a lot. DBT is a lot to wrap

57:19: your head around. Hadley said at the

57:20: chat, I feel like I know less about DBT

57:22: than when I came in here.

57:23: >> Great. Now the healing can begin, you

57:25: Yeah, it's probably because there were

57:27: some preconceived notions or confusions

57:30: or or like you haven't gone and applied

57:32: this yourself or like Hadley said the

57:35: problems that DBT solves are far removed

57:37: from what a data analyst and a data

57:39: scientist does and needs to do and

57:41: that's totally relatable for me. Also

57:43: the last thing I remembered I wanted to

57:46: define a view versus a table because

57:48: they are different things. So 20 second

57:50: answer

57:51: >> uh a table means that you have like

57:54: persisted the data again in storage in

57:56: the warehouse whereas a view is just

57:58: like a SQL script that's saved and it

58:00: will run like it it's not repersisting

58:03: the data basically it's not yeah that's

58:05: the shortest that I can do it is a view

58:08: of the table okay everybody thank you so

58:11: much for joining us stick around on the

58:13: Discord this was really really fun

58:15: asking questions um we can hop in and

58:18: continue answer them and I hope that we

58:21: see you on Thursday for the data science

58:23: hangout. Also, if you have not taken the

58:27: survey, the data science hangout survey,

58:29: you do not have to be a data science

58:31: hangout attendee, although I would love

58:33: you to be. Um, you can fill it out. It's

58:35: open till Sunday and we will come back

58:38: on the data science lab and say data

58:40: science hangout to share the results

58:42: with you. So, please, please, please do

58:45: that. Have a wonderful week. See you on

58:48: Thursday or next Tuesday where we are

58:51: going to be joined by Andrew Heis. If

58:53: you know him, you love him and all of

58:55: his content. Um, so join us then. Bye

58:58: everybody.

58:59: >> See you.

59:00: >> See you.

59:02: Bye y'all.
