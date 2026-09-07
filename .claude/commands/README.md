# `.claude/commands/`

Opakovatelné postupy, spustitelné jako `/gate`, `/breakdown`, `/review`, `/report`,
`/docs-check`, `/deploy` — **jméno souboru je jméno příkazu.**

**Proč tenhle adresář.** Postup, který agent nevidí, je dokument, co nikdo nečte.
Claude Code si `.claude/commands/` najde sám.

Formát: krátká hlavička s popisem, pak **číslované kroky v rozkazovacím způsobu**.

Dvě pravidla, bez kterých by z toho byla ozdoba:

1. **Postup, který agent neumí projít celý, se rozbije v půlce.** Každý krok musí jít
   provést z tohohle repozitáře.
2. **Musí říkat, co se dělá bez ptaní a co nikdy.** U `/gate` je oprava kódu správná
   rovnou; u `/deploy` nikdy — vydání je akce navenek.

Tyto postupy jsou **zkrácené verze** těch z ostrého repozitáře (`example/.claude/commands/`).
Zkrácené proto, že tenhle projekt nemá firmware ani mobilní aplikaci — ne proto, že by
na cvičení platila mírnější pravidla.
