= Business development process

#import "../theme.typ": accent, sky-reflection

== Need and niche identification

Having pivoted away from institutional transaction monitoring, our research shifted towards the operational and financial challenges that early-stage European FinTech ventures face when navigating frameworks such as MiCA, PSD3, DORA, and EMI or PI licensing. Regulatory compliance is a prerequisite for entering the market, yet achieving license readiness is fragmented and resource-intensive, requiring founders to interpret legislation scattered across EUR-Lex, the European Banking Authority, and the European Securities and Markets Authority, with no single reference point bringing these sources together.

Through discovery with founders and experts, we identified a severe gap in how early-stage ventures handle regulatory discovery. These startups operate on tight budgets, making external legal fees of €100,000 to €250,000 completely unaffordable, while researching regulations on their own creates severe legal risks. This identified a clear market gap: an AI-powered diagnostic and projecting tool that helps FinTech founders evaluate compliance risks and prepare for legal sign-off.

== Validation methods

To validate problem-solution fit, willingness to pay, and core assumptions, we conducted 14 exploratory, semi-structured interviews across three stakeholder groups, summarised below.

#figure(
  table(
    columns: (auto, auto, 1fr),
    align: (left, center, left),
    stroke: 0.6pt + sky-reflection.lighten(30%),
    fill: (x, y) => if y == 0 {
      sky-reflection
    } else if calc.even(y) {
      sky-reflection.lighten(88%)
    } else {
      white
    },
    table.header(
      text(fill: white, weight: "bold")[Group],
      text(fill: white, weight: "bold")[Participants],
      text(fill: white, weight: "bold")[Role in validation],
    ),
    [FinTech and AI founders], text(fill: accent, weight: "bold")[10], [How small teams handle regulatory research, manage heavy legal costs, and view AI-driven diagnostic tools before hiring lawyers],
    [Banking and finance professionals], text(fill: accent, weight: "bold")[2], [Perspective on institutional compliance workflows and regulatory expectations],
    [Legal experts], text(fill: accent, weight: "bold")[2], [How advisors evaluate client submissions and judge the feasibility of AI-generated compliance reports],
  ),
  caption: [Stakeholder groups interviewed during the validation process],
)

Across all groups, questions centered on four themes: current compliance practices, the time and cost involved, the main pain points in the licensing process, and the tools relied upon before engaging costly legal counsel. Keeping the same thematic anchors across groups allowed us to compare responses consistently despite differing professional backgrounds. Full question sets are provided in the #link(<appx-interview-questions>)[Appendix].

== Key findings that changed our thinking

=== Quantitative validation metrics

Across our 14 interviewees, the metrics strongly confirmed market demand. The table below summarises how many interviewees agreed with each statement put to them during the interviews.

#figure(
  table(
    columns: (1fr, auto),
    align: (left, center),
    stroke: 0.6pt + sky-reflection.lighten(30%),
    fill: (x, y) => if y == 0 {
      sky-reflection
    } else if calc.even(y) {
      sky-reflection.lighten(88%)
    } else {
      white
    },
    table.header(
      text(fill: white, weight: "bold")[Statement],
      text(fill: white, weight: "bold")[Agreement],
    ),
    [Navigating EU financial regulation before licensing is one of the most time-consuming barriers to launching a FinTech venture], text(fill: accent, weight: "bold")[11 / 14],
    [My startup relies entirely on external legal consultants during discovery, due to a lack of internal expertise], text(fill: accent, weight: "bold")[12 / 14],
    [My startup would actively use an AI platform identifying obligations, flagging gaps, and generating reports for legal review], text(fill: accent, weight: "bold")[11 / 14],
    [I identify continuous post-licensing monitoring as a critical secondary capability], text(fill: accent, weight: "bold")[10 / 14],
    [Expressed explicit willingness to pay if the platform demonstrably cut legal billable hours and accelerated licensing timelines], text(fill: accent, weight: "bold")[12 / 14],
  ),
  caption: [Interview agreement rates across the 14 exploratory interviews],
)

Together, these figures confirmed the problem was a consistent pattern, not an isolated experience.

=== Qualitative insights and stakeholder evidence

Regulatory delay is an existential risk for early startups. Our interview with Peter Grouev, founder of Tapline, revealed that regulatory friction is a primary cause of startup failure, not merely an expense. Peter explained that "half of our EUR 500K pre-seed round went straight to lawyers," and separately noted that his team "lost the first two years waiting on BaFin's approval of our custom contract." His experience showed how regulatory delays consume critical runway, leaving startups vulnerable to competitors in lighter regulatory regimes.

Founders use AI as a pre-consulting bridge. Christine, a founder we interviewed, explained that early founders rely on AI to gain basic domain literacy before engaging expensive human experts: "AI helps bridge the gap before you talk to human consultants... If you don't understand the details, you can't communicate effectively with an expert."

External legal counsel views AI as an efficiency enabler. Marco Dalla Torre (Senior Lawyer) confirmed that founders often arrive with unstructured business models, forcing lawyers to spend dozens of billable hours on basic explanations. As they noted: "If a platform can pre-triage a startup's architecture and map compliance gaps into a structured report, we can skip basic research and focus directly on final validation." This validated ComplAI's positioning as an upstream efficiency tool, not a replacement for legal sign-off.

External legal counsel validated ComplAI's value proposition. Miroslav Duric, an experienced UK and EU qualified lawyer with a strong background in financial services and cross-border legal matters, confirmed that ComplAI is both feasible and practically useful in addressing inefficiencies in the early assessment of complex legal questions. As he noted: "A system that captures the relevant features of a company's business model, maps them against applicable compliance requirements, and highlights areas requiring further review is both technically achievable and highly useful in practice."

Fixing compliance after product launch is prohibitively expensive. Simone (Financial Expert) emphasized the operational danger of late-stage compliance adjustments, stating: "The real cost isn't just lawyer fees; it is having to rebuild your entire product architecture six months in because your core feature accidentally breached financial rules."

Pricing expectations and the LLM benchmark. Peter Grouev also forced us to re-evaluate our pricing assumptions, pointing out that founders compare specialized tools to general AI models such as Claude Sonnet: "Startups don't have much money, so you may need to offer a heavily discounted or near-free entry tier just to build traction."

== Pivots

Along the way of our validation process, we made three major pivots in response to the evidence we collected.

#let pivot-box(title, trigger, reasoning) = block(
  width: 100%,
  breakable: false,
  fill: sky-reflection.lighten(88%),
  stroke: 0.6pt + accent.lighten(40%),
  radius: 4pt,
  inset: 8pt,
)[
  #text(size: 9pt, weight: "bold", fill: accent)[#title]
  #v(3pt)
  #text(size: 7.5pt)[*Trigger:* #trigger]
  #v(2pt)
  #text(size: 7.5pt)[*Reasoning:* #reasoning]
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

Our first Business Model Canvas still carried an enterprise bias, envisioning high-fee retainers sold to institutions and large legal practices, positioned as an automated replacement for legal advisors. Validation interviews quickly disproved this: CFOs negotiate legal spend aggressively, benchmark AI pricing against generalist tools, and operate under frameworks mandating human-in-the-loop accountability.

These findings reshaped the model into a capital-efficient B2B SaaS architecture targeting early-stage FinTechs of five to fifteen employees navigating MiCA, PSD3, and EMI or PI licensing. Our value proposition shifted from replacing lawyers to delivering an upstream pre-lawyer diagnostic layer. Pricing moved from a single retainer to a tiered structure: the low-barrier Q&A tier, a core subscription for continuous monitoring, and pay-per-use document generation. Distribution shifted from outbound sales to embedding within accelerators like TechQuartier and PoliHub, with law firms repositioned as referral partners. This process resulted in a scalable, market-validated model aligned with real customer budgets and regulatory constraints.
