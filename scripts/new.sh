#!/usr/bin/env bash
# new.sh — scaffold the next-numbered PRD, spec, or ADR from its template.
#
# Usage:
#   ./scripts/new.sh spec <slug>     # → docs/specs/backlog/000N-<slug>.md
#   ./scripts/new.sh prd  <slug>     # → docs/prds/backlog/000N-<slug>.md
#   ./scripts/new.sh adr  <slug>     # → docs/adr/000N-<slug>.md
#
# The ID is auto-incremented per type. Status starts in backlog/ (prd, spec).
# Pure bash + coreutils — no dependencies. Stack-agnostic.

set -euo pipefail

KIND="${1:-}"
SLUG="${2:-}"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"

if [[ -z "$KIND" || -z "$SLUG" ]]; then
  echo "usage: $0 <prd|spec|adr> <slug>" >&2
  exit 1
fi

case "$KIND" in
  spec) DIR="$ROOT/docs/specs"; DEST="$DIR/backlog"; PREFIX="SPEC" ;;
  prd)  DIR="$ROOT/docs/prds";  DEST="$DIR/backlog"; PREFIX="PRD"  ;;
  adr)  DIR="$ROOT/docs/adr";   DEST="$DIR";         PREFIX="ADR"  ;;
  *) echo "unknown kind: $KIND (use prd|spec|adr)" >&2; exit 1 ;;
esac

# Find the highest existing NNNN across all states for this kind.
last=$(find "$DIR" -name '[0-9][0-9][0-9][0-9]-*.md' -exec basename {} \; 2>/dev/null \
        | grep -oE '^[0-9]{4}' | sort -n | tail -1 || true)
next=$(printf "%04d" $(( 10#${last:-0} + 1 )))

slug=$(echo "$SLUG" | tr '[:upper:] ' '[:lower:]-' | tr -cd 'a-z0-9-')
file="$DEST/$next-$slug.md"
today=$(date +%Y-%m-%d)

mkdir -p "$DEST"
sed -e "s/NNNN/$next/g" -e "s/<YYYY-MM-DD>/$today/g" "$DIR/_TEMPLATE.md" > "$file"

echo "created $file"
echo "  → edit it, then: git add '$file' && git commit -m '$PREFIX-$next: $slug'"
