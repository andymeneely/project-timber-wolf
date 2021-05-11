# Build the non-player character cards
require 'squib'
require_relative 'util/helpers'

data = Squib.xlsx(file: 'data/data.xlsx', sheet: 4) do |col, item|
  escape_emojis(newlineate(col, item))
end

File.open('data/npcs.txt', 'w+') { |f| f.write data.to_pretty_text }

%w(Normal Panic).each do |t|
  Squib::Deck.new(cards: data.nrows) do
    use_layout file: 'layouts/npcs.yml'

    png file: 'cork.png', x: width, angle: Math::PI / 2
    png file: 'npc shadows.png'
    svg file: 'npc-color.svg'

    front_or_back = (t === 'Normal') ? 'face' : 'back'

    text str: data["#{t}Name"], layout: :title

    text layout: :Default1, str: data["#{t}Default1"] do |embed|
      embed_emojis(embed, 45)
    end

    text layout: :Default2, str: data["#{t}Default2"] do |embed|
      embed_emojis(embed, 45)
    end

    text layout: :Default3, str: data["#{t}Roll6"] do |embed|
      embed_emojis(embed, 45)
    end

    text layout: :Special, str: data["#{t}Description"] do |embed|
      embed_emojis(embed, 45)
    end

    save_png prefix: "npc_", suffix: "[#{front_or_back},1]"
    save_pdf file: "npcs_#{front_or_back}_.pdf", trim: '0.125in'
    save_png dir: 'rules', prefix: 'fig_npc', count_format:'', range: 0,
             trim: 37.5, trim_radius: 37.5

    build :sheets do
      save_sheet prefix: "sheet_npcs_#{front_or_back}_", columns: 5, rows: 5
    end
  end
end

