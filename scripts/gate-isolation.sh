#!/usr/bin/env bash
# BRÁNA: příjem a segmentace nesmí znát zobrazení.
# Jakmile parser sáhne na graf, nejde ani jedno testovat samostatně.
set -uo pipefail
cd "$(dirname "$0")/.."
for d in src/ingest src/segments; do
  [ -d "$d" ] || { echo "   adresář $d neexistuje — brána nemá co kontrolovat"; exit 1; }
done
bad="$(grep -rn "from ['\"].*view" src/ingest src/segments 2>/dev/null || true)"
if [ -n "$bad" ]; then
  echo "   ingest/ ani segments/ nesmí importovat z view/:"
  echo "$bad" | sed 's/^/     /'
  exit 1
fi
exit 0
