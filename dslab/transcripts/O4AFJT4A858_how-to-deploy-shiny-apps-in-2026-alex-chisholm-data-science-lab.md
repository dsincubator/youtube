---
type: Video Transcript
title: "How to deploy Shiny apps in 2026 | Alex Chisholm | Data Science Lab"
description: "We are super excited to introduce you to Alex Chisum if you have not already met him."
resource: "https://www.youtube.com/watch?v=O4AFJT4A858"
tags: ["ds-lab", "shiny", "cloud", "docker", "azure"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T21:59:18Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=O4AFJT4A858"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2026-01-15T00:00:00Z"
    usage_count: 3263
usage_window: { from: "2026-01-15T00:00:00Z", to: "2026-09-08T21:59:18Z" }
---

# Transcript

00:07: We are super excited to introduce you to

00:11: Alex Chisum if you have not already met

00:13: him. Alex, would you like to introduce

00:14: yourself? Say hello and something you

00:16: like to do for fun.

00:17: >> I would love to. Nice to see everybody

00:19: today. I recognize a few names actually

00:21: already from people we've talked to

00:22: about Connect Cloud over the years. Um,

00:24: I'm Alex Chisum. I'm a data scientist

00:27: turned into a product manager. I'm based

00:29: in uh Pittsburgh, Pennsylvania now. And

00:31: something I'd like to do for fun is try

00:33: to like get AI to help me become a

00:36: better musician. Not like write music

00:38: for me, but to have it be able to coach

00:40: me and evaluate what I'm doing at a

00:42: piano or or an instrument. So, that's

00:44: one fun side project I'm up to these

00:46: days.

00:47: >> Nice. There's so many data musicians.

00:50: Me, too. Me included. I'm a vocalist. If

00:52: you are a data musician, please tell me

00:53: in the Discord chat what instrument you

00:56: play because I really like to construct

00:58: all of our imaginary bands that we could

01:00: possibly have. Um, so Alex is going to

01:03: be walking through publishing shiny apps

01:06: in 2026 in the modern era. Um, and we

01:11: have all been publishing shiny apps in

01:13: various ways for the past decade. Um,

01:16: sometimes it's self-hosting, sometimes

01:18: that it's like containerizing. A lot of

01:21: times it's shiny apps.io

01:24: and we now have posit cloud which is

01:27: what I am now using. Alex, I would love

01:29: it if you could give us a brief intro.

01:31: Feel free to share your screen about um

01:34: what we'll be talking about today and

01:35: then we will dive into screen sharing.

01:38: And I want everybody to know that this

01:40: is a super good place to stop us and ask

01:46: questions and Alex can pause and answer

01:48: questions. This is not like a uh

01:51: conference presentation where you can't

01:53: raise your hand and then say, "Hey,

01:55: wait. I I want to know what you clicked

01:56: or what keyboard shortcut you used."

01:58: This is the place to do that.

02:00: >> Yeah.

02:01: >> Right. Take it away, Alex.

02:03: >> Sure. Yeah. And do feel free to

02:05: interrupt um whatsoever. I know this is

02:06: only the second one of these, so like

02:08: the ground rules are not as strict. I

02:11: I've heard that the data science hangout

02:12: there's a no slide policy. You can't

02:14: show any slides at any at any point. But

02:17: because I am able to share my screen

02:19: here and I can share code and I can

02:21: share platforms and IDEs, I do have a

02:23: few slides just to ground the session on

02:25: because there's a very clear question I

02:27: think in terms of like what we were

02:28: talking about, right? It's like where

02:29: should I be deploying shiny apps in

02:31: 2026. So there's some real

02:33: recommendations there and some real

02:35: trade-offs that I'm sure some of you

02:36: have been kind of like struggling with

02:38: for for years. So

02:39: >> yes. Oh, and you're a product manager

02:42: for Connect Cloud, which means you can

02:45: talk about roadmap questions and stuff

02:47: like that. So, if anybody wants a peak

02:49: behind the curtain of like what are they

02:51: planning over at Posit, you're you're

02:53: our guy, right? And that's okay to ask.

02:55: Okay, great. Great. Great.

02:56: >> Yes. Yeah. So, thinking ahead though,

02:59: like what really are the options? Like

03:01: one thing that I thought was neat was

03:03: yesterday Libby posted this on LinkedIn

03:04: and she mentioned you know how she got

03:06: kind of started using these things to

03:08: create value and other people chimed in

03:09: and said the same type of thing like I

03:11: remember my first shiny application. So

03:13: I started just like reminiscing like the

03:14: ones that in my career in life have been

03:17: kind of meaningful for me and one was

03:19: like teaching on the side just like

03:21: helping students be able to look at uh

03:23: statistical distributions, right? And

03:24: like like be able to change some of

03:26: those input parameters something as

03:28: simple as standard deviation and see

03:30: those curves kind of change in real time

03:32: like was a real super you know great

03:33: teaching moment for me back in the day.

03:36: also being able to like then go step up

03:38: for a type of application that's not

03:40: just based upon like um taking an input

03:42: but like taking now something from the

03:44: user and then changing what's being

03:46: shown on the screen. So we had an

03:48: application that could process job

03:49: applications from a link and then use

03:52: natural language processing because this

03:53: was seven eight years ago before LLM

03:55: would have just done it for us and then

03:57: parse out like well what does this look

03:59: like? Is this a business analyst job? Is

04:01: this a data analyst job? Does it match

04:02: what the title is? And then getting even

04:05: more kind of advanced, right? Like an

04:07: application that I remember vividly

04:09: where we had surveys running throughout

04:11: the year and the client wanted to be

04:13: able to take the results and generate

04:15: custom benchmark reports for both

04:17: individuals and for groups of of of

04:20: individuals on the fly. And like Shiny

04:23: came to the rescue for me in all of

04:25: these situations. But in each of the

04:27: situations, we also had to find out

04:28: where we're going to like host and and

04:31: put these things. Um, and that that was

04:34: the hardest part, right? So, like we had

04:36: this application. I remember being

04:38: pulled into meetings and I'd bring my

04:40: laptop and like share it on on the big

04:42: screen in the front of the room and like

04:44: in the modern time it's like Zoom and

04:46: stuff or I'd even take screenshots and

04:50: be asked to put these in PDFs or

04:51: PowerPoint presentations or at the

04:53: lowest form which I thought was always

04:55: unique and I'm very curious if others

04:56: have done this as well. like you

04:58: download our studio, you take my script

05:00: and just run it on your own machine.

05:02: like what what hacky ways and not hacky

05:05: in a good way like I think a lot of

05:07: times we think of like hacky being like

05:08: well this thing works for me uh right

05:10: now it's good enough but like in ways

05:12: that could be better but the real thing

05:14: to me at least was like there's

05:16: something wrong going on here like

05:18: something doesn't feel uh right and the

05:21: problem was like like I I considered

05:23: myself a data person or a data

05:25: professional but I'm not an engineer and

05:27: it was really hard to tell well where

05:28: can I then put this out

05:32: And in 2015, shiny apps.io made this a

05:36: lot easier, right? So like you don't

05:39: need to manage any infrastructure

05:41: whatsoever. We're just going on to to a

05:44: website. We're syncing it with our ID

05:45: and being able to deploy. A couple years

05:48: later, our studio now Pit put out Pit

05:50: Connect which has sort of like more

05:52: full-fledged. You can do a bunch of

05:53: different applications or documents. You

05:55: can have more control over everything.

05:57: So these options were super easy and

05:58: they were super easy because right like

06:00: we went straight from the IDE empowering

06:02: individual data scientists. The button

06:05: is right there. You click the button,

06:07: you find out one of these destinations,

06:09: voila, you have something online, you

06:11: have something that that you can you can

06:13: share. So really just to wrap this up

06:15: before getting into questions and

06:18: examples like I I don't want to make it

06:20: seem like you know only shinyapps.io IO

06:22: or connect cloud are the places where

06:24: you can deploy things and we hear from a

06:25: lot of people and I'd love to hear your

06:27: experience today about going out and

06:29: spinning up your own your own

06:30: infrastructure whether it's looking at

06:32: EC2 on Amazon like essentially giving

06:34: yourself a server which you do need to

06:36: install the things that are needed to

06:38: support the deployments or digital ocean

06:41: which makes it a little bit easier. Um

06:44: and then the ones that we'll we'll get

06:45: into when we hopefully do some examples

06:47: today on on connect cloud. Um but like

06:49: for for each of these like I I went

06:51: through and just put together some live

06:53: um applications

06:55: and why don't why don't we stop here see

06:57: if there are any questions coming in

06:58: right now and then I can get into like

07:00: for those interested in like the other

07:02: side of the world looking either into

07:04: digital ocean or to connect cloud in

07:06: terms of like the trade-offs and the

07:07: expectations for what's happening. Any

07:10: early questions? We are good on

07:13: questions in the um Discord and in Slack

07:17: we not in Slack in Slido we do have a

07:19: question

07:21: >> um from Edward and I'm wondering if

07:26: maybe let me read it over here.

07:31: I think this one might be good to save

07:32: for a little bit later because it's

07:33: about AI powered shiny apps.

07:36: >> Okay, perfect. Yeah. Yeah. Yeah. we can

07:38: show an example of of of how you can

07:40: sort of tangle in LLMs to your

07:42: applications and have them work in real

07:44: time. But because like the most common

07:46: question we we do get is like, you know,

07:48: where and how can I do this and what is

07:50: what are those trade-offs? Like any

07:53: hands up or or people that have used

07:54: digital ocean before?

07:58: >> Digital Ocean is one of those things

07:59: that I would really love to learn how to

08:02: use. Everyone sounds so cool talking

08:04: about droplets, but I've never looked at

08:06: it before.

08:07: >> Yeah. Yeah. And years ago I tried this

08:09: once and then last Friday when I was

08:11: thinking about, you know, our

08:12: conversation today, like I always wanted

08:13: to be able to show like what that looks

08:14: like. So like this is digital ocean,

08:16: right? You can go in and you can create

08:18: a free account. It's it's not free to

08:20: host anything, but it's free to, you

08:21: know, just get started. And Libby just

08:24: mentioned droplets. This is one way that

08:26: you can you can do it. So I can come in

08:28: here. I can pick a droplet. Um, and you

08:32: need to know a fair amount though about,

08:34: you know, configurations like where do I

08:36: want to put my data for this? Um, what

08:39: image do I want to be able to support my

08:42: deployment? Uh, which, you know, these

08:44: things are a lot of times over the head

08:46: for a lot of just, you know, typical

08:47: data professionals. And I think one of

08:50: the constant struggles I I had in in my

08:52: career is like pushing up until the edge

08:54: of like data engineering and really

08:55: knowing like what can I do and what

08:57: shouldn't I I I be up to. Um but what

09:00: what digital ocean helps here actually

09:01: is they have they have this marketplace

09:03: if you type in R studio you can

09:07: essentially get an environment where you

09:09: can kind of do some of your R studio

09:11: work including push button and be able

09:13: to deploy within this instance that you

09:15: are creating. Now the trick is like

09:18: there's going to be cost associated with

09:19: with with all this. So like you need a

09:21: certain size machine our studio itself

09:24: and everything that would be included

09:25: there kind of needs sort of like support

09:27: for it. So, you can't get away with just

09:29: like the cheapest thing uh for for each

09:31: each one of these uh deployments.

09:34: >> Yeah, the the money part is a good

09:36: question. Alyssa had just asked in the

09:39: chat and like I had the same question.

09:41: She said, "I'm still trying to figure

09:42: out what the benefit of digital ocean is

09:45: versus going straight to the commercial

09:48: cloud provider."

09:49: >> Yeah. Yeah. If you're thinking

09:50: commercial cloud, you're thinking like

09:51: Amazon, I'm assuming. And like if I'm

09:54: >> I will let I will let her chime in and

09:56: she can unmute if she would like to as

09:58: well. We could we could find her and ask

09:59: her to unmute.

10:00: >> Yeah, that would be great.

10:02: >> Yeah, just AWS, GCP, whatever.

10:05: >> Okay.

10:05: >> Yeah. Yeah. So, I'm I'm not an expert on

10:08: this side of things, but from my

10:09: understanding is you get into AWS and

10:11: like you create like an EC2 instance,

10:12: then it's kind of on you to do the

10:14: installation of everything you need

10:15: within that environment to then go ahead

10:17: and support the deployment. where I

10:19: think what what um digital ocean here

10:21: and maybe others like Verscell make it a

10:23: little bit easier is they have some like

10:25: handholding for you to spin up the right

10:28: environment in a way that AWS makes it a

10:30: little bit you need a little bit more

10:31: context I think a little bit more

10:32: understanding my guess would be on the

10:34: AWS side so like this is the one way to

10:36: do it through droplets here the other is

10:39: app platform which does make it

10:41: considerably easier I think and in drop

10:45: applet like now we're not actually being

10:47: asked to configure any of these specific

10:49: things uh for the the environment. I'm

10:51: going out and we're going to use um

10:53: Docker and containerization here. And

10:56: I've got like a I have an application uh

10:58: a shiny application in GitHub. And if I

11:01: were to go ahead and deploy this, it

11:03: would kind of give me the environment I

11:04: need based upon what I need to specify

11:06: in this Docker file to be able to then

11:08: create everything with skipping those

11:09: steps of like specific things that need

11:11: to install on that server. But I feel

11:14: like for any either of these options,

11:16: either Digital Ocean or AWS or GCP, like

11:19: I'd want to be comfortable enough with

11:21: the choices I'm making building the

11:23: environment so that I'm able to both

11:26: troubleshoot it when things go wrong and

11:28: also maintain it over time, right? So

11:30: like if if you're if you upgrade to our

11:33: you know 4.5.2, 2, which I think came

11:35: out recently. Like if I created

11:37: something on digital ocean or AWS that

11:39: didn't have that from before, all of a

11:41: sudden it's on me, right, to be able to

11:43: go in and find the right way to update

11:44: that so that my application doesn't

11:46: break.

11:48: >> That's a great point. And there's a

11:49: question in the chat about ease of use

11:51: as well. This is probably part of it,

11:53: right? MC Chup on um the Discord server

11:57: said, "Do you think Digital Ocean is

12:00: easier to use than Azure? My company

12:02: currently uses Azure and it's too

12:04: complicated for me. Do you have any

12:06: opinions on ease of use for one versus

12:09: the other?

12:10: >> I I I don't aside from that the opinion

12:14: that AWS which I know better than than

12:16: than Azure is just again it requires

12:19: more understanding for what you're

12:21: actually setting up and it feels like

12:22: there's more handholding involved here

12:24: when you're setting up these kind of

12:25: droplets or this specific app uh in this

12:28: case. So my guess is this would be

12:30: easier. But whether that fits where your

12:32: data is for your organization or like

12:34: the security requirements you may have

12:36: like it really becomes case dependent in

12:38: terms of uh you know where you might end

12:40: up I think.

12:41: >> Okay. And maybe something that I always

12:43: tell people when they're like why would

12:44: I use Posetron? I really love my VS Code

12:48: setup. I'm like then use your VS Code

12:49: setup man. Like use what you're

12:50: comfortable with. Um, Alyssa had a

12:53: follow-up question that was like, if

12:54: you're already pretty comfortable in ad

12:56: AWS, then is there still any benefit to

12:58: digital ocean and I think my feedback

13:01: would be you're used to the thing that's

13:03: like really beneficial, maybe just keep

13:06: going with it. What do you think?

13:07: >> Yeah, I think that's right. And if you

13:09: have if like maybe they're cost

13:10: considerations, so consider like what

13:12: you know what is being charged on each

13:14: one for what what you need in the first

13:15: place. But again that it becomes so

13:18: dependent on the code you're running and

13:20: what your goals are and what your

13:21: audience is to make these decisions. And

13:23: these are some of the questions I

13:25: >> what your limitations are, what you have

13:26: access to um what your company might let

13:30: you use versus not

13:32: >> um and then for ease of use like for

13:35: click click button deployment and for

13:38: like what I do which is like I just

13:39: update my GitHub repo and it

13:42: automatically updates my app. Posit

13:43: connect cloud can't be beat for that

13:46: part. Um because I feel like I am so

13:49: confused by a AWS digital ocean azure

13:52: and all those options that I don't even

13:54: go that direction but I don't need to

13:57: and there's lots of people who do.

13:59: >> All right.

13:59: >> I think the other big consideration is

14:02: are do you have one or two applications

14:03: that you're trying to optimize and that

14:05: they're stable? Right? Like I know I've

14:07: got these few things. They're limited in

14:09: number. I just want them to scale as

14:11: best and as cheaply as possible. and you

14:13: have the technical skills to be able to

14:14: set something up in AWS or something

14:16: like Digital Ocean, then I think those

14:18: are like really good solutions. If you

14:20: don't have those skills or if you have a

14:22: bunch of applications that you want that

14:24: you want to maintain, they're constantly

14:26: changing, you want to put new ones up

14:27: there and iterate and share with broader

14:29: people, I think that's where tools like

14:31: connect cloud and connect make make the

14:33: lives of both data people and

14:34: administrators much much easier.

14:37: >> Excellent. All right, I think we're good

14:39: on questions. Let's let's move on. We

14:41: are at the 21 minute mark for anybody

14:43: who's who's paying attention.

14:45: >> All right, just closing the loop on on

14:46: Digital Ocean. I think we we've shared

14:48: this. So if you go into to GitHub, this

14:51: was this is the repo that's powering one

14:54: of my Digital Ocean deployments. And you

14:57: can see like the thing that is needed

14:59: here, like the the thing that tells

15:00: Digital Ocean how this works is this

15:02: notion of a Docker file. And I

15:04: definitely needed LLM support to get

15:06: this up and running and working because

15:08: when you're when you're thinking about

15:10: taking what's working on your local

15:12: machine and putting it anywhere, that

15:14: anywhere needs to understand what's

15:16: working locally to sort of replicate

15:17: that, right? So like this Docker file is

15:20: saying like the the type of image it's

15:22: trying to use to get shiny in the first

15:24: place, the specific packages needed to

15:26: manage this, like there's a dependency

15:28: issue as well, and then a bunch of other

15:30: things in terms of setting up that

15:31: environment. So you can you right right

15:33: now like if you wanted to experiment

15:35: with digital ocean, you've never done it

15:36: before, you can probably come here and

15:38: borrow this docker file and have similar

15:40: success that I have in terms of getting

15:41: it set up. But it does require again

15:43: like a little bit more technical

15:45: understanding for for what's going on.

15:47: And if I go back into lastly on digital

15:50: ocean here coming up into the specific

15:52: thing that I've deployed, you can see

15:54: that I have a deployment. I click on my

15:57: app and then here's the thing that I'm

16:00: able to share and any of you could go to

16:02: this right now because it is, you know,

16:03: it's publicly available. Like that was

16:05: the effort to to get there.

16:10: >> Nice.

16:10: >> And then on the flip side of this,

16:12: right, like that that was like one

16:13: specific more technical way to do it.

16:15: And what we think we developed on

16:16: deposit products is making it a lot

16:19: easier for people who don't want to

16:20: think about that stuff at all to be able

16:22: to deploy and to share. And that's what

16:24: really worked well with shinyapps.io.

16:26: Um, and there are a lot of different

16:27: ways we can talk about to end this

16:29: session about how to get these things,

16:30: you know, online for for all of these.

16:36: >> All right, I think we're we're good on

16:38: questions except there's one mention of

16:41: Chinese server which I'm not sure if you

16:44: have mentioned before like maybe I

16:45: wasn't paying attention. Did we talk

16:46: about Chinese server or would anybody

16:48: like to ask any questions about it?

16:51: Yeah. So the one way on on that digital

16:53: ocean example or AWS is like you would

16:55: probably install the open source version

16:56: of shiny server to be able to back your

16:58: deployment in the first place. So that

17:00: definitely comes into to use there. Has

17:02: anyone had success doing this on their

17:04: own before? I'm curious where you ended

17:05: up uh putting it.

17:08: >> Good question. I don't know if Elliot

17:10: would like to chime in or maybe it was

17:13: Nathan who was talking about it. I'm

17:15: scrolling up right now. I know Elliot

17:17: was saying that um that his workplace

17:19: was just considering shiny server and he

17:23: has never used it. I've never used it

17:25: either.

17:27: I'm wondering sort of like what type of

17:30: situation would Chinese server be good

17:32: for?

17:34: Like is it a like we have a cloud

17:37: computing environment? Is it a we have

17:40: an on-prem server? Is it either or? I

17:42: think it's whenever you have control of

17:44: your server and you can install that to

17:46: do the support that allows you to host

17:48: that application. So exactly that like

17:50: if I'm on this side of the deployment

17:52: scheme, I need to find some way to

17:53: engage with shiny server and that's what

17:56: Digital Ocean did for me with that

17:57: Docker file. It essentially installed

17:59: that for us to be able to use and share.

18:02: >> Okay, that makes sense. I think this is

18:03: a great place. Yeah, this is a good

18:05: place to like ask questions in the chat

18:07: too of everybody. We can we can have

18:09: more chats later as well and like we can

18:11: bug Alex to give him give us some

18:13: updates on questions if we don't get

18:14: them in today.

18:17: >> Yeah. Libby, did you want me to like

18:20: talk a little bit about what I'm doing,

18:22: I guess?

18:22: >> Sure. You want to pop in for a minute?

18:25: >> Yeah. I I mean uh so so I'm right I'm at

18:29: the University of Illinois and I'm in

18:32: the Center for Innovation and Teaching

18:33: and Learning, which is like one of those

18:34: kind of support departments. And so we

18:37: have a handful of shiny apps that we've

18:38: made for like different departments on

18:40: campus. And so tech services has made us

18:44: just a server that has shiny server

18:46: installed. And so like it it works well,

18:50: but it is just kind of your basic level

18:52: like it's a Linux server and so we SSH

18:55: into it and like upload the files as a a

18:58: zip file, unload them there and then

19:00: they're live. And so it is locked down

19:04: like I don't know how tech services did

19:06: it but it so we can like authenticate

19:10: users before they see the server which

19:13: is one of those things that's really

19:14: important because it's like this one is

19:16: this data for this professor and their

19:18: students and it it's it's all sensitive

19:20: data to one extent or another. Um,

19:25: and so like like it's working for us,

19:28: but it doesn't have like any bells and

19:29: whistles, right? The

19:30: >> yes,

19:31: >> the the level of version control that we

19:33: currently have is well, save the

19:35: existing copy as a zip file and

19:37: redownload that before you upload the

19:39: new version. So

19:42: >> yeah, that that resonates with me from a

19:44: lot of phone calls that I've had as

19:45: well. And again, I think like if you

19:46: only have one or two things and you're

19:48: savvy enough, like you can make that

19:49: work. where people start getting

19:51: headaches is if I have permissions for

19:53: many people to be able to see something

19:54: specific or if I want to share it with

19:56: the world for some people but not for

19:57: other like these are all rules and sort

19:59: of additional layers of complexity you

20:01: have to put out on there and I think

20:02: when you go down that route like you

20:03: start hearing words like shiny proxy and

20:05: engine X to be able to do some like the

20:07: load balancing and the authentication

20:09: layers for this and that's when it gets

20:11: kind of above my head but I think I

20:12: think everything that you just mentioned

20:13: it goes down to a core set of questions

20:15: and then we can take this wherever

20:16: anyone wants to go and we can we can do

20:18: some demos but like here's Here's what

20:20: comes to mind for me. Like am I

20:22: optimizing again a few stable

20:23: applications or supporting continued

20:25: development? Like do I have the

20:28: technical support and priority within my

20:30: organization to be able to maintain

20:32: something if I can't do it myself?

20:35: Are we even okay to operate in a shared

20:37: cloud environment? For some people,

20:39: they're not able to and they have to go

20:40: down that route of self-managing

20:42: somewhere. How much compute power does

20:44: my app need? Like my specific app, not

20:47: like my entire instance, right? like,

20:48: can I spin it up and use it just myself?

20:51: Once I get past that, do I need to worry

20:53: about scalability? Like, what if a

20:55: thousand people come on this thing? Is

20:57: it going to hold up? Is that even a

20:58: realistic thing for me to consider? Do I

21:00: need it on all of the time? Like when

21:02: you use shiny apps.io, like we we put it

21:04: to sleep after it's not being used for a

21:06: while to save us and you, you know,

21:08: cost. Same thing for for Connect Cloud.

21:11: Um, do I need a dedicated persistent

21:13: storage? Like there there are all these

21:14: questions like, do I keep my code up to

21:16: date? I think Nathan was getting at that

21:18: as well. Like for them to do code

21:19: changes, they need to like zip up a

21:21: file, put it in the thing, make sure it

21:22: overrides the right files that all like

21:24: the the wiring got got put up there. Um,

21:27: and then lastly, like can I uh does it

21:30: need to be publicly available or not? So

21:33: like I I think for really any project

21:35: you're working on like you need some

21:37: understanding of these that help lead to

21:39: that decision of like well can do I have

21:41: like the the skill set or the people to

21:43: help me put this into kind of like a

21:44: fullyfledged dedicated environment or is

21:47: something like a connect cloud you know

21:49: sufficient for for my needs for what I'm

21:51: trying to achieve?

21:52: >> Definitely. And I had um a question that

21:55: I wanted to pop in for Edward that's a

21:57: follow-up to this which was like could

21:59: we just make GitHub actions SSH into

22:02: something like Nathan's server that he

22:04: has that that would make version control

22:06: easier. Um and Edward had shared a repo

22:09: in the chat if anybody wants to go check

22:10: it out.

22:12: >> Yeah, I think I think potentially we

22:13: have a lot of people that are using

22:14: GitHub actions in in creative ways. But

22:16: I think I think for those of you who are

22:18: not yet using GitHub for version

22:20: control, whether you work in teams or by

22:22: yourself, like it does open up a lot of

22:24: flexibility for you to be able to

22:26: accelerate and do a lot less uh like

22:28: duct tape work. Like I for I think for

22:30: two of those projects I mentioned

22:32: earlier, right? Like for months I would

22:33: wake up at 7 a.m. and I'd literally log

22:35: in and I'd run some scripts and then it

22:37: would be magically updated until I

22:38: finally got to the point where it was

22:40: continuously, you know, being able to be

22:42: deployed. So connect cloud um

22:44: specifically uh and as the example you

22:46: saw with the digital ocean like if you

22:48: if you go out to a GitHub repo like

22:50: there there are a lot of things already

22:51: sort of baked into those environments

22:53: that allow you just to say well if I

22:55: push my code here and maybe it passed

22:57: certain tests it will automatically push

22:59: to connect cloud and I never even really

23:02: need to log into connect cloud until I

23:03: have other things that I need to to be

23:05: doing.

23:06: >> Yes, that's what I do. I'm like, I have

23:08: this app, it's up there, and then I just

23:11: push the change or, you know, I'll push

23:13: to a branch and then I'll do a PR and

23:15: that PR will have to pass tests or I'll

23:18: have to review it. And then once that

23:19: goes to main, my app is just updated

23:21: immediately. And it happens so fast.

23:24: Like I can just sit there and watch it

23:26: from one second to the next. As soon as

23:28: I push it, it's it's updated. It's

23:30: amazing. There was one other thing I

23:32: wanted to call out which is Nick Drew

23:33: said another question for this slide

23:35: that would be good is who is going to

23:37: support this when I'm out and if you go

23:39: through this like complicated process in

23:41: a AWS or um digital ocean that nobody

23:44: else knows how to do you are the single

23:47: point of failure you stop being able to

23:50: like go on vacation or get sick. Um, and

23:54: I as a contractor, as a like freelancer

23:56: who did shiny freelance, I saw this

23:58: happen a lot where people were looking

24:00: for a contractor to come pick up the

24:02: pieces of something that someone had

24:03: left unexpectedly that no one could run.

24:06: And it might be running on like

24:07: shinyabs.io, but nobody knew how to

24:10: update it or they couldn't run it

24:12: locally and it would break. Um, yeah, I

24:15: think that that's a big pain point that

24:17: people don't think about until they're

24:19: in the situation.

24:23: All right, I will leave it at that and I

24:25: will let you move on. We are at the 30

24:26: minute mark and I think it's probably

24:30: time to to do a little demoing if

24:33: everybody's up for it.

24:35: >> Sure. Yeah, let's let's do a couple

24:37: things here.

24:39: First, I'm going to go over to

24:41: ConnectCloud. and ConnectCloud, you

24:43: know, it's similar to some of our other

24:45: publishing services in the sense that

24:46: like it is a premium model where if you

24:48: can get on create a free account uh

24:50: right now and you can deploy in a bunch

24:52: of different ways

24:54: over it quickly on on that slide, but

24:56: you can do it through code on GitHub.

24:58: You can do it through positron or VS

25:00: code with posit um publisher extension

25:04: and you can do it from any IDE including

25:06: our studio now using the RS connect

25:08: library for our deployments uh

25:11: specifically. So like there are a lot of

25:12: different ways that you can get content

25:14: onto connect cloud. If you do create an

25:16: account, this is an individual one here.

25:19: You essentially get a little portfolio

25:21: which showcases everything that you've

25:23: deployed before. So here's one of the

25:26: examples that we can deploy again. But

25:28: you can see I've got a bunch of things

25:29: going you know o over time. Um and right

25:31: now again on that free account like if

25:33: you wanted to use this for like you know

25:35: a a place that you're showing off a

25:36: portfolio maybe your GitHub account is

25:38: linking to live applications. It's a

25:40: great way to be able to say, "Here's

25:41: what I've made before. Here's a live

25:43: working example um of that code."

25:46: >> Yeah, I love it for student portfolios

25:48: because Oh, you're going to you're going

25:51: to share exactly what I was about to

25:52: say. Um it's not just shiny. Put

25:55: anything on there.

25:56: >> Quto, you put you know, Streamlit, Dash,

25:59: all kinds of stuff.

26:01: >> Yes. And for those using shiny apps,

26:02: like this is one reason why connect

26:04: cloud is like our next generation

26:05: publishing platform. Like yes, it does

26:06: shiny really really well. But we know

26:08: that most people and I think 80% of the

26:10: people signing up for connect cloud do

26:12: applications and they do documents,

26:14: right? And like having to use multiple

26:15: services for all these is kind of kind

26:17: of annoying. Um and even on the free

26:19: plan on connect cloud, you have

26:20: unlimited documents. So as much as you

26:22: want to put up there, you know, you can

26:24: you can get onto connect cloud. Um and

26:26: then what that deployment flow looks

26:28: like for those again on that GitHub

26:29: side. So like I just I I click the

26:31: framework that I want. If I'm going in

26:32: through GitHub, I go out, I can do any

26:35: of these, but let's keep with this this

26:37: AB testing example since we shared the

26:38: repo. It's going to go out and it's

26:40: going to find that main branch. It's got

26:42: that app.tr that is, you know, in

26:46: So, here's the repo, right? We've got

26:48: app.tr, which is going to be what we're

26:51: looking for for the deployment. Um,

26:53: there's this notion of automatic publish

26:55: on push. This gets to like one of

26:57: Nathan's workflows. Like, I need to keep

26:59: things up and running. And now if this

27:01: is turned on, when I do make changes to

27:03: that repo, it will automatically update

27:05: on connect cloud. And a big update from

27:08: from shinyapps.io is this idea of

27:11: putting in secret variables at the time

27:14: of deployment. So for those that have

27:16: done anything in shinyapps.io

27:18: with um you know database credentials,

27:21: username or password or LLM keys, right?

27:24: You're putting them probably like in

27:25: some kind of RN RN file like within your

27:28: project and just putting it up into the

27:30: cloud which is still, you know, it's

27:32: still there in the bundle, right? Which

27:34: is not a great way to keep a lot of your

27:36: things, especially when you're going out

27:37: to other systems. So what you can do

27:39: here is you could put in your database

27:40: credentials. Once you store them, we can

27:43: never see them again. you can never see

27:45: them again, but they can power your

27:46: applications in a more secure way.

27:49: >> Yes, this is amazing because I do a lot

27:50: of publishing on Netlefi and you can put

27:52: secrets on Netlefi, but they don't seem

27:55: to work with Cortto publishing for some

27:57: reason and that's on I think that's on

27:58: the Netlifi side. Like I think it's the

28:00: plug-in that's the problem. Um but yeah,

28:04: that this solves that problem for me

28:06: even though I do love Netlifi.

28:08: >> Yeah. Yeah. So, I'm just going to take

28:10: all those defaults and just publish

28:12: this. And like in real time, we're going

28:13: out to that repo. We're grabbing

28:15: everything that needs to support this

28:18: that is based on a manifest.json file,

28:20: which you can you can generate uh with

28:22: the RS Connect package. And then bam,

28:24: like we, you know, we have that that

28:26: same AB test calculator here. You know,

28:28: if I got 500 conversions on the on the A

28:31: side of my test, you know, we're going

28:32: to be able to tell like did did this

28:34: thing do anything or did it hurt us and

28:36: what our level of confidence is for

28:38: that. But like now this is a publicly

28:40: available. Let me let me make sure of

28:43: that. Because I'm on a an enhanced plan,

28:47: it defaults to private, but I can make

28:48: it publicly available. Um, and now any

28:51: of these any people that follow this

28:53: link can now interact with this with

28:55: this application.

28:57: >> Oh, and the link names, like I like

28:58: being able to have my shiny apps at

29:01: nicer link names. They're not like full

29:05: customizable vanity links at this time,

29:07: but it's pretty nice to have like

29:09: share.connectcloud

29:12: slash like my name and then just the app

29:14: name, which makes it so much cleaner,

29:16: >> right? Yeah. And I think that's that's

29:18: kind of where we're heading is. So if I

29:19: go from this deployment that we just did

29:22: and I go into URL, we do default to like

29:24: this fairly ugly UYU ID, right? So like

29:27: this is what it would be initially and

29:29: then everybody has the ability to come

29:30: in here and change that. So it does it

29:33: does have to tie into your account name

29:35: on connect cloud and then it's going to

29:36: be dash the name of whatever you put

29:38: here. And then when I I need to

29:40: republish this for this to take action.

29:42: Um but once that does then I'm able to

29:46: grab this link

29:48: and anybody Oops. Now it should copy it

29:52: the right way. Yep,

29:54: >> there it is. That's so much nicer than a

29:56: randomly generated ID. And this is um

30:00: like a good place to talk about the

30:03: possibility even with a free account of

30:06: blue green deployment where like you

30:08: could just if you had an extra slot in

30:11: your free account, right? Like you could

30:13: just create another app with an update

30:16: that that is, you know, a big change for

30:19: your app and don't tell anybody about

30:21: it. Just switch your URLs. I think that

30:24: that would work. Like just take the

30:26: ending that you put on that URL,

30:28: remove it from your old app and put it

30:30: on your new app and then you have that

30:32: same URL pointing to a new app. Does

30:34: that work? I haven't tried it yet.

30:36: >> I didn't know if it was going to be like

30:38: this ending URL is taken.

30:41: >> I think eventually we're going to build

30:42: that in as a feature to the tool, but

30:44: right now you could do it exactly in

30:45: that way, especially when you're using

30:47: GitHub, right? So you could have your

30:49: initial deployment for something you're

30:50: confident in that is a single deployment

30:53: tied to that that custom name and then

30:55: have that point to your main branch. But

30:57: if you're working like on a development

30:58: branch, you could do another deployment

31:00: from that dev branch and then share that

31:02: out and like you know get feedback like

31:04: is this ready to go? Are we good? You

31:06: you can test it yourself and then as

31:08: soon as that is ready you could either

31:09: either change your initial deployment

31:12: just to use uh you would just push that

31:14: to main and then your old deployment

31:16: would automatically update. So like

31:17: that's that's one way to use it. Or if

31:19: you really had to, you could delete the

31:21: old one and then make the new one have

31:22: the same name as before and that same

31:24: URL would point to it for people who

31:26: have that link already. So there's se

31:28: several ways it could could be operated.

31:30: >> I love that. If anyone's interested in

31:32: what blue green deployment is, um

31:35: Rishard gave a Rashard from Absilon gave

31:37: a fantastic talk at posit. It's on

31:40: YouTube. Look for blue green deployment

31:42: piccom 2025. if he gave a virtual day

31:44: talk um and he talks about doing it on

31:47: connect that is just like an enterprise

31:49: version of of this really so like a lot

31:51: of the same functionality is going to

31:53: apply and that talk will be really

31:55: helpful I wanted to get to Libbyy's

31:57: question surreal seeing another Libby I

31:59: think this is Libby McKenna hey Libby um

32:02: she says I don't use connect cloud but

32:04: I'm interested is it easy to set up a

32:07: developer workflow i.e the push changes

32:10: to dev to test them before publishing to

32:12: the actual link. I know that we just

32:15: talked about that a little bit, but like

32:17: I I'm I wanted to ask this because I'm

32:21: hoping that it is in the the road map

32:23: because one of my personal road map

32:25: questions as well is like when I publish

32:28: for example

32:30: my um my Cortto website, I have branch

32:34: deploys set up with Netlefi so that I

32:37: can publish to a branch and then I get

32:40: these live views of what my

32:44: deploy might look like. It builds

32:46: completely. I have like preview links I

32:48: can send to people and then once I'm

32:50: ready and everyone's reviewed

32:51: everything, then I push that to main. It

32:54: passes all my tests in GitHub. Um, and

32:57: then that updates my live site.

33:01: Is that what we just talked about that

33:03: is on the road map for Connect Cloud?

33:06: Yes, I think we talked about the way

33:07: that you can make it work for you right

33:09: now with a few extra steps, but on the

33:10: road map, yeah, like the idea of having

33:12: a staging and a production environment

33:14: for the same deployment is definitely

33:16: something that we want to to look into.

33:18: >> Um, my guess is not going to happen, you

33:21: know, for another year or so. Um, but

33:23: it's is it's on the road map for sure.

33:26: >> Okay, great. Nor had asked what is blue

33:29: green deployment? I'm going to go look

33:30: for that talk, Nor, and I'm I'm going to

33:32: put it in the Discord chat. Blue green

33:34: deployment is like um is just having two

33:38: versions of something that can be

33:41: accessed at the same link, the same like

33:44: vanity link, right? So that you can

33:46: replace one with the other as needed. So

33:48: maybe you have um updated your app and

33:52: everything works except for one thing

33:53: and you're like wait whoa I need to roll

33:55: back to this other app and you can just

33:57: give the vanity URL to that app and

33:59: people can use the last working version

34:01: of it without you needing to like revert

34:02: all of your stuff in GitHub. Um so you

34:05: just have two versions of your app and

34:07: you serve people one or the other via

34:09: the same URL depending on what you need

34:11: to do.

34:13: Okay.

34:16: Yeah. And Adam's giving us some updates

34:17: on what blue green deployment is in the

34:19: chat, which is thankful, which is uh

34:21: useful. Thank you, Adam.

34:26: >> Libby, I will say my mom's name is also

34:28: Libby. So, we've got

34:29: >> the Libby trifecta.

34:30: >> Shut up. Amazing. My real name is

34:33: Elizabeth and I go by Libby. I tried to

34:35: be Elizabeth in high school one time and

34:36: it didn't work. Nobody ever called me

34:39: that. They're like, "Sorry, you're

34:40: Libby. You're stuck."

34:42: All right, I will let you move on. and I

34:43: will go find that chat for newer or that

34:45: uh talk for newer.

34:46: >> All right, why don't why don't we circle

34:47: back to the AI question from earlier and

34:50: then

34:50: >> let's do it. Do you see it in flight? It

34:52: was from Edward. Um and it was when

34:56: creating AI powered shiny apps, what

34:59: guard rails do you put in to stop token

35:01: overuse and have you experimented with

35:04: hosting your own small language models

35:06: for use in apps?

35:08: >> Uh interesting. Yeah. So, guardrails in

35:10: terms of token usage, which sounds more

35:12: like cost control, right? Like for what

35:15: I'm working on. Um, so a couple things

35:18: come to mind. You know, one is depending

35:20: on your provider, you might be able to

35:21: have sort of max amount of usage per

35:23: month like that. That's like the hard

35:25: way to do it. I believe, you know, if

35:26: I'm using the API on on cloud, um, I can

35:29: I can go and then, you know, turn it off

35:31: at a certain level. Um I think the other

35:34: way that I thought about this in in

35:36: products before for um friends of mine

35:39: who I've been been helping out uh one of

35:42: them is you know stopping usage at a

35:44: certain point which isn't a great user

35:46: experience but like you have control

35:48: through code when someone's interacting

35:50: with your you know AI powered shiny

35:52: application to say okay you've you've

35:54: done enough now for like this period or

35:57: now you need to to log in and create an

36:00: account. Um, so that type of of of

36:02: gating. I'm curious curious if anyone

36:05: else on the call has other approaches

36:07: that they've done to sort of manage

36:08: manage cost for this. The other one that

36:11: comes to mind also now is, you know, the

36:14: model that you're using. Of course,

36:15: there's a range of different models out

36:17: there. Some of which are more expensive

36:18: to run, some of which are cheaper.

36:20: validating that what your application is

36:22: doing needs to be on a more expensive

36:24: model or if what the task it's doing can

36:26: be accomplished in a good in a in a the

36:29: right way by a cheaper model. That's

36:31: another way to sort of guard you from a

36:33: cost perspective.

36:36: >> These are great questions. I see I see

36:38: the usage question come up a lot with um

36:41: Posatron assistant as well and there is

36:43: a little spot in the bottom right

36:44: that'll like show you some of your usage

36:47: information. Um, I'm not sure if

36:49: anybody's seen it, but that does exist.

36:52: And I wonder if that it might be

36:54: possible to like build that into

36:57: apps on the back side for yourself. It's

36:59: like keep track of my token usage and

37:01: send me an email with an update on my

37:03: token usage um in an automated way. Sort

37:06: of like a log, I guess, which I'm sure

37:10: is possible and I just don't know how to

37:11: do it.

37:13: >> Yeah, that's the the fun and hard part

37:14: with with building these types of

37:16: applications, right? anything is

37:17: probably possible. The question is like

37:19: how how hard is it to set up and and

37:21: maintain?

37:23: Did anyone else chime in with uh with AI

37:25: recommendations to keep those under

37:27: control?

37:30: I don't think so. Although David said

37:33: you could run another server with

37:35: another server with Olama and then point

37:37: your shiny app at the Olama API. Um, I

37:41: know Simon had just Simon Couch had just

37:44: put out a blog post recently that was

37:47: like, "Hey, small language models are

37:49: still not where they need to be for them

37:50: to power

37:52: things like positron assistant super

37:54: reliably." Like they can still do

37:57: smaller stuff, right? But just like

37:59: maybe not the super expansive stuff that

38:02: you might expect a language model to do

38:04: in something like databron assistant. um

38:07: which might be a good read and I can go

38:09: look for that.

38:10: >> Yeah, I think that's great. Of course,

38:12: if you do that, you need to then find

38:14: the server that it's on and pay for that

38:15: server in some way as well. It's like

38:17: these are like all all cost kind of

38:18: trade-offs.

38:21: >> Yep.

38:21: >> But but thinking through let's let's

38:23: take a look at another example here.

38:27: So another link I think we shared with

38:30: you is called Sidebot AI. And I don't

38:32: know if you've seen this tool already.

38:35: Uh,

38:35: >> what is Sidebot AI?

38:37: >> It's it's it's kind of cool. Joe Chang,

38:38: you know, worked on this um earlier this

38:41: year or maybe last year and I just I

38:43: just did a clone of his demo, but

38:45: essentially we're going to we're going

38:46: to deploy an application that has um

38:49: just a typical analytics view that you'd

38:51: expect and then we're going to add to it

38:54: um an AI key, an LLM key um that's going

38:57: to be able to power it and do a

38:59: different thing. So, you can play around

39:00: with this. This one is a shiny for

39:01: Python application, but in essence,

39:02: we're just going out. We're building a

39:04: typical shiny application and then we're

39:06: having an LLM provider be able to go in

39:08: and manipulate some things. So, I'll go

39:11: again here um from and just do this just

39:14: do this deploy from GitHub directly

39:16: because it's it's easier for me right

39:18: now than to hop over to to an IDE. Um

39:21: let's see. We have a sidebot demo.

39:24: I'm going to say app.py.

39:27: And then what I could do here is set and

39:30: put in the open AI or the anthropic key

39:32: directly before I deploy. But first I

39:35: want to have it to fail. So let me let

39:37: me let me let me see what happens if I

39:39: try to deploy right now.

39:42: >> So I've been wondering like when I first

39:44: started using this I had to create that

39:46: manifest.json. Do you not have to do

39:48: that anymore yourself?

39:49: >> You don't have to in many situations. If

39:51: you do the the if you do the route

39:53: through GitHub we need a dependency from

39:56: you. So if you're doing this like shiny

39:58: app, you need a requirements.txt file.

40:00: And if you are doing an R app, you do

40:02: need that that manifest file still

40:03: because we connectCloud needs to know

40:05: what dependencies are required for your

40:07: specific thing because it's not tied to

40:08: your local environment at that stage.

40:10: It's just code up on up on GitHub. For

40:13: the other deployment mechanisms through

40:15: push button publishing or through the RS

40:17: connect package, all of those now do not

40:19: require you to make your own. Those

40:21: processes will do that for you.

40:23: >> Wonderful. And if you do get to the

40:24: point where you're like, I'm doing this

40:25: through the GitHub side and it's asking

40:27: me for a manifest.json, do not panic.

40:29: It's going to tell you how to do it and

40:31: it's super simple. You're going to run a

40:33: line of code. It's going to create it.

40:35: You're going to push it to your repo and

40:36: you're going to be done.

40:38: >> So, I promise you you'll be okay.

40:40: >> Yeah, it's just RS connect write

40:41: manifest and it'll it'll grab everything

40:43: it needs. So, like our goal is if

40:45: something's working locally for you, we

40:47: want it to work here as well and and it

40:48: should and if not like then we need to

40:50: look into things. So this is the this is

40:52: the app that we deployed and you can see

40:54: we've got data on tipping, we've got

40:56: average bill size, average percentage.

40:59: Um so like this looks like a fairly

41:01: normal dashboard that somebody might put

41:02: together. What was different about this

41:04: is there's this little sidebar here

41:06: where we have AI functionality. And

41:08: because I didn't provide a AI key, I

41:11: think this would fail. So if I if I say

41:13: something like tell me average tip on

41:17: Monday or Sunday. Oh, Sunday's the worst

41:21: for tipping. Any other pre previous

41:23: servers out there? Sunday is the worst

41:25: for tips.

41:26: >> Let's see if our data agrees once we get

41:28: into [laughter]

41:29: >> Oh, I'm curious.

41:30: >> Is this real data?

41:32: >> I I I do not know. I I think it

41:34: >> might be. I don't know. Um, but you can

41:36: see here we got this error that we

41:38: expected. Um, and then what what you can

41:40: do at this stage if you didn't set this

41:42: beforehand, we can go into our variable

41:44: tab. And what this is looking for is

41:46: some kind of AI key. And let me warn you

41:48: like be very careful about sh sh sh sh

41:50: sh sh sh sh sh sh sh sh sh sh sh sh sh

41:50: sh sh sh sh sh sh sh sh sh sh sh sh sh

41:50: sh sh sh sh sh sh sh sh sh sh sharing

41:50: API keys on live demos. So like blasting

41:52: your API key try to be as careful as

41:54: possible here. I'm not sharing all my

41:57: screens. Let's let's do this. Uh

41:59: >> yeah, feel free to like slide it over a

42:01: different screen or stop sharing for a

42:02: second. I think everybody will

42:04: understand.

42:04: >> I think we're good. The first one is not

42:06: sensitive at all, right? Like if I need

42:08: anthropic, this is like typically how

42:09: you're going to store this environment

42:11: variable. And this would be stored like

42:13: in your uh env file like if you're on

42:16: the Python side of things or your RN

42:18: file, right? Like typically you would

42:19: have this one working locally. That's

42:21: how you should you would be doing it

42:22: anyway. We're just mimicking that now.

42:24: And then when the connect cloud does

42:26: your deployment, it knows what to look

42:27: for and it will inject what where we're

42:29: adding here.

42:30: >> All right. So I did that one

42:31: >> and then I think because of the length

42:33: of my API key, I'm safe to put this next

42:35: one into.

42:37: >> Just make your screen tiny.

42:38: >> Perfect. So that's all I'm going to show

42:39: you. You can't see the whole first. It's

42:41: a guest arrest.

42:42: >> So, I'm going to save this. And now,

42:45: again, it's saved. You're not going to

42:46: be able to see this again. We're Connect

42:48: Cloud will not be able to see it. And

42:49: you won't if you need to update it, you

42:51: have to. We do need to republish this

42:53: because the changes are going to go into

42:54: effect for the next deployment. So now,

42:56: as we're doing the deployment, it knows

42:58: to look for this thing that we just

43:00: saved to power the application. Um, so

43:03: our our application loaded um as before,

43:06: but now I hope if I use this chatbot, we

43:07: can do cool things. So, first off,

43:11: Show me only weekday

43:14: tipping.

43:17: >> Aha.

43:19: >> Actually, it's kind of neat though. See

43:21: what this did here? Like, this is

43:22: actually a kind of this is a pretty cool

43:23: application in the sense that you gave

43:26: the user the ability to drill down on

43:28: the data and that all of your tables and

43:31: charts and call outs are now reflective

43:34: of the data they chose, which is kind of

43:36: which is kind of interesting.

43:38: So there's that's one of the AI features

43:41: within this. The other neat one I think

43:42: is the ability to read a plot and try to

43:45: have some idea about what's going on. So

43:47: if I click on you know these little I

43:49: don't know lightning icons maybe uh this

43:52: is going to pull it up and it's going to

43:55: sort of kick off another exploratory

43:58: analysis and you can see that this was

44:00: you know probably part of the precursor

44:02: work for databot for those who have

44:04: experiment experimented with datab

44:05: before. Um, but as you can see, AI

44:10: AI lm, excuse me. Uh,

44:13: >> oh, Alex's phone's ringing. [laughter]

44:15: >> Yeah, my kids are up the street. If if I

44:17: need to get them, I can get them in 10

44:18: minutes. [laughter]

44:20: >> Okay,

44:20: >> so yeah, I but you can see like by us

44:22: being able to store securely this LLM

44:25: API key, now we can have applications

44:27: that are powered by AI on something like

44:29: connect cloud fairly easily.

44:32: >> Wonderful. Amazing. And this is also

44:36: like um the like

44:40: example that you could do. This is on

44:41: GitHub. So if he changed something in

44:43: his app in real time um like if he

44:46: changed a

44:48: theme or something which is like an easy

44:49: thing to show, we could just save that

44:52: in his application and push that and it

44:55: would automatically update and we would

44:56: see those changes happen immediately.

45:00: >> Yeah, there we go.

45:01: >> Let's see. Hey

45:05: committing to Maine like it's the wild

45:07: west, which is what I do most of the

45:09: time.

45:10: >> So, we'll come back over here

45:12: >> and then So, that should kick off uh a

45:15: refresh.

45:17: >> Where did you stick that? I wasn't even

45:19: sure. In the main the main title.

45:21: >> Yeah, I think so.

45:26: Where was it?

45:27: >> I I don't know. That's why I was asking.

45:29: [laughter]

45:30: Is it in the restaurant tipping part?

45:33: It would be absolutely like classic.

45:36: >> Oh, did I do I think I did an AB

45:38: testing.

45:39: >> Classic cursive testing. Oh, you sure

45:41: did. Yeah.

45:42: >> Yeah. Let's go back over to the AB

45:44: testing one to see if that worked.

45:47: There it is.

45:48: >> There it is.

45:49: >> I went to the wrong repo.

45:51: >> This is my absolute favorite thing about

45:53: ConnectCloud. Um, just feeling like I

45:55: don't have to worry about anything.

45:58: Like, I'm just going to do this and it's

46:00: just going to go. I don't have to press

46:02: publish. And like I I've I've had some

46:05: things happen in the past where

46:07: I was working at an actual company that

46:09: was using connect and I had done

46:11: something

46:13: janky that had messed up my deployment

46:16: process and publishing was not working

46:18: and like I like being hands off. Hey,

46:21: the repo runs, the repo gets a new bit

46:23: of code, the repo just updates the live

46:25: app and it's such a relief. It takes a

46:28: lot of the like little steps out of the

46:29: process where I might be human and mess

46:32: something up. All right, let's make sure

46:34: we don't have any lingering questions in

46:37: the Discord chat. Discord chat, if you

46:40: have any more questions for Alex about

46:42: shiny deployments or about the road map

46:44: of connect cloud, please let us know.

46:48: Um, and there is one more thing which

46:51: was I get a question a lot which is

46:53: okay, how do I publish to shinyapps.io

46:56: IO from Positron now because it's not in

47:00: a push button deployment anymore. You

47:02: can still do that from the RS Connect

47:04: package, but I would encourage everybody

47:07: to

47:08: migrate over to Posit Connect Cloud if

47:11: you haven't explored it already. Um,

47:13: because I think it is the way of the

47:15: future. Alex, did you want to talk a

47:16: little bit about a little bit about the

47:18: shiny do shinyapps.io legacy? Yeah, as I

47:23: mentioned earlier, like at this stage,

47:24: it's a 10-year-old platform and to be

47:27: honest, we haven't done a lot of

47:28: development work for probably the last

47:30: five years on it. And all of our

47:32: engineering efforts at the moment are

47:34: centered around connect cloud and making

47:36: it both be a viable alternative to

47:38: connect self-managed for those companies

47:40: who are able to operate in the cloud,

47:42: but be like the one place where you can

47:45: share all of your data work in a very

47:47: simple way. So, you know, I we haven't

47:50: set anything in stone yet. My guess is

47:52: it's still more than a year away, but I

47:54: would imagine in the long run that

47:55: Connect Cloud and Connect are really our

47:57: only recommended publishing platforms

47:59: for for anything that that you're

48:01: working on. Um, and if we do some kind

48:04: of migration, we'll we'll do everything

48:06: we can to make that as as smooth as

48:07: possible and and give plenty of notice

48:09: for that.

48:11: >> Yeah. And we'll be here to help.

48:12: Everybody can ask questions. I love the

48:14: idea of not having a million different

48:16: places for things like our pubs, CTO

48:19: pub, and shinyapps.io.

48:22: Having everything in in one spot with

48:24: like my same URL route for everything to

48:27: get shared makes me happy. Um, so yeah,

48:31: and there was one more question from

48:32: Edward that was in the slidoh. Edward,

48:35: let me see if I can find you to unmute

48:36: so you could ask your question because I

48:39: think that we had a lot of interest in

48:42: this app. And

48:44: >> hello.

48:47: >> Hi there.

48:48: >> Hey. Yeah, my question was um did you

48:51: just build a custom agent for that

48:52: specific dashboard or was that like a

48:55: did you build it with like a plug-in

48:56: prototype in mind to interact with just

48:59: any kind of shiny object and then

49:01: translate to SQL? Yeah, you can you can

49:04: check out the prompt that was in that

49:05: repo that we shared like just prompt MD

49:07: is essentially setting it up. So that

49:09: that's how that's all we're doing is

49:10: moving it around. I think it gave access

49:11: to just the one data table that was in

49:13: there and we said don't you know don't

49:14: use anything else and then and then

49:16: manipulating it was pretty much you're

49:18: going to generate SQL to change what's

49:20: in the table and then duct DB is

49:22: involved to to make everything kind of

49:23: update on the fly.

49:25: >> Gotcha.

49:27: >> Yeah.

49:27: >> All right. Cool. Thank you.

49:28: >> Yeah. Yeah. And we talk a lot about like

49:30: right right like can can connect cloud

49:32: support AI deployments and as you all

49:35: are well aware like AI can be used in so

49:38: many different ways within your

49:39: applications either power either

49:41: empowering you to make the application

49:43: itself faster or better or having your

49:45: users get more out of it. So of course

49:48: it can and as long as we're able to make

49:49: secure handshakes to databases or

49:52: external data and API providers we think

49:54: connect cloud can support a lot of that.

49:57: >> Sweet. Um, just real quick correlary to

50:00: that question. Um, I built an app that

50:02: was similar to this for census data and

50:04: I found that using like really small

50:06: local models was totally like fine for

50:09: that level of like SQL natural language

50:12: like SQL generation. Have you guys

50:14: experimented at all with just plunking

50:16: like a, you know, 3 gigabyte model into

50:19: your web server?

50:21: >> Yeah, I' I've definitely messed around

50:22: with local models and like everything

50:24: else, they're getting better each time

50:26: and like I I went out and got a 48

50:29: gigabyte laptop the other year just to

50:30: test them. But now I don't think you

50:31: even need that for some of the stuff

50:32: that you're working on. So like I think

50:34: I think what everybody is pivoting to

50:36: now is like evaluation, right? So like I

50:38: want to know is what I've deployed

50:40: working for the intended use and whether

50:43: that smaller model can help you. It

50:45: depends on your intended use and how

50:46: it's performing. So I think like setting

50:48: that up and validating it. But like if

50:49: you have one specific task and it seems

50:51: to be working well, that could be a

50:53: great a great way to to be either able

50:55: to scale it or keep your data in a more

50:57: controlled environment.

50:59: >> All right. Thank

51:00: >> Sure.

51:00: >> Absolutely. Thank you for the question,

51:02: Edward. All right, Alex, is there

51:04: anything else that you would like to

51:05: cover super quickly in the three minutes

51:07: that we have left?

51:08: >> Um, why don't I show you one thing? And

51:12: this this maybe is a little bit boring.

51:13: Let me switch my

51:14: >> also while you were doing that Alyssa

51:16: had asked hey wait is this different for

51:18: than databot the sort of sidebar thing

51:20: that you is it the precursor to data bot

51:22: >> yeah I mean I think it's all similar

51:24: work right it's like having context from

51:26: your environment from your data sets and

51:27: saying what can happen like databot in

51:30: its current version is just like in your

51:31: ID helping you there with more context

51:33: this was just like a limited version of

51:35: that type of interaction for what's

51:36: included in that that small scale

51:38: application

51:39: >> okay cool

51:40: >> but the the last thing that I wanted to

51:42: to show quickly is Last month we added

51:44: support for RS connect to go from R

51:46: Studio ID to connect cloud. So before

51:49: this right like so I've got my

51:50: application file. This is the same AB

51:52: testing one that we had before you would

51:54: use kind of like the the publish button

51:55: here and it would take you to

51:56: shinyapps.io. In the next two or 3

51:59: months I think that in that push button

52:02: flow you will also see connect cloud. So

52:04: like that will get there eventually. But

52:06: before then you can also go out and use

52:08: RS connect to do this. So, if I use RS

52:12: connect

52:13: and then if you can see down there,

52:16: uh, add account. Where is it? Add

52:19: server. There we go. Add server.

52:23: Oops.

52:26: Let's see.

52:30: There we go.

52:33: Connect cloud user. Now, I need to stop

52:36: sharing this screen to show you what it

52:38: took me to. This takes me to the

52:40: browser, right? And it's going to say

52:41: authorize this. Now, I'm going to say

52:43: continue. I'm going to say authorize.

52:45: And it's going to tell me to go back

52:46: into the IDE. And if I can find my many

52:50: screens. Now, we're here. It's going to

52:52: ask me, well, what account on connect

52:53: cloud do I want this associated with?

52:55: So, I'm going to use just the one that I

52:56: was using. So, now that we have this,

52:58: and now I can just say RS connect. So,

53:01: now that we've kind of registered it, I

53:02: can do deploy app.

53:06: And this is going up to Connect Cloud.

53:08: Making sure we're on Connect Cloud.

53:09: Perfect. Um, and it's publishing

53:12: content. And then it's already

53:13: transferred me back over to to my screen

53:16: where I can see that we've deployed

53:18: another version of this AB testing app.

53:20: So for those of you who are on our

53:22: studio and you're not yet or you don't

53:24: want to make the switch to to Positron,

53:26: you can deploy directly to ConnectCloud

53:27: now from that RS Connect package. And

53:29: very soon we'll also be adding it into

53:31: that push button flow that so many of

53:32: you have come to know and love.

53:35: Sweet. This has been fantastic, Alex.

53:38: Thank you so much for hanging out with

53:39: us today and giving us all of your

53:42: wisdom. Thank you everybody in the chat

53:44: for hanging out. Um, when you leave this

53:47: call, you're going to have a survey that

53:49: asks you like how we did. But there's

53:51: also a place if I push the buttons right

53:54: that you can put in what you would like

53:56: to see in a format like this where we

53:58: are like sharing screens and we're being

53:59: messy and we're learning out loud

54:01: together. um because we would love to

54:04: put more valuable stuff together and

54:06: have cool people from the community or

54:08: inside Posit share what they know. So,

54:11: Alex, I hope you had fun. Thank you so

54:12: much for joining us.

54:14: >> It was great. Thank you all.

54:16: >> Wonderful. Everybody, this does get

54:18: recorded and you don't need to save a

54:19: chat file because it is in Discord and

54:21: you can search for anything that you

54:23: would like in that in that channel um

54:26: the data science lab channel. We will

54:29: see you next week. We're going to be

54:31: joined by Marcos Wuerto from the um data

54:34: science community here who's going to be

54:36: walking through digging through APIs

54:40: that are just in like inspecting

54:42: websites in your browser so that you can

54:44: then use those APIs to like put in

54:46: Postman and use them or just harvest

54:49: JSON objects and use those. This is

54:51: something that I do all the time as

54:53: opposed to like using a scraping package

54:56: like beautiful soup or rvast or

54:57: selenium. Um, it's how I scraped the

55:00: posit conference schedule for two years

55:03: before I worked here so that I could

55:05: make it stuff of my own. I hope you'll

55:07: join us. It's going to be a lot of fun.

55:09: Um, I will see you next week and on the

55:11: server. I'll see you on the Discord

55:12: server. Bye everybody.

55:16: Have a good day. See you on Thursday at

55:18: the hangout.
