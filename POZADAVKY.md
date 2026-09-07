# Registr požadavků · Přehrávač záznamů

Cvičný registr. Formát je totožný s ostrým registrem v `docs/04-pozadavky.md`:
**ID · znění · způsob ověření**. Způsob ověření: `T` test · `I` inspekce · `D` demonstrace.

| ID | Požadavek | Ověření |
|---|---|---|
| REC-001 | Aplikace načte soubor se vzorky; vzorek nese **zařízení, čas, veličinu a hodnotu**. | T |
| REC-002 | **Opakovaně doručený vzorek se do výsledku promítne jen jednou.** | T |
| REC-003 | Výsledek **nezávisí na pořadí**, ve kterém vzorky v souboru leží. | T |
| REC-004 | Vzorky jednoho zařízení se dělí na **úseky**; nový úsek začíná po mezeře delší než dohodnutá mez. | T |
| REC-005 | Seznam úseků ukazuje **začátek, konec, počet vzorků a rozsah hodnot**. | T |
| REC-006 | Vybraný úsek se vykreslí jako **graf hodnoty v čase**. | D |
| REC-007 | Prázdný ani poškozený vstup **neshodí aplikaci**; hlásí se, co je špatně. | T |
| REC-008 | Načtení téhož souboru **dvakrát dá totožný výsledek**. | T |

## Pozor na REC-002

Znění neříká, **kdy jsou dva vzorky totéž měření.** To není opomenutí ke spěšné opravě —
je to místo, kde se rozhoduje o správnosti celé aplikace, a **rozhodnout to musí člověk
před zadáním práce**, ne nástroj při psaní kódu.

Kdo to přeskočí, dostane kód, který je vzhledem k zadání správný a vzhledem k záměru
špatný. Viz `LEKTOR.md`.
