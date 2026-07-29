// ---- Theme / formatting rules ----
// Wrap your document content with #show: theme to apply the report styling.
#let theme(doc) = {
  // Margins
  set page(margin: (top: 2.5cm, bottom: 2.5cm, left: 3cm, right: 2cm))

  // Body text: 11pt, 1.5 line spacing
  set text(size: 11pt)
  set par(leading: 0.975em, justify: true) // 0.65em (default) * 1.5

  // Heading level 1: 14pt, bold
  show heading.where(level: 1): set text(size: 14pt, weight: "bold")
  // Heading level 2: 12pt, bold
  show heading.where(level: 2): set text(size: 12pt, weight: "bold")

  // Footnotes: 9pt, single spacing
  show footnote.entry: set text(size: 9pt)
  show footnote.entry: set par(leading: 0.65em)

  // Captions: 9pt, single spacing
  show figure.caption: set text(size: 9pt)
  show figure.caption: set par(leading: 0.65em)

  // Tables: single spacing
  show table.cell: set par(leading: 0.65em)

  doc
}
