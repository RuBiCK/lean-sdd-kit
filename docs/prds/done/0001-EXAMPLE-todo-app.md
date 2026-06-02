---
id: PRD-0001
title: EXAMPLE — Minimal todo app
owner: Jane
created: 2026-06-02
specs: [SPEC-0001]
---

# PRD-0001 — EXAMPLE — Minimal todo app

> ⚠️ **This is a worked example.** Delete it (and `SPEC-0001`) when you start your real project.
> It shows what a finished, shipped initiative looks like in `done/`.

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
