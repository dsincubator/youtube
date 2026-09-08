---
type: Video Transcript
title: "How to use Positron's GitHub integration | Isabella Velásquez & Libby Heeren | Data Science Lab"
description: ">> Yeah, but we're also joined by Isabella today, special guest."
resource: "https://www.youtube.com/watch?v=JTv4IbFzI7M"
tags: ["ds-lab", "github", "quarto", "github-issues", "git"]
lang: en
generated:
  by: "process:convert-transcripts"
  at: "2026-09-08T21:59:18Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=JTv4IbFzI7M"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2026-03-18T00:00:00Z"
    usage_count: 1761
usage_window: { from: "2026-03-18T00:00:00Z", to: "2026-09-08T21:59:18Z" }
---

# Transcript

00:07: Welcome back to the data science lab.

00:09: I'm Libby. I run community here at

00:11: Posit. I am joined by Isabella

00:13: Velasquez. Isabella, would you like to

00:14: say hello? Yeah, hi everyone.

00:17: Good to see you.

00:19: >> Yeah, but we're also joined by Isabella

00:20: today, special guest. Isabella, you want

00:22: to say hey?

00:23: Hello. I also have, if he lets me, Toast

00:27: is also joining. Toast! Or also, it's

00:30: not a candle, but this is your GitHub

00:32: good luck charm.

00:33: Yes!

00:35: I'm such a Toast fan, you guys have no

00:36: idea. So, today Isabella and I are going

00:40: to be

00:41: your leaders here, and we are going to

00:43: be talking about collaborating

00:46: in GitHub using Positron, and our

00:50: framing for this will be we'll be

00:51: working together on a Quarto book.

00:54: So, Isabella's going to get us started.

00:56: She is going to share her screen,

00:59: and we are going to be

01:01: from nothing here. Like, we're going to

01:06: start a brand new project, brand new

01:08: repo,

01:09: and the point of today will not to be a

01:12: step-by-step tutorial on how to

01:15: collaborate in GitHub. The point of

01:17: today is to show you what's possible in

01:19: Positron in this VS Code ecosystem. If

01:23: you are used to being in RStudio,

01:26: and maybe if you're like me, and maybe a

01:28: little bit like Isabella, you might be

01:30: like, "You know what? I'm used to get in

01:32: RStudio. It's fine. I don't need to

01:34: learn the new things in Positron." I

01:38: used to feel that way, and I don't

01:39: anymore, and I just really want to share

01:41: what you can do. If you are a VS Code

01:44: professional who is like, "I collaborate

01:46: in GitHub all the time with VS Code,"

01:48: and there's more that we're missing,

01:49: just give that context in the chat and

01:51: help people learn. We can't cover

01:53: everything today.

01:54: And that's on purpose.

01:56: All right, everybody.

01:57: Isabella, take us away.

02:00: And I on my side will open a fresh

02:02: instance of Positron and be ready.

02:04: What what? All right, everybody.

02:06: >> Oh, I'm going to log in to GitHub, too.

02:08: Ah, yes, very important.

02:11: So, here

02:12: >> case it makes me have to do it.

02:13: >> [clears throat]

02:14: [laughter]

02:15: >> So, here I am on This is what my

02:18: Positron looks like when I first open

02:21: it. And as Livy mentioned, like really

02:23: for pretty much everything that we're

02:25: doing today, there are multiple ways

02:27: that we could do it. Uh so, we're just

02:29: going to be showing one particular way,

02:32: and then of course, you can always adapt

02:33: your workflow to whatever you need.

02:36: And since we are working on a Quarto

02:38: book, uh so, a Quarto book is a special

02:42: kind of project from Quarto that like

02:44: links together chapters and documents

02:46: and things like that, and you can add

02:48: references, things like that.

02:50: And so, again, multiple ways of doing

02:53: it, but how we're going to start going

02:55: to open up the command palette, which in

02:57: Positron is command shift P.

03:00: And then, you'll see I have various

03:02: options and speak because I've done it

03:04: recently, Quarto create project is at

03:07: the very top.

03:08: I'm going to click that,

03:10: and then open up book project.

03:14: That's going to pop open my directory,

03:17: so I can

03:18: um

03:19: like I usually put my R-base projects in

03:22: this RRR folder, and so this is a

03:25: uh folder in which the Quarto book

03:28: folder will be created. So, I'm going to

03:30: choose this as my project directory.

03:32: And then, I'm going to call it a name,

03:34: so let's say

03:36: uh so, this will be the name of my

03:37: Quarto book project. So, I'm going to

03:39: call it Diaz Lab Quarto book.

03:43: And you can see here, it's saved within

03:44: RRR in on my uh computer.

03:48: Press enter,

03:50: and here we go. Now, I'm inside my

03:53: Quarto book

03:55: folder and you can see that here on the

03:58: left-hand side

04:00: I have like all the files populated to

04:03: create a Quarto book. And so a very very

04:06: basic book would have several documents

04:08: like this index.qmd,

04:10: an intro, references, and then also this

04:14: underscore Quarto.yaml

04:17: file, which basically like lets us know

04:19: this is in fact the book as you can see

04:21: here in line two type book and then you

04:23: can add like metadata for your book,

04:26: continue adding like pages and and

04:29: whatnot.

04:31: And you know, from there build out your

04:32: book.

04:34: So

04:35: we have the files which is great and we

04:37: can kind of see like this is

04:39: a

04:40: preface with like this is a Quarto book

04:42: and things like that.

04:44: If we want to actually take a look

04:46: what the book would look like, we can

04:48: hit this preview button up top.

04:52: And this will preview our book.

04:57: So here in the terminal we can see that

04:59: it rendered everything and then if I

05:02: open up this viewer like here indeed is

05:05: the book.

05:06: Um

05:07: and so here again is the preface, the

05:09: introduction. I can pop it up here into

05:13: a new browser as well if I want to.

05:16: But since we're talking about Git today,

05:18: well one thing in particular that I want

05:21: to mention is

05:23: um

05:24: that there is this underscore book file.

05:27: Oh, I think I jumped ahead. So let's go

05:30: back to Git.

05:31: And so you may notice if you have used

05:33: Git before, there's nothing here that

05:35: lets Positron know like I'm working with

05:38: Git at all.

05:39: And so here in what's called the primary

05:42: sidebar, there's this GitHub item

05:44: and if I click that

05:48: Oh, I'm sorry. Not there yet. The source

05:51: control item.

05:53: There's going to be two options. I can

05:54: initialize repository or publish to

05:56: GitHub. If I click initialize

05:58: repository, it does exactly that. It'll

06:01: let it know that indeed I want to use

06:03: Git within this folder.

06:06: And in here, this is going to showcase

06:08: like all the the things that have

06:10: changed. So, cuz the folder was empty

06:12: before and now it has all of these like

06:15: files which lets me know there are 30 of

06:19: them. Those are the the things that

06:22: documents have that have changed that I

06:23: can push up to GitHub.

06:26: Uh and so if I go back here

06:29: it should be

06:33: I'm not sure why. There is no get ignore

06:35: file. I think it's because instead of

06:38: doing initialize repository

06:41: you you wanted to press the bottom one

06:43: which was like the one that sent to

06:44: GitHub and then I think it would have

06:46: given you a dot get ignore. But you can

06:48: create one. Yeah. Yeah. So, I'm going to

06:50: create a dot get ignore file. And so

06:53: what this does is it creates a file that

06:56: basically tells get what to ignore.

06:59: So, if there's anything that I don't

07:01: want to push up to GitHub like you know

07:03: because it's a giant file or because it

07:06: has some secret or something like that,

07:07: I can put it in here.

07:09: And so I will let it know like I don't

07:13: want for example my Cordo folder which

07:16: is here to get pushed up to get

07:19: to get. And then I'm also going to say I

07:21: don't want the book folder

07:23: which is here to get pushed up to get.

07:25: And the reason for that is I think it

07:27: depends like how you want to work

07:29: together. But all of these are generated

07:31: every time like somebody renders

07:33: something and the more files and things

07:36: like that, the more likely like you

07:37: might run into conflicts and things like

07:39: that. So, if I save this

07:42: you'll notice that the 30 files that

07:44: were here in the source control

07:46: are now eight.

07:47: So,

07:48: basically because everything that is

07:51: within these two folders is now uh

07:55: being ignored by Git.

07:57: Isabella, there's a question in the chat

07:59: from Mike. Do you have to create a

08:01: GitHub account before starting this kind

08:03: of project? Yes.

08:06: Uh

08:06: you do. And so, down here, oh

08:10: here,

08:11: uh this lets you know, like I am

08:14: already logged in to GitHub.

08:16: And so, if you haven't created um a

08:20: GitHub account, the first thing is to go

08:21: to github.com, create an account, and

08:24: then when you come here, there's

08:26: actually going to be an option for you

08:27: to sign in from here. And uh the

08:31: and then Positron will allow you to

08:33: authenticate from here. Basically, it'll

08:36: open up the GitHub in GitHub in a

08:38: browser, you put in this code, and when

08:40: you come back to Positron, you'll be

08:42: logged in. And Libby, we actually have a

08:45: short video on that, right?

08:47: We do. If I can get it to play,

08:50: um let me see if I can

08:54: Can I?

08:57: Let's find out.

08:59: Oh, no.

09:03: If not, maybe we can share on

09:05: I think that I I think that I can. Um

09:08: >> Okay. Should I I'm going to share my

09:11: screen really quickly. Yeah.

09:14: And this is literally just to show you

09:16: what the process of um

09:20: of getting in is. So, if everybody can

09:22: see my screen, Yes.

09:25: I'm going to go over there. I'm not

09:27: logged in to anything. This is on a

09:28: computer that has been completely wiped.

09:30: It's like, "Hey, you have an extension

09:32: installed that you can't use." It knows

09:34: that I have a GitHub pull request and

09:36: issues extension. So, that's why it's

09:38: saying that. Um Um but, obviously, I I

09:41: have never connected anything to get

09:45: and I'm going to go ahead and just

09:46: create a new R project here.

09:52: I'm not going to initialize with a Git

09:55: repository. So, I'm doing exactly what

09:56: Isabella did, just instead of

09:59: an automated like create Quarto project,

10:02: I'm just clicking through everything.

10:04: All right, I'm heading over to that

10:05: source control pane.

10:08: Publish to GitHub is there for me.

10:11: And Positron just knows that if you try

10:13: to interact with GitHub and you're not

10:15: logged in, that you need to

10:17: authenticate. So, it gave me a little

10:18: button to say like, go ahead and copy

10:20: this code. And when I go to

10:21: authenticate, cuz it's opened my browser

10:23: for me, it's just ready to paste in.

10:26: So, I paste that in. I say, "Yep, I want

10:29: this to authorize."

10:30: Um those are the associations that I

10:32: have on GitHub and I'm going to say,

10:34: "Yep, authorize."

10:36: And we're done.

10:37: If you are used to setting things up in

10:39: R Studio, you know that it's way harder

10:41: than that.

10:43: So, this is pretty nice.

10:46: There we go. I'm going to go down and

10:47: grant access through my GitHub account

10:50: to the extension, the GitHub extension

10:53: for pull requests and stuff. That's what

10:55: you saw me do down there in that um

10:57: little accounts tab.

11:00: So, now you can see me creating a file

11:02: here

11:06: and saving it.

11:08: My source control tab. Cuz now, when I

11:11: press this button,

11:13: it knows that it's connected to me and I

11:15: can go ahead and publish an entire

11:18: repository and it's just going to open

11:20: it up. I can click open in GitHub and

11:21: it's going to work. So, that

11:24: is the end of that. We're going to

11:25: actually go through that live, that part

11:27: with Isabella now.

11:29: Yeah. Thank you. Great question.

11:33: All right.

11:35: So, going back here, we're going to go

11:36: back to this source control item, where

11:39: again here are the files that we have

11:41: changed excluding the ones that I put in

11:44: the Git ignore.

11:45: And then,

11:47: uh if Git is new to you, generally the

11:50: workflow is first you stage your

11:52: changes, which lets you um you know, Git

11:55: know like these have been changed and

11:57: they're the things that we're going to

11:58: want to uh push up to like our source of

12:01: truth repository. And there's this plus

12:04: sign where if I click that all it says

12:06: stage all changes. You could do it like

12:08: individually as well, but since it's our

12:11: first thing, I'm just going to say stage

12:13: all changes and you can see it's moved

12:15: from changes to stage changes, so I know

12:17: we're all set.

12:19: Going to add a message.

12:22: I'm going to write initial commit.

12:24: Commit.

12:25: And now, uh as Libby just shared,

12:28: there's this publish branch um option. A

12:30: branch are like the different offshoots

12:33: of the things that you are working on.

12:35: And down here in Positron, you can see

12:38: which branch we're on, which is the main

12:40: branch, which is like the the real the

12:42: main branch. Um

12:44: and Libby uh also has shared this cool

12:48: snippet that you can put in your user

12:50: settings so that the name of the branch

12:52: also shows up at the top of your

12:54: Positron window as well. So, I have that

12:57: uh because I do also find it very handy.

12:59: Going to hit publish branch. It's going

13:01: to let me have a couple of options to

13:04: private or public repositories. Hitting

13:06: public.

13:08: Down here, it says successfully

13:11: published the Quarto book to repository

13:14: to GitHub. I can open on GitHub.

13:21: And here we go. So, we are in our

13:23: repository. Here are all all files that

13:25: we staged and committed and pushed up,

13:29: and which is great.

13:31: And so, since Livvi and I are

13:32: collaborating on this, I'm going to head

13:35: over to settings and add Livvi as a

13:37: collaborator. So, there is this

13:39: collaborators option.

13:43: And then clicking add people, I will

13:45: find you, Livvi.

13:47: Whoop. I'm easy to find. Too many E's.

13:50: Just my name. [laughter]

13:53: Okay. So, it lets me know that we're

13:55: awaiting uh Livvi's response, but in the

13:58: meantime, the next thing that I want to

14:00: do is So, the main branch is is uh

14:04: you know, it's the source of truth. It's

14:06: it's the like thing that's you know, if

14:08: it's a book, the thing that's being

14:10: published and being shown. And so, we

14:13: generally want to protect it so that

14:15: there is some sort of review process or

14:17: at least some uh guardrails around like

14:20: what actually gets put on the main

14:22: branch um as people are working. And so,

14:25: one way to protect the main branch is by

14:28: clicking on branches here. Oh, sorry. On

14:31: settings.

14:32: I'm going to click add classic branch

14:35: protection rule.

14:37: I'm going to write main to say I want to

14:40: protect the main branch. And then here,

14:42: I'm going to require a pull request

14:44: before merging. So, that means before I

14:47: allow any changes to actually be made on

14:49: the main branch, um

14:51: >> [clears throat]

14:51: >> I'm going to require a pull request

14:53: where I can review or you know, my

14:55: collaborators can review and somebody

14:58: can We can also check off this require

15:00: approvals. So, here what I'm saying is

15:03: one at least one person needs to approve

15:06: uh before the main the pull request can

15:10: be merged and the main branch changed.

15:13: So, I'm going to create that.

15:17: And Livvi, would you mind showing us

15:18: from your side what it looks like to be

15:21: added as a collaborator.

15:23: Yes, I would love to. Also, Becca had

15:25: asked, was that push to GitHub the

15:26: initialization of the GitHub repo? Um,

15:30: yes. If it was the creation, Becca says,

15:32: what if you already had a GitHub repo

15:35: with that same name? Would you get a

15:36: warning in Positron?

15:37: I am not 100% sure what you would get as

15:41: a warning in Positron. I think that

15:43: there are so many different ways to do

15:44: this. We are only showing one where like

15:46: we don't have a remote repo set up with

15:49: the GitHub website yet, right? If you

15:51: did and it was already set up and it had

15:53: stuff in it, the process would be you

15:55: would clone it into Positron and you

15:57: would just open it in Positron. So,

15:58: totally different workflow, but you get

16:01: the same result of like a repo that was

16:03: local now that was on your machine and

16:05: that was hooked up to your remote repo

16:07: in GitHub and Positron, the workflow in

16:09: Positron would be the same from there on

16:11: out. To do clone in GitHub or in

16:13: Positron, it's very easy.

16:15: Control shift P to get to the command

16:16: palette and then just type the word

16:18: clone and that's the first option you're

16:19: going to see get clone. And then it'll

16:21: just ask you to type in uh or paste in

16:23: the HTTP S if that's the way that you're

16:26: going. I have that set up as my cloning

16:29: option in the Positron settings. You can

16:31: change it in the Positron settings to

16:33: whatever you need.

16:35: Okay, thank you for that fantastic

16:37: question. I'm going to go ahead and

16:38: share my screen and show what it looks

16:40: like.

16:42: Show you my very messy GitHub repo. Um,

16:44: so I have something waiting for me or at

16:46: least I should in my notifications.

16:48: You'll also get an email if somebody

16:50: adds you as a collaborator. So, I'm

16:52: going to click this little thing right

16:53: here. Oh, it says I'm all caught up.

16:55: It says I do not have anything from

16:57: Isabella.

16:59: Oh,

17:01: maybe I didn't click add. Let me check.

17:04: Let's

17:05: Hold, please. There it is. Oh, yeah.

17:08: Invitation to join

17:10: DS Lab Quarto book. Um, so if you click

17:13: this, it's going to go away. Don't click

17:14: that.

17:15: It's going to say, ah, you're done with

17:17: this message." You have to actually

17:18: click the message and then accept the

17:20: invitation and that's going to make me a

17:22: collaborator on the this repo. That

17:24: means that I can push to it. I cannot

17:27: push to main, however, because again, we

17:29: protected the main branch of this repo

17:31: and we watched Isabella do that.

17:34: Um and Jordan mentioned, "Careful with

17:37: branch rules and users who are admins.

17:39: Some settings allow admins to bypass

17:41: rules. There's a few extra clicks to

17:42: make sure admins aren't excluded from

17:44: the rules but can force push when

17:46: needed." Um we'll actually show this a

17:48: little bit later if we have time. I

17:50: think with the rule that we set up,

17:52: Isabella as an admin is actually not

17:54: excluded. It's still going to make her

17:56: get approval for a PR. Um she can click

18:01: a button, an extra button on the UI in

18:03: GitHub to push past that. So, she can

18:06: say, "I'm going to elect to push past

18:08: this." Um if she wants to. So, good

18:10: point, Jordan. Okay.

18:12: So, um what do we need to do here? We

18:15: need to switch back to Isabella, I

18:16: think, so that Isabella can make me an

18:19: issue cuz that's what we would love to

18:20: show is a little bit of like real

18:22: collaboration as if we were working on a

18:25: project together.

18:27: Yeah, that's right. So, this is called

18:29: the source control. If you hover over

18:31: it, you can kind of see and this is

18:33: where we like stage our changes and see

18:35: what's going on. So, GitHub is the

18:37: platform that we're using to use Git and

18:41: uh its icon is this like a little cat

18:45: with um

18:46: a tentacle.

18:47: And so, if I click here uh within

18:49: Positron, there's these really cool like

18:52: uh options to work with pull requests

18:55: and issues directly within Positron,

18:57: which uh blew my mind. I I did not know

19:00: this existed. I've never clicked it

19:01: before and so, um hopefully it blows

19:04: your mind as well.

19:06: Here in this window uh with issues, I'm

19:08: going to create an issue by clicking

19:10: this plus

19:11: and then I'm going to say call it

19:14: chapter one.

19:16: And I'm going to

19:18: if if you notice here, the first line

19:20: will be the issue title. So, the title

19:22: of the issue will be chapter one. I'm

19:24: going to tag Libby.

19:28: And I'm going to write, you know, hey

19:30: Libby, some kind of description of the

19:33: the issue that I want. Could you please

19:35: get started on chapter one?

19:40: Uh so, once that's good, I save.

19:43: And I hit this check.

19:44: And it lets me know the issue has been

19:46: created.

19:48: Uh

19:48: if I open the issue,

19:50: again, I can view this all within

19:52: Positron. I can see that Libby has been

19:55: assigned. And then, here's my comment

19:58: for uh for Libby as well.

20:00: And yeah, so now I pass it over to you

20:05: to get started on chapter one.

20:07: Yeah, okay.

20:10: And

20:12: pertinent to

20:14: the question that we had before of like

20:16: how do I get it down if it's already

20:18: existing, I'm in that situation now. It

20:20: exists as this remote repo

20:22: in GitHub in the UI right here for me,

20:24: but I don't have it here. So, I'm going

20:27: to go grab the URL

20:30: because the clone type I'm going to be

20:32: using is HTTPS.

20:34: And then, over here, I can do command

20:36: shift P,

20:38: type in clone.

20:40: It's going to ask me to provide the

20:41: repository URL. There it is.

20:44: Hit enter.

20:45: And I'm going to say, sure, let's put it

20:48: there.

20:49: >> [clears throat]

20:50: >> And I'll open it in the same window.

20:53: Um do I trust the authors of this

20:55: folder, Isabella? I don't know if I

20:57: trust you.

20:59: I'm going to say yes.

20:59: >> Understandable.

21:01: >> [laughter]

21:02: >> Okay, and just like that, we're done. I

21:04: have it open. Um my screen's going to

21:07: look a little bit different from

21:08: Isabella's because my activity bar is at

21:11: the top here. I like this. It's so clean

21:14: and nice, but I have all the same stuff,

21:16: right? So, here it's just smaller.

21:18: Here's my little source control, and if

21:20: I go over there, I can see that if I was

21:22: going to make changes, they would end up

21:24: there.

21:26: Um, all right. I also have the GitHub

21:30: Octocat over here.

21:32: And this is where I can see that I have

21:35: some issues open. My issue right here, I

21:38: can go check it out.

21:40: I can see that Isabella's asking me to

21:42: get started on chapter one.

21:44: Um, all right. So, now, what I should

21:47: not do right now

21:49: is go try to push to main. So, let's do

21:51: that.

21:52: Because in real life, that's what I

21:54: would forget and do. I would say, all

21:56: right, she wanted me to get started on

21:58: chapter one, so I need to

22:01: um, to create a new file. There's many

22:03: ways to create a new file. I'm just

22:05: going to do it like this.

22:07: And say chapter one.qmd. Great. Um, this

22:11: is chapter one.

22:15: In true Libby fashion, let's leave a

22:17: typo in there, and I will save it.

22:20: And the moment I save something, the

22:22: source control says, um, you have

22:24: something that we don't recognize. And

22:26: there's a U here. You can see that it's

22:28: an untracked file, right? If you hover

22:30: over it, it'll say untracked.

22:33: Let's head over to the source control

22:35: tab. And it says, hey, you made a

22:37: change.

22:38: I can click this change. I can look at

22:41: it. I can open the file here if I don't

22:43: happen to have it open already. Like if

22:45: I closed this, and I click this, this

22:47: would open it.

22:48: I can revert my changes, or I can stage

22:50: it. If I have a bunch of changes, I can

22:52: click this right here. It only shows up

22:54: if you hover, and it will just stage

22:56: everything.

22:57: So, let's say stage. Great.

23:01: And I'll say that I'm going to init

23:02: chapter one and commit it. And say,

23:05: "Yeah, let's go ahead and push to main."

23:07: And it tells me, "Hey, you're going to

23:08: push and pull from main. Is that okay?"

23:10: And I say, "Yes."

23:12: And then it says, "Wait."

23:15: "Something is wrong."

23:16: I'm going to hit that second one that

23:17: said show command output. Um and it's

23:21: going to tell me there's a protected

23:23: branch. You cannot do that. You need to

23:25: make changes through a pull request. And

23:27: I'm like, "Oh, no. That's right. I

23:29: should have made a branch."

23:31: I'm unable to push to main. Okay, cool.

23:33: So, what do I do if this is not three

23:37: lines of code? What if this was a whole

23:39: chapter

23:40: that I had just done? In a past life, I

23:42: would have literally copied and pasted

23:44: this into a text file that I would have

23:46: saved elsewhere, and I would have

23:49: absolutely panicked, right? Because I am

23:52: never able to stash changes

23:54: via the terminal correctly.

23:58: So, let me just show you what I would do

24:00: in this instance using the UI.

24:03: First of all, I've already committed,

24:05: right? All is not lost. Just like with

24:08: the terminal, we can

24:10: undo our last commit. So, I'm going to

24:12: go over here to this this main branch

24:15: here, and I'm going to go down to the

24:16: commit.

24:18: And I'm going to undo last commit. So,

24:22: again, three dots.

24:24: There are three dots all over the place.

24:25: You'll get to the right thing kind of no

24:27: matter what here. Three dots, commit,

24:30: undo last commit.

24:32: And then I can breathe a sigh of relief

24:33: because there it is. It's staged still,

24:36: but it's not committed. Now, what I'm

24:38: going to do is go back to these and go

24:40: down to stash and just say like, "Hey,

24:42: can you just stash like the staged

24:44: changes that I made? Just hold on to

24:46: them." And it's going to ask me to

24:48: um

24:50: Oh, sorry. It's not going to let me do

24:52: anything because Zoom is overriding my

24:54: controls. Chapter one init changes.

24:58: I'm going to hit enter and now in the

25:01: background those are stashed away. It's

25:05: kept my init like my commit message but

25:08: they're gone. Now I can just say okay,

25:11: I'm I'm definitely on the main branch. I

25:12: can see that up here. Here it is. What I

25:14: need to do is create a new branch.

25:18: Normally in the terminal I would get

25:20: check out or some other version of that.

25:24: Again, you can just go down here to

25:25: branch and create branch. Type in your

25:29: branch name, chapter one branch. Great.

25:33: Now I have those changes stashed

25:35: somewhere. This is swiped through,

25:38: right? The reason this is swiped through

25:40: is because if I go back over here, it

25:42: doesn't exist. I stashed it. The changes

25:45: that I made don't exist anywhere.

25:46: They're like

25:47: held off on the side for me.

25:50: I want to now apply those changes to

25:53: this, put that chapter one file back in

25:55: there. Um so we'll go back to our source

25:58: control and I can go back to this little

26:00: stash thing and I can say pop stash. And

26:03: it's going to say, "Hey, which stash do

26:05: you want to pop?" And I'm going to say

26:06: this this one.

26:09: Cool. Now if I go back it exists.

26:13: There it is. It's been added and it's

26:16: already staged for me. So I can go back

26:18: to my process, commit it and now it's

26:21: saying instead of sync it's saying

26:23: publish branch because this branch only

26:24: exists for me locally. It doesn't exist

26:27: remotely on Isabella's repo on the

26:29: internet yet. So I'll go ahead and

26:31: publish my branch and it says, "Hey, do

26:34: you want to go ahead and create a pull

26:35: request for this branch?"

26:37: And I could but I'm going to go back to

26:39: the UI and just kind of show you

26:42: what it looks like when I refresh this.

26:46: So I refresh it and it says, "Hey, we

26:48: now have two branches. It's ready to

26:51: compare and do a pull request.

26:53: You can do all of this from Positron

26:55: though. You don't have to go back to the

26:57: UI at all.

26:59: Um so what I'm going to do is I'm going

27:01: to go ahead and create my pull request

27:04: in Positron and I'm going to let

27:06: Isabella know that I have created

27:08: chapter one and I'm going to link it to

27:10: that issue. So,

27:12: we'll go back over here.

27:14: I could create a pull request right here

27:17: or I could just click this and create a

27:19: pull request. I could also write in here

27:23: create a pull request. There's so many

27:24: ways to do this.

27:26: Uh but we'll go back over here. We'll

27:27: say

27:29: the title of mine is in it chapter one

27:31: and in my description I'm going to say

27:34: this closes

27:37: uh

27:37: one because that's the issue that I know

27:39: existed.

27:41: And then it'll tell me my files changed.

27:44: It shows me very clearly what I'm doing.

27:46: I'm merging chapter one into main.

27:49: Um and then I can also if I hover over

27:52: these, I can assign things and add

27:54: reviewers. I want to add a reviewer.

27:58: It knows who Isabella is. I'm going to

27:59: click that little mark here and click

28:01: okay.

28:02: There she is as a reviewer.

28:06: And if I scroll down, which it was kind

28:08: of hard to see in the way my theme is,

28:11: but like here we go.

28:13: You can create right here.

28:15: So it's creating my pull request for me.

28:16: I did not need to go to the UI. It's all

28:18: just in Positron.

28:21: And here's my pull request. We can

28:22: switch it back to Isabella so she can

28:24: see

28:25: what it looks like

28:27: to check the update.

28:29: And I will hop over to Discord really

28:31: quickly to make sure that there's not

28:32: anything I

28:33: missed. Is everything Is everybody okay?

28:36: Everyone's okay, but there was Danielle

28:38: had a question about how to put your

28:40: activity bar to the top. Um so maybe to

28:43: show for the class because it highly

28:45: requested. Yeah.

28:48: >> So, here's activity bars, that blue bar.

28:51: If I right-click and hit activity bar,

28:53: or hover over activity bar position,

28:56: there will be several options. So, you

28:58: could put it at the top, like Livvi has

29:01: it.

29:01: And Livvi, there's something about your

29:04: settings end up up here.

29:06: >> Yeah, they said they end up over here.

29:07: So, in when it's on the left, your

29:09: account and your settings are in the

29:11: bottom left. They silently retreat to

29:14: the top right of your screen without

29:15: telling you. [laughter]

29:16: So, if you've lost them because you've

29:18: just done that, they're in the very top

29:20: right.

29:21: Yeah. And I like the default, um just

29:24: because

29:26: they're nice and big, but they're bottom

29:28: and hidden as well as our other options.

29:33: Cool.

29:34: All right. So, Livvi has gone ahead and

29:38: created a pull request, and if I click

29:39: this refresh pull request, now I can see

29:43: all open pull requests, and here is

29:46: chapter one.

29:47: Which is great. I'm like, "Awesome." You

29:50: all notice that the print branch

29:51: protection policy must be fulfilled

29:53: before merging.

29:55: Uh but, I want to check out what what

29:57: was done first. And so, uh I could do

30:00: that by literally checking out. And so,

30:03: this checks out the branch, which up

30:07: here used to be main, uh and down here

30:10: as well. Uh that's us know that right

30:13: now I'm in the chapter-1 branch instead.

30:16: Lets me know pulls up this file that is

30:20: changes in the pull request. And so,

30:22: green means that something has been

30:24: added. Uh instead, let's say,

30:27: I just closed that, but I saw that there

30:29: was indeed a typo. If I open up the

30:32: files in my explorer, open up chapter

30:36: one, I'm like, "Oh, no.

30:38: I will fix this."

30:40: So, I can go ahead and fix that typo.

30:43: Billy, what are you doing?

30:45: >> [laughter]

30:45: >> If you follow me on Blue Sky, this is

30:47: normal.

30:48: And there are so many like little things

30:51: that Post Tron does to let you know. So,

30:54: for example, now the color has changed

30:57: and you'll see that that now there's

30:58: this M. So, this lets um us know that

31:01: this file has been modified and we can

31:04: see here, too, a nice uh little view of

31:07: what exactly has been modified as well.

31:10: And so, I want to make sure I haven't

31:14: missed anything.

31:16: Okay.

31:17: >> [clears throat]

31:17: >> And so, yes.

31:20: If I go back to source control,

31:23: now I can see my chapter one has uh

31:27: changed. And so, doing the same process

31:30: as before, I can stage this change and

31:33: move up to stage changes. I'll say fix

31:36: typo.

31:38: Commit

31:39: and sync the changes. Let me know that

31:41: it's pushing to chapter one, which is

31:43: the right branch,

31:45: and hit okay.

31:49: Heading back to my pull request, I can

31:51: open up this pull request again. I can

31:54: see Livvi's commit, my commit. I think

31:57: we're all good now.

31:59: And I can say,

32:01: "Thanks, Livvi."

32:03: And from here, I can comment and then

32:08: you'll notice here there's actually also

32:10: an option for requesting changes if you

32:12: don't want to approve. But because

32:14: everything looks good now, I'm going to

32:15: hit approve.

32:19: Now, this is saying there's no conflicts

32:21: with the base branch, which is main. And

32:24: so, I've approved the PR, but to

32:26: actually bring the changes in, I have to

32:28: merge the pull request.

32:32: I'm going to do that.

32:37: And so, if I scroll up here, I'll let me

32:39: know that the pull request indeed has

32:41: been merged. And then you'll notice that

32:44: I have this option for deleting branch.

32:46: And so this is another thing that you

32:48: could set up one of those branch rules

32:50: for to always delete uh your remote

32:52: branches after a pull request. Um but

32:55: because we don't have that rule set up

32:57: right now, we can do it within Positron

32:59: itself. If I hit delete branch, it'll

33:01: give me the option to delete the remote

33:03: branch. That's like the branch that's

33:05: out in the you know, internet.

33:08: And then local branch, which is the copy

33:10: that is on my uh personal laptop. And so

33:13: because we've merged this uh branch in,

33:16: I don't need either of those anymore.

33:18: I'm going to hit okay.

33:19: And that's going to delete those

33:21: branches. And that's is also really nice

33:23: to keep your things tidy and remember

33:25: like what has been changed and merged

33:27: and and and not. [clears throat]

33:29: Yeah, and I see.

33:30: Yeah, note really quickly because I'm

33:32: watching this on my screen, I watched in

33:34: real time my Positron just alerted me

33:37: that Isabella deleted that branch and

33:38: closed that that PR, which is very cool.

33:43: And the last thing to mention is up here

33:46: instead of chapter one

33:47: or down here as well, I'm back on main.

33:50: And so we have completed chapter one.

33:53: And so if we go back to the issues too,

33:56: you'll notice it's empty. And so because

33:59: Alby had written this closes number one,

34:02: um it should uh delete

34:06: that number one issue now because we've

34:09: merged in the pull request.

34:12: Yes, hopefully I did that right. There

34:13: are like um there are words that GitHub

34:16: recognizes. Closes is one of them. There

34:19: There's a whole list that you can go

34:20: Google

34:21: um to like do things inside of your

34:22: issues, which is very cool.

34:24: Okay, so I told you that I watched that

34:27: happen in real time. Um on my screen,

34:30: what happened was

34:32: all of these popped up like boop boop

34:34: boop boop boop boop boop boop boop boop

34:34: boop boop boop boop boop boop boop boop

34:35: boop boop boop boop boop boop boop and

34:36: then I had this little toast message

34:38: down here that said like hey Isabella

34:40: did some stuff.

34:42: Um

34:43: now, she deleted her remote branch, the

34:47: branch that lives like uh in the cloud

34:49: on the GitHub website. She also deleted

34:51: her local branch,

34:53: but that didn't delete it for me. I

34:55: still have chapter one branch and I'm

34:57: still on it. So, I can still see chapter

34:58: one up here and I can see chapter one

35:00: down here.

35:01: Um so, I can go up here and just very

35:04: quickly be like sweet, it's done. I'm

35:06: going to delete my local branch. I'm

35:07: done.

35:08: That puts me back on main and everything

35:11: is cleaned up. In a previous life, I

35:13: would have been looking over here at my

35:15: wall where I have a whole literal

35:17: handwritten list of terminal commands

35:19: for get. Don't judge me. I don't

35:21: remember them. They fall out of my

35:22: brain.

35:23: But I would have gone over here and been

35:24: like cool, I probably need to prune

35:27: deleted branches from my remote repo.

35:29: I'm going to get fetch {dash} p.

35:32: And that's going to fetch for my main.

35:34: It's going to prune any branches that I

35:36: need to delete.

35:37: Um but I don't have to do any of that.

35:39: I'm I'm

35:40: I'm so happy about that.

35:42: What I'm going to do is I'm going to

35:46: create a chapter two branch and I'm

35:48: going to ask Isabella to collaborate on

35:50: it with me

35:52: because I would love to show you what

35:53: happens with merge commits.

35:56: Again, if GitHub has ever made you cry,

35:59: it's probably a merge commit. Do we have

36:01: any questions in Discord though that we

36:02: need to hop on?

36:04: I have one question from the Zoom Q&A.

36:06: Um

36:08: this is from Derek that it's great that

36:09: you can do all of these get activities

36:10: within Positron rather than out on the

36:13: GitHub UI. Are there benefits to doing

36:15: them within Positron

36:18: um or the GitHub UI?

36:21: I think that not leaving the UI

36:26: or not leaving the the IDE to me is

36:29: pretty great. I will say that there are

36:31: certain things that

36:34: you still have to go to the GitHub UI to

36:36: do. For example, if Isabella did want to

36:39: bypass

36:40: that sort of like, "Hey, I'm the admin,

36:42: so let me just bypass this this

36:44: authorization for this pull request

36:47: without getting an approval." Um you

36:49: would have to go to the UI. Like there

36:50: are very few things that you can't do

36:52: from the IDE. I would say just having it

36:55: all in one place is really helpful

36:56: because when you're in the IDE and

36:58: you're literally getting alerts that

36:59: things are happening, it means you can't

37:01: miss them and mess stuff up, and that's

37:03: really, really important. Um because if

37:05: you've ever done something

37:07: in GitHub or just a Git tracked project

37:10: and you've messed it up, it's probably

37:11: because you just didn't think to do the

37:14: stuff like, "Oh, I need to pull before I

37:16: make any changes. I need to see if

37:18: anyone has done anything." Um so if

37:20: you're collaborating in real time,

37:22: having that real-time input to me is

37:23: just invaluable.

37:25: But yeah, it's up to you. If you really,

37:26: really like the GitHub UI, stick with

37:27: it. We're just trying to show you what's

37:28: possible

37:30: in case you've never seen it before.

37:32: Cool. Okay. Here's what we'll do. We'll

37:34: go through the process of just creating

37:37: a branch again. Um

37:39: there are so many ways to do this.

37:41: Again, I could go to like

37:43: command shift P and do stuff like

37:48: I could say get branch and it's going to

37:49: be like, "Cool, what do you want to do?"

37:50: I'm going to say, "Oh, I want to create

37:51: a branch and I want to name it chapter

37:53: two."

37:54: And there we go. I don't even have to

37:57: click anything. So that's just another

37:58: way to do it.

38:02: I'm going to go create a chapter two.

38:05: And instead of doing new file, again, I

38:07: could go over here and say new file.

38:11: Right? It knows I want to create a

38:13: Quarto document. I could say, "Let's

38:16: save it and call it chapter two.qmd."

38:22: Um and let's just say chapter two.

38:33: All right. Uh, what you if you uh

38:36: know how Quarto books work at all, you

38:38: will know that we're not actually adding

38:39: it to the metadata to the .yaml.

38:42: Um, here.

38:45: Therefore, it's not going to show up if

38:46: we render it. This is just for

38:47: illustration purposes. We're just going

38:49: to create some files and collaborate on

38:50: them in Git. So,

38:53: now it says, I know that this exists. I

38:56: know that we're on the chapter two

38:57: branch. All is good. We can go ahead

39:01: and initialize chapter two.

39:04: Um, and I'm going to go ahead and commit

39:06: it.

39:08: I did. It says, oh, I got to stage

39:09: first.

39:10: How to delete a branch if it's an older

39:13: rogue branch? This is from Amiko. If you

39:16: have an older branch, how can you get to

39:19: the UI to delete?

39:20: Yeah.

39:22: Um, if you have an older rogue branch,

39:23: you mean like in in here?

39:26: Uh, locally.

39:27: Locally. I think it should still show

39:30: up.

39:31: Would you go to delete branch? So, if

39:32: you go here,

39:33: >> Yeah. I think the three dots give you

39:35: the delete branch option if you scroll

39:37: down.

39:39: So, you can either do it here

39:41: where you have you type in branch and

39:43: it's going to be smart enough to like

39:45: give you all the options of what you can

39:46: do.

39:48: Um, and if you want to delete a branch,

39:50: it's going to find every Git tracked

39:53: branch for your project

39:55: and give you the option. And it'll give

39:57: you a little checkboxes next to them.

39:58: So, if I said delete branch, it's going

39:59: to give me right now

40:01: uh

40:02: options that I don't want. But, if you

40:03: had any tucked away in that project,

40:05: they would be there.

40:07: Hopefully, that makes sense.

40:10: Okay. Makes sense.

40:12: So, I forgot to stage these. There we

40:14: go. We're staged.

40:16: Can we init chapter two? Yes. Can we

40:19: publish our branch? Yes.

40:22: I don't want to create a pull request,

40:23: but I do want to create an issue. So,

40:25: I'm going to go over here,

40:27: go to issues, and there's a little plus

40:29: button.

40:30: Um so, I could do that. That opens up a

40:33: markdown file for me to create an issue.

40:35: Or, I could also go over to my actual

40:38: files,

40:39: and I could do something like

40:43: to do

40:47: initialize chapter two.

40:49: And you'll notice that Positron is smart

40:52: enough to recognize this word. And in

40:54: the Positron settings, there is a whole

40:56: list of words like issue, like to do,

40:59: that it will recognize and it will give

41:00: you this little light bulb,

41:03: and it'll say, "Oh, looks like you want

41:04: to create a GitHub issue." And I'll be

41:06: like, "Yes, I do. I want to call it

41:07: initialize chapter two." And I press

41:09: enter, and I'm done.

41:11: Issue created. Now, if I head over to my

41:16: pane over here, I should have an issue

41:19: waiting for me.

41:21: May have to refresh.

41:23: We'll see.

41:25: Make a liar out of me, Positron. Maybe

41:28: you recent issues?

41:32: Here we go. We did it.

41:35: You'd think it would be under my issues.

41:36: It's not assigned to anybody, so it's a

41:38: it's just one of these. If I go over and

41:41: open it,

41:43: I can modify it. I can do stuff to it.

41:46: Um and what I wanted to do was I wanted

41:49: to assign it to somebody, and I don't

41:53: know if I have the same functionality

41:55: here that I do when I'm creating my

41:57: markdown file, so I want to show you

41:59: what that looks like as well. So, if I

42:01: go to issues, and I go to plus,

42:03: and I say, "I'm going to use this to

42:05: create my

42:06: um

42:08: Let's

42:09: collab on chapter two.

42:13: These are comments.

42:15: They're not going to show up. It's just

42:17: giving you instructions.

42:18: If I want to assign it to somebody,

42:21: um Isabella, what How do you spell your

42:24: Oh, it's uh I V E L

42:29: A S Q.

42:30: Okay.

42:32: Oh, wait. I think it pops up if I

42:34: actually use my at.

42:36: There we go. I'm so smart.

42:38: Use your at symbol, y'all.

42:40: There we go. Um and then I'm not going

42:42: to label it, give it to a milestone or a

42:44: project. I'm just going to add things

42:46: here.

42:54: Great.

42:56: I'm going to click this little check

42:57: button up here. All I'm doing is

43:00: creating a markdown file.

43:03: There we go.

43:04: Now the issue has been created. Again,

43:06: it's always going to give you the option

43:07: to like look at it.

43:09: Here's the assignee.

43:11: Okay. So, let's hop over to Isabella, I

43:13: believe.

43:15: Yes.

43:15: That's right.

43:17: Power swapping. We've got two questions

43:19: in the Discord. One is from Jeff. Um is

43:22: the functionality similar if you're

43:24: working with an internal organization

43:26: like Azure DevOps version of Git?

43:29: I have never used these uh Azure DevOps.

43:32: I assume it's the same, but I don't know

43:34: if either of y'all have experience with

43:35: this.

43:36: I don't. I have only ever used

43:39: straight-up GitHub, and I've also never

43:40: used GitLab um or SVN. So, this is where

43:45: I would hope that there are some people

43:47: in the chat who have worked with Azure

43:49: DevOps.

43:50: If you have, please let us know how it

43:51: goes um

43:54: and come back to the chat and help

43:56: answer that question. I'm sorry I don't

43:57: have an answer for you. I think that a

43:59: lot of this is probably going to be

44:01: similar.

44:03: Um I think I'm kind of along the same

44:05: line.

44:07: Yep, that's from Jess. Uh and people are

44:09: interested, Mike raised the question,

44:12: "What is the best way to get orientation

44:14: into the world of Git and GitHub?" We've

44:16: got Happy Git with R, we have a few

44:19: Software Carpentry ideas, but do you

44:22: have any other suggestions about how to

44:24: learn about Git?

44:27: My biggest suggestion is to use it. Um

44:29: and so what I would do I'm going to do

44:31: is get with a person who is in the

44:34: community who can work with you, who can

44:36: start a Git project with you.

44:38: Um

44:39: and then do something completely low

44:41: stakes, right? You could literally just

44:43: open text files and text back and forth

44:46: to each other. This is what I do with

44:47: students to teach them Git. So, instead

44:49: of opening code files, maybe they're dot

44:51: R files, but just open a dot txt file,

44:54: add a line that's a message to somebody

44:56: like, "Hey, what's going on?"

44:58: Commit that.

45:00: They can get it, they can modify it,

45:03: they can add another line to add another

45:04: little text and they're like, "It's

45:06: going great. How about you?" right? And

45:08: send that back. Something low stakes

45:10: like that that's not going to make you

45:12: cry um is is a great idea to get used to

45:15: Git. And then working with somebody

45:17: who's used to it. Honestly, I think that

45:19: using a UI like this where you can point

45:21: and click stuff and you aren't 100%

45:23: relying on the terminal to do stuff that

45:26: is more complex is really, really

45:28: helpful. Um and then I would also, if

45:30: you happen to be somebody who's at an

45:32: organization where you're working with

45:33: mono repos that that contain multiple

45:35: projects inside of a repo, I would

45:37: Google GitHub um

45:40: get well work trees inside inside of VS

45:42: Code or inside of Positron. Work trees I

45:45: think is all one word.

45:46: We're not going to show that today. We

45:48: have 10 minutes left and I don't know if

45:49: we're going to get done.

45:50: But let's go ahead and hop over to

45:51: Isabella and what Isabella is going to

45:53: do

45:54: is

45:56: pull my changes

45:59: and respond to my issue.

46:01: So, I can see it indeed there are two

46:02: issues. And just on that note, I I

46:03: totally agree. I learned how to use uh

46:06: Git and GitHub by collaborating on

46:08: projects that didn't need Git and GitHub

46:10: just to build that muscle. And when I

46:13: finally got a job that did need a, you

46:15: know, it was uh

46:16: old hat, so.

46:18: Yeah. So, I uh go back to the GitHub

46:21: icon, and I can see indeed I have two

46:24: issues. Going back to my files, you'll

46:28: notice that I am on the main branch. But

46:30: right now, I don't see chapter one. And

46:32: the reason is my uh local version of the

46:35: repository and the one that's remote, uh

46:38: you know, in GitHub, uh are not

46:41: synchronized. And so, I want to make

46:43: sure that my main branch is always

46:45: synchronized. So, to do that, I can go

46:47: to source control.

46:49: And uh if you click these three, sorry,

46:52: I had it open.

46:55: This should be what it looks like by

46:57: default, your source control um window.

47:00: Clicking these three uh buttons by

47:02: source control lets you open up

47:04: repositories, and then I can see this is

47:06: my DS Lab Core Notebook repository.

47:09: And then, you'll notice like this circle

47:12: arrow icon lets me know that there are

47:14: three commits that from the origin uh

47:18: main, the GitHub version of this

47:20: project, that I can pull down. And so,

47:22: >> It's down at the bottom left, too. So,

47:24: it's trying to remind you at the bottom

47:25: as well. It's like main

47:27: little

47:28: >> Yeah.

47:28: recycle symbol and three. Yeah, it's

47:30: like There are changes. Please please do

47:32: something. And so, clicking that,

47:35: it'll let me know. It'll pull from

47:37: origin main. Clicking okay.

47:40: Going back to my files, now I can see

47:42: indeed I have chapter one uh where I

47:45: didn't before.

47:48: Going back to source control, I can

47:50: click here.

47:51: And this is another option for branches,

47:54: which allows me to see all the branches.

47:56: Oh, did I Oh, but I think I need to

47:58: synchronize first, right, Libby?

48:01: Mhm, I think so. You have to pull down.

48:03: So, this uh like pulls down not just the

48:06: changes from main, but everything else

48:08: that's going on, you know, in the

48:10: internet. So, hopefully now if I click

48:13: this button, I can see that there is

48:16: this chapter two branch that I can check

48:18: out and work from.

48:20: >> [clears throat]

48:21: >> Clicking this, now I am in the chapter

48:24: two branch indeed.

48:27: And open it up, now there's this chapter

48:28: two.

48:29: And let's say we're collaborating, I

48:31: want to continue adding uh to this book.

48:35: I'm going to save. It's going to be

48:36: great.

48:38: I'm going to save.

48:40: I'm going to stage.

48:42: I'm going to write a message.

48:46: Commit.

48:47: And changes. And so now this is pushing

48:50: those changes to the chapter two branch.

48:53: All right.

48:55: So, we mentioned synchronizing

48:57: uh not just on main, on across all your

48:59: branches. What happens if you don't do

49:01: it?

49:02: Back to [laughter] Libby.

49:04: In the six minutes we have left, um I

49:07: would really love to just simulate the

49:09: most true version of my experience of

49:11: Git, which is me messing stuff up. Uh

49:14: and how you how you fix it in the

49:16: Positron ecosystem here.

49:19: Okay, so I created chapter two. I pushed

49:22: that. Isabella did the right thing, and

49:24: she pulled it down, and she made some

49:26: and she pushed those changes back to the

49:28: chapter two branch.

49:30: What if I don't do that? What if I don't

49:34: pull my changes down, right? What if I

49:37: don't pull, which is right here, and I

49:40: don't fetch anything from my remotes?

49:43: Um I let's just go change this. Like

49:46: let's just be reckless.

49:48: I'm going to go over here and be like,

49:50: "Aha, I am so silly.

49:54: Not going to pull or anything.

49:59: And now I'm going to save this.

50:03: Cool. I'll stage it and I'll say

50:08: also

50:09: continuing chapter two

50:12: with the wrong way.

50:15: Bam!

50:16: I committed it. I'm on chapter two. I'm

50:18: like double-checking everything. I'm

50:19: like, yes, I'm doing everything I

50:21: should. And it's like, hey, do you want

50:22: to push and pull to chapter two? Yeah,

50:24: sure, let's do that. And it says, um,

50:27: I don't know if you want to do that.

50:29: I'm going to click show command output.

50:32: Oh, no.

50:34: Oh, no, and this is where I start

50:35: crying.

50:35: >> [clears throat]

50:36: >> I'm like, hello,

50:37: fatal, the word fatal? Are you kidding

50:40: me? It's terrifying. Okay.

50:43: Clearly, I have made some some mistakes

50:45: here. So, what what can we do? First of

50:48: all, we can undo our last commit. So,

50:51: let's do that. It's always an option.

50:54: Commit, undo last commit.

50:57: And then we can breathe. Okay, cool. We

50:59: have

51:00: we have made at least some

51:03: recompense here. Now, we need to go do

51:06: what we should have done in the first

51:07: place, it which is pull, because it's

51:09: telling me like, hey, you have one thing

51:10: to pull down here and and I didn't do

51:12: it.

51:13: This little button is like, hey, do you

51:15: want to

51:16: push and pull? Oh, no, you can't do

51:18: that.

51:19: You need to stash your changes before

51:22: you do anything, cuz you have this like

51:24: thing sitting here and it's staged.

51:26: Okay, cool, got it. We'll do that.

51:29: I'm going to go stash my uh staged

51:31: changes.

51:33: This is chapter two changes. We'll name

51:35: that stash. Okay, great, great, great.

51:39: Now, if I was smart, I could look at

51:41: this graph down here and I could see

51:42: that Isabella had made changes already.

51:46: Um, now that I've stashed the changes,

51:49: what I can do is now I can go pull.

51:53: And I can sync. So, I synced to get my

51:56: branches in order. I'm going to

51:58: double-check here and pull down in my

52:01: graph. So, I'm pulling these changes

52:03: into my graph. Here's my init chapter

52:05: two here. Um,

52:07: so if I go over to chapter two, now I

52:10: see the actual version that Isabella

52:12: pushed up.

52:13: This is great. Okay, I need to go

52:17: pop my stash changes, right?

52:19: And apply them.

52:21: Pop stash. This is the one I want to

52:23: pop. And now it tells me, "Wait, there

52:26: are merge conflicts."

52:27: I'm going to go ahead and just click

52:29: show changes here. Um, and it's going to

52:31: say, "Yeah, there are some add-ins and

52:34: some additions, and there are some stash

52:36: changes incoming. I want to resolve this

52:38: in the merge editor."

52:40: And this is where this is so much better

52:42: than RStudio.

52:44: Okay, okay, okay. I have my stash

52:45: changes. I have the way that it looks in

52:48: the repo, and I have the result.

52:50: These are buttons that you can use to

52:52: accept or decline a change. I want to

52:55: keep them both.

52:56: Yep, all that looks good. I'm going to

52:58: complete my merge. I could just like

53:00: tell it to do other stuff, but I'm going

53:02: to complete it.

53:03: Then it's going to say, "Great, I have

53:04: resolved this. Both of those changes are

53:06: accounted for. I can save this." And now

53:09: I can go back over here, and I can say,

53:12: "Also continuing chapter two, get rid of

53:14: the wrong way."

53:15: It's staged. I can commit it. I can sync

53:18: my changes.

53:20: And it doesn't yell at me. And in my

53:22: graph, I can see Isabella continued

53:24: chapter two. I also continued chapter

53:27: two. And we have we've have fixed

53:29: everything.

53:30: Um, I can go back to my issue. I can

53:33: comment on it. I can say, "Hey, I fixed

53:35: this. We're good."

53:42: All right. I think that this is probably

53:45: the most exciting thing for me. I think

53:47: this is really wonderful. Um

53:50: we have run out of time to show you

53:51: anything more, but I think that that

53:54: gives you a really good idea

53:57: of what we were trying to show, which is

53:59: there is so much to do inside of the IDE

54:02: without having to leave. There are so

54:03: many options. If you haven't explored

54:05: the GitHub integration into the VS Code

54:07: / Positron ecosystem, I highly recommend

54:10: you go check it out. Um

54:13: did everybody have a good time? Oh my

54:15: gosh, Ryan just shared the most wacky

54:20: GitHub graph that is scaring me.

54:22: Yep. Yep. Wonderful. I'm so glad

54:25: everybody had fun.
