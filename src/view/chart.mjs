// DODANÁ SOUČÁST — tuhle nepíšete, jen ji zavoláte.
//
// PROČ JE HOTOVÁ: kreslení os a škálování je pracné, ale nic se na něm neučí. Bez ní by
// dvojice s požadavkem REC-006 měla mnohonásobně větší úkol než ostatní a nedokončila by.
//
//   renderChart(element, points)
//     element — kam se má kreslit
//     points  — [{ at: "2026-03-01T08:00:00Z", value: 21.4 }, …] setříděné podle času
//
// Prázdné pole vykreslí prázdný graf, ne výjimku.

const PAD = { left: 48, right: 12, top: 12, bottom: 28 };

export function renderChart(element, points, { width = 640, height = 240 } = {}) {
  const w = width, h = height;
  const inner = { w: w - PAD.left - PAD.right, h: h - PAD.top - PAD.bottom };

  if (!points || points.length === 0) {
    element.innerHTML = `<svg width="${w}" height="${h}" role="img" aria-label="prázdný graf">
      <text x="${w / 2}" y="${h / 2}" text-anchor="middle" fill="#888">žádná data</text></svg>`;
    return;
  }

  const ts = points.map(p => Date.parse(p.at));
  const vs = points.map(p => p.value);
  const t0 = Math.min(...ts), t1 = Math.max(...ts);
  let v0 = Math.min(...vs), v1 = Math.max(...vs);
  if (v0 === v1) { v0 -= 1; v1 += 1; }            // plochá řada by dělila nulou

  const x = t => PAD.left + (t1 === t0 ? inner.w / 2 : ((t - t0) / (t1 - t0)) * inner.w);
  const y = v => PAD.top + inner.h - ((v - v0) / (v1 - v0)) * inner.h;

  const d = points.map((p, i) => `${i ? 'L' : 'M'}${x(Date.parse(p.at)).toFixed(1)} ${y(p.value).toFixed(1)}`).join(' ');
  const cas = t => new Date(t).toISOString().slice(11, 16);

  element.innerHTML = `<svg width="${w}" height="${h}" role="img" aria-label="graf hodnoty v čase">
  <line x1="${PAD.left}" y1="${PAD.top}" x2="${PAD.left}" y2="${PAD.top + inner.h}" stroke="#bbb"/>
  <line x1="${PAD.left}" y1="${PAD.top + inner.h}" x2="${w - PAD.right}" y2="${PAD.top + inner.h}" stroke="#bbb"/>
  <text x="${PAD.left - 6}" y="${y(v1) + 4}" text-anchor="end" font-size="11" fill="#666">${v1.toFixed(1)}</text>
  <text x="${PAD.left - 6}" y="${y(v0) + 4}" text-anchor="end" font-size="11" fill="#666">${v0.toFixed(1)}</text>
  <text x="${PAD.left}" y="${h - 8}" font-size="11" fill="#666">${cas(t0)}</text>
  <text x="${w - PAD.right}" y="${h - 8}" text-anchor="end" font-size="11" fill="#666">${cas(t1)}</text>
  <path d="${d}" fill="none" stroke="#0a7ea4" stroke-width="1.6"/>
</svg>`;
}
