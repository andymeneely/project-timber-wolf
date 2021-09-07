require 'squib'

n = Dir['_output/RULES-*.png'].size
Squib.configure img_dir: '.'

Squib::Deck.new(width: 2550, height: 3075, cards: n) do
  png file: Dir['_output/RULES-*.png'].to_a
  rect x: 37.5, y: 37.5, width: 2485, height: 3000, stroke_color: :red

  rect range: (0..n-1).select(&:even?), # odd numbered pages
       x: 190, y: 75, width: 2285, height: 2925,
       stroke_color: :blue, dash: '10 10', stroke_width: 2

  rect range: (0..n-1).select(&:odd?), # even numbered pages
       x: 75, y: 75, width: 2285, height: 2925,
       stroke_color: :blue, dash: '10 10', stroke_width: 2

  save_png prefix: 'RULES_PROOF_'
end