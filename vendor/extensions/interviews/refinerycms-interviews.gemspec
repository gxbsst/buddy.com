# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-interviews'
  s.version           = '1.0'
  s.description       = 'Ruby on Rails Interviews extension for Refinery CMS'
  s.date              = '2012-07-27'
  s.summary           = 'Interviews extension for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '~> 2.0.5'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 2.0.5'
end
