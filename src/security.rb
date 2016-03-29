require 'squib'

data = Squib.csv file: 'data/security.csv'

Squib::Deck.new(width: 300, height: 300, cards: data['Name'].size) do
  background color: :white


  save_pdf prefix: 'security_'
end
