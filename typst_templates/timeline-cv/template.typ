#let item(title, content) = [
  #set align(left)
  #text(size: 13pt, title)\
  #text(size: 11pt, weight: "light", style: "italic", content)
]

#let s = state("lower_bound")

#let timeline_entry(
  start   : none,
  end     : datetime.today().year(),
  title   : none,
  content : none,
) = locate(loc => {
  let timeline_width = 30%

  let lower_bound = s.at(loc)
  let total_width = datetime.today().year() - lower_bound
  let left_pad    = 100% * ((start - lower_bound) / total_width)
  let rect_width  = 100% * (end - start) / total_width

  let timeline = box(width: timeline_width,
    stack(dir: btt, spacing: 4pt,
      // starting text
      stack(dir: ltr, h(left_pad * 0.8), str(start)),
      // rectangle and line
      stack(
        stack(dir: ltr,
          h(left_pad),
          rect(width: rect_width, height: 6pt, fill: rgb("#1A54A0"))
        ),
        line(length: 100%, stroke: 0.6pt),
      ),
      // ending date text
      stack(dir: ltr,
        h((left_pad + rect_width) * 0.9),
        if end != datetime.today().year() { str(end) } else { "auj." }
      ),
    )
  )

  let info = box(width: 95% - timeline_width, item(title, content))

  stack(dir: ltr,
    timeline,
    h(5%),
    info,
  )

})

#let entry(
  title   : none,
  content : none,
) = pad(x: 5%, align(left, item(title, content)))

#let conf(
  name         : none,
  github       : none,
  phone        : none,
  email        : none,
  last_updated : none,
  lower_bound  : none,
  margin       : none,
  doc
) = {
  // Configs
  set document(author: name, title: "Curriculum Vitae")
  set text(font: "Latin Modern Sans", lang: "fr", fallback: true)
  set par(justify: true, leading: 0.55em)
  set page(margin: (x: 40pt, y: 40pt))

  show link: it => underline(text(style: "italic", fill: rgb("#4E7BD6"), it))

  show heading.where(level: 1): it => {
    stack(
      text(font: "Latin Modern Roman Caps", weight: "black", size: 20pt, fill: rgb("#1A54A0"), it),
      v(2pt),
      line(length: 100%, stroke: 0.7pt)
    )
  }

  assert(lower_bound != none, message: "must set lower_bound for timeline to work")
  s.update(_ => lower_bound)

  // Header
  {
    let name = text(26pt)[*#name*]
    let image_text(p, t) = box[#box(height: 1em, baseline: 20%, image(p)) #t]

    stack(dir:ltr,
      align(horizon)[#name],
      align(right)[
        #if github != none [
          #image_text("icons/github.svg")[ #link("https://github.com/" + github)[#github]]\
        ]
        #if phone != none [
          #image_text("icons/phone-solid.svg")[#phone]\
        ]
        #if email != none [
          #image_text("icons/envelope-regular.svg")[#email]
        ]
      ],
    )
  }

  // Body
  doc

  // Footer
  if last_updated != none {
    set text(size: 9pt, fill: luma(80))
    set align(right + bottom)
    emph[ Dernière m-à-j : #last_updated ]
  }
}
