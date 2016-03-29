require 'squib'

data = Squib.csv file: 'data/security.csv'

Squib::Deck.new(width: 300, height: 300, cards: data['Name'].size) do
  use_layout file: 'layouts/security.yml'
  background color: :white
  rect layout: :cut

  text layout: data['Name']

  save_sheet prefix: 'security_sheet_', trim: '0.125in'
  save_pdf file: 'security.pdf', trim: '0.125in'
  save_png prefix: 'security_'

end
