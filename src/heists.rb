require 'squib'
require_relative 'helpers'

data = Squib.xlsx(file: 'data/data.xlsx', sheet: 14) do |col, item|
  newlineate(col, item)
end

File.open('data/heists.txt', 'w+') { |f| f.write data.to_pretty_text }
