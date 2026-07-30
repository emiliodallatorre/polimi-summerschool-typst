#import "theme.typ": theme, titlepage, team-page, toc-page, page-background, appendix-page-counter

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
  title: "Project report",
  subtitle: "Compliance made simple for AI-driven products",
  context-line: "EIT Summer School — Digital Finance & Entrepreneurship",
  examiner: "Prof. Dr. Thomas Funke",
  authors: members.map(m => m.at(0)),
  date: datetime.today().display("[month repr:long] [year]"),
  pattern: "assets/pattern.jpg",
)

#team-page(members: members, university: university)

#toc-page()

#include "sections/01-introduction.typ"
#include "sections/02-teamwork.typ"
#include "sections/03-ideation.typ"
#include "sections/04-business-development-process.typ"
#include "sections/05-business-model-summary.typ"
#include "sections/06-learning-reflection.typ"
#include "sections/07-conclusion-outlook.typ"

#pagebreak()

#bibliography("references.bib", title: "References", style: "ieee")

#pagebreak()

#set page(background: page-background(numbering: "I", page-counter: appendix-page-counter))

#include "sections/08-appendix.typ"
