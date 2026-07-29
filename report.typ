#import "theme.typ": theme, titlepage, team-page

#show: theme

#let university = "Politecnico di Milano"

#let members = (
  ("Arianna Balducci", "assets/people/arianna.jpeg", "Artificial Intelligence with Affective Computing (AIAC)"),
  ("Emilio Dalla Torre", "assets/people/emilio.jpeg", "Cloud and Networking Infrastructure and HPC (CNIHPC)"),
  ("Matteo Mugnai", "assets/people/matteo.jpeg", "Data Science (DSC)"),
  ("Sara Patano", "assets/people/sara.jpeg", "Data Science (DSC)"),
  ("Elisa Saiz", "assets/people/elisa.jpeg", "Data Science (DSC)"),
  ("Alessia Beatrice Viani", "assets/people/alessia.jpeg", "Human-Computer Interaction and Design with Extended Reality (HCID/XR)"),
)

#titlepage(
  title: "Written Report",
  subtitle: "Compliance made simple for AI-driven products",
  authors: members.map(m => m.at(0)),
  date: datetime.today().display("[month repr:long] [year]"),
)

#team-page(members: members, university: university)

= Report

== Introduction

#lorem(400)

== Details

#lorem(400)
