module Unfuddle
  class Ticket < ActiveResource::Base
    self.prefix = "/tickets"
  end
end