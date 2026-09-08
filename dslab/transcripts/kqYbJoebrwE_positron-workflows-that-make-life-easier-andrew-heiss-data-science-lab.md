---
type: Video Transcript
title: "Positron workflows that make life easier | Andrew Heiss | Data Science Lab"
description: "I'm excited to introduce our featured guest today on the lab, Andrew Heis."
resource: "https://www.youtube.com/watch?v=kqYbJoebrwE"
tags: ["ds-lab", "workflow", "github", "tidyverse", "apis"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T21:59:18Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=kqYbJoebrwE"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2026-02-18T00:00:00Z"
    usage_count: 3492
usage_window: { from: "2026-02-18T00:00:00Z", to: "2026-09-08T21:59:18Z" }
---

# Transcript

00:07: I'm excited to introduce our featured

00:10: guest today on the lab, Andrew Heis. You

00:12: probably know him from his blog. I

00:14: certainly do. Andrew, would you like to

00:16: say hello? Introduce yourself.

00:19: >> Hi. Um, so this is exciting seeing all

00:21: these people. Um, so I'm Andrew Heis.

00:23: Um, I'm an assistant professor at

00:26: Georgia State University in Atlanta. Um,

00:28: I do our stuff. I teach data

00:31: visualization, causal inference type

00:33: stuff. Um, if you're on social media,

00:35: you've seen me there. Um, I was on

00:37: Twitter for years and then it died. And

00:40: so now I'm on Blue Sky and kind of

00:42: LinkedIn, but mostly Blue Sky. Um, and

00:45: have a blog. Lots of people use it. Um,

00:47: I have lots of teaching websites that

00:49: you may have seen. Lots of you like have

00:51: copies of them and that's awesome. Um,

00:53: and I always like stumble on random like

00:56: class websites and it's like my stuff

00:58: and it's always fun to see that. So,

01:00: copy my stuff everybody. This is cool.

01:05: >> You heard it here first. Copy his stuff.

01:08: Um, I feel like that's, you know, the

01:10: open source community. We're all about

01:12: it. All right, Andrew, what are you

01:15: going to be showing us today? And if you

01:17: would like to go ahead and start sharing

01:19: your screen, you can do that at any

01:20: time.

01:20: >> Yeah, let me share my screen. So, in

01:23: general, so um this is my first time

01:25: ever actually being at a data science

01:27: lab. I've been to a couple hangouts and

01:28: those are like more formal, but this is

01:30: like just showing cool stuff. Um because

01:33: lots of people ask me all the time like

01:35: how I do stuff so fast. And one, I

01:38: don't. It just looks like it. Um but

01:40: two, I have like lots of cool little

01:42: programs and extensions and things that

01:44: I use a lot. And so, um, I switched to

01:48: Posatron like, um, in September 2024,

01:53: like a few months after it first came

01:54: out. And so, I've been using that

01:55: full-time, um, for the past almost 18

01:58: months now. And so, I have lots of cool

02:00: little tips and tricks that I've

02:01: stumbled across over the past year and a

02:03: half of doing that. And then just other

02:05: general neat things that make life

02:07: easier. So, that's kind of what I'm

02:10: gonna show you all today and answer

02:12: whatever questions you have. So um

02:15: >> excited.

02:16: >> So let me share my screen here and

02:19: switch away from Posatron. Oh um so I

02:22: actually in the spirit of just sharing

02:24: everything um if you go to my blog now

02:27: there is a post with all of the links to

02:30: the things that I'm going to show. Um

02:32: and so I also put that in Discord just

02:36: now. Um so you can get to it directly

02:38: that way too. Um but also just ask

02:41: whatever questions you have. Um, so in

02:44: general, like um, Libby and I talked

02:46: about this before, kind of the general

02:48: outline for this. And so, um, what we

02:50: wanted to start off with was just

02:53: general Posetron stuff, how to find good

02:55: extensions, how to, um, do some fancy

02:58: neat things with with like the

03:00: connections pane and positron, other

03:01: things like that. Um, and then we'll

03:03: look at some other cool workflow things

03:06: that work both on Mac OS and on Windows.

03:09: Um, so if I'm a I'm a Mac person, but if

03:11: you're a Windows person, you can still

03:12: do all of this cool stuff, too. Um, so,

03:16: um, first I wanted to talk about the

03:18: extensions. Um, because this is

03:20: something I've noticed a lot. Um, I I

03:23: still have not switched to R to Posetron

03:26: when teaching R. I'm still using R

03:28: Studio in part just because um, VS

03:30: Coderon is kind of a a bigger beast

03:33: because it works across like all

03:35: languages, not just R. Um, and so with

03:38: students, I find that it's easier to

03:40: just stick with our studio and then near

03:41: the end of the semester, I point them to

03:43: Posetron and say, "Hey, this is a

03:44: thing." Um, and so with with R Studio,

03:48: that ecosystem is like related to the

03:50: general R ecosystem. So all of like the

03:52: R Studio add-ons, we tend to like

03:55: inherently trust them because it's

03:56: people in like the R community making

03:58: little add-ons like GG Theme Assist and

04:01: other neat things that let you do cool

04:03: stuff. Um, and so I've rarely run into

04:05: people like worried about installing

04:07: extensions or add-ons in R Studio, but I

04:11: have run into that with um, VS Coderon

04:15: in part because that's a huge community.

04:17: Um, it's people who do like Rust

04:19: full-time or JavaScript full-time and

04:20: then they make their own extensions and

04:22: so like I don't know any of those

04:23: people. Um, and there's no like crayon

04:27: that like vets everything. And so I'm

04:29: not necessarily worried about like

04:32: malicious code showing up in the

04:34: different extensions. Just like how well

04:35: the extensions work. And so one thing I

04:37: wanted to show really quick is just kind

04:39: of how I can tell if stuff like if an

04:42: extension is good and safe to install. I

04:45: have like a few heruristics here. So

04:47: like this right here, this better

04:48: comments thing. Um, it's on. So, the

04:51: Open VSX extension store is like the

04:54: open source version of the VS Code

04:56: extension store. Um, but all of those

04:59: extensions live at GitHub. Um, and so

05:03: I'll I'll check like if I come across

05:05: something like this better comments

05:06: thing. Um, I look and see what it does.

05:09: It's got cool screenshots and stuff.

05:10: That's neat. And so it'll do special

05:13: syntax highlighting if you have like a

05:14: to-do comment or other types of

05:16: comments. Um, but then I also check to

05:18: see if it's highly rated. The Open VSSX

05:21: ratings are like useless. Um, because

05:24: very few people actually use this thing.

05:25: So, it's got like 100

05:27: >> I've never used it.

05:28: >> Yeah. Like I the five people have

05:30: clicked on five stars. Neat. Um, but

05:32: like tons of people have downloaded this

05:33: thing. So, sometimes I'll even look at

05:35: the the repository or the the extension

05:37: on VS Codes um store just to see what

05:41: people there are saying about it. Um,

05:43: because the the Open VSX world is kind

05:45: of dead. um because nobody comments

05:48: there. Um but I'll also look at like the

05:50: GitHub repository for it just to see

05:52: this hasn't been updated in four years.

05:54: Um it's got a bunch of issues still that

05:57: are fairly recent. Um and nothing's been

06:00: changing. But all it really does is

06:03: change syntax highlighting for stuff. So

06:05: I'm not super concerned if it's not

06:07: super updated because it doesn't do

06:09: much. Um, if it's something more

06:12: important, more complex, and it hasn't

06:13: been updated for a while, then I'll just

06:15: like not. Um, I'll still like install it

06:17: and play around with it, then generally

06:20: it'll be like really buggy if it hasn't

06:21: been updated for a while. Um, but those

06:23: are my general heristics. I'll look at

06:25: like the Open VSX page, check the GitHub

06:28: page, check the VS Code version of it,

06:30: and see what people are saying about it,

06:32: and then if it looks cool, I'll install

06:34: it and play around with it. Um, so

06:36: that's that's my general process for for

06:38: doing that. Um,

06:40: >> okay. Sweet. Now I'm going through and

06:41: clicking on all of mine that I've added

06:43: in the past couple of months and like

06:44: inspecting them.

06:46: >> Yeah, I do that too. Like I'll I'll go

06:48: through like I forget what I've

06:49: installed and if I'm not like using it,

06:51: um, I'll go and disable it or uninstall

06:54: it. Um, but I always forget what I've

06:56: turned on. Um, so it's useful to go back

06:59: and check stuff. Um, cool. So, some of

07:03: the the good ones that I found, um, I

07:06: put error here just because it's neat,

07:08: but it's built into posetron. So, this

07:09: is the the automatic code formatter and

07:11: llinter. Um, some people actually have

07:14: there's a setting in in positron where

07:16: you can have it run every time you save

07:18: a file. I don't want to relinquish that

07:21: much control to to computers like

07:24: reformatting my code every time I save,

07:26: but some people do and that's cool. Um,

07:28: what I mostly use it for is like if I

07:30: have code, let me just grab some code

07:33: like ggplot

07:35: and then aes. Wow, we'll zoom in a bit.

07:40: So, I'll do something like aesx equals

07:43: something plus gm point. Okay, so that's

07:47: like horrific our code there. Um, if I

07:49: just select it and then do

07:51: commandshifta,

07:53: it will reformat it using air. Um, and

07:56: follow all of the the fancy tidyiverse

07:58: rules. There are other settings you can

07:59: change with air. The documentation shows

08:01: how to do it. I haven't messed with any

08:03: of those. I'm happy with that and it

08:05: works. Um, it has cool heristics, too.

08:08: Like if it sees that I have like the

08:10: data set on a new line and then I run

08:12: it, then it assumes I want all of the

08:14: arguments to be on new lines and so

08:16: it'll update that automatically. And so

08:18: error is really cool for that. Um better

08:21: comments. I already showed like if you

08:23: have a if you have some comments here

08:26: like neat this is

08:30: a comment and then later I say to-do

08:34: this is important. Notice how it's like

08:36: orange. Um and that just automatically

08:38: got picked up because I have that better

08:40: comments extension turned on. And so it

08:42: recognizes a bunch of other things. Um,

08:44: I basically only really use to-do um

08:47: because I forget what the others are.

08:48: Um, but I should probably eventually

08:50: learn what they are because they're

08:52: cool.

08:52: >> I use to-do a lot, so this is really

08:54: useful. I want my to-dos to stand out or

08:56: I want them to be put into a list for me

08:59: somewhere.

09:00: >> Yeah. And there are other extensions

09:01: that will give like a little pane in the

09:04: side here that will list like all your

09:05: to-dos. I think one is called to-do

09:07: tree. Um, I had that on for a while, but

09:10: what I ran into there is it picks up

09:13: everything in a folder. And so if you

09:15: have like quarto extensions or our end,

09:19: actually this ran this was an issue

09:21: because you have like whole copies of

09:23: like our packages. And so if other

09:25: people are using to-dos in like

09:27: extension files, then those also appear

09:29: in like the list of everything you have

09:31: to do. And so there's ways of like

09:33: filtering those out and omitting certain

09:34: folders, but I always like am too lazy

09:36: to do it. Um, and so my lazy way of

09:40: doing it is I just like search for to-do

09:43: and there's all the to-dos in my

09:45: project, which is like the the poor

09:47: man's way of doing it, but there are

09:48: cool extensions that let you do it. Um,

09:52: cool.

09:53: >> I don't even know how you search in that

09:56: sidebar. Like, I've never clicked that

09:58: button before until you just clicked it

10:01: and I was like, "Oh, there's a search

10:02: button there." [laughter]

10:03: >> Yeah. So, there's there's a search

10:04: button. It's uh command shift F or

10:07: control shift F. It will um

10:09: >> That's what I usually do. Yeah. Keyword.

10:11: >> Yeah, but it's it's here. That'll search

10:13: the whole project. Oh, um notice how

10:15: this is up at the top. Isn't that cool?

10:18: So, this is brand new.

10:19: >> Um as of like earlier this week. So, if

10:22: you are in Posatron with this explorer

10:24: thing here and you rightclick, you can

10:27: change the activity bar position. By

10:29: default, it's over on the side. This is

10:31: typically where everybody sees it. Um,

10:33: and that is extra real estate over on

10:36: the side here. And so if you rightclick

10:37: and say top, then it puts it up at the

10:40: top and then you have extra space with

10:42: the file thing. Um, which is

10:44: >> really I love it. And you can get there

10:46: with um control shiftp, command shift p

10:49: >> recording.

10:51: >> I fixed it. Uh, you can uh just type in

10:53: activity and I think you get your like

10:57: Yeah. Move activity bar to side.

10:58: >> Activity bar decider bottom.

11:00: >> Yeah, cool. I' Although I feel like

11:03: there are a couple other ways to do

11:04: this. Just know that you can you can get

11:06: to it multiple ways, y'all.

11:09: >> Yeah. Oh, so Tyler in Discord says it'll

11:11: search everything in the project even if

11:13: you don't have it open. Yes.

11:14: >> Um so like here's a big project. This is

11:18: my website here. So if I search here for

11:21: I don't know Tidyverse.

11:24: Um it's in 118 different files. I have

11:27: the word Tidyiverse in this whole

11:29: project here. Um,

11:31: >> if you click them, do you get to them

11:33: just like in our studio?

11:34: >> It'll Yep. So, it'll jump to it there.

11:37: Nice. Um, it also, if you click on this

11:39: little thing, you can do a find and

11:40: replace thing. And so, I could call it

11:42: like I think way back in the day, people

11:44: were trying to call it the head. So, we

11:46: could like I could click on that button

11:48: right there and that would replace all

11:50: in the entire project. Um, which is

11:54: terrifying. I'm not going to click on

11:55: that.

11:55: >> Don't do that.

11:56: >> Um, you can do like regular expression

11:58: stuff. You can tell it which folders to

12:01: exclude or include. You can be more

12:03: careful about what you're searching

12:04: there. But yeah, that search stuff is

12:07: neat.

12:08: >> Cool. Thank you for indulging our search

12:10: questions.

12:11: >> Yeah, I know. I It's It's a super cool

12:13: thing. Um, all right. So, other things.

12:17: Um, so the better comments, one really

12:20: cool thing is this one called pastm or

12:23: pasteum. I don't know what it's

12:25: officially called. Um, this is so cool

12:29: and very few people know about this. So,

12:31: get ready for some magic. So, if you

12:34: like select some like a spreadsheet from

12:36: Excel or just like copy a table from

12:38: HTML or something and then if I come to

12:41: like positron here, let me move this out

12:43: of the way. And then if I paste it, it

12:46: pastes it like this. It's no longer like

12:48: uh tab separated or anything. Um, but

12:52: what I can do is if I do if I open like

12:54: the command pallet thing and do paste

12:57: them, I can here show all of these paste

13:01: them. So I can have it paste as a Julia

13:03: dataf frame or a Python dataf frame or a

13:05: markdown table or an R data frame. And

13:07: if I choose our dataf frame, I can say I

13:10: want it as a tibble or a trible or a

13:13: data.table or polars or base. So let's

13:16: do a trible.

13:18: There it is. It's automatically a

13:20: dribble. Um or any other type of thing.

13:24: Let's see what it looks like as a data

13:26: table.

13:28: Yeah. So that's cool. Um and automatic.

13:32: So let me do that.

13:33: >> Thank you uh Miles McBain for being the

13:36: data pasta pioneer here. And then I

13:38: think that um paste was done to like

13:42: mimic data pasta by Anatoli I think is

13:46: his name. So, thank you Anatoli for

13:49: giving us that cuz if you haven't used

13:51: data pasta, it is an addin for our

13:54: studio, specifically for our studio. Um,

13:56: add-ins are like our studio's version of

13:58: these extensions and posetron. Um, and

14:01: it's magical and I love it. I use it all

14:03: the time. And so when positron first

14:05: came out, that was one of the things I

14:06: really missed. So, paste them.

14:08: Fantastic. Paste them. Paste them. I

14:10: don't know how I like paste them because

14:12: you paste things.

14:13: >> Yeah, you paste things.

14:14: >> Yeah. Um, cool.

14:18: CSV. Okay,

14:21: that's not spelled right. Okay, so what

14:23: I'm going to do here is show another

14:25: little extension called rainbow CSV. Um,

14:29: it's really simple. All it really does

14:31: is highlight different columns in a CS

14:34: in a plain text CSV file with different

14:36: colors. Um, so if you ever have to

14:38: manually like edit a CSV file or like

14:40: look at it, um, then that's helpful. So

14:44: like if I click on the CSV file here in

14:47: Posatron, it'll automatically add like

14:49: open the CSV file as um this cool data

14:52: explorer thing which is helpful but if I

14:54: want to like hand type in it like I

14:56: can't do that here but there is this

14:58: open as plain text file. So if I click

14:59: on that it'll open it as plain text but

15:02: notice how each of these columns now

15:04: have a specific color. Um and that's

15:06: coming from rainbow CSV here. So that's

15:09: helpful like if you ever have to

15:10: manually type something now you can see

15:13: um that that 15 is part of the this

15:16: column now and the 220 is part of the

15:18: sex column and everything's like messed

15:20: up now um and that's really visible with

15:22: that rainbow CSV thing um which is

15:25: helpful.

15:26: >> Amazing. Um, one other one, if you do

15:30: writing in Positron,

15:34: um, you might want like a spell checker,

15:36: like if you're doing like Quartto

15:38: writing and stuff, um, there are lots of

15:40: different spell checkers out there. The

15:42: one I like the most is called Spell

15:45: Write. Um, I have it linked here. it

15:50: is supposed to use the um builtin

15:55: spellch checker dictionary for your

15:57: system. So if you're on a Mac, it uses

15:59: the Mac um yeah, so it uses the system

16:02: spelling API. The Windows one uses

16:04: whatever Windows API it is. That's cool

16:06: because all the other ones I found use

16:08: like Hunspel or like open source

16:10: dictionaries you have to like keep in

16:12: parallel. And so like if you're on a on

16:14: a Mac typing in some other program and

16:16: you add a word to the dictionary that's

16:18: the same dictionary that that posetron

16:20: will use. And so you don't have to

16:22: maintain like separate dictionaries and

16:24: stuff. Um and so

16:25: >> so this is like if I am doing my

16:27: literate programming in uh corto and I

16:30: am writing actual like narrative along

16:32: with my stuff. It's going to do all of

16:34: my spellchecking for me.

16:35: >> Yep. So right there tidyverse is not

16:37: spelled correctly because it's not a

16:39: word. Um, [laughter] and so it's it has

16:41: that red underline there. There I think

16:43: there's a way I could add it to

16:45: >> to your like your Mac one, right?

16:47: >> Yeah. If I I think if I add it like if I

16:50: go to the spelling settings like in here

16:52: there's like spell right. So add

16:53: selection to user dictionary that I

16:56: think that adds it to the systemwide

16:58: dictionary. Um or it would put it in

17:00: some special like VS Code positron thing

17:02: but I'm not sure. It doesn't take into

17:04: account words that are in Word because

17:06: Word uses its own internal dictionary.

17:09: It doesn't use the Mac OS dictionary.

17:11: So, um, that's just words thing.

17:14: >> All right. Cool. Tyler, thank you for

17:16: that question. That was a good one.

17:18: >> Cool. And then the final little

17:19: extension thing I want to show is

17:21: related to um, another question I get

17:25: all the time and lots of like the whole

17:27: positron team gets is this notion of

17:30: projects. Um, so in R studio you have

17:33: the rproj file that lets you create like

17:36: an R studio project. So when you double

17:37: click on it, it opens a new R Studio

17:39: instance and sets the working directory

17:41: to that place. And it's great. Um, Jenny

17:43: Brian won't burn down your computer

17:45: because you're using the RPOJ things and

17:47: it's wonderful. Um, Posatron does not

17:50: have an equivalent of an RPOJ

17:54: file. Um, and there's actually like a

17:56: whole FAQ site or page on the Posetron

17:59: site about this. Um, what it does

18:01: instead is it follows the the same

18:04: philosophy as VS Code in general. like

18:06: if you open a folder in positron or in

18:09: VS Code, it sets the working directory

18:11: to that folder and then everything kind

18:13: of lives there. And so it's your job to

18:16: open a folder in positron. Um you can do

18:20: that like on a Mac, you can just like

18:21: drag a folder from Finder down into

18:23: positron and it'll do it. So here's a

18:26: random folder. I don't know what's in

18:29: here, but if I drag it to Positron,

18:31: done. That is now a project. um where

18:35: this working directory is set to that

18:36: place doesn't there's it's just CSV

18:39: files so it doesn't really do much but

18:40: that is how you kind of open a project

18:43: um positron has this upper corner menu

18:47: for recent projects you've opened so

18:48: these are just recent folders that

18:50: you've opened our studio has a similar

18:52: thing you can open the project in a new

18:54: window you can open the project directly

18:56: and replace the window but that's all

18:58: there you can also go to open folder um

19:01: there's probably a command thing here

19:03: called Open folder. Yep. You can do the

19:06: command pallet thing and open a folder

19:08: that way. And that all works. Um,

19:11: >> and you could also have multiffolder

19:12: workspaces inron.

19:14: >> So that I've never actually done. Um,

19:17: >> I've done it once and I got confused and

19:19: I and I removed it. But at least you can

19:21: do it. [laughter]

19:22: >> Yeah. So the the the way it it calls

19:24: that a workspace. So you can save a

19:27: workspace, which is either a single

19:29: folder or a set of folders that all open

19:32: up. Um, and then you can that is

19:35: actually a file. Um, and so like on my

19:38: personal blog, this is before I knew

19:40: what I was doing. So on my personal

19:42: blog, I have an RPOJ file and I also

19:45: have this code workspace thing. Um, this

19:48: code workspace file that is the

19:50: workspace. So if I double click on that

19:52: in finder, um, it would open positron to

19:56: that place. Um, but I actually never use

19:59: that anymore. I either drag it down or

20:01: there's a cool extension called project

20:04: manager

20:05: >> that lets you

20:05: >> I want to see this one

20:07: >> little shortcuts for different projects

20:09: you have on your computer and

20:12: >> but before we go there

20:13: >> Mhm.

20:14: >> I want to pause really quickly cuz Tyler

20:15: had a couple of good questions. Um,

20:18: there was one that might be for the

20:19: chat, which is, "Do you know if there

20:21: are extensions or maybe packages that

20:23: will conditionally format cells of dataf

20:26: frames exported to XLSX files?" I don't

20:30: know the answer to that. I have stopped

20:32: working in XLSX files. I haven't in

20:34: years, but if somebody else knows,

20:36: please let Tyler know in the chat. And

20:38: then also, Tyler also asked, "Do you add

20:41: explicitly add a dot here file to your

20:43: project route when you're working in

20:44: Positron?" I don't but that's because so

20:48: the the here thing so I do use the here

20:51: package all the time um and it has lots

20:53: of different heristics to figure out

20:55: where the root of the project is and so

20:58: um I I actually have used a here once um

21:02: because I didn't have any of the other

21:04: heristics. So there there are like a RPJ

21:07: thing or our project file. I'll

21:10: sometimes even keep those because I'm

21:11: like distributing stuff to students and

21:13: stuff. So that still exists. Um, most of

21:15: my repositories are git repositories and

21:17: so it looks for like a git folder. Um, I

21:20: think it looks for like a readme and so

21:22: it'll like there are other tricks. Um,

21:25: if I'm using like a brand new folder

21:28: with nothing else in it that would

21:29: signal what the root is, that's where I

21:31: do stick like a a dot here thing. Um,

21:35: but I've only done that a couple times.

21:37: Um, but that's another thing you can do.

21:39: Yeah,

21:41: >> thank you so much. All right, let's move

21:43: on to project manager.

21:44: >> Yeah, so project manager what it does is

21:48: it's a list of projects that you have

21:50: and you can actually so let me I'm going

21:52: to add this thing. So this is some

21:53: random folder. I think it's on my

21:55: desktop. It is. So I made this data

21:57: science lab desktop thing. So if I come

22:00: to the command pallet and search for

22:02: project manager, I can say save project.

22:07: Um and then I can name it something.

22:10: Sure. So now over in my project

22:16: manager pallet which is here I have

22:20: this. And so there's that data science

22:23: lab project. So I can just like click on

22:25: this guy and it'll open a new pro or a

22:27: new window with it in there. Um if you

22:29: right click on it you can actually add

22:31: tags to it. And so I have stuff like

22:33: sorted by research projects, by the

22:36: classes I'm teaching, personal stuff.

22:38: You can have whatever tags you want. So

22:39: it makes it easier to organize the stuff

22:41: you have in there.

22:42: >> Um,

22:43: >> so this added a button to your activity

22:45: bar.

22:46: >> Yeah. So it's um

22:48: >> Okay.

22:48: >> One of the things on the side here

22:49: called project manager.

22:53: >> Okay. So we install project manager. We

22:55: get a little thing with like folders as

22:58: an icon. And then that allows us to have

23:01: projects.

23:02: >> And the way you add projects, there's no

23:04: way to do it from here. Um.

23:08: Yeah. So you have to do it from the

23:10: command pallet. So you just search for

23:11: project manager save project and that

23:14: will take whatever folder you have open

23:16: and count that as a project. Um and then

23:19: it'll put it over on the side [snorts]

23:21: >> and then we can tag it with stuff. This

23:23: is

23:24: >> amazing.

23:25: This is so good.

23:28: >> Make it even cooler. So this is a little

23:30: preview of the raycast stuff that I'm

23:32: going to show. Um, the project manager

23:34: extension can connect to Raycast. And so

23:37: I have it set up where if I mash down

23:40: control, shift, option, command, so like

23:42: that whole corner of my keyboard and

23:44: then P,

23:46: um, it will bring up this and that will

23:48: actually search all of the projects that

23:50: I have in project manager. And so from

23:53: wherever I'm at on my computer, um, this

23:55: is just like raycast, which is a

23:57: thirdparty program application thing. I

23:59: can come and say I need to open my data

24:01: viz. um spring class and there

24:05: >> amazing and Sharon asked if you could

24:07: just show one more time how you add

24:09: those tags.

24:11: >> Oh, so add the tags. You right click.

24:13: Let me open project manager. So you

24:15: right click on one of the ones that's

24:16: added and then you can say edit tags and

24:19: then those are in there. I think when

24:22: you first install it, it has no tags and

24:25: you have to go into like the JSON file

24:27: to add the the tags you want to use.

24:29: Okay. Um, but then once those are there,

24:31: like it has says in the read me how to

24:34: do that. Once they're there, then you

24:36: can like check them and stuff.

24:39: >> Amazing. And thank you to everybody who

24:41: is helping out Tyler in the chat with

24:43: the XLSX uh conditional formatting

24:45: question. It's a fantastic one. And yes,

24:48: Tyler, if you've only started re using

24:50: Git recently, it might not be um a

24:54: default thought to be like, oh,

24:56: everything is going to have a git. But

24:58: it's a good idea any anyway for

25:00: everything to be tracked in git, right?

25:02: So if you always have a dog.getit in

25:03: your root folder, positron will always

25:05: know where the root is. It's a it's a

25:07: good way to know like if you've done the

25:09: right thing and remembered to track your

25:11: project.

25:13: Okay, we are at the halfway mark. We're

25:17: 30 minutes in. Um I wanted to have one

25:21: more question from the chat and then we

25:23: can hop to the next thing. Mileen asked,

25:26: "Hey, how did you discover all of

25:27: these?"

25:29: >> Great question. Um, randomly. Um, so

25:32: I've been using um, VS Code for nonr

25:36: stuff for years, like back um, in like

25:40: 2017, 2018. So like all the Python stuff

25:43: I do, I need general text editing

25:44: because it is nice like having multiple

25:46: cursors and doing all of that stuff. So

25:48: I do all of my R stuff in our studio and

25:50: everything else in VS Code. And so I've

25:53: known about other VS Code extensions for

25:55: years just by stumbling across them um

25:58: and reading random blog posts and coming

26:01: to things like this and seeing what

26:02: people are doing. And there's lots of

26:04: people on the Posit team

26:06: >> um that will like do blog posts about

26:08: neat things they do and extensions they

26:10: like. And so it's really just kind of

26:11: stumbling across this stuff.

26:13: >> Yeah. Oh, actually there's a extension

26:15: roundup that somebody put out. Isabella,

26:18: is it Simon who put together a like data

26:21: science plus extension bundle?

26:23: >> Garrick. Garrick.

26:25: >> Garrick. Okay. Okay. Garrick. So,

26:26: Garrick Aden Buoy put together a little

26:28: data science plus bundle. If I can find

26:30: it, I'll stick it in the chat. Um, and I

26:32: lied. We have one more question. Olrich

26:35: asked um how GitHub is integrated into

26:38: positron compared to using desktop

26:41: GitHub. I have never used desktop

26:43: github. I always use the terminal or I

26:47: would use um like the UI in our studio.

26:50: I like it in positron way better. It

26:53: gives me way more visibility and

26:54: transparency. So if you have a second to

26:56: change to like point that out, we could

26:58: do that.

26:59: >> Yeah. So this is um the source for my

27:03: data viz class this semester. Um and so

27:07: I just like put something here. It has

27:09: one of these panels here is the source

27:11: control panel. Um, and so it shows stuff

27:14: that's happened. So I can click here and

27:15: see what has been added. I can um I

27:19: could commit just this chunk here. If

27:21: there were other chunks, I could do that

27:23: or I could do the whole file and then I

27:25: can say whatever and then commit. Um,

27:28: and you can push to GitHub from here

27:30: too. Um,

27:31: >> yeah. Or just sync with you can click

27:33: the sync button and that'll do the same

27:35: thing.

27:36: >> Yep.

27:37: um though I

27:39: >> and then of course if you still want to

27:40: use your terminal it's right down there

27:42: at the bottom. Some people have actually

27:44: been telling me that they only use

27:46: keyboard commands to switch their focus

27:48: between console and terminal and I would

27:49: really like to figure out how to do that

27:52: uh sometime soon cuz I'm a keyboard

27:53: queen. I don't like clicking things if I

27:56: don't have to. But

27:57: >> okay so I actually do Emil had a blog

28:02: post a while ago about how to do that.

28:04: So, if you look at the website thing,

28:06: um, so I have all of my little settings

28:08: here, too, if you want to see them. But

28:09: there's this cool keyboard shortcut

28:11: section, um, where I copied from Emil

28:15: here. The blog post link is there. Um,

28:18: where, um, he has it set up where I can

28:21: like I've copied it where if I press

28:22: command

28:24: >> uh, period and then command one, two, or

28:27: three, it'll switch to those different

28:29: areas. So if I am like here typing, I

28:33: can say command period 2 and now I'm

28:36: down in the console. I can say command

28:38: period 3 and now I'm in the terminal and

28:40: command period 1 and now I'm back in the

28:42: editor. Um and so that's thanks to uh

28:45: Emil there and it's in Discord as well.

28:49: >> Thank you. Oh, I love it. Okay, 33

28:53: minute mark. How much further can we go

28:55: in seeing all of Andrew's positron

28:58: secrets? What's next?

29:00: >> All right. So, one last thing before I

29:02: show the cool connections panel is

29:03: notice how this window is blue. And if I

29:06: open up a different data viz thing, um,

29:10: so here's my fall one. It is red. That's

29:14: so cool. So, the the reason that works

29:16: is because there's an extension called

29:20: uh, peacock and that lets you set

29:23: project specific colors to your windows.

29:26: And I find this is super helpful because

29:28: I'm often um like copying the same

29:31: materials from a previous semester into

29:33: the current semester. And so many times

29:35: I've accidentally gone the other way and

29:37: like I will edit the previous semester

29:39: and push it and I don't see anything

29:40: live on like the current semester. Um

29:42: and it's so frustrating and I overwrite

29:45: stuff and you've probably all run into

29:46: that. Um, and so what I do is with the

29:49: peacock extension, if you install it,

29:52: you can tell it to be a specific color

29:55: for that project. Um, and so that's like

29:59: delightful. And so I will do that for

30:01: anything like anything that is kind of

30:03: like a a a long-standing project like a

30:06: class website or a research project and

30:08: I don't want to get confused about what

30:10: it is, I'll give it some color. Um,

30:12: >> I love this. I need visual cues for

30:14: everything, which is why I added the

30:17: like uh the branch, the project name,

30:20: the file name to the top of my Posetron

30:23: title part. Um because I need visual

30:25: cues all the time at where I am. I'm

30:27: perpetually on the wrong branch and like

30:29: I have had terrible problems with that.

30:32: So, this is really really helpful. I'm

30:35: I'm going to turn this one on for sure.

30:37: >> Yeah, it's it's great. I only discovered

30:39: it I think it was in Gayen's post um

30:42: about like the roundup thing and I was

30:44: like wow this is lifechanging and it is

30:46: life changing

30:47: >> also I will mention native tabs which

30:48: Isabella just mentioned in the tap in

30:51: the in the tap in the chat which we

30:53: learned from Dan who is usually here

30:55: with us today but he's teaching right

30:57: now this semester um definitely go check

31:00: out native tabs and turn that on it's

31:02: fantastic

31:04: >> oh is that like the next thing you were

31:06: >> No I just opened that from this do Yeah,

31:09: that's cool.

31:10: >> Very cool.

31:11: >> All right, so um the connections pane.

31:14: This is something that's really cool

31:16: that's unrelated to like extensions and

31:18: stuff, but um lost it.

31:22: So over on the side here, you have this

31:24: connections panel. Um R Studio has it

31:27: too. Um and I find this is really

31:29: helpful if you ever have to work with

31:31: databases, which I rarely do. Um, so all

31:34: of my stuff is just like academic

31:36: modeling with like CSV files and Excel

31:38: files. Um, but occasionally I will have

31:41: to do stuff with databases like

31:43: connecting to an SQLite database or a

31:45: MySQL database or a Spark thing or or

31:48: whatever. Um, and the neat thing about

31:51: Positron is it lets you like navigate

31:54: the database directly from from Positron

31:57: itself. So you can like see what the

31:58: tables are and see what's in there. Um,

32:00: which is super useful. Um because I like

32:03: some people love the command line for

32:05: like navigating SQLite databases. I

32:08: don't know how to do that. Um and so I

32:10: like like clicking on stuff and sorting

32:12: stuff and seeing what's actually in

32:14: there. And so the the connections panel

32:15: lets you do that. Um so on my little

32:18: website thing, I actually have a a blog

32:21: post tutorial showing in general how to

32:23: do it. Um I have these these two real

32:26: life use cases where I've done this

32:27: before because again I don't typically

32:29: do database stuff. Um, I did help the

32:32: state of Idaho make an election

32:34: reporting website back in 2024.

32:37: Um, and for that they have like their

32:40: own proprietary database system that I

32:42: couldn't access. And so what I asked

32:44: them for was like the column names in

32:46: that database. So I made my own like

32:48: fake version of it locally that I could

32:50: like play with and it was the same

32:52: structure and that helped. Um, but where

32:54: it's really helpful is I have this

32:56: current project that has a CSV file that

32:58: is zipped and when it's zipped it's 10

33:00: gigabytes. Um, and there's like no

33:03: possible way to load that into R. Um, or

33:06: you can but it like blows stuff up and

33:08: it's bad.

33:09: >> Um, and so one neat thing you can do is

33:12: you can shove this CSV file into a duck

33:16: DB file which does some magic

33:18: compression stuff um, and makes it work

33:20: really well. So once I get that 10

33:22: gigabyte file in duct DB, it's only like

33:25: 600 megabytes.

33:27: Um, and then you can do like queries

33:30: with it, which again I rarely use SQL

33:32: queries, but there's a DB plier that

33:34: lets you use dlier stuff to get stuff

33:37: directly out of it. Um, which is cool.

33:39: And so if you look at the code here, you

33:42: can actually see um so I connect to this

33:45: little duct DB thing and then I load a

33:47: CSV file, this massive thing, and then

33:50: stick it in the in the database and then

33:52: close it and then never have to do it

33:54: again. So I have the raw data in that

33:56: duct DB thing and then I can just access

33:58: it like a normal CSV file, but it's like

34:00: fast. Um so it's neat. Um so let me just

34:04: show you what that looks like in

34:06: practice. Um what the connections panel

34:08: looks like. And so I have the code here

34:10: on my little website thing. So I'm just

34:12: going to copy it and walk through all

34:14: the different pieces so you can see what

34:16: it looks like. So we'll just make a new

34:17: R file here. So Pettyverse. Great. So

34:22: what I'm going to do is connect to a

34:24: brand new duct DB file. If you've never

34:26: used DuckDB, that's okay. Um because it

34:29: it's just it's like my it's like SQ

34:32: Lite. It's like a single file thing that

34:35: holds stuff in it. So now I have this

34:37: cool file here called my fancy

34:38: database.duck db. Um it's just some sort

34:41: of um f I don't even know what it looks

34:44: like. I don't know if it's binary or

34:45: plain text. It's something um doesn't

34:48: matter because what I can do now is I

34:50: can copy to it. And so I'm going to

34:52: stick gap minder in there because why

34:54: not? Um I could stick diamonds in there.

34:56: I could stick whatever I want in there.

34:58: Um, and over here in the connections

35:00: panel, I can now click at that and then

35:03: look inside duct DB and kind of twirl

35:06: down here. And now I have gap minder

35:07: inside that database. And so I can click

35:10: on this and it shows in the data

35:12: explorer. So I can actually see all of

35:14: the data inside there, which is cool.

35:18: Um, you can use um DB pllyier to get

35:21: stuff out of it. So I can use this this

35:23: table function that will connect to that

35:25: database pull out that gap minder data

35:28: set. Um this will actually run filter as

35:32: an SQL command like it does some behind

35:34: the scenes translation into SQL and then

35:37: collect will bring it into R as a data

35:40: frame. So that is now GME 2007 but the

35:43: way it worked was grabbing it from the

35:45: database through some query collecting

35:47: the data and bringing it back in. Um and

35:50: then you can do stuff with it. um which

35:52: is cool. So that's all through this

35:54: connections panel here. Um that works

35:56: for

35:58: SQLite and MySQL and Postgres and Spark

36:03: and any database provider that works in

36:05: our studio or if you have like an OBC

36:08: driver thing on your computer, it should

36:10: show up here and you can connect it to

36:12: stuff. So

36:13: >> amazing. This is something I have

36:15: literally never used. I didn't use the

36:17: connections pane in R Studio either, but

36:20: I like you do not generally need to

36:22: connect to databases. I do sometimes,

36:24: but I just, you know, do it with code

36:26: with a con and and I move on. This is so

36:29: nice having a thing that you can

36:31: actually navigate in your way. Okay, a

36:34: question Tyler asked in the chat and I

36:36: would love if we could hop back to

36:38: Peacock for just a second to help answer

36:39: it. Tyler says, "When I change the

36:41: peacock color, it's changing colors for

36:44: everything. Am I missing a setting?

36:47: >> Um, everything like let's see, let's

36:51: just change this to that's probably a

36:54: hex color. Yeah,

36:58: cool. So, that just changed it like

36:59: that. So, if you go into peacock, if you

37:03: go into the general settings, um, there

37:05: it is. You can say keep foreground

37:07: color. So there are other settings you

37:09: can change in peacock and that might be

37:12: controlling what is actually getting

37:15: colored.

37:16: >> Um it also might be a theme thing. So

37:18: I'm using like the monokai theme. If

37:20: you're using some other theme it might

37:21: interact differently with peacock.

37:24: >> Um

37:25: >> not entirely sure but yeah it's if you

37:28: search in here for peacock and then you

37:30: can like darken it and that like changes

37:33: it and you can do other things in there.

37:36: Um,

37:38: yeah, you can reset the workspace

37:40: colors. There's some way to do like

37:44: favorite

37:44: >> surprise me with a random color.

37:45: >> Surprise me with a random color. Yeah,

37:47: >> I like it.

37:48: >> So, yeah, it's in there somewhere.

37:51: >> Okay, perfect. Thanks for the pause.

37:56: >> Cool. We had one more question from

37:59: Javier which was on the topic of the

38:01: extension panel or the um the

38:05: connections pane. He says does anybody

38:07: use

38:09: no does he use any duck DB extensions in

38:12: conjunction with DBLER and remote

38:14: databases?

38:15: >> Um I probably would if I used this more

38:18: often but [clears throat] I don't. Um,

38:20: mostly because again like my really

38:23: truly current use case for this is that

38:25: massive file um that 10 gigabyte thing

38:28: and so I just have to like connect to it

38:30: and I actually use targets instead to

38:33: kind of connect to it um get a subset of

38:36: it, clean it up and then save that as

38:37: like an RDS file and then that's the

38:39: only thing I ever touch again. Um and so

38:42: I don't like regularly connect to the

38:45: database. Um, but there are cool things

38:47: out there and Javier mentions like an

38:49: MCP extension for it. So you can do like

38:52: cool AI type stuff with with duct DB.

38:55: Um, but I just haven't done that. I'm

38:58: not cool databases. So

39:00: >> all right, we'll go play around with it.

39:04: All right, what's next?

39:05: >> Okay, so next is um general nonr

39:09: workflow stuff that makes life easier.

39:12: Um, and so I I did mention already like

39:14: Raycast, like if I mash all these things

39:17: down and press P, this brings up all of

39:19: my projects. And so I can open that. So

39:22: what Raycast is is if you are on a Mac,

39:25: you have if you press command space on

39:27: your Mac, it opens up Spotlight, which

39:29: is like the built-in way of like

39:31: searching for things on your computer or

39:33: um opening folders. You It's a

39:35: calculator, too. If you type oneplus 1,

39:38: it'll show you two. Um, and so you can

39:41: do that with Spotlight. Um, Raycast is

39:45: basically Spotlight but fancier, like

39:47: super fancy. Um, it's free. Um, if you

39:50: go to raycast.com, um, you can download

39:52: it. They just released like a beta

39:54: version for Windows like a month ago.

39:57: Um, so I'm assuming it's cool. I have

39:59: not tried it yet because I don't use

40:01: Windows so I can't even try it, but it's

40:03: probably cool. Um, so Raycast lets you

40:07: do all sorts of neat things. They have a

40:09: huge presence on YouTube. Um, the way

40:12: they make their money, it's free, but

40:13: they have like a pro version where you

40:15: can like sign up for different AI models

40:17: and does other AI type stuff. Um, and so

40:21: that's how they make their money, but I

40:23: don't pay them anything because I don't

40:24: use any of their AI stuff. Um,

40:26: >> okay, cool. So, everything you're going

40:27: to show is on the free version.

40:29: >> Yeah, everything here is free. Um,

40:30: fantastic. So, yeah, if you check out

40:32: this 101 things you can do with Raycast,

40:34: it it takes like five minutes and just

40:36: goes through really quick. So, like

40:38: here's a calculator. OnePlus 1. Neat.

40:40: Um, you can say like next Tuesday is

40:45: January 20th. Neat. So, like that. But

40:47: you can also search for stuff like if I

40:49: want to open up Minecraft. There it is.

40:51: Um, that's cool. So, it's like a general

40:55: thing for searching your computer. Yeah.

40:57: >> Is this is the like command option

41:00: control P. Is that something you decided

41:03: or is that a recast?

41:04: >> That's something I decided. So that's

41:06: that's where Raycast gets magical is

41:09: like on its surface it looks just like a

41:12: regular like application searcher or

41:14: file searcher like spotlight but if you

41:16: go into the settings for raycast it has

41:19: all sorts of like extensions to do other

41:22: things and you can set global global

41:25: keyboard shortcuts for them. So like I

41:27: have this set up where if I press

41:28: command option K that will paste

41:31: whatever is in my clipboard as plain

41:33: text. And so if I'm copying from like

41:35: Word and there's bold and italics in it,

41:37: that will strip it all and just put it

41:38: as plain text wherever I am. Um, and so

41:42: that's that's where I'm setting these

41:43: hotkeys here. So this little diamond

41:46: thing, that's uh that's a short version

41:49: of control shift option command like

41:51: mashing all of that stuff. So if I do

41:53: mash all that stuff and then press G,

41:55: it'll bring up this little thing where

41:57: it will search my GitHub repositories.

42:00: So I can search for Tidyverse

42:02: >> and then that will open up a new tab.

42:05: >> Adrian and I just had the same reaction

42:07: which was like very large eyes

42:10: and slightly upset [laughter] because

42:12: that is so cool.

42:14: >> All it does is like there's a in GitHub

42:16: if you type user colon your name and

42:18: then whatever that will search your own

42:20: things. But I always forget that. And so

42:22: yeah, I just like mash this, press G,

42:24: and then if I remember, like I remember

42:25: I had GG halves once. And so I'll do

42:28: this and say, "Oh, there's how I use GG

42:30: halves." And so I can like find it

42:32: there.

42:32: >> So that's set up.

42:34: >> Bruno is also amazed, y'all. I'm I'm

42:37: losing it. That is the amazing. And like

42:41: for just like um for anybody who does

42:44: not use a Mac, control, option, and

42:46: command in a MacBook at least are all

42:48: right next to each other. They're just

42:50: like three fingers in a row. And that's

42:51: what you're talking about, Andrew,

42:52: right? Is like those three in a row.

42:54: Yeah, it's so easy.

42:55: >> And then shift.

42:56: >> You don't have to do finger gymnastics

42:58: to get there.

42:59: >> So good. Okay, time check. We have 13

43:02: minutes left.

43:03: >> All right.

43:03: >> I don't want to get in your way.

43:05: >> But do we have any questions in the

43:06: chat? If we do,

43:07: >> is I actually have a picture of all of

43:09: those keyboard shortcuts at the website

43:11: things. You can see kind of the the neat

43:13: things I do there. um that link to

43:16: searching on GitHub like I have the

43:18: magic incantation to do that a bunch of

43:20: other stuff. So there's the project

43:22: manager smashing everything pressing P.

43:24: There's a project manager extension you

43:26: can install and it works. Um there's

43:29: some cool scripts. So the other cool

43:31: thing about raycast is it can run any

43:33: arbitrary script. Um and so like I often

43:37: like when I'm setting seeds for like

43:39: analysis I like to go to random.org or

43:42: and grab a seed from there just because

43:43: it feels more random and uses

43:45: atmospheric noise or whatever. So if I

43:47: come here and type seed and press enter,

43:50: it just grabbed it and copied it onto

43:52: the clipboard. So now I have that as my

43:54: seed 893007. So that just grabbed it

43:57: because it ran some script to do it. So

43:59: I actually have a link to all of my

44:02: scripts here. If you go there, you can

44:04: see all of the cool stuff that's there.

44:06: So there's get seed. Um, I have a thing

44:08: that toggles my little ring light here

44:11: that's on my webcam so I can turn it on

44:13: and off. Um, so

44:15: >> Oh my gosh. So it works with your like

44:17: peripherals.

44:18: >> Yeah. As long like if there's a script

44:20: to do stuff with it. Yeah. Um, because

44:22: it just runs like bash commands and

44:25: stuff.

44:25: >> This is amazing. Okay, I'm going to stop

44:27: because I have a couple questions.

44:28: First, a shout out. Sharon um added in

44:31: the chat that she has a notebook LM

44:33: notebook where she's added all of the

44:35: positron um docs to it. I myself am a

44:38: heavy notebook LM user. I love it so

44:40: much. So user friendly. If you've never

44:42: used it, please go play with it. You can

44:44: uh use a UI to add sources and then it's

44:46: basically like a little self-contained

44:48: rag where it's only going to search the

44:50: stuff that you want. But when it does

44:52: give you results, it gives you citations

44:53: for everything. So, you hover over a

44:55: citation, takes you straight to the

44:56: source and highlights where it got the

44:58: information from. Extremely helpful for

45:00: docs. Um, so she shared that. Go check

45:03: that out in the chat. I will, if you're

45:04: watching this later, I'll put it in the

45:06: description. Um, and then we had a

45:09: couple of questions. She also asked MCP.

45:12: Raycast has MCP servers.

45:14: >> Yes, Raycast does MCPS that I I don't

45:16: know if that's only behind the pro

45:18: stuff, but it does do cool MCP things.

45:22: Um, so yeah,

45:25: >> let's go. Yeah, everybody go uh

45:27: investigate on your own for that one. At

45:28: least we know that it's there. Abdullah

45:30: also asked, "Is there a hack to manage a

45:33: repo that is both a project and an R

45:35: package?" I'm not sure. Maybe people in

45:39: the chat can chime in about that one. If

45:40: you have any tidbits for Abdullah,

45:46: might be slightly off topic for our talk

45:48: here, but we can definitely chat about

45:49: it in the chat.

45:51: Marlene says, "Andrew, I've learned more

45:54: about Posatetron in the last hour than I

45:56: have in the last month." Okay, well, we

45:58: have 10 minutes left. How much further

45:59: can we get?

45:59: >> 10 minutes left. So, a couple other cool

46:01: little things about Raycast before I

46:04: show one more thing and then answer

46:05: whatever questions you have. Um, so if

46:07: you notice this thing up here in my menu

46:09: bar that shows that I'm currently in

46:11: this meeting and it knows that because

46:13: Raycast can put like your upcoming

46:15: events up in the menu bar and it's cool.

46:19: Um, and it's smart enough where like if

46:21: it's right before the event and you

46:23: press like command space to get to it,

46:25: it will show that current event like the

46:27: upcoming event there and then I can just

46:28: hit enter and it'll open Zoom or WebEx

46:30: or whatever and like

46:32: >> command space. What is command space?

46:33: >> Command space is how you open Raycast in

46:35: general. Like that's how you like open

46:37: the raycast search thing, but it'll go

46:39: in there.

46:40: >> Um, it has a built-in clipboard history

46:42: thing which is magic. So you can go back

46:44: and see everything you've copied and go

46:46: back and grab it. So you don't need like

46:48: a thirdparty clipboard history manager.

46:51: It's in there.

46:52: >> Did you like press something specific to

46:54: get to that clipboard?

46:55: >> Yeah. So I have that set. So um I have

46:58: command basically command option shift K

47:02: is what I have it set for and it'll

47:04: >> your brain must be very interesting on

47:06: the inside to just have all of this in a

47:08: rolodex.

47:09: >> Yeah. I I don't know. Like I never

47:12: remember them. I have to like imagine

47:14: the keyboard and like mash stuff and

47:15: like oh yeah it's that one. Um, it's got

47:18: a cool emoji picker. So, I can like do

47:20: this type of thing and search for emojis

47:22: or whatever,

47:23: >> which is cool.

47:25: >> It has, this is cool, too. If you search

47:27: for a color picker, it has a built-in

47:29: color picker. So, I can say I want that

47:31: color and it copies the color. So,

47:34: >> I use a browser extension that does not

47:36: work very well and I don't like it. So,

47:38: that's this is a fantastic like

47:39: all-in-one tool. And also, I saw Bruno,

47:41: you had said like, "Hey, I recommend a

47:43: future session on notebookm." I think

47:44: that's a fantastic idea. And when you

47:47: leave the session, there's going to be a

47:48: little survey that has a little part

47:50: that's like, "What do you want to see

47:52: somebody go through live on screen?" Put

47:54: that as a suggestion. Okay.

47:57: >> Okay. So, last little thing here is

48:01: weird. Um, this cool program called

48:03: Espanso, which is a separate program

48:06: from Raycast. It does a completely

48:07: different thing. It is also free and um

48:10: maybe open source. It's c crossplatform.

48:13: It works on Windows and Linux and stuff.

48:15: Um, if you've ever heard of text

48:16: expander, I used to use that for a long

48:18: time. It's the same thing but free and

48:20: open source. Um, and so, um, basically

48:24: you type something like in that little

48:27: demonstration they typed colon date and

48:29: it automatically expanded to the current

48:30: date. You can do that with all sorts of

48:33: cool stuff. Um, and it's it works across

48:35: the whole system. So like Positron and R

48:38: Studio have ways of like setting

48:39: snippets of code. So if you type

48:41: something, it'll like put code there.

48:42: That's helpful. I don't like doing those

48:45: because I'll often be in different

48:46: editors and I don't want to like set up

48:48: one snippet one place and a snippet in

48:49: another place. Um, and so I I don't do

48:53: that. Um, so what I do instead is if you

48:56: look at this link here, these are all of

48:58: my Espanso shortcuts. Um, and there's

49:01: all sorts of like really cool things.

49:03: Um, so for example,

49:07: let me just show a few highlights. Um

49:10: there's like a billion and this again is

49:12: just like the accumulated craft of

49:14: working with text expender since 2009.

49:17: Um and then I didn't then they moved to

49:19: like a subscription thing and then I

49:21: didn't want to pay for that and then

49:22: Espanso existed so and they're free. Um

49:26: Raycast has its own

49:28: system. I just it I don't like it as

49:31: much. It's not as fully featured as

49:32: Espanso so I don't use it but you could

49:35: do that too. Um, so for instance, if I'm

49:38: like typing stuff and type semicolon dt,

49:43: it expands to the current date. If I do

49:45: semicolon data t, it does that date. If

49:48: I do semicolon dz,

49:51: it does a date with the little t thing

49:54: inside for like a blog post like um

49:57: timestamp. Um, so you can do all sorts

50:00: of like cool stuff. That's all just

50:02: keyboard shortcuts that I've set. I am a

50:04: typography nerd and so if I'm writing

50:06: something like one minus one that's the

50:08: wrong minus sign. Um and so I have a

50:11: thing where if I do semicolon minus

50:13: that's the correct minus sign. Um which

50:15: uses the same the crossbar is at the

50:17: same level as the plus sign so they line

50:19: up.

50:20: >> I love it. I that has always bothered me

50:22: but I can't be bothered to like learn

50:25: the alt commands.

50:26: >> Yeah like Windows there are alt

50:28: commands. On a Mac there's lots of alt

50:29: commands like you can do option minus

50:31: and but not here. Um, option minus

50:34: outside of posetron, we'll do like an n

50:36: dash. Um, so what I do here is if I do

50:39: semicolon en that adds an n dash. So

50:43: it's kind of a workaround for working in

50:44: positron there. Um, if you have like an

50:46: x here, I have it set to do the actual

50:48: multiply sign. If I do times, so that's

50:50: the true multiplication sign. So stuff

50:53: like that. Or if I'm just like typing, I

50:55: study institutions, which is a really

50:58: hard word to spell if you're writing

51:00: fast. I actually study authoritarian

51:03: institutions and that's like a lot of

51:05: words and I will write authoritarian

51:08: institutions [clears throat] and it's

51:10: like awful. So I have it set where if I

51:12: type a tn it expands to authoritarian

51:16: and then tn institution or like n I have

51:21: nle because I can never spell that word.

51:24: So it expands to entrepreneurial. Um so

51:27: all sorts of cool stuff. It has cool

51:28: menus too. So if I start a brand new

51:30: document and want like YAML metadata for

51:32: like a Carta file, I can do semicolon

51:35: semicolon QMD.

51:38: And it popped up on my other screen. It

51:40: brings up this cool menu thing where I

51:42: have different headers that I can

51:43: potentially use like a basic YAML

51:46: header.

51:46: >> There it is.

51:48: >> And so now I can insert stuff or let me

51:52: do this. So if I do QMD again,

51:56: uh let me show it over here. I can say

51:59: full academic quarto yl header it got

52:05: confused because it's on a different

52:06: screen.

52:08: >> It's okay. The joys of screen sharing

52:13: >> too.

52:17: Oh, it's messed up, but it would put a

52:19: bunch of stuff there. Um, yeah. So, all

52:21: sorts of cool stuff. So, if you look at

52:23: the website, there's other things. This

52:25: is another cool thing is if I type call

52:28: out, it brings up this cool little thing

52:30: that I've made. So I can add a quarto

52:33: call out like a warning that is

52:35: collapsed. That is the simple appearance

52:38: without an icon. Submit. [gasps]

52:41: That's all there. And now I can add my

52:42: little callout warning stuff. So I have

52:44: lots of little things for adding uh

52:47: quadospecific things like if if you're

52:50: making like a reveal.js JS slideshow and

52:53: you want multiple columns, I can do cl

52:55: and there's my column divs. That

52:58: >> this is so cool. This is the stuff that

52:59: I never remember how to do and I almost

53:02: always have to go copy paste from

53:04: another one of my documents. Well, we

53:06: have some questions that have rolled in

53:08: through the Discord. We have 3 minutes

53:09: left. Let's see if we can hit um some

53:11: answers for things

53:13: >> really quick rapid fire. Is Raycast a

53:15: replacement for Spotlight and Bartender?

53:18: >> It's a replacement for Spotlight. It's

53:20: not quite a replacement for bartender.

53:22: So, bartender on a Mac is um if you have

53:25: a menu bar with lots of things in it,

53:26: bartender lets you like collapse them

53:28: into like a hidden menu bar. Um

53:30: bartender is expensive. Um okay. And but

53:34: there is a thing called Ice um menu bar

53:39: that is like an open-source menu bar

53:42: thing for Mac OS. So, this is an open-

53:44: source bartender and it's what I use

53:46: now. It's great.

53:47: >> Cool. Someone also asked, Logan asked,

53:49: "What browser are you using?" I think

53:50: you're using Arc

53:52: >> using

53:53: >> I will say, oh, Ryan put it in arc.net

53:56: as well. Um Sharon asked, "Is there an

53:58: easy way to see all of the shortcuts

54:01: that you have already set up?" I think

54:02: there is.

54:03: >> Um all so all the espanso shortcuts kind

54:06: of. Um so if you look at this, all my

54:10: shortcuts and settings, that's a git

54:11: reposi git repository. So espanso is

54:14: cool because it's all plain text

54:15: configured. So if I come to like match

54:18: here, so like here is um

54:22: programming stuff. So if I type like

54:25: semicolon WM, it will make this warning

54:28: false message false quarto chunk

54:30: metadata thing. Um there's nothing magic

54:33: about the semicolon thing. Some people

54:34: do colon, some people uh won't have like

54:37: a prefix. I just like the semicolon

54:39: thing cuz I don't typically write like

54:42: semicolon fig w like that's not a common

54:44: thing I type.

54:45: >> Um so it's not going to accidentally

54:46: trigger it. So everything is in this git

54:48: repository there for raycast.

54:51: >> If you filter your stuff to show only

54:53: customized then you can see all of the

54:55: stuff that you've set and see all the

54:57: keyboard shortcuts there.

54:59: >> Amazing. Jared you your question I don't

55:02: know what it means but I'm gonna ask it.

55:04: What shortcut have you set for an

55:05: interabang?

55:07: Oh,

55:08: >> I don't have one. Um, but I should. So,

55:10: that's the the combination question mark

55:12: exclamation mark like in one character.

55:14: Um, so

55:16: >> Oh, okay. I get it. Interabank. Um, how

55:19: David Ander asked how is he triggering

55:21: those word replacements?

55:22: >> So, that is because Espanso is a it's

55:26: just running up here in my menu bar on

55:28: Windows. It would run down in like the

55:30: taskbar thing and so it just watches

55:32: what you type. And so if you trigger any

55:34: of these things like this r stop or

55:37: semicolon r stop will add this knitter

55:39: knit exit thing. Um and so that will

55:43: trigger it. If I have I have this long

55:44: words thing. So I've got lots like

55:46: multinnomial can never spell that. So I

55:48: have it semicolon mnl. Um authoritarian.

55:51: I don't have a semicolon there. I just

55:53: like start typing aut and then it

55:56: magically turns into authoritarian.

55:58: Characteristics. That's a tricky one.

55:59: inside type cars and it magically

56:02: changes. Um, so yeah, you can see all

56:05: stuff.

56:05: >> So these are just like code snippets,

56:07: but they're for words. All right. Well,

56:09: we've we've hit the top of the hour. I

56:10: know people are going to have to jump.

56:12: This was amazing. Andrew, thank you so

56:14: much for coming. This is has been

56:16: recorded. It's going to be on YouTube

56:17: eventually. Thank you. Thank you. Thank

56:19: you. I hope you had a good time.

56:21: Everybody, stick around in the Discord

56:24: server. Continue to ask questions,

56:27: answer each other's questions. Um, and

56:29: we we will see you all next week on

56:32: Tuesday. Andrew, would you like to say

56:34: goodbye? Thank you so much.

56:36: >> Yeah, thanks for coming everybody. This

56:38: was great. I can talk about this stuff

56:39: like all day. This is

56:41: >> it's my way of procrastinating is

56:43: figuring out

56:43: >> I can listen to it all day.

56:45: >> So,

56:45: >> okay. Well, go read Andrew's blog. He so

56:48: kindly packaged that all up for us. And

56:50: we'll see you this Thursday on the data

56:52: science hangout. We have Mina uh

56:54: Chattinka Randelle. If you know Mina,

56:56: you know that she's amazing. Come see

56:57: her on Thursday. And then we'll see you

56:59: next week at the lab. Bye everybody.

57:01: >> Bye.
