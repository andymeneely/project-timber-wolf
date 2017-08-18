require 'squib'
require_relative 'helpers'

data = Squib.xlsx(file: 'data/data.xlsx', sheet: 4) do |col, item|
  newlineate(col, item)
end

File.open('data/npcs.txt', 'w+') { |f| f.write data.to_pretty_text }

Squib::Deck.new(cards: data.nrows) do
  use_layout file: 'layouts/npcs.yml'
  background color: :white
  rect layout: :cut
  svg file: 'npc.svg'

  build :color do
    png file: 'cork.png', x: width, angle: Math::PI / 2
    png file: 'npc shadows.png'
    svg file: 'npc-color.svg'
    svg file: data.name.map { |n| "polaroids/#{n.downcase}.svg"}
  end

  titlesizes = data['Name'].map do |name|
    case name.length
    when 0..7 then 62
    when 8..9 then 50
    when 10..12 then 46
    when 13..14 then 40
    when 12..50 then 34
    end
  end
  text str: data['Name'], layout: :title, font_size: titlesizes

  text layout: :Default1, str: data.default1
  text layout: :Default2, str: data.default2
  text layout: :Default3, str: data.roll6
  text layout: :Special, str: data.description

  save_png prefix: 'npc_'#, range: 0
  save_pdf file: 'npcs.pdf', trim: '0.125in'#, range: 0
end
