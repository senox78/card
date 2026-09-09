#let paper = cmyk(0%, 0%, 0%, 0%)
#let ink = cmyk(0%, 0%, 0%, 100%)
#let accent = cmyk(0%, 35%, 2%, 8%)

#let card = (
  name: [せの(senox#text(fill: accent)[78])],
  sub_name: sys.inputs.at("sub_name", default: ""),
  role: sys.inputs.at("role", default: ""),

  info: (
    ("GitHub", "@senox78"),
    ("󰖟 Web", "senox.cc"),
    ("󰛮 Email", "senox78.am2@gmail.com"),
    ("Tags", "JP | Rust | Linux"),
  ),

  // Replace these paths with the two photos you want to use.
  photos: (
    "./images/ulibooooo.png",
    "./images/qr-senox.cc.svg",
  ),
)

#let show-role = sys.inputs.at("show-role", default: "false") == "true"

#set page(
  width: 91mm,
  height: 55mm,
  fill: paper,
  margin: (
    x: 7mm,
    y: 6mm,
  ),
)

#set text(
  font: ("Monaspace Radon", "Noto Sans CJK JP"),
  size: 9pt,
  fill: ink,
)

#let info-table(items) = table(
  columns: (auto, 1fr),
  column-gutter: 1.8mm,
  row-gutter: 0.8mm,
  inset: (x: 0pt, y: 3pt),
  stroke: none,

  ..items
    .map(((key, value)) => (
      [#text(weight: "bold")[#key]],
      [#box[#value]],
    ))
    .flatten(),
)

#let photo(path, angle, fit: "cover") = rotate(
  angle,
  origin: center + horizon,
  box(
    width: 24mm,
    height: 17.5mm,
    clip: true,
    radius: 1.2mm,
    stroke: 0.7pt + paper,
    image(path, width: 100%, height: 100%, fit: fit),
  ),
)

#let photo-pair(photos) = block(
  width: 28mm,
  height: 43mm,
  clip: false,
)[
  #place(top + left, dx: 3mm, dy: 2mm, photo(photos.at(0), 0deg))
  #place(top + left, dx: 3mm, dy: 21mm, photo(photos.at(1), 0deg, fit: "contain"))
  #place(top + left, dx: 3mm, dy: 39.5mm, box(width: 24mm)[
    #align(center)[#text(size: 5pt)[senox.cc]]
  ])
]

#let business-card(card) = grid(
  columns: (1fr, 28mm),
  column-gutter: 2mm,

  [
    #grid(
      columns: (1fr,),
      rows: (auto, auto),
      row-gutter: 6mm,

      [
        #text(
          size: 12.5pt,
          weight: "bold",
        )[
          #box[
            #card.name
            #place(bottom + center, dy: 3.5pt, line(length: 32mm, stroke: 0.8pt + accent))
          ]
        ]

        #if show-role and (card.sub_name != "" or card.role != "") [
          #v(1mm)
          #if card.sub_name != "" [
            #text(size: 8pt, weight: "medium")[#card.sub_name]
            #v(0.5mm)
          ]
          #if card.role != "" [
            #text(size: 5.2pt, fill: cmyk(0%, 0%, 0%, 40%))[#card.role]
          ]
        ]
      ],

      [
        #text(size: 6.8pt)[#info-table(card.info)]
      ],
    )
  ],

  [
    #photo-pair(card.photos)
  ],
)

#business-card(card)
