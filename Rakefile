require 'squib'
require 'launchy'
require 'erb'
require 'rake/clean'
require 'byebug'

# Add Rake's clean & clobber tasks
CLEAN.include('_output/*').exclude('_output/gitkeep.txt')

task default: [
  :full,
  :rulebook_figures,
  :chits,
  :characters,
  :character_backs,
  :skills,
  :skill_backs,
  :npcs,
  :events,
  :envelopes,
  :fixers,
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

task :npcs do
  load 'src/npcs.rb'
  @launch ||= []
  @launch << "file:///#{Dir.pwd}/_output/npcs.pdf"
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

task :events do
  load 'src/events.rb'
end

task :envelopes do
  load 'src/envelopes.rb'
end

task :fixers do
  load 'src/fixers.rb'
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

task travis: [
  :default,
  'travis_rules',

]

desc 'Build the rules PDF'
task rules: ['rules:md_to_html','rules:html_to_pdf']

# Typical booklet
# --page-width    5.0in
# --page-height   8.0in
# --margin-left   0.40in
# --margin-right  0.40in
# --margin-bottom 0.40in
# --margin-top    0.40in

# Small booklet
# --page-width    3.75in
# --page-height   6.25in
# --margin-left   0.45in
# --margin-right  0.45in
# --margin-bottom 0.45in
# --margin-top    0.45in

# Small Vault Box
# --page-width    6.50in
# --page-height   6.50in
# --margin-left   0.25in
# --margin-right  0.25in
# --margin-bottom 0.25in
# --margin-top    0.25in

task 'travis_rules' => ['rules:md_to_html'] do
  sh <<-EOSH.gsub(/\n/,' ')
    xvfb-run --server-args="-screen 0, 1024x768x24"
    wkhtmltopdf
    --page-width    6.50in
    --page-height   6.50in
    --margin-left   0.25in
    --margin-right  0.25in
    --margin-bottom 0.25in
    --margin-top    0.25in
    --footer-right "[page] of [topage]"
    --footer-left "Rules"
    --footer-font-name "Archivo Narrow"
    --footer-font-size "10"
    rules/RULES.html _output/RULES.pdf
  EOSH
end

namespace :rules do
  task :md_to_html do
    load 'src/rules.rb' # convert markdown
    erb = ERB.new(File.read('rules/RULES_TEMPLATE.html.erb'))
    File.open('rules/RULES.html', 'w+') do |html|
      html.write(erb.result)
    end
  end

  task html_to_pdf: [:md_to_html] do
    sh <<-EOS.gsub(/\n/, '')
      wkhtmltopdf
      --page-width    6.50in
      --page-height   6.50in
      --margin-left   0.25in
      --margin-right  0.25in
      --margin-bottom 0.25in
      --margin-top    0.25in
      --encoding 'UTF-8'
      --footer-right "[page] of [topage]"
      --footer-left "Rules"
      --footer-font-name "Archivo Narrow"
      --footer-font-size "10"
        rules/RULES.html _output/RULES.pdf
    EOS
    @launch ||= []
    @launch << "file:///#{Dir.pwd}/_output/RULES.pdf"
  end
end

desc 'Build the scenarios PDF'
task yourlastheist: ['yourlastheist:md_to_html','yourlastheist:html_to_pdf']

namespace :yourlastheist do
  task :md_to_html do
    load 'src/your_last_heist.rb' # convert markdown
    template = 'scenarios/your-last-heist/booklet-template.html.erb'
    erb = ERB.new(File.read(template))
    File.open('scenarios/your-last-heist/booklet.html', 'w+') do |html|
      html.write(erb.result)
    end
  end

  task html_to_pdf: [:md_to_html] do
    sh <<-EOS.gsub(/\n/, '')
      wkhtmltopdf
        --page-width    6.50in
        --page-height   6.50in
        --margin-left   0.25in
        --margin-right  0.25in
        --margin-bottom 0.25in
        --margin-top    0.25in
        --footer-right "[page] of [topage]"
        --footer-left "Your Last Heist"
        --footer-font-name "Archivo Narrow"
        --footer-font-size "10"
        scenarios/your-last-heist/your-last-heist.html _output/your-last-heist.pdf
    EOS
    @launch ||= []
    @launch << "file:///#{Dir.pwd}/_output/your-last-heist.pdf"
  end
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
