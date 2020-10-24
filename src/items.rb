# Build the item cards
require 'squib'
require_relative 'util/helpers'

data = Squib.xlsx(file: 'data/data.xlsx', sheet: 7) do |col, item|
  escape_emojis(newlineate(col, item))
end

File.open('data/items.txt', 'w+') { |f| f.write data.to_pretty_text }

Squib::Deck.new(cards: data.nrows, width: 1125, height: 825) do
  use_layout file: 'layouts/items.yml'

  png file: 'cork.png'
  svg file: 'item-color.svg'

  text str: data.name, layout: :name
  text str: data.cost.map {|c| "$#{c}k"}, layout: :cost

  svg file: data.art, layout: :art


  text layout: :description, str: data.description do |embed|
    embed_emojis(embed, 45)
  end

  action_imgs = data.action.map do |a|
    a.to_s.empty? ? nil : 'default-action.svg'
  end

  svg layout: :action, file: action_imgs

  text layout: :action_txt, str: data.action do |embed|
    embed_emojis(embed, 45)
  end

  save_png prefix: 'item_'
  save_png dir: 'rules', prefix: 'fig_item', count_format:'', range: 0,
           trim: 37.5, trim_radius: 37.5
  save_sheet prefix: 'sheet_item_', columns: 5, rows: 5
end

Squib::Deck.new(cards: data.nrows) do
  png file: 'cork.png'
  save_png prefix: 'item_back_'
  save_sheet prefix: 'sheet_item_backs_', columns: 5, rows: 5
end
