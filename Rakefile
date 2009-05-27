%w(rubygems rake echoe).each do |gem|
  require gem
end

Echoe.new('unfuddle','0.1.0') do |p|
  p.description    = "Integrates your rails app with Unfuddle API"
  p.url            = "http://www.timmatheson.com"
  p.author         = "Tim Matheson"
  p.email          = "me@timmatheson.com"
  p.ignore_pattern = ["tmp/*","script/*"]
  p.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }