---
description: Adversariální předrecenze pull requestu s čistým kontextem; výstup je artefakt.
---

1. **Nečti konverzaci, ze které změna vznikla.** Smysl téhle recenze je čerstvý pohled;
   kdo zná záměr, čte kód tak, aby dával smysl.
2. Vezmi si **akceptační kritérium z ticketu a požadavek z registru**. Ptej se, jestli to
   kód dělá — ne jestli je hezký.
3. Projdi zvlášť: shodu s kritériem · hraniční případy ve vstupu · co se stane při
   opakování a přeházeném pořadí · co se stane u prázdného a poškozeného vstupu.
4. U každého nálezu uveď **soubor, řádek a co konkrétně neplatí**. Nález bez toho se
   nedá vypořádat.
5. **Výstup zapiš jako artefakt k pull requestu.** Bez zaznamenaného výstupu není co
   vypořádat a audit nemá co vidět.
6. **Nerozhoduj a neschvaluj.** Nálezy jmenovitě vypořádá odpovědná osoba: co je
   odstraněné a co přijaté se zdůvodněním.
