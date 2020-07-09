# Build fixer card fronts
require 'squib'
require_relative 'util/helpers'

data = Squib.xlsx(file: 'data/data.xlsx', sheet: 6) do |col, item|
  newlineate(col, item)
end

File.open('data/fixers.txt', 'w+') { |f| f.write data.to_pretty_text }

Squib::Deck.new(cards: data.nrows) do
  use_layout file: 'layouts/npcs.yml'
  background color: :white
  rect layout: :cut
  svg file: 'npc.svg'

  build :color do
    png file: 'cork.png', x: width, angle: Math::PI / 2
    png file: 'fixer shadows.png'
    svg file: 'fixer-color.svg'
    # svg file: data.name.map { |n| "polaroids/#{n.downcase}.svg"}
    svg file: data.name.map { |n| "polaroids/fixer.svg"}
  end

  titlesizes = data['Name'].map do |name|
    case name.length
    when 0..6 then 19.84
    when 7..9 then 16
    when 10..11 then 14.72
    when 12..14 then 13.44
    when 12..50 then 10.88
    end
  end
  text str: data['Name'], layout: :title, font_size: titlesizes

  text layout: :Special, str: data.description
  # text layout: :Faction, str: data.faction
  # text layout: :Special, str: data.membership, y: 700, font_size: 8

  save_png prefix: 'fixer_'#, range: 0
  save_pdf file: 'fixers.pdf', trim: '0.125in'#, range: 0

  build :sheets do
    save_sheet prefix: 'sheet_fixers_', columns: 5, rows: 5
  end

end
