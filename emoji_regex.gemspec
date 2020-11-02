Gem::Specification.new do |s|
  s.name        = 'emoji_regex'
  s.summary     = 'Emoji Regex'
  s.description = 'A set of Ruby regular expressions for matching Unicode Emoji symbols.'
  s.homepage    = 'https://github.com/ticky/ruby-emoji-regex'
  s.version     = '3.2.1'
  s.date        = '2020-11-02'
  s.authors     = ['Jessica Stokes']
  s.email       = 'hello@jessicastokes.net'
  s.license     = 'MIT'
  s.files       = ['lib/**/*', 'LICENSE.md', 'README.md']

  s.add_development_dependency "bundler", "~> 2.1.4"
  s.add_development_dependency "rake", ">= 12.3.3"
  s.add_development_dependency "rspec", "~> 3.0"
end
