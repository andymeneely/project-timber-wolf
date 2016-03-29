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

  text layout: data['Skill1']
  rect layout: data['Skill1']

  text layout: data['Skill2']
  rect layout: data['Skill2']

  text layout: data['Skill3']
  rect layout: data['Skill3']

  text layout: data['Skill4']
  rect layout: data['Skill4']

  save_png prefix: 'character_'
  save_sheet prefix: 'character_sheet_', trim: '0.125in'
end
