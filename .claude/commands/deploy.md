---
description: Vydání — ověří strom, povýší verzi, označkuje, odešle, sleduje pipeline.
---

**Nikdy nespouštěj žádný krok bez toho, aby o vydání požádal člověk.** Vydání je akce
navenek; na rozdíl od opravy kódu se nedá vzít zpět úpravou souboru.

1. Odmítni pokračovat, pokud pracovní strom není čistý, větev není `main` a není
   srovnaná s protějškem. Vydání ze špinavého stromu odešle to, co v repozitáři není.
2. Zeptej se, **který artefakt**. Tenhle projekt má jediný — `app` — ale ptej se stejně:
   **verze jsou po artefaktech**, protože jedna verze na repozitář by v ostrém projektu
   hnala MAJOR firmwaru při každé změně webu.
3. Zeptej se na verzi, nebyla-li zadána. Vyžaduj ji **holou** — `1.4.0`, nikdy `v1.4.0`.
   Značka si `v` přidá sama; přijmout obojí vyrobí značku `vv1.4.0` a zapíše neplatnou
   verzi do manifestu, přičemž **obojí čtení vypadá v místě volání správně**.
   **Nejednoznačnost odmítni, neuřezávej `v` tiše** — uříznutím se táž chyba schová
   i ve jménu značky.
4. Odmítni cokoli, co nevypadá jako verze. Omylem předaná zpráva commitu by se jinak
   stala značkou i hodnotou v manifestu.
5. Ověř, že je verze vyšší než současná a že značka `app-v<verze>` neexistuje lokálně
   ani na protějšku.
6. Ukaž **commity od minulé značky** a verzi, kterou se chystáš vydat. **Počkej na potvrzení.**
7. Spusť `./deploy.sh app "<shrnutí>" "<verze>"`. **Nepředělávej jeho kroky sem** —
   zábradlí žijí ve skriptu, aby platila, ať se spustí odkudkoli.
8. **Sleduj pipeline vydání.** Ohlas první spadlou fázi i s koncem logu; neohlašuj
   úspěch, dokud vydání nedoběhlo.
9. Rozliš **staging od vydání**: na staging se dostane každé sloučení samo. Vydání je to,
   k čemu se dá vrátit.

Spadne-li kterýkoli krok, **zastav a ohlas**. Značku kvůli nápravě nemaž ani nepřesouvej —
vydej další patch. **Přesunutá značka udělá z artefaktu něco, co nikdo nesestaví znovu.**
