---
type: Video Transcript
title: "Behind the scenes of tidyverse development: new dplyr functions | Davis Vaughan | Data Science Lab"
description: "I run community here at Pit and I'm joined by Isabella Velasquez."
resource: "https://www.youtube.com/watch?v=BodTJqx05Ws"
tags: ["ds-lab", "github-issues", "r-packages", "github", "dplyr"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T21:59:18Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=BodTJqx05Ws"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2026-03-23T00:00:00Z"
    usage_count: 2757
usage_window: { from: "2026-03-23T00:00:00Z", to: "2026-09-08T21:59:18Z" }
---

# Transcript

00:07: Welcome back to the data science lab.

00:09: I'm Libby. I run community here at Pit

00:11: and I'm joined by Isabella Velasquez.

00:13: Isabella, would you like to say hello?

00:15: >> Hi everyone. Thanks for joining.

00:17: >> I am so excited to be joined today by

00:21: our lab manager, our guest lab manager,

00:24: Davis Bon. Davis, would you like to say

00:26: a quick hello and tell us who you are

00:27: and what you do? Sure. Hi everyone. It's

00:30: nice to be here. Um I'm a software

00:32: engineer at Posit. Uh I work on the

00:35: Positron teams and the Tidyiverse teams

00:37: like I work on Zlier Tidy R. I also am

00:41: the co-creator of Air the R formatter.

00:44: >> Nice. All right, Davis,

00:48: what are you going to be showing us

00:50: today on the lab?

00:52: >> So, uh yeah, I figured today we could

00:54: talk about Dlier 1.2 a little bit. Um

00:57: it'd be kind of fun to just kind of go

00:58: over some of the new functions like

01:00: filter out and recode values and replace

01:02: values. And then um maybe also a little

01:05: bit about like how uh functions in the

01:09: tidyiverse are life cycled like what

01:11: does it mean to be superseded? What does

01:12: it mean to be deprecated? And what is

01:14: the difference?

01:16: >> What is the difference? How does how do

01:18: decisions get made? What kind of

01:19: conversations are behind the scenes?

01:21: That's what I really want to know. I'm

01:23: going to ask some nosy questions about

01:24: that. Um, another thing that we will

01:27: briefly touch on is also like how well

01:30: not briefly touch on this is going to be

01:31: the theme how communitydriven

01:35: development happens and why community is

01:37: such a huge part of the development of

01:39: open source packages. Um, and also Davis

01:42: will talk a little bit about wifdriven

01:44: development. All right everybody, let's

01:47: get ready to watch Davis share his

01:51: screen and walk through a couple of

01:53: things for us. The first one being

01:56: um we have a new function called recode

02:00: values. This one's really exciting for

02:02: me because I have had a janky workaround

02:05: to recode values for a long time and um

02:08: I'm not the only one who had that janky

02:10: workaround. Crystal Lewis also had that

02:12: janky workaround and we've all been sort

02:15: of circumnavigating a slight hole that

02:18: was in the dlier

02:21: um suite of functions. So, Davis, if

02:24: would you be willing to walk us through

02:25: a demo of why we needed this new

02:28: function and what it does?

02:30: >> Do you happen to have the blue sky post

02:32: from either you or Crystal just about

02:34: the issue?

02:35: >> Um, you know what?

02:37: >> I can go ahead and find it. Yeah.

02:39: >> Yeah, we'll we'll find it. There's a

02:40: blue sky post where um somebody had

02:43: posted if you're not on blue sky like

02:45: get there. The Rstats uh data blue sky

02:48: scene is is really really great.

02:49: Somebody posted a question like, "Hey,

02:51: how can I recode these values based on

02:55: um a named list, I think is what it was,

02:57: right?" [snorts]

02:58: >> And everybody was chiming in and being

03:00: like, "Oh, we can do different things."

03:02: And I'm like, "Oh, here's my workound."

03:03: And Crystal Lewis was like, "Me, too. I

03:05: have the same workound."

03:07: >> Yeah. So, I'll just show you. Um,

03:12: >> yep. That's it. There's my screen chat.

03:16: >> Yeah. Yeah. So, we were all like super

03:18: confused about this whole idea. It's not

03:20: going to look very pretty for a second.

03:22: Um, of like I have a named list here,

03:24: right? This is like a liyker encoding

03:26: where like one means strongly disagree,

03:29: five means strongly agree, and then

03:30: there's everything in between. And you

03:32: might have the data in the form of just

03:35: the numbers and you want to recode that

03:38: using this mapping into the actual like

03:40: word descriptions. And there was this

03:43: whole discussion that went on of like

03:44: what's the best way to do that? And the

03:46: kind of hacky solution was using a

03:49: superseded dlier function called decode

03:51: [laughter] plus this like triple bang

03:54: type thing to get that to work

03:56: >> and

03:56: >> from Arlang. It's an Arling operator.

03:59: [clears throat]

03:59: >> Yeah.

03:59: >> Yeah. But it's a very cool arling

04:01: operator. Okay. Like it's still so

04:03: valid. It's it's really really cool.

04:06: [laughter]

04:07: >> It is cool. It is valid. But wouldn't it

04:09: be great to like have a way to just do

04:11: this without

04:13: >> without without that?

04:16: >> So, it got a lot of traction and like it

04:17: got us thinking of like why is this so

04:20: stupidly difficult? Um, so we we clearly

04:23: figured out there's some kind of like

04:24: hole here. So, the the hole was filled

04:27: um by by recode values. So, just like a

04:32: little bit of how this works, right? So,

04:33: you've got your liyker score here. or

04:36: it's just a column in your table. And

04:38: like there's some typical other way you

04:40: might do this if you didn't have like a

04:42: lookup table on the side where you might

04:44: go through case win and you might say

04:47: you know if score is one strongly

04:51: disagree score is two disagree and so on

04:54: and that works. I mean it's wordy but it

04:58: works. Um and along the like one of the

05:02: nice things about this new function

05:03: called recode values is that it takes

05:06: this like common bit of score and says

05:09: hey you can actually like pipe that

05:11: thing in. We recognize that all of the

05:13: individual cases are going to be

05:15: comparing to score. So you could pull

05:17: that to the front. So now it's score and

05:20: I want to recode all of the individual

05:22: values from score where one becomes

05:25: disagree, two becomes uh strongly

05:27: disagree, two becomes disagree and so

05:29: on. So you can kind of get rid of this

05:31: score equal equal bit. So that's nice as

05:34: like one step in the right direction.

05:37: But remember we had that like lookup

05:39: table thing that we cared about. So what

05:42: we can do is actually

05:45: like if you squint at recode values here

05:48: it kind of looks like a lookup table

05:50: like it it's on the left hand side it's

05:52: mapping to the right hand side and that

05:54: looks pretty nice. So what we can do is

05:56: make that more explicit like we can pull

05:59: that out into a tibble called lookup.

06:04: And instead of this like very familiar

06:07: case winnie interface,

06:10: we can use an alternate interface where

06:12: you supply from and to columns directly

06:17: where I can say from this lookup table

06:20: like words 1 through five map that these

06:24: words strongly disagree disagree and so

06:26: on. So recode score from that to that

06:31: and that works great. And that is kind

06:34: of the answer to that like how do we do

06:36: this recode bang bang bang thing? Like

06:38: why is this so hard? Like we can we can

06:40: now pull this really nice lookup table

06:42: out separately and supply it in our

06:44: pipeline which is especially really nice

06:46: if you have a really long pipeline and

06:48: things get like it just lets you focus

06:50: on actually what you're doing rather

06:51: than the mapping itself. And the last

06:53: thing I'll say about it before we stop

06:55: is is this little bit here. Like it's

06:57: very common in my experience for this

06:59: lookup table to not be in line. Like

07:01: it's actually it's from CSV file

07:03: somewhere else.

07:04: >> So that makes like the recode bang bang

07:06: bang even like like it's like your only

07:08: option because you couldn't actually

07:09: inline it with a case when before. So

07:11: now if you did have it in a CSV, it's

07:14: just as easy as reading it in supplying

07:16: it here.

07:17: >> Yes. And I I want to re-emphasize for

07:20: everybody that everybody has a different

07:23: type of need, right? Like whatever your

07:26: experiences of needing a function,

07:30: most people need it in a different way.

07:32: Everything is so so unique, right? So

07:34: there were a lot of responses that were

07:35: like, why would I ever need this? I've

07:36: never needed it before. You just

07:39: specifically have not happened to need

07:41: it, but then other people have really

07:42: really needed it, right? So, if you've

07:44: ever only written pretty short case win

07:47: statements and you've only ever needed

07:49: maybe three or four things in your case

07:51: win, maybe up to like 10, 11, then it's

07:53: possible you haven't experienced needing

07:56: 800 levels of case win, right? Like it's

07:59: possible that you haven't worked with

08:01: really wild survey data or really really

08:03: wild um you know longitudinal data that

08:08: has needed tons and tons of recoding.

08:10: And in those instances, a thing like

08:12: this that abstracts away all of the

08:14: complications can be really magical

08:16: because Davis is right. Those lookup

08:18: tables exist on their own. In fact, I

08:20: just sent Isabella some survey data

08:22: yesterday that had a a CSV lookup table

08:25: all on its own that I created that had,

08:27: you know, 40 or something entries in it.

08:29: That's usually just the way that it

08:31: goes. So, the real thing that I want to

08:33: talk about behind this with Davis is

08:36: actually the the different little bits

08:38: and pieces that came together to tell

08:41: him it was time to add a function to

08:43: dlier because it wasn't just that blue

08:46: sky post and it wasn't just me talking

08:49: about it, Crystal Lewis making a blog

08:50: post about it. Davis, what all was going

08:52: on behind the scenes that came together

08:54: for you to say like, well, we this is

08:56: definitely time to take action because

08:58: you'd already been thinking about it

08:59: when I messaged you about it, right?

09:01: Yeah, we've had like we've had issues on

09:03: the dlier tracker for years of like uh

09:07: you know you superseded recode but like

09:09: you didn't give us anything better like

09:11: it just feels like there's some missing

09:13: holes where like you superseded this

09:15: function but what there wasn't a

09:17: complete replacement and like at the

09:19: time we we just kind of like looked at

09:21: that and we were like did we I don't

09:22: really know but like you know then you

09:24: see all this community impact of like

09:26: yeah you really did like here's the

09:28: exact example of like the hole that's

09:30: that that that you're missing some kind

09:32: of answer for. And that really like

09:34: nails down the point of like, yeah, we

09:36: think we think that there really is a

09:37: gap here. We think we could do something

09:39: better. Like we agree that Recode

09:40: probably wasn't the best API to begin

09:42: with. We don't feel bad about that

09:44: decision, but like we didn't fill the

09:45: hole with something better. So,

09:48: >> right. So, there was already stuff going

09:49: on behind the scenes. And this brings me

09:51: to GitHub repos. often when um there's a

09:56: feature that you want added to

09:58: something, you will hear us in the sort

10:00: of general open source community say go

10:03: thumbs up that issue. It's the best way

10:06: for us to know that you care about it.

10:08: It's even more important than adding a

10:10: comment, right? If you add a comment on

10:12: an issue that says this is really

10:13: important to me, it's actually less

10:14: impactful than putting a thumbs up. So

10:17: Davis, can you walk through what that

10:18: looks like? like how does someone go

10:20: thumbs up an issue and then how do you

10:23: use that to filter and and find things

10:27: that are valuable to the community?

10:29: >> Sure. Um I have a good example actually.

10:32: So on uh so I work on positron right?

10:36: Positron is the new data science IDE um

10:38: from Pit and like we will go over in the

10:41: issues list over here in Positron and

10:45: like something that we do like fairly

10:47: often is go over here and sort by the

10:51: number of thumbs up and you you probably

10:54: won't be surprised if you're using

10:57: Positron often that Cordo inline output

11:01: is the number one thumbs up issue with

11:04: over 106 six thumbs up. So, if you

11:07: wanted to add your support to uh to

11:10: request this feature, you could hit the

11:12: little smiley face here and thumbs up

11:15: and then it would bump to 107. So, you

11:17: know, I really want Cordo inline output.

11:19: So, let's just do that. And we use this

11:21: a lot. Like we we go in here and we sort

11:24: uh by like, you know, how many thumbs up

11:26: and this is kind of some kind of impact

11:28: or some kind of guide of like what does

11:30: the community care about.

11:33: >> Perfect. All right. So everybody, the

11:36: main issue, post reaction, add a thumbs

11:39: up. That lets people know that you're

11:41: really excited about it. And I really

11:43: encourage you to go check out Posatron's

11:46: GitHub. Go look at all the open issues.

11:49: Um, but also go check out CTO, go check

11:51: out all kinds of things. I want to hop

11:53: over to a couple of questions. Um, Mike

11:56: had asked if you could show us how

11:58: packages like DPI are created along with

12:01: the functions, it would be helpful

12:02: because there are a number of moving

12:04: parts to the package. We're not going to

12:05: go that deep today, Mike. We're going to

12:07: talk about um more surface level stuff

12:09: like adding new functions to an

12:10: established package and deprecating

12:12: functions, but that's a fantastic idea.

12:15: And we did have um Kylie Aninsley on a

12:19: few weeks ago who talked about um a

12:22: little bit about our package, not

12:24: package development, but the package

12:26: structure at least. I think it'll be a

12:27: great idea to talk more about packages

12:29: in a future episode. We also had a

12:31: question from Nathan that was so if we

12:33: have a data dictionary, we could use

12:35: recode with across to apply the right

12:38: values to the right question.

12:41: You can put you can use almost all of

12:44: these with across to go across all of

12:48: your questions. So you could do across

12:50: all or you could do something like um

12:54: starts with, right? Like to grab all of

12:56: your columns that start with something.

12:58: Let's say all of your questions in your

13:01: survey start with like question

13:02: underscore or q underscore. Then you can

13:05: yeah grab all of those and apply it all

13:07: across those and mutate. And we might be

13:09: able to show that with Davis as well.

13:12: >> I was trying to find that example that

13:13: you you asked me to add. Yeah.

13:15: >> Yeah. I'm I pushed Davis to add this

13:18: because often when there's not something

13:21: in a vignette that extends the function

13:24: into using a cross or into using starts

13:27: with or something like that. Um I find

13:28: that learners when I'm teaching get

13:30: really stuck. They're like, "Okay, I

13:32: know that this function does this. I

13:33: know that there's the ability to apply

13:34: it across other other columns, but I

13:36: don't know how to put those pieces

13:37: together." So I think this is kind of

13:40: what they're asking for, right? You have

13:41: multiple columns where they're all liker

13:44: codes and they're all grouped by this

13:46: common name of score. So you could say

13:48: if it starts with score, I want to

13:50: recode those values using that table

13:53: that we had before from too. And then it

13:56: goes ahead and recodes all of those

13:59: columns that match score.

14:02: Really nice.

14:02: >> Yes. Perfect. Um, and then Nor had

14:06: asked, "Why D player 1.2 as opposed to

14:09: 2.0? Is there a limit, a threshold where

14:12: you're like, aha, we've reached 2.0?"

14:15: >> Yeah, the like the 1.0 release of dlier

14:18: was like a chance for us to like

14:20: typically these major releases like 1.0

14:23: and 2.0 are reserved for I really really

14:27: want to break something that like really

14:29: might affect a lot of people's code.

14:31: like we have made some seriously bad

14:34: decision and we think that there's

14:35: something much better now uh and we

14:37: regret something deeply and we'd like to

14:39: break it but we'd like to let people

14:40: know that like there's some big reason

14:42: we're going to break it. So it seems

14:44: unlikely that like we will ever have

14:46: like a deep liar 2.0 at this point. Like

14:48: we feel mostly pretty good about all the

14:51: decisions that we've made. I could I

14:52: could regret those words so fast like

14:54: it's to you know it might happen. Um but

14:57: like for most of the DPL releases will

15:00: be like 1.2 2 1.3 and anything that are

15:03: like really small just bug fixes will be

15:05: like 1.2.1.

15:07: It's not too much to worry about in a in

15:09: a very small patch release.

15:11: >> All right, perfect. And did we touch on

15:13: what a tidyup is?

15:16: >> Um you you might have heard us if we

15:18: were talking on blue sky or we're

15:20: posting on LinkedIn, you might have seen

15:22: the phrase tidy up. Can you talk a

15:24: little bit about what that means?

15:26: >> Sure. So, one of the big ways that we

15:29: get uh feedback from the community in

15:32: addition to like Blue Sky and LinkedIn

15:34: and kind of talking with you all there

15:36: is um the somewhat newish process that

15:39: we use called tidyups. If you're

15:41: familiar with like peps from the Python

15:44: ecosystem, which is like a Python

15:46: enhancement proposal, tidyups are kind

15:49: of our community facing similar uh

15:52: similarish idea. So like they live here

15:55: under tidyiverse tidyups on GitHub. We

15:58: have eight of them and each of these is

16:01: some kind of proposed large change to

16:04: the tidyiverse. Either it's some kind of

16:07: breaking change or some kind of like

16:09: totally new feature that's pretty big

16:11: and we'd like to get it right the first

16:12: time around. Um so for like recoding and

16:16: replacing for example since we've got

16:19: zoom in just a little bit.

16:20: >> Oh yes. Click click. Yeah. Awesome. Um,

16:23: since we got this wrong so many times

16:25: before, we decided to do a tidy up to

16:27: get a lot of like community feedback to

16:29: make sure that we got it right this time

16:31: around. Um, so like there, you know, you

16:34: can go through and read this. It's just

16:35: like a markdown document. Um, I'll show

16:37: you the outline. Oh, actually it's in

16:42: here now. Um, the outline is kind of

16:45: just the most interesting thing to look

16:46: at real quick. Like you can get a a

16:48: general vibe of like our motivation for

16:50: this function. like all these examples

16:52: of what you might have done instead.

16:55: Like here's here's how it's better than

16:57: X Y and Z and like how are we going to

17:00: preserve backwards compatibility? How do

17:01: you teach this if you're a teacher? Like

17:04: we try to think of as many things as

17:05: possible in this tidy up of like what

17:07: could be interesting for people and then

17:09: we release it for the community to kind

17:11: of give feedback on this markdown

17:12: document. And a lot of people did which

17:14: is great. like we had a lot of people

17:16: come through and say um like all kinds

17:20: of things they do or don't like about it

17:22: and people also gave a lot of feedback

17:23: for this one on blue sky and LinkedIn

17:25: which we used as well and kind of

17:26: incorporated everything in here.

17:28: >> So it was great.

17:29: >> Yeah. This if you ever see tidy ups out

17:31: in the wild this is your chance to weigh

17:33: in on this package that we all use and

17:37: that many many people um contribute to

17:39: and maintain. I really want to encourage

17:42: everybody if you've never ever

17:44: participated in open source development

17:46: before to go through and read things,

17:48: read the comments of others. If you are

17:50: ever nervous about commenting, hop on

17:52: the Discord and let us know like, "Hey,

17:54: I really want to add this comment, but I

17:55: don't know if this is the right thing to

17:56: do." Ask somebody and they can help you.

17:59: I'll chime in and help as well. Or

18:01: Isabella will or Daniel, somebody will

18:03: will hold your hand a little bit. I

18:05: wanted to point out something that Jenny

18:07: Brian said in the chat which she was

18:09: kind of adding a little bit more context

18:11: to our conversation around thumbs uping

18:14: issues which I think is really helpful.

18:16: She said every time someone comments on

18:18: an issue every dev gets a notification

18:21: and it can be really overwhelming if

18:23: you've got thousands of issues open for

18:25: every single dev to be getting a

18:28: notification for every single comment

18:29: that comes through.

18:31: So, it's useful if the comment really

18:35: adds something, a new example, a new

18:37: angle. Um, but it's not as helpful if

18:40: the comment is just, hey, I'm having

18:42: this problem, too. If that is the point

18:45: that you're trying to get across, those

18:46: thumbs up are a better and more

18:48: efficient way to do that. So, thank you,

18:51: Jenny, for the extra context there.

18:54: All right, I say we go ahead and move

18:56: on, Davis, to talking about the next

19:00: function that we are adding to D player

19:03: that has been added to D player. Would

19:05: you like to share that little demo of

19:07: filter out? This one I saw had some

19:09: controversy on LinkedIn and Blue Sky.

19:12: People going, I don't know why you would

19:14: need this. And then a bunch of people

19:15: saying, oh my gosh, I've been waiting

19:17: for this forever.

19:19: >> Yeah, in fact, let's see. Yeah, we have

19:22: we have issues from like 2019 or

19:26: something like that that was like asking

19:28: for filter out and and we were just like

19:30: ah no, we don't need this right now.

19:32: Like we don't think we need this, we

19:34: don't think we need this. We were the

19:35: same as these people. We were the P

19:36: people on LinkedIn going like you don't

19:38: need that. Like that's no good. Um but

19:41: like eventually there's an example that

19:43: I'll show you here that kind of

19:45: convinced me that we need filter out. So

19:49: what is this idea? So, filter lets you

19:52: specify which rows you want to keep.

19:56: >> Filter out lets you specify which rows

20:00: you want to drop.

20:01: >> Yes. Can we zoom in really quickly one

20:04: more time so we can get bigger? We're

20:06: getting feedback on on YouTube that's

20:08: like, "It's not big enough, y'all. We

20:10: need bigger text."

20:11: >> Okay,

20:11: >> I totally get it.

20:12: >> Big we can get without annoying me.

20:14: There we go. How's that?

20:16: >> Pretty good. Yeah,

20:17: >> pretty good.

20:18: >> Everybody can see, right? Let me know in

20:20: the chat if you can.

20:22: >> Yeah, just let me know. Um, so say we

20:25: have some patients data here. Uh, this

20:27: is just tracking whether the person is

20:30: dead or alive and if they're dead, uh,

20:34: when did they die, I think, or the the

20:36: date of this kind of information here.

20:38: So like we might have some question

20:41: where you want to know the you want to

20:45: drop the rows where two things are

20:49: happening at once. The patient is

20:51: deceased and the year of that kind of

20:54: information was before 2012. So like two

20:58: things patient is deceased that's the

21:00: deceased column and the year was before

21:02: 2012 that's that goes with the date

21:04: column. So you could like directly

21:06: translate this into a filter statement

21:09: where it's like they're deceased.

21:12: The date is before 2012.

21:14: And rather than keeping those rows, I'm

21:16: looking to drop those rows. So you could

21:19: like wrap this whole thing in

21:20: parenthesis and just put a knot in front

21:22: of it. That's kind of your most direct

21:24: translation.

21:26: And that kind of works except it's not

21:29: exactly what you want. And it's a little

21:32: bit subtle to understand why this isn't

21:35: exactly what you want.

21:37: But if you think about the question like

21:39: I want to drop like only when I know

21:42: that that patient is deceased and I want

21:44: to drop rows only when I know that the

21:47: year was before 2012. So, if you look at

21:50: the results here, what you'll notice is

21:52: that my wife Sarah has been dropped out

21:55: of this uh kind of data set here because

21:58: we don't actually know that she's

22:01: deceased or what the date was, but it

22:04: has dropped her out of this data set

22:06: kind of by accident. We dropped too many

22:09: rows. And the reason for that is kind of

22:11: complicated, but it has to do with how

22:13: filter works with missing values. Um,

22:16: and what you end up having to do

22:18: instead, you just kind of start adding

22:21: in these like really really ugly like

22:24: deceased and it's not NA. Uh, it's

22:28: before 2012 and it's not NA. And like

22:32: you end up kind of squinting at this for

22:34: a while and maybe you end up with the

22:36: right answer. You're like, "Okay, now I

22:38: finally got like what I was looking for.

22:40: like if I don't know the answer, I still

22:43: want to keep that row. And typically

22:45: like that's what you're actually after

22:47: when your question, your kind of problem

22:49: statement up top says like I want to

22:52: filter out specific rows. Like you

22:54: typically don't want to drop the missing

22:56: values. So what we've ended up with with

22:58: filter out is a way for you to kind of

23:01: directly translate your question right

23:03: into code as it was before uh and keep

23:06: that intent of I don't want to drop the

23:10: missing values either like if it's this

23:13: lets you say I only want to drop the

23:17: deceased and I only want to drop where I

23:19: know date is before 2012 since you don't

23:22: know that about say max here that row

23:24: sticks around. Hopefully that makes a

23:27: little bit of sense. But the general

23:28: guideline is at the bottom here is if

23:30: you decide you only want to keep rows,

23:32: like if that's how you're framing the

23:34: problem in your head, you want to

23:35: filter. If you're kind of thinking about

23:37: it as I want to get rid of some stuff, I

23:39: want to drop rows, you probably want

23:41: filter out.

23:43: >> Perfect. I'm going to check the Discord

23:45: really quickly to see if we have any

23:47: questions. We did have one from Louise

23:50: earlier that was saying like, "Hey, I

23:54: didn't catch that anonymous formula

23:55: notation in the last shared screen. What

23:58: was that for?" But I'm not sure, Louise,

23:59: what you were looking at or what Davis

24:01: might have been showing. If you have

24:04: >> more context on that, let me know in the

24:06: Discord and we can possibly go back and

24:09: look. If it was on um GitHub, we can go

24:13: back to GitHub and look at stuff. But I

24:16: wanted to Davis, if you could share your

24:18: screen one more time. Um, we had gotten

24:20: some questions and feedback about the

24:22: the way that our the example is styled,

24:24: right? Where it's like filter out

24:26: deceased. It's not deceased equals true.

24:28: It's just deceased. And then also,

24:30: what's the difference between a comma

24:32: and an and

24:34: what like what's the difference between

24:36: having a comma versus having two filter

24:38: out statements where I'm like filter out

24:40: deceased equals true, filter out date

24:42: greater than 2012. Um could you talk

24:45: about that just a little bit?

24:48: >> Yeah. So in this case

24:51: these

24:53: these are equivalent. Anytime you have a

24:56: comma in either filter out or filter the

24:59: comma is kind of a standin for and. But

25:03: whenever you have like multiple

25:05: conditions, like they kind of look

25:08: nicer, like especially as you add more

25:11: and more conditions if they're separated

25:13: by a comma, cuz that means they kind of

25:15: end up on their own line. Uh, and

25:17: they're kind of separated and like you

25:19: could think about them individually um

25:21: rather than having a whole bunch of and

25:23: signs here. If you wanted to do um an or

25:27: instead, then you could either use that

25:32: deceased or the date is less than 2012

25:35: or you could use the other one of the

25:38: other new things that we've added to DPL

25:40: 1.2 which is called when any

25:44: and this lets you keep

25:48: the commas

25:51: and write it like this. I want to drop

25:54: rows when any of them are

25:56: [clears throat] deceased or when the

25:57: date is less than 2012. So when things

26:00: are inside of when any, they're combined

26:02: with or instead of and.

26:05: >> Perfect.

26:07: Awesome. Thank you. Okay. Now, another

26:11: thing that we mentioned way earlier in

26:12: the chat and Lauren and Raha, I think

26:14: both had asked about it was did Libby

26:17: say wiferiven development? And yes, I

26:20: did say wife- driven development. Davis,

26:22: do you want to talk about that?

26:24: >> Yeah. Uh, so my wife is um kind of like

26:28: a she works for a nonprofit and she does

26:30: like a lot of data analysis work and she

26:33: we both work from home. So she she's in

26:35: the office like right above mine and I

26:38: often will go up there and like look

26:39: over her shoulder because she uses R and

26:41: she uses like all the Tidy Burst stuff

26:43: and all dier and all the packages that

26:45: we created. So I would look over her

26:47: shoulder and she would be like why does

26:49: it do this? And I would just like shake

26:52: my head and be like, gosh darn it. Like

26:53: you pointed out like another hole of

26:56: like something that we need and I have

26:59: to go do more work now. I'll be back in

27:01: like half an hour and like go and figure

27:03: out like a function that she needs and

27:05: add it. Um, so like with filter out in

27:08: particular

27:09: like we we aggregated like all of these

27:12: examples of like where people really

27:14: needed filter out, but like the most

27:16: compelling to me was this one right

27:18: here. My wife has brought this up to me

27:21: at least three times. So that is called

27:24: wif-driven development ladies and

27:26: gentlemen. That is that is life

27:28: development at its finest.

27:30: >> I love it. Okay. I wanted to address

27:33: something that I see in the chat which

27:35: is lots of chatter about like

27:39: negating things with the bang and

27:42: mentioning like all of the creative ways

27:44: that people have learned to circumvent

27:47: this and we no longer need it. But we're

27:48: all kind of used to adding that bang to

27:50: everything. I wanted to also mention

27:52: that there is no not in or there wasn't

27:54: for a long time. Um there was like

27:57: percent not percent but percent not in

28:00: percent has been or is being added to

28:03: basar. Um it was in the the releases the

28:06: release notes a couple of months ago and

28:09: I saw some people who were like I've

28:11: literally never needed that. Why would

28:13: we need it? and then thousands of people

28:14: who were like rejoicing because they've

28:16: been adding it to their our profile or

28:18: something for a really long time. So,

28:19: it's another good example of just

28:21: because you don't use something doesn't

28:24: mean that everybody else is not like

28:25: really really wishing it existed. I will

28:28: add let me see what do I have? Do I have

28:30: a link? Maybe I can I can find the link

28:32: to the development news, but I will put

28:35: um just the little like bit of context

28:38: in the chat for

28:41: how it was added in there. I just loved

28:43: the description on it because the

28:46: description says um provided almost

28:50: entirely for convenience and code

28:51: readability from an R devril suggestion

28:54: after many years of private definitions

28:57: mostly hidden in packages including in

29:00: RS tools package. Amen. We've all been

29:03: hiding it for a long time. Um okay, so

29:05: there was another question as well.

29:07: Let's head back over to Dave's question.

29:10: And David asked, "I'm interested in your

29:12: thoughts on incorporating the power of

29:14: Deep Liier into Snowflake pipelines for

29:17: data transformations. I'm coming up on

29:19: converting some Altrax workflows into

29:22: Snowflake without DBT. Is SQL the only

29:25: option for setting up the staging marts

29:27: and tasks. I think you might be looking

29:29: for DB Plier. Um, Isabella or Davis,

29:33: would you like to chime in here?"

29:37: >> Isabella.

29:38: >> Oh, yeah. Well, I would welcome your

29:41: thoughts, Davis, but EV plier allows you

29:43: to use the plier syntax on databases.

29:47: Um, and I've definitely tried it out

29:49: with Snowflake databases before. So,

29:51: give it a shot and see if that might be

29:54: a solution.

29:56: >> It does look like we have an official

29:58: like it does look like DB Plier itself

30:02: has an official like Snowflake back end.

30:05: I'm sure if something doesn't work quite

30:07: right in there in terms of how things

30:08: are like translated to SQL via

30:11: Snowflake, Adley will be happy to take

30:13: that issue and try and make it a little

30:15: bit better for you.

30:17: >> Perfect. All right. Thank you. And then

30:19: we had an update on Louisa's question

30:21: because Tan

30:23: found I think what we were talking about

30:26: with the um anonymous notation and it

30:30: was inside of a vignette

30:35: for recode and replace values. I can

30:37: share my screen really quick.

30:39: >> This Aha, you found it. Yep. Um there is

30:43: sort of anonymous notation there or it

30:45: looks like it in the bottom.

30:47: It's really just the dox I think is

30:49: probably what we're talking about. There

30:51: you go.

30:52: >> Okay. Yeah.

30:56: >> Awesome. Thank you.

30:57: >> Yeah. Is there a question? Right. Like

30:58: we just like wondering what this is kind

31:00: of thing.

31:00: >> Yeah. If you could explain it. So this

31:02: is actually something that um when I am

31:04: teaching this is a super common question

31:06: that will stop learners in their tracks

31:08: because it's not intuitive. It's not

31:11: explained anywhere. It's one of those

31:13: things like, you know, hey, I'm looking

31:14: in the help documentation and I keep

31:16: seeing dot dot dot everywhere as an

31:18: argument. What does that mean? But it's

31:19: not explained anywhere. It's kind of

31:21: tacit knowledge.

31:23: >> Yeah. For a long time, like so what

31:26: we're trying what we're trying to

31:28: accomplish here is say for every column

31:31: that starts with score in its name, I

31:34: want to like do something with that

31:36: column. In this case, I want to recode

31:38: the values in that column from something

31:41: to something else. But inside of recode

31:44: values, we need to like we need to like

31:46: reference that column somehow. I need to

31:48: like pass it to recode values. So there

31:51: wasn't really an easy way to do this in

31:53: R for a long long time. Uh so what we

31:56: had created inside of like Arlang and

31:58: the tidyiverse was this like very

32:00: compact kind of formula one-sided

32:02: formula notation where like you put a

32:05: formula and on the right hand side you

32:07: get to reference this like dox here and

32:10: all that really is equivalent to is

32:13: function of ofx

32:19: recode values. And it just kind of

32:21: allows you to get away with that without

32:23: having to put the function up on the

32:25: front front side. Um, and then any any

32:28: column that starts with score kind of

32:30: gets subbed in forx like whenever you

32:32: execute the code. Now, as of like

32:35: relatively, you know, newish R, you can

32:38: do this instead. And this is probably

32:43: like this was probably motivated by like

32:45: us adding this many years ago. But now

32:48: directly in R without anything from the

32:50: tidyiverse, you can do these nice little

32:52: anonymous functions. And this is still

32:55: exactly the same as putting function

32:57: here. This little, you know, backslash

33:00: slash, whatever, whichever one this is,

33:02: parenthesis x is exactly the same as

33:04: function x. And and now you don't really

33:07: need the tilda.x anymore. you can just

33:09: use this form instead. And we don't care

33:11: what you use. Like we have no really

33:13: strong preference, but we've probably

33:15: started to migrate most of our docs to

33:17: the new new form. Same with the base

33:19: pipe. Same kind of idea.

33:21: >> Perfect. Thank you, Louise, for asking

33:23: that question. It is a very very good

33:26: question. Um, that notation is super

33:28: super confusing. It's confusing to me. I

33:30: look it up every single time I use it.

33:32: And thank you to Tan for helping us find

33:34: that example. That was really really

33:35: helpful. Teamwork in the chat, y'all.

33:38: Um, okay. So, speaking of things

33:41: changing and us not wanting you to do

33:44: something anymore, can we talk about

33:47: with our last little like 20 minutes

33:48: here, can we touch on deprecation?

33:52: Because

33:53: what recode values entering the chat

33:56: means is that case match is being

33:59: deprecated. And there are some people

34:01: who are like, you will pry case match

34:03: from my cold dead fingers. Um, but it's

34:06: a drop-in replacement. Can we talk a

34:07: little bit about what deprecation means

34:10: for recode values and case match um

34:12: specifically but then also how

34:14: deprecation decisions are made in

34:16: general the difference between

34:17: deprecating and superseding?

34:20: >> Yeah, I think it's helpful to just have

34:21: this little chart up.

34:23: >> Yeah, let's do that.

34:24: >> This is I assume you guys have the link

34:26: to this that you can share. Uh there's a

34:29: package that we use called life cycle

34:32: and this kind of lets us manage how our

34:35: functions in any given package is uh how

34:38: they're deprecated like it lets us

34:40: manage the life cycle stage of that

34:42: function. Most of the time the

34:45: tidyiverse lives in this kind of green

34:47: stable bul uh bucket here. It won't

34:50: necessarily say stable or anything but

34:52: if it doesn't say anything special you

34:54: can just kind of assume it's stable. Um

34:58: now whenever we decide that like we made

35:01: a bad decision or some about something

35:02: or we want to change something and

35:04: replace it with something else uh things

35:06: will get moved from stable to either

35:10: deprecated or superseded. Now the

35:13: difference between these two is

35:16: superseded

35:18: is like it's frozen in time for for

35:21: forever. Like you will be able to use

35:24: this thing for

35:26: infinity amount of time, but we will not

35:29: make any updates to it. We will not add

35:31: new features to it. We will only fix the

35:33: most critical bug fixes, but it will

35:36: continue to work for forever.

35:38: Deprecated

35:40: is the idea that we will eventually like

35:42: to remove this. It might take us 5

35:45: years, but we would eventually like to

35:47: remove this thing. So that's the two

35:50: ways you can think about what go like

35:51: what these two words mean. Like the way

35:54: that we decide like is a function, you

35:57: know, being targeted for deprecation or

35:58: superseded.

36:00: It's a little fuzzy. uh you know in in

36:03: tidyr we superseded gather and spread

36:07: because those existed like from the

36:09: beginning of tidyr it's been so many

36:11: years like it's embedded in people's

36:14: documentation if they're teaching like

36:16: in their slides and how just how people

36:18: learn tidyr from the beginning is

36:20: sometimes with gather and spread so

36:22: there was no way that we could ever get

36:24: rid of those but with case match like

36:26: that was kind of introduced in dlier 1.1

36:29: which is the version you know right

36:31: before 1.2. It's only been a few years.

36:33: Like we don't think that many people

36:35: actually use it when we're looking at

36:36: packages. Uh and it was kind of a really

36:39: bad name and we have a really direct

36:42: replacement with recode values. So all

36:44: of those things just kind of piled on

36:45: and said, "Okay, it looks like we could

36:47: probably remove this thing." So we've

36:49: decided to deprecate case match instead.

36:52: So it's a little bit fuzzy in terms of

36:53: exactly how we decide, but that's the

36:55: general idea.

36:56: >> All right. How should people think about

36:59: the the decisions that they need to make

37:01: in the moment when they see something

37:03: that says deprecated or superseded or

37:05: experimental? Um, and if you would like

37:07: an example of an experimental function,

37:10: you can go check out something like

37:13: nestby. I'll stick that in the chat for

37:15: everybody. If you go click that page,

37:17: you will see that it has a little tag

37:18: that says life cycle tag experimental.

37:21: Um, so if someone sees something that is

37:22: experimental or deprecated or

37:24: superseded, what decisions should they

37:26: be making about whether or not they

37:28: should use that and in what context?

37:30: Like, should I put this in my production

37:32: code? [laughter]

37:33: >> Yeah, I I think um,

37:36: you know, if you're a diehard gather and

37:39: spread person and you used it before it

37:41: was superseded and stuff and you really

37:43: don't want to switch, I think that's

37:45: totally fine. Like if you saw that it's

37:46: superseded all of a sudden and you were

37:48: like, I don't I but I really like it.

37:50: like that's okay. But if if there's a

37:52: function that you stumble across and it

37:54: says that it's already deprecated or

37:56: it's already superseded, like you should

37:58: probably looking be looking for the the

38:01: replacement and learn that instead. Like

38:03: I wouldn't encourage learning the

38:05: superseded or deprecated function if

38:07: you've never used it before. Um for

38:10: experimental um I mean we we'd like

38:13: feedback on the thing. We try not to

38:14: break too many things as like that are

38:17: experimental. we hope to move them into

38:19: stable, but experimental is our way of

38:21: saying like we aren't quite sure about

38:24: this yet. Like we feel pretty good about

38:26: it. Uh it seems useful, but if this is

38:29: one of those things in particular where

38:31: if you have feedback on it or it doesn't

38:33: feel right, we'd really welcome a GitHub

38:35: issue about that.

38:37: >> But I think you should feel free to use

38:39: it.

38:40: >> Yes. And if you are ever on the D player

38:42: documentation

38:44: um in the tidyverse.org website and you

38:46: see a tag. It says life cycle. It looks

38:48: like a little pill with half one color,

38:50: half the other, um, you can click on

38:53: experimental or deprecated or whatever

38:55: and it's going to link you directly to

38:57: the definition of what that means, which

39:00: can be really helpful. Um, okay. I had a

39:02: question from Tan, which was, is there

39:05: an internal rule of thumb on how long

39:08: something stays experimental? Like when

39:10: is Nestb going to be non-experimental?

39:15: That's a good question. Um,

39:20: not really. Like typically um like I

39:22: would say a minor release just so you

39:24: know moving dlier from 1.1 to 1.2 we

39:29: moved like the buy function from like

39:32: mutate and summarize that was new from

39:34: experimental to stable. So I would say

39:36: like a minor release. Now it just

39:38: depends on the cadence of that package

39:40: of how often is a minor release

39:41: released. You know, sometimes it's for

39:44: dierly it was like a couple years. For

39:46: tidy art it might be like every year,

39:48: something like that. Um, but I would say

39:50: roughly maybe a year is about how much

39:54: time it takes us to kind of figure

39:55: something out, decide it should be moved

39:58: to stable or not.

39:59: >> Right. All right. Cool. Well, I wanted

40:02: to ask you if you could give us one more

40:04: example with replace values because we

40:08: talked about recode values. Um, why

40:12: would we need a replace values? And I'm

40:14: going to stick a guest in the chat for

40:17: replace values. Um, that people can

40:20: follow along if they would like to.

40:24: >> Sure.

40:27: >> Sorry, all my my pasts into Discord have

40:29: enormous inbeds. I'm getting rid of

40:31: them. I promise.

40:33: While we're waiting, Brent Feifer had

40:36: asked, "How often do you have these

40:37: wife-driven coding moments?" Yeah,

40:40: >> more often than you'd think. Yeah, I've

40:42: had quite a few. Um

40:45: there's a lot of there's a number of

40:46: functions in like the clock package

40:48: which have been motivated by her cuz she

40:50: uses that for she does a lot of time

40:52: series stuff and um

40:54: >> yeah like a number of things in dlier

40:56: and tidr as well which have been just

40:57: originally motivated by some kind of

40:59: wife driven development.

41:01: >> It's so funny. I h the clock package is

41:03: one of those packages where like I have

41:05: the hex for it but I've never used it

41:09: and I feel like such a poser. I'm like

41:10: look at me with my hex for a clock. I

41:12: think it's so cute and yet

41:15: um yeah so Raha had asked what exactly

41:18: is a gist? I had shared a gist. What a

41:20: great question. A gist is like a really

41:23: uh self-contained

41:25: single file or couple of files instead

41:27: of a repo, right? So you can just click

41:29: it and you get straight to the text

41:33: version of whatever it is that you've

41:35: been linked to. So if you click that

41:37: gist, it will pop up and just literally

41:40: just be a R file. Um that there are

41:44: things you can do inside of Gists. Like

41:46: you'll see if you click that that Davis

41:48: commented on it. So he's got comments in

41:50: there. It's just a really self-contained

41:52: way to send somebody a little packet of

41:55: like here is a snippet of code. Uh, but

41:58: I have often sent things to learners

41:59: that have like a R file, but then also

42:01: you can add multiple files. So I can add

42:03: a CSV. So straight from one link, they

42:06: can go like download a CSV and grab the

42:08: code file and run all of it. So if

42:11: you've never seen one, you can make one

42:13: at like gist.github.com. If you just go

42:15: there, it'll log you into GitHub and you

42:18: can create your first guest and you can

42:19: make them private or public.

42:22: All right, Davis, we only have about 15

42:25: minutes left. Would you like to give us

42:28: an example of replace values?

42:30: >> Sure.

42:36: >> Yeah. So, we added recode values which

42:40: is kind of use. It's useful for

42:42: replacing every single value

42:46: uh with something else. So as we saw

42:48: over here uh when we were recoding we

42:52: replaced every single value in score

42:55: with something else like 1 2 3 4 and 5

42:58: all got changed to some other value and

43:02: in particular the type changed as well

43:04: like it was a numeric and then it became

43:06: a character. But there's also this like

43:09: very common scenario where you're just

43:12: like patching up some column. In this in

43:16: this case, we have some state column and

43:19: things aren't quite right. Like we have

43:21: some missing values, we have some

43:22: unknowns, we have some not recorded. It

43:25: would be nice if we could like

43:26: standardize all these things, but we

43:28: still want it to be a character vector.

43:30: And I still really just want all of the

43:32: good values to stick around. So in the

43:36: past, like you might have done this kind

43:39: of patching with like a various set like

43:41: a variety of different tooling. Like if

43:44: I wanted to say replace all of the NAS

43:48: with unknown, maybe that's my first

43:50: pass. Like I might use if else and say

43:53: like if it's NA put unknown otherwise

43:57: keep state and like that works fine.

44:00: Similar with coales similar with tidyr

44:03: replace na. all of these little

44:05: utilities that we've created in the p

44:07: over the years of of different ways to

44:09: do this. They all give the same thing

44:11: with replace values. It's it's similar

44:15: kind of case win style like interface

44:17: that you've seen before except like it

44:22: starts with state and you can say

44:24: whenever there's an NA put unknown and

44:28: then the kind of implication here is but

44:30: keep everything else the same. So the

44:34: NAS become unknown but all of the other

44:37: values from state stick around. And

44:40: that's like something that you may have

44:42: done with uh like case win a lot like

44:46: the similar kind of casewinny thing here

44:49: is

44:49: >> good old default.

44:51: >> Yeah. Yeah. Isn't a state put unknown

44:57: and a good old default of state. And

45:01: that wasn't supposed to be there.

45:04: And it's just kind of weird to me that

45:06: like [snorts] state the thing that you

45:09: care about was the last argument here.

45:11: It's like the default argument. It's the

45:13: last thing you see when really like when

45:15: you're doing some kind of partial

45:16: updating like it feels like it should be

45:19: the first thing that you see. And that's

45:21: what you get out of replace values. That

45:23: like change of intent is really like the

45:26: really most important thing about

45:27: replace values that just kind of feels

45:29: right. Same problem with if else and

45:32: then coales was kind of nice here but

45:34: and not as useful because it only works

45:36: within.

45:38: >> Yeah, coales is one of those functions

45:39: that not a lot of people know what it

45:41: what it does. Do you want to talk about

45:42: that a little bit?

45:44: >> Yeah, so coales comes from like the SQL

45:46: world. It's like a direct translation uh

45:49: from the SQL world. uh and and all that

45:53: it does is say it says okay anywhere you

45:56: see na I want you to give me some other

45:59: value to replace that with so like state

46:02: has nas and I want to replace that with

46:05: unknown so in this case state gets

46:08: replaced with unknown it's a little bit

46:09: more complicated than that but like

46:11: that's the general way that people use

46:13: cos

46:14: >> yeah it's one of those that if you're

46:16: not if you're not coming from SQL you

46:17: might not ever think to look for it or

46:19: know that it exists there's all kinds of

46:21: functions in D player that are like

46:23: that. Um,

46:24: >> and quick question, why is the function

46:28: called coales? Is that the same term as

46:30: in SQL?

46:32: >> Yeah, we didn't have control over that

46:34: one,

46:35: >> right? That was a legacy from SQL. Um,

46:39: I'm going to ignore the fight in the

46:40: chat over whether or not it's GIS or

46:44: gist because uh it's okay. You you say

46:47: it however you want to say it. I say

46:49: gist because of GitHub, GitHub, Gist. I

46:52: assumed it was a play on words. Um, we

46:55: had another question that was a little

46:57: further up from Russ that had said,

46:59: "Hey, I received a message this morning

47:01: that one of the packages that I use in

47:03: my packages is going to be archived next

47:05: week." It's unclear whether or not this

47:07: is a Tidyverse package, but some kind of

47:10: package. He says, "I'm working to fix

47:12: this, but is there a list of packages or

47:14: functions that are going to be archived

47:16: so I can get a little bit more lead time

47:18: if this ever happens again?" I think

47:21: that we can talk about the way that um

47:24: Posit with the Tidyiverse packages

47:27: approaches this and how they let people

47:28: know because there is a lead time where

47:30: they let people know a couple months

47:31: ahead of time. Davis, can you talk a

47:32: little bit about the behind the scenes

47:33: of that?

47:34: Yeah. So, um it's unclear if it's us

47:39: that broke this package or not uh from

47:42: from what he says, but if we are going

47:46: to break your package, we typically know

47:48: because we run reverse dependencies

47:51: checks on like you know dlier has like

47:53: 6,000 packages that depend on it. We

47:56: check the uh tests of all 6,000 of those

48:00: packages before we send a new version of

48:02: dpllier to cram. And if anything looks

48:05: like it's going to break because the

48:06: changes that we make, we go ahead and

48:09: send the pull request to that maintainer

48:11: and say like, hey, it looks like we

48:13: broke this. Here is how you fix it. Um,

48:16: and it's just our way of doing some kind

48:18: of like community outreach, community

48:20: goodwill, and hopefully making any

48:22: change we make a little bit easier to

48:23: swallow. Uh so like when we do that we

48:27: give pe we especially with a big package

48:29: like dpllier we try to give people

48:30: around a month to update their package

48:33: before we push something to crayon and

48:35: then whenever we put something on crayon

48:37: crayon will give you another two to four

48:39: weeks depending on the package to

48:41: actually fix the thing before there's

48:43: any risk of like actually getting kicked

48:44: off. Um so I'm not exactly sure what's

48:48: going on in this case but that's the

48:49: general way that we look at things.

48:51: >> Perfect. Thank you. We had a couple of

48:53: other questions that were function

48:55: specific and I figure since we have a

48:58: few minutes here we can go ahead and

49:00: talk about some of those. One was from

49:01: Daniel that said could coalesce be used

49:04: on multiple columns.

49:07: Um uh you could certainly use it like

49:11: with an AC I'm not exactly sure what you

49:14: mean here like we could put uh so one

49:17: thing you can do is put like another

49:20: column here instead of unknown and you

49:24: know if it was the 1 2 3 fourth value of

49:28: state that was in a and I had you know

49:31: another fallback column that was here it

49:35: would take the it would take the fourth

49:37: value of fallback and fill that in for

49:40: NA. So that's a way to put two columns

49:42: in coales. If you're asking if you want

49:44: to like run coales over multiple

49:46: columns, you can do that with

49:48: [clears throat] a cross similar to the

49:49: other uh like example that we showed

49:52: from GitHub.

49:54: >> Perfect. And Russ did get back to us and

49:56: say it was not anything in Tidyverse

49:57: that's going to get archived next week.

49:59: Sorry for not being clear about

50:01: [laughter] that. Um yeah, you know, it

50:04: one of those things about open source

50:06: development is that a lot of people have

50:08: different standards for how they do

50:10: things. Um and whether or not they are

50:13: organized and being headed by somebody

50:16: who is doing project management and

50:18: making sure that those things happen. So

50:20: I think it's probably different for

50:22: everybody across the board, but that's

50:23: the way that we do it here at Pit. Uh

50:27: there was another thing that I wanted to

50:29: call out that was I think Alex had

50:31: mentioned somewhere that like hey Libby

50:33: mentioned dot dot dot but then we didn't

50:34: talk about it. Um and that is a really

50:38: really common question that I see about

50:41: dlier documentation but really any R

50:43: documentation is like why do I keep

50:45: seeing this dot dot dot as an argument

50:48: option and what does that mean? And it

50:50: really is a placeholder that's saying

50:53: this function can accept

50:56: any number of extra arguments. Um, and

51:00: those are usually arguments that are

51:01: being passed to like another function or

51:05: even a function that is inside of that

51:07: function.

51:09: Davis, do you have a better, more

51:10: eloquent way to describe the dot dot dot

51:12: placeholder?

51:16: >> That's pretty good. But I think I think

51:18: you could think of it like like inside

51:21: of mutate for example

51:23: uh the dot dot dot means I can take any

51:29: number of conditions. You can add two

51:32: columns, you can add five columns, you

51:34: can add 10 columns. Dot dot dot in this

51:37: particular case says you can give me any

51:40: number of columns or expressions that

51:42: you want to add. So typically in in a

51:45: example like this like we use dot dot

51:47: dot to mean like any number of the thing

51:50: and that's a pretty concise way to say

51:52: it I think.

51:53: >> Okay. Yeah. I think it's one of those

51:55: things where it's not explicitly

51:57: explained anywhere and I have I have had

52:00: questions about it for years. I am

52:02: constantly going like oh man dot dot dot

52:04: what what functions where should I be

52:07: looking to see what other arguments I

52:09: can use with this function right? like

52:11: just give me a menu of options so that I

52:13: know what I can use because then I'll

52:15: see somebody's code somewhere where they

52:17: have um an argument

52:21: in this function that I didn't know you

52:23: could use there, right? And it was just

52:25: encompassed by the dot dot dot and that

52:27: feels so frustrating as a user. Um, I

52:30: don't know if there are any resources

52:31: that anybody knows of to like see what

52:33: their options are when they're using

52:35: that, but oh, thanks Ryan as well for

52:38: linking the dot dot dot section of

52:40: advanced Rbook. That's really helpful.

52:44: All right, if we do not have any more

52:48: questions for Davis about

52:51: communitydriven development or D player

52:55: or behind the scenes stuff, I will say

52:57: we can go ahead and wrap up. But I will

52:59: remind everybody that if you registered

53:02: for Rainbow R, I think registration

53:04: closed yesterday. That is happening

53:06: tomorrow and the next day I will be

53:08: there. I will be doing um a short data

53:12: science trivia with Dommy Pac. You can

53:14: also

53:16: um let's see we have call for talks open

53:19: for us for a little bit longer. I think

53:22: Isabella that's right. Right.

53:25: The call for talks for posit has closed.

53:28: It officially closed closed on the 20th.

53:29: Thanks for everybody who submitted. Um

53:32: and then also

53:34: we do not have a data science lab next

53:36: week. So

53:38: same time, same place. Something else is

53:40: happening actually if you would like to

53:41: sign up for it. Um Johnson and Johnson

53:44: is going to be doing a webinar. So,

53:46: Satish from Johnson and Johnson will be

53:48: talking about the admin perspective, the

53:51: IT perspective of scaling data science

53:54: idees. Specifically for them, that's

53:57: positron as a way to kind of combine

54:00: everybody onto one platform instead of

54:02: everybody in the wild wild west kind of

54:04: doing whatever they they want to do.

54:06: Everybody gets their needs satisfied by

54:08: positron. I think it's a really

54:10: interesting glimpse into the IT side of

54:12: something. Um, and then

54:16: Oh, do we have one more question from

54:17: Alex?

54:18: >> You want to read that, Isabella?

54:20: >> Sure. Uh, Alex asked, "Any chance dlier

54:23: going mainstream and included in dlier?"

54:27: >> Duckplier.

54:28: >> Oh, I'm sorry. Duck plier. Did I

54:30: [clears throat] say duck dlier twice? My

54:32: bad.

54:33: >> Can you say that one more time? So, any

54:35: try it?

54:35: >> Yeah. Any chance duck plier going

54:38: mainstream and included in dlier?

54:41: >> Okay, that's the order you're asking.

54:42: Okay. um

54:46: not directly probably anytime soon as

54:49: like the native backend for dlier or

54:51: anything. It still feels pretty good to

54:53: have people opt in to duck plier. I

54:56: think it's gotten pretty good at being

54:57: like a uh onetoone type replacement and

55:01: like having a really good fallback

55:02: mechanism, but I don't think it's good

55:04: enough to just like swap everyone's code

55:06: out right now with duck plier as like

55:08: the underlying backend. Um so not not

55:11: quite yet.

55:13: Perfect.

55:14: >> Yeah. Thank you so much everybody for

55:16: all of your questions. If you have any

55:18: more questions that you have not thought

55:20: about yet, but you think about them

55:22: later, stick them in the data science

55:23: lab channel and we can talk about them.

55:25: Thank you for everybody who hopped in

55:26: and answered everybody else's questions

55:28: as well. Have a fantastic week

55:30: everybody. Davis, thank you so much for

55:32: joining us and giving us all the behind

55:33: thes scenes info.

55:35: >> Thank you all. No problem.

55:37: >> All right. Bye everybody. Have a good

55:38: week.

55:39: >> Thank you.
