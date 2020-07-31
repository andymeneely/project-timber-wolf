# Build chits for TTS
require 'squib'

$BG_COLOR = '#6b471c' # dark brown
$FG_COLOR = '#d8c485' # new cream
# $FG_COLOR = '#bcbda7' # old cream

def replace_fill_with_fg(svgfiles, color = $FG_COLOR)
  svgfiles.map do |f|
    File.read("img/#{f}.svg").gsub('fill:#000000', "fill:#{color}")
  end
end

# Circle Chits
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
  blank
)
## For TTS
Squib::Deck.new(width: 300, height: 300, cards: files.size) do
  background color: $BG_COLOR
  svg data: replace_fill_with_fg(files), width: 300, height: 300
  save_png prefix: 'chit_', count_format: files
end
## For Rules
Squib::Deck.new(width: 300, height: 300, cards: files.size) do
  circle x: 158, y: 158, radius: 140, fill_color: :black, stroke_width: 0
  circle x: 150, y: 150, radius: 140, fill_color: $BG_COLOR, stroke_width: 0
  svg data: replace_fill_with_fg(files), width: 300, height: 300
  save_png dir: 'rules/', prefix: 'fig_chit_', count_format: files
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
  rect x: 10, y: 10, width: width - 10, height: height - 10, radius: 25,
       fill_color: :black, stroke_width: 0
  rect x: 5, y: 5, width: width - 10, height: height - 10, radius: 25,
       fill_color: $BG_COLOR, stroke_width: 0
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
Squib::Deck.new(width: 610, height: 610, cards: files.size) do
  polygon n: 6, x: 308, y: 310, radius: 295, angle: 0,
          fill_color: :black, stroke_width: 0
  polygon n: 6, x: 300, y: 300, radius: 290, angle: 0,
          fill_color: $BG_COLOR, stroke_width: 0
  svg data: replace_fill_with_fg(files), width: width, height: width
  save_png dir: 'rules/', prefix: 'fig_hex_', count_format: files
end

# Lockdown gates
# For TTS
letters = %w(A B C D)
files = ['lockdown'] * letters.size
Squib::Deck.new(width: 600, height: 600, cards: files.size) do
  background color: $BG_COLOR # dark brown
  svg data: replace_fill_with_fg(files), width: width, height: width
  text str: letters, font: 'Archivo Black, Serif 24',
       x: 0, y: 285, width: width, align: :center, color: $FG_COLOR
  save_png prefix: 'hex_lockdown_', count_format: letters
end
#For rules
Squib::Deck.new(width: 610, height: 610, cards: files.size) do
  polygon n: 6, x: 308, y: 310, radius: 295,
          fill_color: :black, stroke_width: 0
  polygon n: 6, x: 300, y: 300, radius: 290,
          fill_color: $BG_COLOR, stroke_width: 0
  svg data: replace_fill_with_fg(files), width: width, height: width
  text str: letters, font: 'Archivo Black, Serif 24',
       x: 0, y: 285, width: width, align: :center, color: $FG_COLOR

  save_png dir: 'rules/', prefix: 'fig_hex_lockdown_', count_format: letters,
           range: 0
end

# Planning Tokens
# For TTS
colors      = %w(#dd1b18 #177330 #121e81 #9b18dd)
color_names = %w(red     green   blue    purple)
Squib::Deck.new(width: 300, height: 300, cards: files.size) do
  background color: colors
  save_png prefix: 'chit_planning_', count_format: color_names
end
#For rules
Squib::Deck.new(width: 375, height: 375, cards: 1) do
  coords = [
    { color: '#dd1b18', x: 70, y: 95, angle: 0.2 },
    { color: '#177330', x: 120, y: 300, angle: 0.3 },
    { color: '#121e81', x: 220, y: 120, angle: 0.6 },
    { color: '#9b18dd', x: 290, y: 260, angle: -0.3 },
  ]
  shadow_nudge = 6
  coords.each do |c|
    polygon n: 6, x: c[:x] + shadow_nudge, y: c[:y] + shadow_nudge + 2, radius: 60, angle: Math::PI / 6 + c[:angle], fill_color: :black, stroke_width: 0
    polygon n: 6, x: c[:x],                y: c[:y],                    radius: 65, angle: Math::PI / 6 + c[:angle], fill_color: c[:color], stroke_width: 0
  end
  save_png dir: 'rules/', prefix: 'fig_planning', count_format: ''
end

# Idea tokens
# For TTS
Squib::Deck.new(width: 150, height: 300, cards: 1) do
  background color: $BG_COLOR
  svg data: replace_fill_with_fg(['idea']), x: -75, width: height, height: height
  save_png prefix: 'chit_idea', count_format: ''
end
# For rules
h = 300
Squib::Deck.new(width: 320, height: 320, cards: 1) do
rect x: h / 2 + 5, y: 5,
     width: h / 2, height: h, radius: 75,
     fill_color: :black, stroke_width: 0
rect x: h / 2, width: h / 2, height: h, radius: 75,
     fill_color: $BG_COLOR, stroke_width: 0
svg x: -15, y: -75,
    data: replace_fill_with_fg(['idea']),
    width: 1.5 * height, height: 1.5 * height
save_png dir: 'rules', prefix: 'fig_chit_idea', count_format: ''
end

# Hex tiles
# For TTS
Squib::Deck.new(width: 600, height: 600, cards: 2) do
  background color: $FG_COLOR
  svg x: height / 4, y: height / 4, width: height / 2 , height: height / 2,
      data: replace_fill_with_fg(['security'], $BG_COLOR)
  save_png prefix: 'hex_tile', count_format: ['_front', '_back']
end

# Entrance tiles
# For TTS
Squib::Deck.new(width: 300, height: 300, cards: 1) do
  background color: $FG_COLOR
  svg width: height , height: height, data: replace_fill_with_fg(['entrance'], $BG_COLOR)
  save_png prefix: 'chit_entrance', count_format: ''
end

# # For rules
# h = 300
# Squib::Deck.new(width: 320, height: 320, cards: 1) do
# rect x: h / 2 + 5, y: 5,
#      width: h / 2, height: h, radius: 75,
#      fill_color: :black, stroke_width: 0
# rect x: h / 2, width: h / 2, height: h, radius: 75,
#      fill_color: $BG_COLOR, stroke_width: 0
# svg x: -15, y: -75,
#     data: replace_fill_with_fg(['idea']),
#     width: 1.5 * height, height: 1.5 * height
# save_png dir: 'rules', prefix: 'fig_chit_idea', count_format: ''
# end




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
