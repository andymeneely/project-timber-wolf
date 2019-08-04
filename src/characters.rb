require 'squib'
require_relative 'helpers'

data = Squib.xlsx(file: 'data/data.xlsx') do |col, item|
  escape_emojis(newlineate(col, item))
end
total = data['Name'].size

File.open('data/characters.txt', 'w+') { |f| f.write data.to_pretty_text }

Squib::Deck.new(cards: total) do
  use_layout file: 'layouts/characters.yml'
  background color: :white
  rect layout: :cut
  svg file: 'character.svg'

  thirdskill_box = data['Default3'].map do |default|
                     default.to_s.empty? ? nil : 'thirdskill_bw.svg'
                   end
  svg file: thirdskill_box

  build :color do
    png file: 'cork.png', x: width, angle: Math::PI / 2
    png file: 'character shadows.png'
    svg file: 'character-color.svg'#, range: 0
    svg file: data.name.map { |n| "polaroids/#{n.downcase}.svg"}

    thirdskills = data['Default3'].map do |default|
      default.nil? ? nil : 'thirdskill shadow.png'
    end
    png file: thirdskills
    thirdskills = data['Default3'].map do |default|
      default.nil? ? nil : 'thirdskill.svg'
    end
    svg file: thirdskills
  end

  titlesizes = data['Name'].map do |name|
    case name.length
    when 0..7 then 19.84
    when 8..9 then 16
    when 10..12 then 14.72
    when 13..14 then 13.44
    when 12..50 then 10.88
    end
  end
  text str: data['Name'], layout: :title, font_size: titlesizes

  levels = data['Level'].map { |l| l == '1' ? "Amateur" : "Pro" }
  text layout: :Level, str: levels
  text layout: :Memory, str: data['Memory']
  text layout: :Ideas, str: data['Ideas']

  text(layout: :Default1, str: data['Default1']) do |embed|
    embed.svg key: ':idea:', file: 'img/emojis/idea.svg', width: 40, height: 40
    embed.svg key: ':noise:', file: 'img/emojis/noise.svg', width: 40, height: 40
    embed.svg key: ':move:', file: 'img/emojis/move.svg', width: 40, height: 40
    embed.svg key: ':disable:', file: 'img/emojis/disable.svg', width: 40, height: 40
    embed.svg key: ':reveal:', file: 'img/emojis/reveal.svg', width: 40, height: 40
    embed.svg key: ':subdue:', file: 'img/emojis/subdue.svg', width: 40, height: 40
    embed.svg key: ':unlock:', file: 'img/emojis/unlock.svg', width: 40, height: 40
    embed.svg key: ':alert:', file: 'img/emojis/alert.svg', width: 40, height: 40
    embed.svg key: ':loot:', file: 'img/emojis/loot.svg', width: 40, height: 40
  end

  text layout: :Default2, str: data['Default2'] do |embed|
    embed.svg key: ':idea:', file: 'img/emojis/idea.svg', width: 40, height: 40
    embed.svg key: ':noise:', file: 'img/emojis/noise.svg', width: 40, height: 40
    embed.svg key: ':move:', file: 'img/emojis/move.svg', width: 40, height: 40
    embed.svg key: ':disable:', file: 'img/emojis/disable.svg', width: 40, height: 40
    embed.svg key: ':reveal:', file: 'img/emojis/reveal.svg', width: 40, height: 40
    embed.svg key: ':subdue:', file: 'img/emojis/subdue.svg', width: 40, height: 40
    embed.svg key: ':unlock:', file: 'img/emojis/unlock.svg', width: 40, height: 40
    embed.svg key: ':alert:', file: 'img/emojis/alert.svg', width: 40, height: 40
    embed.svg key: ':loot:', file: 'img/emojis/loot.svg', width: 40, height: 40
  end
  
  text layout: :Default3, str: data['Default3'] do |embed|
    embed.svg key: ':idea:', file: 'img/emojis/idea.svg', width: 40, height: 40
    embed.svg key: ':noise:', file: 'img/emojis/noise.svg', width: 40, height: 40
    embed.svg key: ':move:', file: 'img/emojis/move.svg', width: 40, height: 40
    embed.svg key: ':disable:', file: 'img/emojis/disable.svg', width: 40, height: 40
    embed.svg key: ':reveal:', file: 'img/emojis/reveal.svg', width: 40, height: 40
    embed.svg key: ':subdue:', file: 'img/emojis/subdue.svg', width: 40, height: 40
    embed.svg key: ':unlock:', file: 'img/emojis/unlock.svg', width: 40, height: 40
    embed.svg key: ':alert:', file: 'img/emojis/alert.svg', width: 40, height: 40
    embed.svg key: ':loot:', file: 'img/emojis/loot.svg', width: 40, height: 40
  end

  text layout: :Special, str: data['Special'] do |embed|
    embed.svg key: ':idea:', file: 'img/emojis/idea.svg', width: 40, height: 40
    embed.svg key: ':noise:', file: 'img/emojis/noise.svg', width: 40, height: 40
    embed.svg key: ':move:', file: 'img/emojis/move.svg', width: 40, height: 40
    embed.svg key: ':disable:', file: 'img/emojis/disable.svg', width: 40, height: 40
    embed.svg key: ':reveal:', file: 'img/emojis/reveal.svg', width: 40, height: 40
    embed.svg key: ':subdue:', file: 'img/emojis/subdue.svg', width: 40, height: 40
    embed.svg key: ':unlock:', file: 'img/emojis/unlock.svg', width: 40, height: 40
    embed.svg key: ':alert:', file: 'img/emojis/alert.svg', width: 40, height: 40
    embed.svg key: ':loot:', file: 'img/emojis/loot.svg', width: 40, height: 40
  end

  save_png prefix: 'character_'#, range: 0
  save_pdf file: 'characters.pdf', trim: '0.125in'#, range: 0
  save_pdf file: 'characters-k40.pdf', margin: '0.125in', trim: '0.05in'
  build :color do
    showcase range: [0,3,6,9,12,15], file: 'characters_amateurs_showcase.png',
             fill_color: :white
    showcase range: [0,1,2], file: 'characters_levelup_showcase.png',
             fill_color: :white
    showcase range: [9,10,11], file: 'characters_levelup_showcase2.png',
             fill_color: :white

    showcase range: [9,8], file: 'character_showcase.png'
    showcase range: [11], file: 'kelly_showcase.png'
  end

  build :rulebook_figures do
    rect layout: :border
    %i(Level Memory Ideas Action1 Action2 Special Skill1 Skill2).each do |fig|
      text layout: "Figure#{fig}"
    end
    # showcase range: 0,
    #          dir: 'rules', file: 'character_example.png',
    #          trim: 37.5, fill_color: '#0000', scale: 0.9
  end
end
