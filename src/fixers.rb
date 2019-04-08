require 'squib'
require_relative 'helpers'

csvdata = <<~EOCSV
Name,Description,Membership
"Old Friend","During the planning phase, you may purchase:%nGain 💡 for $2k each%n🔍 for $2k each%nSell a jewel for $2k each.","No faction.%nCan work with any other Fixer."
"Sketchy Pawn Shop Owner","JEWELRY SALESMAN%nYou may sell jewels for $3k each.%n %nART MARKET%nYou may sell paintings for $1k each","Fence Cartel member.%nWon't work with Fixers in other factions."
"The Curator","REFINED TASTE%nYou may sell paintings for $2k each, or for a set of 2/3 for $5k/$8k.","Fence Cartel member.%nWon't work with Fixers in other factions."
"Tunneler","WE'LL MAKE A WAY%nDuring planning phase, you may add one Entrance to any external side. If you do, you must start with ⚠⚠🔊🔊🔊🔊","Fence Cartel member.%nWon't work with Fixers in other factions."
"Frustrated Beat Cop","MOONLIGHTER FRIENDS%nDuring planning, you may exchange Guard tokens with blanks in the bag for $1k each.","Corrupt Cops member%nWon't work with Fixers in other factions."
"Poor Prison Guard","HAVE YOU SEEN WHAT WE MAKE??%nDuring planning of a heist where a character starts on the inside, you may pay $3k to swap 2 Lock tokens with blanks in the bag.","Corrupt Cops member%nWon't work with Fixers in other factions."
"Burned Out Sergeant","IT'LL LOOK LEGIT%nFor $3k, any Guard discovered during the planning phase starts subdued.","Corrupt Cops member.%nWon't work with Fixers in other factions."
"Spammer","DENIAL OF SERVICE%nFor $3k, any Camera discovered during the planning phase starts disabled.","Hacker faction member.%nWon't work with Fixers in other factions."
"Security System Salesman","JUST AUTOMATE IT!%nDuring planning,  replace 1 Lock and 1 Guard with 3 Cameras in the security bag for $3k.","Hacker faction member.%nWon't work with Fixers in other factions."
"Internet Troll","IT'S ALL ONLINE%nDuring planning, you may purchase 🔍 for $1k each","Hacker faction member.%nWon't work with Fixers in other factions."
"Extorted Locksmith","WHAT ARE THEY USING?%nGain an 💡 for each Lock revealed during planning","Mafia faction member.%nWon't work with Fixers in other factions."
"Probably Retired Thief","IF YOU DO THIS, DO IT RIGHT%nDuring the planning phase, you may purchase 💡 for $1k each%n %nI'LL SHOW YOU A THING OR TWO%nFor $2k/$4k, you may replace an Amateur/Pro skill card","Mafia faction member.%nWon't work with Fixers in other factions."
"Recruiter","I KNOW A GUY%nNew characters gain 1 refined skill when recruited.","Mafia faction member.%nWon't work with Fixers in other factions."
"Talented Niece","GET WITH THE TIMES%nYou may use Fixers from both the Hacker and Mafia factions.","Hacker & Mafia member%nWon't work with Fixers in other factions."
"Retired Heist Detective","OLD SCHOOL DIPLOMACY%nYou may use Fixers from both the Corrupt Cops and the Fence Cartel factions.","Corrupt Cops & Fence Cartel member%nWon't work with Fixers in other factions."
"Online Mogul","DARK WEB%nYou may use Fixers from both the Fence Cartel and the Hacker factions.","Fence Cartel & Hacker member.%nWon't work with Fixers in other factions."
"Inside Man","LIFE AIN'T SO BLACK AND WHITE%nYou may use Fixers from both the Mafia and the Corrupt Cops factions.","Mafia & Corrupt Cops member.%nWon't work with Fixers in other factions."
EOCSV

data = Squib.csv(data: csvdata) do |col, item|
  newlineate(col, item)
end

# data = Squib.xlsx(file: 'data/data.xlsx', sheet: 4) do |col, item|
#   newlineate(col, item)
# end

File.open('data/fixers.txt', 'w+') { |f| f.write data.to_pretty_text }

Squib::Deck.new(cards: data.nrows) do
  use_layout file: 'layouts/npcs.yml'
  background color: :white
  rect layout: :cut
  svg file: 'npc.svg'

  build :color do
    png file: 'cork.png', x: width, angle: Math::PI / 2
    png file: 'fixer shadows.png'
    svg file: 'fixer-color.svg'
    # svg file: data.name.map { |n| "polaroids/#{n.downcase}.svg"}
    svg file: data.name.map { |n| "polaroids/fixer.svg"}
  end

  titlesizes = data['Name'].map do |name|
    case name.length
    when 0..6 then 19.84
    when 7..9 then 16
    when 10..11 then 14.72
    when 12..14 then 13.44
    when 12..50 then 10.88
    end
  end
  text str: data['Name'], layout: :title, font_size: titlesizes

  # text layout: :Default1, str: data.default1
  # text layout: :Default2, str: data.default2
  # text layout: :Default3, str: data.roll6
  text layout: :Special, str: data.description
  text layout: :Special, str: data.membership, y: 700, font_size: 8

  save_png prefix: 'fixer_'#, range: 0
  save_pdf file: 'fixers.pdf', trim: '0.125in'#, range: 0
end
