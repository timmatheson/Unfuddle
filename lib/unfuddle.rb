# Author: Tim Matheson
# Website: http://www.timmatheson.com

module Unfuddle
  class Session
    cattr_accessor :site
    cattr_accessor :protocol
    attr_accessor :url, :account, :username, :password
    
    self.protocol = "http"
    
    def initialize
      #file_path = File.join(RAILS_ROOT, "config", "unfuddle.yml")
      file_path = File.join(File.dirname(__FILE__), "..", "unfuddle.yml")
      if File.exists?(file_path)
        config = YAML.load_file(file_path)["development"] 
        self.account, self.username, self.password, self.url = config["account"], config["username"], config["password"], "#{config["account"]}.unfuddle.com"
      else
        $stdout.puts "Unfuddle Gem::Error Missing unfuddle yaml config file, please create it in config/"
      end
      
      ActiveResource::Base.site = URI.parse(site)
    end
    
    def account
      Account.current
    end
    
    def site
      "#{protocol}://#{username}:#{password}@#{url}/api/v1"
    end
  end
    
  private
  
  # Your account - configure it in config/unfuddle.yml
  class Account < ActiveResource::Base
    def self.current
      find(:one, :from => "/api/v1/account.xml")
    end
  end
  
  class Project < ActiveResource::Base
    self.prefix = "/projects/:id"
    
    def tickets
      puts self.title
    end
    
    def self.all
      find(:all, :from => "/projects.xml")
    end
  end
  
  class Person < ActiveResource::Base
    self.prefix = "/people"
  end
  
  class Repository < ActiveResource::Base; end;
  
  class Message < ActiveResource::Base; end;
  
  class Notebook < ActiveResource::Base; end;
  
  class Ticket < ActiveResource::Base; end;
end