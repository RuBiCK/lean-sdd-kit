---
id: SPEC-NNNN
title: <short title>
prd: <PRD-NNNN or "none">     # parent PRD, or "none" for a standalone small feature
packages: []                  # monorepo packages touched, e.g. [apps/web, packages/api]
created: <YYYY-MM-DD>
---

# SPEC-NNNN — <title>

> **Status = directory** (`backlog/ → doing/ → done/`), moved with `git mv`.
> This spec is written to be **executed by an agent**: the sections below give it a
> contract, a task list, and a way to prove it's done.

## Context & Goal
<The "why" in 2–4 sentences. For a standalone feature this is its mini-PRD.
For a child spec, summarize and link the parent: see PRD-NNNN.>

## Scope / Non-goals
- **In:** <what this spec delivers>
- **Out:** <what it deliberately does not touch>

## Design / approach
<Brief. Key files/modules to create or change, data shapes, interfaces, edge cases.
Keep units small and single-purpose. Link any ADR that governs a choice here.>

## Tasks
<Bite-sized, ordered, independently checkable. The agent ticks these as it goes.>

- [ ] <Task 1 — small enough to do and verify in one sitting>
- [ ] <Task 2>
- [ ] <Task 3>

## Acceptance criteria
<Testable, observable outcomes. "Done" means all of these are true.>

- [ ] <Criterion 1 — phrased so it can pass/fail objectively>
- [ ] <Criterion 2>

## Verification
<The EXACT commands an agent runs to prove the work. Paste/observe the output.>

```bash
<test cmd for the touched packages>     # e.g. pnpm --filter apps/web test
<lint cmd>
<any manual check, e.g. curl an endpoint and expect 200>
```

## Risks / open questions
- <What could go wrong, or anything still unknown.>
