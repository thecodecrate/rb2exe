# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rb2exe/version'

Gem::Specification.new do |spec|
  spec.name          = "rb2exe"
  spec.version       = Rb2exe::VERSION
  spec.authors       = ["Daniel Loureiro"]
  spec.email         = ["loureirorg@gmail.com"]

  spec.summary       = %q{Ruby to Executable}
  spec.description   = %q{Ruby to EXE - Turn ruby scripts into portable executable apps.}
  spec.homepage      = "http://www.learnwithdaniel.com/2016/08/ruby-to-portable-exe-app/"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "sudo", "~> 0.1"
end
