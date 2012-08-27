
# Settings
# ========================================

# Content
set :contact, Hashie::Mash.new(
  email: 'kevin@kevinthompson.info',
  skype: 'thompson.kevind'
)

# Framework
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true, autolink: true

# Blog
# ========================================
activate :blog do |blog|
  blog.prefix = 'blog'
  blog.permalink = ':title/'
end

# Build
# ========================================
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :cache_buster
  activate :relative_assets
  activate :gzip
  activate :smusher
end

# Compass
# ========================================
compass_config do |config|
  config.output_style = :compact
end

# Rack Middleware
# ========================================

# Google Analytics
require 'rack/google_analytics'
use Rack::GoogleAnalytics, web_property_id: 'UA-24584832-1'

# Helpers
# ========================================
helpers do
  Dir[File.dirname(__FILE__) + '/helpers/**/*.rb'].each { |file| require file }
end