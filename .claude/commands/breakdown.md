---
description: Navrhne o jedno patro níž — Epicy, User Stories nebo Tasky — z registru požadavků.
---

1. Zjisti, co se rozpadá. Bez argumentu se zeptej. `--epics` navrhuje Epicy pro celý
   projekt; nad Epicem User Stories; nad User Story Tasky.
   *(Ostrý repozitář má navíc řez a milník — `--epics <řez> <milník>`. Tenhle projekt
   ani jedno nemá, takže se argumenty vynechávají.)*
2. Čti **`POZADAVKY.md` a `ZADANI.md`**, ne svou představu o tom, co by aplikace měla umět.
   Ručně psaná odvozenina se se zdrojem rozejde.
3. Ke každé položce navrhni **akceptační kritérium jako ověřitelný stav**, ne popis práce.
   „Zprávy se neukládají dvakrát" je popis práce; „vzorek shodný ve všech čtyřech údajích
   je ve výsledku právě jednou" je stav.
4. **Nes ID požadavku dolů.** Task bez vazby na požadavek nemá jak projít bránou pokrytí.
5. **Ohlas, co odvodit nešlo**, a to výslovně řádkem `⚠`. Je to jediná věc, kterou stroj
   umí a člověk ne — při čtení stromu ticketů nikdo neuvidí, co v něm chybí.
6. **Nikdy nezakládej ticket s přiřazeným odpovědným.** Odpovědným je vždy jmenovitý
   člověk a přiřazuje se rozhodnutím, ne návrhem.
7. Navrhni odhad. Neplatný odhad neuváděj jako číslo — řekni, že ho odvodit nejde.
