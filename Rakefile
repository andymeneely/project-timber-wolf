require 'byebug'
require 'erb'
require 'launchy'
require 'rake/clean'
require 'squib'

# Add Rake's clean & clobber tasks
CLEAN.include('_output/*').exclude('_output/gitkeep.txt')

task default: [
  :with_color,
  :full,
  :rulebook_figures,
  :characters,
  :character_backs,
  :skills,
  :skill_backs,
  :npcs,
  :events,
  :crises,
  :fixers,
  :chits,
  :items,
  :trackers,
  :helps,
  :rules,
  :rivercity
]
task :full do
  ENV['SQUIB_BUILD'] ||= ''
  ENV['SQUIB_BUILD'] += ',full'
end

task color: [:with_color, :default]

task :sheets do
  Squib.enable_build_globally :sheets
  Rake::Task['color'].invoke
end

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

# Any file in src/ can be loaded with `rake foo` if src/foo.rb exists
# The first line of the file, if it's a comment, becomes the description
Dir['src/**.rb'].each do |src_file|
  comment = File.open(src_file) { |f| f.readline } # first line comment
  desc comment[/^# (.+)/, 1] if comment.start_with? '# '
  task_name = src_file[/src\/(.+).rb/, 1].to_sym
  task task_name do
    load src_file
  end
end

task :data do
  url = "file:///#{Dir.pwd}/data/data.xlsx"
  Launchy.open(url)
end

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

desc 'Build the rules PDF'
task rules: ['rules:md_to_html','rules:html_to_pdf']
namespace :rules do
  task :md_to_html do
    puts "Converting markdown to html..."
    load 'src/rules.rb' # convert markdown
    erb = ERB.new(File.read('rules/RULES_TEMPLATE.html.erb'))
    File.open('rules/RULES.html', 'w+') do |html|
      html.write(erb.result)
    end
  end

  task html_to_pdf: [:md_to_html] do
    puts "Weasyprinting..."
    `python src/weasybuild.py`
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
        scenarios/your-last-heist/booklet.html _output/your-last-heist.pdf
    EOS
  end
end

desc 'Build the River City scenarios PDF'
task rivercity: ['rivercity:md_to_html','rivercity:html_to_pdf']

namespace :rivercity do
  task :md_to_html do
    load 'src/rivercity.rb' # convert markdown
    template = 'scenarios/rivercity/booklet-template.html.erb'
    erb = ERB.new(File.read(template))
    File.open('scenarios/rivercity/booklet.html', 'w+') do |html|
      html.write(erb.result)
    end
  end

  task html_to_pdf: [:md_to_html] do
    puts "Weasyprinting..."
    `python src/weasybuild_rivercity.py`
  end
end
