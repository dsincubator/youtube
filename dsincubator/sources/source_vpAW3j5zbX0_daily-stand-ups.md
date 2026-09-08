---
type: source
title: "Daily stand-ups"
source_file: "vpAW3j5zbX0_daily-stand-ups.md"
video_id: "vpAW3j5zbX0"
url: "https://www.youtube.com/watch?v=vpAW3j5zbX0"
lang: en
tags: ["ds-incubator", "standups", "github-issues"]
key_topics: ["daily-standups", "yesterday-today-blockers", "slack-standup", "project-vs-team-standup", "blocker-escalation"]
generated:
  by: "agent:okf-wiki-builder/1.0"
  at: "2026-09-08T04:00:00Z"
status: draft
sources:
  - id: youtube-original
    resource: "https://www.youtube.com/watch?v=vpAW3j5zbX0"
    title: "YouTube auto-generated caption (json3)"
    author: "process:yt-dlp"
    last_modified: "2020-07-21T00:00:00Z"
    usage_count: 23
usage_window: { from: "2020-07-21T00:00:00Z", to: "2026-09-08T04:02:00Z" }
---

# Daily stand-ups

## Summary

A follow-up to an Agile “pad guile” ramble, this talk presents daily stand-ups as the lowest-hanging-fruit Agile practice for any team, regardless of process maturity, emphasizing regular communication over format. The core idea: each day at the start (as coffee brews, after quickly clearing email) every team member posts what they did yesterday, what they plan to do today (intent, not a binding commitment — carry-over is expected), and blockers they anticipate; the session is quick (≤15 min for seven people in person, ~3 min to write a Slack message), not a status report for a project manager but a team-to-team spark for further 1:1 or small-group conversations.

Examples include the speaker's own Slack update for the Asset Resolution (AR) team (~3–5 people) and the Project Management Task Force (starting, ~10 people), plus a Noemi/Taylor/Mauro Slack snippet, illustrating that meetings preparation belongs in the stand-up but passive attendance does not; AR's `dplyr::left_join` question (`I am blocked because i don't understand the d plier left join function`) exemplifies how a blocker can prompt a teammate to offer pointers, while waiting on Jackson for another section prompts reprioritization. Discussion covers scope (3–7 people ideal, ≤12 max; beyond that split), frequency (try daily, more than couple times a week is still valuable), and placement (early in each person's day, even with distributed US time zones).

The speaker describes copying the same post to multiple Slack channels (e.g., pasting the AR update into both the AR and PM task-force channels) so both audiences see the split of time, with follow-on threading (`@Sarah hey noemie wants me to focus on this today`) for prioritization conflicts across managers. Distinctions between project-based vs. team/skill-based stand-ups (previous job: three project stand-ups + one data-engineers team stand-up) are explored, favoring whichever yields visibility and quick blocker removal (e.g., a mental R question fits a skill-based channel, while inter-project dependency fits a project channel). Escalation guidance: avoid a directors-only blockers channel (directors are often detached and may muddy team focus); instead, the scrum master/project orchestrator surfaces the team-posted blocker (`@noemi can you poke ...`) to directors, keeping the stand-up team-focused. Alternatives (MS Teams vs. Slack) and channel visibility (open, thread conversations) are noted, with encouragement to start with any subset of the practice and grow toward the gold standard (everyone posts yesterday/today/blockers early daily).

## Key Concepts & Tools Taught

- **[daily-standups]:** Daily team sync at start of day (as `stand-up meeting` or `stand-up Slack channel`), low-hanging-fruit Agile practice valuable at any stage; quick updates with no prescribed format beyond content.
- **[yesterday-today-blockers]:** Three prompts: what I did yesterday, what I plan to do today (intent, not stone commitment; carry-over normal), and blockers/anticipated impediments; e.g., `d plier left join function` technical blocker or waiting on a contract/signature or on Jackson's section.
- **[slack-standup]:** Slack (or Teams) asynchronous version: ~3 min to write, 15 min for seven-person meeting; example posts show bullet points per project with carried items; meetings that are passive attendance belong in a calendar, not the stand-up.
- **[project-vs-team-standup]:** Stand-up grouping: project-based (e.g., three project channels) vs. skill/team-based (e.g., data-engineers, `code base`, `bank's channel`); ideal size 3–7, max ~12; speaker copies the same message to two channels (AR + PM task force) and encourages channel visibility so prioritization conflicts can be threaded.
- **[blocker-escalation]:** Handling blockers that only a director/scrum master can resolve: post publicly in the team stand-up, tag the local orchestrator (`@noemi can you poke whoever needs to sign that contract`), let the scrum master/project manager escalate with context rather than tagging directors directly; advice that a directors-only blockers channel is not useful team-wise.

## Code Snippets & Formulas

No R/bot code; Slack/Teams workflow spoken live (caption-mangled, normalized here):

```text
# Stand-up template (Slack message, also works as 15-min meeting)
Yesterday:
- cleared tasks A and B
Today:
- doing C, D and E (intent, not binding)  # "the thing that is in the today section is a intent it is not a binding set in stone commitment"
Blockers:
- I am blocked because i don't understand the d plier left join function  # "i am writing an r function today i am blocked because i don't understand the d plier left join"
- I can't even start on task X until i get a contract signed  # "i can't i can't even start on task x until i get a contract signed"
- waiting on Jackson to write this other section  # "i am waiting on jackson to write this other section"

# Team setup & timing
# Size: 3–7 ideal, definitely no more than a dozen  # "somewhere between three and seven ... if you have a dozen people in a stand-up that's too many"
# When: early in day as coffee brews, after email triage  # "open up my computer as the coffee is brewing check my emails ... then i write my stand up update"
# Delivery: Slack message ~3 min; meeting ~15 min for 7  # "if you are doing this sort of as slack messages it should take about three minutes ... a team of seven ... in and out and done in 15 minutes"

# Multiplier pattern (caption)
# Same post copied to two channels:
# Channel: #asset-resolution (AR tech, 3–5 people keen on AR) + #pm-task-force (10 people)
# Follow-up threading: "@Sarah hey noemie wants me to focus on this today" → prioritize via thread

# Tool notes
# Slack vs Teams vs visible channel: "the stand up channels should be open they should be visible"
# Escalation: "@noemi can you poke whoever needs to sign that contract" — scrum master surfaces to directors, not direct tag
```
