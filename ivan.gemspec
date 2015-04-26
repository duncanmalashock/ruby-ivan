lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ivan/version'

Gem::Specification.new do |spec|
  spec.name        = 'ivan'
  spec.version     = Ivan::VERSION
  spec.date        = '2015-04-25'
  spec.summary     = "Vector display toolkit"
  spec.description = "Specify and communicate vector graphics with osresearch's teensyv firmware"
  spec.authors     = ["Duncan Malashock"]
  spec.email       = 'duncanmalashock@gmail.com'
  spec.files        = Dir["{lib}/**/*.rb", "bin/*", "LICENSE", "*.md"]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_path = 'lib'
  spec.homepage    = 'http://github.com/duncanmalashock/ivan'
  spec.license       = 'MIT'

  spec.add_dependency 'serialport', '~> 1.3'
  spec.add_dependency 'guard-rspec', '~> 4.5'
  
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rspec', '~> 3.2'
  spec.add_development_dependency 'rake', '~> 10.1'
end