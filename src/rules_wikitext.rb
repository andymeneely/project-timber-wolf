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



def build_index(html)
  terms = %w(character npc)
  i = 0
  dict = {}
  terms.each do |term|
    html.gsub!(/ #{term} /i) do |_match|
      term_id = "crossref-#{term}-#{i}"
      i += 1
      str = " <a id=#{term_id} class=term>#{term}</a> "
      dict[term] ||= []
      dict[term] << term_id
      str
    end
  end
  list = dict.sort.map do | (term, term_id) |
    "<li>#{term}<a href=\"##{term_id}\"></a></li>"
  end
  puts dict.sort
  puts list
  html << "<h1>Index</h1> <ul id=idx> #{list.join} </ul>"
  return html
end

rules_md = File.read 'rules/RULES.md', encoding: 'utf-8'

File.open('rules/RULES.md.html', 'w+') do |f|
  html = Kramdown::Document.new(rules_md, parse_block_html: true).to_html
  html = replace_emojis(html) # hack around https://github.com/wkhtmltopdf/wkhtmltopdf/issues/2913
  html = build_index(html)
  f.write html
end
