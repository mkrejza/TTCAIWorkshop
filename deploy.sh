#!/usr/bin/env bash
# Vydání: povýší verzi, commitne, označkuje, odešle. Značka spustí pipeline.
#
# Použití: ./deploy.sh app "shrnutí změny" "1.4.0"
#
# Zábradlí níž jsou tatáž jako v ostrém repozitáři. Cvičný projekt má jediný artefakt,
# takže se argument zdá zbytečný — je tu proto, aby bylo vidět pravidlo: VERZE JSOU
# PO ARTEFAKTECH. Jedna verze na repozitář by hnala MAJOR firmwaru při každé změně webu.
set -euo pipefail

ARTEFACT="${1:-}"; COMMENT="${2:-}"; VERSION="${3:-}"

if [ -z "$ARTEFACT" ] || [ -z "$COMMENT" ] || [ -z "$VERSION" ]; then
  echo "Použití: $0 <artefakt> \"shrnutí\" \"1.4.0\"" >&2; exit 1
fi
case "$ARTEFACT" in app) ;; *)
  echo "Chyba: neznámý artefakt \"$ARTEFACT\". Tenhle projekt má jediný: app" >&2; exit 1 ;;
esac

# Skript si "v" přidá sám při značkování. Předané "v1.4.0" jednou vyrobilo značku
# "vv1.4.0" A zapsalo "v1.4.0" do manifestu, což není platná verze. Nejednoznačnost se
# ODMÍTÁ — tiché uříznutí "v" by tutéž chybu schovalo i ve jméně značky.
if [[ "$VERSION" == v* ]]; then
  echo "Chyba: verze nesmí začínat \"v\" — dostal jsem \"$VERSION\"." >&2
  echo "       Značka by byla \"v$VERSION\" a v manifestu by stála neplatná verze." >&2
  echo "       Spusť znovu s: \"${VERSION#v}\"" >&2
  exit 1
fi

# Musí to vůbec být verze. Omylem předaná zpráva commitu by se jinak stala značkou
# i hodnotou v manifestu.
if ! [[ "$VERSION" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "Chyba: \"$VERSION\" nevypadá jako verze (čekám např. 1.4.0)." >&2; exit 1
fi

# Vydání ze špinavého stromu odešle to, co v repozitáři není.
if [ -n "$(git status --porcelain)" ]; then
  echo "Chyba: pracovní strom není čistý. Nejdřív commitni nebo odlož." >&2; exit 1
fi

TAG="$ARTEFACT-v$VERSION"
if git rev-parse "$TAG" >/dev/null 2>&1 || git ls-remote --exit-code --tags origin "$TAG" >/dev/null 2>&1; then
  echo "Chyba: značka $TAG už existuje." >&2
  echo "       Značka se NIKDY nepřesouvá — vydej další patch." >&2
  echo "       Přesunutá značka udělá z artefaktu něco, co nikdo nesestaví znovu." >&2
  exit 1
fi

# Brány musí být zelené. Vydání červeného stavu je horší než nevydat nic.
bash scripts/gate.sh || { echo "Chyba: brány neprošly, nevydávám." >&2; exit 1; }

node -e '
  const fs=require("fs"), p=JSON.parse(fs.readFileSync("package.json","utf8"));
  p.version=process.argv[1]; fs.writeFileSync("package.json",JSON.stringify(p,null,2)+"\n");
' "$VERSION"

git add package.json
git commit -m "release($ARTEFACT): $VERSION — $COMMENT"
git tag -a "$TAG" -m "$COMMENT"
# Odeslání může selhat na síti nebo oprávnění. Kdyby se to nechalo být, zůstane
# lokálně značka, která nikdy neodešla — a další pokus ji odmítne jako existující,
# přestože se nic nevydalo.
if ! git push origin HEAD "$TAG"; then
  echo >&2
  echo "Chyba: odeslání selhalo. Vracím značku a commit, aby šlo zkusit znovu." >&2
  git tag -d "$TAG" >/dev/null
  git reset --hard HEAD~1 >/dev/null
  echo "       Stav je jako před spuštěním. Vyřeš přístup a pusť ./deploy.sh znovu." >&2
  exit 1
fi

echo "Vydáno: $TAG. Sleduj pipeline až do konce — odesláním to nekončí."
