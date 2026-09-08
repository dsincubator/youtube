---
type: Video Transcript
title: "The mall package: using LLMs with data frames in R & Python | Edgar Ruiz | Data Science Lab"
description: "I'm a data community manager here at Posit."
resource: "https://www.youtube.com/watch?v=ZNHNVWUMTJA"
tags: ["ds-lab", "python", "apis", "cloud", "github"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T21:59:18Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=ZNHNVWUMTJA"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2026-03-10T00:00:00Z"
    usage_count: 1343
usage_window: { from: "2026-03-10T00:00:00Z", to: "2026-09-08T21:59:18Z" }
---

# Transcript

00:06: So welcome to the data science lab

00:08: everybody. My name is Libby. I'm a data

00:10: community manager here at Posit. And I

00:13: am joined by my co-host Isabella

00:14: Velasquez. Isabella, please say hello.

00:17: Hi everyone. Thanks for joining us.

00:20: We are so excited to be joined today by

00:23: Edgar Ruiz. Edgar, he is a maintainer of

00:26: the mall package which we will be

00:28: talking about today.

00:29: Edgar, would you like to say hello?

00:31: Hi everyone. Thank you for for joining.

00:34: Um also thank you for being here in such

00:37: cold weather.

00:38: And uh

00:39: hopefully we can show some cool stuff

00:41: that

00:42: y'all can use.

00:44: If you have not used the mall package

00:46: and we are hopefully sticking links to

00:48: everything in the Discord chat. We will

00:50: in just a second. We are talking about a

00:53: package that allows you to use Elmer

00:56: to connect to a variety of LLMs

00:59: and then apply

01:02: LLMs to your data in a programmatic way.

01:07: Which means like hey, I have this column

01:10: of text maybe and I want to transform it

01:12: somehow or classify it, translate it,

01:16: whatever that is with an LLM and then

01:18: have a column that represents the output

01:21: from the LLM.

01:22: This is amazing for me because when I

01:24: first started using LLMs, I was like,

01:26: okay, but how do I use this, right? Like

01:28: this is to me it was just like this is a

01:30: chat thing. How do I use this

01:32: programmatically if I want to apply it

01:34: to my data and the mall package

01:35: abstracted away all the difficulty for

01:37: me and I think that that's great. So I'm

01:39: going to go ahead and share my screen.

01:44: And just walk through

01:46: a Quarto doc.

01:48: I have

01:49: dark mode or semi-dark mode

01:51: on my Positron right now.

01:54: If this is hard for anybody to see, can

01:57: you please let me know or if it's too

01:58: small for you to see, please please

02:00: please let me know.

02:02: I'm going to take a look at the chat

02:03: here to see.

02:06: Okay.

02:07: Let me know.

02:08: Um Edgar, I would love it if you if you

02:11: could give us an intro, your own

02:13: maintainer intro

02:15: on what the mall package is and why it's

02:18: helpful before I dive into live coding.

02:22: Yeah, so this is an introduction that

02:23: from idea that

02:26: occurred to me when I

02:29: was looking at some output from LLMs

02:31: sometime back. And

02:34: um

02:35: I saw that

02:37: being able to ask it, is this text

02:39: positive or not, was actually pretty

02:41: straightforward. Um

02:43: even a local

02:45: a locally installed LLM would actually

02:48: do a pretty decent job at it. And that's

02:50: kind of what got it started because at

02:52: the time that I

02:53: started writing

02:55: uh mall

02:56: because of uh

02:57: how fast everything has evolved um

03:01: year and a half year ago,

03:03: uh companies were reticent about sending

03:06: data into the cloud if it was a cloud

03:09: provider for the LLM.

03:11: Uh now that's not as bad, you know, more

03:13: companies are doing that. Uh so at the

03:15: time most companies wanted to keep it

03:17: local and it looked like something such

03:19: as a llama model was actually going to

03:22: work well that could be installed

03:23: locally. So I figured I start

03:26: doing that. So one thing that I can ask

03:29: for here today is if you start seeing

03:33: things that we could actually do better

03:34: or add, you know, I kind of thought

03:37: through several like different things

03:38: like the sentiment uh classify, extract.

03:42: Uh also you can do your own custom one.

03:44: Uh and Libby will explain more about

03:46: what that does.

03:48: Um

03:49: if you see other ones that we could

03:50: possibly add, that'd be great.

03:53: Um also the the code is open. So and it

03:56: really boils down to a simple prompt

03:58: that I'm using to

04:00: to run recursively over the your data

04:02: set.

04:03: So

04:05: you know, improvements on prompts and

04:06: things like that always welcome.

04:08: Uh the the GitHub uh

04:10: uh the link to the GitHub repo is in in

04:13: the website. So

04:15: um please feel free to to reach out.

04:18: All right, perfect. So what Edgar was

04:21: mentioning, sentiment analysis, text

04:23: summarizing, classification of text,

04:26: extraction of text, translation, and

04:29: binary verification, true false. Um

04:32: these are all built into mall and then

04:34: there's also a custom. So what I'm going

04:36: to do is run through some code where I

04:38: show you what it looks like to get this

04:41: connected to Elmer, to an actual LLM.

04:44: Um and then what it looks like to use

04:46: some of these on your data.

04:49: If you click each of these, it will take

04:51: you down to examples of them, right? So

04:54: we have sentiment analysis

04:56: which happens with a function called LLM

04:58: sentiment. For each of these, there is

05:02: I'm sorry that I keep having this pop up

05:04: here. I'm going to keep closing it, but

05:05: ignore it unless you can't see it,

05:07: unless only I can see it.

05:08: >> see it. Now we can see it. Yeah, yeah. I

05:09: have a pop up. If you see me like stop

05:11: and my brain is spinning like a wheel on

05:13: the Mac screen, that's because I'm

05:14: closing something that Zoom's popping up

05:16: every time someone enters this room.

05:18: Okay.

05:19: Um so for each of these functions, there

05:21: is a vectorized version as well.

05:24: These functions are going to be applied

05:26: to a

05:28: um

05:29: a column in a data frame, but if you

05:31: wanted to apply them to just a vector,

05:33: like okay, I have a vector named this

05:35: and it contains a vector of text, then

05:37: you can use the vectorized version.

05:39: Um so for each of these there's also

05:41: you'll notice a Python tab up here.

05:43: That's because we can work on the data

05:47: frame level. This would be a data frame

05:48: called reviews.

05:50: And then we can use the LLM.sentiment

05:54: function

05:55: on our column called review. So if you

05:58: are wondering how things work in Python

06:00: as you're watching this, please don't

06:01: fret. Edgar's going to share the Python

06:03: code after I share the R code, okay?

06:05: Okay, I'm going to head back over to

06:06: Discord, make sure I'm not missing

06:08: anything. Nora says she needs to learn

06:10: NLP. Yeah, learn NLP. I love NLP. NLP by

06:13: the way, that's my soapbox, still has a

06:15: place.

06:16: Big time.

06:18: I love it.

06:20: Edgar, what

06:21: >> say say something real quick about the

06:22: NLP thing? That that's the other thing

06:24: that

06:25: uh I noticed that it the

06:28: the local LLM was actually doing real

06:29: well.

06:30: Uh even though it it might take a little

06:32: bit longer to to

06:34: to recursively go through a data set

06:36: it's kind of like you're paying

06:38: for the time that it would take you to

06:40: develop your own NLP. Yeah.

06:42: >> Uh you're paying it more on Yes, yeah,

06:44: it's a tax, right? It takes longer, yes,

06:46: to run, but you didn't have to spend the

06:48: time doing the NLP yourself and

06:50: tokenizing your uh you know, your your

06:52: words and then doing all this other

06:54: analysis you have to do. So that's the

06:56: other reason why

06:58: uh this exists. So If you see the

07:00: performance, of course it's going to be

07:01: slower, but

07:02: like Libby says, it's a tax, right? So

07:05: Yeah, it's also not not I think as

07:07: verifiable.

07:09: NLP I feel like is much more

07:10: predictable.

07:11: Um in the chat someone asked what's the

07:13: difference between using mall for these

07:14: NLP tasks versus traditional or

07:16: classical NLP. The difference is really

07:18: just that you are using an LLM versus

07:21: using um traditional NLP methods, which

07:25: might be like named entity recognition

07:28: or sentiment analysis using a lexicon, a

07:31: defined lexicon,

07:32: um or let's say

07:34: you might be doing something that I love

07:36: to do in NLP, which is sort of like uh

07:39: power analysis.

07:41: Um that means that you are creating this

07:42: lexicon or this database of

07:45: maybe words or phrases that indicate

07:47: certain things and then you are

07:49: basically using code and math to compare

07:52: the text that the text that you are

07:54: working on to what you have in your

07:57: database of what is a positive word or a

07:59: negative word or a neutral word or a

08:01: powerful word or you know,

08:04: NLP is its own topic, but we'll head

08:06: into our live coding now because we're

08:07: 14 minutes in and we better do that or

08:09: we're going to get roasted.

08:10: Please light a candle in the chat for me

08:12: because I am about to live code with

08:14: LLMs on the internet and we know that

08:16: something could go wrong. If it does go

08:18: wrong, please give me some some grace

08:19: and have patience. So what I will say at

08:22: the top of the script is if you have not

08:24: already installed mall and Elmer, those

08:26: are the two that you are going to really

08:28: really need. Um I have a little

08:30: install.packages for you if you would

08:32: like. And I also have this repo for you

08:37: and I don't know if anybody has shared

08:40: this repo in the chat. So let me

08:42: Oh.

08:44: I can go ahead and

08:45: Can you do that? Okay. Yeah, of course.

08:47: That's great. It's like the one repo

08:49: that I didn't get a link to is the one

08:51: that I'm using so that you can see it.

08:53: So I'm going to go ahead and run this

08:54: chunk which is just going to load Elmer

08:57: and mall and tidyverse.

08:58: And then if you have access to a

09:00: commercial LLM

09:02: you need to make sure that your API key

09:04: is in your dot environ file or your dot

09:06: env file um so that Elmer can recognize

09:10: it and use it. I am going to be using an

09:12: Anthropic model today, but it's not

09:15: through an API key in the same way that

09:17: you would use it. I'm using it through

09:18: AWS Bedrock. Um so what I'm going to

09:20: also show you is Ollama, which is so

09:22: much more accessible. It's a local LLM

09:24: that you install on your machine.

09:27: You can go to ollama.com/download

09:31: and um I will stick that in the chat.

09:34: And Corey had just said, can mall be

09:36: used with a local LLM? Yep, absolutely.

09:38: So you can use it with Ollama and what

09:42: I'm going to do is just show you that I

09:43: already have Ollama

09:45: installed and it's running. I don't know

09:47: if you can see the very top of my screen

09:48: up here, but on my Mac menu bar, there

09:50: is a little symbol that looks like Darth

09:52: Vader pics to me, but it's definitely

09:55: definitely Ollama. Um and here it is and

09:57: I just asked it a question. I said tell

09:59: me a joke and it said here's one. What

10:01: do you call a fake noodle? An impasta.

10:03: Ollama is up and running on my system.

10:07: And down here you can see there's this

10:09: little model

10:10: selection for Ollama. I have 3.2

10:13: installed. I will show you in a minute

10:16: how I got that installed and pulled it

10:18: down and like have my system recognize

10:20: it. But just know that you can choose

10:22: from a bunch of other models. I'm going

10:25: to let Edgar hop in here and just

10:28: mention

10:30: the size caveat on some of these because

10:32: with local LLMs you're pulling them down

10:34: onto your machine to run them.

10:36: Yeah. And some of these might be quite

10:38: large. Yes, exactly. That's exactly the

10:41: point.

10:42: The the issue is that these have to run

10:45: in memory.

10:46: So you may have a hard drive that's big

10:48: enough, but you still need enough RAM to

10:51: run these things. Llama 3.2 is wonderful

10:54: because it's very generalized.

10:57: Going back to the NLP thing like you

10:59: kind of limited on the amount of

11:01: training data you'll have to do your

11:04: your own NLP. But with Llama you have

11:07: so many more billions of tokens they'll

11:09: have on on on text. But the

11:13: the trade-off is that it takes a long

11:15: lot of space. So with Llama 3.2 the

11:19: latest is 2 GB.

11:22: The latest Llama which is 4 is actually

11:25: 67 GB on the smaller side. So that's

11:30: that's the thing like you kind of have

11:31: to

11:32: unless you have a very nice machine

11:35: it's probably going to be one of those

11:36: smaller ones that you'll need. Yeah, 3.2

11:39: is what I recommend. Yeah, also as as

11:41: time goes by and more folks

11:44: publish models that are more specialized

11:46: you may want to use this in a very

11:48: specific field. There may be some that

11:50: that are like that. So definitely follow

11:52: the ollama.com you know website and you

11:55: can search for your own type of

11:58: model that you may want to use. But but

12:00: yeah at this point Llama is to me is the

12:02: the better one.

12:03: If you all have used another one and

12:06: I would like to recommend also please

12:07: do. Yeah, let us know. So I'm going to

12:09: close this and talk about the Ollama R

12:12: package really quickly.

12:14: So the Ollama R package allows you to

12:18: pull down Ollama models and have them

12:21: recognized on your machine very quickly.

12:23: For example, I was able to run Ollama R

12:26: pull and just give it Llama 3.2 as my

12:30: model.

12:31: And then once that's done and I'm not

12:32: going to run it cuz it already is, I can

12:34: run this line of code right here that's

12:37: asking to test the connection to Ollama

12:39: and I've got my status 200. Oops, status

12:42: 200 which means all good.

12:45: And it's also telling me that the body

12:48: is or that that it's in memory and it's

12:49: 17 bytes. Okay, so let's

12:52: head over to do something very important

12:54: here which is something I actually

12:56: forgot to do the first time I did this.

12:59: But it is now in the repo for you to

13:01: submit a seed so that these random

13:03: samples are reproducible.

13:06: What I'm doing here is

13:09: collecting a few data sets

13:12: that are full of tweets. This is from

13:16: the Kaggle one of the Kaggle data sets

13:19: that's tweets.

13:20: It's linked in the read me of the repo.

13:22: So if you would like to go download that

13:24: download that tweets.csv

13:27: it is also in the repo as data right

13:30: here, but if you want to play with it on

13:32: your own that's how you can do it. And

13:33: what I've done is I'm I've taken a

13:35: sample. So I have a tweet sample that's

13:37: just 25 random samples of English

13:40: language tweets.

13:42: Then I have a random sampling of Jimmy

13:45: Fallon tweets.

13:46: I like Jimmy Fallon tweets cuz they're

13:48: sort of a mix up of really

13:51: really neutral like announcement tweets

13:53: that are right they're like announcing a

13:55: guest on a show or something and then

13:57: also personal tweets from him.

13:59: And then I have a random sampling of

14:02: Katy Perry tweets because I'm going to

14:03: talk about

14:05: safety and curse words and Katy Perry

14:07: sure does like to curse on Twitter

14:09: or at least when this

14:11: you know data set was taken.

14:13: What I'm going to do next is I am going

14:15: to set up Elmer. This is not Mall yet.

14:21: This is still Elmer. It's very important

14:23: to realize that Elmer and Mall go

14:26: together. You you don't use

14:28: Mall without Elmer's support. And it's

14:32: going to give you the ability to access

14:34: those models that you are then going to

14:35: use programmatically. I'm going to do

14:38: something that

14:40: Elmer wasn't really built to do. Sorry

14:42: Edgar. I'm like slightly breaking it.

14:44: I'm going to create two different chat

14:47: objects.

14:48: I'm going to use Elmer chat AWS Bedrock

14:51: to set up a chat with Anthropic so I can

14:54: run this.

14:56: And you can see over here it created a

14:58: value, right? This value is just a chat

15:02: object.

15:04: And then I'm going to create chat

15:05: Ollama. And I'm going to tell it the

15:07: model is 3.2. So when I run both of

15:09: those I now have a chat object. And then

15:12: I can use a Mall function to switch

15:15: between those

15:17: different Elmer chats. So Elmer was

15:20: really meant to I think use one chat per

15:23: session. And so you'll see later on when

15:26: I call it I do something special to try

15:28: to avoid like a caching issue. But this

15:32: right here is Elmer's

15:35: providers.

15:38: These are all of the different providers

15:41: that you can use with Elmer to power

15:43: your Mall work.

15:46: It's a pretty big list.

15:47: You can go straight to chat Anthropic

15:50: without going through AWS Bedrock

15:52: obviously because if you have an API key

15:55: that'll get you there. A lot of people

15:57: have been asking about Azure open AI

15:59: through Azure. It's there. Support is

16:01: there. Cloudflare, Deep Seek all the

16:04: things. Here's our chat Ollama that we

16:06: used. If you would like to figure out

16:08: how to set these up you could go click

16:10: it and then it's going to walk you

16:12: through this. And actually this is

16:14: really really easy. I think the first

16:16: time I ran through these instructions it

16:18: took me about 4 minutes to set up Ollama

16:21: and have it running. So highly recommend

16:24: starting with Ollama. I think Edgar you

16:27: said Gemini is also an option for

16:29: something that is a more like commercial

16:31: style model but that's also a free

16:32: option. Yeah, that's right. As long as

16:36: you have API access and a lot of

16:38: companies are going Gemini right now so

16:40: that maybe want to try. I was going to

16:42: say something real quick if I can.

16:44: Uh-huh. Um

16:46: I just want to like right now we're

16:48: talking a lot about Elmer and not Mall.

16:50: Elmer

16:52: I went ahead and created the back end

16:54: for Elmer inside because initially it

16:57: didn't have it. It was only Ollama.

16:59: So that is easier for you to be able to

17:01: connect to different kinds of uh uh

17:05: providers, right? That way Mall didn't

17:07: have to itself have a code to build to

17:10: connect to the different ones. Elmer is

17:12: my

17:13: my gateway, right? So I can just focus

17:15: on the the main stuff the Mall does. So

17:18: that's why we're talking about two two

17:19: packages.

17:20: And Elmer does a great job at this kind

17:22: of integration as as Libby's going to

17:23: show. So I I just want to mention that.

17:26: No yeah and I want to hop in and answer

17:28: David Anders' question here which was

17:30: what kind of specs should I

17:31: realistically have to make good use of

17:33: these models? And he said he had 64 gigs

17:37: of RAM. More than enough.

17:40: 64 gigs of RAM is more than enough. You

17:42: would be fine with 16 gigs of RAM I

17:43: think for 3.2. It's not as big as you

17:46: think. But also when you go to the

17:48: Ollama download and you look at the

17:49: different models each of the models

17:51: actually has like two or three different

17:54: sizes

17:55: size versions of that model to install.

17:58: So go take a look at them and and see

18:00: what you would need for each of those.

18:02: All right. So I have created my chat

18:07: objects for both Anthropic and Ollama.

18:10: Yours might look something more like

18:12: this like chat chat open AI and then

18:16: model equals um

18:19: Don't worry if you do not have something

18:21: that looks like this. This is very

18:22: specific to my setup on my machine for

18:24: work, okay? So I need to tell Mall I

18:28: have this Elmer um this Elmer chat

18:32: object I want to use it. I want to use

18:34: Ollama. So I'm going to run

18:36: use Ollama. Actually I feel like I

18:37: should throw a dot cache in there so I'm

18:39: going to do that. This is me trying to

18:41: stop um a cache problem [laughter]

18:44: from building up because I'm trying to

18:46: break the Elmer package here. So I will

18:50: do this

18:51: and tell Mall I want to use Elmer on the

18:54: back end. Yes and then my LLM session my

18:56: model's using Llama 3.2. We're all good

18:58: to go.

18:59: Now what I'm going to do is I'm going to

19:01: apply the LLM sentiment function

19:04: to my content variable. So let's go look

19:08: at my tweets sample. This is the data

19:10: set that I'm going to use right here. Um

19:13: if we take a look at it here in the

19:15: console I only have two columns. Author

19:20: and content. Author is a Twitter screen

19:23: name Twitter handle and content is just

19:26: the contents of the tweet as a string.

19:30: So I'm passing the content

19:33: variable right here

19:36: to the LLM sentiment and then I'm giving

19:38: it some extra optional things. So let's

19:42: go over to Mall really quickly

19:44: and we'll go to the sentiment function

19:47: here

19:48: the R version cuz that's what I'm using.

19:50: Um and we're going to go to its R

19:53: reference page so we can see what we

19:56: have as options here.

19:59: We've already given it the dot data

20:01: because I'm piping it in. Remember when

20:03: you are piping something in, uh that

20:05: pipe it takes everything on the

20:06: left-hand side of the pipe and feeds it

20:08: to the next function as the very first

20:10: argument. That means that this is

20:11: satisfied. Then I'm giving it my column,

20:13: that's that content column.

20:15: Um and then you can give it options.

20:18: This is like, "Hey, these are the

20:19: options that I want to accept as output

20:22: from the LLM."

20:24: Moll is very smart and if it gets output

20:27: that doesn't fit that, it will coerce it

20:29: to NA for you. Um so, take a look at

20:31: that. And then pred name, most important

20:34: one to me. I don't really love the dot

20:36: sentiment dot pred dot whatever. I like

20:39: naming it something specific, especially

20:41: because I like to compare different

20:42: models. So, I'm going to change this. Um

20:45: and then you also have the option of an

20:46: additional prompt. I wanted to ask you,

20:48: Edgar, is this like a system prompt or

20:50: is this an additional individual prompt?

20:54: This code gets attached to the main

20:56: prompt that's being sent. So,

20:58: if you for example something like this,

21:00: you can say, "If the person says these

21:02: specific words, then consider it neutral

21:04: or whatever." So, you can add some extra

21:07: >> Okay.

21:07: feedback to to make it more or fine-tune

21:10: it for better.

21:11: But I am not going to use that. What I

21:13: am going to do is just say, "Hey, here

21:15: are your options, positive, negative,

21:17: and neutral." And name my output column

21:19: sentiment llama. Okay? So, I can run

21:23: this and if everyone has lit their

21:25: candles correctly, my code will run.

21:28: Little progress bar at the bottom here,

21:30: love that. Aha, there we go. Um

21:33: it was created. So, I can go look at my

21:37: tweet sample sentiments, which is right

21:39: here. Click this button to get a data

21:41: view.

21:44: And here we are. I now have

21:46: an extra column over here of sentiment.

21:50: This is only 25 rows, y'all. If you have

21:53: an enormous data set, please be prepared

21:56: to wait and please be prepared for your

21:58: laptop to go

22:01: for like

22:02: 10 minutes while it figures out what

22:05: it's doing because it really is your

22:07: machine just like cooking, okay?

22:10: Um so, I had a question in Discord. Are

22:13: you limited to those three options,

22:14: positive, negative, neutral? I could

22:16: give it whatever I wanted. So, you could

22:18: do something, yes, like very positive,

22:20: positive, neutral, negative. I would

22:22: suggest giving it instructions about

22:25: what each of those things

22:27: means, right? Um

22:29: >> Yeah.

22:30: Yeah, that that would be important. Like

22:32: if you're deviating from that kind of

22:33: basic three structure or even two

22:37: structure,

22:38: I would let it know what you mean by

22:40: very positive. We will see in just a

22:42: minute. I'm going to compare the outputs

22:44: of Ollama and Anthropic and

22:47: you can be the judge on how well each of

22:49: them did and whether or not they would

22:51: have been coded the way you would as a

22:52: human.

22:53: Um Libby, Yeah. I I think have you also

22:56: asking if if it can return the

22:59: prediction probabilities,

23:01: which doesn't because it's not part of

23:02: the prompt. Um

23:04: and Elner, [clears throat]

23:06: like if you go into the the articles

23:08: themselves, there's a way that you can

23:09: actually build a prompt like that where

23:11: you say, you know, give me a percentage

23:13: you think that you can kind of make it

23:15: do that, but it's not

23:16: I don't think you'll be able to get

23:18: probabilities properly as if it was like

23:19: an an actual NLP model.

23:21: Also, while I have the floor, I just

23:23: want to mention real quickly

23:25: because of the time how long it takes

23:26: and and all that, that's why we have the

23:28: cache option. So, like if you're

23:31: running the same

23:34: you know,

23:35: uh

23:36: QMD or same script and you just refining

23:39: it and you're going to get the exact

23:40: same result if you were to run this the

23:43: same LLM sentiment, then it works much

23:45: faster the second time because

23:47: automatically caching results um into

23:51: into temporary folder that way it's

23:53: faster for you. You don't have to rerun

23:55: everything. Uh so, that that's why that

23:58: cache exists.

24:00: Um just want to mention that. Yeah,

24:02: that's if you want to save some time.

24:04: >> That's why I'm giving it the cache null.

24:06: Uh I really don't want it to build up in

24:08: there.

24:09: Um we had some questions in the chat.

24:11: Not all of them I can answer. So,

24:12: Abdullah had asked a rule of thumb set

24:14: of specs for a machine so local LLMs are

24:16: practically feasible.

24:18: And I mentioned that if you have at

24:19: least 16 gigs of RAM, I think that you

24:21: are you will do okay with something like

24:23: 3.2 from Ollama.

24:25: I am not a technical spec uh expert,

24:29: don't listen to me. I would have some

24:32: people add in the chat what their specs

24:34: are on their machine and how their

24:35: machine does when they run things. I

24:37: have found that my my machine does okay,

24:40: um but your mileage may vary based on

24:43: all kinds of factors.

24:45: Brent Pfeiffer had asked, "Would that be

24:48: in the additional prompt area where

24:49: you're defining things?" Yes, where

24:51: you're giving it information on like

24:53: what extra negative is or extra positive

24:55: is or in between is. Um and then

24:59: Simon had asked, let's see. Uh ah,

25:03: Simone, you had asked

25:04: you could use the vitals package to

25:06: compare models, right? The vitals

25:08: package is awesome. That's uh Simon

25:10: Couch's pack package, right, Isabella?

25:14: I have never used

25:16: Yes, I have never used vitals.

25:18: But you could you could. Um

25:21: and then, can we use LM Studio instead

25:23: of Ollama? David, I do not know.

25:26: I have never used LM Studio. If anybody

25:28: has used an a

25:30: third-party LLM management system, let

25:34: us know in the chat. That's not

25:35: something that I have played with yet.

25:37: All right, so let's go ahead and switch

25:40: our models over to Anthropic.

25:43: Um that means I'm using the moll LLM

25:45: {underscore} use to switch from that

25:47: chat Ollama to chat Anthropic. And again

25:50: using the cache option there to say,

25:52: "Hey, don't fill up my cache."

25:54: Um and then what we'll do is we'll run

25:56: that exact same code with LLM sentiment,

25:58: same code. The only thing that's

25:59: different is I'm changing the column

26:02: name that I'm adding to sentiment

26:03: Anthropic. So, I'm adding it back to

26:05: that same

26:07: new data frame that I had created up

26:10: here.

26:11: So, I can run this. Let's see how

26:13: quickly this runs with Anthropic.

26:16: In all of my testing, it's taken the

26:18: same amount of time, almost exactly for

26:20: Anthropic to run versus Ollama, by the

26:22: way.

26:23: Um so, now I can let's let's go let's go

26:27: delete all of these many things I have

26:28: open. We will go open tweets sample

26:32: sentiment one more time.

26:34: And this will allow us to look at a

26:36: comparison here between these two.

26:39: The one on the left is Ollama, the one

26:41: on the right is Anthropic.

26:44: And we can see that they don't agree for

26:46: all of these, right? Um so, this is

26:49: Ollama and Ollama is coding, for

26:52: example, this is negative when all it

26:54: says is Mondays and for babies. Mondays

26:57: could be negative, for sure. Like

26:58: Ollama, you might be right. But

27:00: Anthropic coded that as positive. We

27:02: have another disagreement on the second

27:04: one that just says tomorrow, Toronto,

27:07: and a URL, and that's it. I've noticed

27:10: that um

27:12: Ollama frequently codes something that

27:14: has a URL in it as negative and I don't

27:16: know why, but that seems to happen a

27:18: lot. Whereas, I think that Anthropic is

27:23: more correct here that that this is a

27:24: neutral tweet. None of us know the

27:26: context of this. We can't see what that

27:28: URL goes to.

27:29: Um and if there was a photo, we can't

27:31: see it.

27:32: So, let's head back over to our code and

27:37: let's look at

27:39: our agreement here. What I'm doing is I

27:42: am looking at this sample of sentiments,

27:46: which I just showed you here. Um this is

27:49: so that I can render the document and

27:51: you can look at it as a PDF if you want

27:52: to.

27:53: And then I calculate the the agreement.

27:55: So,

27:57: .68

27:58: 68% of the time they agreed. Otherwise,

28:02: they did not match.

28:04: This is something where I I really

28:06: recommend you go through and

28:08: review. Like we we we all know that LLMs

28:11: aren't perfect. Neither is NLP, by the

28:13: way. If you code something through NLP,

28:16: uh you know, you might look through it

28:18: and disagree as well even though you

28:20: wrote the underlying structures of your

28:21: NLP model.

28:24: Let's head over to summarization cuz we

28:26: are about halfway through. Want to make

28:28: sure that we don't have any major

28:29: questions. Let's see.

28:33: I see a question from Abdullah.

28:35: How do you iterate and validate the

28:38: model? Let's say you don't agree with

28:40: how the model classified things. How do

28:42: you measure accuracy? Do you take a

28:43: random sample of results and let a human

28:45: evaluate it? This is a process

28:48: question that will depend on

28:51: how much you want to verify. I am

28:54: playing with tweets. I'm just going to

28:56: visually verify, cherry-pick, and go

28:59: based off of vibes, right? But if I was

29:01: working in a research setting where I

29:03: really needed things to be right, I

29:05: think that I would probably run things

29:07: through an LLM and then I would set up a

29:11: a verification system to have several

29:14: different human beings run through and

29:17: validate whether or not this was

29:19: correct. So, they will not have to read

29:21: a tweet and decide whether or not it is

29:24: positive, negative, or neutral. They

29:25: will just have to agree or disagree with

29:27: the model what the model had coded it.

29:29: And if it was wrong, they might recode

29:31: it. And then I would have human beings

29:34: reviewing those results. So, depending

29:35: on the way that you you do things, you

29:38: know, and how big of a project this is

29:40: and what the stakes are for the project,

29:42: um

29:43: that'll be a choice that's up to you.

29:44: Maybe some people can share in the chat

29:46: how they have validated things.

29:49: Simon Couch's blog is a great place to

29:51: go for all things LLM verification, by

29:53: the way. I would go read through that.

29:55: He's going to be much better at that

29:57: than I am.

29:58: Okay, Isabella, can you stop me if there

30:01: any other really big questions? But if

30:04: they are not, okay, I'm going to show

30:06: you some summarizing really quickly.

30:08: We're going to go through this one a

30:09: little bit faster.

30:11: I'm switching

30:12: over to Llama 3.2 again. And I'm going

30:16: to use Jimmy Fallon tweets this time.

30:17: And what I'm going to do is create

30:21: an extra column in in this new

30:24: tweets_jimmyfallon_summary

30:28: um data set called summary_llama.

30:32: And the extra thing I've given it this

30:33: time is a max words 10. Now,

30:37: uh LLMs never listen to us. It's

30:40: frequently not going to stop at 10 or

30:43: give me less than 10. But a lot of times

30:45: this can help stop it be too wordy.

30:48: So, let's head over and um just redo

30:52: this with Anthropic so that we can

30:55: compare these.

30:58: All right, here we go. Anthropic is

30:59: running again pretty quickly for a

31:01: summarization task, but also this is

31:05: only 25 rows.

31:06: Let's go look at it.

31:08: Go over to my data here, check out my

31:11: tweets_jimmyfallon_summary.

31:15: And open it up here.

31:17: All right, here's my here's my content.

31:21: My friend slept in our walk-in pantry.

31:23: When he laid down, his feet would stick

31:25: out the door.

31:27: #myfirstapartment

31:29: Okay.

31:30: Llama's on the left.

31:32: Crazy and quite concerning living

31:34: situation for a first apartment.

31:37: Not wrong, technically. Let's see what

31:40: the Anthropic summary is. Friend slept

31:43: in tiny pantry, feet stuck out door.

31:46: That is much more accurate to me, that

31:48: Anthropic summary, right? Let's look at

31:50: one more. Um

31:54: Always great to see Mets bucket hat guy,

31:57: aka

31:58: Mike Ditzenzo.

32:00: Ditzenzo.

32:03: The Llama summary, Mike Ditzenzo is a

32:06: New York Mets fan Twitter personality.

32:08: Not wrong.

32:10: Uh Mets bucket hat guy spotted at event.

32:13: Probably more correct. So, again, we

32:16: have this like a Llama is not

32:18: technically wrong, but is maybe not

32:20: super helpful, and then Anthropic is

32:22: slightly more helpful.

32:24: You're going to have to go through and

32:26: review whether or not

32:28: this is good enough for you, right? If

32:30: you're doing a summary task with Llama

32:31: locally, is this good enough?

32:33: If not, you might want to attempt to

32:35: lean on a more commercial LLM like

32:37: Anthropic's models.

32:39: By the way, I'm using Sonic 4.5 just

32:41: because I think I forgot to say that

32:43: even though it was on screen.

32:46: I'm pausing for the chat. Okay, I don't

32:48: see any major golf flags, which denote

32:51: our questions. So, I'm going to head

32:54: back over, and uh we just did this. We

32:57: just took a look at what they were.

32:59: Now, I'm going to go through really

33:00: quickly cuz we have 20 minutes left and

33:02: I want to stop talking uh and hand this

33:04: over to show Python code.

33:06: What if you don't like those standard

33:07: functions? What if you want to do your

33:08: own thing? Let me show you how to make a

33:10: multi-stepped prompt using the Anthropic

33:13: models specifically.

33:15: What I'm going to do is look at Katy

33:17: Perry's tweets and have it classify for

33:20: me whether or not they are safe or

33:22: dangerous. And I am going to define safe

33:25: or dangerous really simply here. And I'm

33:28: also going to tell it to ignore URLs

33:29: because I've noticed that LLMs just get

33:32: like confused by by URLs sometimes. So,

33:35: I'm going to say ignore URLs and

33:37: usernames.

33:39: I'm also going to tell it safe text

33:42: contains no slurs or curse words.

33:45: And I'm going to tell it assess whether

33:47: the text is safe or dangerous, and then

33:50: return one word, either safe or

33:52: dangerous. I am saving this in a prompt

33:55: object.

33:56: It's just a string. It's not going

33:59: anywhere yet. It's just a string object

34:01: saved as prompt.

34:03: I'm going to switch back over to

34:05: Anthropic, which I think I did before. I

34:08: think Anthropic's the last model I used.

34:11: Yeah, okay. So, I'm going to leave that.

34:14: And then

34:16: I'm going to go through my sampling of

34:18: Katy Perry tweets. For my prompt option

34:21: in the LLM_custom_mall

34:24: function, I'm going to give it my

34:25: prompt.

34:27: And then I'm also going to give it what

34:28: my valid responses are, only safe and

34:31: dangerous. I want it to coerce

34:32: everything else to NA. And then I'm

34:34: going to name my new column that it's

34:35: creating safety_anthropic.

34:38: So, let's create this, see how long it

34:40: takes to run through that custom prompt.

34:43: About the same time as it's taken

34:44: everything else. At a larger scale, the

34:46: differences in time are going to be much

34:48: more apparent.

34:49: Um and let's go over to tweet safety,

34:52: look at it with our data viewer in

34:54: Positron.

34:55: Um and oh, wow, we do not have the

34:58: correct author here. Did I use the right

35:02: data set? Oh, wait, I need the new one

35:04: that I created.

35:06: I need tweet safety. Did I do that one?

35:09: Oh, what have I done here? Y'all help

35:11: me.

35:12: Tweet sample.

35:14: Oh, we're you we're looking at safety of

35:16: just like regular tweets first. I forgot

35:18: I did this. They're all safe.

35:21: The random sampling that we took, which

35:22: is like all kinds of people, Rihanna,

35:24: Kim Kardashian, Katy Perry,

35:27: Ariana Grande, they're all pretty safe.

35:29: If we're looking through these, I don't

35:31: see anything that leaps out to me as

35:33: something that I would have wanted it to

35:34: flag as dangerous.

35:37: Does anybody else see anything? I do not

35:40: see anything. No slurs, no curse words.

35:45: Okay. Was I smart? Did I

35:49: >> [laughter]

35:50: >> do Katy Perry's tweets? Yes.

35:52: Uh totally random assortment, not

35:53: random. I went and found bad ones.

35:56: Here's what we're going to do.

35:59: We are going to apply that same exact

36:01: prompt

36:03: to Katy Perry tweets.

36:06: We're going to create a data frame

36:07: called tweets_katyperry_safety.

36:12: It's working a little bit harder on Katy

36:14: Perry here. We're at 89%.

36:20: Did everybody light their candle?

36:24: Should I Should Getting there. We was

36:26: getting there.

36:28: >> [sighs and gasps]

36:30: >> Okay, let me check the chat for

36:32: questions, y'all.

36:35: There is one question about why use

36:38: paste if it is all text. Trying to

36:42: remember what line that was on.

36:44: >> [sighs]

36:44: >> Ah, that was me creating my prompt up

36:47: here.

36:49: I used paste

36:51: because this is exactly taken from the

36:55: docs for Mall. And this is just what

36:58: what was in the docs in Mall, and that's

37:00: all I did.

37:01: Um

37:02: Oh, that's where the question I couldn't

37:03: figure out where the question was from.

37:05: Yeah, yeah. [laughter]

37:06: You can just put this all together. What

37:09: paste is going to do is put this

37:10: together with a space between each one.

37:12: You could do paste zero and have no

37:14: space. It's like you're in control. But

37:16: having it like this is nice because it

37:18: allows you to look at it line by line

37:20: and understand what exactly you are

37:22: telling your LLM to do. I do like the

37:25: visual separation of it.

37:27: Um yes, Dan had asked, are these recent

37:30: X? No, they're tweets. They're literal

37:32: tweets. This is from the before times,

37:34: y'all.

37:35: Um the data set is on Kaggle. It's a

37:37: tweet data set, and Isabella had shared

37:39: a link.

37:43: Okay.

37:45: No more questions?

37:47: Isabella lit a candle for us, and it

37:49: finished. Coincidence? You decide. Okay.

37:52: Let's go look at

37:55: our oh

37:57: Katy Perry safety. Do we dare look at

37:59: this live on the internet? We're going

38:01: to do it.

38:04: Okay. Katy Perry's tweets, they have

38:07: been classified as safe or dangerous.

38:10: This first one is safe.

38:14: A visual explanation to what people in

38:16: Florida and surrounding areas are

38:16: experiencing, sending them prayers.

38:18: Looks pretty safe.

38:20: Uh

38:21: row three here

38:23: ha- it has decided this is unsafe, and

38:24: it does have a curse word in it.

38:27: I think that that is great. Good job,

38:29: Anthropic. You did a good job. Okay, so

38:32: before I move on, I want to say that

38:34: prompt took iteration. It did not work

38:37: the first like eight times I did it. It

38:39: didn't do what I wanted it to do. I had

38:41: to iterate and iterate and iterate until

38:44: my prompt

38:46: was going to do what I wanted it to do

38:48: reliably. Also,

38:50: um LLMs are not deterministic.

38:53: I could run it

38:55: one time and run it again, and it could,

38:57: you know, give me a different answer.

38:59: So,

39:00: use LLMs for things like this for

39:02: anything at your own risk here.

39:06: Um all right, we ran that.

39:09: I also, just for funsies because

39:11: everybody likes numbers, looked at my

39:14: random sampling of 18 Katy Perry tweets

39:16: to see what proportions were safe and

39:18: unsafe.

39:19: You know, about 83% safe, not bad.

39:23: I wanted to also, before I hand this

39:25: over for the last 15 minutes to Edgar

39:27: here, talk about an Elmer, not Mall, an

39:30: Elmer function, which is pretty nice.

39:33: It's the token usage function. I think

39:35: this is pretty new, right, Edgar? It

39:37: tells you how many tokens you've used.

39:39: So, hey, here are the the models that

39:42: you've used. Here are the number of

39:44: input and output tokens.

39:46: Um notice that I don't have anything

39:49: that's cached because I told it not to

39:52: cache anything. I think that's

39:54: that's how that works. And then the

39:55: price is in a I have seen people

39:59: where it has access to a price for an

40:00: actual commercial model. This is me

40:02: using it through Bedrock, so it's not

40:03: the same, but I have seen people use

40:05: this when it's hooked up to a commercial

40:06: model where the price actually does

40:08: show.

40:09: Edgar, do you have anything to add about

40:11: that function?

40:14: Not not really. I just noticed that I

40:16: haven't really used it that often.

40:18: Okay.

40:20: Um Corey had asked playlist for the data

40:22: science labs.

40:24: Um Isabella linked it, but Corey and

40:26: anybody else listening, if you go to

40:28: pos.it/dslab,

40:30: you will also see the playlist linked

40:32: there. It's like the registration page

40:34: for our our event, but it also has a

40:35: bunch of other info.

40:39: All right.

40:40: Yes, yes, yes. Did I miss any questions?

40:42: I don't think I did.

40:44: I'm going to hand it over. Let's stop

40:46: sharing here to Edgar, and Edgar is

40:49: going to show you

40:51: um what the Python version of this might

40:53: look like.

40:57: And hopefully, if we've all written

41:00: if we've all

41:01: lit our candles correctly, um

41:03: I yeah, good.

41:05: >> his code will also run.

41:07: Here we go. There you go.

41:09: All right. So,

41:12: is this uh how long do I have? All

41:14: right.

41:15: Um

41:17: I [clears throat] uh

41:17: I'm assuming that most of us here are R

41:21: users.

41:22: Um so, I'm going to do some explanations

41:24: here like additional explanation of how

41:26: it actually translates into into Python.

41:29: Uh actually, how Mall

41:31: works with translation into Python.

41:33: Uh so, that's

41:35: hopefully

41:36: kind of well, you can also see as as an

41:38: R user how how it differs in this uh

41:41: thing with um Python. So,

41:45: Mall, uh unlike R, where you can have

41:48: like a standalone

41:50: uh package or something that um

41:53: can modify data frames,

41:55: uh in Python, specifically for the

41:57: PyData community, uh we have something

42:00: such as Pandas, and that has some Pandas

42:02: data frame, for example. Um but uh

42:05: there's a new one called Polars, and let

42:08: me see. What's it in this? There you go.

42:11: Polars

42:12: the PR

42:14: Yeah, just choose here.

42:16: Uh Polars is um

42:18: it's great. It's It's very fast. It's

42:20: been It was written in Rust, and it's

42:23: what a lot of

42:25: folks are starting to use now. In fact,

42:27: it's like the recommended uh way of

42:29: using data frames going forward. Uh so,

42:32: that's um

42:33: what Mall does uh on the Python side.

42:37: Uh I'm going to stop sharing here.

42:41: Uh

42:42: let's see.

42:43: Sorry.

42:46: Okay. So, um you can see yourselves.

42:50: Okay.

42:51: Uh we see Okay. There we go. We're back

42:53: to your IDE. Okay.

42:55: Did Did were you able to see yourselves

42:57: or it just goes black? It goes black.

43:00: Okay, good.

43:01: Uh so, I'll just keep it like that for

43:02: now.

43:04: So, what it what Mall is is is an

43:07: extension of Polars and I know

43:11: clarify here what extension what I mean

43:13: by extension here in a second.

43:15: Um

43:17: All right. We start with the errors

43:18: here.

43:19: What is this? There you go.

43:22: Now,

43:23: uh I have this critics data frame

43:27: loaded. It's uh these are criticisms, I

43:30: guess, uh or reviews about uh the

43:34: Nintendo game Animal Crossing: New

43:35: Horizons. So, it can be pretty

43:38: favorable.

43:40: Um using the uh

43:43: Tidy Tuesday

43:46: uh data sets.

43:48: We'll have a link here. So, you can see

43:51: essentially uh the name and also the

43:54: actual uh text of the review.

43:58: Uh the next thing I'm going to do, I'm

44:00: going to import Mall before doing that.

44:01: Actually, notice that if I go to critics

44:04: and I type dot,

44:07: which is kind of like dollar sign in R.

44:09: For a start, typing LLM, you see that's

44:11: not available. And Libby showed earlier

44:14: where you can you can see where

44:16: LLM.sentiment, that that's not

44:17: available. It comes available whenever

44:20: you actually load the Mall package. Now,

44:23: you should be able to see it.

44:26: Which was something really interesting

44:28: to me because I'm kind of new to Python.

44:30: So, that's basically what extension

44:32: means. It's basically that it becomes

44:35: part of that

44:37: um object that you have, uh which is

44:40: your data frame. It's an object that now

44:42: is extended for you to use uh the

44:45: functionality. So, now that it it it's

44:48: there,

44:49: uh we have to assign it per data frame,

44:52: uh which back end that we're going to

44:54: use as a provider. And I'm going to use

44:56: Ollama here.

44:58: Um in this case, I'm using the

45:02: uh out-of-the-box integration that I I

45:05: can use with Ollama, which is the its

45:07: own Ollama uh library from PyPI.

45:11: So, once you install Mall, it's actually

45:12: going to install this package, too. And

45:14: then I can just use it. Uh and very

45:17: similar to how it works, but instead of

45:19: typing into it, just basically call the

45:21: extension and run it.

45:23: Now, it's going to it's going to run.

45:26: Yeah. So, his little call there on line

45:28: 34 is the data frame name {dot} LLM

45:32: {dot} sentiment, so we're

45:34: working on that data frame class,

45:37: and then we're passing the text, which

45:39: is the variable name, as a string.

45:41: Correct.

45:45: For anybody who's not used to looking at

45:46: Python.

45:47: >> [laughter]

45:50: >> That's something that kind of

45:51: took me a while to get used to, where I

45:53: have to always quote the names of the

45:56: the of the actual columns I'm using. Uh

45:59: so, it's going to be quoted. Uh so, it's

46:01: running right now. Hopefully, it won't

46:03: take that much longer.

46:07: In the meantime, we have a question from

46:09: Dan asking uh in the documentation says

46:12: in Python, Mall is the library extension

46:15: to Polars.

46:16: Uh does that mean that it does not work

46:18: with Pandas?

46:21: Correct. You won't be able to If it's a

46:23: if it's an actual Pandas data frame, and

46:25: you don't have Polars loaded, it won't

46:27: recognize it. You won't be able to use

46:29: it. You have to convert it.

46:31: Yeah, it's taking a while.

46:34: And I don't have the time.

46:36: >> Yeah, please light a candle.

46:37: >> 8 minutes left. Okay.

46:41: Wait, candles. Oh my gosh, candles.

46:42: Yeah, we need them.

46:44: One more. It worked last time.

46:47: That's all I'm saying. I I know it's

46:49: running because if not, it would have

46:51: error out. And I can see the the Mall

46:54: folder.

46:55: >> So, everything is working. Uh but I'm

46:58: sure it's having all these screens open

47:01: and Zoom and all this stuff

47:03: just uh making it

47:05: chug along. Come on, you can do this.

47:08: Megan gave us a very nice little

47:10: explainer in there about Python and

47:12: objects and extensions and methods and

47:14: stuff. Yeah.

47:16: So, while this is doing this, I'm going

47:19: to

47:20: Hubert, see you later. Some folks are

47:22: having to drop for other meetings, so

47:23: it's okay.

47:27: I want to show here um

47:30: as Libby mentioned, there's um

47:32: also you can select R and Py or Python

47:35: here, and it can walk you through how

47:36: you you can set that up in your uh in

47:39: your machine. Uh all the same examples

47:42: are available, as well as the reference.

47:46: Once you select Python any any of the

47:48: pages in the site, it'll switch

47:50: everything to Python. So, the uh

47:54: documentation will also be available for

47:57: for it. Um

47:59: the package itself on both sides, on R

48:02: and Python side, come with a small data

48:05: set that has three reviews, and uh

48:09: you can use it as you know, to test it

48:11: for the first time.

48:12: And uh it it's all available here, too.

48:16: Perfect.

48:17: >> So,

48:19: let me uh

48:21: Finally,

48:22: >> that our Python has run in our last 5

48:24: minutes?

48:24: >> yeah.

48:25: Yeah, I got I got the I I put it on the

48:27: other screen while running. Yeah. So,

48:30: you can see

48:31: it ran. And if I were to run this again,

48:35: you'll notice that it ran almost

48:36: immediately because of the of the cache.

48:38: So, you can see the big advantage of

48:41: having the cache is, especially if

48:42: you're trying to re-render things and

48:44: re-run them,

48:46: it's it's not going to take as long the

48:47: second time.

48:49: So, I'm just going to reassign this

48:50: variable here, so now it'll have the new

48:53: column, which is the sentiment column.

48:56: We have it available.

48:59: And then I'm going to run

49:03: uh to see if there's anything that is

49:05: not positive cuz everybody liked it.

49:07: This is the only one that kind of

49:09: didn't like it. Uh so, we can see

49:11: there's some variance there as far as uh

49:14: not everything was classified as

49:15: positive.

49:17: Um for this one, I'm going to use the

49:20: this the first one were critic reviews.

49:22: This is the user reviews. I'm going to

49:24: read this in.

49:27: And uh instead of 100, I'm just going to

49:30: do top 10 for right now.

49:32: And what I'm going to do here is I'm

49:33: going to extract the language that the

49:36: uh review was written in.

49:39: And that should take shorter, hopefully.

49:42: Hopefully, with only 10. So, we're using

49:44: llm.extract

49:46: or llm_extract

49:48: from R. Um we're passing it the text

49:51: variable, and then the prompt that we're

49:53: giving it basically is I want you to

49:54: extract the language, be it English,

49:57: Spanish, etc. So, that little part at

49:59: the end, that second argument, is what

50:01: the llm is getting as its prompt.

50:06: And hopefully it does okay, cuz we do

50:08: have some reviews in all different

50:10: languages.

50:11: Yeah.

50:12: >> quick question, Edgar. Where is this

50:13: data from?

50:14: >> You know, the hearings.

50:15: This is uh from Teddy Tuesday.

50:18: The 2020 May 5th. Awesome.

50:22: Thank you.

50:23: Um I don't think we're going to have

50:25: enough time to go through all this

50:26: because it's taking a while.

50:28: Um one thing I wanted to show is uh

50:31: that the dust translations

50:33: There's a few here that are not uh in

50:36: English that could kind of showcase uh

50:39: the translate actually does refer to

50:40: human language. So, you can translate

50:42: from one language to the other. Um one

50:45: thing that I found with llms that is so

50:47: cool is that you don't need to need to

50:49: specify the

50:51: uh origin language, just the target

50:53: language. So, it'll adapt to whatever

50:57: language you say that you have uh you

50:59: know, Italian, Spanish, Russian, all in

51:02: the original text that you want them all

51:04: translated into English, you don't need

51:06: to specify each one as a you know, the

51:08: the origin. Just you say I want English,

51:10: which is very different from other um

51:13: translations

51:15: uh you know, uh programs or algorithms

51:18: that are out there. Uh the llms just

51:19: pick it up and it does it automatically.

51:22: And this is through both sides on on the

51:24: R and Python side.

51:26: Um before we go, I just wanted to show

51:28: you

51:29: uh how um

51:31: uh

51:32: llm works with uh an external uh llm or

51:37: external provider. Uh so, instead of uh

51:40: Elmer, we're using chatless, which is

51:43: the essentially the same package, but

51:45: for Python. Um this is this is not my

51:48: package uh

51:50: or Elmer, for that matter. Elmer's is uh

51:53: at least package.

51:54: Uh so,

51:57: I'm basically doing the same thing

51:59: uh

52:00: as we did on the R side. We're

52:03: setting up a chat object.

52:06: And what I'm doing here is on the user

52:07: reviews, I'm going to use that chat

52:09: object.

52:11: So, now it's set up

52:13: for me to use, and I can use it

52:17: directly here.

52:18: Um

52:19: now it is calling

52:21: um

52:23: uh

52:24: AWS. It's going to uh Anthropic and

52:28: running it just like it ran with uh

52:31: uh

52:32: in R.

52:34: The only thing that we don't have is the

52:35: nice progress bar,

52:36: but uh it is working. So, oh wow, and

52:39: this one said it's all negative.

52:42: This is from user reviews. Yeah.

52:44: >> But it worked. It looks like it worked.

52:47: >> Really awesome. Some of them are right.

52:48: The way All right, everybody.

52:50: We have a minute left.

52:52: Um I wanted to re-put the

52:57: repo in the chat that um

52:59: we used that contains both of these

53:01: files.

53:02: This is just my personal repo. If it's a

53:04: mess,

53:05: don't judge me. This was really, really

53:07: fun. I'm so glad that you hung out with

53:09: us at the Data Science Lab. I wanted to

53:11: let you know that we have Sarah Altman

53:12: joining us next week, and we just happen

53:15: to have another llm one. The lab is not

53:16: always about llms.

53:18: I promise. But we are going to be doing

53:20: data analysis with the assistance of AI,

53:23: which might mean data bot, might mean

53:25: cloud code. Like, what does that look

53:26: like in February of 2026 for Sarah? I

53:31: hope that you'll come and join us. And

53:32: on Thursday at the Data Science Lab, we

53:34: have Alexander Shok from Cytel, but he's

53:36: also the Effective Statistician

53:39: podcaster. Um come with your data

53:42: science career questions, especially if

53:44: you are a stats-flavored data science

53:46: person. It's going to be transformative

53:48: and wonderful. I hope that you have a

53:50: fantastic rest of your week. Please hang

53:52: out on the Discord server with us if you

53:54: have more questions. We are going to try

53:56: to answer them. We love you, and we'll

53:58: see you next time. Bye, everybody.
