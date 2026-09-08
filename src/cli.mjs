// DODANÁ KOSTRA — propojení, ne logika.
//
// PROČ JE HOTOVÁ: kdyby ji psal každý tým sám, čtyři týmy si založí tentýž soubor
// a konflikt nastane třikrát, náhodně a všem. Souběh se má ukázat řízeně (cvičení 6),
// ne přepadnout ze zálohy.
//
// Každý tým doplní SVŮJ modul. Dokud nějaký chybí, běh spadne na chybějícím importu —
// a to je správná zpráva: ta část ještě není hotová.
import { readFileSync } from 'node:fs';
import { parse } from './ingest/parse.mjs';        // tým 1 · REC-001, REC-007
import { dedupe } from './ingest/dedupe.mjs';      // tým 2 · REC-002, REC-008
import { split, summarise } from './segments/split.mjs';  // tým 3 · REC-003, REC-004

const { samples, rejected } = parse(JSON.parse(readFileSync(process.argv[2], 'utf8')));
const segments = split(dedupe(samples)).map(summarise);
console.log(JSON.stringify({ segments, rejected }, null, 2));
