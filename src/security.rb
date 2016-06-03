require 'squib'
require_relative 'save_custom_sheet'

data = Squib.csv file: 'data/security-backs.csv'
size = '0.8125in'
Squib::Deck.new(width: size, height: size, cards: data['Name'].size) do
  use_layout file: 'layouts/security.yml'
  background color: :white

  # background color: '#ccc'
  # circle x: 121.875, y: 121.875, radius: 112.5
  svg file: data['Image'], width: width, height: height

  save_avery_5408

  # save_sheet prefix: 'security_sheet_', trim: '0.125in'
  # save_pdf file: 'security.pdf' #, trim: '0.125in'
  save_png prefix: 'security_'

end
