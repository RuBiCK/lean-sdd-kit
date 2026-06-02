# STACK.md — project toolset

> The single source of truth for **what this project is built with and how to run it**.
> Filled once at setup (the `sdd-setup` skill interviews you), updated when the stack changes.
> `CLAUDE.md` and every spec's **Verification** section point here for commands.

## Languages & runtimes
<!-- e.g. TypeScript 5.x on Node 20; Python 3.12 -->
- <language / version>

## Package manager & monorepo tool
<!-- e.g. pnpm workspaces + turborepo; or "single package, no monorepo tool" -->
- <tool>

## Packages (monorepo map)
<!-- One row per package/app. Omit if single-package. Specs reference these in `packages:`. -->

| Package | Purpose | Notable commands |
|---|---|---|
| `apps/web` | <web frontend> | `pnpm --filter apps/web dev` |
| `packages/api` | <backend/api> | `pnpm --filter packages/api start` |

## Commands
<!-- The canonical commands. These are what "Verification" and the Definition of Done run. -->

```bash
# install
<install>            # e.g. pnpm install
# build
<build>             # e.g. pnpm -r build
# test  (source of truth for "done")
<test>              # e.g. pnpm -r test
# lint / format
<lint>             # e.g. pnpm -r lint
# run locally
<run>              # e.g. pnpm dev
```

## Services & infrastructure
<!-- Databases, queues, CI, deploy target, third-party APIs. Link ADRs for the choices. -->
- <e.g. Postgres (see ADR-0003), GitHub Actions CI, Fly.io deploy>

## Tooling conventions
<!-- Anything an agent must know to not break the build: formatter, commit hooks, env files. -->
- <e.g. Prettier + ESLint enforced on commit; copy `.env.example` to `.env`>
