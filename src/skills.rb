require 'squib'
require_relative 'helpers'
require 'pp'

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
    embed_emojis(embed)
  end

  text str: data['Name'], layout: :name
  (1..6).each do |i|
    text(str: data[i.to_s], layout: "die_roll_#{i}") do |embed|
      embed_emojis(embed)
    end
  end

  # save_png prefix: 'skill_'#, rotate: true
  # save_pdf file: 'skills.pdf', trim: '0.125in'
  # save_pdf file: 'skills-k40.pdf', width: '8.5in', height: '11in',
  #          margin: '0.125in', trim: '0.05in'

  build :rulebook_figures do
    rect layout: :border
    %i(Action DieRoll Lacks).each do |fig|
      text layout: "Figure#{fig}"
    end

    save_png range: 0, dir: 'rules', prefix: 'figure_skill_',
             trim: 37.5, trim_radius: 37.5
  end
end
