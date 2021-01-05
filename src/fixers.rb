# Build fixer card fronts
require 'squib'
require_relative 'util/helpers'

data = Squib.xlsx(file: 'data/data.xlsx', sheet: 6) do |col, item|
  escape_emojis(newlineate(col, item))
end

File.open('data/fixers.txt', 'w+') { |f| f.write data.to_pretty_text }

Squib::Deck.new(cards: data.nrows) do
  use_layout file: 'layouts/fixers.yml'
  background color: :white
  build :color do
    png file: 'cork.png', x: width, angle: Math::PI / 2
    png file: 'fixer shadows.png'
    svg file: 'fixer-color.svg'
  end

  text str: data['Name'], layout: :title

  text layout: :Special, str: data.description do |embed|
    embed_emojis(embed, 45)
  end

  save_png prefix: 'fixer_'
  save_png dir: 'rules', prefix: 'figure_fixer', count_format: '',
           trim_radius: '0.125in', trim: '0.125in', range: 0

  save_pdf file: 'fixers.pdf', trim: '0.125in'#, range: 0

  build :sheets do
    save_sheet prefix: 'sheet_fixers_', columns: 5, rows: 5
  end

end

Squib::Deck.new(cards: data.nrows) do
  use_layout file: 'layouts/fixers.yml'
  png file: 'cork.png', x: width, angle: Math::PI / 2
  png file: 'fixer-back-shadows.png'
  svg file: 'fixer-back.svg'

  text str: data.name, layout: :back_title

  save_png prefix: 'fixer_back_'
  save_sheet prefix: 'sheet_fixer_backs_', columns: 5, rows: 5
end
