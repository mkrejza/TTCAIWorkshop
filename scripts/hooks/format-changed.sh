#!/usr/bin/env bash
# Formátuje jen to, na co se sáhlo.
#
# PROČ NE CELÝ STROM: formátovač pouštěný přes všechno udělá z třířádkové změny
# tisícřádkový diff a recenzent přestane hledat chyby a začne rolovat.
set -uo pipefail
files=$(git diff --name-only --diff-filter=ACM 2>/dev/null; git diff --cached --name-only --diff-filter=ACM 2>/dev/null)
[ -z "$files" ] && exit 0
echo "$files" | sort -u | while read -r f; do
  [ -f "$f" ] || continue
  case "$f" in
    *.mjs|*.js|*.json|*.yml|*.yaml) npx --yes prettier --write "$f" >/dev/null 2>&1 || true ;;
  esac
  # Syntaktická chyba se má ozvat hned, ne až v CI.
  case "$f" in *.mjs|*.js) node --check "$f" 2>&1 | head -3 ;; esac
done
exit 0
