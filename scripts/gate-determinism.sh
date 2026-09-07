#!/usr/bin/env bash
# BRÁNA: výsledek nezávisí na pořadí vzorků a načtení dvakrát dá totéž (REC-003, REC-008).
# Tohle je ta vlastnost, kterou z kódu nikdo nevykouká.
set -uo pipefail
cd "$(dirname "$0")/.."
[ -f src/cli.mjs ] || { echo "   src/cli.mjs zatím neexistuje — bránu nelze spustit"; exit 1; }
a="$(node src/cli.mjs oracle/fixtures/01-clean.json)"    || { echo "   běh spadl"; exit 1; }
b="$(node src/cli.mjs oracle/fixtures/04-shuffled.json)" || { echo "   běh spadl"; exit 1; }
c="$(node src/cli.mjs oracle/fixtures/01-clean.json)"
if [ "$a" != "$b" ]; then echo "   přeházený vstup dal jiný výsledek než setříděný"; exit 1; fi
if [ "$a" != "$c" ]; then echo "   dvě načtení téhož souboru dala různý výsledek"; exit 1; fi
exit 0
