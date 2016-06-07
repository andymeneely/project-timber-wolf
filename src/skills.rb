require 'squib'
require_relative 'helpers'
require 'pp'

data = Squib.xlsx(file: 'data/data.xlsx', sheet: 1) do |col, item|
  newlineate(col, item)
end
total = data['Name'].size
save_json data: data, cards: total, to: 'data/skills.json'

Squib::Deck.new(cards: total, width: 1125, height: 825) do
  use_layout file: 'layouts/skills.yml'
  background color: :white
  rect layout: :cut

  svg file: 'skill.svg'

  text str: data['Level'].map { |l| "lvl #{l}"}, layout: :level
  text str: data['Rolls'].map { |s| skill_lacks(s) }, layout: :lacks
  text str: data['Name'], layout: :name
  (1..6).each do |i|
    text str: data[i.to_s], layout: "die_roll_#{i}"
  end

  save_png prefix: 'skill_'
  save_sheet prefix: 'skill_sheet_', trim: '0.125in'
  save_pdf file: 'skills.pdf', trim: '0.125in'

  build :rulebook_figures do
    # rect layout: :border
    # %i(Action SubAction DieRoll Level).each do |fig|
    #   text layout: "Figure#{fig}"
    # end
    showcase range: 0,
             dir: 'rules', file: 'skill_example.png',
             trim: 37.5, fill_color: '#0000', scale: 0.9

  end
end
