---
id: ADR-0002
title: Directory-based status (filesystem kanban)
status: accepted
date: 2026-06-02
---

# ADR-0002 — Directory-based status (filesystem kanban)

## Status
accepted

## Context
PRDs and specs have a lifecycle (ready → in progress → shipped). We need to track that state
for a 1–3 person team without standing up a board (Jira/Linear/Trello) or maintaining a
`status:` field inside each document. A status *field* drifts: people forget to update it, and
it can disagree with reality. We want one source of truth that's visible at a glance and lives
in version control.

## Decision
**The directory a document lives in is its status.** PRDs and specs live under
`docs/prds/<state>/` and `docs/specs/<state>/` where `<state>` is one of `backlog/`, `doing/`,
or `done/`. State changes are performed with `git mv`, so they are atomic, reviewable in a diff,
and timestamped by the commit. Each document keeps a **permanent zero-padded ID** in its
filename (`0002-auth.md`) that never changes when it moves. WIP is capped at **≤ 2** items in
`doing/`. ADRs are exempt — they are an append-only log, not flowing work.

## Consequences
- **Good:** `ls docs/specs/doing/` is the standup. No second tool, no drift, no API.
- **Good:** history of state changes is free — it's in `git log --follow`.
- **Good:** works identically for a monorepo with a single root kanban.
- **Bad / cost:** no automatic board UI, no cross-repo rollups, no WIP enforcement beyond
  discipline. Acceptable at this team size.
- **Follow-ups:** `scripts/new.sh` scaffolds the next ID into `backlog/`.

## Alternatives considered
- **`status:` frontmatter field** — drifts from reality; requires a tool to visualize.
- **External tracker (Jira/Linear)** — overhead and context-switching for a 1–3 person team;
  separates intent from the code that fulfills it.
- **Git branches as state** — invisible until you run git; doesn't represent a backlog.
