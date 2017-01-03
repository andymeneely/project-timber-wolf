require 'squib'

require_relative 'helpers'

data = Squib.xlsx(file: 'data/data.xlsx', sheet: 2) do |col, item|
  newlineate(col, item)
end

Squib::Deck.new(width: 600, height: 825, cards: data['Name'].size) do
  use_layout file: 'layouts/events.yml'
  background color: :white

  # build :proofs do
  #   rect layout: :proof_cut
  #   rect layout: :safe
  # end

  text layout: :Name,        str: data['Name']
  ellipse layout: :Order, fill_color: :black
  text layout: :Order,       str: data['Order']
  text layout: :Description, str: data['Description']

  svg  layout: :Img, file: data['Img']

  save_png prefix: 'event_'

  rect layout: :cut
  save_pdf file: 'events.pdf', trim: '0.125in'#, range: 6
end
