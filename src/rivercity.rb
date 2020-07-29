# Build the River City scenario Markdown to HTML
require 'squib'
require_relative 'util/helpers'
require_relative 'util/version'

# svg_files = Dir['scenarios/p*.svg'].sort
#
# Squib::Deck.new(cards: svg_files.size, config: 'config_scenarios.yml',
#                 width: '8.5in', height: '11in') do
#   svg file: svg_files
#   save_pdf file: 'old_scenarios.pdf', width: '8.5in', height: '11in'
# end

# This is the new way of doing it

require 'kramdown'

def replace_emojis(html)
  html.gsub(/💡/,'<img src="../../img/emojis/idea.svg" class="emoji-svg" />')
      .gsub(/🔊/,'<img src="../../img/emojis/noise.svg" class="emoji-svg" />')
      .gsub(/➜/,'<img src="../../img/emojis/move.svg" class="emoji-svg" />')
      .gsub(/📷/,'<img src="../../img/emojis/disable.svg" class="emoji-svg" />')
      .gsub(/🔍/,'<img src="../../img/emojis/reveal.svg" class="emoji-svg" />')
      .gsub(/👊/,'<img src="../../img/emojis/subdue.svg" class="emoji-svg" />')
      .gsub(/🔓/,'<img src="../../img/emojis/unlock.svg" class="emoji-svg" />')
      .gsub(/⚠/,'<img src="../../img/emojis/alert.svg" class="emoji-svg" />')
      .gsub(/💰/,'<img src="../../img/emojis/loot.svg" class="emoji-svg" />')
      .gsub(/⏱/,MastersOfTheHeist::VERSION)
end

scenarios_md = File.read 'scenarios/rivercity/booklet.md'

File.open('scenarios/rivercity/booklet.md.html', 'w+') do |f|
  html = Kramdown::Document.new(scenarios_md, parse_block_html: true).to_html
  html = replace_emojis(html) # hack around https://github.com/wkhtmltopdf/wkhtmltopdf/issues/2913
  f.write html
end
