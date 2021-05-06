# Build the backs to skill cards
require 'squib'
require 'pp'
require_relative 'util/helpers'
using Squib::ArrayExtras

data = Squib.xlsx(file: 'data/data.xlsx', sheet: 1, explode: 'Qty') do |col, item|
  escape_emojis(newlineate(col, item))
end
total = data['Name'].size

Squib::Deck.new(cards: total, width: 1125, height: 825) do
  use_layout file: 'layouts/skill_backs.yml'
  background color: :white
  rect layout: :cut

  svg file: 'skill_back.svg'

  amateurs = data['Level'].map.with_index { |x,i| [1].include?(x.to_i) ? i : nil }.compact

  build :color do
    png file: 'cork.png'
    svg file: 'skill-back-color.svg', range: amateurs
  end

  text(str: data['Upgrade1Rolls'].map { |s| skill_lacks(s) },
       layout: :upgrade1lacks,
       range: amateurs) do |embed|
    embed_emojis(embed, 30, 6)
  end
  text(str: data['Upgrade2Rolls'].map { |s| skill_lacks(s) },
       layout: :upgrade2lacks,
       range: amateurs) do |embed|
    embed_emojis(embed, 30, 6)
  end

  text str: data['Name'], layout: :name, range: amateurs
  rolls1 = data['Rolls'].zip(data['Upgrade1Rolls']).map do |(amateur,pro)|
    arr = amateur.to_s.split('/').zip(pro.to_s.split('/')).map do | (am_act, pro_act) |
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
    arr = amateur.to_s.split('/').zip(pro.to_s.split('/')).map do | (am_act, pro_act) |
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

  text str: data['Upgrade1'], layout: :upgrade1, range: amateurs
  text str: data['Upgrade1'].map { |s| summarize_skill(s) }, layout: :up1_sum, range: amateurs
  text str: rolls1, layout: :up1_sum, markup: true, range: amateurs do |embed|
    embed_emojis(embed, 35)
  end

  text str: data['Upgrade2'], layout: :upgrade2, range: amateurs
  text str: data['Upgrade2'].map { |s| summarize_skill(s) }, layout: :up1_sum, range: amateurs
  text str: rolls2, layout: :up2_sum, markup: true, range: amateurs do |embed|
    embed_emojis(embed, 35)
  end

  save_png prefix: 'skill_back_', rotate: true#, range: 0

  # build :sheets do
    save_sheet prefix: 'sheet_skills_backs_', columns: 5, rows: 5
  # end

  # save_pdf file: 'skill_backs.pdf', trim: '0.125in', range: amateurs

  build :color do
    showcase file: 'skill_back_showcase.png', range: [2,4,6], fill_color: :black
  end
end
