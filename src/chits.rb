require 'squib'
require_relative 'save_custom_sheet'

###############################
# Based on TGC's Medium Chits #
###############################
data = Squib.xlsx file: 'data/security_tokens.xlsx', explode: ''
Squib::Deck.new(width: 300, height: 300, cards: data['Name'].size) do
  use_layout file: 'layouts/tgc_medium_circle_chit.yml'
  background color: :white

  build :color do
    background color: '#42290d'
    svgdata = data['Image'].map do |svg|
      File.read("img/#{svg}").gsub('fill:#000000', 'fill:#d8c586')
    end
    svg data: svgdata, width: 225, height: 225, x: 37.5, y: 37.5
  end

  build :proof do
    circle layout: :cut
    circle layout: :safe
  end

  # save_avery_5408

  save_png prefix: 'security_token_', count_format: data['File']

end
#
# data = Squib.csv file: 'data/square-chits.csv'
# Squib::Deck.new(width: 375, height: 375, cards: data['Name'].size) do
#   use_layout file: 'layouts/square-chits.yml'
#   background color: :white
#   rect layout: :cut
#
#     file: data['Image'], width: width, height: height
#
#   save_pdf file: 'square.pdf', trim: '0.125in', width: '4in', height: '6in'
#   save_png prefix: 'square_'
# end
