---
description: Pustí lokálně tytéž blokující brány co CI a řekne, která spadla a co tvrdí.
---

1. Pusť `bash scripts/gate.sh`. Brány běží v témž pořadí jako v CI: pokrytí požadavků ·
   izolace modulů · testy · determinismus · dvojí důkaz.
2. Hlas **která brána spadla a co tvrdí**, ne surový výstup nástroje. „Determinismus
   spadl: přeházený vstup dal jiný výsledek" je použitelné; výpis zásobníku ne.
3. Bránu, kterou nelze spustit lokálně, **přiznej** místo tichého přeskočení. Tiše
   chybějící brána je horší než spadlá — vyrábí falešnou jistotu.
4. **Nikdy bránu nevypínej, neobcházej ani nezužuj, aby prošla.** Je-li brána špatně,
   je to nález o bráně a mění ji garant, ne autor změny, a nikdy ve stejném pull requestu.
5. Když projde všechno, **vyjmenuj, které brány běžely.** „Zelená" bez seznamu schová krok 3.
