Gem::Specification.new do |s|
  s.name        = 'emoji_regex'
  s.summary     = 'Emoji Regex'
  s.description = 'A pair of Ruby regular expressions for matching Unicode Emoji symbols.'
  s.homepage    = 'https://github.com/ticky/ruby-emoji-regex'
  s.version     = '1.0.0'
  s.date        = '2018-08-07'
  s.authors     = ['Jessica Stokes']
  s.email       = 'hello@jessicastokes.net'
  s.license     = 'MIT'
  s.files       = ['lib/emoji_regex.rb', 'LICENSE.md', 'README.md']

  s.add_development_dependency "bundler", "~> 1.15"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec", "~> 3.0"
end
