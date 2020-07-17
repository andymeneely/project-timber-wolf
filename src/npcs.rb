# Build the non-player character cards
require 'squib'
require_relative 'util/helpers'

data = Squib.xlsx(file: 'data/data.xlsx', sheet: 4) do |col, item|
  escape_emojis(newlineate(col, item))
end

File.open('data/npcs.txt', 'w+') { |f| f.write data.to_pretty_text }

Squib::Deck.new(cards: data.nrows) do
  use_layout file: 'layouts/npcs.yml'
  # background color: :white
  # rect layout: :cut
  # svg file: 'npc.svg'

  png file: 'cork.png', x: width, angle: Math::PI / 2
  png file: 'npc shadows.png'
  svg file: 'npc-color.svg'
  svg file: data.name.map { |n| "polaroids/#{n.downcase}.svg"}


  titlesizes = data['Name'].map do |name|
    case name.length
    when 0..7 then 18
    when 8..9 then 15
    when 10..12 then 13
    when 13..14 then 12
    when 12..50 then 10
    end
  end
  text str: data['Name'], layout: :title, font_size: titlesizes

  text layout: :Default1, str: data.default1 do |embed|
    embed_emojis(embed, 45)
  end
  text layout: :Default2, str: data.default2 do |embed|
    embed_emojis(embed, 45)
  end
  text layout: :Default3, str: data.roll6 do |embed|
    embed_emojis(embed, 45)
  end

  text layout: :Special, str: data.description do |embed|
    embed_emojis(embed, 45)
  end

  suffix = data['FrontBack'].map { |s| "_%02d_#{s}"}

  save_png prefix: 'npc_', count_format: suffix
  save_pdf file: 'npcs.pdf', trim: '0.125in'
  save_png dir: 'rules', prefix: 'fig_npc', count_format:'', range: 0,
           trim: 37.5, trim_radius: 37.5

  build :sheets do
    save_sheet prefix: 'sheet_npcs_', columns: 5, rows: 5
  end
end
