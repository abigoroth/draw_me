# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'draw_me/version'

Gem::Specification.new do |spec|
  spec.name          = "draw_me"
  spec.version       = DrawMe::VERSION
  spec.authors       = ["Yakob Ubaidi"]
  spec.email         = ["yakob.ubaidi@gmail.com"]

  spec.summary       = "Draws State Diagram for AASM gem"
  spec.description   = "By utilizing matsuda stateful enum gem."
  spec.homepage      = "http://github.com/abigoroth/draw_me"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
end
