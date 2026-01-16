// Load data from YAML
#let data = yaml("cv-data.yml")

// Document setup
#set document(
  title: data.document.title,
  author: data.document.author,
)

#set page(
  paper: "a4",
  margin: (x: 2cm, y: 1cm),
)

#set text(
  font: "New Computer Modern",
  size: 10pt,
)

#set par(justify: true)

#let accent = rgb("#11AF7A")
#let muted = rgb("#656D79")

#let section-title(title) = {
  v(0.6em)
  text(weight: "bold", size: 12pt, fill: accent)[#upper(title)]
  v(-0.4em)
  line(length: 100%, stroke: 0.5pt + accent)
  v(0.3em)
}

#let job(company, role, dates, company_url: none) = {
  grid(
    columns: (1fr, auto),
    align: (left, right),
    text(weight: "bold")[#if company_url != none { link(company_url)[#company] } else { company }] + text(style: "italic")[ — #role],
    text(fill: muted)[#dates]
  )
}

#let education-item(degree, institution, dates) = {
  grid(
    columns: (1fr, auto),
    align: (left, right),
    text(weight: "bold")[#degree] + [ — #institution],
    text(fill: muted)[#dates]
  )
}

// Header
#align(center)[
  #text(size: 24pt, weight: "bold")[#data.personal.name]
  #v(-0.3em)
  #text(size: 12pt, style: "italic", fill: muted)[#data.personal.title]
  #v(0.3em)
  #text(size: 9pt)[
    #link("mailto:" + data.personal.email)[#data.personal.email] #h(1em) | #h(1em) #data.personal.location
  ]
  #v(0.1em)
  #text(size: 9pt)[
    #link(data.personal.linkedin)[LinkedIn] #h(1em) | #h(1em) #link(data.personal.github)[GitHub]
  ]
]

#v(0.8em)

#text(size: 10pt)[
  #data.summary.trim()
]

// Technical Skills
#section-title("Technical Skills")

#grid(
  columns: (auto, 1fr),
  column-gutter: 1em,
  row-gutter: 0.5em,
  ..data.skills.map(skill => (
    text(weight: "bold")[#skill.category:],
    [#skill.items]
  )).flatten()
)

// Professional Experience
#section-title("Professional Experience")

#for exp in data.experience {
  job(exp.company, exp.role, exp.dates, company_url: exp.at("company_url", default: none))
  v(0.3em)
  list(
    marker: [•],
    indent: 0.5em,
    ..exp.highlights.map(h => [#h])
  )
}

// Additional Experience
#section-title("Additional Experience")

#for exp in data.additional_experience {
  job(exp.company, exp.role, exp.dates, company_url: exp.at("company_url", default: none))
  v(0.3em)
  list(
    marker: [•],
    indent: 0.5em,
    ..exp.highlights.map(h => [#h])
  )
}

// Education
#section-title("Education")

#for (i, edu) in data.education.enumerate() {
  education-item(edu.degree, edu.institution, edu.dates)
  if i < data.education.len() - 1 {
    v(0.2em)
  }
}

// Open Source & Interests
#section-title("Open Source & Interests")

#list(
  marker: [•],
  indent: 0.5em,
  ..data.open_source_interests.map(item => [#item])
)

// Languages
#section-title("Languages")

#grid(
  columns: (auto, 1fr),
  column-gutter: 1em,
  row-gutter: 0.4em,
  ..data.languages.map(lang => (
    text(weight: "bold")[#lang.language:],
    [#lang.proficiency]
  )).flatten()
)
