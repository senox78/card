#let paper = cmyk(0%, 4%, 1%, 0%)
#let ink = cmyk(0%, 0%, 0%, 100%)
#let accent = cmyk(0%, 35%, 2%, 8%)
#let university-ink = cmyk(0%, 0%, 0%, 85%)
#let muted-ink = cmyk(0%, 0%, 0%, 65%)

#let university = sys.inputs.at("university", default: "")
#let university-email = sys.inputs.at("university-email", default: "")

#set page(
  width: 91mm,
  height: 55mm,
  margin: 0mm,
  fill: paper,
)

#set text(
  font: ("Monaspace Radon", "Noto Sans CJK JP"),
  fill: ink,
)

#box()

#place(bottom + right, dx: -6mm, dy: -5mm)[
  #text(size: 7pt, fill: muted-ink)[Typeset with #text(fill: accent)[Typst] · Monospace Radon]
]

#if university != "" or university-email != "" {
  place(top + left, dx: 6mm, dy: 5mm)[
    #align(left)[
      #if university != "" [
        #text(size: 9pt, weight: "medium", fill: university-ink)[#university]
      ]
      #if university != "" and university-email != "" [
        #linebreak()
      ]
      #if university-email != "" [
        #text(size: 7pt, fill: muted-ink)[#university-email]
      ]
    ]
  ]
}
