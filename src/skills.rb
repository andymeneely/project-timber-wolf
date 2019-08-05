require 'squib'
require_relative 'helpers'
require 'pp'

data = Squib.xlsx(file: 'data/data.xlsx', sheet: 1) do |col, item|
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
    # grits = data['Level'].map do |level|
    #   level == '1' ? "gritty amateur.png" : "gritty pro.png"
    # end
    # png file: grits, angle: Math::PI/2, x: 1125, y: 0
    svg file: 'skill-color.svg' #, range: 0
  end

  text str: data['Level'].map { |l| l == '1' ? "Amateur" : "Pro" },
       layout: :level

  text(str: data['Rolls'].map { |s| skill_lacks(s) }, layout: :lacks) do |embed|
    embed.svg key: ':idea:', file: 'img/emojis/idea.svg', width: 30, height: 30
    embed.svg key: ':noise:', file: 'img/emojis/noise.svg', width: 30, height: 30
    embed.svg key: ':move:', file: 'img/emojis/move.svg', width: 30, height: 30
    embed.svg key: ':disable:', file: 'img/emojis/disable.svg', width: 30, height: 30
    embed.svg key: ':reveal:', file: 'img/emojis/reveal.svg', width: 30, height: 30
    embed.svg key: ':subdue:', file: 'img/emojis/subdue.svg', width: 30, height: 30
    embed.svg key: ':unlock:', file: 'img/emojis/unlock.svg', width: 30, height: 30
    embed.svg key: ':alert:', file: 'img/emojis/alert.svg', width: 30, height: 30
    embed.svg key: ':loot:', file: 'img/emojis/loot.svg', width: 30, height: 30
  end
  
  text str: data['Name'], layout: :name
  (1..6).each do |i|
    text(str: data[i.to_s], layout: "die_roll_#{i}") do |embed|
      embed.svg key: ':idea:', file: 'img/emojis/idea.svg', width: 50, height: 50
      embed.svg key: ':noise:', file: 'img/emojis/noise.svg', width: 50, height: 50
      embed.svg key: ':move:', file: 'img/emojis/move.svg', width: 50, height: 50
      embed.svg key: ':disable:', file: 'img/emojis/disable.svg', width: 50, height: 50
      embed.svg key: ':reveal:', file: 'img/emojis/reveal.svg', width: 50, height: 50
      embed.svg key: ':subdue:', file: 'img/emojis/subdue.svg', width: 50, height: 50
      embed.svg key: ':unlock:', file: 'img/emojis/unlock.svg', width: 50, height: 50
      embed.svg key: ':alert:', file: 'img/emojis/alert.svg', width: 50, height: 50
      embed.svg key: ':loot:', file: 'img/emojis/loot.svg', width: 50, height: 50
    end
  end

  save_png prefix: 'skill_'#, rotate: true
  save_pdf file: 'skills.pdf', trim: '0.125in'
  save_pdf file: 'skills-k40.pdf', width: '8.5in', height: '11in',
           margin: '0.125in', trim: '0.05in'

  build :color do
    showcase file: 'skill_showcase.png', range: [0,2,4], fill_color: :white
    showcase file: 'skill_showcase2.png', range: [6,8,10], fill_color: :white
    showcase file: 'skill_showcase_levelup.png', range: [4,21,22],
            fill_color: :black
  end


  build :rulebook_figures do
    rect layout: :border
    %i(Action DieRoll).each do |fig|
      text layout: "Figure#{fig}"
    end

    # showcase range: 0,
    #          dir: 'rules', file: 'skill_example.png',
    #          trim: 37.5, fill_color: '#0000', scale: 0.9
  end
end
