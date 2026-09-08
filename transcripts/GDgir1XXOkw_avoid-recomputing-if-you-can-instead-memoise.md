---
type: Video Transcript
title: "Avoid recomputing if you can! Instead memoise"
description: "[Music]  here is a tip to help you speed up your  computer programs by storing the result  of your expensive function calls and  returning the cash result when "
resource: "https://www.youtube.com/watch?v=GDgir1XXOkw"
tags: ["youtube", "ds-incubator"]
generated:
  by: "bin/convert-transcripts"
  at: "2026-09-08T02:25:20Z"
status: stable
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=GDgir1XXOkw"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
---

# Transcript

[Music]

here is a tip to help you speed up your

computer programs by storing the result

of your expensive function calls and

returning the cash result when the same

inputs apply so this is the idea of

memorization and you can read about that

on Wikipedia But the cool thing is

probably to see uh an example of that so

let's let's do just that so say that I

have a function f that that's something

you know that is pretty slow so in this

case that slow thing is just calling

system sleep for

um for whatever time you want right so

let's let's do a a call that would take

three seconds so if I uh run that system

time and and to measure how long it

takes to call the function f with the

argument three then you know it takes

three seconds right so what happens if I

call the same function with the same

argument one more time

well unfortunately we have to wait

another 3 seconds more or less so you

can see here on the elapsed uh section

to my to my right right so uh how can

you you know make a huge improvement

with something that is extremely simple

all right you memorize that function

right so you call the function memorize

in the package memorize and you create a

modified version of the region function

that when you call it the first time

it's going to take still the three

seconds that uh uh you know you know it

to in the first place right but the the

beauty comes when you need to uh do

subsequent calls with exact same

arguments so if I call now FM which is

the memoized version of f if I call it

again with exact same arguments you see

how you know it it virtually takes no

time right because the result is not

being recomputed instead is being

retrieved from the cach
