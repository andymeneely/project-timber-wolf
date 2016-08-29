require 'squib'
require 'launchy'
require 'erb'

task default: [
  :full,
  :rulebook_figures,
  :chits,
  :characters,
  :character_backs,
  :skills,
  :skill_backs,
  :helps
]

task :full do
  ENV['SQUIB_BUILD'] ||= ''
  ENV['SQUIB_BUILD'] += ',full'
end

task color: [:with_color, :default]

task :with_color do
  ENV['SQUIB_BUILD'] ||= ''
  ENV['SQUIB_BUILD'] += ',color'
end

task :lvl1 do
  ENV['SQUIB_BUILD'] ||= ''
  ENV['SQUIB_BUILD'] += ',lvl1'
end

task :rulebook_figures do
  ENV['SQUIB_BUILD'] ||= ''
  ENV['SQUIB_BUILD'] += ',rulebook_figures'
end

task :chits do
  load 'src/chits.rb'
end

task :characters do
  load 'src/characters.rb'
  @launch ||= []
  @launch << "file:///#{Dir.pwd}/_output/characters.pdf"
end

task :character_backs do
  load 'src/character_backs.rb'
  @launch ||= []
  @launch << "file:///#{Dir.pwd}/_output/character_backs.pdf"
end

task :skills do
  load 'src/skills.rb'
  @launch ||= []
  @launch << "file:///#{Dir.pwd}/_output/skills.pdf"
end

task :skill_backs do
  load 'src/skill_backs.rb'
  @launch ||= []
  @launch << "file:///#{Dir.pwd}/_output/skill_backs.pdf"
end

task :helps do
  load 'src/helps.rb'
end

task :launch do
  return unless @launch.respond_to? :each
  @launch.each do |url|
    puts "Launching #{url}"
    Launchy.open url
  end
end

task :data do
  url = "file:///#{Dir.pwd}/data/data.xlsx"
  puts "Launching #{url}"
  Launchy.open url
end

desc 'Post to dropbox'
task :dropbox do
  puts "=== Uploading to Dropbox ==="
  load 'src/upload_dropbox.rb'
end

task travis: [:default, :dropbox]

desc 'Build the rules sheet'
task :rules do
  load 'src/rules.rb' # convert markdown
  erb = ERB.new(File.read('rules/RULES_TEMPLATE.html.erb'))
  File.open('rules/RULES.html', 'w+') do |html|
    html.write(erb.result)
  end
  @launch ||= []
  @launch << "file:///#{Dir.pwd}/rules/RULES.html"
end

desc 'Build FAQ sheet'
task :faq do
  load 'src/faq.rb' # convert markdown
  erb = ERB.new(File.read('rules/FAQ_TEMPLATE.html.erb'))
  File.open('rules/FAQ.html', 'w+') do |html|
    html.write(erb.result)
  end
  @launch ||= []
  @launch << "file:///#{Dir.pwd}/rules/FAQ.html"
end
