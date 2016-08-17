require 'kramdown'

rules_md = File.read 'rules/RULES.md'

File.open('rules/RULES.md.html', 'w+') do |f|
  f.write Kramdown::Document.new(rules_md, parse_block_html: true).to_html
end
