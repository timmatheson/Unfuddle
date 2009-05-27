# Author: Tim Matheson
# Website: http://www.timmatheson.com

module Unfuddle
  class Session
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
    
  private
  
  # Your account - configure it in config/unfuddle.yml
  class Account < ActiveResource::Base
    def self.current
      find(:one, :from => "/api/v1/account.xml")
    end
  end
  
  class Project < ActiveResource::Base
    self.prefix = "/projects"
    
    def activity
    end
    
    def tickets(state = "all")
      Ticket.find(:all, :from => "/projects/#{id}/tickets")
    end
    
    def self.all
      find(:all, :from => "/projects.xml")
    end
  end
  
  class Person < ActiveResource::Base
    self.prefix = "/people"
  end
  
  class Repository < ActiveResource::Base
    def projects
      []
    end
  end
  
  class TimeTracking < ActiveResource::Base; end;
  
  class Changeset < ActiveResource::Base; end;
  
  class Milestone < ActiveResource::Base; end;
  
  class Message < ActiveResource::Base; end;
  
  class Notebook < ActiveResource::Base; end;
  
  class Ticket < ActiveResource::Base; end;
end

#UnfuddleNotifier.send(:include, Unfuddle)