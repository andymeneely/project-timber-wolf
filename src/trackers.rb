# Noise tracker cards
# Build fixer card fronts
require 'squib'
require_relative 'util/helpers'

Squib::Deck.new(cards: 2, width: 3300, height: 2550) do
  svg file: 'event mat.svg', width: width, height: height
  svg file: ['noise tracker 3p.svg', 'noise tracker 4p.svg'],
      x: 75, y: 1875, width: 3150, height: :scale
  save_png prefix: 'tracker_'
end

Squib::Deck.new(cards: 1, width: 600, height: 250) do
  background color: :white
  svg file: 'noise tracker 4p.svg', width: width * 0.95, height: :scale
  save_png dir: 'rules', prefix: 'fig_noise', count_format: '', range: 0
end
