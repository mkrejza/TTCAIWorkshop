# Cvičný projekt workshopu · Přehrávač záznamů

**Verze 1.1**

Stránka v prohlížeči, která z načteného souboru měření ukáže **seznam úseků**
a **graf hodnoty v čase**. Bez serveru, bez databáze, čistý JavaScript.

Projekt **není hotový a hotový být nemá** — sál ho postaví během workshopu.
Připravené je to, co se za běhu nestíhá:

| Soubor | Co v něm je |
|---|---|
| `ZADANI.md` | Produktové zadání, včetně dvou nedořečených míst |
| `POZADAVKY.md` | Registr požadavků REC-001 až REC-009 |
| `oracle/` | Záznamy s ručně ověřeným očekávaným výstupem |
| `scripts/` | Čtyři brány |
| `.github/workflows/ci.yml` | Pipeline — brány při každém pull requestu |
| `.github/workflows/staging.yml` | **Staging**: po sloučení do `main` se stav vystaví na Pages, sám |
| `.github/workflows/release-please.yml` | **Pull request s vydáním**: příští verze a changelog z commitů, nikdo verzi nepíše |
| `.github/workflows/release.yml` | **Vydání**: po sloučení pull requestu s vydáním, brány běží znovu |
| `release-please-config.json` | Artefakt `app` a značka `app-v<verze>` |
| `scripts/check-setup.sh` | Ověření stroje **den předem** |
| `scripts/test.sh` | Obal nad `node --test`; nad prázdným `tests/` řekne proč, místo výpisu zásobníku |
| `src/` | **Prázdné.** Sem to napíše sál |
| `.claude/commands/` | Postupy `/gate`, `/breakdown`, `/review`, `/report`, `/docs-check`, `/deploy` |
| `.claude/settings.json` | Hooky — **vynucení, ne rada**: formátování dotčených souborů, zákaz nebezpečných příkazů, zábrana proti ukončení sezení nad rozdělanou prací |
| `CLAUDE.md` | Co v tomhle repozitáři platí při každé změně a co se nedělá nikdy |
| `.github/CODEOWNERS` | Směrování review — `oracle/` vlastní ten, kdo nepíše kód |
| `.mcp.json`, `infra/mcp/` | Napojení na evidenci práce pod **služebním** účtem |

## Spuštění

```bash
npm test                  # testy
bash scripts/gate.sh      # všechny brány, tytéž co v CI
python3 -m http.server 8080   # aplikace na http://localhost:8080/src/
```

Konfigurace se pro cvičení nepíše nová — je to **totéž nastavení, co pojede v produkci**,
jen bez toho, co tenhle projekt nemá. Postupy v `.claude/commands/` jsou zkrácené verze
těch z `example/`; **zkrácené proto, že tu není firmware ani mobilní aplikace, ne proto,
že by na cvičení platila mírnější pravidla.**

## Sloučeno ≠ vydáno

| | Staging | Vydání |
|---|---|---|
| Spustí | sloučení do `main` | **sloučení pull requestu s vydáním** |
| Vznikne | adresa s aktuálním stavem | **verze, ke které se lze vrátit** |
| Pouští | nikdo, běží samo | člověk sloučením, `/deploy` ho provede |

**Brány běží podruhé, nad označkovaným commitem.** Že prošly na hlavní větvi neznamená,
že prošly nad tím, co se právě vydává.

**Verzi nikdo nepíše.** Odvozuje se z Conventional Commits (`fix` → PATCH, `feat` →
MINOR, `feat!` → MAJOR) a release-please ji spolu s changelogem drží v **pull requestu
s vydáním**. `/deploy` ho najde, vysvětlí, který commit verzi zvedl, a nechá ho sloučit
člověkem. **Nesedí-li verze, opravuje se commit, ne číslo.**

**Předpoklad ve vaší kopii repozitáře:** *Settings → Actions → General → Workflow
permissions → Allow GitHub Actions to create and approve pull requests.* Bez toho
release-please pull request s vydáním nezaloží.

Cvičný projekt má jediný artefakt, takže se otázka na artefakt zdá zbytečná. **Zeptá se
stejně** — a je to dobrá příležitost říct proč: v ostrém repozitáři jsou verze po
artefaktech, protože jedna verze na repozitář by hnala MAJOR firmwaru při každé změně webu.

Na konci dne má sál **adresu, kterou si může otevřít v telefonu.**
