# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mr_yahoo_finance/config/version'

Gem::Specification.new do |spec|
  spec.name          = "mr_yahoo_finance"
  spec.version       = MrYahooFinance::Config::VERSION
  spec.authors       = ["mr-myself"]
  spec.email         = ["contact@mr-myself.com"]

  spec.summary       = %q{Getting financial data of specific company from Yahoo finance.}
  spec.description   = %q{Getting financial data of specific company from Yahoo finance.}
  spec.homepage      = "https://github.com/mr-myself"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "nokogiri", "~> 1.6"
end
