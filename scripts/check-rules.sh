#!/usr/bin/env bash
# Checks that every one of the five Jinx categories is present in the rules
# as a numbered entry, e.g. "1. JINX!". Exits non-zero if any are missing.
set -euo pipefail

RULES_FILE="${1:-The_Rules.md}"
CATEGORIES=(JINX JONX JUNX JENX JANX)

if [[ ! -f "$RULES_FILE" ]]; then
  echo "✗ $RULES_FILE not found" >&2
  exit 1
fi

missing=0
for word in "${CATEGORIES[@]}"; do
  # A numbered list item whose text is the category, "!" optional, any case.
  if grep -Eqi "^[[:space:]]*[0-9]+\.[[:space:]]+\**${word}!?\**[[:space:]]*$" "$RULES_FILE"; then
    echo "✓ $word"
  else
    echo "✗ $word is missing from $RULES_FILE" >&2
    missing=1
  fi
done

if (( missing )); then
  echo "Rules check failed: all five categories must be present." >&2
  exit 1
fi
echo "All five categories present."
