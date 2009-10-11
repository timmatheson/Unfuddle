module Unfuddle
  class Project < ActiveResource::Base    
    def tickets
      Ticket.find(:all, :from => "/projects/#{id}/tickets")
    end
    
    def self.all
      find(:all, :from => "/projects.xml")
    end
  end
end
