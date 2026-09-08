---
type: Video Transcript
title: "Fun data science side projects | Damie Pak, Mark Rieke, & Sam Parmar | Data Science Lab"
description: "Let's go ahead and get started because we have not one lab manager today, but three because we have a selection of fun project showcases from the community to share with you today."
resource: "https://www.youtube.com/watch?v=tFBDWLZpJuA"
tags: ["ds-lab", "quarto", "permissions"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T21:59:18Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=tFBDWLZpJuA"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2026-05-20T00:00:00Z"
    usage_count: 465
usage_window: { from: "2026-05-20T00:00:00Z", to: "2026-09-08T21:59:18Z" }
---

# Transcript

00:07: Let's go ahead and get started because

00:08: we have not one lab manager today, but

00:10: three because we have a selection of fun

00:13: project showcases from the community to

00:16: share with you today. And to get us

00:17: started, we have a Dummy Pack. Dummy,

00:20: would you like to introduce yourself?

00:22: Hello, my name is Dummy Pack. Uh

00:25: so, I am dressed up as Lou Bega. I don't

00:28: have any of the clothes required for it,

00:30: but I was going to talk about like the

00:33: most serious question of our human

00:35: existence. Like, if you did not know

00:38: when Mambo No. 5 came out, like how

00:41: would you be a how would you know? How

00:42: would you know? And through the woman's

00:45: name in Mambo No. 5, if you remember the

00:48: bridge that goes like, "A little bit of

00:50: Jessica or a little bit of Erica." You

00:52: know, those are

00:53: >> know all the lyrics by now.

00:55: >> [laughter]

00:56: >> Well, I'm just like, you know, I have

00:58: one wife and I she does not like me, you

01:00: know, saying all of these other women's

01:02: names. Anyway, so my real wife, not Lou

01:05: Bega's wife. Anyway, so I'm going to be

01:08: talking about like how I

01:10: um

01:11: kind of thought of the project and my

01:13: kind of like philosophy about how to do

01:15: stupid projects cuz I think they're

01:17: really important to learn. And then just

01:19: kind of like more of a I'm not sure if

01:23: this is the right way, but this is how I

01:24: do it and maybe feedback from the

01:26: community and then more of a where do we

01:28: go on from here? Like, maybe we could do

01:31: this with a Bad Bunny song that goes

01:33: like "Tití me preguntó." So, my Spanish

01:36: is terrible.

01:37: >> [laughter]

01:38: >> All right. Well, Dummy, you have 15

01:39: minutes on the clock, just as a

01:41: reminder.

01:42: >> So, let's look at my RStudio code. I

01:45: have not looked at the Mambo No. 5 code

01:48: um since I published it. So, we're going

01:50: to go and then see if we could even like

01:53: figure out what's happening, if I

01:54: actually documented it well. Um and then

01:57: just talk about like how I did um, the

02:00: structure of it.

02:01: So, this is how I did my Mambo No. 5.

02:04: And the weird thing is is that I was in

02:06: academia before and a lot of academic

02:09: coding is a lot about like not really

02:12: reproducibility or I mean, it is but

02:15: I think there's more of like this focus

02:17: on just like a script like just uh,

02:19: figures and we don't really care about

02:21: whether it's modular or not and I've

02:22: been trying to like um, learn from that.

02:25: So, basically, um, how I set up these

02:28: kind of like data analysis scripts,

02:29: especially if there's a lot of math, is

02:31: that I really enjoy having the math as a

02:35: supplement to the GitHub repo. I think

02:36: that's really important, um, because

02:39: when I do a lot of analysis or when I

02:41: did a lot of mathematical modeling in R

02:43: for um, my post doc.

02:46: I mean, the code is whatever but the

02:47: math, the fundamental part that moves

02:49: the machinery is so important. So, you

02:52: know, I would love I love Quarto. I love

02:55: how you could just like

02:56: Can you guys see my Sorry, let me just

03:00: Well, we we were looking at our studio.

03:02: I could see your video.

03:02: >> Okay. So, this is like my, you know, the

03:05: full mathematical model. So, you know,

03:08: even the silly side project where the

03:10: question was how do you use Bayesian

03:12: formula? How do you use the analysis to

03:15: figure out what year was Mambo No. 5

03:18: released based on the woman's name that

03:20: appeared in the song. So, you know,

03:22: that's a silly question but that's

03:24: actually kind of like a really

03:25: interesting, you know, way of thinking

03:27: about um, Bayesian statistics. I never

03:30: did Bayesian science ever. Like this was

03:32: my first time ever doing it. And so, I

03:35: was so scared on starting the project

03:37: and I was like, "Oh, no, what if I mess

03:39: up? Everyone thinks I'm stupid. They

03:40: send me to jail." And then, I just tried

03:43: to think of like the silliest project

03:44: and that was Mambo No. 5.

03:46: But even the simple act of taking that

03:49: simple, you know, um,

03:52: uh, question Like there is a lot of math

03:54: involved. And so, you know, I really

03:56: enjoy having Porto and then just having

03:59: the math and then showing it to people

04:01: in the community to make sure I'm doing

04:02: it right. Anyway, so let's just move to

04:06: um

04:08: the coding project. And so, let's see.

04:11: So, let's see. I see SRC, so I must have

04:14: been really smart and actually made all

04:18: of my functions

04:21: Yeah, I must have made all of my

04:22: functions, you know, like documented and

04:25: I'm actually really proud of that.

04:27: I was really mad at Hadley Wickham

04:29: because what I did was I used social

04:32: security data to figure out the name

04:34: popularity of babies. And I was going

04:36: through like the the actual US

04:38: government pulling that data. And then

04:40: Hadley Wickham had to ruin my day and

04:42: actually have an R package already out.

04:44: So, I did this for nothing. Um you can

04:47: see that that's why I got a little

04:48: frowny face here.

04:50: And basically,

04:52: um

04:53: with that data, I could then try to

04:55: figure out um calculate the likelihood.

04:58: So, the likelihood that tells me, you

05:00: know, given this year, you know, what is

05:02: the probability that I would see these

05:04: names um

05:06: the joint probability.

05:07: And

05:09: I'm actually proud that I commented.

05:11: Like I'm actually really surprised that

05:12: I actually put comments cuz I genuinely

05:15: don't, especially for stupid side

05:17: project. Oh my god, I actually put like

05:20: Oh, the parameter names, too. Wow. Past

05:23: dummy was um I think she was trying to

05:24: impress someone. But anyway,

05:27: um so, basically, what you would do is

05:30: that you would give like a data frames

05:32: of the names across the United States.

05:35: And then, you know, have like a general

05:38: prior belief of what the release years

05:40: was, you know, you know, is like did the

05:42: song come out in 1970 versus like 2000.

05:45: And then like maybe some belief of how

05:48: old the women are cuz like they're in

05:49: the club they should be like over 21 or

05:52: maybe they're like 18 um they're using

05:53: fake IDs.

05:55: Um and then so

05:58: Wow, I actually put a lot of comments

06:00: and I am so surprised at this.

06:02: Um but basically um I could see that I

06:06: was like trying to compute the joint

06:07: probabilities here and then I was

06:10: marginalizing by age. I'm not sure what

06:12: that means.

06:14: But basically um I think

06:17: from this project I was really forcing

06:20: myself to actually think more modularly.

06:23: So how if I want to you know adapt this

06:26: to a different song, how am I going to

06:29: um

06:30: make it so that it could be completely

06:32: adapted to another music with like

06:34: woman's name in it.

06:36: And then one thing that I'm not quite

06:38: sure is the best way. I'm not sure how

06:40: people in the community do this is that

06:42: I try to keep like the analysis scripts

06:45: different than the

06:46: um than the functions like using like

06:50: two different R script files. I'm not

06:52: sure if this is the right way of doing

06:54: it. This is the way that works for me

06:56: that's the most organized. I know people

06:58: like doing the you know actually having

07:02: like the quarto document and then just

07:04: having this one main project you know

07:06: one main like file that shows

07:08: everything.

07:09: But I kind of prefer the script method

07:11: more with like the the numbers I can

07:14: like kind of see like in which order I

07:16: should run them. Not sure if this is the

07:17: best way but this is kind of how I do

07:19: it.

07:20: And then you can see here that this

07:22: script is just simply for processing the

07:25: singing names. Like we all know that 99%

07:27: of the things that you do is you know

07:29: processing cleaning

07:31: And then this is kind of like a really

07:34: bad script cuz you can see this is where

07:35: I got really tired um and did not put

07:38: much comments on. I have no idea what's

07:40: happening here.

07:41: Um but from what I gather is that the

07:44: script just calculates the posterior

07:46: distribution. So I'm not going to go too

07:48: much into the Bayesian math, but you

07:51: know, from here I can see that I

07:52: processed the script and then calculated

07:55: the posterior. That kind of gives me an

07:57: idea or that kind of gives me

07:59: the probability, the posterior

08:01: likelihood that the song was released in

08:04: this year.

08:05: And then I think this is like the giant

08:08: script that made it possible. So we're

08:10: going to see if this even runs. Who

08:12: knows? Like let's all pray and hope that

08:14: it runs.

08:16: It does not run.

08:18: Live coding is so dangerous. Oh my god,

08:21: what do we do? We're going to go to

08:22: jail. Okay, so I'm just going to

08:27: Oh, I guess I'm doing this live and I

08:28: can just do it the worst way where I

08:30: just source all of this by hand, but I

08:32: don't really care.

08:35: This is bad coding. If you'd like to

08:37: watch Domy do other things live, you can

08:39: watch her episode of VizBuzz where she

08:41: coded

08:42: a plot live. That was pure chaos and

08:45: tons of fun. And they muted me so I

08:46: could not swear. It was terrible. Okay,

08:49: so

08:50: let's see. Let's see if that worked. Not

08:52: the best way to do it, but you know,

08:55: we all can't be saints. Yeah, there we

08:56: go.

08:57: >> no best way and also everybody on

08:58: Discord is saying, "We do the same

09:00: things. We keep our our stuff separate,

09:02: our functions totally separate from our

09:04: analysis. You're not alone." Okay.

09:06: Okay, and then so this was kind of like

09:08: the main figure. This is this is the

09:10: figure that I had in mind. So the

09:13: posterior distribution and then the

09:15: different release years. So for example,

09:18: if from this figure, when do you think

09:21: Mambo No. 5 was released?

09:24: 1998

09:26: or 99. 99. That was when it was

09:29: released. And so this I think this

09:31: represents a credible interval from what

09:33: I remember. But you know, I was kind of

09:35: proud because I actually never done much

09:37: Bayesian analysis. I was like, "Oh, this

09:39: actually worked."

09:40: Um I think I should have gone further uh

09:43: because I should have really like

09:45: checked some of like my assumptions and

09:47: like actually made sure that I was doing

09:51: things correctly.

09:52: Um and I'm actually not sure if the math

09:54: is fully correct. And I think that's

09:56: fine. So, I think a lot of my hang-ups

09:59: on like open science or like showing

10:02: sharing data project is that I'm

10:04: terrified of being wrong because again,

10:06: they're going to send me to jail.

10:08: Um but I think my way of now thinking is

10:11: that we're all human. We're all going to

10:13: make a mistake. Like it's just

10:15: inevitable. Like a lot of the things

10:17: that we do is really complicated.

10:19: There's so much moving parts. Like even

10:21: Mambo No. 5, this silly side project,

10:23: does have some moving parts. And I think

10:27: my philosophy changed into actually

10:31: making it easy for people to catch my

10:33: mistakes. So, you know, I think I think

10:35: that's what I was like trying to do here

10:37: with like a lot better like coding and

10:40: or sorry, commenting and structure is

10:42: that I want people to find my mistake

10:44: and to find it easily because um

10:48: I think it's just inevitable. I'm not

10:50: sure if that's like the best philosophy

10:52: to have um

10:53: but I think it's just better than to,

10:56: you know, be shy about your mistake and

10:57: try to hide all of the complexity from

11:00: people. I think it's just a lot easier

11:02: to just lay it open. If people find

11:04: mistake, they're going to forgive you

11:05: for letting it be simple.

11:07: Um how much minutes do I have?

11:09: You have 5 minutes and 20 seconds left.

11:11: And I say showing your mistakes out loud

11:14: is kind of the entire point of the data

11:16: science lab. So, I'm in full agreement

11:18: that that's a good idea.

11:19: >> Yeah, so I guess, you know, that

11:22: philosophy of like showing your mistake,

11:24: like that's why I made the math so like

11:27: visible. Like you could go through the

11:29: math. You could write it out. You could

11:30: actually try to make sure that the math

11:32: makes sense. Like I made my wife, who's

11:34: a mathematician, actually go through it.

11:36: Like she had that huge deadline and

11:38: there's just me being like, you know,

11:39: "Hey babe, can you actually like look at

11:41: the math for me?"

11:42: Um but

11:44: you know, that's I think that's kind of

11:46: like the main philosophy that I kind of

11:48: like got after I left academia. Like

11:52: when knowledge is kind of like the

11:54: capital of like career investment, you

11:57: kind of get shy about like letting

11:59: people know like your mistakes. It's

12:02: like something that is just it just

12:03: happens.

12:04: And so I've been a lot more like very

12:07: like pro like just find my mistakes for

12:09: me. Like you know what? You know, I'm

12:11: just going to make it happen.

12:13: And then one thing I'm going to say on

12:14: my last minute, I think

12:17: I really have to thank Mark because I

12:19: actually um he was actually the guy who

12:21: looked at a lot of my math for me.

12:23: And I think it shows the importance of

12:25: community. Just like it's nice having

12:27: people who see your stupid project and

12:30: is like, "You know what? I'm going to

12:31: treat this as seriously as possible and

12:34: actually like check your math for you."

12:36: Like I think that's the importance of um

12:38: a data science community. It's not

12:40: really like the technical know-how. Or I

12:42: mean it is a technical know-how, but

12:44: just like having people who just like

12:47: accept and just like actually are

12:49: interested and like actually care about

12:52: what you stupid thing you're doing.

12:54: So and you know, in this kind of age of

12:56: the AI, I don't think like AI coding can

13:00: replace the human connections of like

13:03: the silly projects. So that's why I

13:05: encourage everyone to do silly projects

13:08: cuz you should not let machines take

13:10: away your stupidity.

13:12: That should be something very human and

13:14: I will stand on this. Do not let the

13:16: machines take away your yearning

13:19: like Lou Bega's number five number five

13:22: number mambo number five.

13:24: A machine cannot write that.

13:26: I mean

13:28: peop- mean you could try. Do a Do a

13:30: comparison now. Go to [laughter] Go work

13:33: in Claude. I was going to ask you, did

13:35: you use Claude or any other tools to

13:38: help you with this at all as you were

13:40: writing? So, I try not to for a lot of

13:43: my stupid projects because it's just a

13:45: way of learning. So, I give myself three

13:47: tries. If I'm like, "Hey, I tried this

13:49: three times. It does not work." Then I'd

13:52: like use Claude and try to see not

13:54: really ask it to like code me anything,

13:56: but just to give me like maybe like an

13:58: outline of how it codes. So, I do use

14:00: Claude for that. And I think I've done

14:02: it for like calculating the posterior,

14:04: but I always make sure to have someone,

14:07: you know, who does mathematics to check.

14:10: Amazing. Yeah, I think that the

14:12: community aspect is really, really

14:14: important, too. And like there are so

14:16: many stories of people working out loud

14:18: in the community and sharing their

14:19: stuff.

14:20: Um and getting jobs from that, right?

14:22: Like having really life-changing things

14:24: happen from that. Um

14:27: and in all of them that I know, it was

14:29: all very imperfect. It was like, "Yeah,

14:30: I put out this crappy thing." And

14:33: the magic happens with the feedback and

14:35: people engaging with it and people um

14:38: finding it fun and kind of wanting to

14:40: use it or take it in different

14:41: directions. So,

14:42: definitely work out loud. There's a

14:44: place on the Discord server where you

14:46: can share projects. Um

14:49: but really anywhere on the Discord

14:50: server is a good place to share projects

14:52: and show people things. Ask them

14:54: questions if you share. Well, Dummy, you

14:56: do have like a minute and a half left.

14:58: >> Okay. Oh my god. Oh my god. I had

15:00: something really great in mind. Oh my

15:01: god. Oh my god. I'm a karaoke Okay, no,

15:03: not that.

15:04: Um I guess

15:06: Okay. So, in my job interview, so I work

15:08: at a pharma making vaccines and they

15:11: asked me, "Have you done anything with

15:13: Bayesian modeling before?" And I swear,

15:15: I was thinking about bringing this

15:17: project up and I just said

15:18: >> it? I did it. I'm I'm like worried that

15:21: they're going to be

15:22: I don't know. They're going to be like

15:24: so there is a French company. So I was

15:26: like oh do they have Mambo No. 5 in

15:28: France?

15:30: >> [laughter]

15:31: >> I think Mambo No. 5 made it all over the

15:34: globe. At least I think so.

15:35: >> it's German. Lou Bega's German. It's a

15:37: German song.

15:38: Who thinks that Domi should have brought

15:40: this up at an interview?

15:42: I think so. What if they're be like hey

15:45: you have to make vaccines. Do you know

15:47: Bayesian? I'm like oh yeah I did Mambo

15:49: No. 5. Like do you think that would have

15:51: gone well? I think it would have. I

15:53: think it would have been amazing. Well

15:55: Domi thank you so much for sharing your

15:57: project with us. It was so much fun.

16:01: Domi you have a blog.

16:03: Isabella has been

16:04: >> I haven't updated [laughter]

16:05: Isabella has been sharing it but that

16:07: project is there. So if you want to go

16:09: check out Domi's math

16:13: please go take a look at it and yeah oh

16:15: I love the the picture that Mark just

16:17: shared in the Discord server which is D.

16:20: Rob's 2019 talk about working out loud

16:24: and sharing public work or working in

16:26: public

16:27: um

16:29: which is just amazing. And I I fully

16:31: agree with it. Like the more you can do

16:34: out in the world the more valuable your

16:36: work is. Okay. We are on to our next lab

16:40: manager in our lab manager rotation

16:42: today which is Mark Rigby. Everybody

16:44: give a round of applause for Domi and

16:48: say hello to Mark. Mark would you like

16:49: to introduce yourself? Yeah. Hi guys.

16:52: I I normally have a standing meeting on

16:54: Tuesdays for the data science lab. So

16:56: this is actually my first time joining

16:59: but I'm a

17:00: a data scientist and a Bayesian

17:02: statistician and whatever work needs me

17:05: to be for the time being.

17:07: But I'm a a big big Bayesian nerd.

17:10: So I was very glad when Domi reached

17:12: out. I was like oh hey can someone look

17:14: at this? And I was like oh yes

17:15: absolutely.

17:17: Bayesian [laughter] stats

17:18: yeah exactly Bayesian stats applied to

17:20: something like niche and weird and fun.

17:23: Yes, please.

17:25: Yeah, so so I'll be

17:28: sharing I guess like

17:30: my assumption is that like the Venn

17:32: diagram of like people

17:34: who like come to the data science lab

17:36: and people who are interested in Dropout

17:39: or at least like are

17:41: I don't know. I'm guessing that's like a

17:43: bigger There's a lot of overlap in those

17:45: two groups.

17:46: Um

17:46: >> Hold on. Let's do Let's do a poll. Nora

17:48: and I raised our hands on camera like

17:50: nerds.

17:52: Uh do you

17:54: watch Dropout TV?

17:58: Let's see. Yes or no.

18:03: All right, poll in the Discord.

18:05: Let us know if you do watch Dropout and

18:08: you know what Dropout is, can you do

18:10: like a thumbs-up or some sort of like

18:12: affirmative emoji reaction when you're

18:15: in Zoom?

18:18: Oh, we have a few. Yeah, Jared, Greg,

18:21: Isabella. Amazing. I also subscribe to

18:24: Dropout. However, I do not watch the one

18:28: show that Mark is going to be talking

18:29: about today, I think so. I'm ready to

18:31: learn. All right. Yeah, uh Let's go. I'm

18:35: going to put 15 minutes on the clock for

18:37: Mark starting now. Oh, by the way,

18:40: everybody,

18:41: you can ask questions. So like if you

18:43: have questions for Domi in the Discord,

18:46: tag Domi and ask questions. And you

18:48: know, if there are some that we can do

18:50: live at the end, we'll do that. We'll do

18:52: it in the middle too if we need to. All

18:54: right. Go, Mark. Okay, I

18:58: I

18:59: I I may actually need to quit and rejoin

19:01: cuz Zoom is telling me that I needed to

19:03: update permissions and it's not going to

19:04: update them

19:06: so I'll be back in like 15 seconds.

19:08: >> Okay.

19:09: Hello. Domi, will you karaoke? Wait. Oh

19:12: my god, how does it like Sandra

19:15: Jessica

19:17: Arida

19:19: No, no, no, Debilla.

19:22: Wait, are we going to get like uh

19:25: copyright infringement on YouTube if we

19:27: sing Mambo No. 5?

19:29: >> I would replace all of those girls'

19:30: names with Caitlyn's name um to

19:32: embarrass her in karaoke.

19:35: Oh, you guys.

19:37: >> [sighs]

19:37: >> Oh, man.

19:39: Mark, you have to come back as soon as

19:41: possible and save us from ourselves.

19:44: Well, I remember all the lyrics to Mambo

19:46: No. 5.

19:48: Wait, sing it. You can't You can't just

19:49: say that and just like not

19:51: prove it.

19:52: >> [laughter]

19:52: >> It goes 1 2 3 4 5. Everybody in the car,

19:56: so come on and let's begin.

19:58: To the liquor store around the corner.

20:01: >> [laughter]

20:02: >> No, no, no, no, no, no, no, no. No, no,

20:03: no, no, no, no, no.

20:03: >> Mark's back. Okay, we did it.

20:07: Hold on, Mark. We got to I got to remake

20:08: you a co-host real quick, my friend. So,

20:11: you can unmute at will.

20:12: All right, I'm going to restart your

20:14: timer, Mark. Sorry about that.

20:17: Go No, I understand. Max with the

20:19: permissions in Zoom, they're it's crazy.

20:21: It was fun to come back just to Lou Bega

20:23: playing.

20:25: But yeah, so for folks who don't know um

20:28: I'm Actually is a show on Dropout. It's

20:30: just a game show.

20:32: And the whole premise is um

20:35: uh

20:36: the the host will like make statements

20:38: about um nerdy things, pop culture-y

20:42: things um and in each statement there is

20:45: something that is wrong that is said.

20:47: So, uh and the job of the contestants is

20:50: to like buzz in, be quick on the buzzer,

20:52: and then make the correction of, you

20:54: know, saying, "Um actually, uh the quote

20:58: isn't like, 'Luke, I am your father.'

20:59: It's, 'No, I am your father.'" It's that

21:01: kind of like level of pedantry.

21:03: Um it's a great like doing dishes like

21:06: background noise thing. Uh

21:08: but in season in 2024, they swapped

21:11: hosts uh

21:12: from long-time host Mike Trapp to um the

21:15: person uh to Ify Uwadiae, who had

21:19: >> these people. Mike and Ify are both

21:21: amazing. I love this.

21:23: >> Um Ify had uh was called was like

21:25: referred to as like the best contestant

21:28: um

21:28: and uh it was purely based on the fact

21:30: that he had the most wins. And I was

21:32: like, "Well, you know,

21:34: you can be

21:36: uh you can have a lot of you can rack up

21:37: a lot of wins just by playing the game a

21:40: whole bunch. Or you can rack up a lot of

21:42: wins by like playing the game a whole

21:44: bunch uh or by uh playing against uh

21:47: quote-unquote like lower uh

21:50: skilled players."

21:52: Or um

21:54: uh

21:55: you know, just looking at win count

21:56: treats uh a one-point win and like uh a

22:00: massive like nine-point win as the same,

22:03: you know, they get treated the same. So,

22:05: I was like, I wanted to see if if Ify

22:08: Uwadiae really was uh if you like did

22:11: the math uh

22:12: if he really was the uh the best I'm

22:14: actually player.

22:16: Uh and that led me down like this

22:18: wonky rabbit hole that is this building

22:21: out this model. Um

22:24: It is

22:25: uh uh It's a Bayesian model um and the

22:30: nice thing about it is, let me make this

22:31: bigger.

22:33: Sorry.

22:34: Um the nice thing about like doing stuff

22:36: within a Bayesian way is that um

22:40: from like an like there's like all of

22:41: this sort of like philosophical reasons

22:43: that I am a

22:46: a dork for Bayesian statistics. But

22:48: there is also like the the practical

22:50: benefit of that like the the software to

22:53: make the like to implement the model

22:54: itself uh is

22:57: um

22:58: uh super flexible and malleable such

22:59: that you can, rather than trying to

23:01: hemorrhage your data or like

23:03: you know, bash it with a hammer to try

23:06: and get it to fit your modeling

23:07: software, you can

23:09: tweak your model to fit fit your data

23:11: generating process.

23:13: And this is like one of the weirdest

23:15: models that I've I've ever fit. There's

23:18: like normally there's three contestants

23:20: like one person gets a point in each

23:22: round

23:23: and that has its own sort of like wonky

23:26: math that goes along with it.

23:29: Sometimes

23:31: though,

23:32: multiple contestants like get a point on

23:34: the same round

23:36: and you have to like handle that edge

23:37: case. And sometimes everyone gets a

23:38: point. So

23:40: like this handles that edge case.

23:43: Sometimes

23:45: Oh, and this is

23:48: I I was not I am just scrolling through

23:50: and rediscovering all of the old

23:53: nightmares of trying to get this to

23:54: work.

23:56: This is like the the flow tree of like

23:59: if two players are awarded a point, what

24:01: is the probability that like a player is

24:04: awarded a point based on their like

24:05: underlying skill that the model's

24:07: calculating.

24:09: So I don't know. This is all kind of

24:11: like a long way of saying that this

24:12: really wacky, weird, nonsense project

24:17: had a lot going on under the hood.

24:20: Much like dummies. Yeah, exactly.

24:25: Going to

24:26: scroll down.

24:28: Yeah, there's like there was a a single

24:31: one-off like four-player game that gets

24:33: got included in this as well.

24:38: And then there's team games. Oh my gosh,

24:39: there was so there's so many there's so

24:41: many edge cases in this.

24:43: And again, like the nice thing about

24:44: like doing this all in one big model is

24:47: that

24:48: you can

24:54: This can all be one big model rather

24:56: than like, oh, this is a

25:02: How do you figure out what points were

25:04: awarded to who in a team game?

25:07: So,

25:08: in a in a team game, it is the case that

25:11: we say,

25:13: uh I'm sorry, I took you so off track.

25:14: Yeah, no worries. I'm sorry, you have 10

25:16: minutes left. In a team game, it's just

25:18: that it's just, um,

25:21: so the way that this thing works

25:23: underneath the hood is it says, every

25:24: individual player has like some like

25:27: skill value, and that's kind of like the

25:28: core of what the model is estimating.

25:31: Um, and in a team game, you're putting

25:33: up two players,

25:34: um, who are on the same team against

25:36: like, you're just adding their skill

25:38: values together,

25:40: um, and then against the two players on

25:41: the other team, adding their skill

25:42: values together.

25:44: Um

25:45: so it awards a single point per team,

25:47: but it's determining like the

25:48: probability of like which team is going

25:50: to get awarded a point based on the

25:52: underlying skill of the members of the

25:55: team.

25:58: Um

25:59: but yeah, I guess all all of that to say

26:01: though that like

26:02: doing this, uh

26:06: in a in a single Bayesian model lets

26:07: you, oops, this is the wrong one. This

26:10: is going to look really nightmarish, um,

26:13: because it's just it's accounting for

26:15: all of these extra edge cases and

26:17: whatnot. But it lets it mean

26:19: >> it's Stan? Yeah. I am I don't know if

26:22: anyone knows what Stan is. Oh, Stan, so

26:24: Stan is like a it's a it's a it's a

26:27: hyper-focused like probabilistic

26:29: programming language that has, uh, inner

26:31: like an interface to R, an interface to

26:33: Python.

26:35: Um, but it's really just focused in on

26:37: like

26:38: purely writing models.

26:40: Um, and the really really nice thing is

26:42: that Stan code is almost a one-for-one

26:45: map to like, if you write, uh, LaTeX, if

26:49: you like write out a model in

26:51: on pen and paper, um, it's really really

26:53: really similar looking. So, there's

26:54: almost like a one-to-one direct

26:56: translation.

26:57: >> [clears throat]

26:57: >> Um it is like a little bit of a hurdle

27:00: to get up and running with um and I

27:04: >> to get it installed, yeah. Yeah, well

27:06: and I I'm uh

27:07: and just like getting used to like the

27:09: workflow and whatnot. So, I have to at

27:11: any at any given opportunity shill uh

27:13: Richard McElreath's

27:15: uh uh statistical rethinking for um

27:19: I don't know. Everyone should go read

27:20: that book and uh it'll unwire your brain

27:23: about how to think about modeling.

27:25: Um

27:27: But yeah, sorry. I'm just rambling. So,

27:29: uh

27:29: >> [laughter]

27:30: >> does anyone have any questions? I'm just

27:32: I'm just yapping about Stan and math and

27:34: I don't know.

27:34: >> We did have a question, which was have

27:37: you shared your analysis and you have

27:39: not shared the end of your analysis yet,

27:41: but have you shared the analysis with

27:43: the Dropout {slash} I'm Actually

27:46: people? I know that they do pop into

27:48: Reddit quite a lot. Oh, um I don't think

27:52: I I my working assumption was that they

27:55: would not see something from the little

27:57: little likes of me, so I had not. Um

28:01: uh

28:03: Although I did

28:04: I guess like the I I think I shared it

28:06: on uh

28:08: I at the time I was I was still on

28:10: Twitter. I shared it on Twitter and like

28:11: tagged Brennan Lee Mulligan, who is

28:14: as this model found like would have the

28:16: best skill um

28:19: uh if you like take it you know, taking

28:20: into all those considerations, um but

28:23: I'm sure he gets like a bajillion people

28:25: tagging him every day and stuff.

28:28: Oh, I'm sure. Absolutely. So,

28:31: you found out that Brennan, followed by

28:34: John, Jeremy, and Erica Ishii

28:37: Oh, and Matt is up there as well. Mhm.

28:39: Actually had the highest skill.

28:43: Yeah, so

28:44: >> This is relative skill relative to other

28:45: people? Right, Right. So,

28:48: um

28:49: And this is looking at like if

28:53: if you were to

28:55: rank order

28:57: everyone's like

28:59: underlying skill. Uh so, the way that

29:02: the way the Bayesian models work is that

29:03: you generally run like thousands and

29:05: thousands and thousands of simulations.

29:08: Um

29:09: Um so, this is looking at like in each

29:11: of those like, you know, that set of

29:12: simulations,

29:14: uh we get an estimate for an individual

29:16: player's skill.

29:17: Um if you take if you rank within each

29:20: simulation um from like best to worst,

29:24: uh those skill values, what's the

29:26: average across all of the simulations um

29:28: where that person ends up in like that

29:31: ordered ranking. So,

29:32: Brennan has an average rank of like six,

29:35: uh

29:36: just means he's very often up at the top

29:38: out of like I think it's like 187

29:40: or so.

29:42: Um so, he is on average the the

29:45: highest-ranked player. Um this accounts

29:47: for things like if I scroll down, there

29:49: are some players here who have

29:52: uh like Jamelle Wood, for example, I

29:54: think he was a a guest contestant who

29:58: did just blew everyone out of the water,

30:01: but he was also only on like one

30:04: uh episode. So, his uncertainty interval

30:05: is really really really wide versus uh

30:09: someone like

30:11: uh Erica Ishii who has been on like

30:13: several several different episodes. So,

30:15: she has like a little bit of a tighter

30:16: uncertainty interval interval

30:18: um

30:19: than like someone who's only on once.

30:22: So, doing this sort of like

30:24: across all of the simulations comparison

30:26: uh negates or it adjusts for this

30:29: difference in uncertainty between the

30:31: uh different people.

30:32: Okay, one more question.

30:34: When we're talking about relative

30:37: skill relative to other people, does

30:39: that mean that if somebody of high skill

30:42: is playing against other contestants of

30:44: low skill that that win is discounted.

30:48: Um it just means that

30:50: you would expect them to do pretty well

30:52: and if they

30:53: if they don't do well then it means then

30:57: it's probably the case that they

30:59: um

31:00: that like the model will update their

31:03: their skill estimates to be like lower

31:05: and then the inverse for the person who

31:07: is

31:08: like low skill and then like did really

31:10: really well.

31:12: I looked at like a couple like

31:13: hypothetical examples. So if you put

31:15: this this match has never happened but

31:17: if you put like Brennan Lee Mulligan,

31:18: Ify Uwaifo, and then like Ally Beardsley

31:21: all in a match together

31:24: Brennan is likeliest to win but

31:26: obviously like Ify and Ally have like

31:29: not a non-trivial chance of winning.

31:32: They at least have a lot of overlap in

31:34: there.

31:35: Yeah, exactly.

31:36: >> Yeah.

31:37: Amazing. Well, do we have any questions

31:40: Isabella that I have missed? I feel like

31:43: I feel like it's

31:45: hard to compare anybody to Brennan Lee

31:46: Mulligan because he's a superhuman

31:48: brain.

31:50: But I think that there's something to be

31:52: said for like the instinct that

31:55: everybody has that says that Ify is the

31:57: best that there's something

31:59: that is non-skill related that makes us

32:02: want to just say that Ify is the best

32:04: and I love Ify so I I would probably be

32:08: on that same train.

32:10: Um

32:10: I think that there's I was going

32:12: >> up here cuz we did have a Just like on

32:13: that note there's like a a big benefit

32:16: of um

32:18: sort of like the

32:19: like what what Tommy did what what this

32:21: is doing is that like rather than like

32:23: constructing like a proxy from things

32:25: that you have sort of like readily

32:27: available because [snorts] like Bayesian

32:29: models themselves are so flexible and

32:31: you can implement really like

32:33: whatever. There's a really good good

32:35: of um

32:38: uh pa pa pa pa pa pa pa it is

32:41: >> [clears throat]

32:43: >> Uh this is my favorite paper.

32:46: Um

32:52: Um I was just going to say this feels

32:54: really applicable to sports.

32:57: Yes. Um so this uh

33:00: Yeah, the

33:02: Sorry, I'm like trying to do too much

33:03: all at once. Um You're fine. No

33:06: pressure. 2 minutes 20 seconds.

33:09: Um so yeah, here we go.

33:10: Um this is so so one of the things

33:13: that's like nice about like Bayesian

33:14: models is that you can actually like

33:16: if you have some sort of like obscure uh

33:18: thing that you're interested in like the

33:20: the math nerds will say your if your

33:22: estimate is uh your quantity of interest

33:25: is like difficult to measure, you can

33:28: still measure it directly and like

33:29: directly encode encode that in the model

33:33: um rather than constructing sort of like

33:36: uh a weird proxy that like kind of gets

33:38: at it but kind of doesn't. And that's

33:39: kind of what you know, counting up total

33:41: wins is. It's like a proxy for player

33:43: skill, but it isn't what player skill is

33:44: directly. Um so you can include that in

33:46: the model even though we don't like

33:48: there's not any observations for player

33:50: skill. Um this example is looking at uh

33:54: this is

33:55: like the Bayesian model workflow um from

33:58: that like

33:59: Gelman and uh

34:01: uh some folks on like the Stan dev team

34:03: like put together a while ago, but um as

34:06: like an example of like

34:07: flexible software implementations, they

34:10: uh rather than fitting like a logistic

34:12: regression to like uh a set of golfers,

34:14: you know, taking putts, um they fit what

34:17: they call like a geometric model where

34:20: they actually model, you know, do the

34:22: sort of like geometry uh encode like the

34:25: actual like

34:26: geometry in terms of like distance and

34:28: like shot angle and like radius of the

34:31: uh uh

34:33: radius of the whole engulf um encode

34:36: that in the model directly to get like

34:38: you know, if you were to use a pure

34:40: statistical model, you get kind of a bad

34:42: fit. Um you do this geometric fit and

34:44: it's much

34:46: much better.

34:47: >> [snorts]

34:50: >> Yeah. Amazing. All right. I'm going to

34:52: interrupt you in your last 30 seconds

34:54: and say the people demand you talk about

34:56: your Arc browser.

34:58: Oh, I like Arc. Um

35:00: I like that it has uh uh

35:02: I like that it does like mirroring

35:04: across multiple things. The only thing I

35:05: don't like about it is that sometimes if

35:07: I pull up

35:09: uh something and then

35:12: like this screen goes like kind of gray

35:13: and it always throws me off.

35:15: Um

35:15: >> It's like when your Shiny app goes to

35:17: sleep. Yeah.

35:19: Uh but I love it. Just quick and easy

35:21: and and snappy. Yeah, I think a lot of

35:23: people have said like, "Hey, it's not

35:24: supported anymore." Um it's just not

35:27: being actively developed, but I think

35:30: that they are still like applying

35:32: security patches and stuff, which is

35:33: good enough for a lot of people. Yeah.

35:35: Yeah, at some point I will have to I

35:37: don't know when. Also at some point I'll

35:39: have to migrate off of Arc to whatever

35:42: the new flavor of thing is, but for now

35:44: it still works.

35:45: All right. Well, also Zach had said,

35:47: "This probably isn't possible or

35:49: realistic, but what do you think about

35:50: doing something like this for Game

35:51: Changer?" And I said, "I pity the fool

35:53: who [laughter] tries to analyze Game

35:54: Changer."

35:56: Oh, Zach, I have thought about that and

35:59: it is all of the aspects

36:01: >> to.

36:02: >> [laughter]

36:03: >> All the aspects

36:04: >> I have talked. Yeah. Everything that I

36:06: was like, "Oh man, this is like the the

36:08: Um Actually thing." was so

36:10: weird and wonky and strange. Uh there's

36:12: like a like that times a million for

36:14: Game Changer.

36:16: Yeah, often Game Changer is so chaotic.

36:18: If anybody has not watched Game Changer,

36:20: this last season of Game Changer was

36:22: probably the funniest that I've ever

36:24: seen and it's um Game Changer is a game

36:27: show where the rules are constantly

36:30: changing according to things that are

36:32: happening in the game show.

36:34: Um, and often times rules are abandoned,

36:37: things go crazy, and you end up with

36:39: like this inverse reality. Um,

36:41: highly recommend it if you have not

36:43: watched it. I will also plug one more

36:45: thing for Dropout. If you like D&D and

36:47: you enjoy watching actual play podcasts,

36:50: the production value of Dimension 20 is

36:52: amazing. Go watch the early ones

36:54: especially. Um, Crown of Candy,

36:58: Unsleeping City, like

37:00: they just have fantasy highs, they have

37:02: amazing production value with their

37:03: sets. Okay, we have one more live

37:06: manager for today, and that is Sam

37:08: Parmar.

37:09: And we still don't know if his mic

37:11: works. So, let's find out in real time.

37:15: Sam, does your mic work now? Hello, can

37:18: you hear me now? Yay! Oh, he's the

37:20: Verizon guy. Okay.

37:22: Let's do it. Sam, would you like to

37:23: introduce yourself? Yes. So, Sam Parmar.

37:27: I was a I guess member of the data

37:29: science thing in the community. It's

37:30: been a while since I rejoined. Um, just

37:33: because of work and other obligations.

37:35: Um, and I'm a part of some external

37:37: working groups, and then I also work in

37:39: pharma. Um, and yeah, I'll be sharing

37:41: some of my adventures with Quarto

37:43: extensions. Um, so I'm going to share my

37:45: screen if that's okay with everyone.

37:47: Absolutely. Let's do it. I will put 15

37:49: minutes on the clock for you, but hey,

37:50: our time's going to run out around that

37:52: time anyway, so Yeah, let me see.

37:54: >> Let's do it.

37:55: Reminder everybody, you can ask

37:57: questions in Discord if you would like

37:58: to.

37:59: Sorry, I need to rejoin permissions

38:02: Zoom. Yeah, great. Sorry. You got it.

38:05: Dummy will sing again. Uh, not

38:08: uh,

38:10: Rita Ora Rita Ora?

38:13: Not Rita Ora. Wait, who's Rita Ora?

38:17: Um, a real person.

38:19: Danny Danny DeVito's wife.

38:22: Uh, that's Rhea Perlman. Oh.

38:28: Your disco needs you?

38:30: No, that's Kyla.

38:31: >> [laughter]

38:33: >> Wait. Wait while we uh

38:36: I

38:37: Rita Ora is like a model and an actress.

38:42: In what?

38:44: In things that are maybe in the UK and

38:47: things that I don't know. Help. Are you

38:49: from the UK? Do you know who

38:51: Rita Ora

38:52: is?

38:52: >> [laughter]

38:56: >> You don't see your profile pic in Zoom.

38:58: I don't know why, Marcos. I don't know.

39:01: I see everybody else's.

39:03: I think I do. Or wait, maybe I just see

39:04: people who are sharing their camera.

39:09: Sam is back.

39:11: But Sam, if you are speaking, we cannot

39:13: hear you. Yeah, Sam, are you sharing

39:15: your screen?

39:17: I Yeah, I see your screen. But I don't

39:19: hear you. Hold on, we need to find Sam

39:21: and make him a co-host again. Perfect.

39:23: Thank you.

39:24: I was that loud there? He's back. Thank

39:26: you.

39:27: Uh well, so I just want to quickly show

39:29: Quarto. If you've never used it before,

39:30: it's a flavor of Markdown as well as a

39:32: command line interface. And this is a

39:34: general scheme of what's going on. You

39:36: have Quarto and then you have some sort

39:37: of engine um that converts R code over

39:39: to Markdown or Python code. This engine

39:41: can be swapped out with other um other

39:43: ones depending on what you're using with

39:44: Quarto. And then ultimately, you end up

39:47: getting all these different wonderful

39:48: formats uh HTML, PDF, Word, um PPTX,

39:52: Reveal JS, and it's a lot of uh I guess

39:55: awesomeness there.

39:56: Um if you've never been to the Quarto

39:58: website, uh there's a lot of resources

39:59: there, documentation there that's worth

40:01: checking out. The gallery is great um

40:03: because you can learn more about some

40:04: examples people have created um and how

40:06: I originally learned about extensions,

40:08: which is what I'm going to be focusing

40:09: on, is from Rich and the talk he did in

40:12: Posit Conf 2023.

40:14: Um this was absolutely amazing and it

40:15: kind of inspired me to just go down this

40:17: rabbit hole a little bit and start

40:20: learning more. So as a part of this

40:21: talk, he did plug this

40:24: and I'll share links maybe after or I'm

40:27: done.

40:28: But um

40:29: basically he plugged this listing that

40:31: they have on the Quarto website. So if

40:33: you want to get there, you can basically

40:35: go to the main Quarto.org page and then

40:38: you go over to extensions and then

40:40: you'll see all these different

40:41: categories that are available. And

40:43: basically these are community made

40:45: Quarto extensions that people host on

40:48: GitHub and you can see the authors

40:51: for the

40:52: specific extensions.

40:54: As an alternative to this more so more

40:56: recently within I think the last year or

40:57: so, Michael who's on the Quarto

41:00: development team has created this

41:02: awesome alternative

41:05: Quarto listing.

41:06: And if you like Google Quarto

41:08: extensions, you'll see I think this in

41:10: the top like 10 search results or

41:12: something like that or top five.

41:14: And it's just as good and it follows a

41:17: similar scheme. I think he had

41:19: reached out to get some feedback and he

41:21: ended up changing the UI and I really

41:22: love it. So I thought I would plug that

41:24: too. And the main reason I'm plugging

41:25: this is this is kind of like the back

41:28: end

41:29: to the extension that I recommend anyone

41:32: who uses Positron install on their

41:34: computers. This is basically

41:37: I think that the resource or the library

41:39: of all the extensions that he uses for

41:41: Quarto Wizard. So Quarto Wizard is this

41:43: wonderful Positron extension that makes

41:45: installing and managing your Quarto

41:48: extensions that you might have for any

41:49: project

41:51: very simple. So

41:54: I'm just going to plug that real quick.

41:55: I'm going to reshare my screen. And make

41:57: sure I share my window. Okay.

42:02: So content only.

42:04: I see browser in the background and then

42:06: in Positron very very small in front.

42:08: There we go. Positron. Okay. Yeah, so

42:11: the this is not long that I came up with

42:14: a few minutes ago.

42:15: So basically

42:17: the extension is available. If you go to

42:19: let me see.

42:23: Extensions and you can search

42:26: wizard.

42:28: You'll see Quarto Wizard. You can

42:29: install it

42:31: and it's on the VSX registry. It's also

42:32: available on VS code their marketplace

42:35: if you use that and and you still

42:37: haven't part of migrated over to

42:39: Positron. That's fine.

42:40: And it's wonderful. This is basically

42:42: what it looks like. I've installed a few

42:45: of the extensions that I've built over

42:46: the years here.

42:48: The main idea is that you can basically

42:50: just search the registry which is the

42:53: website I showed you and browse all the

42:55: different types of extensions you that

42:57: are available there. I think it's over

42:59: 300. So this makes like the user

43:02: experience of like trying to identify

43:04: extensions or like discover them much

43:06: easier. I'm so there's like discovery

43:08: question like similar to R universe or

43:11: you know, Pi Pi that a lot of people run

43:12: into of like okay, how do I know what's

43:14: out there? But this is the solution to

43:16: that. So I just want to plug that and my

43:17: the extensions that I've built basically

43:19: are posted or available discoverable on

43:22: on these two resources, the Quarto

43:24: Wizard or the listings that I shared.

43:26: Okay.

43:27: Um

43:28: So I'm going to talk about some of the

43:30: extensions I made and I thought I would

43:32: start with a fun one that I first made

43:35: to kind of step into this area and this

43:37: is based on this like kind of funny

43:40: Easter egg collection in JavaScript that

43:41: was written

43:43: by Wei Chia Cheng and it's like really

43:46: cool. So if you want to use this, I

43:48: think I'll I'll be doing an update to it

43:50: soon cuz I haven't touched it in a

43:51: while. The general idea is that you can

43:53: incorporate Easter eggs and the Easter

43:55: eggs work where you just like type in

43:56: some sort of like secret command and it

43:58: does like this animation just pops in.

44:00: So if I type in hi, like that'll come

44:02: in.

44:03: If I type in haha, like this'll like

44:05: just go through your web page. Wait, are

44:08: you typing something cuz I'm not I can't

44:09: see.

44:11: Oh yeah, let me reshare. Sorry.

44:14: Um

44:15: Okay. Yeah, thanks for telling me that.

44:18: >> [laughter]

44:18: >> Did anybody else see him typing? No.

44:21: >> No, okay. Okay. Okay.

44:22: Okay, so this is what it looks like.

44:24: I'll just need to remember to yeah,

44:25: switch back and forth. Okay, so um it's

44:28: Corto Easter eggs um and the idea here

44:30: is like I type in hi the special command

44:32: um wink like it's another command and

44:35: then

44:35: >> [laughter]

44:35: >> there's like various

44:37: This is like a preset collection that he

44:39: already had built. So it's like really

44:40: easy for me to port over this JavaScript

44:42: code and then I bundled it together in

44:44: this like kind of cool info page for

44:45: anyone who wants to use it. So I think

44:47: there's one Pokéball.

44:50: Let me see.

44:55: There's bat and there's other ones.

44:56: Yeah, you can check it out um if you're

44:58: interested

45:00: um

45:02: UFO. Yeah, there's UFO. Okay. Um so that

45:04: was a kind of like a low stakes project

45:06: that was fun um and nobody ever uses it,

45:08: that's fine. It's just something that I

45:10: can kind of chuckle at uh and maybe

45:12: >> the Pokéball really quickly? We need it.

45:15: Yeah, let me see if I can type it in

45:16: without making a typo. No mistakes.

45:19: That's hard. The hard The longer these

45:20: words get, the harder it gets to like do

45:22: them with no mistakes.

45:25: The people demand demonstrations. Yeah,

45:27: there it is. [clears throat]

45:28: Oh my goodness.

45:32: So um yeah, um right now I think the the

45:34: GIFs or animations are linking to his

45:36: website, but I'm going to see if I can

45:37: fix that um so that maybe there's like

45:39: something in the Corto extension. Um so

45:41: this is kind of like a fun example that

45:44: um I I like Jamie's yeah, presentation

45:46: she did. So I thought I would share this

45:47: one first. Um the really like more

45:50: complicated one that I ended up getting

45:51: into after that was um

45:54: this uh flashcards extension um and I'll

45:57: just share the page instead of sharing

45:59: my screen. Um

46:00: maybe that'll be a little bit easier. Um

46:03: So, the the general idea is that Let me

46:06: see here.

46:09: Um that I I I wanted to see if I could

46:11: like create I I and I understand Anki is

46:13: like the alternative that a lot of

46:15: people use for flash cards and and it's

46:17: great. Um And and I think that the

46:19: algorithm that they have in Anki is way

46:20: better, but I wanted to have like a very

46:22: simple alternative alternative in

46:23: Quarto. So, I use reveal.js

46:25: um and and so when you when you see a a

46:27: Quarto extension, you'll usually see

46:29: this sort of extensions folder. And this

46:31: is basically whenever you install the

46:32: extension, this is the material that

46:34: basically gets put into your directory.

46:36: Um so, whenever like you're updating it

46:38: and it'll reference this information.

46:40: And generally, all the extensions will

46:41: have this like underscore extension YAML

46:43: file there that has a lot of important

46:45: information including some of the

46:46: scripts that are referenced and the

46:47: config information. So, this config

46:49: information is actually what's like

46:51: updateable. Um and different extensions

46:53: do this in a different way, but the idea

46:55: is that you're like basically surfacing

46:56: some sort of interface to make it easier

46:58: for your end users to maybe customize

47:00: the extension according to their needs.

47:01: So, um here's a very simple one. There's

47:03: like a flip key that I have, a shuffle

47:04: key, um a button that um will be shown

47:07: or hidden depending on what they want,

47:09: and then um a reset on slide change. So,

47:11: specifically, there was a request from a

47:13: community member who's actually um a

47:15: teacher who said, "Okay, this is great,

47:17: but whenever I go to the next slide, I

47:19: want it to reset the previous slide."

47:21: So, then I added that in because they

47:22: were using it for their class and some

47:24: of the students were I guess um getting

47:26: um getting annoyed by that. Um

47:29: And there's like a different color for

47:30: the front and kind of color of the back.

47:31: That was another piece of feedback that

47:32: I got. This is what it looks like. It's

47:34: very simple to use, easy to set up. Um

47:36: and uh let me show you the syntax um

47:39: really quickly.

47:40: Um

47:42: Here. Um so, the syntax is one where

47:45: basically use this sort of div um triple

47:47: colon uh format and then you specify the

47:50: class for the flash card in the front,

47:51: flash card for the back, and then you

47:53: basically just use a reveal.js syntax

47:55: for a slide, which is uh basically like

47:58: a header two level there. Um so, you're

48:00: basically reusing if you're familiar

48:02: with Reveal JS and Quarto, you're using

48:04: that sort of thing, but instead, your

48:05: slide is now a flash card.

48:08: Amazing.

48:09: >> um how it actually works. Um so, there's

48:11: like a dead image from Wikipedia. That's

48:13: why the image isn't show up initially.

48:14: Um and then you can sort of use the

48:16: existing thing stuff um from Quarto and

48:19: reuse that. Um so, you know, histogram

48:23: there, um you can do a different

48:24: background and a lot of other stuff. You

48:26: can even shuffle, you can do that.

48:28: Um so, that's like one of the first ones

48:30: I I really got into. Um and there's um

48:32: others that I've made that I think are

48:34: maybe worth sharing. Um the quiz one is

48:36: probably the one that I think has maybe

48:38: added the most value for people, uh

48:40: including some professors, especially uh

48:42: if you're doing like a workshop. And the

48:43: general idea here is that uses similar

48:45: scheme to some of the stuff that I've

48:46: talked about the flash cards extension.

48:48: Um and it has a little bit of a

48:50: different syntax though. Um so, in this

48:51: case, all you do is specify a class at

48:54: the end um of your sort of slide title.

48:56: And then um you can use a list um syntax

48:59: for like your bullet points, and instead

49:01: of reading it as bullet points, it reads

49:02: it in as options um for your quiz

49:05: basically. And each of the quiz

49:07: questions are kind of um self-isolated,

49:09: but you can actually calculate your

49:10: score and include that if you want to.

49:11: Um there's a lot of features baked in.

49:13: Um so, you can sort of decide like for

49:15: example, there's a community member that

49:16: will asked about adding explanations on

49:18: like why an answer is right or wrong.

49:20: So, that's baked in. Um and there's like

49:23: a lot of stuff too. So, each of my

49:24: Quarto extension usually have like some

49:26: sort of keyboard shortcut. So, the other

49:27: one, I think the keyboard shortcut was

49:29: Q. So, you hit the Q button, and it's

49:30: like really really easy to go back and

49:32: forth. Very similar um with the uh quiz

49:35: extension, if you hit the number one,

49:37: it'll select the first option. If you

49:39: hit the number two, it'll select the

49:39: second option and so on. And then if you

49:41: hit the C button, it'll check it for

49:43: you. Uh and there's like another one for

49:44: like resetting as well. And um

49:46: basically, all the information is there

49:48: on the footer, so you can try it out and

49:49: sort of learn how to use it as you go

49:51: through the example. Um yeah, so this is

49:55: what it looks like and then you'll see

49:57: you can render code

50:00: and then you can also get

50:02: yeah, some examples that will

50:03: automatically randomize a little bit

50:05: too. So all the options will randomize

50:08: for some questions if you want that and

50:10: then you can also embed pictures and

50:11: that kind of stuff.

50:13: This is so cool. I think we all agree

50:15: that this is so cool. And we have a

50:17: question actually if we want to step

50:18: back to the flash card one.

50:22: Dan Chen had asked, is there a way to

50:24: make it three-sided because when you are

50:27: working in I think he was talking about

50:29: learning Chinese like you need

50:32: different versions of characters as

50:34: options which is a great

50:36: like probably common use case across a

50:38: few languages.

50:41: Yeah, maybe maybe that would be an

50:43: option. Something that I haven't been

50:45: asked about. Right now I've only been

50:46: thinking of flash cards as having like a

50:48: front and back identity. But maybe if

50:50: you raise an issue about that with an

50:51: example I could sort of look into how

50:53: feasible that would be. Yeah.

50:56: Amazing.

50:57: All right, do we have five minutes left?

50:59: Do you happen to have

51:01: anything else you would like to show us

51:02: or we can

51:04: do some questions as well.

51:06: Yeah, I mean there's others that I've

51:08: made. The Quarto Excalidraw one is

51:10: really cool one where it just like gives

51:11: you like an Excalidraw DOM and it's very

51:13: similar to the Quarto drop extension. So

51:16: all you do is basically you press a

51:17: button. Let's see if I can move this

51:19: right here. Or you press a shortcut and

51:21: then you get like

51:22: basically

51:23: um

51:24: see here you get like um

51:27: Excalidraw canvas that you can operate

51:28: off of. So this is great if you have

51:30: like slides or other information. Nice

51:32: thing about Excalidraw is you can sort

51:33: of save some of this information. I

51:35: don't know if I ended up

51:37: filling an issue regarding like local

51:39: storage. So like if you updated any of

51:40: this content it would save for your web

51:42: page instance. But maybe I'll do that in

51:44: the future.

51:45: Yeah, so this is kind of a cool one. If

51:47: you've ever used like scholar draw for

51:48: this kind of thing. Um, and then the

51:50: last one I will just plug really quickly

51:52: is a speech extension, which I think is

51:54: also really cool and this ports some

51:56: reveal just code that was already in the

51:57: community over to Quarto. And the idea

51:59: here is that I'm going to allow my

52:01: microphone. Um, I think Isabel, you

52:02: might have seen this one.

52:04: Um, but basically I can control my um,

52:07: slides with my voice because it uses the

52:09: voice recognition API uh, in your

52:11: browsers. So if I say next slide,

52:17: see if it works.

52:19: Allow.

52:20: Next slide.

52:24: Yeah, so it's working there. Sorry. It

52:26: was a little bit of a delay.

52:27: >> that Zoom would override it. Yeah, I was

52:29: worried, too. Uh, and then previous

52:31: slide.

52:34: Yeah, so it does that. And then there's

52:35: like additional commands you can bake in

52:36: and you can even like have an Easter egg

52:38: if you like really wanted to be cool.

52:40: Um, the example goes over like how you

52:41: could like count sheep. One sheep.

52:46: Yeah, and then you can sort of keep

52:48: going and that kind of thing. There's a

52:49: little bit of a delay in there, but

52:50: yeah, thought it would be cool to share.

52:52: This is so cool. This is very, very

52:55: cool. I think that um, you are one of

52:57: the most prolific community contributors

53:00: to extensions. Um, and I had saw a

53:03: question on Blue Sky recently about

53:05: extensions. I think just yesterday.

53:07: That was like

53:09: like kind of what is an extension? Are

53:11: they as fragile as packages, right? If

53:14: they're all stored on GitHub, what

53:15: happens if they update? The extensions

53:17: that I've used have just like I run a

53:19: command, they pull down into an

53:21: extensions folder, and then they stay

53:23: there and they don't really need to call

53:24: back to anything. Um, can you talk a

53:27: little bit in your last like minute

53:29: about that? How extensions even work?

53:31: Yeah, so in most cases they don't um,

53:34: they're usually self-contained. It's

53:35: worth maybe looking through some of the

53:37: source code and making sure they're not

53:38: reaching out to some sort of website cuz

53:40: in some cases like some are our some of

53:42: our funny art packages Um,

53:44: they they could do that. Um so that's

53:46: just something to be aware of if you're

53:47: security-minded. Um but generally

53:49: speaking like I like I showed you,

53:50: you'll see this sort of underscore

53:52: extension YAML file along with another

53:54: um

53:55: files that accompany that. Um and

53:56: they'll all be uh self-contained within

53:58: a underscore extensions folder as you

54:00: said. Um so yeah, it's kind of like up

54:02: to the user. Um

54:04: these are like self-hosted on um GitHub.

54:06: So it's just important to be aware of

54:08: that.

54:09: Perfect. Thank you so much for the

54:10: explanation.

54:11: Big huge thank you to Domi, Mark, and

54:14: Sam today. Everybody give them a round

54:16: of applause. This was so much fun.

54:17: Thanks for hanging out. We'll see you

54:19: soon. Thursday or next week. Bye,

54:21: everybody.
