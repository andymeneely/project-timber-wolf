require 'squib'
require_relative 'helpers'
require 'pp'
using Squib::ArrayExtras

data = Squib.xlsx(file: 'data/data.xlsx', sheet: 1) do |col, item|
  newlineate(col, item)
end
total = data['Name'].size

Squib::Deck.new(cards: total, width: 1125, height: 825) do
  use_layout file: 'layouts/skill_backs.yml'
  background color: :white
  rect layout: :cut

  svg file: 'skill_back.svg'

  text str: data['Name'], layout: :name
  text str: data['Rolls'].map { |s| summarize_skill(s) }, layout: :name_summary

  text str: data['Upgrade1'], layout: :upgrade1
  text str: data['Upgrade1'].map { |s| summarize_skill(s) }, layout: :up1_sum
  text str: data['Upgrade1Rolls'].map { |s| summarize_skill(s) }, layout: :up1_sum

  text str: data['Upgrade2'], layout: :upgrade2
  text str: data['Upgrade2'].map { |s| summarize_skill(s) }, layout: :up1_sum
  text str: data['Upgrade2Rolls'].map { |s| summarize_skill(s) }, layout: :up2_sum

  save_png prefix: 'skill_back_'

  only_lvl1_2 = data['Level'].map.with_index { |x,i| [1].include?(x.to_i) ? i : nil }.compact
  save_pdf file: 'skill_backs.pdf', trim: '0.125in', range: only_lvl1_2
end
