# Configure Rails Environment
ENV['RAILS_ENV'] = 'test'

require File.expand_path('../dummy/config/environment.rb',  __FILE__)

require 'rspec/rails'
require 'ffaker'

require 'capybara'
require 'capybara/rspec'
require 'capybara/rails'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.join(File.dirname(__FILE__), 'support/**/*.rb')].each { |f| require f }

# Requires factories defined in spree_core
require 'spree/core/testing_support/factories'
require 'spree/core/testing_support/controller_requests'
require 'spree/core/testing_support/authorization_helpers'
require 'spree/core/url_helpers'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include Spree::Core::UrlHelpers
  config.mock_with :rspec
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
end


# module FixturesHelper  
#   def self.included(base)
#     base.class_eval do
#       self.fixture_path = File.expand_path("../fixtures/spree", __FILE__)
#       set_fixture_class :retailer_types => Spree::RetailerType
#       set_fixture_class :retailers => Spree::Retailer
#       fixtures :all
#     end
#   end  
# end
