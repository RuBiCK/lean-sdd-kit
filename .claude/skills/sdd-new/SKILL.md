---
name: sdd-new
description: Use when creating a new PRD, spec, or ADR in this kit — scaffolds the next-numbered document from the template into backlog/ and helps fill it. Triggers on "new spec", "start a feature", "new PRD", "new initiative", "record a decision / new ADR".
---

# sdd-new — scaffold a new PRD / spec / ADR

Creates the next-numbered document and helps fill it. Wraps `scripts/new.sh` so there is no command to memorize.

## Procedure

1. **Pick the kind:**
   - Small feature → a **spec** (its header carries the "why"; `prd: none`).
   - Larger initiative spanning multiple specs → a **PRD** first, then specs that link to it.
   - A non-obvious or hard-to-reverse choice → an **ADR**.

2. **Scaffold:** run `./scripts/new.sh <prd|spec|adr> <slug>`. It creates the next ID in `backlog/` (PRD/spec) or `docs/adr/` (ADR).

3. **For a spec, ground it in the real stack.** Read `STACK.md`. Ask the user which **packages** this spec touches and set `packages: [...]` in the frontmatter. Use the actual commands from `STACK.md` in the **Verification** section — don't invent them.

4. **Fill the body** with the user (one question at a time when unclear). A spec must end with executable **Tasks → Acceptance criteria → Verification**.

5. **Commit:** `git add <file> && git commit -m "<ID>: <slug>"`.

6. **Hand off:** when the spec is ready, suggest `sdd-build` to pick it up.

## Rules
- Never hand-pick an ID — let the script auto-increment so IDs stay unique.
- A spec is only "ready" when its acceptance criteria are objectively pass/fail and its verification commands are real.
