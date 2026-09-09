#let paper = cmyk(0%, 0%, 0%, 0%)

#set page(
  width: 91mm,
  height: 55mm,
  margin: 0mm,
  fill: paper,
)

// Emit one otherwise-empty page for the back of the card.
#box()
