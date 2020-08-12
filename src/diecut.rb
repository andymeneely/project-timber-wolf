require 'squib'

Squib::Deck.new(cards: 4) do
  rect stroke_width: 3.0, stroke_color: :black,
       x: 75, y: 75, width: '2.5in', height: '3.5in', radius: '0.25in'

  text str: 1..4, font: 'Archivo Black, Sans 18', x: 200, y: 300

  save_pdf sprue: 'sprues/andysdiecutter.yml',
           width: "8.5in", height: "11in", file: 'diecuttercalib.pdf', margin: 0
end
