---
type: source
title: "Pair programming"
source_file: "UR4vwDkJMhc_pair-programming.md"
video_id: "UR4vwDkJMhc"
url: "https://www.youtube.com/watch?v=UR4vwDkJMhc"
lang: en
tags: ["ds-incubator", "pair-programming", "github-issues"]
key_topics: ["pair-programming", "navigator-driver", "ping-pong", "strong-style-pairing", "wip-limit", "five-seconds-rule"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=UR4vwDkJMhc"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    usage_count: 8
    last_modified: "2020-03-10T00:00:00Z"
usage_window: { from: "2020-03-10T00:00:00Z", to: "2026-09-08T04:00:00Z" }
---

# Pair programming

## Summary

This meetup introduces pair programming, framed as a vital component of collaborative work in teams that leads to high-quality software despite an initial discomfort and mid- to long-term payoff. The talk draws on a blog post by Martin Fowler (two authors) to explain that pair programming is not simply putting two people in front of a screen: one person is the **navigator** taking a strategic, holistic view (predicting problems, thinking about what might go wrong) while the other is the **driver** typing at the keyboard with a tactical, detail focus, switching roles very frequently. Two styles are contrasted: **ping-pong** where one member writes a failing test (red) before code exists — e.g., "function f returns data frame my function s doesn't exist" — passes the keyboard, the other writes the minimal code to make the test pass (green), then writes the next failing test back; and **strong-style pairing** suited when one person must be inducted to a project or lacks context — "for an idea to go from your head into the computer it must go through someone else's hands" — the navigator with more contextual knowledge instructs while the driver implements even with incomplete understanding, then the pair pauses to fill knowledge gaps. Benefits discussed include knowledge transfer, reducing work-in-progress (WIP) and context-switching costs (ten problems handled as five pairs means only five active problems), bus-factor reduction ("Los Pinos nobody else knows where to find it"), and stylistic convergence across a codebase; challenges include power dynamics across seniority/gender, hierarchy, and the need for frequent, respectful turn-taking. Practical advice highlighted includes the five-seconds rule — give the driver five seconds of room before instructing — and management perspective that double time now is cheaper than single-expert silos that leave.

## Key Concepts & Tools Taught

- **pair-programming**: Two people working on one project on one computer with one keyboard and one mouse; valuable for collaborative work but with mid- to long-term payoff and not as simple as co-location.
- **navigator-driver**: Two complementary roles: **navigator** (strategic, forest view, predicts problems/bugs) and **driver** (tactical, tree view, types characters, pays attention to detail); ideas are that they switch frequently.
- **ping-pong**: A test-driven style where one writes a failing test before code exists (red), passes the keyboard, the other makes it pass (green) with minimal code, then writes the next failing test back; requires both to be familiar with testing/coding and uses very short cycles.
- **strong-style-pairing**: Induction-oriented style where the person with more context is navigator and the other is driver; rule "for an idea to go from your head into the computer it must go through someone else's hands"; driver executes instructions even with incomplete understanding, then pair reflects to fill gaps.
- **wip-limit**: Work-in-progress principle: having fewer concurrent problems (e.g., 10 people as 5 pairs tackling 5 things) avoids high context-switch cost of multitasking; high WIP reduces efficiency.
- **five-seconds-rule**: Advice to give the driver five seconds of space before giving instructions, allowing them to reflect and avoid micromanagement; frequent keyboard switching creates natural reflection points.


## Code Snippets & Formulas

No R code dictated; illustrative test/code pattern spoken (mangled kept):

```r
# Ping-pong illustration (caption "I know function f returns data frame my function s doesn't exist so if you run that test the test will fail")
# Person A writes:
# function f returns data frame  # f <- function under test, expectation
# test: expect f() to return data.frame  # fails -> red

# Person B writes minimal code:
f <- function() data.frame()  # make test pass -> green
# then B writes next failing test for A, etc.

# Strong-style rule
# "for an idea to go from your head into the computer you must go first through someone else's hands"
```

