module Unfuddle
  class Ticket < ActiveResource::Base
    def assignee_id
      nil
    end
  end
end