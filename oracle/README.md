# Orákulum

**Data, proti kterým se produkt měří a která nevznikla z našeho kódu.**

Test napsaný ze stejného zadání jako kód nedokazuje nic — obojí může být špatně
stejným způsobem. Proto orákulum **píše někdo jiný než ten, kdo píše kód**, a proto
se očekávané výstupy počítají **z dohodnutých pravidel, ne z implementace**.

Rozejde-li se kód s orákulem, **platí orákulum.**

## Pravidla

> **Sem tým zapíše pravidla, na kterých se domluvil.** V zadání nejsou — a dokud
> nejsou tady, nejde spočítat, jaký má být výsledek.

Ke každému pravidlu patří **číslo nebo podmínka**, ne popis záměru. „Mezera ukončuje
úsek" se nedá spočítat; „mezera delší než X minut ukončuje úsek" ano.

1.
2.
3.

## Očekávané výstupy

Adresář `expected/` je **prázdný a naplní ho tým**. Ke každému záznamu z `fixtures/`
patří soubor téhož jména s výsledkem, který **z pravidel plyne** — spočítaný rukou,
ne puštěním kódu.

Tvar výsledku:

```json
{ "segments": [
    { "device": "...", "quantity": "...", "from": "...", "to": "...",
      "count": 0, "min": 0, "max": 0 } ],
  "rejected": 0 }
```

## Záznamy

| Soubor | Co obsahuje |
|---|---|
| `01-clean.json` | Souvislé měření bez podrazů |
| `02-duplicates.json` | Jeden vzorek se v souboru opakuje |
| `03-same-second.json` | **Dvě hodnoty od téhož zařízení ve stejné vteřině** |
| `04-shuffled.json` | Přeházené pořadí, jinak shodné s `01` |
| `05-gap.json` | Mezera uprostřed |
| `06-empty.json` | Prázdný seznam vzorků |
| `07-broken.json` | Chybějící pole a nečitelný čas |
| `08-late.json` | Vzorek, který přijde po novějším |

**U každého se ptejte: co tenhle soubor zkouší a jaký má být výsledek?** Kde odpověď
neplyne z pravidel, chybí pravidlo — a to je nález, ne překážka.

`04` musí dát **týž výsledek jako `01`**. To je REC-003 a ověří se porovnáním.
