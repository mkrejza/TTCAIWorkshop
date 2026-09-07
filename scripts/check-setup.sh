#!/usr/bin/env bash
# Ověří, že tenhle stroj zvládne workshop. Pouštět DEN PŘEDEM, ne ráno.
cd "$(dirname "$0")/.."
ok=0
say() { printf '  %s  %s\n' "$1" "$2"; }
need() {
  if command -v "$1" >/dev/null 2>&1; then say "✓" "$2"; else say "✗" "$2 — chybí"; ok=1; fi
}

echo "Nástroje"
need git    "git"
need node   "node"
need npm    "npm"
need gh     "GitHub CLI (gh)"

echo; echo "Verze"
v="$(node -v 2>/dev/null | tr -d 'v' | cut -d. -f1)"
if [ "${v:-0}" -ge 22 ] 2>/dev/null; then say "✓" "node $(node -v)"
else say "✗" "node musí být 22 nebo vyšší, je $(node -v 2>/dev/null || echo žádný)"; ok=1; fi

echo; echo "Přístupy"
if gh auth status >/dev/null 2>&1; then say "✓" "gh přihlášené"
else say "✗" "gh není přihlášené — spusť 'gh auth login'"; ok=1; fi

echo; echo "Projekt"
if npm test --silent >/dev/null 2>&1; then say "✓" "npm test proběhl"
else say "!" "npm test spadl — na začátku dne je to SPRÁVNĚ (src/ je prázdné)"; fi
if bash scripts/gate.sh >/dev/null 2>&1; then say "✓" "brány prošly"
else say "!" "brány jsou červené — na začátku dne je to SPRÁVNĚ"; fi

echo
if [ "$ok" = 0 ]; then
  echo "Připraveno. Zbývá poslední věc, kterou tenhle skript ověřit nemůže:"
  echo "pusť svůj AI nástroj a nech ho SKUTEČNĚ něco udělat — přihlášení nestačí."
else
  echo "Něco chybí. Vyřeš to DNES, ne ráno před workshopem."
fi
exit "$ok"
