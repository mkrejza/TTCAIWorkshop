#!/usr/bin/env bash
# Spouští testy.
#
# PROČ TENHLE OBAL: `node --test tests/` nad prázdným adresářem vypíše výpis zásobníku
# s MODULE_NOT_FOUND. Je to první příkaz, který každý účastník pustí — a vypadalo by to
# jako rozbitý balík, ne jako správný výchozí stav.
set -uo pipefail
cd "$(dirname "$0")/.."

if ! compgen -G "tests/*.test.mjs" >/dev/null; then
  echo "Zatím tu není žádný test — v tests/ je jen README."
  echo "Na začátku dne je to správný stav: aplikaci teprve postavíme."
  exit 1
fi
# POZOR: `node --test tests/` na Node 22 selže — adresář si vyloží jako modul.
# Musí se předat soubory.
exec node --test tests/*.test.mjs
