namespace :unfuddle do
  task :setup, :environment do
    if defined?(RAILS_ROOT)
      config_path = File.join(RAILS_ROOT, "config", "unfuddle.yml")
      unless File.exists?(config_path)
        config_file = File.new(config_path, "w")
        config_file.write(File.read(config_file))
        config_file.close
        $stdout.puts "Added the config file template to config/unfuddle.yml"
      end
    end
  end
end