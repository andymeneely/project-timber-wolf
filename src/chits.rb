# Build chits for TTS
require 'squib'

bg_color = '#6b471c' # dark brown
fg_color = '#bcbda7' # cream


# Circle & Entrance Chits
puts "Circle chits..."
files = %w(
  guard
  subdued
  camera
  disconnected
  locked
  unlocked
  guard-dog
  guard-dog-subdued
  usb-key
  keycard
  asterisk
  jewel
  folder
  entrance
)
Squib::Deck.new(width: 300, height: 300, cards: files.size) do
  background color: bg_color
  svgdata = files.map do |f|
    File.read("img/#{f}.svg").gsub('fill:#000000', "fill:#{fg_color}")  # cream color
  end
  svg data: svgdata, width: 300, height: 300
  save_png prefix: 'chit_', count_format: files
end

# Money chits
puts "Money chits..."
Squib::Deck.new(width: 250, height: 135, cards: 3) do
  background color: bg_color # dark brown
  amounts = %w($1k $2k $5k)
  text str: amounts, font: 'Archivo Narrow 24', color: fg_color,
       width: width, height: height, align: :center, valign: :middle

  save_png prefix: 'chit_', count_format: amounts.map { |x| x.gsub('$','') }
end

# Hex chits
files = %w(
  server_x
  server_y
  remote_lock_x
  remote_lock_y
  reinforcements
  watchtower

)
# Squib::Deck.new(width: 600, height: 600, cards: files.size) do
#   background color: bg_color # dark brown
#   text str: amounts, font: 'Archivo Narrow 16', color: '#bcbda7',
#        width: width, height: height, align: :center, valign: :middle
#
#   save_png prefix: 'chit_', count_format: files
# end

# Entrance/Exit
# files = %w(
#   entrance
# )
# Squib::Deck.new(width: 300, height: 300, cards: file.size) do
#   background color: bg_color # dark brown
#
#   save_png prefix: 'chit_', count_format: amounts.map { |x| x.gsub('$','') }
# end


# puts "Building bullseye chits..."
# Squib::Deck.new(width: 375, height: 900, cards: 4) do
#   cyan = '#40bfbd'; purple = '#bf40ba'; yellow = '#c8cc31'
#   background color: [cyan, purple, yellow, yellow]
#   rect fill_color: '#42290d', width: width, height: 200
#   svg file: 'jewel-chit.svg'
#   save_png prefix: 'pressure_token_', count_format: '%02d_[all]'
# end

#
# ###################################
# ## Based on TGC's Bullseye Chits ##
# ###################################
# puts "Building bullseye chits..."
# Squib::Deck.new(width: 375, height: 900, cards: 4) do
#   cyan = '#40bfbd'; purple = '#bf40ba'; yellow = '#c8cc31'
#   background color: [cyan, purple, yellow, yellow]
#   rect fill_color: '#42290d', width: width, height: 200
#   svg file: 'jewel-chit.svg'
#   save_png prefix: 'pressure_token_', count_format: '%02d_[all]'
# end
#
# ################################################
# ## Based on TGC's Large Circle & Square Chits ##
# ################################################
# puts 'Building large chits...'
# data = Squib.xlsx file: 'data/security_tokens.xlsx', explode: '', sheet: 1
# Squib::Deck.new(width: 375, height: 375, cards: data['Name'].size) do
#   background color: data['BGColor']
#
#   svgdata = data['Img'].map.with_index do |svg, i|
#     File.read("img/#{svg}").gsub('fill:#000000', "fill:#{data['FGColor'][i]}")
#   end
#   svg data: svgdata
#   # png file: 'large-circle-chit.png', alpha: 0.5
#   #png file: 'large-square-chit.png', alpha: 0.5
#   save_png prefix: 'lg', count_format: data['File']
# end
#
# #######################################
# ## Based on TGC's Small Circle Chits ##
# #######################################
# puts 'Building small chits...'
# data = Squib.xlsx file: 'data/security_tokens.xlsx', explode: '', sheet: 2
# Squib::Deck.new(width: 225, height: 225, cards: data['Name'].size) do
#   background color: data['BGColor']
#
#   svgdata = data['Img'].map.with_index do |svg, i|
#     File.read("img/#{svg}").gsub('fill:#000000', "fill:#{data['FGColor'][i]}")
#   end
#   svg data: svgdata
#   # png file: 'small-circle-chit.png', alpha: 0.5
#   save_png prefix: 'sm', count_format: data['File']
# end
