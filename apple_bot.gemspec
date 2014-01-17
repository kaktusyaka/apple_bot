# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'apple_bot/version'

Gem::Specification.new do |spec|
  spec.name          = "apple_bot"
  spec.version       = AppleBot::VERSION
  spec.authors       = ["Vitalya Shevtsov"]
  spec.email         = ["kaktusyaka@gmail.com"]
  spec.description   = 'Emulation user in itunes connect site'
  spec.summary       = 'Emulation user in itenes connect site'
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "debugger"

  spec.add_dependency 'mechanize'
end
