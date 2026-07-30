= Financial model

#import "../theme.typ": accent, sky-reflection, stat-badge, info-card, table-stroke, zebra-fill, card-radius, rounded-table

Building on the tiered pricing above and the SOM estimated earlier, we project revenue, cost, and break-even over a six-year horizon, using the following annualized values per tier:

#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 8pt,
  align: (horizon, horizon, horizon),
  stat-badge("€1,200/yr", "TIER 1 · SELF-SERVE Q&A WEDGE"),
  stat-badge("€45,000/yr avg", "TIER 2 · MONITORING CORE"),
  stat-badge("€20,000/yr avg", "TIER 3 · ON-DEMAND DOCS"),
)

#v(4pt)

Market phasing follows the SOM/SAM/TAM logic set out above: Year 0 is a zero-revenue phase dedicated to R&D, MVP development, and closed beta pilots; Years 1–2 focus on penetrating our initial SOM in Germany and Italy and early monetization; Year 3 targets a €2.1M SOM ARR sufficient to unlock a Series A round; and Years 4–5 pursue EU expansion into the UK and France alongside broader TAM capture across SMEs.

#figure(
  rounded-table(table(
    columns: (1.4fr, auto, auto, auto, auto, auto, auto),
    align: (left, center, center, center, center, center, center),
    stroke: table-stroke,
    fill: (x, y) => zebra-fill(y),
    table.header(
      text(fill: white, weight: "bold")[Segment],
      text(fill: white, weight: "bold")[Year 0],
      text(fill: white, weight: "bold")[Year 1],
      text(fill: white, weight: "bold")[Year 2],
      text(fill: white, weight: "bold")[Year 3],
      text(fill: white, weight: "bold")[Year 4],
      text(fill: white, weight: "bold")[Year 5],
    ),
    [Tier 1 (wedge)], [5 (free)], [30], [100], [250], [500], [1,000],
    [Tier 2 (core)], [2 (pilots)], [2], [15], [40], [85], [180],
    [Tier 3 (license)], [0], [2], [8], [20], [45], [90],
  )),
  caption: [Cumulative customer acquisition by tier],
)

#figure(
  rounded-table(table(
    columns: (1.4fr, auto, auto, auto, auto, auto, auto),
    align: (left, center, center, center, center, center, center),
    stroke: table-stroke,
    fill: (x, y) => zebra-fill(y),
    table.header(
      text(fill: white, weight: "bold")[Revenue stream],
      text(fill: white, weight: "bold")[Year 0],
      text(fill: white, weight: "bold")[Year 1],
      text(fill: white, weight: "bold")[Year 2],
      text(fill: white, weight: "bold")[Year 3],
      text(fill: white, weight: "bold")[Year 4],
      text(fill: white, weight: "bold")[Year 5],
    ),
    [Tier 1 SaaS], [€0], [€30,000], [€120,000], [€300,000], [€600,000], [€1,200,000],
    [Tier 2 CI/CD SaaS], [€0], [€90,000], [€670,000], [€1,800,000], [€3,820,000], [€8,100,000],
    [Tier 3 expansion], [€0], [€40,000], [€160,000], [€400,000], [€900,000], [€1,800,000],
    text(weight: "bold")[Total revenue], text(fill: accent, weight: "bold")[€0], text(fill: accent, weight: "bold")[€160,000], text(fill: accent, weight: "bold")[€950,000], text(fill: accent, weight: "bold")[€2,500,000], text(fill: accent, weight: "bold")[€5,320,000], text(fill: accent, weight: "bold")[€11,100,000],
    text(style: "italic")[Year-end ARR target], text(style: "italic")[€0], text(style: "italic")[€120,000], text(style: "italic")[€790,000], text(style: "italic")[€2,100,000], text(style: "italic")[€4,420,000], text(style: "italic")[€9,300,000],
  )),
  caption: [Revenue projections by stream (figures ending in €5,000 rounded down to the nearest €10,000 for a conservative baseline)],
)

On the cost side, spend covers engineering headcount (including legal-engineers), sales, cloud and AI compute, and general and administrative overhead.

#figure(
  rounded-table(table(
    columns: (1.4fr, auto, auto, auto, auto, auto, auto),
    align: (left, center, center, center, center, center, center),
    stroke: table-stroke,
    fill: (x, y) => zebra-fill(y),
    table.header(
      text(fill: white, weight: "bold")[Expense category],
      text(fill: white, weight: "bold")[Year 0],
      text(fill: white, weight: "bold")[Year 1],
      text(fill: white, weight: "bold")[Year 2],
      text(fill: white, weight: "bold")[Year 3],
      text(fill: white, weight: "bold")[Year 4],
      text(fill: white, weight: "bold")[Year 5],
    ),
    [R&D / engineering], [€200,000], [€250,000], [€500,000], [€1,000,000], [€1,700,000], [€2,500,000],
    [Sales & marketing], [€20,000], [€80,000], [€250,000], [€600,000], [€1,400,000], [€2,500,000],
    [Cloud & API compute], [€20,000], [€30,000], [€90,000], [€220,000], [€500,000], [€950,000],
    [Legal & admin], [€40,000], [€60,000], [€110,000], [€280,000], [€500,000], [€850,000],
    text(weight: "bold")[Total costs], text(fill: accent, weight: "bold")[€280,000], text(fill: accent, weight: "bold")[€420,000], text(fill: accent, weight: "bold")[€950,000], text(fill: accent, weight: "bold")[€2,100,000], text(fill: accent, weight: "bold")[€4,100,000], text(fill: accent, weight: "bold")[€6,800,000],
  )),
  caption: [Cost projections by category],
)

Combining both sides gives the profit-and-loss picture below, and with it a clear break-even timeline.

#figure(
  rounded-table(table(
    columns: (1.4fr, auto, auto, auto, auto, auto, auto),
    align: (left, center, center, center, center, center, center),
    stroke: table-stroke,
    fill: (x, y) => zebra-fill(y),
    table.header(
      text(fill: white, weight: "bold")[Metric],
      text(fill: white, weight: "bold")[Year 0],
      text(fill: white, weight: "bold")[Year 1],
      text(fill: white, weight: "bold")[Year 2],
      text(fill: white, weight: "bold")[Year 3],
      text(fill: white, weight: "bold")[Year 4],
      text(fill: white, weight: "bold")[Year 5],
    ),
    [Total revenue], [€0], [€160,000], [€950,000], [€2,500,000], [€5,320,000], [€11,100,000],
    [Total costs], [€280,000], [€420,000], [€950,000], [€2,100,000], [€4,100,000], [€6,800,000],
    text(weight: "bold")[Net income], text(fill: accent, weight: "bold")[−€280,000], text(fill: accent, weight: "bold")[−€260,000], text(fill: accent, weight: "bold")[€0], text(fill: accent, weight: "bold")[+€400,000], text(fill: accent, weight: "bold")[+€1,220,000], text(fill: accent, weight: "bold")[+€4,300,000],
    [Operating margin], [N/A], [−162.5%], [0.0%], [16.0%], [22.9%], [38.7%],
  )),
  caption: [Profit-and-loss summary and break-even timeline],
)

Three points stand out for investors. First, capital efficiency: pricing Tier 1 at €100/month keeps adoption frictionless, and disciplined R&D spending means the Year 0 build phase and Year 1 go-to-market burn together cost roughly €700,000. Second, the break-even point: with tight execution, we reach operational break-even by the end of Year 2. Third, Series A readiness: reaching €2.1M ARR by the end of Year 3 at a 16% margin positions ComplAI well for a Series A round to fund pan-European expansion in Years 4 and 5.

== The ask and capital allocation

#grid(
  columns: (auto, 1fr),
  column-gutter: 14pt,
  align: (horizon, horizon),
  stat-badge("€500,000", "PRE-SEED ROUND", value-size: 12pt, gap: -8pt, inset: (x: 14pt, y: 6pt), width: auto),
  text(size: 9.5pt)[18 months of runway across the Year 0 build phase and Year 1 go-to-market, targeting proven enterprise traction and operational break-even by Year 2.],
)

#v(8pt)

Deeply integrated, compliant AI infrastructure requires upfront engineering investment before scalable monetization begins, so the raise is allocated across two phases:

#v(4pt)

#let alloc-block(amount, phase, detail, fill-color) = block(
  width: 100%,
  fill: fill-color,
  radius: card-radius,
  inset: 8pt,
)[
  #set text(fill: white)
  #text(size: 11pt, weight: "bold")[#amount --- #phase]
  #v(2pt)
  #text(size: 9pt)[#detail]
]

// Bar widths are proportional to euro amounts (280k : 220k), so the split
// itself reads as a small chart rather than needing a caption to explain it.
#grid(
  columns: (28fr, 22fr),
  column-gutter: 6pt,
  alloc-block(
    "€280,000",
    "Year 0",
    "Pre-revenue build: R&D, security compliance, closed beta pilots --- no premature monetization.",
    accent,
  ),
  alloc-block(
    "€220,000",
    "Year 1",
    "Go-to-market: first paying clients in Germany and Italy, validating the product.",
    sky-reflection,
  ),
)

#v(8pt)

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 8pt,
  info-card(
    "A realistic build timeline",
    [The dedicated Year 0 phase reflects what enterprise-grade AI deployment genuinely requires before scaling sales.],
  ),
  info-card(
    "A frictionless wedge",
    [The €100/month Tier 1 tier keeps adoption low-friction and helps offset the €260,000 Year 1 go-to-market burn.],
  ),
  info-card(
    "An aggressive, funded Year 2",
    [Full upfront capitalization gives us the runway to pursue the €950,000 Year 2 revenue target and reach break-even early for an AI SaaS platform.],
  ),
)
