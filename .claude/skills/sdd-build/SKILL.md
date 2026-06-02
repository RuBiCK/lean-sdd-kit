---
name: sdd-build
description: Use when picking up a spec to implement it end-to-end in this kit — moves it to doing/, builds it test-first via the builder subagent, reviews it via the read-only reviewer subagent, verifies, and promotes to done/. Triggers on "pick up SPEC-NNNN", "build the next spec", "implement this spec", "work on the backlog".
---

# sdd-build — pick up a spec and ship it

Orchestrates the BUILD half of the workflow (Plan → Integrate) by dispatching tuned subagents.

## Procedure

1. **Select the spec.** If none named, list `docs/specs/backlog/` and ask which to pick. Respect **WIP ≤ 2** in `docs/specs/doing/` — if full, stop and say so.

2. **Read the rules.** Load `CLAUDE.md` (principles, Definition of Done), `WORKFLOW.md`, `STACK.md` (commands), and the spec itself. If the spec links a PRD, read it too.

3. **Start work.** `git mv docs/specs/backlog/NNNN-*.md docs/specs/doing/` and create branch `spec/NNNN-slug`. Commit the move.

4. **Plan.** Expand the spec's **Tasks** into an ordered, bite-sized checklist if needed.

5. **Build — dispatch the `builder` subagent** with the spec path. It implements task-first/test-first, ticking tasks and committing per task (`SPEC-NNNN: <task>`).

6. **Review — dispatch the `reviewer` subagent** (read-only) with the spec + its PRD. It must confirm: every acceptance criterion met, **verification commands run and passed**, and the result still satisfies the PRD (coherence check). If it reports issues, loop back to step 5.

7. **Integrate.** Open a PR (title references the spec; body lists acceptance criteria as a checklist). On merge: `git mv docs/specs/doing/NNNN-*.md docs/specs/done/`. If all of the parent PRD's child specs are now in `done/`, `git mv` the PRD to `done/` too.

## Rules
- Do not mark anything done on assumption — the reviewer's verification output is the evidence (Definition of Done in `CLAUDE.md`).
- The reviewer is read-only by design; it diagnoses, the builder fixes.
- Keep commits scoped to the spec; one branch per spec even across multiple packages.
