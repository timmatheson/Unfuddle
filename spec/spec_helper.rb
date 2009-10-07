ENV["RAILS_ENV"] ||= 'test'
require 'spec/autorun'
require 'rubygems'
require 'active_resource'
require 'ostruct'
require 'lib/unfuddle'
include Unfuddle
Spec::Runner.configure do |config|
end
