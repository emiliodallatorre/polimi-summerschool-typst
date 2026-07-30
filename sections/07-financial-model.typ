= Financial model

#import "../theme.typ": accent, sky-reflection

Building on the tiered pricing above and the SOM estimated earlier, we project revenue, cost, and break-even over a six-year horizon. Tier 1 (the self-serve Q&A wedge) is modelled at €1,200/year (€100/month); Tier 2 (the continuous-monitoring core subscription) at €45,000/year on average, reflecting the €2,500–7,500/month range; and Tier 3 (on-demand document generation) at a flat €20,000 per client per year. Market phasing follows the SOM/SAM/TAM logic set out above: Year 0 is a zero-revenue phase dedicated to R&D, MVP development, and closed beta pilots; Years 1–2 focus on penetrating our initial SOM in Germany and Italy and early monetization; Year 3 targets a €2.1M SOM ARR sufficient to unlock a Series A round; and Years 4–5 pursue EU expansion into the UK and France alongside broader TAM capture across SMEs.

#[
  #set text(size: 9pt)
  #figure(
    table(
      columns: (1.4fr, auto, auto, auto, auto, auto, auto),
      align: (left, center, center, center, center, center, center),
      stroke: 0.6pt + sky-reflection.lighten(30%),
      fill: (x, y) => if y == 0 {
        sky-reflection
      } else if calc.even(y) {
        sky-reflection.lighten(88%)
      } else {
        white
      },
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
    ),
    caption: [Cumulative customer acquisition by tier],
  )
]

#[
  #set text(size: 9pt)
  #figure(
    table(
      columns: (1.4fr, auto, auto, auto, auto, auto, auto),
      align: (left, center, center, center, center, center, center),
      stroke: 0.6pt + sky-reflection.lighten(30%),
      fill: (x, y) => if y == 0 {
        sky-reflection
      } else if calc.even(y) {
        sky-reflection.lighten(88%)
      } else {
        white
      },
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
    ),
    caption: [Revenue projections by stream (figures ending in €5,000 rounded down to the nearest €10,000 for a conservative baseline)],
  )
]

On the cost side, spend covers engineering headcount (including legal-engineers), sales, cloud and AI compute, and general and administrative overhead.

#[
  #set text(size: 9pt)
  #figure(
    table(
      columns: (1.4fr, auto, auto, auto, auto, auto, auto),
      align: (left, center, center, center, center, center, center),
      stroke: 0.6pt + sky-reflection.lighten(30%),
      fill: (x, y) => if y == 0 {
        sky-reflection
      } else if calc.even(y) {
        sky-reflection.lighten(88%)
      } else {
        white
      },
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
    ),
    caption: [Cost projections by category],
  )
]

Combining both sides gives the profit-and-loss picture below, and with it a clear break-even timeline.

#[
  #set text(size: 9pt)
  #figure(
    table(
      columns: (1.4fr, auto, auto, auto, auto, auto, auto),
      align: (left, center, center, center, center, center, center),
      stroke: 0.6pt + sky-reflection.lighten(30%),
      fill: (x, y) => if y == 0 {
        sky-reflection
      } else if calc.even(y) {
        sky-reflection.lighten(88%)
      } else {
        white
      },
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
    ),
    caption: [Profit-and-loss summary and break-even timeline],
  )
]

Three points stand out for investors. First, capital efficiency: pricing Tier 1 at €100/month keeps adoption frictionless, and disciplined R&D spending means the Year 0 build phase and Year 1 go-to-market burn together cost roughly €700,000. Second, the break-even point: with tight execution, we reach operational break-even by the end of Year 2. Third, Series A readiness: reaching €2.1M ARR by the end of Year 3 at a 16% margin positions ComplAI well for a Series A round to fund pan-European expansion in Years 4 and 5.

== The ask and capital allocation

We are raising a €500,000 pre-seed round, sized to give us 18 months of runway covering the Year 0 build phase and Year 1 go-to-market, with proven enterprise go-to-market traction and operational break-even by Year 2 as the core milestone.

This target reflects the reality that deeply integrated, compliant AI infrastructure requires upfront engineering investment before scalable monetization begins. €280,000 of the raise fully funds a pre-revenue Year 0, letting us focus on R&D, security compliance, and closed beta pilots without the distraction of premature monetization; enterprise clients expect secure, stress-tested environments before signing. This €500k raise provides the necessary runway to firmly establish our initial clients in Germany and Italy, allowing us to validate the product and build a compelling case for a larger seed round to fund our Year 2 expansion.

For investors, three points follow from this plan. The dedicated Year 0 timeline is a realistic acknowledgement of what enterprise-grade AI deployment requires before scaling sales. The €100/month Tier 1 wedge keeps adoption frictionless and helps offset the Year 1 go-to-market burn of €260,000. And fully capitalizing the build and early go-to-market phases upfront gives us the runway to aggressively pursue the €950,000 Year 2 revenue target, landing at operational break-even early for an AI SaaS platform.
