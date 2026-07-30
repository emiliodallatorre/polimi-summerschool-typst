= Market analysis
#import "../theme.typ": accent, sky-reflection

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
          #text(fill: accent.darken(30%), size: 10pt)[€33M / year]
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
