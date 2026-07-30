= Appendix

#import "../theme.typ": appendix-module, sky-reflection, accent, card-stroke, card-fill, card-radius, table-stroke, zebra-fill, info-card, pill-badge, rounded-table

This appendix collects the supporting evidence referenced throughout the report: question sets, market data, plots, and other material too detailed for the main body. Each item below is a self-contained module with its own label, so it can be linked to directly from the relevant paragraph in the report rather than making the reader search for it.

// Each module below carries a label (e.g. `<appx-interview-questions>`) so it
// can be linked to from the report body with `#link(<appx-interview-questions>)[...]`.

#appendix-module[Interview question sets][
  Validation interviews were structured around four core research questions:

  - How do you currently approach regulatory compliance
  - What are the main pain points during the licensing process
  - What specific tools or resources do you rely on prior to retaining expensive legal counsel
  - Would you be willing to pay for an AI-powered regulatory diagnostic platform
] <appx-interview-questions>

// ---------------------------------------------------------------------------
// Test card (Strategyzer format): one experiment per card, recording the
// hypothesis, the test that probes it, the metric observed, and the success
// criteria together with the outcome. Every field is optional: a card called
// with no arguments renders blank but keeps writing room in each field, so
// cards can be laid out first and filled in later.
//
//   #test-card(1)                                    // blank card
//   #test-card(2, title: "Willingness to pay",       // filled card
//     hypothesis: [...], test: [...],
//     metric: [...], criteria: [...], status: "Validated")
//
#let tc-blank-height = 0.9cm

#let test-card(
  number,
  title: none,
  hypothesis: none,
  test: none,
  metric: none,
  criteria: none,
  status: none,
) = block(
  width: 100%,
  breakable: false,
  stroke: card-stroke,
  radius: card-radius,
  clip: true,
  below: 1em,
)[
  // Header strip: card number and subject line on the left, the experiment's
  // current status as a badge on the right.
  // `sticky` keeps it attached to the table that follows.
  #block(width: 100%, fill: accent, inset: (x: 10pt, y: 6pt), sticky: true, below: 0pt)[
    #grid(
      columns: (1fr, auto),
      align: (left + horizon, right + horizon),
      text(size: 9pt, weight: "bold", fill: white)[
        Test card #number
        #if title != none [
          #h(0.4em) · #h(0.4em) #title
        ]
      ],
      if status != none {
        box(
          fill: white.transparentize(80%),
          stroke: 0.5pt + white.transparentize(50%),
          inset: (x: 5pt, y: 2.5pt),
          radius: 2pt,
        )[#text(size: 7.5pt, weight: "bold", fill: white)[#upper(status)]]
      },
    )
  ]
  #let field(label, hint, value) = (
    text(size: 9.5pt, weight: "bold", fill: accent)[#label],
    if value == none {
      // Prompt phrasing, then blank writing room. The space is added inside
      // the cell rather than fixed as a row height, so a filled field can
      // grow past it instead of being clipped.
      [
        #text(size: 9pt, style: "italic", fill: sky-reflection.darken(10%))[#hint]
        #v(tc-blank-height)
      ]
    } else {
      text(size: 9pt)[#value]
    },
  )

  #table(
    columns: (3.3cm, 1fr),
    align: left + top,
    stroke: 0.6pt + accent.lighten(60%),
    inset: (x: 8pt, y: 7pt),
    // Label column tinted so the four fields stay legible while the card is
    // still blank and the right-hand column is empty.
    fill: (x, y) => if x == 0 { card-fill },
    ..field("Hypothesis", "We believe that…", hypothesis),
    ..field("Test", "To verify that, we will…", test),
    ..field("Metric", "And measure…", metric),
    ..field("Criteria & outcome", "We are right if… — what we observed:", criteria),
  )
]

#appendix-module[Validation test cards][
  Each experiment run during validation is recorded on its own test card, stating the hypothesis under test, how we probed it, what we measured, and the threshold that would count as confirmation, alongside what we actually observed.

  #v(0.4em)
  #test-card(
    1,
    title: "Pre-launch compliance bottleneck",
    status: "Validated",
    hypothesis: [For early-stage FinTech founders, the primary source of delay and expense is navigating regulatory compliance rather than developing the core technical infrastructure.],
    test: [Structured discovery interviews with early-stage FinTech founders, banking and finance professionals, and legal practitioners.],
    metric: [The share of founders citing compliance as their primary pre-launch barrier and resource drain.],
    criteria: [We are right if 80% of founders report regulatory compliance as a higher friction factor than technical product development.

      *Outcome:* validated. 8 of 10 founders identified regulatory navigation, not engineering, as the binding constraint before launch.],
  )
  #test-card(
    2,
    title: "Legal cost burden",
    status: "Validated",
    hypothesis: [Traditional legal billable hours, at €300 to €600 per hour, are cost-prohibitive for early-stage FinTechs, forcing founders to choose between existential legal costs and deploying unverified product logic.],
    test: [Budget and cost-structure analysis through founder interviews, benchmarked against advisory pricing.],
    metric: [The proportion of founders identifying initial legal licensing and advisory fees as unaffordable on a pre-seed or seed budget.],
    criteria: [We are right if at least 60% of early-stage teams identify traditional legal fees as a blocker to proper regulatory verification before deployment.

      *Outcome:* validated, and by a wider margin than our threshold. 9 of 10 founders reported relying entirely on external counsel while treating its cost as prohibitive.],
  )
  #test-card(
    3,
    title: "Landing page color",
    status: "Ongoing",
    hypothesis: [A blue landing page generates more trust, and so converts better, than a green one.],
    test: [Two otherwise identical versions of the landing page, differing only in primary color: blue in one, green in the other.],
    metric: [The difference in appreciation rate between the two versions.],
    criteria: [We are right if the blue version achieves an appreciation rate at least 20% higher than the green one.

      *Outcome:* validation ongoing at the time of writing.],
  )
] <appx-test-cards>

#appendix-module[Market sizing estimate][
  We size the 2025 EU market for an AI regulatory-compliance assistant targeting startups and SMEs with a bottom-up model, then anchor our planning on its base scenario. The model starts from the EU SME universe, narrows it to companies with recurring compliance intensity (regulated sectors, cross-border operations, and compliance-sensitive digital firms), and applies an annual compliance spend per company across three non-overlapping buckets: external legal counsel, internal compliance labor, and compliance software/regtech:

$ "TAM" = N_"eligible companies" times (C_"legal" + C_"internal labor" + C_"software") $

Applying this formula across low, base, and high scenarios yields the following outputs.

#figure(
  rounded-table(table(
    // Scenario and eligible-company count share one column: as separate
    // columns the two headers collided, and the count is really just a
    // property of the scenario rather than an independent variable.
    columns: (auto, auto, auto, auto, auto, auto),
    align: (left, center, center, center, center, center),
    stroke: table-stroke,
    fill: (x, y) => zebra-fill(y),
    table.header(
      text(fill: white, weight: "bold")[Scenario (eligible companies)],
      text(fill: white, weight: "bold")[Legal (€)],
      text(fill: white, weight: "bold")[Internal labor (€)],
      text(fill: white, weight: "bold")[Software (€)],
      text(fill: white, weight: "bold")[Total spend/company (€)],
      text(fill: white, weight: "bold")[TAM (€Bn/year)],
    ),
    [Low — 6.0M], [1,000], [1,500], [800], [3,300], text(fill: accent, weight: "bold")[19.8],
    [Base — 8.0M], [1,500], [2,500], [1,250], [5,250], text(fill: accent, weight: "bold")[42.0],
    [High — 10.0M], [2,000], [4,000], [1,400], [7,400], text(fill: accent, weight: "bold")[74.0],
  )),
  caption: [TAM scenarios for the EU AI regulatory-compliance assistant market],
)

While this mechanical range is broad, we frame a tighter investable band of roughly €21–54Bn/year to reflect uncertainty on how many SMEs truly face recurring regulatory complexity. For strategic planning, fundraising narrative, and the downstream SAM/SOM conversion below, we anchor on the base case: a €42.0Bn/year TAM, with sensitivity around company count and internal compliance effort.

This estimate is grounded in public sources: the EU SME population from the European Commission's Annual Report on European SMEs @ec-sme-report-2025, enterprise-structure context from Eurostat's Structural Business Statistics @eurostat-sbs, segmentation support from JRC evidence @jrc-147223, compliance-burden benchmarking from the European Parliament's tax compliance cost study @ep-tax-compliance-cost-2023, and regulatory-cost intensity checks from Intellera's AI Act cost analysis @intellera-ai-act-cost-2024.

For SAM, we narrow to the segment we can serve immediately: EU fintech startups and small fintech enterprises with recurring compliance demand. Using the same bottom-up method as TAM, we model SAM as the number of in-scope fintech firms times the annual compliance spend per firm, split into the same three non-overlapping buckets:

$ "SAM" = N_"EU fintech firms" times (C_"legal" + C_"internal labor" + C_"software") $

#figure(
  rounded-table(table(
    columns: (1fr, auto, auto, auto),
    align: (left, center, center, center),
    stroke: table-stroke,
    fill: (x, y) => zebra-fill(y),
    table.header(
      text(fill: white, weight: "bold")[Scenario],
      text(fill: white, weight: "bold")[In-scope fintech firms],
      text(fill: white, weight: "bold")[Spend per firm/year],
      text(fill: white, weight: "bold")[SAM],
    ),
    [Low], [10,000], [€6,500], text(fill: accent, weight: "bold")[€65.0M],
    [Base], [10,000], [€11,000], text(fill: accent, weight: "bold")[€110.0M],
    [High], [10,000], [€15,700], text(fill: accent, weight: "bold")[€157.0M],
  )),
  caption: [SAM scenarios for EU fintech startups and small enterprises],
)

On this basis, we use the base scenario for planning: €110.0M/year. The full mechanical range is €0.9–4.4Bn; for investor communication, a tighter planning band of roughly €1.2–3.7Bn is reasonable depending on how strictly we define "fintech startups/small enterprises" and regulatory intensity. Key references used: EU fintech ecosystem mapping via the EU Digital Finance Platform's Fintech Map @ec-fintech-map, compliance cost evidence from the EBA's report on supervisory reporting compliance costs @eba-supervisory-reporting-cost, and market context from Finch Capital's State of European Fintech 2025 @finch-capital-fintech-2025.

Our immediate go-to-market strategy targets Germany and Italy. Germany retains a leading position in the European fintech ecosystem, and together with Italy, these two markets provide a highly concentrated pool of early adopters. We assume Germany and Italy jointly represent roughly 30% of the European SAM, and for planning purposes we define our SOM as this combined DE + IT market directly:

$ "SOM" = "DE" + "IT" $

#figure(
  rounded-table(table(
    columns: (1fr, 1.2fr),
    align: (center, center),
    stroke: table-stroke,
    fill: (x, y) => zebra-fill(y),
    table.header(
      text(fill: white, weight: "bold")[Scenario],
      text(fill: white, weight: "bold")[DE + IT SOM (€M/year)],
    ),
    [Low], text(fill: accent, weight: "bold")[€19.5M],
    [Base], text(fill: accent, weight: "bold")[€33.0M],
    [High], text(fill: accent, weight: "bold")[€47.1M],
  )),
  caption: [SOM scenarios for the German and Italian fintech markets],
)

Our investable SOM target for the next one to three years is €33.0M ARR (base case), corresponding to the combined German and Italian market we define as our near-term opportunity.
] <appx-market>

#let bmc-bullets(items) = {
  set text(size: 9pt)
  for item in items [
    - #item
  ]
}

#let bmc-cell-content(title, items) = [
  #text(size: 9.5pt, weight: "bold", fill: accent)[#title]
  #v(3pt)
  #bmc-bullets(items)
]

// Some Business Model Canvas boxes (Key activities/Key resources, Customer
// relationships/Channels) are conventionally split top/bottom within the same
// column. Stacking them inside one cell keeps the whole canvas a single-row
// table, whose cells always stretch to a shared row height automatically.
#let bmc-dual-cell(title-a, items-a, title-b, items-b) = [
  #text(size: 9.5pt, weight: "bold", fill: accent)[#title-a]
  #v(3pt)
  #bmc-bullets(items-a)
  #v(6pt)
  #line(length: 100%, stroke: 0.5pt + accent.lighten(55%))
  #v(6pt)
  #text(size: 9.5pt, weight: "bold", fill: accent)[#title-b]
  #v(3pt)
  #bmc-bullets(items-b)
]

#appendix-module[Business model canvas][
  #rounded-table(stroke: card-stroke, block(breakable: false)[
    #table(
      columns: (1fr, 1fr, 1fr, 1fr, 1fr),
      align: left + top,
      stroke: card-stroke,
      inset: 6pt,
      fill: card-fill,
      bmc-cell-content(
        "Key partners",
        (
          "Partnerships with law firms and consulting firms",
          "Partnerships with startup accelerators and incubators",
        ),
      ),
      bmc-dual-cell(
        "Key activities",
        (
          "Continuous regulatory ingestion",
          "Partnership development",
          "Software development",
        ),
        "Key resources",
        (
          "RAG-based legal search system",
          "EU regulatory database",
          "Automated document processing pipeline",
          "AI compliance engine",
          "Legal / RegTech advisory network",
        ),
      ),
      bmc-cell-content(
        "Value proposition",
        (
          "Help assess compliance of early-stage startups",
          "Cut legal consulting costs",
          "Generate documents ready for legal review and licensing",
          "Accelerate internal legal and compliance workflows",
        ),
      ),
      bmc-dual-cell(
        "Customer relationships",
        (
          "Guided onboarding",
          "Customer community",
          "Technical support",
          "Email updates",
        ),
        "Channels",
        (
          "Hub & accelerator",
          "Digital acquisition & inbound PR",
          "FinTech conferences & community",
        ),
      ),
      bmc-cell-content(
        "Customer segments",
        (
          "Early-stage FinTech startups applying for MiCA, PSD3, EMI, or PI licenses",
          "FinTech companies with an internal legal team seeking to accelerate compliance work",
        ),
      ),
      table.cell(colspan: 3)[#bmc-cell-content(
        "Cost structure",
        (
          "Cloud infrastructure and data storage",
          "RAG optimisation",
          "Marketing campaigns",
        ),
      )],
      table.cell(colspan: 2)[#bmc-cell-content(
        "Revenue streams",
        (
          "Tier 1 diagnostic SaaS: €100/mo self-serve Q&A",
          "Tier 2 continuous alerts: €2.5k–7.5k/mo",
          "Tier 3 document generation: pay per use",
        ),
      )],
    )
  ])
] <appx-business-model-canvas>

#pagebreak()

#appendix-module[Value proposition canvas][
  The canvas below maps ComplAI's value map (products & services, gain creators, pain relievers) against the customer profile of our early-stage FinTech target segment (customer jobs, gains, pains).

  #rounded-table(stroke: card-stroke, table(
    columns: (1fr, 1fr),
    align: left + top,
    stroke: card-stroke,
    inset: 6pt,
    table.cell(fill: accent.lighten(85%))[#text(size: 9.5pt, weight: "bold", fill: accent)[Value map]],
    table.cell(fill: sky-reflection.lighten(75%))[#text(size: 9.5pt, weight: "bold", fill: accent)[Customer profile]],
    table.cell(fill: accent.lighten(90%))[#bmc-cell-content(
      "Products & services",
      (
        "Chatbot assessment paired with ready-to-review document generation",
        "Continuous monitoring of official EU regulatory sources",
      ),
    )],
    table.cell(fill: sky-reflection.lighten(85%))[#bmc-cell-content(
      "Customer jobs",
      (
        "Assess and prepare compliance documentation for EU regulatory requirements",
        "Stay compliant as regulation evolves across member states and as the product evolves",
      ),
    )],
    table.cell(fill: accent.lighten(90%))[#bmc-cell-content(
      "Gain creators",
      (
        "Lawyer involvement reduced to final validation only",
        "Early alignment with upcoming rules before they take effect",
      ),
    )],
    table.cell(fill: sky-reflection.lighten(85%))[#bmc-cell-content(
      "Gains",
      (
        "Minimised legal costs",
        "Anticipation of upcoming regulation",
        "Peace of mind throughout the process",
      ),
    )],
    table.cell(fill: accent.lighten(90%))[#bmc-cell-content(
      "Pain relievers",
      (
        "Plain-language translation of legal requirements",
        "Automated research, cutting hours of manual consultation",
        "Up to 60% lower cost than traditional legal consulting",
      ),
    )],
    table.cell(fill: sky-reflection.lighten(85%))[#bmc-cell-content(
      "Pains",
      (
        "Regulatory fragmentation is hard to understand",
        "Compliance work is time-consuming",
        "High cost relative to lawyer consultancy",
      ),
    )],
  ))
] <appx-value-proposition-canvas>

#appendix-module[Key performance indicators][
  To measure how effectively ComplAI solves the core compliance bottleneck for early-stage FinTechs, the KPI framework prioritises problem-resolution efficacy over simple usage volume.

  #v(0.4em)
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 8pt,
    info-card(
      "Regulatory Issue Remediation Rate",
      [Tracks the percentage of identified regulatory gaps that founding teams successfully resolve using ComplAI's diagnostic recommendations. A high resolution rate confirms that the output is actionable and directly eliminates compliance risks in product logic, in advance with respect to market launch.],
    ),
    info-card(
      "Legal Verification Acceptance Rate",
      [Measures the proportion of ComplAI-generated diagnostic reports approved by external legal counsel without requiring major rework. A high acceptance rate directly validates the "pre-lawyer" value proposition, proving that the platform genuinely reduces billable legal hours and advisory friction.],
    ),
    info-card(
      "First-Time Submission Pass Rate",
      [Evaluates the proportion of regulatory filings and licensing applications pre-audited through ComplAI that pass initial regulator screening without rejection. High first-time pass rates demonstrate that the platform effectively solves the complex burden of EU regulatory compliance.],
    ),
  )
] <appx-kpi>

#appendix-module[Competitor analysis][
  The European RegTech market for early-stage FinTech compliance remains fragmented across four competitive groups, none of which delivers a complete solution for founders navigating product-level regulatory risk.

  Traditional legal providers (law firms and consultancies) dominate through authority and institutional trust, but they operate via slow, manual billable hours costing €300 to €600 per hour and €50,000 to €250,000 or more per licensing application. This cost structure prices out early-stage teams and contributes to the 80 to 85 percent failure or withdrawal rate seen in initial MiCA license applications @ccn-mica-failure-rate-2025, many of which fail due to poor submission quality rather than substantive risk.

  Direct compliance competitors like Kalipso.ai and ÀLIA represent our closest conceptual rivals, yet both preserve critical structural limitations for early stage FinTech startups. Kalipso.ai operates primarily as a static document workspace that tracks regulatory text changes, remaining detached from live product logic and engineering workflows. Meanwhile, ÀLIA functions as a tech-enabled consultancy that pairs software with mandatory human legal review, keeping the high billable-hour bottleneck firmly intact. Crucially, neither platform evaluates how a startup's underlying technical architecture and code logic trigger specific regulatory obligations before deployment.

  Legal AI for lawyers (Harvey, Legora, Noxtua) offer genuinely powerful LLM tooling for research and contract drafting, but they are built for legal professionals working inside law firms, not for founders or engineering teams. Their workflows assume a lawyer as the end user, leaving a structural gap between legal research capability and product development cycles.

  Horizontal security platforms such as Vanta, Drata, and Naq Cyber are great at automating basic standards like SOC 2 and ISO 27001, but they fall short when it comes to financial regulations. Because their software was built for broad cybersecurity compliance, it cannot assess complex financial rules. It has no way to evaluate tokenomics models, check MiCA regulatory thresholds, or navigate PSD3 licensing requirements.

  #v(0.4em)
  #figure(
    rounded-table(table(
      // The capability column is prose and reads badly when hyphenated, so
      // it takes the width it needs while the segment columns share what's
      // left and wrap their headers over two lines instead.
      columns: (auto, 1fr, 1fr, 1fr, 1fr, auto),
      align: (left + horizon, center + horizon, center + horizon, center + horizon, center + horizon, center + horizon),
      stroke: table-stroke,
      fill: (x, y) => zebra-fill(y),
      table.header(
        text(fill: white, weight: "bold")[Capability],
        text(fill: white, weight: "bold")[Traditional law firms],
        text(fill: white, weight: "bold")[Horizontal SaaS],
        text(fill: white, weight: "bold")[Lawyer AI assistants],
        text(fill: white, weight: "bold")[Direct RegTech tools],
        text(fill: white, weight: "bold")[ComplAI],
      ),
      [FinTech regulatory depth (MiCA / DORA)], [✓], [✗], [○], [✓], text(fill: accent, weight: "bold")[✓],
      [Grounded EU vector RAG engine], [✗], [✗], [○], [○], text(fill: accent, weight: "bold")[✓],
      [Product engineering logic diagnostic], [✗], [✗], [✗], [✗], text(fill: accent, weight: "bold")[✓],
      [Pre-lawyer "red/green" risk triage], [✗], [✗], [✗], [○], text(fill: accent, weight: "bold")[✓],
      [Startup-accessible self-serve pricing], [✗], [✓], [✗], [○], text(fill: accent, weight: "bold")[✓],
      [Jurisdiction document compilation], [✓], [✗], [○], [○], text(fill: accent, weight: "bold")[✓],
    )),
    caption: [Competitive comparison by market segment (✓ full, ○ partial, ✗ none)],
  )

  ComplAI is positioned to occupy the space these four groups leave open: a "pre-lawyer" diagnostic layer that evaluates financial product logic against EU regulation directly, before code ships and before a lawyer is retained.
] <appx-competitor-analysis>

#let regs-subhead(title) = [
  #text(size: 10.5pt, weight: "bold", fill: accent)[#title]
  #v(0.25em)
]

#let risk-card(title, body) = info-card(title, body)

#let framework-badge(code) = pill-badge(code)

#appendix-module[Regulation and risks][
  ComplAI operates in a highly regulated environment, since it provides AI-powered compliance support to European startups, initially FinTech companies. Our customers may fall under several overlapping EU frameworks, which our regulatory coverage has to track:

  #v(0.4em)
  #align(center)[
    #stack(
      dir: ltr,
      spacing: 8pt,
      framework-badge("GDPR"),
      framework-badge("DORA"),
      framework-badge("NIS2"),
      framework-badge("PSD2 / PSD3"),
      framework-badge("MiCA"),
      framework-badge("DSA"),
      framework-badge("DMA"),
    )
  ]
  #v(0.8em)

  #regs-subhead[Regulatory considerations]

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 0.8cm,
    row-gutter: 1.6em,
    [
      *Legal-service positioning.* ComplAI is positioned as a compliance-support platform, not as a replacement for qualified legal advice. Since its assessments and generated documents can influence licensing and market-entry decisions, the limits of the service have to be stated clearly to every user.
    ],
    [
      *Data protection and confidentiality.* The platform processes business models, legal documents and information about our customers' operations. This creates substantial GDPR obligations around lawful processing, data minimisation, confidentiality, retention, access control and security.
    ],
    [
      *AI transparency and accountability.* Every answer cites the regulatory sources supporting it, and we keep records of how each recommendation was produced. The system retrieves the relevant passages before combining them with the user's own information, which keeps outputs grounded and auditable.
    ],
    [
      *Regulatory updates.* The service depends on access to current official EU texts through a continuously refreshed RAG pipeline. Regulations and supervisory guidance change often, and an outdated source would translate directly into an incorrect compliance recommendation that the customer cannot detect.
    ],
  )

  #v(0.7em)
  *National legal differences.* The document-generation service targets country-specific filing and submission formats, so ComplAI has to account for the gap between EU-level legislation and the national laws, procedures and templates that implement it.

  #v(1em)
  #regs-subhead[Main risks]

  #v(0.2em)
  #grid(
    columns: (1fr, 1fr),
    gutter: 8pt,
    risk-card("Incorrect or incomplete outputs", [
      The model may misread a regulation, overlook an exception or miss context that changes the conclusion, leading customers to make non-compliant product or operational decisions.
    ]),
    risk-card("Excessive user reliance", [
      Customers may treat our output as definitive legal advice. This creates liability and reputational exposure, especially where the decision concerns licences, regulatory filings or market access.
    ]),
    risk-card("Outdated information", [
      If the regulatory database is not refreshed quickly enough, the system may answer on the basis of superseded laws, guidance or implementation dates that no longer apply to the customer.
    ]),
    risk-card("Privacy and cybersecurity risk", [
      ComplAI stores confidential legal, financial and operational information. A breach or misuse of customer documents would mean regulatory penalties and a loss of trust that is hard to recover.
    ]),
    risk-card("Document-generation risk", [
      Automatically generated compliance documents may contain errors or fail to satisfy the formal requirements of the receiving authority, delaying or invalidating a submission.
    ]),
    risk-card("Jurisdictional complexity", [
      A recommendation that holds in one member state may not fully apply in another, because of differences in national implementation, supervisory practice or local legal requirements.
    ]),
    grid.cell(colspan: 2, risk-card("Liability and reputational damage", [
      If a customer suffers a fine, a licensing delay or blocked market access after relying on ComplAI, we could face disputes, compensation claims and reputational harm, which are exactly the consequences of non-compliance our product exists to prevent.
    ])),
  )

  #v(1em)
  #block(breakable: false)[
    #regs-subhead[Risk-mitigation measures]

    To keep this exposure manageable, ComplAI commits to:

    #v(0.2em)
    #block(
      width: 100%,
      breakable: false,
      fill: card-fill,
      stroke: card-stroke,
      radius: card-radius,
      inset: 10pt,
    )[
      #set text(size: 9pt)
      - Draw only on official, regularly updated regulatory sources
      - Cite those sources and explain the basis of every recommendation
      - State clearly, in-product and contractually, that the platform does not replace professional legal advice
      - Require human legal review for high-risk outputs and for any regulatory submission
      - Implement strong encryption, access controls and data-retention policies
      - Test regularly for accuracy, hallucinations and missing regulatory context
      - Maintain audit logs and version histories for both regulations and generated outputs
    ]
  ]
] <appx-regulations>