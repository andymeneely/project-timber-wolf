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
  text layout: :Level, str: data['Level'].map { |i| "Level #{i}"}

  text layout: data['Skill1']
  text layout: :Skill1Exp, str: data['Skill1Exp'].map { |i| "#{i}💡"}
  rect layout: data['Skill1']

  text layout: data['Skill2']
  text layout: :Skill2Exp, str: data['Skill2Exp'].map { |i| "#{i}💡"}
  rect layout: data['Skill2']

  text layout: data['Skill3']
  text layout: :Skill3Exp, str: data['Skill3Exp'].map { |i| "#{i}💡"}
  rect layout: data['Skill3']

  text layout: data['Skill4']
  text layout: :Skill4Exp, str: data['Skill4Exp'].map { |i| "#{i}💡"}
  rect layout: data['Skill4']

  text layout: :Memory, str: data['Memory'].map { |i| "Memory: #{i}" }
  text layout: :Special, str: data['Special']

  save_png prefix: 'character_'
  save_sheet prefix: 'character_sheet_', trim: '0.125in'
  save_pdf file: 'characters.pdf', trim: '0.125in'
end
