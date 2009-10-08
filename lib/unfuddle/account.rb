module Unfuddle
  # Your account - configure it in config/unfuddle.yml
  class Account < ActiveResource::Base
    def self.current
      find(:one, :from => "/api/v1/account.xml")
    end
  end
end
