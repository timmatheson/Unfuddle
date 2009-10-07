module Unfuddle
  class Repository < ActiveResource::Base
    self.prefix = "/repositories"
    def projects
      []
    end
  end
end