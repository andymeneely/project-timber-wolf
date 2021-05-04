# Build the backs of character cards
require 'squib'
require_relative 'util/helpers'
require 'pp'

data = Squib.xlsx(file: 'data/data.xlsx') do |col, item|
  newlineate(col, item)
end
total = data['Name'].size


data["lacks1"] = data.upgrade1text.map do |s|
  skill_lacks(s.to_s)
end
data["lacks2"] = data.upgrade2text.map do |s|
  skill_lacks(s.to_s)
end

Squib::Deck.new(cards: total) do
  use_layout file: 'layouts/character_backs.yml'
  background color: :white
  rect layout: :cut

  png file: 'cork.png', x: width, angle: Math::PI / 2

  svg file: data['Level'].map { |lvl| lvl=='1' ? 'character-back.svg' : 'character-back-pro.svg'  }
  svg file: data['Name'].map { |n| "polaroids/#{n.downcase}.svg" },
      x: 270, y: -35, angle: 0.25

  only_amateurs = data['Level'].map.with_index do |x,i|
    [1].include?(x.to_i) ? i : nil
  end.compact

  text str: data.name, layout: :name
  text str: data['LevelUp1'], layout: :upgrade1
  text str: data['LevelUp1Desc'], layout: :upgrade1desc
  text str: data['LevelUp2'], layout: :upgrade2
  text str: data['LevelUp2Desc'], layout: :upgrade2desc
  text str: data.lacks1, layout: :lacks1, range: only_amateurs do |embed|
    embed_emojis(embed, 30)
  end

  text str: data.lacks2, layout: :lacks2, range: only_amateurs do |embed|
    embed_emojis(embed, 30)
  end

  save_png prefix: 'character_back_'


  save_pdf file: 'character_backs.pdf', trim: '0.125in', range: only_amateurs

  build :sheets do
    save_sheet prefix: 'sheet_characters_backs_', columns: 5, rows: 5
  end
end
