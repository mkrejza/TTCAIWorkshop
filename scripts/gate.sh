#!/usr/bin/env bash
# Pustí tytéž blokující brány co CI, ve stejném pořadí.
# Hlásí, KTERÁ brána a CO tvrdí — ne surový výstup nástroje.
set -uo pipefail
cd "$(dirname "$0")/.."
fail=0

run() {
  printf '\n── %s ──\n' "$1"
  if eval "$2"; then printf '   ✓ prošla\n'; else printf '   ✗ SPADLA\n'; fail=1; fi
}

# POŘADÍ JE TOTOŽNÉ S ci.yml. Kdyby se lišilo, dostane vývojář lokálně zelenou
# a v CI mu to spadne — přesně ta falešná jistota, před kterou tenhle postup varuje.
run "pokrytí požadavků" 'bash scripts/gate-requirement-coverage.sh'
run "izolace modulů"    'bash scripts/gate-isolation.sh'
run "testy"             'npm test --silent >/dev/null 2>&1'
run "determinismus"     'bash scripts/gate-determinism.sh'
run "dvojí důkaz"       'bash scripts/gate-negative-proof.sh'
printf '\n'
[ "$fail" = 0 ] && echo "Všechny brány prošly." || echo "Alespoň jedna brána spadla — merge není možný."
exit "$fail"
