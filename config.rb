# Dependencies
# ========================================
Dir[File.dirname(__FILE__) + '/lib/**/*.rb'].each { |file| require file }

# Helpers
# ========================================
helpers do
  Dir[File.dirname(__FILE__) + '/helpers/**/*.rb'].each { |file| require file }
end

# Settings
# ========================================

# Content
config = {
  contact: {
    email: 'kevin@kevinthompson.info',
    skype: 'thompson.kevind'
  },
  date: {
    format: '%B %e, %Y'
  }
}

# Framework
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true, autolink: true

# Compass
compass_config do |config|
  config.output_style = :compact
end

# Blog
activate :blog do |blog|
  blog.layout = 'blog'
  blog.prefix = 'blog'
end

# Build
configure :build do
  require 'rack/google_analytics'
  use Rack::GoogleAnalytics, web_property_id: 'UA-24584832-1'
  activate :asset_hash
  activate :cache_buster
  activate :gzip
  activate :minify_css
  activate :minify_javascript
  activate :smusher
end

# Development
configure :development do
  activate :livereload
end

# Middleware
use Rack::SyntaxHighlighter

# Setup
# ========================================
config.each{ |k,v| set k, v.is_a?(Hash) ? Hashie::Mash.new(v) : v }