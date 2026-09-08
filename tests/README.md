# Testy

Prázdné schválně — píše je sál. Spouští se `npm test` (běhoun `node --test`).

**Každý test se musí odvolat na ID požadavku**, kvůli kterému existuje: brána pokrytí
hledá v tomhle adresáři řetězec `REC-nnn` u každého požadavku ověřovaného testem.

První běh **je červený a má být.** Zelená se rodí během dne.

## `oracle.test.mjs` je dodaný

Prochází `oracle/expected/*.json`, pustí nad stejnojmenným záznamem `src/cli.mjs`
a porovná výsledek. **Vy píšete očekávání, ne tuhle mechaniku.**

Dokud je `oracle/expected/` prázdné, hlásí to jako chybu — protože bez očekávaných
výstupů se nedá ověřit nic.
