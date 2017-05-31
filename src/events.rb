require 'squib'

require_relative 'helpers'

data = Squib.xlsx(file: 'data/data.xlsx', sheet: 2) do |col, item|
  newlineate(col, item)
end

File.open('data/events.txt', 'w+') { |f| f.write data.to_pretty_text }

Squib::Deck.new(cards: data['Name'].size) do
  use_layout file: 'layouts/events.yml'
  background color: :white

  build :color do
    png file: 'cork.png', x: width, angle: Math::PI / 2
    svg file: 'event.svg'
  end

  text layout: :Name,        str: data['Name']
  text layout: :Order,       str: data['Order']
  text layout: :Story,       str: data['Story']
  text layout: :Description, str: data['Description']

  svg  layout: :Img, file: data['Img']

  save_png prefix: 'event_'

  rect layout: :cut
  save_pdf file: 'events.pdf', trim: '0.125in'#, range: 6
end

##################
# SPECIAL EVENTS #
##################

data = Squib.xlsx(file: 'data/data.xlsx', sheet: 3) do |col, item|
  newlineate(col, item)
end

File.open('data/special_events.txt', 'w+') { |f| f.write data.to_pretty_text }

Squib::Deck.new(cards: data['Name'].size) do
  use_layout file: 'layouts/special_events.yml'
  background color: :white

  text layout: :Name,        str: data['Name']
  text layout: :Story,       str: data['Story']
  text layout: :Description, str: data['Description']

  svg file: data['Img']

  save_png prefix: 'special_event_'

  rect layout: :cut
  save_pdf file: 'special_events.pdf', trim: '0.125in'#, range: 6
end
