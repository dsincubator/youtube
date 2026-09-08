---
type: Video Transcript
title: "Exploring Positron settings | Isabel Zimmerman & Davis Vaughan | Data Science Lab"
description: "I'm a data community manager here at PZA and I am joined by two of my co-hosts behind the scenes who you might already know."
resource: "https://www.youtube.com/watch?v=QIYyeuZ_ISY"
tags: ["ds-lab", "python", "r-packages", "pins"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T21:59:18Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=QIYyeuZ_ISY"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2026-01-07T00:00:00Z"
    usage_count: 3313
usage_window: { from: "2026-01-07T00:00:00Z", to: "2026-09-08T21:59:18Z" }
---

# Transcript

00:07: Welcome to the data science lab

00:08: everybody. My name is Libby. I'm a data

00:10: community manager here at PZA and I am

00:12: joined by two of my co-hosts behind the

00:14: scenes who you might already know. One

00:16: is Isabella Velasquez. Isabella, do you

00:18: want to say hello?

00:20: >> Hi everyone. Thanks so much for joining

00:22: us.

00:23: >> And we also have Daniel Chen. Daniel,

00:25: you want to say hi?

00:26: >> Hello everyone.

00:29: I am really excited to introduce our

00:32: featured guests at the lab today,

00:33: Isabelle Zimmerman and Davis Bond. They

00:36: are both software engineers here at

00:37: Posit working on Positron. Isabelle,

00:39: would you like to introduce yourself?

00:42: Sure. So, hello everyone. Um, I am

00:45: Isabelle Zimmerman. I'm a software

00:47: engineer on the Posetron team. Libby

00:49: just said all of that. Um, some other

00:51: non-libby facts [laughter] um that I uh

00:55: I am also I saw someone from Tampaish

00:57: Florida. I'm also a Tampaish Florida

00:59: person. Um losing my voice today. I was

01:02: at Epic Universe Mario World this

01:04: weekend.

01:05: >> Um it was amazing. It was everything you

01:07: wanted to be.

01:09: >> That sounds so fun.

01:11: >> Um I work on a lot of the Python

01:13: experience on Posatron. Um, I also bop

01:17: around to some u um like UI things. Uh,

01:20: but my main focus is Python. That's

01:23: because I also, uh, run some of the

01:25: Python packages here at Pit. So, if

01:28: you're familiar with pins or veterin

01:29: Python, um, that is some of the things

01:32: that I have created and maintained. So,

01:34: super excited to be here with everyone

01:36: today. Amazing. Davis, would you like to

01:39: introduce yourself?

01:42: >> Sure. Hi, everyone. I'm Davis Vaughn.

01:44: I'm in Charlotte, North Carolina. As

01:46: Libby said, I'm on the Posatron team,

01:48: but I also um do a lot of just R things

01:52: in general. So, Isabelle is the Python

01:54: side. I work on the R side. Um uh in

01:57: addition to positron, I work on things

01:59: like dlier and tidyr [clears throat] and

02:02: a number of other R packages. Uh and I'm

02:05: the co-creator of air if you're using

02:07: that for our formatting.

02:09: >> Nice. And we're going to talk about air

02:11: today, which I'm really excited about.

02:14: Um, and I also want to just let

02:16: everybody know how today will work

02:18: because this is new. If you're used to

02:19: the data science hangout, we talk, we

02:22: chat with people, we find out about

02:23: their like journey to where they are. We

02:26: talk about career questions, data

02:27: science leadership questions, technical

02:29: questions. Today is going to be all

02:31: about sharing our screens, walking

02:35: through stuff, and just being with you

02:38: all as a community about the technical

02:41: stuff. Today's going to be all about

02:42: positron settings. So, we are going to

02:45: talk about like what what settings we

02:48: love to replicate stuff that we love in

02:51: other places or things that help our

02:53: workflow. And I will get started by just

02:57: sharing my screen with Posatron on it

02:59: and um walking through just some basics.

03:04: So, here we go. I'm going to

03:09: really hope that I share the right

03:11: stuff.

03:13: Okay, you should see my Posatron screen.

03:15: Does everybody see that?

03:17: Yes. Diva says yes. I get a thumbs up.

03:20: Fantastic. Okay. Um, so here is my

03:23: Posetron setup with my theme. And this

03:27: is going to be like the most basic stuff

03:30: ever for me. I'm gonna let Davis and

03:32: Isabelle do the like more fun stuff, but

03:35: I would also really love to know from

03:37: everybody in the chat what stuff you

03:41: have questions about. Um, if you have a

03:44: question for Davis or Isabelle, please

03:46: put it in the slido. Um, or what stuff

03:49: that you are really excited about that

03:51: you've customized your posetron to

03:54: include. Um, I know that Isabelle is

03:56: going to talk about rainbow

03:59: um indention or rainbow uh parenthesis

04:02: which I would really love for for my own

04:06: uses. What I would love to talk about is

04:10: format on save. So the little search bar

04:13: up here is not always a search bar,

04:15: right? Sometimes it is a command shiftp

04:20: pallet. This is like a command pallet

04:23: where once you have this little sideways

04:26: uh greater than symbol, you can do a ton

04:28: of stuff inside of positron.

04:31: This is where you can do things like

04:33: your settings. You can open your

04:36: settings either in JSON or a UI. I'm

04:38: going to open the UI, but if you see

04:39: people doing things in JSON and

04:42: settings, if you're coming from R Studio

04:43: and you're like, what are these JSON

04:45: things? This is where it is. Open user

04:47: settings JSON. It's just a file with

04:50: really simple JSON in it that lets you

04:52: toggle things on and off. And when I

04:54: open this in the UI, you're going to see

04:56: some of these same things. Right here is

04:59: my theme, community material theme, high

05:02: contrast. If you happen to like what I

05:04: have going on here, which is kind of

05:05: like a Draculaish theme, um, I have my

05:09: posetron plots dark filter set to off,

05:12: so it doesn't filter my plots with the

05:14: same dark filter. [snorts] And here is

05:17: my autosave on focus change. And then

05:20: also my format on save true. And I'm

05:23: going to like make this slightly larger

05:25: for everybody. What I did was command

05:28: and the plus sign. That just like made

05:30: everything a little bit larger. If you

05:32: are sharing screens, that's fantastic to

05:34: know. So I'm going to do command shiftp

05:36: again and get back to my thing and I'm

05:40: going to go to this like open settings

05:42: UI so that you can see all of those same

05:45: things. So, format onsave

05:50: pulls up our format on save

05:53: UI settings. I have this toggled to on.

05:55: That's not true inside of the settings.

05:58: Um, and so what this does is it tells

06:02: Posatron that anytime I am using um R or

06:06: Python, it's going to use either rough

06:08: or air to automatically format the stuff

06:11: that I put in there. Okay, so that's

06:13: step one. Checking this on. I also have

06:17: it turned on for notebooks, but I think

06:18: this is for the main editor, likepi.qmd

06:21: files. And Davis and Isabelle can stop

06:23: me if I say something wildly wrong of

06:25: just hop in and be like, "No, you're

06:27: wrong."

06:29: The other thing that I want to turn on

06:32: in conjunction with this to make this

06:34: really, really helpful for me is the

06:39: autosave.

06:40: All right. So, I'm going to search for

06:42: autosave and then I am going to set this

06:45: to onfocus change. This happens to be

06:48: what I like. You could do whatever you

06:50: want. You could turn it off. I don't

06:52: recommend that one. You could do after a

06:54: certain delay and then set the delay, I

06:56: think, in milliseconds or something, but

06:58: I like focus change. It says an editor

07:00: with changes is automatically saved when

07:03: editor loses focus. That means when I

07:05: take my cursor out of my editor and put

07:07: it anywhere else, right?

07:10: Okay. So, we're going to leave it on

07:11: focus change. And when I go back to

07:15: something like, for example, this and I

07:20: do something wacky here and I like,

07:24: let's just say I do this. My focus is in

07:28: my editor window right now. If I take my

07:30: focus and I put it somewhere else, it's

07:33: automatically going to clean up my code

07:35: for me. It doesn't matter how ridiculous

07:39: my code looks and how wild everything

07:43: is. And it also doesn't matter how big

07:45: my file is. It's going to happen so fast

07:49: the moment my focus leaves this and goes

07:52: anywhere else like my um my console

07:55: pane. It's going to fix things. Oh,

07:57: look. I love how it like respected the

08:00: fact that I wanted that on another line,

08:02: but it didn't fix this.

08:04: Hilarious. All right. Well, I'm going to

08:06: save this file. And when I saved it, it

08:09: fixed it. So, it respects some things

08:11: that you want with style, like if I want

08:13: things on a separate line, but it'll

08:14: clean stuff up. Okay. I'm hoping that

08:18: that made sense for everybody. Format

08:20: and save. Ronaldo says true is a

08:22: blessing. Yes, absolutely. And Ronaldo

08:25: also said R Studio keybindings. Great

08:27: call out. I'm going to go over to

08:28: settings. And over here, I'm just going

08:30: to search R Studio. And the first thing

08:34: that I see is that enable R Studio key

08:36: bindings. Um, and it does say, hey, this

08:39: requires a restart, so you might have to

08:40: restart. But I already have it checked.

08:43: And that means that when I am working in

08:45: R, I can do things like I can add a pipe

08:50: with my pipe shortcut, my command shift

08:52: M.

08:54: Um, and I have also added some things

08:56: that help me have things more like R.

08:59: For example, if I do shift enter, I get

09:01: another um I get another comment, which

09:04: is not normal.

09:06: And I think that that is like one of my

09:09: favorite things that I've added as a

09:10: custom keybinding. But we can talk about

09:12: custom key bindings in just a second.

09:14: So, I'm going to hop over to the Slido

09:17: and have Javier ask his question live.

09:20: Javier, would you like to uh click that

09:24: yes to unmute button

09:26: and ask that live? Hello. Can you hear

09:29: me?

09:29: >> Yeah.

09:30: >> Hey, thanks. I didn't mean to interrupt

09:32: you either, Livia. I'm sorry.

09:34: >> Yeah, I'm done.

09:35: >> Because it's not entirely related to

09:37: what you're showing right now.

09:38: >> That's okay. We're going to hop over.

09:40: >> I I

09:43: Let me see. Can you see my video? Am I

09:45: sharing my screen? Yeah. Okay.

09:47: >> You're not You're not sharing your

09:48: screen.

09:48: >> Feel like a boomer here. Okay. So uh

09:51: basically

09:52: I stopped using air only for the reason

09:55: that like

09:57: I'm like continuously control saving on

10:00: a script or anything I'm working on and

10:03: I would like my cursor to move along

10:07: with the edits. So, it does a great job

10:10: of formatting. Like, amazing, right? But

10:13: like I was getting frustrated that the

10:16: code was kind of shifting up and down

10:18: around my cursor as opposed to moving

10:20: with the formatted code. I didn't know

10:22: if that was a setting that maybe I'm

10:25: missing or um

10:28: yeah, if that if if that's possible.

10:31: >> What a great question. I have not even

10:33: like thought about this or experienced

10:34: it. Davis or Isabelle, do you have any

10:37: thoughts on this?

10:40: And you're working in R hobby, right?

10:42: >> Yeah,

10:42: >> it primarily R. Yeah,

10:44: >> I'm trying to understand. So, I'm just

10:45: going to share um like

10:47: >> let's do it

10:48: >> exactly what you're getting at here.

10:50: Like if I'm here and I hit save, right?

10:52: For me, it that that feels like moving

10:55: with my cursor. Like what are you do you

10:58: have a different example that you know

11:00: of that like doesn't feel like it moves

11:02: with the cursor? Like

11:04: >> so mine is I'm talking more about code

11:07: edits that happen where not the row is

11:10: changing necessarily like not the row

11:14: being formatted but the the overall

11:16: script is being formatted. Yeah. So if

11:18: I've got like exactly like a mutate call

11:20: or

11:23: >> Yeah. Right. Something like this. And

11:25: I've got comments in between. What where

11:28: I've seen it happen is where it's like

11:30: much longer scripts.

11:39: Maybe I could try replicating it on my

11:41: end. Sorry. Okay.

11:43: >> Yeah. Let me let me try replicating uh

11:46: something and I'll just put it in the

11:47: comments like maybe the code.

11:49: >> Yeah, we can come back if you find one.

11:51: >> Yeah.

11:52: >> Put it into a code junk.

11:54: >> Thank you. Thank you. Appreciate it.

11:55: >> Okay. So Nathan says he has format on

11:59: save turned on at the project level

12:01: because he sometimes opens legacy code

12:04: and doesn't want to reformat it at all.

12:07: That is an excellent point. Um I would

12:11: anybody like to hop in and talk about

12:13: project level settings?

12:17: >> Isabelle, do you want to?

12:18: >> Um sure. So when you have settings um

12:24: here I can share my screen perhaps

12:29: um you can decide if you want it for

12:31: like you as a user like that's

12:34: effectively your whole IDE unless you're

12:37: using different spaces um which we can

12:41: talk about if people are interested in

12:42: making different like profiles um or you

12:45: can do it for a certain workspace so you

12:47: can have something just at a certain

12:48: project so maybe for my pins project, I

12:52: always want it to format on save, but

12:54: for something else, I don't. Um, we

12:56: actually use this in the Positron repo

12:58: because there's a few different

12:59: formatterers in play with all of the

13:01: different types of um code that's

13:04: happening in this IDE. So like when I'm

13:07: actually building the Python extension,

13:08: I don't have format on save set um when

13:13: I'm opening it from one directory, but

13:16: if I open it directly, I have it open.

13:19: Uh it does format on save, which is

13:21: maybe a convoluted way of saying it's

13:23: very customizable. And you can just

13:25: click between um these user and

13:28: workspace settings. And if you change

13:29: something

13:32: maybe something reasonable like 16 um it

13:36: should say that like you know it's got

13:38: this little line it's changed for your

13:41: user and if you look at the workspace

13:43: now you see hey it's modified it for the

13:47: user but not for this workspace.

13:50: >> Awesome. I think that profiles are a

13:53: good thing to talk about. Like Daniel

13:55: had mentioned in the Discord chat that

13:59: Hadley had said in Tidy Dove Day, he has

14:01: the auto format on save turned off so he

14:04: doesn't trigger like new line trimming

14:06: and other changes when he's working on

14:08: other people's packages. Like if you're

14:09: reviewing a PR, you're just like

14:11: changing a ton of lines if you have that

14:13: on all the time, right? So, if you had a

14:15: profile that was set up for doing PR

14:17: reviews or, you know, looking at someone

14:20: else's code versus your own, I think

14:22: that that would be really helpful. I

14:23: have never used profiles. Is that

14:25: something um that anybody would like to

14:29: talk about? That's something that I have

14:30: like room to learn and grow in.

14:34: I am not a profile user, but I know I've

14:37: talked to people who use profiles and I

14:39: know like um Mina is someone who uses

14:42: profiles a lot because she has one for

14:44: teaching. Um she's a professor, so one

14:46: for teaching, one for development work.

14:48: So she'll have all of her the font sizes

14:52: much larger for teaching or a different

14:54: setup. Um and if you want to play around

14:58: with this, I can quickly share again.

15:01: Uh, and this is Nathan's question from

15:02: the slido. Thank you for asking, Nathan.

15:05: >> Yeah, thank you for asking. Oops, let me

15:07: rearrange so I can click around Zoom.

15:11: >> Um, no worries. I know sharing is hard.

15:14: [laughter]

15:14: >> Yeah, [gasps] if you go to the gear at

15:16: the bottom left corner and then click on

15:18: profiles, you'll get this. And I think

15:21: you can just click new profile and

15:24: configure all of your settings. Um,

15:26: yeah, I am not I'm not a user, but I've

15:28: heard people have really interesting use

15:31: cases, even to have like a different

15:33: theme for different workspaces and

15:36: things like that. Yes. Okay. So, what I

15:39: have seen people do is set up profiles

15:41: for the different stuff that they need

15:42: to do, the different hats they need to

15:44: wear for their job. Um, so they they

15:46: might have like a code review one. They

15:49: might have one that is set up for

15:52: analysis for like this is what I like to

15:54: happen during analysis and then they

15:55: might have one set up for um data

15:58: engineering. This is what I like this to

15:59: look like when I'm doing data

16:00: engineering in Python. I think that

16:02: that's really exciting. I haven't used

16:03: any of them yet either myself. I need to

16:05: set them up and play around with them.

16:08: Nathan, thank you for asking that

16:09: question. It was fantastic. Um, and Z,

16:13: Zach, you had asked a question as well

16:14: that I do not know the answer to. So, I

16:16: want to ask Davis. Zach usually has an

16:20: asterisk next to his question. So, I'm

16:21: going to read it for you, Zach. I hope

16:23: that's okay. It says, "Minor question.

16:25: Is there a way to make it so that the

16:26: other pipe symbol is used when using

16:28: control shiftm?" So, you saw me when I

16:30: shared my screen. It was the native R

16:33: pipe for my command shift M. Davis, do

16:36: you know if you can use the McGritter

16:37: pipe by default?

16:38: >> Yeah, thanks to Jenny, I think.

16:41: A thanks Jenn. Yeah. Uh so in your

16:45: settings um for me command comma will

16:48: also bring me right there. You can

16:50: search for pipe and thanks to Jenny

16:53: there is an option here where you can

16:55: choose the mcrder pipe if you want to as

16:57: your default.

16:58: >> Nice. Thank you. And yeah, command comma

17:04: is

17:04: >> which brings up the same thing as

17:07: uh settings, you know, open open user

17:10: settings. [snorts]

17:11: >> Yeah. And it automatically opens the UI,

17:14: right?

17:14: >> Yeah. It automatically opens the UI. So

17:16: command comma goes to the UI.

17:19: >> Yes. And that's a fantastic thing to

17:21: sort of like um share about in general

17:24: is key bindings. I have a custom

17:27: keybinding which I don't mind showing

17:29: everybody. I'll share my screen,

17:32: but I also just kind of want to show

17:35: where you can find keybinding. So, I'm

17:37: going to again do my command shiftp to

17:39: get to my command pallet. And then I'm

17:42: going to just type the word keyboard.

17:45: The command pallet inside of positron is

17:48: smart. You don't have to type in like

17:50: developer toggle keyboard shortcuts

17:52: troubleshooting, right? You could just

17:53: type in keyboard. is going to find

17:54: everything that might uh be that. And

17:57: then I'm going to open the keyboard

17:59: shortcuts. This is the UI. This is the

18:01: JSON. I'm just going to open the UI for

18:04: right now. And I'm going to show you how

18:06: you can sort of search this. So,

18:09: um, this search bar up here is looking

18:12: for a string. It's looking for something

18:16: like

18:17: shift plus

18:19: enter, right? Which is going to pull up

18:21: all the shift enters. But you can also

18:24: just type in the shortcut that you're

18:27: looking for. And I think that that's

18:30: this one. So you press this little

18:32: keyboard button and it says recording

18:34: keys. And it's listening now. So I can

18:36: hit shift enter and it's going to put in

18:38: shift enter and find all of the key

18:39: bindings that are mapped to shift enter.

18:42: If you are an R studio user, this might

18:44: look a little foreign to you. That's

18:45: okay. Um, one important thing to note is

18:49: this when clause right here. I will show

18:52: you what this looks like in JSON, but

18:54: there's a when clause inside of each of

18:56: these keybindings that tells positron

18:59: when to use this key binding, right? So,

19:03: for example, all of these shift enters,

19:06: there are so many of them. There's so

19:08: many of them. They don't step on each

19:10: other because of this when clause. So

19:13: when the editor is in focus and you are

19:17: looking for I don't know what find input

19:19: focus is it's going to use find previous

19:21: for this like I it's magical it's

19:24: amazing it's confusing

19:26: and if you want to see mine CSS user

19:29: right there all these are from the

19:31: system these are from the installed

19:35: things that I have like CTO Python

19:37: Jupiter um but this user one is mine

19:40: it's a snippet and It's when the editor

19:44: text is in focus and when the editor is

19:47: R. So, I don't have this turned on for

19:49: when I'm using Python. I I I wanted it

19:51: to replicate R Studio. Um, and the way

19:54: that I did that, I'm going to go back to

19:56: command shiftp. Oops. Nope. That's not

19:59: what I wanted. I want

20:00: >> my worst. And I always get confused

20:03: right there when I'm recording the keys

20:05: and then I forget to hit unrecord and

20:07: it's like, it ate my keys.

20:08: >> It will eat all of your keys, y'all. If

20:10: you leave that little keyboard thing,

20:12: anything you type in there is gonna end

20:13: up here. Um, okay. So, let's go to the

20:16: JSON version. And this is where my

20:18: snippet lives. So, you can see what my

20:20: snippet looks like. And if you use R, it

20:22: kind of looks like an an R Studio um

20:25: code snippet as well. So, I want it to

20:27: use shift enter. I want it to um do the

20:32: action called insert snippet.

20:35: This is my when clause. I want it to be

20:37: when the editor language is R and when

20:40: the editor text is in focus. And when

20:44: that happens and I click shift enter, I

20:46: wanted to enter a new line and a hash

20:49: symbol so that I am ready to type my

20:52: next comment because I I've relied on

20:54: that function in R Studio for so long. I

20:55: can't live without it. Um, okay. And

20:58: then I can save that and away I go. So,

21:01: I hope that that's helpful for somebody

21:03: out there and this will be recorded so

21:06: you can go back and like watch this, but

21:09: if you have any questions about it in

21:11: the Discord, we will absolutely help

21:13: you. And I'm going to go ahead and stick

21:15: that snippet in a code chunk in the

21:18: Discord right now. Um, code snippet to

21:22: enter new comment

21:26: in R

21:30: Okay, I would love it if we could hop

21:34: over to um Isabelle to talk about what

21:37: you would like to talk about because I

21:39: want to put this on mine as well.

21:42: >> Yeah. So, I have Let me minimize some

21:45: things again. Um a few of my maybe

21:49: favorite things that I customize. Um so,

21:53: I use rainbow tabs. I think I'd said

21:56: rainbow parenthesis, but it's so large

21:58: now. Rainbow.

22:00: >> The uh the spaces, right? The space tab.

22:03: >> Yep. So, if you can see, I don't know

22:06: how good the contrast is for y'all, but

22:08: you can see this is like vaguely yellow,

22:11: vaguely green, vaguely pink. Um, and so

22:15: it just helps, you know, as you're

22:18: getting some like nested like really

22:22: just adds to some readability. um

22:24: especially when you're looking at a lot

22:25: of different code. Um so this is

22:27: actually an extension

22:30: the it's called indent rainbow. You do

22:34: indent

22:36: rainbow. So it's this one by

22:39: odor watt um is the creator. It's

22:45: available on VSIx

22:47: uh or open VSX. So, this is what I like

22:50: to use for especially writing Python

22:53: code. Um,

22:56: oh, I know I just put in the Discord a

22:59: URL for any setting. If you click on the

23:02: little gear next to it, you can copy the

23:04: setting as a URL and share it with your

23:06: friends.

23:07: >> Oh my gosh, I did not know that. Can you

23:09: show that one more time?

23:10: >> Yeah. So any setting um if you don't

23:13: want to like screenshot it or like tell

23:15: people look at this in the settings as

23:17: long as somebody has Positron installed

23:20: um it'll look something like this.

23:22: >> Oh this is a URL it won't work right

23:25: here.

23:25: >> I like you can copy it as JSON too.

23:28: >> Yes, that is very convenient. You can

23:31: even get the setting ID and that's a

23:33: really easy way to get people directly

23:35: to the setting that you want. Oh my

23:37: gosh, this is so helpful. Joey's also a

23:41: little mind-b blown. I love it. So, you

23:43: click on the gear,

23:45: >> correct? There's a lot of help lot of

23:48: helpful things in this little gear. Um,

23:50: if you're a profile user, I just

23:52: realized you can apply it to all

23:53: profiles as well. So, you've got some

23:55: options there.

23:57: >> Um,

23:57: >> amazing. Okay, I'm going to turn this on

24:00: immediately.

24:03: >> Uh, okay. So,

24:04: >> what about rainbow parenthesis though? I

24:06: think. Okay, I know Julia uses it. I

24:11: don't remember which one it's called.

24:13: >> I have seen someone use it and I'm like,

24:15: I want this. I miss it from our studio.

24:18: >> I am not sure. I use rainbow tabs. If we

24:22: just type in rainbow, will it get us

24:23: there?

24:25: >> I don't know.

24:25: >> Rainbow HTML. I don't know.

24:27: >> Rainbow indent. If you have favorite

24:30: extensions, hop over to Slido and put it

24:33: in a question and just let us know what

24:35: your favorite extension is.

24:36: >> I think it might be Rainbow Brackets.

24:38: >> Rainbow Brackets

24:40: >> or is that on not sure if it's on Open

24:44: VSX?

24:46: >> There's perhaps a

24:49: bracket pair colorizer

24:53: or

24:54: >> says it's become native in VS Code, too.

25:00: I go open my settings. I hope everybody

25:02: is coding along.

25:07: >> I think something else. I am somebody

25:09: who tends to collect a lot of Pythons.

25:12: Um, so if you are like me and have like

25:14: a million different places, there's a

25:16: Python on your computer. Um, you can see

25:19: I've got so many py. I've got some

25:22: globals. I've got some UV. And this is

25:24: actually the cleaned up version. if you

25:26: think this is a lot of

25:28: >> [laughter]

25:28: >> um interpreters. So I actually use

25:31: something that's uh Python interpreters

25:35: exclude and this is in R as well. Um so

25:39: I hide from my drop down everything

25:41: that's on in user anything that's in my

25:44: home.local.

25:46: Um, or if you have maybe an R installed

25:49: in a weird location and it's not being

25:51: found. Um, or Python, you can add items

25:54: here and you can just add paths. Um,

25:57: >> so I know

25:58: >> this is amazing. This solves a problem

26:00: that I had for so long.

26:03: Okay, this is fantastic.

26:05: >> So, it's Python or R interpreters

26:08: include.

26:12: Wow, I really cannot type.

26:15: It's okay.

26:16: >> So, um, yeah, interpreters include,

26:19: exclude,

26:21: they're there. Uh, so if we're not

26:24: finding your interpreters the way you

26:26: want, you can customize that as well. I

26:29: think one other thing that's just

26:30: general customization, I I tend to move

26:34: things around a lot. Um, I really like

26:36: putting my terminal over here. Um,

26:40: sometimes,

26:42: sometimes I don't. So, I guess just a

26:44: call out to know that you can rearrange

26:47: all of these little pieces and put it

26:49: wherever you want. Um,

26:52: >> and she's just clicking and dragging, by

26:54: the way, everybody.

26:55: >> Correct. Um, you can also rightclick on

26:59: these different panes and hide or show

27:02: different icons. Um, which I think I did

27:06: not realize and the day I did, I hid so

27:09: many things from my sidebar. Yeah, you

27:12: can also move that sidear to the top,

27:14: too, if you really want. Um, there are

27:16: all kinds of view things that you can

27:18: do. So, you can move your primary bar

27:21: wherever you want it. And then also, if

27:23: you're really into hiding stuff, you can

27:25: just hit command shiftp. And I'll share

27:28: my screen really quickly and show you

27:29: what this looks like. Um,

27:32: so you wherever you are, like I'm going

27:35: to head back over to just a QMD file.

27:37: You can do command shiftp

27:42: and have it all go away, which I

27:45: sometimes really like if I just want to

27:47: look at code. Um, and then you can hop

27:51: back, you know, command shiftp your way

27:53: there and that's really really helpful.

27:56: I also wanted to make sure that I called

27:59: on a couple of people to ask some

28:01: questions really quickly because I saw

28:03: some good ones

28:05: um and to share stuff. So, first of all,

28:07: Edward Edward Clayton says, "Extension

28:10: rainbow CSV

28:13: is necessary."

28:15: Okay, fantastic. I'm going to go explore

28:17: Rainbow CSV.

28:20: There was another one. Marlene says to

28:23: look into

28:26: um oh Marlene are you talking about R

28:28: Studio

28:30: for rainbow parenthesis tools global

28:32: option code that is in

28:36: R studio but it could be something that

28:39: you're looking at in positron

28:43: >> but uh you're right that was R Studio I

28:47: know I've seen the rainbow parenthesis

28:48: because I have it turned on in Posetron

28:51: >> I've seen other people use it. We're

28:53: going to get there. Okay.

28:54: >> Yeah.

28:56: >> Um Nathan says, "Agree to the Rainbow

28:59: CSV extension." Um Okay.

29:04: So,

29:06: why don't we go look at

29:10: one more extension actually while I grab

29:14: a question from Slido.

29:16: An extension that I really like because

29:18: the file pane is not always like my

29:21: favorite thing um is the

29:26: enter folder one. See how it says enter

29:29: folder right there? I can open a folder

29:32: and have it be the only thing that I see

29:34: and then I can go back. And so that is

29:38: the enter folder extension.

29:45: this one. It's like a yellow folder with

29:47: an enter button. I really enjoy that

29:50: because I want to be able to like just

29:53: get into one thing and look at it and

29:55: not especially when I have really busy

29:57: um folders. So like if I went up here

29:59: into my Py Tuesday one, which I'm not

30:01: going to do right now, you would see

30:03: absolute wild craziness. By the way, if

30:06: you don't know, there's a little right

30:07: hand upper right hand corner thing where

30:09: you've got your like most recent

30:11: projects and stuff up there, which is

30:13: really really handy. Okay,

30:16: back to Slido. I'm going to mark some

30:19: stuff as answered, so they might

30:20: disappear. Don't worry. Don't worry. Um,

30:24: okay, Nathan, you had a question. Do you

30:27: want to unmute and ask that one live?

30:29: It's a small one, but it does not

30:30: matter. It was about the user level,

30:32: project level settings because I think

30:34: it's important.

30:36: >> Oh, yeah. Um, and actually it just got

30:40: answered uh in the chat. So, fantastic.

30:43: Yeah, I think Jenny sent No, Isabelle

30:46: sent a link to the setting hierarchy.

30:49: >> Okay, fantastic. For everybody who is

30:51: not um in the chat because you're

30:54: watching on YouTube later, do you want

30:56: to do you want to give a little rundown

31:00: >> or wait, I can go back.

31:02: >> Um yes, that would be great. So like

31:04: you're you can kind of think of it as

31:06: like a funnel. Um and the most granular

31:08: settings are going to be put at the top

31:10: of the hierarchy. Um, so if you have

31:12: something at the workspace, it's going

31:13: to go over like your user. Your user is

31:17: going to go over like the default. Um,

31:19: and there's also I did put the link in

31:21: chat for folks. So the more granular the

31:24: setting level um the it'll be put on the

31:29: top.

31:30: >> So user top

31:33: workspace is underneath user

31:35: >> workspace would go above user. So if you

31:38: think of user as all of your settings

31:40: for all of your posetron and then um a

31:44: workspace would be your settings for

31:46: just one folder or something like that.

31:49: >> Okay.

31:50: >> The the way I think about it is like the

31:52: the actual file for those workspace

31:55: settings is closer to the code that it

31:59: actually like has an effect on. And so

32:02: like the workspace settings are closer

32:04: to the actual project that you're

32:06: working on. So they override any user

32:08: settings which are further away.

32:11: >> That makes perfect sense. So it's it's

32:13: not like my user has all of these

32:16: workspaces underneath it and all of

32:18: those are going to use the user. It's

32:20: more like this is what I want. If I

32:22: don't tell you what to do in your

32:23: workspace, but then in the workspace, if

32:25: I tell you what to do, override my user

32:27: settings.

32:28: >> Exactly.

32:29: >> Okay, perfect. That Yeah, Nathan says

32:32: that is a great way to think about it. I

32:34: needed that. Nathan, thank you so much

32:37: for asking your question. We are 40

32:40: minutes in somehow and I would like

32:42: Davis to hop in and talk about at least

32:46: one of his favorite settings. So, Davis,

32:47: do you want to take it away?

32:48: >> Yeah, there's there's one thing in

32:50: particular I think people will find

32:52: useful. Um, let's see.

32:58: So in R Studio there's this like find

33:02: function slashfile

33:05: type of shortcut that I used all the

33:07: time. Uh and in Positron like for a long

33:10: time I was like I missed this thing like

33:13: how do I get this because

33:14: >> what was the R Studio shortcut?

33:16: >> Uh

33:17: >> do you remember question

33:18: >> put you on the spot?

33:19: >> I had to fire up my trusty R Studio for

33:21: the first time in forever. Let's see. uh

33:25: it's one of these control dot control

33:28: dot on my Mac would be like go to file

33:30: slashf function

33:32: >> and um let me show you like what it

33:34: looks like in dlier

33:36: uh so like in dlier if I hit control dot

33:39: there's a file called arrange but and

33:44: that would be arrange r here but it also

33:48: lists like functions in the project so

33:52: if I wanted to go to the function

33:53: arrange rows like everything is just

33:56: listed together so I can jump straight

33:57: to arrange rows. Um, and I jump around a

34:01: lot when like I'm working on an R

34:02: package. So over here in posetron and

34:04: dlier like if if I did the same thing

34:06: with like uh command P and I just

34:11: started typing in arrange like the

34:14: default is just to show you files but I

34:18: really missed the symbols. like to get

34:20: the symbols you would have to do like

34:22: the like hash symbol and then you could

34:25: type in a range and I could never

34:28: remember this like I would I I always

34:30: just hit command P and expected to work.

34:32: Um there is a setting

34:36: called

34:37: search quick open include symbols and we

34:41: can post this in a second. And if you

34:44: set that to true, then it works much

34:47: more like our studio where if I hit just

34:50: again command P now and type in arrange,

34:54: it includes both the file

34:57: and the symbols. So if I want to jump to

34:59: arrange rows, I can jump straight to it.

35:02: So this for me was like a a game changer

35:04: and like I I totally missed this from

35:06: our studio and was super sad that I

35:09: could not find this. But

35:11: >> oh my goodness, Nathan has one as well.

35:13: Just to call out Nathan again that like

35:15: he set up as a I think it was a snippet,

35:18: right Nathan? He shared it earlier in

35:19: the chat. Nathan, if you want to share

35:21: it again, feel free. Um because he

35:25: missed the ability to quickly just do

35:27: the like the click data set to import it

35:30: when it's a I think when it's a RDS

35:32: file. Um so I will let him share that

35:36: his solution around that. And I think

35:38: that Julia saw it. I think I sent it to

35:39: Julia and she was like this is a great

35:42: idea. Yeah, we're going to add this as

35:42: an issue. It just goes to show go work

35:44: out loud. Go like make a blog post of

35:46: the thing that you do. Um, share it with

35:48: people because it's often a great idea

35:51: to not just you, but to other people.

35:54: Um, okay. So, we had a couple of good

35:56: questions and Isabella behind the scenes

35:58: was like letting me know that cool

36:00: questions exist. Thank you so much,

36:01: Isabella.

36:03: Um, and one was about, let me see if I

36:05: can go find it.

36:09: It was about shifting focus using

36:12: keyboard shortcuts. So in our studio

36:15: control 1 in the console, control 2 in

36:19: the terminal or function F12 like next

36:22: tab or script.

36:24: Is there a way to do that focus shifting

36:27: inside of Posatron? Davis or Isabella,

36:30: do you know? Because I do not know.

36:34: I can I can say a little bit and let me

36:38: start and then you can add anything

36:39: extra. So if you do add the like our

36:42: studio keybinding setting, this is the

36:45: list of things that like you get from

36:47: that adding that setting of saying like

36:48: I want to use our studio key bindings

36:51: and one of them is like if you do

36:53: control or what is that? Yeah, control

36:55: one it focuses on like the code. If you

36:58: do control two it focuses on the

36:59: console. So, if that's what you're

37:02: looking for, that does exist if you have

37:04: if you opt in to the R Studio keybinding

37:06: settings.

37:07: >> Perfect. That's ex that's extremely

37:10: helpful. I don't know if that exists for

37:12: Python. I like being able to turn it on

37:14: for R Studio, but

37:16: >> see. Yeah,

37:18: >> I wonder if you turn it on turn on those

37:20: key bindings in R Studio. I think that

37:23: they all have the win clause sort of of

37:25: like applying only to the R language.

37:28: Um, but I bet you could go modify that

37:31: to include Python. Maybe

37:33: >> there's so many hacking.

37:35: >> That was be my recommendation. I just uh

37:38: would probably reverse engineer all of

37:40: the keyboard shortcuts you want from R

37:42: Studio and you can just put lang equals

37:44: Python and it's Python all lowercase.

37:47: >> Yeah. Do you So like I have my little

37:50: keybindings.json. It just has my snippet

37:52: in it. Is there a way for me to go see

37:55: what the JSON is for those other key

37:57: bindings in the UI?

38:02: There is a command

38:05: um I believe there's a command shift P

38:07: to

38:09: do keyboard shortcuts and like um open

38:13: Yeah, do command shift P. Maybe I can

38:16: >> Oh, I found it. It is. Yeah, it's like

38:18: open keyboard shortcuts JSON.

38:23: >> Okay, so I did command shiftp and then

38:26: again I just typed in keyboard, but

38:28: instead of type instead of the one that

38:30: was the um toggle keyboard shortcuts

38:34: or whatever it was, it was this default

38:37: keyboard shortcuts JSON. And that opened

38:40: this which gives you all of the like key

38:43: combination, what the command is, the

38:46: when clause for it. Um, and so what we

38:49: were looking at was

38:51: all those R Studio ones probably have a

38:54: um something just like this where it's

38:57: like editor laying equals R or equals

39:00: equals R. Um, this could just be added

39:02: to something to be equals equals Python.

39:06: So you can reverse engineer a lot of

39:07: those things.

39:09: Okay, fantastic. Let's hop back over to

39:13: Thank you anonymous asker for your good

39:15: question. Um, I'm gonna hop back over to

39:17: Slido and have Rory. Oh, wait. Rory has

39:22: a little asterisk. That means ask it for

39:24: me. So, Rory said, "How do you find

39:26: trustworthy and reliable extensions?

39:29: There are an overwhelming number in the

39:30: marketplace and it's hard to know which

39:33: ones to use." While we were talking

39:35: about this, I will just hop over here

39:36: and like we'll go look at the enter

39:38: folder one. Um, it can be really

39:42: nerve-wracking. So, when you click

39:43: install, which like if you have a brand

39:45: new one, it just says install.

39:47: It's going to ask you questions usually

39:51: that are like, do you trust this author?

39:53: And you're going to say, I have no idea

39:56: who this author is. Um, and I think that

40:00: Jenny might have put in the chat that

40:03: like it's it's Vibes. [gasps]

40:06: I don't have any way to like go look at

40:08: this person and know. Um, I'm going to

40:11: go install this one. It'll give me the

40:13: question. Do you trust the publisher?

40:15: Mecca Troner. I don't know. This might

40:18: be a perfectly trustworthy person. I'm

40:20: going to say trust publisher and

40:22: install. Um, but like if you want to

40:25: learn more, it's just going to open up

40:27: the security policy. It doesn't give you

40:30: more info on this person. Um, but there

40:33: are other things that you can look at,

40:35: right? And you can usually go find their

40:37: GitHub repo and stuff like that. their

40:39: change log. You can look to see whether

40:41: or not this is like a maintained thing.

40:44: This clearly has lots of versions and

40:46: lots of like version notes in the change

40:48: log. Um it has a well fleshed out like

40:55: list of commands. That stuff all makes

40:57: me feel better. So if there is something

40:59: that makes you feel better when you are

41:01: looking to install things, let me know.

41:05: Um, Davis or Isbel, do you have any like

41:09: other favorite extensions we can share

41:11: really quickly before we hop back to

41:12: Slido?

41:15: >> Uh, in terms of like Well, just one

41:17: other thing to like make you feel

41:18: better, right? Like like I always look

41:21: at the download count for sure like

41:23: that. I mean, if it's over 20,000 or

41:25: something, it's probably one that's

41:27: fine. Like

41:28: >> Yeah. Um, and then you said that you you

41:30: mentioned the GitHub link. Like if you

41:32: scroll down in this marketplace section,

41:34: the repository link is like almost

41:36: always here. And then you know that'll

41:38: take you straight to GitHub. You can

41:40: kind of see look at the look at the star

41:41: account, see like is it active,

41:44: >> does it seem scary?

41:46: >> You can look at at extensions, look for

41:48: people that you know as well. Um, so a

41:50: lot of our positron devs actually have

41:52: made extensions and like they like Sam

41:54: made one that's also sort of like a

41:56: folder one. Um, so you can look for

42:00: names that you might trust. You might

42:02: not always recognize them depending on

42:04: what their name is on their GitHub repo.

42:07: Okay, Isabelle, any favorite extensions?

42:09: Or Isabelle or Daniel, any favorite

42:12: extensions?

42:14: Feel free to hop in and unmute whenever.

42:19: Um I so I work a bit with the shiny

42:23: engineering team and

42:27: um Garrick posts um he has a extension

42:31: pack of all the stuff that he uses and

42:33: he sort of collected it all together

42:34: into one giant extension pack. I put it

42:36: in Discord and I'll put it in um Zoom

42:39: chat as well. Um but yeah, it's just a

42:42: big collection of other packages that um

42:46: he uses. So I'll just make a plug for

42:48: that. Um, Isabella did just tell me I

42:50: don't know if there's a security issue

42:52: or not. So, I'm going to look into that,

42:54: >> but um, but it's like it's it's not

42:57: something he wrote. He just collected a

42:58: bunch of other packages. So,

43:02: um, I'll look under the hood

43:04: >> um, what's going on there to clarify.

43:06: >> Okay. Well, while we are talking about

43:09: extensions that do very important

43:12: things, I would love to talk about

43:13: Publisher. Um, this is something that I

43:16: don't use, but we had a question. We had

43:19: anonymous question in the slidoh that

43:22: was, "How do people publish to

43:24: shinyapps.io from positron? I do all of

43:27: my code editing in positron, but end up

43:29: closing the folder I was working on in

43:30: positron and then opening that folder

43:33: project in our studio only to do this

43:36: since it isn't built in to positron."

43:39: Um, Edward Clayton, Edward Leland.

43:41: Sorry, Edward. I I I know who you are. I

43:44: promise. There's a publishing button in

43:46: Posatron and you have this like

43:50: he has a link there which I am going to

43:53: copy and put into the discord chat. Um,

43:57: would anybody like to talk about

43:58: publishing? I have switched away from

44:00: shiny apps.io to posit cloud. I do

44:04: things in the Posit Connect cloud UI

44:06: which means I log into it. I give it the

44:08: repo. I create a manifest. I give it the

44:12: manifest and then every time I just push

44:15: changes to my repo that contains my app,

44:17: my app is automatically updated and I

44:20: don't even think about publishing

44:21: anymore. I just push changes to my repo

44:23: and my app is immediately updated. So,

44:27: does anybody here use Publisher and can

44:30: talk a little bit about it? Davis, do

44:33: you have any note? Isabelle,

44:36: >> I do use Publisher. Um, I

44:41: don't know if it supports shiny app.io.

44:43: I uh I do know that it works with

44:46: Connect Cloud. Can really quickly share.

44:50: Um, this is not a super good example

44:52: because it is a Python package. Um, but

44:57: you can select like create a new

45:00: deployment. We'll say we're deploying

45:02: this. I don't know if I can even do

45:03: that. It's fine. Um, and then I

45:06: previously did like a single sign on

45:08: like one click authorize to connect

45:11: cloud

45:13: and then it will automatically slurp up

45:15: a lot of information. Obviously, it's

45:18: not a good example, but you can click

45:19: just deploy your project right here. And

45:21: then on followup like applications for

45:24: like streamlet or dash or

45:27: uh shiny and all of those, you get your

45:29: little oneclick. It's this exact same

45:32: icon in all of your Python files. Um, it

45:35: also will know things like what Python

45:37: packages you're using and it does a lot

45:39: of really cool sniffing. Um, so I also

45:42: don't feel like I have to think about

45:43: publishing really at all. Uh, I just

45:45: kind of click my buttons and things

45:48: magically appear on the cloud.

45:51: >> It's really fast.

45:52: >> And if you want to know where we are

45:54: looking for this publisher, you can go

45:56: to your extensions and look up

45:57: publisher. It's this one right here.

45:59: called Posit Publisher by Posit Software

46:01: PBC. Um, nice and trustworthy,

46:05: but I think that it's bundled, right?

46:09: Like I've never turned this on. I didn't

46:10: install it. I have always had this

46:12: button.

46:15: >> Am I wrong?

46:16: >> I don't think it's bundled.

46:19: >> Nobody can stop me. I might have

46:21: installed it and just not remembered

46:22: installing it cuz I don't use it.

46:25: Okay. But if you are curious and you

46:27: want to go read this page about it, you

46:30: can, which has its features and change

46:33: log and everything. Um, and then

46:36: Nick, I think in the chat had said

46:39: Nathan says he thinks it is bundled. You

46:41: guys,

46:41: >> I think it is, but I think it is. I just

46:43: checked.

46:44: >> Okay, good. Um, you can

46:48: let me see. Hold on. Let me let me read

46:50: the chat really really quickly.

46:52: Um because Sai had asked if there was a

46:55: size limit for apps like the 5 gigabyte

46:58: bundle if you do host on connect cloud.

47:01: What a good question. I wish we had Alex

47:03: here to just like chat about connect

47:05: cloud stuff. If this is interesting to

47:07: y'all and you want to see like I know

47:08: Nick you said that would be a good

47:10: workflow to share on screen like just

47:12: pushing to your repo and having it

47:13: update your app. My apps that I have are

47:16: on my personal laptop. They're not on my

47:18: my Posit laptop. So like I can't do that

47:21: here but I would be happy to do a call

47:23: like this a like data science lab where

47:26: we just talk about connect cloud and how

47:28: that publishing works. Maybe do a little

47:30: like hey I want to move from shiny apps

47:32: to connect cloud. If that sounds

47:35: exciting to you let me know in the

47:37: discord server because I would be happy

47:40: to and we can also get um our like posit

47:44: connect cloud people to join us and give

47:46: us all the information. Um, Nick says,

47:50: "Yes,

47:52: fantastic." Sai, I do not know if there

47:55: is a size limit for apps. Does anybody

47:57: know? Daniel says that he doesn't

47:59: remember a size limit either. Um, but

48:02: yeah, you can you can do connect cloud

48:04: deploys direct from GitHub and GitHub

48:07: does have a file limit. So, it could be

48:10: something that you run up against on

48:12: that slide. All right, I'm going to head

48:14: back to Slido really quickly. Thank you

48:16: so much for asking the shinyapps.io

48:18: question.

48:21: Um

48:23: I wanted to talk really quickly at the

48:26: end here

48:29: about

48:31: theming.

48:32: Okay, we had a couple of things on theme

48:35: and Marlene had said is anybody using

48:38: their rain rainlow extension and Nick

48:41: says that he is also using it. Um, so

48:44: why don't we talk about themes for a

48:46: second?

48:49: Um, Isabelle, are you I know you have

48:53: lots of like theme stuff set up. Do you

48:55: change your themes frequently or do you

48:56: stick to a light theme? I am always a

49:00: light theme person. Um, but I I don't

49:05: have any installed right now just

49:06: because working on Positron, we tend to

49:08: like clear our state and get a fresh

49:10: slate frequently. But there's an arctic

49:13: blue bearded

49:16: something like that that I

49:19: >> um any of the bearded themes I'm

49:21: obsessed with. There's a good blueberry

49:23: one. Um those are those are my top

49:26: recommendations.

49:28: >> Okay, excellent. Well, I searched

49:30: Rainlow so that you can see rainbow

49:32: rainlow colors. Um, and I will install

49:35: this.

49:38: And then it popped up to select a color

49:40: theme right now. And before you click

49:43: anything, whenever you do this, whenever

49:44: you see themes inside of this drop down,

49:47: I would recommend just using your

49:48: arrows. Like, it's going to cycle

49:51: through all of these for you.

49:55: I'm always a contrast person. I have low

49:57: contrast vision, which makes it very

49:59: hard for me to distinguish like colors

50:00: from each other. Um, so I tend to always

50:04: do I'm a fan of that one. We're gonna

50:07: stick with this one for right now. I'm

50:08: just gonna hit enter and it's going to

50:09: apply. It's going to ask me if I want to

50:11: have that as my theme, I think. Um, but

50:14: I actually maybe I don't want to. Oh, do

50:18: I want to?

50:21: No. Okay. So, let's head over to our

50:26: faces again so that we can say goodbye

50:28: because we have three minutes left.

50:30: Maybe we can answer one more question.

50:36: Marlene says, "I missed the import data

50:39: set wizard from R Studio." That is

50:41: something that I I said Nathan had like

50:45: shared about. Um Davis and Isabelle, do

50:48: you have any words of wisdom for import

50:51: data set wizard type stuff from R Studio

50:54: in positron?

50:57: I guess more for D.A. since this is an R

50:59: thing for sure.

51:00: >> Or Jenny, are you listening and you know

51:03: more? [laughter]

51:04: >> Don't put Jenny on the spot. Two minutes

51:06: to the end of our thing.

51:09: >> Sometimes Julia is a great call out,

51:10: too, cuz she'll be like, I know exactly

51:12: what issue we're tracking the

51:13: possibility of adding this in.

51:15: >> Yeah,

51:15: >> there is an issue. I um I'll put it in

51:18: the Slack right now. That was going to

51:20: be my call out. Give it a thumbs up.

51:22: It's 5515. So, it's a fantastic number.

51:25: Um,

51:27: so if you're interested in this data

51:29: import wizard, we do look at top voted

51:31: issues um, when we are prioritizing

51:34: things.

51:35: >> Gave it a thumbs up.

51:36: >> All right, I was finally allowed to

51:38: unmute.

51:39: >> There you go.

51:39: >> Hey,

51:40: >> I was like I was like I felt like I was

51:42: trapped. I'm like I have something to

51:43: say.

51:44: >> Oh, this is Jenny. Um, yeah, we haven't

51:46: done this yet. The closest thing that

51:49: does exist is convert to code in the

51:51: data explorer, which brings up a whole

51:52: new uh thing that we haven't gotten

51:55: into, nor do we have time to, but yeah,

51:57: um it's on the to-do list, but it just

52:00: hasn't happened yet.

52:03: So,

52:03: >> no worries.

52:05: The GitHub, by the way, for everybody is

52:07: like the best place to go to

52:10: keep track of what we're doing, of like

52:12: what what is getting added. And if you

52:14: find an issue for a feature, go put a

52:16: thumbs up on it, right? like that gives

52:17: us our best view into like what is

52:19: important to people. Today was really

52:22: really fun. This is going to end up on

52:24: YouTube so other people can watch it. I

52:25: hope that you had a good time because I

52:28: don't think I have like a survey set up

52:29: in Zoom. I would love it if you could

52:30: hop in the Discord server and send me a

52:33: DM and let me know how this went. You'll

52:34: have to send me a little friend request.

52:36: Um please feel free to hang out on the

52:39: Discord. The Discord is going to be a

52:41: place as we move forward where you know

52:43: that anything you ask, you're asking a

52:45: bunch of data people and like nobody

52:47: else like if you put it out into

52:48: Twitter, it might go nowhere, right? But

52:50: um everybody here will be data

52:52: scientists and they will engage with you

52:54: and answer your questions. I'd be happy

52:56: to chat about it. Also, we're going to

52:59: have more of these because this was so

53:00: fun. This was an experiment. We're going

53:02: to do them maybe weekly, maybe

53:04: bi-weekly. I know we have a bunch of um

53:06: holidays coming up, so that will put a

53:08: cramp in some things, but you can look

53:10: forward to 2026 being a little bit more

53:11: stable for us. And we will do things

53:14: again like this settings. We'll do Q&

53:17: A's. We'll do um sharing silly projects.

53:19: So, Davis, thank you so much for hanging

53:21: out with us. Isabelle, thank you so much

53:23: for hanging out with us. Would you like

53:24: to say goodbye to everybody? It

53:26: >> was great to see you all.

53:27: >> Thanks for joining.

53:28: >> Thanks for coming. Yeah.
