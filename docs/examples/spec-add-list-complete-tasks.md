---
id: SPEC-0001
title: EXAMPLE — Add, list, and complete tasks
prd: PRD-0001
packages: [apps/web]
created: 2026-06-02
---

# SPEC-0001 — EXAMPLE — Add, list, and complete tasks

> ⚠️ **Worked example** — lives in `docs/examples/`, outside the kanban. Shows a completed,
> agent-executable spec (the *Tasks → Acceptance → Verification* shape). Delete `docs/examples/`
> when you no longer need the reference.

## Context & Goal
Deliver the v1 vertical slice of the todo app (see PRD-0001): a user can add a task,
see the list, and mark a task complete. Smallest thing that proves the workflow.

## Scope / Non-goals
- **In:** add task, render list, toggle complete; in-memory store.
- **Out:** persistence, accounts, editing, deletion.

## Design / approach
- `apps/web/src/store.ts` — a tiny in-memory `TaskStore` (`add`, `list`, `complete`).
- `apps/web/src/TaskList.tsx` — form + list, wired to the store.
- Keep store UI-agnostic so it can be tested without rendering.

## Tasks
- [x] Create `TaskStore` with `add(title)`, `list()`, `complete(id)`.
- [x] Render a form that calls `add` and clears on submit.
- [x] Render the list; clicking a task calls `complete` and strikes it through.

## Acceptance criteria
- [x] Adding a task makes it appear in the list.
- [x] Completing a task visually marks it done and persists for the session.
- [x] The store has unit tests for add / list / complete.

## Verification
```bash
pnpm --filter apps/web test     # store + component tests pass
pnpm --filter apps/web lint
pnpm --filter apps/web dev      # manual: add a task, complete it, see it strike through
```

## Risks / open questions
- (resolved) In-memory store loses data on refresh — acceptable for v1 per PRD-0001 non-goals.
