require 'squib'
require_relative 'helpers'
Squib.configure img_dir: '.'

# Collect the entire collection of output files
character_faces = Dir['_output/special_??.png'].sort
special_backs = Dir['_output/special_back_??.png'].sort

ladder_faces = Dir['_output/ladder_??.png'].sort

Squib::Deck.new(cards: special_faces.length * 2) do
  background color: :white
  png file: merge_front_back(special_faces, special_backs)
  save_pdf file: 'bundle-specials-k40.pdf', margin: '0.125in', trim: '0.05in'
end

resource_faces = Dir['_output/resource_??.png'].sort
resource_backs = Dir['_output/resource_back_??.png'].sort

Squib::Deck.new(cards: resource_faces.length * 2) do
  background color: :white
  png file: merge_front_back(resource_faces, resource_backs),
      angle: Math::PI / 2, x: 825
  save_pdf file: 'bundle-resources-k40.pdf', margin: '0.125in', trim: '0.05in'
end
