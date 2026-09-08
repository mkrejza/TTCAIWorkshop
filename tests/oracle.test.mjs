// DODANÝ TEST — tenhle nepíšete.
//
// Ověřuje orákulum dvěma způsoby:
//   1. oracle/expected/*.json — přesný očekávaný výstup (jen u malých záznamů)
//   2. oracle/vztahy.json     — vztahy, které plynou z pravidel, ne z dat
//
// REC-002 REC-003 REC-004 REC-005 REC-007 REC-008
import { test } from 'node:test';
import assert from 'node:assert/strict';
import { execFileSync } from 'node:child_process';
import { readdirSync, readFileSync, existsSync } from 'node:fs';

const spust = z => JSON.parse(execFileSync('node', ['src/cli.mjs', `oracle/fixtures/${z}.json`]));
const vzorku = v => v.segments.reduce((n, s) => n + s.count, 0);

const presne = existsSync('oracle/expected')
  ? readdirSync('oracle/expected').filter(f => f.endsWith('.json')) : [];
const vztahy = existsSync('oracle/vztahy.json')
  ? JSON.parse(readFileSync('oracle/vztahy.json', 'utf8')) : {};
const nic = presne.length === 0
  && !(vztahy.shodne?.length || vztahy.vicVzorku?.length || Object.keys(vztahy.pocetUseku ?? {}).length);

if (nic) {
  test('orákulum je zatím prázdné', () => {
    assert.fail('Doplňte oracle/expected/ a oracle/vztahy.json (cvičení 3)');
  });
}

for (const soubor of presne) {
  test(`orákulum · přesný výstup ${soubor}`, () => {
    assert.deepEqual(spust(soubor.replace(/\.json$/, '')),
                     JSON.parse(readFileSync(`oracle/expected/${soubor}`, 'utf8')));
  });
}
for (const [a, b] of vztahy.shodne ?? []) {
  test(`orákulum · ${a} dá totéž co ${b}`, () => assert.deepEqual(spust(a), spust(b)));
}
for (const [a, b] of vztahy.vicVzorku ?? []) {
  test(`orákulum · ${a} má víc vzorků než ${b}`, () => {
    assert.ok(vzorku(spust(a)) > vzorku(spust(b)),
      `${a} má ${vzorku(spust(a))}, ${b} má ${vzorku(spust(b))} — musí být víc`);
  });
}
for (const [z, n] of Object.entries(vztahy.pocetUseku ?? {})) {
  test(`orákulum · ${z} má ${n} úseků`, () => assert.equal(spust(z).segments.length, n));
}
