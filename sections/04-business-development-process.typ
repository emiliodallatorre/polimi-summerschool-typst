= Business development process

#import "../theme.typ": accent, card-stroke, card-fill, card-radius, table-stroke, zebra-fill, rounded-table

== Need and niche identification

Having pivoted away from institutional transaction monitoring, our research shifted towards the operational and financial challenges that early-stage European FinTech ventures face when navigating frameworks such as MiCA, PSD3, DORA, and EMI or PI licensing. Regulatory compliance is a prerequisite for entering the market, yet achieving license readiness is fragmented and resource-intensive, requiring founders to interpret legislation scattered across EUR-Lex, the European Banking Authority, and the European Securities and Markets Authority, with no single reference point bringing these sources together.

Through discovery with founders and experts, we identified a severe gap in how early-stage ventures handle regulatory discovery. These startups operate on tight budgets, making external legal fees of €100,000 to €250,000 completely unaffordable, while researching regulations on their own creates severe legal risks. This identified a clear market gap: an AI-powered diagnostic and projecting tool that helps FinTech founders evaluate compliance risks and prepare for legal sign-off.

== Validation methods

To validate problem-solution fit, willingness to pay, and core assumptions, we conducted 14 exploratory, semi-structured interviews across three stakeholder groups, summarised below.

#figure(
  rounded-table(table(
    columns: (auto, auto, 1fr),
    align: (left, center, left),
    stroke: table-stroke,
    fill: (x, y) => zebra-fill(y),
    table.header(
      text(fill: white, weight: "bold")[Group],
      text(fill: white, weight: "bold")[Participants],
      text(fill: white, weight: "bold")[Role in validation],
    ),
    [FinTech and AI founders], text(fill: accent, weight: "bold")[10], [How small teams handle regulatory research, manage heavy legal costs, and view AI-driven diagnostic tools before hiring lawyers],
    [Banking and finance professionals], text(fill: accent, weight: "bold")[2], [Perspective on institutional compliance workflows and regulatory expectations],
    [Legal experts], text(fill: accent, weight: "bold")[2], [How advisors evaluate client submissions and judge the feasibility of AI-generated compliance reports],
  )),
  caption: [Stakeholder groups interviewed during the validation process],
)

Across all groups, questions centered on four themes: current compliance practices, the time and cost involved, the main pain points in the licensing process, and the tools relied upon before engaging costly legal counsel. Keeping the same thematic anchors across groups allowed us to compare responses consistently despite differing professional backgrounds. Full question sets are provided in the #link(<appx-interview-questions>)[Appendix].

We structured each round of validation as an explicit experiment rather than an open-ended conversation, recording the hypothesis under test, the test itself, the metric observed, and the criteria that would count as confirmation. The #link(<appx-test-cards>)[test cards in the Appendix] document these experiments.

== Key findings that changed our thinking

=== Quantitative validation metrics

Across our 14 interviewees, the metrics strongly confirmed market demand. The table below summarises how many founder interviewees agreed with each statement put to them during the interviews.

#figure(
  rounded-table(table(
    columns: (1fr, auto),
    align: (left, center),
    stroke: table-stroke,
    fill: (x, y) => zebra-fill(y),
    table.header(
      text(fill: white, weight: "bold")[Statement],
      text(fill: white, weight: "bold")[Agreement],
    ),
    [Navigating EU financial regulation before licensing is one of the most time-consuming barriers to launching a FinTech venture], text(fill: accent, weight: "bold")[8 / 10],
    [My startup relies entirely on external legal consultants during discovery, due to a lack of internal expertise], text(fill: accent, weight: "bold")[9 / 10],
    [My startup would actively use an AI platform identifying obligations, flagging gaps, and generating reports for legal review], text(fill: accent, weight: "bold")[8 / 10],
    [Identify continuous post-licensing monitoring as a critical secondary capability], text(fill: accent, weight: "bold")[7 / 10],
    [Expressed explicit willingness to pay if the platform demonstrably cut legal billable hours and accelerated licensing timelines], text(fill: accent, weight: "bold")[9 / 10],
  )),
  caption: [Interview agreement rates across the 14 exploratory interviews],
)

Together, these figures confirmed the problem was a consistent pattern, not an isolated experience.

=== Qualitative insights and stakeholder evidence

Beyond the agreement rates, six accounts reshaped how we framed the problem. Each insight below is paired with the evidence that produced it.

// One filled card per insight, in a single 2-column grid, deliberately reusing
// the same visual language as the `pivot-box` cards further down this section
// via the shared `card-fill`/`card-stroke`/`card-radius` theme tokens. Each
// card is a plain block placed directly as a grid child (not grid.cell) so
// Typst stretches every row to its tallest sibling and keeps a card's title
// glued to its own quote across a page break.
#let insight(title, source, quote) = block(
  width: 100%,
  breakable: false,
  fill: card-fill,
  stroke: card-stroke,
  radius: card-radius,
  inset: 8pt,
)[
  #set par(leading: 0.6em, justify: false)
  #text(size: 9.5pt, weight: "bold", fill: accent)[#title]
  #v(3pt)
  #text(size: 9pt, style: "italic")[#quote]
  #v(3pt)
  #text(size: 9pt, fill: accent.lighten(15%))[--- #source]
]

// Columns pair insights that make the same kind of point: the cost of getting
// compliance wrong, how external counsel reads the tool, how founders behave.
#grid(
  columns: (1fr, 1fr),
  column-gutter: 8pt,
  row-gutter: 8pt,
  insight(
    "Regulatory delay is existential",
    [Peter Grouev, founder, Tapline],
    ["half of our EUR 500K pre-seed round went straight to lawyers \[...\] lost the first two years waiting on BaFin's approval of our custom contract"],
  ),
  insight(
    "Late compliance fixes are ruinous",
    [Simone, financial expert],
    ["The real cost isn't just lawyer fees; it is having to rebuild your entire product architecture six months in because your core feature accidentally breached financial rules."],
  ),
  insight(
    "Counsel sees AI as an efficiency gain",
    [Marco Dalla Torre, senior lawyer],
    ["If a platform can pre-triage a startup's architecture and map compliance gaps into a structured report, we can skip basic research and focus directly on final validation."],
  ),
  insight(
    "Counsel confirmed our approach is feasible",
    [Miroslav Duric, UK and EU qualified lawyer],
    ["A system that captures the relevant features of a company's business model, maps them against applicable compliance requirements, and highlights areas requiring further review is both technically achievable and highly useful in practice."],
  ),
  insight(
    "AI is a pre-consulting bridge",
    [Christine, founder],
    ["AI helps bridge the gap before you talk to human consultants... If you don't understand the details, you can't communicate effectively with an expert."],
  ),
  insight(
    "Founders benchmark against general LLMs",
    [Peter Grouev, founder, Tapline],
    ["Startups don't have much money, so you may need to offer a heavily discounted or near-free entry tier just to build traction."],
  ),
)

#v(4pt)

Read together, these accounts showed that regulatory friction consumes runway rather than merely money, and they positioned ComplAI as an upstream diagnostic layer that shortens legal review instead of replacing human sign-off.

== Pivots

Along the way of our validation process, we made three major pivots in response to the evidence we collected.

#let pivot-box(title, trigger, reasoning) = block(
  width: 100%,
  breakable: false,
  fill: card-fill,
  stroke: card-stroke,
  radius: card-radius,
  inset: 8pt,
)[
  #text(size: 9.5pt, weight: "bold", fill: accent)[#title]
  #v(3pt)
  #text(size: 9pt)[*Trigger:* #trigger]
  #v(2pt)
  #text(size: 9pt)[*Reasoning:* #reasoning]
]

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 8pt,
  pivot-box(
    "1. Human-in-the-loop, not autonomous",
    "Legal experts confirmed no regulator would accept AI output as a binding guarantee.",
    "Repositioned from an autonomous auditor to a prep layer flagging gaps ahead of human sign-off.",
  ),
  pivot-box(
    "2. Freemium Q&A tier",
    "Mentor feedback challenged our single-price model after founder interviews.",
    "Cash-constrained founders benchmark against cheap general LLMs, so we added a low-cost entry tier.",
  ),
  pivot-box(
    "3. Partnering with law firms",
    "Legal experts and accelerator advisers described how startups actually work with lawyers.",
    "Lawyers value pre-screened information, so we reframed them as referral partners, not competitors.",
  ),
)

== Business model evolution

Our first Business Model Canvas still carried an enterprise bias, envisioning high-fee retainers sold to institutions and large legal practices, positioned as an automated replacement for legal advisors. As our validation phase revealed, this approach misunderstood both buyer expectations and regulatory constraints. Financial decision-makers benchmark software against accessible SaaS tools, while legal frameworks demand human-in-the-loop accountability.

These findings reshaped the model into a capital-efficient B2B SaaS architecture targeting early-stage FinTechs of five to fifteen employees navigating licensing. Our value proposition shifted from replacing lawyers to delivering an upstream pre-lawyer diagnostic layer. We restructured our revenue model from a single retainer to a tiered structure: the low-barrier Q&A tier, a core subscription for continuous monitoring, and pay-per-use document generation. 
Finally, our channel strategy shifted from direct outbound enterprise sales to leveraging startup ecosystem hubs and establishing collaborative referral pathways with legal advisors. This process resulted in a scalable, market-validated model aligned with real customer budgets and regulatory constraints.
