# Sem to napíše sál

Prázdné schválně. Brány a testy se ale o strukturu opírají, takže **tyhle tři věci
jsou dané** a nedomlouvají se:

| Co | Kde | Proč je to dané |
|---|---|---|
| `dedupe(samples) → samples` | `src/ingest/dedupe.mjs` | Brána dvojího důkazu ji vyměňuje za průchozí |
| `node src/cli.mjs <soubor>` vypíše výsledek na výstup | `src/cli.mjs` | Brána determinismu porovnává dva běhy |
| `ingest/` a `segments/` neimportují z `view/` | — | Brána izolace |

Tvar výsledku odpovídá souborům v `oracle/expected/`.

## Co je dodané a nepíšete to

| Soubor | Co dělá |
|---|---|
| `view/chart.mjs` | `renderChart(prvek, body)` — osy, škálování, křivka. **Zavoláte ji, nepíšete ji** |
| `index.html` | Kostra stránky: výběr souboru, `#segments`, `#chart`, `#error` |
| `cli.mjs` | Propojení modulů. **Doplňujete moduly, ne tenhle soubor** — jinak si ho čtyři týmy založí každý po svém |

Kreslení os je pracné a nic se na něm neučí. **Zbytek je na vás** — `view/app.mjs`,
který data načte, nechá zpracovat a výsledek do těch prvků zapíše.

Všechno ostatní — jak se to uvnitř udělá, kolik souborů, jaké funkce — **je na týmu.**
