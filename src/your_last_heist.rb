# Build the Your Last Heist expansion
require 'squib'
require_relative 'util/helpers'

# svg_files = Dir['scenarios/p*.svg'].sort
#
# Squib::Deck.new(cards: svg_files.size, config: 'config_scenarios.yml',
#                 width: '8.5in', height: '11in') do
#   svg file: svg_files
#   save_pdf file: 'old_scenarios.pdf', width: '8.5in', height: '11in'
# end

# This is the new way of doing it

require 'kramdown'

scenarios_md = File.read 'scenarios/rivercity/booklet.md'

File.open('scenarios/rivercity/booklet.md.html', 'w+') do |f|
  f.write Kramdown::Document.new(scenarios_md, parse_block_html: true).to_html
end
