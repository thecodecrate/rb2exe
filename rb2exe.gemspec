# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rb2exe/version'

Gem::Specification.new do |spec|
  spec.name          = 'rb2exe'
  spec.version       = Rb2exe::VERSION
  spec.authors       = ['Daniel Loureiro']
  spec.email         = ['loureirorg@gmail.com']
  spec.licenses      = ['CC0-1.0']

  spec.summary       = 'Ruby to Executable'
  spec.description   = 'Ruby to EXE - Turn ruby scripts into portable executable apps.'
  spec.homepage      = 'http://www.learnwithdaniel.com/2016/08/ruby-to-portable-exe-app/'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.executables << 'rb2exe'

  spec.add_development_dependency 'bundler', '~> 2.4.18'
  spec.add_development_dependency 'rake', '~> 13.0'
end
