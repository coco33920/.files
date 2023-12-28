#let template(
  title: none,
  presents: (),
  signature: "",
  sfont: "Monaspace Xenon",
  body
) = {

  set text(weight: "bold", font: sfont, size: 16pt, lang: "fr")   
  set align(center) 
  if title != none {
      title
  }
  set text(weight: "regular", size: 12pt)
  set align(left)
  [
    *Présent.e.s*\
    #list(..presents)
  ]

show heading.where(level: 1): it => block(width:100%)[
  #set align(right)
  #it
  #v(0.5em)
]

set heading(numbering: "I.1.")
body
}
