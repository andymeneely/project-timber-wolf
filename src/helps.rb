# Build the player helps
require 'squib'
require_relative 'util/helpers'

data = Squib.xlsx file: 'data/data.xlsx', sheet: 5 do |col, item|
  escape_emojis(newlineate(col, item))
end
# combine the entire text into one string - not using row-per card here
str = data['Icon'].zip(data['Description']).inject("") do |s, r|
  s + "#{r[0]} #{r[1]}\n"
end


Squib::Deck.new(cards: 4, width: 1125, height: 825) do
  use_layout file: 'layouts/helps.yml'
  png file: 'cork.png'

  svg file: 'help-color.svg'

  text layout: :subactions, str: str do |embed|
    embed_emojis(embed, 45)
  end

  ideas_str = <<~EOS
    :idea:: change die +1/-1, wraparound
    :idea:: 1 Escape Move at the end
  EOS
  text layout: :ideas, str: ideas_str do |embed|
    embed_emojis(embed, 45)
  end

  text layout: :die_roll_1, str: 'Any die roll'
  text layout: :die_roll_2, str: 'Die roll of 6'

  save_png prefix: 'help_front_'
end


Squib::Deck.new(cards: 4, width: 1125, height: 825) do
  use_layout file: 'layouts/helps.yml'
  png file: 'cork.png'
  svg file: 'help-color-back.svg'

  planning_str = <<~EOS
  - Simultaneous play
  - Place planning tokens
  - Visit Shop
  - Use Fixer abilities
  - Max :meeple: :meeple: per Entrance
  EOS
  text layout: :planning, str: planning_str do |embed|
    embed_emojis(embed, 35)
  end

  text layout: :heist, str: <<~EOS
  1. Roll dice
  2. Action Phase, simultaneous play
  3. Event phase
     a. Do ONE event, then
     b. Do ALL crises queued
  4. Repeat until Escape initiated
  EOS

  escape_str = <<~EOS
  - Ignore planning tokens, cameras
  - Each Escape Move costs an :idea:
  - No Max :meeple: per Exit
  - Cannot :unlock:
  - Need :idea: to escape a Guard
  - AFTER Escape Moves, may roll
  EOS

  text layout: :escape, str: escape_str do |embed|
    embed_emojis(embed, 45)
  end

  text layout: :level2, str: 'Level 1 to 2: Upgrade Skill'
  text layout: :level3, str: 'Level 2 to 3: Upgrade Char.'
  text layout: :level4, str: 'Level 3 to 4: Upgrade Skill'

  save_png prefix: 'help_back_'
end
