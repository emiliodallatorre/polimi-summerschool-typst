= Business model summary

#import "../theme.typ": accent, sky-reflection

Hereafter, we provide a shallow introduction to our business model, through the formalization of the Business Model Canvas. The necessary assumptions, as well as the conclusions that led to the definition of what is in it, are motivated in the #link(<appx-business-model-canvas>)[Appendix].

== Customer segments

ComplAI operates in the B2B market and targets two groups: early-stage FinTech startups, and FinTech companies with an internal legal team seeking to accelerate compliance job.

Because early-stage FinTech ventures rarely have specialized departments, we define this persona at the organizational level rather than around a single buyer role: a pre-seed to Seed-stage FinTech startup, typically a lean team of 5 to 15 employees based within the EU, where purchasing decisions reflect a shared assessment of risk and resource allocation across the founding team rather than one stakeholder's preference.

We target these startups because they face a structural pressure that makes early regulatory alignment a condition for survival rather than an operational nice-to-have. Regulatory frameworks such as DORA and MiCA, combined with licensing rejection rates estimated at 80 to 85 percent @ccn-mica-failure-rate-2025, mean that a poorly documented or non-compliant product architecture can block a launch or sink a license application. At the same time, these ventures operate on constrained runway and cannot absorb the cost of retaining external legal counsel early and continuously. This combination of high regulatory exposure and limited financial capacity to address it through traditional means is what makes early-stage FinTech startups a coherent and urgent customer segment for ComplAI.

== Value proposition

ComplAI helps early-stage start-ups understand what they need to do to become compliant, without having to rely on expensive legal support from day one. It guides them through the initial assessment, highlights possible compliance gaps, and prepares clear documents that lawyers can review and validate. In this way, start-ups can reduce legal costs, move faster through licensing, and make their legal and compliance work more organised and efficient. No existing player combines this depth of FinTech regulatory coverage with a pre-lawyer, product-level diagnostic (see #link(<appx-value-proposition-canvas>)[Appendix] for the complete Value Proposition Canvas).

== Channels

Our market-access strategy rests on three coordinated channels, chosen to achieve efficient customer acquisition without resource-intensive sales overhead.

#let channel-box(title, body) = block(
  width: 100%,
  breakable: false,
  fill: sky-reflection.lighten(88%),
  stroke: 0.6pt + accent.lighten(40%),
  radius: 4pt,
  inset: 9pt,
)[
  #text(size: 9.5pt, weight: "bold", fill: accent)[#title]
  #v(4pt)
  #text(size: 8pt)[#body]
]

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 8pt,
  channel-box(
    "Hub & accelerator partnerships",
    [Our primary distribution engine: embedding directly into incoming cohorts at TechQuartier in Frankfurt and at the FinTech District, PoliHub, and B4i in Milan, giving us access to pre-screened founders facing imminent licensing requirements.],
  ),
  channel-box(
    "Targeted PR & thought leadership",
    [Publishing problem-solution case studies and regulatory analyses in outlets such as Business Insider, to build domain authority and organic brand awareness among founders actively researching compliance solutions.],
  ),
  channel-box(
    "FinTech conferences & founder events",
    [Attending focused gatherings such as FinTech Week to engage directly with early-stage builders at the precise moment they are structuring their technical and operational roadmaps, enacting a lobbying activity towards ComplAI.],
  ),
)

We deliberately exclude high-friction channels such as door-to-door sales, manual educational workshops, and open-source maintenance, so the model stays operationally scalable. The product itself is engineered to be self-serve: founders onboard, run diagnostics, and access compliance frameworks without manual guidance from our team. The sales motion stays aligned with the pricing tiers, moving users smoothly from entry-level self-serve assessments to structured, license-readiness modules as their ventures mature.

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

For a visual overview of the full Business Model Canvas, see #link(<appx-business-model-canvas>)[Appendix].

== Financial projections

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


