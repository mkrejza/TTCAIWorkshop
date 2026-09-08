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

Adresář `expected/` je **prázdný a naplní ho tým**. Ke každému záznamu patří soubor
téhož jména s výsledkem, který **z pravidel plyne** — spočítaný rukou, ne puštěním kódu.

**Začněte čtyřmi:** `01-clean`, `03-same-second`, `05-gap`, `06-empty`. Pokrývají základ,
rozhodnutí o shodě vzorků, dělení úseků a prázdný vstup. Zbylé čtyři dopočítáte, až
u nich budete psát testy — dřív je nepotřebujete.

Tvar výsledku:

```json
{ "segments": [
    { "device": "...", "quantity": "...", "from": "...", "to": "...",
      "count": 0, "min": 0, "max": 0 } ],
  "rejected": 0 }
```

## Záznamy

Data jsou ze **dvou zařízení** — `A-14` měří teplotu po 30 s, `B-07` po 45 s v jiném
rozsahu. Ručně je neprojdete; to je záměr.

| Soubor | Vzorků | Co obsahuje |
|---|---|---|
| `01-clean.json` | 487 | Obě zařízení, jedna mezera u `A-14` |
| `02-duplicates.json` | 542 | Dvě dávky doručené znovu |
| `03-same-second.json` | 492 | **Dvě různé hodnoty od téhož zařízení ve stejné vteřině** |
| `04-shuffled.json` | 487 | Přeházené pořadí, jinak shodné s `01` |
| `05-gap.json` | 327 | Jen `A-14`, mezera 47 minut |
| `06-empty.json` | 0 | Prázdný seznam |
| `07-broken.json` | 64 | Nečitelný čas, chybějící pole, hodnota jako text |
| `08-late.json` | 120 | Vzorek doručený po novějším |

**Nepočítejte jednotlivé vzorky.** U každého záznamu stačí `count`, `min`, `max`
a hranice úseků — a ty se odvozují z pravidel, ne z dat.

**U každého se ptejte: co tenhle soubor zkouší a jaký má být výsledek?** Kde odpověď
neplyne z pravidel, chybí pravidlo — a to je nález, ne překážka.

`04` musí dát **týž výsledek jako `01`**. To je REC-003 a ověří se porovnáním.
