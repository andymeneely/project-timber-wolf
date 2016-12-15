require 'json'
require 'pp'

# Generates a JSON output from deck data for easy Git tracking.
def save_json(cards: 1, data: {}, to: 'data/data.json')
  ''
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

def skill_lacks(str)
  "Lacks " + ('💡➜📷🔍👊🔓'.chars - str.chars).join
end

# Return the indices of the array that are non-nil
def non_nil_indices(arr)
  arr.each.with_index.inject([]) { |ids, (x, i)| ids << i unless x.nil?; ids }
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
