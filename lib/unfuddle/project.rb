module Unfuddle
  class Project < ActiveResource::Base
    #self.prefix = "/projects"
    
    def activity
    end
    
    def tickets(state = "all")
      Ticket.find(:all, :from => "/projects/#{id}/tickets")
    end
    
    def self.all
      find(:all, :from => "/projects.xml")
    end
  end
end

