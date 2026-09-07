# Sem to napíše sál

Prázdné schválně. Brány a testy se ale o strukturu opírají, takže **tyhle tři věci
jsou dané** a nedomlouvají se:

| Co | Kde | Proč je to dané |
|---|---|---|
| `dedupe(samples) → samples` | `src/ingest/dedupe.mjs` | Brána dvojího důkazu ji vyměňuje za průchozí |
| `node src/cli.mjs <soubor>` vypíše výsledek na výstup | `src/cli.mjs` | Brána determinismu porovnává dva běhy |
| `ingest/` a `segments/` neimportují z `view/` | — | Brána izolace |

Tvar výsledku odpovídá souborům v `oracle/expected/`.

Všechno ostatní — jak se to uvnitř udělá, kolik souborů, jaké funkce — **je na týmu.**
