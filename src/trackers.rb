# Noise tracker cards
# Build fixer card fronts
require 'squib'
require_relative 'util/helpers'

Squib::Deck.new(cards: 2, width: 1125, height: 825) do
  svg file: ['noise tracker 3p.svg', 'noise tracker 4p.svg']
  save_png prefix: 'tracker_'
  save_png dir: 'rules', prefix: 'fig_noise', count_format: '', range: 0,
           trim: 75, trim_radius: 75
end