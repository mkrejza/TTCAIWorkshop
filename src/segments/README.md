# `segments/` · úseky

Sem patří dělení vzorků na úseky. Tenhle adresář si nesmí nic brát z `view/` —
hlídá to brána izolace.

| Modul | Kdo | Požadavky |
|---|---|---|
| `split.mjs` — `split(samples) → pole úseků`, `summarise(úsek) → souhrn` | tým 3 | REC-003, REC-004 |

**Pozor:** úseky se dělí **po zařízeních**. Vzorky dvou zařízení ve stejném čase
do jednoho úseku nepatří.
