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
| REC-009 | Záznam jde načíst **ze souboru i z nabídky ukázek** na téže adrese. | D |
| REC-007 | Prázdný ani poškozený vstup **neshodí aplikaci**; hlásí se, co je špatně. | T |
| REC-008 | Načtení téhož souboru **dvakrát dá totožný výsledek**. | T |
