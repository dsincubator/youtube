---
type: Video Transcript
title: "Advent of Code for R users | Emil Hvitfeldt | Data Science Lab"
description: "And I'm just ready to introduce our our guest today which is Emil Wheatfelt."
resource: "https://www.youtube.com/watch?v=e4SHN7iaddE"
tags: ["ds-lab"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T21:59:18Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=e4SHN7iaddE"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2026-01-12T00:00:00Z"
    usage_count: 1503
usage_window: { from: "2026-01-12T00:00:00Z", to: "2026-09-08T21:59:18Z" }
---

# Transcript

00:08: And I'm just ready to introduce our our

00:10: guest today which is Emil Wheatfelt. He

00:13: is a software engineer here at Posit and

00:17: he's going to be talking to us about

00:19: Advent of code and I'm super super

00:21: excited about it. Emil, would you like

00:23: to introduce yourself?

00:25: >> Yes, thank you for introducing me. Yeah.

00:27: So, I'm a software engineer on the T

00:29: models team. Mostly thinking about how

00:32: to make modeling as easy and pleasant as

00:36: possible,

00:37: but also like to do like fun things on

00:40: the side. Like I do a lot of puzzles and

00:42: such, which is where Advent of Toad like

00:46: has a little bit of a interession

00:48: between coding and

00:51: like puzzles. So, I'm excited to be

00:55: >> I love puzzles, too. I'm a big like

00:57: mystery person but also a physical

00:59: puzzle p puzzle person. Okay, we are

01:02: going to be talking about advent of code

01:03: today. Um we are going to hop into

01:07: screen sharing very soon. Um I'm going

01:09: to share my screen really quickly first

01:11: and just show you what advent of code

01:15: even looks like.

01:18: Um I'm going to share. Okay, hopefully

01:20: you can see my screen right now and you

01:22: can see I have just gone to advent

01:24: ofcode.com.

01:26: The only other other thing I have up

01:27: here is our slidoh and it is a blank

01:33: base of a Christmas tree with numbers

01:35: next to it

01:38: and it's got um a login button because I

01:41: am not logged in. I've literally never

01:42: done Advent of Code in my entire life.

01:45: It kind of looks like a console screen.

01:46: And if I click login, it will give me

01:48: some different options.

01:50: Um, so I could log in with GitHub. I

01:54: will do that in just a second. Uh, but

01:56: you can go through any of these. I think

01:57: Google is probably the easiest one. If

02:00: you have never used Advent of Code

02:02: before, there are some places you can

02:04: go. I'm going to let Emil walk through

02:05: that. But I just wanted you to see what

02:06: it looks like before you're logged in.

02:08: Maybe we can all log in together. So,

02:10: I'm going to stop sharing and hand this

02:12: over to Emil. Um,

02:18: there we go.

02:19: >> Yes. All right. Yeah. So, this is

02:22: >> give us give us the tour really quickly

02:25: first of like what we can see before we

02:28: dive in.

02:30: >> Yes. So, this is then what

02:33: code will look like once you're logged

02:35: in and it would be we have uh there's a

02:40: line per day. So this year

02:45: with they're only creating 12 puzzles

02:47: where normally it was 25

02:50: which is it's a lot in December. So this

02:53: is the 11th year. So he decided to only

02:57: do 12 for this year which is going to be

03:00: perfectly fine. And each one opens up on

03:05: midnight

03:07: in like New York. So we can see here the

03:11: third day will open up in a little bit

03:13: less than 12 hours.

03:15: But there's a lot more information in

03:16: here. We can also if we click on the

03:18: year oh no if we click on the events we

03:21: can see previous years.

03:24: So here if we go to like 2026

03:28: no 2016. This is what I've done so far.

03:34: So each day has two parts to it. So you

03:38: can open up a day and it will describe a

03:41: question and with a prompt and

03:43: everything and once you have answered

03:46: that correctly how to open up

03:50: and

03:50: >> is that a train? This is amazing. This

03:53: is like [laughter] some of these are

03:55: like real fun. Yeah. So like here we can

03:58: see on 22 I was only able to do part one

04:03: and then if we say Yeah. So, oh, I

04:06: finished part one. Now, part two, and

04:09: then like more information comes in, but

04:11: I wasn't able to do part two of that

04:14: specific day.

04:15: >> Okay. So, each of these stars is a part.

04:17: So, on day 22, you only did part one,

04:19: but on day 21, you did both parts.

04:22: >> Yeah. And I stepped 17 for some reason.

04:25: >> Like, and that's another thing. You can

04:26: do them out of order as well. So it's

04:29: only about they're all time locked for

04:33: like when they is because the

04:35: leaderboard is only based on time

04:40: and the official leaderboard is really

04:42: hard because it's like everyone in the

04:44: world and the first person to do it

04:48: that's 100 points the second person

04:51: that's 99

04:53: and so on and so forth. So, you only get

04:56: a point if you're in the top 100 people.

05:01: >> Okay.

05:01: >> To answer any

05:02: >> We had a question I saw in the discord

05:05: which I think is interesting because I

05:07: have the same one which is like does

05:08: that ask art build itself as the code

05:11: puzzles get completed like whether you

05:13: complete the day or not?

05:15: >> So,

05:17: good question. So, here's like 15 which

05:19: I fully did. So you can see like it's

05:22: all

05:23: nice and nice. But if we then do 23,

05:28: it's only building up somehow as far as

05:33: you went.

05:34: >> Okay.

05:36: >> But this one's also a weird one because

05:38: this is not a chronological year. So

05:41: like they're jumping up and down a

05:42: little bit. So the art is

05:45: changing over time.

05:48: >> Okay. And so it's a lot of fun things

05:51: happen. But we'll we'll be doing day

05:53: one.

05:53: >> So I made the assumption that this might

05:54: be the bottom of a Christmas tree cuz

05:56: I've seen Christmas trees before, but

05:57: this looks like it's probably something

06:00: else.

06:01: >> Yeah. Yeah. And and so we don't know

06:03: yet, right? So because we're not we're

06:04: only two days in and we haven't filled

06:07: in any of the days.

06:11: Um yeah. So I think we can just

06:14: >> And also one thing that you can do too

06:17: is if you play on the leaderboard

06:20: >> Lauren actually made a good point that

06:21: it's the leaderboard is disabled this

06:23: year because he he uh decided it was a

06:26: little [laughter]

06:27: >> too competitive.

06:29: >> Yeah.

06:30: >> Yeah. Yeah. And like we we had some

06:32: where people are very fast like

06:35: especially day one because it starts off

06:37: being easier and then harder and harder

06:40: where some people answer the first

06:43: question in like one minute and there

06:46: are like [clears throat] techniques to

06:47: do it harder and I I'll explain a little

06:50: bit what people do to improve the speed

06:54: but also a lot of people stream them

06:59: doing advent of toad on Twitch and it's

07:01: very fascinating because people are

07:03: really fast.

07:05: But there's also a you can also do

07:09: personal leaderboards

07:11: or like private leaderboards. So if

07:13: people everybody have an ID

07:18: so you can share it with your target

07:21: leads or your friends and then you are

07:24: all on like a leaderboard with other

07:27: people.

07:28: >> All right. I just shared Tan's

07:30: leaderboard in

07:32: >> in the Discord chat for everybody.

07:35: >> So, this is the one and now it's it's

07:37: based on the same idea of how

07:39: calculating the numbers, but you're not

07:42: competing with the world. You're

07:44: competing with like a hundred of your

07:47: friends, which makes it a lot more

07:49: doable.

07:51: >> All right. Sweet.

07:52: >> All right. So, let's let's start it.

07:55: So each so day one is a little bit more

07:57: verbose because it's explaining what

08:00: happens but generally it's a wall of

08:02: text and it will explain what it is. So

08:06: here the elves have bad news because

08:10: they discovered the project management

08:12: which giving them some tools to like

08:15: deal with Christmas emergencies

08:18: and there's a story going on that

08:21: doesn't do anything other than being fun

08:24: right so we need to help them decorating

08:26: the North Pole by December 12th

08:30: and we collect the stars and it's two

08:32: puzzles per day each puzzle is the star

08:38: and so like you said 24 in total.

08:43: So then so this is mainly just

08:46: explaining what it is. This is only on

08:48: day one and then it starts and it starts

08:52: with like the story. So here we have

08:54: that we're arriving at the secret secret

08:57: entrance at the North Pole base

09:00: ready to start iterating. Unfortunately,

09:02: the password seems to have changed and

09:04: you tend it in and we have a document

09:07: expl explaining what happened. Due to

09:10: new security protocols, the password is

09:12: locked in the safe below. Please see the

09:15: attached document for the new

09:16: combination.

09:18: So, we have a safe with a dial and we

09:20: can turn it left and right and it has a

09:22: numbers uh 0 through 999 on it and it

09:27: makes a little clip every time it

09:28: reaches a number.

09:30: and the attached document which is our

09:33: puzzle input which let's just see right

09:35: now. So if you're logged in everybody

09:38: gets their own puzzle input. So I think

09:42: that mine and it looks something like

09:43: this. It's a long list of some text.

09:49: >> Does that open in a different tab? I'm

09:50: going to go click it.

09:52: >> I don't think it it opens opens in a

09:55: different one. Yeah, that's nice. Okay,

09:58: >> that's our puzzle input and it's a

10:00: sequence of rotations and one line by

10:03: line and it's how to open the safe.

10:05: >> So,

10:05: >> wait, pause.

10:07: >> Does everybody get the same input?

10:09: >> People different inputs, but I do

10:11: believe there's duplicates.

10:13: >> Okay, so probably not an infinite number

10:16: of

10:18: >> combinations, but no,

10:19: >> ours will probably not look like Emil's,

10:22: which is great because then we don't

10:23: have the solution completely spoiled for

10:25: us, right? because at the end of it I

10:30: will run some code based on this input

10:32: and it will give me an integer and I

10:35: have to put that in my answer and submit

10:37: it.

10:38: >> Okay.

10:38: >> And like so it's not I know this won't

10:41: be zero. So if I put zero and submit it

10:44: will be like hey that's not right. So

10:47: you it will tell you

10:50: uh I feel like sometimes it like gives a

10:54: little bit of a hint if you're wrong in

10:56: a very specific way.

10:57: >> Okay.

10:58: >> Oh, did you remember to turn it left too

11:00: or something like that? But in in

11:03: general just say it's not right and it

11:06: has some delay on it. So if you spam it,

11:09: you start having to wait like a minute,

11:11: 2 minutes, 5 minutes to be able to

11:13: resubmit.

11:15: So, you can't just trial and error it.

11:18: You have to actually do it.

11:20: >> You can't just warmer or colder it.

11:22: Kieran says that it'll sometimes tell

11:24: you like, "Oh, your answer is a little

11:25: too high, right?" Or

11:27: >> yeah,

11:27: >> it might sometimes helpful your

11:29: >> answer,

11:30: >> but sometimes it's not. And yeah, so

11:34: here we just have is So our posal input

11:37: looks something like this.

11:39: >> No, no.

11:41: So it has a L or R for left and right

11:46: and then a number next to it.

11:50: And it is describing

11:53: whether to turn it left or whether to

11:55: turn it right. And here left means lower

11:57: numbers and right means higher numbers.

12:00: And how much to rotate it by is the the

12:04: value itself.

12:06: And then he always includes the like

12:09: examples and instructions. So here it

12:11: says if we started at 11 and it was a R8

12:16: it would mean we turn it right eight

12:18: times until we hit 19. And likewise if

12:21: we oh 19 and if it says L 19 we would go

12:26: back to zero. So it has some changes we

12:28: can play with. And here we also have

12:31: that it's circular.

12:33: So if we are at zero

12:36: and we do down one, we go back up to 99.

12:40: And if we're at 99 and go up, we go back

12:43: down to zero.

12:45: We have to like remember that. And then

12:48: a very important thing is we start at

12:50: 50.

12:52: >> Okay.

12:53: >> So

12:54: >> gosh, I was really bad at um my lucker

12:57: combination

12:59: as a young person, so this is already

13:01: challenging my brain. Let's keep this

13:03: the extreme version of that.

13:06: >> So like we can conceptually imagine that

13:09: we probably have to turn the knob

13:12: according to the instructions, right? So

13:14: we probably start at 50 and then we need

13:17: to write some code that simulates

13:19: turning this knob left and right a

13:23: number of times.

13:26: So, but here it has the what how we

13:28: actually find out what the our answer

13:31: needs to be because we can follow the

13:33: instructions

13:35: but the actual password is the number of

13:38: times the dial is left pointing at zero

13:42: after we rotate the sequence.

13:45: So then he has an example which I will

13:49: copy in as my input.

13:55: >> Okay. So you just copy this.

13:57: >> I copy this little example because then

14:00: we can verify that it the answers that

14:04: >> it should and hopefully this will be

14:06: enough.

14:07: >> All right. And then are you working in

14:08: Posetron?

14:10: >> Yes, I'm working in Proetron.

14:11: >> Okay. So did you paste it into just like

14:13: a text file?

14:15: >> Yeah. So uh so what I do is I here I

14:19: just added a a just a a folder that has

14:23: two files in it. It has input and they

14:28: like so I have it's just a norm normal

14:31: text file nothing fancy then when I'm in

14:34: here I can do

14:39: read lines of

14:45: not oh read lines

14:51: >> yeah so

14:53: an R

14:54: And there is incomplete final line. So

14:57: now

14:59: I have my input in a in a neat way. And

15:03: then once we have solved this like test

15:06: case, I'll go back in here and copy

15:10: paste this like the real input over.

15:14: >> Okay. in this

15:15: >> and it's just like and

15:19: we know one thing to note that might be

15:21: useful later is I'm also noticing some

15:24: threedigit numbers here.

15:26: >> Mhm.

15:28: >> So that just might be

15:30: that doesn't show up here. So that we

15:33: might need to remember to think about

15:34: that

15:36: going on. And we know here that the

15:39: sample

15:40: points to zero three times.

15:46: And

15:46: >> okay,

15:48: >> is there one more way to save this? Can

15:49: you like rightclick that link and save

15:51: it as a txt file or something?

15:55: >> Uh

15:57: uh

15:58: >> h save link as maybe.

16:02: I bet there's multiple ways to do this

16:03: because you could also like save this as

16:05: like a string as an object, right?

16:08: >> Yeah. When you're in here, you can save

16:12: this file as something.

16:15: I think

16:17: >> Kieran says option click it on Mac,

16:19: which is a good [clears throat] a good

16:21: tip.

16:21: >> All right. Yeah, this is how I always do

16:24: it because I don't like I care about the

16:26: speed, but I'm also not fast enough to

16:29: actually care about speed. Cuz one of

16:31: the So the way you do this if you care

16:35: about speed and you want to win is you

16:38: read from the bottom up

16:43: because it's more likely that the like

16:45: you can infer what happens because

16:48: already with these left and right

16:52: if you're already in puzzle mind mode it

16:55: seems kind of obvious what's happening

16:57: here.

16:58: And then you see this highlighted is

17:00: this is the answer. We already know

17:01: that. So you can just stem through

17:04: bottom up. Here we see oh this seems

17:06: important that is looping. Let's try it

17:10: right away. So you don't actually read

17:11: the whole thing. You read enough to get

17:14: an idea of what it is. And those people

17:17: don't try it out for first. They use the

17:21: real input and send it in right away

17:24: because it's all about speed, especially

17:27: in the first couple of days.

17:28: >> We're not about speed today. We're going

17:31: to be about friendly introductions and

17:34: talking about how we think through this

17:36: um and having fun. Reminder, you can ask

17:40: questions in the slido directly to me.

17:43: I'm also looking at the Discord server.

17:45: If you just ask in the Discord channel,

17:47: um I will probably see it there. It's

17:50: much easier to uh monitor the Discord

17:53: when we don't have 250 people like we do

17:55: at the hangout. So Discord is probably

17:57: okay today.

18:00: >> And so

18:02: I'm just loading Tidyverse here because

18:04: like I'm seeing strings. We probably

18:07: want to do like some string stuff to

18:08: pull things out. There's other ways of

18:10: handling this. You can do it whatever

18:12: you want. I do it in R. A lot of times

18:15: end up doing b related things but you

18:18: can do whatever you want. You can code

18:21: according to speed. You can code

18:23: according to elegant solution. Trying

18:27: something new.

18:29: You can do whatever you want. It's all

18:30: about having fun

18:34: really.

18:35: So do you want me to to to try

18:38: something? What do you think we should

18:40: do, Libby?

18:42: >> Um,

18:42: >> now that we have our input,

18:45: >> this is a good question. I have been in

18:47: the Discord chat notion, but also the

18:50: first thing I would do personally is

18:52: what Isabella did, which is I would get

18:54: a pen and paper out and just start

18:56: drawing things because I yeah, I can't

19:00: visualize anything in my head at all. I

19:02: don't have that ability. So the first

19:04: thing I would do would be to take a

19:05: bunch of notes because the things that

19:07: like you highlighted that line that was

19:09: like this is really important and I

19:11: didn't understand it fully. It was like

19:13: the number of times it goes back to zero

19:15: is the number of sequences.

19:17: >> Yes. So if we draw back here to let's

19:19: show it sample. So we start at 50

19:23: and then we execute

19:25: L

19:27: 68

19:29: which rotates 50 like we take 50 minus

19:34: 68

19:36: which is -8

19:39: which then loops back around to 82. So

19:42: at the end of the first turn we're at

19:45: 82.

19:47: >> Okay. Then we are rotating one more time

19:50: 30 to the left which is minus.

19:53: Now we're 52.

19:55: >> Okay.

19:56: >> And then so it just continues. And we

19:59: notice that some of the times it ends

20:03: like we end up at zero.

20:06: >> And that is what we're interested in. We

20:08: want to count how many times zero

20:10: happens. Then I would create a basic

20:13: loop with a counter object for hitting

20:16: zero. And I would create a conditional

20:20: statement that says like if counter

20:24: equals zero, like if the product of this

20:26: thing equals zero, the product of this

20:28: like math equals zero, then tick the

20:31: counter like you know plus one, right?

20:34: Is whatever you you would do. And then

20:37: yeah, have a little thing that's like do

20:39: this

20:41: >> do it the whole way through. It's not

20:42: like a while loop or whatever. It's like

20:44: the whole way for

20:45: >> Yes.

20:45: >> the thing because we want to count every

20:47: single line.

20:48: >> Yes. So let's try that. So I'm setting a

20:52: count of zeros. I'm setting a position

20:55: that we will move around. I'm writing

20:58: out full names because we're not going

21:01: fast. And I will also

21:05: preformat this a little bit because we

21:07: have

21:09: the

21:12: we have the direction and the values

21:15: and we can easily pull these out before

21:18: the loop instead of inside the loop

21:20: because R is vectorized.

21:23: So we can do direction

21:27: and we can use the string sub function

21:30: from stringer what is it input

21:35: and give me the first element of the

21:40: string like the first character. So here

21:42: we just have a a vector of left and

21:44: rights.

21:45: >> Yeah, this is along the lines of what

21:47: Nure was saying that she would do. She

21:49: was like my first thought's going to be

21:51: parsing the data. So a column of

21:53: direction and a column of number. And

21:55: that is exactly what Emil is doing. He's

21:58: got

21:59: >> one vector of directions and one one

22:01: vector of values.

22:02: >> And here that's probably a better way of

22:04: doing it. But I'm just saying give me

22:06: the the set in to the thousand value

22:10: which is we don't have here the way of

22:12: adding to the end.

22:15: And

22:18: I'm also turning them into integers

22:20: because we know they're integers.

22:22: So now we're in here and we can still

22:25: loop over the input.

22:28: So

22:30: yeah, we will start it. So we say

22:33: the position.

22:37: So let's do it just real. So if

22:40: direction

22:46: Fraction of one

22:49: is equal to left.

23:01: So if the direction is left we minus. So

23:04: that means that we take the position

23:08: >> should be the position

23:10: plus

23:12: value of i

23:17: >> Whoa, wait a minute. Did you just copy

23:18: something and then move it down with

23:20: >> Yeah. So shortcut. [laughter] How do you

23:22: do that? I never do.

23:25: >> So if you do shift option

23:29: on a Mac, it might be different places.

23:31: You can like just like duplicate the

23:35: torrent line.

23:37: >> Okay.

23:37: >> So, I use a lot something like this

23:39: where you shift option

23:41: >> and then you then you take your finger

23:45: off shift so you're only doing option

23:47: because that lets you move a line

23:48: around.

23:51: >> So, option plus the up and down keys.

23:54: >> Yes.

23:56: >> This is magic. So, that's

23:57: >> I'll never remember this but I had to

23:59: ask. [laughter]

24:01: So I think now we have light L. We're

24:04: minusing the value and we're remembering

24:07: to add it to the original value.

24:10: And then

24:13: if

24:17: position equals zero,

24:22: we say zeros

24:25: is zeros

24:27: + one. So if we run if we run this now

24:34: we did two which is not what

24:38: they had. So one way

24:41: >> three right?

24:42: >> Yeah. So the they said they had three.

24:44: So something is wrong.

24:46: >> Okay. So what we can do here is probably

24:50: right here

24:52: we can print we use the attach function

24:56: where we are saying the position and I'm

24:59: adding a new line on it. So if we start

25:01: it all over

25:04: oh we are seeing some negative numbers

25:07: right here. we are and we need to go

25:09: backwards down to minus 100

25:12: >> and the and the reason why we're doing

25:15: it wrong is because this minus 100

25:17: should have been a zero.

25:19: >> Yeah. Yeah.

25:20: >> So that isn't being counted. So the way

25:22: we can do this is we should manually

25:25: like try to do the math.

25:29: But that might be annoying because we

25:31: noticed that the real puzzle input have

25:34: three-digit stuff

25:35: >> and that's a little bit of a pain. And

25:37: Lauren said it's it's 999. That is a

25:40: zero. What What number is it actually?

25:42: Everybody like if we're at if we're at

25:45: zero

25:47: and we go

25:51: 99

25:53: left.

25:55: >> We end up at 99. We have to go 100 left

25:57: to end up at zero. Right.

25:58: >> Yeah. So the way so we could try to

26:02: write this logic out but I know so

26:04: there's this thing called the modulo

26:07: operator

26:08: >> which is like division

26:12: like it's the remainder after division

26:14: >> and this happens to be what exactly what

26:16: we need here. So if we do persist

26:23: which is this double percent thing of

26:25: 100.

26:27: So that will take

26:31: if we run it, we now see that it does

26:33: exactly what we need because if we do

26:36: 100

26:39: modulo 100 turns it back around into

26:42: zero. And it also works if you do

26:46: minus one of 90

26:49: mod 100, it turns it around to 99. So

26:53: that that's exactly what we needed in

26:55: this specific instance.

26:59: So we could have written this by ourself

27:02: but we like like doing the

27:06: math and if else and whatever to make

27:09: sure we are looping correctly but I

27:13: think it's pretty obvious that he was

27:16: alluding to using the modulo operator

27:19: here which then if you didn't know it

27:21: was a thing this might have been hard

27:23: and taken a little bit longer. Yeah,

27:26: modulo is one of those things that um

27:28: and for anybody who is listening and not

27:30: looking at the Discord shot, modulo is

27:32: like m o du l o modulo. There's no like

27:36: r on the end of it. Um and it like if

27:39: you wanted to test it, you could see you

27:41: could do like 10 modulo 3 would give you

27:44: I think like one, right? Because you

27:46: divide by three and it's just giving you

27:47: the remainder only, which would be one

27:49: after that division process.

27:51: >> So only your answer is only a remainder.

27:54: >> Yeah. Okay.

27:55: >> And and it works perfectly for what we

27:57: need for negative numbers as well, which

27:59: is like

28:00: what we needed. So now we see that the

28:02: zeros are correctly done here. So that's

28:07: what it had. And at a quick glance,

28:10: these numbers

28:13: to away the debuging. So now we just

28:17: try. So this is what we do. We go in

28:21: here.

28:23: paste it in. And we see here that this

28:25: was unlikely to be to do this by hand

28:28: because my input is

28:32: almost 4 and a half thousand left and

28:34: right.

28:36: >> Oh, it's okay.

28:38: >> Yeah. So, it it's a lot of times it's

28:40: also meant to be that you can't do them

28:42: by hand. You did samples by hand, but

28:45: it's very rare you can do the this part

28:48: by hand,

28:49: >> right? Yeah. And actually when I was in

28:51: school, we had to do a lot of things by

28:54: hand. Like we our tests, we weren't

28:55: allowed to use computers for our

28:57: programming tests. So we would be like

28:59: writing out these loops and we would

29:01: only have, you know, it would only be

29:02: like a maximum of

29:04: >> five or six loops or whatever. We'd have

29:05: to work it all out by hand.

29:07: >> Yeah.

29:07: >> Which is actually a great way to write

29:09: pseudo code and figure figure it out.

29:11: [laughter]

29:13: >> But we run it. And now I'm getting

29:15: 11:05.

29:17: And should we try to submit it and see

29:19: what happens?

29:19: >> Let's do it.

29:22: >> Let's try it.

29:23: >> Oh,

29:24: >> y. So, we got one little star.

29:27: >> So, this is the exciting part because we

29:29: haven't looked at what happens on day

29:31: two. Well, on part two here, right?

29:34: >> And you have to do part one to see what

29:36: happens. And this is where Advent of

29:39: Code tries to mimic what it's like to do

29:42: programming in the real world. because

29:45: now we have some toad that does

29:47: something

29:49: and now she's asking a new question and

29:53: it could be related to what we've done

29:55: so far, right? So, but it's a little bit

29:57: different. So,

29:59: you can mentally think about how can we

30:01: change this like make this tote future

30:04: proof but you never know because you

30:06: don't know what actually it could be. It

30:08: could be we just need to count how many

30:12: times it ends up back at 50 or how many

30:16: times we're seeing the same value two

30:20: times in a row or we have a different

30:22: starting position. But there also be

30:25: something crazy like

30:27: all the Rs me actually don't mean turn

30:31: right. It means how many times to do the

30:35: next instruction.

30:37: like it could be anything like we don't

30:40: know. So this is where sometimes you

30:43: just have to change one value in your

30:45: solution and sometimes you have to

30:47: rewrite the whole thing for part two.

30:49: >> All right. Well, let's see what it is.

30:51: And by the way, for anybody who is in

30:52: the Discord chat right now, Kieran gave

30:56: his solution to part one and two of day

30:58: one. He shared his GitHub and then Jenna

31:00: also shared um day one part yet part

31:03: one. So you can go check out the work of

31:05: others. I think it's really an

31:07: interesting way to learn and especially

31:09: like maybe you are learning Python right

31:13: now and you are struggling or you just

31:16: want to see how other people do things.

31:17: The solutions for advent of code is a

31:19: great place to go see the way that

31:21: different people think. Like Kieran said

31:23: that he implemented Modulo himself, like

31:27: maybe from scratch, which I think is

31:29: hilarious because I am constantly

31:32: reinventing wheels that I don't know

31:34: already exist. [laughter]

31:37: >> All right, let's see. Let's look at part

31:40: two.

31:40: >> So then I I stemmed a little bit. So it

31:43: talked earlier about up here that every

31:47: when you turn the knob, you hear a

31:48: little click.

31:50: >> Oh yeah, I do remember it said that.

31:52: Yeah, I was wondering to be a part of

31:54: this.

31:54: >> Yeah. So that if you had that in mind,

31:57: you might have written it to a little

31:58: bit different, right? Because now we

32:00: have it said the actual password is

32:07: not how many times we end up at zero

32:11: after an instruction, it's how many

32:14: times we're passing zero. Like for

32:16: anytime you turn a knob, just like if

32:18: you turn it 50 times, you're turning it

32:21: 50 increments. Anytime any of the

32:24: increments

32:26: hits zero, we're tapping that.

32:29: >> Oh no. Now I don't know [laughter] how

32:33: to think about this anymore. In our code

32:35: loop, I sometimes think like when things

32:37: change like that, I just want to delete

32:39: my entire loop and start it over because

32:41: if I try to modify my existing one, I

32:43: might make things harder for myself.

32:45: It's like when you ask an LLM to write

32:47: something for you and it's so bad that

32:49: fixing it takes more time than writing

32:51: it yourself from scratch.

32:54: >> What are you meal?

32:56: >> So

32:58: what I normally do is I just copy all my

33:01: code into a part two. So like this is my

33:03: part one solution and this will be my

33:06: part two solution where I would just do

33:09: something. So I'm seeing two main ways

33:12: of handling this. One of them

33:16: is

33:18: doing the math.

33:21: So

33:23: right so like we could do it two places.

33:26: We can either do it around here

33:29: counting

33:31: how many like if we

33:37: like is it going to be one or more? So

33:40: can we count any times it's going to be

33:42: more?

33:45: >> Okay. Wait.

33:48: So like first like if we have if it

33:50: turns by

33:54: if we're turning left

33:57: Oh, but it doesn't know where. No, cuz

33:58: we're actually moving over it.

34:02: >> Yeah, it feels like if anybody has an

34:05: idea here, please let us know. I know

34:07: Jenna, you said you were like still

34:09: working on part two.

34:12: So I think what

34:13: >> advice

34:14: >> I will do it

34:17: differently here by doing so I'll move

34:22: this up in so instead of doing adding

34:28: like subtracting the value

34:31: I will do a new for loop with J in

34:38: the value

34:42: and we're subtracting one instead. So

34:44: instead of subtracting the whole value,

34:48: we are subtracting one

34:52: that whole value of times

34:55: >> that it doesn't make any sense to me but

34:57: keep going. [laughter]

34:58: So here, so here we instead of adding

35:01: 15,

35:04: >> like if it was L15,

35:05: >> if it was L15, instead of adding 15,

35:09: >> okay,

35:09: >> we're adding

35:12: one

35:14: 15 times.

35:16: >> Oh, so we can see once it passes a

35:19: threshold

35:20: >> and then we're just moving this chatter.

35:26: But Kieran says, "What if you land on

35:28: zero?"

35:29: >> But that's fine because that's what we

35:31: want.

35:32: >> So if you land on zero, you get a click.

35:34: But if you pass zero, you get a click.

35:36: What if the

35:38: >> It's only when you land it. So I might

35:39: have been like, it's only

35:42: >> I think it's when you pass zero, you get

35:44: a click, right? Cuz if it you were if it

35:45: was landing on zero, it would be the

35:47: same answer as the first part

35:49: >> where we would only land a certain

35:51: number of times. So it's any plate that

35:54: causes the dial to point at zero. So if

35:58: it if we end up every single time.

36:02: >> Yeah.

36:03: >> If you ever end up at zero for any part

36:06: of this. Okay.

36:08: >> And then

36:10: >> Oh, wait. Isabelle Isabella has a uh

36:14: >> what does she find?

36:15: >> Isabella says, "Don't forget to check

36:16: the warning at the bottom."

36:19: >> What warning?

36:20: >> What warning?

36:23: Where's the warning?

36:24: >> Oh, is it at the bottom of it says in

36:26: this example,

36:28: >> be careful. [laughter]

36:30: >> If the dial were pointing at 50, a

36:34: single rotation like R 1000 would cause

36:37: the dial to point at zero 10 times

36:40: before returning back to 50.

36:42: >> Yes.

36:42: >> So, it is just anytime it passes zero.

36:45: >> Yeah.

36:47: So, let's This is starting to be like a

36:51: lot of

36:56: So, I'm hoping No, I need to put this

36:58: inside one more.

37:00: So, now what we're doing this is

37:02: basically the same to top twice, right?

37:05: So, we are So, what we're doing here,

37:08: we're returning left

37:10: and we have a value of something. We're

37:13: looping over and subtracting one that

37:16: many times.

37:18: Each time we're subtracting one,

37:21: we check if it's zero.

37:24: No, we should move this on before.

37:28: We subtract the value from it and then

37:31: do the modular operator to make sure

37:32: we're between zero and 99.

37:36: Then we check the value is zero and then

37:40: count it. and then we move on.

37:47: So let's This is where we can try the

37:51: the let's sample one more time.

38:02: >> I was not any

38:07: wrong. Could we put a print statement in

38:08: there to check our

38:11: >> Yes.

38:12: >> possession again or value.

38:16: >> Um

38:19: >> Kieran put a big old hinty hint in the

38:22: Discord chat.

38:23: >> Oh, I want to hear it.

38:24: >> Do you want Do you want to know? Um he

38:27: put a spoiler tag on it in Discord,

38:29: which you can do by putting a double

38:30: pipe on either side of something, by the

38:32: way, if you want to.

38:33: >> Um this is a learning space, so we're

38:35: going to go ahead and say it. He says

38:37: the magic is the difference between

38:38: modulo and percent divided by percent

38:42: integer division. [clears throat]

38:49: >> No,

38:55: cuz it's interesting how we never hit

38:57: zero.

39:00: What?

39:04: Oh, we're not doing enough. like

39:06: something is happening. Yeah.

39:09: Uh

39:11: all right. Let's see. So this is why we

39:14: can just do

39:16: I = 1.

39:19: The rest is L. The value is Oh, so we

39:24: know what it is. We're not looping over

39:28: we're just looping over the singular

39:30: value of

39:32: >> of 68. So we only So we need to do

39:38: >> we need to seek that. Yeah.

39:39: >> Yeah. We need to seek of a length of

39:42: this

39:44: >> so that it gives us a little vector of

39:47: like one to that number. And by the way

39:50: Emil's working in R. So we are one

39:52: indexed not zero indexed.

39:53: >> Yes. So that's also very fun because

39:57: every once in a while the puzzle

40:01: assumes that it's one index but a lot of

40:04: times it assumes it's zero indexed. So

40:08: every once in a while R just works

40:11: really well compared to other languages

40:14: by being zero indexed.

40:19: Now, so now I'm doing I'm going to move

40:22: this, but this is going to blow up when

40:24: we do the real input.

40:25: >> That's true. Did we do we have a a part

40:28: two test number to tell us if we're

40:30: right?

40:32: >> Yeah. Let's see. It says six.

40:35: >> Oh, you guys, I think we did it.

40:37: >> So, let's try.

40:38: >> Emil did it. I take zero credit.

40:41: >> So, then and I'm just doing like command

40:44: C to like undo.

40:47: And then we remove this emitted.

40:51: So now we set.

40:56: Oh, we actually one more thing that

40:57: would be fun to do uh is

41:00: R 1,000 cuz that was the the warning.

41:06: >> There was a warning. Yeah.

41:07: >> And and we did set for this. So

41:11: let that was another. So we can also

41:14: think of some of these things as unit

41:16: tests,

41:17: >> right? Yeah.

41:18: >> So

41:20: sometimes if you do these and you're

41:22: doing them in a little bit longer format

41:26: like the later ones require a lot more

41:30: code than these earlier ones.

41:34: And

41:36: yeah, so it's it's just like sometimes

41:38: you actually write the unit test to make

41:40: sure that you're keep following all

41:44: these

41:46: um

41:47: >> do you do this like pretty messily or do

41:50: you like

41:52: >> very messy at first? Okay, I have your

41:55: GitHub with your Advent of code in our

41:57: stats and I'm going to pop that into the

41:59: Discord server channel

42:01: >> just so that everybody can kind of like

42:03: get a glimpse at the way that the meal

42:05: works and um

42:07: >> and that is the cleanup version.

42:09: >> Yeah. Also, I think

42:10: >> 100%.

42:11: >> Expect yourself to be a lot messier. I

42:14: >> Yeah,

42:15: >> am a hot mess and my stuff if I post it

42:18: on GitHub will be equally hot and messy.

42:21: So, so it turned out to be right and

42:23: we're happy. Do we have time for me to

42:25: to show a top like an alternative way of

42:29: handling day one or part one?

42:31: >> Absolutely. Yeah, we are at we have 12

42:33: minutes left and we are totally cool. We

42:36: got we've got 41 people with us right

42:38: now. Hello everybody.

42:40: And we are all happy in the Discord

42:42: chat.

42:43: >> All right. So, I'm just copying over to

42:45: like not ruin anything.

42:48: So then I will still split it out.

42:56: I'll still split it out in

42:59: directional values like this. We could

43:01: do it with

43:03: in DY pipeline

43:06: uh the separate function from tidy out

43:08: also split it but we already have it

43:11: split. So we're saving some time. So

43:13: what we can do is since these

43:17: turns are happening one after another

43:20: we can do it as uh

43:24: uh

43:26: so we can do a time sum of this

43:30: of the value

43:33: that we then

43:37: do the modulo on because that's the same

43:39: as I turning it back and forth.

43:43: But we need to do the directions.

43:46: So in here we can say

43:51: if else

43:54: direction equals to L

43:59: then it's going to be minus one. Oh it's

44:02: a one.

44:04: Oh.

44:08: So basically what I'm doing now here is

44:13: I'm taking the values

44:16: and then I'm turning this direction

44:19: into a vector of like basically a sign.

44:24: So are we adding are we subtracting?

44:29: So now

44:30: >> this is like these are now clicks left

44:32: or clicks right.

44:34: >> Yes. And then we're taking the like the

44:38: like the time sum of this. So we're just

44:40: adding them one after another. But

44:42: that's essentially what we're doing.

44:44: >> Okay.

44:45: >> And then doing the modulo of that in one

44:48: though.

44:49: But then we can do

44:53: sum of rest equals zero. And that might

44:57: not be the right number.

44:59: >> Let's find out.

45:02: >> Why is that the right that that seemed

45:03: too low? 31.

45:06: >> Yeah, that's definitely two. Look,

45:08: >> but the and so what are we doing?

45:14: >> But let's even if we did this version

45:16: and it worked, which I'm messing up

45:18: somehow, but

45:21: even if we did this,

45:26: even if we end

45:28: >> there's a question in slid out. Thank

45:29: you, Laura, for letting me know. It's

45:31: what's the difference between uh the

45:33: double percent which is the modulo and

45:35: just 1% sign.

45:37: >> Uh what is it? Uh

45:44: so 1% I don't think does anything does

45:47: it?

45:47: >> I don't know if that is an operator.

45:49: >> That's not an operator. So that doesn't

45:51: do anything.

45:52: >> Well, at least in R, which is what we're

45:54: working on.

45:54: >> At least in R. Yeah. Right. So that's so

45:56: if you you can do the question mark and

46:00: then like the back around it because

46:02: this is not a it's a function but it's

46:05: not one with values like the like letter

46:08: values so it's hard to search for but if

46:11: you do this instead you can find it

46:14: and here we see

46:17: it's in here

46:20: and they're like describing what they

46:22: do. Oh, there's the what Kieran

46:25: mentioned which is like you have the

46:26: modulo and then the like percent divided

46:30: by percent y.

46:32: >> Yeah,

46:36: >> another thing you could do. So, but even

46:38: if this option worked, that would have

46:41: not worked because we needed to expand

46:43: it in here, right? Because here we need

46:47: to count

46:48: >> individual clips.

46:51: I'm sure there's a way if you cared for

46:54: it. So instead of adding another for

46:57: loop inside,

47:00: you could

47:02: have done the math based on the num like

47:06: the position and the number of clicks to

47:09: find out if it will p how many times it

47:12: will pass.

47:15: Um,

47:16: so you to do something like so if you

47:19: imagine

47:21: the position

47:26: is like

47:27: >> is 40 and the value is 60

47:34: and we are we are minusing right. So if

47:36: we're in a in a left, we to do

47:40: [clears throat]

47:42: if

47:43: value is larger

47:46: than position

47:49: and then because we know if it's larger

47:52: than position, we're passing it, right?

47:54: >> Mhm.

47:57: But if it's

48:01: if the value is then less than 100

48:07: no it needs to be less than

48:10: 100 plus

48:12: like the the depth between so basically

48:16: so here we know that it's it goes over

48:20: it hits zero if it goes over 20 right

48:24: but it als it goes or twice if it's more

48:26: than 120 and three times if it's more

48:29: than 220. Right? So you could

48:33: do the math here

48:35: >> like divide it by 100 first and use that

48:38: like the number of times it goes into

48:40: 100

48:41: >> as your number.

48:42: >> Yeah. So there is a way like you could

48:44: write this up to avoid the inner for

48:49: loop somehow, right? There's there's

48:52: probably like 50 ways to do this and to

48:55: get it right, which is the best and

48:56: worst thing about coding. I feel like

48:58: when I was first learning programming, I

49:00: was like, "But what's the right answer?"

49:02: And and nobody could tell me that.

49:04: They're like, "There's no right answer.

49:06: There's

49:07: >> if the code runs, it runs, right?" Um, I

49:09: wanted to call out Kieran mentioned, and

49:11: by the way, Kieran said he he did not

49:13: actually implement modulo on his own. I

49:15: was just taking him literally.

49:16: [laughter]

49:17: Um, and he was joking. He said that he

49:19: used accumulate from the per package

49:21: which I think is a interesting solution

49:24: >> because there's a so many different ways

49:26: of handling this

49:28: >> like sequentially do your cumulative sum

49:32: by applying

49:34: a function cumulatively over time and

49:38: newer was saying in the beginning too

49:39: that she would have solved it by like

49:40: creating a function that did your thing

49:42: that you need to do in your for loop. Um

49:46: yeah, we're having a conversation in the

49:48: chat about modulo and the difference

49:51: between R and Python operators.

49:54: >> Like another thing you should do which

49:55: would be overkill in this situation. But

49:57: a lot of admin of code lights these

50:00: things where you it's like a series of

50:04: instructions, right? Like if the first

50:05: character is L, you do something. If the

50:08: first character is R, do something else.

50:10: But sometimes there have like six

50:12: different ones that do different things.

50:14: what we do in R which I've done which is

50:17: very fun is

50:20: you take the input

50:23: and then

50:25: with so here

50:28: we have the

50:30: I'm just going to shape off the oh it's

50:33: so long all right

50:35: >> it is super long [laughter]

50:37: [gasps]

50:39: >> so just for like demonstration so what

50:43: we could do is we have the input that

50:46: says this, but what we instead to do is

50:50: modify it a little bit. So you have

50:54: direction

50:57: value

51:03: and then

51:04: >> oh three minutes left as a time check.

51:07: Oh. Um, no.

51:17: So, you can modify it a little bit,

51:19: right? So, now suddenly it looks like a

51:21: bunch of function tools.

51:23: >> Mhm.

51:23: >> Right. So, you should modify the input

51:26: to turn it into what looks like a bunch

51:28: of R functionals.

51:30: Define the functions R and L

51:34: that does what we need. and then

51:36: evaluate the input.

51:39: >> Oh, I like it. It's almost meta

51:41: programming.

51:41: >> Yeah. So, you can do that here. It's

51:44: over till you need to do like some weird

51:48: like back up things where we need to

51:50: because we need to now modify in global

51:53: scope

51:55: um like the count of zeros. But you

51:59: could do that. you the these two for

52:02: loops we had, you put those inside a L

52:04: function and an R function that then

52:07: just run on itself. So instead of

52:10: looping over the input, we're turning

52:12: the input into code that when evaluated,

52:15: it does the same thing.

52:16: >> So that's so it was a great first day

52:19: because

52:20: >> yeah, this is a fantastic

52:22: >> things to do.

52:23: >> Part one and two for our our purposes.

52:25: This is really fun. If you never did

52:27: Advent of Code before, like I didn't, I

52:29: hope that you are now excited to go play

52:32: with it and there's only 12 days this

52:35: year, so it's a little bit less

52:36: stressful. It used to be 30 days every

52:39: single time and people were, you know,

52:41: staying up past midnight to get things

52:42: done as fast as they came out. And like,

52:45: don't stress that much. But do have fun.

52:47: Do come share in the Discord server what

52:50: you're working on and we can work on it

52:51: together. Um, and I'm so excited that

52:54: you hung out with us today. We are going

52:56: to be here next week with uh Alex Chisum

53:00: who also happens to work here at Posit

53:02: to talk about all the different ways to

53:04: publish shiny apps in 2026. Um because

53:07: our shiny app publication landscape has

53:09: been changing so much and is evolving.

53:11: Um and we would love to show you how

53:14: that works in positron and our studio

53:16: and everything in between. Thank you for

53:18: hanging out with us Emil. This was

53:20: fantastic.

53:22: >> It was a pleasure. It was fun having

53:24: time for anyone. I will try to do like

53:26: if people are in Discord I think people

53:29: are sharing answers as fun

53:31: >> they are

53:32: >> and it it's very entertaining but also

53:35: like make sure to only spend however

53:38: much time you have

53:39: >> on it such it can take over

53:42: >> care for your mental health and your

53:44: friends and family

53:46: >> instead of spending all day on advent of

53:48: code. Okay everybody I will see you on

53:50: the Discord server. Come say hi. Come

53:53: share your code. Other than that, I'll

53:55: see you next week or I'll see you on

53:56: Thursday for the data science hangout.

53:58: Bye everybody.
