require 'squib'
require_relative 'helpers'

data = Squib.xlsx(file: 'data/data.xlsx', sheet: 8)

File.open('data/chapters.txt', 'w+') { |f| f.write data.to_pretty_text }

Squib::Deck.new(cards: data.nrows, width: 2700, height: 1800) do
  use_layout file: 'layouts/envelopes.yml'
  background color: :white

  text layout: :name, str: data.name
  text layout: :act, str: data.act.map { |a| "Act #{a}"}
  text layout: :chapter, str: data.chapter.map { |c| "Chapter #{c}"}

  save_pdf file: 'envelopes.pdf', width: 2700, height: 1800,
           crop_marks: false
end
