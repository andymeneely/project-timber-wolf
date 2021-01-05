# Build event card fronts
require 'squib'
require_relative 'util/helpers'

data = Squib.xlsx(file: 'data/data.xlsx', sheet: 2) do |col, item|
  escape_emojis(newlineate(col, item))
end

File.open('data/events.txt', 'w+') { |f| f.write data.to_pretty_text }
File.open('data/events.json', 'w+') { |f| f.write data.to_json }

Squib::Deck.new(cards: data['Name'].size) do
  use_layout file: 'layouts/events.yml'
  background color: :white

  build :color do
    png file: 'cork.png', x: width, angle: Math::PI / 2
    png file: 'event_graphpaper_shadow.png'
    svg file: 'event_graphpaper.svg'
    png file: 'event_graphpaper_notecard_shadow.png'
    svg file: 'event_graphpaper_notecard.svg'
  end

  text layout: :Name,        str: data['Name']
  text layout: :Order,       str: data['Order']
  text layout: :Story,       str: data['Story']
  text layout: :Description, str: data['Description'] do |embed|
    embed_emojis(embed, 50)
  end

  # Event filenames are mapped to the card name
  imgs = data.name.map do |n|
    f = event_name2file(n)
    if File.exist?("img/events/#{f}.svg")
      "events/#{f}.svg"
    else
      warn "Event figure not found for #{n}, i.e. #{f}"
      'events/tbd.svg'
    end
  end
  svg  layout: :Img, file: imgs

  save_png prefix: 'event_'

  build :color do
    save_png dir: 'rules', prefix: 'figure_event', count_format: '',
             trim_radius: '0.125in', trim: '0.125in', range: 5
  end
  save_sheet prefix: 'sheet_events_', columns: 5, rows: 5
end

###############
# EVENT BACKS #
###############
Squib::Deck.new(cards: data['Name'].size) do
  use_layout file: 'layouts/event_backs.yml'
  background color: :white

  build :color do
    png file: 'cork.png', x: width, angle: Math::PI / 2
    png file: 'event_graphpaper_shadow.png'
    svg file: 'event_graphpaper.svg'
  end

  text layout: :Name,        str: data['Name']
  text layout: :Order,       str: data['Order']

  save_png prefix: 'event_back_'

  build :sheets do
    save_sheet prefix: 'sheet_events_backs_', columns: 5, rows: 5
  end

end
