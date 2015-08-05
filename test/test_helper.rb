ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "webrat"
require 'factory_girl'

require 'factory_girl'
FactoryGirl.find_definitions


Webrat.configure do |config|
	  config.mode = :rails
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
