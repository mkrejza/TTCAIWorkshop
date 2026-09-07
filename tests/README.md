# Testy

Prázdné schválně — píše je sál. Spouští se `npm test` (běhoun `node --test`).

**Každý test se musí odvolat na ID požadavku**, kvůli kterému existuje: brána pokrytí
hledá v tomhle adresáři řetězec `REC-nnn` u každého požadavku ověřovaného testem.

První běh **je červený a má být.** Zelená se rodí během dne.
