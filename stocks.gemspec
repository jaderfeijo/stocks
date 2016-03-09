# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'stocks/version'

Gem::Specification.new do |spec|
	spec.name          = "stocks"
	spec.version       = Stocks::VERSION
	spec.authors       = ["Jader Feijo"]
	spec.email         = ["jader.feijo@gmail.com"]

	spec.summary       = "Stocks algorithmic trading framework"
	spec.description   = "A stocks algorithmic trading framework"

	spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
	spec.executables   = ["stocks"]
	spec.require_paths = ["lib"]

	spec.add_development_dependency "bundler", "~> 1.11"
	spec.add_development_dependency "rake", "~> 10.0"
	spec.add_development_dependency "rspec", "~> 3.0"
end