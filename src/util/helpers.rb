# Helper functions. Executing this does nothing.
require 'json'
require 'pp'

def merge_front_back(faces, backs, per_sheet = 8)
  z = faces.zip(backs)
  merged = []
  z.each_slice(per_sheet) do |pairs|
    pairs.each { |(face, _back)| merged << face }
    pairs.each { |(_face, back)| merged << back }
  end
  # We need to reverse the rows of backs so they line up front-to-back
  # Assume 2 rows
  merged2 = []
  merged.each_slice(per_sheet / 2) do |row|
    if row[0].to_s.match? /_back_/
      merged2 += row.reverse # rows of back should be reversed
    else
      merged2 += row         # rows of faces NOT reversed
    end
  end
  return merged2
end

# Generates a JSON output from deck data for easy Git tracking.
def save_json(cards: 1, data: {}, to: 'data/data.json')
  ''
end

# process XLSX data and just replace %n with a newline
def newlineate(col, item)
  return nil if item.nil?
  item.to_s.gsub "%n", "\n"
end

def event_name2file(name)
  s = name.downcase
          .gsub(' ','-')
          .gsub('!','')
          .gsub(',','')
  "events/#{s}.svg"
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

def embed_emojis(embed, size=30)
  embed.svg key: ':idea:', file: 'img/emojis/idea.svg', width: size, height: size
  embed.svg key: ':noise:', file: 'img/emojis/noise.svg', width: size, height: size
  embed.svg key: ':move:', file: 'img/emojis/move.svg', width: size, height: size
  embed.svg key: ':disable:', file: 'img/emojis/disable.svg', width: size, height: size
  embed.svg key: ':reveal:', file: 'img/emojis/reveal.svg', width: size, height: size
  embed.svg key: ':subdue:', file: 'img/emojis/subdue.svg', width: size, height: size
  embed.svg key: ':unlock:', file: 'img/emojis/unlock.svg', width: size, height: size
  embed.svg key: ':alert:', file: 'img/emojis/alert.svg', width: size, height: size
  embed.svg key: ':loot:', file: 'img/emojis/loot.svg', width: size, height: size
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
