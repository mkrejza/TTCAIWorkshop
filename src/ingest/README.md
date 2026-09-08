# `ingest/` · příjem

Sem patří moduly, které surový soubor přečtou a uklidí. Tenhle adresář si nesmí
nic brát z `view/` — hlídá to brána izolace.

| Modul | Kdo | Požadavky |
|---|---|---|
| `parse.mjs` — `parse(raw) → { samples, rejected }` | tým 1 | REC-001, REC-007 |
| `dedupe.mjs` — `dedupe(samples) → samples` | tým 2 | REC-002, REC-008 |

**Jména a tvary jsou dané**: `cli.mjs` je importuje a brána dvojího důkazu
`dedupe.mjs` dočasně vyměňuje za průchozí funkci.
