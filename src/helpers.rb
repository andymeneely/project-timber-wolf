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

def escape_emojis(str)
  return nil if str.nil?
  str.gsub(/💡/,':idea:')
     .gsub(/🔊/,':noise:')
     .gsub(/➜/,':move:')
     .gsub(/📷/,':disable:')
     .gsub(/🔍/,':reveal:')
     .gsub(/👊/,':subdue:')
     .gsub(/🔓/,':unlock:')
     .gsub(/⚠/,':alert:')
     .gsub(/💰/,':loot:')
end

def embed_emojis(embed)
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


def summarize_skill(str)
  return nil if str.nil?
  str.gsub(/[^💡🔊➜📷🔍👊🔓⚠]/,'').chars.sort.join
end

def skill_lacks(str)
  emojid_str = str.gsub(':idea:','💡')
                  .gsub(':noise:','🔊')
                  .gsub(':move:','➜')
                  .gsub(':disable:','📷')
                  .gsub(':reveal:','🔍')
                  .gsub(':subdue:','👊')
                  .gsub(':unlock:','🔓')
                  .gsub(':alert:','⚠')
                  .gsub(':loot:','💰')
  lacked_str = "Lacks " + ('💡➜📷🔍👊🔓'.chars - emojid_str.chars).join
  return escape_emojis(lacked_str)
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
