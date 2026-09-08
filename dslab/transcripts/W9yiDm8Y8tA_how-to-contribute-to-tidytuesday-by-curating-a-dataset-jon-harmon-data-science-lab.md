---
type: Video Transcript
title: "How to contribute to TidyTuesday by curating a dataset | Jon Harmon | Data Science Lab"
description: "I'm joined by Isabella Velasquez, who you just heard."
resource: "https://www.youtube.com/watch?v=W9yiDm8Y8tA"
tags: ["ds-lab", "github", "github-issues", "cran", "r-packages"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T21:59:18Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=W9yiDm8Y8tA"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2026-04-20T00:00:00Z"
    usage_count: 364
usage_window: { from: "2026-04-20T00:00:00Z", to: "2026-09-08T21:59:18Z" }
---

# Transcript

00:06: Welcome back to the Data Science Lab,

00:08: everybody. My name is Libby. I run

00:10: community here at Posit. I'm joined by

00:12: Isabella Velasquez, who you just heard.

00:13: Isabella, say hello.

00:15: Hi everyone. Thanks for joining.

00:18: Yeah. I am joined today by our esteemed

00:23: lab manager for the week, John Harmon.

00:27: Um John, would you like to introduce

00:29: yourself?

00:31: Uh sure. Um I'm John Harmon. Um the

00:34: reason I'm here is I run the Tidy

00:36: Tuesday project, which um

00:40: I don't know how much you wanted to go

00:41: into it, Libby, but uh we're we every

00:43: week we release a new data set.

00:45: Uh

00:47: semi-cleaned. Uh usually clean enough

00:50: that you can play with it a little bit,

00:51: but often there's more you can do.

00:53: And the idea is just to give something

00:56: for people to

00:58: uh learn with, to

00:59: do a new data visualization, maybe make

01:02: a new model, anything in between.

01:05: Um

01:06: and I do that through the Data Science

01:08: Learning Community. That's dslc.io,

01:12: which um I am the director of, have been

01:15: for the last

01:18: 8 years or so. Um and then also I am a

01:22: principal developer at a tourist

01:24: research.

01:25: Yay! And if you are not familiar with

01:28: DSL C, it used to be called R for DS.

01:30: And it's where there are all kinds of

01:32: cool things like book clubs and great

01:35: ways to learn together. And there's an

01:37: enormous slack. So, you can go to

01:41: dslc.io

01:43: and there is a link to join that slack.

01:45: Go make some buddies.

01:46: Um

01:48: yes, we are going to be talking about

01:50: Tidy Tuesday today. I love Tidy Tuesday.

01:52: I um have benefited from it greatly. I

01:56: teach people to code and I have used

01:58: Tidy Tuesday data sets to do that the

02:01: whole way through. I I just love it so

02:03: much. And so we have John here today to

02:05: show us what curating a data set looks

02:08: like. So,

02:09: the things we will cover today, at least

02:11: we will try to cover because we're it's

02:13: all live and we have questions and all

02:15: that stuff, is what is Tidy Tuesday.

02:17: We'll talk a little bit um about that.

02:20: How did it get started really is sort of

02:22: the thing I'm getting at. Examples of

02:24: what a good Tidy Tuesday data set might

02:25: look like because if you're trying to

02:27: think of like, well, what am I going to

02:28: submit? This will help you out. We'll

02:30: talk a little bit about why John set up

02:32: some of the functions that he's going to

02:34: live code and show us today. We'll do

02:36: that live demo of curating a data set.

02:38: Um and then if we have extra time, we

02:40: can do a little bit more of a deep dive

02:43: on how you can help. Like, how can you

02:45: review existing submissions? How can you

02:49: um download and use the data? And then

02:51: what happens when you do submit it and

02:53: John is reviewing your PR in GitHub?

02:56: So, I will say, John, if you would like

02:59: to share your screen and take it away

03:00: for us

03:02: with the Tidy Tuesday um repo. And

03:05: Isabella will be sticking stuff in the

03:07: chat left and right. So, if you want to

03:09: follow along in the Discord with links,

03:11: they're all there for you. And this will

03:13: be recorded. It will be on YouTube. All

03:15: these links will be in

03:17: the description. So, don't worry about

03:20: trying to uh you know, grab them all

03:22: right now if you don't want to.

03:24: All right, John.

03:26: All right. Um

03:28: guess the first thing I should show you

03:30: is uh the main page of Tidy Tuesday. Uh

03:33: you can get here by typing tidy tues.day

03:36: uh

03:37: as the URL.

03:39: Um I'm very proud of that.

03:41: >> that. Yeah.

03:43: >> [laughter]

03:44: >> Secret lore.

03:45: >> there was a .day uh top-level domain and

03:48: I was like, well, I have to get that

03:49: one. So, tidy tues.day

03:51: uh will take you to Tidy Tuesday

03:53: um or I post it on uh Mastodon,

03:58: um Blue Sky, and LinkedIn uh every week.

04:02: I actually post it on Monday

04:04: and then it's reposted on Tuesday. The

04:07: idea is that I want you to have it

04:09: if you choose to participate on Tuesday.

04:12: You can participate whenever you want.

04:14: It's just data sets to play with.

04:17: Um

04:18: and yeah, like I said, we release a new

04:20: data set every week. Uh

04:22: technically there is one week a year

04:24: when I take a break and tell you to just

04:27: catch up. Use whatever data set you feel

04:29: like because there are

04:31: uh 51 or sometimes 52 depending on uh

04:35: how the days fall in the year.

04:38: Um there are 50 51 data sets for you to

04:40: play with. And so if you come in here,

04:42: you know, we have several years of data

04:45: sets that you can go through um

04:47: including right now. Uh this

04:49: this week's

04:51: is this how likely is likely data set.

04:54: Um this one was actually curated by uh

04:58: uh an outside

05:01: um curator. Oh, yeah. I was like, I

05:02: think it was Nicola and it was Nicola

05:04: Rennie.

05:06: Um

05:07: submitted this data set. I I love it. Um

05:10: she found it online.

05:12: Uh someone

05:14: put out an online quiz of various words

05:18: or

05:19: uh probable.

05:21: So, um the example here being, which

05:24: conveys a higher probability, likely or

05:25: probable? And had had people rank those

05:29: and made this data set of uh 5,000

05:32: people answering questions like that to

05:35: um allow you to make a plot of uh what

05:38: does likely mean. Um

05:41: See, we have a

05:43: uh the image that Nicola submitted with

05:46: it, which was from his uh original post

05:49: about it.

05:50: Um

05:51: so,

05:52: if you were ever curious, will happen

05:55: uh is, you know, of course more likely

05:57: than better than even.

05:59: But but I do like that better than even

06:01: is slightly above the 50% probability,

06:04: which is good.

06:06: >> [laughter]

06:06: >> But some people said that better than

06:07: even is a little bit less likely than

06:10: 50% probability, so

06:12: um

06:13: but yeah, uh

06:16: so, there this is, you know, like all

06:18: these all these types or all these

06:20: phrases for likelihood and then like how

06:23: how it ranked.

06:25: Um

06:27: This is a great example of what makes a

06:29: good Tidy Tuesday data set, too, if

06:31: you're wondering. It's something

06:33: first of all, that doesn't exist already

06:35: in Tidy Tuesday. So, search through Tidy

06:36: Tuesday to see. But also, can you

06:38: imagine visualizing this in some way?

06:41: And that's a good that's a good one for

06:43: like, this is a clearly visualizable

06:45: data set. But it's not all about

06:46: visualization.

06:48: >> [laughter]

06:48: >> 5,000 data points you could do a lot

06:50: with.

06:51: Exactly. Um yeah, I know um a lot of

06:54: people

06:56: uh

06:57: will use Tidy Tuesday to, you know,

06:59: practice modeling because um it's a new

07:03: data set. It can also be kind of

07:05: interesting to play with AI tools with

07:07: it because often the data sets don't

07:09: exist before we curate them.

07:13: And so, like they exist, but not in a

07:15: clean form. Um and so

07:18: uh

07:19: it can be an interesting thing to see

07:22: what AI thinks is in the data set if

07:25: it's not

07:26: properly actually using the data.

07:28: Um and so

07:30: uh that can be a useful thing to do. But

07:32: what you know, again, whatever. It's

07:34: there. You can do whatever you want with

07:36: it.

07:37: Uh we do also try to or we always

07:39: include a simple data dictionary of what

07:43: is in the data.

07:45: Um and

07:46: uh it's in here uh well, in the metadata

07:50: that we'll see how this gets used. Um we

07:54: also include an article. And so, this is

07:56: his post that he made when he made the

07:59: data data set

08:01: of

08:02: um you know, his interpretation of it.

08:05: This makes that question of, can you

08:07: imagine a visualization, much easier

08:09: because he provided one. So, yes, I can

08:11: imagine at least one.

08:13: Um but it's always interesting to see

08:14: like I've already seen some

08:16: visualizations that people have put out

08:17: that I think convey this same

08:20: information, but a little clearer. Um

08:23: and that's one of the things people will

08:25: challenge themselves with is

08:27: um like if the original visualization is

08:30: really interesting to you, just try to

08:32: reproduce it. That's, you know, one

08:34: thing you can do with it. But then, you

08:36: know, as you're leveling up a little

08:38: bit, trying to make it easier to

08:40: understand uh than the original version.

08:43: Um

08:45: All right, perfect. So,

08:48: the next thing I would love to show

08:50: really quickly and then we're going to

08:51: hop into

08:52: curating is a couple of examples of

08:55: other data sets because one of the

08:57: things that I see holds people back from

08:59: submitting is they're like, uh this

09:01: isn't good enough. It's not official

09:03: enough. It's not this or that enough. Um

09:06: and a good example is Lisa's vegetable

09:08: garden data, which is completely

09:11: non-official. The these are

09:14: this is Lisa um her observations of her

09:17: own garden

09:19: that she was wonderful enough to curate,

09:21: put together, and share with us so that

09:23: we could look at them and we can make

09:24: visualizations and and stuff of them.

09:27: It can be as simple as that.

09:30: Of her spending her harvest, all that

09:32: stuff.

09:33: Um but then it can be as official as the

09:36: Bureau of Labor Statistics data for

09:38: employment from 2021. Um this is

09:43: super official data, right? And it

09:44: already existed in some way, but needed

09:46: to be put together.

09:49: Um needed to be sort of gathered

09:51: together. And I think this one, if you

09:52: scroll down to the cleaning script,

09:54: there's always a cleaning script at the

09:55: bottom, you'll see the work that was

09:57: done here to make this data usable. And

10:00: I really encourage you, if you are up

10:02: for a challenge, go get the raw data and

10:05: see if you can go through this cleaning

10:07: process and get to the same point that

10:09: this person did, right? If you want a

10:10: different type of of challenge, I'm

10:12: often going back and looking at the raw

10:14: data. Um and then there's also a great

10:17: example, um the Pokémon package data

10:21: was submitted in 2025 by Frank, and I

10:24: remember talking to Frank about this and

10:26: he was like, "I didn't think it would be

10:27: a good one. I just thought like it's

10:28: fun, but there's I didn't do anything to

10:31: clean it. I just pulled it from the

10:32: Pokémon R package." It ended up being

10:35: one of the most popular Tidy Tuesday

10:37: data sets to visualize that I've ever

10:38: seen. So many people did it. So, if you

10:42: are hesitant about like, "Oh, this isn't

10:43: good enough or fun enough or whatever,"

10:45: I encourage you to go do it.

10:47: There's a really great question from

10:49: Lauren on Discord as well, which is um

10:54: uh I assume these Tidy Tuesday data sets

10:56: do not get updated after they're

10:57: published. Is that the case? Like the

11:00: 2025 April 8th uh data set on emergency

11:04: room visits will almost certainly be

11:05: constrained by an end date in 2025.

11:11: Um that is correct. I I don't

11:14: uh

11:15: I don't update data sets after they're

11:16: published. There's a very slight

11:18: asterisk of every once in a while we've

11:20: had something where like there's a major

11:23: issue in the data that it's unusable. Um

11:27: and so I try to get them out a little

11:28: bit early actually so that some of the

11:30: early

11:31: um you know, early adopters can tell me,

11:34: "Oh, this column is completely empty."

11:37: Uh I have some checks in place to try to

11:38: avoid that now, but um that kind of

11:41: thing. And actually, if you watch Joe

11:42: Cheng's

11:44: uh

11:45: keynote from Posit Camp this past year,

11:48: he had an example where he was using

11:50: data bot and found a uh

11:53: mistake I had made in some data. Um

11:56: some cleaning.

11:57: >> on. It's a lot of data sets and we're

12:00: human beings.

12:01: I saw um Jeff had an an follow on to

12:04: that was like, "How does it work if you

12:05: use official data that can change?" Like

12:07: if it gets updated at certain intervals.

12:09: I would say don't hesitate to just go

12:11: ahead and and use it and say, "As of

12:15: this date, this is what this data set

12:16: looks like."

12:17: >> Exactly. Yeah. That can be, you know,

12:18: job reports get

12:20: post-dated. They get um changed the next

12:23: month, right? They'll be like modified

12:25: up or down. You could just take data

12:27: that ends two months ago, right? And say

12:29: that we're pretty confident that as of

12:31: two months ago, this was right and just

12:32: use that. And don't use the most recent

12:34: recent data if you're afraid that it

12:36: might get updated in in some like

12:38: catastrophic way. [laughter]

12:40: Um but yeah, I think that all these are

12:42: great examples, and it is time. We

12:45: better do it because we we might run out

12:48: of time. Let's go into

12:51: the curation process. And while we are

12:53: setting up this demo of a curating a

12:55: data set, John, can you talk a little

12:57: bit about why you created this process?

13:00: Yeah, um well, you know, as we've

13:03: hinted at a couple of times here that

13:06: for the most part, I curate all of these

13:08: data sets. Um and

13:11: uh you know, people wanted to help, and

13:14: I wanted to make it easy for people to

13:16: do that, um as easy as possible.

13:19: Often when as people started to help, I

13:21: was doing kind of the same things in the

13:25: reviews. And so, we already had this um

13:29: Tidy Tuesday R package um

13:32: links in there somewhere. Um

13:35: but it's it's also uh on CRAN

13:38: at Tidy Tuesday R.

13:40: Um

13:42: and so, we had this package. And I was

13:43: like, "Well, why not just put some

13:45: functions in there to help with the

13:48: curation step?" So, the package

13:51: also has functions like the main purpose

13:54: of it was to allow you to easily

13:57: download the data set every week or

13:59: download a particular week.

14:01: Um but I added some functions for

14:04: um just to guide you through the

14:06: curation process.

14:10: Um

14:12: So, yeah, did you want to

14:14: uh

14:16: Do you have anything more on that or

14:17: said about, right? No, I mean just that

14:19: like I

14:21: I got to help test these when you were

14:23: creating them.

14:24: >> Yes. And it was so wonderful. It was so

14:26: helpful. This that process of testing

14:28: was when I submitted the uh Mount

14:32: Vesuvius data.

14:33: And it I had so much fun doing it.

14:36: I really really recommend everybody dive

14:37: into this. So, let's follow along with

14:39: John while we curate a data set. And um

14:43: he will go through all of these little

14:44: steps. We are on the Tidy Tuesday R

14:48: um not GitHub repo, but the actual

14:51: documentation site. The

14:53: github.io/tidytuesdayr.

14:56: And in the article section right at the

14:58: top, it's the only option there right

15:00: now, curating a data set. These are the

15:02: instructions, and we're going to go

15:04: through them zero through seven

15:07: um with a data set today.

15:09: Please stop us and ask any questions,

15:11: but let's go, John.

15:13: And um this is

15:17: showing the dev version. I I think I

15:19: have the dev version installed right

15:20: now.

15:21: Uh I will be doing a CRAN update of this

15:25: probably this week. I wish I had real or

15:27: thought to do it last week. That's okay.

15:30: But so, the only changes in the

15:33: functions is there's a little bit more

15:34: safety net

15:36: uh in the current dev version

15:38: to kind of help you

15:40: um

15:41: help make sure that you've got

15:42: everything set up correctly.

15:44: Uh it was a little bit hard to test at

15:47: first because I have everything set up

15:49: correctly. And so, like I could put

15:52: tests that should have caught

15:53: everything, but people did things that I

15:55: wasn't expecting, and we were able to

15:57: put some more safety nets in place.

15:59: It also

16:00: um I don't remember if I had to do

16:02: anything or if it just was a matter of

16:05: um

16:06: Positron being updated, but it was

16:08: originally written to work with RStudio.

16:10: It as of the dev version and maybe the

16:12: CRAN version also will work with uh

16:15: Positron.

16:17: Um because these curating steps

16:19: actually like create and open files for

16:22: you to edit so that you can go through

16:23: step by step and make sure that you have

16:26: uh everything you need.

16:28: Um we will not be walking through step

16:31: zero, which is set up your GitHub

16:32: account. Um I link over to or or I I

16:36: have a section here kind of walking

16:38: through the basics of how to do it. And

16:40: mostly what I would tell you is use use

16:42: this

16:43: uh the use this package

16:45: um

16:46: makes a lot of these steps easier. Uh

16:49: and we actually use some use this

16:51: functions within

16:53: uh Tidy Tuesday R.

16:55: Um

16:57: creating a GitHub account is free, uh

17:00: easy enough. And so, that's your first

17:02: step. That I've already done, so we'll

17:05: be going

17:06: past that.

17:08: And I'll just stop start with uh

17:12: this TT curate data so we can see how

17:14: that or what that does.

17:16: So, those little steps at the top, those

17:18: little bullet points, that is really

17:19: just like a table of contents. You don't

17:21: have to like go up there and click them.

17:23: They will take you down to these these

17:25: steps. These are the ones starting at

17:26: open these instructions. This is the

17:28: part where you're actually going to be

17:29: putting code in and running it.

17:34: All right, so

17:34: >> And so, and

17:36: uh just yeah, some of these are the same

17:38: idea as this uh article

17:42: is in this thing that that loads when

17:44: you say TT curate data. It loads this

17:47: working document. Um

17:49: This, yeah, I wasn't sure if it had all

17:52: of my info. It does. I can't remember

17:54: what's in the actual package version.

17:56: But after you have Tidy Tuesday R, okay.

17:59: Cuz I know when you have it installed,

18:02: um this file actually is just like a

18:04: file in the package directory. And so,

18:06: if you edit it, it will be updated for

18:09: you. I'm pretty sure. I haven't done

18:11: that in a little while, so I'm not sure,

18:12: but that way

18:14: >> in theory, all of this once you have

18:16: your Well, we'll get to it at the end.

18:18: But once you have your info there once,

18:22: I think it'll stay there so that you can

18:24: use it in the future.

18:27: All right. Um so, I I will talk a little

18:30: bit about

18:31: um you know,

18:33: first step here is wrangle, but really

18:35: the step before that is you have to have

18:37: some data set that you want to curate.

18:40: Um

18:42: and so, the one I'm talking about today

18:44: came from someone on Blue Sky.

18:47: Um actually, I think this was in

18:49: response to a post by Libby, yes. Um

18:52: that they had a data set that they

18:54: thought was interesting, but they didn't

18:56: they weren't able to actually curate it

18:58: and submit it. And so, they just um

19:01: posted about it on Blue Sky,

19:03: and I took that and turned it into an

19:05: issue on uh

19:07: the Tidy Tuesday repo.

19:10: If you say new issue and choose data set

19:13: suggestion, it'll give you these fields

19:15: to fill in,

19:16: which are just saying, you know, first

19:19: kind of checklist of

19:22: uh what you know about the data set. And

19:25: things like, "Okay, this is bird

19:27: sightings at sea." That's the title

19:28: we're going to use.

19:30: Um I ask for an article and a data

19:33: source, but all of these are

19:36: um optional. So, if you you know, the

19:38: one way to

19:40: uh help out is to just submit data sets.

19:43: If you see something interesting,

19:45: let us know in an in an issue.

19:47: Um and include as much information as

19:49: you have. Over time, I have edited this

19:52: and filled in more information, partly

19:54: because I knew I was going to be using

19:55: it today.

19:57: Um and so this one is pretty complete.

19:59: Um

20:00: Eventually, we want to have an image. We

20:02: want to have um I'm going to talk about

20:04: the alt text when we get to it. Um

20:07: But the minimum is, you know, enough

20:09: information for me to know

20:12: what you're talking about. So it like

20:14: the article about this probably would

20:16: have been enough.

20:17: Uh the actual link to the data set would

20:20: also be enough.

20:21: Um

20:23: And so just knowing what to do with

20:25: that. And so that is what I'm going to

20:27: use

20:29: uh you know, that data is what I'll use

20:31: when I go into this TT clean.

20:34: And this is creating Sorry, and just to

20:37: back up a little bit. What What is

20:38: happening here is as I run these,

20:41: it created within whatever project I'm

20:43: working in in R Studio, it'll create a

20:45: TT submission folder.

20:48: This is designed to be

20:51: like stand-alone and once it's merged,

20:54: you can delete it. It You can do it

20:56: wherever. And so if you already have a

20:58: data set,

20:59: um

21:00: what we're looking at right now is I'm

21:02: in a project where I actually made a

21:04: little data package out of this data set

21:07: inspired by the submission.

21:09: Um so it's already clean. It's ready to

21:11: go. I already have this data set, but

21:13: sharing it in Tidy Tuesday, I just

21:15: create this little folder that will go

21:17: through, we'll create it, we'll submit

21:19: it. And then once I'm done, I'll just

21:20: delete that folder. It didn't disturb my

21:23: project at all.

21:25: Um

21:25: Of course, if you would like, you can

21:27: always keep that within your project of

21:29: And uh here's the version I submitted to

21:32: Tidy Tuesday. Uh so you can do that

21:35: if you'd like.

21:36: Um

21:37: And then yeah, I include a little like

21:40: starter cleaning script

21:42: um that shows you what to do, tells you

21:45: a little bit, uh and then asks you to

21:47: delete that block of comments.

21:50: Um

21:50: The idea is to, you know, as we saw a

21:52: couple examples of, show how you got the

21:55: data. Now

21:58: there are kind of two approaches we can

21:59: do. Um since this is a package now,

22:04: um I can just say

22:07: uh

22:08: you know,

22:10: main data

22:11: provided by

22:13: uh

22:15: like um

22:17: the C

22:20: the data

22:22: package.

22:24: And this is the same as like the Pokémon

22:27: one, right? The Pokémon one has like

22:29: this was provided by this. We didn't

22:31: need to do anything.

22:33: So I I can I could do that. Um

22:36: if we look at this, it has

22:39: um

22:40: Let's see. What's the easiest place to

22:41: see this? Probably here.

22:43: That there are these uh

22:47: So it's

22:48: one, two, three, four data sets plus I

22:51: actually save the dictionaries within

22:53: here

22:54: um because again, I wanted to have those

22:56: handy.

22:57: Um

22:58: So we could do something like

23:00: uh you know,

23:02: Beaufort

23:03: scale

23:05: is gets the seabird

23:08: data

23:10: Beaufort scale.

23:12: Et cetera. Um technically, don't even

23:15: you know, barely even need this, but I I

23:17: like to have some sort of record Oops,

23:20: of where everything comes from. Um so

23:23: we're going to do birds as Beaufort

23:25: scale scale birds. We're going to do

23:27: ships as

23:31: uh Oops, keep typing date instead of

23:34: data.

23:36: And that's easier that way. I always do

23:38: the opposite.

23:39: >> states. Type data instead of date.

23:45: That's funny.

23:46: Um

23:47: It's part of my like dates are my

23:49: nemesis. I I

23:51: did support at a education company

23:54: and some of our first students were in

23:56: Arizona, which is

23:58: like

23:59: smartest because they don't do daylight

24:01: savings, but

24:03: the rest of the US does daylight savings

24:05: and so their due dates always confused

24:07: them because half of them

24:09: had the wrong time zone setting.

24:11: Sometimes their instructor had the wrong

24:13: time zone setting, all kinds of crazy

24:15: things because when the when daylight

24:17: savings switches,

24:19: uh Arizona gets out of sync with the

24:21: rest of the US. Yeah. Um

24:23: So anyway, uh dates are my my nemesis,

24:25: so that's probably why date sticks in my

24:27: head.

24:28: Um so uh

24:30: Again, you know, this is good enough for

24:33: cleaning or I could always

24:36: uh go into I actually have my clean

24:39: scripts.

24:40: And so I could, you know,

24:42: take this whole thing

24:45: and copy paste it. Um

24:48: I go back and forth on what I want to do

24:50: here. So I think what I will do

24:53: is just reference

24:55: um

24:58: that

25:00: say specifically in the cleaning script

25:04: uh

25:07: All cleaning scripts

25:10: are available uh

25:13: on GitHub

25:15: at

25:17: um

25:20: So

25:21: kind of the balance like you don't want

25:23: it to be

25:25: uh overwhelming

25:26: uh necessarily and you want to you don't

25:29: have to go all out. You don't have to

25:31: make a data package for you're doing

25:33: this, by the way. So if data package

25:35: already

25:36: >> Just put your cleaning stuff in there.

25:39: >> data if the script is, you know, if you

25:41: have to do the cleaning yourself, uh

25:43: it's perfectly acceptable. I just didn't

25:45: want to go into this and find that the

25:47: data didn't work and so I very carefully

25:49: went through it. I actually was playing

25:51: with the uh

25:52: R Studio positive assistant uh Oh,

25:55: awesome.

25:55: >> to to do this cleaning. So the the

25:58: positive assistant

25:59: did a fair amount of this.

26:01: Um

26:04: But yeah, so

26:05: whatever level you want to do, I I

26:08: you know, there are certain um places

26:10: that I take things that this one like

26:13: oh, um in the original post, he followed

26:15: up and mentioned that there was a typo

26:17: in one of the IDs.

26:19: Um which once I looked at it, it was

26:21: really obvious. There was this

26:23: um

26:24: ID 1184009

26:27: that didn't correspond to anything. And

26:31: so it was uh like I was able to go

26:33: through and figure out that okay, yeah,

26:34: this is supposed to be 1104009

26:37: because

26:38: um the ship was missing the bird and the

26:40: bird was missing the ship. Aha.

26:42: >> Um Oh, we use the replace values. New

26:44: dplyr function.

26:45: >> Yes. And so yes, I used the fancy

26:48: relatively new

26:49: uh replace values in dplyr.

26:53: Um

26:54: which was very nice cuz it just I just

26:57: wanted to replace that one and leave

26:58: everything else as it is.

27:00: Um

27:01: I did some like there's

27:03: there was this no birds recorded

27:07: uh signal in the data that basically

27:10: means NA and so I cleaned that up. Um

27:15: I I

27:17: I'm really like uh particular about if a

27:20: if something is

27:22: a character or a double or something

27:25: non-integer, I like to

27:27: officially say no, I know that this is

27:28: an integer. Uh you don't have to check

27:31: through to see if there are a few of

27:32: them that that have a decimal point or

27:34: something. And so

27:36: um I did that. Again, not absolutely

27:38: necessary to do that level of cleaning.

27:41: Um

27:43: And yeah, some other little uh recodes

27:45: because I guess to again back up a

27:47: little bit, this this original data

27:50: um is it's in

27:53: uh

27:54: XLS and let me just go ahead and open

27:57: that up.

27:58: Um Oops.

28:00: That

28:01: uh it is

28:03: human It's like from logbooks. And then

28:06: those logbooks were copied by people

28:09: into a database.

28:11: And so it has a couple of opportunities.

28:12: Yeah. And so that's why that one data

28:14: set um

28:16: ID

28:17: doesn't match up is

28:19: probably in one of the places the zero

28:21: looked like an eight.

28:22: Um and so it didn't uh match up nicely.

28:27: Um

28:29: See if I can get rid of these weird and

28:32: uh split. Yeah, it's one.

28:36: Um

28:37: So the data is a bunch of ship data like

28:40: information about what the ships are and

28:43: um like Sorry, when the recording took

28:46: place,

28:47: uh who did the recording. There's this

28:49: There was a set of

28:51: um observers who were on these ships in

28:55: uh like around New Zealand.

28:58: Um they're all identified by like first

29:00: name or actually I think that is an

29:02: abbreviation of their last name.

29:05: Um

29:06: There's a

29:08: uh another one that is uh another table

29:12: that is the birds themselves. What birds

29:14: did they see? So we can see that in this

29:16: one record

29:18: um

29:19: or you know, this one time of recording,

29:21: they counted these different types of

29:23: birds.

29:24: Um

29:26: And you know, again, partially it's that

29:29: Actually, I think that what they did is

29:32: this is the actual log entry.

29:35: And then the people doing the coding

29:38: broke it that apart into things like

29:41: species name, species abbreviation, age,

29:44: um the type of plumage, the

29:47: for a certain type of bird versus the

29:50: phase for other birds and the sex.

29:53: Um,

29:55: I'm going to talk about that in a second

29:56: when I write the introduction that as

29:58: far as I can tell from the data

29:59: dictionary, that's what happened here,

30:00: but it'd be interesting to do some

30:02: exploration of do these

30:04: fields correspond with one another in

30:06: the way I think they should. Uh, I

30:08: didn't do that yet cuz I wanted to kind

30:10: of let people play.

30:12: Um, and then they have a data dictionary

30:16: sorts and so that was helpful that I

30:18: could go through and see

30:19: you know, what do they say?

30:21: Uh, but often when you're

30:23: working with pretty much

30:25: I don't lots of data sets, they'll give

30:27: you an idea of what's here. Might not

30:29: always be great. Hopefully if it is your

30:31: own data set, you know a little bit

30:32: better about what it is, but if it's

30:35: something that you just find online, you

30:36: know, again, do your best

30:38: cuz

30:39: part of the goal here is to let people

30:41: work with real data and often real data

30:44: isn't perfect. And so, uh, telling

30:47: people this is what we know about the

30:50: data set is

30:51: fine as long as it's not like a complete

30:54: unusable mess.

30:55: Yeah.

30:56: >> Um, and I think that there are there are

30:57: like there's plenty of things that you

30:58: could put in the data dictionary or the

31:00: read me that will allow people to do the

31:03: data cleaning themselves. Yes. Um, and

31:06: do some transformations which are fun.

31:08: So,

31:09: I get I am torn on like whether or not

31:11: to fully clean it. But,

31:12: >> Yeah. I'm going to do a time check cuz

31:14: we are at 30 5 minutes in and we are

31:15: only at the cleaning step, so we got to

31:17: move on to the next step or we're not

31:18: going to get there. Yeah. Yep. Yep.

31:21: All right. So, yeah, that's the clean

31:22: data. I I have said, okay, this is what

31:25: it is. I want to make sure I have these

31:26: objects in my

31:27: session

31:29: and that that is saved. All right.

31:32: So, then the next thing you do is save

31:34: your data set. And so, um, I've got four

31:37: of them, so I'm going to copy this down

31:40: four times or three times.

31:43: And

31:44: just put each of those into this

31:46: function. Oops, that will save.

31:50: Oops, and C states.

31:55: And as I do these, it's going to for

31:58: each one, um, I'll just look at and we

32:00: can see that it

32:03: um,

32:05: it created a CSV and a markdown file

32:09: which is the data dictionary.

32:11: Now,

32:12: again, because of I am who I am slash

32:15: uh,

32:16: knew what we were doing today,

32:18: I already have these data dictionaries.

32:19: And so, Beaufort scale dictionary,

32:22: I saved in that format um, within my

32:28: uh,

32:29: my setup. And so, we can see that, um,

32:32: you know, this is the column name is

32:33: filled in automatically. The class was

32:35: filled in automatically as, um,

32:37: character here which would also be

32:39: completely fine, but again, we can tell

32:42: you a little bit more information that

32:44: it's an ordered factor either way.

32:47: Um,

32:49: and then, uh,

32:50: these are things mostly copied from

32:54: the,

32:56: uh,

32:56: Oops, sorry, the, uh, data dictionary

32:58: here. And so,

33:00: we look at, well, Beaufort scale

33:02: actually is a data set I created out of

33:04: what they gave us cuz in the dictionary,

33:07: they have a field

33:09: that is, uh, wind speed which it says is

33:12: the ordinal Beaufort Beaufort scale 0 to

33:14: 12. And so, I just split that off into a

33:17: data set, um, that we could join to.

33:20: Uh, and so,

33:23: separately, we do one that's a little

33:25: bit more normal.

33:27: Um,

33:29: we have the birds and again, it's going

33:30: to tell you just describe this field.

33:32: And so, I will grab the birds dictionary

33:35: and describe those fields.

33:37: Um, and just realized that I used a

33:40: different name for the top than what has

33:43: happened or what was happening

33:45: automatically. So,

33:47: I want to fix that. And so, let me get

33:50: the next one and actually,

33:53: uh, keep that name. That is interesting.

33:57: I don't know why I did that.

33:59: So,

34:00: um,

34:01: I

34:02: it my scripts would catch that, I'm

34:04: pretty sure, um, when you submit it. But

34:07: so, you know, don't worry if it's, uh,

34:10: too, you know, if you're doing something

34:12: kind of weird, but you probably won't do

34:13: something as weird as me. So,

34:16: it's all good.

34:17: I mean, why not? All right. So, the

34:20: great thing about this is

34:22: these all of these markdown files are

34:24: created with this pre-filled thing that

34:26: you don't have to worry about any of the

34:29: formatting, right? So, like all of those

34:30: pipes that you see, it doesn't really

34:32: matter where they are in space. You can

34:34: leave your spaces wacky. Just go

34:36: through, make sure your classes are

34:37: correct, and then go, um, modify the

34:40: description for each one. I myself just

34:43: typed willy-nilly into all of them for

34:45: mine and got through it.

34:46: That is absolutely fine. So, yeah, it

34:48: does an automatic, like when it when it

34:51: loads, it'll be

34:53: you know, it'll look nice

34:54: to begin with, but as you type your

34:56: descriptions, you know, often this will

34:59: go on and on and on. Something that's

35:01: useful in here is, uh, soft wrap long

35:04: lines in R Studio

35:06: for something like this can be useful.

35:09: Uh, so you can actually still see

35:10: everything you're typing if it goes off

35:12: the edge of the screen.

35:13: Um,

35:15: but yeah, you just need to fill the info

35:18: in. And so, this is the C states and I

35:20: will

35:21: keep that. And so, we'll see

35:24: um, oops, yeah. When I paste this in,

35:28: um,

35:29: yeah, I don't know if that's helpful

35:30: necessarily to soft wrap long lines

35:32: here. I can also just give it a little

35:34: more space.

35:36: Um, and you can see that, you know,

35:37: these are off, it doesn't matter. The

35:39: spacing is just, uh,

35:42: to make it a little easier to read as

35:44: you're working on it. But, this will

35:46: actually get

35:47: loaded and resaved by the scripts, uh,

35:51: before it gets like printed into the,

35:53: um,

35:55: into the repo. So, it doesn't matter.

35:56: And also,

35:58: it gets rendered by GitHub to these

36:00: visual

36:02: um,

36:03: dictionaries. I can see, yeah, like

36:05: this. So, again, doesn't matter what you

36:07: do.

36:08: All right.

36:10: Um,

36:12: and then so, those are the

36:14: somewhat, um, like that step is the most

36:16: formulaic. Uh,

36:19: finding these definitions can be a pain.

36:22: Uh, that's what led me to split out some

36:24: separate data sets cuz they were

36:26: actually standardized scales that I was

36:28: looking into more info, but

36:30: um,

36:31: you know, the best you can do again of

36:33: what is in each of these fields. And so,

36:37: uh, that's what all this was. And this

36:40: one was relatively easy as data

36:41: dictionaries go because they gave, um,

36:45: all this information. I did some,

36:48: uh, well,

36:49: technically R Studio, uh, positive

36:51: assistant did some recoding of these

36:53: into sentences, but I could mostly copy

36:56: paste.

36:58: Um,

37:00: all right. And so, then we go on to kind

37:02: the most,

37:03: I don't know, possibly the most

37:05: intimidating

37:06: piece

37:08: of, um, describing what this is. And

37:11: this is somewhat free form. I give some

37:14: example of what it is within this

37:16: script.

37:17: Um, and I actually have kind of fallen

37:20: into using this semi

37:23: um,

37:24: just standardized way of doing it

37:27: because

37:28: uh, it makes it easier and faster and

37:31: usually actually better. And so, it'll

37:33: be something like this week we're

37:36: learning

37:38: and I can go into that issue

37:42: and say, oh, we're exploring bird

37:44: sightings at sea.

37:47: Uh,

37:51: and so, um, this was, um,

37:55: the actual link that I started with was

37:57: at this New Zealand government just data

38:01: site.

38:02: Uh, but going through this, uh, it that

38:05: led me to the, um,

38:08: the source of the data. So, when I went,

38:10: um,

38:11: down and dug into the source,

38:14: it's at this,

38:16: uh, New New Zealand or Museum of New

38:17: Zealand or they always refer to it as Te

38:20: Papa. So, and I have no idea if I'm

38:22: pronouncing that correctly, but Te Papa

38:24: is the New Zealand Museum of New

38:26: Zealand.

38:27: Um,

38:30: and, you know, I might say something

38:32: like, oops, uh,

38:33: comes from

38:35: uh,

38:36: I I think I wrote it out here. Let's

38:38: see. Do do do do.

38:41: Um,

38:42: I didn't write it there, but, uh, oh, I

38:45: know where it is. Comes from

38:49: uh, with again, I've already like done

38:51: all of this once. And so,

38:54: um,

39:00: I'm going to say

39:01: it comes from Te Papa Ni

39:03: uh,

39:05: Tongarewa,

39:07: the Museum of New Zealand.

39:09: Um, and again, I'm going to use that

39:10: soft wrap long lines cuz it is easier to

39:13: read.

39:14: Um,

39:16: it consists of,

39:19: um,

39:21: logbook entries of bird sightings at sea

39:28: near New Zealand

39:31: from,

39:33: uh, what was it? 1969 to 1990.

39:39: And then, so part of the the formula,

39:42: the next little piece

39:44: is I'll put I'll find a quote on the

39:47: site. So,

39:49: uh

39:53: This one actually um

39:56: both of them have a nice little uh

40:00: description of what it is. So, I'll just

40:02: grab the the basics here.

40:05: Uh

40:08: Uh the data was recorded using

40:09: guidelines.

40:11: Etc. etc. etc. Um read through that, you

40:14: know, make sure that the

40:16: Uh quote has something to do with the

40:18: data set.

40:19: And then

40:21: I try to do um one or more questions

40:25: about the data. And so, the first thing

40:28: I'll do here is that what I mentioned of

40:31: um data was recorded by and and split

40:37: into

40:39: um

40:41: standardized

40:43: columns.

40:46: Do uh

40:49: entries always match?

40:52: Um actually, I want to look at which one

40:54: is it? Ships, I think.

40:57: Um or no, it's birds. Do the

41:01: uh s-

41:07: in

41:09: species' common name in the birds data

41:15: set

41:16: always match?

41:19: Uh

41:22: match up with the

41:24: uh split columns.

41:28: Um

41:29: Let's just do a

41:32: uh column name is birds.

41:35: And what's really helpful is if you've

41:37: already done your own analysis of the

41:38: data. So, while you're curating and

41:40: you're cleaning it, go ahead and analyze

41:41: it so you know what questions can be

41:43: asked of it. Um I think that's a

41:45: generally a good idea so that you're not

41:47: suggesting questions that like literally

41:49: can't be figured out from the data.

41:51: Also, time check. We have 14 minutes

41:53: left.

41:54: >> I'm almost I'm almost done. It's okay.

41:56: We'll get through.

41:58: Um

41:58: >> We are clicking. We're going. Yeah. All

42:02: right. And um

42:04: for this particular one at least, you

42:05: know, for now, um I'm just going to ask

42:08: the one question.

42:10: You can

42:11: whatever makes sense for what you're

42:12: doing, but so that's my intro.

42:15: Um I want to have a um a ping image. I

42:19: do like restrict it now to ping. Makes

42:22: my life Oops. Makes my life easier.

42:25: Uh and so, we're going to also save an

42:27: image, which we have in the submission,

42:30: which is a screenshot of their

42:33: uh interactive explorer.

42:35: Um let me do

42:38: This is a folder that I have

42:41: uh to open the folder that I'm in in

42:44: Windows. So, oops.

42:48: Um I want to do

42:50: this

42:52: and go to TT submission and say, you

42:55: know, um I'll just call it screenshot.

43:01: And so, okay, I have that

43:03: uh

43:04: ping image and I also already

43:07: did um alt text for the image.

43:10: I want to

43:11: talk about this a little of um this is

43:14: the thing that I probably have to edit

43:15: the most often in submissions is I ask

43:17: you to give me alt text for the image.

43:20: And the alt text um the tip I was given

43:23: is that alt text should be able to

43:26: replace the image, not just describe the

43:29: image. So, a lot of times people will

43:31: say

43:32: an interactive plot

43:34: um or an interactive plot of seabird

43:36: data. It's like, well,

43:38: okay, but what does it show?

43:40: And so, going going to like the details

43:43: of what it shows that

43:45: um

43:46: it it shows, you know, specific

43:49: cell grid cells within the Southern

43:51: Ocean that are um that have data in

43:54: um

43:55: this plot shows that there was no data

43:57: from um

43:59: whatever years, 1970 to 1974. Like, what

44:03: do you actually get out of it with eyes

44:06: when you look at the image? So that

44:08: you know, it's actually replacing the

44:09: image. And so,

44:12: um I'm going to use that.

44:13: >> use for an LLM. Um

44:16: pop it in if you happen to use something

44:18: like that and then read it and edit it,

44:20: verify it. But it can be really helpful.

44:23: >> Yes.

44:24: Um especially if you go back and forth a

44:25: little bit, um they can do a pretty good

44:28: job. Again, this one

44:30: uh did I think come about that way. Um I

44:33: often

44:35: do that as a step, um but it's never

44:39: perfect. Right. You always have to go

44:41: back and look. But I've I've been

44:43: surprised at how quickly it can get me

44:46: to a better version than what I had had

44:49: written myself. So,

44:51: that's the only time I like to use LLMs

44:53: is when it can do it better than I can.

44:56: I I I think they are getting better at

44:58: that because I think um

45:00: there's been a fair amount of

45:03: um kind of writing on what they do

45:05: wrong. And so, those are those articles

45:08: are getting incorporated into their

45:09: training.

45:11: Um again,

45:12: >> out metadata.

45:14: Yes. Oops.

45:15: >> And we didn't have to like create

45:16: anything. It was already in

45:20: that

45:20: >> Yeah, in in this case, it's already in

45:22: the um submission.

45:25: This might be something you have to go

45:26: find. A lot of times for an an article,

45:29: I have to go find something and the idea

45:31: is just something that's related to it,

45:33: something that will give people some

45:35: context of the data.

45:37: Often that comes with the data, but

45:39: sometimes I'll just find a Wikipedia

45:42: article that's related or, you know,

45:44: whatever it might be. So, just find

45:45: something to use.

45:47: Um and then the the image file name was

45:50: uh screenshot.png.

45:53: And I already did the copy paste of the

45:55: alt.

45:56: And

45:57: >> is all in a

45:58: function wrap. It's a good thing to keep

46:00: in place. Is that this is like we're

46:02: wrapping this into a function. These are

46:03: all options or arguments to a function.

46:06: So, and technically um if you just call

46:09: TT meta,

46:10: um it will

46:12: like quiz you on these things. So, you

46:14: can do it that way. Um and it'll like

46:17: walk through and have you enter the

46:19: things one at a time.

46:20: Or you can use the template that comes

46:22: up when you use the two TT curation or

46:25: TT curate data set function.

46:27: Um

46:28: Fill it in that way. Either way you want

46:30: to do it. I like to do it this way

46:32: because like I said, once I have this,

46:34: like

46:35: this is the same every time.

46:37: Uh these last

46:39: sections are how do you want me to

46:42: mention you? Oh, and actually that

46:44: mention you made me think of that I also

46:47: want to say

46:49: um

46:50: do do do

46:51: In the intro.

46:53: >> Yes. That

46:55: uh David Hood. Want to thank David Hood.

46:58: Um

47:02: to Aw, nice handle, David. Thoughtful

47:05: NZ.

47:07: I Blue Sky.

47:09: Um

47:10: for the data set suggestion.

47:15: And so,

47:17: uh

47:18: I'll do something like that.

47:20: I'll do something fun with the Oh, it's

47:23: not doing it. Sometimes, I guess, in

47:26: RStudio it it'll just turn that into a

47:28: link if you paste over the text.

47:31: Yeah, sometimes I mean, I feel like it

47:32: happens. It doesn't in Slack nicely.

47:35: >> Yeah.

47:36: >> [snorts]

47:36: >> Um anyway, so uh it also it will do it

47:39: on GitHub that if you paste over text

47:41: with a link, it'll

47:42: do the markdown formatting for you. But

47:45: uh so that that's all set. This is all

47:47: set. This has all the credit of um who I

47:51: am. Um don't get caught up on like the

47:54: formatting of your Blue Sky, LinkedIn,

47:57: Mastodon, GitHub links. If you include

47:59: those, those are all optional, but if

48:01: you do include them, I do some

48:04: like figuring out of the various ways

48:06: that you can enter those. So, if I did,

48:09: you know, @john_the_geek@fosstodon.org,

48:12: which is a valid way to enter

48:15: um your Mastodon handle,

48:17: uh it should also like just deal with

48:19: that. So,

48:20: just submit those and then

48:23: I will run that function and it created

48:25: this file. This uh

48:28: Oops.

48:30: Um

48:31: meta.yaml. So, this is the thing that my

48:35: script will use to post the data set.

48:37: And so, it is helpful if this uh

48:40: has everything. I'll also be checking

48:41: that as

48:43: um I review any submissions.

48:46: And then uh I make sure that I don't

48:48: have any little asterisks up here.

48:50: Everything looks good. And I can TT

48:53: submit. And so, let me make sure Yeah,

48:56: that has

48:58: uh that's going to open up a browser

49:01: window a moment. This is going through

49:04: and doing all the GitHub stuff for you.

49:05: So, even if you have this project, you

49:07: know, this is a package that I'm

49:09: developing. It has its own GitHub

49:11: repository.

49:12: But for a moment, the script uh says,

49:16: "Okay, this folder it

49:18: exists in a different GitHub

49:19: repository." And it does all the

49:21: check-ins.

49:22: Uh sorts that all out. It'll it'll

49:24: create a fork of the Tidy Tuesday

49:27: um repository for you so you don't have

49:29: to do any of the fancy GitHub stuff.

49:32: And

49:33: you can click create pull request. You

49:36: can give it a title if you want. You can

49:38: like

49:39: uh

49:40: change um

49:42: you know, tell me if there's any

49:43: details, but you don't have to. You can

49:45: just hit create pull request.

49:48: We've got 5 minutes, so those will be

49:49: perfect. And I do ask that you know, you

49:51: go through here and go, "Okay, it's not

49:53: already used." Um

49:55: not this one, but a recent one I had to

49:57: go through and fix this where they all

49:59: of the data all of the files were big or

50:02: actually it was one big file. And so I

50:04: split it apart into separate files

50:06: because

50:07: um GitHub will sometimes complain if

50:10: it's more than 20 megabytes. People

50:12: won't be able to download it sometimes

50:13: if it's more than 20 megabytes. And so I

50:15: do this splitting.

50:17: You can imagine at least one and then I

50:19: did all the things. I did all the

50:20: saving, the setup. I need to actually

50:23: update these to encourage you to just

50:25: use the scripts and then you don't have

50:26: to worry about whether you did these

50:27: things cuz

50:29: you use the scripts.

50:30: Um and so what's going to happen here?

50:32: Oh, this is actually telling me that my

50:34: personal fork is out of date. Doesn't

50:36: really matter, but I'll you know, you

50:38: don't have to deal with that. But it's

50:40: going to do a check. Um

50:42: and

50:43: I just wanted to to

50:45: see this happen because

50:47: often this check will find something.

50:51: And if it's like if it

50:54: when you do this it after you have your

50:55: GitHub set up, it'll email you probably

50:58: uh if you if the check fails to say,

51:01: "Hey, something's wrong."

51:02: Um

51:04: I try to be clear in there that some of

51:06: the things that it says are wrong are

51:08: things for me to deal with and some are

51:10: things for you to deal with. Um if it

51:12: says

51:13: uh there's no image, like that's saying,

51:16: "Hey,

51:17: can you give me an image?" You know,

51:19: like maybe I'll try to go find one, but

51:21: it's a lot easier if you do it yourself.

51:23: And then other times um

51:25: you know, it'll say that this link can't

51:27: be reached. A human should check it um

51:30: because sometimes GitHub gets blocked

51:32: from uh reaching the data site, but or

51:36: data source, but you can you can reach

51:37: it uh when you're

51:39: when you click on it, things like that.

51:40: So, just kind of follow the instructions

51:42: in the comment that will eventually show

51:44: up here.

51:45: Um and that's it. And I you know, we're

51:48: not going to have a time have time for

51:49: me to go through the review step, but

51:50: then I would take this um

51:53: and review it, make sure that it does

51:55: all the things that it needs to do. And

51:57: then

51:58: uh this one actually won't be next

51:59: week's data set cuz someone has a timely

52:01: one that I'm going to try to get in. But

52:04: it'll be the data set in two or three

52:06: weeks. Awesome. Well, we have a question

52:09: in the chat really quickly uh from

52:11: Becca. And we only have 4 minutes left.

52:14: So, let's really quickly. Becca says,

52:16: "How does one confirm a data set has not

52:18: been used before?" Um you can search in

52:21: the repo at the top. Um there's little

52:24: type search, but you could also Google.

52:27: Um and then there's also a TT meta

52:29: package that John made that will help

52:30: you sift through.

52:32: Here we go. So yeah, there there is this

52:34: package that every week get auto updates

52:36: with all of the data. So, um

52:39: you can install this TT meta package to

52:42: make it a little bit easier to search

52:43: through, but also you can just search.

52:46: Um all I really ask is that you've done

52:48: a search. So, you've searched for the

52:51: name that you know, seabird data and

52:53: you've searched for like the URL. And if

52:55: neither of those come up, then we're

52:57: good. A lot of times what you search for

53:00: probably those words have been used in a

53:03: previous data set, but just do a little

53:04: bit of diligence to make sure that it's

53:05: not the same data set. Um that said,

53:09: we've even we've

53:11: we've run the same data set twice with

53:13: like re-cleaned and it was a little bit

53:15: different, had newer data in within it.

53:18: Um just make sure that

53:20: you know that's happening and you uh

53:22: explain it in the introduction and it

53:24: that it something about the data is

53:26: different. Like we don't ever want to

53:28: run it exactly the same.

53:32: All right, perfect. Becca, thank you for

53:33: asking.

53:38: Okay.

53:40: So, we have run through and we've

53:42: submitted this.

53:46: And with our

53:47: 2 minutes left

53:49: John's going to show us what it looks

53:51: like once he gets that submission as a

53:53: PR.

53:55: Yeah. So, um here's one I'm going to

53:58: we'll see. We'll do the this one

53:59: probably. This is one uh Jen Richmond

54:02: submitted it. She has done several data

54:04: sets now. Um

54:06: and so she's got it mostly down.

54:09: Uh and she actually had some of these

54:11: things unchecked actually and I I kind

54:13: of dealt with them. Um this is an

54:16: example of

54:17: uh when she first submitted it, she

54:19: didn't have an image and so it went ran

54:21: through and said, "Hey, it's missing a

54:23: file."

54:24: Um and then she uh sorry. Um

54:29: I can't remember if she did it or I did.

54:31: Um

54:33: Oh, yeah. So, that's what she did a

54:35: JPEG. I just converted it to a ping. Um

54:37: did a few other things.

54:40: And it worked great except um

54:43: then I realized that the files one of

54:44: the files was huge. Uh that was the

54:46: repairs.csv.

54:48: And I split off just some of the

54:50: columns. So, I I'll do some work on it

54:52: if it's broken. The more you do, the

54:54: better. Uh but I can you know, I'll work

54:57: with you on that.

54:58: Um

55:00: another example of one is uh

55:03: uh Novica submitted this uh

55:06: earlier today I think it was. Um

55:10: Yeah, 4 hours ago.

55:11: Uh and again he went through a few steps

55:14: of tweaking some things. I learned today

55:17: that I need to update my checker script

55:19: because

55:20: this one that passed actually

55:23: is a more recent update than this one

55:25: that failed. It just took longer to run

55:27: the one that failed. And so it made me

55:29: think that it was broken, but it's fine.

55:31: Um

55:34: But yeah, so then I will be what I'll do

55:36: uh is

55:38: usually uh I start by just kind of

55:40: looking at

55:42: uh the clean cleaning scripts, see what

55:43: I need to change. Um see what comments

55:46: are kind of left over that I want to

55:48: delete. Uh want to delete, things like

55:51: that.

55:52: Make sure everything's here. Make sure

55:54: um a common Oh, a common thing is people

55:56: will say I say

55:59: that your title should fit into the

56:00: phrase this week we're exploring

56:03: blank. And a lot of times people will

56:05: include the phrase this week we're

56:06: exploring um

56:08: Daniel Chen's slipped through

56:10: with the Olympic data a couple weeks.

56:11: And so when it posted, the post said

56:13: this week we're exploring this week

56:15: we're exploring the Olympics.

56:16: >> doubled up.

56:17: >> [laughter]

56:17: >> And so just I just need the Olympics or

56:20: the Olympic schedule or whatever it is.

56:23: Um so, things like that I'll watch out

56:24: for. Usually I'll catch them, but not

56:26: always.

56:27: Uh

56:29: and um you know, like if you don't

56:31: include a credit for yourself, usually

56:33: I'll

56:34: uh hit you up and say, "Hey, what how do

56:36: you want me to mention you?" Yeah, don't

56:38: forget that. Let us know who you are.

56:40: But I have to interrupt us, John, cuz we

56:42: have reached the top of the hour. Okay.

56:44: So,

56:45: I think that we got really really far.

56:46: Thank you, John, for walking us through

56:48: this. We got all the way from opening up

56:51: that curate um article through

56:54: submission. I hope that this helps you

56:57: submit a Tidy Tuesday data set. If you

56:59: have used Tidy Tuesday, benefited from

57:02: in any way from it,

57:03: please please please submit. I hope to

57:06: see your submissions come through. Thank

57:08: you so much, John, for joining us. I

57:11: cannot wait to see all the things people

57:12: submit. I know I have something in mind

57:15: to submit as well, my own data.

57:17: I will see everybody on Thursday if you

57:20: come to the data science hangout or I

57:22: will see you next week on the data

57:23: science lab. Thank you, everybody. We'll

57:25: see you next time. Hope you had a good

57:26: time. See you on the Discord server.
