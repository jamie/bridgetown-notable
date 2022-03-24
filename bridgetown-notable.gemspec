# frozen_string_literal: true

require_relative "lib/bridgetown-notable/version"

Gem::Specification.new do |spec|
  spec.name          = "bridgetown-notable"
  spec.version       = BridgetownNotable::VERSION
  spec.author        = "Jamie Macey"
  spec.email         = "jamie.git@tracefunc.com"
  spec.summary       = "Plugin to host a Notable data directory"
  spec.homepage      = "https://github.com/jamie/bridgetown-notable"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r!^(test|script|spec|features|frontend)/!) }
  spec.test_files    = spec.files.grep(%r!^spec/!)
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.5.0"

  spec.add_dependency "bridgetown", ">= 1.0.0", "< 2.0"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "nokogiri", "~> 1.6"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop-bridgetown", "~> 0.2"
end
