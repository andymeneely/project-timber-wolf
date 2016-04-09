require 'squib'

task default: [:full, :security, :characters, :skills, :helps]

task :full do
  ENV['SQUIB_BUILD'] ||= ''
  ENV['SQUIB_BUILD'] += ',full'
end

task :lvl1 do
  ENV['SQUIB_BUILD'] ||= ''
  ENV['SQUIB_BUILD'] += ',lvl1'
end

task :security do
  load 'src/security.rb'
end

task :characters do
  load 'src/characters.rb'
end

task :skills do
  load 'src/skills.rb'
end

task :helps do
  load 'src/helps.rb'
end
