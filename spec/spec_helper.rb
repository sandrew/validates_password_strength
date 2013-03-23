require 'rspec'
require 'json'
require 'validates_password_strength'

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter     = 'documentation'
end