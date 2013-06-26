source 'https://rubygems.org'

ruby '2.0.0'

gem 'rack-rewrite'

group :development, :test do
  # Server
  gem 'unicorn'

  # Middleman
  gem 'middleman'
  gem 'middleman-blog'
  gem 'middleman-smusher'
  gem 'middleman-livereload'

  # Performance
  gem 'libv8'
  gem 'therubyracer'
  gem 'oj'

  # Utilities
  gem 'builder'
  gem 'hashie'
  gem 'redcarpet'

  # Middleware
  gem 'pygmentize', git: 'git://github.com/zimbatm/pygmentize.git', branch: 'pygments-1.5'
  gem 'albino'
  gem 'rack-rewrite'
  gem 'rack-syntax-highlighter'
  gem 'rack-google_analytics'
end

# Testing
group :test do
  gem 'rspec'
end