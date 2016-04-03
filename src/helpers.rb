require 'json'
require 'pp'

# Generates a JSON output from deck data for easy Git tracking.
def save_json(cards: 1, data: {}, to: 'data/data.json')
  h = {}
  (0..cards-1).each do |i|
    h[i] ||= {}
    data.each_pair do |key, value|
      h[i][key] = value[i]
    end
  end
  File.open(to,"w") do |f|
    f.write(JSON.pretty_generate(h))
  end
end
