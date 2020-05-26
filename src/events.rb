# Build event card fronts
require 'squib'

require_relative 'util/helpers'

data = Squib.xlsx(file: 'data/data.xlsx', sheet: 2) do |col, item|
  newlineate(col, item)
end

File.open('data/events.txt', 'w+') { |f| f.write data.to_pretty_text }

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
    if File.exist?("img/#{f}")
      f
    else
      warn "Event figure not found for #{n}, i.e. #{f}"
      'events/tbd.svg'
    end
  end
  svg  layout: :Img, file: imgs

  save_png prefix: 'event_'

  save_pdf file: 'events.pdf', trim: '0.125in'#, range: 6
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

  save_pdf file: 'event_backs.pdf', trim: '0.125in'#, range: 6
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

  build :color do
    png file: 'cork.png', x: width, angle: Math::PI / 2
    png file: 'event_graphpaper_shadow.png'
    svg file: 'event_graphpaper.svg'
    png file: 'event_graphpaper_notecard_shadow.png'
    svg file: 'event_graphpaper_notecard.svg'
  end

  text layout: :Name,        str: data['Name']
  text layout: :Story,       str: data['Story']
  text layout: :Description, str: data['Description']

  svg file: data['Img']

  save_png prefix: 'special_event_'

  filenames = data.name.map do |n|
    name = n.downcase
            .gsub(' ','_')
            .gsub('!','')
    "special_event_#{name}"
  end
  build :color do
    save_png dir: 'img/rules/', prefix: filenames, count_format: '',
             trim_radius: '0.125in', trim: '0.125in'
  end

  rect layout: :cut
  save_pdf file: 'special_events.pdf', trim: '0.125in'#, range: 6
end

#######################
# SPECIAL EVENT BACKS #
#######################
Squib::Deck.new(cards: data['Name'].size) do
  use_layout file: 'layouts/event_backs.yml'
  background color: :white

  build :color do
    png file: 'cork.png', x: width, angle: Math::PI / 2
    png file: 'event_graphpaper_shadow.png'
    svg file: 'event_graphpaper.svg'
  end

  text layout: :Name,        str: data['Name']
  svg file: 'crossbones.svg', layout: :crossbones

  save_png prefix: 'special_event_back_'

  save_pdf file: 'special_event_backs.pdf', trim: '0.125in'#, range: 6
end
