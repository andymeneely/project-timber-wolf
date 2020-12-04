# Build the backs of character cards
require 'squib'
require_relative 'util/helpers'
require 'pp'

data = Squib.xlsx(file: 'data/data.xlsx') do |col, item|
  newlineate(col, item)
end
total = data['Name'].size

Squib::Deck.new(cards: total) do
  use_layout file: 'layouts/character_backs.yml'
  background color: :white
  rect layout: :cut

  png file: 'cork.png', x: width, angle: Math::PI / 2

  svg file: data['Level'].map { |lvl| lvl=='1' ? 'character-back.svg' : 'character-back-pro.svg'  }
  svg file: data['Name'].map { |n| "polaroids/#{n.downcase}.svg" },
      x: 270, y: -35, angle: 0.25

  text str: data['Name'], layout: :name
  text str: data['LevelUp1'], layout: :upgrade1
  text str: data['LevelUp1Desc'], layout: :upgrade1desc
  text str: data['LevelUp2'], layout: :upgrade2
  text str: data['LevelUp2Desc'], layout: :upgrade2desc


  save_png prefix: 'character_back_'

  only_lvl1_2 = data['Level'].map.with_index do |x,i|
    [1].include?(x.to_i) ? i : nil
  end.compact
  save_pdf file: 'character_backs.pdf', trim: '0.125in', range: only_lvl1_2

  build :sheets do
    save_sheet prefix: 'sheet_characters_backs_', columns: 5, rows: 5
  end
end
