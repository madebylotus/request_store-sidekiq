# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'request_store/sidekiq/version'

Gem::Specification.new do |spec|
  spec.name          = "request_store-sidekiq"
  spec.version       = RequestStore::Sidekiq::VERSION
  spec.authors       = ["Matt Millsaps-Brewer"]
  spec.email         = ["matt@madebylotus.com"]

  spec.summary       = %q{Easily integrate RequestStore with Sidekiq as a middleware}
  spec.description   = %q{Provides a Sidekiq Server Middleware to clear out RequestStore after each job is processed.}
  spec.homepage      = "https://github.com/madebylotus/request_store-sidekiq"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "request_store", ">= 1.3"
  spec.add_dependency "sidekiq", ">= 3.0"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "byebug", "~> 9.0"
  spec.add_development_dependency 'combustion', '~> 0.5.5'
end
