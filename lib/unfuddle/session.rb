module Unfuddle
  class Session < ActiveResource::Base
    cattr_accessor :site
    cattr_accessor :protocol
    attr_accessor :url, :account, :username, :password, :errors
    
    self.protocol = "http"
    
    def initialize
      #file_path = File.join(RAILS_ROOT, "config", "unfuddle.yml")
      file_path = File.join(File.dirname(__FILE__), "..", "unfuddle.yml")
      @errors = []
      if File.exists?(file_path)
        config = YAML.load_file(file_path)["development"] 
        %W(account username password).each do |key| 
          if(config[key].nil? || config[key] == "")
            @errors.push("Unfuddle Gem::Error Missing parameter #{key}")
          end
        end
        raise Exception.new(@errors.join(", ")) unless errors.size == 0
        self.account, self.username, self.password, self.url = config["account"], config["username"], config["password"], "#{config["account"]}.unfuddle.com"
      else
        $stdout.puts "Unfuddle Gem::Error Missing unfuddle yaml config file, please create it in config/"
      end
      
      ActiveResource::Base.site = URI.parse(site)
    end
    
    def errors
      @errors.join(", ")
    end
    
    def account
      Account.current
    end
    
    def site
      "#{protocol}://#{username}:#{password}@#{url}/api/v1"
    end
  end
end