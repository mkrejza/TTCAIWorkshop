---
description: Vydání — najde pull request s vydáním, vysvětlí verzi, nechá ho sloučit člověkem, sleduje pipeline.
---

**Nikdy nespouštěj žádný krok bez toho, aby o vydání požádal člověk.** Vydání je akce
navenek; na rozdíl od opravy kódu se nedá vzít zpět úpravou souboru.

**Verzi nikdo nepíše.** release-please ji odvozuje z commitů a drží pro artefakt otevřený
**pull request s vydáním**: příští verzi a changelog od minulé značky. Vydání je sloučení
toho pull requestu.

1. Zeptej se, **který artefakt**. Tenhle projekt má jediný — `app` — ale ptej se stejně:
   **verze jsou po artefaktech**, protože jedna verze na repozitář by v ostrém projektu
   hnala MAJOR firmwaru při každé změně webu.
2. Najdi pull request s vydáním: `gh pr list --label "autorelease: pending"`. Když žádný
   není, **není co vydat** — řekni to. Značku ručně nevyráběj.
3. Ukaž **navrženou verzi** a **commity od minulé značky po typech** (`feat`, `fix`,
   ostatní) i s ID požadavků. Vysvětli, **proč je verze právě taková**: který commit ji
   zvedl.
4. **Nesedí-li verze, vada je v commitu, ne v čísle.** Chybí-li `feat!:` u rozbíjející
   změny, oprava je nový commit se správným typem. **Číslo v pull requestu nepřepisuj** —
   tiše opravená verze schová, že historie tvrdí něco jiného, než co se vydává.
5. Ověř, že **brány na pull requestu s vydáním prošly**. Spustil je release-please; když
   neproběhly, řekni to.
6. **Neslučuj sám.** Sloučení je rozhodnutí člověka po review — řekni, kdo ho má udělat.
7. **Sleduj pipeline vydání.** Ohlas první spadlou fázi i s koncem logu; neohlašuj
   úspěch, dokud vydání nedoběhlo.
8. Rozliš **staging od vydání**: na staging se dostane každé sloučení samo. Vydání je to,
   k čemu se dá vrátit.

Spadne-li kterýkoli krok, **zastav a ohlas**. Značku kvůli nápravě nemaž ani nepřesouvej —
oprava je commit, ze kterého vznikne další patch. **Přesunutá značka udělá z artefaktu
něco, co nikdo nesestaví znovu.**
