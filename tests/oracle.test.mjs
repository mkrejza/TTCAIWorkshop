// DODANÝ TEST — tenhle nepíšete.
//
// Prochází oracle/expected/*.json, pustí aplikaci nad stejnojmenným záznamem
// z oracle/fixtures/ a porovná výsledek. Píšete jen ta očekávání, ne tuhle mechaniku.
//
// REC-002 REC-003 REC-004 REC-005 REC-007 REC-008
import { test } from 'node:test';
import assert from 'node:assert/strict';
import { execFileSync } from 'node:child_process';
import { readdirSync, readFileSync, existsSync } from 'node:fs';

const ocekavane = existsSync('oracle/expected')
  ? readdirSync('oracle/expected').filter(f => f.endsWith('.json')) : [];

if (ocekavane.length === 0) {
  test('orákulum zatím nemá žádný očekávaný výstup', () => {
    assert.fail('oracle/expected/ je prázdné — spočítejte očekávané výstupy (cvičení 3)');
  });
}

for (const soubor of ocekavane) {
  test(`orákulum · ${soubor}`, () => {
    const got = JSON.parse(execFileSync('node', ['src/cli.mjs', `oracle/fixtures/${soubor}`]));
    const want = JSON.parse(readFileSync(`oracle/expected/${soubor}`, 'utf8'));
    assert.deepEqual(got, want);
  });
}
