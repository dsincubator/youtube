---
type: Video Transcript
title: "Mind-Blowing Quarto Slide Extensions 💬 🖍️ 🤯 | Emil Hvitfeldt | Data Science Lab"
description: "He's in the leaderboard for repeat guests at the data science lab, Emilfeld."
resource: "https://www.youtube.com/watch?v=vQbhFORULJc"
tags: ["ds-lab", "terminal", "github", "r-packages", "quarto"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T21:59:18Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=vQbhFORULJc"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2026-07-23T00:00:00Z"
    usage_count: 3725
usage_window: { from: "2026-07-23T00:00:00Z", to: "2026-09-08T21:59:18Z" }
---

# Transcript

00:07: Okay, today I am so excited to introduce

00:10: our featured lab manager who is a

00:13: two-time guest. He's in the leaderboard

00:15: for repeat guests at the data science

00:18: lab, Emilfeld.

00:21: Thank you so much for being here. Um,

00:22: would you like to introduce yourself?

00:25: >> Oh, thank thank you for having me. So,

00:27: I'm uh Emil. I'm on the tidy models team

00:30: trying to make modeling better and on in

00:34: my spare time I do a little bit of of

00:36: slide roy with claw

00:38: >> which is what we'll be talking about

00:41: today.

00:42: >> It's his secret passion. We're going to

00:44: talk all about that today. I'm also

00:45: joined by Isabella Velasquez. She is

00:48: here. Would you like to say hello?

00:50: >> Hi everyone. Thanks so much for joining.

00:54: All right. I say let's go ahead and get

00:56: started. So, Emil, today we are going to

00:58: be talking about slide crafting in CTO.

01:02: And slide crafting, I feel like, is a

01:04: word that you use a lot. I like it. Um,

01:06: what we're really talking about is the

01:08: output format of Reveal.js

01:10: and all of the magical extensions that

01:13: you have been working on over the years,

01:15: including very recently to make slides

01:18: better. Would you like to share your

01:20: screen and give us a little bit of a

01:22: primer?

01:24: >> Yes.

01:24: >> Before we dig in. Okay. Awesome.

01:30: >> Just moving everything away.

01:34: All right.

01:36: All the way. All right. So, like

01:38: everything we'll be doing today is like

01:40: auto related. So, like it's how you

01:43: would expect

01:45: everything to be. So, you do thro and

01:47: you put a format, but we're doing slide

01:49: drafting or like making slides

01:51: presentations.

01:53: And the main difference here is we're

01:54: setting a different format. So here

01:57: that's an example of where we create a

02:00: HTML page and also made PDFs in

02:02: different ways.

02:04: But by setting this format to reveal JS,

02:08: we are getting something that looks like

02:10: this. So now it everything is like in a

02:14: nonstrollable format and we can advance

02:17: and see like slides how you would expect

02:20: slides to be in a presentation format

02:23: and you can do like most everything you

02:26: can do in a normal like document. So we

02:29: have like out chunk highlighting,

02:33: little animation highlighting. You can

02:35: basically do everything you expect and a

02:38: couple of like things that are specific

02:41: to slides. Let's see some. So, one of

02:44: the things which we'll get to later is

02:50: normally you press the arrows to advance

02:52: to the next slide. But sometimes you

02:56: also want something to happen within the

02:58: slide itself

03:00: and that's in revealjs terminology

03:04: called a fragment. So you have your

03:07: whole slide but you're turning into

03:08: fragments. So the an easy way of this is

03:13: just the idea of an incremental list.

03:17: So here we are not actually creating

03:21: three or four different slides each with

03:25: one more element. They're all happening

03:28: on the same page. But when we press

03:31: next, it just modifies the slide itself

03:34: instead of creating copies over.

03:39: And it can do all the little things like

03:41: zoom in, fades in, and and what have

03:44: you.

03:44: >> And this is all just built into Cortto.

03:47: No extension needed. This is default

03:49: behavior. Yeah.

03:50: >> All of it. Yeah. And it just a few more

03:53: things. That's like little menu.

03:56: And you can see the slides. And there's

03:58: some tools too, which I think is very

04:00: nice. And you can also see well it says

04:03: what they are but there's also like a

04:05: little if you look at the top wise is

04:07: full screen but it's also F. So if you

04:09: press F it it it it it full screens as

04:13: well.

04:14: >> Yeah the my favorite one is E. Like if

04:17: you're ever like I'm looking at this but

04:19: I I just want to print this out as a

04:21: PDF. Just hit the E key and it will turn

04:23: into a PDF for you to print out.

04:26: >> Yeah. So, if you press as Libby said, if

04:30: you press E, it turns into a strollable

04:33: thing, which doesn't seem useful, but if

04:36: you line it up and try to print it,

04:40: it prints in how you would expect it to

04:44: print. So, as long as you're not doing

04:46: anything crazy or like have videos,

04:50: >> it now you now have

04:54: something that you can turn into PDF

04:57: where otherwise it's technically it's

05:00: because this is technically a website

05:02: that is being hosted. This one is being

05:05: hosted online using local hosted as

05:08: yourself.

05:10: Gregory is asking, "Does that PDF export

05:14: still use Pandock or is there an option

05:17: of exporting via typed?"

05:20: >> So, uh,

05:23: none of this uses pand technically. I'm

05:26: pretty sure, and I might be wrong

05:29: because I'm not that deep in the portal,

05:31: but I'm pretty sure reveal.js

05:34: is one of our nonpainted paths. So,

05:38: we're just turning something into

05:39: something that Reveal.js understands.

05:42: And then Reveal.js does a thing. And

05:45: then this PDF export mode is just

05:51: basically fancy CSS that makes it so

05:54: when you try to print it, everything

05:56: aligns how you would expect it to align.

05:59: So, I'm pretty sure it doesn't do it.

06:01: There's other ways, too. I found a way

06:03: where you can use the Office Libra.

06:06: um CLI that can turn

06:11: things around. So, a bunch of different

06:12: things, but I don't think this and this

06:15: also doesn't use typed, right? Cuz this

06:17: is technically

06:20: a HTML format like first and foremost.

06:27: >> All right, I'm going to pause for two

06:29: two quick seconds and ask you if you

06:31: might change your mic to your laptop.

06:33: >> [laughter]

06:34: >> I think we are having some Bluetooth um

06:38: connectivity issues.

06:42: Um if you go down to your audio in Zoom,

06:46: so if you you might need to stop

06:47: sharing. Yeah, in Zoom, go down to audio

06:50: and the little arrow next to your audio

06:52: button and then change your mic at the

06:54: top to be your laptop. Let's see if that

06:57: sounds a little bit better. Wait, I have

07:00: an audio button.

07:03: >> You might need to stop sharing.

07:05: >> Oh, stop share. Yeah.

07:07: >> Yeah. And at the bottom left, you'll

07:08: have an audio button.

07:09: >> Yes.

07:10: >> Sorry. Sound engineer Libby is making us

07:13: stop for two seconds. We should have

07:14: done this beforehand.

07:17: Everybody, if you use AirPods as your

07:20: microphone on your Zoom calls, I want

07:21: you to know that the sound is probably

07:23: not as good as you think it is.

07:25: >> All right. What about now?

07:26: >> Oh, so much better. We have thumbs up

07:29: from Gregory. Okay, amazing.

07:31: >> Oh, sorry about that. We should have

07:32: done that before.

07:33: >> We should have I know we missed it.

07:36: >> Gregory says it's crispy and clear.

07:39: >> Perfect. So everything we said

07:41: [clears throat] everything is just a

07:41: HTML format and reveal.js

07:44: is its own thing

07:47: and so Troto is just creating something

07:50: that Reveal.js understands.

07:54: Right. So let's see how it actually

07:55: looks on on our end.

07:59: So

08:02: So

08:06: I always like to be on the desktop

08:09: because at least for demos because I

08:11: have a lot of different things in here.

08:13: So you can create a

08:16: actually many things. Let's see. New

08:19: file. Do we have it? if you're in

08:21: Posatetron and have the Troter extension

08:24: installed, which I will show in just a

08:26: little bit. But we don't have

08:31: that's just

08:32: >> we have like a slide deck project

08:35: template, but we can just change our

08:36: format. Yeah.

08:38: >> Yeah. We can just for now.

08:44: So if you just do nothing

08:46: when we bend on save.

08:50: So the way you normally do it is you

08:51: have a section

08:54: and

08:56: new slide

08:58: text

09:01: and we can do

09:04: that.

09:08: All right. So we added

09:11: So the way it works is if you have a

09:13: title, it will show up and if you do a a

09:17: subtitle,

09:21: it will show up. I don't really use the

09:24: title and subtitle because the styling

09:26: is weird and very like esoteric and

09:29: specific only to the title slide.

09:33: So, and if you just remove it,

09:36: it just go directly to the first uh

09:40: section. So, you denote each new slide

09:43: with like a level two heading. So, this

09:45: like the two hashtags

09:48: and that denotes a new slide. So, we

09:51: have detached here. We advance over and

09:55: we're putting in the plot by itself.

09:58: There's technically also

10:03: a level

10:06: level one

10:08: heading that also does something. So

10:11: that's the idea of a technically a

10:14: section.

10:15: So here we have our slide slide and then

10:19: this level one heading here is like

10:22: slightly differently styled to be like

10:25: down in the middle and it doesn't really

10:27: mean much but it has this like nested

10:32: idea

10:34: in it. I don't really think it's that

10:36: important, but if you I sometimes use it

10:40: if you imagine you have a slide that

10:43: will like three parts of like idea,

10:47: implementation,

10:49: results. You could have those as level

10:52: one headings to give a little bit of a

10:54: different vibe and and sort things by,

10:57: but you don't actually do much.

11:01: Um,

11:04: there's a million little settings.

11:08: Uh,

11:10: and the YAML doesn't always let do what

11:12: I want it to do.

11:14: >> It doesn't for me either.

11:16: >> I know. And that will be improved a

11:19: little bit later.

11:21: Uh, so if you have proto, you probably

11:25: also have it installed as a CLI tool.

11:29: So you can use proto use template and

11:32: then you can put in

11:34: like a GitHub name of something.

11:39: So so I have a template. So if you use

11:42: proto use template and then em vitfeld

11:46: reveal js template.

11:50: We say I trust myself and I want it as a

11:53: subdirectory. Yes. And we just call it

11:56: demo.

11:59: And then we can open it.

12:03: We don't care about this.

12:10: So this is a very small demo

12:14: or the template I use for all my slides.

12:17: And it doesn't have a lot, but it has

12:18: enough of the things you need to

12:20: remember. So the slides look the same as

12:23: how they did before,

12:26: but I added a couple of things I never

12:28: remember. So I I'm setting a different

12:30: width and height to everything. The

12:33: aspect ratio is fine in the other one,

12:35: but if you do any tote on slides

12:40: with a font size big enough that people

12:43: can read it,

12:45: I find that this aspect ratio is

12:47: slightly better cuz otherwise you can

12:50: only really put like 40 characters in it

12:52: before it starts wrapping and then it's

12:54: not nice.

12:56: Um, this page title here is

13:01: kind of weird because what this actually

13:04: means is the name of the tab in the

13:08: browser of this specific page. But

13:11: otherwise, I think it's untitled or just

13:13: index. So, if you're giving a to you,

13:17: you can put the name of the to here and

13:19: then it actually shows up in the browser

13:20: directly when other people read it.

13:23: >> I really like that.

13:25: And I don't remember what the all the I

13:27: have them here. I don't like to line

13:29: number. So like if you have a toad chart

13:32: like oh we don't even if we set to true

13:36: here

13:40: we see that it's not that style that

13:42: last right here but the oneplus one is

13:43: being shown but it's being showed

13:45: without

13:48: the numbers but if we add the numbers

13:50: back in it's just like a little one. I

13:53: don't really care for that. So I like in

13:55: my default I turn it off.

13:57: >> I like this too. This is um leads us

14:00: into Raha's question actually which is

14:02: this UI that you're using for slide

14:03: generation. Is this exclusive to

14:05: Posatron?

14:06: [clears throat]

14:07: >> No. Like this should work anywhere

14:09: really like there is

14:11: >> because we're in Posatron we have like

14:14: some audiences. So like and we have the

14:16: to extension in that's why we have the

14:18: preview button and the render on save

14:21: and some little nicities like that. But

14:23: you can also do everything like this by

14:26: just throwing

14:29: >> a lot of this is just that Corto's I

14:32: mean that Patetron's UI is just really

14:34: really changeable and customizable. So

14:36: what Emil has is a sidebyside view where

14:39: his source is on the left and his like

14:42: terminal and viewer and everything else

14:44: is on the right and he also has render

14:46: on save on. So every time he makes a

14:48: change he's just going back to the

14:50: viewer and it's listening for his

14:51: changes constantly. he saves and then

14:54: that change is just showing up in the

14:55: viewer.

14:56: >> Yes. And then the last two things I have

14:59: in my template is the I already have

15:03: preset up a SL like some very light CSS

15:09: and it's already like put into the theme

15:12: and I know this is like the syntax I

15:14: need for it. Another thing is if you do

15:16: anything where you need JavaScript,

15:20: you need to put it in under include

15:23: after body. So I already have just an

15:26: empty

15:28: HTML file with a strip tag in there. So

15:32: if I need to add some JavaScript

15:35: somehow, I'm all it's already lined up

15:39: how it needs to be. And it doesn't hurt

15:41: right now. So if you use this and don't

15:43: use that file, it's fine. But I never

15:46: remember where to put it. If it's

15:49: include, after, before, whatever. So

15:51: this is just everything I need. Right.

15:54: So let's

15:57: Oh, so one last thing before we move on

16:00: is there this idea in I want to say it's

16:03: in pandot, but it might just be a

16:05: markdown thing, but this idea of a nest.

16:08: Oh no, actually before we do any of

16:09: that, let's quickly do extensions.

16:16: So if you go to the extension

16:18: marketplace,

16:20: I'm pretty sure you already have

16:22: installed when

16:24: >> that was my question. I was just putting

16:26: in the the discord, I think it's bundled

16:30: with positron.

16:32: >> I know at one point it wasn't and at one

16:34: point it was, but I don't know where we

16:36: are now.

16:37: >> Okay. It might depend on when you

16:38: install drive then

16:40: >> but but it's easy to install. You just

16:43: type CO it should pop up fairly high and

16:47: then you just press install and it like

16:49: reloads and that gives us a bunch well

16:52: that gives us all of this the preview

16:54: went on save but that's how all of that

16:56: is happened I think is through the

16:58: extension but it also gives us a couple

17:01: of other little nicities. One of them is

17:05: this idea of short codes to codes I

17:07: think it's called. So if I do

17:11: columns

17:13: I did these two little like insert

17:16: things.

17:20: So this is a what we call a fenced death

17:26: in

17:29: when I say malto.

17:31: So on a slide, we typically want to put

17:35: things side by side.

17:38: And since all of this is like HTML, CSS,

17:41: things that sometimes can be a little

17:43: bit of like annoying to deal with, we

17:45: have this built-in thing called columns.

17:49: So we start with like just like this.

17:54: This is a div which is a HTML like

17:57: container of content. And we add on this

18:02: syntax here means divid the class name

18:05: columns

18:07: and then this this a nested structure.

18:10: So inside of it we're putting two

18:12: columns

18:14: in it and then inside those then we put

18:18: content. So this is a way of us to make

18:20: sure we have things that happen side by

18:22: side.

18:24: You can do with here to be.

18:33: Yeah. So, you can also set the W. So, we

18:36: can technically put

18:41: like five.

18:43: >> I'm glad that you're adding more because

18:45: Andrew had just asked, is there a

18:46: maximum number of columns you can have?

18:48: So there's technically not like

18:50: functionally there's not a match but

18:52: like visually you're going to run out of

18:53: space real fast,

18:54: >> right? Yeah. Visually it's going to push

18:56: you off the margins after a little bit

18:59: and

18:59: >> and this is some CSS that I think these

19:02: are bundled with reveal JS itself or

19:06: something that CO added on top. But this

19:08: is like how we we can add a div and we

19:11: can ship some CSS with it. Right. But

19:14: the exciting part is since all of this

19:18: is just HTML and CSS, we as the like

19:22: users of this can do the same things.

19:27: So

19:29: in here, so let's

19:33: let's just do it easy. So if I do a

19:36: thing called red. So I'm making a class

19:38: CSS class called red and I'm saying the

19:42: color should be red of this. So I just

19:46: created a little CSS class here called

19:48: red.

19:50: If I now add that in here,

19:56: it now turns everything in that one

19:58: column red or the text inside that

20:01: column red. So this is obviously not the

20:04: best example but we could imagine that

20:06: this it spans out of

20:10: different things and this is basically

20:12: how all the slide word

20:14: works in here. So,

20:19: let's look at

20:21: one extension I know. Oh, nice.

20:25: Let's load one extension that I made

20:28: recently that in a way showcases a

20:31: similar thing to this.

20:33: >> I'm so excited about extensions. If you

20:35: don't know what an extension is, it's

20:37: not a package. It's a little bit

20:38: different. So, Emil's going to talk a

20:40: little bit about how they differ.

20:46: So here's that one extension. So the way

20:49: you so

20:51: the important thing is we first look in

20:53: and see how do we install it and most

20:57: extension have an installation link.

21:00: So we just look and

21:02: >> and this is a terminal piece of terminal

21:04: code that you're running. It's not in

21:06: your R console or your

21:07: >> Python. And I will show a different way

21:09: to install it to that you can use but

21:11: I'm I'm partial to the terminal. So we

21:14: then say yes, I trust myself

21:17: and then basically this

21:21: uh we would continue and no. So

21:25: basically it first ask do you trust this

21:26: person to download these files because

21:28: it's essentially the throttle add

21:32: command is a very fancy copy paste. So

21:36: it looks at the repo and then copy paste

21:41: a folder into your working directory.

21:45: There's a couple of things. So like you

21:47: can like exclude things but essentially

21:49: just copy paste over and at the end it

21:52: also asked hey

21:54: do you want to open the documentation.

21:56: So but since I I wrote it I know where

21:59: what happens. So what really happened is

22:02: it added this

22:07: this uh underscore extensions

22:10: folder if it wasn't already there and

22:13: then it added this extension called chat

22:16: bubbles which we will see

22:18: and it has like some information about

22:22: what happens and then it bundles some

22:26: CSS and some JavaScript so that's it's

22:29: just functionally copied over some CSS

22:32: and some JavaScript

22:34: that we can now use.

22:38: Um,

22:40: yes. Should we answer some of the

22:41: questions about?

22:43: >> Yes. I was just going to say, do you

22:44: want to pause for a second?

22:46: >> Yeah.

22:46: >> Because extensions can kind of be

22:48: confusing. You're like,

22:50: >> this is a weird thing. It's in the

22:52: terminal. It's not I'm just I'm not

22:53: calling something. I'm not using

22:54: library. Um, so let's start with

22:59: Gregory's question, which is one that I

23:01: don't exactly know the answer to. Uh,

23:03: Gregory said, "I saw in the release

23:05: notes from Positron um 179 that the

23:09: extensions will default to using the

23:12: Posit public package manager. Do we know

23:15: if extensions will still be submitted to

23:17: the open VSSX marketplace still?"

23:20: >> Yes. So, that is a straight question.

23:23: It's a little bit different. So this is

23:26: a question about um VS code extensions

23:31: but we will still cover it because I I'm

23:33: showing that too. So

23:36: >> because

23:38: names are hard so uh we're using

23:41: extension both to encompass things like

23:44: the Troto extension and all these other

23:47: extensions that you can install on your

23:51: posetron VS code. but we're also using

23:54: it for these add-ins

23:57: that you can add to your toler projects.

24:01: So,

24:04: all the tool extensions don't go on any

24:07: marketplace because they're just mostly

24:09: on GitHub, but you can also have them as

24:12: on a file on desk or whatever, but

24:15: they're not on they don't have anything

24:18: to do with the Open VSSs VS ads

24:21: marketplace at all.

24:23: Correct.

24:24: >> Um, okay. For for Posetron, just to like

24:27: round it up,

24:29: >> Posetron can only install extensions

24:32: that are on the Open VS apps

24:34: marketplace.

24:36: So, if you have an extension and publish

24:39: it, a VSO extension and publish it, it

24:43: by default don't go to the open VSS. You

24:48: need to do that separately. So if you

24:50: are a posetron, if you want to make an

24:53: extension that works on posetron, you

24:56: need to publish both places, which I've

24:59: done and it isn't like terribly hard,

25:02: but it is another set of domains you

25:04: need to do.

25:06: >> Okay, great. We have one more extension

25:08: question and then we have a couple that

25:09: are about um styling. So Hubert asked,

25:12: "Are these Cortto extensions global or

25:15: are they per project?" Great question.

25:18: >> Yes. So they were within the

25:22: project itself, right? So you could have

25:26: which it's not super recommended but you

25:28: could have like multiple project nested

25:30: but that becomes really messy. Um

25:33: generally like so you normally have you

25:35: can have a underscore YAML file and that

25:38: like denotes it project but if it isn't

25:40: there it just assumes that it's within

25:43: the folder you're in. But yeah, all

25:45: these extensions

25:47: are just within their folder that

25:49: they're being used in

25:52: and but they're also not that heavy like

25:55: I feel most of them are fairly small

25:57: >> so it isn't

25:59: >> like I wouldn't worry about

26:00: >> bloat your project.

26:02: >> Yeah. And then the thing that um I have

26:06: been helping or trying to explain is

26:08: like since it's not a package and you're

26:11: not calling it,

26:14: the version changes aren't as big of a a

26:16: problem. Like you've downloaded this

26:18: thing that is now sort of static for the

26:20: most part. I mean for for most

26:22: extensions. I'm not going to say for all

26:23: of them. I think there are some more

26:24: complex ones,

26:25: >> but for the most part you are like

26:27: downloading assets that that then you

26:30: can use in your project and you don't

26:31: have to worry. so much about whether or

26:33: not that GitHub repo that contains that

26:37: extension that you downloaded at one

26:38: time changes. It's not as big of a

26:41: problem. Um,

26:44: >> it's just a copy paste of a folder

26:47: essentially, right? And because one of

26:50: the problems you can get a little bit if

26:52: you worry about

26:55: problems like this

26:57: is like dependent

27:01: uh like extensions which doesn't

27:04: actually happen in Torto most like

27:09: people have looked at it a little bit

27:10: because it is kind of useful sometimes

27:13: but basically all Tor extensions are

27:15: separate like not like very few of um if

27:18: any install other things. So there's no

27:21: it is the version that it is when you

27:24: download it. There's no compile thing.

27:27: There's no oh let me find the most

27:29: recent thing of all the dependencies

27:30: like no it's whatever is in the repo

27:34: of the time that you did it.

27:37: >> Yes. It's a snapshot in time copy paste.

27:40: Okay. Uh, we have one from Zach that

27:41: said, "When you change those those text

27:44: fonts inside of those columns, could you

27:46: do it for all the columns at once? Maybe

27:48: by changing the top div."

27:51: >> Yes. So, he'll

27:52: >> demonstrate that real quick.

27:54: >> Yeah. So, we can say if we change the

27:55: red

27:58: up to

28:00: now all of them. And this is where you

28:03: need to know

28:05: like just how

28:07: CSS works because

28:11: there is

28:14: we have like the specificity in here. So

28:16: if we want to change all of them except

28:20: the inside one.

28:23: So we can set the outside one to red but

28:25: then one of the inside one to blue and

28:28: then the blue wins because it's more

28:30: specific.

28:32: Right. And and these are also just

28:34: variables, right? So like this red is a

28:37: variable that's representing a hex value

28:40: inside of that SCSS file which stands

28:44: for sassy CSS. So Emu could go into that

28:47: SCSS file and he could define blue as

28:49: whatever

28:51: >> hex code.

28:52: >> Change it like over

28:58: that might not show that well. But you

28:59: can just

29:00: >> the darker red.

29:01: Yeah. And so you can do a lot of like

29:03: neat things with that. And honestly, not

29:06: to turn this into AI uh lab, but AI is

29:10: really good at CSS.

29:13: >> So yes, if you're

29:15: >> is a very well doumented thing,

29:16: [laughter]

29:17: >> which is great. So um

29:19: >> we have one more question if we could

29:20: get to it really quickly and then we can

29:22: move on to showing these amazing

29:24: extensions because we only have like 25

29:26: minutes left. Um, notobco had asked, "Do

29:29: you also get grid logic like you have

29:32: with CSS grid?" I don't know anything

29:35: about CSS grid.

29:37: >> Yeah. Uh, we we don't, but it's great

29:39: idea and I might look into that. The

29:41: problem is the way the slides work is

29:47: the width really easy to define, but

29:51: it's just like from left to right. The

29:53: height of the slide is really hard to

29:54: define

29:56: because and if I can

30:01: do I don't want to open that.

30:03: Um do I have a

30:07: So if we draw into

30:11: I can't move in this one anymore.

30:23: demo. All right. So if we have so in

30:26: this slide right you have everything

30:28: looks nice and you can imagine what the

30:30: height is but because of the way the

30:33: styling is done

30:36: we um

30:38: things move around according to the

30:40: width. So now suddenly

30:43: if we wanted to break our slide into a

30:47: 4x4 dread of values,

30:50: how do we do it here? Like when does it

30:53: stop? Like when do we do off the page?

30:56: So you need to do some annoying math

31:00: based on

31:02: what it looks like underneath. So here

31:05: technically this is the slide area

31:08: of where everything is but it's kind of

31:10: hard to fetch in a way where things

31:14: doesn't just go off the page. So with

31:18: based calculations in revealjs really

31:21: easy height based stuff hard but it's

31:25: not a bad idea and I might try some of

31:28: that

31:28: >> communitydriven development. All right

31:30: let's talk about some of the amazing

31:32: extensions. So, we know what Corto can

31:34: do right out of the box, which is a lot.

31:37: Um, there are so many things that it

31:40: would be cool if Corto could do. And let

31:42: me tell you, Emil has been making them.

31:44: [laughter]

31:45: >> So, I So, I'm actually swapping quickly

31:50: just into auto

31:53: related VS Code extensions. So, one of

31:55: them is just a little one I wrote about

31:58: things that happen. It does a lot of

31:59: like neat mostly autocomplete things.

32:03: So,

32:05: >> oh my gosh, I love this. Oh my gosh, how

32:07: did I not know about this?

32:08: >> So, like one of them is like there's

32:10: this thing called the a short code of

32:13: like the meta tag. So, basically

32:14: anything that's in the the YAML you can

32:17: reuse in the document, but there's no

32:20: autocomplete in it. So, like this

32:22: extension has autocomplete on it. It

32:25: adds

32:27: if you have a short, it also like

32:29: autompletes on all your short toads. So

32:32: you don't need to remember all the

32:33: names.

32:35: It does.

32:38: So it just adds a lot of like little

32:41: things that are kind of nice. Oh,

32:45: another thing. So here we're adding with

32:48: and everything, but you can also add

32:50: like style tags directly. So you just

32:53: add CSS inline. The extension adds the

32:56: auto complete for that here. So, we can

32:59: say background color and I want it to be

33:02: like green, which is a bad idea,

33:05: [laughter]

33:06: but but and now we messed up something

33:09: here.

33:10: >> Oh boy. Not accessible at all.

33:12: >> But you can add style in line, but it's

33:15: easy to do now because the Tro extension

33:18: helper like does that. Another really

33:24: um useful extension is portal wizard

33:28: which does a lot of things which I feel

33:29: we don't have time to do but this is a

33:31: alternative way of installing

33:33: extensions. So it has a UI but why

33:38: just wanted to mention it real threat

33:40: was that I'm tapping into a thing that

33:44: proto wizard does in my extensions.

33:47: So I know that I'm adding like new

33:50: syntax and whatever when I make these

33:53: extensions. So I did the chat bubbles,

33:55: right?

33:59: So here

34:02: it adds these. So let's just

34:07: Oh no. Oh, that's not good. This should

34:11: work.

34:13: Oh no.

34:14: >> Oh no. Oh no, it doesn't work.

34:17: >> Someone forgot to light a candle

34:18: somewhere.

34:19: >> Yeah. Well, well, I'll I'll fix that.

34:22: But essentially, what we have is I'm

34:26: tapping in in my extension. I'm tapping

34:29: in and adding short codes

34:32: to

34:34: the extension. So you don't necessarily

34:36: have to remember all the new syntax in

34:38: all the

34:42: new extensions because if you have

34:45: throttle wizard installed all the tap

34:47: completion all of that it's just like

34:49: built in anyway. Well let's look at it.

34:52: We can just find it.

34:56: We will just have to do it in the

34:59: example itself.

35:01: But yeah, the syntax was like how we saw

35:04: before. So we have we do a serum a tumm

35:10: um we call the bit one chat and then

35:15: we either put like a bubble left and

35:17: bubble right as the inside names. Oh,

35:21: and here we're also adding fragments so

35:23: it shows incrementally.

35:28: And then we put in

35:32: um like test inside. And now

35:39: it basically looks like we're sending

35:40: like chats on like a phone.

35:45: So we can just go forward and it does

35:48: this annoying math that no one else want

35:50: to do where that when we advance far

35:54: enough it pushes things like up and down

35:57: which took a while to do.

35:59: So,

36:02: so this is using the exact same idea as

36:06: the columns and column idea, but now

36:10: it's just slightly differently formatted

36:13: and

36:16: like you can change different. So this

36:17: is where like oh we are also saying

36:19: instead of bubble left we have bubble

36:21: left two and three to like give the

36:24: illusion of there's different people

36:26: talking here. So, this is just a little

36:28: fun thing that isn't useful, but it's

36:33: essentially just

36:35: a top of Java a JavaScript file that

36:38: helps push the bubbles up when it

36:42: detachs that we're filling the page too

36:44: much and then the CSS to do the rounding

36:48: and the colors. But now that we have

36:51: that, we just fill it in like this.

36:54: >> I love this so much. I I feel like I

36:56: somebody has to interject here and say

36:58: how cool this is because we're all

37:00: silently saying it on Discord and it

37:02: needs to be on uh documented on YouTube

37:05: live that it's so cool. Raha had said

37:08: you said this is a funny little thing

37:10: that isn't useful. It's very useful and

37:13: I feel like everybody who teaches could

37:16: find a use for this. Um and anybody who

37:18: wants to get everybody's attention in a

37:21: meeting

37:22: to by showing them something that they

37:24: don't expect to see. This is like a a

37:26: super super fun thing.

37:29: >> Let another one which is kind of now I'm

37:31: just doing a little show taste right now

37:32: of various different things. So one

37:36: thing I really think fragments are

37:37: useful for is for highlighting a word.

37:41: So or like a sentence right so you can

37:44: if you want to put emphasis or something

37:45: obviously you can bold it and you can

37:48: bold it as a fragment. So a fragment

37:51: words it has three stages. So it's

37:54: before the fragment is being triggered,

37:57: as the fragment is being triggered, and

37:59: after. And the simplest form of fragment

38:03: just adds different CSS styling to

38:05: different ones. So that's also how you

38:07: can make text appear as a fragment

38:10: because you just say made it invisible

38:12: before and made it visible after.

38:16: Um,

38:18: and you didn't do a lot with that. But

38:20: there's also this

38:23: JavaScript library that's been around

38:25: for a while called it rough notation

38:28: which

38:31: like you so basically the way you

38:34: where's my basic usage.

38:36: Yeah. So the the way you use it is you

38:39: have some some text you want to

38:42: highlight

38:43: and then you put on it RN fragment. into

38:48: like rough notation fragment. I might

38:50: have maybe should have used like a

38:52: different syntax for this but basically

38:55: you do that

38:57: and then

39:00: when you extend you have this like

39:02: highlighter thing. So like it like

39:04: pretends to paint over it but it also

39:07: has like other modes

39:10: but it has this like handwritten feel to

39:14: it. So it has a little bit of noise in

39:16: it

39:17: >> and you just add all of that

39:19: >> in here.

39:21: >> And this is since it's a fragment, it's

39:22: like an extra step in your slides like

39:25: it doesn't show and then you hit the

39:27: next on your slide and it's sort of an

39:29: animation that it's highlighting and

39:30: underlining. Right.

39:32: >> Yeah. So, and it's just a way of like

39:33: just emphasizing a thing that happens.

39:36: And there's like a bunch of different

39:39: types that you can do and you can change

39:41: the colors and there's a bunch of

39:44: different arguments to change color and

39:46: whatever. And all of them just happen

39:48: with like the inline. So

39:53: >> Oh no. So this doesn't work here because

39:56: but basically

39:57: >> can you see all the reaction emojis that

39:58: are happening? Is it

40:00: >> No, [laughter] they're not popping up.

40:01: >> I don't know if you can. They're all

40:03: like we're mind blown.

40:06: And I spent some time like trying to

40:08: make it as usable as possible. You said

40:10: colors in different ways and whatever

40:13: and like so this oh and one thing to

40:16: long time to wear it also. So there's a

40:18: different extension. So this is not my

40:21: extension. So this is

40:28: this.

40:32: Yeah.

40:34: So this extension right here

40:38: solves uh

40:41: another problem that is if you have

40:44: code.

40:46: So you can add fragments and styling to

40:49: test itself but it's really hard to do

40:51: it in the the code chunks that happen

40:56: because

40:58: of various reasons that's not really

40:59: hard to do. So, Flourish is an extension

41:02: that allows you to

41:08: make fragments happen on your code

41:12: itself and

41:16: I was able to like

41:17: >> itself like in code chunks.

41:20: >> Yeah.

41:20: >> Okay.

41:21: >> So, here we have a code chunk but let's

41:24: say we want to highlight a word here.

41:27: We'll obviously highlight the word up

41:28: here, but we can also like this was just

41:31: a box around gtgplot 2 or like gtgplot.

41:34: So we can use the flourish syntax

41:39: with

41:41: the rough notation

41:43: if they're both installed at the same

41:46: time like it will note hey I'm seeing

41:49: both and then like there's a thing

41:50: around it. So you can also do

41:53: the rough notation in to charts which

41:56: before wasn't like a thing because I'm

41:59: doing things weirdly to make things

42:01: happen here. All right, let's

42:06: um

42:11: um

42:12: >> this is so cool. I wanted to ask the

42:14: rough notation. Rough notation is like a

42:16: JavaScript library on its own, right?

42:19: >> Yeah. So this is I'm bundling it in.

42:21: Yeah.

42:21: >> Okay.

42:22: >> And I'm technically bundling in uh

42:26: something that happened in a branch

42:29: >> because um I wanted uh the animation to

42:33: also work in reverse

42:35: >> and the project is basically abandoned.

42:39: >> But someone did a PR to make animations

42:42: happen in reverse and I'm stealing that

42:43: too. well with attribution but it's

42:48: it's happening. one

42:49: >> okay cool

42:50: >> thing that I've been that I'm like

42:53: actively working on right now but also

42:55: is public is let's go into the sample

42:59: slide and

43:03: no

43:05: so one of the issues

43:08: when you're writing slides

43:11: is that

43:13: you might think oh I kind of don't like

43:15: the image here is fine but

43:19: I want to move it just a little bit. And

43:23: the normal approach to do that is here I

43:26: set it with absolute. So adding this

43:29: absolute class to basically anything but

43:33: really with images you're specifying the

43:35: position with like left, right, top and

43:38: bottom. And you specify the widths and

43:39: it moves around. But let's say I kind of

43:43: want this to be a little bit more to the

43:44: right. You can go in here and change it

43:48: to like be

43:51: like 10 pixels to the left and then you

43:53: render and it moves over a little bit or

43:54: maybe a little more and you do like 20

43:57: and it moves over just a little bit by a

43:59: little bit, right? But this just take a

44:02: while to do. And so where uh this

44:06: extension comes in, you install the

44:09: editable extension

44:12: the way you would all the other ones and

44:14: you add like little things to the YAML.

44:17: Sometimes you need to add things. Oh,

44:18: that's probably why the chat thing

44:19: didn't work because I didn't finish

44:22: installation, but you need to

44:25: add it as probably a filter in the YAML

44:28: to activate it. But all of that is on

44:30: the read me. So, if you follow the read

44:32: me, it should just work.

44:35: But if you have the editable extension

44:38: installed, you will see that in the

44:41: slide area, there's also a little bit of

44:42: a menu at the top.

44:46: So if you click on the the modify,

44:52: this is looking kind of weird, but

44:54: essentially clicking on the modify,

44:57: I can click on the thing like this test

44:59: field over here. And I can

45:01: [clears throat] move it like a little

45:03: bit around. I can Oh, that doesn't work

45:07: yet. Shoot.

45:09: If we add another text field down here

45:16: and modify it, I can say like hello

45:20: data science lab

45:23: and I want data science to be

45:27: to be purple, right?

45:31: But I'm also moving the image around a

45:32: little bit so it' be over here.

45:35: >> Amazing.

45:35: >> This is like a bad idea, right? Anybody

45:37: who has not worked in Portol Slides, uh

45:42: you might not realize that clicking and

45:45: dragging things like this [laughter]

45:48: in like a visual editor mode is not

45:50: possible. This is completely only made

45:53: possible by Emil's extension.

45:56: So it's still like a little slow because

45:59: so as you saw like you modify some

46:01: things you click save and then it you

46:06: find where it isn't override it. You can

46:09: also like copy it and like paste it in

46:12: but then hopefully it's still very in

46:15: some of these new things. Also the image

46:18: disappeared so oh it we lost it somehow

46:21: but it basically let move things around.

46:24: how light and like when it releases it

46:27: like doesn't have these issues but

46:29: basically allows you to modify things on

46:32: the slide side of

46:34: >> Yes.

46:35: >> And

46:35: >> and this is a work in progress version

46:38: that Emil is using. So

46:39: >> yeah, like this should work in like the

46:43: ones you download should work.

46:44: >> Yeah.

46:45: >> But I am I'm adding a lot of basically

46:47: the modify button doesn't work yet. So

46:50: the way you have to do things

46:53: before

46:54: was you put

46:56: an editable class to something. So you

47:00: have to specify in the source document,

47:02: hey, I want editable on this image. And

47:05: then we can modify it over. If you hold

47:08: shift, it like understands like the

47:10: ratios.

47:12: You can set like a pa lighter opacity or

47:15: like flip things around. And then when

47:18: we save it, it overrites

47:22: it updates over here. So now when we

47:26: rerender it now it's no longer editable

47:28: but it remembered everything we did

47:31: and

47:32: >> andrew says this is magic.

47:36: >> So this will get better over time like

47:38: surely but slowly um it will be faster

47:43: for many things. Um, and it just does a

47:47: lot of like it's a lot of code to make

47:50: this happen because I'm I'm technically

47:53: passing the order document in JavaScript

47:55: with regular expressions which you

47:57: shouldn't do but that will be

48:02: it with with the Troto 2 which if that

48:06: can be linked somewhere

48:08: um

48:10: they're rewriting Torto in Rust from the

48:13: ground up and that is improving speeds a

48:16: lot and this once we have that with this

48:22: then suddenly we have a much faster

48:24: feedback loop but the problem is here's

48:27: a slide it's one slide right it doesn't

48:29: take any time but the render still takes

48:32: a couple of seconds depending on how

48:34: long your slide slides are so having

48:39: like modifying something pressing

48:41: preview then modifying it on right hand

48:44: side clicking save

48:48: and then has to rewait for the render

48:50: again. Like even if it takes a couple of

48:52: setting that becomes like quite a slow

48:54: loop where

48:57: the the new render is so much faster. So

49:00: it will feel like instantaneously once

49:03: we have it set up with quarter 2.

49:06: >> Amazing. Okay. Well, so we have five to

49:09: six minutes left.

49:11: >> Yes. Um, we have a couple of questions

49:13: that we could get to. Um, and also, is

49:16: there any other extension that you are

49:18: burning to show us? That's very cool.

49:22: >> Or should we go to questions?

49:24: >> Yeah. Oh, that's

49:26: >> think the mayo one.

49:28: >> Yeah. So, this is so this is Yeah. So,

49:30: we technically have So, this is slightly

49:33: different than like a extension. It was

49:36: called a theme.

49:38: So, and then you install it. So, here is

49:42: like the total use template and then the

49:45: like VJS sync deio. Um, it also topies

49:50: all a bunch of things, but it is this

49:53: like sync to the deio theme that like I

49:55: was working on.

49:58: So just like it's fun and happy and

50:01: >> I think the concept of this translates

50:02: really well into just like you can

50:04: create themes for slide decks if you

50:06: want to

50:07: >> and like and we might want to talk about

50:10: more that later in the future if people

50:12: are interested but because this is a

50:16: >> because a lot of the hardware with like

50:19: setting up slice can be like the first

50:22: time and if you're doing it in a

50:23: corporate setting you don't want all

50:26: your people to redo do all this work all

50:29: the time. So you can have one person or

50:31: like a group of people made your team

50:35: theme

50:37: and then made it into a total theme and

50:38: then people just have to import it once.

50:41: It copies all the things over and then

50:43: you just fill in content. You don't have

50:45: to worry about oh are the colors to red

50:48: are the sizing right? You can do little

50:50: neat things like here. So

50:54: like I I told this a slide themes. So

50:58: basically for each slide

51:01: I have like a theme dash and then like a

51:04: name. So like title one, title two,

51:07: section and whatever.

51:10: And

51:12: obviously they're all like

51:14: similar in vibe of like fonts and colors

51:16: and sizes.

51:18: But also this one I know that hey we

51:21: have like some flourish here on the

51:23: right hand side of the slide. So we are

51:25: constraining everything to be the left

51:27: hand side. So like you can have like

51:30: just nice little things like this that

51:33: just yeah

51:36: but highly recommend it to and then this

51:38: is just a copy paste like this. If you

51:41: use this, it just copies over this

51:44: template file that just kind of has like

51:47: all the things, the CSS file,

51:51: and yeah, so it's it's very light in

51:56: what it actually does.

51:58: >> Very cool. Okay. Well, we have a poll

52:01: going in Discord asking, do we want Emil

52:04: to come back and talk about slide themes

52:06: so that we can deep dive into it? And so

52:09: far it is exclusively yes votes and it's

52:12: climbing. So I think that Emil might be

52:14: at the top of the leaderboard very soon

52:16: for repeat um data science lab lab

52:20: leaders. We have a couple of questions.

52:23: One is from Raha and she was asking if

52:26: there is a CTO extension that can help

52:28: dynamically create tabs or chunks. And

52:33: this might be something that Raha needs

52:34: to like explain herself. But she says,

52:36: "Say I'm working on a quartto report and

52:38: I want to create a series of tabs, but

52:40: the name and the number of the tabs is

52:42: not something I know in advance and I

52:44: figure it out in the report based on my

52:46: data." So I basically write code to

52:48: write the code and render it. So it

52:50: looks like tabs and chunks, but it's

52:52: messy and it takes a lot of work.

52:54: >> Oh yeah. Um

52:57: >> she did put an example of her code by

53:00: the way which is like looping over um

53:04: and creating the right number for the

53:06: right number of variables that she's

53:07: got.

53:08: >> Yeah. So that will so I'll have to look

53:11: at that and I'll I can get that into the

53:13: >> cuz this is Discord, right?

53:17: >> Yes. In Discord.

53:17: >> Yeah. So I I'll I'll loop around and

53:20: see. And my first instinct is like so

53:23: you can so since everything here is like

53:26: based on HTML there's this like HTML

53:29: tools

53:31: package that you can use to help like

53:33: put things in and you just have just

53:35: have to make your styling works with it.

53:39: So but yeah I think it I'll be better

53:42: helped by just looking at the sample and

53:45: the more precise feedback here.

53:48: >> Okay, great. Raha, we will continue

53:49: talking about this. Maybe it doesn't

53:51: exist yet, but maybe it could exist. Um,

53:54: and then Andrew had asked about seeing

53:57: some slides at a conference and seeing

53:59: that they were highlighting code chunks.

54:01: So certain sections of the code were

54:03: more prominent or emphasized. And I

54:06: wanted to let everybody know that that

54:07: is actually a default capability in

54:10: Corto is code highlighting. So you can

54:12: make it so that your code chunks have

54:14: highlighting in them. [clears throat]

54:16: Yeah, there we have the toad

54:19: highlighting like toad line numbers. You

54:21: pass in a range. You can also do like

54:24: >> if you pass in a range it here says like

54:28: sit straight. It highlights

54:31: line sit straight. Well, in doesn't

54:33: highlight it actually hides everything

54:34: else by like fading it out.

54:37: >> If you Thomas separate them, you can

54:40: like it's not a list. If you do the the

54:44: virtual bar, it basically turns into

54:48: fragments by like first not highlighting

54:50: anything, then highlighting six, then

54:52: highlighting nine.

54:54: >> So yeah, this is a default thing that we

54:57: can do in

54:59: >> Yeah.

55:00: >> Yeah.

55:00: >> And there's more types of highlighting.

55:02: So yeah, go take a look at the CTO

55:04: documentation to look at all the

55:05: different types of highlighting. It's

55:06: very cool. Okay, we have reached the top

55:09: of the hour. Um, Colin had a question

55:12: that's in the Discord about getting

55:14: clarity on how to embed a reveal.js site

55:16: into another CTO document. Colin, we

55:18: will hop in the Discord and help with

55:20: that.

55:21: >> Yes.

55:22: >> Okay. Amazing. Thank you so much, Emil,

55:24: for hanging out with us, teaching us so

55:27: much. Yes,

55:28: >> we're all clapping. Camera Encl is

55:31: clapping. You're getting tons of

55:32: reactions

55:34: and thank yous in Discord. We will find

55:37: a time for you to come back and talk to

55:38: us about creating themes for Slidto.

55:41: Slidto reveal not slid slides [laughter]

55:45: using reveal.js. Slido is something

55:47: different. Okay everybody, this was so

55:50: much fun. I'll see you in Discord with

55:51: more questions. Thank you for voting in

55:53: our polls and I will see you on Thursday

55:57: at the data science hangout perhaps.

55:59: Thank you for hanging out with us

56:00: everybody.
