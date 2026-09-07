#!/usr/bin/env bash
# BRÁNA: dvojí důkaz. Pravidlo se vědomě poruší a test MUSÍ spadnout.
# Test, který projde i po porušení pravidla, neověřuje nic — a zelená pak nic neznamená.
set -uo pipefail
cd "$(dirname "$0")/.."
f=src/ingest/dedupe.mjs
[ -f "$f" ] || { echo "   $f zatím neexistuje — bránu nelze spustit"; exit 1; }

cp "$f" "$f.orig"
trap 'mv -f "$f.orig" "$f"' EXIT

# Deduplikace se nahradí průchozí funkcí: nic se nezahazuje.
cat > "$f" <<'STUB'
// DOČASNÁ SABOTÁŽ pro bránu dvojího důkazu – originál se vrátí po doběhnutí.
export function dedupe(samples) { return samples; }
STUB

if npm test --silent >/dev/null 2>&1; then
  echo "   deduplikace byla vypnuta a testy PŘESTO prošly — REC-002 nikdo neověřuje"
  exit 1
fi
exit 0
