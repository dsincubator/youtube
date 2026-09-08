---
type: Video Transcript
title: "Inspecting websites to find JSON data APIs | Marcos Huerta | Data Science Lab"
description: "And we are going to go ahead and get started."
resource: "https://www.youtube.com/watch?v=LDHGENv1NP4"
tags: ["ds-lab", "apis", "web-scraping", "python", "pins"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T21:59:18Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=LDHGENv1NP4"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2026-01-26T00:00:00Z"
    usage_count: 1204
usage_window: { from: "2026-01-26T00:00:00Z", to: "2026-09-08T21:59:18Z" }
---

# Transcript

00:06: and we are going to go ahead and get

00:08: started. I'm so excited to have

00:10: everybody hanging out with us today for

00:13: the data science lab. Um my name is

00:15: Libby. I'm a data community manager here

00:17: at Posit and I am joined by Isabella and

00:21: Daniel. Isabella, would you like to say

00:23: hello? Isabella is here from Posit. Hi

00:26: everyone. Um I'm Isabella. I'm on the

00:28: Devril team at Posit. I'm really excited

00:31: to have you here. Thank you so much for

00:32: joining. Hooray. Daniel, would you like

00:35: to say hello?

00:36: >> Hello everyone. I'm also in the Devall

00:39: team at Posit. And I'll guess I'll see

00:41: everyone in the Discord chat.

00:43: >> Yeah, Dan's going to be our Discord

00:44: gribbling today. And I'm joined by

00:46: Marcos Werta. Marcos, would you like to

00:49: say hello to everybody?

00:50: >> Um, hello everybody. Uh, I'm Marcos. Uh,

00:53: happy to join uh Libby and everyone

00:54: today.

00:56: Yeah, we are uh getting together every

00:58: Tuesday at the data science lab to be a

01:02: much more open, transparent, screen

01:06: share, messy place to hang out with your

01:08: friends and code. Um, this will be like

01:10: a, "Hey, my friend wants to show me how

01:13: he does something and we're going to

01:15: code together." What this means is this

01:18: is a place for you to stop and ask

01:20: questions to say, "I can't see your

01:22: screen. I your your text is too small.

01:25: Wait, slow down. Do that again. Um or

01:27: can you explain that a little bit more

01:29: so I understand it? This is not a

01:33: presentation or a talk. This is us like

01:36: hanging out and coding together. And I

01:38: really really hope that you are open to

01:40: asking questions and learning things

01:42: today. And if you are someone who knows

01:45: a lot about the topic that we're

01:47: covering, I hope that you will share

01:50: your knowledge and your resources and

01:52: extra tidbits about what we're talking

01:54: about in the chat because that is what

01:56: this whole thing is about. Um, this is a

01:59: space for everybody. It doesn't matter

02:00: what your years of experience are. It

02:02: doesn't matter what background you come

02:03: from.

02:05: You are in the right place and the

02:08: Discord server in the data science lab

02:10: channel is the place to be. So, if you

02:12: just joined the Discord server, you can

02:14: head to like the general channel.

02:16: There's a little message saying that

02:17: we're going to be in the data science

02:18: lab channel. You can click that channel

02:20: heading name and it will take you

02:21: directly in there. And I see that we are

02:24: we're joined in the Discord chat by some

02:28: uh alumni of the data science lab.

02:30: Isabella is in there talking saying that

02:32: she's just here for the mechanical

02:33: keyboards. Uh we might talk about

02:35: mechanical keyboards today. We're going

02:36: to try not to. Let's go ahead and get

02:38: into it. Yeah, I know. This is

02:40: dangerous, Marcus. I just put together

02:42: uh one of my keyboards and several of my

02:45: keys don't work and I'm like, I'm going

02:47: to have to take it back apart.

02:48: >> I bent some pin I bent some pins when I

02:50: was doing my hot swap keyboard. I bent

02:52: some pins and I didn't realize how

02:53: important it was to make sure the pins

02:54: were aligned. So, that was a problem.

02:55: >> Oh, yep. [laughter] There's some foam in

02:57: the bottom of my keyboard that's messing

02:59: up the the pins. Um so, I'm going to go

03:01: rip my keyboard apart and take the foam

03:02: out. Okay, everybody, let's get started.

03:05: What we're going to talk about today is

03:07: the guts of websites. So when we want to

03:12: get data from websites, we are often

03:14: looking at web scraping using like

03:17: beautiful soup or rvest maybe rvest plus

03:20: selenium. Um by the way, rvest has a new

03:23: like read html live function which means

03:26: you don't have to use selenium all the

03:28: time which is cool. Um but there's also

03:31: a more manual alternative to this.

03:35: um is an API call that's not an official

03:37: API, right? There are some websites that

03:39: have official APIs. They're great. We

03:41: can call on them and grab data. Most

03:44: websites aren't going to have a API

03:46: that's structured for the public to use,

03:48: right? But that doesn't mean that that

03:49: website's not receiving data through API

03:52: calls. That's what Marcus and I are

03:55: going to be digging through today. Um

03:58: so, I say we go ahead and get started.

04:01: Marcus, can you give us a rundown of

04:03: what we're going to talk about today at

04:05: a high level because I think it's mostly

04:07: the guts of how API calls happen on the

04:10: website and Postman.

04:12: >> Yeah. So, yeah. So, um like opening

04:14: statements, um like yeah, Libby said it

04:17: very well like I think I don't know 10

04:20: 20 years ago most websites or a lot of

04:21: websites rendered server side, right?

04:24: They would do a bunch of stuff on the

04:25: server and then the server and then you

04:27: would your computer would retrieve a

04:28: HTML table or whatever from the server

04:31: and that's what you could scrape that

04:32: with beautiful soup, right? You can do a

04:34: request.get or HTT and R. My art my art

04:38: is very I haven't used art in ages but

04:39: uh you can basically pull that in and

04:41: then you've got this basically giant

04:42: string of HTML and various tools like

04:45: beautiful soup or other things can parse

04:47: those tables and extract the data right

04:49: um I don't know when the trend started

04:52: but now a lot of times what happens is

04:53: the server is not sending you HTML the

04:55: server is sending you data and

04:57: JavaScript running on your computer is

04:59: taking that data and building the pieces

05:00: of the website for you. So the table you

05:02: see in a website is not if you went and

05:05: like curled that from the command line

05:07: or if you request.get or whatever

05:10: programmatically with some retrieval

05:14: code that does not process JavaScript,

05:15: you would just get a bunch of JavaScript

05:17: tags and you wouldn't actually have a

05:19: table, right? So there's there's two

05:20: reasons to do these private APIs. One is

05:22: because like it's it's cleaner and

05:24: better than trying to do beautiful soup

05:26: and two is sometimes beautiful soup

05:28: won't work, right? cuz like unless you'd

05:29: have to like maybe save the source from

05:31: a web browser or something to kind of

05:32: get that generated table. So, we're

05:35: going to do is we're going to look at a

05:36: couple I'm going to share my screen here

05:36: in a second, but we'll look at a couple

05:38: of websites. We will use the developer

05:42: tools and either I'm going to probably

05:44: mostly be showing Safari, but I'll also

05:45: show off Firefox and Chrome briefly.

05:47: You're going to using those developer

05:48: tools looking for what is your browser

05:50: actually going to get and seeing if any

05:53: of that is JSON. And if it is JSON, then

05:56: we will figure out you can you can

05:57: always obviously save that data directly

05:59: and if you just want to play with it,

06:01: but if you want to get it the next time

06:02: you we'll show you some tricks to maybe

06:04: getting some code that will let you kind

06:07: of hit that over and over again. Another

06:09: big caveat is like this is all fun if

06:10: you're just trying to do some analysis

06:12: like hey I really want this data from

06:13: this baseball game or from this from

06:15: this government website or whatever. Um,

06:17: do not build a business around like the

06:19: tools we're gonna do [laughter] not like

06:21: because eventually if you're hitting

06:22: this thing like if you hit it once every

06:24: now and then, no one's they're never

06:25: going to notice. They're going to think

06:26: you're a web browser. If you're like

06:27: hitting banging some private API just

06:30: pound p pound p pound p pound p pound p

06:30: pound p pound p pound p pound p pound

06:30: ping away at it like um uh with like a

06:33: you know crown job every minute like

06:35: they're eventually going to figure that

06:36: out and probably block your IP address.

06:37: So like don't do that. Don't build don't

06:39: build out like some big don't think aha

06:42: now I have a great business idea. I'm

06:43: gonna scrape this weird API and do this.

06:45: Don't do that. um because they will

06:48: probably eventually block you. Um so, uh

06:50: was that a good overview?

06:52: >> Yes, I think that's great. I think the

06:54: um the takeaway for me is like with

06:56: great sneaky snoopy power comes great

06:59: responsibility because if you like being

07:01: able to sneakily grab data off of an API

07:03: and then you

07:05: >> ping it incessantly for like weeks on

07:07: end, you will ruin it for all of us. I

07:09: mean most of these things will have most

07:11: of these things are will have rate a lot

07:12: of these sites will not all of them but

07:13: a lot of them will have rate limits

07:14: built into the API that are kind of

07:16: designed for what a human would do

07:17: clicking around on the website. So if

07:18: you start

07:20: >> using you know request.get or curl on it

07:22: you know a gazillion times like you

07:24: might start getting like you know not

07:26: 200 responses you'll get a 400 you'll

07:28: get a 500 what I forget what the code is

07:30: but you'll get some HTTP code that's

07:31: basically like you've hit the rate

07:32: limit.

07:33: >> You'll get something other than a

07:34: success.

07:35: >> Yeah and that happened to me recently.

07:36: And I forget what I was trying to do,

07:37: but I I was get starting to hit rate

07:39: limits. So, um,

07:40: >> all right. Well, let's do it. Let's do

07:42: some screen sharing. And for anybody

07:44: who's hearing curl and wondering what

07:46: that is, we'll talk a little bit about

07:47: that. Um, and I would love to hear in

07:50: the chat what your experiences are with

07:53: web scraping because I use this method

07:55: that Marcus uses. Marcus taught me this

07:58: and and he like fielded a ton of my like

08:01: where do I find this questions like

08:03: years ago. Um because I hate web

08:07: scraping. If I dive right into wave web

08:09: web scraping, I don't always know what

08:10: I'm doing. This glimpse in the

08:12: background if you do do web scraping or

08:15: use like hitter um to to call APIs. This

08:18: will help you understand more what you

08:19: are doing when you're doing that.

08:21: >> Yeah. See another another R package that

08:23: I mispronounced. You said hitter and I I

08:25: I did not know that's how you pronounce

08:26: HTTR. I was just thinking htr. Um

08:29: >> isn't there like a little person hitting

08:31: a baseball and then a sticker?

08:32: >> That makes sense. I that shows I haven't

08:34: seen the hex, I guess. All right, so

08:35: here we are um at Baseball Savant. I'm

08:38: in Safari. I I will feel free to follow

08:40: along in your own web browser. Um and so

08:44: you know it's got this nice cool site.

08:45: This is like a particular game, right?

08:47: We've got pictures and exit velocity,

08:48: all this cool data. So these are all

08:50: kind of tables. This is um you know what

08:53: how this is all getting constructed with

08:54: JavaScript. So the first thing we do is

08:56: you want to inspect elements and if you

08:58: were in a different uh web browser, you

09:00: might want to do something differently.

09:01: Um, but you want to kind of go into the

09:03: so a lot of this is like source code,

09:05: but what you what we actually want in

09:06: Safari anyway is the sources tab. So I'm

09:08: going to one thing you will usually have

09:09: to do is refresh because you want to get

09:11: fresh requests.

09:12: >> Yeah, you command R for the refresh too,

09:15: I think.

09:16: >> Oh yeah, thank you. Now sometimes you

09:18: might see in Safari sometimes you might

09:19: see it what's called XHR request. That's

09:21: frequently a thing you want to look for.

09:22: But sometimes they don't put them

09:23: they're not they don't show up as XHR.

09:25: They show up as just fetches. So we

09:26: click on these and oh look what is this?

09:28: It's JSON. So here we see trending

09:30: players. We see some J JSON data that is

09:33: making uh well nothing on this page

09:36: apparently but um that is uh some data.

09:39: We got a schedule here with a bunch of

09:41: stuff in it. We've got uh this GF which

09:43: probably stands for game feed and that

09:45: has a ton of data. Look at all this

09:47: JSON. Right? So that's pretty exciting.

09:49: Um and then we have some other smaller

09:51: data set and then you know these

09:52: actually are telling you what they are

09:53: pitcher yearly averages. Right? So this

09:57: is the start of of everything. Now, the

09:59: first thing you can do is just let's

10:01: look at the game feed. And you can just

10:03: in Safari, you can just right click on

10:04: this and save it. I think Safari is the

10:05: only one where you can right click and

10:06: save a file, though. Libby was telling

10:08: me that she thought there was a way to

10:09: do it. And um

10:10: >> yeah, when I'm on Windows and I'm using

10:12: Chrome, I can rightclick and save

10:14: object.

10:16: >> I'm going to save this as game

10:16: feed.json. Copy it.

10:18: >> I'm going to say game feed data lab so I

10:21: don't can find this file later. And then

10:23: let's open up VS Code and ignore all of

10:26: my

10:28: uh projects there. And let's just open

10:31: up this one file.

10:32: >> Can everybody see Marcus'

10:35: screen with the text size and

10:37: everything? We can attach

10:38: >> I will make things bigger. Yeah. Someone

10:39: >> zoom in a little bit.

10:41: >> Someone who's reading the chat tell me.

10:43: Everyone can see everything down my

10:44: computer right now. So everyone's like

10:45: really

10:46: >> Wait, I love Marcus' um Christmas

10:50: lights. I know I'm distracting us from

10:52: the point here, but look at his

10:53: Christmas lights. It's all around his

10:54: computer.

10:55: >> That is the app called Festivus if

10:56: anyone wants to buy that. Look at this.

10:57: 100,000 lines of JSON. So, um,

11:00: >> he has an app called Festivus, which is

11:02: which is a Mac if you want to decorate

11:04: for the holidays. All right. So, here

11:05: was this giant and I formatted it. And

11:07: I'll make the Let me make the font

11:08: bigger. So, here's this giant JSON file,

11:10: right? And this is a whole other dark

11:12: art of trying to figure out like in

11:14: these nested JSON files, like how do you

11:16: want to get out what you want? Like for

11:18: example, it looks like we've got the

11:20: scoreboard is a key and then we've got a

11:22: list uh sorry a dictionary but then

11:24: within that dictionary we've got some

11:26: we've got a list of dictionaries. So you

11:29: know I don't have time to go through we

11:30: got some win probabilities by inning.

11:32: This is all pretty cool but like you can

11:33: see that it's kind of buried in here.

11:35: Like this this key is in stats

11:38: scoreboard. I mean there's all these

11:39: kind of keys kind of tucked away. So

11:42: there's a whole dark art to like taking

11:44: this JSON and trying to get massage it

11:46: into something you can turn into a data

11:47: frame. Um uh but that's probably a

11:51: little bit beyond the scope. The point

11:52: is there's a ton of data here and maybe

11:53: we want to play with this data, right?

11:54: So the first thing you could do is just

11:56: save it and load it into pandas or a

11:58: data frame or

12:00: uh or polers or whatever. Um I I think

12:04: what I want to do first is show like

12:05: maybe you just want to get this data

12:07: directly into your machine as opposed to

12:09: uh kind of saving it as a file like I

12:11: did. So again in Safari one thing we can

12:13: do is rightclick and this is al this is

12:16: definitely in uh all the other browsers.

12:18: Copy is curl right. So what is curl?

12:21: Curl is this right? Curl is and I'll

12:24: keep trying to make this bigger. curl is

12:26: just a command line program on on Linux

12:29: or Unix

12:30: >> and it just basically will download

12:34: >> stuff, right? It will download the text

12:35: or it'll stream that to if you type this

12:37: into like a terminal in the Mac, it

12:39: would just spit out all the all of the

12:41: HTML. I'm sorry, all the JSON because

12:42: we're hitting the actual we're hitting

12:44: the actual API here. So, this URL is the

12:46: API and these are a bunch of cookies and

12:48: a bunch of various headers that you may

12:50: or may not need. Um, so you could just

12:53: paste this into uh to um your terminal

12:56: and get get some stuff out. In fact, I

12:58: think I did that last time Lily and I

12:59: were doing this. So, let's just pop this

13:01: in here. Um,

13:04: well, let's copy this again

13:08: and drop that in there. Don't worry

13:09: about this. It's pretty matte. Why is it

13:12: mad at me? Oh, it's binary output.

13:13: That's interesting. Okay, well, ignore

13:15: that. Anyway, so um so this is what it

13:18: looks like. So, here's the link, some

13:20: referers, some cookies. So the real

13:22: trick now, we don't want to be using

13:24: using curl command line stuff. We want

13:25: Python or R, right? So, so this brings

13:28: us to an app called Postman. Postman

13:30: will really try to make you have an

13:31: account. I always use I always ignore

13:33: this and use it without an account. Um,

13:36: so I was doing this earlier when Liv and

13:37: I demoed this. So I'm going to go to

13:39: import. We're going to

13:41: >> Yeah, Postman really gets me. I I

13:43: thought for a long time I had to have an

13:44: account, so I avoided it.

13:45: >> So I pasted in that curl and I'll do I

13:47: can just slow down and do that again.

13:49: See, it says paste curl to import. And

13:50: then you paste it in. And now it has

13:52: translated all of that into Can I make

13:54: this font bigger?

13:55: >> Yeah.

13:56: >> Everything is everything is based on uh

13:58: on uh what's that thing called that VS

14:00: Code is based on. Um

14:02: >> I [clears throat] don't know.

14:04: >> I can't remember. Um someone someone

14:06: remembers. Um anyway, it's based on the

14:08: command plus works in this app too

14:09: because it's also based on whatever that

14:10: web framework is that makes all these

14:12: apps. Anyway, um so now what has it

14:15: done? We the params are just this. The

14:17: params just means this question mark

14:19: thing which is some kind of identifier

14:21: for the game. And then the headers are

14:23: all those things we saw. And if we click

14:26: send, uh, we should get back a bunch of

14:29: JSON. And here's the JSON that we saw,

14:31: right?

14:32: >> Yes. And so those are like each of those

14:34: little check marks that was in our curl.

14:36: Each of those little dash lines that was

14:38: like dash age something.

14:39: >> Yes, exactly. And I'm trying to make

14:41: this go away. Can this Can I make this

14:42: go away?

14:43: >> I think that's the smallest kids.

14:45: >> I'm trying to make it go away. Wait,

14:46: >> but that's okay. Oh, there we go.

14:48: >> Yeah, there we go. At least we can see

14:49: your text.

14:49: >> Um,

14:50: >> and also I heard Electron is what

14:52: they're saying.

14:53: >> Thank you, Well, Electron, they're both

14:55: have Electron app, so command plus just

14:56: worked in both of them because they're

14:57: both basically the same thing under the

14:59: hood. Um, all right. So, now we've got

15:00: all this all this JSON data here. One

15:03: thing you can do, one thing I like to do

15:05: is I start I just start unchecking

15:07: things like, does it really need this

15:08: cookie or is it going to get mad at me

15:09: if I will will the request work without

15:11: the cookie? The request still works

15:12: without the cookie. Uh, do I really need

15:14: this like user string with all this

15:15: Apple stuff? You know, pretending we're

15:17: Safari. Yeah, it still works. Sometimes

15:19: you turn if do we really need the refer?

15:21: Probably need this. Let's see. Do we

15:23: need it? No, we don't. So, you can kind

15:25: of start turning things off and seeing

15:26: if the request still works or if it

15:28: doesn't cuz sometimes you really need

15:29: that cookie. You know, it sets a session

15:31: cookie and it won't work without it. It

15:32: really needs the refer whatever. Some of

15:35: these things you don't want to turn off

15:36: because it's telling it like what kind

15:37: of data it accepts. So, I usually leave

15:38: the smaller ones alone. Um sometimes um

15:42: you know the cookie can be really

15:43: important. For example, I have a little

15:45: system by which I get some data off of

15:46: the Kia website for my uh car, my

15:49: electric car. The data is all there. The

15:51: website only shows you like four

15:53: columns, but if you do what I'm doing

15:54: here, you can see like the real data

15:56: structure. And so, but I can't access

15:58: that without a cookie, right? So, I have

15:59: to get the cookies out if I want to

16:00: download it. Anyway, this little button

16:02: here, which is very hard to see, um is

16:05: the code button. And this is where it

16:08: will turn this request that you imported

16:11: into code. Right? So, Python request is

16:14: what I'm going to cut copy because

16:15: that's what I'm going to go show off in

16:16: Jupyter here in a second. But you've

16:18: also got um you know, you've got

16:20: everything. You've got PHP, you can go

16:22: with, you know, non request Python if

16:24: you want base Python. You there's

16:26: hitter, there's our curl, right? And

16:28: it'll just generate the code for you.

16:30: >> Um it's not that complicated because

16:31: it's really just a set of headers and a

16:32: link. It's basically headers and a and a

16:35: euro URL. But nevertheless, if you need

16:38: code for different um for different

16:40: things, you can um and go back to curl,

16:42: which is kind of funny because that's

16:43: what we imported um

16:46: >> is cleaned up now. Oh, we have a

16:48: question from Nick as well in the chat,

16:51: which is like are there open source

16:52: alternatives for Postman? Do we know?

16:54: >> Um that's a great question. Um the other

16:57: app that I've played with before is

16:58: Rapid API, which um I don't know if it's

17:01: open source or not. It's probably

17:02: another is it another Electron app? I

17:03: think it is. I think it's yet another

17:04: Electron app. Oh, maybe it's not

17:06: Electron. Command Plus is not working.

17:07: So, so Rapid API is a similar app. I

17:09: think there might be some Mac ones that

17:11: are at least not Postman. Um I feel like

17:14: there's one more that I've played with

17:15: once, but I couldn't find it again. Uh

17:17: so, Rapid API is another one that you

17:19: can use, which I believe has a Windows

17:20: version as well. I don't know if

17:22: >> Insomnia.

17:23: >> There you go. Insomnia.

17:25: >> I don't know what that is.

17:26: >> There are plenty of them. To me, to me,

17:28: the trick is, can it generate the code

17:30: for me? Cuz it's kind of just very

17:31: convenient to have that ability to to

17:33: generate the code. All right. So, let's

17:36: see if I can get a Jupyter notebook.

17:39: >> But you could just like look at the curl

17:40: and construct it yourself.

17:42: >> You could hit her or Yeah,

17:46: >> which is often where I hit a barrier cuz

17:48: I'm like, I'm clearly doing this wrong.

17:50: [laughter]

17:52: >> Um,

17:53: >> or I'll get a response I don't

17:54: understand.

17:54: >> Firing up a Jupyter server here. Um,

17:56: >> all right. Cool.

17:58: >> Um, and once again, everyone can see all

17:59: of my directory structure. That's fun.

18:01: Uh, one, let me uh just open up a a

18:05: single

18:07: >> That's okay. I, um, so the Oh, great.

18:10: Dan just put a insomnia.rest

18:14: link in the chat for us. Um, and this is

18:17: like

18:18: the way that I prefer to do things also

18:21: because I like to be precise about where

18:24: I'm finding things. Um, and I sometimes

18:27: if I'm in Chrome or something else, it's

18:29: not in the same spot. And I figured this

18:31: is a good point to like stop and say

18:34: that is in Safari, we opened up, we did

18:37: like rightclick inspect and it's

18:39: underneath this like nice folder

18:41: structure for us. But often when I'm in

18:44: Chrome, I have to go to the network tab

18:48: to the XHR where it's fetching or like

18:51: fetch/xhr.

18:53: Um, and sometimes this payload is in

18:57: different places and you really have to

18:58: click around.

19:00: >> Yeah. So, let's actually we got time.

19:02: Let's let's look at let's just look at

19:03: quickly what it looks like in Chrome

19:04: since a lot of people use Chrome. Um, so

19:07: if you were to do this in Chrome inspect

19:10: uh refresh I never hit command R. Keep

19:13: Libby keeps telling me to just use a

19:14: keyboard shortcut and I always

19:15: >> I'm a keyboard shortcut person. I know.

19:17: >> Um, so here we go with sources. Uh,

19:20: didn't she say with sources and network?

19:22: network.

19:23: >> It's network and then s fetch.

19:24: >> So there it is. So here's the same

19:26: thing, right? And you just have to kind

19:27: of be comfortable poking around. Once

19:28: you once you do it once with whatever

19:30: browser you prefer, you'll kind of get

19:31: used to looking in the looking for it.

19:32: So here's the same data uh once again uh

19:35: and you can rightclick and copy as curl.

19:39: >> There you go. There you go. I don't see

19:40: a save. I don't see

19:41: >> the harder thing is like it's not Yeah,

19:43: there's no save. It's copy. So I I ended

19:45: up just I paste it into a text doc and

19:48: go from there. I'll save it as a JSON.

19:50: >> Um Yeah. So, uh, so, so that you get the

19:54: idea. All right. So, now we're we're

19:56: over here in there's so many I I cleaned

19:59: up my windows and now it's already a

20:00: window chaos.

20:02: >> You can close the Chrome.

20:03: >> Yeah, let's close Chrome. That's a good

20:05: idea. Let's at least hide Chrome, right?

20:07: >> Get out of here, Chrome.

20:08: >> All right. And then we'll go ahead and

20:10: close.

20:10: >> I use Chrome. Everybody hates me for it.

20:13: >> All right. So, here we are. We've done

20:15: the same thing, but now we have this

20:16: response.json, which is going to be a

20:19: dictionary. All right. So, let's just do

20:20: response. Oops, interesting. Did we

20:22: finally get rate limited? What happened?

20:24: >> Uh oh, we might have the um the code

20:27: defaults to something that's like

20:28: requests something or not response. Do

20:31: we need to change it to response

20:34: response? See, JSON. Oh, it's very mad

20:37: at me. Maybe I did need some of those

20:39: cookies. Maybe I was wrong. Let's go

20:41: back to Postman. Let's turn my cookies

20:44: back on and my refer back on. Uh, let's

20:49: not get Swift code, but let's get um

20:52: Python requests. Let's copy this. Let's

20:56: come back over here. Let's put that in

20:58: there.

21:00: Let's see. So, is this going to work?

21:02: Wait, it's really not happy with me.

21:04: What's I do?

21:05: >> Oh, no. You're everyone's seeing in real

21:08: time the the things that are going to

21:10: happen when you're trying to do this on

21:11: your own.

21:15: And it seems to be working. There we go.

21:18: I think I I was using an old version of

21:19: Python. Maybe that's the problem. All

21:21: right. So now here we go. So now here we

21:22: have a bunch.json

21:25: basically will parse the JSON for you if

21:27: you're using requests in Python. And so

21:29: this is now a giant a giant dictionary.

21:31: So I'll just call this um

21:32: >> but the thing that it prints for you at

21:34: the end of your code is not

21:35: response.json. You have to change that.

21:37: >> That's Yes, that's true. This that's

21:39: true. That's true. It'll do response.ext

21:41: which will just give you the raw string.

21:43: And by response.json JSON if you're

21:45: using requests in Python will will

21:46: basically turn that giant basically

21:48: essentially import the JSON library and

21:50: turn it into a giant dictionary for you.

21:51: So now we have a giant dictionary called

21:53: game feed and now we can look at the

21:55: keys and we see all these things and

21:58: maybe we can look at um home team data

22:03: and see what's in there and you you know

22:04: then you can start playing around with

22:05: it and try and figure out what you want.

22:06: Um to me what's interesting is the

22:08: probability. So I've looked at this data

22:10: before. Um so let's see now just

22:14: basically a JSON parsing. You have to

22:15: decide what what you want to do which

22:18: what if you care about I think we we

22:20: liked scoreboard right? Scoreboard had

22:22: some fun.

22:24: >> Oh and David is asking if anybody knows

22:27: of a better R package for JSON like to

22:31: TSV or JSON to CSV other than JSON

22:34: light. JSON light's what I use. Does

22:35: anybody use anything different? let me

22:37: know in the Discord chat.

22:41: And also, I really like the like if

22:43: you're parsing JSON in R Studio, you

22:46: open up your JSON object and it gives

22:48: you this nice little like nested

22:49: structure with little drop downs that

22:51: you can open. It's like nice and visual.

22:53: Highly recommend. That's what I that's

22:55: what I use.

22:56: >> So, at some point you're going to have

22:57: to depending on what data you get, you

22:59: know, it might be a very simple

23:00: structure which has like a nice which is

23:02: just a nice list of something that you

23:03: want. And it might be more complicated

23:04: where for example this what I really

23:06: what I really find interesting in this

23:07: data is those is the the stuff that's

23:09: making these probability graphs right I

23:10: think that's kind of fun right because

23:11: you have these probability of the who's

23:13: going to win go going up and down and so

23:15: that's kind of what I would be

23:16: interested in grabbing right so I would

23:17: have to go in find where that this

23:20: because there's only one game right this

23:21: is a single this is a we only I believe

23:23: we're getting the information just in a

23:25: single game from a single day so we'd go

23:26: in and try and find that find that data

23:29: and uh turn it into something and turn

23:31: it into a data frame or what have But it

23:33: might be in stats, not states.

23:36: Stats. So there's there they are. We

23:38: want WPA.

23:41: We want game WPA.

23:43: So now we have a list of dictionaries.

23:45: And that's what you need to make to do

23:47: something like turn it into data frame.

23:49: Right? So now we have a data frame,

23:50: right? Home team, away team, win

23:53: probability. Basically, it's a real-time

23:54: estimate from the MLB computers as to

23:58: how likely one team is to win the game

24:00: or not based on the score and the

24:01: inning, etc. and the situation usually.

24:03: So um so that is that is essentially the

24:07: technique right and we can now apply

24:08: this technique to a variety of of

24:10: websites and uh uh and uh see what see

24:15: what data is out there right um it's uh

24:18: it's to be honest with you the the

24:21: getting to this getting the data getting

24:23: the JSON is probably once you've figured

24:25: it out is a pretty easy step then

24:26: there's like traversing the JSON

24:29: structure which is like dictionaries and

24:31: lists of dictionaries and lists of

24:32: dictionaries And sometimes like for

24:34: example there is um an actual official

24:36: API from Virginia legislature that like

24:39: returns like it's hard to describe but

24:41: essentially there's a list buried down

24:42: in there that I want but I also want

24:44: identifying keys from above that that uh

24:46: that tell me like what bill this is or

24:47: whatever and what the for what the votes

24:49: are and so I have to end up doing this

24:50: elaborate dance of like extracting this

24:52: list and then pulling in keys from the

24:54: from the from the one or two levels

24:56: above. I would love to build some kind

24:58: of universal JSON smart parser thing

25:01: that will like kind of do that for you,

25:02: but I haven't. It's so hard. I haven't

25:03: figured out how to do it. Um, let's look

25:05: at another one. Here's the Massachusetts

25:07: Lottery. Um, Powerball's big if anyone

25:10: is uh excited about Powerball. Um, so

25:14: let's

25:14: >> Oh yeah, we have um Ryan in the chat

25:16: said that there is

25:18: um another package that I'm going to say

25:21: is Y JSON R. Like Y letter Y JSON R.

25:26: I've never used it, but it exists and we

25:28: should go investigate it.

25:30: >> It's cool. So, we're still getting

25:31: fetches. We're not getting in Safari

25:33: anyway, where we're getting interesting

25:35: things like hot and cold numbers and

25:37: cold numbers. You can see a lot of stuff

25:39: from a lot of stuff that you're seeing

25:40: on the screen here is being is actually

25:42: a bunch of uh JSON. We have uh upcoming

25:45: draw dates, uh draw schedules, the

25:48: numbers of the latest draw, um uh things

25:52: like that. Maybe we're interested in

25:54: like instant instant games. We've seen

25:57: this thing pop up. Is that showing up

25:59: over here? And yeah, sort of. We got a

26:02: games dictionary that tells you all the

26:03: that's showing. Basically, I think it's

26:05: everything that's here is now kind of

26:06: rendering here. Some of you were curious

26:08: about the these images, whatever. Have I

26:11: ever potentially done this for a lottery

26:14: website before? Maybe I have. Um um so

26:18: this is like showing like kind of all

26:20: the different um uh prizes and different

26:22: things. So you could play with that too.

26:24: So and the same deal right you could

26:25: copy as curl go to Postman or Rapid X

26:28: your favorite app generate the code

26:30: switch to codebase play around with it

26:32: automate it. Um so that is kind of the

26:36: the recipe. Is anyone uh well let me

26:39: what do you think we should do? Should

26:40: we should we uh try some more websites?

26:42: Should we take more questions? Yeah, I

26:45: would love to take questions. Just

26:47: remind everybody that you can ask

26:48: questions and stop us when we're going

26:51: very very quickly through things and

26:53: potentially go through just like another

26:55: round of this and be messy and have it,

26:58: you know, cause problems. This is how I

27:01: if you've ever seen in the last couple

27:02: of years, I created like an IC file that

27:05: was of the comp schedule. schedules are

27:11: usually JSON objects somewhere and you

27:13: can go scrape them and do stuff with

27:15: them. Um, I'm always like, "Oh, I wish

27:17: that there was like a a Google calendar

27:20: file that I could use that I could just

27:22: upload and have all of the events

27:24: separated and all of the talks separated

27:26: and all of their like abstracts and

27:28: stuff in there so that I can choose

27:29: between them." And so this method is how

27:32: I did that for the past couple of years.

27:34: I do have a video probably on YouTube

27:37: somewhere of how I did that the first

27:39: year and then the important lesson that

27:41: I learned was I went back the next year

27:43: to do it and the JSON structure was

27:44: completely different.

27:46: So I could not completely reuse all of

27:50: my my code. Um yeah, even though it was

27:53: like the same the same website. So,

27:56: there are there are always going to be

27:58: challenges and this is definitely not

28:00: something that you're going to set up

28:01: and like like Marcus said like build a

28:04: thriving business on something that will

28:06: just be plug and play forever. Um,

28:09: >> so I

28:11: >> No, I was going to say it's just like be

28:13: okay with the manual part of this.

28:15: >> Um,

28:17: >> and you the only thing I actually

28:19: automate with this is it is it is my

28:21: I'll go ahead and show off. It's it's

28:23: this is this site. So, for the Virginia

28:24: Lottery, uh, a few years ago, I built

28:27: out, and this is like pre before I even

28:29: knew about Shiny and Dash and all these

28:31: things, I built out, uh, this kind of

28:34: manual, where is it? Scratch off. This

28:36: manual site that's like a bunch of

28:38: ginger templates that I like wrote

28:39: myself. And it it um it actually mostly

28:42: does beautiful soup stuff and scrapes

28:44: various uh, scratchoff web pages for the

28:46: lottery um, for the Virginia Lottery,

28:49: the Virginia scratchoff things. But

28:50: like, see this image here? And like this

28:52: just I needed to know what were all the

28:54: games cuz like the the URL was

28:55: predictable based on this number that I

28:57: needed to scrape, but I didn't know what

28:59: the list of active games was. And so

29:01: sure enough, somewhere on the Virginia

29:03: Lottery website is a tiny little JSON

29:05: list when you when you go to look at all

29:06: the list of scratchers much like I was

29:08: showing in the messages site um is a

29:11: list. And so I hit that list once a day,

29:12: right? To make sure I have like a new

29:14: games and I know if there's a new game

29:15: or not and so I know what to scrape,

29:17: right? And all that runs once a day,

29:19: right? and so far still works. Um, but

29:22: what I'm doing is I'm looking at the

29:23: ratio of unclaimed to claimed tickets

29:25: and trying to see which which games are

29:27: the best deal. None of them are a good

29:28: deal, but like which one is the

29:30: >> none of them are a good deal.

29:31: >> Which one is the best? Every now and

29:32: then you do get positive expectation

29:34: value, but uh right now it looks like we

29:35: don't have any games with a positive

29:36: expectation value. This is

29:38: >> Did I miss the way that you schedule

29:40: that to run every day?

29:42: >> So, I have a server in Digital Ocean uh

29:44: that hosts all my my website, all my

29:46: dash apps uh formerly a shiny server. Um

29:49: and uh and it also has so it has cron

29:52: and so and so I sometimes sometimes I

29:53: run these on my own Mac because my Mac

29:55: mini never turns off. So sometimes if

29:56: it's more computationally intensive I'll

29:58: just spin up a cron job on my Mac uh at

30:00: home um like for example I use some

30:03: language model stuff like the small ones

30:05: like sentence transformers that I talked

30:06: about in posit comp and those that's

30:08: just too much to run at my little

30:09: digital ocean server so I'll run those

30:11: on my Mac and push them up to wherever

30:13: wherever that data needs to go. Oh, but

30:15: I was going to say is there's an advance

30:16: advanced if you really want to get

30:17: advanced about this. For example, I

30:19: mentioned that I have this the KIA

30:22: website has has stuff that I that I want

30:24: for myself. It's my own data, right? And

30:25: so that is obviously not accessible

30:27: unless you're logged in. Well, the way

30:28: it knows if you're logged in is a

30:29: session cookie. And if you have

30:31: something like RookiePie, which is an

30:33: advant this is a this again, I don't

30:34: know if this exists for R or anything

30:36: like it, but RookiePie if you're logged

30:38: into basically if you if it only works

30:40: for Firefox. It says it works for

30:41: everything. If Firefox you're logged in

30:43: in Firefox, RookiePie can see all the

30:45: cookies for a site that from Firefox. So

30:47: Rookie, so I can log into the website in

30:49: Firefox and then I can run my script.

30:50: Rookiepie goes and grabs the cookies I

30:52: need and then does all this request

30:54: stuff that I was showing you and gets

30:56: the data I want and the way I want it.

30:57: So if you want to get if you're looking

30:59: for advanced like tactics for doing

31:01: stuff for like sites that you log into

31:04: and you don't want to manually be

31:05: cutting cutting and pasting cookies

31:07: every time you use it, Rookie Pie

31:08: potentially might help you. Um, it

31:10: claims it works for all the browsers.

31:12: I've only actually got it to work for

31:13: Firefox. I'm starting to wonder if it

31:14: should work for Firefox is that it means

31:16: that your cookies are sitting in a text

31:17: file somewhere on your computer. Um, but

31:19: nevertheless, it works. I use it. Um,

31:22: uh, so Rookie Pie and there are other

31:24: things like if you search for cookies,

31:26: you'll find a bunch of packages and

31:27: maybe maybe there's similar ones for for

31:29: R and another one for Python or for R.

31:32: >> Okay.

31:33: >> So, you had a you had an idea though.

31:36: Sorry, I cut you off there. I had a

31:38: question because I I I put it in in the

31:40: chat like what are some websites that we

31:42: could attempt to snoop to show how hard

31:44: they are?

31:45: >> You're asking the community. That's

31:46: great.

31:46: >> Yes. And one of them that's really

31:49: really hard. The first one that got

31:51: mentioned was um LinkedIn. So things

31:53: that need a login

31:56: are hard, but LinkedIn is hard for

32:00: multiple reasons. It's just really

32:02: really locked down. Um, but also like

32:05: Marcus would have to log in and show his

32:07: like personal stuff in LinkedIn. I'm not

32:09: sure.

32:09: >> Yeah, login websites login websites are

32:11: tough, but but they they do usually have

32:13: similar things, but yet then the copies

32:15: become really important. Another one

32:16: that I have used before is the um the uh

32:21: CNN election data, right? So here is

32:24: >> uh now you actually see it under XHR,

32:25: right? And so you here's some results

32:27: from Virginia from from we had elections

32:29: in November. And you can see that all

32:31: these different hits, you know, the

32:32: different rate, every every race is a

32:34: different link basically, AGBA,

32:37: lieutenant, you know, attorney general,

32:39: lieutenant governor, go uh I'm sure I

32:40: guess GG is governor. Um, and so this is

32:43: similar thing and you can get and you

32:44: can get it. I think it this is like full

32:46: data by county, right? So you could

32:48: probably download this from the county,

32:49: but this is a nice JSONified version.

32:51: Same deal, right? You can copy as curl.

32:54: Um, you can, uh, bring over to Postman

32:57: or your or Insomnia or your favorite

33:00: your favorite thing, you know, import

33:02: it, edit, you know, this one actually

33:05: has looks even has a little secret API

33:08: key here. Um, and then you can, you

33:10: know, do the same thing. So, I' I've

33:11: Well, doesn't like this one.

33:14: Interesting.

33:15: >> Oh, it's good to point out that when you

33:16: paste into Postman, you are switching to

33:19: the headers tab. There's like six little

33:21: tabs down there. Oh, more than six.

33:24: Seven.

33:27: Did we hit one? That's not going to let

33:29: us.

33:30: >> Yeah, we maybe three or four not

33:31: modified. Interesting. It might I I

33:35: think it's it's not sending the data.

33:37: It's just telling us, oh, you don't need

33:38: to get this data in. So, I I'd have to

33:40: I'm going to have to do something to

33:42: say, no, really, give me the data

33:44: >> to like tell it that you want to

33:45: refresh. We had a lot of suggestions

33:48: like Reddit. Reddit is also they've made

33:52: it super hard. Um Lauren says ESPN might

33:55: be a good one. And SeatGeek, what is

33:58: SeatGeek? Ryan.

34:02: >> Ryan also made the point a lot of

34:03: websites that don't want you to scrape

34:05: their stuff are going to change their

34:06: endpoint URLs pretty frequently so that

34:09: you cannot programmatically go through

34:11: because the it it's almost like a

34:13: revolving uh

34:16: what is it called when you uh VPN.

34:19: They're like, "We're just going to make

34:20: our IP not static and you can't hit us."

34:24: >> Yeah.

34:24: >> All right. So, we're on ESPN.

34:26: >> We're on ESPN. We are looking for

34:30: things and not There we go. Here's some

34:32: fetches.

34:34: >> Uh not seeing a lot of times, obviously,

34:36: some of the stuff you'll see here is

34:37: completely is not useful at all, right?

34:38: Like you're going to see JavaScript and

34:40: images. Here's some X jars. And some of

34:43: them will be there'll be data, but you

34:45: like, well, I don't really care about

34:46: this, right? Um, so you just have to

34:48: look through. It's hit or miss. Like

34:49: sometimes it'll work, sometimes it

34:51: won't. Sometimes you'll be like, "Yes,

34:52: this is exactly what I wanted."

34:53: Sometimes you're like, "Gh, I don't care

34:54: about this." Like this is not This is

34:55: just like this is what this is

34:57: information about the ads they put in

34:58: the ad carousel. Like I don't really

35:00: care. Um, let's look at Aaron Judge.

35:02: People get

35:03: >> so much of what I weigh through when I'm

35:04: doing this is ads

35:07: and like underlying information for ads.

35:10: >> Yes, that's all tucked away in there. um

35:13: uh with a lot of

35:14: >> how do you know that when you're finding

35:16: JSON because like when I'm looking

35:18: visually I can see the JavaScript it's

35:20: like JS and in other browsers it looks

35:23: different but how do you know from just

35:25: like the file structure that you're

35:27: clicking this might be JSON

35:29: >> well this one says JSON so I kind of

35:30: know that one's JSON that's not working

35:32: but I mean it usually JSON looks like

35:34: this it's like it's like got a kind of

35:35: like like a Python dictionary or

35:36: whatever so I just kind of click through

35:37: things and and like this is HTML right

35:40: this is JSON. This is I don't know what

35:44: this is. Some kind of list of of of

35:47: audio codecs. So that's not anything.

35:50: That's an MP4 file. So um you know uh

35:53: you just have to kind of keep looking.

35:54: And also you can look also you can see

35:56: that on here is a domain, right? So like

35:58: if the domain is whatever this is and

36:01: it's an MP4A, you probably that's not

36:02: going to be JSON, right? This is some

36:04: kind of what do you call it? Um content

36:06: delivery network audio file or whatever.

36:09: Um, so it looks like see looks like ESPN

36:12: has a ton of excl requests and there's

36:14: almost so many as that it's impossible

36:16: to tell what the heck any of these

36:17: things are. Doesn't look like they have

36:19: a lot of

36:20: um data.

36:22: >> I have found that the bigger the

36:24: website, the more stuff is crammed in

36:26: there and so sometimes a smaller website

36:28: that's a simpler website you will have

36:30: more luck with. But

36:33: >> the logging in thing is is not always a

36:35: barrier. So like um the KIA stuff I'm

36:38: sure that you have to log into that,

36:39: right?

36:40: >> No, you have you absolutely do. Yeah.

36:41: >> So that's a a instance where like you

36:44: can totally get in there. I recommend

36:47: just trying this. Like I'm interested in

36:49: this data. It could be data about you.

36:51: You could need to log in and try it.

36:54: >> So here's another

36:54: >> um Isabella asked if we can scrape

36:56: YouTube.

36:58: >> Um YouTube

37:00: >> YouTube rate limits you so fast though.

37:02: You got to be careful.

37:04: >> Yeah. I mean, all all kinds of people

37:06: are trying to write all kinds of things

37:08: to like help you like, you know, either

37:10: download YouTube videos or or or um or

37:13: playing without ads. And so, I don't

37:15: really know if there's a lot of data to

37:16: scrape there, right? I mean, I tend to I

37:18: tend to try this when I see I basically

37:19: see a table on the screen and I don't

37:21: want to scrape the table. I would rather

37:22: just

37:23: >> What about Wikipedia?

37:25: >> Wikipedia has an underly text, right? I

37:28: don't know. Are the tables in Wikipedia

37:30: constructed

37:32: constructed? I feel like the tables um

37:34: are pretty easy or sometimes easy to

37:36: scrape on beautiful soup, but then

37:37: sometimes I absolutely fail. Um yeah,

37:41: Dan says Wikipedia ends up being pretty

37:43: easy with CSS selectors.

37:45: >> There you go.

37:45: >> I think it depends on how the tables are

37:48: constructed.

37:48: >> I mean, this looks like it's server

37:49: side. I don't think this I don't think

37:51: these are ex requests because it's all

37:53: about where do they make the tables? Do

37:55: they construct the tables with

37:56: JavaScript on your computer or do they

37:57: construct them uh on the server? because

37:59: it construct on a server you just curl

38:01: you just download the the page directly

38:02: and then you use beautiful soup or or

38:05: whatever your favorite HTML parsing

38:07: library is. Um it's when they don't is

38:10: when it's it's when they don't do that

38:12: that that the they're going to have to

38:13: send the data as JSON and then you have

38:15: a chance to get it. I mean a fun one

38:17: that I like is and this is something I I

38:19: do with my friends a lot is we play game

38:21: we play cards on Cards Mania and um

38:25: let's see if it's going to work or not.

38:26: There we go. So, I realized a long time

38:29: ago, this is a game I played with my

38:30: friends a while back.

38:32: Um, uh, uh, that there is a hidden JSON

38:36: structure in the game history. Um, so

38:39: let's see. Sources XHR. Why is it not

38:41: working?

38:43: Should be here. I need to click on this.

38:45: There we go. Um, so here's So, so this

38:48: ridiculous JSON structure is basically

38:50: the entire history of this game of Oell

38:52: that we play. And so I wrote a bunch of

38:54: code to parse all this because this is

38:56: like telling you what order you played

38:57: the cards in. This is the queen of

38:58: hearts. This is the king of spades or

39:00: whatever. And uh and then I built a

39:02: whole website around it for my

39:03: colleagues and I to to to analyze how

39:06: how well or not so well we did uh when

39:08: we when we were playing against each

39:09: other in cards.

39:10: >> Um so that is that kind that might have

39:13: been the start of my whole journey of

39:16: JSON inspecting trying to find hidden

39:18: data structures. Um that one we just

39:21: basically do it in the browser and then

39:22: we have a interface to upload the file

39:24: and then I then I go through in

39:26: personal.

39:28: >> Yeah I will say just for anybody who is

39:31: watching and is not in the Discord um

39:34: chatting I thought I would give some

39:35: updates on what's happening there. There

39:37: are lots of questions about like

39:40: YouTube. Could we scrape YouTube? Um and

39:44: there are a lot of ways to do this.

39:46: YouTube has its own API. you can just

39:47: sign up for an API key um and go look

39:51: through stuff, but also like there is an

39:53: API I mean there's a a transcript

39:58: package for Python, but it's going to

40:01: like figure out that you're not a

40:02: browser pretty quickly and it's going to

40:04: block your API and you have to like use

40:06: a proxy to get around that. There's

40:08: instructions for it, but it can be

40:09: really complicated. I really suggest

40:10: like just going through the legit API.

40:13: Um, and then someone had asked about

40:18: allre recipes.com,

40:20: which I think is a great suggestion

40:22: because I wonder how they set things up.

40:24: All recipes might be one that's like

40:26: Wikipedia where it's like built on this

40:29: side.

40:29: >> Yeah, I would guess a bunch of I would

40:31: guess it's just a bunch of static text

40:32: that they generate in like a CMS or

40:34: something, right? As opposed to like a

40:36: bunch of data driven things. Let's see.

40:41: Sometimes it can depend on how the

40:42: website is organized to on on how

40:47: how prepackaged their data is for you in

40:51: JSON format. Like whether or not you get

40:54: one recipe or you can access like all

40:56: the recipes in nice nested JSON. You'd

41:00: be surprised sometimes it's

41:01: >> it looks like they it looks like there's

41:02: a little quick one just tells that just

41:04: like creates like some images like see

41:05: this is this is JSON but it's nothing

41:07: useful, right? It's like it's like links

41:08: to

41:09: >> like links to SVG files and then this is

41:11: just

41:12: >> JavaScript. I mean, the more text there

41:14: is, the less likely they are to to to to

41:17: I mean, the reason why they like to do

41:19: server side rendering of tables,

41:20: especially pretty tables, is because I

41:22: think it's I'm guessing it's more

41:24: performant to just here's a big JSON

41:26: structure of numbers, you on your site,

41:29: you your computer with its, you know,

41:31: um, uh, CPU of memory or whatever, take

41:35: those numbers and turn it into this

41:36: pretty table, right, locally on your

41:38: computer. So I think that is the impetus

41:41: for this kind of you know backend. You

41:43: hear a lot about back end and front end

41:45: developers. Well the front end

41:45: developers are writing the JavaScript

41:46: that makes a pretty site and the backend

41:48: people are making the servers that that

41:50: that you know send you all of this uh

41:53: all of this JSON data.

41:55: >> We mentioned uh Wikipedia. Jason says

41:57: that there is a Wikipedia R package

42:00: which I have never used before. Uh, but

42:02: that's like the good thing about having

42:04: a website that actually has a dedicated

42:06: API for it too is like sometimes people

42:09: have built rappers for you so you can

42:10: just access stuff.

42:13: Um, and then someone had also said

42:16: Isabella said that there is a Goji Plus

42:20: package by Goji Plus called Tuber which

42:23: has like a get captions thing for for

42:26: YouTube. So you could go explore that. I

42:29: will also say that the Ragnar package is

42:32: I think maybe going to get an update

42:35: that will help you more easily grab

42:38: YouTube captions. Um, don't quote me on

42:41: that. If it doesn't happen, I'm sorry,

42:44: but yeah, watch the like Ragnar package

42:47: space because I myself really really

42:49: want to build rags on YouTube like

42:52: transcripts. That would be amazing.

42:56: >> What are we looking at now? Is a seat

42:58: geek. This was Ryan's suggestion.

42:59: >> I was looking at the chat trying to see.

43:01: Okay. Trying to see. Let me refresh.

43:03: >> I don't even know what SeatGeek is. Is

43:04: this for tickets to concerts?

43:06: >> Yes, it's like a secondary ticket market

43:08: sort of deal. You know, like you can you

43:10: can sell your tickets on there.

43:12: >> No, there's some interesting stuff here.

43:14: We got a whatever this this looks like

43:16: some event.

43:18: >> So, this is not like ticket master. This

43:20: is like

43:21: >> this is like this looks interesting.

43:22: >> For tickets.

43:23: >> And then there's an affordable events

43:24: endpoint, right? And then looks like it

43:25: has more things like some bas looks like

43:27: some basketball games. Um, and then

43:31: we've got there's quite a few things

43:32: here. It's worth playing with if you're

43:35: interested in this sort of thing. Um,

43:37: >> I think this one might be interesting. I

43:39: think feel like there's all kinds of

43:41: frustration around the ticket prices

43:43: lately and ticket availability.

43:45: >> Someone in the chat was saying they had

43:47: scraped something to help them figure

43:48: something. What was it? Someone in one

43:49: of the early posts. Let me go back to

43:51: the beginning of the of the day

43:55: >> of our wild chat. Ryan, it's a ticket

43:57: master alternative or is it like a

43:59: reseller? Can you resell on ticket

44:01: master

44:06: wild

44:10: um and Ryan said that he just did a

44:12: Ragnar run, so hearing Ragnar is giving

44:13: him some PTSD.

44:16: I my our family has a ranch where we

44:19: actually host Ragnar runs.

44:21: >> It was Kevin. He said he scraped used

44:22: car websites. Hey, I work at CarMax. I I

44:24: don't know if I approve of this. Uh so

44:25: you could get a decent [laughter] so he

44:27: could get a decent deal on his truck. I

44:29: mean there are I mean I mean this is

44:31: something that businesses do deal with.

44:32: We do you do see if you are a business

44:35: you don't really want people scraping

44:36: all the prices off your site. Um but if

44:38: you are a business you want you would

44:39: like to scrape all the prices on your

44:40: competitor's site. So it is a tension

44:41: there of uh you know you would like to

44:44: know what your what your competitors are

44:45: doing um but you don't really want

44:47: people to know what you're doing but of

44:48: course I mean it's kind of it's hard to

44:50: stop right there's a meme somewhere

44:52: about about uh API users versus uh

44:54: website scrapers um if I can find it

44:58: >> what are the benefits of using this over

45:02: going straight to something like

45:03: beautiful soup or so so you're like okay

45:05: I have this website that I want to

45:07: scrape and you don't know anything about

45:08: this inspect side you're just like ah I

45:10: just know that I want the data off of

45:12: this website and I see some tables and

45:14: graphs and I think they're being made by

45:15: data. Um, what's the advantage of doing

45:17: this versus hopping straight into

45:19: something like beautiful soup?

45:20: >> Well, the one is the data is if you do

45:22: this way the data is structured, right?

45:23: You don't have to you're not trying to

45:25: figure out, you know, find every TD

45:27: cell, you know, I know people use

45:29: beautiful suit, but like you're I mean

45:30: pandas has a built-in like find table on

45:32: a website thing. So, that sometimes can

45:34: work. Um but fundamentally the big the

45:37: main thing is is that if you try and

45:38: just download you know a website you get

45:41: a link to a website you can read and you

45:43: try and just download that directly with

45:45: requests or hitter or whatever there

45:48: won't be anything there because because

45:49: you don't have JavaScript running to

45:51: ingest the data and assemble it. So you

45:53: have to do something like selenium or

45:54: whatever which is essentially running

45:55: your web browser for you. The web

45:57: browser is downloading the thing it's

45:58: the JavaScript is turning it into into

46:00: beautiful soup and then you were turning

46:01: it back into data. So, so if so, why why

46:04: go from data to HTML back to data when

46:06: you can just go straight from data to

46:07: data? That's kind of my philosophy. Um,

46:10: again, there are some sites where there

46:11: is no data stream where the server is

46:14: sending you the table in which case you

46:15: do have to kind of scrape the deal away.

46:16: So I think I think baseball references

46:19: like that for example I was trying to

46:20: get some I was trying to do I was trying

46:22: to figure out people were saying that

46:23: the one of the World Series games was

46:24: like one of the best games ever and I

46:26: wanted to you can take that win

46:27: probability kind of zigzag and like

46:30: integrate it and figure out like how

46:31: much basically how much how crazy the

46:34: game was by how much swings there are.

46:35: And so I was trying to do that and I

46:37: think I had to do old school beautiful

46:38: suit parsing because um there wasn't a I

46:41: don't think there was like a API call

46:42: that they were doing if I remember that

46:43: correctly. Yeah, I feel like getting um

46:45: info off the getting data off the web is

46:48: kind of like knowing more than one

46:49: language. It's really useful to know how

46:51: to do it in more than one way because

46:53: you are there's not one thing that's

46:55: going to work across everything. I did

46:57: want to point out one more time, Ryan

46:59: had put it in the chat. I will put it

47:00: back in the chat again that if you are

47:03: using R the RV vest package did not have

47:06: this initially but it is new and

47:08: exciting and it's the um read HTML live

47:13: function which does what Marcus just

47:16: described selenium does um when you run

47:19: this it opens a headless browser on the

47:22: underside for you pretends that it's

47:25: Chrome using in Chrome mode I think and

47:26: then that way it can like

47:30: actively look at something that before

47:32: you wouldn't be able to, right? You

47:33: would you were be trying to get

47:35: something that's static, but you were

47:36: looking at something that's live. You're

47:38: getting an error. You have to use

47:39: Selenium to do this. You can now do it

47:42: in just RS, which is really exciting.

47:44: So, definitely go check that out. Um,

47:47: Summer Hijazzi has a YouTube video about

47:49: this. He he put out a little update.

47:51: That's how I learned about it. So,

47:53: definitely go check his YouTube channel

47:55: and I'll see if I can find his channel

47:56: and link it.

47:59: looking through the I'm looking through

48:01: the chat. See if there's anything

48:02: interesting.

48:04: >> Um, I'm going to go find that.

48:06: >> Sorry, Isabelle. I I now see Isabelle

48:08: saying to make the the make the postman

48:09: window larger and too late. [laughter]

48:12: >> I think we did. I think we did. And we

48:14: we checked back in and we were like,

48:15: "Hey, it's it's working now."

48:17: >> Yeah. Um, I don't know why this one

48:18: isn't working. I'm a little upset that

48:19: Oh, there we go. There's some data

48:20: there. I guess they I guess we hit the

48:22: refresh limit. So now you can see the

48:23: structure data from the from this uh

48:26: governor's uh governor from I think it's

48:27: going to be every race anyway the recent

48:30: elections here. I um I've used this one

48:32: before too. It actually even says

48:34: politics.appi.cnn.io

48:35: and it's so clear it's obviously an API.

48:37: >> Um

48:38: >> you have So you said that you have a

48:40: website where you do stuff for Virginia

48:42: races.

48:44: >> Oh um yeah. So they actually have a real

48:46: API so I don't have to I don't have to

48:47: scrape I used I used to have to scrape

48:49: things. Um it's it's for it's for

48:51: legislation. It's this guy. It's called

48:53: recorded boat. Um but um I don't have to

48:56: I don't have to pack anything. I used to

48:58: have to scrape one couple of pages, but

49:01: with the new API, I don't have to

49:02: anymore. So all this is coming from a

49:03: real API. I mean I I hit it once a day

49:05: or whatever. This is all coming from a

49:07: real API. This is also probably hard to

49:08: see. Just

49:09: >> Brian had asked if the

49:13: I guess the read html live works on

49:16: shinyapp.io/positcloud

49:18: because our selenium didn't work. I

49:20: don't know.

49:22: Yeah, I mean anytime anytime you're

49:23: having to run Selenium, I feel like I

49:25: feel like you've lost. I mean, I don't

49:27: know. I mean, I mean, sometimes it's

49:28: necessary if you if you really need like

49:30: a particular site, but um uh like if

49:33: you're running a headless browser and

49:34: you're turning and you need like you you

49:36: basically need the JavaScript to run,

49:38: then I feel like there's probably some

49:39: hidden struck data structure there that

49:40: you you'd rather tap into instead. And

49:42: that's not necessarily always true, but

49:44: it feels like I I try and avoid

49:46: selenium, right? If I I either want to

49:47: just use request.get get to beautiful

49:49: soup or I want to go look for the this

49:51: the hidden API. Um um I I try to avoid I

49:56: personally I don't think I I think the

49:57: last time I tried to get slend to warn I

49:59: wouldn't I it was complaining about

50:01: something and so I didn't even I didn't

50:02: get very far.

50:03: >> I definitely

50:04: >> maybe other people have maybe I'm just a

50:06: bad luck. I have like a

50:08: >> not um

50:10: >> Dan says plus one if you're using

50:12: selenium prepare for sad. [laughter]

50:16: That's why this is so like learning how

50:19: to dig through these tabs and stuff um

50:21: is so so valuable because you can avoid

50:24: that roadblock of sad sometimes.

50:27: >> I like how four different people

50:28: mentioned said Electron when I was

50:30: trying to remember what Electron was

50:31: called.

50:32: >> Yeah, everybody everybody figured it

50:34: out. Well, I wanted to see if I could

50:37: like log into LinkedIn.

50:39: >> You can go

50:40: >> and and not show you guys all of my

50:42: stuff. [laughter]

50:44: I think that I can as long as I don't

50:46: click anything. Um, and then I can show

50:49: you guys what it actually looks like if

50:51: I do attempt. Um, okay.

50:56: Because I I have no shame and I don't

50:58: really mind people seeing my stuff. All

51:02: right, let me share my screen really

51:03: quickly. I know that we're at the end

51:04: and just

51:07: attempt Marcus can be my guide.

51:10: All right, I'm on Chrome. Nobody hate

51:12: me. Um,

51:15: I'm going to inspect

51:20: and then I'm going to go to the network

51:21: tab here.

51:22: >> The one that might the thing that might

51:23: be interesting is like click on like

51:24: your network or something like click on

51:25: my network to see all the people you're

51:27: connected to if you if you're willing to

51:28: do that cuz that uh that might have some

51:32: interesting

51:33: >> Oh, wow. Look at all the things. Notice

51:34: as I'm like going down and it's loading

51:37: because you have to load more. You're

51:39: going to get more. So you're not going

51:40: to get the full like

51:42: >> Yeah. Well, there might be a a

51:44: paganated. So some here's another trick

51:46: which I didn't talk about. I should have

51:47: I should have thought about this more.

51:48: So sometimes you will do something and

51:50: you'll find an API endpoint and you'll

51:53: copy it and it'll only show you 50

51:55: results and you're like, "Huh, that's

51:56: weird." But if you start fiddling with

51:58: the request and the payload, you might

52:00: be able to like work around that limit,

52:02: right? Like it might be it might have a

52:03: setting like you know uh you know

52:06: >> a max. Yeah, it might have a max or a

52:08: limit that you can change.

52:09: >> Um, and if we go back to like the

52:12: regular page here

52:15: and I'm going to do my command R to

52:17: refresh.

52:20: >> Hey, GraphQL. Click. Why don't you click

52:22: one of those GraphQL ones so people can

52:23: see the hellscape that is GraphQ? Sorry,

52:25: the uh

52:26: >> Oh, no. It's all like it's

52:28: >> Well, that's that's the that's just

52:29: that's just on that's just JSON. If you

52:31: click on preview, I think that'll look

52:32: okay.

52:33: >> Well, not that. Okay. But copy the um

52:35: but copy the uh actual link like copy

52:37: the uh the

52:39: >> what do you call it?

52:39: >> This one.

52:40: >> No, sorry. Get the the curl command for

52:42: that. For that one,

52:44: >> you're going to have to guide me.

52:46: >> Right click on one of the GraphQL query

52:48: things on the left. Right click on that

52:49: and then copy as curl, right?

52:51: >> Okay.

52:52: >> Cuz GraphQL is like a weird like SQL

52:55: like thing.

52:56: >> I don't have anywhere to stick this.

52:58: >> I just put it in a text file somewhere

53:00: or um so we can see what GraphQL looks

53:02: like. GraphQL. I am not a fan of

53:04: GraphQL. Does anyone anyone in the chat

53:05: like GraphQL?

53:08: >> I have no opinion on GraphQL.

53:10: Whoa. What am I looking at? Why is this

53:13: so ugly?

53:14: >> That's an excellent question. But those

53:16: all cookies.

53:17: >> This is the cookie. This is [laughter]

53:18: all cookies.

53:19: >> A lot of cookies.

53:20: >> Like if I got rid of that. How many

53:23: cookies?

53:23: >> I'm trying to see what the actual

53:24: payload is. I'm trying to see what the

53:25: actual payload looks like. Can you

53:26: scroll down a minute?

53:27: >> Yeah.

53:28: >> Uh I don't actually see a payload. So

53:30: weird. Anyway, GraphQL is kind of this

53:34: quasi SQL like language that you can um

53:39: that that some APIs use. And so instead

53:41: of writing um instead of there being

53:44: like a JSON payload or a bunch of

53:46: question marks in the in the in the in

53:48: the URL, there's like this kind of quasi

53:50: SQL JSON language you have to write. Um

53:53: and it's I really don't like it.

53:55: >> Yeah. But if you do hit something

53:57: pageentated um and YouTube's API is a

54:00: great example. it's like 50 per per

54:02: page, whatever, it's going to give you a

54:04: token that corresponds to the next page.

54:07: And then when you write your loops or

54:09: whatever you're doing, um, you just have

54:12: it take that token for the next page and

54:14: insert it into the next page token of

54:16: whatever your API call is and you can

54:18: page through it that way. Don't let that

54:21: stop you. Like use chat GBT to help you

54:25: navigate the pageionation stuff and

54:27: understand it. Um, that had really

54:29: really slowed me down when I was first

54:31: hitting APIs. I was like, I hate

54:33: pageionation. It drives me crazy. Um,

54:35: it's so funny that Josh Dmer was the one

54:37: that popped up on LinkedIn because he's

54:39: going to join us on the hangout on

54:40: Thursday. If you're a Josh Starmer fan,

54:41: come hang out with us on Thursday. Last

54:43: hangout of the year. It's going to be

54:44: fun.
