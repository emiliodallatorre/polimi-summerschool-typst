= Business model summary

#import "../theme.typ": accent, sky-reflection

Hereafter, we provide a shallow introduction to our business model, through the formalization of the Business Model Canvas. The necessary assumptions, as well as the conclusions that led to the definition of what is in it, are motivated in the #link(<appx-business-model-canvas>)[Appendix].

== Customer segments

ComplAI operates in the B2B market and targets two groups: early-stage FinTech startups, and FinTech companies with an internal legal team seeking to accelerate compliance job.

== Market sizing estimate <sec-market-sizing>

#align(center)[
  #v(0.3cm)
  #stack(
    dir: ttb,
    spacing: 0.12cm,
    align(center)[
      #box(width: 90%, height: 1.7cm, fill: accent, radius: 3pt)[
        #align(center + horizon)[
          #text(fill: white, weight: "bold", size: 12pt)[TAM] #linebreak()
          #text(fill: white, size: 10pt)[€42.0Bn / year]
        ]
      ]
    ],
    align(center)[
      #box(width: 58%, height: 1.7cm, fill: accent.lighten(30%), radius: 3pt)[
        #align(center + horizon)[
          #text(fill: white, weight: "bold", size: 12pt)[SAM] #linebreak()
          #text(fill: white, size: 10pt)[€110.0M / year]
        ]
      ]
    ],
    align(center)[
      #box(width: 28%, height: 1.7cm, fill: accent.lighten(58%), radius: 3pt)[
        #align(center + horizon)[
          #text(fill: accent.darken(30%), weight: "bold", size: 12pt)[SOM] #linebreak()
          #text(fill: accent.darken(30%), size: 10pt)[€1.65M / year]
        ]
      ]
    ],
  )
  #v(0.15cm)
  #text(size: 8pt, style: "italic", fill: rgb("#555555"))[Base-case estimates; see the scenario tables below for the full ranges.]
  #v(0.2cm)
]

 The TAM is based on the total number of EU SME, factoring in their total annual compliance spend. The SAM narrows this down specifically to EU FinTech startups and small FinTech enterprises, while the SOM targets the German and Italian FinTech markets.

 (see #link(<appx-market>)[Appendix] for full explanation of the TAM/SAM/SOM methodology and assumptions).

== Value proposition

ComplAI helps early-stage start-ups understand what they need to do to become compliant, without having to rely on expensive legal support from day one. It guides them through the initial assessment, highlights possible compliance gaps, and prepares clear documents that lawyers can review and validate. In this way, start-ups can reduce legal costs, move faster through licensing, and make their legal and compliance work more organised and efficient. No existing player combines this depth of FinTech regulatory coverage with a pre-lawyer, product-level diagnostic (see #link(<appx-competitor-analysis>)[Appendix] for the full competitor analysis).

== Channels

We connect with potential customers through startup hubs and accelerators, where we can reach founders at the moment compliance becomes a real concern. We also use digital marketing and media coverage to attract people searching for support online, while FinTech events and webinars help us build trust and speak directly with the founder community.

== Customer relationships

We combine automated tools with personal support to make the experience simple and reliable. Guided onboarding helps founders set up their assessments correctly, while technical support is available for everyday questions. Regular email updates keep users informed about regulatory changes, and the customer community offers a space to share practical advice and learn from other founders' experiences.

// come revenue streams metterei una tabella esplicativa

== Revenue streams

We use a flexible SaaS model with three main options. First is a €100 monthly subscription for basic self-serve compliance Q&As. Second is a custom monthly plan (€2,500 to €7,500) for real-time monitoring and regulatory alerts. Third is a pay-per-use option for generating reports on demand. This gives us steady monthly income while letting clients scale up as they need.

== Key resources

Our main tools include an AI search engine, an automated document scanner, and a live database of European and national laws. Supporting this technology is an advisory team of legal experts who help keep our system accurate and up to date.

== Key activities

Our operations focus on three main areas: continuously feeding new laws and regulatory updates into our system, developing the core software and diagnostic tools, and actively building relationships with legal partners and accelerators.

== Key partners

We build partnerships with lawyers to gain expert validation and referrals, while helping them cut down on repetitive research. We also collaborate with startup accelerators and incubators to reach early-stage founders who need licensing guidance.

== Cost structure

Our main spending goes toward running our cloud infrastructure and continuously refining our RAG system for high accuracy and clear source tracking. Beyond technical overhead, our expenses cover keeping regulatory data up to date, ongoing software development, marketing efforts, customer support, and managing key partnerships.

== Financial projections

Building on the tiered pricing above and the SOM estimated earlier, we project revenue, cost, and break-even over a five-year horizon. Tier 1 (the self-serve Q&A wedge) is modelled at €1,200/year (€100/month); Tier 2 (the continuous-monitoring core subscription) at €45,000/year on average, reflecting the €2,500–7,500/month range; and Tier 3 (on-demand document generation) at a flat €20,000 per client per year. Market phasing follows the SOM/SAM/TAM logic set out above: Years 1–2 focus on penetrating our initial SOM in Germany and Italy, Year 3 targets an ARR sufficient to unlock a Series A round, and Years 4–5 pursue EU expansion into the UK and France alongside broader TAM capture across SMEs.

#[
  #set text(size: 9pt)
  #figure(
    table(
      columns: (1.4fr, auto, auto, auto, auto, auto),
      align: (left, center, center, center, center, center),
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
        text(fill: white, weight: "bold")[Year 1],
        text(fill: white, weight: "bold")[Year 2],
        text(fill: white, weight: "bold")[Year 3],
        text(fill: white, weight: "bold")[Year 4],
        text(fill: white, weight: "bold")[Year 5],
      ),
      [Tier 1 (wedge)], [30], [100], [250], [500], [1,000],
      [Tier 2 (core)], [2], [15], [40], [85], [180],
      [Tier 3 (license)], [2], [8], [20], [45], [90],
    ),
    caption: [Cumulative customer acquisition by tier],
  )
]

#[
  #set text(size: 9pt)
  #figure(
    table(
      columns: (1.4fr, auto, auto, auto, auto, auto),
      align: (left, center, center, center, center, center),
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
        text(fill: white, weight: "bold")[Year 1],
        text(fill: white, weight: "bold")[Year 2],
        text(fill: white, weight: "bold")[Year 3],
        text(fill: white, weight: "bold")[Year 4],
        text(fill: white, weight: "bold")[Year 5],
      ),
      [Tier 1 SaaS], [€36,000], [€120,000], [€300,000], [€600,000], [€1,200,000],
      [Tier 2 CI/CD SaaS], [€90,000], [€675,000], [€1,800,000], [€3,825,000], [€8,100,000],
      [Tier 3 expansion], [€40,000], [€160,000], [€400,000], [€900,000], [€1,800,000],
      text(weight: "bold")[Total revenue], text(fill: accent, weight: "bold")[€166,000], text(fill: accent, weight: "bold")[€955,000], text(fill: accent, weight: "bold")[€2,500,000], text(fill: accent, weight: "bold")[€5,325,000], text(fill: accent, weight: "bold")[€11,100,000],
      text(style: "italic")[Year-end ARR target], text(style: "italic")[€126,000], text(style: "italic")[€795,000], text(style: "italic")[€2,100,000], text(style: "italic")[€4,425,000], text(style: "italic")[€9,300,000],
    ),
    caption: [Revenue projections by stream],
  )
]

On the cost side, spend covers engineering headcount (including legal-engineers), sales, cloud and AI compute, and general and administrative overhead.

#[
  #set text(size: 9pt)
  #figure(
    table(
      columns: (1.4fr, auto, auto, auto, auto, auto),
      align: (left, center, center, center, center, center),
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
        text(fill: white, weight: "bold")[Year 1],
        text(fill: white, weight: "bold")[Year 2],
        text(fill: white, weight: "bold")[Year 3],
        text(fill: white, weight: "bold")[Year 4],
        text(fill: white, weight: "bold")[Year 5],
      ),
      [R&D / engineering], [€250,000], [€500,000], [€1,000,000], [€1,700,000], [€2,500,000],
      [Sales & marketing], [€80,000], [€250,000], [€600,000], [€1,400,000], [€2,500,000],
      [Cloud & API compute], [€30,000], [€90,000], [€220,000], [€500,000], [€950,000],
      [Legal & admin], [€60,000], [€110,000], [€280,000], [€500,000], [€850,000],
      text(weight: "bold")[Total costs], text(fill: accent, weight: "bold")[€420,000], text(fill: accent, weight: "bold")[€950,000], text(fill: accent, weight: "bold")[€2,100,000], text(fill: accent, weight: "bold")[€4,100,000], text(fill: accent, weight: "bold")[€6,800,000],
    ),
    caption: [Cost projections by category],
  )
]

Combining both sides gives the profit-and-loss picture below, and with it a clear break-even timeline.

#[
  #set text(size: 9pt)
  #figure(
    table(
      columns: (1.4fr, auto, auto, auto, auto, auto),
      align: (left, center, center, center, center, center),
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
        text(fill: white, weight: "bold")[Year 1],
        text(fill: white, weight: "bold")[Year 2],
        text(fill: white, weight: "bold")[Year 3],
        text(fill: white, weight: "bold")[Year 4],
        text(fill: white, weight: "bold")[Year 5],
      ),
      [Total revenue], [€166,000], [€955,000], [€2,500,000], [€5,325,000], [€11,100,000],
      [Total costs], [€420,000], [€950,000], [€2,100,000], [€4,100,000], [€6,800,000],
      text(weight: "bold")[Net income], text(fill: accent, weight: "bold")[−€254,000], text(fill: accent, weight: "bold")[+€5,000], text(fill: accent, weight: "bold")[+€400,000], text(fill: accent, weight: "bold")[+€1,225,000], text(fill: accent, weight: "bold")[+€4,300,000],
      [Operating margin], [−153.0%], [0.5%], [16.0%], [23.0%], [38.7%],
    ),
    caption: [Profit-and-loss summary and break-even timeline],
  )
]

Three points stand out for investors. First, capital efficiency: pricing Tier 1 at €100/month keeps adoption frictionless, and disciplined R&D spending means we only need a lean €300,000–400,000 in seed funding to absorb the Year 1 burn. Second, the break-even point: with tight R&D execution, we reach operational break-even by the end of Year 2. Third, Series A readiness: reaching €2.1M ARR by the end of Year 3 at a 16% margin positions ComplAI well for a Series A round to fund pan-European expansion in Years 4 and 5.

For a visual overview of the full Business Model Canvas, see #link(<appx-business-model-canvas>)[Appendix].
