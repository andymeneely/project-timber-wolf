require 'squib'
require_relative 'helpers'
require 'pp'

data = Squib.xlsx file: 'data/data.xlsx', sheet: 1
total = data['Name'].size
save_json data: data, cards: total, to: 'data/skills.json'

Squib::Deck.new(cards: total) do
  use_layout file: 'layouts/skills.yml'
  background color: :white
  rect layout: :cut

  info = data['Level'].zip(data['Cost']).map do |lvl, cost, type|
    "lvl#{lvl}\n$#{cost}\n#{type}"
  end

  text str: info, layout: :info
  text str: data['Name'], layout: :name
  text str: data['Rolls'], layout: :rolls

  build :full do
    save_png prefix: 'skill_'
    save_sheet prefix: 'skill_sheet_', trim: '0.125in'
    save_pdf file: 'skills.pdf', trim: '0.125in'
  end

  build :lvl1 do
    lvl0s = data['Level'].each.with_index.inject([]) do |arr, (lvl, i)|
      arr << i if lvl.to_i == 1
      arr
    end
    save_pdf file: 'skills_lvl1.pdf', trim: '0.125in', range: lvl0s
    save_sheet prefix: 'skill_sheet_lvl1_', trim: '0.125in', range: lvl0s
  end
end
