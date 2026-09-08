---
type: Video Transcript
title: "Data Science Side Projects | Dylan Poulsen, Libby Heeren, Isabella Velasquez | Data Science Lab"
description: "So, welcome back to the data science lab."
resource: "https://www.youtube.com/watch?v=yXYGhRCSEL4"
tags: ["ds-lab"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T21:59:18Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=yXYGhRCSEL4"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2026-07-27T00:00:00Z"
    usage_count: 474
usage_window: { from: "2026-07-27T00:00:00Z", to: "2026-09-08T21:59:18Z" }
---

# Transcript

00:08: So, welcome back to the data science

00:10: lab. If you've never been here before,

00:12: we are an open space where we talk about

00:14: technical topics. We often have just one

00:17: topic where we are learning something

00:19: with somebody. And the whole point of

00:21: the data science lab is that we get to

00:23: stop and ask questions. But every once

00:25: in a while, and I'm hoping more often,

00:27: we do a project showcase where we can

00:29: have people from the community come and

00:31: share something that they did and talk

00:33: about something that they're proud of.

00:34: I'm excited to introduce our featured

00:38: lab managers for today. You already met

00:40: Isabella, Isabella Velasquez,

00:43: um myself, and Dylan Pollson, and

00:45: Dylan's going to go first. So, Dylan,

00:46: would you like to uh introduce yourself

00:48: real quick, and then I will start a

00:51: 15-minute timer for you?

00:52: >> Yeah, absolutely. So my name is Dylan

00:55: Pollson. I'm an associate professor of

00:57: data science. I was formerly a

01:00: mathematics professor with applied

01:02: mathematics and engineering training. Um

01:05: and have recently yeah taken on leading

01:07: our data science major here at

01:09: Washington College uh which is a small

01:11: liberal arts college on the Eastern

01:13: Shore of Maryland. Um, I'm really most

01:17: famous for something that I'm like most

01:20: proud of, but also most embarrassed by,

01:22: which is that uh which is what I'm going

01:25: to show you today. Um, so this is this

01:28: is a story that I want to tell and I

01:30: think it has good data science lessons

01:33: for this community. uh because it you'll

01:36: see I was ultimately wrong about things

01:39: and I love I love the fact that I can

01:42: share this. Um so yeah, so I'm going to

01:45: tell tell a story of mathematical

01:48: levity, mathematical joy and community.

01:52: >> Awesome. Okay, I'm starting your timer.

01:55: I will check in with you as needed on

01:57: little time updates. Don't mind me if I

01:59: interrupt. Um take it away, Dylan.

02:03: >> Yeah. Okay, so this is the

02:08: story of the onion constant. Um, which

02:11: is a new mathematical constant that I

02:14: came up with. Uh, and this number that's

02:19: represented by this step uh was

02:21: published in the New York Times and the

02:23: pudding and a few other news outlets

02:25: around the world. Um, it was for one day

02:28: very randomly on the top page of hacker

02:31: news. Um, and I think it can show us the

02:35: joy of just doing things for fun. Um,

02:40: so the the problem began from this

02:43: Instagram post by Kenji Lopezalt, who is

02:46: a really famous uh chef and content

02:49: creator.

02:50: uh and he he posed the problem of how do

02:54: you make how do you cut your onions so

02:57: that the pieces are the most uniform in

03:00: size. Uh so he demonstrates in this post

03:05: we had the vertical cuts

03:08: um which you can see you get like large

03:11: pieces over here and small pieces in

03:13: here.

03:14: You can do a radial cut method, which is

03:19: recommended by a lot of chefs actually,

03:21: um, to aim towards the center of the

03:23: onion,

03:24: or you could aim below the center, so to

03:28: a point somewhere beneath the center of

03:30: the onion.

03:33: And so this is to me this was a very

03:37: suggestive

03:39: problem. Um, and I actually found out

03:43: about this from a friend and then after

03:46: after hearing about it. Um,

03:50: my friend had mentioned that the depth

03:53: that Kenji had come up with was 60%

03:56: down. Uh, which sort of which is close

04:00: to the golden ratio. Uh, because the

04:03: ratio 1 to 1.6 is the golden ratio.

04:08: Um and so it made me think like maybe

04:11: the golden ratio is involved in this.

04:14: How can I think about this? Um so every

04:17: single night while cutting onions

04:19: because I have onions every night uh I

04:22: would just think about this problem and

04:24: enjoy

04:26: the retreat to to thinking about

04:29: something just for fun, right? Um and

04:33: then one thing I realized um is if you

04:36: look at this middle picture

04:39: uh I teach a lot of mathematics I

04:43: there's a lot of joy in in doing that.

04:45: Uh but one one thing is when you teach a

04:48: subject you see manifestations of it in

04:52: the world. And when I looked at this

04:54: picture I saw the polar coordinate

04:58: system from multivariate calculus. So

05:01: the the idea being you can measure

05:04: determine a point by how far it is from

05:06: the center and the angle uh that's made

05:10: from the center.

05:13: Um and what I realized is that the

05:17: contours of equal radius

05:20: are the onion layers and the

05:24: lines of equal angle are the the knife

05:28: cuts that you would make. Um, so I

05:32: envisioned

05:34: a infinitely many layered onion where

05:38: you were making infinitely many cuts and

05:41: realize that pieces

05:43: would have a distribution to them. So

05:45: there's a probability distribution in

05:48: these pieces. Pieces closest to the

05:50: center are smaller than pieces towards

05:53: the end, right? Relative to each other.

05:57: and that they're actually distributed

05:58: according to a uniform distribution.

06:01: So for some of you who like the

06:03: probability theory that might be peing

06:05: your interest. uh and it's actually the

06:09: Jacobian determinant

06:11: that gives that probability density

06:13: function because the Jacobian

06:16: determinant for the radial

06:18: uh or the polar coordinate system is r

06:23: and r is also the probability density

06:26: function for the uniform distribution.

06:29: Um I don't want to get too technical

06:32: here because it's mostly about sharing

06:33: the story. Uh

06:36: but

06:39: this is the paper I wrote about it. Um

06:42: this is this is the image I had in mind.

06:49: Um but then I realized like that doesn't

06:52: solve the problem for Kenji, but it gave

06:54: me the lateral move that I needed. Um, I

06:58: realized I could think about

07:01: measuring the distance from the center

07:04: of the onion just in the usual way. And

07:07: then the contours are still the onion,

07:10: the onion layers.

07:12: Um, but I could measure the angle from a

07:15: depth h below the the onion

07:19: and still the Jacobian determinant would

07:23: tell me about the the way the pieces

07:26: were distributed.

07:29: So then it just became a calculus

07:31: problem. Uh, for those of you who who

07:33: know your calculus, uh, I took the

07:35: derivative of h or of the function with

07:38: respect to h, set it equal to zero. um

07:41: sort of classic calculus, right? Um but

07:45: the function that I was dealing with was

07:48: pretty pretty terrible. Um

07:52: if you watch, I can

07:55: show that, but

07:58: >> you know, yikes, right? Uh

08:00: >> you Yeah, you've officially lost Libby.

08:02: [laughter]

08:04: >> Um

08:06: so, so this was fun and I wrote a blog

08:09: post about this. Um, which I think is in

08:12: line with the values I see in this

08:14: community of sharing your stuff out

08:17: loud, learning out loud. Um, and

08:22: word got back to Kenji.

08:24: >> How did that happen?

08:26: >> I So, one one thing I did just like

08:29: maybe selfless self-promotion here. Um,

08:32: I left a comment on his YouTube video uh

08:35: where he had first talked about this

08:37: problem and I said, "Oh, I'm a

08:39: mathematician who got really obsessed

08:40: with this. Here's here's my solution."

08:42: And he was he was he actually responded

08:44: to that

08:45: >> and made comment.

08:47: >> If you have a link to that paper, it

08:48: went over my head, but other people

08:50: would like to see it. So, Rah asked in

08:52: the Discord.

08:53: >> It's in Mathematics magazine, and I will

08:55: also um I will put the PDF in the in the

08:59: Discord.

09:00: >> Perfect. All right. No, no rush now. As

09:02: a time check, you've got eight minutes.

09:04: >> Perfect. Yeah. So, so Kenji uh asked if

09:09: he could maybe use this paper in another

09:12: video and I said, "Absolutely. That

09:14: would be wonderful." Um, and then a year

09:16: went by and nothing had really happened.

09:19: And then I got a message from my friend.

09:21: It's like, "Your name's in the New York

09:24: Times today." [laughter]

09:26: Um, Kenji had Kenji also has a column in

09:30: the New York Times and so had had

09:32: written about this problem. Um, and so

09:36: he talked about his tinkering with it,

09:38: how he he made a computer program to

09:41: study it and then how I had taken that

09:44: and run with it and and made a a big

09:47: mathematical model for this.

09:50: Um, and that was sort of that felt like

09:55: the bow on it. It's like, oh, you you

09:57: know, you solve a problem and it ends up

10:00: in the New York Times. Um, but that

10:05: isn't really the lesson I want to impart

10:07: today. Um, the lesson is that

10:11: when you share your work,

10:14: other people read it and run with it and

10:17: get in contact with you and start

10:19: collaborating. Um, I had a

10:23: person named Matt Sandler, who's a data

10:26: scientist, uh, reach out to me, uh, with

10:29: his code. Um, he had, so I have that

10:32: open here in

10:35: Positron. Um,

10:40: and so he had actually done some stuff

10:43: in Python and was shaping.

10:45: >> Gosh, that's beautiful.

10:46: >> Yeah.

10:48: and trying to calculate the

10:50: the area of the pieces um and the

10:55: standard deviation of the pieces.

10:58: Um and this is this was really cool. He

11:01: was getting results that didn't agree

11:03: with me. Uh one reason why is because

11:07: he's actually using finite cuts and

11:09: finitely many layers, which is not what

11:11: I did. Um, right. I made this

11:14: abstraction to infinitely many layers

11:16: and infinitely many cuts. That's very

11:19: very mathematical.

11:21: Um, here it's actually like getting into

11:23: the raw data of the cuts. Um, I was

11:28: actually able to

11:31: take his code and instead of doing 10

11:34: cuts and 10 layers,

11:36: I did, you know, 300 cuts and 300

11:39: layers. and I saw that my results agreed

11:42: with his in this limiting process which

11:45: was pretty cool to verify. Um, but I

11:49: think the the coolest thing that was in

11:51: here is

11:54: um while he calculated the standard

11:57: deviation

11:59: um in some places he actually

12:04: used what's called the coefficient of

12:06: variation to measure how the onion

12:09: slices varied in size.

12:12: And I was looking at this and then I

12:14: didn't know if it made a difference to

12:16: the results.

12:17: uh but I ran through and it actually

12:19: does make a difference.

12:21: Uh moreover, this is the better metric

12:24: to use. Um and I want to talk about why

12:28: because I think this will resonate with

12:29: the data science audience here. Uh there

12:32: might be people in the in the chat who

12:34: already see why. Um

12:37: >> well, not me, but how did how did it

12:39: feel to figure this out post that New

12:42: York Times article? [laughter]

12:44: Um, it was a little scary because you

12:47: put your stuff out there and

12:50: >> you're like, it's worth it.

12:51: >> Oh, and now someone's saying I'm wrong

12:52: and now someone's doing but it was never

12:55: malicious, right? And

12:56: >> Right. Yeah.

12:57: >> Um, and what what I had to get past and

13:02: especially with all the attention is

13:03: just like

13:05: um you know when you start debating

13:08: ideas that isn't a debate against you

13:10: individually, right?

13:12: >> Right.

13:12: >> Um you were brave enough to put it out

13:14: there which meant you got to have this

13:16: conversation about mathematics and the

13:18: coefficient of variation in the first

13:19: place

13:20: >> and it was so much fun. Um and everyone

13:23: like the conversations are just

13:26: wonderful and uh I feel like I made a an

13:29: internet friend through these through

13:31: these interactions. Um

13:34: but the the coefficient of variation

13:38: meas is a measure you can use that

13:41: allows you to compare

13:44: um how much a quantity varies

13:47: um even when it has a different mean.

13:50: And I want to show you the importance of

13:52: this by thinking about like my favorite

13:54: example, which is if I had a data set

13:56: that was weights of elephants and I also

14:00: had a data set that was weights of mice,

14:03: the standard deviation of the mice

14:06: weight data would be less than the

14:09: standard deviation of the elephant

14:11: weight data. U but if you calculate the

14:14: coefficient of variation, they become

14:17: comparable. It's the ratio of the

14:19: standard deviation to the mean.

14:22: And one thing that's in this paper and

14:24: in this in these ideas is that the the

14:27: average onion slice area also varies

14:31: with h. Uh and so you can't actually

14:34: compare them all as you vary the depth

14:36: that you cut towards.

14:39: So so it's like mice and elephants and

14:42: we need them to be able to be compared.

14:44: Uh, so, so to me then there's actually a

14:49: different onion constant. So the the one

14:52: that's in the New York Times is 0.557.

14:56: It's this number right here.

14:58: >> Whoa.

14:59: >> Um,

15:00: >> do you think you have enough numbers

15:01: [laughter] to your decimal for accuracy?

15:05: >> Yeah. When when it comes to math,

15:07: there's never enough, right? [laughter]

15:10: >> Isabella says, "Is it transcendental?"

15:12: >> It is. It is. [laughter]

15:15: Uh but this is the onion constant when

15:18: you use the coefficient of variation.

15:19: It's 757.

15:22: >> Oh, that's quite different.

15:23: >> It is quite different. And

15:27: I I was amazed by this. So I I even

15:31: wrote in my paper here um

15:35: right I don't think of the two dimension

15:38: the variance onion constant is the wrong

15:40: onion constant um because the math is

15:44: correct but

15:46: >> the coefficient of variation onion

15:48: constant is the solution to the better

15:51: question.

15:53: >> I love that. I love that. This was so

15:55: fun. And we do actually have um a couple

15:58: of questions in the chat. We had one

16:00: from Zach.

16:02: >> Oh, Zach, where's your question? It is,

16:06: do you think this problem could be

16:08: approached using complex numbers?

16:11: >> Uh

16:13: possibly. I have not explored that at

16:15: all, but

16:16: >> um my my encouragement is try it out. Uh

16:20: have it again back.

16:22: >> Awesome. Also, um Rob had asked, "What's

16:24: that character for the onion constant?"

16:26: >> Oh, yeah. Uh it's a Hebrew character,

16:29: and I hope I don't butcher it. See? Um

16:32: >> okay.

16:33: >> And chosen because it looked to me to be

16:36: most like an onion.

16:38: >> It does look like a little onion. It's

16:39: very cute. We also had one from Brian

16:42: that said, "What if you minimized the

16:44: coefficient of variation in the surface

16:46: area of the pieces?"

16:49: >> Can you repeat it? Sorry, I was closing

16:51: windows. It says, "What if you minimized

16:54: the coefficient of variation in the

16:56: surface area of the pieces?"

16:59: >> I haven't done it for surface area. Um

17:01: because that was actually the

17:02: two-dimensional onion problem. So you're

17:05: thinking of the onion as being a

17:06: two-dimensional object. Um I have done

17:10: the minimum coefficient of variation for

17:12: the three-dimensional volume,

17:16: >> which I like. I like different ways to

17:19: think about it. Emil says, "We need to

17:20: get this on The Onion," which seems like

17:22: an appropriate outlet. Somebody, does

17:25: anybody know anybody who works at The

17:27: Onion? Please help us get on it.

17:31: >> Okay. Well, Dylan, that was amazing.

17:34: That was so much fun. Um, and I want

17:37: everybody to also look at the pudding

17:39: article just because the onion font is

17:42: so glorious. I don't know who made that

17:45: onion font.

17:47: Um, but some designer at the pudding had

17:50: a lot of fun with it. Isabella just put

17:53: it in uh the Zoom chat and I think that

17:54: she'll put it in the Discord as well.

17:57: Um, you can probably see it. Yeah. In

17:59: like the the preview that shows up from

18:01: the embedded image is just so cool. And

18:03: all the way through that pudding

18:04: article, you can see this onion font

18:06: used in different ways.

18:08: >> I'm obsessed with it. Like the moment

18:10: Dylan shared this, I was obsessed with

18:12: the font. [laughter] My I've had I've

18:14: had alums from this college reach out to

18:16: me being like, I saw the pudding font,

18:19: the pudding onion font on Instagram, and

18:21: [laughter]

18:22: >> it's so good.

18:24: >> It's so good. Whoever made that amazing.

18:26: And thank you to you for bravely solving

18:29: this problem in public, even though you

18:32: you feel like it wasn't the optimal

18:34: solution to the optimal question. I

18:37: think it's a great illustration of

18:38: putting yourself out there, doing work

18:40: that you care about, even if you think

18:41: nobody else cares about it, and finding

18:44: out that other people actually do, and

18:45: it's really fun. And also, everybody, go

18:47: check out Kenji um Lopez all because

18:49: he's just uh absolutely wonderful. I

18:51: love watching him on YouTube. Okay,

18:53: well, now it's my turn. I'm so nervous.

18:56: I'm going to share my screen

18:58: um and hopefully I'll share the right

19:00: one and I'm going to start my own timer.

19:03: Um by the way, I am Libby Herren. I run

19:05: community here at Pit. I'm also a data

19:08: scientist by trade, even though I now do

19:09: this stuff now. Um, and I'm going to

19:12: tell a story of how I built an app that

19:14: nobody asked for uh, and took like a

19:17: year and a half to do it.

19:20: So, this is the story of the Ellsworth

19:22: app, and this is how it started. This is

19:25: my inspiration. This is not my picture.

19:27: This is a picture um that I think this

19:30: is one that's close to what Stacy

19:33: Taylor, who is the Crooked Hen, this is

19:36: her uh her blog, posted on Instagram.

19:39: She posted, "I'm making a quilt that's,

19:41: you know, inspired by Ellsworth Kelly.

19:43: And isn't it pretty?" Right? And my

19:45: brain was like, "Oh, I love this so

19:46: much. I love color. I love spectrum

19:49: color. I love everything about this."

19:52: Right? So, this is her uh blog post

19:54: about it that she made a little bit

19:56: later. And you can see that she has

19:59: little squares of color of fabric. And

20:03: you can tell that there's some

20:04: randomness going on here. I love

20:06: randomness and probability. I'm a stats

20:08: kid. This is exciting for me, right? So,

20:10: I message Stacy immediately on Instagram

20:13: and I say, "Oh my gosh, I'm so excited

20:15: about this. Um, my brain wants to code

20:18: this. My brain wants to code an app."

20:20: And she's like, "Well, go for it. I just

20:22: did some stuff in Excel and I'd love to

20:24: see it, right? Um, so I went from this

20:28: inspiration to let me Google Ellsworth

20:31: Kelly. Ellsworth Kelly did the Spectrum

20:34: Colors Arranged by Chance series in the

20:36: 1950s. This is the piece that Stacy's

20:39: quilt is inspired by. It's um the number

20:42: three of the series. And these three

20:45: pieces specifically, this is seven,

20:48: four, and three, were very, very, very

20:51: inspirational to me. My brain just

20:54: picked them apart. I was like, "Oh my

20:55: gosh, how did these how are these

20:57: conceived? How are they made? What are

20:59: they made of?" All of the things, right?

21:01: And if you see all of these say collage

21:02: on paper, it's quite tiny on my screen,

21:05: so it's very hard to see. And they're

21:07: all 39 by 39 in.

21:10: Um, so

21:12: I instead of doing a bunch of research

21:16: on Ellsworth Kelly first, I just dove

21:19: into thinking about probability and how

21:22: this might have worked. Um, and you can

21:24: see on my blog, this is part one of my

21:27: blog where I took a picture of my

21:29: favorite, which is that number three

21:31: over here on the side, and I dissected

21:35: it by hand, uh, using Procreate on my

21:37: iPad. I was like, I'm going to count all

21:39: the things. And you can see me counting

21:41: like the circuits, right? Like starting

21:43: at the center, we have a circuit of

21:44: four. And then we have a circuit of more

21:47: than four. And then we have a circuit

21:48: of, right? And they keep going. Here's

21:50: me trying to figure all of that out. 40

21:53: + 40 + 38 plus 38. How much is all of

21:55: this? And here's me trying to do math

21:57: and me saying, "No, I'm wrong." Right?

21:59: Like, I did a bunch of incorrect math.

22:01: I'm not a mathematician. Uh Dylan, close

22:03: your eyes for most of this. Uh, but I

22:06: knew that it was exciting and I wanted

22:08: to work on it that this was the point

22:10: where I stopped and did a little bit

22:12: more research from Ellsworth Kelly uh

22:15: like interviews with him and stuff. And

22:17: I've wish that Kelly had put this out a

22:20: little bit earlier but much later she

22:21: put out how she did it which is in Excel

22:24: where she created some different

22:25: matrices of probability and randomness.

22:28: Um, but she had not put this out and I

22:30: had not seen it when I started and I was

22:32: actually really glad for that because it

22:34: meant I got to struggle through in my

22:35: own way without any inspiration for how

22:38: to solve this problem. Um, and my

22:41: problem was I knew that there was an

22:43: increase of probability

22:46: from the outside in, right? So the

22:48: inside starts with like a 100%

22:50: probability that we're going to have

22:51: color and then as we go further out

22:53: there's less and less probability of

22:55: color appearing against this background.

22:57: And when I did my research for how Kelly

23:00: made this, it was very much like Stacy's

23:06: little bits of color, right?

23:08: um he had his limitations were what

23:13: colors existed in this paper that he was

23:16: buying in France, right? This like

23:18: colored paper. Um and so he had this

23:22: like stack of different papers. He had

23:24: them all cut up into little squares and

23:25: he basically had them in a hat and he

23:28: could draw them out by random. But the

23:30: important part was that for his

23:32: different pieces that he made, he gave

23:34: himself different constraints

23:36: for where and how often the colors were

23:40: placed and also which colors could be

23:42: next to each other. Because if you look

23:43: at these pieces, um you'll see that

23:47: there are not a ton of repeats. There

23:50: aren't more than like two colors next to

23:52: each other.

23:54: See how there's like two here and

23:56: there's there's a couple that are closer

23:58: together. um in other places, but

24:00: there's not a lot of right next door

24:03: repetition between color. And I knew

24:05: that that would be a mathematical

24:06: problem to solve or a comparison problem

24:10: to solve. Um so I went through and I I

24:14: did all of this by hand and I did a ton

24:17: of pseudo coding by hand and really I

24:20: didn't code anything at all. I just

24:22: started writing down my code and my

24:24: ideas. I wanted to share all of this. I

24:28: just wanted to like have the goal of

24:29: writing it down and keeping track of it

24:31: and just showing what my process looks

24:33: like because I'd never shared it with

24:34: anybody before. So, you can see all of

24:36: it and it's all very very messy. So, the

24:39: main things I want to share are how I

24:40: got inspired, which is through um

24:42: somebody posting about their quilt. The

24:45: idea that I couldn't shake was just that

24:47: I wanted to make this app um and then

24:50: the mess, sharing the mess, right? That

24:52: was the whole point. So, I can't show

24:55: you this entire seven-part blog series.

24:57: That would be banana pants. There's no

24:59: way. You would be very, very bored. But,

25:01: I do want to show you just some of the

25:04: mistakes that I made and that I um that

25:08: I recorded. So,

25:10: one of the first things is that I

25:12: miscounted

25:14: twice. like here when I'm counting all

25:18: of this stuff,

25:20: I counted two or three or four times and

25:22: I kept coming up with different numbers

25:24: and I was really frustrated. Um, and

25:26: then I did told you I stopped and did

25:29: that research like how did Ellsworth

25:31: Kelly do this? And in an interview with

25:33: him, he mentions, oh yeah, I knew that

25:36: with every increasing circuit of grids,

25:39: the number of squares increased by

25:41: eight. Super easy. just plus eight for

25:44: each one.

25:46: I wish I had read that a lot sooner

25:49: because this was like a day of me

25:51: struggling and feeling very very dumb.

25:54: Um, so yeah, I say it again. Wow. Wish

25:57: I'd read that interview with Kelly

25:58: saying this much earlier.

26:01: So I was like, I'm going to need to

26:04: create a matrix of probabilities. I'm

26:05: going to do all this stuff. I did a

26:07: proof of concept and my initial code was

26:09: focusing on a matrix when really I could

26:11: have just made a vector. I figured that

26:13: out eventually, but I had to get through

26:15: the struggle to do it. Um, and I also

26:18: wrote this like really convoluted piece

26:21: of code where

26:26: I absolutely just like

26:29: kind of did everything wrong for a long

26:31: time. Here's my proof of concept. I was

26:33: so excited. I was just taking

26:35: screenshots on my phone because I

26:37: couldn't even I was so excited that I

26:39: couldn't even like uh properly

26:41: screenshot. I said I was drunk with

26:43: power at this point.

26:46: I just like made a thing that sort of

26:47: worked and I was really really excited.

26:49: But I knew that at that point I needed

26:50: to to go further. So I wrote this like

26:53: very convoluted thing where I'm like,

26:56: you know, here's all the math that's

26:57: going to work things out. And I

27:00: struggled for a really long time. There

27:02: was like a bunch of code that looked

27:03: like this. Um, this says, "This goes on

27:06: for some time. I'm going to spare you.

27:07: Eventually, I got to a solution I

27:08: liked." But you'll see that I say,

27:10: "Still ignoring the fact that I could

27:12: just subtract." There was an easier

27:14: solution to my problem the entire time

27:16: to all the math I was doing. I was

27:18: writing a bunch of math that just

27:19: avoided subtraction. I don't know why.

27:22: And subtraction was the easy thing to

27:23: do. Um, here's my pitch for the book

27:27: Subtract actually by Letty Clots.

27:30: Definitely read that. I'm going to put

27:31: it in the chat. Oh, that's a super

27:33: annoying Amazon link. But, um, that is

27:36: like a book I wish I had read at this

27:39: point and I had not yet, I don't think.

27:42: Um, the other mistake that I made was I

27:45: kind of theme voided myself

27:48: when I was trying to make the the gplot

27:51: of of these probabilities to make sure

27:53: that I had them right. Right. Like, do I

27:54: have my probabilities right? Are they

27:55: clustered in the center? Are they

27:57: further dispersed on the outside? See

28:00: how I have nothing on the outside

28:02: because in my code I am getting rid of

28:05: it. I'm like, "Hey, get rid of this

28:07: like, you know, access text, right? Why?

28:11: Why did I do that? I don't know. I just

28:13: did it." And I continue to do it. And

28:16: the reason why I couldn't figure this

28:18: out as I like continue and continue to

28:21: fail and I get all upset and I'm like,

28:22: "Why isn't this working? I'm testing and

28:24: I'm testing." Um,

28:28: look at me. I'm like, "This is

28:29: definitely not correct, but why? I've

28:31: done something wrong, but why? What is

28:33: it? I'm just trying so hard." Uh,

28:36: there's a note from Future Me that says,

28:38: "This is hard to watch. Think about how

28:41: ggplot makes plots." And I had to kind

28:44: of stop and and come back to it later.

28:47: And this is my my second part here,

28:49: saying, "Hey, uh, Libbyy's about to feel

28:51: really silly. Just watch." Because what

28:54: I do is I go back to basics. I go back

28:56: to just a regular ggplot. Here it is.

28:59: Nothing fancy, which means I'm leaving

29:01: these on. And then I realize that the

29:04: index, the origin is 0 0 in the bottom

29:07: left. And this is the point that I had

29:09: just completely forgotten about even

29:11: though I have taught ggplot for years,

29:13: right? And like it was very

29:14: embarrassing. Um, so here I am saying,

29:17: hey, oh my gosh, the axes start from

29:20: zero in the bottom left and they go up

29:22: from there. And this is my problem. this

29:24: is all I needed to know to fix my

29:26: problem and hooray get something that is

29:30: corrected and uh you know by the by the

29:33: time I I figure it out right I'm so

29:36: happy

29:38: just I figured it out.

29:40: >> Yeah, Dylan has a note that he loves the

29:43: recorded thoughts of the moment. So

29:45: often we produce a clean product without

29:47: seeing all that goes into it. And I

29:49: remember Libby when you and I were doing

29:51: our first collaboration together and I

29:54: noticed because I definitely do that. I

29:56: only end up with the final code but you

29:59: are so good at writing comments as you

30:01: are changing editing.

30:04: >> Yeah,

30:05: >> there's a comment for every line here.

30:06: Y'all, this is how I work. No regrets.

30:09: [laughter]

30:11: [gasps]

30:12: >> Um,

30:13: >> there was another question from Dylan.

30:15: Do you think these handwritten notes are

30:18: valuable in today's age of AI?

30:21: >> I mean, I hope they are. And part of my

30:23: hope for this was that I could just show

30:25: people that everybody's brain works

30:27: differently. So, if your brain works

30:28: differently than mine, you can see an

30:29: example of somebody whose brain works

30:31: differently and maybe be inspired to

30:35: think about your own process. Do you

30:37: write stuff down? Why not? Why? Um, but

30:40: also there's so much fun in looking back

30:42: and being like,

30:45: "Look how great I was. Look at me." I'm

30:47: like, "Note from future Libby. Gosh, I

30:49: love her. Look at the wonder and

30:50: enthusiasm. This is the best, right?"

30:52: Like, I got to watch myself as I'm

30:55: rereading this and re and putting it on

30:57: the internet. Um, it was just wonderful.

31:00: And the only other mistake that I

31:02: thought was really funny was that I

31:04: wrote I wrote this code where I knew in

31:07: my brain I need to grab a random number

31:11: uh and it needs to I need to compare

31:14: that random number to every single cell

31:15: in whatever this matrix matrix matrix is

31:18: that I create. But I just grabbed one

31:21: for the entire data frame. Like I I

31:23: didn't put it in a loop. It grabbed one

31:25: for everything. And so my resulting

31:27: thing was just a binary yes or no

31:30: completely wrong thing. And it was so

31:33: fun to figure out where I was like

31:35: laughing so hard at myself. Nobody else

31:37: was in the room with me, but it was

31:38: hilarious. Um, but anyway, that is most

31:42: of what I want to share is that

31:44: recording your problems as they're

31:46: happening are so great. And then the

31:49: only other thing that I thought was so

31:50: fun, this was all me like by myself,

31:52: right? At the end, I got on Discord. I

31:55: got into the Shiny channel and I just

31:58: posted like, you know, I like my app and

32:01: here it is. Um, and I'll show you the

32:03: actual website in a minute, but here's

32:05: the gist of the app. And I'm like, you

32:08: know, I can make it whatever size I

32:10: want. I can change the background, black

32:12: and white, and then I can create my art

32:13: piece. And there it is. And also,

32:17: there's a little PDF that we can print

32:19: out here. So, if you want to create a

32:20: quilt like my original inspiration, you

32:22: can. And you have a swatch, right? Um,

32:25: but the problem was when this is small

32:28: and you create art piece, you don't know

32:31: that anything has happened. Like you

32:33: have to scroll down and I had some

32:35: little instructions here that were like

32:36: scroll down, scroll down. But nobody

32:38: could use my app. It was completely

32:40: useless cuz you can't tell what's going

32:41: on. So I posted it to the shiny channel

32:44: and Adam Higard who also works at Posit

32:47: but is an engineer not a data scientist

32:50: and has some web development experience

32:52: who knows like you know HTML much much

32:54: better than I do saw that and he was

32:57: like oh you can just use um this little

33:00: line of code and I'm like what what does

33:02: that mean Adam I don't understand cuz

33:03: for him it made perfect sense for me it

33:05: was complete nonsense and he was like oh

33:08: well it just like you know modifies

33:10: scrolling behavior like automatically.

33:12: I'm like, "Okay, I'm going to ask Chad

33:14: GPT for help at this point." I hadn't

33:16: asked Chad GPT for much help at all.

33:18: This was years ago and we weren't really

33:19: using Lols for anything. Um, but I asked

33:22: it how to insert it and like I I just I

33:25: know I can use a tag and I know I can

33:27: use HTML. Help me insert this. So, this

33:30: is this little piece of code which I

33:32: will un uncomment here. Um, and I'll

33:35: I'll run my shiny app again.

33:38: And now when I create my art piece, it

33:40: automatically scrolls right to my art

33:43: piece, which is exactly what I wanted.

33:46: And I never would have figured this out

33:47: because I didn't know HTML could do

33:49: this. So the moral of that story is,

33:53: hey, go talk to people who have

33:55: different backgrounds than you do. Be

33:57: really vulnerable. Let them know that

33:59: you don't know what they're talking

34:01: about. And um ask them to explain things

34:04: like you're five, right? Like those are

34:07: the the ways that you can move yourself

34:09: forward. You have to be vulnerable

34:11: enough to do that, to ask for the help

34:13: in the first place, to admit you don't

34:14: know what you're doing, all of that.

34:16: Because now I'm incredibly happy with

34:18: this. I love it so much. And um you

34:22: know, I I don't it's not useful to

34:24: anybody,

34:25: but that doesn't matter to me. Um I love

34:28: it. And here is my app in all of its

34:31: glory with all of the scrolling

34:34: >> and share it. Someone just asked uh

34:36: here. I'll stick it I'll stick this in

34:38: the the chat for y'all. Um

34:42: but that's it. That's me. That's my

34:44: story. Dylan convinced me to share about

34:47: this because I was convinced absolutely

34:48: nobody would want to hear about it and I

34:50: really appreciative that he did. Thanks,

34:53: Dylan. And Colin, too. Colin, I know

34:55: that you were here earlier. I hope

34:57: you're still here.

34:59: Colin encouraged me about it as well.

35:02: Okay,

35:04: it is time to move on to Isabella and

35:07: Les. We have some other questions. I see

35:10: Macarand, you were asking, is it

35:11: published? Yes. Uh, so the link I just

35:13: put in the chat and let's see, was there

35:17: anything else in here that has a golf

35:19: flag for a question? I don't think so. I

35:22: think there was a very early on

35:24: question. Ah, no, I can't find it. Um,

35:26: about the most optimal like solution

35:29: that you found.

35:31: Oh, okay. So, I did do a small code

35:35: review

35:36: with uh my friend Santiago, who is

35:39: sometimes here. Usually, he's usually

35:42: not on Discord. Um, but I sent it to him

35:44: and was like, do you think I could make

35:45: this any faster? And he was like, you

35:47: know, um, honestly, it's probably fine.

35:49: He did review it and he was very nice

35:50: about it. Um, but I think the only thing

35:54: that I um think that I could have that

35:57: could have, you know, maybe made it more

35:59: optimal was perhaps doing it the way

36:01: that um that Stacy did it in in hers.

36:05: So, what she did was she created just

36:06: two matrices. one of her probabilities

36:10: from the outside in or the inside out

36:12: and then one of random probability um

36:15: for I think for for whether or not it

36:18: was filled in. And then she just layered

36:20: those on top of each other. And what she

36:22: started with was just a binary sort of

36:24: black and white. And then she used

36:28: her like hat of colors and her

36:31: determination just like Ellsworth would

36:33: have done to decide where her things

36:35: went. But I needed to replicate that

36:38: human thinking process of taking

36:40: something out of the hat with math and

36:41: note com numbers and code and stuff. Um

36:46: my question and what I've talked to

36:48: other people about before is just like

36:51: this is an good example I think of a

36:52: type of problem that maybe needs a human

36:54: brain and maybe wouldn't have been

36:56: solved very well by just giving it to

36:57: Claude, right? Like Claude would have

36:59: been like why would you want to do this?

37:01: I don't understand. Um, but there is a

37:05: lot in there in that seven-part blog

37:08: series of me trying to figure out the

37:10: optimal solution for like getting the

37:15: getting the um

37:17: sort of probability curve correct for

37:20: when I made things bigger and smaller.

37:22: So like how big can I make it? I can it

37:26: only makes sense to go up down to 13.

37:29: Um, and how big can I make it? It really

37:32: only made sense to go up to like 60, but

37:34: you can go as big as you want

37:36: mathematically and um what looked best

37:39: where where was it, you know, originally

37:41: it was like 40. Um so those were some of

37:44: the sort of constraints I had to work

37:45: with. And then once we switch it to

37:47: black, I'm going to remove black as a

37:48: color option. So there's all kinds of

37:50: things I had to think about. Um the the

37:53: hardest part was actually

37:56: getting um getting it to not repeat

38:00: colors. There's probably like two whole

38:02: blog posts just on that. But that's it

38:04: for me. Let's move on to Isabella.

38:07: Isabella, I cannot wait to um hear about

38:10: creating a theme for Positron because I

38:11: think that's what you're going to talk

38:12: about. I thought you might talk about

38:13: Pyon, but we have a change of of uh of

38:16: theming here. [clears throat]

38:18: >> Thank you. And thanks everyone so much

38:20: for joining.

38:22: So

38:23: uh so I am going to talk about the

38:26: journey that my older brother and I took

38:29: to create a positron theme um called

38:33: Tomorrow Tomorrow Night Bright Art

38:35: Classic. And my older brother is

38:37: amazing, the true inspiration. He's

38:39: really the only reason I joined the art

38:41: community. So if you're watching this

38:43: Vita, thank you very much. Changed my

38:45: life more ways than one. And so uh this

38:50: is what it looks like. And so the

38:52: inspiration is on in our studio.

38:55: Tomorrow night bright is generally the

38:57: theme that I use for my day-to-day

38:59: coding. It looks like this. It has this

39:02: really nice um [clears throat]

39:04: uh kind of like dark background and

39:06: really bright colors. And for me it's

39:08: like really easy to see and everything

39:10: like that. And uh we ported it over to

39:13: Posetron. If you've never uh installed a

39:17: theme in Positron, what you can do is in

39:20: your sidebar uh there's an extensions uh

39:23: tab, click click on that and there

39:25: should be a way to search extensions

39:28: that are available and you can search

39:30: tomorrow night bright and I already have

39:33: it installed but there would be an

39:34: installed button here. Uh, I also have

39:39: uh the link if you would like. And I

39:41: would also really love to shout out

39:44: Shelby Levelville who also created

39:47: Tomorrow Night Bright8s our classic. Uh,

39:50: in case this is your favorite our studio

39:53: themes. It was amazing. Thank you,

39:55: Shelby. And then if you have like

39:58: multiple themes installed within

40:00: positron, if you open the command

40:02: palette which is command shiftp and

40:05: click uh preference um color theme, you

40:08: can rotate through the different themes

40:10: and you know pick the one that you are

40:12: interested in in showcasing in that

40:14: moment. I'll just leave it for tomorrow

40:17: night bright for now.

40:19: And so, um, in terms of R Studio, in

40:23: case you've never seen how to switch

40:25: themes in R Studio, if you go to tools

40:28: and then global options and then

40:30: appearance, um, you can install themes

40:33: from here. And so there is a package

40:35: called RS themes by Garrick Eden Buouie.

40:39: And it has a ton of other themes that

40:42: you can install in our studio. And one

40:45: of the other ones that I really like is

40:47: this Ally Dark from RS Themes. And it's

40:51: meant to be optimized for um color

40:53: accessibility in terms of its contrast

40:55: and the colors that it chooses. If I

40:57: click hit apply, you can see what it

40:59: looks like here. It's a little bit more

41:01: muted, but generally when I give demos

41:03: or things like that, this is the one

41:05: that I like to go with. So um so I

41:08: wanted to show like very quickly how you

41:11: could get started in creating uh your

41:13: own theme if you're interested.

41:15: So here is the link for RS themes and

41:21: then if you go into the inst folder and

41:26: open that up and if I find it here we

41:29: go. Um, you'll notice that the the theme

41:33: is an SAS file SCSS

41:37: and this is what it looks like. So, the

41:40: file type for um for editing themes in

41:44: our studio has a RS theme extension for

41:48: VS Code. Imposetron is forked off of VS

41:50: Code. It's a TM theme extension. and uh

41:55: versus like a SAS file or CSS file, a TM

42:00: theme is an XML file. So very very

42:04: different structure. And so I what I did

42:08: was essentially I opened up a new

42:11: project um and gave it to Claude and I

42:15: will say you know AI has its use cases

42:18: and I think this is a great one.

42:20: [laughter]

42:20: Basically, I gave it the CSS file that

42:24: you see here. And I was like, "Hey, can

42:26: you make this into a TM theme file?" And

42:29: if you've never seen an XML file, this

42:31: is the way that it looks like. And if

42:34: you'll notice, it's it's very different

42:35: from S CSS like um and to do

42:39: [clears throat] that by hand probably

42:41: would have taken a very long time, but

42:43: you know, AI did it in a few seconds.

42:46: And so I uh my brother and I wrote a

42:50: blog post. I don't know if I shared it

42:52: or not. If not, I shared it again. Um

42:55: and

42:56: uh as I was like reviewing like the

42:59: steps that we took to um to show you

43:02: today, I have to admit I I basically

43:04: followed the blog post. So I hope it is

43:06: helpful for you if if you're interested

43:08: in doing your own. But essentially the

43:10: beginning part is installing all the

43:12: things that you need to install. Uh so

43:15: for example, git if you don't have git

43:17: installed uh node.js

43:20: uh neoim

43:22: um and then finally something called

43:24: yman I believe that's how it's

43:26: pronounced and that's what's actually

43:28: going to help you create the extension.

43:30: So just know I already have all these

43:32: things installed. If you're starting

43:33: from scratch uh you'll you um will have

43:36: to install these things yourself. But

43:39: then in a terminal, which I hope you can

43:42: see, I made it as big as I could. Um, if

43:46: you type in,

43:49: let me open up a new one.

43:56: I'm going to

43:58: enter on my R PI folder and then I'm

44:01: going to say yo code.

44:05: And this opens up uh what we need in

44:08: order to start off our extension. And so

44:10: you'll see uh there are many different

44:11: kinds of extension. A theme is just one

44:14: of them. But I'm going to go down to new

44:16: color theme.

44:18: And the reason that I had converted that

44:20: SAS file into a TM theme file is that

44:24: there is this option for importing an

44:27: existing theme and then inline it with

44:29: the Visual Studio Code color theme file.

44:32: Um, so you can definitely start this off

44:35: completely from scratch if you would

44:37: like, but since I am already referencing

44:39: something that exists and um, also just

44:41: to um, do things a little bit quicker

44:44: um, that is like an option for you as

44:47: well. And so I have it in this gist

44:52: not sure which one is correct.

44:54: [laughter] I'm sure it's gist.

44:57: >> And then if I say yes, import this

45:00: existing theme and inline if I give it

45:03: the raw file from the G just from you

45:07: know the little snippet of code,

45:09: [laughter]

45:10: right? And then from here I can do

45:12: things like name the extension like ally

45:14: dark, I don't know, RS classic.

45:18: Uh could keep it the identifier the

45:21: same. I could do an ally dark theme for

45:25: Posatron.

45:27: Um, what's the name of your theme shown

45:29: to start? This is fine. And then you can

45:32: select a base theme if you want. I'm

45:34: just going to do dark. Initiate a Git

45:36: repository. I'm going to say yes. Uh,

45:39: it's going to prompt you if you want to

45:40: open the new folder with Visual Studio

45:43: Code, but I'm going to show how to do it

45:44: in Posetron. So, I'm going to say skip.

45:47: And so if I head back over to Posetron

45:51: and open up um RPI and then Ally Dark RS

45:58: uh classic

46:00: and so here we go. So basically what

46:02: that did is create all the files that we

46:05: need in order to make an extension. And

46:08: so um there's lots of things in here. Uh

46:12: just a really quick like rundown.

46:14: There's a quick start. Uh there is um a

46:19: package.json with like the metadata and

46:21: then the most important one is under

46:23: themes the ally dark color theme JSON

46:26: file and this is where we're actually

46:28: going to change our file uh change our

46:30: theme in order for it to look the way

46:32: that we want. And so from here uh it is

46:37: running things until you get the the you

46:40: know the theme of your dreams.

46:42: [laughter]

46:42: And so uh there's a few ways of doing

46:44: this, but if you enter the command

46:46: pallet again and then hit debug select

46:49: and start debugging and then extension,

46:53: this is going to open up uh as if our

46:55: extension like truly truly exists and we

46:57: have it installed and everything like

46:59: that. And in this case, it would show us

47:01: what the theme actually looks like. And

47:04: so in this case, we can see um it it

47:07: actually looks pretty good uh right like

47:09: in terms of like um

47:13: what you know I might want this ally

47:15: dark theme for positron to be. But from

47:18: here this is kind of where you would

47:20: start tweaking and everything like that.

47:22: So my recommendations for that is like

47:25: change, you know, start changing things

47:27: and when you save uh there we go. If

47:32: when you save things will update here.

47:34: So say like editor background is this

47:37: color.

47:38: Let me know if if my uh code is too

47:42: small too. I can see it.

47:44: >> Okay, great. So editor background. So

47:46: I'm going to change it to FFF which is

47:48: white. And I can see very clearly like

47:50: oh that's what that um you know what

47:53: editor background means. I don't want it

47:55: to be white. So I'm going to switch it

47:56: back. And you could just go back and

47:58: forth until you get again exactly the

48:01: theme that you want. And uh another

48:04: thing that AI use specifically claude

48:08: code for is if you don't know the name

48:10: of a particular part that you want to

48:12: change, you could just ask it. So for

48:15: example, I um if you if we look back at

48:18: our studio, you know, this active tab is

48:23: this darker color, right? And so let's

48:25: say that, you know, I want my active tab

48:28: here to also be that similar color. Um,

48:31: I just asked Claude like what is the

48:33: name of that setting? And I have a

48:36: little cheat sheet here. Uh, but it's

48:38: called tab act active background. And so

48:42: if I add that in, right? And from here I

48:46: can like change this color. And a nifty

48:48: thing about Positron is if you hover

48:50: over the color, it'll give you this

48:52: color picker where you can actively

48:55: change the color to whatever that you

48:57: want. And so

48:58: >> Oh, whoa, whoa, whoa. Can you show that

49:00: one more time because I did not know

49:03: this and I got halfway through

49:04: [laughter] my own theme.

49:08: So you just hover over, don't click,

49:10: just hover over the hex color code and

49:13: then it would pops up this color picker

49:15: where you can, you know, change your

49:17: shade, change the color, right?

49:20: >> It just prefills your hex code in there.

49:22: >> Yeah, exactly. And then the preview

49:25: updates as well, so you can see exactly

49:26: what it looks like. So if I hit save,

49:30: ah, save now. Whoops, I don't have my

49:33: other

49:35: folder. There we go.

49:37: there. So, we can see indeed the tab,

49:40: the active tab now is that green that I

49:43: chose. And then I can keep like editing

49:45: it. I actually want it to be like this

49:47: dark color. So, then save and then you

49:49: just go back and forth until you

49:52: >> Amazing.

49:53: >> So, you get

49:53: >> We had a collective mind-blow moment

49:55: right there. So, sorry stop you. That

49:58: was amazing. This is the importance of

50:01: pair coding, [laughter] y'all.

50:03: Code with other people. They will do

50:05: things. click things and hit keyboard

50:07: shortcuts that you have never used

50:09: before. And for them, they're like,

50:10: "Yeah, this is just the way it works."

50:12: And for you, your mind is blown.

50:13: [laughter]

50:15: That's [clears throat] awesome. Um,

50:17: yeah, and just to kind of wrap up, so

50:19: again, you can go back and forth, edit

50:20: your theme, and and until you get the

50:22: one that you want, you can install uh

50:25: extensions locally, but there are other

50:28: ways of sharing if you want to share it

50:30: to like the broader world. Um, so

50:33: there's VS Code extension marketplace

50:36: and those are specific to uh that's

50:39: specific to VS Code and then there's an

50:41: open VSX marketplace and that one is for

50:45: I believe all VS code based editors like

50:49: positron. And so if we head on over back

50:52: to the

50:55: blog post,

50:57: um we actually like barely go into it

51:01: like here we go through like the

51:03: specific settings and everything that we

51:04: changed. Um once we were ready then

51:08: there um there the VS code actually has

51:11: very good documentation on how you can

51:13: publish this into the different

51:14: marketplaces. uh you publish to VS Code

51:18: first and then um open VSX and then from

51:21: there it's like uh this is what the page

51:23: actually looks like if you go um and it

51:26: has like basically it reflects whatever

51:28: you have in your read me like any images

51:30: and things like that. People can

51:32: download it from here if they want and

51:34: everything. Um and it's nice to it like

51:37: it tracks how many people have

51:38: downloaded it and you know as you make

51:41: changes this updates as well. Uh I know

51:43: like a big question folks ask is like

51:45: how do I know an extension is good to

51:48: good to download. One of the metrics you

51:50: can see is like the number of downloads

51:52: right of course who published it like

51:54: like this is my brother you can trust

51:56: him um or the number of downloads and

51:59: things like that. Um yeah and so that

52:02: that was the story of of how we did it.

52:05: And the last little note that I wanted

52:07: to mention is we created these tab sets

52:10: to kind of like compare the different

52:12: things that we changed. And this is

52:14: actually a a cordto extension uh by Muel

52:19: Canui. And if you click on it like this

52:22: actually copies the color and you can

52:24: you like so that way you don't have to

52:26: copy and paste the actual hex. You can

52:28: just click that button. Um and it I

52:30: think it looks quite nice in a cordo

52:32: document. So I'll share that as well.

52:34: Awesome. It does look amazing. Okay, we

52:36: have two minutes left and we have a

52:38: couple of questions. Let's see if we can

52:39: get him in here. Um, Renato had asked

52:42: why in Vim instead of Posatron to build

52:45: a Posetron theme.

52:48: >> Oh, I I didn't know that was an option.

52:50: [laughter] So, that's very cool. I would

52:53: love to see how that works. Also having

52:55: a brother who's like a software engineer

52:58: probably uh like skews things towards

53:01: software engineering tools a little bit

53:03: and you're just like I'm just going to

53:04: do what I'm told for some of these

53:05: things. Um no Tobco had asked does the

53:08: editor background have transparency to

53:10: see your desktop? I'm not sure exactly

53:12: what this question is asking but like

53:15: could you set the transparency of a

53:17: color? Because I know that you can share

53:19: you can put like two characters at the

53:21: end of a hex code to change the

53:22: transparency of a color.

53:25: And so that might just be a

53:28: thing that you have to try and find out

53:30: whether or not it works. I have a

53:32: feeling that the whole background of the

53:34: whole thing would just be black and so

53:35: you would just you would just see black

53:38: and not like through the application.

53:40: >> Um and I definitely haven't seen a theme

53:42: that that did that. I have to admit if

53:44: if I wanted to try that I would just ask

53:46: Claude. I'm like is this possible?

53:48: [laughter]

53:49: >> Was it possible?

53:50: >> Oh. Oh no. I would ask Claude like if

53:52: >> Okay. Yeah. if I wanted to try it out.

53:54: >> Somebody tried it and report back.

53:56: >> Yeah, it's very good at finding

53:57: settings. [laughter]

53:58: >> And then Marcos had asked um so it

54:00: definitely does that color picker on

54:02: hover thing for a CSS file. Do you know

54:04: if it happens to work in other files?

54:05: Like does it work in a R file or a QMD

54:09: file?

54:09: >> R file. Let's see.

54:12: Um maybe it has to be within It might

54:15: work within quarter portto. Oh yeah, it

54:20: does. [laughter] Yeah, very very nice.

54:23: All right, Marcos, there's your there's

54:25: your answer. Um Oh, and I see um No,

54:28: Tobco also shared like, "Hey, you can

54:30: give your degrees of transparency at the

54:32: end." So, he shared one with a 50 at the

54:34: end for 50% transparency. Um we had a

54:39: bunch of great things shared as far as

54:41: resources. Marco shared a color picker

54:43: for Mac. If you are not on the Discord

54:45: and you're just hanging out on Zoom,

54:47: this is one of the reasons to be there

54:48: because everybody is so wonderful

54:50: sharing amazing um resources and ideas.

54:53: Okay, today was so much fun. We're at

54:55: the top of the hour, so we definitely

54:56: have to stop and say goodbye. Um thank

54:59: you so much for hanging out with us. I

55:01: hope that you will show up next week as

55:04: well. Thank you for hanging out

55:05: everybody. We will see you either on

55:08: Thursday or next Tuesday. Bye everybody.

55:12: Thank you.

55:16: >> [music]
