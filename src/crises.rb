# Build the Crisis card (formerly Special Events)
require 'squib'
require_relative 'util/helpers'

data = Squib.xlsx(file: 'data/data.xlsx', sheet: 3) do |col, item|
  newlineate(col, item)
end

File.open('data/crises.txt', 'w+') { |f| f.write data.to_pretty_text }
File.open('data/crises.json', 'w+') { |f| f.write data.to_json }

Squib::Deck.new(cards: data['Name'].size) do
  use_layout file: 'layouts/crises.yml'
  background color: :white

  build :color do
    png file: 'cork.png', x: width, angle: Math::PI / 2
    png file: 'crisis-graphpaper-shadow.png'
    svg file: 'crisis-graphpaper.svg'
    png file: 'event_graphpaper_notecard_shadow.png'
    svg file: 'event_graphpaper_notecard.svg'
    svg file: 'crisis-front.svg', layout: :Front
  end

  text layout: :Name,        str: data['Name']
  text layout: :Order,       str: data['Order']
  text layout: :Story,       str: data['Story']
  text layout: :Description, str: data['Description']

  imgs = data.name.map do |n|
    f = event_name2file(n)
    if File.exist?("img/crises/#{f}.svg")
      "crises/#{f}.svg"
    else
      warn "Event figure not found for #{n}, i.e. #{f}.svg"
      'events/tbd.svg'
    end
end
  svg  layout: :Img, file: imgs

  save_sheet prefix: 'sheet_crises_'

  save_png prefix: 'crisis_'

  build :color do
    save_png dir: 'rules', prefix: 'figure_crisis', count_format: '',
             trim_radius: '0.125in', trim: '0.125in', range: 0
  end

  build :sheets do
    save_sheet prefix: 'sheet_crises_', columns: 5, rows: 5
  end
end

###############
# CRISS BACKS #
###############
Squib::Deck.new(cards: data['Name'].size) do
  use_layout file: 'layouts/event_backs.yml'
  background color: :white

  build :color do
    png file: 'cork.png', x: width, angle: Math::PI / 2
    png file: 'crisis-graphpaper-shadow.png'
    svg file: 'crisis-graphpaper.svg'
  end

  text layout: :Name,        str: data['Name']
  text layout: :Order,       str: data['Order']
  svg file: 'crossbones.svg', layout: :crossbones

  save_png prefix: 'crisis_back_'

  build :sheets do
    save_sheet prefix: 'sheet_crises_backs_', columns: 5, rows: 5
  end
end
