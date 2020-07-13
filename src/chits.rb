# Build chits for TTS
require 'squib'

$BG_COLOR = '#6b471c' # dark brown
$FG_COLOR = '#bcbda7' # cream

def replace_fill_with_fg(svgfiles)
  svgfiles.map do |f|
    File.read("img/#{f}.svg").gsub('fill:#000000', "fill:#{$FG_COLOR}")
  end
end

# Circle & Entrance Chits
puts "Circle chits..."
circle_files = %w(
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
)

files = []
files << circle_files
files << 'entrance'
files.flatten!

## For TTS
Squib::Deck.new(width: 300, height: 300, cards: files.size) do
  background color: $BG_COLOR
  svg data: replace_fill_with_fg(files), width: 300, height: 300
  save_png prefix: 'chit_', count_format: files
end

## For Rules
Squib::Deck.new(width: 300, height: 300, cards: circle_files.size) do
  circle x: 158, y: 158, radius: 140, fill_color: :black, stroke_width: 0
  circle x: 150, y: 150, radius: 140, fill_color: $BG_COLOR, stroke_width: 0
  svg data: replace_fill_with_fg(circle_files), width: 300, height: 300
  save_png dir: 'rules/', prefix: 'fig_chit_', count_format: circle_files
end

# Money chits for TTS
puts "Money chits..."
Squib::Deck.new(width: 250, height: 135, cards: 3) do
  background color: $BG_COLOR # dark brown
  amounts = %w($1k $2k $5k)
  text str: amounts, font: 'Archivo Narrow 24', color: $FG_COLOR,
       width: width, height: height, align: :center, valign: :middle

  save_png prefix: 'chit_', count_format: amounts.map { |x| x.gsub('$','') }
end

# Money chits for rules
puts "Money chits..."
Squib::Deck.new(width: 250, height: 135, cards: 3) do
  amounts = %w($1k $2k $5k)
  text str: amounts, font: 'Archivo Narrow 24', color: $FG_COLOR,
       width: width, height: height, align: :center, valign: :middle

  save_png dir: 'rules/', prefix: 'fig_chit_', count_format: amounts.map { |x| x.gsub('$','') }
end

# Hex chits
files = %w(
  server-x
  server-y
  remote_lock_x
  remote_lock_y
  reinforcements
  watchtower
  keycard-lock
)
# For TTS
Squib::Deck.new(width: 600, height: 600, cards: files.size) do
  background color: $BG_COLOR # dark brown
  svg data: replace_fill_with_fg(files), width: width, height: width
  save_png prefix: 'hex_', count_format: files
end
#For rules
Squib::Deck.new(width: 600, height: 600, cards: files.size) do
  polygon n: 6, x: 308, y: 310, radius: 290, angle: Math::PI / 6,
          fill_color: :black, stroke_width: 0
  polygon n: 6, x: 300, y: 300, radius: 290, angle: Math::PI / 6,
          fill_color: $BG_COLOR, stroke_width: 0
  svg data: replace_fill_with_fg(files), width: width, height: width
  save_png dir: 'rules/', prefix: 'fig_hex_', count_format: files
end



# Entrance/Exit
# files = %w(
#   entrance
# )
# Squib::Deck.new(width: 300, height: 300, cards: file.size) do
#   background color: $BG_COLOR # dark brown
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
