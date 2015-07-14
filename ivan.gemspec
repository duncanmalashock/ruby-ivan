Gem::Specification.new do |s|
  s.name        = 'ivan'
  s.version     = '0.1.0.pre'
  s.summary     = "ivan"
  s.description = "Creates imagery on analog vector monitors"
  s.authors     = ["Duncan Malashock"]
  s.email       = 'duncanmalashock@gmail.com'
  s.files       = Dir["lib/*", "lib/models/*"]
  s.require_path = 'lib'
  s.homepage    =
    'http://rubygems.org/gems/ivan'
  s.license       = 'MIT'
  s.add_runtime_dependency 'serialport', '~> 1.3'
  s.add_development_dependency 'bundler', '~> 1'
  s.add_development_dependency 'minitest', '~> 5.7'
  s.add_development_dependency 'guard', '~> 2.12'
  s.add_development_dependency 'guard-minitest', '~> 2.4'
  s.add_development_dependency 'rake', '~> 10.4'
  s.add_development_dependency 'pry', '~> 0.10'
  s.add_development_dependency 'pry-byebug', '~> 3.1'
  s.add_development_dependency 'ruby-prof', '~> 0.15'
  s.add_development_dependency 'codeclimate-test-reporter', '~> 0.4'
end