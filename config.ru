require 'rack/rewrite'

# Redirects
use ::Rack::Rewrite do
  r301 '/', '/blog/'
end

# Static Routes
require File.expand_path('../lib/rack/static_file_server', __FILE__)
use ::Rack::StaticFileServer, root: 'build', urls: ['/'], try: ['.html', 'index.html', '/index.html']

# Display 404
run lambda {
  not_found_page = File.expand_path("../build/404.html", __FILE__)
  if File.exist?(not_found_page)
    [ 404, { 'Content-Type' => 'text/html'}, [File.read(not_found_page)] ]
  else
    [ 404, { 'Content-Type' => 'text/html' }, ['Page Not Found'] ]
  end
}