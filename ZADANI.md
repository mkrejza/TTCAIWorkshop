# Přehrávač záznamů · produktové zadání

**Verze 1.0**

Zadání od produktu. Krátké, jak bývají.

## K čemu to je

Technik dostane ze zařízení v terénu soubor se zaznamenanými měřeními a potřebuje
zjistit, **kdy zařízení měřilo a co naměřilo**. Dnes to dělá tak, že soubor otevře
v tabulkovém procesoru a dívá se na čísla; chce místo toho vidět úseky a průběh.

## Co aplikace umí

1. Načte soubor se vzorky.
2. Ukáže **seznam úseků** — souvislých období, kdy zařízení měřilo.
3. Po výběru úseku vykreslí **graf hodnoty v čase**.

Běží v prohlížeči, bez serveru. Soubor se otevře z disku.

## Tvar vstupu

```json
{ "samples": [
  { "device": "A-14", "at": "2026-03-01T08:00:00Z", "quantity": "temperature", "value": 21.4 }
] }
```

Vzorky **přicházejí opakovaně a v přeházeném pořadí** — zařízení posílá dávky znovu,
když si není jisté doručením, a dávky se cestou předbíhají.

## Co je hotovo

Technik otevře soubor, uvidí úseky, vybere jeden a uvidí graf. Prázdný soubor mu
řekne, že je prázdný. Tentýž soubor otevřený dvakrát dá **totéž**.
