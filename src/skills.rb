# Build skills card fronts
require 'squib'
require 'pp'
require_relative 'util/helpers'

data = Squib.xlsx(file: 'data/data.xlsx', sheet: 1, explode: 'Qty') do |col, item|
  escape_emojis(newlineate(col, item))
end
total = data['Name'].size
File.open('data/skills.txt', 'w+') { |f| f.write data.to_pretty_text }

Squib::Deck.new(cards: total, width: 1125, height: 825) do
  use_layout file: 'layouts/skills.yml'
  background color: :white
  rect layout: :cut

  svg file: 'skill.svg' # black-and-white
  build :color do
    png file: 'cork.png'
    png file: 'skill shadows.png'
    svg file: 'skill-color.svg' #, range: 0
  end

  text str: data['Level'].map { |l| l == '1' ? "Amateur" : "Pro" },
       layout: :level

  text(str: data['Rolls'].map { |s| skill_lacks(s) }, layout: :lacks) do |embed|
    embed_emojis(embed, 30)
  end

  text str: data['Name'], layout: :name
  (1..6).each do |i|
    text(str: data[i.to_s], layout: "die_roll_#{i}") do |embed|
      embed_emojis(embed, 50)
    end
  end

  # save_png prefix: 'skill_', rotate: true
  build :tgc do
    tgc_prefixes = data.tgc_code.map do |code|
      "Skill #{code}"
    end
    save_png prefix: tgc_prefixes, rotate: :clockwise, count_format: ''
  end


  save_png range: [4,8], dir: 'rules', prefix: 'figure_setup_skill_',
           trim: 37.5, trim_radius: 37.5
  # save_pdf file: 'skills.pdf', trim: '0.125in'
  # save_pdf file: 'skills-k40.pdf', width: '8.5in', height: '11in',
  #          margin: '0.125in', trim: '0.05in'

  # build :sheets do
    save_sheet prefix: 'sheet_skills_', columns: 5, rows: 5
  # end

  build :rulebook_figures do
    %i(Action DieRoll Lacks).each do |fig|
      text layout: "Figure#{fig}"
    end

    save_png range: 0, dir: 'rules', prefix: 'figure_skill_',
             trim: 37.5, trim_radius: 37.5
  end
end
