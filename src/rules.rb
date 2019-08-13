require 'kramdown'

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
end

rules_md = File.read 'rules/RULES.md', encoding: 'utf-8'

File.open('rules/RULES.md.html', 'w+') do |f|
  html = Kramdown::Document.new(rules_md, parse_block_html: true).to_html
  html = replace_emojis(html) # hack around https://github.com/wkhtmltopdf/wkhtmltopdf/issues/2913
  f.write html
end
