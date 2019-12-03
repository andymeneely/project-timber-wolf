require 'squib'
require_relative 'helpers'
Squib.configure img_dir: '.'

# Collect the entire collection of output files
fronts = Dir['_output/character_??.png'].sort
backs = Dir['_output/character_back_??.png'].sort

fronts += Dir['_output/event_??.png'].sort
backs += Dir['_output/event_back_??.png'].sort

fronts += Dir['_output/special_event_??.png'].sort
backs += Dir['_output/special_event_back_??.png'].sort

fronts += Dir['_output/fixer_??.png'].sort # double-faced. eh.
backs += Dir['_output/fixer_??.png'].sort # double-faced. eh.

fronts += Dir['_output/npc_??.png'].sort # double-faced. eh.
backs += Dir['_output/npc_??.png'].sort # double-faced. eh.

fronts += Dir['_output/skill_??.png'].sort
backs += Dir['_output/skill_back_??.png'].sort

Squib::Deck.new(cards: fronts.size * 2) do
  background color: :white
  png file: merge_front_back(fronts, backs)
  save_pdf file: 'bundle-masters-of-the-heist-k40.pdf', margin: '0.125in', trim: '0.05in'
end
