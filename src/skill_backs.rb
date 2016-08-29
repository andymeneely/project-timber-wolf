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

  build :color do
    grits = data['Level'].map do |level|
      level == '1' ? "gritty amateur.png" : "gritty pro.png"
    end
    png file: grits, angle: Math::PI/2, x: 1125, y: 0
    svg file: 'skill-back-color.svg'#, range: 0
  end

  text str: data['Name'], layout: :name
  rolls1 = data['Rolls'].zip(data['Upgrade1Rolls']).map do |(amateur,pro)|
    arr = amateur.split('/').zip(pro.split('/')).map do | (am_act, pro_act) |
      if am_act == pro_act
        ''
      else
        str1 = am_act.to_s.gsub("\n",'')
        str2 = pro_act.to_s.gsub("\n",'')
        "#{str1} ⇒ #{str2}\n"
       end
    end
    arr.join
  end

  rolls2 = data['Rolls'].zip(data['Upgrade2Rolls']).map do |(amateur,pro)|
    arr = amateur.split('/').zip(pro.split('/')).map do | (am_act, pro_act) |
      if am_act == pro_act
        ''
      else
        str1 = am_act.to_s.gsub("\n",'')
        str2 = pro_act.to_s.gsub("\n",'')
        "#{str1} ⇒ #{str2}\n"
       end
    end
    arr.join
  end

  text str: data['Upgrade1'], layout: :upgrade1
  text str: data['Upgrade1'].map { |s| summarize_skill(s) }, layout: :up1_sum
  text str: rolls1, layout: :up1_sum, markup: true

  text str: data['Upgrade2'], layout: :upgrade2
  text str: data['Upgrade2'].map { |s| summarize_skill(s) }, layout: :up1_sum
  text str: rolls2, layout: :up2_sum, markup: true

  save_png prefix: 'skill_back_', rotate: true#, range: 0

  only_lvl1_2 = data['Level'].map.with_index { |x,i| [1].include?(x.to_i) ? i : nil }.compact
  save_pdf file: 'skill_backs.pdf', trim: '0.125in', range: only_lvl1_2
end
