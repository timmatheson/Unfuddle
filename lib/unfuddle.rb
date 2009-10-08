# Author: Tim Matheson
# Website: http://www.timmatheson.com

module Unfuddle      
  def self.config_path
    "config/unfuddle.yml"
  end

  def self.env
    defined?(RAILS_ENV) ? RAILS_ENV : "test"
  end

  def self.config 
    if File.exists?(config_path)
      return YAML.load_file(config_path)["#{env}"]
    else
      raise Exception, "Missing #{config_path} yaml file."
    end
  end
  
  ActiveResource::Base.site     = config["uri"]
  ActiveResource::Base.user     = config["username"]
  ActiveResource::Base.password = config["password"]
end

(Dir.entries("lib/unfuddle/") - [".","..",".git",".svn"]).each{ |f| require "lib/unfuddle/" + f }
