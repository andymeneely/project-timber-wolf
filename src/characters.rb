require 'squib'
require_relative 'helpers'

data = Squib.xlsx(file: 'data/data.xlsx') { |col, item| newlineate(col, item) }
total = data['Name'].size
save_json data: data, cards: total, to: 'data/characters.json'

Squib::Deck.new(cards: total) do
  use_layout file: 'layouts/characters.yml'
  background color: :white
  rect layout: :cut
  svg file: 'character.svg'

  text str: data['Name'], layout: :title
  text layout: :Level, str: data['Level']
  text layout: :Memory, str: data['Memory']
  text layout: :Skill1Ideas, str: data['Skill1Ideas'].map { |i| "#{i}💡"}
  text layout: :Skill2Ideas, str: data['Skill2Ideas'].map { |i| "#{i}💡"}
  text layout: :Default1, str: data['Default1']
  text layout: :Default2, str: data['Default2']

  text layout: :Special, str: data['Special']

  save_png prefix: 'character_'
  save_sheet prefix: 'character_sheet_', trim: '0.125in'
  save_pdf file: 'characters.pdf', trim: '0.125in'
end
