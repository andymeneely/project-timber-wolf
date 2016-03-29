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

  info = data['Level'].zip(data['Cost'], data['Type']).map do |lvl, cost, type|
    "lvl#{lvl}\n$#{cost}\n#{type}"
  end
  pp info

  text str: info, layout: :info
  # text str: data['Level'].map { |s| "lvl#{s}" }, layout: :level
  # text str: data['Cost'].map { |s| "$#{s}" }, layout: :cost
  # text str: data['Type'].map { |s| "$#{s}" }, layout: :cost
  text str: data['Name'], layout: :name
  text str: data['Rolls'], layout: :rolls

  save_png prefix: 'skill_'
  save_sheet prefix: 'skill_sheet_', trim: '0.125in'
end
