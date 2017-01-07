require 'squib'
require_relative 'helpers'

svg_files = Dir['scenarios/p*.svg'].sort

Squib::Deck.new(cards: svg_files.size, config: 'config_scenarios.yml',
                width: '8.5in', height: '11in') do
  svg file: svg_files
  save_pdf file: 'scenarios.pdf', width: '8.5in', height: '11in'
end
