# This is a quick-and-dirty script to simulate what a campaign might look like.
# We adjust various probabilities based on what we observe in playtesting
# Then see how it might play out.
# This is also a way to test out what policy we should do for leveling up.

heists = [
  {
    name: 'The Inclusion Job',
    level: 1..2,
    p_success: 0.8,
    p_character_escape: 0.75,
  },
  {
    name: 'Chain of Custody',
    level: 1..2,
    p_success: 0.8,
    p_character_escape: 0.75,
  },
  {
    name: 'The Startup Job',
    level: 1..2,
    p_success: 0.8,
    p_character_escape: 0.75,
  }
]

def max_level?(lvls)
  lvls.inject(true) { |max, lvl| max && lvl == 4 }
end

prng = Random.new
num_players = 4
levels = Array.new(num_players, 1)
heists_done = 0

until max_level?(levels) do
  heists.shuffle!
  heist = heists[0]
  busted = 0

  heists_done += 1
  puts "#{heists_done}. Team does #{heist[:name]} at levels #{levels}..."
  if success = prng.rand < heist[:p_success]
    puts "  SUCCESS!"
    levels.map! do |lvl| # policy: only level up when you escape
      if prng.rand < heist[:p_character_escape]
        lvl += 1 if lvl < 4
      else
        busted += 1
      end
      lvl
    end
    puts "  Levelups: #{levels}"
    puts "  Busted: #{busted}"
    if busted > 0
      heists_done += 1
      levels.map! { |lvl| (lvl < 4) ? lvl + 1 : lvl } # everyone levels up
      puts "#{heists_done}. Team does breakout and all level up: #{levels}"
      puts "  SUCCESS. Always success."
    end
  else
    puts "  FAIL!"
  end
end
