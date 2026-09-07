# Pokyny k tomuto repozitáři

Cvičný projekt workshopu vývojové metodiky. **Přehrávač záznamů** — stránka v prohlížeči,
která z načteného souboru měření ukáže seznam úseků a graf hodnoty v čase.

Zadání je v [`ZADANI.md`](ZADANI.md), požadavky v [`POZADAVKY.md`](POZADAVKY.md).

## Co platí při každé změně

- **Každá změna má vazbu na ID požadavku** `REC-nnn`. Bez toho neprojde brána pokrytí.
- **Testy odkazují na ID požadavku**, kvůli kterému existují.
- **Do `oracle/` nesahá ten, kdo píše kód.** Očekávané výstupy jsou spočítané z pravidel,
  ne z implementace. Rozejde-li se kód s orákulem, platí orákulum.
- `src/ingest/` a `src/segments/` **neimportují z** `src/view/`.
- `dedupe(samples) → samples` v `src/ingest/dedupe.mjs` a `node src/cli.mjs <soubor>`
  jsou **dané** — brány se o ně opírají.

## Co se nedělá nikdy

- Vypnout, obejít nebo zúžit bránu, aby změna prošla. Je-li brána špatně, je to nález
  o bráně a řeší ho garant **v jiném pull requestu**.
- Sloučit vlastní pull request.
- Přesunout značku vydání. Vydá se další patch.
- Zapsat do ticketu rozhodnutí: schválení review, převzetí a uzavření dělá člověk.

## Jazyk

Dokumentace česky, **kód a identifikátory anglicky**.

## Příkazy

`/gate` · `/breakdown` · `/review` · `/report` · `/docs-check` · `/deploy` —
definované v [`.claude/commands/`](.claude/commands/), jméno souboru je jméno příkazu.
