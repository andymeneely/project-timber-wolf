# Build the player helps
require 'squib'
require_relative 'util/helpers'

data = Squib.xlsx file: 'data/data.xlsx', sheet: 5
# combine the entire text into one string - not using row-per card here
str = data['Icon'].zip(data['Description']).inject("") do |s, r|
  s + "#{r[0]} #{r[1]}\n"
end

Squib::Deck.new(cards: 4, width: 1125, height: 825) do
  use_layout file: 'layouts/helps.yml'
  background color: :white
  rect layout: :cut

  text layout: 'Description', str: str

  save_png prefix: 'helps_'
  save_pdf file: 'helps.pdf', trim: '0.125in'
end

Squib::Deck.new(cards: 2, width: 1725, height: 1125) do
  use_layout file: 'layouts/helps.yml'
  background color: :white

  svg file: ['noise_tracker_3p_card.svg',
             'noise_tracker_4p_card.svg']

  save_pdf file: 'noise_tracker.pdf'

end
