#!/usr/bin/env bash
# BRÁNA: každý požadavek ověřovaný testem musí mít test, který se na něj odvolává.
# Bez toho registr tvrdí něco, co nikdo neověřuje.
set -uo pipefail
cd "$(dirname "$0")/.."
missing=0
while IFS='|' read -r _ id _ verif _; do
  id="$(echo "$id" | tr -d ' ')"; verif="$(echo "$verif" | tr -d ' ')"
  [[ "$id" =~ ^REC-[0-9]{3}$ ]] || continue
  [ "$verif" = "T" ] || continue
  if ! grep -rq "$id" tests/ 2>/dev/null; then
    echo "   $id je v registru ověřován testem, ale žádný test se na něj neodvolává"
    missing=1
  fi
done < POZADAVKY.md
exit "$missing"
