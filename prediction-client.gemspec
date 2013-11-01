# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'prediction/client/version'

Gem::Specification.new do |spec|
  spec.name          = "prediction-client"
  spec.version       = Prediction::Client::VERSION
  spec.authors       = ["rocky-jaiswal"]
  spec.email         = ["rocky.jaiswal@gmail.com"]
  spec.description   = "A simple sample client for prediction.io"
  spec.summary       = "A simple sample client for prediction.io"
  spec.homepage      = "https://github.com/rocky-jaiswal/prediction-client"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "predictionio"
  spec.add_dependency "faker"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
