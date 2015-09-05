Gem::Specification.new do |s|
  s.name        = 'ivan'
  s.version     = '0.1.0.pre'
  s.summary     = "ivan"
  s.description = "Creates imagery on analog vector monitors"
  s.authors     = ["Duncan Malashock"]
  s.email       = 'duncanmalashock@gmail.com'
  s.files       = `git ls-files`.split("\n")
  s.require_path = 'lib'
  s.homepage    =
    'http://rubygems.org/gems/ivan'
  s.license       = 'MIT'
  s.add_development_dependency 'bundler', '~> 1'
  s.add_development_dependency 'rake', '~> 10.4'
end