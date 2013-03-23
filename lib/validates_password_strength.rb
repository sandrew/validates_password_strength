require 'validates_password_strength/version'
require 'validates_password_strength/password_strength_validator'

if defined?(Rails)
  require 'validates_password_strength/rails/engine'
end

module ValidatesPasswordStrength
end
