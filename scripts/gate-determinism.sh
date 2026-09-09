#!/usr/bin/env bash
# BRÁNA: výsledek nezávisí na pořadí vzorků a načtení dvakrát dá totéž (REC-003, REC-008).
# Tohle je ta vlastnost, kterou z kódu nikdo nevykouká.
set -uo pipefail
cd "$(dirname "$0")/.."
[ -f src/cli.mjs ] || { echo "   src/cli.mjs zatím neexistuje — bránu nelze spustit"; exit 1; }
# Chybový výstup Node se zahazuje ZÁMĚRNĚ. Na začátku dne `src/` ještě nemá moduly
# a `cli.mjs` skončí výpisem zásobníku — první příkaz dne by pak vypadal jako rozbitý
# balík. Brána hlásí, CO neplatí, ne surový výstup nástroje.
bez_kodu="   aplikace zatím nedoběhne — brána začne platit, až bude co spustit"
a="$(node src/cli.mjs oracle/fixtures/01-clean.json 2>/dev/null)"    || { echo "$bez_kodu"; exit 1; }
b="$(node src/cli.mjs oracle/fixtures/04-shuffled.json 2>/dev/null)" || { echo "$bez_kodu"; exit 1; }
c="$(node src/cli.mjs oracle/fixtures/01-clean.json 2>/dev/null)"
if [ "$a" != "$b" ]; then echo "   přeházený vstup dal jiný výsledek než setříděný"; exit 1; fi
if [ "$a" != "$c" ]; then echo "   dvě načtení téhož souboru dala různý výsledek"; exit 1; fi
exit 0
