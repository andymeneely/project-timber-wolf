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

# process XLSX data and just replace %n with a newline
def newlineate(col, item)
  return nil if item.nil?
  item.to_s.gsub "%n", "\n"
end

def summarize_skill(str)
  return nil if str.nil?
  str.gsub(/[^💡🔊➜📷🔍👊🔓⚠]/,'').chars.sort.join
end

# this isn't working for some stupid reason
module Squib
  module ArrayExtras
    refine Array do
      def select_indices
        self.map.with_index { |x, i| yield(x) ? i : nil }.compact
      end

      def merge(other, op)
        self.zip(other).map { |a| a.inject(op) }
      end      
    end
  end
end
