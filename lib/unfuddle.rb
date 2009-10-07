# Author: Tim Matheson
# Website: http://www.timmatheson.com
(Dir.entries("lib/unfuddle/") - [".","..",".git",".svn"]).each{ |f| require "lib/unfuddle/" + f }
module Unfuddle  
end