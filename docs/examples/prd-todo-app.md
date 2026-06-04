---
id: PRD-0001
title: EXAMPLE — Minimal todo app
owner: Jane
created: 2026-06-02
specs: [SPEC-0001]
---

# PRD-0001 — EXAMPLE — Minimal todo app

> ⚠️ **Worked example** — lives in `docs/examples/`, outside the kanban, so it doesn't affect ID
> numbering. Read it with `spec-add-list-complete-tasks.md` to see a finished PRD + its child spec,
> then delete `docs/examples/` when you no longer need the reference.

## Problem / why now
People juggling small tasks across sticky notes lose track of them. We want the smallest
possible web app that lets one person capture and check off tasks, as a v1 to validate the
workflow end-to-end.

## Target users
A single user managing their own personal task list.

## Goals & success metrics
- A user can add, list, and complete a task — measured by all acceptance criteria in SPEC-0001 passing.
- The whole thing ships in one spec — measured by a single merged PR.

## Scope (in)
- Add a task, list tasks, mark a task done.

## Non-goals (out)
- Accounts, sharing, due dates, persistence beyond a single store, mobile apps.

## Constraints & assumptions
- Stack-agnostic example; assume a single web package `apps/web`.

## Approach summary
One thin vertical slice: a form + a list + an in-memory store. See ADR-0002 for how we tracked it.

## Child specs
- [x] SPEC-0001 — Add/list/complete tasks

## Open questions
- (resolved) None — scope deliberately tiny.
