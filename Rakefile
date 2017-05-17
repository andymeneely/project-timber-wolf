require 'squib'
require 'launchy'
require 'erb'
require 'rake/clean'

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
  :events,
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

task :events do
  load 'src/events.rb'
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
  'travis_scenarios',
  :dropbox
]

desc 'Build the rules PDF'
task rules: ['rules:md_to_html','rules:html_to_pdf']

task 'travis_rules' => ['rules:md_to_html'] do
  sh <<-EOSH.gsub(/\n/,' ')
    xvfb-run --server-args="-screen 0, 1024x768x24"
    wkhtmltopdf
    --page-width    5.5in
    --page-height   8.0in
    --margin-left   0.55in
    --margin-right  0.55in
    --margin-bottom 0.55in
    --margin-top    0.55in
    --footer-right "[page] of [topage]"
    --footer-left "Rules"
    --footer-font-name "Archivo Narrow"
    --footer-font-size "10"
    scenarios/RULES.html _output/RULES.pdf
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
      --page-width    5.5in
      --page-height   8.0in
      --margin-left   0.55in
      --margin-right  0.55in
      --margin-bottom 0.55in
      --margin-top    0.55in
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
task scenarios: ['scenarios:md_to_html','scenarios:html_to_pdf']


desc 'Build the scenarios on travis'
task 'travis_scenarios' => ['scenarios:md_to_html'] do
  sh <<-EOSH.gsub(/\n/,' ')
    xvfb-run --server-args="-screen 0, 1024x768x24"
    wkhtmltopdf
    --page-width    5.5in
    --page-height   8.0in
    --margin-left   0.55in
    --margin-right  0.55in
    --margin-bottom 0.55in
    --margin-top    0.55in
    --footer-right "[page] of [topage]"
    --footer-left "Scenarios"
    --footer-font-name "Archivo Narrow"
    --footer-font-size "10"
    scenarios/scenarios.html _output/scenarios.pdf
  EOSH
end

namespace :scenarios do
  task :md_to_html do
    load 'src/scenarios.rb' # convert markdown
    erb = ERB.new(File.read('scenarios/scenarios_template.html.erb'))
    File.open('scenarios/scenarios.html', 'w+') do |html|
      html.write(erb.result)
    end
  end

  task html_to_pdf: [:md_to_html] do
    sh <<-EOS.gsub(/\n/, '')
      wkhtmltopdf
        --page-width    5.5in
        --page-height   8.0in
        --margin-left   0.55in
        --margin-right  0.55in
        --margin-bottom 0.55in
        --margin-top    0.55in
        --footer-right "[page] of [topage]"
        --footer-left "Scenarios"
        --footer-font-name "Archivo Narrow"
        --footer-font-size "10"
        scenarios/scenarios.html _output/scenarios.pdf
    EOS
    @launch ||= []
    @launch << "file:///#{Dir.pwd}/_output/scenarios.pdf"
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
