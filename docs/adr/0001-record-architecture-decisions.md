---
id: ADR-0001
title: Record architecture decisions
status: accepted
date: 2026-06-02
---

# ADR-0001 — Record architecture decisions

## Status
accepted

## Context
On a small, fast-moving team — especially one working with AI agents — the *reasoning*
behind a choice is lost almost immediately. Weeks later, nobody (human or agent) remembers
why a library, pattern, or boundary was chosen, so it gets second-guessed or silently
violated. We need a durable, low-ceremony record.

## Decision
We will capture every non-obvious or hard-to-reverse decision as an **Architecture Decision
Record (ADR)** in `docs/adr/NNNN-slug.md`, using the template in `_TEMPLATE.md`. ADRs are an
**append-only log**: once accepted, an ADR is never edited in substance — a later ADR
supersedes it, and the old one's status is updated to point forward.

## Consequences
- **Good:** the "why" survives; agents can read decisions and respect them.
- **Good:** ADRs don't need a status workflow — they don't flow through `backlog/doing/done`.
- **Bad / cost:** a small discipline tax — you must write the ADR when you decide.
- **Follow-ups:** reference relevant ADRs from specs and PRDs.

## Alternatives considered
- **Decisions in commit messages** — not discoverable; lost in history.
- **A wiki/Notion page** — drifts from the code, needs a second tool, easy to forget.
