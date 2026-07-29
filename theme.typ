// ---- Theme / formatting rules ----
// A report theme for "ComplAI", built around a single accent color and the
// company logo. Import this file and apply `#show: theme` at the top of the
// document, then start the report with `#titlepage(...)`.
//
// The report will never be printed, so decorative elements (bars, panels)
// are allowed to bleed all the way to the physical page edge via the page
// `background` field. The text margins set below are the one thing that
// must stay untouched.

// Official ComplAI palette. `accent` (vintage-grape) stays the primary color
// used across the theme; the others are available for charts, callouts,
// highlights, etc. throughout the report.
#let vintage-grape = rgb("#4F3B63")
#let sky-reflection = rgb("#86BBD8")
#let honey-bronze = rgb("#F6AE2D")
#let classic-crimson = rgb("#D72638")

#let accent = vintage-grape
#let logo = image("assets/logo.png")
// Helvetica, falling back to the metric-compatible "TeX Gyre Heros" (installed
// in the devcontainer via the fonts-texgyre package) if true Helvetica isn't
// available, then to other common sans-serif fonts.
#let font = ("Helvetica", "TeX Gyre Heros", "Arial", "Liberation Sans")

// ---------------------------------------------------------------------------
// Full-bleed decorative bars, drawn behind the page content, edge to edge,
// independent of the text margins. The bottom bar doubles as the footer: the
// logo, company name and page number sit directly inside that solid strip
// instead of floating above it with a separate rule.
#let footer-bar-height = 1.1cm

#let page-background(show-number: true) = context [
  #place(top + left, rect(width: 100%, height: 0.45cm, fill: gradient.linear(accent, white)))
  #place(bottom + left, block(
    width: 100%,
    height: footer-bar-height,
    fill: gradient.linear(accent, white),
    inset: (left: 3cm, right: 2cm),
  )[
    #set text(size: 8pt, font: font)
    #align(horizon)[
      #grid(
        columns: (1fr, 1fr),
        align: (horizon + left, horizon + right),
        [#text(fill: white)[*ComplAI*]],
        [#if show-number [
          #text(fill: accent.darken(20%))[#counter(page).display("1 / 1", both: true)]
        ]],
      )
    ]
  ])
]

// ---------------------------------------------------------------------------
// Main theme: page setup, typography, headings, footnotes, captions, tables.
#let theme(doc) = {
  set page(
    margin: (top: 2.5cm, bottom: 2.5cm, left: 3cm, right: 2cm),
    footer: none,
    numbering: none,
    background: page-background(),
  )

  // Body text: Helvetica, 11pt, 1.5 line spacing
  set text(font: font, size: 11pt, fill: rgb("#1A1A1A"))
  set par(leading: 0.975em, justify: true) // 0.65em (default) * 1.5


  // Links and lists pick up the theme color.
  show link: set text(fill: accent)
  set list(marker: text(fill: accent)[•])
  set enum(numbering: n => text(fill: accent, weight: "bold")[#n.])

  // Heading level 1: 14pt, bold, accent color, with a colored rule underneath.
  show heading.where(level: 1): it => {
    v(1.2em)
    text(size: 14pt, weight: "bold", fill: accent)[#it.body]
    v(-0.6em)
    line(length: 100%, stroke: 1pt + accent)
    v(0.6em)
  }
  // Heading level 2: 12pt, bold, accent color.
  show heading.where(level: 2): set text(size: 12pt, weight: "bold", fill: accent.darken(10%))
  // Heading level 3+: 11pt, bold, plain color, for anything deeper.
  show heading.where(level: 3): set text(size: 11pt, weight: "bold")

  // Footnotes: 9pt, single spacing
  show footnote.entry: set text(size: 9pt)
  show footnote.entry: set par(leading: 0.65em)

  // Captions: 9pt, single spacing, accent-colored label.
  show figure.caption: set text(size: 9pt)
  show figure.caption: set par(leading: 0.65em)
  show figure.caption: it => text(fill: accent.darken(10%))[*#it.supplement #it.counter.display(it.numbering)*#it.separator#it.body]

  // Tables: single spacing, accent-colored border.
  show table.cell: set par(leading: 0.65em)
  set table(stroke: 0.6pt + accent.lighten(40%))

  doc
}

// ---------------------------------------------------------------------------
// Appendix module: a self-contained, titled box meant to hold a single piece
// of supporting evidence (a table, a plot, an image, a transcript excerpt,
// etc.), so it can be dropped into the appendix and linked to from anywhere
// in the report via a label placed after the call, e.g.
// `#appendix-module[Title][Body] <my-label>`, referenced elsewhere with
// `#link(<my-label>)[see Appendix, "Title"]`.
#let appendix-module(title, body) = block(
  width: 100%,
  breakable: true,
  stroke: 0.6pt + accent.lighten(40%),
  radius: 4pt,
  inset: 12pt,
  above: 1.4em,
  below: 1em,
)[
  #text(size: 12pt, weight: "bold", fill: accent)[#title]
  #v(0.3em)
  #line(length: 100%, stroke: 0.6pt + accent.lighten(50%))
  #v(0.6em)
  #body
]

// ---------------------------------------------------------------------------
// Title page: full-bleed accent bands top and bottom (as on the reference
// breezy-report template), with a plain white center panel. The logo is the
// same purple as the accent color, so it lives on the white center rather
// than on a colored band, where it would disappear.
// `authors` accepts either a single name (string) or an array of names (one
// per team member); the bottom band wraps them across lines as needed.
#let titlepage(
  title: "",
  subtitle: none,
  authors: none,
  date: none,
  context-line: none,
  examiner: none,
) = {
  let author-list = if authors == none {
    ()
  } else if type(authors) == array {
    authors
  } else {
    (authors,)
  }

  page(
    footer: none,
    numbering: none,
    margin: 0pt,
    background: page-background(show-number: false),
  )[
    // Top band: full-bleed accent panel with the wordmark, with a subtle
    // gradient for depth (rather than a flat fill).
    #place(top + left, block(
      width: 100%,
      height: 7cm,
      fill: gradient.linear(vintage-grape, vintage-grape.darken(18%), angle: 25deg),
      inset: (x: 3cm, y: 1.6cm),
    )[
      #set text(font: font)
      #align(bottom + left)[
        #text(size: 13pt, tracking: 2pt, fill: accent.lighten(65%))[Compliance, simplified]
        #v(-0.3em)
        #text(size: 34pt, weight: "bold", fill: white)[ComplAI]
      ]
    ])

    // A single smooth gradient bar running full-bleed under the top band,
    // blending the whole ComplAI palette into one another instead of
    // showing them as separate blocks of color.
    #place(top + left, dy: 7cm, rect(
      width: 100%,
      height: 0.35cm,
      fill: gradient.linear(sky-reflection, honey-bronze, classic-crimson, vintage-grape),
    ))

    // Bottom band: full-bleed accent panel with the team names, examiner and
    // date. Each block is stacked on its own line (rather than packed into a
    // single row) so a long team list never crowds against the date.
    #place(bottom + left, block(
      width: 100%,
      height: 4.6cm,
      fill: gradient.linear(vintage-grape.darken(10%), vintage-grape, angle: 25deg),
      inset: (x: 3cm, y: 0.9cm),
    )[
      #set text(font: font)
      #align(horizon)[
        #stack(
          dir: ttb,
          spacing: 0.35cm,
          if author-list.len() > 0 [
            #text(size: 9pt, tracking: 1pt, fill: accent.lighten(65%))[Team]
            #v(-0.2em)
            #text(size: 11pt, weight: "bold", fill: white)[#author-list.join(" · ")]
          ],
          grid(
            columns: (1fr, auto),
            align: (left + horizon, right + horizon),
            [
              #if examiner != none [
                #text(size: 9pt, fill: accent.lighten(70%))[Examiner: ]
                #text(size: 9pt, fill: white)[#examiner]
              ]
            ],
            [
              #if date != none [
                #text(size: 9pt, fill: accent.lighten(70%))[#date]
              ]
            ],
          ),
        )
      ]
    ])

    // Center: white panel with a single soft radial gradient wash (in the
    // primary accent color only, to keep the page calm), holding the logo,
    // context line and title/subtitle.
    #place(top + left, dy: 7.35cm, block(
      width: 100%,
      height: 100% - 7.35cm - 4.6cm,
    )[
      #place(top + right, circle(
        radius: 6cm,
        fill: gradient.radial(vintage-grape.transparentize(88%), vintage-grape.transparentize(100%)),
      ))

      #set text(font: font)
      #align(center + horizon)[
        #box(width: 3.4cm, logo)
        #v(1cm)
        #if context-line != none [
          #text(size: 10pt, tracking: 1pt, fill: accent.lighten(25%))[#context-line]
          #v(0.4cm)
        ]
        #line(length: 30%, stroke: 1.5pt + accent.lighten(30%))
        #v(0.8cm)
        #text(size: 24pt, weight: "bold", fill: accent)[#title]
        #if subtitle != none [
          #v(0.4cm)
          #text(size: 13pt, fill: rgb("#555555"))[#subtitle]
        ]
      ]
    ])
  ]
}

// ---------------------------------------------------------------------------
// Team page: a grid of circular portraits with names, course and university
// underneath, shown right after the cover. `members` is an array of
// (name, image-path, course) triples.
#let team-page(members: (), university: none) = {
  page(
    footer: none,
    numbering: none,
    background: page-background(show-number: false),
  )[
    #set text(font: font)
    #align(center)[
      #v(0.5cm)
      #text(size: 18pt, weight: "bold", fill: accent)[Our team]
      #v(0.2cm)
      #line(length: 20%, stroke: 1pt + accent.lighten(40%))
    ]
    #v(1.5cm)

    #grid(
      columns: (1fr, 1fr, 1fr),
      row-gutter: 1.8cm,
      column-gutter: 1cm,
      ..members.map(m => align(center)[
        #box(
          width: 3.4cm,
          height: 3.4cm,
          radius: 1.7cm,
          clip: true,
          stroke: 1.5pt + accent,
        )[
          #image(m.at(1), width: 3.4cm, height: 3.4cm, fit: "cover")
        ]
        #v(0.4cm)
        #text(size: 11pt, weight: "bold", fill: accent)[#m.at(0)]
        #if m.len() > 2 [
          #v(0.15cm)
          #text(size: 8.5pt, fill: rgb("#555555"))[#m.at(2)]
        ]
        #if university != none [
          #v(0.1cm)
          #text(size: 8pt, fill: accent.lighten(25%))[#university]
        ]
      ]),
    )
  ]
}

// ---------------------------------------------------------------------------
// Table of contents page: styled to match the theme (accent title, colored
// rule, accent page numbers), placed right after the team page.
#let toc-page() = {
  page(
    footer: none,
    numbering: none,
    background: page-background(show-number: false),
  )[
    #set text(font: font)
    #align(center)[
      #v(0.5cm)
      #text(size: 18pt, weight: "bold", fill: accent)[Table of contents]
      #v(0.2cm)
      #line(length: 20%, stroke: 1pt + accent.lighten(40%))
    ]
    #v(1cm)

    #show outline.entry: it => link(
      it.element.location(),
      text(fill: rgb("#1A1A1A"))[#it],
    )
    #show outline.entry.where(level: 1): it => {
      v(0.6em, weak: true)
      text(weight: "bold", fill: accent)[#it]
    }

    #outline(title: none)

    #counter(page).update(0)
  ]
}
