# Přehrávač záznamů · produktové zadání

**Verze 1.0 · cvičný projekt pro workshop vývojové metodiky**

Tento dokument je záměrně krátký a **záměrně na dvou místech nedořečený**.
Nedořečená místa nejsou chyba k opravení před workshopem — jsou jeho obsahem.

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

## Co zadání neříká

Tyto věci **musí rozhodnout tým** dřív, než se začne psát:

| Otázka | Proč na tom záleží |
|---|---|
| Co ukončuje úsek — jak dlouhá mezera v datech? | Bez toho neexistuje seznam úseků |
| Kdy jsou dva vzorky **totéž měření** a kdy dvě různá? | Bez toho neexistuje deduplikace |
| Co s vzorkem, který je starší než poslední zpracovaný? | Přijmout, zahodit, zařadit |
| V jakém časovém pásmu se zobrazuje čas? | Data jsou v UTC, technik není |
| Co dělá prázdný nebo poškozený soubor? | Nesmí to spadnout |

## Co je hotovo

Technik otevře soubor, uvidí úseky, vybere jeden a uvidí graf. Prázdný soubor mu
řekne, že je prázdný. Tentýž soubor otevřený dvakrát dá **totéž**.
