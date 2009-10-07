module Unfuddle
  class Person < ActiveResource::Base
    self.prefix = "/people"
  end
end