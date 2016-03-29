require 'squib'
require_relative 'helpers'

data = Squib.xlsx file: 'data/data.xlsx'
total = data['Name'].size
save_json data: data, cards: total, to: 'data/characters.json'

Squib::Deck.new(cards: total) do
  use_layout file: 'layouts/characters.yml'
  background color: :white
  rect layout: :cut

  text str: data['Name'], layout: :title

  save_png prefix: 'character_'
  save_sheet prefix: 'character_sheet_', trim: '0.125in'
end
