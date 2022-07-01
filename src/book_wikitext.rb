require 'kramdown'
require_relative 'util/version'

def replace_emojis(html)
  html.gsub(/💡/,'<img src="../img/emojis/idea.svg" class="emoji-svg" />')
      .gsub(/🔊/,'<img src="../img/emojis/noise.svg" class="emoji-svg" />')
      .gsub(/➜/,'<img src="../img/emojis/move.svg" class="emoji-svg" />')
      .gsub(/📷/,'<img src="../img/emojis/disable.svg" class="emoji-svg" />')
      .gsub(/🔍/,'<img src="../img/emojis/reveal.svg" class="emoji-svg" />')
      .gsub(/👊/,'<img src="../img/emojis/subdue.svg" class="emoji-svg" />')
      .gsub(/🔓/,'<img src="../img/emojis/unlock.svg" class="emoji-svg" />')
      .gsub(/⚠/,'<img src="../img/emojis/alert.svg" class="emoji-svg" />')
      .gsub(/💰/,'<img src="../img/emojis/loot.svg" class="emoji-svg" />')
      .gsub(/🧩/,'<img src="../img/emojis/crack.svg" class="emoji-svg" />')
      .gsub(/⏱/,MastersOfTheHeist::VERSION)
end

def render_erb
  erb = ERB.new(File.read('rules/BOOK_TEMPLATE.html.erb'))
  erb.result(binding)
end

book_md = File.read 'rules/RULES.md', encoding: 'utf-8'
book_md += File.read 'scenarios/rivercity/booklet.md', encoding: 'utf-8'
File.open('rules/BOOK.html', 'w+') do |f|
  html = Kramdown::Document.new(book_md, parse_block_html: true).to_html
  html = replace_emojis(html) # hack around https://github.com/wkhtmltopdf/wkhtmltopdf/issues/2913
  full_html = render_erb { html }
  f.write full_html
end


