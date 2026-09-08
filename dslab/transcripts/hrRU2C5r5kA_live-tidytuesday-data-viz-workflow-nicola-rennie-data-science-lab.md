---
type: Video Transcript
title: "Live TidyTuesday Data Viz Workflow | Nicola Rennie | Data Science Lab"
description: "I am so excited to introduce our featured lab manager for today, Nicola Renie."
resource: "https://www.youtube.com/watch?v=hrRU2C5r5kA"
tags: ["ds-lab", "r-packages", "github", "shiny", "workflow"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T21:59:18Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=hrRU2C5r5kA"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2026-07-24T00:00:00Z"
    usage_count: 1088
usage_window: { from: "2026-07-24T00:00:00Z", to: "2026-09-08T21:59:18Z" }
---

# Transcript

00:08: I am so excited to introduce our

00:11: featured lab manager for today, Nicola

00:13: Renie. Nicola, would you like to say

00:14: hello and introduce yourself? I can. Um,

00:17: hello. I'm Nicola. Um, I do a lot of

00:19: database stuff. I've been using R about

00:22: 10 years. Um, and I'm very excited to be

00:25: doing some Tidy Tuesday visualizations

00:27: live today. Yes. I'm so excited. Okay.

00:31: Well, this is the place where we share

00:34: screens and do stuff. So, Nicola, I'm

00:36: going to say take it away. And while you

00:39: are sharing your screen, I will prime

00:41: everybody by saying Nicola is going to

00:44: show us her process of how she works

00:46: through um a Teddy Tuesday

00:47: visualization. But we only have an hour

00:49: here and really we only have like what

00:51: 50 minutes and we're going to be asking

00:52: questions. So quite obviously she can't

00:55: go through her entire process that she

00:56: is going to be sharing some of the ways

00:58: that she thinks some of the tools she's

01:00: developed over the years. She'll talk

01:01: about how long she's been doing this,

01:03: how long she she spends on stuff like

01:05: this. Um so get your question asking

01:09: typing fingers ready. All right, take it

01:11: away Nicola. Awesome. Thank you. Um so

01:15: yeah, if you don't know what Tidy

01:17: Tuesday is already, um it's a super

01:19: awesome uh sort of resource. Um, so

01:23: basically a new data set is released

01:25: every week, every Tuesday, although

01:27: sometimes it's a Sunday, sometimes it's

01:29: a Monday, you never know. Um, and the

01:32: idea is that you make something with it

01:34: and share it and share your code um,

01:36: with other people. I started doing Tidy

01:38: Tuesday. It was my like COVID lockdown

01:41: 2021 project. Other people took up like

01:44: baking or cycling or whatever. For some

01:46: reason, I got into uh, Tidy Tuesday. Um

01:49: so there's a GitHub repo and if you

01:52: scroll down in the GitHub repo um you

01:55: can see all the data sets uh from like

01:57: each week. Uh so this week the data set

02:00: is on Twin Cities. So if you go into

02:04: like the read me for a specific week you

02:05: get a little bit of information about

02:07: what the data is about. um like where

02:10: it's from. Um you get some

02:12: [clears throat] instructions for how to

02:13: load it into R, Python, Julia, um and

02:17: their CSV files if you really want

02:18: those. Um and there's some really nice

02:21: data dictionaries that explain what all

02:23: of the variable names mean. Um and those

02:25: are really really helpful. Um so this

02:28: week's data is all about um like twin

02:33: cities, so links between um different

02:36: cities around the world. So there's

02:37: actually two data sets this week. So,

02:39: one of them is all about like the actual

02:42: city. So, you've got like an ID, the

02:44: name of the city, coordinates of where

02:46: it is, what country it's in, and

02:48: continent.

02:49: Um, and then the second data set is the

02:51: actual links between them. So, it's just

02:53: sort of two columns and sort of start

02:57: and end point of the links. So, I'm

03:00: going to jump over to R and uh see if we

03:04: can start making some things. Awesome.

03:06: And I asked everybody if they can both

03:08: see your screen and hear you clearly.

03:10: And everybody so far has given me a

03:13: thumbs up. Um, everybody, if there is a

03:16: point in time when you need things to be

03:19: zoomed in a little bit more on Nicholas

03:21: Green, please let us know. Thank you for

03:23: the thumbs up. Zoom. All right. Great.

03:25: >> Nice. All right. Um, so I have all of my

03:29: Tidy Tuesday visualizations from like

03:31: the last five years all live in one

03:33: GitHub repo. um which is fairly nicely

03:37: structured. Um

03:41: one of the things that I started making

03:43: to try and like help save myself some

03:46: time was some template files because

03:48: when you're doing like visual whether

03:50: it's visualizations or analysis or like

03:52: whatever it is, you end up doing the

03:54: same thing or very similar things week

03:56: after week and I didn't want to just

03:58: keep typing out the same things every

03:59: week. So, I made myself a little R

04:01: package um which has some templates in

04:03: it. So, if I go to that R package and do

04:08: templates um you can see I've got a

04:10: couple here. Um so, I have this like use

04:12: tidy Tuesday template and what I just

04:16: need to put in here is the date. So,

04:18: it's today's date which is uh 2026

04:22: [snorts]

04:22: uh 5th and it's the 12th. So, if I run

04:25: that, that creates a whole bunch of

04:27: files for me. um it creates like an R

04:29: script um and a readme file. So if I

04:32: open these up um you can see it's in

04:35: here. So creates this folder here and it

04:38: makes makes a readme file which I will

04:42: open as well.

04:45: Okay. So it just has like a like some

04:47: space for a title and loads in the the

04:50: chart that we will make hopefully um in

04:53: this [clears throat] hour. And then this

04:55: is the R script that it generates. Um,

04:58: so I'll talk you through this a little

05:00: bit first. Um, but we'll kind of go into

05:02: more depth as we go through. So we load

05:06: all the packages um to start off with.

05:08: Um, basically the entire tidyiverse. Um,

05:11: I also use the show text package for

05:14: text. Um, I love the Show tax package

05:17: because you can load like Google fonts,

05:20: which means you never have to worry

05:21: about trying to install fonts on your

05:23: own laptop or try to give other people

05:25: instructions for loading fonts on their

05:26: laptop. Um, also got a couple of

05:29: packages uh for

05:32: doing some fancy text, so like some bold

05:34: highlighting or like color text. We got

05:37: glue um for sticking together

05:41: uh variables and text. Um, and we've got

05:43: the GG View package, uh, which is super

05:46: useful, um, for previewing your plots at

05:49: the same size and resolution that you

05:51: want to save them at. So, if you've ever

05:53: done that thing where you're like

05:54: spending ages tinkering with your plot

05:56: and like making it look really pretty

05:58: and perfect and then you use GG Save um,

06:01: and it just like it's a complete mess

06:03: and it looks nothing like the preview

06:05: you had in R Studio. Um, GG is really

06:08: good for that and I'll show you how it

06:09: works.

06:11: Um so the other sections

06:13: in this uh template are basically like

06:17: to load in the data. Um and the

06:19: templates files are puts in the correct

06:21: date and stuff. Um this is loading some

06:25: fonts from the show text package. Um

06:29: I've got some defaults in there so that

06:30: if I'm like having a busy day and I

06:32: don't have time to pick out fancy fonts,

06:34: I've got something that I know looks all

06:36: right. I've got some default colors.

06:38: Again, if I'm busy, then I'll use those.

06:42: I got some sort of like setup because

06:44: every time I'm making a chart, it's like

06:47: almost always got title, subtitle,

06:49: caption, and all of that. So, just like

06:51: prep those variables ahead of time. Um,

06:54: and then I've got kind of like a theme

06:56: uh that's set up. Um, and it's all kind

06:59: of written out rather than being like in

07:02: a I guess personalized theme function so

07:04: that it's easier to edit one bit of it

07:06: for a particular chart. Um, and then

07:09: I've got some code at the bottom to save

07:10: it in the correct place. Um, so I never

07:14: need to worry about figuring out where

07:16: I'm supposed to be saving stuff.

07:19: >> Hey Nicola.

07:20: >> Yes,

07:20: >> I have a question because we are on

07:23: fonts right now on the screen.

07:24: [laughter]

07:25: Rory has a question that uh resonates

07:27: with me too, which is, "Do show text and

07:30: system fonts do different things?" He

07:33: says, "Because fonts and gigglot scare

07:35: me." And honestly, same. I stay away

07:37: from anything that's not standard

07:38: because I'm scared. [laughter] I'm like,

07:39: "This isn't going to work." Um, so they

07:43: they can do the same thing, but they can

07:45: also do different things. So, system

07:47: fonts is really good for finding fonts

07:50: that you have installed on your

07:52: computer. Um,

07:53: >> yes.

07:55: that like that works great if you are

07:57: just making it yourself. But if you're

07:58: collaborating with other people and like

08:00: one of you is on like Windows and one of

08:02: you is on Linux and you're trying to use

08:04: some like Microsoft font um that's yeah

08:07: then you have to give instructions for

08:08: how do you in install fonts whereas this

08:11: sort of like font add Google um I mean

08:13: as long as you have an internet

08:14: connection it just sort of downloads it

08:16: from Google so you don't have to worry

08:19: about whether you have that font whether

08:20: your collaborator has that font it just

08:23: kind of loads it in for you can load

08:26: like local fonts with show text as well

08:29: if you do have something I don't know

08:31: special or different that you want to

08:32: use. Um

08:33: >> it's kind of incentivizing to stick with

08:35: Google fonts though because then you

08:37: kind of can't get it wrong, right?

08:38: >> Yeah. The only time I've like it's not

08:40: worked is when I've like been on a train

08:42: and there's been like no Wi-Fi and your

08:44: script [laughter] doesn't run because

08:45: you can't connect to the internet. Um

08:47: but that's a very niche problem I think.

08:50: >> Yes.

08:51: >> Awesome. Thank you.

08:53: >> Nice. Um, but yeah, fonts in R are are

08:56: super like tricky and and weird. Um, so

09:00: the only thing I'm going to grab from

09:03: the R for data science tidy repo is this

09:06: little bit of code here um to kind of

09:08: load in the specific data sets. So if I

09:11: just run all of this,

09:16: it's kind of like when you run tidy to

09:18: the RT load, it's like downloading those

09:21: CSV files from GitHub. And then now I

09:24: have two data sets. Uh one called

09:26: cities, right? So it's got that like

09:29: unique ID, the name of the city,

09:31: coordinates, country and country code,

09:34: and continent. and links um looks a

09:37: little bit confusing, but it's just the

09:39: ID for different countries and source

09:41: and target just says there's a link

09:43: between those two countries. So, I'm

09:46: also just going to run this in the

09:49: background and then kind of start to

09:51: think about what on earth I'm going to

09:54: plot with this data. Um, and this is a

09:58: really nice data set. like it's not

10:00: super big like in terms of number of

10:03: rows or columns but there's so many

10:04: things I kind of want to look at with

10:07: this data. Um so one of the things I

10:11: would quite like to look at is whether

10:13: you can connect every country in the

10:15: world through like one giant loop um of

10:19: like these twin uh cities. Um

10:23: other things you could look at is like

10:25: which country is the most connected. So

10:27: you could do some sort of like global

10:28: map in color based on how connected they

10:31: are. What I kind of want to look at is

10:35: how

10:37: like connected

10:39: the world is to each other in terms of

10:40: how close things are. So like is a city

10:43: in Europe more likely to be connected to

10:45: other cities in Europe?

10:48: So what I'm going my my brain is sort of

10:50: thinking in terms of chart type is

10:52: something maybe like a Sanki diagram or

10:55: a chord diagram.

10:57: Um

10:59: but then you kind of have to choose what

11:00: level you do it at. If you do that at

11:02: the country level it's just I think it's

11:04: just going to look like a big pile of

11:06: spaghetti cuz there's too many countries

11:08: and there's just going to be lots and

11:09: lots of lines. Um at the same time I

11:13: think if you do it at a continent level

11:14: there's like that might work. Okay.

11:16: There's like I think there's six in the

11:17: data set. Um so that will probably work.

11:20: Okay.

11:22: Um

11:24: I think what I'm going to do though is

11:27: pick one city and then sort of look at

11:30: how connected that is. Okay. So I'm

11:33: going to have a little look first of all

11:34: at what like list of cities we have. Um

11:40: so actually if I just look at the data

11:45: set. So you can use the view function in

11:47: R um and then just kind of like sort

11:50: them and have a little look. Um I think

11:53: like when I'm doing Tidy 2D quite a lot,

11:55: I quite often pick like cities or

11:58: countries that I know like I or some way

12:03: connected to me personally cuz then you

12:04: find out like interesting things about

12:06: like where you live or um that kind of

12:09: thing. So I want to see if I start with

12:12: cities and then filter

12:16: the country code

12:19: to be um GB. So we'll have a look at

12:22: what's in the UK and then

12:26: I quite often pipe that into view at the

12:28: end so you get this nice kind of human

12:30: readable look. Um and then I can browse

12:33: through all the cities in the UK um that

12:35: we might focus on. Um, I'm going to go

12:38: Edinburgh cuz that's where I live. Um,

12:42: so purely self-s serving.

12:45: So

12:51: that's given me one row of the data and

12:53: the thing that I'm really interested in

12:54: then is going to be this ID column. So

12:58: I'm just going to grab that.

13:03: Um,

13:04: I think what I'm also thinking at the

13:05: moment is this is something that I would

13:07: quite like to parameterize.

13:10: Um, so the idea is that you can type in

13:12: whatever city you want and at the end

13:14: you will get the plot for your chosen

13:16: city. So I'm

13:17: >> I like that thinking ahead.

13:19: >> Yes, I'm I'm trying to think ahead.

13:22: >> [laughter]

13:22: >> Um, it's it's one of these things with

13:25: like a really big data set that when you

13:27: pick like one tiny little aspect of it,

13:30: the chances of someone else picking that

13:32: really same specific aspect is probably

13:36: quite small.

13:37: So, we have at least one other person

13:39: who sees their hometown. Sherikawa

13:43: Satoshi says, "I see my hometown." I had

13:46: Did anybody else see theirs? I did not

13:47: see mine yet. [laughter]

13:50: >> All right. Okay, so I've got my ID. Um,

13:53: so what I need to do now is go into this

13:55: links data set and pick out like all of

13:58: the links that relate to this city ID.

14:01: Um, this one's a little bit weird

14:03: because the the order of the source and

14:05: the target doesn't matter at all. So I

14:08: need to filter it when either the source

14:13: is equal to the city ID or when the

14:17: target is equal to

14:20: uh the city ID.

14:23: Uh that didn't work. That's because I

14:27: said or not and there you go. All right.

14:29: So I got 11 links and you can see that

14:31: like some of them are in the first

14:34: column and some of them are in the

14:35: second column. And that's um it's like a

14:39: little bit annoying. So I'm actually

14:40: going to grab them. Um so I want to get

14:44: the ID.

14:47: Let's do if else.

14:50: So if the source

14:52: ID is equal to my city ID, then what I

14:57: actually want is the other one. And then

15:00: vice versa. Okay. So now, yeah, now this

15:04: column is all of the like IDs of the

15:07: other cities that it's linked with,

15:12: and that's the only thing I actually

15:13: want. I use select all the time to like

15:17: tidy up because I I I really hate having

15:20: extra columns um that I'm not interested

15:23: in kind of hanging around in my data. Um

15:26: purely personal choice. Um but now I can

15:30: join this with

15:33: uh the city's data

15:37: by the ID, right? And that's my sort of

15:41: like I guess tidy final data set. Um so

15:45: I have 11 cities that are all linked to

15:48: my chosen city of Edinburgh and I've got

15:51: like all the information on them.

15:55: So, I always save this as like plot

15:58: data. It's not the most imaginative

16:01: name. Um, but it I do it every time. Um,

16:06: I'm going to skip over the text bit just

16:08: now because quite often it's kind of

16:09: like I actually write it at the end once

16:12: you figure out what your plot is of and

16:14: what you want to say.

16:16: Um, so now I need to think a little bit

16:18: about how I want to visualize this. Um,

16:22: I'm kind of

16:23: >> We have some votes for 3D bar chards,

16:25: jokingly in in the Discord.

16:28: >> No, no, no, no. [laughter]

16:29: >> Listen,

16:32: >> um, I think what I really want to do

16:34: here is like a um a sunburst diagram.

16:38: Um, so like in the middle you're going

16:40: to have that chosen city and then you

16:42: will have all of the cities it's

16:43: connected to, then all of the countries

16:45: they're in, and then all of the

16:46: continents they're in. And I'm kind of

16:48: thinking if you color If you color by

16:51: continent, then you can see like quite

16:54: clearly

16:55: like which continent's going to dominate

16:57: and whether that's the same as the

16:59: continent that your chosen city is in.

17:03: Um so sunburst diagrams are like um

17:10: kind of like I guess like a circular

17:13: tree map and or kind of like stacked

17:16: doughut charts.

17:18: Um, so there are different ways to make

17:20: this. Um, so one of the things I quite

17:22: often do at this point is if if I'm

17:25: thinking about a chart that I know I've

17:28: made before, I quite often like go and

17:31: look at the code for that chart and just

17:33: like copy and paste in and then edit it

17:36: rather than trying to write it from

17:37: scratch every time.

17:40: Um, so I have a little shiny app that

17:42: grabs all of my Tidy Tuesday plots from

17:44: that repository and you can kind of

17:47: search by package. Um, you can also

17:50: search by name, which I appreciate is

17:52: not the most useful. Um, but I remember

17:55: doing a sunburst chart on Australian

17:57: frogs um, for a previous Tidy Tuesday.

18:00: So,

18:00: >> good memory.

18:02: >> Um, so this is um, this is what sunburst

18:06: chart is. Um, and I have links to the

18:09: code. So, when I click on this, it just

18:10: opens and then I get the code. Um,

18:12: >> oh my gosh, the benefits of good

18:14: documentation for your own stuff.

18:17: >> You have to learn the hard way, I think.

18:19: Um, I still curse 2021 me for their

18:22: terrible file naming system. Um, but

18:26: yeah, so this I can see like how did I

18:28: make it the last time? Um, and

18:32: the last time I made it in a really

18:33: weird way. Um

18:37: uh okay, I know why I did this.

18:40: Sometimes it takes a while for me to

18:41: remember why I did certain things. Um so

18:44: normally if I was making a sunburst

18:46: diagram, I would probably use the GG

18:48: Force package which has like geome arc

18:51: bar.

18:52: >> Yeah.

18:53: >> Um but I wanted to make it interactive

18:56: so it had these little tool tips and

18:58: that doesn't work with the giraffe

19:00: package. So, I think I remade instead of

19:03: arcs, I made them all as polygons. I'm

19:06: sorry. I think you mean the GGIF

19:08: package.

19:08: >> Yes. [laughter]

19:10: >> I never know. I never know. It's totally

19:13: giraffe. It says it in documentation,

19:17: but I will never not call it GGF. Yeah,

19:20: I called it GGF for like years and then

19:24: Cara Thompson showed me the hex sticker

19:25: and it was a picture of giraffe and we

19:27: were both kind of like, "Oh, that makes

19:29: sense. [laughter]

19:31: It is 100% giraffe.

19:34: Okay, we can move on. Um, so this one

19:38: was a little while ago and I think it

19:40: was before

19:42: um a newer version of ggplot 2 came out.

19:45: So

19:46: I think previously if you wanted to make

19:48: like pie charts or donut charts um in

19:52: ggplot 2, you could make like a a bar

19:54: chart and then use a chord polar which

19:58: kind of like

20:00: pushes it into a circle. Um, the problem

20:03: with that is that like putting

20:04: annotations and stuff on it is a

20:06: nightmare because their coordinate

20:07: system is just goes crazy and you don't

20:09: know where any points actually are.

20:12: But um, the newer versions of GG plots,

20:16: you have like coordial, which I think is

20:20: basically just fixes

20:22: um

20:24: that issue. So, I'm going to I'm going

20:26: to attempt that. So

20:30: what what do I want? First of all, I

20:31: need to figure out um

20:34: for every given so I'm going to have

20:37: three layers on my radial chart uh my

20:41: sunburst chart I'm going to have um like

20:44: cities, countries, and then continents.

20:46: So I need to take my plot data and then

20:51: group it by

20:54: um one of regions. So let's just start

20:56: with city

20:59: which is actually in the data city is

21:02: down as name but I know I'm going to

21:05: keep typing city if I mean city so I'm

21:09: going to rename that uh so group by city

21:13: >> rename it

21:14: >> yes otherwise

21:16: >> about renaming something

21:16: >> I'll spend more time fixing my own typos

21:18: than I will just fixing it um so I want

21:22: to count up the number of each city

21:25: which okay this should just be one.

21:30: So I then did that and then I need to

21:34: keep

21:36: the city the number and because I want

21:38: the color by continent I need to keep

21:40: that in the data.

21:44: Okay. So this is what I need. Now I want

21:48: to do the same code for um country and

21:51: continent. So I'm going to stick this as

21:54: a function

21:56: to save me wrangling lots of little data

22:00: sets. So it's going to be a function of

22:02: like region.

22:07: Okay. Um grab that in there.

22:12: We might have crashed your shiny app.

22:14: [laughter]

22:15: They give it the hug of death, Nicola.

22:17: Um, so the shiny app it will take a

22:19: while to load. Um, because it's actually

22:21: it's deployed with web R. So you're not

22:23: crashing my shiny app. You're crashing

22:25: your own browser.

22:26: >> Good. Okay, that's that's good news

22:28: actually. So it's it's hosted in your

22:30: own browser. Give it a second and let it

22:32: load.

22:33: >> It does take a little while just cuz

22:34: it's like web and it's kind of loading

22:37: bunch of packages in the background.

22:38: >> Yeah.

22:40: Uh, okay. Um,

22:43: so, um, um, yeah, I've got this little

22:47: function here which takes like a a

22:50: region level. So, that will take city,

22:53: country, or continent as an input and it

22:55: will return me a data set that looks a

22:57: little bit like this. Um, you may or may

22:59: not have seen this like weird curly

23:01: bracket notation before. Um,

23:04: it's like a a weird sort of tidy eval

23:08: thing that let you put variable names in

23:11: without quotation marks essentially.

23:13: >> Yeah, I call it a double hug. [laughter]

23:15: >> Yes.

23:17: So, if I do something like region data

23:19: of country, I get that right. So, I

23:22: still have the country, the number, and

23:23: if I do continent, I think okay, it's

23:27: going to give me some duplicates. So

23:30: let's

23:32: stick distinct in there. I don't want to

23:34: count them all twice. Okay. So that's a

23:38: nice quick way of getting my data sets.

23:42: So start actually making a chart. So

23:46: >> I love that you they have just chord

23:48: radial floating down there just waiting.

23:50: >> I'm like I will need that in a moment.

23:51: Don't delete it. You'll have to type it

23:53: again.

23:54: >> Okay. So I want to do geome call. So my

23:57: data is going to be this

24:01: region data. I'm going to start with

24:04: city

24:07: and then mapping is going to be a little

24:09: bit weird.

24:11: So

24:14: I think I X variables I want to be N

24:19: and Y I want to be like one

24:24: and then fill is equal to continent

24:30: I think. Is that going to do what I

24:32: want? Okay, that sort of looks correct.

24:37: And then if I add chord radial. Okay.

24:41: Um, it's got a weird gap here which I

24:44: don't want. Um, I always use like expand

24:47: equals false in like most of my charts

24:50: because I don't I don't like the weird

24:52: extra space. So, this Okay, this is kind

24:55: of made a pie chart. That's fine.

24:56: >> Oh, we got we madeart [laughter]

25:00: accidentally made some pie charts. Okay,

25:02: but this this should go away. Um, so if

25:06: I switch Y to two, that should stack

25:09: another one on top of it. And I should

25:12: have region data is equal to country.

25:14: Okay, this is looking better.

25:17: And then if I do one more,

25:20: this is going to be like continent and

25:24: it's move that up to three.

25:28: Okay, I think that uh actually move it

25:32: to three. Okay, that starting to look

25:35: better. I like that. Now we're getting

25:37: closer to like a dart board. Oh, but you

25:40: know what? I saw we had a question that

25:42: might benefit us to do while before we

25:44: get too far away from your dlier query.

25:47: >> Um, and it was from Nathan saying,

25:50: >> can you say why you used mutate rather

25:52: than summarize?

25:54: >> Um, yes. Um, because I want to keep

25:57: continent in there. So, if I normally

26:00: only wanted to um like when you

26:03: summarize it will get rid of everything

26:05: that you haven't kind of grouped by, but

26:07: I'm using mutate because I want to I

26:09: want to color by continent, so it needs

26:10: to stick around. Um so that's the only

26:13: reason I'm kind of using mutate there.

26:16: Excellent. Thank you. All right. Okay.

26:19: So, I want to get rid of this

26:23: pie chart thing in the middle. Um so

26:26: what I want to do here is if I filter

26:29: the city's data to get the city

26:33: set chosen city.

26:36: So and then the x value is just going to

26:40: be all of them. So it's within number of

26:42: rules right?

26:45: Yes I yes I did mean equals equals

26:47: >> I think so. [laughter]

26:49: >> There we go. The most commonly made

26:51: mistake for me in our Absolutely.

26:54: >> Did you double

26:56: >> Did you mean Yeah. Yes, I did. Thank

26:58: you. [laughter]

27:00: >> All right. That sort of looks what I

27:03: like is as a rough idea. One thing

27:05: that's a little bit weird is that you

27:06: can't see um like the different cities

27:10: cuz there's no outlines. So, I'm going

27:13: to if I say color is equal to my text

27:17: color. Does this help?

27:20: Yeah. So that and I'm just going to copy

27:22: and paste that in here.

27:27: So now it's a little bit easier to see

27:28: that like you have your one city that

27:30: you've picked in the middle. There's

27:31: like three, four, seven cities um in

27:36: seven countries that are all in Europe,

27:39: which means we now get to do the fun

27:41: part, which is like making it look

27:42: pretty.

27:43: >> Yeah. I think it's it's great to see

27:45: that you still have all of the like

27:47: random bits that are around, right? Like

27:49: you haven't like theme voided anything.

27:51: You're just like leave them there. It's

27:52: fine. We're going to we're going to get

27:53: there.

27:54: >> Yeah. I quite often leave like theme

27:56: void is great for making kind of charts

27:59: like this in maps, but quite often I

28:00: leave it till the very end because it

28:02: can really help with

28:03: >> like positioning annotations and things

28:05: if you can be like I want to go there

28:07: and you can see what those coordinates

28:09: are. And if you are working with a grid,

28:11: I made the mistake one time in a very

28:14: big project of just sort of theme

28:16: voiding from the beginning and not

28:18: showing my um my indexes basically on

28:22: the side and I couldn't figure out why

28:23: my plot was upside down and I just

28:25: because I didn't have the visual cue of

28:27: going, "Oh, because my numbers are

28:29: backwards." Yeah.

28:30: >> Yeah.

28:31: >> All right.

28:31: >> Don't do that to yourself.

28:33: >> Yeah. That's Don't do that. Keep

28:34: anything that might be helpful until the

28:36: end. Um, so this, um, I guess this all

28:40: sometimes feels a little bit like

28:42: cheating, um, when you [clears throat]

28:43: use a template. So you can just stick a

28:44: plus on the end and then fire in all of

28:47: the, um, sorry template like theme stuff

28:51: that I had. Um, so I tend to just run it

28:53: and see what it looks like.

28:57: One thing that you might notice, um,

29:00: one, I guess the text is like slightly

29:02: different size and also it's opened in

29:04: this viewer tab and that's because it

29:06: has this plus canvas thing on the end.

29:10: Um, and that's from gg view. So here you

29:12: can say I want it to be like 7x5.

29:15: DPI is 300 which matches with gg save.

29:19: Um, and set the background color of like

29:22: the whole area. Um, which means that

29:25: when like if you use gg save to save

29:27: this, that is what it will look like. It

29:29: shows you exactly um as it will be and

29:33: it's like a quite nice way to play

29:34: around with uh some different sizes. So

29:37: I think actually for this chart I

29:39: probably want it to be portrait. Um if I

29:42: put some text above it and get rid of

29:44: that legend

29:46: uh I'm going to do that just now.

29:50: Uh legend.position equals none.

29:55: Okay. Yeah. All right. Um I am going to

29:59: switch this to theme void um to get rid

30:02: of all of the stuff I don't want. And

30:05: I'm going to add an annotation

30:09: um to put like the name of the uh chosen

30:12: city right in the middle

30:15: >> middle of our dart word. Yeah. Okay. So,

30:20: >> or wait, chosen city, we parameterized.

30:23: >> Yes, we did.

30:24: >> We I'm using we generously here.

30:27: [laughter]

30:28: >> Um, so it's going to be label equals

30:33: chosen city and this is going to be text

30:38: and add that on at the end.

30:42: All right. Okay. So, it's not super in

30:44: the middle, but it's that's all right.

30:46: Okay. Um, what else do I want to do? So,

30:52: one thing I want to do is I want to get

30:53: rid of the little white gaps between

30:55: them. Um, little bit annoying. So, in DG

30:59: part two, the width of columns is.9,

31:03: not one.

31:05: Um, so let's get rid of that.

31:10: And then I'm going to do colors. Okay.

31:12: Um,

31:14: I don't like the GD plot two default

31:16: colors. Um but

31:18: >> oh sorry Hadley. [laughter]

31:20: >> Yeah. Um I'm going to let's choose

31:24: something else. I quite often use um our

31:28: cart color um because they have this

31:31: kind of like nice combination of like

31:34: being accessible and being quite good

31:36: colors but also looking quite nice. Um,

31:39: so I use them quite a lot and

31:43: I'm going to define a color palette

31:48: from there. Though the other thing I

31:49: want to do is like map continents to

31:52: colors kind of ahead of time because you

31:55: can see there's only four in this chart,

31:56: but there's actually six values. So if

31:58: you were to choose a different city,

32:00: then the colors might switch order,

32:03: which is not great. So

32:05: >> they would kind of recycle, right?

32:07: >> Yeah. or like you would like it I think

32:10: they they go alphabetically so

32:12: >> oh

32:13: >> if you like they they might just shift

32:15: around um which is [clears throat] a

32:17: little bit weird. So

32:21: I need one color for every unique

32:24: [snorts] value in

32:27: the continent.

32:30: Okay.

32:33: So continents this color palette is

32:37: going to be our cart color

32:41: cart palette n is going to be the length

32:45: of continents

32:51: and okay if I

32:54: just go here you have to give the names

32:58: of the palette you want is going to be

33:00: from here

33:02: Um, so you can look for just the color

33:04: blind friendly ones and for discrete

33:06: palette it's going to be safe palette.

33:11: Okay. And then I can just do like names

33:15: of my color palette is equal to those

33:19: continents. So it will use the same

33:22: combination of color and continent

33:25: regardless of which order they appear

33:26: in.

33:29: So if I do in here like scale fill

33:35: manual values equals my color palette.

33:44: All right, I get that. Okay,

33:49: what I quite often do with

33:51: >> [snorts]

33:51: >> um

33:52: kind of like instead of legends is I use

33:55: um like color text in the legend. So

33:57: you'd have like a nice sentence um that

34:00: writes out the different continent names

34:02: that are in the color um that applies in

34:05: the chart. So

34:08: to do that you can use I think you can

34:10: use um marquee but I've been kind of

34:12: using uh gg text for so long that that

34:16: is kind of my default. So the way you do

34:18: that is with um like writing spans. So

34:22: you'd put like the name inside the spans

34:25: and then style it

34:28: because I want to map over

34:32: everything.

34:35: I'm going to use per. So I have this

34:37: like list of continents and this kind of

34:39: like list of color palettes.

34:45: And basically for every element in the

34:47: color palette, I want to create like

34:49: some HTML text

34:52: with the name of the color and the name

34:55: of the continent.

34:58: So

35:00: I can use glue to do that. And I take my

35:06: spans from here. So inside the span you

35:12: have style is equal to

35:16: so color is going to be

35:20: the color palette

35:24: dox. So that's going to put in like when

35:28: you map over it the first time that will

35:29: give you the first element in the color

35:31: palette. And then in here, I want to get

35:35: the name

35:36: of the color palette and get that first

35:40: one. Again,

35:46: this is something that I would have to

35:49: templatize for myself. Like I would have

35:51: to like

35:52: >> put it somewhere so I could remember how

35:54: to do it. I have a lot of little

35:56: snippets of like spans. [laughter]

35:58: >> Oh yeah.

35:58: >> Um for for my own sanity.

36:02: So this gives you like this factor. So

36:05: you have this span and you're like okay

36:08: Asia but in this color. Um so what I

36:11: want to do is take that and like

36:12: construct a sentence with it. Um I mean

36:15: you can write out the sentence and pull

36:17: those values in but you can also use uh

36:20: like string flatten uh from string r. So

36:24: you can say like between each element

36:26: put a comma. So the sentence is going to

36:28: read like Asia, North America comma and

36:31: so on and then but you can change the

36:33: last one um which is like a really nice

36:36: feature for writing sentences. So that

36:40: creates this it looks horrendous which

36:42: is why you use things like purse so you

36:44: don't have to type all this out

36:45: yourself. Um but you get like Oceanana

36:48: and South America. Um, and then

36:55: if I

36:58: stick a

37:03: little off on the end. Uh, it's not

37:06: going to like that. Okay.

37:09: Um, so this is my subtitle text.

37:13: So that's going to be my subtitle

37:15: colors. And then subtitle can be

37:21: like um

37:23: like twin cities in

37:29: my long list and then full stop.

37:34: So my subtitle.

37:38: Yeah, that looks all right. And then I

37:41: can stick that in to subtitle with labs.

37:47: So, subtitle equals ST

37:52: and

37:54: okay, you can't see all of them. They're

37:56: a little bit pale, so I will probably

37:58: want to fix that. Um, but you get this

38:01: kind of like nice kind of I guess

38:03: automated color text in here.

38:05: >> Yeah, it says the right thing at least

38:07: in the right colors.

38:08: >> It does. Yeah. Um, and the reason that

38:10: works is because in inside the theme I

38:14: have plot.subtitle subtitle equals

38:16: element textbox simple um which is from

38:19: gg text and it basically says apply any

38:23: HTML formatting or markdown formatting

38:26: to the text if you just have like

38:29: element text um you'll just like get the

38:34: sort of garbled um HTML.

38:38: What I think might help is if I put

38:41: those

38:42: names in bold text just for some of

38:44: those lighter colors.

38:48: So you can use like it's something that

38:50: I I think is a little bit weird to

38:52: combine markdown formatting with HTML in

38:55: the one line. Um but it works so I will.

38:58: Um so you can stick uh the the names in

39:02: bold text in in markdown and it just

39:04: makes it a little bit easier to read.

39:07: Um, and then you can go ahead and sort

39:09: of start start adding things, uh, like

39:11: titles and captions, um, and whatnot.

39:15: Um, the other thing I want to do is move

39:17: this down a little bit.

39:20: So, in annotate, um, you have like Hjust

39:23: and VJ just to move up and down. Um, I

39:28: can never remember which way around they

39:30: are.

39:33: >> Type it and figure it out. Actually, I

39:36: love teaching HJ just and VJS, but

39:38: whenever I'm in some sort of like other

39:40: coordinate system, who knows?

39:42: >> Yeah. Um,

39:45: so V just moved it down a little bit. So

39:47: if I go a little bit further,

39:50: sorry. Um, it is supposed to be between

39:52: like um 0 and one, but putting values

39:55: outside of that does work. Um, so

39:57: putting to two does shift it down a bit.

40:00: Um, and I think that's that is the

40:02: benefit of chord radial is that like

40:05: moving stuff up and down actually moves

40:07: it up and down. If you use chord polar,

40:10: moving it up and down like sends it like

40:12: left and right and diagonal.

40:14: >> Yeah. [laughter]

40:14: >> Um, which is really confusing. Um, so we

40:19: kind of got this chart here. Um, I think

40:22: what I uh what I would what I kind of

40:26: want to do with this is because it's

40:27: it's not super

40:30: kind of explanatory

40:33: would be make it um interactive.

40:38: Um so the nice thing so if we put like

40:41: the let's say we put the city

40:45: interactive

40:48: so switch gall to g call interactive

40:52: and let's say the tool tip is just the

40:56: city

40:59: initially it's not going to do anything

41:01: because with

41:03: the giraffe package slashf functions you

41:07: have to put it in

41:10: uh here.

41:13: And does this work?

41:22: That's not weird. Okay,

41:28: that's not working for some reason.

41:31: Okay, let's ignore that for a second.

41:35: Um,

41:37: what else do I want to do with this?

41:38: Okay, so the other thing I wanted to

41:40: check was like, does this actually work

41:43: in terms of being parameterized? So, if

41:47: I switch it to like a different city and

41:49: just rerun all of my code,

41:57: does this work? And like it does. like

41:59: you can see that

42:01: it's

42:03: the colors are still like the right way

42:05: around. They're still in the same kind

42:06: of order. Nothing's changing, but you're

42:08: getting this updated chart. Um, which is

42:11: quite nice. So, yeah, I think like we

42:14: are starting to run out of time a little

42:16: bit. So, I will

42:17: >> Yeah, but look how far you've come in I

42:19: know less than an hour. This is amazing.

42:22: >> Um, the last couple of things I'll show

42:24: you is like um I guess like using like

42:27: title

42:29: Um, so title I might just do something

42:32: like twin

42:34: cities like around the world. Um, and

42:40: again I've kind of like prepopulated

42:42: that plot.title thing. Um, so it

42:45: actually uses a different font and like

42:47: makes it bigger. Um, one of the nice

42:50: things about this is like relative

42:53: sizing. Um, so the idea with using size

42:56: equals RA is that

42:59: it's saying that the title is 1.5 times

43:03: the base size, which means that if you

43:05: want to resize your chart, you don't

43:06: have to go through and like change the

43:09: font size of every single element. Um,

43:11: so I think this is like quite small. Um,

43:14: and my base size on my uh theme is 12.

43:18: So if I made it a little bit bigger,

43:21: like everything kind of scales up, which

43:23: is quite nice. Um, so I did that. And

43:27: the other thing I do have is

43:31: um some

43:34: functions. Um, so these

43:37: both I have two functions here. One is

43:40: like social caption and one is source

43:41: caption, which I appreciate are badly

43:44: named cuz they do quite different

43:45: things. Um, so these are both currently

43:48: in a personal R package, but what these

43:51: do is basically

43:53: um

43:54: sort of define the text I usually use in

43:57: the source. Um, so if I run this, what

44:01: it does is similar to that kind of um

44:05: trick we did with the color text is it

44:07: creates all of this um like horrendous

44:11: looking HTML codes um to stick some

44:13: icons and like attribution in it. And

44:19: then this um is where I would put like

44:23: combine the attribution for the source

44:26: of data with the attribution for the

44:28: chart. And the source of the data is

44:33: um is from wiki data I think.

44:39: Yes. Okay. Um so let's put that in

44:43: there.

44:47: And then if I do

44:50: in here

44:52: uh caption equals cap,

44:57: it adds like this at the bottom

45:00: [clears throat] automatically for me. Um

45:02: so I don't have to kind of think about

45:04: that every week. I sort of figured that

45:07: that problem out once um and then never

45:10: do it again. Um

45:11: >> you're so smart only solving your own

45:13: problems once. Yeah, I try to solve them

45:17: every week. [laughter]

45:19: Um yeah. Um I probably do make this a

45:23: little bit less tall because I've got

45:25: one of the things is when you're using

45:27: um like cord radial is it sort of like

45:31: does this fixed aspect ratio of the plot

45:33: area to make it square. So you end up

45:34: with this like

45:35: >> weird white space.

45:37: >> Um but you can kind of play around with

45:40: that. actually like 6.5 is probably

45:44: nice.

45:46: Yeah. And that looks kind of okay. And

45:48: you can like adjust the margins um a

45:52: little bit. Yeah.

45:53: >> I was just thinking I usually use chord

45:55: fixed cord underscore fixed. But I think

45:57: that that's only for cartisian.

46:00: >> Yeah. So you can you can do the same

46:03: sort of thing if you're making something

46:05: that's square.

46:07: >> Yeah. Um then yeah, core fixed is is

46:10: really useful. It's really nice for like

46:11: heat maps when you're trying to make

46:13: >> helpful with this situation. But we did

46:16: have a canvas question if we want to. I

46:18: know we only have like 9 minutes left,

46:20: but let's pop it in here. Dan Daniel

46:23: Chen asked um so you can save a plot

46:26: with the canvas call and it doesn't mess

46:28: up the ggplot object.

46:31: >> Yes, you can. Um that's a very good

46:34: question. Um, so one I guess there's two

46:38: ways of thinking about this is one you

46:40: can you can either like get rid of your

46:43: kind of canvas call and like it looks

46:47: horrible but then you can [laughter] do

46:50: gg save as normal and it will look nice.

46:52: Um the quicker way of doing it is

46:55: actually the um the gg view package

46:58: package has has two functions. One is

47:01: canvas, the other one is save ggplot. Um

47:04: >> yeah, save underscore ggplot.

47:06: >> So I this is what actually converted me

47:10: to being like a forwards assignment um

47:12: operator. Um I appreciate that. Um so I

47:17: usually have this commented out at the

47:18: end of my templates. Um, but this sort

47:20: of says like assign that to the object P

47:24: and then you can use save ggplot at the

47:29: object P and that will save it um in the

47:32: right place. Um, and it's quite easy to

47:34: just comment that little bit out if you

47:37: decide to make some other tweaks to it.

47:39: Um, but I can show you what that looks

47:41: like. Oh my gosh, look at all of the

47:43: nice little like social icons down

47:46: there. This is adorable. So I did there

47:49: is a blog post I wrote on like how to

47:51: make your own and I think someone um

47:54: converted that into an R package and I

47:58: uh I cannot remember the name of it but

48:00: it's something like GG

48:02: cap like GG annotate or like caption I

48:05: will look it up and I will find it. Um

48:08: but

48:09: >> okay we'll put it in the discord. Yeah

48:10: once we find it

48:11: >> like when you run um say ggplot like

48:16: that's that's what you get. Um, so it

48:18: looks, you know, identical to this

48:21: version here. This, which is why

48:24: >> you know what you're getting. Yeah.

48:25: >> You know what you're getting. You don't

48:27: spend ages like styling it and making it

48:30: pretty and then have to like do it all

48:33: again when you decide what size your

48:35: chart is. Um, so that's kind of like a

48:37: really nice thing with that. Yeah. So I

48:40: think like

48:42: that's we we done like what like 15

48:44: minutes and that's kind of where we are.

48:46: I think amazing. Look how far the like

48:49: helpful tools and you know I hit this

48:51: problem once, I'm gonna solve it once

48:52: and have it solved for me in in the

48:54: future. Look how far that can get you.

48:57: That's amazing.

48:58: >> Yeah. So like it really saves time doing

49:00: those like repetitive tasks that you do

49:03: over and over. Like you just save so

49:05: much time if you don't have to kind of

49:07: keep doing them. Um

49:09: >> well, we have continually been mind

49:11: blown in the in the Discord over here.

49:15: Um, it's been amazing.

49:18: One of the, um, let me see. One of the

49:22: things I wanted to point out is I said,

49:23: "Oh, it took me this long to realize

49:26: that Nicolas like um, in our brand was

49:30: Nicola Renie brand."

49:32: >> Oh, yeah.

49:32: >> And then someone mentioned that it's

49:36: also why cowplot is called that because

49:40: C was claw Wilk.

49:43: >> Oh, nice. Nice. blew my mind. What a

49:45: what a great piece of lore. Um,

49:48: [laughter]

49:48: thank you so much for for sharing

49:50: everything and all of your wisdom. You

49:53: have some groupies here. [laughter]

49:56: If people would like to keep up with you

49:59: and see your posts, what is the best way

50:01: for them to do that?

50:03: >> Um, I'm on Blue Sky and LinkedIn and

50:07: Master or my website which has links to

50:11: all of the other things.

50:12: >> Yes. And like if you see the strip at

50:13: the bottom of her her plot there, you

50:16: can see all of the places to find her.

50:17: >> There there you go. There you go. All of

50:20: these places. There you go.

50:21: >> And you, I happen to know submitted this

50:24: Tidy Tuesday data. You regularly curate.

50:27: So, thank you so much for the the kind

50:29: of like service that you do to our

50:31: community and helping curate.

50:33: >> Thank you. I won't fully take credit for

50:35: this week's curation. It was actually a

50:36: colleague of mine that I worked with

50:38: created the data. I just did the PR bit,

50:40: the easy bit at the end. Yeah,

50:42: >> the important part of getting it across

50:44: the finish line. Everybody, I would

50:46: really love to encourage you to curate a

50:50: data set. We have an entire episode that

50:53: we did um with John Harmon of Tidy

50:56: Tuesday. And if you are curious about

50:59: how to put data together, how to curate

51:01: it and submit it, I really really highly

51:03: encourage you to do that. It's such a

51:04: fun process. And then your data gets to

51:06: be used by people all over the globe as

51:08: they are learning and practicing their

51:10: data viz. Um, which is a really really

51:13: cool feeling. I have submitted once and

51:15: I got to see people make plots and I was

51:17: just like mind blown. Other than that,

51:19: Nicola, thank you so much for joining

51:21: us. This was super fun. I hope you had a

51:23: good time.

51:23: >> You're welcome. I had a great time.

51:25: >> Awesome. Everybody, big round of

51:28: applause for Nicola. Big round of

51:29: applause for Nick who joined us as our

51:31: special co-host today. Isabella, we

51:33: really, really miss you. We hope you're

51:34: having a wonderful time at PYON. and we

51:37: will see you all um on Thursday if

51:39: you're coming to the data science

51:40: hangout or next Tuesday at the lab. Bye

51:43: everybody. I'll see you on Discord.

51:47: [music]

51:53: [music]
