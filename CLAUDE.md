# CLAUDE.md — agent operating guide

> This file is the standing contract for any human or AI agent working in this repo.
> Read it, and [`WORKFLOW.md`](./WORKFLOW.md), at the start of every session.

## Project

<!-- ONE sentence: what this project is and who it's for. Replace this. -->
`<project-name>` — <one-line description>.

## Principles (the constitution)

These govern **every** PRD, spec, and line of code. They outrank convenience.

1. **Intent before code.** No implementation begins without an approved spec. The spec is the contract; if reality diverges, update the spec, don't drift.
2. **Lean by default.** YAGNI. The smallest thing that satisfies the acceptance criteria wins. Delete before you add.
3. **Status is the filesystem.** A document's directory is its status. Never add a `status:` field — move the file with `git mv`.
4. **Specs are executable.** Every spec ends in tasks → acceptance criteria → verification commands an agent can run unattended.
5. **Decisions are logged, not remembered.** Any non-obvious or hard-to-reverse choice becomes an ADR. Append-only; supersede, never delete.
6. **Small, isolated units.** One clear purpose per module/file. If a file is hard to hold in your head, it's doing too much.
7. **Verify before you claim done.** "Done" means the verification commands were run and passed — not "should work".

<!-- Add project-specific principles below. Keep the list short. -->

## Where things live (doc map)

| Need | Path |
|---|---|
| Why/what of an initiative (PRD) | `docs/prds/<state>/NNNN-slug.md` |
| How — the unit of work (spec) | `docs/specs/<state>/NNNN-slug.md` |
| Why we chose X (ADR) | `docs/adr/NNNN-slug.md` (append-only) |
| The rules (this file) | `CLAUDE.md` |
| The toolset & commands | `STACK.md` |
| The process | `WORKFLOW.md` |

States: `backlog/` (ready) · `doing/` (in progress) · `done/` (shipped).

## Status protocol

- Promote work by moving the file: `git mv docs/specs/backlog/0002-x.md docs/specs/doing/`.
- The numeric ID (`0002`) is **permanent**; only the directory changes.
- **WIP limit: ≤ 2 items in `doing/`** across the repo. Finish before you start.
- A PRD moves to `done/` only when all of its child specs are in `done/`.

## Definition of Done

A spec is `done` only when **all** are true:

- [ ] Every task in the spec is checked off.
- [ ] Every acceptance criterion is met.
- [ ] The spec's **Verification** commands were run and passed (paste/observe output — don't assume).
- [ ] Tests cover the new behavior (see TDD in `WORKFLOW.md`).
- [ ] Any non-obvious decision made along the way is captured as an ADR.
- [ ] The spec (and its PRD, if all siblings are done) has been `git mv`'d to `done/`.

## Commands

The canonical build/test/lint/run commands and the monorepo package map live in
**[`STACK.md`](./STACK.md)** — the single source of truth for tooling. Specs' **Verification**
sections and the Definition of Done run those commands. Fill `STACK.md` at setup (the
`sdd-setup` skill interviews you); don't duplicate commands here.

## Conventions

- **Branches:** `spec/NNNN-slug` (one branch per spec).
- **Commits:** imperative, reference the spec ID — `SPEC-0002: add login form`. Commit per task where it makes sense.
- **PRs:** title references the spec; body links the spec file and lists acceptance criteria as a checklist.
- **File size:** if a file grows past what you can reason about at once, split it.
- **Tests:** new behavior ships with tests. Prefer test-first (red → green → refactor).

## Monorepo notes

- One root `docs/` kanban for the whole repo — see all WIP at once.
- A spec declares affected packages in frontmatter: `packages: [apps/web, packages/api]`.
- Repo-wide choices → root ADRs. A package may keep its own `CLAUDE.md` for local conventions, but it must **defer to this file** for principles and status rules.

## Automation (Claude Code adapter)

This kit ships an optional `.claude/` layer that travels with the repo:

- **Skills** (`.claude/skills/`): `sdd-setup` (bootstrap: interview for the stack → `STACK.md` + charter), `sdd-new` (scaffold the next PRD/spec/ADR), `sdd-build` (pick up a spec → build → review → promote).
- **Subagents** (`.claude/agents/`): `spec-writer`, `builder` (test-first), `reviewer` (read-only). `sdd-build` dispatches these so each task runs in a focused, tool-scoped context.

Using a different agent tool? Ignore `.claude/` — the docs and `scripts/new.sh` work standalone.

## Next

For the step-by-step loop (when each document is created, when you commit / open a PR, and how docs move between states), read [`WORKFLOW.md`](./WORKFLOW.md).
