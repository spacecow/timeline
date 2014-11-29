require 'rails/all'
unless defined? Timeline
  module Timeline
    class Application < Rails::Application
    end
  end
  Timeline::Application.initialize!
end
require 'minitest/autorun'
require 'rspec/rails'
