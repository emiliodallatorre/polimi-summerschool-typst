= Business model summary

#import "../theme.typ": info-card, stat-badge

Hereafter, we provide a shallow introduction to our business model, through the formalization of the Business Model Canvas. The necessary assumptions, as well as the conclusions that led to the definition of what is in it, are motivated in the #link(<appx-business-model-canvas>)[Appendix].

== Customer segments
ComplAI operates in the B2B market and targets two groups: early-stage FinTech startups, and FinTech companies with an internal legal team seeking to accelerate compliance job.
Because early-stage FinTech ventures rarely have specialized departments, we define this persona at the organizational level rather than around a single buyer role: a pre-seed to Seed-stage FinTech startup, typically a lean team of 5 to 15 employees based within the EU, where purchasing decisions reflect a shared assessment of risk and resource allocation across the founding team rather than one stakeholder's preference. In practice, the typical founder behind this persona is a product-driven entrepreneur, much like our initial case study profile, who possesses strong technical vision but lacks a formal background in European financial regulation. Consequently, the startup's founding team relies on flexible internal team members who step outside their formal titles to manage operational friction, triage compliance complexity, and stretch limited runway.
We target these startups because they face a structural pressure that makes early regulatory alignment a condition for survival rather than an operational nice-to-have. Regulatory frameworks such as DORA and MiCA, combined with licensing rejection rates estimated at 80 to 85 percent @ccn-mica-failure-rate-2025, mean that a poorly documented or non-compliant product architecture can block a launch or sink a license application. At the same time, these ventures operate on constrained runway and cannot absorb the cost of retaining external legal counsel early and continuously. This combination of high regulatory exposure and limited financial capacity to address it through traditional means is what makes early-stage FinTech startups a coherent and urgent customer segment for ComplAI.


== Value proposition

ComplAI helps early-stage start-ups understand what they need to do to become compliant, without having to rely on expensive legal support from day one. It guides them through the initial assessment, highlights possible compliance gaps, and prepares clear documents that lawyers can review and validate. In this way, start-ups can reduce legal costs, move faster through licensing, and make their legal and compliance work more organised and efficient. No existing player combines this depth of FinTech regulatory coverage with a pre-lawyer, product-level diagnostic (see #link(<appx-value-proposition-canvas>)[Appendix] for the complete Value Proposition Canvas).

== Channels

Our market-access strategy rests on three coordinated channels, chosen to achieve efficient customer acquisition without resource-intensive sales overhead.

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 8pt,
  info-card(
    "Hub & accelerator partnerships",
    [Our primary distribution engine: embedding directly into incoming cohorts at TechQuartier in Frankfurt and at the FinTech District, PoliHub, and B4i in Milan, giving us access to pre-screened founders facing imminent licensing requirements.],
  ),
  info-card(
    "Targeted PR & thought leadership",
    [Publishing problem-solution case studies and regulatory analyses in outlets such as Business Insider, to build domain authority and organic brand awareness among founders actively researching alternative compliance solutions.],
  ),
  info-card(
    "FinTech conferences & founder events",
    [Attending focused gatherings such as FinTech Week to engage directly with early-stage builders at the precise moment they are structuring their technical and operational roadmaps, enacting a lobbying activity towards ComplAI.],
  ),
)

We deliberately exclude high-friction channels such as door-to-door sales, manual educational workshops, and open-source maintenance, so the model stays operationally scalable. The product itself is engineered to be self-serve: founders onboard, run diagnostics, and access compliance frameworks without manual. The sales motion stays aligned with the pricing tiers, moving users smoothly from entry-level self-serve assessments to structured, license-readiness modules as their ventures mature.

== Customer relationships

We combine automated tools with personal support to make the experience simple and reliable. Guided onboarding helps founders set up their assessments correctly, while technical support is available for everyday questions. Regular email updates keep users informed about regulatory changes.

// come revenue streams metterei una tabella esplicativa

== Revenue streams

We use a flexible SaaS model with three tiers, giving us steady monthly income while letting clients scale up as they need.

#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 8pt,
  align: (horizon, horizon, horizon),
  stat-badge("€100/mo", "TIER 1 · SELF-SERVE Q&A"),
  stat-badge("€2,500-7,500/mo", "TIER 2 · MONITORING & ALERTS"),
  stat-badge("Pay-per-use", "TIER 3 · ON-DEMAND REPORTS"),
)

== Key resources

Our main tools include an AI search engine, an automated document scanner, and a live database of European and national laws. Supporting this technology is an advisory team of legal experts who help keep our system accurate and up to date.

== Key activities

Our operations focus on three main areas: continuously feeding new laws and regulatory updates into our system, developing the core software and diagnostic tools, and actively building relationships with legal partners and accelerators.

== Key partners

We build partnerships with lawyers to gain expert validation and referrals, while helping them cut down on repetitive research. We also collaborate with startup accelerators and incubators to reach early-stage founders who need licensing guidance.

== Cost structure

Our main spending goes toward running our cloud infrastructure and continuously refining our RAG system for high accuracy and clear source tracking. Beyond technical overhead, our expenses cover keeping regulatory data up to date, ongoing software development, marketing efforts, customer support, and managing key partnerships.

For a visual overview of the full Business Model Canvas, see #link(<appx-business-model-canvas>)[Appendix].

