---
name: sdd-setup
description: Use when bootstrapping a new project from this kit — interviews the user for the toolset, writes STACK.md, drafts the PRD-0001 project charter and CLAUDE.md Principles, and records the stack as an ADR. Triggers on "set up the project", "bootstrap", "initialize the kit", or when there is no PRD in docs/prds/.
---

# sdd-setup — bootstrap a new project

Run this once, when a project copied from lean-sdd-kit has no charter yet (no PRD in `docs/prds/*/`).

## Procedure

1. **Detect state.** If `docs/prds/done/0001-EXAMPLE-*` exists, ask the user if you may delete the EXAMPLE PRD/spec; remove them once confirmed.

2. **Interview for the toolset — one question at a time.** Ask, in order, and write answers into `STACK.md`:
   - Languages & runtimes (and versions).
   - Package manager / monorepo tool (or single package).
   - If a monorepo: the package map (name, purpose) — fill the table.
   - The canonical commands: install / build / test / lint / run.
   - Services & infrastructure (db, CI, deploy, external APIs).
   - Tooling conventions (formatters, commit hooks, env files).
   Confirm `STACK.md` reads correctly before moving on.

3. **Draft the charter.** Run `./scripts/new.sh prd project-charter`, then `git mv` it to `docs/prds/doing/`. Interview the user to fill it: problem, target users, goals & metrics, scope, non-goals.

4. **Fill Principles.** In `CLAUDE.md`, complete the project one-liner and add any project-specific principles the user states. Keep the list short.

5. **Record the stack decision.** Run `./scripts/new.sh adr choose-stack` and capture *why* this stack (context, decision, alternatives considered).

6. **Commit** each artifact as you go (`PRD-0001: …`, `ADR-0003: choose stack`, `docs: STACK.md`).

7. **Hand off.** Tell the user: write the first slice of work with `sdd-new spec <slug>`, then `sdd-build` it.

## Rules
- One question at a time. Don't assume the stack — ask.
- Honor the Principles in `CLAUDE.md` and the status protocol (status = directory).
