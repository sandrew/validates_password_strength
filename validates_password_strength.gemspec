# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'validates_password_strength/version'

Gem::Specification.new do |spec|
  spec.name          = "validates_password_strength"
  spec.version       = ValidatesPasswordStrength::VERSION
  spec.authors       = ["Andrew Shaydurov"]
  spec.email         = ["gearhead@it-primorye.ru"]
  spec.description   = "This gem unions a server-side ActiveModel password strength validation plugin with a client-side password strength estimation"
  spec.summary       = "ActiveModel and JS password strength estimation"
  spec.homepage      = "https://github.com/sandrew/validates_password_strength"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'

  spec.add_dependency 'activemodel', '>= 3.2.0'
end
