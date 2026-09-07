#!/usr/bin/env bash
# Nepustí sezení k ukončení, dokud je práce rozdělaná.
#
# PROČ: chyba, které to brání, nastává přesně ve chvíli, kdy by pravidlo platilo —
# v tahu, kde shrnutí vypadá jako přirozené místo, kde skončit. Pokyn tam nepomůže.
#
# KDY PUSTÍ — podle vlastního kritéria, ne po N napomenutích:
#   * rychlé brány čisté (pokrytí požadavků a izolace; testy a determinismus ne,
#     ty jsou pomalé a patří na pull request)
#
# VYPNUTÍ: touch GATES_OFF — vždycky dostupné a vždycky vidět v `git status`.
set -uo pipefail
[ -f GATES_OFF ] && exit 0

reasons=()
bash scripts/gate-requirement-coverage.sh >/dev/null 2>&1 || reasons+=("požadavek bez testu")
bash scripts/gate-isolation.sh            >/dev/null 2>&1 || reasons+=("porušená izolace modulů")

[ ${#reasons[@]} -eq 0 ] && exit 0
printf '{"decision":"block","reason":"Není hotovo: %s"}\n' "$(IFS='; '; echo "${reasons[*]}")"
