require 'coffee_script'
require 'erb'

guard 'sprockets', destination: 'tmp/js', :asset_paths => ['app/assets/javascripts', 'spec/javascripts'] do
  watch 'app/assets/javascripts/validates_password_strength.js.coffee'
  watch 'spec/javascripts/checker_spec.js.coffee.erb'
end
